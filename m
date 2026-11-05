Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.12.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793837465;
	b=fEFQgoDJC4gtXLYKEC3lkbSTSo1AZFyOTRQORBK31cb5JcmwvuCC9NHhqkdG+JucczRb
	 k80FDE4T6vIuNQWZ9q34dSN2NtdLypMLTNNcV6uwCchurWWOlTz8SY/M1c6UIQ1DCvjqz
	 VMQpF4cNfuV2z9OPYVIRGZuo2fNavrSv3ZF8IKYjbARJoKW8dVkhu7wxyxJB8EXGdWKxF
	 tUaQbf7gAu7p1MzfrQFJbLmuDdt7O9QPhbTFxaOAJS13oIIfQIzdyq0RxWWIRNFMAYGV1
	 6pwkg5yUtakVlpG26WfDThuvF9TA3hXw/+kkhXZgNKPzcWghRhY8GeNBOBv5CIGeDsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837465;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ISyMk9mkjTi7IVhW/C1yhj7IdXpJIy2cOPaXE3grZmE=;
	b=uerhstiNoBnqFUFzr4y/nHbJUK6iJF1Ty/4T60ftpzzTxsanLql6c8II5pQmZgktjEii
	 Qbjp/hSlv7PqD6WRS5VYQU+Tk+9KPBeu65LawUlvPzy4aY1vNuBIZBzi6LiTOrmipn72m
	 YjEpcC09KTUYINNiRyut1hohSS4+iFnRmY9onLZwFAnu9IO24JrhRpcUA44SfMW58topW
	 jIMmpTIIraygouyWwXxuwzhF1Dy2ZMMmb27clAgLSq/MMiZMsBgf6cxoEQHG/POK47lCA
	 qO0gvZVe2H7DEjvPW2nHiQuhBj8F3+9e0SGWApICulu94lbUSM7TOQO/P1YL8iBhprg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=DwLP6ve4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.12.4
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azolkn19010004.outbound.protection.outlook.com [52.103.12.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6780606A337
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6780606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=DwLP6ve4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZAjECtFZrjLr/VxLBcU78Qz9zV40FZDy6ah3zIu9lthQht/AuzxuldKf1TVtaeMj7AZ60soTUhXzg8VubBtgAAOAe9Brrno04ZuYkBPK+m/RPCxUeCH+w52c6x7z2jxjfjXmdaV5nJ0Mgf0+Iqj4ZWGEdAHSdulRCkSa1TryL9nQEM2yZHlMbvq/RYj6qY6OPVAbvoO4bG6wxJNt+2pq9Ck9bsrV3tV8XTuquhgGbf3RayLPK8+ReMikx6Imknn4ZREQx1PrUe0rzsLiBni7ahV03QCoGsxu24fLS00BRM3d9pdrIPHW/AH36IqTfQgY6pP4EEzOZhunnGglC8Gmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISyMk9mkjTi7IVhW/C1yhj7IdXpJIy2cOPaXE3grZmE=;
 b=o7TLQsHEZVCqRTtb5JqUa8MY1x/IA2teNwqVigkNNz40PGwsRl/6RpfvOANwzvCDWGwidlHzaMEKUJ9CLsaKkucDUzPHwIM8mJxssqtkmoNgxcBCQ0CmfdMbcGebdXS3uLqDjS93HdV0CYTmxhk26ffBH1UVsRGeFAHa47UM6OXfL+FMGDNpLtYeeL+ojG24t9vNuxQuAw1JvJEbTs1YMfp2meQgoZzDoOGmSdWXqXEg1LzaORvsmI2eoE3rcZuRnMplxcMoLntZPRNqUhXti3wH8c+XodrXhy0PAG3g3pvSgTAWupXmu9jmWWke/orBzZjU4r2YQoq1IwQCmrl5iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISyMk9mkjTi7IVhW/C1yhj7IdXpJIy2cOPaXE3grZmE=;
 b=DwLP6ve4X0cKNJXdPpDqzeGUxwA9nQXBqMjg89mRdcP++2EqyK0shn6vLvn3bRFKFHvlkIO8U8HkhM5/sTtlIyLb8JleYUCoe8fessmxjaWdH7YG9OoZbt2pnShxm1R0n6vf26lOiE2fuEeMP/zgujMCR3P82njOAshd4uWv4Y0Op/JUyma33+Ur0NkJ3uwM3svAV55GwxZ6iqBGNDItDD1CwcHjDfe6GjmBHi2nFRcAeOiBKRp2qYmbRqUXZzgc8rM/vPdpyJLso42v/Xjtj3XLHJu2iRhTsPDVgs8nNQ/E9m8GXcIzsfbjY2pO5YNIQ9CnHP2Ib3woCAK19WwK8Q==
Received: from SN1PR12MB2528.namprd12.prod.outlook.com (2603:10b6:802:28::33)
 by DS7PR12MB8202.namprd12.prod.outlook.com (2603:10b6:8:e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 00:11:02 +0000
Received: from SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::9875:58c0:928e:cf0a]) by SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::9875:58c0:928e:cf0a%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 00:11:00 +0000
From: Victor Chernyakin <chernyakin.victor.j@outlook.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Victor Chernyakin <chernyakin.victor.j@outlook.com>
Subject: [RFC PATCH 1/2] regmap: add regmap_reg_field_* APIs
Date: Wed,  4 Nov 2026 18:09:49 -0600
Message-ID:
 <SN1PR12MB2528EA386B915EC96904EEB1A5772@SN1PR12MB2528.namprd12.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <SN1PR12MB2528754CEF9D8E5103ECAE28A5772@SN1PR12MB2528.namprd12.prod.outlook.com>
