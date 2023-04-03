#%%
from pyspark.sql import SparkSession
spark = SparkSession.builder.getOrCreate()

#%%
df = spark.read.option("header","true").csv('/Users/dominikheilbock/Downloads/LuxuryLoanPortfolio.csv')

df = df.coalesce(1)
df.write.mode('overwrite').parquet('/Users/dominikheilbock/Desktop/hive-metastore/test/loans.parquet')

#%%
test = spark.read.parquet('/Users/dominikheilbock/Desktop/hive-metastore/test/loans.parquet')
test.show()
# %%
