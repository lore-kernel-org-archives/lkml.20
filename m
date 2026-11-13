Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.7.79
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794553531;
	b=Xfsr442ET/bbKrH2Q+KkPTTRoaxDJY5z5juS4ZYCnDsJXcvIMviHpW3krq8U6BYGs9jV
	 WZXE2I+emx33NK9L2LT+macUQP386KmV65pRIzLR9EMKX7z4ZCATQj6SXtxtMEbC5KfPS
	 oNlO3+HNHzm8Skv2c4EbqpIAjLfGFd0DfHGCtvFz/39U1MF62IeaBvkYMYZOl7TLp0utY
	 ilvXWm3r3qh8OQFoEKtGkmCWQUZKOoZOgbu8rnMesaNSG6xMrqmj/TdeFuvEnX6HjcGth
	 tjIMF6goKPA/cCudTFc2esLlH93o6rgy8V95z8N8OyC9SUiNNm2M0G6dez8uivRsZoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794553531;
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
	bh=9xMBeks/ncZ0tQoa/RgQnWXB1SS3I03Xqlq0i2DnCjo=;
	b=DCtsqpvIc683f1u+fnKoznf7GSIRpBQAlMakeGQPtzHwWOn5oTmzjTApMHrE9Le7STSE
	 yaz4pvIOuEcBE4VcVrn2B4X4GS4RrGnri+xsiwpgk83Ed4nhwkP78iNfe8jOLfPJ8G2H7
	 yE0r/8z7GJ5c+jJiYveZRRz6t04vpgR5gX7Uj59Z0ixMoK1ppPKxT/M8qihdVeB4AfXl9
	 2EBM5QO9fYJ/1NpeoRhN58LKmP50wmgPETsvCxx1JHDZ/xHMBqVFjLzVyQ0oCs3O0jytv
	 fFYClmKcRPX157FoFxJa95P2gduqRG8qZos/28K6z/KYQoC+7O3UITVAhaoeqd9ATGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=TuNz08OP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.7.79
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19013079.outbound.protection.outlook.com [52.103.7.79])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75042606A881
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75042606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=TuNz08OP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnyFq3f2b9Nipj3oNRK2HhR1iSS6cb9BO3eEFnpbHaEMqyhKXXOXbKVPv41jnZedQ74T5IIYV4yn/Hvjzw/O5hwsRiMEiAe45yrSeKBMMENlWEcMMcp/dYnHUcztRIMahAbyoOY40/Qp7OrOFiyUFYZMnysTx40VXz1uz+SA3X/NH0+/LAqbEq1NeLmWkkN9yirGJ7OuMLwDMHyBrftoT7+OoPZ4OeUbpNkQBFeAjc/VByn7WZ0GZrVOmuOA8xUyML/oRmV5vaTAf93YOCHWa3eKTxbiZYjsUKtrlSbG5DQkRs/UQ79QMbMWpCAU6NdPef9a7pEk5NRV3FIeeop+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xMBeks/ncZ0tQoa/RgQnWXB1SS3I03Xqlq0i2DnCjo=;
 b=AWJCFP9twxR0N2leQpRLQMtk5qa9JXKn0tBzgudOzhfMSg0sMeCdGbHOtiGJPgEgazWg8LG/OU9602QDKLxmxoh9s5932fHf7/9jc83ZRy+TMh1z9Edgygd0zZpEVGRQSWWXWwI68BMGXq2qzUoujKsZvs01lLx2jjqDq8CuLSY+UhppUldovTW2QbKxjt6qSDIRlvHohlTPcVkavCi2khCliNkF33Y2+h+d3ChFd1p6xyrGay1HG9AenIw17+plHyXvasYH0yKOIYIbiGbDh+XRoLPcWySoxyk7QjsdBcwWjvNH2KD/Axj3bVHnqjNvAi5fvnzajRIBPTH65bSkDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xMBeks/ncZ0tQoa/RgQnWXB1SS3I03Xqlq0i2DnCjo=;
 b=TuNz08OPKtBkkdJSu2jgjRO+xJTi616vVPtP1H7JceiaSF+f/Im9tAK5VY8/ZJuB4vpyEG0s6sxXDJwpUAd4mHW3YkVQsdnACQnWk2hY/TutJpVlIlO0L7gQpxYZQtf6XXVRoxWyeNoRhFbiglj+OU/VcYiFlhWBs3spreeJrGtiL/y/u4LIuUYaYK6AB1CNUYnBsO+Gk0jiJiGNOq4xxX0CrhnvzJIZ9BeXyNG5oWXEiOqkKiYL6Q+J6IZ+tyR6m9GKhqId76jSkkGbgaPwWjTKCi16NlZfmI/mQ1wL0X4p1Cma+rQugsiD7DKtUGmFUCUHzKaoQ+gdGi0YZ12YIg==
