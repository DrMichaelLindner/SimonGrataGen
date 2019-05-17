function SimonGrataGen()

% The Simon grammar task generator is a tool thought to easily generate 
% Simon tasks and to run these tasks.
%
% Dependencies:
% 
% - Matlab 2015a or newer (www.mathworks.com)
% - Psychtoolbox 3 http://psychtoolbox.org/download/
% - For sending output tiggers via LPT on Windows (2000/XP/Vista/7) 
%   PCs you need to have the following io tools installed:
%       For Win (2000/XP/Vista/7) 32bit: 
%           http://apps.usd.edu/coglab/psyc770/IO32.html
%       For Win (2000/XP/Vista/7) 64bit: 
%           http://apps.usd.edu/coglab/psyc770/IO64.html 
%       For Linux (tested on Ubuntu 16.04) 64bit:
%           https://github.com/widmann/ppdev-mex
%
% Installation:
%
% - Copy the file onto a folder on your hard drive. e.g. C:\SimonGrataGen
% - Add path to the files using 'Set Path' button or 'addpath' function. 
%    e.g. addpath('C:\SimonGrataGen')
%
%
% USAGE:
%
% 1. Simon Grammar Task Generator
% 
% With the Simon Grammar Task Generator you can set up different 
% types of Simon tasks with a few button presses. For example you 
% can generate Simon tasks using different grammars, or random 
% orders or a mix of both. Additionally you can use the grammars 
% (or random order) on the positions of the  dots or on its colour. 
% Furthermore you can specify the usage of distractors. You can use
% input and output triggers and you can change all possible colours.
%  And many more options are available. See a full list below.
% 
% 1.1 Input parameters:
% 
% Name of experiment: 	The parameter name of experiment is used as 
% 			prefix for the filename for the output file 
% 			in which all the specified parameters will
% 			be saved. It will also be used later when 
% 			you run the experiment for the filename of
% 			the output file of each subject.
% Number of blocks: 	Here you can define how many blocks of equal
% 			or different grammars you want to use.
% Number of trials per block: Specify the number of trials of each of
% 			the blocks.
% Number of subjects: 	Specify the number of subjects that you 
% 			want to run the experiment the generator
% 			will predefine the blocks and trials for
% 			all of the subjects:
% Number of grammars: 	You can specify how many different grammars
% 			you want to use in the experiment. 
% Order of grammars in blocks: Specify the grammar that you will use
% 			for each block. The numbers from 1 to N 
% 			represent the grammars from 1 to N you 
% 			specify. Zeros represent random orders of 
% 			the trials (instead of grammars).
% 
% 			e.g. Grammar order: 0 1 1 1 1 2
% 			The first block will be a random order 
% 			of conditions, in the blocks 2 to 5 grammar
% 			1 will be used and in the last block grammar
% 			2 will be used.
% Input grammars:		As many input dialogs occur as number of
% 			grammars you specified before. Here you 
% 			need to copy in the grammars (e.g. from 
% 			the Lindenmayer System Explorer link) for
% 			the specified blocks. 
% 
% 			Rules for the grammars: 
% 			1. The grammars can only include 0s and 1s
% 			2. The grammars need to be long enough. 
% 			The length of the grammar is important: 
% 			The grammar need to have a minimum length 
% 			of:
% 			GrammarLengthmin = ((Number of subjects *
% 			 Number of trials per block * 
% 			 Number of blocks of that grammar)/2) + 
% 			 Number of trials per block 
% 			and a optimal length of 
% 			GrammarLengthoptimal = 
% 			 (Number of subjects * 
% 			 Number of trials per block * 
% 			 Number of blocks of that grammar) + 
% 			 Number of trials per block. 
% 
% 			The grammar will be cut into the different 
% 			blocks for the different subjects, 
% 			so that all subjects will get a different 
% 			string of the grammar.
% 
% Random proportion of blocks: For blocks with random orders of 
% 			conditions (0s in the order list) you can 
% 			specify the amount of 1s. e.g. to adjust 
% 			the proportion to your grammar to prevent
% 			different effects depending on different 
% 			proportions of conditions between the 
% 			blocks and leading to e,g, different 
% 			expectations or habituations of the subject.
% Random or pseudorandom: The random blocks can be identical for each 
% 			subject (pseudorandom) or for each subject 
% 			a different random order can be generated 
% 			(random)
% Use Grammar for: 	Here you can specify if the grammar should 
% 			be used for the positioning of the dots on 
% 			the screen (Position) or for the changes of
% 			the color of the dots (Color)
% Distractor every nth trial: Here you can specify if a distractor 
% 			should be used (values > 0). If you have 
% 			chosen before that the grammar should be 
% 			used for the position the distractor will
% 			be a change of the dot colour. Therefore 
% 			every nth trial the dot will have a 	
% 			different colour.
% If Grammar for Position:
%   - horizontal or vertical task: Specify the changes of the dot position
%           related the grammar: 
%               horizontal (left vs right) or 
%               vertical (up vs down)
%   - Distance from center: Specify where how far the dots should be 
% 			presented from the center of the screen (in 
% 			pixel) (E.g. for the use of the grammar on 
% 			the position.)
% If Grammar for Color:
%   - If Distractors == 0
%       * Dot Position: Specify where the dots should be presented on the
%           screen in relation to the center. (Only left vs right positions
%           adjustment possible) (in pixel)
%   - If Distractors > 0
%       * horizontal, vertical or circular Distractor Position: Specify if
%           the distractors should be presented always on one horizontally 
%           shifted or vertically shifted position. With the circular 
%           option the distractor will be presented on random position on 
%           a circle around the main dot position
%       * Distractor position (distance from center in pixel): amount of
%           horizontal or vertical shift or radius of the circle in the 
%           circular option.
% Stimulus presentation time: The dots can be presented until the 
% 			participant presses a button (endless) or 
% 			for a maximum amount of time in which the 
% 			participant can press a button (limited).
% 			If you choose 'limited': 
%               - Specify the maximum presentation time in ms
%               - Equal trial length? (yes or no): If button was pressed
%               before the maximum presentation time, the trial will still
%               wait until the maximum presentation time is over.
% Variablity of the distractor: If the distractor should not be fixed 
% 			for each nth trial, you can specify a trial
% 			range in which the distractor differences 
% 			will be chosen randomly. 		
% 			Example: 8 as nth trial and a variability 
% 			of +/- 2 trials will lead to distractors 
% 			between each 6th and 10th trial.
% Background Colour: 	Specify the Screen background colour 
% 			(in RGB values)
% Colour Dot1: 		Specify the colour of the dot (in RGB values)
% Colour Dot2: 		Specify the colour of the second dot (for 
% 			grammar used on grammar or for the 
% 			distractor) (in RGB values)
% Colour fixation point: 	Specify the colour of the fixation point in
% 			the center of the screen (in RGB values)
% Left button: 		Specify the key (in keyboard) for the left 
% 			button
% Right button:		Specify the key for the left button
% Dot size: 		Specify the size of the dots (in pixel)
% Grammar value: 		Specify which value of the grammar should 
% 			be used 
% 	- for the left presentation (in case of grammar for position)
% 	- for colour 1 (in case of grammar for colour)
% Present fixation point: Use fixation point in the center of the 
% 			screen. Yes or no.
% Size of the fixation point: Size of the fixation point if used (in pixel)
% Length of ITI:		Specify inter trial interval time between button
% 			press and the presentation of the next dot. (in ms) 
% Variability of ITI: 	If you do not want a fixed ITI time, the you can 
% 			specify a range (in ms) in which a random ITI 
% 			will be created for each trial separately. 	
% 			Example: an ITI length of 2000 ms and a 
% 			variability of 200 ms will create ITIs between 
% 			1800 and 2200 ms. 
% Send output trigger: 	(Yes or no) 
% 			Choose yes if you want to used output triggers 
% 			to other devices e.g. for EEG. 
% 			Only windows 2000/XP/Vista/7 are supported using
% 			the IO tools mentioned in the dependencies.
% 	If yes: additional dialogs will occur for specifying:
% 	- Trigger type: (smart or normal)
% 	In any case the marker definition will be saved as text file.
% 	Basic trigger:
% 		Start trigger: 30
% 		End trigger: 50
% 		Stop trigger: 49
% 		Instruction: 31
% 		Start Block: 40
% 		End Block: 41
% 		Start ISI: 44
% 		Button 1: 1
% 		Button 2: 2
% 		Button 1 correct: 10
% 		Button 1 incorrect: 11
% 		Button 2 correct: 20
% 		Button 2 incorrect: 21
% 		Stop Button: 99
% 	
% 	+ if normal triggers are chosen:
% 		condition 0 -> 100
% 		condition 1 -> 200
% 	+ if smart triggers are chosen:
% 		another dialog shows up to specify the last n trials for which the 
%       smart triggers should be defined. All different combinations of 
%       conditions in the 	previous n trials will get a separate 
%       trigger/marker.
% 	Example: last n trials of a Fibonacci grammar will results in these 
%            markers:
% 		[previous n trials] [actual trial] -> Marker50
% 		 000	0 -> 101
% 		 001	0 -> 102
% 		 010	0 -> 103
% 		 011	0 -> 104
% 		 100	0 -> 105
% 		 101	0 -> 106
% 		 110	0 -> 107
% 		 111	0 -> 108
% 		 000	1 -> 201
% 		 001	1 -> 202
% 		 010	1 -> 203
% 		 011	1 -> 204
% 		 100	1 -> 205
% 		 101	1 -> 206
% 		 110	1 -> 207
% 		 111	1 -> 208
% 	- Trigger port: LPT (only LPT is supported at the moment)
% 	Port address: If trigger via LPT was chosen you will get a dialog for 
%                 specifying the port address of the used LPT port
% 
% Use input trigger: 	(yes or no) Input triggers can be used 
% 			for starting the blocks (e.g. 
% 			to synchronize with other devices (e.g. 
% 			MRI))
% 	If yes:
% 	- Input trigger type: (only keyboard available at the moment)
% 	- Input key: Specify the keyboard key which should be used as input 
%                trigger
%
%
%  Use instruction images: (yes or no) Predefined images with instructions 
%           or task trials can be presented before the experiment starts.
%   If yes:
%   - How many instruction images consecutively?: The number of images can 
%                                                be defined here.
%   - Specify buttons to end each instruction image separated by 
%     semicolon. For each instruction image the stop button can be defined 
%     (left or right). 
%       e.g. if you want to have left button or image 1, right button for 
%            image 2 and left button for image 3, you need to type in:
%            left;right;left
%       The number of buttons need be identical to the number of used
%       instruction images
%   - Afterwards you need to select instruction images from the hard drive 
%     one after each other.
%
% Select output directory: Chose folder where the experiment file 
% 			and the marker definition file will be 
% 			saved. The experiment file contains a 
% 			Matlab cell with all the information for 
% 			all subjects, blocks and trials.
% 
% 
% 1.2 Output files
% 
% The Simon Grammar Task Generator creates one main output file. A 
% Matlab .mat file containing a Matlab structure with all parameters 
% needed to run the experiment. This file name is dependent on the 
% NameOfExperiment that you defined in the first input (e.g. 
% NameOfExperiment_parameter.mat). This file will be loaded in the 
% Simon Grammar Task Experiment.
% If you use output triggers another output file will be created: 
% a .txt file containing the description of the Marker (e.g. 
% NameOfExperiment_Marker.txt). This file is only an information for 
% the user and will maybe necessary for a later analysis of the data 
% collected with the triggered device (e.g. EEG).
% 
% 
% 2. Simon Grammar Task Experiment
% With the Simon Grammar Task Experiment you can start a predefined 
% experiment.
% 
% 2.1 Task description
% Each trial starts with the presentation of a dot (depending on the 
% specified grammar and colour and with or without fixation point). 
% Depending on the users choice, the dots will either stay until a 
% button is pressed or until a defined time is over. The dots are 
% followed by a blank screen (with or without fixation point) for the 
% predefined ITI time.
% A row of predefined N blocks with predefined M trials each are 
% presented. The block will have a self paced pause, so that the 
% participants can start the next block, when they are ready.
% 
% 2.2 Input parameters
% Select experiment parameter file: Select the predefined parameter 
% file of the experiment that you want to start.
% 
% Subject number: 	Select the predefined data of subject n for 
% 			the experiment you want to run.
% Multiple Screen detected: If you have more than one monitor detached
% 			to the PCs on which you want to run the 
% 			experiment, you can specify on which monitor
% 			you want to present the experiment. Usually 
% 			using value 0 the experiment will be presented
% 			on both screens (extended not duplicated!) and
% 			the value 1 to n are for the different monitor.
% 			But depending on your hardware and software 
% 			setup this may differ. Therefore, you need to
% 			test it in advance on the PC on which you want
% 			to run the experiment.
% 
% 
% 
% 2.3 Output files
% 
% The Simon Grammar Task Experiment saves a text file for each subject 
% containing the information the following 11 information (column) of 
% each trial (rows):
% 
% Block: 		The trial was present in this block number
% trial: 		The trial was trial number of the experiment
% time: 		Cumulative onset time of the trial in respect of the 
% 		start f the experiment.
% Grammar: 	The condition of the grammar the trial had
% Distr: 		Was the trial a distractor? (1=yes, 0=no)
% ButtonNr: 	Which button was pressed by the user (1=left)
% ButtonPos: 	Position of the pressed button (Left or Right)
% ACC:		Was the Button press of the participant correct (1) 
% 		or not (0).
% RT(ms):		Reaction time (time difference between dot presentation
% 		and button press)
% DotPos:		Position of the dot on the screen 0 = center, 
% 		positive value = pixel shifted to the right.
% DotCol:		Colour of the dot (1 or 2)
%
%
%
% LICENSE:
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License (GPLv3) as published
% by the Free Software Foundation;
% This program is distributed in the hope that it will be useful, but 
% WITHOUT ANY WARRANTY.
%
% AUTHOR:
% Michael Lindner
% University of Reading, 2019
% School of Psychology and Clinical Language Sciences
% Center for Integrative Neuroscience and Neurodynamics
% https://www.reading.ac.uk/cinn/cinn-home.aspx
%