References: <SN1PR12MB2528754CEF9D8E5103ECAE28A5772@SN1PR12MB2528.namprd12.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH5P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1ef::16) To SN1PR12MB2528.namprd12.prod.outlook.com
 (2603:10b6:802:28::33)
X-Microsoft-Original-Message-ID:
 <20261105000957.695605-2-chernyakin.victor.j@outlook.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PR12MB2528:EE_|DS7PR12MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: e24237ac-d8d2-44d5-b390-08df3ad14543
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|22091999003|260925184616899003|25010399006|19110799012|5072599009|15080799012|24121999003|23021999003|8022599003|24021099003|41001999006|3071699003|26121999007|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fX+qtjvWgGlAtm4wer63re+33Jdfo0rMdk26d+iOTRTHfzNiqjuymsJai18m?=
 =?us-ascii?Q?O5zqLsemBjwdJAUkiD+NkfCEVTKlth+vTriOucqoY2WwfgCFEsTRrA1KIh+i?=
 =?us-ascii?Q?nMDwaoGzgMw4dY0Ta+DtymPAEZmAlKxZlBoIxe4qz6X/C7lVOBUVEvXD3qQw?=
 =?us-ascii?Q?l6wGH9lr6iIwe+Lv4IQpbGNaRE63/W5aQPEQXLiIj3PmzKcWSXkShijQEmMY?=
 =?us-ascii?Q?TjK5yjcr979KoUnBgzzHc4FmnuW1VmLF8zvC7WJMfaRD1yY5hnRi1oBJbdkt?=
 =?us-ascii?Q?P08kXjLJjMfqGvWQDAWSm9yMDJ9Iml/VWpxTzOnQFuMYBiHgISMkHuNWH7vX?=
 =?us-ascii?Q?e/9w19QmSIHKyNwxpyewbhjDyUrMMlThkl02sviMWKA6MbYSrCQOtgD5IYyb?=
 =?us-ascii?Q?5vuy3A/YBxaNIid4iCbGjwaKAy1vZaozpq0DM0tfIoJg7uQZyCfFfv9MNdy/?=
 =?us-ascii?Q?jIu43M5FHNozIYXGgV+YMlwJdZ9tbhQyqghciF4bVUsupl0iPkG5LyOE5uqB?=
 =?us-ascii?Q?82aKTTBRye9rqfd44smFq/+xrw5PhCucnym6adPB1j9LSOTiXX2ZtRdf+uZM?=
 =?us-ascii?Q?OnJ4kpULYbFyd10Xz/8tI1asGVivDTJ5+7iOJcz7mMkqlR6tQQ3md17IKWex?=
 =?us-ascii?Q?94ph9Fnjr4vlc4E8ACU7dx2r900xwYa5UocxbpFtUHKzEot6CgbOYbU/DEUX?=
 =?us-ascii?Q?MRnHvmtE9HHkNfTtT33DFw7hfe6GAlrId2aWhuEzrIZJNdAj1UPhQNSwIB2t?=
 =?us-ascii?Q?UsAh+caRIDlGQt/IbX/g9bYLkUwVJ+eFypnjHcI4TKnx3GovIvUfGzzZx26C?=
 =?us-ascii?Q?LKZaO1VpUQU71rfXkz3kLXx1YFGHnXccvbFlH5/Q5H6Zbe2L8c5yybmWiiwQ?=
 =?us-ascii?Q?qN/T4asm2J/cOVkN9ntUjS0qKBQzkuo/rL4EOmEF7t7pfmSzDthcuovu6ReQ?=
 =?us-ascii?Q?lr6dfWU8thgTfTkYRpFkbUYc294nTAIAwvIj4afMz+KVIygQ2v2OBZiigkEA?=
 =?us-ascii?Q?NhCrtoDkDe8ewNH9tas4TN/2CjNkr9fr7efTwjPa1TGYElyqlUk1TIw4w/sT?=
 =?us-ascii?Q?E0k5prpce9z88quavrRPLJkYXzvINQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YzhF7eBUk7jNJFDarvU+6QWPqii31OzKYG1UOj5o5sj5IpAsNAx+Db4WFI+p?=
 =?us-ascii?Q?lnjgSC8jsHeKGa13E6/kg9QHCVUsIWx2WpM5TWKjDtKY7dsDHheV372P1+0c?=
 =?us-ascii?Q?p4JD4KfDBp0qtQWq9tONmScJ6az7UVGwJTGpeJPDqVbRT1WBUoC6X3H7r6G3?=
 =?us-ascii?Q?UB60OTTikepwSoqt/mG+MPKbA1BSWjqHaeOWInTacOj5LMzXl3+1yHfzo9+G?=
 =?us-ascii?Q?19TYRvH9bbnkFDk8xyWLkunGqXBUQA1IT+Ev9YT1J8zdMfUeXIC3Wwo85SIe?=
 =?us-ascii?Q?oJyGIxgq9pu8YRlIFvUfBDMPCIiY6qPhRg7SiOGl93xECDJSxVRyBi8KzSVp?=
 =?us-ascii?Q?UyhaahxWXHLit+O3Sv299CHj3iK5p2gQXL9aOyWre+k0+I2yHZGmdezYjT9l?=
 =?us-ascii?Q?qUQAB5whrigccosBPxqWZ4JTwcMox5M8xqlh56C60vx0mi+gNJez/PzLXRpU?=
 =?us-ascii?Q?TUwq+kSaoewb9BHXsXKY4ZslkVLqDFqSnWKdhBpq5Id57Yg0cMdw8AHhyUZ8?=
 =?us-ascii?Q?ILi2lGyBBPZUa9tdEyU9mR78Y5q5D+Ri22JjAeOB0AUtY+chVtisU/dVMwh0?=
 =?us-ascii?Q?7xNjzx4DiTwAqTuMzke3WLgtEdYQT4UabXloD7G3qa68mvqzv1iNT8qInbkA?=
 =?us-ascii?Q?GhtW74nqg/5FRNFV9krO3V8Ol6FG52KARX4gIB1qi6xc4pzhwzyyLlm82jL0?=
 =?us-ascii?Q?hhqdKDUO2KxL6/RJ/tJP+tIiD021qJ8fWW/G8qAK3R2aQ13b84cQyYt9hzOo?=
 =?us-ascii?Q?evNWe1BVCFzdYdH5JH+Ut/TreXrrGUQzNMB/PAWsr5uw0uje1LlQFgzBFi6C?=
 =?us-ascii?Q?Uq2kBJjq6KDN6mDncrA0g7LzNqNmi5RFIS2I2MEJJS1/aLrWx2HgIHAAeGXc?=
 =?us-ascii?Q?vFfd9osw1QcYL4b3V059Ug+bw0n3QWmLDBPPRFz+x6uZY6LTWyXUbXsYQA7H?=
 =?us-ascii?Q?SmFZJlqPKp+OJWqLB9AOQ+ku9ufDNErlaDEIeNgdH/TqwpQbjjkynSX8XaOo?=
 =?us-ascii?Q?Uz5gMbWXgdNAkfSgDM3TXH8Uw0AKYLJUpvKvHHCF4WuIvi/ufehBsBLEbGc4?=
 =?us-ascii?Q?ktpKHZUS84vHkcQutAQnv49CYwV0g6nzXzpSR6aIGKu0yVszqyCa2pnMR4KD?=
 =?us-ascii?Q?dRZQ8tf/Jc56jvrwvyzz47j6FGtvW93d8Ay4kppzaF5BKwtLM9kPDCoGg4sd?=
 =?us-ascii?Q?75CrRNEVY/XVvfZ4alN9yg22fUM3jo4RuoPZLA3Drd1GcmDH8B9ovqrt5WZI?=
 =?us-ascii?Q?fGtbmReY+DBDuqixEHHQa4Nx7yueZsH7A/zTIRGpk60/a4skMiYJIsjiPPd4?=
 =?us-ascii?Q?WBGlQvxeU3l8cLKOfUJmqelrQhzj9rte9TStvruvepxzbUqrIlpRDr+OBzQD?=
 =?us-ascii?Q?DrkvCldBB3UBstXzsYHf0UYa2M8Mb3A0Y7gRp6BQaTJCXWqBNA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e24237ac-d8d2-44d5-b390-08df3ad14543
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2528.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 00:10:59.7856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8202

