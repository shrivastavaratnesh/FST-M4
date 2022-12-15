dialogueTable= LOAD 'hdfs:///user/swaytha/episodeIV_dialouges.txt' USING PigStorage('\t') AS (name:chararray, dialogue:chararray);
rank_dialogues= RANK dialogueTable;
dialoguesOnly = FILTER ranked BY (rank_dialogues >2);
GroupByName = GROUP dialogueTable BY name;
CountByName = FOREACH GroupByName GENERATE $0, COUNT($1) AS dialog;
SortByCount = ORDER CountByName BY dialog desc;
STORE SortByCount INTO 'hdfs:///user/swaytha/results1';