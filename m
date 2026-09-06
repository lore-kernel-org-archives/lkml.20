Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011031.outbound.protection.outlook.com [40.107.208.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D7921A42D;
	Sun,  6 Sep 2026 12:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788697627; cv=fail; b=oXPE4WAcwBleyPnIHt7pzXUaRuQ3avajJuAK+TuITWimsDr+yla3qp8hipZUqWfDIH6kmWGHUV4vOu3AwBFU5M9Ueyj7WMJh0c13Pxm1y+euRKLt9MOSeOO/XaBLqTOBom8/GWDJCtr27KU0TJV+6A1HUOLfWI5eI55HAUEydDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788697627; c=relaxed/simple;
	bh=N/5jN/BCf/IM2Vji6No5wyh9htrg68qfbpBTlFLDQNs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Kr1P1fI0vsSQZtMkiPQMCTSIBybYSobdwpu2Ld37IYjEZlMRoa8imKM7iTF+jpQfzg8P8Tff6EQkqSMIuEbSzdej9NYYWGmzc4mTi20XV29qiUjv+kggykJNnOVDUsUdGl8UqKjZ+8pqnl9bS4Y2TkPiHgdMzehMH4kazJpff2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=R6G6V+6t; arc=fail smtp.client-ip=40.107.208.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="R6G6V+6t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqi7KdRxjqNNDQTheXmxIhUIUoItSOe+bEsIgTnyz6VOn2TFiuGAwJC3eS3+ZcK5F75Y3s7EMoq8zmtdTTS+anyZcY9zRP9Mr4l82DbetVXd6SDEoNL/85q5Ly6zZKU9CxInvN165vnPDmhC2hEvL7BPLLk3tn0tr6hgJdrvHc+giDp5QBHw9XJqMPZT3ur+v3gQBVEJ3ci5pqlW9s/XHn8nbvGvONczAX7rR4TDrGPCXNngSLE5sG9KFsqioSozvEXZTjyw7CCDspeG81vcKzcfw/b3OxKqKWHiG2HwqDZ2o3z04rI0gYaiBUNwt/ISAKwAic+6NRTChc/gnYoWMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8Nudsx/reFd1tleilAdxKsrMlbe0SXAOKLvvV7E+2U=;
 b=ZkptqPSVI3hz5FRVbBLOfsefz5TK9oII1PppJKDwgHbqnhYD2fRhZapw8hrGsSwxAlf7dlzTVlOaYdmAQ59NsJZkp6wtxGR7m8yAr7OJeyHV9YDxzID4lj3/y6j9jJRX1NRSpt/QejxK5TkH+FWg22B29SLGXFaQLyz+rnbrQLsGJyTbVbOy4CDIx9EWfY89UMRl7xP0EGnIHm1ZBwsCvilhEmci8dzbKPHRJpK5SPfXm0NQ9IU70q/3TQZZWWM2f+HJnVBfaR4qBjZC++9BaxSYj/H99E9P44Jtlv6JNTeqkv3dbTGU20uQ6zPx92IfK2B/d6dAikN2k+QbJtZ1RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8Nudsx/reFd1tleilAdxKsrMlbe0SXAOKLvvV7E+2U=;
 b=R6G6V+6tB+fQGXUyvvXstq4ljyaChLtq58NSH1+EkZj5eehNnWSMqY/67+9f8+KS+OWBHpdJSHVsNgc1uCH6NZaIDsNH5SLO8R3HSwQcFqHsKsWzHtQLVWif3EPqkxy4i/DEq/EFBDnV8Vu2G7LVASPViPN3ETmanZRRvnfIsB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by IA0PPFC855560D7.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Sun, 6 Sep
 2026 12:27:03 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0382.014; Sun, 6 Sep 2026
 12:27:02 +0000
Message-ID: <ed7c3959-7222-4d3b-9195-7f3ab6a003f2@amd.com>
Date: Sun, 6 Sep 2026 17:56:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: udc-xilinx: cap non-EP0 OUT transfers to the
 request buffer
To: Haofeng Li <lihaofeng@kylinos.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Simek <michal.simek@amd.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Haofeng Li <13266079573@163.com>
References: <20260826133600.3797953-1-lihaofeng@kylinos.cn>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260826133600.3797953-1-lihaofeng@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0121.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b2::8) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|IA0PPFC855560D7:EE_
X-MS-Office365-Filtering-Correlation-Id: 9362bcff-391a-445c-e596-08df0c122758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4/qgzmMAaABOZ4xY6X8jOHILOwdtv5CqipjjfJ0N7/8BslDrGdK9p3RssSuvoEdZW0oF33THxtxVg2IBfda6806RP5EK+8KgRTOYxx4VoWDIYq4A6CIgEwKOoRXQC46cPVfeLl0euWwBrkr1Y6iYZMofGNRRIkpjpXiJzTSoiMtI1njTKlvx1dVRXMErbReXbSjX2O0vucGG7h0JqyVAhDr6CG3qvNUxcufUm7ZUM+vRrRQAn7G1iXtk6sJgQMdbk6Z0r0NVIVGQx6XadKF26T9RQBCf5sMtnhPRI2zJgvUtN2vm4HeMYz+6rwvyvZsmmEg6MY4LDR5a+xCYc/4zm/tkgtZwMmSX8QW7dOYiSch66G/C3gcQmUAAT2YGW95cQEziw38cmzc24WuVPc5WG1tJwewBw1du2QYLGrNrq+EssHJGA+siVQX1mv1EIXAs4it8pL5Hz8oCHy2SnRg00b22d2F3gh1+4YbWSrlUavAXw+syQcvfLSkt8MknBf4AdbxcThX0w5E614jvH2Gd8KpD/rT1A7Od0hipP1XihpUey6ygRtTKJOovM3cJl8Rcgaq5d55T4IwiLdKB01godLE9ZFxMPrmLlqh96HGfT/VJJH1iAiBf21zDU7yr0pmFtleSsFZszOHbOisNyLvXciD2zk5ATQv5A/gkNXfva60=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUhRTnZjYnZ5dzJ0NjM0cG5nbW56RGpWemVXOGFzdWJDZXlPWmpIaGxlV0oy?=
 =?utf-8?B?YTY5WFd5c0lGV3dsVkJtUElLSGxMbGl3SWNncVY2THFMQ2M2K0xTSUtJa2ht?=
 =?utf-8?B?d3RETzBzL3RramxIa3NvWFFPdzZZUWhTbldCd2JWUkhIVUlCazI4b0FNcFY2?=
 =?utf-8?B?VTFBZVdSTldCbmgvSDU2OG5EWVBRK1JsSjlKR1NoMUVrQ1FjcFg4M0V6ZWJu?=
 =?utf-8?B?WGgxTkVDOWpUdWpuQm83U2N4WmZZUzMrMzhqN0QzaFh2QUtiT29CdVVCL3Ri?=
 =?utf-8?B?bzBMdlBnM2ltUEdwWUZYcjRlZjVoTHh0VFUrdnB1RlZsTnNQRnhWbnlkYnJU?=
 =?utf-8?B?UjlCdDh5d3lNMUdZKzNrWHBZb1ZqMTg0TXQzS0s1eEN3K3BRaThqOHRHb3FN?=
 =?utf-8?B?TC9hWEV1SHJMbTRZTzdzeUVmK09HNUhFdkNNRnZ3SEppNU44TUJKSEd0VlJG?=
 =?utf-8?B?ZTZjYVhPcVg1cFBNa3BmdzhSQ0VZaFY2Y0p0c0huU0NhVFNsSm4yenZtT3Ba?=
 =?utf-8?B?cVA5bnZQK3FhSWIxd0VqajNYYkpFL205bHROWUZNcm53V2taOGJkQzhXOE5F?=
 =?utf-8?B?YjMwYlRRRlhKNExzeklnZlNmbFJKTlFpRXJmY2lDVWRGNU0vcG5QTXMrQW5w?=
 =?utf-8?B?SENzck1aMUVGbUN2SUdvbUNvNEZFSm44WkYrVHA3ejZERnhhRGpqK1lqWTNQ?=
 =?utf-8?B?L2cxektiUUlrUVplMndOMHZhbTFMSm1MM2FadU1jYlYxaDBVUER0Rmo1Y0Z0?=
 =?utf-8?B?ZktBVkt2bnRxNDR4NklCSUg5VWpwZ1lOdkV5UG5TRkhkZk5icGhVN25VckxR?=
 =?utf-8?B?K1FybjBFeEo0Rk9LZEV2T3NuSHZPSFpzSmxvRE9YcDFvQWFXQnRVQitQdjQ1?=
 =?utf-8?B?RjJpZlNORHNUcnFQMXF4Q2ZPZGs3Rzh3aHoyTkE2SEIyQnhCc2s4QUlmUFIz?=
 =?utf-8?B?OHNlWlN4RlFjOXYrUmFBa012UFF4ZlRQcDd4RVBlUWljcUFyVFFpMTQwYjl5?=
 =?utf-8?B?dDg0c3A1ZkhnVVF5VE0wNjBONFNPaVJWTkZRRnhTenlJS3JmSWpiV3dWL2s2?=
 =?utf-8?B?R1M1Z3FIc0lWbTgxN1VWVXFCMGg3dG53TFo0Q3BGaVZRWU1NRzA4bGZoa29P?=
 =?utf-8?B?b2trVzM0OGlNdEMvazVFRUlPQ0FldWFKUURaZ1FHQkNJdE1tTlFMUXo3MHlB?=
 =?utf-8?B?V3pmTFpBdkduMXRKRXBOUkxiTXNYMzdqdVB3ODNjbEpZZVZESitCczFBUzcx?=
 =?utf-8?B?NnVDQld1WnE5cHI5QWN0U1M2elVDTjB3czBSSlVKbFAxL0JrMkY0NExUTXF0?=
 =?utf-8?B?YUExQkszeFFicXM4V0NWU3BObkZBcUhaSkhVTUxiT3d0bzNtUnozUTdVa2sz?=
 =?utf-8?B?ci95Q0RsVFNQRmY2YmtkKzdXM2YzbmJWbEhPdExWQnZVQ3ZBRm40UmdVTEhF?=
 =?utf-8?B?S3p2cXNXZVJoR1V5SEhtenNPYTZTU3ZpRkZnaDlnbEs0ZDMvZjV3cHY4YWo3?=
 =?utf-8?B?MmFzTVpmV2MraGdOcVhhdFZrVXVuR3ZGaENiR2dFcWF6NDFUdm00Q3pVdnZJ?=
 =?utf-8?B?Yzl2TFJLd1dINWEyb1RjVXYrRTFmZTZKYjNyUzJZZ29FRThmdTJFVFRGMVdZ?=
 =?utf-8?B?OGYzNDF0S01ndXRXSzQycHE2dThuR0hLQWU0LzQreEZmSnQ0TVpsUUU2TGRj?=
 =?utf-8?B?SFZjV1RiNzRQWHQwNDl0V3dnYXRYdUVBV2xNd0Z6QzZRWkJFMFZuODZtNFR0?=
 =?utf-8?B?anFEOHRpTXp2YjVmUmptQncrVTNnYzJma1d2ZG45Um5sMHJWWGlrRFpwWkNo?=
 =?utf-8?B?ZTFqK1kzMjUvWEI4MHJ1RXU2aFRjY1BzNXhlUmNuTkpFWG5NU291eTk0RE9T?=
 =?utf-8?B?ZUllNjlab251OW80MjFuK28xN3UyUk1PUk8wT1BhajB1WUpoNklaY1NLdEd6?=
 =?utf-8?B?VzBEV25QK3RuZENHNlV5NjZWQ0xyKzZGUFNXS3pRbVNibGZwYUpRaE1zb04v?=
 =?utf-8?B?Wmk3TmcvaXIxNE8wczlZYjNBZmgzSjZkSzFsNXV1cjh2c0JSZlFldS9wZWJG?=
 =?utf-8?B?MmZjTXIxZXFOZXdrdGVFVGZIMGlKbzBBR2xTT1Z6cGJxcjFkVUhCMFRJUWhT?=
 =?utf-8?B?TzZhZVF3SlRTYXZuNzEzQU1PU0RVVmpJdnh3Tm1JNHVLVmkyMEs4cWE1WE1C?=
 =?utf-8?B?QVRhQ2FUL1o1OEVmazVzcE5JTnJGbTJjVUJUNlhvRC9zOG9WWVI2OS9aNjdN?=
 =?utf-8?B?YjlDakFudXZ0N09IVFo0RnZFbWRUUDE2S2ZlbnVYSWxhVHZWeGEwTE1oeXYw?=
 =?utf-8?Q?p16gLox4ZyCgCNvYxS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9362bcff-391a-445c-e596-08df0c122758
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 12:27:02.0562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VaCA733KnYQ0z3O/dlFfEt8ptkLEigMoqs1ntvjTBv8R6WdnYBwUsg8yn7SlJZ5P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFC855560D7

