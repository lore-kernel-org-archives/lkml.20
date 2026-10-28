Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793201158;
	b=Q8PhfqRcisCinNrkmppTaC6QqrTtj59nyC/tykGckf5xj6Mfwwz/3C6bYvZnVCjmNGLe
	 kiddXwC7T1giHPdHXF5v9ptCeGoqifaOrGKhUBDEdcJRGSaACXn8sjyC3XsUP8QZBD4tQ
	 6NKU0JA1Da4I6w+z4Fczo/O8L7kC+GSMkRHOVBrGLNyMEEmatuxRw2dw/wCxsBsfJfvbH
	 29WvP9NzWQD5lPgxnNscXKfv3pbfhirSQex5LLkRYMkL03gU7pNmFapixDu3ZT0Dadwnf
	 FndvnlF8NDlYQGxx5ZmMkdvDRKlM6rM6EMfMvdPkGq4q4WFwAqbE9D//KzPh8uxQRsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201158;
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
	bh=OfcLdZFWKx4jL5WniK99EPSPg+BrVaLxliddva9JLJQ=;
	b=auul3OlzUnu6/G7nvu9/JYmxfbcIBwWP/xbnuULf4vRH1FI0E84ztgJIWMAfqnHs7XA9
	 i51qClNGzMmrgbXCWaebnjKlO6744GEpC9Y91nR2Suz657OB+i+TFAS6kcP6M44AvyikE
	 rUGHNh91X3rnTLTFgigGDCeattlvwsupv6I2fFWO0t8CWBW9MHm1ZIraM8t7bjSbdGORc
	 i54pjZI0c+FN56v9EN2sggpOvNq44uf9hmzpTIgpSfN/p6Y8pcYHgwtp1VbijKKMi2akH
	 X9oC68xF4U4hmtRh4CVWNVemE6xMEiR8DY/SeM8QEr+UVUfohy2o5HESbeUlYpYAARw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qtihmgWv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.67
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010067.outbound.protection.outlook.com [40.93.198.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61AC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C61AC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qtihmgWv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M1UN6s/qoaXluNM1J84R6eeM2BulyzdhjSEiaeP6+0K1lW6rW+HjiFn91I/SqiB9FXUqx+9040V3zrbzfd45fnXukHd8Mbt/gA3L5vFEd+n5nKjeZNMRzG9rsdwpj3c9rulHCHvzCmPNq6fjxrAG3eEWaOYdN7U2bUOyNvL8W1080ohh6duJGx8dwRh0jBSgiwXjZuNW5xex4oL9yth5nZ8Hf/gI5/dJLS3bCpZEnREy7j/dfYY3NrqoT2gR0jT4RgRtnvMUMt+z7h60RShbiyCn//s+05uOwgStK5thJ9v3dIZbZ5FWbdUVpyziaud5gBRIC0B5SyLSooB5QiiYTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfcLdZFWKx4jL5WniK99EPSPg+BrVaLxliddva9JLJQ=;
 b=Jw0IfvW+meNF0W91oOqtC5yRxdd/dTipHsBBesPM5xXrpsVVQACDL3plFjaPNeaoGV8w53PtEKi39i+Jy+hIyxHXGwYA7OZBgx++HhLfdDeCakq9suSRTKp/T2T+7GQcm23vo3QybHtTdhY2JD6Bt99FiL555RIk8bRPJdj2nZu5LAZieuEUao68FB+b1aP5y3astg1TrmcRBgWPlRQkNTZRNWO9nbEwKSAwSGTsg0PVdw25Y6rQmia/ccS5QISqBOPKJO8niEQZlSWgDBOeyOJrJRbSRjMxXYSQQHOS3VP2Xo0w3UmiaUw+HhFAGHptzt4Qc7uTR/tN+HCj2alKUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfcLdZFWKx4jL5WniK99EPSPg+BrVaLxliddva9JLJQ=;
 b=qtihmgWv5PHMZxQAsDiiNu9Ocw8DKjwOXQl6qrS8iBqMfpwzHL8XuymGozj70ajsNr8JDCei8WjiTf6NajwDRxV4IMXRikAWgUNdEkIJJMbd/FaWWWk+dPFRY7XyaBU/rZdCynCp2/S7ms2CNTaIQRO/36rwpZDWVuPnp6nP5kYfSdGUckcOM/ks/DjHy6QPQVyzskrJOnezt5VHDIDyG61TIivG5KA0OGwgaufBX08D7rRVzh0Nzt5IiOGl5I5dHtxSF2Nlq/qyRVh7D782Lyrt1XxNRePfofm+IkVBDmovbxmZaL8SIEVwee4GJXbH1RyY5YRvfrK62YXiXlJokQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by BY5PR12MB4260.namprd12.prod.outlook.com (2603:10b6:a03:206::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 15:25:54 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 15:25:54 +0000
Date: Wed, 28 Oct 2026 11:25:52 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: yury.norov@gmail.com, linux@rasmusvillemoes.dk, tklauser@distanz.ch,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpumask: Preserve short reads in cpumap printing helpers
Message-ID: <auIUAEuUC65rgHot@yury>
References: <20261020170126.15428-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020170126.15428-1-dennylin0707@gmail.com>
X-ClientProxiedBy: BL1PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:208:2be::13) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
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
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|BY5PR12MB4260:EE_
X-MS-Office365-Filtering-Correlation-Id: cfa5736c-3c8c-4951-fef5-08df3507c1b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|23010399003|22082099003|18002099003|261028144727099002|56012099006|11063799006|5023799004|261022105027099003|261026140227099003|10067099003|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	M9wPZk7wWQWJCSCZ32nFmzDT+I9kySvJY4NkMKPABMuG2Kjh4ZEgSYc788q19YKwF4fvNp/W45OuwoUDtr1O4gdf/tUrWyAOieWHaB9IcagbSvooyyVfSj7sZRK3EBd5U/WUF5l/MwuJAwfKu7lJEsvttsO05oiqVPI3/tgPUAota8cThaEsoVQdm8U+7RD8Ricx2NptRmTaXnd8U1SBBZQVGqZ6id64lnKM7+cHDHj+ndXF/NSEfB5OLbfNywP1hcUXhcI/X3lntoa2F3qoO8GGYKJe/lLYYkyCyQeWZXGXtfjnEy1HdKfW0klpduDdsprJA2+egEmrWl864502jznoIVnGtg2Kl6NL/r3cLirxdFeLTZ7hSNWH0LGU0DSn9slR+s++lBJBmvhQ/W0fCqsZQmXN9j17R40SYjnZ1aUYH+KovrhE9REKEdIJNzQNB6DdvNQ6YufGOFoFTHctDRvFvxP5FTTLLDHai316CqBZ/WoRDl9ReIZv+zTADXNBszLG5UAGKnPc7WydvaMAQ9NLvOHi2+ali536Ah8Rop3eOgZWVzLWcH876Bb1/jjc0W5GjCZzRVJxyHHXBS8OuXRiOhktFk3e5+1mJWPqk9YRMhKpINu63pgv53k546K6pm8c6YWjMlXmG/hexMvJlIiZv/5hw22NjPE6dQ6k4bg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(261028144727099002)(56012099006)(11063799006)(5023799004)(261022105027099003)(261026140227099003)(10067099003)(261021121427099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uSKhYzj0W3CuM2nEjnPp+qYH48loBWeNKLdZaPQBjQAIeIJDxk3/x1qyWdtZ?=
 =?us-ascii?Q?CQVBYjpSz+5p1x/3BH90aUuM9rUCh5qwt0C3MzDjkO9yQZKNoUxYahYYNTFy?=
 =?us-ascii?Q?LaoXNpm72feVsssmG7LJwPq3Lb0x7UKY8wX86wI1KV0iyzTnX4KF/VOlagx5?=
 =?us-ascii?Q?4RsUKI2s01nkB///XyLEA21GxVUMAyvJK63CYJ+E1k5x/7iOSz7DjxyXiiyF?=
 =?us-ascii?Q?4RLE2sf/2FyEriWc4plAbR7FRI43oV/EkRbx0U9zxqgtjQ07UNUwb991xryB?=
 =?us-ascii?Q?K4THRjySAsjy3BZaBbMwpHDj4Vm7DuDh0lOj9MTFTqOZVaU9bBD2I1Rk4MHR?=
 =?us-ascii?Q?vbeGjkvIIff0Cc2Cxopv06P0b0LRiGWwYh+4MRlo28G6ceMfEop4W4h0Bqxh?=
 =?us-ascii?Q?DFEyKzvczIRsynnJKh256d+4A82N4rmnBqS2FfSo4yoiwFNOIIq65Ek6u4ji?=
 =?us-ascii?Q?Wj+T28It1xZeEvxBD/WccxNCCYIefjzKBnFGK7VJRePh4qFI1Gg2TBS+rnwz?=
 =?us-ascii?Q?afjbXx961/ONuNslexmub0fy/n5lEjQszexKcVeEvKAvBcHKtrdaTg3TBDCk?=
 =?us-ascii?Q?P9vT/wPwQZA/TzJENaR73dhX+eGT31RJ7QJk89qCCjwFonToLmgTrTIlzRxE?=
 =?us-ascii?Q?Xl+BFgexaJfGFuiPZYCIn+MGtOgkfxG1+W93C97cdP5a3IPq9US8Sd94ExXX?=
 =?us-ascii?Q?MdCQIITy3gBRPBd0dh1/Kkp8kD6A/zO0+qq7nBHfU8HUKISMa6yz0A4oA2Cb?=
 =?us-ascii?Q?1DcQWeIoJ7qW0jc8G+2UgY7P4RbkU5Nlx1E0d/0gBzvV8Ws1bhr++tqBYjDV?=
 =?us-ascii?Q?E1hM0PSTcchYcHl6GPjSd3nmtKgSYMhduHrTtvOlkq5qCJqtQisyNKfkseEZ?=
 =?us-ascii?Q?zUx0Oo1RdzsSL8zGSJ/FW3yKuWrT1hNWOZjLluFXIFaLTrsszwPBRHowFVZc?=
 =?us-ascii?Q?x9ova6Zk68TcJiDY8PLAjT+uS+rsOh1TBhpc189fz4iyXnaf/gSdB3kqjEni?=
 =?us-ascii?Q?dmSARDBlb0SaTG9PANQRxsKKk1TAqEwXv/y7aBy39AzUEOtjTPZrWGmsu5//?=
 =?us-ascii?Q?7hTuUaBSvmpLsz7RMt1D/Bis/KwcMEzhArH0QUi4hWjijg0MZyAMaqHZiI1X?=
 =?us-ascii?Q?2n4RPvGMB/0UNap2/KIKW/U+xr0rGMYl2BwG/x2IZFf1hPToYMHSCphe8v5m?=
 =?us-ascii?Q?yrL4qjiMRAfYgpw5Hlp466k7n8bA9VBrGJhYHIqlZ/2DRFdyzmAkr/dAakgT?=
 =?us-ascii?Q?g/kFlJN+PmqMJiqZxDisBr2wQDSiDRl1GxBEr/mQv2emrx3gCAlYE6KvpyRk?=
 =?us-ascii?Q?lqSCdlQjIJDRxMjz9evFekCkr+s0VBsfZAKC6G+8DWgzMnQXmbSyLv/1ohx+?=
 =?us-ascii?Q?iXy8tmeNhqIK7r/ONNagJjuixVuhQpx9mD8YREjtGldiAkoQpe5++lrmbnvh?=
 =?us-ascii?Q?x5ougJkxvLb5LLKBZbWYBjjxp+IUR8btX4vHn9SXxIuKCBe2m0aWxg7fQq8G?=
 =?us-ascii?Q?pP0XTxVO1785WuB5EbFGNNx8oArPqwfzZO1ssqQ/ikb+IfrCZ9RzmTWzjb6g?=
 =?us-ascii?Q?kZkJl7OD2mPmLOKvvbY0DhEz0aIwfHiIUCCkivUfCeWLs7Z9kFVagOtqtQkK?=
 =?us-ascii?Q?ULk/xLTQoeLQcFZpkp6Ld/MnqHC7+bfJYQm6Q15tT218Aa3q938ciX5rrnQu?=
 =?us-ascii?Q?Bafy0q60HHt/GZDgMOhe/Yn3DQ2ggwVjkzNOdhnf166NrxTUJ10mKRRtydeO?=
 =?us-ascii?Q?RKLQHkAz+qDV2RuL0M+IIr2RvIdA+SB2igWPgmBPKWljP9ega7Vw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa5736c-3c8c-4951-fef5-08df3507c1b9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 15:25:54.2394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TdNW0ha2Ag9vnnbSYLnaPPxHxZSH2NIEXcxumrZnEibLO7L0+jc9MmAwFauE08s3pWByfE+qdkvDX4Lwe7nTEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4260

On Tue, Oct 20, 2026 at 05:01:26PM +0000, Hungyu Lin wrote:
> The cpumap printing helpers unconditionally subtract one from the bitmap
> helper's return value to exclude a terminating NUL. A partial read may
> not reach that NUL, so this also subtracts a data byte from the returned
> length. A one-byte read therefore returns zero even when data remains.
> For example, this command prints nothing despite the file being nonempty:
> 
>   head -c 1 /sys/devices/system/cpu/cpu0/topology/core_cpus_list
> 
> Subtract one only when the copied range actually ends in NUL. This
> preserves short reads, EOF and negative error returns while continuing
> to exclude the terminator from complete sysfs reads.
> 
> Fixes: c86a2d9058c5 ("cpumask: Omit terminating null byte in cpumap_print_{list,bitmask}_to_buf")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

Added in bitmap-for-next. Thanks!

> ---
>  include/linux/cpumask.h | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> index 4c8bb6953107..2caeae982faf 100644
> --- a/include/linux/cpumask.h
> +++ b/include/linux/cpumask.h
> @@ -1334,8 +1334,14 @@ static __always_inline
>  ssize_t cpumap_print_bitmask_to_buf(char *buf, const struct cpumask *mask,
>  				    loff_t off, size_t count)
>  {
> -	return bitmap_print_bitmask_to_buf(buf, cpumask_bits(mask),
> -				   nr_cpu_ids, off, count) - 1;
> +	ssize_t n;
> +
> +	n = bitmap_print_bitmask_to_buf(buf, cpumask_bits(mask),
> +					nr_cpu_ids, off, count);
> +	if (n > 0 && buf[n - 1] == '\0')
> +		n--;
> +
> +	return n;
>  }
>  
>  /**
> @@ -1356,8 +1362,14 @@ static __always_inline
>  ssize_t cpumap_print_list_to_buf(char *buf, const struct cpumask *mask,
>  				 loff_t off, size_t count)
>  {
> -	return bitmap_print_list_to_buf(buf, cpumask_bits(mask),
> -				   nr_cpu_ids, off, count) - 1;
> +	ssize_t n;
> +
> +	n = bitmap_print_list_to_buf(buf, cpumask_bits(mask),
> +				     nr_cpu_ids, off, count);
> +	if (n > 0 && buf[n - 1] == '\0')
> +		n--;
> +
> +	return n;
>  }
>  
>  #if NR_CPUS <= BITS_PER_LONG
> 
> base-commit: a73b4d1fa7d334a5f7de5bb0a14726530f66196e
