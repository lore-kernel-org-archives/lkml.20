Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010065.outbound.protection.outlook.com [52.101.69.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D546243F8B5;
	Wed, 23 Sep 2026 06:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144057; cv=fail; b=QSE6iAGKW6AC1Yu7GrE/9OwE+8vWSLvJMwAe/mjYVD1GU5dOrirYrWcerh5MoUi6FEKhE9EmYZsR5XUc+yPpTi2XQ+oOqcqEV6uBL79Iay7bAXLsOY9AkKBV0zaHyIKE6AJAFNmVt3kb+E/+b2bn04Nz4/z2upfUI3maYbFmWPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144057; c=relaxed/simple;
	bh=otVERtQmvahCR+kyoSpgKfSzqyoRxQacGMeFwrAyqtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eUKCd7GXXjhAOFkwtTVN19Y6vLTqE0MXwMQb0H3OHFOUhs//7bBbxnajpFWt+dCRxFcrW10ELVgSoy/ZgLBvefe59o/zRGBm+FYM9fUWVuF5KbBZ7lbEg10ANx0a6IXVy2+O5aJwa4N4d2UsAFwLkkcCAFjuT9zgwBMIYBtyZm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ipbqp7aP; arc=fail smtp.client-ip=52.101.69.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ipbqp7aP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tH74fF91sTMgCrsWkosYD9ia+qGD4aKL3G/oBLti28q3zrk7F2F8g8pd3UcGbO0jltOn05OYul0cVB4sIYgnyMqNfNkEOOZ8s5t/3iTcXsCj4L1zFK1+VxdODTJD8wlAeml43bTY/Wfgjf1PYiTHUf0tBZbWtsZcpjhL54ODRW3EhjoFup3NfwPQvUomdppmJxK/qyjFpWxzlRHyDkHf1F78em5PERsUdOXfbAwOQXxkqrCzyWX7N1oj0IuxlXD9OozFFu2N3S5/EKUKTnw81gBbpmt0Uk0oLmkoj805019Vpy4PRHBMCiNro155MN3RLzNQGNSxzyYNzHbOLqpveA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40pim2tjUqNgzAtNund6F5DddjCKrbifPSD+sxRagWo=;
 b=m/wh2itKAfw4NDGxTI+ceJr90tzwndlwLIcgM1e6D2eznLK0Cc2hTvexMEMStrybNHvWCws/VrGKWNttA1qf9z/dGdzW1UpkZ9dO26FLFtp5NlPPcfwAZUUsyLMf6QasZBj2fv3uwF0Xk6nsE+dt8HiZZ2HyoEGKnPWpxET5BfKrfaYN7+NgFZyGavl+R+JUF4IwYDarAo/pz4AphJuDzRs9icW/JiRqX+uDc616qF6IJ6d1qqqWwYYy2JFW6oOZ86RQ3Z/mk4vh7sjYUNorTh2furdSJuP1yEvhaDcB4sRjb6ugwUE/QbwtduNlPDoJ1qU/RliJaV+hbPl7kF21IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40pim2tjUqNgzAtNund6F5DddjCKrbifPSD+sxRagWo=;
 b=ipbqp7aPL+WtiExcqugcdX8+eSwgb+5zAGBH2CL45IzhyPomk6ubhWgIhtOKNhr/lzOq5WtwdP9WRW52d7bSDA0gA/vv5i/wKWCwA28S3T7Ir+nDiGB3UDmpiDTx4dswpkT3uWyybi51BSWxCmHdstHnVY4F3HR8+Xypt2G9ANSJgmeHS7yr1Wxh4bnyZFbha/7tviE46o03MmgCOWCQW8/Icn19XUHZWc4t+d4fA6CKSlIBcSufp0GkIFZVTM6pOOxzJfs8NimWDirCBvwfpsCAxKOqxyDmEX5i+b2aQRV4qo0dAA9At2L3E/vhguE3V8iOHfxX5htqi+PEdjAgEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8339.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:14:02 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:14:02 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH v2 06/21] ASoC: codecs: es8323: Move mclk acquisition to the i2c probe