On 8/26/2026 7:06 PM, Haofeng Li wrote:
> xudc_read_fifo() takes the transfer size from the endpoint count
> register (device/host-controlled for OUT packets) and, if the request

only host controlled ?

> still has some room (bufferspace != 0), passes it straight to
> xudc_eptxrx():
> 
>      count = udc->read_fn(udc->addr + ep->offset + bufoffset);
>      bufferspace = req->usb_req.length - req->usb_req.actual;
>      if (!bufferspace) { ... }                /* only the ==0 case handled */
>      ret = xudc_eptxrx(ep, req, buf, count);  /* PIO: memcpy_toio(buf, epram, count) */
>      req->usb_req.actual += min(count, bufferspace);
> 
> There is no cap of count against bufferspace.  The PIO path copies the
> full count bytes into req->usb_req.buf + actual (memcpy_toio), and the
> DMA path programs a DMA of length count - both will overflow the
> request buffer whenever count > bufferspace, with only the bookkeeping
> (actual += min(count, bufferspace)) clamped afterwards.
> 
> Attack chain (USB peripheral mode, non-EP0 OUT endpoint; attacker is
> the USB host):
> 
>      malicious host -> OUT packet on epX -> UDC interrupt
>        -> xudc_read_fifo() -> count = endpoint count register (e.g. 64)
>        -> request with req.length = 8, req.actual = 7 (1 byte left)
>        -> bufferspace = 1, count > bufferspace, bufferspace != 0
>        -> xudc_eptxrx() PIO OUT: memcpy_toio(req.buf + 7, epram, 64)
>        -> 63 bytes past the 8-byte request buffer
>        (dwc2-style FunctionFS / f_tcm gadgets submit short requests, so
>         the interface does not guarantee a buffer as large as the
>         endpoint max packet size.)
> 
> Reproduced (kernel 7.2.0+, KASAN/SLUB debug): calling the real
> xudc_read_fifo() with the above state leaves req->usb_req.actual = 8
> (count 64, bufferspace 1, actual += min = 1) while the PIO copy has
> already written 64 bytes: byte 7 of the 8-byte buffer changes from the
> 0xBB marker to FIFO data and the SLUB redzone plus neighbouring slab
> objects past the buffer are overwritten (65 of 72 dumped bytes differ
> from the pre-use pattern) - the out-of-bounds write is observed
> byte-for-byte.  (memcpy_toio goes through an architecture copy routine
> that generic KASAN does not instrument, so the surrounding-memory clobber
> is the forensic evidence.)
> 
> Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
> Assisted-by: opencode:deepseek-v4-flash-free
> ---
>   drivers/usb/gadget/udc/udc-xilinx.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
> index bef06fe7543b..63749fd97625 100644
> --- a/drivers/usb/gadget/udc/udc-xilinx.c
> +++ b/drivers/usb/gadget/udc/udc-xilinx.c
> @@ -627,6 +627,24 @@ static int xudc_read_fifo(struct xusb_ep *ep, struct xusb_req *req)
>   		return 0;
>   	}
>   
> +	if (count > bufferspace) {

Can we merge this check with above . It should avoid duplication?

-   if (unlikely(!bufferspace)) {
+   if (unlikely(!bufferspace || count > bufferspace)) {

In v2 , also add fixes and stable kernel tag.

> +		/*
> +		 * The host sent a packet larger than the request buffer.
> +		 * The PIO path would memcpy_toio() the whole packet into
> +		 * req->usb_req.buf (and the DMA path would program a DMA
> +		 * transfer of count bytes), overflowing the buffer; only the
> +		 * bookkeeping actual += min(count, bufferspace) afterwards
> +		 * would be clamped.  Complete the request with -EOVERFLOW
> +		 * instead of copying past it.
> +		 */
> +		if (req->usb_req.status != -EOVERFLOW)
> +			dev_dbg(udc->dev, "%s overflow %d into %u\n",
> +				ep->ep_usb.name, count, bufferspace);
> +		req->usb_req.status = -EOVERFLOW;
> +		xudc_done(ep, req, -EOVERFLOW);
> +		return 0;
> +	}
> +
>   	ret = xudc_eptxrx(ep, req, buf, count);
>   	switch (ret) {
>   	case 0:

