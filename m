Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010043.outbound.protection.outlook.com [52.101.69.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335F6568FB6;
	Wed, 23 Sep 2026 20:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194956; cv=fail; b=aYBenE6ZsLh/X2xUR/nQi3nAGSj1WuwD+GfE/Mf60LefT9l6euL+tF0yDC0DxMDE7zFU+t8vKeHYX6Er/Ky/cr7R5Y2FpKQlDe9e1vMgfqLcFb7JLcpvVpSDKu8jnKituxK90zisXugk2qHETMQFnfNLTP1ewxiKUMADH1zMD7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194956; c=relaxed/simple;
	bh=4/BPJcHHth+BdVcYDYvMlzsgtaLDGRSZACDgeHXE3Yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FHiLUQBS3HJ7RP7NJN3ElqXNyQPrRFWE8inVPxw5F0r2kl/ekABV4jnuhTSztwYZl1kvWRCmNaJmIpdcEzp2IMt0TyyqMpWoR0AVsyCOpRIqaBT7ETn0XYMqyvgs1xvLPWoXWqJzds+wzxm6z/b3fPGkQZSYKlIJBEXDF0cFkv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ElMYFLj1; arc=fail smtp.client-ip=52.101.69.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ElMYFLj1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZaS3zx7rbQ0DMBqx/H0KiMuwxz+zr9h1h3V/J1Pd3qPBXzOvEwZjV0S7mF8Z7xT6Z5BxpstyrMMsRmxDYvdzhR3nm3ZkFaGxpOlJfOneOmN09KS9NWACPpDb8SuSXt/Y3KTg72hBjFBQ4MwzkK+7d+1JedPXK+/8zZ3IzwkmhHHcNSKk1te/MCDH+8MemNcuDuskjqBWqkG+ZzDDX4vgTf33T6Ed6B7yjNtRvVHxJ50Wlvn3kWcDMOGQcAgkdsQGKRUo8jKE+KFDLuOVmdC9/pBr6iGz/+deHB66u/6EIVqZYixRzUOo7uZ40gcBP3qjns7wb5xTAONTwGLK6YgnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnelVJ8olU9idlBWC1fqEqI2VSPQZITIRrueqq/XOik=;
 b=RztJu1FApoXlnDT0jlRQRJsGDBGyqp2Xx6LXuevJIfLb9LOSeTBBvimTXKlQHvihUYZqbqtc52mI5nlbinXRrETO6SK3syb/UKUhyIwPJdMefWX3KcR2zqdvfdhvqvsdqhQj7AaqQH5tEknOPdqX++KsV9BbpvQ4MzatFt3mzZScFpFmi3vDSz3OSGYeh0c9bv08kamfcC1tsEJQCxXgawvzPygpOZUKU9fDcSw8Y+LAf5jNqz0Q/UgkLj5GxLBww57iNeii8fcfR45QqWtfkZBYUwddey/Wt4l40Z72jOf4EyGbRCpPbtBGPfMU5Xm9fIIoZ/Q3BEWdAgDUX8bQ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnelVJ8olU9idlBWC1fqEqI2VSPQZITIRrueqq/XOik=;
 b=ElMYFLj11HQIQtIcEJ4sEMFd1Ieyqa5aWf5Z3XdeMC/u1G+HH+AkDNG2z8czNXYaEcff6oVRLhPgFntarEGpFXVKwDV84Egi8kWf40dO2RydUe4RAtF5OwzTqEsIA7eWaS+LmxLpiucrZO5aUkO4MOSdpIGliXEzQx4DI9kBwSr8Jh87lFVC4clurXI+BDv08rXw9DRmCzmrV/+CtmSJGvAQJgZDPdKtUA3vX5cUCZb29+aQ27FW00oMNdTVvZZbcQKMUIQvYK7ZHaNNdFKOf56MF8mtRco6IDwuTpA5qKL9hI0OvGGkYnoVl78uUWQTl75lUj0o/CZHYeJqYeO5Lg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB9183.eurprd04.prod.outlook.com (2603:10a6:150:27::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 20:22:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 20:22:15 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Frieder Schrempf <frieder@fris.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Eberhard Stoll <eberhard.stoll@kontron.de>,
	Oualid Derouiche <oualid.derouiche@kontron.de>
Subject: Re: (subset) [PATCH v2 0/9] Misc Kontron i.MX DT improvements
Date: Wed, 23 Sep 2026 16:22:08 -0400
Message-ID: <179019492254.3751725.4468513390400686623.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
References: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR07CA0033.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB9183:EE_
X-MS-Office365-Filtering-Correlation-Id: 15735207-7096-48d7-72db-08df19b05b5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|19092799006|366016|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	E2pBkTex9ASPtCkn541C4ediPHpSXUB8V+Ds2J71P27+V32POEkbTBo3hFuN5YUkItZODUrp+pKCC6zVgnzxOEqX6UQfhLQu7+2vACV1LjGbUY06YW9LwSM17DpvDjWb6tTgM40UWvYDe1Zn4kJBvRHrBp3xsToTRd/W5ABfL/l+0dnM3Jw4+bd/3q1eqv89hdBDL0TjBRGGPKWvgKpedTQxiSHh+H6xbwVo6XhKQvfFRreQ8Lc55WrlIWzROFgfI/mkWXTP7IP26Wyj9I9HogF+smOiLuidh1ip7AG5RM27pqeKLkM5kGf1MP1zUTYRKU7l/VLPzb/JMmrocFWHAF0HY4fenD70gguD99yaSRFNr6VrMv/Q9Dtpp4a4LV6SVj0axBoJd5hS5B0MV8n73cqhM7Fiw+dNOh3M0fSiwbSB0o6AYOnGyB1lFH2oEBsPXiVQVcMMT0es7sZN8toxUSUleI7dckyQK9ZqdjrNA14ypiibNItdEFMvkm1D56+ARGtkClrKMePPXmManyika9WGr8NKf5q1Q2aFYci/Lhw7/sqUxPDOf1DDSFNJgRKgJT887tMyccvX3xkTC3uFPguGzid2QCTr6uKALp/2990=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(19092799006)(366016)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDJlV2xHNE96cms2SWNhYWpZalJPbitvMllNdEd4ZEpNSXZpZTZVczI0UHp3?=
 =?utf-8?B?UVd2aGNXZURSNHF3RWpqdUFzaGZkMFBmQnFvWEVtS0h6bGQraUxKQkltUFBj?=
 =?utf-8?B?bHlIMml6bEVFUzBORTVIQ0RPWDdKWjNMZ1N2ZDNBZjAwaSttNjlQUVpWc2Ir?=
 =?utf-8?B?aVZtY29QNTlVUlVNMWo5bjlXZ1ptMjN5SVkyaHpEVmM3V1BwNUhPMi9CaEJZ?=
 =?utf-8?B?d0VhMGxxSENCK2ZNZCtNejNldEpBMThHL1IwaUdoRUl6OUVJZ3RDdGZ5R3JL?=
 =?utf-8?B?eU44WGhkeUhQRlFOdXdENkhSUmxCVVFJY2RjNWpadWFERUpkN25TR1ZsQWxG?=
 =?utf-8?B?ODJxdm9qbzBlTkphc0x0bVlLNUE4aUY2ZFdzQ2JWdEdTa0ZKS2M4cU5MV3d1?=
 =?utf-8?B?R0dXSmVPOE82MzFDTEE0Z3dkTmlpMC9BMW10bk5RVEwzTHpIYnB5aHh1OWlo?=
 =?utf-8?B?eWRuclBzcWV0TkVQRFNmcTdFUTJaVGswdmdwUEczUmpDZUN1SkRxaDJsK1FX?=
 =?utf-8?B?dDl0SzU5L2w3VzNXd3IvbXJlZkl3TkRZSHhsLy95YjNGYmhmczZHNUlNem5m?=
 =?utf-8?B?ZEhQR2hwWWdmb3p5UjI1Z3VSR3BEZE9TVHlhSk5sT0pCZEZqOFZiakVWc004?=
 =?utf-8?B?SVlRdDdUSXkzbUNsRGtmR0toU1FuUTV4RkVmKzgwNDZaL293ZGJVQVhqVERZ?=
 =?utf-8?B?WTRwRFRFdDhnc0RWS2hybU9mZnVxSEJ5eVhjRmhjblVtUjNQeGgvS0RFdno3?=
 =?utf-8?B?TkN3b2tFQnZYRjFwdUdGNVhoaldIaGkralJHb2cyUTltbXVLUU55dWtPYlVW?=
 =?utf-8?B?MmsyTjd6T2VwcUp1QmE0TnhJU1lkY3dnSmg3OWJyaURWKzlZLzJGcmV2TVNv?=
 =?utf-8?B?RlNHWkdCTFg3dlVCeHdOcGpJQm5TRWNhejc5Smh3QWhCR3owU21sZldpVmtD?=
 =?utf-8?B?bk00REJQS1p5V1FnUHZXRFIyMDVYTFpQaDJ3TkVUcTZDVXJadHA0RHhGZ2xX?=
 =?utf-8?B?RklIYTVMOTg5MTJMck1ONmNtcmdSd1NtK2YzOWlCWGt4c0VrQUM2QzllVDg2?=
 =?utf-8?B?SXNYWFJTVTFaOTFxMFc5Q2xya2RNZlVIbXdwc3cvMU5nUlpVYUZkYlhUcFNi?=
 =?utf-8?B?WjlDQlRGRFBMRXNwL0c0QitBWWFIdGgzb0pBcTY5d2F5bjh6aU50VWZZeFVH?=
 =?utf-8?B?YXFCVWZXTEx5ajBnQVo3dlc2TFVLckJkaU1iUlpwYWptakpKc1ZjZ0RQTWlu?=
 =?utf-8?B?NWFYMms0SHlCRHE3OVphTk5qQXF1TUlLeUlkb3U5WXJBdS9uU01PUHY3T0d4?=
 =?utf-8?B?Nnk2RmpEWC8vSXJXRitlQXY0TlpjcTdKMm5sSW9ZZytmeTZoQ3hQYjJMOS91?=
 =?utf-8?B?cmFXaUlST2NwbElWRURwQ0FsTXk0ZXd0OEZJNytIekpTeWFBSGxyWlo4eVlj?=
 =?utf-8?B?UXVMNnBFTXBwS0R4M0tVMVMwN3R3c0Q4MWtyd0N4MFc3SUN6Z3AxSUtyZUJX?=
 =?utf-8?B?Ui92YVI1dDh4bEFwN29qUStUOVp1d09QbnpMTUNFbFIxUmtjOEp0VnJKclBm?=
 =?utf-8?B?L2VWREFZL0Y1cFAyZjJ3Vk0rYnFuRGQzaG50UTgvZVRrMWJzdFNXZFJ4MEha?=
 =?utf-8?B?VFFwdTBPZVVsRlJyQ0xtaXgwMSsycHk5QnJGNHZxcTYwS3ZTQkF3MzNuN1Ni?=
 =?utf-8?B?SnREUHZTeW1UVmxyOE9TeFNuQm4yOG0wK3pheE1xZ2k5WlJIWXBiUXFncExr?=
 =?utf-8?B?a2ZPdk9rLys4SFJPclRzYmlCQ1lWZ2xZa0VnMDNzT3VOcUdSRUVYWS9PdUps?=
 =?utf-8?B?eHJLME93d2NhbTlNZ0FOYTJaRVlTbXQrdnlmaTZXMlJzWVlJUm4raUo4b094?=
 =?utf-8?B?bGlHS0E0dWQ0cjZ6aUllTjZZanN1MDY2ZmF0Mi9rS3BNMCt1ZUxKa05xRHBX?=
 =?utf-8?B?MlM4MUhrUFprOTlQS2JKOGlZZXZoSGFXQ1BTbVRKdGZsOUtkY24vaXRoY01t?=
 =?utf-8?B?d3ZJYTJxT3ZrYUYyUXAwc1NZQnd6cDQxRTFjVmQwY3pieTI4NUJaaDhzNWNr?=
 =?utf-8?B?cXFMU09GYVhMZWZsajlXbTY2NVZFMkE4VXh1bFpnQytnM2MyRWp2ZXlxY3NK?=
 =?utf-8?B?cE1uVXpnb3Y3UnhCZ2pSU1ArNTh3cDNhZUJFL3d0OW1uZ3JBSENCVEluaTc1?=
 =?utf-8?B?NGdCdnN0OW1NOUpHQzNwU0l5ZWxZamVtWEtVdzVYazhZUWVxb3orN3lMR0JR?=
 =?utf-8?B?Mlc3WDIzcDc2ZDZPallzQlJDTCtJVTBGZUoxMDQrZDJRSDRLNVBQL1J2cGJO?=
 =?utf-8?B?VTJQRyt0UWFSeFByQmdDUmRSZUo3OWVoM2QzOG1tNitFYTkxZENUbDNYY2xX?=
 =?utf-8?Q?sZuTXokmLtHhKV6uTq6X+uH6LUufQHwOtyI2O?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15735207-7096-48d7-72db-08df19b05b5d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:22:14.9365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YVJIJIg1WVQJkMNpYuz7cqfJ1VAE6ofTSavj5T9kIXtr9wr0JdXxyXuuFMRrih18VhYcP3wOkRgjB11PJV/8EgDjEFNkoN9INKOgJbHVQI9BD9no+GQZjMlFpEhqCZq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9183

From: Frank Li <Frank.Li@nxp.com>


On Mon, 14 Sep 2026 15:46:08 +0200, Frieder Schrempf wrote:
> Changes in v2:
> - Patch 1 and 8: Improve commit message (Frank)
> - Link to v1: https://patch.msgid.link/20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de

Applied, thanks!

[1/9] ARM: dts: imx6ul-kontron-bl-common: Replace UART3 with DIP switch GPIOs
      commit: b2e2c41c398d6aa097203e70c7acf82ba4c5a6a0
[2/9] ARM: dts: imx6ul-kontron-bl-common: Add GPIO labels
      commit: 27408de30b6e5bb93dfb99af508a670abd787b00
[3/9] ARM: dts: imx6ul-kontron-bl-common: Fix USB OTG1 ID pin configuration
      commit: d3b1ebe5a7a1f345fdc75a657ae725af0a0bbdbd

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
