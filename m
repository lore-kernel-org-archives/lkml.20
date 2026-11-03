Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793743552;
	b=s8rr/cG/iF/wGO1GyqX1vdGIAdmOu8GIzipxPia1DurrzRx9biSXeTGD0N66BPh7wAFe
	 NsoN3hePMJ/bu9s70XQgczVRQJS8uR+oQ8b5/FphcPrYJPmy+NVCrNCdntDtcXTxCXwEP
	 tdY9ynpTwy9Dh3/B2E3E3X28Ja0j0hCrbx1kibi+kB3crLRNS67qvp1s/ePT7F3uFQhkr
	 /T5C/1XaWxxa6HYaJcwVS4gE+ff0J1uUtEXN9LKdBO68SixldWidnZuPemRUcgTkFrB9C
	 qlzcois/lUpLv56C/klKYZ5sAVX6ros2S1lfdBTqxNvZwrKPXozA5VKFyONI1wKKsXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743552;
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
	bh=FBclK2Ex5cQWLX5qfo8rtyRvjOLKBMUrFUzeK5IREi4=;
	b=manjfvQFr3LVnYRsWeQWg/biyzDI1yvvrLKXELDgUXjUjwhtVJBL7TyfMDf/Vu4MkUst
	 IsBicizlniXb1e24Q0dYqY0rqmf1CcFuq+6W4jiyr7JXrXdB9vUuorPQm7os81q/9Oww2
	 12wl1FHImdI8o1L8J5w/Suy+wNbrCOo8BOVlWN0alploBffQJuPXxB/64cyynoBbTQpTj
	 tVLmypGKt4xE4m+gSn/LZwL5jMlodAbstOoKZj89UgMOELt8RzLjwK36+bj9USBBXR8Yd
	 67ZSfV7bxv3sKMta56Wgn7UCimme4ge523cZPoIc5bvQz2Xx0x73MdeRPmiY6VeIgAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SMJpJwJN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.36
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011036.outbound.protection.outlook.com [52.101.65.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4840E606D815;
	Tue,  3 Nov 2026 22:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4840E606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SMJpJwJN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCnBiAvWqDOF6IF00kdQMKackgm/bgJHtjEWIRBZmWT1Pf+50Fm8jXUJTY2mAxpF6TC4eHYVt8ly6Vf8qdzA3MWBSRTPjKJvRdwOddnz5pNgI+T6I2hawNk8RbBmNltgYFCIwKqwI3x4bXQA5o9XgoXrjOkWHe4O5KV5eee/CxYlaen2aigY4pyqhz612mCPibFxtY6rXtQK6N8UWXljJOFAX0sGvxyXwKvKf1cQg8HR+54kQnQ3vHaE0iWb2azpnX87ffH/0hlJ8F73/+mw5n5+g/3MEGCUNxBI1sKT9jUNFia1e+wCy6h77H3peOAXTPQqDx/FPWsg6Qhsr3usSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBclK2Ex5cQWLX5qfo8rtyRvjOLKBMUrFUzeK5IREi4=;
 b=jGemY90MjCH/rr7TKmZogepbMBeGJNn1+ATdfXl70ygxt3ZWU/WUUlLsOPdR73jdHNKeUJERfxGRz6wA7yrAVF0oOPYMu4EZUWOrHA4yS5z8kIk6b5Dt0D/otSjSw828SugdzwVtGdlBO2LsENz2ESoighTUND/V3GQIL9L1krpp13Uk8PuXL2r1pdd8F84P+zrDB4lKpFyO3j4DweH6TlxbreVuLiGHht+BDPIqxxKxcAAitnaEV9wBpw7qI6q4uml3IpWM/fX2GHLFzSlzTx/qqxAqA1657IBq2gHNqJTraCO2OQNngCOGAcmqlep4Ct3H1/QGs00n+fYkcSVV+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBclK2Ex5cQWLX5qfo8rtyRvjOLKBMUrFUzeK5IREi4=;
 b=SMJpJwJNpap9hVrUsdX9z2WQcfiDllAF4pLFHZiM/XxBCbUFPy79uR0tlTC883+bXyMN8xtCBSUBh0bySK9kL3Y2bNqzxH4keEsYRKjMD6bSmD7UthAghpwg5mxXHiZmSNot+7FLmg5w4XCJdffPXVn9uF4cqs9MfhQyH5qPcF2ci9VrT43FJuOZjYjlXZ88cKEO4KT1GPCU9Lx8fgVhGSqxaq9Di6I4rca9cVenMSArltrOukZEift31CVBKwVfp1PVjt4GiszOfgD/l++VnhB5pjM2/KX+WWKV65MEEezU/3alwJPgGyxi934ag58P8IWhSwGB8XjbMDgIOlwXYg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PR04MB8129.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 22:05:49 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 22:05:48 +0000
From: Frank.Li@oss.nxp.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	vkoul@kernel.org
Subject: [PATCH v2 1/1] usb: renesas_usbhs: use dmaengine_get_dma_device() instead of chan->device->dev
Date: Tue,  3 Nov 2026 17:05:34 -0500
Message-ID: <20261103220538.1836027-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR21CA0021.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PR04MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: 710767fe-1c9f-443b-3bb3-08df39f69dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|19092799006|366016|261102123227099003|261021121427099003|56012099006|261022105027099003|11063799006|261028144727099003|261009223027099003|261021123027099003|261026140227099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	lvYqJAhn66AnFvOnIPI5f3787PhcGpWwVaXkY78qg2NhFkCwcq5RQr0+Yha89nTLE+O2yZMeB4nTZr0sgYPcCFIsNe+0RJVXnBxuSRTHJ4aYha61gfWx50T4a2J3Qc+H2LKbEvbYW7lslZkiyBrNFBilhaXDiMpwcItsPHXcrdQaL3aqocCamIKln6XeyNpwqlS98pESL7kZwUAXXDSWcPKZUJQCy8tZ+rJrhJ3+VpEOKsZ+CmSt6PKsLp4/wPGgbPnYfgsx/IgUxv7sJpAYBEtZud6KYVgrntQ+1WUSMQXiKnbUqbDf33iw2YN19Str5lyxRMafu9B5J7Lv9jBTBpC7NW08qJWMXKT5d9/SPpoWBSjbt0xv4G91MsHEDUKj3nziAjQQGaYY/STwpjDfKBZhp2pHfnNlrn7wH/2JpATSRpleOz8+zxtrm0VeD5ikoR8Ldfm3mnEEenbFTl3y+sfePBMWB2tW7+gS/4E0b2L+yDfZoWSElp4GY6cZJM7/JRCLpCosgtihbY57Ue6T2ZJiMoJnY6BOeCGmKthrm/yhBDq5GiHM6Qdgv4NkAJfa+q42imx0OsP0x14rdHYlKdWXY86D1o00apTpVbFspHCWl4QtZrhvIUEbeTqmKWEI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(19092799006)(366016)(261102123227099003)(261021121427099003)(56012099006)(261022105027099003)(11063799006)(261028144727099003)(261009223027099003)(261021123027099003)(261026140227099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PXejkXQaqLIRXYAuZBb6hIkkMIfA7ViMs6hCsUCDkWQv8xkCs6s1UAf0GKAm?=
 =?us-ascii?Q?oRRdKWxXp30GmJIM1h/GkOkktsAvKSMhld2XH4KO/ysSokQIHgmMjMs8+q2j?=
 =?us-ascii?Q?c85Oot+T4R2KpQ5D1ElKBEgweFprERw4OPTl0Mef8THCjywqKsrJo7WwnegY?=
 =?us-ascii?Q?wGGK8j/v67wDkHPJ+Z7HJqzNLEMTwp/D5COy9jeDcMdMDoqWKp6wfScuBs6F?=
 =?us-ascii?Q?MKqONSgNAbLi6sdRJnI1ZnB21QrM7NIGVPQOf0TZRpcm9FW0DN2EmzxtcZUM?=
 =?us-ascii?Q?3970cK9v+ZWX2NSHB8ZXcjT1uxI7UAvfbTGqiWXVhEtXAeMQjOqrmcLizBqY?=
 =?us-ascii?Q?d6BLywxJWho8o+3o9D9vzpqXh/CIE1z/noayhH7KFzFoTvrOVsRQsOWKpuZw?=
 =?us-ascii?Q?1khnSSUt6tm1P4L75JrlyEZjfga5S3GyvRP3jUqDKeFHap7Sw27bqoPCZFcb?=
 =?us-ascii?Q?F/R19DDzTek80oB1tuJzkMPu6QdpSDgUIZ6efOn5NpZeH71+OLke3ZSzXBQF?=
 =?us-ascii?Q?sE27NRwnx2xMfix8Z7Z8IbMF3+YtobstarGau8ld4rk6hLBxhII01kjBdhQH?=
 =?us-ascii?Q?j+UUjriZI44AarilkJWg49xWFcLfrjLJQJFb7ng2PXIyVBtuO0VqCA2tRRy/?=
 =?us-ascii?Q?PC70wSdmd0z0ugb4FoU8o556CkViwEga7WwSI4/T+lOaxaUgXCgE3cy4R7ee?=
 =?us-ascii?Q?AVGbLguX3xXi77dQc5xCLybdHv9SPDIlHtzvywioR3L15QN9Ae+KMuZUkr+b?=
 =?us-ascii?Q?/E8vzhdL/FK0UsVUgXcZ6M7xXpLO3+gxg00zGMEIgWhU6obuK5Pm+dBoyH4L?=
 =?us-ascii?Q?L6us3G4DQQETMj1X0Y6cGQpduxorCz+oqCjfI1Fg2hkNRR6Zi6rQZou5CHjh?=
 =?us-ascii?Q?dt1T0w9etbkaW+VTyhYP36hub/xPIqOeZhL0gkdRYSexk8DPVt/6TdcVyFGe?=
 =?us-ascii?Q?kfWmylM1iplnSncRbmJmPuoEf8sfMhaC93xc2mrLbY0T35BLXbhc3joLELlT?=
 =?us-ascii?Q?ANs5xLXk9s5SzG1ro+gpzXugN++TJJ6DtCZ7mAk1fKden7Y0V2qF0L9bSZUV?=
 =?us-ascii?Q?KtwvuElpOFbkxYeZ4fxCRWeuA/smsO2NQ34K4CHUde4qlvIukGYMjE8FfR2Y?=
 =?us-ascii?Q?ctG4WdxP5WhskayZrJIsLZLMiaXj43HuN+UftCDDHVoyYvg1lgxDZEsKQE/4?=
 =?us-ascii?Q?6GZEJQP1BUbr9A7HzxghpeLX+tXB3BA7i9hx3U2bIGEfc/BT/E3OKzxse8FQ?=
 =?us-ascii?Q?6pRPiXdtdZyQ90x9W4iuIx30O3qQveRira+mAp43EUksPIwwOJj9q7K3SzeP?=
 =?us-ascii?Q?SLWSRJ06syAq7jVf8HFvXuUWPAu+v/9adQPLc2qp/pUMrfGjZyvUeCJMp/b+?=
 =?us-ascii?Q?PkQ9SdgbjS+5WTbRCP6HrejPRvb/zaIOC1XlDw5e9XMd6+YaDr6QsT4o0CyP?=
 =?us-ascii?Q?FgVN5vBB/HYfEWq9Ak/59+rAFUX9mSgEc3xsDjRfXV8Uxsbz4ds5FxhWHzrr?=
 =?us-ascii?Q?PHn6qSVbo5TOVkVPERxA6/coo2RW1JwADmvzMCepjQY1Pt3XGxG9VFeX5aaF?=
 =?us-ascii?Q?+03KIar2aCyxWoPhQKNxNzDUHxAVWyt1ZoX4aK0N7TXVel6Sk2l8v7+Q8AG3?=
 =?us-ascii?Q?YPgLRl1lXnOg9M0amHidEMsVvy8hGTWtVo0k45FbNNZ2do4mIa1aEn7f2sd/?=
 =?us-ascii?Q?NtKBkpjv64OgCpYLm1K8WNbrxp8TrkYsdnF3Oth1RCeDT1FDsFcO7AMYZfQS?=
 =?us-ascii?Q?VZOoRuO4zWhV5U41A2Hfxo0yGyErmh46fQN+q2+NaDUy3t8tcWb3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 710767fe-1c9f-443b-3bb3-08df39f69dd9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 22:05:48.4889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExjdXjSxwkHFNTRjHhye5rb3TO9gPN/gyKx2VX0NnHvaZ2gWIXveVnRJmFWWg1oX9WhG7RLn2Ps4FtJezJLeluAWE3u1PwGHdLZzaSf9+wV1HRgY3jIiho65HdwrN1oI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8129

From: Frank Li <Frank.Li@nxp.com>

Replace direct dma_chan::device::dev access with the proper
dmaengine_get_dma_device() for consumer API.

chan->device->dev is not always the device used for DMA mapping.
Some DMA engines support per-channel IOMMU mappings, so different
channels may use different DMA devices.  dmaengine_get_dma_device()
returns the correct device for each channel.

This also prepares for making the DMA engine provider data structures
private. DMA consumers should not access DMA engine internals directly.

Assisted-by: LLM
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- Update subject
- v1 https://lore.kernel.org/all/20260917205625.1299375-1-Frank.Li@oss.nxp.com/
---
 drivers/usb/renesas_usbhs/fifo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index bac6f8fd0055e..d6fa436112aba 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -810,7 +810,7 @@ static int __usbhsf_dma_map_ctrl(struct usbhs_pkt *pkt, int map)
 	struct usbhs_fifo *fifo = usbhs_pipe_to_fifo(pipe);
 	struct dma_chan *chan = usbhsf_dma_chan_get(fifo, pkt);
 
-	return info->dma_map_ctrl(chan->device->dev, pkt, map);
+	return info->dma_map_ctrl(dmaengine_get_dma_device(chan), pkt, map);
 }
 
 static void usbhsf_dma_complete(void *arg,
-- 
2.43.0

