Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010026.outbound.protection.outlook.com [52.101.84.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27514446E9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404691; cv=fail; b=Jlp9z9XpKlE54fsdGVqLrVDVobMk+Tsz4zFUL46UhZGSBMZ1nscIsNbSdWJFWXqy5qeQSds87EssDkxsO8I/5SOXIQSBh2NQ0wLlvddbI9COT0WRavMbbaLYlvKI447yT0d+RYLieL4yN457w0ZwztZtgq0GTzUfDuz9A1+JNUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404691; c=relaxed/simple;
	bh=fRoMKbHMRGQOmDZFj8Wk9UjnAkF5RSK4H6CkYyEpo/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dbc66bXkWQGc2FU9dG2BdVc3xjT43L5oAXzscVMN/Gr9jhSvO3zcN3jkzRUkajrxjOUKjIfbOhL/qRezgioEo1n/uUlg+jH+WgMaK4xZB2Vx7CJItFywHLnIgYYION6HXbPWiE36Qbu0fgxO+1l7nBSY+PqPyM/bJ8FR3K5T/GE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=D8MNRlas; arc=fail smtp.client-ip=52.101.84.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="D8MNRlas"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XigGeLsbmMhKauahslkcIG3PcljGcNsuLK7Nn4hvACWfbqMUlrcz5yEVut8sMsC0zN3IJGGnynC/sD+llhewplk41pLC+/BpKEGR+6QKKVpHZSAYv5B7bH1eKtZ9dmVfICFG8/eiTv2Bz0ylINMqGt081EFFi/8kxQ2QmwgwbkugDLwg6nHrvkFtqN4VppvKOTpudnSvi8w0GFqVD1DyOuEnGCD71e55nBeXrtt6dwLDG4GLAw5TXLdeWxK8+npkxx81IPojpaQCK5xDwc3N5Hg9wots1UWmzZw9OWMvo5CowddqavstugrBrh7Oav6nGGEWUAHsUDmX3Vyy5SIPMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qu+p/CreV7P5UUPbysbFiWCcL4VTYVMfCNtJ3PX8XMA=;
 b=ozoKRWTtXiNVbhSAJseH34KcXlCRLCYaGgxOo5EIvnpQ2O+GqDWSGFZLEtKghLanrTAPs/oRS1gAmw7v0LKPseJejtHMtiMCPuFmt3DIjFNwRlPuu3OrDS+JMqqyy+rMgYk8FJL4cieKt1gffw2AppVf6EgKcoTKA/olDu7pbhopwDaWEcP7e8Bi9lGv9ld2+In7UOcXCsbZnPDBm9WMbfouHxKX+cNFOe1BCuExJ+MkYFd6Q/xfxM89hBWKVEzD39n0ETE+9K7MMxoB6ZNqxOoL5e3SijD9rCaIzVQBSKLH+YieK9OULAMr+apyoDR+QrevrKgxlnZUO5AeZEkFLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qu+p/CreV7P5UUPbysbFiWCcL4VTYVMfCNtJ3PX8XMA=;
 b=D8MNRlasT7kYz60l8jfSVTd6YoyE4Ta9pNapZqbyAqG8zl0pyGZc0J91oM8dKokgF8db4+4yorE9yIvHtHpf7+TBNcPOWKsk7PeNsfR0W80CJCb8eiV+g6/8ERlONhiZ6tTdJ046IsIOcIjK+hDG0tmZ3oDW/rv5WIB9eWHB4fsbWpPJIJO3+XU/Do+W/V0sperSpxtB7wRxlBp45a0QXyAkBFIEVpN5K8wqdxAuBi5mXBb/iRX3/JXOKE2WBFZtj7VQW2u1kvjadz77T792OSL6dYavBDW/enVdzwb6LHIjdi9rdqbPDpUpQSegPzqY8QED1wRG3QMaEMxsnnvkmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10994.eurprd04.prod.outlook.com (2603:10a6:150:224::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:51:25 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:51:25 +0000
Date: Mon, 14 Sep 2026 12:51:18 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/17] i3c: mipi-i3c-hci: Stop rings gracefully when
 suspending
Message-ID: <aqgmBvo2EYMJk-Y0@lizhi-Precision-Tower-5810>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-12-adrian.hunter@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914113003.183150-12-adrian.hunter@intel.com>
X-ClientProxiedBy: CY5PR14CA0003.namprd14.prod.outlook.com
 (2603:10b6:930:2::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10994:EE_
X-MS-Office365-Filtering-Correlation-Id: d1172b74-9b63-4c41-2872-08df128069cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|19092799006|18002099003|22082099003|11063799006|4143699003|5023799004|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	0GklI/LfgkVFRrfa4LvmXHxqal4rHHxgxZ+i8W8FNemAZYY/treWah2EDLsDqzZ0XQzp1QFz5OP51m/oMbJ3OAclVnHOhieyPpSyBwRjxxalXqqmHArTYadIMCKWdxg3V0OY/F3M5RZNes2J6OVUuok2QH7840x2qAcMedz4Z8OxQtWrFlaJeuszjshDYCfnxMCifdOO8qKgndOPYw5Ttb1XLYwCY0vhRLrFMkVfacVv6A/NZIDf0K9Gz/mEmo4ss/dELPipT2mX+2GpQ2wBDZsbI1svORQWVocisYQoLd4iOpHNzTSeaeZvaA8LavTVSBt2r1CAk4m5ZOYg2iC523dM47LJi6QIXaKBeIm4gupihDEnH8rHvk8JfaKlyxrUNfEItC7hpXVVOatphsSYZk+VQl/3nYuK+baWCCcMDDPJ8AvOnZp9EoxIzgjyKUmHzQUp0a687eNftLacHK53teWhUEJon2Kt30WRr8sTtBnEOSYItA1rY/Xs/A2b0g4iKzkV1jQ66LuWcFYYnLeg/EDS0z4C7ja4BlCCIldAJ9BD3XphN1nNwb+CcF5IcqvkPysJ9TLpOa2TgTTZzrhAXVezNqZn+QYG4KFt5m9ZdvUAtF8dNM1IBqNq2DwoLtEOtHKQEjr9Ag2C21LeFqtwzAVb1uhw8OS68BDSJAzSiOw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(19092799006)(18002099003)(22082099003)(11063799006)(4143699003)(5023799004)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z+icp9rfw6cWiMAuqV9C5z8ejWFr1bVhqeMwU9uMQyh8qOUExqLrZUab7vsh?=
 =?us-ascii?Q?lvOsEYlJ7VQ7oo/7AJvFmXMj4lKC32vz2ya8u4NuyOvYrsPpZVHaYFc+KmEk?=
 =?us-ascii?Q?bvTZ498rkqDqGjswKFuZj8BMj4z2Dqppwdxz6ekgta9/GWiDHMyDj7w+YOKY?=
 =?us-ascii?Q?Br3ucI3+gCwlMUpBYbLbyhhQ1EGPd+57FrP1YdIi3R/2cMHsrjMH0ndRB2tu?=
 =?us-ascii?Q?BZh7OeDu0OTJsSORjOGBU2gnd90HGkncuxSw21dCF608Yj9C9AAd+k0kS1+N?=
 =?us-ascii?Q?2W6MnJjTMq40UCZTxIRm2N3Lsxu/iB2ac6WNEv3TJHLF5qn88nIDeu+xu4Is?=
 =?us-ascii?Q?ZBfQvOXuV33YEKUMeuA8ey2BviPDx1k1J9JnGnPCEzKPgIXsmOSdsqe+q47b?=
 =?us-ascii?Q?iuAI9TlYhU4SGN47cBvr071oRqkaqYFYgY2G/JABklc//zVusGklE4FPMYvp?=
 =?us-ascii?Q?f/0sYwWsccwMTI2A9zHDZp7TvoeWqNGmtFHYfZ5+E/QZ7GYbhZGlpXWBOzG5?=
 =?us-ascii?Q?iEgXOWJb08kPepSwQHMpF2OV6RwBGAxkfaCObKOQEe1ZNmpZlThiNIH7Ap2T?=
 =?us-ascii?Q?Fkye/YXhO1rFhF4yqruKJHzQwIIQkFrAIJZPOrPZZVNNwbNQVPWVg29ijmVD?=
 =?us-ascii?Q?xCU0/ieuZAnCIJwIXgnYUe4bqVoFPqNZaU2vLXEclvEZ7yk7ABX/In/BLND3?=
 =?us-ascii?Q?HURREKqW2w1jM+u2JNJMGEuvCmCYfkQq34nIHgAoOmNxRdiXHYvZrqHkWhxe?=
 =?us-ascii?Q?bajPUQXCSYsTEaDHT52l1NTIt7F7j7GZDtawVdKv74IxtTe/0aryGrvRHOut?=
 =?us-ascii?Q?wX8kiG38u0zXnbr8HLhrQ+H+wac4ufmy7Yf523NbOJ3WJYOSvQLFd6BNw8GA?=
 =?us-ascii?Q?H/JBbdT2SHH7H5J2fkw9CU1Ne3u08CVBvryzu2HUV1wZl1rkLXNki3ulBa/n?=
 =?us-ascii?Q?xOq5P3c77tFWdwz9gJq+h7QWyWh5p5YcQ/7Usb+v+7J82wV42D8+H2uafEyw?=
 =?us-ascii?Q?fEdEnaIa8MDy2q8umDJMuzZMm5bZmBWOeXiW1JRVRborpM8HrLt9/mOctfre?=
 =?us-ascii?Q?VSg3VeL2bSD3KTQ6kzUPcTkzKrB2fXjqUTtqj1qOUd2GAreyRFDcTBF5XGBX?=
 =?us-ascii?Q?Rm6N5P4pj1c7aF4he07RexOr4gk1g18H8eYCQ1hVJdS1wAsuNzqqzXY7cdxi?=
 =?us-ascii?Q?G5hcqRUM0YdMjloEmFT8Vial3HDgRDmwEG26tuUf+bRdTDy6+vgkz9gbJmVl?=
 =?us-ascii?Q?W0ErswJRkr5y0PHuUA2wia5pTGsBw1oHT32Voy0ly9B3fw+Sqv+rBR3+YC9V?=
 =?us-ascii?Q?QHa5rD9NddxIFeoa739blE5qOFYDEJ2KKTJXR8oFBqpUf8VWJxi75q3kWeTw?=
 =?us-ascii?Q?UN+M+7gjiT5EN0oYF4003sS7w60xWA4o9AFW6+VWtIz/tY9KRFfbJgsMNupm?=
 =?us-ascii?Q?gbqGJkIaX8Y2dWf/tHUfVLYxP67MZ82aGw/5MAaTaTQjfCotmEI1RsKKylpA?=
 =?us-ascii?Q?C9jc4Z/IA137yFZVUCuzYHlf8PYJpWAkVghl2E1Ih1LxChWoKssT/5FFxh49?=
 =?us-ascii?Q?ry3B84q+9fvXffe4/EV6b7cA4aTSPI22fGUufxAxob7zC2otjskXIHG4ve2V?=
 =?us-ascii?Q?B/6+/sT7W0hdXCo0jXgBSCW/dZA27dJpkuOmxjpgA5vz/s+r+bKS3Wmv5t0o?=
 =?us-ascii?Q?h1CWFvdEW/ipe5YrzKHVCbmk2wo8LrPXX+LUdefvdRb144HpQPxd0tdEHoyj?=
 =?us-ascii?Q?hHWWtCzxdTcPlY2dB0Ubb+bBwVsR2Ya/U/pLYuzkTNxY1IRf3Fjs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1172b74-9b63-4c41-2872-08df128069cb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:51:25.3056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYLGbwl6xQAmLnsbcgtJ1RTwq4KYO2/qUkuWpPhiWxZs+eWmyX9a+/PVV7CZ3x2Wts5d+myr0vZm2x7VfJYLsM8vXXUGcapHcovbn5KU4c5D4OQZ5Tn6vCBoB2MIAcvb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10994

On Mon, Sep 14, 2026 at 02:29:57PM +0300, Adrian Hunter wrote:
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
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 46 ++++++++++++++++++++++++---
>  1 file changed, 42 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index ec4b469abd33..9c163ee4d215 100644
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
> @@ -1052,19 +1053,56 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
>  	return handled;
>  }
>
> +#define RING_STOP_TIMEOUT_US	(100 * USEC_PER_MSEC)
> +#define RING_STOP_SLEEP_US	100
> +

Can you add comments where these timeout value from? standard spec or
you just engineerring choice.

Frank
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
