Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793648870;
	b=Z++dXPKwM1DSA0x2ofMozU3Jg7xG1b/YGZArR4QmZB3Vz+QJXU5gP39JviHdZrBVsW4R
	 ayg61atpYFikclTYP1VnltdZhQsNW1RUMkxBax5A8Q9cX2nKArqcv8LKd8xG/DYq4LeeK
	 CbtOf1WLDhM+entnmplT2DOxb5Wg9xTSVpTogbcnsytw/QVvritwjmAGrIZwESaECf6H+
	 VD99NKb56lj8/HGHNjzYRATSWcJuC6M9B42+hkO8gKLH2HmelEFI6o2Tpf7J5XvFhZngj
	 6Cy/BhKZpg5ss1bdr/krPMK239YKI1cHkNbiWWQaVZEzUh8PUmxCoXisGBvIuUv7vmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648870;
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
	bh=KZr+ZeJeQq18LbFLKjAVYkiS/zLj5hFPJLz76m6XFyg=;
	b=3igjrYIWeKgubJDpLeg7hQtdS1Lfq468fQKusFHHIlfA0u4QxhQpIptyIduo3xeUUhxu
	 r5x1pBn57QD7YtDNm+L/qbyoMyUQwtPqYmUA3cKis2+rJHitAtz/Bp4cILw3S4QxcdDwB
	 SWh0XlGOSuiUhQYf5x83cHAoUGmTiG6LhIHGJepCapDmepQYvNVWsrGdp/A8N36uMKdgy
	 IeGTakoMR3qktErGh5wVLnEAUmMsOXv3MSzyLgzzq4WSaqjK6z5CgWuQY9l01S+CRgvU/
	 LDTBExvkYmnwk+2HFYGnpJeCpV/LjehbzhFrNRODrrKRMwi6+cB91VroPFvTG+penIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=seBb3lAy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.25
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E9B606D802;
	Mon,  2 Nov 2026 19:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72E9B606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=seBb3lAy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0K3/uppPz8PtcP5GiHCIkc3m0sdmjLmJBZAf1mN9ioimjDAm5pM6TfJaFUZDdhr3pgJ5SBdaIG2sF/sXBv6UFJ/d4MEb6Klq06tRYX6xFe+qm1Z9KiSQWZ827bM/rNIckJjkl6kJ5wUNvPGQZX3RScfq6LIl8wDF1masOh7X4nkCBWeVIWEIOeTTCx1FkbqloK7vuziHasyqKlgjOJYi4A4Z6cZl1w/0uT/G4uEeIDVuPnfMe5i60FphQb33EdtGKegs2SC1w3Jjm+J90SY6BsTtyIdFcIZSHEF6f5Fdv8K0BEj23pQ/EP0rEnz/wf3cv3vsx1FTh5+dZuczaWzjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZr+ZeJeQq18LbFLKjAVYkiS/zLj5hFPJLz76m6XFyg=;
 b=GFgApMCucgz39ojHZM/XiPLbvKURBjo7OfoFzWcHOcLbyKp60P3Wg0CBrULhuhgYNfRTxjO7ZHEfPWs126SLQ0r5h5akR+jyLlkYwcGlxlEnGvCX6lZFFl6sF6Qe5w5nISP2YkhEihud/114o23GVTK4Bzh1+Hwj56chLVXazY28W5gGU+RhzOJzAhtOLplsJd/CJVwPrqId75LW+IsnnvkzWWzuuPhTBFMyffFSkTchKbbBAFyvCHeI5CwQDQstgF0IF8nMbgV9ptNs7t1upzeCaK8gv5vDTJgvQpU6Oyubr988YkmquDCWKOCa3EG6c7UvEkszbV7VXKrdkNrleQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZr+ZeJeQq18LbFLKjAVYkiS/zLj5hFPJLz76m6XFyg=;
 b=seBb3lAyDl7pfs+Ta6//N06jQYimVUkZwSg015YPGkF4ouivjaS0J3dqMB+Xoyldsub9/lJgjLIypjLX1M+VRZ+f3AST01oaR0vbBRHDrL2QO2yq12ilsOizLv42bBSjA74BG+paFPZFeV4hX0x3bplA27FajczGiEM0pollF5eGrR1ln3XunthTsEu67YS6ZtOCr4XFygyUi7ZYb8vLNArgoAGvbv9e2x3orNzVsk88+plNpZVkURRELKng3PJT4lgEm2x45BAGNR3iW5BVot2hlRiGF51yt42aq6I32XiJAgstpdV3mMJ0bDBqnOwUAx1gS0dlUtjbqSbPTuFDug==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB9282.eurprd04.prod.outlook.com (2603:10a6:10:36e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 19:47:45 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 19:47:45 +0000