Received: from SA0PR12MB4528.namprd12.prod.outlook.com (2603:10b6:806:9e::17)
 by MW6PR12MB8662.namprd12.prod.outlook.com (2603:10b6:303:243::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Fri, 13 Nov
 2026 07:00:29 +0000
Received: from SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::c4d0:67f0:6d04:8f1]) by SA0PR12MB4528.namprd12.prod.outlook.com
 ([fe80::c4d0:67f0:6d04:8f1%6]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 07:00:29 +0000
From: Victor Chernyakin <chernyakin.victor.j@outlook.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Victor Chernyakin <chernyakin.victor.j@outlook.com>
Subject: [RFC PATCH v2 1/2] regmap: add regmap_reg_field_* APIs
Date: Fri, 13 Nov 2026 00:55:45 -0600
Message-ID:
 <SN1PR12MB2528007B30A64BD79BB576FDA57F2@SN1PR12MB2528.namprd12.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <SN1PR12MB2528812E26B65457239E9EEDA57F2@SN1PR12MB2528.namprd12.prod.outlook.com>
References: <SN1PR12MB2528812E26B65457239E9EEDA57F2@SN1PR12MB2528.namprd12.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:610:b0::8) To SN1PR12MB2528.namprd12.prod.outlook.com
 (2603:10b6:802:28::33)
