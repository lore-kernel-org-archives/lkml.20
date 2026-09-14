Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87C844AB6C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402169; cv=fail; b=fJxqdhrViBGzU6F2EknuV5XbQSt1zdomuH0qECeMxCWW1UMqkGipuI7phh3FMxOulaNYKjo9QjHTVMtswazThOiAxDRy4NcQkfrvAR+akN6JzqQpkQxqROEkHYzaXdn0Kr9j757JGUDrueWg2/0LASJP3MpF06AmK9EWz6NKx1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402169; c=relaxed/simple;
	bh=KVwTLmh5ABaYK0Ap0cV523qZaQwyRV6xOBwduqAC9dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TrOyWQ8u+1K6atYcMs8cdZAhlSk9SnmXTm36j8r48j3n6fvX2ANaz7hyd2+2a3vu6Wyl+/rlSVLJEXkJmb84s/TScZ8lFeI73Pj/SAQXsAcaIQFA3ooU8muxGKPTwioyRpkhbHyMssrs3XmFVQUPdKpRMHGk1L7ya69RlK+EkjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fNSSVYpw; arc=fail smtp.client-ip=52.101.65.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fNSSVYpw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhiSjtU772+xWE9Lvh4NRj/6aRCSCkuRvpshbXZCYUWS5rp0UjIvBb363cdfVx9HSb0rp6NL+7DY/zF2yjJcpQwOWOOUy2ZSD8clZs6fiZYThTUFJ0OzcnrFIuaQSXPKcQZGUXkeD4zSJ1j5DfW8ZaeLcwPmNZvhEexn0oyrduxP9vcukWVks7eV4Ox55OYhUGcxHOogKfYBQnJBNho1Y1iKAKCx1zIgYKQELo7/SvYHgJYU+D8yeA8SVA2EkXFoXpRGFIzEyNnUXBo/iGXfsJvqZ969H/CQ+ByInYV/dI3ctdft0U4cHRCzlPvkQVKKrKRC4awkJnkSbd/CB0rbxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbevxkp7/fXdXjTZgwcXTY+9eDscR5gfc+QMKEKmc3A=;
 b=hpBdNn2Oh9moPN8x0AiZOqHah62AvKyZNOfAMu3j1rob68y+9sAlzhZJdDcym2aE9M2RTkDyDL7fBKTBvZshtZggU4JwfqslVAZe2A+UtAzwO4HPIe0ahN0KbvLdWuWtY6p8rhV+PXQatDoBZTovPn+Q4c6Uw8vU7JF3veGU1lQqeISdfaCv7c3VawXjduU1iIK0t5ZPGtqSAkKg8vECPDt+Jy1YRjBGawYB0gHCmhS7UjY3sCf4uM4jU3LGuCn68YeaTqqC/83SU92AFQTis7mzqtXDEG7nNaI24VDOvz6piFiJdlH8FxAprxbxMTGtPjaEWonulVw1UlNl/2tPrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbevxkp7/fXdXjTZgwcXTY+9eDscR5gfc+QMKEKmc3A=;
 b=fNSSVYpw+fiolmo57xNfAE6foIINagwcL88SFg4eKS4cOwMqpil8xJYYVwnH7u6pQFxqCZTVmYBzh3KL2nz+OybNvBjkdi54jvIRQF4Urp191cSk+B0Xcx3u5QIo/jUFt/xDWDPNBOMQu6IrUyDYRAVaSRiyuSZmXFrPIUjX1FZv+UVyHjTPm/x5uYjskg3R1qqF+HP4SH6eFRCyobEWaRosPv3DJi+Y3kYIE0/Rm3WNYDKxYVjKDwsVf8MJtj9Uq/FFEH3s3jiELY+ruRgBXAWVtwa9jrPGnCxRS86erTw4nurpw8zHG+XY/JaKX1tmyDsraeq5ZUwiFXPjhS9Uqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:09:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:09:24 +0000
Date: Mon, 14 Sep 2026 12:09:17 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/17] i3c: master: Fix out-of-bounds read in DMA bounce
 buffer setup
