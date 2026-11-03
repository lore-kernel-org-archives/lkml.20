Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793716743;
	b=vBxqbNaL0UWOgzZvVehKP/tr8HCKt3VjJX1CNPkb7T+JTob2T4ORQ8Kw4KkGdCi2H/9Y
	 vPSWQCQG8Ou6cOV45YmbzzdHKCiwjhsbv6jvCAmyg0HnNztVTl5tCL9/RvWEj6nB91KDI
	 su98CThwp+gBGeOYnlkkp//MPJzKOO0F9/OFo3Ef0fSXkw7prbga89qbqQVqxEyedW8x9
	 3OSgP8cxWE2b0+ChyPXSMP7Li3uCbSMUczlHNvtl773aXUPX4ZzTtzwBtbw2c3yE/+nGk
	 A8yEIaEdTy8tn8SLKXFdH7WGcsxseTgUvI9M4WKRE64SzbHpWNtTsDh/hN8+fodV10A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716743;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=r0WsKAsVllTUviHcMSE1N+7mwgqKruKuF8II4gE+1XM=;
	b=JHTlLqYiKAyOz9pmpyIEX6IiVWmFGAhkIMgXSPTbOxUwZnpKsTIWw481qXsW1oYrt1E5
	 2iWAvWTM5ihc1Cgg0SlO0jCY0RRvigDMFhavo2uffcIh6j7uXTzD0CD6wLksI226lodho
	 0T//EN1FafUKRwnSCvTg589lScHglzumT2gTTPhqSbtk9NrFg/a7EIzqAqn0kxGgcrHOY
	 5tphyaFInl4J/LOyJqmYMpgKwDVngifMTwtEF5BQwNwLn8vQG4CDF1DrxrbbOlPpjkc0e
	 zMKthFwW/M97wLWvwTyQmH11Ap7l9o/hZKBmZNxaIAeC/hkprEdAu6B4jq2FyBVOVKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CetvXQFw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.17
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013017.outbound.protection.outlook.com [52.101.83.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC27606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AC27606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CetvXQFw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXYTTkmfn5q8uUAqdzNyCufbk2wlmmeZTfGLGx+LFEawqlhNRzcMdg2O7NA47wXp2cy+RSUyOLemCCDMB4Y1ivSqTkhVtHcBZBZ9KoVTxpDwgl1O6fHVJZv+jhBUxsIPUXoz8Gdgh/yx0/OOaj6XRBnS5nqS4wTQchfISbFEUmAhR/ZmxsR2XhWLMakPvysgFgA+Nx1zGDgbdaWDUGxJd21k/xjKlHOjvgMBMzFDwmt1JhenomldPLDr34qoVVOdeANeNwXciNtPM2btbN99rAtImOuGjrRm94/ZNsy16RWvjoyc1XIcmn7cGZUwta0YpkNqGzcWF5qhw5NzIaFTVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0WsKAsVllTUviHcMSE1N+7mwgqKruKuF8II4gE+1XM=;
 b=gqWYw8D5fxIwIlEWur7vl2GVqLbxuoPYyldTKs0ObPGTMZGVIdk8oExshWCBzjFTSi1z7blStnsUvmkxZAIK9LAYtQTsMeyBzLVZ6hBN1rQLDP9h2/7a/KieugSQOz2+s1vtCDhWIbzKyd8/8I0yuIINL9Tne3ptJgJU28DPgC3vr2L1rx/vhg6LprmRxFJOgMhR1eMT7yWJHjqfEOFlrk7sDMJtR2/9wEeKXOmlHAR/ENMXWHTXVIMWTeSDA8k+/ASsOqO10T1IFGVrAtu0bmq1gp8Ns73p0yHMdqD/UPo57ltOEe8YYmyM7jIQSsV1i2/Pp3kQtENky5b6KBvoPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0WsKAsVllTUviHcMSE1N+7mwgqKruKuF8II4gE+1XM=;
 b=CetvXQFwmnemWc1L/ibMMTj92kKd+DQuiLeJvfDn2f928SL6U8qq9Ir/tiFzu2kna9Hy2f6S545XXxQ1+sm9OaXKc8b5vp3d9GwU9EDgC+53rJ8Aty1aT4rGiKrFELBR1PvrUd3NNNRPr1MddSvnAnIbQ80V2EXXDWPCamACTCLgQYNRX1WNjIS2rw1JhDAwDIH8sUC2MW51rN3h4I99IwB96WMdvTfVL8qCpuqwhPmOdiN4u0Svnrce06U+fzjevPUHxD1TdChbpWzr1KVyvomJbpant0yruhrnXD8RTGjPuvyXNSAcElxDWT+BBE087oM4LUJ/U4Y4auoKI+abYw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB12268.eurprd04.prod.outlook.com (2603:10a6:150:2c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 14:38:59 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 14:38:59 +0000
From: Frank.Li@oss.nxp.com
To: Matt Porter <mporter@kernel.crashing.org>,
	Alexandre Bounine <alex.bou9@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	James Kim <james010kim@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] rapidio: use dmaengine_desc_set_callback()
Date: Tue,  3 Nov 2026 09:37:56 -0500
Message-ID: <20261103143759.1168880-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH5P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB12268:EE_
X-MS-Office365-Filtering-Correlation-Id: 386bd365-6fd8-42df-951d-08df39b8326e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|10067099003|56012099006|18002099003|261009223027099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|11063799006|261026121527099003|261026140227099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	QPlIDIgonfgmEDy1dMvTLou7jbPth09sjL9b9fxlq5HI4xu10Gk9m0DeFJ9hu/INbIG9vACEvDuYmAytznFb31t5hPEtlpoeNEssXDn4mRdkv+WQnlLoy7mTowXUj1R41UyxWoF2qWpyQ0GrUIwH/kSF97PA1aGhJcdVzwgnmy1sBCSH9xfFLPhNCVz5amukpwueo9CfSeaLIj58hyAkoUipxhP+wLixPiZ9tkYUkuxiUE4jtHJlh6ZoFbSACtBsRgqVPBkxhw0zXphpDTIIqTwofV7DcMMumbj+iqGBA/J3Mm+6/hMfoG2ofejvPp7wiVkI9A+8jyrufyuZRBwqoqPl9BHv0nc0yp/BNvoFN5s7NNCCB2CQorFdTIM95q5qxO3G+rHF0nhFtgZrinkaMLH6MiIbohkHHnMpIphF84VWg2Iox+QkyoXR0Jfs47dXr+PLKTP0Yp2kSWvykc0qgNROq/87BAC/eLG23vM5/zawuuN2Plr4rJ2MAji++zjshSl1qnOZ4aUL4T2f2om5jOXUORx7VtvHY9oYqi9icwQ4JzA+f6W3Tv7FuuS23WhrB0ZdOeAAZnVcuGFun1oSkqleDFQvjWFW0yoP/2+m69YvFXAWnYgnX/zotlsYuOws9EIWgkn4SZhQE3N2D9YcLKCU9v12nPo/LbY5l3uhpeo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(10067099003)(56012099006)(18002099003)(261009223027099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UGQ8sqdDkIGzOZTZMZp0kp7h3UEwdn7xKZugP5TP7ULyNjaBOFGk+7XLZ4bC?=
 =?us-ascii?Q?dOpiTCd8MRg+m9oxJtgpGL837u9kSsZHVCsI2d2pB//dc8uJCFN+rf0btbZC?=
 =?us-ascii?Q?Qg25CaBO3AgSJL2drtR2Owtp+JwIlZLX6ytSW+VNt4/hA1iPropcvBGLRgiX?=
 =?us-ascii?Q?8+1v+gbz6N+SZBne0k3/u0W2f74spybR/e0n/tq/FnMsJp/OPIAbR87p58LO?=
 =?us-ascii?Q?BnkseZs2u/ZGOs2hcXwNN7/BOKc8QSOimtY7bAA50dxhxIsK6qM0zrgSiPXN?=
 =?us-ascii?Q?dkAVjHxFBdYByZANFOqxRlT+QXqx6ZC57x4cFah1mMJRCCF3EKebv2cinwlx?=
 =?us-ascii?Q?Gc3wWwsUu+QaP+qlcnLd28og479PZ4IW2nBfuIEM840vJlJ/b/uoN8SVMXGV?=
 =?us-ascii?Q?vHIFQoN4mE54yqQA300eeyKJVubUGcaYgHpqv13DPisF7aCdgYQ8nnGCDyCs?=
 =?us-ascii?Q?fA1l5Pb4Ztn63szx6/vXHg2YxlagXBlPebr1TzQUR9+qZ3+BOVG7DHZXcpg6?=
 =?us-ascii?Q?vJASWmzd4nZjUKkPTeL5bL3JhSRTTdHha/CjIITtWJ56Gl/vswmkBD1Da6+V?=
 =?us-ascii?Q?5rkoRGcOE01xm5gxMN6y5tn2A0cJy1gIwIQAm85TJjyBXphfY6QHzXGD0uqJ?=
 =?us-ascii?Q?U535xLOfJ5mh69cOhp26Ni14elybJ0eyrGot+jRdfmjKxeMMMKaAsQpA2+mo?=
 =?us-ascii?Q?2xCx9JDQnLBf/ET9gwZ32ieoD3OU200M8esr65F7KNs4xRhW1cxqxNUh9nCo?=
 =?us-ascii?Q?1VcqhgMTckuRj20WBlvYTL3b/r4F1VVRhJ+iF4jAwDAy3Se8YWVTkRjrkKRV?=
 =?us-ascii?Q?f72PcmrKKoOliGBAVeoqbLYgsq6SjXIyUG0sveZwF3ubAPPxNAXQcXfCknrq?=
 =?us-ascii?Q?QAGTOKqU3jvRGdwHnNcFJOb0jOcuQXqBgbGL7ILM4X7hh9RwWo/59DhtWVFa?=
 =?us-ascii?Q?FHsELmeqMDrmENLvm2iUXneig20gD8kdrLcDlTtQazMEPY9k0ZAmRmFMJ0Mq?=
 =?us-ascii?Q?dCFsns6YCMcBoUlAkM1H2BAnCRO7tCE5PqrAzBV2Vw1sx5F+1W8p2A487hpz?=
 =?us-ascii?Q?hyDhwIUwVMGqPXU6NSU1Ck6y4VO9JQZ3iwnpFBo2CsVFy0ltjm6K4YCRXC5e?=
 =?us-ascii?Q?VemOW6Y0a8FPZDqC9u5TKPI2A+QwU4xrrJZH8UCXObIeOWf38uS6qTElzWfA?=
 =?us-ascii?Q?Qzxe/V4YghDj4leF/B5vzbPfurEV9Gbah8/fECuNMFELAImf4depO8jjsCOa?=
 =?us-ascii?Q?8iXQpy9880K/sCo2UUroCK2VaVFZVoxed0bqTui26nnKEDLxG2S+14ofwpKf?=
 =?us-ascii?Q?OOsEcfT+pkB+MshCAeaS71v59sDskAvOhVqOqO+wSTEUpv8FVktD7EIdscEn?=
 =?us-ascii?Q?gvY2DDRVNx7HVI7ItJwp0rM71VYXPspeFnDNgj2SSjky92FLHV2PjP7jeqk7?=
 =?us-ascii?Q?u3eGcHqf479iNdlswXA2aBai72AdgIcyhzpPtuLi03sWp84UuvfXujLhn5NV?=
 =?us-ascii?Q?b4eZLwbU82K+V836FC6HYMx546vQPoR1aIgrNLXC9B60WsiplzAJAt9JDQCj?=
 =?us-ascii?Q?18kjw9z8GrM48ABWjo6wzTjzaIl81MozpaPTd2pjwqOO2e8V8+T5I/r3yQJo?=
 =?us-ascii?Q?+HOi3DdEMpzP1h2B1bKvhW67wZbwiHlsveEQsvxTET3tYQ3CELqlDuL+ZSWM?=
 =?us-ascii?Q?vzdP9det8PM9bhHQXLEfZHx+RNPkOjFT4FUOBB3Hxc4qCOicZlHszzOMrn3T?=
 =?us-ascii?Q?Cso6AJFFfSuZTZ+i91TJUvum24ERLtlL33G0X22f/kmEmY0AXOWz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 386bd365-6fd8-42df-951d-08df39b8326e
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 14:38:59.3482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8fMC2cbchACQgInZJ5NHZrgukT+vmnvWdQgkkNqynK2EKOQhOGXSI8OlJ22ZorwTvUE40Q71GNl0jC2qizTYaSK5ggkvy4szlUre7ca031pyRAETpzoZYMD8n6noIWV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12268

From: Frank Li <Frank.Li@nxp.com>

Replace open-coded assignments to callback and callback_param fields
of struct dma_async_tx_descriptor with calls to the
dmaengine_desc_set_callback() helper in rio_mport_cdev driver.

No functional change intended. Prepare to make struct
dma_async_tx_descriptor private to the DMA engine.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- split from ntb patch set.
---
 drivers/rapidio/devices/rio_mport_cdev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rapidio/devices/rio_mport_cdev.c b/drivers/rapidio/devices/rio_mport_cdev.c
index 40d2953a9a7f9..585e3f9ff29ca 100644
--- a/drivers/rapidio/devices/rio_mport_cdev.c
+++ b/drivers/rapidio/devices/rio_mport_cdev.c
@@ -717,8 +717,7 @@ static int do_dma_request(struct mport_dma_req *req,
 		goto err_out;
 	}
 
-	tx->callback = dma_xfer_callback;
-	tx->callback_param = req;
+	dmaengine_desc_set_callback(tx, dma_xfer_callback, NULL, req);
 
 	req->status = DMA_IN_PROGRESS;
 	kref_get(&req->refcount);
-- 
2.43.0

