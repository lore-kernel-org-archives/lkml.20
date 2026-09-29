Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875154C33D1;
	Tue, 29 Sep 2026 08:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671727; cv=fail; b=hQw6Qj/fjXXejSeepPb51pRvPNkWPhD+EvGyPyw4yo5ckTURODOwcAyPWuL+KIU9Sf5rKb0zWKSQWi+b6Rj5ArHiWaHwkaHgXN3YxRoBxjCJZrgyD27Lmjlun2kSj/y0ej/2pIMO/3ZdlU46pxjNFpaH6Mv10zyinKgtIr6jLWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671727; c=relaxed/simple;
	bh=MCHXH1LVi8pKYmMFgR/BlL8L899lHMv9dq/pskuYHys=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NXQw/ZOb7FOyGsZPcztZTfqCIpYLJhr0PhDOEZ4Bgda2QXWOz5inML/WJRDeYMiBgiuV73erkQUUX9p29Qh63hqEpQm0onnLO41LFIBQOrDRmOSmDMPwi1ovXUw+Uq7LruB28Ra5ttaS3sVj9akWPUDbWH0NwBDK/JbTxkLE2Rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GSinBUEE; arc=fail smtp.client-ip=52.101.70.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GSinBUEE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRrnfpxUgY3gsgnKLCgTI1mp2EWQNPKy5X5JORZny2Zj9PWQrHPxNqS3XunZTX6crkm486D5z67A4baWwuyIdvqXnHry7Nx3acKV1hyFPczN8UR3AzgpiYjM5atmfAc3qj3hSy0WfcR1QBwGfmz/NeA4NJ8ZHqPinjZbGQwBQ7ndgpSuYCVG2YRvo021IHNZ5uwGrCRV4E+rGLAGaai3cbYTIgKb7OJ+poocOKQQI3l+l8vMqTakvsGrYivySC2w3lAvF7/rD67+Hxmx6Iv/XAKb5/axbOPLbfwd6gMSlR5A4QJjwvWWGjdcTfGjh5P8luok6VDWcpFepGuVfNA2uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnQASYSdRSYmIDEXyCpLpVNsuVIG8GjKwxZbsYPUnsY=;
 b=ox8n6XEq9TkMpqzu0LK4p7+nLucuo+o7lXqtnql/vH2D78viPdlFr9zedZya1hazqwUPvPmS9wryZG8Hoq+LgrFCRFr2Bvcnw0J1vAXWpm/U6mzwRfg9Y2sW5M040OhfnWUWzNcBwqE3c+2RW8bNmC2JT3m8Q61DwHP+urCUOn8Mpnmu2c0TWWLLS7irMcuq3ey88Rp54bQWmC9X8nRM9bOcRMPriyoqIgYrG8weR+RnEz3QZ7AlsBGLmrfgXwPfQ5vPatWVvrS/X+SzgQunV7cRdMXClMLyMUkBorHRXyMauIMaKz+yqQ7QDlBB409mfN1Ld0Ht7z+fkV9E2nlk/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KnQASYSdRSYmIDEXyCpLpVNsuVIG8GjKwxZbsYPUnsY=;
 b=GSinBUEEICwChP04rJQPPGVFfV/nHmY9sYfLl00yVlhnQOX5K9/U3HpIjEdEvm6d+ynw/8XD0Q+Y63A+w6FAUM6N2ewsAvdfEl/F8+5fBqJ2PzlKjZUwyccXfnEQeg+32mqkpm27U8fr6NK2QNgnxOTzGQfVPnWbAVhY6Wl+5VkO7Kh7u0mxbc1uVkxgTAEiJjYqg6UywhP9nBB+F4DhlvcKUH0psh21G6vZI38ZjIMYAeX1piYzcvI+Ny+dOdJllohgugpVfCoOt5hJZQEcPoShqzUnNS2gG71U6FFd+SR//7yhdRQd/fD9TlnmO/1Le5+Rv9Mr/BiitWKMnKEMYQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by AS8PR04MB7815.eurprd04.prod.outlook.com (2603:10a6:20b:28a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 08:48:30 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 08:48:30 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 29 Sep 2026 16:52:25 +0800
