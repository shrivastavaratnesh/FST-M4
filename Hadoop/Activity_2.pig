inputFile = LOAD 'hdfs:///user/swaytha/file01.txt' AS (line);

words = FOREACH inputFile GENERATE FLATTEN(TOKENIZE(line)) AS word;-- Combine the words from the above stage

grpd = GROUP words BY word;

cntd = FOREACH grpd GENERATE group, COUNT(words);

STORE cntd INTO 'hdfs:///user/swaytha/results';