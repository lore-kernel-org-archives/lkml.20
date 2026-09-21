Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011058.outbound.protection.outlook.com [52.101.65.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0FB2DFA4A;
	Mon, 21 Sep 2026 10:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987755; cv=fail; b=sRAju4beCo8IqL4ybuMC48Zf4DigMyeEJWe54j0l1glvT0P+9kWlN9HIPiV+PTJtU3BEkBfIO5KuSheqILYU6TegtOJe7A3aYmv0D9hKFFLtFgbFyNCt8WtcQ59bfD4l2AnYUvV4XQn7kd5Aa97o7vNiQkD5A01cKtM3nioIhUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987755; c=relaxed/simple;
	bh=JPVk6OLPGnYLMjpzmUaSjmgmFcxuzMD6fYGhiLfXprk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iRUklYQd+n727WJEH5QjqmOmaYhmCdSb9Kvd7k05xEmFB9e8INz2cYiIA+9UMFSuPn6AqHaL8ZJpsXcW+AMEEtsrC2SfAxXlLyUKlTwvY+sDv9UX4o6XawBL15bATjhXVH3OsLuSoMsJXyomu5gnegrdDHwYnIrxDUVbamAcZGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SO9/SJNz; arc=fail smtp.client-ip=52.101.65.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SO9/SJNz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8LMDbnMSi1gB8wr1BTMijN/LXNWj46dwbYQxQsr5IstlAv8SijoqyXO7Q/Njb9g22iBw8Yl33vtMN9QWACq1d6KjRN3EmWTaVtpPhxyRC8h9SyYyB4ZfVDapnYfGaYZ0F+9GUHqq1yZdpcY8Casa5FEF5OBlwnBl54SUPegC+xhlNrJVMyO+iH6nwDWcaAxcm26dy2yxL9+8PFs/RenEfisTc0JMEqRnQQUHVVb65EvDzeil05iSf3qhVV6MnpFfupr6yYUZGbeScC+jq+7qH4R9oBdVYGDF+taAXT1GiiJnFw03h4SLBLfebzPK/Xnyu7Nlc2pq4J+feFEeeCi7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BxFdUUGYT95PcNgVSXEA0hpu8k8F0qaF05f3olGLh8=;
 b=NzbtmqgHDzlWFKSHPCe3r/81zq3/1yN5CSixBhAKmYBvZnD6+rjnplijM+BlPD6C8zlBIOxt9wvYKxzjj3BMiswYxSMzTSyjk8iqCDhiuxHFlx3hMN/GCUXvSa7m22VIIheG/2sb8B83Oj3bAKWZl75AdEo0ieRqGbHaH6rI6aPEJKDCd7iQyoaEzE7fX9OV5cQpaGaH6aheSUxtD6rLO3IahtwK77QXoY9w8kRMTxxDFiAGGtMhvmZR6zEX5omiqmhulc7teWKRHqlbnxoScJ8rqobwa80AzjrVDLV/XeTr6+of22Bb+ipZkt6Si4tgbBX8EbpO/eQL2ySn+CuGKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BxFdUUGYT95PcNgVSXEA0hpu8k8F0qaF05f3olGLh8=;
 b=SO9/SJNzbH8KO09L4A99TD/Q7HSuid3FsEdHUmQK709H5z1x+BZbPRjl7q5vZx35wdnA6DIQxU3p1UrZgR6ZHjokHCMMd/X8l1JbszdjXIxjBg5g1Cz2CCi8u40aihllci5rEiaqxqeTczlaJFWGbJddurbbKJ6lMmKgYq0OBhcHP5pDm8BoWveoHYfZ468Gmwz+XEMtuOZ0CASzMOp8LINaUaqWqqtirMQGTet+CAW2l3coFuAYgAi9PSz7wzJj3xJ88HEvZXhoHJVl72sFwvFWiibfwcafp2IZ2Hz70cMKc0Hnqps9FmAApj0nsKyYkLpoIAGg+VKJzTL4SHtC6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI1PR04MB6862.eurprd04.prod.outlook.com
 (2603:10a6:803:130::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:49:12 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:49:11 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Oder Chiou <oder_chiou@realtek.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 20/21] ASoC: rt5645: Free the hardware EQ parameters on component remove
Date: Mon, 21 Sep 2026 19:46:39 +0900
Message-ID: <20260921104640.1941554-21-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0121.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::17) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI1PR04MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: 241b162c-2d9e-4271-a41c-08df17cdf8a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|366016|1800799024|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	fRKUe06Z4cdAHjdl22HtxZYS4rrghxA2RitFzz01JXs5nBSg9EqVnf3BG7Em2lnjFnzDmuQNG+LTijXa6+P5thcetCmMPHLr2s3w9U59O6S8UK7pB7LeeEVGJfu487h0gzdsxTNR8OwhBzzm2txP/pr1wWuYPg7r3yYn0Of9EY9LHr3gfA9pHMpbK1CLtnBObRI9i9bitF6m4LKgPPUSjXKVVT4g9AYx+OGD1NPTlGAriYx31k76d82dILG9p5x5C2oIQguUi8aD68sa3vLBXrDkbVlOP6jPH4rv8Xb+ax41UcTk0KwnOSBQOiQKl14IwzFQC2/DhQ6E2PJUu7PoTVRk+vvNn6zeJzgpdOworlJVA09u9OoZQ05Jh/MgTOxWS3iGU/YjSEEggt5O9394T6pWZK9DloXKVuhnw1vLfuBtxkeggRjayKk3EL2+0M3UIsIBZ++ifq0Sz+kcQ+zq8yuGnzx6km0ZC5FEJjI4kB+6BZSFuZabVx9X7YeRmFaeyO9377fsdHqZyl7nGlsmmfgu6idNfHO02gkpgItIajtQwiqwdTTkzeN5jW7K1GfoEVcofBnHHkIfF5uJH6ds2xIWQG1E4hGaAICTdW9YYM7J6sUWRRtTp2frlQt94zF2QC1JO3Jr5DMQHAGw5z82WhFoXoHoCll5KKPlV0H7yGc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CkTPbrVKwWjihJrCvubhQQ7MIEYgWmzB4edQuwJ+YztUgxbpd3QoCVhLTcn1?=
 =?us-ascii?Q?WKy3daqem3BO6fYbnfYNxGQtMvyEsQ4VMoT/KQF4WVGprkzR7OqvTKKfI8JV?=
 =?us-ascii?Q?BQdDA+YYCziXUN5tNK1rw98FU2lT2md6RKU7k+Elho6O7zMHPpGWjha25P1x?=
 =?us-ascii?Q?L5FxbrPobmnu79sVZxjyek70oKBy8QQucFRzmhka5ZsaTQIXBgI59J6a5Gn5?=
 =?us-ascii?Q?Y2q5n+dFMdTgxZZgAoYrB2rcHUAumLXCbmaDDh2R8EZbB/0rof97i7k00I9t?=
 =?us-ascii?Q?mQ0zHehThn39qlz2lU2bcjq/GumB3Lwx0ZLffviLyvRasxMv6h/IkUInA0Yh?=
 =?us-ascii?Q?hvt6hcdk3P8w+sCsM97DS2KHi55d2sZHeLX3l9IaZFezwTsGvB9fP1q3jl8A?=
 =?us-ascii?Q?fkLjbaOmppr77bs5vfqqHvWH2lGm3sjHkWr2Rr6r7HuTV8y3/CVR90D+Bk54?=
 =?us-ascii?Q?UAi0QqirGTbnCEkqbOIo0VSWB/8ed7XgFuoA3woXVt1I4YzGxH/iLmk3sw3z?=
 =?us-ascii?Q?F+ZMt3GFZ8gx3HL7q6OzFdQREOpiaxFmLS9xujaxWqiA93Nr/iwQr3N18vgt?=
 =?us-ascii?Q?JYa9sueWlK5/Lzzg5OzE/YfTOkpCWgrc4xqATYa9qv7G54oMPWPDBp2Awfps?=
 =?us-ascii?Q?pmpJtrql3pg5ePlSghvU0br3mF2W8Lawx9VbuJjb/3o1v5WY7hmSSGCMo9ZW?=
 =?us-ascii?Q?k9lzkq26EVMoZWFr8ngsyj3J+pXntwq4ztI4juWW56odO9tpYs8yhiUO4sIf?=
 =?us-ascii?Q?l2hLeW8rQkQnynTT888erRTDBqCZUK1l+q9UgXtLIQJbj1Q/FLzFN9NeUcuj?=
 =?us-ascii?Q?TpkER+Dcp6fwq0GNjbCzI4/Q4bPbcFsP/0rFA8CBkwImzefOkhzU9DMqv90z?=
 =?us-ascii?Q?EmQZQpIaU8yj7t4XYbdTlQEjD47fIo7JxA8u80DnDrkj4573ShbESPGlYTE7?=
 =?us-ascii?Q?Gb/HPh6uC80nj3t0SgFMqt3YYdhn8kvmmSpT8Do5gw/SCUWwYMkwqLqjC8Cz?=
 =?us-ascii?Q?XzRcAEQ/ZDrHzPJBn6NX3uaWC4C+jIZZJ/vv89WKEyOY+8ia6fic6fbz0MOC?=
 =?us-ascii?Q?iE/XQdAfUb0I2lxqgQFTsIe3yLSqxWCOU7Ow3/SKHRiIgFaDGTXJpX2O4HAd?=
 =?us-ascii?Q?mq/rcjvOGUGBS4bT8ne6LQEJaZHfabq3XXNwB9o4UNMJCpdqlc1OoSQRAKfv?=
 =?us-ascii?Q?dlOSuJlex/O2uncAX3WzuwXWp6JF8ISVOx2WFvU+rUhquW+KpxVZwM0Bvvg0?=
 =?us-ascii?Q?bmknZ9Txmq5+bGtvUe7HjTPowMJdqL+zdOtSxebPAlkIWJbMgEi3dVxqlL//?=
 =?us-ascii?Q?I0RiDy2gsmFYBSiFc/sG4Kbr4ZqmpMxNxGPT/VOQLPCXtUXVKUgVZ+hWnpqw?=
 =?us-ascii?Q?rPmq9qIrAL0MvtUy0aVQzcRcBR3g/N0eIMQMZXJIVbEUQXC3TnOaLIe1ugoE?=
 =?us-ascii?Q?JIaY02Vqe/G0587lEWkSc3bGYiIE2cUiJRu1rXO1sI7I+mIl97dKpEjyVGYi?=
 =?us-ascii?Q?zGYtN2ENd1/28iidNIP+sg+C9nMJPVeu4jw4sqqXtjSZJxhEPxsZbxux0ql1?=
 =?us-ascii?Q?NNgSZC0WPluNxEd8bu8YIcA1ZI91FQXUal94X4d0U3vjjuT3vBgwnPByl4SA?=
 =?us-ascii?Q?Uiv4d/Jld22CviXLGjn2woIFdTm0iEewo2im/B05KH/H2fsWIil1BcL/jPJa?=
 =?us-ascii?Q?h6EWFuTo+QSHz/uoXAbWZgtrksnIukbVEbGFajK672NbPwfpdbCBeakSIB5G?=
 =?us-ascii?Q?JslVRBKpwerV3/+Re+6d1ycDIkUF84RxVaukw3qq0RSs44bXbrti?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 241b162c-2d9e-4271-a41c-08df17cdf8a2
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:49:11.8818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0GCG0OLXzj1MQ8YFOfmqDEcS3nDNW5wOImaKdru0lGWy00prxxOCpEBsW/h6dvQzgYm9WS/3aoF8kAWqZu8uFbMNdyQbb2JH9Kr3338BDCsnelYXd2FFIBSfD41netGx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying I2C bus device, whose devres lifetime
follows the physical device's probe/remove rather than the ASoC card's
bind/unbind. The eq_param array was allocated in rt5645_probe() via
devm_kcalloc(component->dev, ...) but never released on component remove,
so it leaked one allocation on every card bind/unbind cycle.