Date: Wed, 23 Sep 2026 15:12:50 +0900
Message-ID: <20260923061305.4041197-7-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0070.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::6) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: c241bf2c-2a47-46e9-74a5-08df1939dd57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OBqUr+TLEjNnnrX8uu4c2C+5u6LXGrNSW4IdZjHmFOM/g0hr7yOE5BSO79TdpuqeDP/0IFacaTEDBZTwn/8ld2Jq4o0L1G30QxHnWKIJ9bgeVf0IjiemcDYTuUZz1LVE4oGz3Mjdurr4k8Ho0QOaULcKeNmaCp8QBlsdcrIvIEvzyWqKqKaM/5vfhvvmG40S8gXx7KQ/RcZr5RfNv/JMIsBWU1j+7K+ZbtBO28hlArwZZsmuiUAnw7A3FgIHEx01DQFzXpMrZ/jr9ebmcFU6aIu2xauD9q4zzHA6X+i1wTSFVuXgG1Z8vODPehUn5XfgEndKbIZrdAvf8Je5NtGY8+o8xuWWbII46GJ+/rbdnmKt+Xp/HczjqHFEAfNCAFlA4kUsn8MW8HqWn1Gl7vKbePy9YGvo/iUu2uFUwIM0PwSXc5H8hJ4upMvLG6uBxe2Fhfpp/8GrDPecpfP8eudYJ9gDgXpxVP/i0rM8jq8vWCZnacVzQQXgb83oDyCYcgXuJbaQHOlckNvled5bZ4LlohAtbk9MEtkzOqILCj+fkjKafAcRVMxjy3Dt8G4d23mWfmUJmF40PaZt8fsJ/x2y2NBBik8OQ/pTk3DGIkCK2t9GcqaQIkFOkFBPEQa9LtZ1G6+VcQPrFFeHe2qKEnqOUgEwYWRH1pDB9V5dz7q+SfU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DU6lI/rqxjpq9MYlwTpiAacnKJyaMKKTOcz7bcCw9i4rw8XSACTPs3NOV3P1?=
 =?us-ascii?Q?5obRz3+qIZqZsSbkc+Rs/MvXvF/fLARY1bH8EFEbStk9hI0cjrcDW9C+ft+H?=
 =?us-ascii?Q?AASEAH4Xt6E8t3C5AoH9tK8ckrkLece7hxaeNYxUAyZX80jW2TV8CZzl/aw3?=
 =?us-ascii?Q?RJMuHP2cCjnaXoecG9T2vO+vwJ8AhOxwUErfgqqH1RDT2zrLGW0jNGPmPBss?=
 =?us-ascii?Q?QQyvfcwIs5KKOxdZGEelcBLAcq/ZcRLzeAASdxE2OdhvqnkOjNDEU48yKxPg?=
 =?us-ascii?Q?jW8SJLrF3Y4dDHgoUV4OB4l4WWiw40ny/4xvSWPcztLloBBSkHrO8j7giNK7?=
 =?us-ascii?Q?I9uO6lIRElrNYNwBSArMJ2qnR73rtaI+vDCiux7DjpNZXELH/zpBUcQ67b/D?=
 =?us-ascii?Q?DtYDCa0RS+yYopLcf6FNEZlmDEY5rZ+9XNfxct1WfPjvMFaA0nnJuvKr4oKf?=
 =?us-ascii?Q?fH8UHYysrPQ30DRuz3Rs0qQt4jMd1mn8j/k4XmG/hr6TY+ic5oSSwCEdHCQd?=
 =?us-ascii?Q?jQja8lxliSuZZ4JzblrxANPT0BKDd/CVFlF0oUd/2alYXLJh0xaiIHUfDecd?=
 =?us-ascii?Q?wf4tgA13jqpCD0nl2gI3uHnAa7rFzC7QpUH5V3zR87iNCP0v/K1OvHSMgff7?=
 =?us-ascii?Q?hj4+VxrRcpdcx+Md/wA3PwXeEuGMW8OF5ePWgLnKHBsquAKCAwV2eF6etakI?=
 =?us-ascii?Q?tN5AiZNBsoz0JAB0o0+rO445ER1n3VUKW8m8X+enn5a2wUE80uC3Nw8KDVWs?=
 =?us-ascii?Q?4O9M5yivVL6hX9pMGfo1bd9+ce8Y2hjUVZExcH1GhESNAmYrxVSeTYXuohLj?=
 =?us-ascii?Q?yHOV8DXEbin7OOARRUdQN5iwubg1TamhwR821RQWcJO648TpjyPjtTfm6+Bg?=
 =?us-ascii?Q?mF+pVvr6cqzhYkXEAY4w/B+O2j+djFr3Z65GfkmLDWVdglDoZ3s+L8QGVzrC?=
 =?us-ascii?Q?mVzxtsD4VjObehiBAUvJ6O317e/sUTZkCV1NJLDHCOHvD4gK0dyLOoyMVkdf?=
 =?us-ascii?Q?0mbkd0lu12f73GHwCA0Lu2up3ChNNXnfagZhzlPEacFfnyMInuHq5N4Y9nHL?=
 =?us-ascii?Q?fURrs+UXtDbn3QppiZCOzEDq6FlLDquvxvhAtRVEuGGOx9pOLKyb0EB+qTv4?=
 =?us-ascii?Q?GyD1ZL6D+amD4aJEAMTe9qDmq3pepmVAS7GJXtEkjuhpvCy1wXFXoV0qWUAS?=
 =?us-ascii?Q?OOhO1YYzjwRC0LqL1eRhR+o0hMJ2o9g395ogCx1eg4CbWfLgmB26eoJ/lrY1?=
 =?us-ascii?Q?Xc6ZIAnntPYasOpYZafA/4xFPZ8N2Rt01kbXMfY4HigJRhCC5dN8wKNBAFg6?=
 =?us-ascii?Q?Vmn77u98eYHNIvrPk4volDliv5D8nZtffBHNEp0eHr8gk6JtAfgS/eCS2uS6?=
 =?us-ascii?Q?7avTiFotpe9KIXhux2TImuToDG5U6Yj8y/GBmSqRhcyN/u5JtbeQyrP6bAPM?=
 =?us-ascii?Q?ZG8NZiQGujTMVHsWLSjm7jQu1P8p3ZAVaSX9fE0TC1hoF8PLGr5ZLVQ62T24?=
 =?us-ascii?Q?8N6MbMFfJ86gIIjZ2g7KhHezuc1tquaIdoYFcF1NyfeFCAjNvBmuvCO7FMwY?=
 =?us-ascii?Q?9Tx2u+H+oJiZDu5gnPO8wMbeVDAxqNDNaT+fT+l+wuwSBWqKy3+gvK/Wjdgp?=
 =?us-ascii?Q?cC9Byj5vSMi1CMZYrHH03G0ruF6DRfH+SQ+4yhGdclQaRDeQln62pDXtSBUk?=
 =?us-ascii?Q?1r7g7C8zg2lbUe+5IsXAxPbaGHdxy/d1/FYI8Ui8o5GR2YS2LMfISu99JP3G?=
 =?us-ascii?Q?QRBxVkL5X7ni7LMHWrpqq+/WqWNbjhRAOCZ98Jnvc1xmfbwt6qOH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c241bf2c-2a47-46e9-74a5-08df1939dd57
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:14:02.8633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dUjwQKxTrkPtUMQqapqSVfHdsx2eGC2h+dox5btvJ+/1EGqb1t5AB3vm6BC3+3HHCthB+W0Fw0nwE71cSTha9fLRdp/sJXpt5D8HULI34z3B1QRiAKKbe4tRcZBCT9wa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8339

