Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794553315;
	b=pJqhzt7uThhZDqg+N+CEC5RDMtnvkJJ93ITRIPvii4zCZ1PGcEiFaNj4F4icxEEFxBEJ
	 6hoYp0kZ6mExgQs4cdz7aLn2XAGZHJDgtwj1WSZPE6ZR8XTZpTG7qLMVzDPekJhJE7N5w
	 DHqRU8rFigdaHouedqvrRjKn3iMiP3vgRW+4seTgDcP9mjsTX+fq2ON89ecSZKaZqhOBM
	 A43iIOog4Q498C8wANmgql25CvtMyvBpVqaluKUB0Fl0aCR26RCSRQC0xkXeMp6uN8Ocy
	 AtJ1oNXhdEhGMoPot0yIALjiaikjc+UH6jr3lMvz1bPy7FnSQTiik2L+/n041esbIRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794553315;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
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
	bh=Ndg62V5Qimj6PT/4z5GkLuHMqibSdsY7QWCRSwP/PXY=;
	b=MIGh3bsblDucR7RK8KRrEqOxpzy89cSMVJvuPJf4gTylT12WCqO+FLP7EHDXZJUsTk8G
	 nPBlCRQSdabOegI/X8P0T/tkTjkAdTXkIEY/AIhX2PJBDLCvYARMyGyk6Od2k/JkwHh/k
	 4YMLi6sxGuN4ZHnn2I+bL5kmRtLZqCQTWq3qbJimj49R7V5vMLVB3G3ln0hD9SOk+ZptK
	 p3zm6ue6i1/z2+cGGZzdJUjNW6rHVeOuVwq3i87KJf15j2t1wksAmegad3AF87+mqzpd0
	 l3CyK3mTJbyJC8cRmaMp0jAPsFhEn+22RrSQIRutxMuWdO7JCI1JngMARAfM7Pm6RKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b="A9V/EzOu";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.44
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19013044.outbound.protection.outlook.com [52.103.14.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F877606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F877606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=A9V/EzOu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvuicWFEme7cE29KOW4rHtydu2p0ZsKGPCZOnKHBVcMbFivHhudSyI4iTgN7XCnu38yBERReqx6i/rvjcmfAfiaiPxdPCipT/tZnPkCYei5Oy0KFOCndQ/W5dRy/hD+BXAdb/xdHe55jPh6GCMzTwDltwl61pVf7ZtltmxPEfHY/KvcMIJMjNDQxE22qx8lHecBEAkr636LhmhiYFbdovvfvhkBKZb5qgNpjqV2T51SX6M4gyN5MwDhKqLXBhiYCmGPNEc8JIrF5ZZfs7g7ZjOdNstdXYnR67wvTcHNClto6n5C2lhCUMFAwzwLCJX6/KQ4CbUZZ37j/F/BA5K3gkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ndg62V5Qimj6PT/4z5GkLuHMqibSdsY7QWCRSwP/PXY=;
 b=ANxnwgi0GWZQ52tq1XI/OA1z+Towu6Qbv+4KlzmyZXRhe/7X2yM32Ynflvch0p5uF76TvMJcFGijV5k/V71VqKRU+Omyht7hf2RRDqXYa3yHhEfVdQD4XCdueBLA3yXUObqfMty7X7Sw6rcvnka/SQW+7HG+f5rfFACAPgS6eCj+tNdRleji5TU3nBYbm3jZxlhn3SpBfEXsQIhXLub/0Wrv4JJ/JdqMjkghtfFR9waWRJBXpwM49v35VK+6hVBuEZMq1HmHw8n+LjBXYAWMvtzxWVk6XoJIu1zOjZJd1Pon+dgkRrhljH46cQwq9S5A3gzX0MeD4DMuAIT3NnFafQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ndg62V5Qimj6PT/4z5GkLuHMqibSdsY7QWCRSwP/PXY=;
 b=A9V/EzOuT0MWDxWeGzpBGAMZcX3dFCQLg6Vg8ywG8xUf7sP5fcYdSdbOoCL52j4DOe2bWMf0XTQjoOnxNUPii1I/Rn7ejMD6yuG3KAFSnmTSI/Ppthi4yW9ClSng/oDMT98fPlnQYNmGgMgOPXFPrTbmKDdi7m9YNn5ngxGaQANBegy3e/TytpB4k8gqjHHA9HjKNYEtel9wlyrmdmaCF+Zlj8xeeGAxMjeA6CJ9w8olnQRVXEXN3r5SrvF3LGSVVz497v/V4ClpljKmjDnKB7W8Ep/p45wicGdAM+OxRud/JcgcsQPB6VnoOgIMKBySEGdjbHsX98tO3YOOzVpTKA==
Received: from SN1PR12MB2528.namprd12.prod.outlook.com (2603:10b6:802:28::33)
 by IA0PPF64A94D5DF.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Fri, 13 Nov
 2026 06:55:58 +0000
Received: from SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::9875:58c0:928e:cf0a]) by SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::9875:58c0:928e:cf0a%6]) with mapi id 15.21.0615.008; Fri, 13 Nov 2026
 06:55:58 +0000
