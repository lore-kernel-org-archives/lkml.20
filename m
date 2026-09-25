Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012030.outbound.protection.outlook.com [52.101.43.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AB24307B0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343795; cv=fail; b=hW7v8ef2bLlIQbEKHbgDQ9z+WhvAueUgn6xOPhYJnGsug0yYPI1VQav5kvHz16VyPgoVIBRbrn/sfP7feQAEiOlb9lh0PzZdszlVaVrLbuU719Kneg9f+YEsCULY4+D1A8wJtpd36/VYFDAwAVbpRe8ZRoqBZ7aSDQ12sIwgN/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343795; c=relaxed/simple;
	bh=D+BKLbywxG8AZVRkrbvoNPXBb3N9ZUeQRBse9LIBPyw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z1IzjCfuo+auSXODWTb8WEKTp4l1hJvPNvebBz2HkiTxjIw01htkpmsnqBft2whzqxtswt4El31yUJ3EJxK9iFuBuyCuzeSBjlNQftCk70LZ61ccTS/6k3V/fm/wpm+m5o8n21PpkXMaQr6GKhsr+nClSg9YXqpYEM+4x9mRhZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xlzyX3ED; arc=fail smtp.client-ip=52.101.43.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xlzyX3ED"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kWcMSUGj4CS19HnV8Zp/pB8cFFBmW46ZSddXSdg9FodpiW+k5MoLAV+SC2bUsVbvbMhR48Y63KsKbV+ADpiwWXp6oCdkdrUcBEOCcS7grM/YAuLCl9LPyIrXgh5xklDcB7M8dauDYMpVQW/2xJlkd87XdsB8wbaw/WfBfzXj84y89zWrXu9BC9KIKcfo8mAJQNR0D3TkdnBO/bfJoggvcbn2K6Fj1CgaxEpByf0X6rJPgAc5gfYAhCvJbBL+pe46E72IpHGy2T2pxHwO/Nq/lZzP7XJYv0+MWks75/YokGZopfHKNCjAUDwHynlex7GEHK6ExFgwWpBvjXw5AavfEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ir60LkmUq6VLDc4ESuKOfveNHQQS4pI/asMt/RrlLew=;
 b=o8GFFNh72fStSM1/3JaldvWVppbqfcpXbyjVBJbDLE555ZnhByV+YQl2MWbbznnuQritSLaEYBbDpU9IogOJ5YRZdKbeqeHjZWD9BVbxRJl/VU7QH3gEpH4gtRcmEFpI/sUSBQohDye0gT0i9LCS/Xn5N3SIYAr1iD+m6VQMXN/Pwq0O6QsmRzRm5vfhiwSmCP+nc4xHzmaR86l89dF0oruTLWJl6b0wSty1tPEYAE2lZK0bhQslivkSV8ESLvLyHLzJYYBrUuGrqLNgFTGFYhHCNZR37lH7BVnR+puo6bhdhHEJk+E1i+fi4aAL4Ibz+iNGHpJ1dhjMzu7AfkipjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ir60LkmUq6VLDc4ESuKOfveNHQQS4pI/asMt/RrlLew=;
 b=xlzyX3EDvOWlPGGTVYYjN/xMEXUKg2LthCvAcNraWo+e7DJtxB22HL1cD0Iv1DVxbeP8z07bU5m9DrdGqHaC3Fzrf1AdVO4hOh1QrZeZJxYBbjnA82cOxv1g4furdw3kyYPNnG/oIcfiWY7zp4rxbEoSw3bO6VaR8jA08d+Tcnk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by SJ2PR12MB8882.namprd12.prod.outlook.com (2603:10b6:a03:537::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 13:43:08 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 13:43:07 +0000
Message-ID: <52bb8f41-1be0-4315-a998-974c5e133128@amd.com>
Date: Fri, 25 Sep 2026 15:42:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: xilinx: support RPU boot from DDR
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260803200502.209361-1-tanmay.shah@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260803200502.209361-1-tanmay.shah@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0132.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::17) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|SJ2PR12MB8882:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dcdcda8-a381-47bf-c1f4-08df1b0aee7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|10067099003|11063799006|5023799004|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hVkfPrPevK0ynQARtV2mEzRP2KbQoXUvakkiEEXFtr2v/oz7Ku9WQ2RsqI1snI9uzqer0U8NugjfdQg33vQGG3TODPZzRWMsV1e0PzTDhlPULNyO3VUTU1dmXPnB9gYn5k6JLXOsYPMAmYDWsMM5bHuKekbnc/HjSxxh4S+I68m9dRaIsV4jeYzRxMj4tSc6OyaFd+dy8psMMYduB4nfp05L+aTctr3yQdh/WIOxtyP3F1xUO/j9bSv/I3J8/IxdzEN+J3bty+ik/xKr/rpguSriA0kw4+1eOPw0KAMsMY9Tqp6XyIltBWZwJW+yXoS9IUYymDXeNnqIJZxCXPYbtgQO07aMXw9gX/VWhurfn37sADifZ8/rEx2eie/iw+Bx8pDaJYgY1NOTz1BrXrm5XTlztLA8Z4QLf8ss2JJLeNA9rCsMxEF0ewLVbNiFqDKYpTifOmLDbO5F25QxoCACr4YwMtdvTXUIk5tuB1KokUEWdUeTjY/OYhK2vKq8o9neTV6uSnLTjiM8MoxgF3Embah1JX2x8uN8BE2Z1tIqN8obWd3VtP02EfRuTs2vfubFE3mq82bsTkHIRxPrMp5AwlF+jcUaYolJlbQ3uE5hClx+kGFZohLqpbdfRj0Z4tpqsFp31a29LT9V9ljEaPJNpIfK6Dh/6GDiFn8RtI68RpM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(10067099003)(11063799006)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODEyaGIzeXdaT3QxaWFzUVE1YTlZUmNxa3kwSjlReTVwZ2RqOStReEhaVVVE?=
 =?utf-8?B?R25ZODE4ck82U3p4eldTYldzQ3p1UGZuUW9Va09yRVZYeFdyQWR4bDRvcm9H?=
 =?utf-8?B?bEZqcW9qUitReHpPclVrTGdUcW5Qdlk4aVRVeks0K2c4cFhYcVhNVXBRaFN1?=
 =?utf-8?B?WXVFYmt6RWxrdHN0TWpKVVdkSFdKZ0I0bE9oWkdJZWYyYWpqN1djWFJxQzVx?=
 =?utf-8?B?eU50ZE1pTXRkc2w0a09HRExSQVRiOEQ5cGZzTGViOTJmQ0NHOUJUaityUlJO?=
 =?utf-8?B?OFM3SmhuVEVKVDlFQThRam5mbnhWSFdBeEUwRkZQS2xoYzBxZWFQdUhaRDFp?=
 =?utf-8?B?WlhUOGtqUm82eHVRU09wdFYwdGpLUnc1L0NZSERXNXpQVHhmNGduc21QMStv?=
 =?utf-8?B?cHFodDFUUm5aODlvYjBuZ0FicmVranladDNtYVR0MmxJMFpwRk9QU0tmNllm?=
 =?utf-8?B?MVl6ZVp6LytVYU5lTXgwdjB2UldtbFAwUVNCT0tWeFlDTnB1YjhwclVERDFn?=
 =?utf-8?B?cHZxaFp5RndGVFhNdFpaNXdFUWJFbjlndEZ4UWhqeXVhV0ZGRWl2aHE4SjVQ?=
 =?utf-8?B?WDN3ZVJreHhxN2xyWUUvSldveW1YNGpvMHVVdHBRdDNQWXdWR2c0djdWWGNG?=
 =?utf-8?B?TzltNUNCWkhRK2FsR0lMQ1FxMmF3Y01JVXIwUWNxNXFrc2xlVXBVNHlTbUEv?=
 =?utf-8?B?MWdZQUtUK0VEZW5tcHpwQ0tzdllrRlVBbnFjZjE0Z2FpMWtxQlJ0L0xZdmZv?=
 =?utf-8?B?OUsrZyt4YmlYcnlLa1AxMVhaQTdHR0RzUmpKRVBnQ09sR3dSUFRveHNkZ0pK?=
 =?utf-8?B?NnB0enNGQytwV1ZnMTRqNzZ4OFh1RUdKeG1BSGVWWDZCSVFieWVlZTU2a1dU?=
 =?utf-8?B?SVBlQlRnWjFwRndRcDVVNklxMXZxanlYcy93TVB1ZTMyMXM2RkZDbUthNFY2?=
 =?utf-8?B?NjJJZGl6Ym1rMTlaa1didHRtR1ZqenRDbkZ6aXhucmJoRDlHYVdjc1JwZ2pW?=
 =?utf-8?B?bXpMOFFnZjVNL2lBTTNBeHdiN25Bb1p6UmV5MXR1WkdsUHZseGFEdC8zZkhx?=
 =?utf-8?B?ZU9seW9GNDBteEtYT2dHd2d0T0ZFbXBGU2p4ZGl5ckQ4ZDBWMU5qeE1aTXcy?=
 =?utf-8?B?ZjdRcERheXlUV0JyNEpodjJ6SWhrdFp3NUViNjFta1lMOEFTcHFNSlFRVlNv?=
 =?utf-8?B?Q0NUd3gxb3JuRVpqZFBsOVc0dno2VTVqNkR5REt3cElwR0JIZDJTRUxoTlpk?=
 =?utf-8?B?ekJjbUM2K2VUNTJQc0F0U0R4QXJWU2NKSW1sWVlEa2c5OGRmQTlOeS9SVUt3?=
 =?utf-8?B?anMxWSt3OHNvekw1Y0M1Sm1JWXhmYWVUbTdzSmx3RURGbTl1dDJuRDNOWlRy?=
 =?utf-8?B?U2gzOE16dmp6cjlVV29aRjlsS3NEZDdnZm0xV3R3Mkl6YmpjMWdibmViL002?=
 =?utf-8?B?SUJHMW4xUTJ6L0NTalk0UGxSRzdXVW1xTFlkU0RaTkNRK3VtR2FKeEdaeTBE?=
 =?utf-8?B?UG9IMndzQUd4VldVTURrN2t3R3ZBUlhiUWo2UnNjV01KN1BTRzZWL2tPTzV1?=
 =?utf-8?B?WHJjZUxMVENyam8rNm9HQ3lrZmpRRDRsckJtN0xXNXVMdm1NTmpPbzJQaVBY?=
 =?utf-8?B?R1k0WS8zRzd1YUpodFcxN3N5cTF1WFkyZnFhdFRpSjRpM2JacjZQYjJCTFBl?=
 =?utf-8?B?VVhETnBwZ3VxVUNoOEd1UTRtVE9EanVLbU9wTERkQ2RCN05YUkpDYWVROGVJ?=
 =?utf-8?B?Snc1bFlTUG9HZFFWNDBod0NsVzhtQzg5N3d2RnNaMGdLUGJCdUtCTUVxa3Z1?=
 =?utf-8?B?NWJIZmdraUJpN0xSbGhaMy9XYmhDY3h0ZHpxWk50RlIxQ1dpeTMwRTdRUlNp?=
 =?utf-8?B?VWpmQmM4SjMxUE1EOVpoaUlpZHdBQ2hwZU16QzNjSTJ4dEJodjBuM0tjYlpw?=
 =?utf-8?B?dGEvNkYvUlhhR0FubDMwckJzbDRwKzlNanJQRU1lZHdRbzRtMHcvZzRqQXMw?=
 =?utf-8?B?bi9hQ21IQzBqSUJhd1Bxc21KYjdLSWNCb3ZPTE5wUExreEo5ZXVkTHJTRnhW?=
 =?utf-8?B?VnV5UENGVmtJTmFTanRqTmxzbjZaYklGenQ5UE1hUldZOVJ2bmp6bGlEWml3?=
 =?utf-8?B?QmZURVh6VGNlU0wwdzZZeXQ0NWJjZ2ZEbVErSDNocVZsT0NLNUxmRlU2UUxa?=
 =?utf-8?B?a2d4M2JmWlY5QjFtUlIwbW9QOHZtYS9ZSXRPd1VyNklqMnpzU3NrZFNFZWZI?=
 =?utf-8?B?YmJUWENoemtualZwYnpuMnl6amdGRG9PcmpXV1puclJWVUZ4M3pFR0g0Ny9z?=
 =?utf-8?Q?vZbvpNl0iqyZq4Przu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dcdcda8-a381-47bf-c1f4-08df1b0aee7c
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 13:43:07.5963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /P6+S42nUGErHY8wDiW88mm4HKljE8jhLBzDKWJfAr/dJOt6lfuIz9P3gtTYaORW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8882



On 8/3/26 22:05, Tanmay Shah wrote:
> Cortex-R52 cores can boot from DDR. In such case, elf's boot address
> will be in the ddr, and it should be passed to the PLM via EEMI call.
> Add ddr boot config EEMI call before starting RPU to configure the boot
> address. Also make sure TCM-Boot is support for old platforms as well.
> Remove HIVEC & LOVEC enum, as now PLM supports boot address directly.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>   drivers/firmware/xilinx/zynqmp.c     | 44 ++++++++++++++++++++++++----
>   include/linux/firmware/xlnx-zynqmp.h |  5 ----
>   2 files changed, 38 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index f9a3a95b0638..bc3e407dbac3 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -1523,7 +1523,6 @@ EXPORT_SYMBOL_GPL(zynqmp_pm_request_wake);
>    */
>   int zynqmp_pm_start_rpu(const u32 node, const u64 bootaddr)
>   {
> -	enum rpu_boot_mem bootmem;
>   	int ret;
>   
>   	/*
> @@ -1532,22 +1531,55 @@ int zynqmp_pm_start_rpu(const u32 node, const u64 bootaddr)
>   	 * starts at the base-address and subsequent vectors are on 4-byte
>   	 * boundaries.
>   	 *
> +	 * The Cortex-R5 cores can boot from TCM and OCM memories.
>   	 * Exception vectors can start either from 0x0000_0000 (LOVEC) or
>   	 * from 0xFFFF_0000 (HIVEC) which is mapped in the OCM (On-Chip Memory)
>   	 *
>   	 * Usually firmware will put Exception vectors at LOVEC.
>   	 *
> +	 * The Cortex-R52 cores can boot from DDR and TCM.
> +	 * That means vector table can be at address 0x0 or at any DDR address
> +	 * that is in the 32-bit address range. Note that booting from DDR
> +	 * address 0x0 is not supported and the user must always assume that if
> +	 * 0x0 address is passed, then it will be TCM boot.
> +	 *
>   	 * It is not recommend that you change the exception vector.
>   	 * Changing the EVP to HIVEC will result in increased interrupt latency
>   	 * and jitter. Also, if the OCM is secured and the Cortex-R5F processor
>   	 * is non-secured, then the Cortex-R5F processor cannot access the
>   	 * HIVEC exception vectors in the OCM.
>   	 */
> -	bootmem = (bootaddr >= 0xFFFC0000) ?
> -		   PM_RPU_BOOTMEM_HIVEC : PM_RPU_BOOTMEM_LOVEC;
> +	if (upper_32_bits(bootaddr)) {
> +		pr_err("invalid bootaddr = 0x%llx\n", bootaddr);
> +		return -EINVAL;
> +	}
>   
> -	pr_debug("RPU boot addr 0x%llx from %s.", bootaddr,
> -		 bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
> +	/*
> +	 * New platforms can boot from DDR and require the DDR address
> +	 * to be configured explicitly. If the correct version of the
> +	 * IOCTL_RPU_BOOT_ADDR_CONFIG ioctl is not supported, do not
> +	 * treat it as a failure. If a DDR address is passed on other
> +	 * platforms, the PM request wake EEMI call will still fail and
> +	 * the RPU won't boot.
> +	 */
> +	ret = zynqmp_pm_is_function_supported(PM_IOCTL,
> +					      IOCTL_RPU_BOOT_ADDR_CONFIG);
> +	if (!ret) {
> +		/* config ddr boot address */
> +		ret = zynqmp_pm_invoke_fn(PM_IOCTL, NULL, 3,
> +					  node,
> +					  IOCTL_RPU_BOOT_ADDR_CONFIG,
> +					  bootaddr);
> +		if (ret < 0) {
> +			pr_err("failed to set RPU Boot address 0x%llx\n",
> +			       bootaddr);
> +			return ret;
> +		}
> +	} else if (ret != -EOPNOTSUPP && ret != -ENODATA) {
> +		pr_err("ioctl rpu boot addr config ver check failed %d\n",
> +		       ret);
> +		return ret;
> +	}
>   
>   	/* Request node before starting RPU core if new version of API is supported */
>   	if (zynqmp_pm_feature(PM_REQUEST_NODE) > PM_API_VERSION_1) {
> @@ -1561,7 +1593,7 @@ int zynqmp_pm_start_rpu(const u32 node, const u64 bootaddr)
>   	}
>   
>   	ret = zynqmp_pm_request_wake(node, true,
> -				     bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
> +				     bootaddr, ZYNQMP_PM_REQUEST_ACK_NO);
>   	if (ret)
>   		pr_err("failed to start RPU = 0x%x\n", node);
>   	return ret;
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index 347df66ee176..577a762e624b 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -269,11 +269,6 @@ enum rpu_oper_mode {
>   	PM_RPU_MODE_SPLIT = 1,
>   };
>   
> -enum rpu_boot_mem {
> -	PM_RPU_BOOTMEM_LOVEC = 0,
> -	PM_RPU_BOOTMEM_HIVEC = 1,
> -};
> -
>   enum rpu_tcm_comb {
>   	PM_RPU_TCM_SPLIT = 0,
>   	PM_RPU_TCM_COMB = 1,
> 
> base-commit: 9a4cdc958dd79fc6c3b20b51a10debec6ca09fec

Applied.
M
