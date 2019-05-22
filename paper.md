---
title: 'SimonGrataGen: The Simon Grammar Task Experiment Generator'
tags:
  - Matlab
  - Simon effect
  - grammar learning
authors:
  - name: Michael Lindner
    orcid: 0000-0002-8289-6845
    affiliation: "1, 2"
affiliations:
 - name: School of Psychology and Clinical Language Sciences, University of Reading
   index: 1
 - name: Centre for Integrative Neuroscience and Neurodynamics, University of Reading
   index: 2
date: 16 May 2019
bibliography: paper.bib
---

# Summary

The Simon effect describes the observation that a response to a stimulus is faster and more accurate if there is a feature congruence between stimulus and response [@simon]. E.g. in spatial location: If the stimulus and the response button are both on the right side (e.g. in relation to the center of the visual field), the reaction to the stimulus will be faster and more accurate. The Simon effect can be used to investigate the learning of artificial grammars and their rules. In the case of a congruent spatial stimulus-response task (i.e. both the visual stimulus presentation and the appropriate response are on the same side), a random order of stimuli at different positions will not show any effect on reaction time or accuracy. But if the order of the stimulus presentation follows a specific grammar/rule (e.g. alternating left and right, or other more complex grammars such as a Fibonacci sequence etc.), then reaction time and accuracy will start to improve after the participant has recognized and learned the rules, as the location of stimulus presentation is anticipated. ``SimonGrataGen`` is designed to easily investigate these types of grammar learning Simon tasks. ``SimonGrataGen`` has two main functions ``Simon Grammar Task Generator`` and ``Simon Grammar Task Experiment``. The Generator allows the user to setup an experiment with a few button presses and minimal input via a user-friendly interface. There is flexibility in creating different types of Simon tasks, e.g.: 
- The stimulus-response matching can be defined based on the spatial location or the colour of the stimuli. 
- Different grammars (or random orders) can be used for different blocks of the experiment.
- Distractors can be used to modify the task learning. 
``SimonGrataGen`` also provides the possibility to send markers and receive triggers to syncronize the experiment while recording physiological data or electroencephalography (EEG), applying transcranial magnetic stimulation (TMS), and/or during functional magnetic resonance imaging (fMRI).

Based on the user inputs, the Generator creates a single file with all necessary parameters for all n anticipated participants. This makes it easy to share experiments with identical setups with students and colleagues, and in international collaborations.
This file will be used, in the function ``Simon Grammar Task Experiment``, to run the experiment for each participant. Results (e.g. reaction times, accuracy, etc) are saved in text and Matlab files.

``SimonGrataGen`` is mainly directed towards researchers and students of Psychology, Clinical Language Sciences, and Neuroscience. The tool is entirely written in MATLAB because of the current widespread usage of MATLAB in the anticipated community. The combination of the user-friendliness, the flexibility, and the ease with which a whole experiment can be designed in one go within minutes will enable its uptake by students and experts alike. ``SimonGrataGen`` is already used as research and teaching tool at the University of Reading, as well as in other institutions in collaborative projects.


# Acknowledgements
Many thanks to all beta testers (especially Daniel Fryer)


# References