These functions are equivalent to their regmap_field_* counterparts,
but allow working with reg_field directly, without having to
allocate and manage regmap_fields.

Signed-off-by: Victor Chernyakin <chernyakin.victor.j@outlook.com>
---
 include/linux/regmap.h | 61 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 10 deletions(-)

diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index c8aebd148e08..b4131495d993 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -11,6 +11,7 @@
  */
 
+#include <linux/bitfield.h>
 #include <linux/bug.h>
 #include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -1463,18 +1464,18 @@ struct reg_field {
 	unsigned int id_offset;
 };
 
-#define REG_FIELD(_reg, _lsb, _msb) {		\
-				.reg = _reg,	\
-				.lsb = _lsb,	\
-				.msb = _msb,	\
+#define REG_FIELD(_reg, _lsb, _msb) (struct reg_field){	\
+				.reg = _reg,		\
+				.lsb = _lsb,		\
+				.msb = _msb,		\
 				}
 
-#define REG_FIELD_ID(_reg, _lsb, _msb, _size, _offset) {	\
-				.reg = _reg,			\
-				.lsb = _lsb,			\
-				.msb = _msb,			\
-				.id_size = _size,		\
-				.id_offset = _offset,		\
+#define REG_FIELD_ID(_reg, _lsb, _msb, _size, _offset) (struct reg_field){ \
+				.reg = _reg,				   \
+				.lsb = _lsb,				   \
+				.msb = _msb,				   \
+				.id_size = _size,			   \
+				.id_offset = _offset,			   \
 				}
 
 struct regmap_field *regmap_field_alloc(struct regmap *regmap,
@@ -1583,6 +1584,30 @@ regmap_fields_force_update_bits(struct regmap_field *field, unsigned int id,
 					      NULL, false, true);
 }
 