From: Chancel Liu <chancel.liu@nxp.com>

component->dev is the underlying i2c device whose devres is only
released on physical device removal, not on ASoC card unbind. Getting
the mclk with devm_clk_get_optional(component->dev, ...) in the
component probe therefore leaks a clk reference on every card
bind/unbind cycle.

Move the devm_clk_get_optional() to es8323_i2c_probe() so the clk
reference is tied to the i2c device lifetime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/es8323.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/es8323.c b/sound/soc/codecs/es8323.c
index 12fcfe017ab2..3f7fbbdb111e 100644
--- a/sound/soc/codecs/es8323.c
+++ b/sound/soc/codecs/es8323.c
@@ -671,15 +671,6 @@ static int es8323_probe(struct snd_soc_component *component)
 	struct es8323_priv *es8323 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	es8323->mclk = devm_clk_get_optional(component->dev, "mclk");
-	if (IS_ERR(es8323->mclk)) {
-		dev_err(component->dev, "unable to get mclk\n");
-		return PTR_ERR(es8323->mclk);
-	}
-
-	if (!es8323->mclk)
-		dev_warn(component->dev, "assuming static mclk\n");
-
 	ret = clk_prepare_enable(es8323->mclk);
 	if (ret) {
 		dev_err(component->dev, "unable to enable mclk\n");
@@ -789,6 +780,12 @@ static int es8323_i2c_probe(struct i2c_client *i2c_client)
 
 	i2c_set_clientdata(i2c_client, es8323);
 
+	es8323->mclk = devm_clk_get_optional(dev, "mclk");
+	if (IS_ERR(es8323->mclk))
+		return dev_err_probe(dev, PTR_ERR(es8323->mclk), "unable to get mclk\n");
+	if (!es8323->mclk)
+		dev_warn(dev, "assuming static mclk\n");
+
 	es8323->regmap = devm_regmap_init_i2c(i2c_client, &es8323_regmap);
 	if (IS_ERR(es8323->regmap))
 		return PTR_ERR(es8323->regmap);
-- 
2.50.1