Allocate eq_param with plain kcalloc() in rt5645_probe() and free it
explicitly in rt5645_remove() to keep its lifetime tied to the component.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/rt5645.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index bb448254275f..15d21097ed0c 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3487,10 +3487,8 @@ static int rt5645_probe(struct snd_soc_component *component)
 	if (rt5645->pdata.long_name)
 		component->card->long_name = rt5645->pdata.long_name;
 
-	rt5645->eq_param = devm_kcalloc(component->dev,
-		RT5645_HWEQ_NUM, sizeof(struct rt5645_eq_param_s),
-		GFP_KERNEL);
-
+	rt5645->eq_param = kcalloc(RT5645_HWEQ_NUM,
+				   sizeof(struct rt5645_eq_param_s), GFP_KERNEL);
 	if (!rt5645->eq_param)
 		return -ENOMEM;
 
@@ -3503,7 +3501,12 @@ static int rt5645_probe(struct snd_soc_component *component)
 
 static void rt5645_remove(struct snd_soc_component *component)
 {
+	struct rt5645_priv *rt5645 = snd_soc_component_get_drvdata(component);
+
 	rt5645_reset(component);
+
+	kfree(rt5645->eq_param);
+	rt5645->eq_param = NULL;
 }
 
 #ifdef CONFIG_PM
-- 
2.50.1