+static inline int
+regmap_reg_field_read(struct regmap *regmap, struct reg_field field,
+		      unsigned int *val)
+{
+	int ret;
+
+	ret = regmap_read(regmap, field.reg, val);
+	if (ret)
+		return ret;
+
+	*val = field_get(GENMASK(field.msb, field.lsb), *val);
+
+	return ret;
+}
+
+static inline int
+regmap_reg_field_write(struct regmap *regmap, struct reg_field field,
+		       unsigned int val)
+{
+	return regmap_update_bits(regmap, field.reg,
+				  GENMASK(field.msb, field.lsb),
+				  val << field.lsb);
+}
+
 /**
  * struct regmap_irq_type - IRQ type definitions.
  *
@@ -2071,6 +2096,22 @@ regmap_fields_force_update_bits(struct regmap_field *field, unsigned int id,
 	return -EINVAL;
 }
 
+static inline int
+regmap_reg_field_read(struct regmap *regmap, struct reg_field field,
+		      unsigned int *val)
+{
+	WARN_ONCE(1, "regmap API is disabled");
+	return -EINVAL;
+}
+
+static inline int
+regmap_reg_field_write(struct regmap *regmap, struct reg_field field,
+		       unsigned int val)
+{
+	WARN_ONCE(1, "regmap API is disabled");
+	return -EINVAL;
+}
+
 static inline int regmap_get_val_bytes(struct regmap *map)
 {
 	WARN_ONCE(1, "regmap API is disabled");
-- 
2.53.0

