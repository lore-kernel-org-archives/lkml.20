Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794604087;
	b=M/GvZ6sgZcQyxpTwGrFb26hM9G2OS5nUEbWQrJViCUYmY4wVJ1e+vaN9Q6QLadowua31
	 F6GSL5wl3oIxvBjQF2dfeP+C0VmCx+dwVkYNNf7ug3oXSADipZjHGQwAdWoYfZTFZeaGS
	 IVX6uJLyY42Q20uS78fNubkDc6ZZKyQ/6ktk9ERcIZAp/ypZfE5dsonlOzqUDNVZZ+Nnk
	 6OjIFDkMK8/WAtaqVQ3UNcHO8Vk178hF1fLURzyiAzXkM4L+9nqYRbHM4P4JajEmz4fdx
	 0n4rmzrL4Yx1znWb9cXSG+rXTa3pSbkWrlE5J1L1B/kYrhbXhlnwMaL09lCWC5PbWFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604087;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Zm8IpXwBsdsetm3nd3VhIMUWujfVlw4qFtnrgcXBEbU=;
	b=KCgiMioG2t7grV6I09tjVMadmyiNT3iqiKwRHZhmN/w6vSraEwrKKgkXNxorT0uRkLIl
	 kvN5F3Ms8Eu92h52/HOCqOyf8P1YRPb8imspDkOrHQoXAbs+/kI+MlNepJMwyXKi2GH6h
	 pcUuA/yglAN7TfwCifL4pYyCJwMWSeiZHxYZsmbsS5QARXwcFA1vYtHgARxfnuy0A9tI8
	 K5ECXs1/QCCM7XO1whyl7eCOUrIKFbfm3J9usQUET6vK7aTDfUx7Vd4ihZ7K5L6Hg28Ox
	 /EYIDhR7Pj1xFGA6aEheUMfk7YhRXdyHFSznMB5pHZ32KSPVE1nHlOrDdH2Iv1swDaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=QmoyZLGv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.49
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011049.outbound.protection.outlook.com [52.101.70.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D96606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3D96606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=QmoyZLGv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZ8RfFP3uEbJiX7jEfrLK83v+UmDjVyVsF3Y3e+DBiGCGkSx9lnlq8JCuAj8J5QBjbQPtPhNeEOIby+w6jmFkr0uxHJuJHYn35gU7ixvPaVPHBADo5ZdByZocvqubl1cjo+AHIGVtfALxEu1QVwHJnTGCib6cUJ03wBENO/o3XHO43uwGcF/EuBm42PUmGUJrfz2o0mnE/z4UGrHNpv4Uu0dVkRk6B3aAFh079QwQrVKwo/lzvABP6Kjaz0X6Q8puR4XFoFAxkHM0MKAhUXKjMo/tRw3kixywAzE4ki6FyWLEEk3D0Trgk1f5fLbVjg5r7+9s+YZW6N0zzLgaH3lFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zm8IpXwBsdsetm3nd3VhIMUWujfVlw4qFtnrgcXBEbU=;
 b=xi45HOFZTvOosZs+rXPq00b2wkZs2ixCbLFv0ZnuSjvPp9tT/g5kH8TXL1xc1rV8IJM0LsoACZokJy/N2jJf+IvPz21VIJfb9Ux/67CFvU0x2h99zHGbQzXuh2cZ0ESAGYjwavM4xzcmVXtYbShY8XefAFyRDWgNdolJHZ9bOInbTstnqzNt1MX3DV03Y140JMMP5qjw+DeG8sWJsirrL74d41W9fdYuUlBVsaTB5TxxZVSuyQ9EnkhPjjFddNxJlpDmJYKgOsWYMRmoZb12ooGTJYYnHsdIrPSfhOH+2VD2LzETKzfWwQo2oOH1TKwdpMCdk3M06pDZzgz+ERkXiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zm8IpXwBsdsetm3nd3VhIMUWujfVlw4qFtnrgcXBEbU=;
 b=QmoyZLGv2fDfz/vURa1RIbIM7G3e5ViKBqneZgwFrtpuQ15MYVqjk+ycM8IcE/alvzC02yXZeLYOPWRjMRn42cai3gQXVzBAEevcVqE0ylVA4VMno3/oRsI5icPCp67zD+OcQKbtbFXwswHlH/kHoy3aOUKmzVfxxaemryevGCs05V/Z7C16GisZJC9P0JalOjYYs0zH01T9+XYMhmIYpFtpdBWyqmMvXaXOSRsnkJ7BPTA+C2SlJBggxNoWtK0yvBTr5N3P85hzujooQwecjP8BkQ7ab+vDh9fs1t7QYsVVJsMqHS6i1xCWMAj6ZLRVcvQm5usqRyS0WGp6yGQG9w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PR04MB8857.eurprd04.prod.outlook.com (2603:10a6:20b:408::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 13 Nov
 2026 21:08:03 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 21:08:02 +0000
Date: Fri, 13 Nov 2026 16:07:56 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rui Wang <wr574332525@163.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i3c: dw: Prevent premature transfer completion on IBI
Message-ID: <avd8LPup7jOtWmdY@lizhi-Precision-Tower-5810>
References: <20261112090538.1917-1-wr574332525@163.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112090538.1917-1-wr574332525@163.com>
X-ClientProxiedBy: DS1P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:44c::16) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PR04MB8857:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f9ef00d-6f7c-49a8-a754-08df41ca341e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|19092799006|18002099003|22082099003|10067099003|56012099006|261028144727099003|261009221227099003|261009223027099003|11063799006|261026140227099003|261102123227099003|261026121527099003|261022075727099003|261009221727099003|261022105027099003|261009223327099003|261009220027099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	ws5KnPVj3jpfUXVLqaJ3bmixwYY3B7MXp2qvE0Vk6JJ63nCHR76hkLg6XMHoNEAPhEeTw30eNLSjKGeb8tzSKDuVozd0nZa0oYEJa42X6TgtHmKuHhRAF+UviX7f4hSDWXyc4vMXGg7W/40H2CxrQlF0mzYtR1yqhWOqQabOS38QYY/uwuY0D3AaTRN+glefupXqM17rQleqp453QkXoBUOjgen1aIOmPXM2T3kJ5/2pcqeW2zyXohzcJVhYi1sgqCnNSg9NvZEPXYmRz6bpF5kSiPUEtZfDyjAmDL+ozQstcStBJLdM9WfYIUwYpVrZA7WEQ5O9z9Gj572YdFf65oGYvYNxCcuY8YxfZTqQIIoVnRVgGDhSQeWnJdMIUB3uSnC+l1UYSQpeQhEMZj+9GSeIM1guwyl0zMRrglAi6ZjmYKSey+tVg1SU6ymuvVBDVL2OtaRU88huZYILmq4fkOBQJXanDiSkM8ZlQL1gaJ/POO9YqQxJpGqyQ3i5C5TetoU4UYr1CUXBeeNS+sst2+U5Zls/mAo1i8dl1zEvHcKsb7r1M7DJbitcCYhf1GC+BLqTXRGP8Dk6sg/1Fv1pMNNdqK+uCdaeqNdGFG4Wgz94RKtpmG/cgtJs+EWjUJ3ugZVlKC9AJ4xe9rPwmGNj20QxKrShqS7wSe995vleKxQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(19092799006)(18002099003)(22082099003)(10067099003)(56012099006)(261028144727099003)(261009221227099003)(261009223027099003)(11063799006)(261026140227099003)(261102123227099003)(261026121527099003)(261022075727099003)(261009221727099003)(261022105027099003)(261009223327099003)(261009220027099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oFJRSBSU6eOLfn5IOKXCC5AXpReXb5jHZayW37ZkDjsmZzFaPcw4YZ2TqRnm?=
 =?us-ascii?Q?FnYlz3sBw/5ysQTbc48nLf8HPmpVdWuvE8qwv672soQGKc+T9G02zT4w6IBU?=
 =?us-ascii?Q?ySfH1Y7WeR57sdAFUDnbc51DoiBvUk6cVcL2fIAt6bd9w+39eAxIWFQ0aDbZ?=
 =?us-ascii?Q?fLFPvaL58ZQ2EqUaCC44IDh8Ean6qpNOSFcSYYqiC9aF6AKCAIl19RLq28H9?=
 =?us-ascii?Q?Hr/jmmNjsFcLLDa7XqF+ihKGDjr2+mpdHgTm0jzuTY/8zx5RI5+AFywuGfLr?=
 =?us-ascii?Q?j0cf3nxguP4SXsPzTSNFglKlZAjh25nX1i4bpYdkJGeSbY3sgNMJe4txduPI?=
 =?us-ascii?Q?lFYvu60LgJqHY1IIQdmF0k2t7wFKP4mBFqoZgwn2vGckrzCp9d2wsoBZ021C?=
 =?us-ascii?Q?2tzshdFo63dL1xUqkrmefTuT75o2ViNTiuIXdl4KXe+pgZSR3JZwMKXZGhWa?=
 =?us-ascii?Q?oFKHJPSmDXCDP+sXz08hBC5RNSq8GUDv6q371+63d/7Lg+uBhowrX5qebX+x?=
 =?us-ascii?Q?0Q6LfffzKXzuUV9JO5NglzXhDiUY/jD7Er39dPEnkbKDsefnaeVKoh3JWaT+?=
 =?us-ascii?Q?XTMOktfRbam4UJTDUzfiDDDSCFWDuPx88+eA1x7mjK7RQH2D+pLNvaDsQLGL?=
 =?us-ascii?Q?GhuE+vcTfPCnXoph/f7OhVf8JGSY8xony0owL0eC8ynj0Z3oevqeYF3uUilC?=
 =?us-ascii?Q?6kO+cpMYb+C3hhnnZSbR7zeQPYuhp64HboAdcsIrMBN+LyWoqIUm4Y4NxqFa?=
 =?us-ascii?Q?QVlVJmKLRrUDa8FhwCLb1qaCPZ4DiwfDQVVIVSnTXtxQcyz1PWXbtO/QFBQ0?=
 =?us-ascii?Q?KU6gLp3wpqSBCgYZavEOIqN9vLDUY02J0F6wNpGD00qh5IpstmCF+cJEXMWj?=
 =?us-ascii?Q?wk+3wYvcXfMsdMZGwNzUTcfFX2hjTqmntyQ8AGvr0zFUVsdJn+8IyiC8OgV6?=
 =?us-ascii?Q?yrIAxGAE9DcIPKh+1sJAtUA6284730EO/sGCGuc5gAwKbXzNtqa8hy7XI1aH?=
 =?us-ascii?Q?45Iz/ZQGaTdfEmYvtMnsVSTOICJjmRgK1UfgyjPgRQGxb4aCUTQ/hQufLE0F?=
 =?us-ascii?Q?FPVnq20pvJxpXC1k+tvyFkOewjg6709sPsjlTAu+N2sMaf6rPQcU7U2SxRD5?=
 =?us-ascii?Q?7jtIpm3qotTM7zFGVQKLYnlsCfVOU14AqRuKNQzw3djnd620TakzsrJDm0Au?=
 =?us-ascii?Q?C4M5sfsHPrb5ywmNEK95KZCq/xYiyK4gOlp8U8Jk4fq9xWbCOoDT1gBtcbeN?=
 =?us-ascii?Q?WJbxAfHJbU7qGypYSAcGW6/3CFF3D6IU7detOC+Pc+lP3V9ZAZ3Kc3FzWAdk?=
 =?us-ascii?Q?JnEWAPeGl9RFhFg0bdFsaebUFu1de68WDF4BQaSTdkPCdpTPAllrFDuzzuQX?=
 =?us-ascii?Q?Zs6/tI1SWqWI7QznNwfqo37Xh7DcjiabUMUu6eCMp2+dtLLP7xIEjC0NODF9?=
 =?us-ascii?Q?2Q7V6Z9YnNv8Wsb8+h7oA+Ebi/RS6Re321ABlSylTh0TvEJWISOPXh4Ykp2v?=
 =?us-ascii?Q?xQRIeX/TkxwSMS8i5B8o+LfN9oJZWzgWKi3DOKZ98BpduKjO9w3CifOmyhUv?=
 =?us-ascii?Q?pm4GQLyCrteng/oaXHx+aTreHsz/YRy6Se7aWSQs5VZKkmluVsQYhHRwG6SD?=
 =?us-ascii?Q?ZHN0aQDvGLVcabqVJGO8kmrRHi/VYWKBQArTCUzxqyEErvjT3Tmz8xjTdLTN?=
 =?us-ascii?Q?4vj/jfyVghcxrw7VbyyWTT/gOU1sxsOzJYmeBO4+fFJKoSQhucGK/lnfsheC?=
 =?us-ascii?Q?BpXVlyzPZRIhkcJ4D8jlMR5cCJ9EPjVnOq+0NP8UiRZXVXme6U0K?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f9ef00d-6f7c-49a8-a754-08df41ca341e
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 21:08:02.4397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sd2UNcJ8SISEfolRxdSjOJdVK36GRumUWe6RORjmrQRotQ42yldUz4HYjEg2UUEuXi/WQURFGaFxOAPHWDbsddLrzI5kwIWtvelz6u3BBXUef+rq5jeh4cWfCL0oQRBY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8857

On Thu, Nov 12, 2026 at 05:05:38PM +0800, Rui Wang wrote:
> An IBI threshold interrupt can arrive while a transfer is pending and
> before its command responses are ready. The IRQ handler calls
> dw_i3c_master_end_xfer_locked() even for an IBI-only interrupt. If the
> response queue is empty, the function completes the transfer with a
> return value of zero. Later responses can remain unconsumed and keep the
> response-ready interrupt asserted.
>
> Only call the transfer completion handler when INTR_MASTER_MASK
> indicates that responses are ready or a transfer error has occurred.
> An IBI-only interrupt leaves the transfer pending.
>
> The fix was tested successfully on FPGA hardware.
>
> Fixes: e389b1d72a624 ("i3c: dw: Add support for in-band interrupts")
> Signed-off-by: Rui Wang <wr574332525@163.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2
> - Use Rui Wang in the author and sign-off fields.
>
> The possible queue stall reported by Sashiko is in the timeout recovery
> path and predates this patch. If I can reproduce it, I'll send a
> separate fix.
>
>  drivers/i3c/master/dw-i3c-master.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 34aa8f8..19735ec 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1527,7 +1527,8 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
>  	}
>
>  	spin_lock(&master->xferqueue.lock);
> -	dw_i3c_master_end_xfer_locked(master, status);
> +	if (status & INTR_MASTER_MASK)
> +		dw_i3c_master_end_xfer_locked(master, status);
>  	if (status & INTR_TRANSFER_ERR_STAT)
>  		writel(INTR_TRANSFER_ERR_STAT, master->regs + INTR_STATUS);
>  	spin_unlock(&master->xferqueue.lock);
>
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> --
> 2.53.0.windows.2
>
