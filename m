Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793648860;
	b=MFxWh6f+lggm0R2pwsYQzMjVweZ+gGBZkA7rXesa49fjg5HpGOMG6Ei2yrfdf0luAFv9
	 Z8QIFUQs2OFrMJcuXBPhofb2ZiJ7bY6IhKPnCoP2Bk77KisOB9bDs4ELrUFPtomN3p51g
	 GLmP47sT2ZsgrNfbQktXNhlxjbhMmaE0FhvMpnSCdoO8wNscbJY+p+PyPgXivDcUBmN1G
	 hacDVUammIReJRomMbLouSbF9xwTu+dnYfwA4fb5hG0VXR4c38VWYHEKJyiJjz5m7/1bb
	 EdmHz2/T/GDRYaY/JY56w4tDDKSfWgO65mccsqEqlEHdp8wK+wK2k2m20vjiF4wpT5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648860;
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
	bh=zhKRHE3J8yQLz2ms/720PgxA0rIu384D2V8tg+71V+c=;
	b=Mjpm9gMvhm5J67LDAArDWKBCY0dk+VuTll25vOru9CZLEvm3yzFqN8OAOF+fGlQtzJUK
	 fbHRMQUIZ9XTTCfpATH+8xCoqAwODQ14Oowl3jjBcOuHk8JpdGhPWHxwk032b41rXDieE
	 j4/VJWvxDplZ4WVlb2P1AqVX/6JXH8ih8MdWDRptrW71KjXNxMDZSS3mfQrx5m3d2AR59
	 eG63KQ6ZfNX7okKoOb1gtAXfk39jGzlP7ZBDxtikyGlEEXYQjwcpnOYI/ArCajNXYGa51
	 Ey5T1u5kd1KZkIt93LCmY8DNw3+3d/8GqCv9RhU2cGi/tafRUKJ5da4qnHabIU3vLYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xeTA4wDL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.60
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013060.outbound.protection.outlook.com [52.101.72.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72B5606A32E;
	Mon,  2 Nov 2026 19:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D72B5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xeTA4wDL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f8ip/Dbagyo+QNvEaQ+9/J/UsAmNjniNZJ98LCArsocGnu6+b/xLcALQ3UxjAV+zdief4KMmh8Ove+DG4UjWcS3QN73wWYTy5jtmFJYOpU5LPlmce/bEj5U/7g5w6WxC4zsu9zbKrxSF1tSdVhl75APHyGkGGLa5Tr859h+xeg8hSm6Pz+1tLm6u/gxjY9LRm9SxEg65DkGNGw398joW/bgVILONVkwOyLs4WhgLKsPlzYNjjdQOYJAoCkfTzQF1PKVwq8PyJZts0Y5aQTe/A0URiCUlNFAjOn8fb4XGkMD6T+uhJJXa0nTDsUArla00lPoPkB6Wjc8ctm6iSby1tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhKRHE3J8yQLz2ms/720PgxA0rIu384D2V8tg+71V+c=;
 b=admsag6fz2afCd+FugmAlP24GtWUvy9CFaswSDmg5whX8q6YWWZhVkpVT9JqUaFm/0lCZeEsOB8I8AFSflcQjFClfMY+p1We1GVW8bLPgNxqeVNrp/skiljbdiFjSPNyMrBJpSB4y5TA+itbootj1TeR6bF/tvO64aFpiGXKKYCRVGnqHikbE5vEnrwdjR8vygRi/fU3UzW1stXeFMLkhdb0FEDnZs+INYOHuHZxoVPLOgW6RXw0AOghLVezQduHJIQjxn180GjiHIeoge2Gq/SPS+4EhrYAiiJXZJlN6hE3+g7tt3ojj5TqwXFCqDHg4FSCM8tBW9eRrL0HEuMQlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhKRHE3J8yQLz2ms/720PgxA0rIu384D2V8tg+71V+c=;
 b=xeTA4wDLnTz6QZcXayW//IrfymwuRQb/WrxM0jnXFpmtUbLhUADbdckCinu3gj3TKNILnz67xZq2ECeEScRdJ/T53LnScJN2TkOKLgXkE6odyme+KaD4ntEeQxdFg+/8MjjM+IS2DHgulz7iW8Tk4BtDviCULlm3e0xq/kXG6f4+I5Gn2V96ok2WrYlwqmSSLjHP9mmb4pktDExhf2TjUu/lrObKcJ+n0F4i3B1drDIcQ9923Ryj2ExGtuXRB7t6/ixNoX7IezUApTDopWbiq+SIIY1Wj9UlVLiVbMdiZVgcRuX+wadWLKJNRqTJDl7Au+ykNWef2c7bZvtQhIbkWQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB9282.eurprd04.prod.outlook.com (2603:10a6:10:36e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 19:47:36 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 19:47:36 +0000
From: Frank.Li@oss.nxp.com
To: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jai Luthra <jai.luthra@linux.dev>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Vinod Koul <vkoul@kernel.org>,
	Xu Rao <raoxu@uniontech.com>,
	linux-media@vger.kernel.org (open list:DIGITEQ AUTOMOTIVE MGB4 V4L2 DRIVER),
	linux-kernel@vger.kernel.org (open list),
	linux-renesas-soc@vger.kernel.org (open list:MEDIA DRIVERS FOR RENESAS - DRIF),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 2/3] media: use dmaengine_desc_set_callback()
