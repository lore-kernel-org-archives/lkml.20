Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793641708;
	b=E2Yu6InGss9V7m2xemwwvVQHy3sT0mn8zcNu5uBD+dfOGfCGZ42z5WhzBTDWJZguDO5X
	 N2wjYBXl2NIqXmpPFctHyk+P9VSvP60tIF2KofEVZZSCyyOU7ODcbatMx9Rmz1iU3MQXZ
	 0LYw5zuINkpi34Qrth7w5i1nF+A/+xSIVLa0IrOiuEd8aEgLY0RT+9v1ItEA8+PgG4emO
	 5dD8f0Wpb9JML7FJ15DNkcENiyE4SB8AGYWnl9vU6lSTrevLA+zYEJToQ1qhHa4falJyd
	 h9Rf38nBYQz8PBDU7hQlefeTHBhtO+XXYZhN51OlC34R4ja2HD1o/3qRIqhZS/d58hA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641708;
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
	bh=PstZe+SfkK5+z4bFvYPFVUbPmODpBytmvMWUC6jemnM=;
	b=LOjw8dme64eXx/3qiAx2EWdXnJP99xWTL/ArUTZ0PAh9/fXmQUl9yC237EBRMLbvoYlJ
	 yEBu7ajnNWbyv2BzXucvoJOBCiRQ79R0zrAzDtRxACUTBUu1b7kLcGC7vTdgriVhZBmjc
	 l3O+v1n2WNndgZGKfN37kDm2vu3/zkMsE99EknoGqxNvKoLIGSiQCvcsksECinQdm82HK
	 vH/dWJqMl0Q/pXnk4iTKjYEZmgyGEjcwKXW5ifAF6ZO+8TIKz012x3i585esznV7WxsIA
	 rnGWwn05LkipV8UoNpc3wNgHdp/WJ7q3iaJFEJEcvsaCzLonAdgU2kHn/ipx1SrKvQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ptsb4HA+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.19
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012019.outbound.protection.outlook.com [52.101.66.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C4A606A330;
	Mon,  2 Nov 2026 17:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7C4A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ptsb4HA+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tx6d8PtTk+O6Zy0ezxZj9SHyz2OoUsCxj3zVSVo5Nnr050tBsx58Y5g+Umoa+O4w0sKp4flsUDugLWKNDb/qOw+MDXPEnzDmXMdDj3AbuhZtMgoZ6sFiLnmzdHRDvZqTtVufJYNuuYQjCjq8yYWE6pN8F2RxmVhMKi+FpDIQ1aUoyFm89eJ0XshVXoeR7ld/beVaz+FsUO6kut+1VO2ZI0xWADcy+nn3x1nML1DRXvuEXBsZmzCf2a/Kv771w4okH6VmgHHB5IlZ02URVcHCyfidoo37bH1XKnWKRcy0713dklO/h+pbFPd4po7Hop3DwYYUKqx/BawTxEafYwcUAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PstZe+SfkK5+z4bFvYPFVUbPmODpBytmvMWUC6jemnM=;
 b=VQzq35/kTQGvsa8SU7gCp1xpcNj2Hwo0L/To2dJ+o1l4UeB1RM7k2zYvKGSIVAEBpddEbl5dZT3zizJYT00oKEThgaNRWHDuNJJ2atwR7UxKxPHD0AnL5X6hg+dmq1TMSh2iCFn2WOWSHqTW1jOBCPtqZaDV6+AZXY0EqSwbGBP8l3hhrCf3YULBieD7xYmC0akgM+4iJce/JeBaK8MR4Py5EbN2y8gL1foWdVeuzybrBQubKWCYk+Mw97jhP+UnIj8B6gfeotNQWKT5loOEy7fq/L9rIs1c2jwcXas+eXWM6vaLB2+g9AFffZKgN21c2vkGP8LwGFEPnEuKQ6wafA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PstZe+SfkK5+z4bFvYPFVUbPmODpBytmvMWUC6jemnM=;
 b=ptsb4HA+CaN6eSs6bYoDtjlumfybf3tH4JpQwwMTHqA7NlonSz5K6Ni76asw3/5+fiwT3Vv/Ya67bsevkOSkNahiy7u4FwoqIdtdo017KeFNoyyYOxeTmEDCL58k5u+fwrFRoc/foCCGbRwLUaW4a3R80OMqExVdoLw5gB4C2VuyHOLOeXm5XTPZPZTrdwocFk4PvBXb3jIJPXQkILfnMxQhXYa5L+hclEa9AwjUK8f2GAFjxS8V37MEylKG9zU9HlhXNG4OVYuU6s/oFXC8plN6henaVhURgFc84XA3/Gw6U7ohfctRuAAKVnlE8EnWjQKH0elzReCd6aJeJ+Z8+Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB7495.eurprd04.prod.outlook.com (2603:10a6:20b:295::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 17:48:24 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 17:48:24 +0000
From: Frank.Li@oss.nxp.com
To: Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-sound@vger.kernel.org (open list:SERIAL LOW-POWER INTER-CHIP MEDIA BUS (SLIMbus)),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	vkoul@kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/1] slimbus: use dmaengine_desc_set_callback()
Date: Mon,  2 Nov 2026 12:48:17 -0500
Message-ID: <20261102174818.3941639-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR07CA0102.namprd07.prod.outlook.com
 (2603:10b6:5:337::35) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bd1bdd0-acdf-457c-1bda-08df39097e61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|19092799006|56012099006|261021123027099003|261021121427099003|11063799006|261009223027099003|10067099003|261102123227099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	i+3S9c7Kxyit+09ZCc7xG3Wm7SyyKtd0+Ae8CZ5olRJ/DUOb3zup3SPJWnNHp9A/YmJ/Vj3Zmj3Swe1zxHds3rWtHOr15xDYCEG3BHCcsfuMdSaKcPlgURXHSkBs1yCPiQx3qOy9YmpxC3m3ni+qq1eSICTYRJdBJbH/1o33HCDqB4cK0leLMi35WHhcAPJ56L7X996SgRV6g1s5kfjnK/r2RcJRKCoFNSWX6MAlWb0XDm6vB+UlUQQIy1QyNivxrTu9vn9bgTJAREKrqMWv1cDJmmwirrvp3KCLIOKvkAHoWFgRLxvpeG84TifW+SzW5iMqG8c3otfwPhLeHG9AG8pX4Hni5VWQ/Khf8PVESbGlxwnMRG1/nSb43JF2ZXQjTeUrpCnh1w4aVSFaN4GG8IZ5islDiILHasJDf8cYfMiKl0iuIjs4vY7Zeao8ptRYKEHBr6YmP2jcEB3DUsIP297J5RiN2cwfDPplB5Gt7JbQBf+bpG/ZAbWVIU7jGdwGFqEX+zVzVT46tK26KYHlesMIbBIhZ1qSbCoM2ZKv0PIcbYS2elqF5h7XG0Ic+Ys1JpPNhgQmBD+h3ryYEufy/a/3dPb4EEo6+pN9UZhMyyHRtKhyhYoGzOwF2nusRXwsUkTZixMeLxtNngZu3GWdHHfp7guclg7L6nPaoNxFGY0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(19092799006)(56012099006)(261021123027099003)(261021121427099003)(11063799006)(261009223027099003)(10067099003)(261102123227099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DSCdKJx5duqGfWaLRDRbOt+Xh148bZZhscErxdBHFKfdhcxwkZiu3zwaR/hY?=
 =?us-ascii?Q?xn8RcH++UzeosH4QfrXN9ftkYl4ShLWYc+tb1UiKi/g+VopmAxpAyb5a5yVK?=
 =?us-ascii?Q?fr7vxxKEc8yqHhYg8AD2RXJ+F2fg2PZswqu1HlZ+N4K2ThBRC/dQkagAUV0u?=
 =?us-ascii?Q?u1qGlCxLhOLg13JkyfSh5qw6Wdj0Uy8cIV5RdeY3ScKvwpQUXplhUPD+ApMJ?=
 =?us-ascii?Q?LZMBtwtGwozB7IQQcacddAX1aztB38x+NcZ6JHXtb6HHxUimdBKSaafd7Zol?=
 =?us-ascii?Q?woe7AJKkLxKFjFc4beCwmm2sqxfdDR/8Q0zpESDR8lruiF72cSaNn9gUzWDl?=
 =?us-ascii?Q?CAtOPBwT9JqQ0LPdyu8wgmtbP4cXqzizL0QRmecdQmOLqn7YfSDb9uMMmbAR?=
 =?us-ascii?Q?zbwOO5ND0QsANzmRtSDJ4dpmzn0bcqQ4kFNQELdpW84XRgsx67R/TPBP44uk?=
 =?us-ascii?Q?2VSzMZrhABSVV8SGwBfYf2L+GgV97aZVKjkxV5r2fqoywIpweZFhTwYiz3FX?=
 =?us-ascii?Q?sa2QUX/b19hQ3kVmueJ26Y0Iw6vMPtrLJwxNI9NKvjgf7qOFSTyWeUKiFSyD?=
 =?us-ascii?Q?C439bASvfvGfgbjQnWy/3oOBM8AKo1IiYbNptCA/dcxmcVns2PdfgQ7FEYxy?=
 =?us-ascii?Q?QmutEuVZhT0p9LO012WiRttPLuPtkE5dnq/cQdOIXlUkkjv5MmNUGwVn8PJf?=
 =?us-ascii?Q?kT+UomoOCi6CytGnA4rWRH0DTdjN+Z8W/Ao5xTf4NtPWQprmZDTrKS+Vx6vB?=
 =?us-ascii?Q?ihaiZpW9IhLRWc8EvQMRcJdcPX7SevDMO5ilhVvNqHYJjFB+CVWaBaEBokOW?=
 =?us-ascii?Q?TW6tT7DroAjR7UAMagVPbpuIejCQXjjJsmPRKu3yiIEK34lNhAGL3kcYVgnV?=
 =?us-ascii?Q?J6LsKVhe07bZQ/PLUkICqOuHVNrzIhRGoivPdyMa75WP3v92OcpwcjIv4N5R?=
 =?us-ascii?Q?UrUpFk/5V+HfzO9nIEfodzLl+R8bu+w066ST1EHOm1PegK5zkeL6pbzAdX/1?=
 =?us-ascii?Q?DBmD3safGT4PqW4ASwPTTlIUkzqhqkCbFeMNa96YRJzCT5JODyjwZ2RMHL/N?=
 =?us-ascii?Q?MrNLWI1++r9Fu6ijWchKBh5E8UcePdR4g//Ee+v3fvBYjxOcsgP1DkEDhJUA?=
 =?us-ascii?Q?ZB0cpM7VBp3lb9vdhwKzibpNdmcAM1nZ1TO898Cvbg3BkghLd7NaARxio/ap?=
 =?us-ascii?Q?XTH0yb3zmQJ0/dvKYMtDaox6uxt9BxYy6GOxh9uA3C/3fKatkz3pnK1aLYwd?=
 =?us-ascii?Q?8YjNOmuRlbQIaGKndkRFgKpEkElk6vDOLSW9GeCv9QGyV/im0olaQJ9zEA2W?=
 =?us-ascii?Q?0Du3EQUVOv2/c7kNUYLpt7LmFIOV2kmiQkc4LN5SowFO3naMxpSodYuzy5Z9?=
 =?us-ascii?Q?42CA760RvyUAi326pRj3SdCvDsYdgVFRphlfNLiuL0Fme5STf40cUISQVxQa?=
 =?us-ascii?Q?84nSG4vK7TC/EG2yOQFyzi4PouVzK9xckRi9/7BVH4vqqlQhxVshs80MxPOd?=
 =?us-ascii?Q?DVBDl/Hsf8rrUBdkeNjENfaAeJOrQ9f5ZTHqGsbcEhDzNcVru6Uzb4dpY6Gq?=
 =?us-ascii?Q?bmiXl0J5Q3iaMneosWswHMpVbA3I03fjAUaczneEJS+Ya/M4iWxnanoiEKNA?=
 =?us-ascii?Q?kSI9H+f5KlMyvb4OwsVO9BtoEawVJlh+3gl8muIKLJ31TFSFd+leJQLCxmGA?=
 =?us-ascii?Q?SlIZEIVir63QI1wNILNAj/5+d76tpH/tlXGRz24V71YyeBgYqkhixrThLa+v?=
 =?us-ascii?Q?E/IiT4TBwNMGDYuNJeIr7h93DCUxdxkDS32TzwXVjksBZxxCGvq+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd1bdd0-acdf-457c-1bda-08df39097e61
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 17:48:24.9380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnjzfq94Pr19DcRE8fOLGHtdtuARZjMFfFEwLBpnP3LXSKHLfKFiRg+nq/QtHQXMleCaP2kJfo/bxxhdRKi8lYpBSpdW5Gj1/CW31XqGaZFBhXiGQCOKp1qk4PtJO38K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7495

From: Frank Li <Frank.Li@nxp.com>

Replace open-coded assignments to callback and callback_param fields
of struct dma_async_tx_descriptor with calls to the
dmaengine_desc_set_callback() helper.

No functional change intended. Prepare make to struct
dma_async_tx_descriptor private to the DMA engine.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index eb983b6d1815f..539c8a6493969 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -595,8 +595,7 @@ static int qcom_slim_ngd_tx_msg_post(struct qcom_slim_ngd_ctrl *ctrl,
 		return -EINVAL;
 	}
 
-	desc->desc->callback = qcom_slim_ngd_tx_msg_dma_cb;
-	desc->desc->callback_param = desc;
+	dmaengine_desc_set_callback(desc->desc, qcom_slim_ngd_tx_msg_dma_cb, NULL, desc);
 	desc->desc->cookie = dmaengine_submit(desc->desc);
 	dma_async_issue_pending(ctrl->dma_tx_channel);
 	spin_unlock_irqrestore(&ctrl->tx_buf_lock, flags);
@@ -642,8 +641,7 @@ static void qcom_slim_ngd_rx_msgq_cb(void *args)
 		return;
 	}
 
-	desc->desc->callback = qcom_slim_ngd_rx_msgq_cb;
-	desc->desc->callback_param = desc;
+	dmaengine_desc_set_callback(desc->desc, qcom_slim_ngd_rx_msgq_cb, NULL, desc);
 	desc->desc->cookie = dmaengine_submit(desc->desc);
 	dma_async_issue_pending(ctrl->dma_rx_channel);
 }
@@ -667,8 +665,7 @@ static int qcom_slim_ngd_post_rx_msgq(struct qcom_slim_ngd_ctrl *ctrl)
 			return -EINVAL;
 		}
 
-		desc->desc->callback = qcom_slim_ngd_rx_msgq_cb;
-		desc->desc->callback_param = desc;
+		dmaengine_desc_set_callback(desc->desc, qcom_slim_ngd_rx_msgq_cb, NULL, desc);
 		desc->desc->cookie = dmaengine_submit(desc->desc);
 	}
 	dma_async_issue_pending(ctrl->dma_rx_channel);
-- 
2.43.0

