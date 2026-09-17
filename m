Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011021.outbound.protection.outlook.com [52.101.70.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91D1384CD5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789681063; cv=fail; b=UWcuyp6cEwvwbiU2Lwh5QyYALNClG5Az8jaAbigXEhheibts6qcmB9Vy5S0bMA63CEe4aOMKKvtPmFxW/uTfPmi1oewtZrwLDFTz7WpgGKsOukp1Tp5grXtq8gHVuXA0SUhp50azKc9hWHFyb8ysfR9lUg0gHLCp/PpvUBGPSS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789681063; c=relaxed/simple;
	bh=+9nJ/O/3l/AyyeqLg3rcodYnuFk2ypZsQIsGGGohBUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gHE+YzCnvGNeiayRhqC2nqhCnGSwrPsrrKcn3ONcujvQ2Pz9BrGxRykUil+7daen2Hn/kfBFz6WI59v8tM7aS7LRH9DcISdthjCu6ytfZH8A7A8e814xf5jZ+zhYepDytOyvDS3/15J7jQwpLdwwvHg72LV1iB08bk9XqAk5CS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JX2rEObB; arc=fail smtp.client-ip=52.101.70.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JX2rEObB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T4cedRdVqeMWA86mM7rDhGeNpqYgHBQgP2DsUudFF+vFAAIPPQ4dFdZBSzsgHkxOwp7b1RiQvDTXB4WmTVNH33ychpXEgUd5JmdGMNruEhfoY75oOt53nhnf53DGIRjZ/vMbL9BCRW1qFy7qwhzQrQvgxiWkkbh1oQr6XoIZ7kKsfrvcWXuoOPWjFfj5w5F/YEMylr2LrMtx31v4Kiw7V72OZnF2I7NORdZMssp5yhIySL71hXiHEVpuc34F4XJ8iZxUXOailD0jXVndRJ/mMBsZaZVwKFA2b3h1Zg8HiAB+6hhp9eVebiVJMWirdxpDb5J5HrCRC+GKCGLTWHeFMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5Q5Bs1I6ai9CjIwvH0lBIY6VgcaZphEoFoKQe4qlnM=;
 b=JDJSZIHKfYX75vpAlLt+Hx6lBLQVAQsSFMJWcqAHpbZqGdYvf7/SQLHaP4lX4jGWUBjN8LNJtb/ysY3seIvVnnAizRLgYA8eKAmzUoOHIjFiNSrkO359NGmyc++xm0bVfELP6o4AxM4Ogx0Qkn6D/RJpZoQq5d2EJ9+GdUK5FFJc3JucLBfKrv5JaJbIrahOqnRHaPWuyExpU4QuLQHy8IKaoKd1/Mf/w6YnE+HN1hp9xtU08r1hYh0ru/eeDkPGbOw9O1LxtK/FZlWWQNyA3fohzOuZR9KppV36AygGL/iyQPCXQ7DXuZKX4ZIZzNFJ5tfJRdFIs4VkkOPvOKG9LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5Q5Bs1I6ai9CjIwvH0lBIY6VgcaZphEoFoKQe4qlnM=;
 b=JX2rEObBV1E/0V5yaHmfeyUfY0iaTA81tWk5n0GP3g1Mm+6X6rac0B4AUUroAQ74ES8nEBARf6XDK4v885GUVXRrs9ATE5Ze+lY1tmP12iGN0/DTGYI3kLq69ewfIyf2goLkYiM6Wak5QrOZpX1blUEEfITB8SWAFwWLbo8ZNgVkiA4zVbgs4GdEljzMP86SJZRIb5YW6Em5rtr4gpD3jTqCv6J/jh84en30k3Bdr7EuYJ+XRIpJQcOORqkMGsZEZ6mtsSrPwtYwPR0XvnHjTgYccFQ3zh/5qn9P40FmmOGcw2FO1LuNHDvo6xCdiwBjAYBGSba74nsBoOKB1dimog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB7601.eurprd04.prod.outlook.com (2603:10a6:20b:285::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Thu, 17 Sep
 2026 21:37:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 21:37:38 +0000
Date: Thu, 17 Sep 2026 17:37:31 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 09/17] i3c: mipi-i3c-hci: Process multiple IBIs per
 interrupt
Message-ID: <aqxdmzvLZbwjQ9oc@lizhi-Precision-Tower-5810>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
 <20260917191356.133242-10-adrian.hunter@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917191356.133242-10-adrian.hunter@intel.com>
X-ClientProxiedBy: CY5PR17CA0015.namprd17.prod.outlook.com
 (2603:10b6:930:17::9) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: ea6181d4-719c-4da0-d998-08df1503e496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|19092799006|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	q4GYYbvzRLPK5OQxpSTicFOPQcIyXffd8dKfaqez3Um9798K2FrqXmlXI2C77hLJsKZi0YlnQbs8+PSiBU8UKBD8DVjGnhpeevDoWKm/TTeUDHhWTBQKRe4l7Sf/RwOHGd6imxIXNeCJf5nxec2I4BYk2MOxyEcGL9c7iRMyFJukv3stZi9UAHDfZyGFmZ26FREYAjb6KMpkazhumkmxk6DRg0VRPCFvyxybW34+Y+Q4G+FfEk42GyPYBwTGHES7ifpE+B2QR4mCs/5yVuVfKw74J8j5AJ4VmKW54zWoloXDAsfmNEl2XfJYEXBRB5+fyns9U/iFwRLTAl+qiS6ka+7R99ehbdVenqC+qFawIlDcVpZvd+xIiSjm/M3G6Yp9mTMPbyepaXoJUrYWXjGi4ovPyOTD5sPgEMH18+COmhIQFSSn41NALfyIIfsNiYyn3kioUh4pMNcNJ/W0uV+YBW9g1B1xudxqQ8zqiTxHFYni0XHhrU4CaaL3Rwq/Vaych9+/cCufNHJVwA6IBbQNXhZMXq7P0M6tz/a2afsPTTH2I9WLFFd8Xn2HbLIBDETsZGXzAAx4g2HlunTh6PeRnWKr6xqxTL8+Ig5GgUpa1xeaj6rnLGI4+3M2aqVaQuRaAAYAA8oPPutQQneOV1W9adiaMUfStRd7682NnmLI6mI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(19092799006)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WR1WjWBFCQ+bMdz47V2j2NKaCm79XrafTqqxfnkfPjqebnwcTSgA/130Vk1a?=
 =?us-ascii?Q?bgElb37SRHRMbVyipDcEVkLjUtqTBG1bqrl4k51rxDIZh0HC8+H0DYMJucoV?=
 =?us-ascii?Q?RtCx0TjItHfQx2K0lZls+K6oQB/ToZU3dcJH1Ne9Y3MXom5OnHskUmYLAWVp?=
 =?us-ascii?Q?nFUyx3CqgDnby3xcLRMIBSdnUtcMtm7Cbbp3APE9tRJL8giJCmHs1dUB+DYE?=
 =?us-ascii?Q?ti4MOwxadr/mcqW9haqfYOEquO9lytUBwJ3WKWg4ud+7AQzG2DHY9bJc1XDY?=
 =?us-ascii?Q?Y11rERt1Mhqx0I8iOAQ6EF/A5HTqPJ3Z9E/gIECC7nIqtTqKkF8YA5XQWe/N?=
 =?us-ascii?Q?xtbh0Q2/S55X6wOLRaXw2HX8t5dpEVYWitc29PFRcqp4C4ZdJvv4dKdu7a+z?=
 =?us-ascii?Q?5s1+NR6OyOXBK0cnDt8QGd7t6RDqKDLQGj2rp4kTrSEaZS8GnvsfBTSloJNG?=
 =?us-ascii?Q?kjcEA87f7aMDqcR069JDapruyeaJCjwV5x9PEzHDQ2FIEbVq5clff2emUsfh?=
 =?us-ascii?Q?YvwNtIyosItXhDK18/8UQfiEYa8Re5ofJh90yed8dzixH0dd+jzdtJNh07Hz?=
 =?us-ascii?Q?TZlPlsHih5Zqk0H4+2nhUmyHs+DPLW15NY9qYSMg3JBrvcA6s0yx4c2PF8JP?=
 =?us-ascii?Q?x+GBw1mQuDAqjhAgHcLzBEWjLqPc8rXfqFMDFWVbTw+ddlKrK5ByMS42AxAD?=
 =?us-ascii?Q?PiZEygwyqh0bcUlxymjNyf8+kSu9P5XYIpwoFOO9t1QAYOpHbu3N7bEH9Mwk?=
 =?us-ascii?Q?JM1pRIfWiu5FyDRvM2wZF+coE/8ey6ZeTaqp61IkGZvkHNL+jf+iLXgXyofZ?=
 =?us-ascii?Q?SEJg4OgLU2M2XjTZgR0OtAoSMur1e9Q64b/y88gXK9j92PX14nFojLTjmGHk?=
 =?us-ascii?Q?4G/rvtx1rcRDpo7h5a+W65/WIGUPeWLuDhfLM9zLx8bLa9XqOB9BFboazMc+?=
 =?us-ascii?Q?JZpm40TDOKE/a6b7F5h7WFDYBGywWgN31YLfTkVFsLZINiuA0Prx+16hJuJj?=
 =?us-ascii?Q?O6cSzbLfyxF+MYjN/EZQ0pwqEsn0ma9U19RPVCYFffS5XMn0CYzOQ+zrBjjz?=
 =?us-ascii?Q?MebG8gzP9NgyXVbts9YyFw4x7JBk39zltL9oYKubDISSg1ivapjsavzBsMJJ?=
 =?us-ascii?Q?Cokeb0Vf3hmv7vtDrZiK1LGuyfn+nF005h2vLX5tpCyNPm+sDN/TOyUbV1dN?=
 =?us-ascii?Q?simSIWeYcmwW93mMmquSlzZtuuASvlGH+Z2Ftxx/b71plUTnuTXZqdzY5czL?=
 =?us-ascii?Q?znUdiBqTraZiHQak727W3YsuLTzZQc27qsyqFCN4LqMa5thBtIDoFPpqot18?=
 =?us-ascii?Q?sEb3pAM8hszFedZoV9jrYu86xpFl+XMB5vFHQf14IWngu2xRMqUBrAxZ3bob?=
 =?us-ascii?Q?RaH27jidOF+dDGdB5Tf1t04ubPXhfaiyiUteKwcGvrN5cegfxz2W42qh7LfX?=
 =?us-ascii?Q?AbPNXXadIkUUy+ek7c6NjnkjJok8W1UW1Oh3eL3bmAnfoPf5a2vW8sJsV+LT?=
 =?us-ascii?Q?l88WKiyoIZtPcoGQVU0IxSrd/INR/pYuyMpkVP+Jh+tiDdF4pLYOU99QBDMe?=
 =?us-ascii?Q?4+it3JOadYcRtiPKKXmbYwBWFr5YhJ4A9iTCoLQz3yUIda5uACFnoFdUbOk+?=
 =?us-ascii?Q?uIUYJs3FhMnrnSdEvtTfvlxcnWAa3jplX+CVInGQq2qH7Y8z7CvOBzN+eAUX?=
 =?us-ascii?Q?pZvCxGjGStiJqycV5p4sxJGH0xOD3reN34pBZdAsQOBFpiXMV0YrCrL3HOhc?=
 =?us-ascii?Q?qQmruJXF1wSvV2mfovxq7oBPtT1VnXw6hBEwpxi4cOaUgDmzIhUG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea6181d4-719c-4da0-d998-08df1503e496
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 21:37:38.2115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HyzNYRDiKdGcn5fcgLwxwNQbA4LPsqfO5pU4wh2txHQGV44yiwOJw2AGuUAAd2Tk+IbIX7+7oVu+xqEsPioygNEI6xqrY65XGyIC/aEcnmFTjxdt5VphnbPP4V3fypYW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7601

On Thu, Sep 17, 2026 at 10:13:48PM +0300, Adrian Hunter wrote:
> INTR_IBI_READY indicates that one or more IBI Status Descriptors are
> present in the IBI ring.  After clearing interrupt status, the interrupt
> handler processes only a single IBI even though additional IBIs may
> already be queued.
>
> The controller does not reassert INTR_IBI_READY solely because entries
> remain in the ring after interrupt status has been cleared.  Consequently,
> the remaining IBIs are not processed until some later interrupt occurs,
> and can accumulate if IBIs arrive more often than the interrupt handler
> runs.
>
> Process all IBIs that are pending when the handler runs: capture the IBI
> enqueue pointer up front and continue until the dequeue pointer reaches
> that position.
>
> Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	None
>
>
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 39 +++++++++++++++++----------
>  1 file changed, 25 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 5b195978f376..a798b0648922 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -868,25 +868,24 @@ static void hci_dma_recycle_ibi_slot(struct i3c_hci *hci,
>  	i3c_generic_ibi_recycle_slot(dev_ibi->pool, slot);
>  }
>
> -static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
> +static bool hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh,
> +				u32 *op1_val, unsigned int enq_ptr)
>  {
>  	struct hci_rings_data *rings = hci->io_data;
>  	struct i3c_dev_desc *dev;
>  	struct i3c_hci_dev_data *dev_data;
>  	struct hci_dma_dev_ibi_data *dev_ibi;
>  	struct i3c_ibi_slot *slot;
> -	u32 op1_val, op2_val, ibi_status_error;
> -	unsigned int ptr, enq_ptr, deq_ptr;
> +	u32 ibi_status_error;
> +	unsigned int ptr, deq_ptr;
>  	unsigned int ibi_size, ibi_chunks, ibi_data_offset, first_part;
>  	int ibi_addr, last_ptr;
>  	void *ring_ibi_data;
>  	dma_addr_t ring_ibi_data_dma;
>
> -	op1_val = rh_reg_read(RING_OPERATION1);
> -	deq_ptr = FIELD_GET(RING_OP1_IBI_DEQ_PTR, op1_val);
> -
> -	op2_val = rh_reg_read(RING_OPERATION2);
> -	enq_ptr = FIELD_GET(RING_OP2_IBI_ENQ_PTR, op2_val);
> +	deq_ptr = FIELD_GET(RING_OP1_IBI_DEQ_PTR, *op1_val);
> +	if (deq_ptr == enq_ptr)
> +		return false;
>
>  	ibi_status_error = 0;
>  	ibi_addr = -1;
> @@ -936,7 +935,7 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
>  		dev_dbg(&hci->master.dev,
>  			"no LAST_STATUS available (e=%d d=%d)",
>  			enq_ptr, deq_ptr);
> -		return;
> +		return false;
>  	}
>  	deq_ptr = last_ptr + 1;
>  	deq_ptr %= rh->ibi_status_entries;
> @@ -1015,10 +1014,9 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
>  	i3c_master_queue_ibi(dev, slot);
>
>  done:
> -	op1_val = rh_reg_read(RING_OPERATION1);
> -	op1_val &= ~RING_OP1_IBI_DEQ_PTR;
> -	op1_val |= FIELD_PREP(RING_OP1_IBI_DEQ_PTR, deq_ptr);
> -	rh_reg_write(RING_OPERATION1, op1_val);
> +	*op1_val &= ~RING_OP1_IBI_DEQ_PTR;
> +	*op1_val |= FIELD_PREP(RING_OP1_IBI_DEQ_PTR, deq_ptr);
> +	rh_reg_write(RING_OPERATION1, *op1_val);
>
>  	/* update the chunk pointer */
>  	rh->ibi_chunk_ptr += ibi_chunks;
> @@ -1026,6 +1024,19 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
>
>  	/* and tell the hardware about freed chunks */
>  	rh_reg_write(CHUNK_CONTROL, rh_reg_read(CHUNK_CONTROL) + ibi_chunks);
> +
> +	return true;
> +}
> +
> +static void hci_dma_drain_ibi_ring(struct i3c_hci *hci, struct hci_rh_data *rh)
> +{
> +	u32 op1_val = rh_reg_read(RING_OPERATION1);
> +	u32 op2_val = rh_reg_read(RING_OPERATION2);
> +	unsigned int enq_ptr = FIELD_GET(RING_OP2_IBI_ENQ_PTR, op2_val);
> +
> +	/* Loop is bounded by enq_ptr. Further IBIs will re-assert INTR_IBI_READY */
> +	while (hci_dma_process_ibi(hci, rh, &op1_val, enq_ptr))
> +		;
>  }
>
>  static bool hci_dma_irq_handler(struct i3c_hci *hci)
> @@ -1047,7 +1058,7 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
>  		rh_reg_write(INTR_STATUS, status);
>
>  		if (status & INTR_IBI_READY)
> -			hci_dma_process_ibi(hci, rh);
> +			hci_dma_drain_ibi_ring(hci, rh);
>  		if (status & (INTR_TRANSFER_COMPLETION | INTR_TRANSFER_ERR))
>  			hci_dma_xfer_done(hci, rh);
>  		if (status & INTR_RING_OP)
> --
> 2.53.0
>