Date: Mon,  2 Nov 2026 14:46:49 -0500
Message-ID: <20261102194700.4076807-2-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102194700.4076807-1-Frank.Li@oss.nxp.com>
References: <20261102194700.4076807-1-Frank.Li@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS1PR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:8:456::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB9282:EE_
X-MS-Office365-Filtering-Correlation-Id: af369119-c828-43e2-987b-08df391a253c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|7416014|1800799024|376014|261021123027099003|261021121427099003|261022105027099003|261009223027099003|921020|261026140227099003|261028144727099003|261026121527099003|11063799006|10067099003|56012099006|22082099003|261102123227099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	s5OafeUHaMNfJBup5xaIx+xvPRYk2cdYs+rXrGCQuTQ7Vzh30vToWfpK5ANWWzxe3Rr9loT6/1RmNNv61TmM58iWRLj/+0aFjttHYEaG+fvA4xzOofX8Xtl2x8SXiJ3dmKRgk2jWJQqmY7AOFTuwN/PJkprLm8NTVTViXJx2erw7VLaukExeuLDCpb24zIJEjQn1Xzmv2H7pkyjDArMywz/Wwk2EiaBz8bk1BjgAxXs+HKhPEBFoLvTTwKSb9q5iyA1aX+m97FNHjW9YCKKKOTRSUaF6LeI8zaXkGyI0mYrLs2EqY7kudBF7gaFSSKE5yiOdaFhsqFt4GV5QynQvYLvpYrVXHtGXCp5Kr+5AyYyOxZRy9//vUSiNse+vBUQz9tlYQ6ejGy3lVgYgARnS6vUKyqB1SLyC8FBYsPGhfjo+wKvtTTJDzyRRrOpCAw0mVHavAyjl+kHhSuXpz1Wte7orv5Dn0EBkZhtpF9Bgw7BXxEnNa1IixAnpoQ9MLaHH8RvhmKbXwi+EOMBpocwxIV5/lMXfXsPQdMXRvlRr06w4f5P3JKnFe1c4w4uCklyu+eGqwt1l12oRPUQD0UxrU+LV0z9CwgWsBik6+iXTsYSKQQLOHIPCxCthpJA3smjt9mzDhM0HtqPIPHf4+WE4AOo1wjDm21EQ4ULh4Df4K8kx0Gy2ts+x2+F9DXuxoVEGqbPvMZdlbVri/z321wGRWw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(7416014)(1800799024)(376014)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(921020)(261026140227099003)(261028144727099003)(261026121527099003)(11063799006)(10067099003)(56012099006)(22082099003)(261102123227099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ok2d91mJTxA52W1nqtnM6vF3NP22mnUzwFVIAy1KxDm/QOXSXJcUxBn3CO4F?=
 =?us-ascii?Q?CUVSZ76slcCKhzT1Jrbu13OGmkFFsuxKXD0Hq45HaSmSC0jmE2lU9QPKbSc5?=
 =?us-ascii?Q?xTWSPKEAqrkoo3q1Rij0JXRd95TZ9QaT84kM0lgQZdqULsmR+/pRPbmBp2p0?=
 =?us-ascii?Q?SQ0LXDii5HwoEWOFfVY2hep4t+b0NbCt4Xdq2n4wil23+QadMIGpmzxUfptI?=
 =?us-ascii?Q?z1eo4qzP6VbBMlZlPNKp+BUzDrJZiYsvkW+SrgHqc2opEw0csOWcpqvHT5Xm?=
 =?us-ascii?Q?w9PNeWTM9m/JBYMndM090CjW2htEcgHtK/YKGma2v2bkHlFTHllhquCCfU3K?=
 =?us-ascii?Q?RGGYJMO0GVfUdMWPVcl7tvzTOgSU6rKdu6FHsWNKG46EnPU16d642PSyScdd?=
 =?us-ascii?Q?rP51CxdStWQ4xE+edOGCqFjmW4M4+Mg3uaWGJw8G3gdT8h8XrBesEHocOff5?=
 =?us-ascii?Q?E90G5cTxDs9aE76k+rF8Vi6RtSSmESoM4rheBfUjAIW1xAlZ6OrufdHNdP7w?=
 =?us-ascii?Q?6bRxYk/AbNAypJQ3Dk4dxhg/efk40PfLfUgjRZZjJrtAkq60QCmGS1HHzZ0w?=
 =?us-ascii?Q?Au0c5C3FU6fkFmWVfsxqZ5q3SAkAtC3Atws2TxzklxzC9kZSFu9hlE2XTrY0?=
 =?us-ascii?Q?oTalyzSSZ2UvblSEMAQfcivud5B53r7wH4JC2EDh4tYnscc3nDmw7XnezSlG?=
 =?us-ascii?Q?LzRdqI9plc9BFffInfb+eIslv5gV0i1aWZrqGGrAOyI4CzzZK8gP846nc7gP?=
 =?us-ascii?Q?cBiJC2S3ReyCmG0vfUZupjEiOBIvYuMCmNXi8RtKu5CvPXMJmTTIJTUJCPgi?=
 =?us-ascii?Q?FHtcPi3nPFv8OSNlb1YpC4gi+TEdrjKkYmGxZOcfcrs+I1dMLvvgrH8PR+Em?=
 =?us-ascii?Q?GWuffvANngAh6FbEsqKnE+Q8bL7v5j9vorK83D+m96VJQwzYP1eB0SBwtkcF?=
 =?us-ascii?Q?iK6TvTtiZbMawU4I/gBhuh5HOyENsUNWy+snCKedbfNZtEVCcHJ2F6g9bi1o?=
 =?us-ascii?Q?l6yKdmXYEbJTJTS1iCSel+x8e22/N9ktmSH02W7xG6xKa/Fop2MB9kZyxPJg?=
 =?us-ascii?Q?3e+tt0MLN1V7BcvnQYGh1qpGwAs+ElzPmjKfpGojWysa0ZrisXdnuJBo3flt?=
 =?us-ascii?Q?MQo0LFn8JX4hdUq5VfxfJ6Snl/HnPBMcZfoP+tlZi/2ctZAshQoXIguiedOi?=
 =?us-ascii?Q?f8sYuENd9ELfqVKXwFHBNRbbudwFoOGx0xN7g+fxJbHn93aC7LaBXtitAdcl?=
 =?us-ascii?Q?Wz5kMdOH3mzuR3PkXC/LD0XJbqFablkeoQLKw4uBpvra8vJQB0lgRxZV2BA3?=
 =?us-ascii?Q?N1I72xYanm2geXTVmjYKB+aG1CsDdgmjtQnLS85bUqygzpi7isCWU0HrTSKK?=
 =?us-ascii?Q?/T3M6jgFof38ZRkvpnbdavFxTJkzPWtw8NuNe8vLiwoFCuD2Gz4+iaKx18Sk?=
 =?us-ascii?Q?7JkZRr1iHcgmkdl5B45Lmql3e3G2wulgPQ1pVI7StBiOxywWfngPrbDJ2F7s?=
 =?us-ascii?Q?+GtBzpQnz6VwwAzJBTDcRNtsNtmOMb+LiZBxHh2C4DlUHdHs0B2MelqlM6ar?=
 =?us-ascii?Q?SZRrAzyeZBbPN5SInETo6asc1Ox8KOZr73tPsVbVfGLMEoAplcGzwSQBjaJj?=
 =?us-ascii?Q?aP+ZoleFHs+Z/wVyLLx0n4htJuE4mjIWj/HMB0E7h8FPL1mon11wh2TusZGp?=
 =?us-ascii?Q?B68fdWE4xdvF5AIvkP9cn/ZGTBm+3nJ/rNcZ0vSo1On3KNlONLNu0Tq+9jQi?=
 =?us-ascii?Q?Xw1kpcbRd0q/IbT5M0TC9d/m3uW41zk0Cd53xsHQ+b1FJagJsVyQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af369119-c828-43e2-987b-08df391a253c
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 19:47:36.7144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: abLvBvTxO1z71rySmOCEuGrIh/Jrli1djpDKz593ivLwJ4LX3jSMJeGZxgBxXd5xrTBpPnSO+ueiOR/FW4MNEkAkpvTKBcTd47cic0H43SjVgjW+DUPAUgkveyjgcrcm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9282

