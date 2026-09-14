Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013015.outbound.protection.outlook.com [40.107.159.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08727175A64
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404335; cv=fail; b=UaTxpwWBtFC/9SHDaneQlbUXFHOnMoXhX+UylM/6lXbNUU0JAoqHWxcqozZVqQnO/DYSbQ856AfEOgPNF8r9HLch6V8e0Wt0NIcvYoTUdxe8sCzIBUp4NWSElp+fg0mg0EH3SMQxMuauKfgrwG1+gYXADw+7Ll1O59osDTaV4NE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404335; c=relaxed/simple;
	bh=vwUZFAapdizBDVPj8eVAbwNBZDoFJVrlMLrWDD6qnTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IgK60W8DXf5+ILz4B2Kvy2Wumz4gg8MwCvJQcTczWbzxBN39jBXpVVPkZ01Mnke7oqfWAvppSoXyUlkq1KTHIMscWD++0J+O9tPmv/igdWQt8hIJR/b6Wk9yySlUOpzu3KdQ8vaOMBtOdUpyx8mCN/mcOpCNzDCdcYZp1tgGr7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=s61Jm1JX; arc=fail smtp.client-ip=40.107.159.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="s61Jm1JX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3mLx44HQ8fk5vEi7pm8f8OcQzkgxQrpL7QB1CAXy/OMnJzg3QBJh+fOn/KVEt/xyp5qQwj68XpdtgqFscoGHNcr8HkWXcs2QyM30S8OkyLSJkBJXGG+VAgcVTgKdXucuJ6Fi+wZQdaDdjeKHUBsd94NW4Y59xWlgBku7pjq0VLRrMMXtjKpeUNWD15toO7xXqhbQybkPkFZ2sQH4RekpxzLdYq12onlPfXxr892Y0jfvj1S3K81+bF25MExLOLzkZNCbuPESW2V0ufxgkit/5w2PwHMWxLKD18u/kSu0innnyVmf4ijc3IIBxdQYBpVpITlgcCbry/gnRfZyObYYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBdASj0+Wn6V79pgK2QoNW631BKg7Tb4x+GoT6a+efA=;
 b=JJQdP8vAiUnocb1xoMvw9xAlKJ523FRLzQPPdDIAGymCSZhRQvlkSUCe1Dptjd1svF5kbLE2DPg6MmJfiiLaJ228TMZ7feYqm5C4rYAefSKLzDoSdRXdfxjFFx/LbRD4S0ayUkbBquRtBnsskWufw83FiYSZ2VnVrnS9MSIS5n/OHes5CW26kOfuZGL3K0gGC429OFpDFhPZVnUNl1WCe1+PYE8eA+yD1L8x+Jcdpq4Txr2xpEb7Y1M0+nko6XKtie3nU4JJLUPA0rZDYo6y9SSGYvHBcgfWqcQSkZGaInQWRcwR8lRc57hJVz5+eFxc5RzDwyMTQJDMZ9kdr/4bEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBdASj0+Wn6V79pgK2QoNW631BKg7Tb4x+GoT6a+efA=;
 b=s61Jm1JXjxXIHG2hvHB4L55yqCemPbLJcDsGkvh1HudiNDw48igmHEq4+2+TWe+zb1ed+St7/zMcnRIWczVP1gnLLXNERdx8OMy3WzSjfHx0nCRcLf0C9UXHWC82EBMC8x7UeF8wpa4Ly4AdG8zNCtw9tjyLVbYB6nkQG0CKqEikO64hxEIxpaPMXUuZkKfuMxAaQvzum+ZyoNdnqaM06hTYMyv5F+PkKybWjKxvQ3DJt9xXD3Xl3IuA3xVg5v17E4w7xkoR+dqJAvO+lNU4n6YL2hs28suhZGoDV8tRlxMR+xkiQCgSNVgKN0w7lACrCQvNwjcg8jTjWdpGO2gy5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI7PR04MB154706.eurprd04.prod.outlook.com (2603:10a6:290:102::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:45:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:45:29 +0000
Date: Mon, 14 Sep 2026 12:45:22 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/17] i3c: mipi-i3c-hci: Process multiple IBIs per
 interrupt
Message-ID: <aqgkovU6i2Mm2sXI@lizhi-Precision-Tower-5810>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-10-adrian.hunter@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914113003.183150-10-adrian.hunter@intel.com>
X-ClientProxiedBy: CY5PR19CA0052.namprd19.prod.outlook.com
 (2603:10b6:930:1a::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI7PR04MB154706:EE_
X-MS-Office365-Filtering-Correlation-Id: d39fd65f-0e15-4eb6-9607-08df127f959d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|4143699003|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wmowjRJhsMhq00Bs6TMukbmzuapEdsSvxyeJJDWt/co75qHqiDXwtqaLzpscrH3B7KNJ+cS64hpsYzLlMCJK4Kck52PcLm8xpwnScOZlO5Xrs9KrmU36InFhQE3yu91Hb06rfdqx/A9PnVMT4VzPcl95XXzERuaJEOWxjKkPx0WDxQei7XH7lX+3q9cmGYqjbJo2XnJxHUF7M8g85K+szIUDlCfLj8FPymyBV+uigrpro48ZA0sHsvdpyXsr6Sk7QIileROH/rPIBBwA8WasAcEkohJyuHEuemZ6tBH3xLj6Iwvec3CKMpl6RJdOy3xZkCCKSM2JoQvA5MdlReZmpVtbLBbWg5wJf0/pNLTFX3lq/FWYlKkOxvUWORVYxgk4iGmLHoYfkGDaMAYn4L6Lvje6Hahwe+9tV0hIBVhP58vHFyxAsps3gRgVNFgaBX+UrHFJvcmGtuUYSedmxcnKTXqLfCfTCZYW0S+wcPXecAddcnuPtOljtAIBKUiIjo64m3wt/hRf7zcd/GN8AHgCigyixfwE+qIfbgs9XfBF/CrPhOU19j5eM/1BjPSUG5G6Fg5b56pQCyVSj7tzt9We4QiprAICTC2YVvIU7mmCj3/U2Vit97UQ+o87AEYhB4/km0U5hlzhnb7GODcx2ezaXrZTNwrqKbGSwkROtJZvF38=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(4143699003)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?un40k/CMxR/DXMIrL8sz63W+29hVCUVqS0WhKh/gbXLwE2mQOby79Kxjrc/A?=
 =?us-ascii?Q?OKlEuXd2+8X9w5JSMTIu5dC7QmPTTGzGH6b5zrPlsIhcO6dkEUMMSr5WYlEH?=
 =?us-ascii?Q?3dvi6XdhnH089yw4mZkDii+rGte8jd8VCDDskV4299Mf2TPfgg353yhi+40e?=
 =?us-ascii?Q?puo9K1KWWShCfNx8AgyOQIaRUyZq0Yn952WKWWkx5JNjaGPZVgbogdqXOBXy?=
 =?us-ascii?Q?mU1ImmfJYrym+So3CtqFYjkiKrcZRzlFesolYx4pvlShyl2dRyQezLHd03ig?=
 =?us-ascii?Q?LIewbaesux0X7Qmhm3VCWGNcrC6lS58Xtjj8jHCHHQ7tYjs589jIPYAti3WV?=
 =?us-ascii?Q?0maSoomTqWXvTcFz49aDy4j6BOYswM6ZiESNltOl0B4h0gb8K+faIwgBZdKY?=
 =?us-ascii?Q?Wbn2v6CW5sXHqGAUTnpsTw5kqvwYYCcDJ1fn9YbcaIo/CVLbwSbAWmEZdJfq?=
 =?us-ascii?Q?jSNbrgIhxeewhH6y4w7mLrdyYaYOOb/AcoHu0PYCHh0XqBfMApZiccoLiV1C?=
 =?us-ascii?Q?oeW/fyaO/q9eNCPNtwWYpZHZoFCofOZ9DYqplOPEkHXQ89cj0IB6LDI8PwEH?=
 =?us-ascii?Q?J3hT7L1vndbpyEUjrYlyvIgabK+nYRCppkCM0pxpaXk53jh4OM1Nd3glSdWm?=
 =?us-ascii?Q?zzpX3BJgmdnN4uS8v9ScxOf2TrEr8MIeElJo8L3Wc5dSiHkOmFtezE10wu6U?=
 =?us-ascii?Q?Q3al0yfyRxzWDsuwnrfoYW9GjO3n2N/LY9oQPBbbk9+1T1vFVImq88wrLjmm?=
 =?us-ascii?Q?X9RLEuQDoX5okrbXNc/tHZIIfsU/Rmdsd75ETn1eIoiOQZ4gCMuXBrNCARos?=
 =?us-ascii?Q?cZxxFAEEcNA3w+3gUUMKFMjkRxUV8a82HzE+67rtm+HxcIxXjAXzHsiVMCDC?=
 =?us-ascii?Q?DBr6lmTH4VuxCBUKtdceuSLm272GZdJ+2ug0nqD1rnm6Gv/H+DTXm92KRU2r?=
 =?us-ascii?Q?h+lunAWwtBIPUHuqpynvKMfBWTy8UOu8SmK4Vdg1vb7Z36Krtv6cdiztGe/k?=
 =?us-ascii?Q?MQUAzcSdHs/Vxh7LdtHx1aaPVFdlgogxRtW4OmGC4Zdye+EbkG9Ze1VRxXbd?=
 =?us-ascii?Q?lTi/QCgg8q+50lxIGnafCvDAcO7ub0Y7F2ZiL1oVxqbv7sQbU05UrnHsAMcW?=
 =?us-ascii?Q?hEC/JmZMvPYWqbo3209sw8DLqp+Q3KyNI85F+l3nON8jO6+4lW2gUuV1Qk5T?=
 =?us-ascii?Q?QNpnfA8dFLbqUbkNMQwZCmFlvPkKVcMoy2RXYZHZ/1dM86YATAxAVUuM0ytJ?=
 =?us-ascii?Q?6ZQi5yuu7mTPdoWYSz8k76gSxAIE/qrP4peQi5qhXeel0B9aPyO86jQTQ7cY?=
 =?us-ascii?Q?BUpkI7ll+noGfG4OVAHXUwq2t2zrpyH/tv2Y2RiHcNZVerCE8qpDIMxjlKJK?=
 =?us-ascii?Q?oIsAtycSq06HX1Fixknzfypqfw6dqOCpAKi+6n6mwarGgX+H1pIspHgTvxNx?=
 =?us-ascii?Q?0SQoNQgrJZ10NA2D0syEM+wcuP/rc7aHW/qmqF0WQYikPr9qAx1KZUnruosW?=
 =?us-ascii?Q?aydKgKoDpizBNigzLn6BKzmJU3WjY+jg0/Qgs3ATPnLYmtjezZ36Umtkqoth?=
 =?us-ascii?Q?CY3jdMP1MK8Ibd+VWfWY+CtDguzMYSAzDQ+BBEGW8gcQ5Uj26Hvji3VKTlP4?=
 =?us-ascii?Q?cgGE0rHVr5ykS+Ipsc8Ax7LdULwNH7V/RXMtiuxUqUpfISwwqDgiXyGVT+0i?=
 =?us-ascii?Q?yCTA/zMPa7hKx7ItfAobj4UQV/V4ixf+I2AP4Jazp89MQ5802OF0oU1NB/07?=
 =?us-ascii?Q?6tR1kkk8lTTZj8aPPm6WDeO5usEdUNcKUywrEkVBX6rFihoH2sha?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d39fd65f-0e15-4eb6-9607-08df127f959d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:45:29.2959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LdWW3SdOL6UI9q/47DzJ7QTkPn+JmT82RoKLasEI27Uch7pAGXC/Nr4k/44FYDU1Y49YLy1IiYHXxb07tpZt1JTudfywIgk7D7xt1VGUODAPRDdD/1J5VHJ3j5m00B6E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI7PR04MB154706

On Mon, Sep 14, 2026 at 02:29:55PM +0300, Adrian Hunter wrote:
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

You just read once RING_OPERATION1, I think you can read in RING_OPERATION1
loop, utils hardware not pending irqs.

And I am not sure if op2_val is always mach op1_val by two 32bit read.
is it possible op1_value changed, when read op2_val?

A new irq status may be trigger later, but it become empty ops at irq
handle.

Frank

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
