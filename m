Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013062.outbound.protection.outlook.com [40.107.162.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BD54EE877;
	Fri,  2 Oct 2026 16:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790957779; cv=fail; b=IVDz9cVwByEwpHXL2cJtx0Wlfgl8uZRgPP0wU5j5IfEUmYCupXQjhCycdmzhaa+I/g8mWFebuh39Nkx3e6lWND14H4hsr7UjQ2dNnYzoax4jeRGw4WGqlF/5kKIoGOsN1vnAnsQHkgcz5kNbfwMBzad9IpZ76gt1obvLTp1r0uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790957779; c=relaxed/simple;
	bh=kETkd9ICKj5ujmY/+jUj/M9gflyjeqpRx/B6OIRW+xw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Sbw3pwPVnQSg6ccnFmH8DcOdNI4wsbrs/n5bL2q1loVa1pt87SDwCkLOvfcKof33bjWuZUYjBirh2QFnSp7NZ5pFkzdzX/lt82MK1xjmGAKuPDRe3dO9JhnOazqaogfZ+A85G7gOrgCdvyR1Dk+9AmIl9w/24+99gJyvdvbM7oE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eSwSAKPN; arc=fail smtp.client-ip=40.107.162.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eSwSAKPN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdYlsrj7LLsCXrbbC8BAgdBMV14ZNfpcqhUOSjv67FD+UUprw3KpXYrXFOpyTNiXPKE9B3hnTvVg5i+KGyRdI7vQT1IF/Tv+SbSPFkY8pYValqYPYJxmJ9XYQjfkonJJ3r736DulVB80f3BgjyJ+7qo5N7wggo8sZnB68z56jLjISPdtT257W8p70jYP/UE6rN9j+BEhtRGAmPPiOuQeJjwY8YjTFDcLKRG2on30CczVknSaf4tDJYFErcf+ySy/EJTMBLXXW9wOqbjtcovNSTu3UpmRmJ37qtPqORYc8XSO2Uvki/eCNSugO+EJyiP396fxxWSksDWk0wNYW+tK+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjcDbTs9FdX3fXZwA90xbytMzlO4CTXr03GT3vdQAU4=;
 b=yErqQQ1WfU0Tty8iuFfy6914Dy0+Xg+ogGdWH5/uROPduzO/qYR6QskWLKbqCtWPeJAooRnzsZk8pIYe2k49TKorKFynKYPSP2m5C0IooKdiLpcii2bKXUchhoNBw7Xafi4xxbf+8XQVCK5SNABQE3sjUO6Tbd/CxCa7EvD0j/lS6rZulY5XLckbZKiZS64mcz4sYd6zW7nYRQ0YqFds4d8TDDixi5t/WOmT7rMMmkCSgDxAGuXO7s3jMo604WZLK3nQxomGL5QwIkVOh/Opb2E3Jd0BsLM4jHh69f1BYm+gMzULle4YuV0cwzJweOrWCsA00BPWavODYIgMt3MKWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjcDbTs9FdX3fXZwA90xbytMzlO4CTXr03GT3vdQAU4=;
 b=eSwSAKPNlw5j/elcsov0kt3UAcEeQSF6LCVpvuKmb+0j5DdvRhm5laHXNmhhhSlTdeZzHRVwMuaJLWa9ctEcXS+WHdO7YgU19j8MbHlouexKhHNxX/WaYp7PVzvn0cNrsVANcBs19W5OF3D0G5Zi9vZ6bkX7eRVYPQniOe4kUorYcMRR1dUp79f1S7JqD7YUYGseYjx478JId26nBQc3GVrirOB7guOUFB2lvwPaLMlJiieDiovE2mHUKL8/sUrQb98o3G2+zrI9Q1usoHpC3ulPqUtEfl83sOEt2P6V77zfr7sAYMCKYRL7hIJWbj5cJRvj6PPL/jjARP+zB/cuHA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AS8PR04MB8293.eurprd04.prod.outlook.com (2603:10a6:20b:3fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Fri, 2 Oct
 2026 16:16:13 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%6]) with mapi id 15.21.0472.015; Fri, 2 Oct 2026
 16:16:13 +0000