From: Frank Li <Frank.Li@nxp.com>

Replace open-coded assignments to callback and callback_param fields
of struct dma_async_tx_descriptor with calls to the
dmaengine_desc_set_callback() helper across media drivers.

No functional change intended. Prepare to make struct
dma_async_tx_descriptor private to the DMA engine.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/pci/mgb4/mgb4_dma.c                     |  3 +--
 drivers/media/platform/intel/pxa_camera.c             | 10 ++++++----
 drivers/media/platform/m2m-deinterlace.c              |  3 +--
 drivers/media/platform/renesas/rcar_drif.c            |  3 +--
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c |  6 ++----
 drivers/media/platform/ti/omap/omap_vout_vrfb.c       |  3 +--
 drivers/media/platform/ti/omap3isp/isphist.c          |  3 +--
 drivers/media/platform/xilinx/xilinx-dma.c            |  3 +--
 8 files changed, 14 insertions(+), 20 deletions(-)

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
diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index 9e1fdd963b559..c9d57e4245181 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -832,16 +832,18 @@ static int pxa_init_dma_channel(struct pxa_camera_dev *pcdev,
 		goto fail;
 	}
 
-	tx->callback_param = pcdev;
 	switch (channel) {
 	case 0:
-		tx->callback = pxa_camera_dma_irq_y;
+		dmaengine_desc_set_callback(tx, pxa_camera_dma_irq_y, NULL,
+					    pcdev);
 		break;
 	case 1:
-		tx->callback = pxa_camera_dma_irq_u;
+		dmaengine_desc_set_callback(tx, pxa_camera_dma_irq_u, NULL,
+					    pcdev);
 		break;
 	case 2:
-		tx->callback = pxa_camera_dma_irq_v;
+		dmaengine_desc_set_callback(tx, pxa_camera_dma_irq_v, NULL,
+					    pcdev);
 		break;
 	}
 
diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index 6b07018614894..142b69eab47fe 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -336,8 +336,7 @@ static void deinterlace_issue_dma(struct deinterlace_ctx *ctx, int op,
 	}
 
 	if (do_callback) {
-		tx->callback = dma_callback;
-		tx->callback_param = ctx;
+		dmaengine_desc_set_callback(tx, dma_callback, NULL, ctx);
 	}
 
 	ctx->cookie = dmaengine_submit(tx);
diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index bd67e8e16f537..1e8cf71b52cae 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -610,8 +610,7 @@ static int rcar_drif_qbuf(struct rcar_drif *ch)
 	}
 
 	/* Submit descriptor */
-	rxd->callback = rcar_drif_dma_complete;
-	rxd->callback_param = ch;
+	dmaengine_desc_set_callback(rxd, rcar_drif_dma_complete, NULL, ch);
 	cookie = dmaengine_submit(rxd);
 	if (dma_submit_error(cookie)) {
 		rdrif_err(sdr, "ch%u: dma submit failed\n", ch->num);
diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 022ea3d616c9e..998423fa2f330 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -692,8 +692,7 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
 		goto out;
 	}
 
-	desc->callback = ti_csi2rx_drain_callback;
-	desc->callback_param = ctx;
+	dmaengine_desc_set_callback(desc, ti_csi2rx_drain_callback, NULL, ctx);
 
 	cookie = dmaengine_submit(desc);
 	ret = dma_submit_error(cookie);