From: Frank.Li@oss.nxp.com
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	vkoul@kernel.org
Subject: [PATCH v2 3/3] media: pxa_camera: use cookie returned by dmaengine_submit() for logging
Date: Mon,  2 Nov 2026 14:46:50 -0500
Message-ID: <20261102194700.4076807-3-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102194700.4076807-1-Frank.Li@oss.nxp.com>
References: <20261102194700.4076807-1-Frank.Li@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR03CA0094.namprd03.prod.outlook.com
 (2603:10b6:5:333::27) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 58211753-6dfd-4c30-1c14-08df391a2a2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|1800799024|376014|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|11063799006|10067099003|56012099006|22082099003|261102123227099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ugg/DePAm57So4IHPwvNPUgnUmXR+VYgYyCIagvhN8js8Plaj6d4f2Qb36qcSTvEeeiQ48x/2FdUjUcniq413hklcqLXD/yTcQttLwpL6cJtxpH58Mwz/sCbMIk8gmt01nZTZcBYUG5DNlwK/FAnkJzOv6bQ7KKYrhUVuf+6WCYx9sf6FEVfYog/E8P7Yj+VTZYwNMi4K0ox0OTPuLUG4u5VIQAcP3XbPeL6lghQYBj74g/LOrUlZfkHuYe40yqoUKIXovuOPu4CuX7MCljJ7CyhKDWN3yRzzIZ2slvb9dCDjOLXObCDZQpSTMS7VwwVXki+p9rrQR4ZZBNc1Fb3c8TE7QwXF5qA5W6Kf5wrKlZqBKGOLhDzjRcIs56s36Zz3TwjgzndnIZQQNfog99TQMpExNtUkrwMlk4dvt7ig9WUqt5YIkiMm3lQ8b4Ws19Oxfcr6EdwQVCCFn0VBxyMoqXxFZoLhFOTlL7hw+W+o0VBjn9cQr6dL6ET1DhdZBH1HvzvcOwnLl3u+iCrtZuc/FrlPQb9jOQ3ysabzg1RBkd2dlpARwoBsVD1zdQMvWbh3l7qAvr7UF2zuvbcfOldo+M77zZ5oIL/3jVMdVoB3OCr8R2WXa9qoFih2vfL2SGn10LRLDF4eCsMgjnilJ3J2X8z5D7kXaEyuTvNmIge/po=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(1800799024)(376014)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(11063799006)(10067099003)(56012099006)(22082099003)(261102123227099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N/26+RlKUvil7tAozXbbsvHVjaSifWVDPbAzNb8GKhT/DiYhQnCPpqa8Vr2s?=
 =?us-ascii?Q?y35vz27wjjnjnlOF5WI574mDaPjwUw7MZeX1GBIkUDjn6trzoAWogcEH72gS?=
 =?us-ascii?Q?8nzU2Mj6DAI6PIeG7iVexNEVJsoQa2euRCnME6D3n4ZVBtxKqcE8WR4RQE6X?=
 =?us-ascii?Q?oacfUOUDs8BWZFOA6jJANzGaztXopfSCPcFzXVoBPM/tAb+c3V5f3jSKzGnZ?=
 =?us-ascii?Q?BHQUSx/SPQqMmDw0s9Xvzs4Bbpm2eIS8YFVm/4Z3yll7ZLWklhqTiS684rHN?=
 =?us-ascii?Q?YevQ1j1AoMmBUHn0aZWA4e2iWD/mzOUk/DGiiQzFenSzmr+znqoLMCdR8Rpv?=
 =?us-ascii?Q?PVMscc19KA+ZYbApbXnSnWuvrnyBWJ6WEyfN4dtqqrygJsWjh6YU1st/2tLz?=
 =?us-ascii?Q?PlgEa74ocGDzui0G4mLM91E28BnMrv1XJr1YSqx9F98MJeHyO5GyO62ipdW7?=
 =?us-ascii?Q?IFtHpg2WOTQ4LcJyqfwgYNrfr9QKQfWaBP8Q6bCC8vLeAjMtUfqRgD1oDYcv?=
 =?us-ascii?Q?WHPxWK4K7oz1ehdrrhrpJuWAmownwjnFgpaj3jSFnee5WSaSu3e9XVN8QSL4?=
 =?us-ascii?Q?b6tKCdoevkiYhhh+jqVUt7ByaZ7aK2pxzTxBGb7G43wxMcOWB3RIrtIN0C1z?=
 =?us-ascii?Q?IDHvDvMEeDKUcOfw3kmFG1nJPPG46fBLWDDnetk4zCEOB9+a2Go2heT4Mhfb?=
 =?us-ascii?Q?W6GYWFCT3EktXxMDf8G20hAsqMTmgBzeBe6VEXReSO0Aez6tiLS1lpPi4F/P?=
 =?us-ascii?Q?wyBKJQpREGqCcQYiufGZeJSvFz0cdy9ysHpMu9KQC8GpkgmYvszOnp/QeaZH?=
 =?us-ascii?Q?DxQRakh5mXatJinp6dXx8Bxt21VbGNC1ObzVf6G7rQfLm0nXdnH7EAMCtA6m?=
 =?us-ascii?Q?BFL25yNfs2t8eJl9MOSqhdW+U22e+mboUBeuSoQ65JsKDQCmcPx7FFK6grgA?=
 =?us-ascii?Q?32+t7gEzlK/y3zQYeL9ytaC/QUtHGbu/FnJ5zs/9GcCYte1PLV/eDUTZv4zD?=
 =?us-ascii?Q?J2KzLKBY6WUK2K2R5F2xvXJqb1D/LssD7f0CHG+hc2GMSxbuY2prfx3Z/5Pk?=
 =?us-ascii?Q?e1Ofdurye3F9Dn6pgqDk+YNjCxW4NBxBycqgBcc9jTso7PwbDptyq7HpIqiA?=
 =?us-ascii?Q?8hXZo5JmtjeSAlhm6yxmOeFIF6yDmbLFV4YS2a/GVlUWRxM8bgapRL2s1+C1?=
 =?us-ascii?Q?MenF09MH4R4rmWr4tY1r81ZkGHsVVNEqG7dWccfvTSaLRGJvSA5tsNEYgP3E?=
 =?us-ascii?Q?lxtpZ3AO88cZeQKwtVxC45JvyjePCIMHWUacDLw1xCTBhs2e81vqVpLgEuF7?=
 =?us-ascii?Q?gRHpukJnPyBA8P5uKN+1AzKg23GtfHetNsbMtK4TrnB+x7BFJ3BJ2g9jvX2d?=
 =?us-ascii?Q?VgYFa58qTMXk28KOL2+pk/SEsn3nsw690G3IB8EeEX8qMZ0mRbJ6LBdaSMQI?=
 =?us-ascii?Q?mIVwHnCGjyI+yUf+vCteL1woJSCTNjNFnVzy8yE1EVhAk1qeiM4XDRSXyZqR?=
 =?us-ascii?Q?EUbCAchdNM3IxTZQ1whlSWYw6r2Vtdn5J5TOncmAqhNr+OnrgYezmWgGtczi?=
 =?us-ascii?Q?476MMGn6yRQXXxcBwH9xlsTW/8Q8VhxtRu+ZKfGXvChQzXRUbHZevto7bPvL?=
 =?us-ascii?Q?U0Ho/NO7Y4pEwHIiH9eGL3CcMWflEvaYDWNJ2ZRaHYfOTTneH+ccFFA70nUy?=
 =?us-ascii?Q?Jm5N2g0Z45UZrvIDiMXYWMsIxOyN78v/NODXovFswuidAhJbogcpbWCYaDoi?=
 =?us-ascii?Q?cI94D7Q4XzFy/Z9jMpl54DTjBM1HlQrOlfiBpA5Dj3rahD/yzBub?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58211753-6dfd-4c30-1c14-08df391a2a2a
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 19:47:45.0949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xo/YgZHmd7hVA/ngtMSEDeHsZusq5PGxzs7TJlQSpVSBUIjzT6+WPSlpUy191nE665VcYEUNtuloMxbl1MFGtN2p80bAdLj1nisAFa+6ivK3BdXR2yxVdkvAna+/hfa1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9282

From: Frank Li <Frank.Li@nxp.com>

The debug print in pxa_dma_add_tail_buf() was logging buf->descs[i]->cookie
instead of buf->cookie[i].

dmaengine_submit() returns the cookie and it is stored in buf->cookie[i],
so use that value in the dev_dbg() call to accurately reflect the submitted
cookie.

Prepare to make struct dma_async_tx_descriptor private to the DMA engine.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/intel/pxa_camera.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index c9d57e4245181..d41cca2b2d8c2 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -903,7 +903,7 @@ static void pxa_dma_add_tail_buf(struct pxa_camera_dev *pcdev,
 		buf->cookie[i] = dmaengine_submit(buf->descs[i]);
 		dev_dbg(pcdev_to_dev(pcdev),
 			"%s (channel=%d) : submit vb=%p cookie=%d\n",
-			__func__, i, buf, buf->descs[i]->cookie);
+			__func__, i, buf, buf->cookie[i]);
 	}
 }
 
-- 
2.43.0