Message-ID: <e469d168-39f9-448c-a7ab-5d02b79d8cb8@nxp.com>
Date: Fri, 2 Oct 2026 19:16:11 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 6/8] media: i2c: ov2312: add Omnivison OV2312 driver
To: Rishikesh Donadkar <r-donadkar@ti.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: tomi.valkeinen@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com,
 kristo@kernel.org, sakari.ailus@linux.intel.com, mripard@kernel.org,
 jai.luthra@linux.dev, jai.luthra@ideasonboard.com, devarsht@ti.com,
 y-abhilashchandra@ti.com, laurent.pinchart@ideasonboard.com
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-7-r-donadkar@ti.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20260925133001.2780868-7-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::11) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AS8PR04MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ce22ec-8181-4342-1e31-08df20a07aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|19092799006|260925021911599003|260925021311599003|6133799003|260925022911599003|56012099006|10067099003|11063799006|4143699003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cWaPcY2pg29A9UYHKXBaTcyrWisQrixkXyeKL3bHiNaCGt2lzawpkKGfIkW2T3wzhMkKnTbS+tj4o3HOJnzyd3wqSwocrr/e3t/B016xwkJwIA0L/gd3Wwc3R9rRCouRgxX0k+vKxM7pYX6oyA8aWg8JoR5voS/xYyYE2i+EIHzsYNhbOZUNOmS1i3P6HrOsI67iGrUox81yAqnHmL4LVoByFgCvktp9Kv905qDruAyrQGCKk4mtVkloK43S8KfGHuX/ptjkY37y3kr0jprQKDs9KX6QBxM/ZV4Qi4sJYQRQbhWPaLZXVvjT+ssF/uyR3he5ZHA1XAn2Oe557nCaWbnyoIFk913cpKJx+khL+IPym5rJk9U0KRwmCIvwJzbBM+Y6SkJIXEQi7yIwUa++RBJT6YiaPeBhMarIaJP7vviA1TMOSxWcRMv2a6sfpI6ufCaFP5B8jGY9ig013u/i8hWJGn6iDIyb2TPr4vSqfWec2yZ+6a4zOt3/fKvZaVKzfpvaD0MZetLCB74hnE8YLQfu4+tvIsyVsPMvckib1cqQA3Rv74lOMc3/6hJc7h1r7j8Tb7kdGsn7OLX+CjT2BQVWvR+7I9aHNTkeL8kZbY4DtZWv0h4P0tuTJmGSPPMG8Tt5fCPO6i/8dnpZauLNbfQ8hFED2EBJbpymmIWi4Do=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(19092799006)(260925021911599003)(260925021311599003)(6133799003)(260925022911599003)(56012099006)(10067099003)(11063799006)(4143699003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFhXaFBWbFluNWdCNzl3NmVaWFAxSDFzaG4xb3lLQlQway9SUXhrYTJhUUFr?=
 =?utf-8?B?ei9PQTZTVFhZem0vUHdvY1ZyYlFGZTl6ZCtubHRvZHo3WGFMamt2d2xNTXBX?=
 =?utf-8?B?cnlLQldaMWtYSEdONGMzOWhsbWRHUmtQODVZYnZ5TDRiWktaUk1jQzdCS0Nv?=
 =?utf-8?B?cDN6cVFyZ3Z0aXNuL2pmWFB4VDhDRmxwb056ZHQ0U1NaM0d0akY2Q2FKN1FX?=
 =?utf-8?B?VEkrZzkrYVBJeGg1SkNQSUxCSVJHUjhjU1A2OUJxTFNjZmt5UjFEQWN0dEZn?=
 =?utf-8?B?TE1EUkJnam9OY09tMERsa2Uyd1BjZDdPNWYxdVAwUkpsZmFUckE0QmlqUklC?=
 =?utf-8?B?WWdoKy9oR3dYMnBWYzBZbk92ZjZBTHJTMXJFTmc5elVYenRxRzNXMXgzUXRE?=
 =?utf-8?B?bjVIMlE0cGtMOFNmSS9HOXVaczJGVkErenNrTDUzNHlKRnpYNWJZRjRpYng4?=
 =?utf-8?B?RkNPaVo4ZUgwaXJ4T1VWLzdVWHBFcWpEd0ZLK25kWEQ4UGJ3Q2JpTVkyenNM?=
 =?utf-8?B?czBvZ3drOWNRb2dOSjlWeWtndjZQcytUcGc2SlNaMlM5bXViajMrTmJOSXhq?=
 =?utf-8?B?N1ZJTXZOWUo3dVRvM25mSGNwSHNPWko5aUxSbDF4bjkzTnFCNit5bHRka1li?=
 =?utf-8?B?Q3VMcGpYbDVQU1ZYSUJ0Um1XNTN4dlZwSU5wK3kxb2Q3NjRJK1gxeVlvalli?=
 =?utf-8?B?amhYc3lVN2E2dkk3aEt1UG9MUEZlaGtnSWcxY3VmYVc2Y3pMa2EzdCthbFhD?=
 =?utf-8?B?ZU1mSlFqS1Bib2s2TlRFRUJIc2Yrc0dwZzI2RldxNlRaV1psSkRHcnVFZW9W?=
 =?utf-8?B?RHhydHZOZjdOd3RTa2xHRlY0a3d2dlJxaGlTL0VQdy83S0NMNG9TUzY0dFZR?=
 =?utf-8?B?bTduYWltcVlVck43bVZXOUV4NHpaMnRmYmZkazZzdVZJMmk0V29Ld0dLRkVo?=
 =?utf-8?B?WGlmTXFoWlIxZXRNWFNTYVhUUHVzckZoZmE1MjlVazdmaDhHRzZrOXR1cEJP?=
 =?utf-8?B?OFJWYnV4WTV2NzBlLzFaSWtteGpuU0h1aHd5c2wvUlRrMzdBT2JrU1JzMDRw?=
 =?utf-8?B?NFZTNkF6ZGpHaFk2NEdJbVZpUHBMQ1lOTHlySkU2WGo0WFpLOTRKd255R1dL?=
 =?utf-8?B?bmlFNGFVbnJHZDNRK3VPdzd2ai9xWFo2Z3hLQ0syYThqQ2pab2J3YUdydkF1?=
 =?utf-8?B?cTExdStyS2NKdEtaajFUTnRvajAxZU00OVZCT2ZIL3FlMG1YRDkrOUFnS1ZF?=
 =?utf-8?B?ZGN6RTRZNDc3b2x0UytGdE1CQ1pQcjFCTHRIc0tmLzBEeDBpckN4M01wU2Ji?=
 =?utf-8?B?MVRibmw5WXRRN1JNMVBUZjNhV1RBWjF3ejVJU0xSL0NiNGpHdElVT083U3Jm?=
 =?utf-8?B?YTk2M0xUUGVTdVA2SG5Ka00vNGw3dkpzeUJ3ODM0alpHRTZheVJpUHdHSFVw?=
 =?utf-8?B?SjQxZmZSQzJFSmRzRXRVSHZidjM0YnFaazh6VUJ4TUZjSWVyVExhYTc2cSth?=
 =?utf-8?B?VlMzYVRFelBKVkpDZktob1o0dkhXKzIzWEl2am9WQzhCcTdHd2JseUVaLzVK?=
 =?utf-8?B?OTlSV1Zta2oxYU1TMjMvQmlqUXV5R1Jqd0k0MUZmcUFBSUZxWitJTEc0K3V5?=
 =?utf-8?B?QnVzWld2aGxHWU9FanlYeXYwaWZ2dFBPZXdJVytRS0lXVTF3MUZ2eEIyUyt5?=
 =?utf-8?B?TEJ1WjVpN1doN05VWEFZV2trMTd5azFScGd3SDFJQm5sTW8vNGhpZWRoa0Jm?=
 =?utf-8?B?SEJNWnhjcTcxZjFCMzZsSDcyNUUrL0l3VGZWSU9vZTloN21ncUJwNm9BTWlM?=
 =?utf-8?B?WXdzeVVZOG9lVlZQWUE4aEk1cUpTUnBTR0paRlVmcEJVVHl3MmtqTUdIN1FI?=
 =?utf-8?B?UkdwTi96bnhvbjNLN2NjaFZ6WkppVDFOekE4UzV0YzlZVlN1QkFKbTlPbjRE?=
 =?utf-8?B?Wm1jMk9seUlITVZRYXhpOWZiWk5RRkhEa2tjcW9XRXh2QmhZSXNYVEsvdERS?=
 =?utf-8?B?VWFRaXBERDVtQldYeDRla3lpaWYxK2FKUlQ1UWFZdzdSN1N6YWJKTnp4MjRs?=
 =?utf-8?B?Y1lSU0diSUwyWDJRUzJjRXM4V05XWTlKVDJGWUpMeEhWNExKK2c5bGNiNFJL?=
 =?utf-8?B?bEgzaHYwWTNnLy9QMDUxMTgxa1FkeTk5WjhRNjdiUFRHMXplWXY4WmViZHB1?=
 =?utf-8?B?NU1raGpBZjBKazBaNGZYWnVMTEdTY3d5MmI5MWNjK0xpLzZxSHFZY1hUMkFx?=
 =?utf-8?B?eFFXVGhCN3pXdTNEejd3aUNRd3lESW9FK29CK0JEUitLTEUvajVKVkN5MDkx?=
 =?utf-8?B?OGVEZWhPdXJiSFN2cWFvOTFwVURjV0lVMTFyMlNpNGIxLzNwNG1JZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ce22ec-8181-4342-1e31-08df20a07aba
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 16:16:13.7818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+towQu4CuRwpbBmBjOrETV0bMf0il/gL5xNGsC6aHZGeL5t59ZnUKSfqksn3bxdTWG6AB4BehrEfp7wWvkWVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8293

Hi Rishikesh, Jay, Laurent, Hans, Sakari,

On 9/25/26 16:29, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
>
> Omnivision OV2312 is an RGB-IR sensor, i.e. it uses a 4x4 R,G,B,Ir bayer
> pattern to capture both visible and near-infrared light. Every alternate
> frame, the sensor changes the exposure and IR flash strobe registers to
> stream an -
> A. IR-dominant frame on CSI-2 virtual channel 0
> B. RGB-dominant frame on CSI-2 virtual channel 1
>
> These A/B frames are routed as separate v4l2 streams, which may be
> mapped to two separate /dev/videoX nodes by the CSI-RX DMA driver.
>
> Both of these streams are captured at a resolution of 1600x1301, 30 fps
> each (60fps total). The extra row (1301 vs 1300) is an embedded line
> prepended to each frame by the sensor, containing the following register
> values:
>    0x4813 - VC (Virtual Channel)
>    0x321A - Group ID
>    0x3920 - Strobe
>    0x3501 - Exposure HI
>    0x3502 - Exposure LO
>    0x3508 - Gain HI
>    0x3509 - Gain LO
>    0x350e - Current Exposure HI
>    0x350f - Current Exposure LO
>
> This driver also supports a few v4l2 controls like horizontal/vertical
> flip, multi exposure and multi gain controls.
>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>   drivers/media/i2c/Kconfig  |  12 +
>   drivers/media/i2c/Makefile |   1 +
>   drivers/media/i2c/ov2312.c | 939 +++++++++++++++++++++++++++++++++++++
>   drivers/media/i2c/ov2312.h | 285 +++++++++++
>   4 files changed, 1237 insertions(+)
>   create mode 100644 drivers/media/i2c/ov2312.c
>   create mode 100644 drivers/media/i2c/ov2312.h
>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 4d9946479160..8d9d8d491b2e 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -496,6 +496,18 @@ config VIDEO_OV13B10
>            This is a Video4Linux2 sensor driver for the OmniVision
>            OV13B10 camera.
...
> +
> +static int ov2312_read(struct ov2312 *ov2312, u16 addr, u32 *val, size_t nbytes)
> +{
> +       int ret;
> +       __le32 val_le = 0;
> +
> +       ret = regmap_bulk_read(ov2312->regmap, addr, &val_le, nbytes);
I've received in the past feedback to use cci_* helpers instead of 
regmap, see drivers/media/v4l2-core/v4l2-cci.c
> +       if (ret < 0) {
> +               dev_err(ov2312->dev, "%s: failed to read reg 0x%04x: %d\n",
> +                       __func__, addr, ret);
> +               return ret;
> +       }
> +
> +       *val = le32_to_cpu(val_le);
> +       return 0;
> +}
> +
> +static int ov2312_write(struct ov2312 *ov2312, u16 addr, u32 val, size_t nbytes)
> +{
> +       int ret;
> +       __le32 val_le = cpu_to_le32(val);
> +
> +       ret = regmap_bulk_write(ov2312->regmap, addr, &val_le, nbytes);
> +       if (ret < 0)
> +               dev_err(ov2312->dev, "%s: failed to write reg 0x%04x: %d\n",
> +                       __func__, addr, ret);
> +       return ret;
> +}
> +
> +static int ov2312_write_table(struct ov2312 *ov2312,
> +                             const struct reg_sequence *regs,
> +                             unsigned int nr_regs)
> +{
> +       int ret, i;
> +
> +       for (i = 0; i < nr_regs; i++) {
> +               ret = regmap_write(ov2312->regmap, regs[i].reg, regs[i].def);
> +               if (ret < 0) {
> +                       dev_err(ov2312->dev,
> +                               "%s: failed to write reg[%d] 0x%04x = 0x%02x (%d)!\n",
> +                               __func__, i, regs[i].reg, regs[i].def, ret);
> +                       return ret;
> +               }
> +       }
> +       return 0;
> +}
> +
>
>
>
> + */
> +static int ov2312_set_group_a(struct ov2312 *ov2312)
> +{
> +       u32 ir_exposure = ov2312->exposure_multi->p_new.p_u32[1];
> +       u32 ir_again    = ov2312->again_multi->p_new.p_u32[1];
> +       u32 ir_dgain    = ov2312->dgain_multi->p_new.p_u32[1];
> +       u32 ir_strobe_start = OV2312_VTS - ir_exposure - 7;
> +       int ret;
> +
> +       struct reg_sequence ov2312_groupA[] = {
> +               {0x3208, 0x00},/* Group A (IR Dominant VC0) */
> +               {OV2312_AEC_PK_EXPO_HI, (ir_exposure >> 8) & 0xff},
> +               {OV2312_AEC_PK_EXPO_LO, ir_exposure & 0xff},
> +               {OV2312_AEC_PK_AGAIN_HI, (ir_again >> 4) & 0xff},
> +               {OV2312_AEC_PK_AGAIN_LO, (ir_again & 0x0f) << 4},
> +               {OV2312_AEC_PK_DGAIN_HI, (ir_dgain >> 8) & 0xff},
> +               {OV2312_AEC_PK_DGAIN_LO, ir_dgain & 0xff},
> +               {0x3920, 0xff},/* IR Strobe duty cycle */
> +               {0x3927, (ir_exposure >> 8) & 0xff},
> +               {0x3928, ir_exposure & 0xff},
> +               {0x3929, (ir_strobe_start >> 8) & 0xff},
> +               {0x392a, ir_strobe_start & 0xff},
> +               {0x4813, 0x01},/* VC=1. This register takes effect from next frame */
> +               {0x3208, 0x10},
> +               {0x320D, 0x00},/* Auto mode switch between group0 and group1 ;setting to switch */
> +               {0x320D, 0x31},
> +               {0x3208, 0xA0},
> +       };
> +
> +       ret = regmap_register_patch(ov2312->regmap, ov2312_groupA,
> +                                   ARRAY_SIZE(ov2312_groupA));
> +       if (ret < 0)
> +               dev_err(ov2312->dev,
> +                       "%s: failed to apply Group A register patch (%d)!\n",
> +                       __func__, ret);
> +       return ret;
> +}
> +
> +static int ov2312_set_group_b(struct ov2312 *ov2312)
> +{
> +       u32 rgb_exposure = ov2312->exposure_multi->p_new.p_u32[0];
> +       u32 rgb_again    = ov2312->again_multi->p_new.p_u32[0];
> +       u32 rgb_dgain    = ov2312->dgain_multi->p_new.p_u32[0];
> +       int ret;
> +
> +       struct reg_sequence ov2312_groupB[] = {
> +               {0x3208, 0x01},/* Group B (RGB Dominant VC1) */
> +               {OV2312_AEC_PK_EXPO_HI, (rgb_exposure >> 8) & 0xff},
> +               {OV2312_AEC_PK_EXPO_LO, rgb_exposure & 0xff},
> +               {OV2312_AEC_PK_AGAIN_HI, (rgb_again >> 4) & 0xff},
> +               {OV2312_AEC_PK_AGAIN_LO, (rgb_again & 0x0f) << 4},
> +               {OV2312_AEC_PK_DGAIN_HI, (rgb_dgain >> 8) & 0xff},
> +               {OV2312_AEC_PK_DGAIN_LO, rgb_dgain & 0xff},
> +               {0x3920, 0x00},
> +               {0x4813, 0x00},/* VC=0. This register takes effect from next frame */
> +               {0x3208, 0x11},
> +               {0x320D, 0x00},/* Auto mode switch between group0 and group1 ;setting to switch */
> +               {0x320D, 0x30},
> +               {0x3208, 0xA0},
> +       };
> +
> +       ret = regmap_register_patch(ov2312->regmap, ov2312_groupB,
> +                                   ARRAY_SIZE(ov2312_groupB));
> +       if (ret < 0)
> +               dev_err(ov2312->dev,
> +                       "%s: failed to apply Group B register patch (%d)!\n",
> +                       __func__, ret);
> +       return ret;
> +}
> +
> +static int ov2312_set_AB_mode(struct ov2312 *ov2312)
> +{
> +       bool ir_ready  = ov2312->exposure_multi->p_new.p_u32[1] &&
> +                        ov2312->again_multi->p_new.p_u32[1] &&
> +                        ov2312->dgain_multi->p_new.p_u32[1];
> +       bool rgb_ready = ov2312->exposure_multi->p_new.p_u32[0] &&
> +                        ov2312->again_multi->p_new.p_u32[0] &&
> +                        ov2312->dgain_multi->p_new.p_u32[0];
> +       int ret;
> +
> +       if (ir_ready) {
> +               ret = ov2312_set_group_a(ov2312);
> +               if (ret < 0)
> +                       return ret;
> +       }
> +
> +       if (rgb_ready) {
> +               ret = ov2312_set_group_b(ov2312);
> +               if (ret < 0)
> +                       return ret;
> +       }
> +
> +       /* Wait for 1 frame duration after setting AB mode registers */
> +       if (ir_ready || rgb_ready)
> +               msleep(33);
> +
> +       return 0;
> +}
> +
> +static int ov2312_set_orientation(struct ov2312 *ov2312)
> +{
> +       bool v_flip = ov2312->v_flip->val;
> +       bool h_flip = ov2312->h_flip->val;
> +       u32 reg = (v_flip ? 0x4400 : 0) | (h_flip ? 0x0004 : 0);
> +
> +       return ov2312_write(ov2312, OV2312_TIMING_VFLIP, be16_to_cpu(reg), 2);
> +}
> +
> +static int ov2312_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct ov2312 *ov2312 = container_of(ctrl->handler,
> +                                            struct ov2312, ctrls);
> +       int ret;
> +
> +       /*
> +        * If the device is not powered up by the host driver do
> +        * not apply any controls to H/W at this time. Instead
> +        * the controls will be restored right after power-up.
> +        */
> +       if (pm_runtime_suspended(ov2312->dev))
> +               return 0;
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_EXPOSURE_MULTI:
> +       case V4L2_CID_AGAIN_MULTI:
> +       case V4L2_CID_DGAIN_MULTI:
> +               dev_dbg(ov2312->dev, "debug: %s: %s = [%u, %u]\n", __func__,
> +                               ctrl->name, ctrl->p_new.p_u32[0], ctrl->p_new.p_u32[1]);
> +
> +               ret = ov2312_set_AB_mode(ov2312);

So, the group hold for A/B context is set right away, when the control 
arrives.

While working with the Omnivision OX05B1S, which is also an RGB-IR 
sensor, we run into this problem:

The normal expected sequence is that the sensor will output alternating 
frames VC0, VC1, VC0, VC1,...

But  when user space tries to do automatic exposure and gain control via 
v4l2 muti controls, if the driver applies the values immediately, if the 
virtual channels are not switched within the proper timeframe, it is 
possible to run into frame duplication (no more nice alternating frames 
VC0, VC1, VC0, VC1,...but duplicate VC0,VC0 or VC1,VC1).
The information we received from the sensor vendor is that group0 update 
needs to be between 2 group0 launchpoints (similar for group 1). We can 
use the status register to query the currently active context, and in 
order to avoid frame duplication we can update each group only when its 
context is active.

This is problematic in the v4l2-api context, it implies that even while 
streaming, a v4l2 control cannot be committed to sensor registers right 
away.

Even with workarounds in the sensor driver, to defer for later the 
updates for the inactive context, it is still problematic: defer for how 
long, and problems with overloaded systems, a stress test can bring us 
in a broken VC sequence, as there is no atomic way to determine the 
current active context + update the right group.  A broken VC sequence 
shows up for example in libcamera as lost frames.

Rishikesh, Jai,

  did you notice this problem on OV2312? A way to reproduce this is to 
stress the driver with frequent repeated set controls (for the 
multi-controls), and observe broken VC sequence (I observed it with 
libcamera and on the CSI analyzer).


Laurent, Hans, Sakari,

did you encounter similar situations? Any comments or proposals? The 
concern here, to summarize, is: v4l2 control cannot be committed to 
sensor registers right away (even when streaming) and we are also unsure 
when the right moment to perform the register access may come.


Regards,

Mirela

> +               break;
> +
> +       case V4L2_CID_HFLIP:
> +       case V4L2_CID_VFLIP:
> +               ret = ov2312_set_orientation(ov2312);
> +               break;
> +
> +       default:
> +               ret = -EINVAL;
> +       }
> +
> +       return ret;
> +}
> +
>