Subject: [PATCH v4 04/11] media: imx8-isi: Reuse mxc_isi_format_enum() in
 capture format enumeration
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-isi_imx952-v4-4-e69f89c7c651@oss.nxp.com>
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
In-Reply-To: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790671948; l=1643;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=MCHXH1LVi8pKYmMFgR/BlL8L899lHMv9dq/pskuYHys=;
 b=XaKiw/BE9I4BHJ7dWz2p1KCF1cb0uqavujFNtTtkLk7VaV5/05t0XYtgxEMCqrCtPdlANUKJU
 kHe9l3nc6tnA5/cJ++XqGq7c63qjKtn1Q3vHn5XVXqUlwHwP1wDUxve
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::6) To DB8PR04MB6667.eurprd04.prod.outlook.com
 (2603:10a6:10:10e::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|AS8PR04MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4b8992-ecc4-4cc1-7151-08df1e066ffb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|19092799006|1800799024|10067099003|11063799006|56012099006|921020|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5y0H5sV6WNE1I+ZqUmN+Djdokyi56gV9sQ67Mp3+EPcOJUgP5TcmShXEABcDrtNLFIoJ2xLIiuQ+W5dL3p2ZVLXeTGxrIznQtolqeeyso56ShShHpNhSrqCTtBF5U22blvI5czz8PVA9O3nUekr5lyzwUDl2Nnu1LaVwQi+XaN0Q4Uv5a3+HRECkDhSLpnXXejSEB0hl9lHNMRhnS/Yx5o04o/ttvpUp45ZelzdnyagOgWDswjP51mVx97Gn8VIVEXqLKpi/W6IreeEYmcMNeWp84Q0gWrrwlZDSnWoNdBqiQ141a4yNCn61wjwZn7UShpEIRJ8LDxkMT1HD3kGHarOAX9Uxy6glSizK7IPLjPp19p2a6x49MmSfNm2ZzpC09VDCnL4IlfT5A0bzWJ/61XuGmzlI1pyYYJhdpbUXnP+DFeo/j7ER6IiPvwbYigd0jvUjpIM29qNZHctusTE5dfZNoEUmBbe2i48QY7Gq3wpARZvKR1cWMQFX9DyvywoGNPE55Bzvc15Bf1jX600jB69BP76jlsbBlVcd9MuNyNlpcTmRy9LV6aShnYuD3mOdMgWDTJb6O/A0UG/BWtBec4a7PR9xUKnjUapj6KbCSL7EeEEFxKDNZn3jbs7pPS6lWH5fEqVQm5Z/X/oN9A4orcLq+QND/qz+cVoe8HIFuApAl0x3sBfFMst7X4cVUX2xVJcB3N+3W38NQ5qiqO/QWw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(19092799006)(1800799024)(10067099003)(11063799006)(56012099006)(921020)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnhBYTRiNjdCNnFXOVdXSFpxSU9JazVXdjNFTGlEbXpkdWJSczlBckg0OEdu?=
 =?utf-8?B?SldnQVRTSU9YbnhremJrKy95cytZMzg4VWFWSkdLR0IrVFMvSkYxaTVER280?=
 =?utf-8?B?Y1MrVU03YjhQeDEyMnlkMXlsb0liZ2dtR1NPUTQ3blh0eVBPZG05VkZuVitp?=
 =?utf-8?B?ZDEyY0I0ekFRKzZCRkkvZWtuZzhhNElhQkt6MlR3ODJRM3hHNUpDdHBUZmFR?=
 =?utf-8?B?TDZEZ0JqSk9DNzNic1V6UkE2blZwQmdwMWtzb0t3TmlNSThVaW9nQmNCekxl?=
 =?utf-8?B?QlVTbVFBMUJvOVZnbnE4SlluTWl2ODAwT3dYM0pRb2RISWVhYW5nLy9CYU10?=
 =?utf-8?B?REIrYjVtZDI3eUF4UE91NHk0QncvL3JWeHpEWkI5KzBMcDVIQy9hNWJFL3hE?=
 =?utf-8?B?QW1rcUNmN0RYMUtvTHlpRm9wWWs0dE5JcHVrZEVjeE83YU5ySHpHTWd4YzBJ?=
 =?utf-8?B?dGpsR2tvckxjWk8vb05TRFdnMDBRZnREelhtRVJZVE5DT3duUWdVUVhlWVAz?=
 =?utf-8?B?ODdOU2JMcitkQ2pEaUxRMktaZUpRLzJIaVgrT0tGa3VXU1pUSkJUbUdlUDJC?=
 =?utf-8?B?WExkd3M2SDQ4VzBCdWV1MkRsQ2FJbTI4MEplZkNHV1VkeHRBUjEvNC9uV3FJ?=
 =?utf-8?B?MFdFdWhjRGE3dU5MelUrOVhhQXZHMTVjUzUzZ3p1K0JmS25XbXhrQjJjMzd3?=
 =?utf-8?B?TUprKzRKN2RaNElNUUJqcDg5alI1b0g0empvVk5FbWRneVRuVDkvN0JvMS9E?=
 =?utf-8?B?NTZtbVZ0aExJV3VLYlI1ckRrODd6bVBacEFGU3hVSmV0cVlxazFwQnBON2ZY?=
 =?utf-8?B?aVVGbG43dTBONUI3MEdmdkpTK3FBTW8xeUh2MHUwQVdPS05XeWF5Vk5pVTNw?=
 =?utf-8?B?MzNMTGl6WUZuS3orZnIybmVRVGdtZUh0bG95NjdxMzBQejVHRXgrKzRxRUFW?=
 =?utf-8?B?cUtNK20vaHl0R2lXQzYxbVArTHMxRkpyazYzOXAwL013bkkvcGNwbXdpL0pz?=
 =?utf-8?B?UGdBKzlXelltNzJ1NDdSWjlJS2RZbTNGeHdUMHBKSVA2WTBXMDM0UWRYSGFT?=
 =?utf-8?B?cEtDL3hYdEl6N29IZFp4a0lyWEFVODAzakVLQlpxbEhQK2RhenJjZ1FqUFdk?=
 =?utf-8?B?NUMyRHZlMFJRRkFNQzBaNFdwOXgzNkFaVEpySFRZSWdIOWJOK0FTdVBpQUJj?=
 =?utf-8?B?TmVidGlxa3ZQQ2dqdGFaSzFRWVdtc3dNQzFTU0pyVzIwZFhiKzRPL1JCZCtY?=
 =?utf-8?B?bXA1Um43MXA0T0thS2NSNVo2cW9pRzF2clJnamRITk1FYmxyQUhqYXlWNEt5?=
 =?utf-8?B?WkhnTTZtVkMxNDl6RjFialppeWpjZHEyQUdycENQcTBDWElHaDIyU21lVnB1?=
 =?utf-8?B?THFMSkNrWEpVdXFJSERna29mM2ZZRy9vZ1dLc2N3U1VkYjN0NDNpTVVoSFd0?=
 =?utf-8?B?SExBY2lpU0tCcENQeWFOb3RlSFd0ZFNKNEx1Qk12alBlb2c1Z3hWUVZzcytQ?=
 =?utf-8?B?NmQ0T2dwTE1abmEwemo4MVFvQlpEUzNmNVY1WHVxZXJiVStXMm8yakdqYlI4?=
 =?utf-8?B?WEJYQW9MVU1NY3BIM2I0ODl3dzRzRldieDF3R3JJbm0zQWx5VU5xa1pobkRT?=
 =?utf-8?B?V21HVFBRQ3YzL2NLeFd3RlV3L2lRNU54MHV1RzZYR3o3REVqbWtoR2xKNlFv?=
 =?utf-8?B?ZTdnSnZBbUFSVk9LZUk2USt5NWlvdk80YWtnTUlidWFtZ0ZrRlhpWFVYekdZ?=
 =?utf-8?B?bEQvZGYzZWRjVmlZVE1Hc0VoODB0WmhIQTRGaWx3RWRtSHN1Y0wrOVgyb3Iy?=
 =?utf-8?B?eGZTMXlZSEZXWEN4U0VKU2xTYjlvTElhNkVoVUNoUFl0cGtOZFNzeis4WWxl?=
 =?utf-8?B?UnJyRkZqRGxiRUJwT2Jtd1FITm8yV0RIdllXdmIwVjBHN05PSEkrMkdsaThq?=
 =?utf-8?B?aVV2SUFrZERqZ3hMV2lMWDNRcXVzdHdOL1BrSlVObm8xN2hoR2Q3WXRXaFlh?=
 =?utf-8?B?Y0tFbHhQWWxUekJmN0piOEh0TEdvdGJqbG53OHBkdGl4UHllSzBOTU83Y0NP?=
 =?utf-8?B?T2xaMUdPZ3lLdzFSSmZQUjZxSGgyeUlSbkduMlcxWGRhYlJvR1BrUVlIUkJl?=
 =?utf-8?B?MjMwWTdUY01La21pMDdCQWlSVlBNV1lDdkNWVEFZeTI3Sml6TEpoRVV5VEZx?=
 =?utf-8?B?V0xRU2dhRjlCdFFEbGNNbmdYM3hlOFp4V2NMeDJPMi81bVJXVXNLUUlDdk41?=
 =?utf-8?B?TmFUYWdvWktjblNQN2xWeTZrZ1JFUVhMdW4wMVZzY2tURWFSTTNrdklWOHVS?=
 =?utf-8?B?ZE5qL2NUS1lLb1AwVUt1dzBBbG9uamlocm1MWHpnUThJbTlMbW5KUmRqSml6?=
 =?utf-8?Q?gBbrY0N0v4h5fDJBJv4cku8T9gyNDgYF1yjeB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4b8992-ecc4-4cc1-7151-08df1e066ffb
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 08:48:30.8175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2J8olyzUsATrwKbvb9c9EhMCWLDXHMbxlt4LAoUwDbHF/cmV/KaAuZb2/kQAGUh1aRalRi5zjbmnO8c4K5zs2D8QR+Q1DhHDN9lvPMj9RUCWRME9gNOXR1ivLGnryHnk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7815

Simplify mxc_isi_video_enum_fmt() by reusing mxc_isi_format_enum()
instead of open-coding the same format table traversal.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v4:
- New patch
---
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 30 +++-------------------
 1 file changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index 0d87a1082727..21849af3121b 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -1231,34 +1231,10 @@ static int mxc_isi_video_enum_fmt(struct file *file, void *priv,
 				  struct v4l2_fmtdesc *f)
 {
 	const struct mxc_isi_format_info *fmt;
-	unsigned int index = f->index;
-	unsigned int i;
-
-	if (f->mbus_code) {
-		/*
-		 * If a media bus code is specified, only enumerate formats
-		 * compatible with it.
-		 */
-		for (i = 0; i < ARRAY_SIZE(mxc_isi_formats); i++) {
-			fmt = &mxc_isi_formats[i];
-			if (fmt->mbus_code != f->mbus_code)
-				continue;
-
-			if (index == 0)
-				break;
-
-			index--;
-		}
 
-		if (i == ARRAY_SIZE(mxc_isi_formats))
-			return -EINVAL;
-	} else {
-		/* Otherwise, enumerate all formatS. */
-		if (f->index >= ARRAY_SIZE(mxc_isi_formats))
-			return -EINVAL;
-
-		fmt = &mxc_isi_formats[f->index];
-	}
+	fmt = mxc_isi_format_enum(f, MXC_ISI_VIDEO_CAP);
+	if (!fmt)
+		return -EINVAL;
 
 	f->pixelformat = fmt->fourcc;
 	f->flags |= V4L2_FMT_FLAG_CSC_COLORSPACE | V4L2_FMT_FLAG_CSC_YCBCR_ENC

-- 
2.34.1