From: Victor Chernyakin <chernyakin.victor.j@outlook.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Victor Chernyakin <chernyakin.victor.j@outlook.com>
Subject: [RFC PATCH v2 0/2] regmap: add APIs to bypass regmap_field and work with reg_field directly
Date: Fri, 13 Nov 2026 00:55:44 -0600
Message-ID:
 <SN1PR12MB2528812E26B65457239E9EEDA57F2@SN1PR12MB2528.namprd12.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:610:b0::8) To SN1PR12MB2528.namprd12.prod.outlook.com
 (2603:10b6:802:28::33)
X-Microsoft-Original-Message-ID:
 <20261113065547.709782-1-chernyakin.victor.j@outlook.com>
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
X-MS-TrafficTypeDiagnostic: SN1PR12MB2528:EE_|IA0PPF64A94D5DF:EE_
X-MS-Office365-Filtering-Correlation-Id: 4576751f-054a-4053-a258-08df41532b4e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|25010399006|4140399003|260925184616899003|5062599005|22121099003|24021099003|15080799012|22091999003|24121999003|23021999003|8060799015|39105399006|19110799012|10035399007|1602099012|40105399003|4302099013|3412199025|440099028|19061999003|26121999007|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XR42MbSstXgCVM85Sfuajs6GFuqQkYbz8WmR3gmcGmVOzezIp9sidlRRbFDF?=
 =?us-ascii?Q?s+VAmVPp0DGEb9DNBfbOqJDguM0UcuYy5tBYq5zbPnfh4YTUehzr2JIs6Rty?=
 =?us-ascii?Q?0ZDxm7kzyPO1BFkoyWaXw1xtBbO4PAxuKpGq0NVVsotfkhU2ED9yj8dfmQAV?=
 =?us-ascii?Q?Bh429lzQWuf+3vkQ6feNEugLkQJESfNCxDtE4HWM82xFMKIkpaHWSnNKbFvO?=
 =?us-ascii?Q?88zAPrbNHu1Rjasg0y0PgvGdI+5d1Xxz678BLu8157Ss9p8rgy3oewz+QY4L?=
 =?us-ascii?Q?VECg52dWfFhRfPnzFDaQtO9doIgf88kQJE6wTA0PHw+ShBLoa6CehY1MnzIB?=
 =?us-ascii?Q?P8WnsIF3wbpXj2pzzlFxAF5bEoPxjoipMP27NQb4ZpE3UMDDH9KHYO3YUy3P?=
 =?us-ascii?Q?MtPNFT2xAK/9o61+67Mqg0beJLYzIbvea/xb1ATis+l1hk+GDQ5SkqLkbuzn?=
 =?us-ascii?Q?sfyANIh+eI/aisv55EajZN/zcQTrN5faJsFOiuj5yYWLYFgXxJrP7Fl/dKB8?=
 =?us-ascii?Q?nbK72rmdZEDbrjzLTTgs15S4DW7lWiUbp9L3jaACE3ejGyL0e1zHL4Thav3T?=
 =?us-ascii?Q?yKh6Y75/PxlNPfGkJ8kOa5pG4J6PSlpc8vDCvuRsYLwumjPvf94n3c9um/hS?=
 =?us-ascii?Q?d+LgB9/3TpxXRpuGmJVAeVWFC2G3SqCqeAWlqRi/PLGArsCsq+i5lc7JX0Ep?=
 =?us-ascii?Q?vJCMvkFD6JEoeK4zbMyGYKJd3hGGWG+MtBl+kQQB0kTGDfqOyLrNjYC4FGos?=
 =?us-ascii?Q?NL86fRVtJBkNNZeZtH5pgErVgFT+yOlDdJYVuOkibNQtGk24OVykMKlnBE8K?=
 =?us-ascii?Q?VSdXEKvdDQFRp9rP4r47OQ5TQzCN8CM23tVf84bnsd5MGZNJxp6KcMjdfhGo?=
 =?us-ascii?Q?olXZfyEDWuZmqlgbuqpFGwPp1AF9AST+9Xdw7hE4zXYc7xMKagsoZkXqU0so?=
 =?us-ascii?Q?QUf8zzrfqrGJbtokV2taBg49pO9xP64qC7hscmjs6u7TTpXXY16+DPyqy+Nt?=
 =?us-ascii?Q?SYOK1iB4AdcUA6J/rkT4AtdYUg05dyN6m8N5okpgBTm4uMoimXtCDazkvvQn?=
 =?us-ascii?Q?+RmKK2ABp1Rw2K2zM19tLyU4xttJn91GgpiuE36uhVlhPI1bR5H4AIMfxt6V?=
 =?us-ascii?Q?UdRyE2sUtkw6q500sGJqQK2bZkTMe34Tpi3gTNxtXAAVt5X8Db8ZIHjJD6gy?=
 =?us-ascii?Q?tGeMCjsrgUktZi5q?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3HJXm3904ipo0dDu9r7IAKjxt8Z5kXrRoyD5hpD2VwvVpRSrGWE2R0X6Gvu6?=
 =?us-ascii?Q?k0L2RrRAORUuouyfO7FG0ld3T2PzyK80w3g02m+4fyBK0P10Lq8SjuI6FKVV?=
 =?us-ascii?Q?hPo7cF/gd0bk0iFfrdIYPlFmfwBQ+Aavc+ecp8DUKCwltYk8Kl+OPrsMD8aI?=
 =?us-ascii?Q?m015zbHjFvZ6UHyQzyVj8ZSrJD0hwoaunwrnu8zlvLhKEYh+hT2Gx8+SZrhy?=
 =?us-ascii?Q?ML1RqP0UBcAW0mj4DxkQtaA9T0Upjs5GXv12dAYBMfmx3WncfMZ9GjGKy862?=
 =?us-ascii?Q?LcAth59UJFAimP6ZKkrizkgdgWjH8orYDkY7GeqrKwOnDnSnhmIVwLZO6ct5?=
 =?us-ascii?Q?lfSboBRQULn8ADi1ub7e1VsK0iPhu1g17/YZwNc8tqxpywNnGo5Ee8d6Yyeb?=
 =?us-ascii?Q?i5e/4BQdP6QY+5hhrn/NhsWIas1KPfZNlInLPhuStkTCV2PcU3b4blqo9BRf?=
 =?us-ascii?Q?wfFhCy3s+0+1heFuRowC+S6trnn2uJGZ1ZLp61tca0NebGgSsmPGU3JLB9Vn?=
 =?us-ascii?Q?60owC514yR+G2Re7BDzw4r6EUQWduHi1A9LMJhU9Qfj9qHhIHFGDtMMKpbzd?=
 =?us-ascii?Q?VOXm8V1Flx+/zCT5KPa0P5rzCx1LH7moyzoBmgVa7sDHOxZlTQRIjpe1hnK+?=
 =?us-ascii?Q?ITCNJRAcjto2Sp9uMA6DzZ2Kv4SLqjzOEDTz154qO3CcvxSo9+eSEKpir3RP?=
 =?us-ascii?Q?Y/8LBFeJO7+SeB6EUVkjKeclCCdubEscLN5/y2U94ng6ApjUTG+H1xGG+m1y?=
 =?us-ascii?Q?b41E2MoucW5dbeeQfe9+52pF9JOLXhdEsZm4/Z865aJBR9j21aieBDN7OjuD?=
 =?us-ascii?Q?J4RT9Z441i00NKGwwEWQGFrwYTHqlSPjVMv9065PiBSAgLgTprM4rJm6jdIF?=
 =?us-ascii?Q?jNSBOdkgX9JuRt+cPztcB+P47tmLcPrxVUvRiI+GsKf6VNl6K/ozwEDUO/MT?=
 =?us-ascii?Q?/q5xqSBpcar2jLVZb+/egyJCdAwG35W4QASLMR6hyVrsKhxmDCGjp1bTyHLG?=
 =?us-ascii?Q?C5hNEzc/n/y6sD/QuZin1gKhQmftaVLZVnlLc4ZEI5Ai9tONcZpOxBo6e1Wd?=
 =?us-ascii?Q?I3/y4htiU8bvACFqCTH2OSndaP33Dykq2a0/AAkJBeA3N3uW7ReqZ6vy3Q8m?=
 =?us-ascii?Q?sb028eizPX2EIkVAa5vs/spyygK+9RN541SgGHbPkQ5G2fM13v1mTwYdYiE3?=
 =?us-ascii?Q?upVRRZDWSp4RsGZIiNWux3KzNFEKdD2hYbFxkUdhQu/HFFqkqk4US+GJ/fWn?=
 =?us-ascii?Q?p5wBjHHESAIETxwqwa4GtqQtVg7Mp8f0WrQbmPUODx+tyq5IAeIQqKZMgsng?=
 =?us-ascii?Q?XOBBWD9+1OlQZkHdzz5v/LcIFchbd3EHizLd3xD4i+/pJsH9iCpH/cg/1/N1?=
 =?us-ascii?Q?osuwM6hG9v5726hdfYa1sCouf8n4VIZXZG0Yv6uKZKDwL/lDCw=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4576751f-054a-4053-a258-08df41532b4e
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2528.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 06:55:57.8316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF64A94D5DF

