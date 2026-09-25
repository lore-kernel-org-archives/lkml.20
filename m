Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012022.outbound.protection.outlook.com [40.93.195.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7544249DB89
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344118; cv=fail; b=CeZ3taLGC7s8eLFnPduvyV/sMit9RO1obUGnKywKNSUa8HkUDkYMifjoFgPDDWjFyQgj+lIqKA9ydN0+ZqTKL/D/X4cwN1cgNnAuvdDBsXdnzChji8V/Kag3VQcxD6VDP0wKb3kvwKDbF1EEmGiY6UxkP2CoVJ79oos5EcASLw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344118; c=relaxed/simple;
	bh=cVL3i5hg43Zt/6DcV+JmxjOZ6jW2itrBDegwH9FGj+o=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WhruyDjXg9zI1uaPikgt3zjQZWbKMItdzaHwGYcsZotaJfJ4SqFdga6+mIWxb+gvFEJnVKHOPfyG1tRHPyCSmivUtjPyV4jq1P8UKTrZt98CcplwQyhucRAPg16t8d9tpE3VU1YhFt/wcs1/d/kxjXTkQs372SdDbruSnTPzqGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=m9p31f02; arc=fail smtp.client-ip=40.93.195.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="m9p31f02"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=baBnnpGuG29wlbeGIBHOWdwFWiiSFZo1SKe3UISADdUgvuzECgBFq9FGZRbmwgAKcLb42pJheOzvezJ2hwY1eE7WTgm0CSBfEvCaqgVxwtQgbPBludRIrI/xU2RUBT4KqdTtcsN4aJCaGYNQ6wKFuEhhsOwtp/TTNCcTDEHlyV3tJ/WiWqj6xgbd9AaFWkMltcQ2M0Mayeg1MdkPPKtWmIovksv10GRqIQI8k6YkPm0ADI92kf3GDkLUlKVaAS6M2mDXTsSNMHs0aEQlPmgVACT7XpVQvnfvSEBQ1+sOYlz19m6BWiIvdygALRYWEylwXyu9rSAtfPJpaO6SxcfLCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dScPhL2C3EI17mIxj6F3hmaTM0PSeokm7uNkQhUm6qg=;
 b=NKc4OPfWQ1DJOmN24TG64pGmuE2KLUV3HCEXX4/CG7VDgvbAEYxssPznz6FXoheVOdNF07JObKEO+nZZV0zR8ZJ0z7J9cVXH03dPfEjqclXFWf0mWS5nuOzA4LSSJ/4OUGZMYmw3VVbErt0SyYKAuBhm9NZjFHtYBYgzCFmq37zt8+PTgheXDDHZKZkDKDhkXWoy0ZP5ZvQGbTtzV40FbdDs0TUHbS9TyU9eI+FX1GW0mGe3O/OIMp3E6IYYhF/vmuVB1tdtBBNjrMuDnXMZl4XMHkZxDkfM8WrM7tGiAcGTVOEx2Lz2wdZbATL4mkoOW6KYl0KllsJcM63nhr7IUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dScPhL2C3EI17mIxj6F3hmaTM0PSeokm7uNkQhUm6qg=;
 b=m9p31f02Xbmves6ZwAwF7qIBt3noqxvEeN9aKgjhivlCs/UyXEXNqwrV9+LZee6MNhD/8TEyRKT1mx7jK8ZtdSbm/aFBeqkDs9dMG4QWwTOgEBdtx8L0UoktJkkoES/cU4cHDOVA4D99GZxTmuKlp7G/+vKpCjbdr8HP0AjwYGA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by CY5PR12MB6624.namprd12.prod.outlook.com (2603:10b6:930:40::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 13:48:30 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 13:48:30 +0000
Message-ID: <e44a41aa-b038-4889-ab11-2600f96ce169@amd.com>
Date: Fri, 25 Sep 2026 15:48:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] microblaze: Enable xilinx dmas and axi emac drivers
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com
References: <6d41613ed4ccfdc38ec47070b79a5893e3abc2a6.1789381354.git.michal.simek@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <6d41613ed4ccfdc38ec47070b79a5893e3abc2a6.1789381354.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::17) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|CY5PR12MB6624:EE_
X-MS-Office365-Filtering-Correlation-Id: e6d88b73-7749-452c-fd3a-08df1b0baee4
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CiFg7aphJMOKprApe58P71cg9Rw4sZRcw82JsMJH5dldmPgY/agBepM45q3PW0vMO/T4u6lKpZyIGk6c0lHYj9ge78pmGyIM99G2fnfbYQKkHXAYD2Kz+ZtP7bBLhvsbWujv0jwakiiRG7JnJD5X3MVGaas7ijHIifZesYlkqDN1wBoSg4wCgzfOkFO7k6URGTr69Foe3/MyrvjSmDYK1ufCS8jL51kVSb/Db1GYxcK+zw9b4vPTmJsjcG06niX0CFqETB8TsWJBdJgSW2lg/WchyRPsvuuU3KUNFfDOuSurSBBHq8FBkTyUsM5+4dcYTYVd901W6uKRQlbIammZQEQMYRvzWW0i7513KazMySPrYGZ8yXwnapAeRQVpg7dRHfJwiUnV0DQ9BTTpc2oLMgcdSY8jwGCM0bd12zA8UCOwXOvNuSo3CTQzxxZZMy04Qn12gaTqo4Uippby4hTQmzws6+2BiRpASqhenFI0DDHtIfP/R3dhX9rkJXvqQ3d6M64K+LdSMQKfsCNL3JGsDaepekCS80hfMfGnc6dJSTECWZqkVU29v21yqSANaeze7y+aJdVCtHksk76RoYnSXv+oQyfpEy6bEI+DZ7I/E7VJu8wxAKSdrcB1zLfCofCgfQuySp0fYzXioY7jtA/VUUFBBsbk+cIkfcZiONcyvFs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1JQM3hubkVnZDN5RGpkcXNZdXJzRDZDMFkzMmtCUGN2OUxpQUFtZVJtYTA5?=
 =?utf-8?B?YXJLbHZ2cTcrcnhyMFdjR3lFck5UL3p1L1dDb0p0Z0x0dmkrR0duY28vMGJC?=
 =?utf-8?B?aEtFTS9HcTcrM1ZVUmtLcWVxTE9YSmNJbUE3NlFIZDdWTi95TkFXUlpWQkEr?=
 =?utf-8?B?RWpRTW9mRlhhbjVKRVRkMzBJYmk1Ky9LS0lMRUxubEl1Nng3djR6UUE2RElP?=
 =?utf-8?B?eWxsWHVIblJBVmcvVmY3bmVwUWZmMmpWaUx0UlFHS3VIU2Z2QzZVMXh1RjBw?=
 =?utf-8?B?a1A5QSs0YnhFTVEyL1ZEYkpRUjVYemdDNFg3TDZROTBETmwxRUNzRVlWMlUx?=
 =?utf-8?B?MFBnU2F1SWdHK3ZGc2hFWkhBbTVBUTc5NDR6a01VNTBQVVUwWHRTZ3RjTmFh?=
 =?utf-8?B?UTZnenZyaDJxdFVNYjIrYTk3YmdWT01vd3V6SjgxbE9SSDlacFpVdGR1WGc0?=
 =?utf-8?B?NGNMUXBnWDBucnBHS2haTEdNOWwzZEJ2MHA0dDAvUWlZWGhSL2dxVktQOUgy?=
 =?utf-8?B?c1Jzd1NXbWFuS1ErdFBpakVOQTFUdWxzMTIxK2FkdmY5amhqZUlETngwMC85?=
 =?utf-8?B?RlZvQndQQUV5UklnbkpDMjJLNXd4YjdBdHhTRjdpYkVBa1RERHZodzdQVzFi?=
 =?utf-8?B?TGtkazl0cjVQZEdtTnNUSzZmWjUrWkQ4YXc1UDBCZ0lnRUJndjMzaUd3dHA3?=
 =?utf-8?B?dkRucnRuT1IvelZaaC9vd3VXdVVpZWdudzFwdkpSaENpQWVGc0Y3S0dBL1Qw?=
 =?utf-8?B?NC9uYlNwZ2FmVzNVbmJHbEppS3cvZXpTRHF2QTJkR3orWTgxNmx4WFUvbzZr?=
 =?utf-8?B?Q1c0VlQwaU5wYzJqRmZPUmo5OGVmVmNXbUYxUk9tcS9jbGNFd1E1WTArTTZ6?=
 =?utf-8?B?R1RjOG4yaXBTYWtUMVkwNHVnb2hXdUQ5cjRsbXphcUhmeSszSFp0N1VxMmpz?=
 =?utf-8?B?OW9sZjlPbEwzZXVqRVducEN3WjM4Qm5jVHY5TkRsU2VHQjlnZ3ZtWXZGbmo3?=
 =?utf-8?B?em9CZTkzZTRvd1hocGI4L3RIM2taTE1ORFc5OGEyVjF0NmJEdGZaVUlZNjRt?=
 =?utf-8?B?YUV2dmwrM0Q3N3pCVmF3VzY2Y3NUclFBYkoyQ3RmcExHY3RyWHpqOXBGTzdT?=
 =?utf-8?B?Z25NOTR0Q25OdHgvZFpkMC9zS0NqeHY3U0NBeTBtUkdDUHY4cS9BYlkyOWxX?=
 =?utf-8?B?cnpDS0d3UHBZVFZVSS90TnNPV2pNTHc0N0NzV2hKd0lKZGp1VUFYWlBoZXRl?=
 =?utf-8?B?dzdHYXhnMnBPSjlxZTFCUlBDS1pVazNEa1VkMmFPdzExTFRPNHA1eC9ZQmdo?=
 =?utf-8?B?d3dnc0NHalFCQTdzVWZRNllKYjVZTTB3QXdkVGNYL00yb1UwZmRJV0Vpanhs?=
 =?utf-8?B?TWpEcDB4OFdRcy9CM21RbmdmcWNnZlZFTVlURkNnb3h0TUd1V2RLbjZxVWhw?=
 =?utf-8?B?SDFYTmdiNUtNTFM2ZG9SVmhJNWhaSUlyU3ExbmhKUnVpM0Z4UHBUL1RoSHJS?=
 =?utf-8?B?N0YyRTQ4Z2VkL3RFRXpEUXhnb0tBWTBXa1R0RXVETURYUFRvSGQzZ2pBOFRu?=
 =?utf-8?B?Tkx1QzdEOEVDRWRQbEhtcy9FWUlzbkxvaDFNaWpOZDBMVUZvUmhPRUc5dE9w?=
 =?utf-8?B?TlRrZHV3eGdqYlFiN211eWxJcEUvTzM0MmRqZGNpc2VJQVErZjZQZGZaV1J4?=
 =?utf-8?B?M3dVUmY2c1JSaUFvWmxiWThQWE5HMFZMckxDejFGKzdLOTNkNk8xb2JjTU1u?=
 =?utf-8?B?QytQWGFnN0YwRUMyczY2S1VOQlNpbldqRGRFT2lRQUU2Tmg5ckI1cm8vL3p6?=
 =?utf-8?B?Wjl1TE1CeHV6aGJkSTg1ZDlaNENmajZtVk9haFZQWVZzVHo1SnNNSTFWQW42?=
 =?utf-8?B?YTQ3TUYzcUdmZzU3cmk3c2FDekx6dWRmV0hSK01uWUNDbG1RMVN4QnlZWG55?=
 =?utf-8?B?Q3hnVGRFV0tKajRiNURFWWNHZ0xZQ0ljcFN6QlV2M2Q3MkRyTDRwcDczQlZJ?=
 =?utf-8?B?cFcrZHR0V2dPMU1LS1pOamIxaE1Xdy9Md1NkbG14VUlySW1QbFFickF3dnZX?=
 =?utf-8?B?cE1LVjhBQlpNcjF0UnA2Zkl2T09xd1pzWDhsYlR0N3NnOWZvRTZubmhpanNr?=
 =?utf-8?B?bFNGNGsxM1ZQQ0QrMFVPVE5wL3kxQ1JNRm1HdGQ1UTBHRlBDcStuL0s4WC9H?=
 =?utf-8?B?RVViYTAvcjliSkUwS0tpTFBNaWxkU2pCK2J3NHFaYUkrMDcwNDBRYlR4ek5S?=
 =?utf-8?B?UG4yMG5pdklDNlVham5DVU5Ra1VseUpoS0pacnhOUG5EbjFZa2xyTkRlWC92?=
 =?utf-8?B?ajZBcWJWWVRkbXhVWnJFYlhKL3RkbHNTMXhIMXgwbjBCZGFpYWxWUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d88b73-7749-452c-fd3a-08df1b0baee4
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 13:48:30.3892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbUQ0cJKAPRCKmrG/J1cLy6YP1eKtSXOzv3CnfDYnWoyYXBST3SERaR+T7QVHO3G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6624



On 9/14/26 12:22, Michal Simek wrote:
> Both drivers are used on Microblaze systems for quite a long time that's
> why enable them.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>   arch/microblaze/configs/mmu_defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/microblaze/configs/mmu_defconfig b/arch/microblaze/configs/mmu_defconfig
> index fbbdcb394ca2..7f9b19d0d9db 100644
> --- a/arch/microblaze/configs/mmu_defconfig
> +++ b/arch/microblaze/configs/mmu_defconfig
> @@ -70,6 +70,8 @@ CONFIG_XILINX_WATCHDOG=y
>   CONFIG_FB=y
>   CONFIG_FB_XILINX=y
>   # CONFIG_USB_SUPPORT is not set
> +CONFIG_DMADEVICES=y
> +CONFIG_XILINX_DMA=y
>   CONFIG_UIO=y
>   CONFIG_UIO_PDRV_GENIRQ=y
>   CONFIG_UIO_DMEM_GENIRQ=y
> ---
> base-commit: 98f468b04d5cc3be5382a923f19ab289e0c40fc4
> branch: next
> 

Applied.
M