@@ -782,8 +781,7 @@ static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
 	if (!desc)
 		return -EIO;
 
-	desc->callback = ti_csi2rx_dma_callback;
-	desc->callback_param = buf;
+	dmaengine_desc_set_callback(desc, ti_csi2rx_dma_callback, NULL, buf);
 
 	cookie = dmaengine_submit(desc);
 	ret = dma_submit_error(cookie);
diff --git a/drivers/media/platform/ti/omap/omap_vout_vrfb.c b/drivers/media/platform/ti/omap/omap_vout_vrfb.c
index 0cfa0169875f0..006a4ae45a232 100644
--- a/drivers/media/platform/ti/omap/omap_vout_vrfb.c
+++ b/drivers/media/platform/ti/omap/omap_vout_vrfb.c
@@ -273,8 +273,7 @@ int omap_vout_prepare_vrfb(struct omap_vout_device *vout,
 		return -EINVAL;
 	}
 
-	tx->callback = omap_vout_vrfb_dma_tx_callback;
-	tx->callback_param = &vout->vrfb_dma_tx;
+	dmaengine_desc_set_callback(tx, omap_vout_vrfb_dma_tx_callback, NULL, &vout->vrfb_dma_tx);
 
 	cookie = dmaengine_submit(tx);
 	if (dma_submit_error(cookie)) {
diff --git a/drivers/media/platform/ti/omap3isp/isphist.c b/drivers/media/platform/ti/omap3isp/isphist.c
index dc02f240ee89a..281bd0e3748e9 100644
--- a/drivers/media/platform/ti/omap3isp/isphist.c
+++ b/drivers/media/platform/ti/omap3isp/isphist.c
@@ -209,8 +209,7 @@ static int hist_buf_dma(struct ispstat *hist)
 		goto error;
 	}
 
-	tx->callback = hist_dma_cb;
-	tx->callback_param = hist;
+	dmaengine_desc_set_callback(tx, hist_dma_cb, NULL, hist);
 	cookie = dmaengine_submit(tx);
 	if (dma_submit_error(cookie)) {
 		dev_dbg(hist->isp->dev, "hist: DMA submission failed\n");
diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
index fcfe0883aba5f..ece2116639fc0 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -358,8 +358,7 @@ static void xvip_dma_buffer_queue(struct vb2_buffer *vb)
 		vb2_buffer_done(&buf->buf.vb2_buf, VB2_BUF_STATE_ERROR);
 		return;
 	}
-	desc->callback = xvip_dma_complete;
-	desc->callback_param = buf;
+	dmaengine_desc_set_callback(desc, xvip_dma_complete, NULL, buf);
 
 	spin_lock_irq(&dma->queued_lock);
 	list_add_tail(&buf->queue, &dma->queued_bufs);
-- 
2.43.0