Working with the existing regmap_field_* APIs requires you to define
a reg_field, then use one of the regmap_field_*_alloc functions to turn
it into a dynamically allocated regmap_field. But reg_field and
regmap_field are practically the same struct; all the *_alloc functions do
is shuffle the data around. So this RFC proposes adding functions that
cut out the middleman and take reg_field directly. Patch 1 adds two
of them: regmap_reg_field_read and regmap_reg_field_write.

Patch 2 ports a driver to use these new functions. The result is
shorter and simpler, since all the code to perform the allocations
and manage the resulting regmap_fields goes away. In theory,
there should also be a performance benefit (we're doing fewer allocations
and have less duplicated state), but I haven't benchmarked it, so take that
with a grain of salt.

If we like this approach, I can post a v3 that adds regmap_reg_field_*
analogs for all the regmap_field_* functions, not just the two you see
here.


This is not actually a new idea! Both it and the current *_alloc approach
were suggested as alternatives right when the regmap_field_* APIs were
being added [1]. The *_alloc approach was chosen without much
discussion, but I think (and Patch 2 demonstrates, I hope) that
this approach is the cleaner one.

[1] https://lore.kernel.org/20130604210137.GV31367@sirena.org.uk

---
This series depends on:
	cbd74ec34c06 ("regmap: Add REG_FIELD_GENMASK() helper macro")

---
Changes in v2:
  - Used REG_FIELD_GENMASK where possible
  - Removed stale doc comment for the 'fields' struct member in Patch 2

Link to v1: https://lore.kernel.org/SN1PR12MB2528754CEF9D8E5103ECAE28A5772@SN1PR12MB2528.namprd12.prod.outlook.com

---
Victor Chernyakin (2):
  regmap: add regmap_reg_field_* APIs
  iio: accel: msa311: use regmap_reg_field_* functions

 drivers/iio/accel/msa311.c | 297 +++++++++++++------------------------
 include/linux/regmap.h     |  64 ++++++--
 2 files changed, 158 insertions(+), 203 deletions(-)

-- 
2.53.0

