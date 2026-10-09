Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013005.outbound.protection.outlook.com [52.101.83.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6969F45563C;
	Fri,  9 Oct 2026 10:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543267; cv=fail; b=V5ABqUyyderNki1xymDtwsmSVvBZ0RZReMZwYLPrE/zhA1CqZENayH9kxTJ8J1LmTOpj+th5PdaFLJj1csLLnVBmVY2NoKJBdd5LRlK+KesIJdd/04tdjVRtXus2uIje68zSxAcDhuXHb4nOOtTV+FNHA4zPSffG9xjIqRuxEQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543267; c=relaxed/simple;
	bh=4NdI2dOgumET8geRMiJSIsBu0hCDmiO8k0mk03Od0jI=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=u3a3YgQ9t1QB5pr14E+Hvet449LEnRQDVWAXcYdOT63Lpq+JtIfkaYIVbENiKBcLAHSw9FGotN0rpqqhUgxQo6ynfgoNBgXJXXG88hjJORh2na7Z+bUx9Y9eKyk0DEM6H6GbwzwWlxDgl71p3IDD7qVm/ovu2sfi4BfR3pYJt6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mEVfck1G; arc=fail smtp.client-ip=52.101.83.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mEVfck1G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yChR+faj3hi/TIzZKdowBx0tn2hF5SajiPLG5cjzHKLgN0fV6AEx7ttaUZ1SUy8/MDs8hyO4Nn76hJGASI3cOcpTRAGf2XHkPKUkmHui01eiOGgpNfjWEJDk4T/ZjLAzlJvdqU3rPNG578Nb9Zw3wNrCywD7NgQNuE25hHZAgpBX5oiIeqLiksoqEMPXKNaQV1Ld8yMwwrgfjxRVuq/2y8DJH3zuVlFNZJ2vtveUTKQ21w5HmQTiqCR9w92zjuDkNmSK8GSBE5Rb+t4mM603KCGKlnsfVJlW6ql/Sm1RRP0urLk2duVTsibG5IU5ggh06F15tQC9P4NEx6IBKQQWig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIuK4qLFpOveONgAAyi5kobiRpcm6xaedCc5gg3Jijc=;
 b=cnbxLJnv+k7sLYz3XkuXmlK2GeynRr8SYPQSrycGfBMQ1QmmuDCth+ltUWDKi78HT50cTbfyAkfw0RSaOdoNngQEwBOYd8Re9xZUw9uzNcgtdXKQennmu2X2EQoJeZInJTGjm1CT/wzXL4aGOuGIyIi06YW3LfoLZtyhsIn62pbrLop/AA+SoygmnI5/97FuAoqsPCjPn4fxAS2rNlLChQRbXxdnuTG+o1Uy52SKSKxEQcf8SaqptI5hMztggMJrjJw+lcWFMH2b8XndOsXpo9a4gISXqwdhQ9RCin9o5lH8J0YoWLRqovP0AsYqgoElWKEb7dU15K8u2wt6ER9sDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIuK4qLFpOveONgAAyi5kobiRpcm6xaedCc5gg3Jijc=;
 b=mEVfck1G3YQj/MaUqzuEgG3Wnz+FhpBj3odkMOzshn4E+/otymD0s7YiYHSDmtZxJsmqtOP2Lqn9vJe1G5nQvYQZvdm5LcM7Vql64asJQQcGqhCBN6HLMxmB6yJ/tSptMJ5gajmpHfnTex7ino1djOoLQCDIC6GTk2AjDvIUSTMBGDCykS4uEQgk7AkVgJCn17XgP09SC2RswJdH+RPVtv/bA7juZv9IZ9JN+Uao98npu/rDaDWEh53XgRA3JqlPuQsvWImFm/x5NEdr94nD+7ZpTaTVDftiY1GzvfQER/QYqY7XSSJIYbYJSfIgmWciNjIXhY8pedrhwvcQsRA8fg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by GV1PR04MB058055.eurprd04.prod.outlook.com (2603:10a6:150:3c0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 10:54:13 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 10:54:13 +0000
From: guoniu.zhou@oss.nxp.com
Date: Fri, 09 Oct 2026 18:58:41 +0800
Subject: [PATCH] media: imx-mipi-csis: add support for
 MEDIA_BUS_FMT_YUYV8_1X16
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-csis_sam-v1-1-81f2b0fb76ef@oss.nxp.com>
X-B4-Tracking: v=1; b=H4sIAODIyGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwNL3eTizOL44sRc3WTTZEOD1BRDI2MjIyWg8oKi1LTMCrBR0bG1tQA
 DEvUWWgAAAA==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alice Yuan <alice.yuan@nxp.com>, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791543527; l=1363;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=uSTr5zSKgO40KnnmncmI48K16qHyEsUWN0GuBu0k7+o=;
 b=feiTqHLTr40WBub4sld9CFHyyZ9sOJhZOKtweA7TCRR03FYFWKaK//vrE07KbtkJtVJTecVFp
 hVi6/Y5ne6vAqbt2fdIciURz5BkdJn52ackOs0jhUqs43e6Y7f84H1M
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:4:197::23) To DB8PR04MB6667.eurprd04.prod.outlook.com
 (2603:10a6:10:10e::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|GV1PR04MB058055:EE_
X-MS-Office365-Filtering-Correlation-Id: a9bb145f-d5a4-472e-05d9-08df25f3a817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|18002099003|921020|11063799006|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	5g39BblupdnEvcyj+ffH2QpaX67iO2DGl6p0B3ALAuzQS3dkKyMMkZLpl955Hft9LoAzLUMOzbQlgChFGPMqngFxTzxf01bhpNP9grc1nnTWckp9W4L0hoMbQOZ5WzXlzM+I1gyDhoLpf8kTLxsYjU5UvXXmqRPucpmnsm20m7jaA5x3KC63IcWkX+dAPOvZyl/+mh9B0Fy+FMveclVqIJ7q4Roh1TZZtCgKqbPhO9Uz4Z/iDBRoFq1UCqJT64jhT3pFopfRcTelPSfif9GKP9iFOcNY9oGf8AH3dDWnllYplKB2fheb/o2qAuXPN9pwPxsATBDJu6nfZqHv8Bst5aWuO36E9SrXCCyB4b6OAJm8/eCYOQIrQ5wJAJhKEwJVoZwa5pOAdn/POgrmhxuu4AbIJAEUMuP+n0E//yKFos9ku+2yRCENTTFSCgdRVs7aFPa4+u7tiLZqSf0+UKDP+nvYFzklRt5eAvn3EIWpmIlQ+Katp+Ica5RGw9p9XFZwEIN9TWrVT8Hw6rnag4YnAovq24yHlDxtcTKiZ8fZBPrnOWCkDMBQvZccc6TUyyewJi6X7Zy2OFNdm43E287LnTtjkIog72gMqlaCKWFp9XQW4+KJ3/Uc7QOOgvD6MaQGecI1W70cjLx9DghPSGb+pmv24B6MBHlUIpRKS3GFxWRgOnBSomAm7tOol7T3xyjd59+bJ40Lko4xw3l5xPZo2A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(18002099003)(921020)(11063799006)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0QzODhTOGpkZkZVZTlyM24xYTZLTXliUFdyZURTdU43c1dKVEo5WXhlZFd3?=
 =?utf-8?B?Y2tiVUg5TGMyUWkwWXVkM21YQWM4eXN0aDF6OFFTZE1Fa0FmbWlXNkdta0FL?=
 =?utf-8?B?SWpzYjNEbVdXY2l1ZnVRMmthUTBQcWs5UUM0SXBEUFhzNC9TQ29iTlB6eGJi?=
 =?utf-8?B?Mlg5WSs2YVpQek9ZM3Rzb3VqNktKZzVrdVczUFgxUC9sTWc3R3RMQzFyY2Rn?=
 =?utf-8?B?ZFZheGFYeUdFSWF3b2s2ZGVJYWRtalhGS3Q5a3AyNXZhcEo1YUIzdE9qTitW?=
 =?utf-8?B?WWR1cytlSFJkR1JsSzNpaXdLT1RpcmJLQ0pCL2xmSWZLeXJQb2VjOU9QVllw?=
 =?utf-8?B?MnlwODlzRDlBZjNKMVNER2ZVR3kvVU1nTzQrckJocmcvM2RJUnBPejBXT21I?=
 =?utf-8?B?dWdEWFhZc1RzcmRpVDFLM25WbG44b2ZuMGdqSUVLcCtNbTBzOGV1QTNybXg3?=
 =?utf-8?B?ZElFRm1UQzBIU01LQ29pTFpKa1FzMW9WdFRHWlJOdkV1c2ZXVnJJNGpRTXAr?=
 =?utf-8?B?bjU2NVdPTEcwbXNqR1lxalZwaElBTG0rZ3EremxQU0t4a25ya3cxUXRtMGlm?=
 =?utf-8?B?K2pRd0IxOTJtbzVxckI2UjVXQTBYczBOWnZJbUpsKzNqYWpFdVdnT2ZNRldx?=
 =?utf-8?B?YzJEWmdSZHJlYk1ESEpDU0dYbk9haGhsTUNTZTdjRWdNc2dQd1l3bjFRejN6?=
 =?utf-8?B?L1c2MVp3Q1BFUkpqTWpMRzVwMzJ0K3E3N29GTUI2S1VRQTM2R1pzb1JiOUlQ?=
 =?utf-8?B?UlE3b2N4b0VWc2YyWGZJTXpMb0tZNUsvcEtLZTNOcVNkcE5PODlacDFZRGVG?=
 =?utf-8?B?RHpiREdHVVRoT2U1aEY3ZE9KSzM2eXUzNkhJcnpicEtBTjVBaWlsbldLSE5j?=
 =?utf-8?B?U2lHRnZzVWRGODdYT2pZSEpxREVqamEvOFNzbHYxMTVkQ3czVnFjeERYY1Nm?=
 =?utf-8?B?U0hGRVMyaitadytLeXFJV3hSZlJ3QVRUNHlrYVAwbG8rTUpCR3pKZG1LTmFI?=
 =?utf-8?B?SXZYS29XUmxBQ1A3emp6eXVZYUFFNnUvRnBnSkxLckViMXZ4Rlh6YnBVNnIx?=
 =?utf-8?B?QUFPS2dCczhLaUpVaVRIU0psSDk0NkpKcnpPNU1adEM3RDFGYk55Y0pvSU03?=
 =?utf-8?B?UlE4N3IvKzhiQ3BDeFNMWWF2ZjRrVkpVa0ZRZElxakhMRHgrY1BwcXlnVy9P?=
 =?utf-8?B?N21nRFZkUjVPeTZ2aXNnNnBRZnc4enFMa1JxZU1DTnowWHFBajN0TVlYTVBB?=
 =?utf-8?B?WUVvb1MvT3VJNTNIcXV2QU00UjNDVllWZjZNZWQ1UUF3MjVMYjc3cmI2MmZL?=
 =?utf-8?B?ZUNhSE1NNGVrK3N3eVV4SnZMbFZ3WDhtU3BuN3ErYkFQcTR1bDZFT25rRkto?=
 =?utf-8?B?bUpOYWVPS3hKeGg1bytOYTBNOURja0ZpeEtUWDR4VWJWSzBHTDZMU0VGUDFP?=
 =?utf-8?B?ZVVudGpPaFZqVHhYNkRjTkpjb2N0YzkzSHBvNWVnbEdrMk05SXNjdGNldXNu?=
 =?utf-8?B?bG1UYzFmTjNONUNQZHVmcW9sVGZmVTQ1bDg3eVc0WjA1dGoxSXl5NHUzSHNB?=
 =?utf-8?B?SEpOdUZSbFQ5VVRmSGlIVy9NWUF2YitqUFdCN0JQdWxtZm44QXR5d0Q2dzF0?=
 =?utf-8?B?ZGRraTBPMTVoL2g1ckhxdXd3TFB6TTJOVnFWcTNSY0t4cGNua1ZGZHBBLzdn?=
 =?utf-8?B?Qzk3TlY5aHBNaEgyQ1dKcG4zcWd4OUxNQkZuYXRURWZDVWsrc2tDc2hpc29I?=
 =?utf-8?B?U0hBbFpEbTYzclRmUTh6R05xQ3FLTmlCUzhiUzB2R0FwYlR5cTBjMm1DTWJz?=
 =?utf-8?B?dnBUNWU3anF0cGhCa3h2N2NvNlhxYU5ZRE8raWVLaTdQWWtlTEZ6S2VmMDNG?=
 =?utf-8?B?UzRKbmxPbmVIMGxtU0FmSHRiZ214WlVWUnVlMHVFNytvTGRnOW9pa3JDbXJT?=
 =?utf-8?B?Ty9rVmNSdHFUUkh1MTVDRTFXMEduaUhWQjkySnJyb28vZWZ3d1NDV2RJTzQ5?=
 =?utf-8?B?V0FqNjgxK2J4Rlh5bGRheDdneGRNUGxaM1dGQXhFNXJuekNKNFVPbkNWWFEr?=
 =?utf-8?B?ekdIVFFKY0UwNTZHUmRUT0gyNWVpSTU4NmJTVW5sVGJxSUtuS0cxWXJ3TEkr?=
 =?utf-8?B?eitXTDVrVDcyT3NIeUFEV3pNK05JTTdSVXlwOXNEaUdCdHViazdPMnpVUkQ0?=
 =?utf-8?B?MjYvN3Z3UlZNTG5vUk5ldkwwM2RWOUdjcnQ2UG1jRTJiRmhBSUdVa1RBQkM2?=
 =?utf-8?B?ZGJZUVJGK0xFM2dkUkxyT2VjM041b2xWbDFOR1hLem5VSVhCOEpoaG9qY1py?=
 =?utf-8?B?WDVXaHU3Q1prTTkyeXRBc1hNSldSRUhkcEl0bm1WTkNWSUdXakc2S2lPUnZ4?=
 =?utf-8?Q?bQagyi+GRlQQ/XCaoy/jLPcxQkeFPjnAUanZO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9bb145f-d5a4-472e-05d9-08df25f3a817
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 10:54:13.8206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JAMmuiI623y6/I/SR3PPexEtBp6aGeGd17RAzoZinzdxXXJ4KMkMAnV8JR9bfshSXqU5wiQL/gTxad8pzP2IOZmEvtpCWZQGTfDhlLFRq2gMXv0MaMt9M/0pny+Odkdx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB058055

From: Alice Yuan <alice.yuan@nxp.com>

Add MEDIA_BUS_FMT_YUYV8_1X16 to the list of supported bus formats.

The format uses the same CSI-2 YUV422 8-bit data type and 16-bit
parallel bus width as MEDIA_BUS_FMT_UYVY8_1X16, but with a different
component ordering. Supporting YUYV allows sensors and bridge devices
that output YUYV formatted YUV422 data to be used with the i.MX MIPI
CSIS driver without requiring format conversion.

Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 5f9691d76434..14a00b9fcedf 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -382,6 +382,11 @@ static const struct csis_pix_format mipi_csis_formats[] = {
 		.output = MEDIA_BUS_FMT_UYVY8_1X16,
 		.data_type = MIPI_CSI2_DT_YUV422_8B,
 		.width = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.output = MEDIA_BUS_FMT_YUYV8_1X16,
+		.data_type = MIPI_CSI2_DT_YUV422_8B,
+		.width = 16,
 	},
 	/* RGB formats. */
 	{

---
base-commit: b38d06ad1e13c32970d58039c154f009b81a3368
change-id: 20261009-csis_sam-c5c10ed12322

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>

