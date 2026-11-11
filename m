Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794430284;
	b=iZOfPQ7JHPj4mJoVX5gB5wzooKvuzbOwXucKziBesPRTF49d6q/tws2nXtNMY8lDTxSb
	 GseVfhCEF5MFX62m1MvznadhUVhl1r7ia6nYRxYBYz7NDEw+vQtqu5NgcvOIQ6sQszRxh
	 VIVUAGh7cNKQwiPBtL4tLWSaJa/8KgxPOPgQKgVP8x9I4sivUARDk3cs+ZNpgs9E72ymp
	 didhzGHfgcPAqEkkqkcJm4BOyed18BcuAkV5Yo2QSfwZFYEFYvq/ybU58E4wmr7Kc9F08
	 WQWGgDBa1KX2DkT5oPqAeFewKiwhL35DDXYdJDG0egfZruxjJRGL4GSKN1+OscR902g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430284;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=hrFkBN6Cr4Z9PFMlwrLY+4yggKszQBo26RECFxg3Xpw=;
	b=pxAgI/kw/WEQmIeDME+UCLjvaf37dlDsaMd45cN02FKoZlIJQMD4The7HR2soHO7qsX0
	 SO3awdft2kh2/RFx267N476bvR8zYfrKg+k75gxprjVwki5iz9isCP2BwFxWU22F3kw1/
	 MrllPYHklHegueRgQeX5X3848lrUmRyDKB788i3q03oqZehiXcH4Aymc+L/9JXCdCpR1p
	 gW30D1V0X2nb2eSznXeuNqv7uoXOgVbq9l2YTbZG4jO5rQdmxYjany5s7hxWKidPqZuyb
	 QIJ+14RtxlF3npbXxdgUPwjlTpKsejIKxw3YHg1J789ndH1FxcmMaWqW8E3tg3s+20w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=MaWE62MN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.4
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547ED606A324;
	Wed, 11 Nov 2026 20:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 547ED606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=MaWE62MN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOgVd/i6z/YbkwVmtCfkH7VPfZy5XlTaqow93qI9sIkdMrplBYHIDL5Uft7O4L5aTK70YNDtEoFC9o4gdV05d9W6K9BVHhmlVbfCwIuX2mH2hMpbYvPObT92D5X7F0DvHtThCRUY+6sbTeAL2bYwWIgJxqFTikgu9HrBpw+VU9ioqj9QXFQAjAMGPgcMZAP4f8mM0VlXmlJhGR0UIe2y4DwM1vMVNis0txUt1ozSMb0DYAose1/fPEl3nsFESU54lCpUhIcZ/xvHVpGcLgJurshc6ZgUy2HPY98ypjItjhCCe8zQemuAOxJymZwnMTY67HsJjDhi58fSbmyV/MRY+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrFkBN6Cr4Z9PFMlwrLY+4yggKszQBo26RECFxg3Xpw=;
 b=ct77VQKQQ386QYMRY/6TampgqRV/0TAyO5lm0mK7A7JDpLKSvBsb924s4PQF39uC5z+xC/nhDERd4omgRRTpKTHsV/NyrEnwiCCCWfGmAkHi3qro5VO1cBk9Gcq35HzZjPUJW3Srr6DeYL2sPOX4/9tkJRcdfi2EZjfD8R2EjCpS4RSwGov2/xIRleYrUeCLJ5DLr4E2lCGQsNMQjhdrz8zHq682fJjdWZIftryEQvoGFy37h/cIBnBMsGP1+BwQGlHTMnpROrZfkc5ayukmFDCGxeR6pdPbdxzs9DW1Tpfg3MJpds4thkA4Q4bj04IX/saWfeVJUVogvYUOvDR/2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrFkBN6Cr4Z9PFMlwrLY+4yggKszQBo26RECFxg3Xpw=;
 b=MaWE62MNeMHyPq7IlkwoH0RSKYzCbp4EdsFf0uOz9pfLuYv1zSaL9BibcfLktHMBMXmtBQVN6SkY4wh7/21sx+zl9wJDMZpgmoSXziagA4OemOWhoI5Tx4qBbHDqsLV7NT7SwEikpKglyk5E5EYfWh5oDGxMB+gWU0mEhxx9tmIdtvAMZL1uExjKNKp1AWkIOcZA2cl6e6ZMO9J9Lowico3ZcqsD3PRMoXBFaNXM6tYfRhB9DzrWTKF+W9mkQwdoddU7ihb/7HlAJ3qHZCX/FLSezI2tNuDGGlo7jsqYF0I/GWfNHUyRG/kFXLa4Bung+H+Ven1qCV+vY/SmVllkyg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA6PR04MB11951.eurprd04.prod.outlook.com (2603:10a6:102:515::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 20:51:20 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 20:51:19 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Drake <ddrake@baylibre.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx93-11x11-frdm: add HDMI support
Date: Wed, 11 Nov 2026 15:51:12 -0500
Message-ID: <179443026886.3949758.2047996172987393051.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106-imx93-frdm-hdmi-v1-1-5b05a83ed208@baylibre.com>
References: <20261106-imx93-frdm-hdmi-v1-1-5b05a83ed208@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0148.namprd03.prod.outlook.com
 (2603:10b6:5:3b4::33) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA6PR04MB11951:EE_
X-MS-Office365-Filtering-Correlation-Id: c7a969de-483f-4a5c-6a70-08df403589be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|7416014|11063799006|56012099006|22082099003|18002099003|10067099003|261009223027099003|261022075727099003|261021121427099003|261102123227099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	w8BUmC5DkojOjCkI8JPtImgZvg3c7Z5Z3O0AQc1rBRPbqZLGxBSgWMfdz291ebocH9F8KZahyD3pLg8YMK3OGs0zTBvI4eWh2ot/a1LULidz4Dd4punWqrIFsf2U70fVIL+dVp9yy/7ZF6TvlFaLi/ee4Ors63/hqGhkaxX2atWEc1G/QUXriER8Ke0RBIIzeq2w8GJnVM99A9THqGk02hIehRy7b3VnaPd3yS6fPlkUNYyEum6f3v5LIMVJ4OZ6r3safsob9xm1Bhr+8GqCx8jOYdtax5PH+7bKQWnON5PUDgxVDltw68bgTR1J8Fri6hW6D/ys0nU2MbOsuyuihA7XMBX9wx9zOfu4LD+eSGCZ63nH3uGvIOceivFEeY5x7w9qDrVGZypGOBV1YQGP6yENMCbOD+wke82WosUO9UNBATQLponQbzNrA4rycHzz/V9vyEJtvRgWd0HFN1GGBRomi5x9+Dx6raoJFZ8EUv95hhu2o1DFBwAPmZG6DTtc5mYMzKx3MNJJpiFDN0oGz7BT03o9r3xlJxithR/nnWNHZrmBgdK0dMywZMWNa+mqDh4lyDVwisXNUlV04zqvkQLVZu1kg5Qncflv/vgh6wZM7QjMkZt6OXizLMk13/vXVCbf3nIE91JgRP4Z8s5Xd0R4pIBhpLiflegXCcDz38E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(7416014)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003)(261009223027099003)(261022075727099003)(261021121427099003)(261102123227099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHk4UHRUWDgyZ2JzVmwvdWE0SXRNYjdHdjFDMlduai9kT01nT2pYMWRZR2U4?=
 =?utf-8?B?dzA5dkE3YTNrNGJ4TW42TDNnWmxGY0s4RkdmWGYvZERrTy9mMDhMWHRRdlps?=
 =?utf-8?B?VzZIOUl3OUx0dUROSjBtSlpYWWdTcHpzN3ZQRnRvcWxVWmI2bElxclB3MUVW?=
 =?utf-8?B?NDUwdXNuNkorZTI1QnNzaVc4NlNLZ2Fsak1CMzg4eEVnZHNvQXVGNnNYZExX?=
 =?utf-8?B?OVlDZ0Zud2NVZE1yV3dDcjdzcDMzQ2RYb2l1K2hYRE1kMDB6RVcyYjVTdHda?=
 =?utf-8?B?M0syeWQ5MnQxeGdULysxRDR3cUhSUGRPVVNJZ3pLeENBd2IvcTZKdlJhOU5Y?=
 =?utf-8?B?eEpXWmNKNlBOMkFkYk9EaTNHdkJzbzRKT2NYeklCby9wU2dISHNMOUdGSVB3?=
 =?utf-8?B?QncxQXRnL3hHWGUwdWMwL0pXZTdBUHVML2VTOGhaRzU2SFpsNTd5Qzk1NnBo?=
 =?utf-8?B?eU5qTjR4Y3hZbHFUT2pWbC9BR0l6elBDdHNKdndieHQxSlhxbVNkY3pqU2Nq?=
 =?utf-8?B?c056NTE1RXh2Um5lbHB4VVc5c0d2L0ZBbkhxb21QUHVDYTMrL1kvNUhjSTNq?=
 =?utf-8?B?QVB2cmorYkFJMDJYSEFlS2g3bUMwaGZpUlA1OTIyWnlIZHFIZ0d3MHMxbXNv?=
 =?utf-8?B?MTh3OGtKZXU0SURJc1BTTjFRMU40NWk1dnM2ejVoejBBeEhTVkpOWXRCU2hF?=
 =?utf-8?B?ZHlaOWpNRjdTbEVQNllNL3paclo3NHFLOTMzU1o4cWd4WVllS0IzNUp5T1hy?=
 =?utf-8?B?d3Z5clJocmlwaTVQWnIvMnFVZ1RCRHF5SEloNEZuU2VNVDhGMDJ6QlEzR2xz?=
 =?utf-8?B?YkZlc0JTd01WS2tjUkw2QnhIMlpFQTkzeGdQQ3pWaHNjMi9CK1NSNU5DbHln?=
 =?utf-8?B?b1MvWWEyVzFjejkvY3I2SXR2aGNGVTd2c3hPL0FjY3IyTStjVkwrVEg0VGJm?=
 =?utf-8?B?V3RMdVlPWSs1MFBQTHZIZnkvN0dSQWxIQlJlMVRHM1FseFQ1a1BVM1VWR0FL?=
 =?utf-8?B?QnQ2QlV0OFJ0WExpZlNqdnFoVmViZFNZQndWanZNeHB1Z3hYMmdkVW5rOHlX?=
 =?utf-8?B?UEUyT2dZTUdvcTZHRlgvdzU0eEJIeU1CM3lqWEd2aGsrekYwbWFpRUU2N2Ro?=
 =?utf-8?B?YzZhVXlHWkNwOCtWMXZqRzJyTWhjZWNyVDNab0Q4aUFZb1RKOFFZbnJZbzEr?=
 =?utf-8?B?bDA2bnBsNnNCaE5ZaXJXWU1PUS9nbXlaMDZhd0N2eHR4L1dWWEZ3TTU5aXg3?=
 =?utf-8?B?SmxDNVFFUldUNnBVWHl6c25QRHZYOVlETFV6aVdrRy9jOTBXc3ZoLzVxdGc0?=
 =?utf-8?B?WHZLK0k0UVpocDY2UjVZVU42d3V4NURyUjNDYTQ1Z1pubW9kNWUzRElsaE0w?=
 =?utf-8?B?OGNtMUpBYnJnTE03MXY0S2R6UGQ5VnJiQldKSGJZNHh6L1hCcGpIV1loSmpj?=
 =?utf-8?B?T1Q2TUR1ZzNocDZTQ0s5MFNsWUtiZktHRG5DeERMNVBUYzREQkFFZFJZbllu?=
 =?utf-8?B?eDhxSUk3N2EvdDMzdmRNN0hhaGV5WFJwOHhRWmM5WEladEpmSFlvbmk4bjBn?=
 =?utf-8?B?OEU4VWlBTlBUNWx2enBhcGpIRkQ0bGx1aFh1OWVybFZKenpIWEltMlNmbDNM?=
 =?utf-8?B?eitGbXhFTFhzdXpJeE81QnY1eFNXMkx3S1hRUnBwdCt5ZzU4aHQyd3Rzd3Az?=
 =?utf-8?B?emVWeDhEck54ZFhMOGdJdDk5dXFNcFU1aUUwTFRmTm9HWFRjUXNzYlBPdDRi?=
 =?utf-8?B?Tkx5ZjQxb295QnVQN0cwOWRjblRPZmNjYlFyblF4bjFpOHp4ZTArMmxGcTdJ?=
 =?utf-8?B?cWNkUExQbGVkYlJEZVZEUEpjYzYxamhoYjkxYkVJbVVpNVJoTTRpd3drUFhH?=
 =?utf-8?B?d0s2YkNHWTgyclpIcUpqTVgzdUJUK0hYK3ZvYTlWREVmM3h5aG9QcTVKQUgw?=
 =?utf-8?B?bjlkQjFjLzAvc3UvUWFaSEhINWlFZmhUNTZNRzhQMWwxMDJuWldvS05OZ2Ju?=
 =?utf-8?B?SmhGd096cWdRU1E4N1F3clBLMlJYai9nTkFFTVh0RGZ3UEFmNzN4VkdsaFFt?=
 =?utf-8?B?SVhzVGVtK3Y2MGM3bmRBTWpTS1JkVXY0ZEQrZzJuVmhtQWlZL3JCT253Zy8r?=
 =?utf-8?B?SUxOYmFCdHUwMkU2ZXFLNWF3djRWcThEKzFNdFRoZ3JScmtDY01hZHRRUjBj?=
 =?utf-8?B?Q0RoN3ZpazVNYThiWTlxN3U5VVdadmo1RjZEUWxZM29YUFlnZGdINU00ZTJH?=
 =?utf-8?B?cklPdWx2aCtxWU11dHg1c2hGem1KQmNLajBVZ3lEeFBRbTN1QnBqRVJPb0FY?=
 =?utf-8?B?dU8xb0FMdGRPbE5sVFo2TldITDAyRFdTZGlzSU1wd3pTNE5nVEN3UjdNVDRU?=
 =?utf-8?Q?C3jCJnyFLWJKWqMB2z5Pg1zWDz8+J3u1EG05O?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a969de-483f-4a5c-6a70-08df403589be
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 20:51:19.8883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q/J2DX+SraNITzUf7ZW96cjtye3DSvfgQ9xF7z2u6FQkpl0jzSuF4rFIUt0eNIO89984pBKSWRercBBMl1+rNz2CoRZ+TElDMc8Xy/szgBV1svp3WXU+XOOXKV2xIRpy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11951

From: Frank Li <Frank.Li@nxp.com>


On Fri, 06 Nov 2026 12:59:59 +0000, Daniel Drake wrote:
> The FRDM i.MX93 board has HDMI output display path:
> 
>   LCDIF -> LDB (LVDS channel 0) -> IT6263 -> type-A HDMI connector
> 
> The product schematic shows that the reset line is on the PCAL6524 GPIO
> expander port 2 pin 5 (which gpio-pca953x regards as offset 21), all of
> the 3.3V supplies come from PMIC BUCK4, and all of the 1.8V supplies
> from BUCK5.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx93-11x11-frdm: add HDMI support
      commit: 8b779a264407d718ea96ca34d0e09abacbfa8b6f

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