SGGver=0.98;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Main GUI
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



BackgroundColor=[.7 .7 .7];
NameColor=[.1 1 .3];


logo=imread('SGG_LOGO.bmp');
logoy=size(logo,1);

cfg.figure_pos=calculate_figure_pos;

figure('Name', 'Simon Grammar Task Generator', ...
    'Visible', 'on', 'Units', 'pixels', ...
    'MenuBar', 'none', 'ToolBar', 'none', ...
    'Resize', 'off', 'NumberTitle', 'off',...
    'Position', cfg.figure_pos,...
    'Color',BackgroundColor);

uicontrol('units','pixels','position',[50 430 300 125],'cdata',logo)


% uicontrol('Style','text', ...
%     'HorizontalAlignment','center', ...
%     'Position',[20,420,380,30], ...
%     'FontSize',20,...
%     'FontWeight','bold',...
%     'ForegroundColor',NameColor,...
%     'String',name,...
%     'BackgroundColor',BackgroundColor);
uicontrol('Style','text', ...
    'HorizontalAlignment','center', ...
    'Position',[20,390,380,30], ...
    'FontSize',15,...
    'ForegroundColor',NameColor,...
    'String','Simon Grammar Task Generator',...
    'BackgroundColor',BackgroundColor);

uicontrol('Style','text', ...
    'HorizontalAlignment','left', ...
    'Position',[150,365,170,20], ...
    'FontSize',10,...
    'ForegroundColor',[0 0 0],...
    'String',['Version: ', num2str(SGGver)],...
    'BackgroundColor',BackgroundColor);


uicontrol('Style','text', ...
    'HorizontalAlignment','center', ...
    'Position',[20,330,380,20], ...
    'FontSize',10,...
    'ForegroundColor',[0 0 0],...
    'String','by Michael Lindner',...
    'BackgroundColor',BackgroundColor);

uicontrol('Style','text', ...
    'HorizontalAlignment','center', ...
    'Position',[20,300,380,20], ...
    'FontSize',10,...
    'ForegroundColor',[0 0 0],...
    'String','University of Reading',...
    'BackgroundColor',BackgroundColor);
uicontrol('Style','text', ...
    'HorizontalAlignment','center', ...
    'Position',[20,260,380,40], ...
    'FontSize',10,...
    'ForegroundColor',[0 0 0],...
    'String','School of Psychology and Clinical Language Sciences &',...
    'BackgroundColor',BackgroundColor);
uicontrol('Style','text', ...
    'HorizontalAlignment','center', ...
    'Position',[20,230,380,40], ...
    'FontSize',10,...
    'ForegroundColor',[0 0 0],...
    'String','Center for Integrative Neuroscience and Neurodynamics',...
    'BackgroundColor',BackgroundColor);



% generate button
uicontrol('Style', 'pushbutton', ...
    'String', 'Simon Grammar Task Generator', ...
    'Units', 'pixels',...
    'Position', [10,140,380,80],...
    'Callback',@generate_task);

% generate button
uicontrol('Style', 'pushbutton', ...
    'String', 'Start Simon Grammar Task Experiment', ...
    'Units', 'pixels',...
    'Position', [10,50,380,80],...
    'Callback',@start_task);


% about button - as pushbutton - bottom right
uicontrol('Style', 'pushbutton', ...
    'String', 'Help', ...
    'Units', 'pixels',...
    'Position', [150,20,100,20],...
    'Callback',@menu_about_function);


% quit button - as pushbutton - bottom right
uicontrol('Style', 'pushbutton', ...
    'String', 'Quit', ...
    'Units', 'pixels',...
    'Position', [290,20,100,20],...
    'Callback',@menu_quit_function);