Message-ID: <aqgcLXl1REso_GCP@lizhi-Precision-Tower-5810>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-2-adrian.hunter@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914113003.183150-2-adrian.hunter@intel.com>
X-ClientProxiedBy: CYXP220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:ee::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d9b8732-85b3-4004-009c-08df127a8b0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|19092799006|366016|6133799003|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	pT94XSbpPnNtlz59M1GQ8oZSUevLP6EvyFbp/0jCHFldwo7cvPi7MRXRqoAPVlSde6fq2CUNzFaB2J0D263IYDqMU04syvFpdSxUdM0Vxfjos60fGP3JAfYLq8+sK9NFsZG2YM4qPswb6eRntxRKZrAs9ip7pDF72SgHKXwEiorKoAvGhkMyXqYRRtma20aTqp63rJQCjguYmC5txKSa0dp88eT+xLtUINhQUPLDGM4q9R6P3UZoZaP7rLcS/dKYQinNLSwA9xwymnKpP8Fl8J91wv7EXtrD6BKDbtJuYjcIQh+CFVQo6W4Vy1yrHrpcrq7FBR12sxk2IQJnQ4NiwmR9qjGTLYvr43D/okhasDndVuTimNCofFnf2Ig+5bILT0Sx7SZB/XUDD+G9vfmP/piFXQDn1XQBDb5+9TakH55DuofA3wUjLTIN1rILwTY96d/Omt3Y68T9gQ2nn8kfYUaIleiqdf425BbUmDyDz+fCoAgAIo07PmEEXzbzrsTujGHqr+xyy2VoqryO9yOmgsAh8tmpmhoVii3qBYe4KOkOBx2+iPARlMTqQ/BpT9aNNjI+QH64pEJqSlDad77YWBi4lfRSKbdq+hSWWvvBIwa8TS0TceePIKAFCfXoYd5Nan2gDq7IJDdzLVH+bdtmbwMOjsOWYvXIHLNhJ3Vkpz0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(19092799006)(366016)(6133799003)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n/DN/s2D+O0wxji9i9+/hruDc4F0ff7bYkN4dDlfiQVmHd0dmKVntfRbIH75?=
 =?us-ascii?Q?UiahDVXOzKtwzQpMu90pBDN8ZB4/zP4c7Aa5cqS9uvHgPOXl9B03v80157Or?=
 =?us-ascii?Q?vtHUqlZTMz3I2NtYb5tdoHtYyNXJ9DPEvQjRjFgvTtVH7VFJEl6Fk5wqATAi?=
 =?us-ascii?Q?+tlDrS3zIRtXT4rzY8qr6pc1/fBbE8lAvsxBBXpf+cc/XA0om0Fp/ldSuWMW?=
 =?us-ascii?Q?8M9QchKMV/FU+Q27f9lytlyI9/vFlJtL0bAC7qfQNc2IuvM/FqnK+jx2CSwX?=
 =?us-ascii?Q?XZC3S/g/xY67TSzH0VO2nrUx3xN2pAGWwYk9HKqabOci/iM4HOf6Q59XlTX9?=
 =?us-ascii?Q?WaxeGo3lfk7r/0vgrNaQF4ynLYHiPaOwNkFBpSDT82PK1F9orwNbTsmJTIeO?=
 =?us-ascii?Q?VlAdl9l/I0k1UHaC3y98nbAQvx41dDprKkUg3RS0Ut1tgvqDe9Zcfd5cpHGs?=
 =?us-ascii?Q?c0HQrO4zAc/54PqEoQOa1eGxDKQ42GbRHDAvd/aE5q8ROZvxJ/HMcXyf/mMC?=
 =?us-ascii?Q?Q2rvvqBv7g27fEqoYrVna2fwDtjTEEW5I0h0IF4ZKStcE/bF2G6cQXzI1Mti?=
 =?us-ascii?Q?RRucc8pdF7sjM1geJkIwPad5BjossfHIarCeXudEr500IRg8du0hkuM63YfO?=
 =?us-ascii?Q?ooE4JRjzA3vZXcK3Dbx1lPj8ijTIZaS0h/l1H/hDEevc9XxjRxoZViehFpTw?=
 =?us-ascii?Q?/hMIflErvry5X75/U/chH81ymlnHpcDuCoPG8rIHVh2D4aBjV8EtzYkIJkmh?=
 =?us-ascii?Q?EdcsnGfdlZcvVhjahUXQv995HGkpDSs82XbCyvOowqZaK7YVHBhPlPrDipN/?=
 =?us-ascii?Q?nPo0tPu07JRFh6uIOGl+hW1RW8BmcnV+puRledPBhQyEyKLP803uEOtOEanO?=
 =?us-ascii?Q?G+fUT0BYaCycbg/DIYlu56kRaqyx/8MZFwKzUXdZo4xGLU9nDUZaiTdK7k4M?=
 =?us-ascii?Q?WNRLI6+ZRyuJYfgRUAkqREtoIg9rNq15pP1hF9yGmRyMROotNhHNGNiFj5d1?=
 =?us-ascii?Q?/33ORpnhU1ijQ78DhjqFMraRfvXmkHFc0C31vd6dWw7Xz/nYpIQh56CHdOYB?=
 =?us-ascii?Q?QCHSdZ7C9BuYw6W+890rJYfc+OF5fGn62dCh3fHt6MmLMGFANDUzXHr5wjLQ?=
 =?us-ascii?Q?CQ06qj0zXMKd86YcSPgKMoTCqB3s/ywHuCAL/dQlLGUgkbOuNLEWs1Q5ew6L?=
 =?us-ascii?Q?SQtHdB8IM7Izvd0L1uFiqU2ADzsKsqeDzR1UuFN8R+AcfZycy2YcuAj3dzIB?=
 =?us-ascii?Q?UJWbNTbJLeluxFrWBPOFkcseyraU1RiiZT7KPWMa8gRJuMH6VAcWte4QOk3s?=
 =?us-ascii?Q?A1lVMVGgr4FzKXSu3lAe5glFcz07UwCI9OTQXDihQCUJAvgVHA38TCR37nRt?=
 =?us-ascii?Q?QMWlzChPzbXiJzSDkWgkmnTSfNVHqaBZda1ILtVzovxrVaHr+i0DJIW1u3Nx?=
 =?us-ascii?Q?luXKKv9zvMdecjbdPl2M6WMeQtt8zL6L+DH5ohkt6LZxur3K0RU9S9N5pzNb?=
 =?us-ascii?Q?FufxCsbiVQAZWRNbRGG/u5dM6OWoAyNVgV4ZtR1nysXswseoy0IKf6OypdVH?=
 =?us-ascii?Q?lsWmhVtn9d7t+KTIgkfQ7jOAxwD8URTJXByyFcwrGn3p96WCfXlWabXLkAWG?=
 =?us-ascii?Q?Dr0cX6mrHywslanzn36xmMsrHZQFNXz87TJwnAV9tE/UFKP/dqpQr98klsfm?=
 =?us-ascii?Q?ylXWPg2+xRzD2tQ+MjpxF5g9V1lJ7Lp3SkABQ1PufMQJTAp+51ktO2a17+41?=
 =?us-ascii?Q?FN/H+4elRDeQRYejV0gBlRSchop2iVndQGT3IyUh7PywtJ6NxnIA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d9b8732-85b3-4004-009c-08df127a8b0f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:09:24.0261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rXIBrsNPCcrpbC/O2ZZ+i/VMsr53zckwQuYF2cmVvOV5zERsbsD0dFLz7TxTH1d6QRujR9GVvR7C52sWY4+ti2zlBj7xoXED5Mb9uhifI504x0p3OBnLfuq9jG/X+qIK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389