X-Microsoft-Original-Message-ID:
 <20261113065547.709782-2-chernyakin.victor.j@outlook.com>
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
X-MS-TrafficTypeDiagnostic: SA0PR12MB4528:EE_|MW6PR12MB8662:EE_
X-MS-Office365-Filtering-Correlation-Id: 01cc4e05-f98a-4f69-324c-08df41532bdd
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|22091999003|24121999003|23021999003|5072599009|15080799012|260925184616899003|22121099003|39105399006|41001999006|19110799012|24021099003|8060799015|4140399003|25010399006|3412199025|440099028|40105399003|26121999007|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JE79khl/0lVWUWiUkkS1rFaMqsJ2w1uiKOvOj0eEdTCguYvGJWXMKyMv+w1k?=
 =?us-ascii?Q?OpEEk2MS2DbFV5Y4gB47CKvX2V4+0AIYJ5Wy4r5s+L0KjbrlKk8bQjJwE1Fp?=
 =?us-ascii?Q?BVqRAH6M4/6bBpMWuLnZFgXDf0sLgQgdHuJMxh8ysEgS5BKFRvkb4fb1zQdm?=
 =?us-ascii?Q?BpyDj2az38s030n1AmCZo6rN/lEpLpiVceOS3/zKpJjxL7/Rl6HxfWR3dG4M?=
 =?us-ascii?Q?dbbj22DqMbghCCL79bKEQf7lbJEcMuV8uu3/8GCaDnXXl5kNlErb5ygR6AgK?=
 =?us-ascii?Q?7Z2bhPzuj6XK5qIeIm1HrYPmWF+HRKwggEeSgc8PTHpTlHaKLBjjG2IxJJPY?=
 =?us-ascii?Q?di9nPN7c8glVJETZzdAvd4h8rm9kxhqC6cg5RS57piwmG9k9lseem4AolTwh?=
 =?us-ascii?Q?9RcJcA95nIE62uW4HvVq5O6BJVyHRgVfq5A2ChGoCu8DBYbNNuhmL1KLm/YX?=
 =?us-ascii?Q?a+9i6MmOpunnD3wWj/80dJT3z3TVvmt3OdWMq43Yu3tErX/uO/PxMnQWZ9t4?=
 =?us-ascii?Q?gV9PsvCPMSPx65ZVr0Q1KoItb7LXZCJjQI+BH5ENjJPVv9tmz/3tgcgWnuOA?=
 =?us-ascii?Q?mh0g9p0bfDZ6iP2kUH2QJoYVLK4ukkPcMn4DVG6H0tWvzOzr93z0IJrQe0h0?=
 =?us-ascii?Q?NdcqffhP4AFXaMcB5MgOuRycNmVr9qOvEw58sd6K8f3b7ru2NG78/vkFa4Mb?=
 =?us-ascii?Q?gpsJY9U/+U6dwx03SxKtsfn6TSy8jSPRMp1/JyqDJWMnjfSYvbVSkTaXoNSM?=
 =?us-ascii?Q?LSMxQn1jTaE8camDu8NIWThXpt0mhDxClWQI1NknyioP35nHHHjcLYI2PG2N?=
 =?us-ascii?Q?YfrrdONW5gBeK848QZXBizE1pMOwuQYEKVgUsF/JE2RXgOk85bgKDZwm6j3M?=
 =?us-ascii?Q?bKBY7lrkIKFNXzTgrnmZ6UmaZKC292rlgPc43luuuJT+97ury/NiJ0YmvoNf?=
 =?us-ascii?Q?3hlvaaIPf3nxgrRTYmCl3cpfzFqn/5+srnpLkzp8e+n8AojWOtjSKBgJt9Ao?=
 =?us-ascii?Q?Y3jjLO0oW3uLJcyllrtvFJcSwpyQqvBj8GxmFLmUbEL6Gve0YGIGYcP22B6p?=
 =?us-ascii?Q?1ouek2b5I9Ei+sq4gTFIG671TpDdBN55KMIYBflgKOglL/wqiwsHywWKDEPx?=
 =?us-ascii?Q?6lddaF2BYjID?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KqDRgRI0qyhrxsMHPVOCroA2HLbRkOCOYLTP/Wf2aNFEGSREd7C0lk7bo9Fs?=
 =?us-ascii?Q?LfrGINtvuRGg+N7/47U8b7jPdDi2TpYTXHZygjNXy5ixhgrR0miy09W7KKQY?=
 =?us-ascii?Q?OahUoc56La6rhkAU7QGwhpdSdZQGiv/ZLRomM1YHnebINLAUdlIAuygE/ph+?=
 =?us-ascii?Q?AksotgvUlbU3f8CvjaMmMAL8J3Okj1kqid/z6zHOM9qzzYy45PMiEUMMoMr6?=
 =?us-ascii?Q?ZJNqkTzyKRCpywFVr2n9Kt3chYenO1694yqY5+VyQEH6hUe7yzy6zI7LirGz?=
 =?us-ascii?Q?WPB+qZZASlR3yPWo/VxLjIpu5j9s/sHlnzFY4hNdvTUyaR61bKl5eZlpTl6C?=
 =?us-ascii?Q?9rtRqa8MQ5P7MZlKUCrYO1wLzdAYVat2JvBg7sEtLlRtJy8bv2JeBhYTgB5L?=
 =?us-ascii?Q?VD9g+4FBsp2WoqOW24SVJ8GhYUMDVg1C64uV5pTMOXFJOnuGFERDq6eYV7E2?=
 =?us-ascii?Q?izIE9567pYblQla/+NYQFMqVj8IhZ+ksXrmyd+WAxWw1Xi/rs0baitpI5wBB?=
 =?us-ascii?Q?bvr/CihKl0L3pDh+hUKm0Z0gpeuR9l0rUv2ycI8MsHOmw7t0ihG4Bd7qSevj?=
 =?us-ascii?Q?VgyJTKwzT/yFUhagWiX31d8zdkKCPNaS2zu8lyYwWRPM12yjg6764uyYPO4H?=
 =?us-ascii?Q?SB3Np8tSIXjj5qvtgAuFys+Byu8eeaBVPAfhSFFBLb9bv8AiNmLG6tcKfi6u?=
 =?us-ascii?Q?x1OjwS1231Ua0epycis6DC7e4aVlvIE+cl3YFGYbce1oOcf5lj+GFUCfmNIr?=
 =?us-ascii?Q?ksgO91sJPOuD5IusLgVxjq2hkqijqrDYPNKwwvlUf2zna5MtIJO3M3K+CJPf?=
 =?us-ascii?Q?+9mvJLE3K0vR6tQ4K9FrS4y6cI/Mvw1Z+G7/2iB9ZNc+MmFe/hCg63eNI/CN?=
 =?us-ascii?Q?Ws0Uw0xNlyaJxT98bcIXXlijrOkI2edTTk8yuTexNj8Gc9xvtdurlG2Q2UgU?=
 =?us-ascii?Q?Tvzoxsb4qEpVHt36kfw8Hhqfzn8Pk/m+4Ac4wzDlaXjwRf3OI3VAuDgQhLkU?=
 =?us-ascii?Q?MKaVSkFNEhoYIG76+6ckkGxnt+knxdxzDEhGfrC1MaeI6TULzNgryzWvoo2s?=
 =?us-ascii?Q?1K+mf9ue7JOXb7pbWZ94X3bt09R/ROBLqwUdiE4j4ubwyyGGD2AX8PlFLhV9?=
 =?us-ascii?Q?X13oJLPlVizS3TGKoA7ZFX+BGpq8Yhv3sY7A31ZroWy9Qeny4fxBlT+u9u+q?=
 =?us-ascii?Q?sw4zhv1ohcJTk5QsWbsb86n4lY+yRkHMd6j1ZPdCyfujGSRM2bRuLvqAXznw?=
 =?us-ascii?Q?iW3v5hi5nXAlclPxxaBp?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01cc4e05-f98a-4f69-324c-08df41532bdd
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2528.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 06:55:58.6260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8662

