Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793720262;
	b=wCyKACwuqANImlVq3qGVfrhJyWQUZIUne/EH3rZ3JynIhvm/6h06552oeokgoCHgrjSa
	 6VoqxxS7XKnGh1iHAHCP8ZqiGRPDUdwEMTqb8bpsncK9BgYhG2v++a4VorqYcr5Juyaap
	 GojYdUrHsxu9L9ACTfiOun+Td4Y/bVeU7GDQmGEStUf541Ax7m3I1Hj4zuvNaJG6DoywN
	 xw3OwNWqSSJMneed8uE2X1W90HKrb042icwzYSE8Hd4ugLMsISfhyvkdCLc4e+hhqSHHo
	 qlYW+taLrPrYF45YnKACDqCdQe+SxEFWMs8znPAUfeWGsq0Ixp5Xg68oCIpip7n/tzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720262;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=+RnPkzTOd90IDOis+w5DBX8+SV8eMGq/Vb2Ty6xy4Q4=;
	b=zZXJGCxsCnJAG3cZFboZsQT55CrjuFu6m7m0U/5AjcxqNvLd/oO2xPWutivD6L+JaEjM
	 K0l4zRs+4ZXUU8RzY00TX0svBCEPf9swW1ga6askBEwXUlesPoKuW2rg312/uYAP97Ha5
	 UYbPOIAoiISS1+BaBhNY0qi7VuylN7s4srNAMw5zfbCGs8ZPH2EWYJlsjZzbo1EguUqJh
	 NxGan/ts2HI5u2FU9Oed1F9YkdxeMoynu4AlWuQ6Z3gkFSnqK1Bua6fqYaSCK1JmVyHgr
	 Ted6T42/TQPWoQdNydYE0v3RH7BwtjHWZ3ytEsnPfjGn5npcOQ6pkanjS5a4Y7CjbnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ADArdaQq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.9
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013009.outbound.protection.outlook.com [40.107.162.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B3E606A324;
	Tue,  3 Nov 2026 15:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B3E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ADArdaQq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZHEbAdtrQa+U/0hWjW0Y8bvA92pJymTyC6TXluJX39POeCShiTes+NBeLJl4efPKnI/zgFhYmPBSPKpzNPC8dAJTzTpomkC4uX35ZL6cK8rFMa4yU3X1Y7jX7BnDS+J7rC7VaPyp2hI36yxjqQ6GVMA/IbwKMLXGPtijO1pvWWd8fo+HQBcOMVDSj2GPOg9LrCJ9Vvvzb5I0jOqnralx5RwQU2CWqfg+2nB7HDXTDEv0jtEuAIV5Zmd/V5f6nm7hjqI3HKx2tHF+6E24za20kKQjxePFZQYQBcncQoZ7Vm0eMy/Lltgg0J2OHPCMAlGy3cmAFtzSE6xTceBa+fHVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+RnPkzTOd90IDOis+w5DBX8+SV8eMGq/Vb2Ty6xy4Q4=;
 b=Gg6O5DNExAUAqN2wrmXhlcBlyjNueqPVy6qA2KnsKVEScJeRxWTn5fV03WMzNy/Skd0X23gVStrgQlftFBTKpQnyGhMwwS65h6K3zqYdjpBRDRqjZg5ehWXDwcXvwzesygcZwlVBrYNDvTotlQgyI2knrmX+N3YJqB4aPfp8yEHCCCdzr+x4oemtexL/MVQcfUN+kvKLT+fROxijzSnzpBlk7D/Pg21g382ny+Z19FCfdNu5rWEOPNhCPDwMPzjmGzxEinsh8V9OfqNWjPBCbgnBNGrczNw1ulpYb4xPhvNpVlK0sNWIya5+sKRbklEdrEl4UdokQChltvcSqtY7tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RnPkzTOd90IDOis+w5DBX8+SV8eMGq/Vb2Ty6xy4Q4=;
 b=ADArdaQq/jyYKjuqjndMMZn8AURduADWgGMee1x472S48+XCkDaL1bRyAiiCUwauLCJgs9qTfASAuGERQNcmclOX3OxD/eCDh0JUnt1iXOtoGh3kTEQyFSMcZBt9PgBonitkYDgi9Kj35VTFrejnzj48xmFGebcrNk/HxgfXiubpGCn6G0dCs/u1y5NA+KzR6mglRWs5fAN3wnu2o3MfNc0u+thDEA9houbfq+hBAvPg+dx+kdB41fhmpPzZfh5HXgxlA80RNyuPQfovNYCUNAbp+8eRKkTgqOMxeWdK3thl1U8yfFSz+vBCs8OByXWRkMvewUGbbKUKh/f5QtaJqQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB6994.eurprd04.prod.outlook.com (2603:10a6:208:188::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 15:37:38 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 15:37:38 +0000
From: Frank.Li@oss.nxp.com
To: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org (open list:DIGITEQ AUTOMOTIVE MGB4 V4L2 DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 2/9] media: mgb4: use dmaengine_desc_set_callback()
Date: Tue,  3 Nov 2026 10:37:02 -0500
Message-ID: <20261103153721.1232488-2-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103153721.1232488-1-Frank.Li@oss.nxp.com>
References: <20261103153721.1232488-1-Frank.Li@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0206.namprd03.prod.outlook.com
 (2603:10b6:5:3b6::31) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 6555134a-6c47-4f1d-f2b0-08df39c06435
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|10067099003|18002099003|22082099003|56012099006|11063799006|261021123027099003|261021121427099003|261102123227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	lP4vw27rexTcTtCDhmL2cogjJZMdbdU6+JFl0FjKzHZmUOv7IfRDI71oRtiYltPPrqUnt2st2pQVXFUqnitMEr/0CQave1BILdgnhbfkoSblTSNjBVy/9T6gKeqAn9p4GQvg5mw3+RD1tHow8Vt909UBx5NEaM7tqrvdw8LWbDG7m4QqKsatHoa9fJz9kPE9jKc/xU0icZp9dbCB2qU8HUf3MG1d3hUmkM0eRU66Su8S5voMVlvt+E1XmRZ/2E/Obv5FQIaWzpeU2YZO4o0N0kBhMZYSKER1G1P1GKs1u7iFakopyxBVvFEYS0zVtkX8kCxyDkHxR2YINioitKr/SffllyTPQBi9huIa0HkyRDVKWK0CgKulI04mLdYwa0PeYsSgGz2mqmGkAKd7KRdzQ6OJ5pK3WnBqLyVLPoQzUPHJd+mOTtvXsaIby6W5oGyzvtqB/ZSiJpshsAZWKJuQXHZ3aBEAFk6Z+S7fNreDKRjFlws9dKBGbww9l/NJ8dyRTFiND6W6Nt8MbJEBKO0w7fm3s6qa4hozo8d6ocl+/DFQeIP09PYXtC5VvnCejiL82pmTxrgGzFE2czx2T1l4Wyu1TFz8kSP10a9r6YaLmbCcaGX47GKenGPICx7veU4y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?owDQAgOdyamrlgihkMToTtLxwEu5/7ZOKvKCvjV+bPbYTLuzFPtVvR/fF89P?=
 =?us-ascii?Q?u6XMorMe46PLOpuAw+1eUQnHWGXZ0jkYmQRSp9k5n+fVQHxS9QH/ZygqOab2?=
 =?us-ascii?Q?3o3O6oJ2gz7DDbyAk0gOvM0gy1SI+PxNCcuxVdYWpjgEZcNgU10wcriBPFN9?=
 =?us-ascii?Q?FIgd+hVHLCy0eGccqbB+/nsqwEmlyGwpEARLYLyZJBh35pAz0QG98MnaTjhO?=
 =?us-ascii?Q?NldlF5rvGFRbOJJhHL1apSl4uuIhjnhNsUWNnCYHVl/JTnLLzUIlEbxC2+w5?=
 =?us-ascii?Q?auF/eAAN2d+kYj043siLBGAjPEPWx8XvJPMsJz130u/g1FXS5+SzdRouDBPs?=
 =?us-ascii?Q?b20crafCapaJumzUYSUj4+Q72eefLBKfWkgw2hFn5ARUAI2qgV/RqG8YIQ7D?=
 =?us-ascii?Q?LjpMpk36r8zHNbuwaH8YXT2ts1HO01Y5pU903ZDKWnFpg0QPFMny+sEXsIiI?=
 =?us-ascii?Q?ZaIQETcB7fT+7KGKG3u4I5Q5L8oCgPUuiI1slagTTMhPSgqZe1WtQEvy6EQK?=
 =?us-ascii?Q?SmasbrflIIgZY7U2Ykg22tBd7KXtC3/lxYXrvNppLvjUqmdnmAOuHSF1Uc9z?=
 =?us-ascii?Q?D0FViTkPqd/blaeDjiD4BFQD+14dU2FI13miys/YPosblwoJLx+DpEl7CYhh?=
 =?us-ascii?Q?/ZsnhnCLMM+AGeNvUEDRm10HXAOm88RLWqB70R4J9RfdR1RcatGefrSoUknr?=
 =?us-ascii?Q?MeRzxXaEykZTh7TKU8nF/Z+tcKGDTdhfntW+Mkh2Wcw9jMCmHZjKt6IRonvJ?=
 =?us-ascii?Q?aSwS8e284PFqN9bbP5PNNCpsQ0EPzKo+A26p7L6OuF5RlbSyiRv0KtBmRW+F?=
 =?us-ascii?Q?wUx7AVypoYgb/tPosclKFS66BV1P++3ZjWAgle7pfd+iLJRxoYr5By3LhEuV?=
 =?us-ascii?Q?sIpue2A/sT0MR/GoHpfaCiCJPQ4M2S6H3GtIM8uUjDXdJPLTG1+8dU8qMG3U?=
 =?us-ascii?Q?6Og/wISPslBmC0NZkOvnC2NF2RCQnVUkY5G5vvU2KkE4M2GBr5HHnnrZiXww?=
 =?us-ascii?Q?qel0IWbog1T9th/gEHQG1pFIs7QpliekiIxQs10O4C7oeYd0pLPRdHxszJ48?=
 =?us-ascii?Q?VtTdImAOZcFWQOgkdUS8asj2BcSU5W0aFdx42QVKJmjVsQi/zG+grrK90co6?=
 =?us-ascii?Q?qMzJidYE4HTYajBa6mAu7/zotNuxwXSKKDeV8d4X15Dr2X3+X5XvUTo4uRT9?=
 =?us-ascii?Q?VGBAVf48GZsC3gnrJjHM9NHU0vMUyzTZ4h6L3vaQ0XcV9E7HDlXRw2aMJJk7?=
 =?us-ascii?Q?/F9hmYxj1nMLh8fWOWpg7rJhewqsFrZ2CsCzAlKSnCeEiGzs05zmkV3ydgu/?=
 =?us-ascii?Q?nPX1aV/t8cyR2nQhdJ21ulp6JpdTJDQfGZ8IgOsiBvZSepmMCdAVQH2CsskH?=
 =?us-ascii?Q?4TDDc0DtfnBXcarUd6AYaDA6+rSsqV7tgxpCkofiKAULKYQfBFEfsCYRcCP5?=
 =?us-ascii?Q?a60KhTVugG9TgCpTLRYPW6acsiyBbHmkbO/Imk/x/OeION+434V/HQbF/4Kg?=
 =?us-ascii?Q?Nwsex3a5ibZ62HCpsV6y0Hr0B5DiEo+umRs5OZQT4aAnsOglu+VxokTJ+lIO?=
 =?us-ascii?Q?oQNRTrPubnhsBR+vf37vh6WNDXwnfco3ejlVw4AJSp9eSVNFe87kW2S18649?=
 =?us-ascii?Q?PVdASfV2YTi42CB+OgR+asoCYykstd0JxUp8IRbP59UTYpMlGifDb5vdUaXs?=
 =?us-ascii?Q?tUIH01foqj/k4LYzWjjPng+SQfppiIFNo8okVfiQtUFcECzVL4TruiImpqnn?=
 =?us-ascii?Q?DdzJ0LA4Zv1bZ0CZKSnFAaT0hW8Ny8aGL/2lV4ETHD6yJzr5Yx9I?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6555134a-6c47-4f1d-f2b0-08df39c06435
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 15:37:38.8308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e4fwXSDZCYg+2lJfhbLVw4sClqHnDUGqh4s7ohcMUIGMD2uHaAVCI7UiaEOAHL5go/2EogvCftTmen0gf1nEcC4XM8LES50YTc8c5gy4wW4oCDHZSiV6CrPbkYPkajwh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6994

From: Frank Li <Frank.Li@nxp.com>

Replace open-coded assignments to callback and callback_param fields
of struct dma_async_tx_descriptor with calls to the
dmaengine_desc_set_callback() helper.

No functional change intended. Prepare to make struct
dma_async_tx_descriptor private to the DMA engine.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
  split to simple patch
https://lore.kernel.org/imx/38f6a9abf37b06318bb6429ac04807941ca8d558.camel@collabora.com/
---
 drivers/media/pci/mgb4/mgb4_dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_dma.c b/drivers/media/pci/mgb4/mgb4_dma.c
index cae888e6504b0..c9a15c625be65 100644
--- a/drivers/media/pci/mgb4/mgb4_dma.c
+++ b/drivers/media/pci/mgb4/mgb4_dma.c
@@ -55,8 +55,7 @@ int mgb4_dma_transfer(struct mgb4_dev *mgbdev, u32 channel, bool write,
 		return -EIO;
 	}
 
-	tx->callback = chan_irq;
-	tx->callback_param = chan;
+	dmaengine_desc_set_callback(tx, chan_irq, NULL, chan);
 
 	ret = dma_submit_error(dmaengine_submit(tx));
 	if (ret) {
-- 
2.43.0