On Mon, Sep 14, 2026 at 02:29:47PM +0300, Adrian Hunter wrote:
> When a bounce buffer is required for DMA_TO_DEVICE transfers,
> i3c_master_dma_map_single() rounds the DMA mapping length up to a
> cache-line boundary:
>
> 	map_len = ALIGN(len, cache_line_size());
>
> It then allocates the bounce buffer with:
>
> 	kmemdup(buf, map_len, GFP_KERNEL);
>
> kmemdup() copies the full allocation size, causing it to read map_len
> bytes from buf even though only len bytes are valid.  This results in an
> out-of-bounds read of up to cache_line_size() - 1 bytes past the end of
> the caller's buffer.
>
> Fix the issue by allocating the bounce buffer with kzalloc() and copying
> only len bytes from the original buffer.  The remaining bytes up to
> map_len stay zero-filled, avoiding both the out-of-bounds read and
> exposure of unrelated memory contents to the DMA engine.
>
> Fixes: f8d9e56aeb87 ("i3c: master: Add helpers for DMA mapping and bounce buffer handling")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index afcd7a21a3e6..f9a6c8560fab 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2216,12 +2216,11 @@ struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *buf,
>
>  	if (force_bounce) {
>  		dma_xfer->map_len = ALIGN(len, cache_line_size());
> -		if (dir == DMA_FROM_DEVICE)
> -			bounce = kzalloc(dma_xfer->map_len, GFP_KERNEL);
> -		else
> -			bounce = kmemdup(buf, dma_xfer->map_len, GFP_KERNEL);
> +		bounce = kzalloc(dma_xfer->map_len, GFP_KERNEL);
>  		if (!bounce)
>  			return NULL;
> +		if (dir != DMA_FROM_DEVICE)
> +			memcpy(bounce, buf, len);
>  		dma_buf = bounce;
>  	}
>
> --
> 2.53.0
>