These functions are equivalent to their regmap_field_* counterparts,
but allow working with reg_field directly, without having to
allocate and manage regmap_fields.

Signed-off-by: Victor Chernyakin <chernyakin.victor.j@outlook.com>
---
 include/linux/regmap.h | 64 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 52 insertions(+), 12 deletions(-)

diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 186581e96b13..71df96b9da7a 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -10,6 +10,7 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/bug.h>
 #include <linux/cleanup.h>
@@ -1464,19 +1465,19 @@ struct reg_field {
 	unsigned int id_offset;
 };
 
-#define REG_FIELD(_reg, _lsb, _msb) {		\
-				.reg = _reg,	\
-				.lsb = _lsb,	\
-				.msb = _msb,	\
-				}
+#define REG_FIELD(_reg, _lsb, _msb) ((struct reg_field){ \
+				.reg = _reg,		 \
+				.lsb = _lsb,		 \
+				.msb = _msb,		 \
+				})
 
-#define REG_FIELD_ID(_reg, _lsb, _msb, _size, _offset) {	\
-				.reg = _reg,			\
-				.lsb = _lsb,			\
-				.msb = _msb,			\
-				.id_size = _size,		\
-				.id_offset = _offset,		\
-				}
+#define REG_FIELD_ID(_reg, _lsb, _msb, _size, _offset) ((struct reg_field){ \
+				.reg = _reg,				    \
+				.lsb = _lsb,				    \
+				.msb = _msb,				    \
+				.id_size = _size,			    \
+				.id_offset = _offset,			    \
+				})
 
 #define REG_FIELD_GENMASK(_reg_field)	GENMASK(_reg_field.msb, _reg_field.lsb)
 
@@ -1586,6 +1587,29 @@ regmap_fields_force_update_bits(struct regmap_field *field, unsigned int id,
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
+	*val = field_get(REG_FIELD_GENMASK(field), *val);
+
+	return ret;
+}
+
+static inline int
+regmap_reg_field_write(struct regmap *regmap, struct reg_field field,
+		       unsigned int val)
+{
+	return regmap_update_bits(regmap, field.reg,
+				  REG_FIELD_GENMASK(field), val << field.lsb);
+}
+
 /**
  * struct regmap_irq_type - IRQ type definitions.
  *
@@ -2074,6 +2098,22 @@ regmap_fields_force_update_bits(struct regmap_field *field, unsigned int id,
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

