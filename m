Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012056.outbound.protection.outlook.com [40.93.195.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327F4547074
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122325; cv=fail; b=igP+4sd65LtqPDMhS7CkvpafcyPRxyHd2hytN7XLBqCJvIOathXdojVm9ffSsDaFSxDgcQu9FtqVciz15HKUmEzVQKv9gHLVEQTt75wefOFXIebdteg2NZykm5ETStkRo+yvqP0VWuU974TI1iw19MdGfrp/Lnc4NkRf4/1oyj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122325; c=relaxed/simple;
	bh=WDB/dUYldUqWIxKBUgqAniLtQr6wo7VdTn4KZbqs6Do=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mJqsVAIz+9CSLWPinrB3hhNCAVoKOXRGgjLmw6qTARdSpecfEJVb4p5knS0Q5qcYtC3EsjbH5/9bZZQEVf/UggDtAufEb6n9HBbnhdHoaOu/xI8kaK4wFWEyVn2EBgYk73fMhER/sbb+19smwoDX760z+x4kPrjquNuDUEb7eyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=s3ISXaKZ; arc=fail smtp.client-ip=40.93.195.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="s3ISXaKZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPfzPjP2btqVT5u4KWhUHIanFLBI9if7+F0SNkt1A89FTMUNI8Ub1Ot53wxncDJszmmUJwXPbQLDCg/CC4QRaltDAe3FATWrCcRJzE3pV9GI3LmMhVxKEsHAIuJzpRWzxQrG89g4h8vrkRauFfj8UOnHbDSO0Sv32dwmBkcNjpKPjrmqomBLZnTUUP5ulgBWvWty6/FPttkFzQLLAAfAdSBVS1tYM5E4sMI9FoVPCFarDOKNfoMHW7Eq4WvSE5zRSxYB3rAmojVAQCkCv6+2LWQJ2Yf/pKytgPBMuMPXaf68ltod+Y5VTv3eHhQ9QNzMrH43CbuiyM8k4YCENOXVsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxIoJYYJ/2644TNIqgJ7pjize4DF15sW3/XBgUPkO2o=;
 b=GTV68eXG+yFs1JfCbNY3E8WnbP5eWjbZIWB3qk0mix6Cx8kj24pJP7RzisQPGJgSCo1544RaNQmGW6sxHjsYZ9UiQjkdlNagdmzln5q3vCt5K+Zlp+Sxv5e9TB15rWJW4eQC6illds5efvPeqzMRjxJXy0WoTR31b7pH/Pd4R8vCfJ4h5wPLsOKy3mJEHppXsq81t0Z/SvR7+GHK5PyzKkOErMn7bJlFJkvpjtrAvl2dfsZkqg91Rx3YOJ+Xvw2GErOI66TUitTO/3ggkVrY1U5UYOxMigE5KSXn26aFLV8UAtaEizF7pqrsQxzTUNZfR0L6pqW/VD9hBSWXoNqS5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxIoJYYJ/2644TNIqgJ7pjize4DF15sW3/XBgUPkO2o=;
 b=s3ISXaKZtzRRGOiMZjHj6kLhVPHsGHbLHfBOeHFxzVLLPv3XSAuDXmJF/o1syirrkdQd6XYLePvsv91K1ExG8k8MMjX2FpUeBpPQy90MzadyjV+pQLGv1Xz88QDRaHhyZrG7vE8h8V2atknMa+DUwC9UYlLkS/8PFfB62qEBA3w=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH1PR12MB9575.namprd12.prod.outlook.com (2603:10b6:610:2ad::12)
 by DS0PR12MB6437.namprd12.prod.outlook.com (2603:10b6:8:cb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Fri, 16 Oct
 2026 03:45:21 +0000
Received: from CH1PR12MB9575.namprd12.prod.outlook.com
 ([fe80::2aab:a788:44ed:f4da]) by CH1PR12MB9575.namprd12.prod.outlook.com
 ([fe80::2aab:a788:44ed:f4da%5]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 03:45:21 +0000
Message-ID: <407c7a4f-6b58-4568-829c-a0de13c4bb6a@amd.com>
Date: Thu, 15 Oct 2026 20:45:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] x86/sev: Register the guest with the SVSM APIC
 protocol
To: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>
References: <cover.1791912902.git.huibo.wang@amd.com>
 <5ae01ceb58a3fdf6ed9367e236d77b4a21a3363c.1791912902.git.huibo.wang@amd.com>
 <81c6d97f-850e-4f51-919f-cb3a11f47962@app.fastmail.com>
 <061fef95-1a27-42e8-86e8-23172ff2425c@amd.com>
 <ea212c71-90c0-4474-860f-3b1b33f89932@app.fastmail.com>
Content-Language: en-US
From: Melody Wang <huibo.wang@amd.com>
In-Reply-To: <ea212c71-90c0-4474-860f-3b1b33f89932@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P220CA0150.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::13) To CH1PR12MB9575.namprd12.prod.outlook.com
 (2603:10b6:610:2ad::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PR12MB9575:EE_|DS0PR12MB6437:EE_
X-MS-Office365-Filtering-Correlation-Id: 0394e53a-d932-4990-196a-08df2b37e71a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|261009223027099003|3023799007|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OL8wSenA/kjQBVYSsyMuouHN0pG6cmBfH6khumCvtk/b9kxN7/CePPhxUBK+GIxsFRS4BM+WaNIqKedcfiyvZH2RmoYIfHuurwwRpmrGl1xMjkoqytyyd0qPq8jop8+Ec5EabcVwPuWaAwO3qwXp0NWHDe42bhZgFlbAnEQZwb1H6ixqau58EuGmq7dDnKcRL7Wp7wecYw8UZEigOS1PshLgKkBVbA0eGK2ar6Yp6BlF1xpGj2uyuBt9l2wQpAQjhYOUh9UWJDtyjMqjMgROdmTU5D4dXrJBN1iym+Fqpt8fcgfpoWJwUExWqMQWl1hMF65MvuZbSFaJuQz0tj94XC4jTM1SoEXz14Mbs6xL2kd7pbF2gjO0/Yyb3e95Sn9MvZdZ35yH/6Dd4BLjembt0kupI1fT0zrvYwJH7wvFwl1koHhbgN0oZXk4UNG/ljgEbIBJmPH2ynF5SoinD0AhRF3ua2Emh4/meie3/36c5jIKYc2JEJnwFnWXvjns9/fzfc0FkpSnw1ryJsfSWhYUVOhpOZwEzXoX1LO6d2CATMlFw+MNG45JpEv+TN3HuZGR37OhzIIyLgEECgLdT5tOYkdwvdCAGAfxVLVmQ3+5VnBw3uc3evbKFzyKQc0CpOpYEwz+DJNVTYaNeVuL7gUEvXcCACImeBw9REZMDl+AZHU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PR12MB9575.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(261009223027099003)(3023799007)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUFmV1NUZHJGTkRqZ0Q2TlRuUEczQVRXa1RMdTBUT1ZQMFFvQnZ4MkorQ2dr?=
 =?utf-8?B?QStHaTNucVg0dWRKMHk3czFqVVo1UGVsYWVEeHphNzFUODI3R0tzMFk2Wjls?=
 =?utf-8?B?VG5kUEg0Wlo4bmVWdVlrY2xTUkVFU3BaSzBsUlBRdjNpQmwzLzdJSlByZzBj?=
 =?utf-8?B?SzFEckc3bXN6RW50cDA3UHh3U1hWNVltQy9DUlh3WGxYb3Fqam9OUXUrMUxN?=
 =?utf-8?B?Qzl6NTFxQlNtMm96bnlHc0JmaXRTeWdYMWRIdzd3bTNBRHJHVzZXODhvaWRa?=
 =?utf-8?B?STI4R2cvYmZpaDhPdFlwTzh4eTdBYU1VNG1Zd0dsMjRrZlFFT2w0WkFiOEVz?=
 =?utf-8?B?UFU4ZzVSQ1BEQXUvcWVFdFRTdkwwbjZxUzBrZUZlVkpVUDVqNFN6Y2NRUGJM?=
 =?utf-8?B?ME4rVVk3VnJLUml6bHoyY0t4YnhxNjVMYU16SERxcUhRclVseXIzVVl3L1NE?=
 =?utf-8?B?SHIyYWpRUERVV05KZCtSbERzcHBBbTRBVVBvYlNITEhUclc5Sy9BWG5xbjdx?=
 =?utf-8?B?NDcvY0V6QlhoNU1UVnVqNzhLNjc2VVMwbUpaSXI2aWRvUlBpSWxaZEVJNlRv?=
 =?utf-8?B?VW5CaG9GaTVWL1dCczA4NFRDNnNQODBLN2Zrc1dFcnd3bjgzNmJsbHplSWhp?=
 =?utf-8?B?dm9pWmtDd09VVGw2NVp5Qm9HejlDcFRCVFpiRW1lNFhYVzcvTDNSUzdtejNm?=
 =?utf-8?B?dDlrMllJVVNlS2U2OTcrZm42N1VyQnZiMjBIdTIxalh4UGtUSUJXemNmcldY?=
 =?utf-8?B?aFIvVG9ScVpPNk03cThiaEZRb21CYUZFb3l2dVZlVlQvaTNTVk4wK3JsaStp?=
 =?utf-8?B?QWQ0SkJlMXROUXBJQ0pBVTdjSFEwMjcvc2NqU0pPS1Fqd3NOelAycU5QWmpL?=
 =?utf-8?B?bU1jY1o5Q240MTNRQUFXWTBsbHp0ejE5dDZEd1EveU84T3BRV3U5UGl1RENW?=
 =?utf-8?B?MTNDYS9YUlc3a2NpODNGdDhMOTU2L29HUlZHT1MzT1JIZU1VT3EvWHVlSmFZ?=
 =?utf-8?B?TU5WTllVb0RLeGlSV202dnEzbkVGU2tMRlM5aCt0bFp6UVBlSFZFTUEzNVpI?=
 =?utf-8?B?SU5ZTCtPbE9NVFdDMEhYN3c0cjZpK3J1QWJTK2wreWVLUjc5TUQyY1dxenNQ?=
 =?utf-8?B?ZVRqYU95ckNQYngvSWVOSm1pZjVzak1xY1ozYU80QzFXcXJNRUxZZHNLN1d1?=
 =?utf-8?B?eGNCUVZBU0oySFRGZ3VJQ2d5eDc0K3BNUVlMUndtV2NNNHJwYXZaTVl4MzlB?=
 =?utf-8?B?WmlMdlUwWEZaeHV6ZTV1Tkh1N2t5L1U0T3JBak1ka3IxdmFnNGRacS95U1V1?=
 =?utf-8?B?N091REh0L1ViTmM1Q3NqT082Q01PdkpxZ2w0WEJqR2t2UDJadFpuREJOWEx1?=
 =?utf-8?B?RFI1UkxBZVNoY3R6MkN3S1F0Sjg4S1BqK25ucE81OXh6Nkthb2tzRlNOd2dv?=
 =?utf-8?B?SkgwOG84cHUvUW0vRDUxMDhkWWI0NjQ1Qkt5ZEg2K25VODJzTjFLU1dmdFlk?=
 =?utf-8?B?NDN4RnQvcEx4MmJUK01YUUxWb0cvS0p4K2lsMlREWnAyTkhLK291VzQ0c1Jr?=
 =?utf-8?B?bjRoZER0S2YrL3BiR3UvK2tUWXl2bXJMcmh3aE1iemFwT3RvOVlTYS9NRTF6?=
 =?utf-8?B?UUd3QjA5Tjd6SDhOV29DQmlmY0szZUMyY0xrZmFXSkd3a01lV1BMNEE3UkUy?=
 =?utf-8?B?eGIyNXl3ektiNlU4TSt1bUF3ajRUR0E4RUxJTEFTWm8ycjRyczBHbC9Fckc0?=
 =?utf-8?B?ZVZVT0VXcFNCK3AwMGNBR2pQY21HcEwrK3JZb0JXVTl5M2RrK1Q5Rm9YajVF?=
 =?utf-8?B?L0VCVTRQYllrbjlnZm5FMEVIYjZIOFVMTDExMk1RVUwrNjk2V0Y5Rml3THNF?=
 =?utf-8?B?Tm45WmFIUGN5Ym5UY096K3hTR0E5OXBLYVRUNFhVTkg1NSszUVRrY0h0bzdM?=
 =?utf-8?B?dGc0Smo4d21BT1JKcFhVMFlNdGJuYXNOalpOaDR0Yy9BcDZZT2RDd0Nycjlk?=
 =?utf-8?B?Q0FWQUg2WWZlOE9oMlRwVXdSQlYxWUtUY21LYU8zUWxBWEQzSVJxRlc1d1NN?=
 =?utf-8?B?VEgwNkRUbzBzalBESTJBckZyTFo5MzFMVHVkZzlKQ2FzYlRBeWpmV3UzdGJy?=
 =?utf-8?B?Njlub1FpdnIwaGxqTXJFbUdrVGRFMytNMnJ5dG1valgvYzhYOTBENGpnMGRU?=
 =?utf-8?B?a0NpT0d6d1ExdGFrS2hwV0pPYU5OMXdONm9Jc1NNU3NPR3FIYlNGOEloOWdB?=
 =?utf-8?B?T0ZLc0Y2UlRjeFlxeWxNN1AvS0twNElnbDRHb0NVUGRJbEtSazIxQlppY0Vn?=
 =?utf-8?Q?fHkGYJifYfnvrDODh+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0394e53a-d932-4990-196a-08df2b37e71a
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9575.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 03:45:21.3160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7qPFRhNOujze+cvdkpv8lA7OSQ5FidG+onzL81foFm6jb435XaUWZj8ow1b4kGJ7NFL/a+AD2Wn+5km/oOH8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6437

Hi Ard,

On 10/14/26 11:04 PM, Ard Biesheuvel wrote:
> 
> OK.
> 
> But there are three conditions where there is no point in checking
> whether the protocol exists:
> - early_is_sevsnp_guest() -> false
> - snp_vmpl == 0
> - (sev_get_status() & MSR_AMD64_SNP_ALTERNATE_INJ) == 0
> 
> So this should be
> 
>>> if (!early_is_sevsnp_guest() || !snp_vmpl ||
>>>      !(sev_get_status() & MSR_AMD64_SNP_ALTERNATE_INJ))
>>>          return 0;
> 
> then?

Yes, pretty much. That form works.

> Btw please don't use bare '1' and '2' as error codes, especially
> since you don't actually check the value - just use a bool instead.

Yeah, sorry, that was a leftover from a previous version.

-- 
Thanks,
Melody

