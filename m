Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010067.outbound.protection.outlook.com [52.101.84.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FBD4A4F13
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789681265; cv=fail; b=hSKv2KKuYFb12U7PYXZ5u0eR5E03203MKzpG3tReLSyz0IBzAK5JYsSU9YeMTY+BhtFEmY3SSzPNU0FK+CFLPTAPZrixPngBPfOmh5xNYBpkk0SfSwCGO8rtHmCcuGoOnKKwevX02O1JJqF03PoJpy8696K0Tmg+T1X/YOhTTXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789681265; c=relaxed/simple;
	bh=dZbNCqj/kBFxUicAVQFrN2+qMHTCh8n/q5PpWNkyy8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FQlKKumRflnR165rKcyZVrZINTCWLIb6kSCbvsqmsKu1mMOh6SsYvTC616fu0boJN/Qmr8M9A02yyCgJvsOOoSzgjXAk2mcvqCIfKN08itg0rzB7rZwLM+Jfuy51pXtINdAuMo8NyfPhFI/dn0qwX/+ktyEFFXZ/uIkeEz8GGEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RnPcY80j; arc=fail smtp.client-ip=52.101.84.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RnPcY80j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUm4i2FxnPGrwAxN0cMBA+GvN0gzqW+t/MmG/fAdP6HeO2qtB8mirOOOHipHy7YoSb/v6cS7MshDmtwJzoRAEwwA248Uw/z54/D3luJAdO/nB4Go8cOTbNsIjykb3m9Rw1zNrNd2y3OYPDLMeo0LYTd2DwhxgfM6+mX4iraieThOw23CXZRCc24E0bgP5ZXHUhJ27C2JCtuXC5Nq+dxWbly4kBHI9BU3iSEIqBWZNFKm4S31fg8EBPkXnXNot0aFTjOMAV2ftLHHf4I4yK9+BIudoUHwGEYvMC3NhjhLMlHCxzf/Lb49xy+1vRk+vtqI8dA9tMWPuhKLO5bv9+OQ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJoMHqphf6e+1Mk6R5xpcNn52khY0+DKl8D/fZDmtJU=;
 b=yB0xLvrzyqHlDtMGOCcp/m6Z3vT5eGNVbb63P0KoidBmT+7bzZv8vNC5NH9FF8B/TfHLaAMr17sOEjxrGyRsCLIHTNUhGiZO2opUlG/VW/XhNvHJu5yRUd9sH3hFJmEA5YlFcjqsaNBwgeU5weMK3ikJBEBiomhS7N0YlBTk4esgqDXP/vt0MCS2w3vG0HwYu4j23sOQEt7fAdtBzVa3xkbr29lCDnFIvADIZOgF7AF+NscfFMCQFK5tvwo69cNPe3+Ouxzj+fZdbsaSqTpzCE3WoaSLNTHuXIf2ApJvFf8/ijcmYX69NrWB5u9ywk7GDs+VKlWXlTNZRBo7+6su1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJoMHqphf6e+1Mk6R5xpcNn52khY0+DKl8D/fZDmtJU=;
 b=RnPcY80jAf70c1pJfvGBYF+8jblppZonuGumoOYg3QFJkb1dJ9GxzG34/XAxlWWrmqWSVq1EFnhcODN7Tvku52G2UAHssGb1hPBy30hx7Sm596NsN0Qlp9rSoSpru8xehbfFGrLc5Br+TLT8ZcwXvgiZiU6X7NZ3Q6Ec9mcXaz1w3MkA4ZHLpDpMWwwEx9Ep91zLKi9EN6jPM3n4OFcGheQeaMiLV2qACyMZHLWs4WIhiooA30cvKNH5SWzG1a+p/9tQmivQzhZQTvCcJGVcZYcncfDTU5wjvBX2O3+yHHCmwdKXKx0VgmArYzpzMACGLjs6aAmIWVD8JOv0DEuHHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10629.eurprd04.prod.outlook.com (2603:10a6:150:207::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 21:40:59 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 21:40:59 +0000
Date: Thu, 17 Sep 2026 17:40:52 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 11/17] i3c: mipi-i3c-hci: Stop rings gracefully when
 suspending
Message-ID: <aqxeZEwISAYGCMdu@lizhi-Precision-Tower-5810>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
 <20260917191356.133242-12-adrian.hunter@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917191356.133242-12-adrian.hunter@intel.com>
X-ClientProxiedBy: PH2PEPF0000384F.namprd17.prod.outlook.com
 (2603:10b6:518:1::71) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10629:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cac4af5-99fa-45fd-3cac-08df15045ca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|10067099003|4143699003|22082099003|18002099003|5023799004|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	iA/6M9aNyMO5Z9aqKG7U+0Ks2xBbZ3t7YMmLQ1qs0lhvcpEyYb9I/F1IIf+b8BJR+L3hAA/S5y7w+SfnQMglrwSxlbg/r5kg8aPPWscLv17omP5270SsbF1IRQ8m3PaZnkI+y27hHwwlFwnLuNDAEzjpmP0Fwi85pLjoweH9n9wDmqkneoxObbCBg7t+gIE++blOqrflpdpqewMW1/br3vNu39ZFWzy/pxT4CaFGQG+jFbIbNxeXTojsCMcnpe1tHxz9ED20XhWYi/2w26kGEawYDBiFllkbCp0jhFrt5/S67aeUsnYAGJjE/3MkKHMmkXjcXzHUT0S+GM3fAGgHwTXe375ubtCl175DAHxYoyWuu6QR1FrAcW0KBMrI0g+jEAxhWgXkhCWiXtnXritnU4scWTcRJ65WQpA/JkIldE5N3QSyCYyUDgCXFE4igzCEl6hkgA2bnAQcm+ZcNZduGf6LQZrbzDNkkbfaK7ZjIhtRNPLKY3XtmWVWwQoRIimmbmt6/MSim5bfPDWRwGczmGXJVJefLSwLJA4yiVNrn5dlE6C1bXy4t21sSoL+Ed9voSkGXTVsA4nR7SqeA9cez9cC3WZhzk6cdllLVtx1a/OtsYsTCriIjh9yV4GXUgaFbiXXaRmfvLJF8+/1uNXLg9HZiG/H42QHHtFFW2yNvTA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(10067099003)(4143699003)(22082099003)(18002099003)(5023799004)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?52LxaeO8CyxqEWVYT+uPik7mopGZ5rVzdXuCvtu9h7us+fY5HyrXicu3TNm1?=
 =?us-ascii?Q?72zjiqOKxrLYYDQwDnJv+4rRCHZWKHHc7fHEqMcNi2KnzMgsr371vSlYo6fq?=
 =?us-ascii?Q?lIjaXCXGsZKBaBPYFeXxuiGnxfh94MbxuvaONrehCHKL6J+IEO1022F5G4KP?=
 =?us-ascii?Q?Av4tFSg9VAVu5HMcGIrtfpavyNhFc4BMDop4BizIrN4SuPKarSFSqLOcSGGc?=
 =?us-ascii?Q?g/nrCPMCu4Z8izBJIsAzdT+DxxE4NoDQp3EkJUKoCsm4cE/D8B9VMWZ//0R2?=
 =?us-ascii?Q?vph9T73yTLEWiXZzkZLQvzBvdEc6H3darOOI7AHZuk0EVlQotKTEJEVNcPXw?=
 =?us-ascii?Q?9sKSnTLGq4LitJfBoT2jnMV0gNLLrR0/3rZrx1UzifEgIESfUz2bIp/S+brs?=
 =?us-ascii?Q?cxYgBSl93sLAtyRRw6IGhqfYgp2i6+26sA8tIC1h1Rn9+Ki9A/ICK7KiWxaD?=
 =?us-ascii?Q?I8K9yYnPbJkmx6w07xJdZRmonjfVVQI9h8BKCPf6XUIc1TkBXh5Cp3IJXaXb?=
 =?us-ascii?Q?d7Ojrnvd9c9DL0LvT/gQD8icBT/5Fex6Tg+sLLQCpSZtKIJ8ZoH6YNGWCAwC?=
 =?us-ascii?Q?s/zQ1f27lopXfLaKi2tp+897Y/fColVMwBSeND24ZqemPXGjg2Kq7Ym6qB2b?=
 =?us-ascii?Q?tTSCY+k1sb5MC7clJ9eN0Ct8gv+TIziZ20KNH2Grw+Sgwy6Ug7gzoPy1CPKQ?=
 =?us-ascii?Q?fR4teU8h5Ksx2khEmpqseitoK2UcT9yVjKggGw8a5GIVsIxpD86tHco3vBBS?=
 =?us-ascii?Q?Tgpls4MfLlgv+2XALkQdVqDw288WYdVopKE74vD4ng2PBop9sn4mMw6uUqB3?=
 =?us-ascii?Q?QQW8Pp8v0jxuw5lh1rNMcob78f8XRh6bkwGPJIR28yM4jBfOulywoc9glrrw?=
 =?us-ascii?Q?9knlgeI8yaJUEJg6PL0xJTCblJSryUZH2Mxit6Rk9g9NOlsR6s0195oWPzo7?=
 =?us-ascii?Q?Ci+9t5qcN6ocyK32X//2/n7tNIrMjx/0FaTH7tcPmfB5Kv35maLuIsfI5joP?=
 =?us-ascii?Q?4+iPU4u8nXpsiWGomHV4VgCvGOiY6BsUQ2nMF2ooVVDyZxHMo5PjagWlBu8i?=
 =?us-ascii?Q?xCQTb7NLFPBOdDTgnC9MWMNUHSuqayUYV2Ha1HooZvUtJO5uQPo8VS2K05Tt?=
 =?us-ascii?Q?36VMUgtOVnmw/2CyfwvV2/wasAdrFt4IB0HP/XOBCzKJT7hvWutat1nzjZW2?=
 =?us-ascii?Q?QcdMrAVW68LtYNNbTWlUvHEfuKgZWjp6lqdmmIl8YFHvWIfzYCWFfW6xshmy?=
 =?us-ascii?Q?LZO0OXWvtXRpra6yr6OH7fx4ck892qwleEjaxYiQ34zy4nHreEhMVzxB8b6R?=
 =?us-ascii?Q?NeEU1fDADoftd3YZkBuuW822c9p/LwS4AyNRcS9qbXd7Kj+lWaCMgJKX761t?=
 =?us-ascii?Q?lw973NcNmell34Ra4E77ebLCq0dDSKk642JpBGEFNf5qlnTykJg8KGqKAiCV?=
 =?us-ascii?Q?4lDOxXRU2H1kAxvSdcMGBa9Hsb2lv5aBFOX18Cqkyja5axpVgoTkgsZhbUkc?=
 =?us-ascii?Q?XTzfwKmhMEDyH4ZxBuk9xs91LiRFFmYi4cvLqvC2LIJSLRA3G0wEkOfzR6sw?=
 =?us-ascii?Q?nA+Wbvs7pldAcyv/hN4PszV3SDwuy3c9ybbkF6uVt2nxc5fFgomOIq6yhKoD?=
 =?us-ascii?Q?w6IlPUK1Ly5KcxsbPiyo55kRUSmIbXnZwM0FbG+EAg/b/i9gYKNKvZ4XowVV?=
 =?us-ascii?Q?QSX7TjyISm0yewUA7QDIJ2aioUbudKGmaA83dJkVG7xX/gNEXIDry4UK40U1?=
 =?us-ascii?Q?nLV2CTLuHAC0tR3epAfuFacdWnA1mUCaM4yS/T9yojXSQp0+rTPR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cac4af5-99fa-45fd-3cac-08df15045ca2
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 21:40:59.5858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4cDkJzUgAZMty5MdKE3O/x/KoP6JDc1SdsceBryXDdWqaSZhq9LPrcrRyfOYoU3gpdvLseI3KQvz/KcxZJbdoiJg8YPJaRVbahuYurg3e6WwTZeP+QasT+wZpyzusw4J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10629

On Thu, Sep 17, 2026 at 10:13:50PM +0300, Adrian Hunter wrote:
> hci_dma_suspend() tore the rings down with a single write of zero to
> RH_RING_CONTROL, clearing the RS and ENABLE fields together and without
> waiting for the ring to stop.  I3C HCI v1.1 section 6.1.2 separates those
> steps: clear RS for all running Ring Bundles, and only then clear ENABLE
> for all enabled Ring Bundles.
>
> The ring registers were also written outside hci->lock, while the
> interrupt handler, which takes that lock, could still be running on
> another CPU.  i3c_hci_sync_irq_inactive() was called only afterwards.
>
> Finally, an IBI can still be sitting in the IBI Status Ring when suspend
> runs.  Clearing HC_CONTROL.BUS_ENABLE is deferred: per the description of
> that field, if a disable request occurs while receiving an IBI, the
> actual disabling does not occur until reception of the IBI is complete.
>
> Instead, clear RS under hci->lock, wait for RING_STATUS_RUNNING to clear,
> and make the interrupt handler inactive.  Only then disable the ring
> interrupt signals, drain anything left in the IBI ring, and clear ENABLE.
>
> Fixes: 816958720443 ("i3c: mipi-i3c-hci: Add DMA suspend and resume support")
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	Added comments explaining the choice of the RING_STOP_TIMEOUT_US
> 	and RING_STOP_SLEEP_US values.
>
>
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 57 +++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index ec4b469abd33..b8fcea0870ab 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -15,6 +15,7 @@
>  #include <linux/errno.h>
>  #include <linux/i3c/master.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>
>  #include "hci.h"
>  #include "cmd.h"
> @@ -1052,19 +1053,67 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
>  	return handled;
>  }
>
> +/*
> + * With the bus disabled, a ring should stop within a few microseconds. The
> + * timeout is therefore only expected to expire if the hardware is stuck.
> + * Allow sufficient margin for slow systems, but keep the delay acceptable
> + * during suspend.
> + */
> +#define RING_STOP_TIMEOUT_US	(100 * USEC_PER_MSEC)
> +/*
> + * The ring is usually already stopped, so polling typically completes on the
> + * first iteration. Use a modest sleep interval to avoid busy-waiting without
> + * adding excessive latency.
> + */
> +#define RING_STOP_SLEEP_US	100
> +
>  static void hci_dma_suspend(struct i3c_hci *hci)
>  {
>  	struct hci_rings_data *rings = hci->io_data;
>  	int n = rings ? rings->total : 0;
> +	struct hci_rh_data *rh;
> +	u32 regval;
>
> -	for (int i = 0; i < n; i++) {
> -		struct hci_rh_data *rh = &rings->headers[i];
> +	/* Gracefully stop the rings */
> +	scoped_guard(spinlock_irqsave, &hci->lock) {
> +		for (int i = 0; i < n; i++) {
> +			rh = &rings->headers[i];
> +			regval = rh_reg_read(RING_CONTROL);
> +			if (regval & RING_CTRL_RUN_STOP)
> +				rh_reg_write(RING_CONTROL, regval & ~RING_CTRL_RUN_STOP);
> +		}
> +	}
>
> -		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
> -		rh_reg_write(RING_CONTROL, 0);
> +	/* Wait for actual stop */
> +	for (int i = 0; i < n; i++) {
> +		rh = &rings->headers[i];
> +		if (readx_poll_timeout(readl, rh->regs + RH_RING_STATUS, regval,
> +				       !(regval & RING_STATUS_RUNNING),
> +				       RING_STOP_SLEEP_US, RING_STOP_TIMEOUT_US))
> +			dev_err(&hci->master.dev, "%s: Ring did not stop, status %#x\n",
> +				__func__, regval);
>  	}
>
> +	/*
> +	 * With the rings stopped, no more IBIs can be received. Flush and make
> +	 * the interrupt handler inactive.
> +	 */
>  	i3c_hci_sync_irq_inactive(hci);
> +
> +	/* Disable interrupt signals and disable the rings */
> +	scoped_guard(spinlock_irqsave, &hci->lock)
> +		for (int i = 0; i < n; i++) {
> +			rh = &rings->headers[i];
> +			rh_reg_write(INTR_SIGNAL_ENABLE, 0);
> +			/*
> +			 * Be absolutely certain there is no unprocessed IBI.
> +			 * hci_dma_drain_ibi_ring() will do nothing if there is
> +			 * none.
> +			 */
> +			if (i < IBI_RINGS)
> +				hci_dma_drain_ibi_ring(hci, rh);
> +			rh_reg_write(RING_CONTROL, 0);
> +		}
>  }
>
>  static void hci_dma_resume(struct i3c_hci *hci)
> --
> 2.53.0
>