uicontrol('Style','text', ...
    'HorizontalAlignment','left', ...
    'Position',[1,3,390,10], ...
    'FontSize',6,...
    'ForegroundColor',[.55 .55 .55],...
    'String','Simon Grammar Task Generator by Michael Lindner, University of Reading',...
    'BackgroundColor',BackgroundColor);

    function generate_task(~,~)
        
        Simon_grammar_prepare
        
    end

    function start_task(~,~)
        
        close all
        Simon_grammar_start_experiment
        
    end


    function menu_about_function(~,~)
        
        about_text={'',...
            'Simon Grammar Task Generator  ',...
            '','',...
            'This tool is designed to generate Simon grammar tasks.',...
            '',...
            'Read the user manual for detailed information about ',...
            'how to use this tool or type in "doc SimonGrataGen.p"',...
            'or "help SimonGrataGen.p" for an overview of all the',...
            'the parameters.',...
            '',...
            'Enjoy playing around with this tool!',...
            '',...
            'This program is distributed in the hope that it will be useful,',...
            'but WITHOUT ANY WARRANTY!',...
            '',...
            ['Version ',num2str(SGGver),' by Michael Lindner'],...
            'm.lindner@reading.ac.uk',...
            'University of Reading, 2016',...
            'Center for Integrative Neuroscience and Neurodynamics',...
            'https://www.reading.ac.uk/cinn/cinn-home.aspx'};
        
        f=figure('menu','none','toolbar','none','name',...
            'Example script','NumberTitle','Off');
        hPan = uipanel(f,'Units','normalized');
        uicontrol(hPan, 'Style','listbox', ...
            'HorizontalAlignment','left', ...
            'Units','normalized', 'Position',[0 .2 1 .8], ...
            'String',about_text);
        
        
        uicontrol('Style','pushbutton','String','Close',...
            'position',[10 10 200 20],...
            'Callback',@close_about);
        
        function close_about(~, ~)
            close(f)
        end
    end

    function figure_pos=calculate_figure_pos
        % calculate figure position at ~ center of screen
        % get actual screen resolution
        screen_size=get(0,'Screensize');
        % lower left corner horizontal position
        figure_pos(1)=screen_size(3)/2-200;
        % lower left corner vertical position
        figure_pos(2)=screen_size(4)/2-200;
        % horizontal size of the GUI
        figure_pos(3)=400;
        % vertical size of the GUI
