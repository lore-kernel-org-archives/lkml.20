Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011004.outbound.protection.outlook.com [40.93.194.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371E8579836
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790196412; cv=fail; b=OZUp8jtwaGcv7e1OmxiCHevTW6nLEAdDjx6Or/7afHBthermzi/ibFAxtNcVH4aL7U+gTq3IGRK0QvTABNOtDzNcpAqZo2yVhBDn7bQMPl4zI48EroaVb8j2V1LgJ7yv+zmK+zcsdXbonhKi69EGh9RMQidk0wjY4t9i9amb3+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790196412; c=relaxed/simple;
	bh=5YjkjMfWuDT161mPIWpjHSVpGwpEir1M1Xww2r+CBWM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aDP96g/HO6WrP3/cqnQjFj9rnDhzkLm2DntKdqBbhG3GsJrEUilUnoX332yomdy5cB8VHTjBJr4B0riNwkw3x2cB1pg5lvcu3HCGzCAqm8Yywc9NJ0TPDi7nfM43jc7x9ZLv6nyvZf5IMIuNhj4lJX4MLkr1T5csvYC/T4ZHIr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0BbvFy9T; arc=fail smtp.client-ip=40.93.194.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0BbvFy9T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckBFKWUUH0U2CKnOrZqbTmXDYBL/qv+BZZsEDBP0ooiYIRuTeX/wW0rTn3qvWYRMUHaPDZTqD8sAoE7EZ5l1WcF2iB2zvkZecYGmf7zUcJno2HIGBvM5+5jjiYQhNXOTBy67dNFdvbpzppNDvxhjvlzFnEkP99Arh8mJ/KeVRKzclAbKK0PcK+WN+hSYk5/driZ2VnllykBn1rp043wIjiVkBe+Tw7yTtKcXND/TXChDYW1Ky0MT27/BpFB+Ow5c6Tpd1844bekWzeou82erN0/Gs/CKNJwo6F+K+Uu7f2uFQMZKynIF3W5/wI5zeGQN+wJb1bVoNrJNjEf/eXyUDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfMlBuUlwQwQZyiHFYkTVZpDECpudbgRNiRSrcc9614=;
 b=GJhf/N3jCVQIkDUhEq1UlfjybwKFH7WjkqpYXqC5lVkGUpV4KNxZYRdooQ36hFZ7HrAF+6LM0r9XqXSdOKQgcR3Ze7TU176QfjpIGKOXC4BhVtEnyh9LPGlAZZ+GRTX+WsoYiZcHdkMNt3GC+aFimquErRBSxHsslljvOql4YQXDPzCtyoOw2jkoxhrrRGexpHRCVmy74J2c0+nfAA0/7xHY7ZeLVzGSeIh1h1Zyld+/ibb4up2FUc+ZD8cRp01FUhGZmZQf28txH6+B6YZ8dc3bzRkFX4yS0iZt/7WBb7uF9z/2Hnc3tG8odH1zt2LwCa0HpGCQNkJXzrtwuRsG8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfMlBuUlwQwQZyiHFYkTVZpDECpudbgRNiRSrcc9614=;
 b=0BbvFy9TXRwMQq9A2DqkRIBT0/7TvH5jX/aWh4cIIrBH3B6eSDidEwYLAt7PJ687WSgeddqICBBf7wiK8t1gk2QSvQGM4ap/V7eGt9rSrQJesS+WjhhVWC0aN06NSFMXfPQwBJOkyiVi8oj8LhFz9CR5lLldSAToXFD/N0SFzJA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9558.namprd12.prod.outlook.com (2603:10b6:930:fe::13)
 by PH8PR12MB7136.namprd12.prod.outlook.com (2603:10b6:510:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Wed, 23 Sep
 2026 20:46:49 +0000
Received: from CY1PR12MB9558.namprd12.prod.outlook.com
 ([fe80::920f:8246:c48b:7ce9]) by CY1PR12MB9558.namprd12.prod.outlook.com
 ([fe80::920f:8246:c48b:7ce9%4]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 20:46:49 +0000
Message-ID: <d54742a0-c95e-4c9f-bc24-51dd6586c451@amd.com>
Date: Wed, 23 Sep 2026 13:46:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] x86/sev: Register the guest with the SVSM APIC
 protocol
To: x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, ardb@kernel.org
References: <cover.1789927246.git.huibo.wang@amd.com>
 <656edc5467df7d8c33676f0a80c3042885d95f9b.1789927246.git.huibo.wang@amd.com>
Content-Language: en-US
From: Melody Wang <huibo.wang@amd.com>
In-Reply-To: <656edc5467df7d8c33676f0a80c3042885d95f9b.1789927246.git.huibo.wang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR02CA0038.namprd02.prod.outlook.com
 (2603:10b6:510:2da::10) To CY1PR12MB9558.namprd12.prod.outlook.com
 (2603:10b6:930:fe::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9558:EE_|PH8PR12MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: cc97b79d-d7a3-4e1d-e4dd-08df19b3ca00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DBmpsbP8niNoLQYsJhaJaoHlxoR3mG52a/Zjd73FJDWj8v6BQp/C+eX62tka6VQr/qSC5cFkEPELBP+LLzz/B8gS223/KqQjTFX9jZA+pZJw2Lo6fnqiOBAzzNq0RmJfB1DsGASQlMlb/jwZhJ4rOd21fM8obapDxMjFmlOl1TKMuY+ubw0H7HtsL+Ek5pS1WnxEyC4jFqSCdsD58WInltB2h+vTusRBRRLaBE7STiJdzO0PBtMwIdNBZ9NacrKTSXEgyo720dG+OFBssSu0iRUIxUuRl4+Qq5qxnz/5VlP5ysJuCzPOujWJdNo2Ae2S2nARoe/hPmgKYtveM5ytreuZu9eQC83pMs/TabhOUXv9SjIARV+Zqi7s0y9cEPPUlPQEoM8d+lEkZudgHK0oWwflLFF/8FDMg/q07UVJh4qSDyrxhCQrM/xWjq3uaWldEqQmsFSXMJ8ZFKuWtE+z84MXPAdUDWVsSS6A7JsZrb6q9zvG1/BdPICihJ3/uvzI+9XEnN1EwcnfEKpLFqTSjccq3cUMbmJrVy1/yvHN791tXXMtxvzaTCEXqkOUNM3OuPWiqd/FSt22jLm53vBRDiXIWqy/MsLh/tpIN/R/INKoV3KI0+2zuASOtnBo9pbqDrd1ITmGzKxxG67HCHKyFLTCt6ZD9IoJAcs+5mFA8yw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9558.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bStlRVlBSS96N01JQ016aDZ4eER1MVEra3d0S2RXY2M2SmlPNzFRNWpEbjha?=
 =?utf-8?B?QWF4SlBDNlMvSnVYVlBYbG1lN3psL2hMRGFOcnJpakFBcktpTjE0RDdlMis0?=
 =?utf-8?B?bGw2aU5yUTdHZ3ZSNVZqcGJFSnFER2NBWjU0WUNJN0xRVjMzYjBIQ3hFbVds?=
 =?utf-8?B?WUg0YnJqakg4OXg0Tkc5WXI4SGJTWXVxOWI0RlNDQUZNaER0R0RNR2lJM0xK?=
 =?utf-8?B?T1g1QW1sNmF2NkxMT0NBS2Y4S1lzaVVkWVJPZTJkcVU0SUxWeTJLODdSa2VI?=
 =?utf-8?B?bExlU3lSSUt0MElHUklJZ0hMMTVtaE9LbjFQaDlmaHNlcnFWM2JzUnZKYkw0?=
 =?utf-8?B?Y05BaUlOK25ScmJGMHBIR2I2WkcyR3ZEQ1VYS3diU05BeFJacjNhR1h4NkNx?=
 =?utf-8?B?UitXeHVxVFduYTJKWXovdVJZQjJ1c0tKem5lZXBudnc3N2lNRkNqZzR3cmpB?=
 =?utf-8?B?Q0FPZ2ZnS1Y4MVdlM0sxRkJadHZqRlp4QU1wR3JFVDhWUURjVU83MnVodG5E?=
 =?utf-8?B?UDFFWkpQSS9Ec2ZpYTRYaEVqVWttMlFQSE00UmJocDJTOXFKTTVZWnhpZFFy?=
 =?utf-8?B?cEZFWnVLc2hpVkJQM3FzWkJQL1NLTE9zajROaGdOSHd2QVFLSnBJTUcyM0pQ?=
 =?utf-8?B?ZWpJbWtlQkdJZnYxR0gvMGVJNEc0T2pVRytyNXNMOEZadGJuVU41aXh5K2Ru?=
 =?utf-8?B?OExrSXdTdGpwOGdMWlkvRnlGRHFQWm5TRURJNGp4NmdoYURUTm9iSjVsK2ds?=
 =?utf-8?B?NHB2T2xvTk9zcVZkSVhRL0tIVGt1WGVGK0VMZEhMS2hHWnI0cVpyQWNFWjRo?=
 =?utf-8?B?S2hZd0lEY09BL0VJM0RRU1lOTVNJaG5UeUlYR0lWNFNrUWhIUEtXaWQvb2p2?=
 =?utf-8?B?bmd6cEtzb1BwVERYV3pDcGVTVVJLekpOS0hUUmI2YzRjUHo5V2JMbUdmUWsr?=
 =?utf-8?B?WEJ6cWVPWFZZT1FWWnUwWmZLNmMxREsrMWtZWmxxeEMrUUxwSXVMZUdYZHdy?=
 =?utf-8?B?cHZRVU1GWlNLMkJEV2J6cm1LeVI4RVhycDJzZWlVN1Uyc2R3N3UzNmRkZGVW?=
 =?utf-8?B?MU5tQnNyaGpNZ0RGTXhkZ1F6NkxrZ3R6NUhwdWlwYy9MSjd6d0NhMzVtdHp5?=
 =?utf-8?B?TE56YXhlSXhxRDhsSXc2SVZFci9BOWVVQWs1UVlZaGtnR0xJaEVFSldISWNx?=
 =?utf-8?B?Q2lDbG80Ly9EbVp1V1hKb1drcVZDS0NwS3IzVldXT1lJU1huNG82bStRSTlH?=
 =?utf-8?B?N0VrbnZMTFpxeWRySVY2NXVickZrSlZURDlVMU93SkNnMWdqYURQQitKUWE2?=
 =?utf-8?B?eURBdWJwNkxJZ0IwWWUwUlNnbHNRUzdhaFJBWERrakFrQjF0d1NvMk5xNG5h?=
 =?utf-8?B?YW4weW1zR1lyU2JuNm9xMjNqcDYyVElsZWdlT01uMC9TTHNnZ21EQ3E5MEJE?=
 =?utf-8?B?SnJMaUlVeUxhRGVVQWlDNmMwVFgyNFpuaFhTeDhzUVVNR0NpTHdzdTFFU094?=
 =?utf-8?B?dUVzcjNkMmpwVXJUZW1pK0llWmJCT2dkeVAzdFc5MDc2aXVXNmlkZUp1dStB?=
 =?utf-8?B?dy9ERHRNYzhweVo2blU1ZnYrQWZiQnVMWWtUdTN6UWU3VVF0elIyT3lIamJ0?=
 =?utf-8?B?aWswQUxwWitmVFVKdmR1RFhqRVJaVU1FWnpoYTVUbTFSZ2E0RW9TUTk2Y0g1?=
 =?utf-8?B?VHBRTzl3c1hiTGErU3R3dEhMMUV4WW9qK3pudXlZMXNLTFA2WVIvUCtka2Iv?=
 =?utf-8?B?U0I0eGxaYjJNTDJzbFk1NGFIRHJrQkV6Z29EK1d3ZGtlVU9ZWjVqUUNDMm9q?=
 =?utf-8?B?dWlhK1FFelJVR3NZVDJHK0tFOGhTako2N0svQ3VNclpHMHVHaEtTQUpOUTg2?=
 =?utf-8?B?d2tlcTlBRS9XWlNTbEFYSmtUZ2lkZzZ6VFhuLytPR1B2ZVJhTmpKZUtrNmFM?=
 =?utf-8?B?bXh0K3pOLzcwVmNpT3Z5RmxiSEVpeHFVSm9HamRUYVAzV1diMkpKT2ltNnZy?=
 =?utf-8?B?WWpZdHBiaGpkQWJLMS9zUWpOYVJiTHI0ZUlGZGdyY0xTOGVaWnJWNk1VWXJo?=
 =?utf-8?B?cFZiRW8yWHdrSDkveURPMGpyaEZhODYxS2o3VWFITGUyYjBLZC9paDFJSmZ0?=
 =?utf-8?B?ZXBmaCs1bUdJTWsvR3hIaUo5S1VIL01Rek5MYXZhN3F1Z0NLMUZOZGt3Q3I5?=
 =?utf-8?B?ek4vUEtXT1B2S040RUxrQzlpU3BkUnhheDR0Y0dCdVBLVWFyR0Z4SC9GWFNp?=
 =?utf-8?B?TjlQVzN1ampJQ0h6WVpRTC9qZXN0WUlFWmNhRHhYeHd6MEdzcUFTVm94ZnhB?=
 =?utf-8?B?ZTAxZkNpaGFJQlZVYTd2RVpXekpFRTNwaWJrVjdmQlA4dER6RFF4Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc97b79d-d7a3-4e1d-e4dd-08df19b3ca00
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9558.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:46:48.9917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0g/z8iAw5hPdMkTKbSJF06Q/3pWrQ5AwCkyw4xAXYkhycB+0pkB9zFkU8SCzig3cZ4XOL/DEbAlZnY2mGotjNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7136

Hi all,

On 9/20/26 11:16 AM, Melody Wang wrote:
> diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
> index 49388524a61f..35b8641119b9 100644
> --- a/drivers/firmware/efi/libstub/x86-stub.c
> +++ b/drivers/firmware/efi/libstub/x86-stub.c
> @@ -793,6 +793,9 @@ static bool sev_prepare(void)
>   			unsupported);
>   		return true;
>   	}
> +
> +	svsm_register_alt_inj();
> +

Sashiko said this:

"Does this code handle non-EFI direct kernel boots correctly?
When an SEV-SNP guest is booted directly and bypasses the EFI stub (such as
when using QEMU's -kernel with a setup_data CC blob), sev_prepare() is
skipped entirely.
This completely bypasses the svsm_register_alt_inj() call.
The main kernel checks for Alternate Injection support via
cc_platform_has(CC_ATTR_SNP_ALTERNATE_INJECTION). This check relies
strictly on the sev_status MSR hardware bit set by the SVSM and ignores
whether the guest successfully registered the APIC emulation.
Could this cause the APIC probe to issue SVSM APIC calls via
__svsm_apic_msr_rw() that are rejected by the SVSM, leading to an
unconditional crash via sev_es_terminate() early in the boot sequence?"

Alternate Injection does not work without OVMF support so no need to 
handle the non-EFI direct kernel boots.

Thanks,
Melody
>   	return false;
>   }
>   

-- 
Thanks,
Melody