%         figure_pos(4)=460+logoy;
        figure_pos(4)=430+logoy;
    end

    function menu_quit_function(~,~)
        clear
        clc
        close all
        fprintf(['\n',...
              '############################################\n',...
              '#                                          #\n',...
              '#           Thank you for using            #\n',...
              '#                                          #\n',...
              '#              SimonGrataGen               #\n',...
              '#                                          #\n',...
              '#             Michael Lindner              #\n',...
              '#                                          #\n',...
              '############################################\n'])
        pause(3)
    end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Generate experiment
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    function Simon_grammar_prepare()
        
        
        experiment_parameters=[];
        
        experiment_parameters.version=SGGver;
        
        prompt = {'Name of Experiment (no spaces allowed)','Nr of blocks: ','Nr of trials per block:',  'Nr of subjects',};
        dlg_title = 'Prepare Simon Grammar Experiment';
        num_lines = 1;
        defaultans = {'NameOfExperiment','7','120','20'};
        answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        
        
        cfg.Expname=answer{1};
        cfg.Expname(cfg.Expname==' ')='_';
        experiment_parameters.expname=cfg.Expname;
        cfg.Nrblocks=str2num(answer{2});
        experiment_parameters.Nrblocks=str2num(answer{2});
        cfg.Nrtrials=str2num(answer{3});
        experiment_parameters.Nrtrials=str2num(answer{3});
        cfg.Nrsubjects=str2num(answer{4});
        
        
        if cfg.Nrblocks>1
            answer = inputdlg('Nr of Grammars: ','Prepare Simon Grammar Experiment',1,{'2'});
            cfg.Nrgrammars=str2num(answer{1});
            
            if cfg.Nrgrammars == 0
                def=zeros(cfg.Nrblocks,1);
            elseif cfg.Nrblocks==cfg.Nrgrammars
                def=1:cfg.Nrgrammars;
            elseif cfg.Nrblocks>cfg.Nrgrammars
                def=ones(cfg.Nrblocks,1);
                def(1)=0;
                def(end-(cfg.Nrgrammars-1):end)=1:cfg.Nrgrammars;
            
            end
            
            
            % Order of grammars in blocks
            answer = inputdlg('Order of Grammars in blocks: (0 = random order instead of grammar )','Prepare Simon Grammar Experiment',1,{num2str(def')});
            cfg.Grammarorder = str2num(answer{1});
            
            
            % input grammars
            if cfg.Nrgrammars>0
                for ii=1:cfg.Nrgrammars
                    answer = inputdlg(['Input Grammar ',num2str(ii),' (can only contain zeros and ones!)'],'Prepare Simon Grammar Experiment',1,{''});
                    cfg.Grammar{ii}=answer{1};
                end
            end
            
            
            
            
            
        else
            
            answer = inputdlg('Nr of Grammars: ','Prepare Simon Grammar Experiment',1,{'1'});
            cfg.Nrgrammars=str2num(answer{1}); %#ok<*ST2NM>
            
            if cfg.Nrgrammars == 1
                answer = inputdlg('Input Grammar:','Prepare Simon Grammar Experiment',1,{''});
                cfg.Grammar{1}=answer{1};
                cfg.Grammarorder = 1;
            else
                cfg.Grammarorder = 0;
            end
            
        end
        
        if cfg.Nrgrammars > 0
            
            % remove spaces from grammars
            for ii=1:length(cfg.Grammar)
                G2C=cfg.Grammar{ii};
                G2C(G2C==' ')=[];
                cfg.Grammar{ii}=G2C;
            end
        
            % check if grammar is long enough
            
            minlen=nan(cfg.Nrgrammars,1);
            maxlen=nan(cfg.Nrgrammars,1);
            for ii = 1:cfg.Nrgrammars
            
                cfg.Nrgrammartrials(ii)=length(find(cfg.Grammarorder == ii))*cfg.Nrtrials;
                minlen(ii)=cfg.Nrgrammartrials(ii)*(cfg.Nrsubjects/2+1)+2*cfg.Nrsubjects;
                maxlen(ii)=cfg.Nrgrammartrials(ii)*cfg.Nrsubjects+cfg.Nrblocks;
                % minlen1=((cfg.Nrblocks-2)*cfg.Nrtrials)*(cfg.Nrsubjects/2+1)+2*cfg.Nrsubjects;
                % minlen2=(cfg.Nrtrials)*(cfg.Nrsubjects/2+1)+2*cfg.Nrsubjects;
                if length(cfg.Grammar{ii})<=minlen(ii)
                    errordlg(['Grammar ',num2str(ii),' is to short needs at least to be ',num2str(minlen(ii)+1) ,' characters'],'Input Error');
                    error(['Grammar ',num2str(ii),' is to short needs at least to be ',num2str(minlen(ii)+1) ,' characters'])
                elseif length(cfg.Grammar{ii})>minlen(ii) && length(cfg.Grammar{ii})<maxlen(ii)
                    dev(ii)=2;
                elseif length(cfg.Grammar{ii})>maxlen(ii)
                    dev(ii)=1;
                end
                cfg.Cutposgrammar(ii)=1;
                cfg.Nrgrammarblocks(ii)=length(find(cfg.Grammarorder==ii));
            end
        end
        
        
        fr=find(cfg.Grammarorder==0);
        cfg.Nrrandblocks=length(fr);
        if ~isempty(fr)
            prompt = {['Random proportion for block(s): ',num2str(fr),' (e.g. 60 for 60%=1 and 40%=0)'], 'random or pseudorandom?'};
            dlg_title = 'Prepare Simon Grammar Experiment';
            num_lines = 1;
            defaultans = {'60','pseudorandom'};
            answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
            cfg.Randprop=str2num(answer{1});
            if strcmpi(answer{2},'pseudorandom')
                cfg.Firstblock='pseudorandom';
            elseif strcmpi(answer{2},'random')
                cfg.Firstblock='random';
            else
                errordlg('Invalid input! Only random or pseudorandom are valid imputs!','Input error')
                error('Invalid input! Only random or pseudorandom are valid imputs!')
            end
        else
            cfg.Firstblock='no';
        end
        
        
        answer = inputdlg('Use Grammar for (Position or Color:)','Prepare Simon Grammar Experiment',1,{'Position'});
        if strcmpi(answer{1},'Color')
            experiment_parameters.Usegrammar='Color';
        elseif strcmpi(answer{1},'Position')
            experiment_parameters.Usegrammar='Position';
        else
            errordlg('Invalid input! Only Color or Position are valid imputs!','Input error')
            error('Invalid input! Only Color or Position are valid imputs!')
        end
        
        
        prompt = {'Distractor every nth trial: ',  'Variability of distractor +/- x trials',};
        dlg_title = 'Prepare Simon Grammar Experiment';
        num_lines = 1;
        defaultans = {'8','2'};
        answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        
        cfg.DistractorN = str2num(answer{1});
        cfg.DistractorVar = str2num(answer{2});
        
        
        if strcmpi(experiment_parameters.Usegrammar,'Color')
            if cfg.DistractorN > 0
                
                answer = inputdlg('''vertical'' or ''horizontal'' or ''circular'' Distractor:','Prepare Simon Grammar Experiment',1,{'horizontal'});
             
                prompt = {'Distractor position (distance from center in pixel): ',};
                dlg_title = 'Prepare Simon Grammar Experiment';
                num_lines = 1;
                defaultans = {'200'};
                answerp = inputdlg(prompt,dlg_title,num_lines,defaultans);
                
                if strcmpi(answer{1},'horizontal')
                    experiment_parameters.centerXstim1 = 0;
                    experiment_parameters.centerXstim2 = str2num(answerp{1});
                    experiment_parameters.centerYstim1 = 0;
                    experiment_parameters.centerYstim2 = 0;
                    experiment_parameters.randcircle = 0;
                elseif strcmpi(answer{1},'vertical')
                    experiment_parameters.centerXstim1 = 0;
                    experiment_parameters.centerXstim2 = 0;
                    experiment_parameters.centerYstim1 = 0;
                    experiment_parameters.centerYstim2 = str2num(answerp{1});
                    experiment_parameters.randcircle = 0;
                elseif strcmpi(answer{1},'circular')
                    experiment_parameters.centerXstim1 = 0;
                    experiment_parameters.centerXstim2 = 0;
                    experiment_parameters.centerYstim1 = 0;
                    experiment_parameters.centerYstim2 = 0;
                    experiment_parameters.randcircle = 1;
                    experiment_parameters.randradius = str2num(answerp{1});
                    
                else
                    errordlg('Invalid Input: Only horizontal, vertical or circular distractor position possible!','Invalid input')
                    error('Invalid Input: Only horizontal, vertical or circular distractor position possible!')
                end
                    
            else
                answer = inputdlg('Dot position (horizontal distance from center in pixel):','Prepare Simon Grammar Experiment',1,{'0'});
                experiment_parameters.centerXstim1 = str2num(answer{1});
                experiment_parameters.centerXstim2 = str2num(answer{1});
                experiment_parameters.centerYstim1 = 0;
                experiment_parameters.centerYstim2 = 0;
            end
        
        
        elseif strcmpi(experiment_parameters.Usegrammar,'Position')
            
             answer = inputdlg('''vertical'' or ''horizontal'' task:','Prepare Simon Grammar Experiment',1,{'horizontal'});
                
             answerp = inputdlg('Dot positions (pixel distance from center):','Prepare Simon Grammar Experiment',1,{'250'});
             
             if strcmpi(answer{1},'horizontal')
                 experiment_parameters.centerXstim1 = str2num(answerp{1});
                 experiment_parameters.centerXstim2 = str2num(answerp{1});
                 experiment_parameters.centerYstim1 = 0;
                 experiment_parameters.centerYstim2 = 0;
             elseif strcmpi(answer{1},'vertical')
                 experiment_parameters.centerXstim1 = 0;
                 experiment_parameters.centerXstim2 = 0;
                 experiment_parameters.centerYstim1 = str2num(answerp{1});
                 experiment_parameters.centerYstim2 = str2num(answerp{1});
             else
                 errordlg('Invalid Input: Only horizontal or vertical task possible!','Invalid input')
                 error('Invalid Input: Only horizontal or vertical task possible!')
             end
                
        end
        
        answer = inputdlg('Stimulus representation time (''limited'' for max x ms or ''endless'' until a button is pressed:','Prepare Simon Grammar Experiment',1,{'endless'});
        if strcmpi(answer{1},'limited')
            experiment_parameters.Stimprestype='limited';
            xxx = inputdlg({'max presentation time (ms)','Equal trial length? (yes or no)'},'Prepare Simon Grammar Experiment',1,{'2000','no'});
            experiment_parameters.Stimprestime=num2str(xxx{1});
            experiment_parameters.Equaltriallength=xxx{2};
            
            if strcmpi(experiment_parameters.Equaltriallength,'yes')
                experiment_parameters.Equaltriallength='yes';
                yyy = inputdlg('Dots should "disappear" or "stay" after button press until end of trial?','Prepare Simon Grammar Experiment',1,{'disappear'});
                if strcmpi(yyy{1},'disappear')
                    experiment_parameters.DotTrialEnd='disappear';
                else
                    experiment_parameters.DotTrialEnd='stay';
                end
            end

        elseif strcmpi(answer{1},'endless')
            experiment_parameters.Stimprestype='endless';
        else
            errordlg('Invalid input! Only limited or endless are valid imputs!','Input error')
            error('Invalid input! Only limited or endless are valid imputs!')
        end
        
        
        
        
        
        
        
        prompt = {'Background Color:','Color Dot 1:','Color Dot 2:','Color fixation point'};
        dlg_title = 'Define Colors';
        num_lines = 1;
        defaultans = {'[128 128 128]','[255 0 0]','[0 0 255]','[0 0 0]'};
        answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        
        experiment_parameters.BackgroundColor=eval(answer{1});
        experiment_parameters.StimColors={eval(answer{2}),eval(answer{3})};
        experiment_parameters.fixcolor=eval(answer{4});
        
        prompt = {'Left button:','Right button:'};
        dlg_title = 'Define buttons';
        num_lines = 1;
        defaultans = {'z','m'};
        buttons = inputdlg(prompt,dlg_title,num_lines,defaultans);
        
        experiment_parameters.key{1} = buttons{1}; % left button
        experiment_parameters.key{2} = buttons{2}; % right button
        experiment_parameters.key{3} = 'space'; % start button
        experiment_parameters.key{4} = 'q'; % quit button
        
       
        
        
        prompt = {'Dot size:','Grammar value for left presentation or Color 1:','Present fixation point','Size of fixation point','Length of ITI (ms)','Variability of ITI: +/- x ms'};
        dlg_title = 'Input';
        num_lines = 1;
        defaultans = {'100','1','no','4','1000','0'};
        answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        
        experiment_parameters.stimsize = str2num(answer{1});
        experiment_parameters.leftnum = str2num(answer{2});
        if strcmpi(answer{3},'yes')
            experiment_parameters.present_fix = 'yes';
        else
            experiment_parameters.present_fix = 'no';
        end
        experiment_parameters.fixsize = str2num(answer{4});
        cfg.ITI = str2num(answer{5});
        cfg.ITIvar = str2num(answer{6});
        
        if cfg.ITIvar > 0
            answer = inputdlg('Random or pseudorandom ITI over subjects?:', 'Prepare Simon Grammar Experiment',1,{'random'});
            if strcmpi(answer{1},'pseudorandom')
                cfg.ITItype='pseudorandom';
            elseif strcmpi(answer{1},'random')
                cfg.ITItype='random';
            else
                errordlg('Invalid input! Only random or pseudorandom are possible imputs!','Input error')
                error('Invalid input! Only random or pseudorandom are possible imputs!')
            end
        elseif cfg.ITIvar < 0
            errordlg('Invalid input! ITI variability must be 0 or a positive integer value!','Input error')
            error('Invalid input! ITI variability must be 0 or a positive integer value!')
        end
        
        answer = inputdlg('Send output trigger?:', 'Prepare Simon Grammar Experiment',1,{'no'});
        if strcmpi(answer{1},'yes')
            experiment_parameters.Sendtrigger = 'yes';
        else
            experiment_parameters.Sendtrigger = 'no';
        end
        
        if strcmp(experiment_parameters.Sendtrigger,'yes')
            
            prompt = {'Trigger type (smart or normal):',...
                'Trigger port (only LPT supported at the moment):'};
            dlg_title = 'Input';
            num_lines = 1;
            defaultans = {'smart', 'LPT'};
            answer = inputdlg(prompt, dlg_title,num_lines,defaultans);
            
            if strcmpi(answer{1},'smart')
                cfg.Triggertype='smart';
            elseif strcmpi(answer{1},'normal')
                cfg.Triggertype='normal';
            else
                errordlg('Invalid input! Only smart or normal are valid inputs!','Input error')
                error('Invalid input! Only smart or normal are valid inputs!')
            end
            if strcmpi(answer{2},'LPT')
                experiment_parameters.Triggerport='LPT';
            else
                errordlg('Only LPT is supported as trigger port!','Input error')
                error('Only LPT is supported as trigger port!')
            end
            if strcmp(cfg.Triggertype,'smart')
                answer = inputdlg('Last n trials to check: (max 5)','Prepare Simon Grammar Experiment',1,{'3'});
                cfg.Smartrange=str2num(answer{1});
            end
            
            
            if strcmp(experiment_parameters.Triggerport,'LPT')
                
                prompt = {'Port adress (Only needed for Windows PCs):'};
                dlg_title = 'Input';
                num_lines = 1;
                defaultans = {'378'};
                answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
                experiment_parameters.LPT.Portaddress=answer{1};
                
            else
                
                prompt = {'COM port:','Baud rate:','Data bits:','Stop bits','Parity'};
                dlg_title = 'Input';
                num_lines = 1;
                defaultans = {'4','2400','8','4','no'};
                answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
                experiment_parameters.COM.Port=str2num(answer{1});
                experiment_parameters.COM.Baudrate=str2num(answer{2});
                experiment_parameters.COM.Databits=str2num(answer{3});
                experiment_parameters.COM.Stopbits=str2num(answer{4});
                experiment_parameters.COM.Parity=answer{5};
            end
        end
        
        answer = inputdlg('Use input trigger (start of block)?:', 'Prepare Simon Grammar Experiment',1,{'no'});
        if strcmpi(answer{1},'yes')
            experiment_parameters.Inputtrigger = 'yes';
        else
            experiment_parameters.Inputtrigger = 'no';
        end
        
        if strcmp(experiment_parameters.Inputtrigger,'yes')
            answer = inputdlg('Input trigger type (only keyboard available at the moment)?:', 'Prepare Simon Grammar Experiment',1,{'keyboard'});
            if strcmpi(answer{1},'keyboard')
                experiment_parameters.Inputtriggertype = 'keyboard';
                
                answer = inputdlg('Input key?:', 'Prepare Simon Grammar Experiment',1,{'t'});
                experiment_parameters.Inputkey = answer{1};
            end
        end


        answer = inputdlg('Use instruction images?:', 'Prepare Simon Grammar Experiment',1,{'no'});
        if strcmpi(answer{1},'yes')
            experiment_parameters.Instruction = 'yes';
        else
            experiment_parameters.Instruction = 'no';
        end
        
        if strcmp(experiment_parameters.Instruction,'yes')
        
            answer = inputdlg('How many instruction images consecutively?:', 'Prepare Simon Grammar Experiment',1,{'1'});
            experiment_parameters.InstructionNrImages = str2num(answer{1});
            
            for ii=1:experiment_parameters.InstructionNrImages
                [FileName,PathName] = uigetfile({'*.gif';'*.jpeg';'*.jpg';'*.png';'*.tif';'*.tiff'},['Select Instruction image ',num2str(ii)]);
                experiment_parameters.InstructionImages{ii} = imread(fullfile(PathName, FileName));
            end
            
            answer = inputdlg('Specify buttons to end each instruction image separated by semicolon? left, right or any (e.g. any;left;right for three instruction images)', 'Prepare Simon Grammar Experiment',1);
            x=lower(answer{1});
            x(x==' ')=[];
            experiment_parameters.InstructionButtons = strsplit(x,';');
            experiment_parameters.InstructionButtonsNr = experiment_parameters.InstructionButtons;
            experiment_parameters.InstructionButtonsNr(strcmp('left', experiment_parameters.InstructionButtonsNr))={1};
            experiment_parameters.InstructionButtonsNr(strcmp('right', experiment_parameters.InstructionButtonsNr))={2};
            experiment_parameters.InstructionButtonsNr(strcmp('any', experiment_parameters.InstructionButtonsNr))={99};
             
            if length(experiment_parameters.InstructionButtons) ~= experiment_parameters.InstructionNrImages
                errordlg('Number of instruction images and number of instruction buttons need to be identical.','Input Error');
            end
        end

        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        % create pseudorandom first blocks
        if cfg.Nrrandblocks > 0
            if strcmp(cfg.Firstblock,'pseudorandom')
                blr=rand(cfg.Nrtrials*cfg.Nrrandblocks,1);
                blr(blr<=cfg.Randprop/100)=1;
                blr(blr<1)=0;
            end
        end
        
        
        % create ITI
        ITI=ones(cfg.Nrtrials,cfg.Nrblocks)*cfg.ITI;
        ITI=ITI+round(rand(size(ITI))*(cfg.ITIvar*2)-cfg.ITIvar);
        
        
        % create empty cell for subjects stim and distractor orders
        experiment_parameters.subjects = cell(cfg.Nrsubjects,1);
        
        for subject=1:cfg.Nrsubjects
            
            %experiment_parameters.subjects{subject};
            
            
            % Order of conditions
            % ------------------------------------
            
            % create random first blocks
            if cfg.Nrrandblocks > 0
                if strcmp(cfg.Firstblock,'random')
                    blr=rand(cfg.Nrtrials*cfg.Nrrandblocks,1);
                    blr(blr<=cfg.Randprop/100)=1;
                    blr(blr<1)=0;
                end
                blrands=reshape(blr,[cfg.Nrtrials, cfg.Nrrandblocks]);
            end
            
            
            % create Order for grammar blocks
            Gcuts=cell(1,cfg.Nrgrammars);
            for ngr=1:cfg.Nrgrammars
                
                Gcuts{ngr}=cfg.Cutposgrammar(ngr):cfg.Cutposgrammar(ngr)+cfg.Nrgrammarblocks(ngr)*cfg.Nrtrials-1;
                gx=str2num(cfg.Grammar{ngr}(Gcuts{ngr})');
                
                bl{ngr}=reshape(gx,[cfg.Nrtrials, cfg.Nrgrammarblocks(ngr)]);
                %         gblocks=[gblocks,bl{ngr}];
                
                clear gx ngx dx
                
                cfg.Cutposgrammar(ngr)= ceil(Gcuts{ngr}(end)/dev(ngr))+1;
                
            end
            
            % create order matrix
            gblocks=[];
            bc=0;
            gc=zeros(cfg.Nrgrammars,1);
            for ii=1:cfg.Nrblocks
                
                if cfg.Grammarorder(ii)==0
                    bc=bc+1;
                    gblocks=[gblocks,blrands(:,bc)]; %#ok<*AGROW>
                else
                    gc(cfg.Grammarorder(ii))=gc(cfg.Grammarorder(ii))+1;
                    gblocks=[gblocks,bl{cfg.Grammarorder(ii)}(:,gc(cfg.Grammarorder(ii)))];
                end
            end
            
            
            experiment_parameters.subjects{subject}.stimorder = gblocks;
            
            
            % Markers
            % ------------------------------------
            
            % get all combination of binary value of n bits
            if strcmp(experiment_parameters.Sendtrigger, 'yes')
                if strcmp(cfg.Triggertype,'smart')
                    xcases = dec2bin(0:2^cfg.Smartrange -1);
                end
                
                Markers=nan(cfg.Nrtrials,cfg.Nrblocks);
                for ii=1:cfg.Nrblocks
                    for nn=1:cfg.Nrtrials
                        Markers(nn,ii)=(gblocks(nn,ii)+1)*100;
                        if strcmp(cfg.Triggertype,'smart')
                            if nn>cfg.Smartrange
                                f=num2str(gblocks(nn-cfg.Smartrange:nn-1,ii));
                                f(f==' ')=[];
                                Markers(nn,ii)=Markers(nn,ii)+strmatch(f,xcases); %#ok<MATCH2>
                                clear f
                            end
                        end
                    end
                end
                
                experiment_parameters.subjects{subject}.Markers=Markers;
                
                clear Markers
            end
            
            
            
            
            % Distractors
            % ------------------------------------
            % dis1=zeros(cfg.Nrtrials,1);
            
            dx=zeros(cfg.Nrblocks*cfg.Nrtrials,1);
            if cfg.DistractorVar==0
                dx(cfg.DistractorN:cfg.DistractorN:end)=1;
            else
                nd=floor(length(dx)/cfg.DistractorN);
                if nd>1
                    dv=ceil(rand(nd,1)*(cfg.DistractorVar*2+1))-(cfg.DistractorVar+1);
                    dx(cumsum(ones(nd,1)*cfg.DistractorN+dv))=1;
                    dx=dx(1:cfg.Nrblocks*cfg.Nrtrials);
                end
            end
            
            experiment_parameters.subjects{subject}.distractors = reshape(dx,[cfg.Nrtrials, cfg.Nrblocks]);
            
            % ITI
            % ------------------------------------
            
%             if strcmp(cfg.ITItype, 'random')
%                 ITI = ones(cfg.Nrtrials, cfg.Nrblocks) * cfg.ITI;
%                 ITI = ITI + round(rand(cfg.Nrtrials, cfg.Nrblocks) * (cfg.ITIvar*2)-cfg.ITIvar);
%             end
            experiment_parameters.subjects{subject}.ITI = ITI;
            
        end
        
        
        experiment_parameters.MarkersBP = [10,11,20,21,1,2,99];
        experiment_parameters.OtherMarkers = [30,50,49,31,40,41,44,45,46,47,48];
        
        
        outputpath = uigetdir(pwd,'Select output directory');
        
        % save parameter file
        savename=[outputpath, filesep, cfg.Expname,'_parameters.mat'];
        save(savename,'experiment_parameters');
        
        
        if strcmp(experiment_parameters.Sendtrigger, 'yes')
            % save marker file
            savename=[outputpath, filesep, cfg.Expname, '_Markers.txt'];
            fid=fopen(savename,'w');
            
            fprintf(fid,['\nStart trigger: ',num2str(experiment_parameters.OtherMarkers(1))]);
            fprintf(fid,['\nEnd trigger: ',num2str(experiment_parameters.OtherMarkers(2))]);
            fprintf(fid,['\nStop trigger: ',num2str(experiment_parameters.OtherMarkers(3))]);
            fprintf(fid,['\nInstruction: ',num2str(experiment_parameters.OtherMarkers(4))]);
            fprintf(fid,['\nInstruction Button: ',num2str(experiment_parameters.OtherMarkers(8))]);
            fprintf(fid,['\nStart experiment: ',num2str(experiment_parameters.OtherMarkers(9))]);
            fprintf(fid,['\nStart Block: ',num2str(experiment_parameters.OtherMarkers(5))]);
            fprintf(fid,['\nEnd Block: ',num2str(experiment_parameters.OtherMarkers(6))]);
            fprintf(fid,['\nStart ISI: ',num2str(experiment_parameters.OtherMarkers(7))]);
            
            
            fprintf(fid,'\n[previous n trials] [actual trial] -> Marker');
            if strcmp(cfg.Triggertype,'smart')
                for ii=1:2
                    for xx=1:size(xcases,1)
                        fprintf(fid,['\n ',xcases(xx,:), '\t',num2str(ii-1),' -> ', num2str(ii*100 + xx) ]);
                    end
                end
            else
                for ii=1:2
                    fprintf(fid,['\n ',num2str(ii-1),' -> ', num2str(ii*100) ]);
                end
            end
            fprintf(fid,['\nButton 1: ',num2str(experiment_parameters.MarkersBP(5))]);
            fprintf(fid,['\nButton 2: ',num2str(experiment_parameters.MarkersBP(6))]);
            fprintf(fid,['\nButton 1 correct: ',num2str(experiment_parameters.MarkersBP(1))]);
            fprintf(fid,['\nButton 1 incorrect: ',num2str(experiment_parameters.MarkersBP(2))]);
            fprintf(fid,['\nButton 2 correct: ',num2str(experiment_parameters.MarkersBP(3))]);
            fprintf(fid,['\nButton 2 incorrect: ',num2str(experiment_parameters.MarkersBP(4))]);
            fprintf(fid,['\nStop Button: ',num2str(experiment_parameters.MarkersBP(7))]);
            fclose(fid);
            
        end
        
        fprintf(['\n',...
                '############################################\n',...
                '#                                          #\n',...
                '#           Thank you for using            #\n',...
                '#                                          #\n',...
                '#              SimonGrataGen               #\n',...
                '#                                          #\n',...
                '#             Michael Lindner              #\n',...
                '#                                          #\n',...
                '############################################\n'])
        pause(3)
        
    end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Start experiment
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    function Simon_grammar_start_experiment()
        
        
        
        experiment_parameters = [];
        
        % get experiment name to load parameters
        %         expnam = inputdlg('Name of Experiment:','Name Of Experiment',1,{'NameOfExperiment'});
        [FileName, PathName] = uigetfile('*_parameters.mat','Select experiment parameter file');
        
        % build filename
        filename = [PathName, FileName];
        % load data
        load(filename); %#ok<LOAD>
        % create cfg structure from loaded file
        cfg = experiment_parameters;
%         cfg.expname = expnam{1};
        
        if cfg.version<SGGver
            errordlg('Invalid parameter files! The parameter file was created with an older version of Simon_grammar_prepare. Plase recreate the parameter file with the actual version of Simon_grammar_prepare.','Input Error');
        end
        
        % get subject number
        subj = inputdlg('Input Subject number:','Subject number');
        cfg.subjectid = str2num(subj{1});
        
        % get display number to present the experiment
        MP = get(0, 'MonitorPositions');
        if size(MP,1)>1
            answer = inputdlg(['Multiple displays detected! Specify the display number on which you want to present the experiment: (0 to ',num2str(size(MP,1)),')'],'Display number',1,{'0'});
            dispnum = str2num(answer{1});
        else
            dispnum = 0;
        end
        
        % specify defaults
        %--------------------------
        startkey = KbName(cfg.key{3});
        
        % instruction font
        cfg.inst_font = 'Arial';
        cfg.inst_font_size = 18;
        cfg.inst_font_color = [255,255,255];
        cfg.instkey = 'Space';
        
        % block font
        cfg.block_text1 = 'Start of Block ';
        cfg.block_text2 = 'End of Block ';
        cfg.block_text3 = 'Press space bar to start the next block.';
        cfg.block_prestime = 2;
        cfg.block_font_color =  [255,255,255];
        cfg.block_font_size = 28;
        cfg.block_font = 'Arial';
        
        % end font
        cfg.end_text = 'End of the experiment';
        cfg.stop_text = 'Experiment terminated by pressing q button';
        cfg.end_prestime = 2;
        cfg.end_font_color =  [255,255,255];
        cfg.end_font_size = 28;
        cfg.end_font = 'Arial';
        
        cfg.stimzoom = 1;
        
        
        % setup trigger port
        %--------------------------
        if strcmp(cfg.Sendtrigger, 'yes')
            if strcmp(cfg.Triggerport, 'COM')
                
                %         %create COM object
                %         obj=serial(['COM',cfg.COM.Port]);
                %         % set COM parameters
                %         obj.Baudrate=cfg.COM.Baudrate;
                %         obj.DataBits=cfg.COM.Databits;
                %         obj.StopBits=cfg.COM.Stopbits;
                %         obj.Parity=cfg.COM.Parity;
                %
                %         % display COM parameters in command windowCCC
                %         instrfind('Type', 'serial', 'Port', ['COM',num2str(port)], 'Tag', '')
                %
                %         % empty buffer
                %         flushinput(obj)
                %
                %         % open COM port
                %         fopen(obj);
                
            elseif strcmp(cfg.Triggerport, 'LPT')
                cfg.computer = computer;
                if strcmp(cfg.computer(1:5),'PCWIN')
                    config_io
                else 
                    ppdev_mex('Open', 1);
                end
            end
        end
        
        % get date string for output file
        actdat=datestr(datetime('now','TimeZone','local','Format','d-MMM-y_HH-mm-ss'));
        actdat(actdat==' ')='_';
        actdat(actdat==':')='-';
        
        % open txt file for output
        ouptufilename = [cfg.expname,'_output_subject',num2str(cfg.subjectid),'_',actdat,'.txt'];
        FID = fopen(ouptufilename,'w');
        fprintf(FID,'Block\ttrial\ttime\tGrammar\tDistr\tButtonNr\tButtonPos\tACC\tRT(ms)\tDotCol\r\n');
        
        %PsychDefaultSetup(2);
        AssertOpenGL;
        Screen('Preference', 'SkipSyncTests', 0);        
%         Screen('Preference', 'SkipSyncTests', 1);        % Only for testing on desktop
        Screen('Preference', 'VisualDebuglevel',3);      % remove welcome screen
        
        try
            
            HideCursor;
            
            % specify on which display the experiment should be presented (if more
            % than one monitor is connected)
            cfg.display=dispnum;
            
            %         fprintf('\ndebug1')
            
            % Generate/Open a screen window
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5            
            [w] = Screen('OpenWindow', cfg.display, [0 0 0]);
%             [w] = Screen('OpenWindow', cfg.display, [0 0 0],[100, 100, 1720 ,880]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5            
            % get framerate and frameduration
            cfg.hz = Screen('FrameRate', w);
            if cfg.hz == 0; cfg.hz = 60; end
            cfg.frameDuration = Screen('GetFlipInterval', w);
            
            % get screen info
            screen_info = Screen('Resolution', cfg.display);
            cfg.screen_res = [screen_info.width  screen_info.height];
            
            %         fprintf('\ndebug2')
            
            % calculate onset and offset position of both axis for the two circles
            cfg.x1(1) = cfg.screen_res(1)/2 - cfg.centerXstim1 - cfg.stimsize*cfg.stimzoom/2;
            cfg.y1(1) = cfg.screen_res(2)/2 - cfg.centerYstim1 - cfg.stimsize*cfg.stimzoom/2;
            cfg.x2(1) = cfg.screen_res(1)/2 - cfg.centerXstim1 + cfg.stimsize*cfg.stimzoom/2;
            cfg.y2(1) = cfg.screen_res(2)/2 - cfg.centerYstim1 + cfg.stimsize*cfg.stimzoom/2;
            
            cfg.x1(2) = cfg.screen_res(1)/2 + cfg.centerXstim2 - cfg.stimsize*cfg.stimzoom/2;
            cfg.y1(2) = cfg.screen_res(2)/2 + cfg.centerYstim2 - cfg.stimsize*cfg.stimzoom/2;
            cfg.x2(2) = cfg.screen_res(1)/2 + cfg.centerXstim2 + cfg.stimsize*cfg.stimzoom/2;
            cfg.y2(2) = cfg.screen_res(2)/2 + cfg.centerYstim2 + cfg.stimsize*cfg.stimzoom/2;
            
            
            cfg.cx1 = cfg.screen_res(1)/2 - cfg.fixsize/2;
            cfg.cy1 = cfg.screen_res(2)/2 - cfg.fixsize/2;
            cfg.cx2 = cfg.screen_res(1)/2 + cfg.fixsize/2;
            cfg.cy2 = cfg.screen_res(2)/2 + cfg.fixsize/2;
            
            % Give the display a moment to recover from the change of display mode when
            % opening a window. It takes some monitors and LCD scan converters a few seconds to resync.
            WaitSecs(1);
            
            %         fprintf('\ndebug3')
                        
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % Button test
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            

            Screen('FillRect',w ,cfg.BackgroundColor);
            Screen('DrawText',w ,'Please press left button ', cfg.screen_res(1)/2-250, cfg.screen_res(2)/2, cfg.inst_font_color);
            Screen('Flip', w);
            check_button(1)
            
            Screen('FillRect',w ,cfg.BackgroundColor);
            Screen('DrawText',w ,'Please press right button ', cfg.screen_res(1)/2-250, cfg.screen_res(2)/2, cfg.inst_font_color);
            Screen('Flip', w);
            check_button(2)
            
            WaitSecs(1);
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % Instruction
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            if strcmp(experiment_parameters.Instruction, 'yes')
                
                % ## Instructions
                Screen('FillRect',w ,cfg.BackgroundColor);
                % set font type
                Screen('TextFont',w ,cfg.inst_font);
                % set fontsize
                Screen('TextSize',w ,cfg.inst_font_size);
                % create text
                Screen('DrawText',w ,'Press space bar to start the Instructions', cfg.screen_res(1)/2-250, cfg.screen_res(2)/2, cfg.inst_font_color);
                % send trigger
                if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, cfg.OtherMarkers(4)); end
                % present screen
                Screen('Flip', w);
            
                %         fprintf('\ndebug4')
            
            
                % wait for start key
                keycode = zeros(1,256);
                while(~keycode(startkey))
                    [~,~,keycode] = KbCheck;
                end
                clear k1 k2
                % send trigger
                if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, cfg.OtherMarkers(1)); end
            
            
            
                % Instruction images
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            
                for inii = 1:experiment_parameters.InstructionNrImages %#ok<BDSCI>
                    
                    Screen('FillRect', w, cfg.BackgroundColor);
                    
                    tex = Screen('MakeTexture', w, experiment_parameters.InstructionImages{inii});
                    %Screen('DrawTexture', w, tex, [100 100 screen_info.width-100  screen_info.height-100]);
                    Screen('DrawTexture', w, tex, [],[],0);
                    Screen('Flip', w);
                    
                    
                    % wait for inst button
                    if experiment_parameters.InstructionButtonsNr{inii} == 99
                        KbStrokeWait;
                    else
                        keycode = zeros(1,256);
                        while(~keycode(KbName(experiment_parameters.key{experiment_parameters.InstructionButtonsNr{inii}})))
                            [~,~,keycode] = KbCheck;
                        end
                    end
                    
                    % send trigger
                    if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, cfg.OtherMarkers(8)); end
                end
            end
            
            
            WaitSecs(1);
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % Start experiment
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % set Background
            Screen('FillRect',w ,cfg.BackgroundColor);
            % set font type
            Screen('TextFont',w ,cfg.inst_font);
            % set fontsize
            Screen('TextSize',w ,cfg.inst_font_size);
            % create text
            Screen('DrawText',w ,'Press space bar to start the experiment', cfg.screen_res(1)/2-250, cfg.screen_res(2)/2, cfg.inst_font_color);
            % send trigger
            if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, cfg.OtherMarkers(9)); end
            % present screen
            Screen('Flip', w);
            
            %         fprintf('\ndebug4')
            
            % wait for start key
            keycode = zeros(1,256);
            while(~keycode(startkey))
                [~,~,keycode] = KbCheck;
            end
            clear k1 k2
            % send trigger
            if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, cfg.OtherMarkers(1)); end
            
            % get start time
            starttime = GetSecs;
            
            stop_exp=0;
            
            
            % ##############################
            %   loop over blocks
            % ##############################
            
            for block = 1:cfg.Nrblocks
                
                % present start block screen
                % ---------------------------
                Screen('FillRect',w,cfg.BackgroundColor);
                % set font type
                Screen('TextFont',w ,cfg.block_font);
                % set fontsize
                Screen('TextSize',w ,cfg.block_font_size);
                % show text
                Screen('DrawText',w ,[cfg.block_text1, num2str(block)] , round(cfg.screen_res(1)/2-((length(cfg.block_text1)+2)*(cfg.block_font_size-1))/2), round(cfg.screen_res(2)/2), cfg.block_font_color);
                %         Screen('DrawText', w, [cfg.block_text1, num2str(block)] , round(cfg.screen_res(1)/2), round(cfg.screen_res(2)/2), cfg.block_font_color);
                %         fprintf('\ndebug5b')
                if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg,cfg.OtherMarkers(5)); end
                Screen(w, 'Flip');
                %wait for delay
                
                if strcmp(cfg.Inputtrigger,'yes')
                    
                    if strcmp(cfg.Inputtriggertype,'keyboard')
                        inkey = KbName(cfg.Inputkey);
                        keycode = zeros(1,256);
                        while(~keycode(inkey))
                            [~,~,keycode] = KbCheck;
                        end
                    %elseif strcmp(cfg.Inputtriggertype,'Serial')
                        
                    %elseif strcmp(cfg.Inputtriggertype,'Parallel')
                        
                    end
                end
                
                tic
                while toc < cfg.block_prestime
                end
                
                WaitSecs(1);
                
                %                 fprintf('\ndebug6')
                
                % ##########################
                %    loop over trials
                % ##########################
                
                for trial = 1:cfg.Nrtrials
                    
                    distime=0;
                    %                         fprintf('\ndebug7')
                    
                    if strcmp(cfg.Usegrammar,'Position')
                        if cfg.subjects{cfg.subjectid}.distractors(trial, block)==0
                            cfg.coloruse = [1, 2];
                        else
                            cfg.coloruse = [2, 1];
                        end
                        
                        if cfg.subjects{cfg.subjectid}.stimorder(trial, block)==cfg.leftnum
                            cfg.dotpos = 'left';
                            cfg.dotposx = 1;
                        else
                            cfg.dotpos = 'right';
                            cfg.dotposx = 2;
                        end
                        
                        
                    elseif strcmpi(cfg.Usegrammar,'Color')
                        
                        if cfg.subjects{cfg.subjectid}.distractors(trial, block)==0
                            cfg.dotpos = 'left';
                            cfg.dotposx = 1;
                        else
                            cfg.dotpos = 'right';
                            cfg.dotposx = 2;
                            if cfg.randcircle == 1
                                angle = 2*pi*rand(1);
                                cfg.distrandposx = cfg.randradius.*cos(angle);
                                cfg.distrandposy = cfg.randradius.*sin(angle);
                            end
                        end
                        
                        if cfg.subjects{cfg.subjectid}.stimorder(trial, block)==cfg.leftnum
                            cfg.coloruse = 1;
                        else
                            cfg.coloruse = 2;
                        end
                        
                    end
                    
                    if strcmpi(cfg.Usegrammar,'Color')
                        cfg.dotcolor = cfg.StimColors{cfg.coloruse};
                        
                        if cfg.subjects{cfg.subjectid}.distractors(trial, block)==1 && cfg.randcircle == 1
                            cfg.dotrect = [cfg.x1(cfg.dotposx)+cfg.distrandposx, cfg.y1(cfg.dotposx)+cfg.distrandposx, cfg.x2(cfg.dotposx)+cfg.distrandposx, cfg.y2(cfg.dotposx)+cfg.distrandposx];
                        else
                            cfg.dotrect = [cfg.x1(cfg.dotposx), cfg.y1(cfg.dotposx), cfg.x2(cfg.dotposx), cfg.y2(cfg.dotposx)];
                        end
                        
                    else
                        cfg.dotcolor = cfg.StimColors{cfg.coloruse(cfg.dotposx)};
                        cfg.dotrect = [cfg.x1(cfg.dotposx), cfg.y1(cfg.dotposx), cfg.x2(cfg.dotposx), cfg.y2(cfg.dotposx)];
                    end
                    
                    cumtime = GetSecs-starttime;
                    time0 = GetSecs;
                    
                    
                    % present stimulus
                    % ----------------------------------------
                    % get (smart) marker for the actual stimulus
                    if strcmp(cfg.Sendtrigger, 'yes')
                        cfg.actualmarker = cfg.subjects{cfg.subjectid}.Markers(trial, block);
                    else
                        cfg.actualmarker = [];
                    end
                    % present stimulus
                    present_stim(cfg);
                    
                    
                    
                    % detect response
                    % ----------------------------------------
                    tic
                    bs = 0;
                    rtime = nan;
                    while bs == 0
                        
                        
                        % check keyboard input
                        [keyisdown,secs,keycode] = KbCheck;
                        if keyisdown == 1
                            rtime = secs-time0;
                            % detect key
                            if keycode(KbName(cfg.key{1})) % check left button
                                bp = 1;
                                bp_pos = 'left';
                                if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, cfg.MarkersBP(5)); end
                            elseif keycode(KbName(cfg.key{2})) % check right button
                                bp = 2;
                                bp_pos = 'right';
                                if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg,  cfg.MarkersBP(6)); end
                            elseif keycode(KbName(cfg.key{4})) % check stop button
                                stop_exp = 1;
                                if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg,cfg.MarkersBP(7)); end
                                break
                            else
                                bp = 99;
                                bp_pos = 'nan';
                            end
                            if bp < 99
                                
                                if strcmpi(cfg.Stimprestype,'limited')
                                    if strcmpi(cfg.Equaltriallength,'yes')
                                        if strcmpi(experiment_parameters.DotTrialEnd,'stay')
                                            if toc<str2num(cfg.Stimprestime)/1000
                                                WaitSecs(str2num(cfg.Stimprestime)/1000-rtime);
                                            end
                                        else
                                            distime=str2num(cfg.Stimprestime)/1000-rtime;
                                        end
                                    end
                                end
                                    
                                bs = 1;
                            end
                            
                            %                     t_diff = toc;
                        end
                        
                        if strcmpi(cfg.Stimprestype,'limited')
                            if toc>str2num(cfg.Stimprestime)/1000
                                bp = 'nan';
                                bp_pos = 'nan';
                                bs = 1;
                                rtime = secs-time0;
                            end
                        end
                    end
                    clear bs
                    
                    %             fprintf('\ndebug8a')
                    
                    % if stop key was pressed end trial loop
                    if stop_exp == 1
                        break
                    end
                    
                    % fprintf('\ndebug8b')
                    
                    % check accuracy
                    % ----------------
                    
                    if strcmpi(cfg.Usegrammar, 'Position')
                        
                        if cfg.dotposx == bp
                            acc = 1;
                        else
                            acc = 0;
                        end
                        
                    elseif strcmpi(cfg.Usegrammar, 'Color')
                        
                        if cfg.coloruse(1) == bp
                            acc = 1;
                        else
                            acc = 0;
                        end
                        
                    end
                    
                    % send tigger
                    if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, bp*10+acc); end
                    
                    
                    % if equal length of trial add the time difference to RT
                    if strcmpi(cfg.Stimprestype,'limited')
                        if strcmpi(cfg.Equaltriallength,'yes')
                            if strcmpi(experiment_parameters.DotTrialEnd,'disappear')
                            
                             % create empty screen
                                Screen('FillRect',w,cfg.BackgroundColor);
                                if strcmp(cfg.present_fix, 'yes'); present_fix(); end
                                Screen('Flip', w);
                
                                WaitSecs(distime);
                            end
                        end
                    end
                    
                    
                    
                    % fprintf('\ndebug8c')
                    
                    
                    % write data into text file
                    % ----------------------------
                    fprintf(FID,[num2str(block),'\t',num2str(trial),'\t',num2str(cumtime),'\t',...
                        num2str(cfg.subjects{cfg.subjectid}.stimorder(trial,block)),'\t',num2str(cfg.subjects{cfg.subjectid}.distractors(trial,block)),...
                        '\t',num2str(bp),'\t',bp_pos,'\t',num2str(acc),'\t',num2str(rtime*1000),'\t']);
                    if strcmp(cfg.Usegrammar,'Color')
                        fprintf(FID,num2str(cfg.coloruse(1)));
                    else
                        fprintf(FID,num2str(cfg.coloruse(cfg.dotposx)));
                    end
                    
                    fprintf(FID,'\r\n');
                    
                    % fprintf('\ndebug9')
                    
                    
                    % ITI
                    % ----------------------------
                    % start timer
                    tic
                    % present isi screen
                    present_isi(cfg, w)
                    % calculate number fo frames for isi
                    isi = round(cfg.subjects{cfg.subjectid}.ITI(trial, block)/1000 /cfg.frameDuration)*cfg.frameDuration - cfg.frameDuration;
                    % wait until time for isi is over
                    while toc<isi
                    end
                    
                    if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg,0); end
                end
                
                % if stop key was pressed end block loop
                if stop_exp==1
                    break
                end
                
                % Present block end screen
                % ----------------------------
                % create empty screen
                Screen('FillRect',w ,cfg.BackgroundColor);
                % set font type
                Screen('TextFont',w ,cfg.block_font);
                % set fontsize
                Screen('TextSize',w ,cfg.block_font_size);
                % show text
                Screen('DrawText',w ,[cfg.block_text2, num2str(block)] , round(cfg.screen_res(1)/2-((length(cfg.block_text2)+2)*(cfg.block_font_size-1))/2), round(cfg.screen_res(2)/2), cfg.block_font_color);
                %         Screen('DrawText', w, [cfg.block_text2, num2str(block)] , round(cfg.screen_res(1)/2), round(cfg.screen_res(2)/2), cfg.block_font_color);
                % present screen
                Screen(w, 'Flip');
                
                %wait for delay
                tic
                while toc<cfg.block_prestime
                end
                
                WaitSecs(2);
                
                % Present self paced continue screen between blocks
                % --------------------------------------------------------
                if block<cfg.Nrblocks
                    % create empty screen
                    Screen('FillRect',w ,cfg.BackgroundColor);
                    % set font type
                    Screen('TextFont',w ,cfg.block_font);
                    % set fontsize
                    Screen('TextSize',w ,cfg.block_font_size);
                    % show text
                    Screen('DrawText',w ,cfg.block_text3 , round(cfg.screen_res(1) / 2 - ((length(cfg.block_text3)+2)*(cfg.block_font_size - 1)) / 2), round(cfg.screen_res(2) / 2), cfg.block_font_color);
                    % send trigger
                    if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg,cfg.OtherMarkers(6)); end
                    % present screen
                    Screen(w, 'Flip');
                    
                    % wait for start key
                    keycode = zeros(1, 256);
                    while(~keycode(startkey))
                        [~, ~, keycode] = KbCheck;
                    end
                    clear k1 k2
                end
            end
            
            % present end
            % ----------------
            
            Screen('FillRect', w, cfg.BackgroundColor);
            Screen('TextFont', w, cfg.end_font);
            Screen('TextSize', w, cfg.end_font_size);
            if stop_exp == 1
                marker = cfg.OtherMarkers(3);
                Screen('DrawText', w, cfg.stop_text, round(cfg.screen_res(1) / 2 - (length(cfg.stop_text)*(cfg.end_font_size - 1)) / 2), round(cfg.screen_res(2) / 2), cfg.end_font_color);
            else
                marker = cfg.OtherMarkers(2);
                Screen('DrawText', w, cfg.end_text, round(cfg.screen_res(1) / 2 - (length(cfg.end_text)*(cfg.end_font_size - 1)) / 2), round(cfg.screen_res(2) / 2), cfg.end_font_color);
                % Screen('DrawText', w, 'Thank you for participating!', cfg.screen_res(1)/2-10*cfg.end_font_size, cfg.screen_res(2)/2+100, cfg.end_font_color);
            end
            if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, marker); end
            
            Screen(w, 'Flip');
            %wait for delay
            tic
            while toc < cfg.end_prestime
            end
            
            sca
            ShowCursor
            
           
            
        catch
            sca
            ShowCursor
            %     if strcmp(cfg.Sendtrigger, 'yes')
            %         if strcmp(cfg.Triggerport, 'COM')
            %             fclose(obj)
            %         end
            %     end
        end
        
        
        % -------------------------------------------------------------------------
        % send trigger
        function Sendtrigger(cfg, marker)
            if strcmp(cfg.Triggerport, 'COM')
                
            elseif strcmp(cfg.Triggerport, 'LPT')
                if strcmp(cfg.computer(1:5),'PCWIN')
                    config_io
                    outp(hex2dec(cfg.LPT.Portaddress),marker);
                    %             outp(hex2dec(cfg.LPT.Portaddress),0)
                else
                    lptwrite(1, marker)
                end
                
            end
        end
        
        % -------------------------------------------------------------------------
        function present_stim(cfg)
            
            % create empty screen
            Screen('FillRect', w, cfg.BackgroundColor);
            % create coloured circle
            Screen(w,'FillOval',cfg.dotcolor ,cfg.dotrect)
            % present fixation dot
            if strcmp(cfg.present_fix,'yes'); present_fix(); end
            % check if marker is set and send it
            if ~isempty(cfg.actualmarker)
                Sendtrigger(cfg, cfg.actualmarker)
            end
            % present screen
            Screen('Flip', w);
        end
        
        % -------------------------------------------------------------------------
        function present_isi(cfg,w)
            
            % create empty screen
            Screen('FillRect',w ,cfg.BackgroundColor);
            % present fixation dot
            if strcmp(cfg.present_fix, 'yes'); present_fix(); end
            % send tigger
            if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, cfg.OtherMarkers(7)); end
            % present screen
            Screen('Flip', w);
        end
        
        
        % -------------------------------------------------------------------------
        function present_fix()
            
            % Create dot for fixation dot
            Screen(w, 'FillOval', cfg.fixcolor, [cfg.cx1 cfg.cy1 cfg.cx2 cfg.cy2]);
        end
        
        % ---------------------------------------------------------------
        
        
        function check_button(cbk)
            
            % wait until a button is presses
            bx=0;
            while bx==0
                % check keyboard
                [keyisdown,secs,keycode] = KbCheck;
                if keyisdown == 1
                    % check if correct button was pressed
                    if keycode(KbName(cfg.key{cbk}))
                        bx = 1;
                    end
                end
            end
            
            % sent trigger
            if strcmp(cfg.Sendtrigger, 'yes');Sendtrigger(cfg,cfg.MarkersBP(4+cbk));end
            
            % create empty screen
            Screen('FillRect',w,cfg.BackgroundColor);
            % draw text
            Screen('DrawText', w, 'correct', cfg.screen_res(1)/2-100, cfg.screen_res(2)/2, cfg.inst_font_color);
            % present screen
            Screen('Flip', w);
            tic
            while toc<1
            end
        end
        
    end


end