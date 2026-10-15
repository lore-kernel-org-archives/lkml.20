Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013023.outbound.protection.outlook.com [40.93.196.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039D831A07F;
	Thu, 15 Oct 2026 11:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065490; cv=fail; b=Nc1Oh/Tle4Q9vb3++dnLgU1+yye7Wijybm4nFAyaOf7O7WqL0Wz/63EObnZW1WPhfk/6op3AUkme10mvi2FWCQFfZXRbmVxmcI17ZUj1bOu+0gbaiNeCASUk6HjFQvrvaWFzPhpvoUE22O+9FLQY5Ir/iB+qfPKue1Yq0o04ET8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065490; c=relaxed/simple;
	bh=oNPf9vHQxdNKu8/GlUqvCGty40/RDGsGIMiU/FarNBA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MGDl5bEUhshDdfR3gDX0MmjTqRgqTSWRJH+oDSDma9rQLACBC8tZOo+p72A57gOi0uxFhuxaq2ULpaiD0c//Iofw+a5KRhDXelZuIq4qYAbhvnVjFF5xeCnOWwRTK8bbUupNBGTi1+XgUSgGy93IuUEeOFleqtzzMaEfFweVfLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zshRyQhj; arc=fail smtp.client-ip=40.93.196.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zshRyQhj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwPcFF9YHDPidGteLlwgzYh/a+wLKsAlGtP3LnNfgTgjNIdEZDJ9OCFwi8DKpb/A3/ls12/YeGmzzb4BsSmUeQJvAsCh+3Q9rEEazgTqYkYMEpGitlLTI+Qp10hrLMIVZXxbL5mySEx2au/k+LLTtMkSh2Yb98caxw+vNR9QLZNw3NlRhNj0xa0sNkbYZkE3S2YEAFAy8ZCPMB91eHEn7l6zwYmDiuxNZeHqRpvEy6S42o4atY8VGcPtQzMXSI7gRnf/AVIua6QM+XJz6uBILt9zHYPc7PFKlcinVEtgNr4/HzkvP+BHKM7sVM6T8JgWj4tFNqjpWv+1ckLQYbHqbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+z1u4hqTvDJQB71vZ4PreEgvuF35BZIXmUW8RR5BuA=;
 b=hhbAdKvqbry+MjuuzOxaRov1ZTSVswOcsHkxogYfLGRUFylyVfhquZ18rU6zX4M4ryGk4TfUtXpcXSIc+q5FGSi4/1w10sHkupL6rISg9mZBOiFf7/mDeicehs5Ss+6Kh+bKGqD+mTVwu9BbHRdzgp9CUln+iLGI1kKQotoUe0M9SHMklPn3o7P83GyE0BMcjq639OkU/z2677wnq7yoa1wlaz7l4YeHYwE5VJJwmlhnkj6lJmwi+Yic/K8G5MjUapXR9ILOhSEO88awEcAcA8DUTLIKAar1vVWexCasWv8E1INSytbtYHfO9ong8kspdueGgp4rcMKNisEA5ldgQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+z1u4hqTvDJQB71vZ4PreEgvuF35BZIXmUW8RR5BuA=;
 b=zshRyQhjJve2Z+g0Paiv/9blYbXv+es1+VpxYEnVAO3iNAs1LfiMkmP8siBuFBL9blYkM5+HjYc9Mcdjlco0rREULAr9fls1zKkHbNliRfJs25PSN1Bp8Uct2ZuB7/YBogU6oqYZIakw3rQRQvVi+cXTfjjPPaWGDrtvzcolGtA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 MW4PR12MB7429.namprd12.prod.outlook.com (2603:10b6:303:21b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.23; Thu, 15 Oct 2026 11:58:03 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 11:58:03 +0000
Message-ID: <247100a4-3dec-4257-abaa-2b311deb842b@amd.com>
Date: Thu, 15 Oct 2026 17:30:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] ASoC: SOF/amd: ACP7.B support and ASP carveout
 firmware loading
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yung-chuan.liao@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
 Mario.Limonciello@amd.com, Richard.Gong@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
References: <20261013154644.3788064-1-Vijendar.Mukunda@amd.com>
 <179191856632.42298.5680316320552393906.b4-ty@b4>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <179191856632.42298.5680316320552393906.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0045.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::11) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|MW4PR12MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f2669cc-674d-471d-6cb2-08df2ab390f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|4143699003|18002099003|22082099003|56012099006|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	mUnOm06HfVcCDCVt1a5HbAmy3qV9qOOppuQqRrc7XfU4Ikbzpzl0wiGmNOn7devY3z4YRcAanaqZP+ipWoK1J1jlMg9Pzl4mB2W7is8KMxDKWgVBJy7UncREfTwjsLDnaYkzrPUMraz0zs1di1PT1oBAUAzo+XRJuugXnNPZ36g4R/Wor0/n8QTHGYdYvKUNVe4S/mZUB9WLFdKava34DpdfPWYlRsqfqCzW8cflish9qiETo264co/8N70fwAO930gHoGPFlSgZyNIS6VC8fgF28VaOA5UR4J/CepqVNqNROwVtbw3ED+3EtDqdMOSlHzwSzHFgACLYPkKWakLgVCnLPbyM8IBGiJGlTuNZWsITZVGJQtsLo6u4Vlk7kLRN84pEdFipEr36bM/aNAWZQCWoFQrYTZOVg5RXaOd1ZzeFumbMgWHctXDDu92o3gg5wFlwZkO5l27hShBsF/wi/GOMAvGBTFdxMuWxnRlQHDsl0LmksFg5YlpFgvgRFpnlxMqAiZHgK4Cxh3P8EQPwFBp/YkYSg4YGs7IdQsSimnTj2d+4TdTSXMUtdQYBxHilQbo9iegb9m9Gg5cK55UTot4P+22LBqcBAH7snsFaJE0MsfRkyMbzxM3OWVsF7fkX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXpmd044ZE10alBEamdrdE9qUnd6TjJkTGJlNm5UbTVaeHk3L0s5NVVWU0dX?=
 =?utf-8?B?NWZrV2QzejJlVGdjRFlYZmNPYXYrV2hjQ25tWmN1RHNPZVVXT01EMnRScDVu?=
 =?utf-8?B?TGhXOTBMSkI2ZEhEUzVKRFBuOVl0TlBRbWp3aThSTm9TQ3BHTVl6aHlMU0lr?=
 =?utf-8?B?WlRBdGo5Yk00emJmRnpNR3YzUDk4Z0dLbFZQWDlXWktnd3dqLy9QSFAvODlG?=
 =?utf-8?B?VHhuUWxBNEF5d25oQk9NbEtWZ1hVQk93OU5pRnRSdDg4N1dza2pyc04xZnJ6?=
 =?utf-8?B?QTl0bG4rRXFDVnJXSmI1bjlncTBTeWhBNmhNRWtDU3lKWU9NSG9vcExrRk9L?=
 =?utf-8?B?RWd4SEV4ZlQzTS9SNGxtYnlSblFhb2RPNXU5R1hWZ0VlZ2MvVVk5WWtVS1B2?=
 =?utf-8?B?SXZGZXF1NVg0dVB4aVk2dmd1TVJHRy9qMzk2R0U4OWtJSnBnVzFNM0kzSGx4?=
 =?utf-8?B?ZGdUVXJzZnJ2bzhQNUJ2YUl4OEVLNlp6VCtlQ0REM1V6NWVsbUlZSk1jSlM3?=
 =?utf-8?B?TmVIKzk5aUtRRUFTRjhxT2J3NmtKLzU2VXMyVEN2UWxKNGR6clZWcExSeGxQ?=
 =?utf-8?B?eTl6aTBGdm1HV0ZqSFN5akpBaEZYbkdFQmpvd1lFMUdDYytYSkgwaEh6UUdR?=
 =?utf-8?B?QjZpcGxFNnErckN5d0R2c3FlK3hDSmFTQ1pyTlRKR2F6K3RxOW03aXNGd3E5?=
 =?utf-8?B?cXFvUm1oVE9rUGVndnFVWGpDKzdJdHNuMmk5N3dTL1BRbG1udjBoS2RCZys1?=
 =?utf-8?B?aUo0blNCVTNaYVdjczJjSGVyR0EvbXhxTzBoL0FpWjQ3T2ZtRG85bjNRdEFR?=
 =?utf-8?B?UGZ5SU5tT0JWMTRmbHZRWnlCVXlUajBFWG95QWNmSHB4MnJCZXNFaWt5Kyta?=
 =?utf-8?B?eVBhKzdDaVdaOVNLc3hkVVRoUG9BSk50UGR3ZW9oaUNodk5abnFwd1hZSmRS?=
 =?utf-8?B?aUY0blduazNLNWllY2ltcXZMczJCMWRPY1NyWEt5WnlyTGxwQVpoL2F3VW5E?=
 =?utf-8?B?a3Q1SjZlMnpqeXYyd01CUDA2MjlSZ0V3RGJYTTVBbEZmazArR3d1N1VBV1c4?=
 =?utf-8?B?SEV2Tkw5U0FnaXpQOE1UaTByMnNMOFRiRWRuU05VZDNzTGllTHhlM05ZZEp4?=
 =?utf-8?B?WWR3RW5PTzV1eVFXTG1yaWsrUkdWOENuOXIxbW04aTZraUFTcEZ1eFRsMWhP?=
 =?utf-8?B?aGFhWmhzcndtOVNJMU8wSmJLMTUvOUJldnpCZ3Rxd0ZEZ09TV0JzaytaalNw?=
 =?utf-8?B?aEY0NzFYRnB3NFhscVJSNk1kSjBGRUtDVWp6TXJ5RG8xR2pyZ1VUVktWRjdo?=
 =?utf-8?B?cE9LTDlyc0VGQkJJRjdRcEpFY25jby9NdFUxTzJFU3hhbXl1Rjcwb0d1bWl1?=
 =?utf-8?B?dFNpMmxqcmlXai95NWNwY2FCdUduOExZTXdVUWxZb0NLQmFpUEczS3VySVZL?=
 =?utf-8?B?RTRWMUJDNVlqOERPNmE5N2dzeGFkOUFlMjRwNVhWSG1VNWJ5MC9udnhQVkcr?=
 =?utf-8?B?eXZhY0MyNVZ1aWZJUy8xM1FRTFFZeHhlQXlnc0ljd0VnMGtjWnFzcFZiREVt?=
 =?utf-8?B?MG1UTXpZcmp6T29hNVZUU1piNzJiU1BvSXcxSFRPaTk3QVhyaTJIWFRSL0ZO?=
 =?utf-8?B?U1RBcWRndU5nOTZURGdnQVQ5bjNia1E5djNraXk4SHpyMVI5VHVVb0NEblds?=
 =?utf-8?B?S3BpWEFoWExybzhsUkdYK0FaWkFqT2RmZExibmx3ZGk4b2o5NXBFQktxT2Zj?=
 =?utf-8?B?QjVJS09senhMTmZjSlQzbW5Rd21JWnJDcFdEVTNzWEcyZ1Fja1daOTdlNDFG?=
 =?utf-8?B?OGJVZzduMkhuZlNSQ2E2MGxRMmU4NnpQYjNIc0tPMUpId3U4cXZDU25ETlVS?=
 =?utf-8?B?cVpqUDRrbmszVVlFWVhwODZpNzRpcUQrK2ZiRmpzOUUyRjdJSWtkL3BOd2Jh?=
 =?utf-8?B?VkxwZmN5NHpHVjZLOGU3anNTcWVLMEljdFc0L3VSLzM5eUozc2xWSzdYamx6?=
 =?utf-8?B?QmszclJjQ21zR0k1R1VGRkMxQVdocnRiRjRVOHdiS0VMYUc4aEVYTytEU09R?=
 =?utf-8?B?cDNUS09hcjllWTZCRVpQc0pUVVBYK3VhTGhyK3FLL1Zzb1NzSGtIMy90Y3h1?=
 =?utf-8?B?Z1dpODhRQ0Ixa3FXV1k2dThiNk10R1J5cHpwVCtEVXpsT1pNN05aMW1idWxr?=
 =?utf-8?B?ZE52NWdOU0JIeng0Y2RTSEJGSmRIVmxoN09XaEtrQWNJakp1czYreHk2aFd6?=
 =?utf-8?B?bEovMUNUaEFaazBSbXE0RlRZKzl1SEZjOWdmNi9adTFHek5BVmdDV0g0RFpV?=
 =?utf-8?B?TW9VWEJYdWRkem9qdm9jQ1cyVXVGM0JEUjlYR3JuU1F2OStmT0h1UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f2669cc-674d-471d-6cb2-08df2ab390f7
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 11:58:03.1015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fY/HDk/MSD4lClSEFeC39GM2IclAlP0bnFt9bv1O8I4IEczpJO6VGsRL//i/4KFwzRwmmu/WHIldDxij2z95g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7429

On 14/10/26 00:39, Mark Brown wrote:
> On Tue, 13 Oct 2026 21:11:32 +0530, Vijendar Mukunda wrote:
>> ASoC: SOF/amd: ACP7.B support and ASP carveout firmware loading
>>
>> This series adds ACP7.B platform support to the AMD SOF driver stack
>> and implements the ASP-authenticated firmware load path required by
>> both ACP7.B and ACP7.F.
>>
>> Patches 1-2 are preparatory renames and restructuring. The existing
>> acp7x machine table and chip descriptor are renamed to acp7f to
>> accurately reflect the hardware they target (ACP7.F). The probe
>> callback is restructured to select the per-revision descriptor via a
>> dedicated static pci_device_id entry rather than encoding it in
>> driver_data of the shared ID table.
>>
>> [...]
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4
>
> Thanks!
>
> [1/9] ASoC: SOF: amd: rename acp7x machine table and descriptor to acp7f
>       https://git.kernel.org/broonie/misc/c/929e433b8cbc
> [2/9] ASoC: SOF: amd: select descriptor per PCI revision in acp7x probe
>       https://git.kernel.org/broonie/misc/c/f84363861e44
> [3/9] ASoC: amd: add I2S machine table for ACP7.B
>       https://git.kernel.org/broonie/misc/c/9246ac5b5c99
> [4/9] ASoC: SOF: amd: add ACP7.B chip descriptor and wire per-revision probe
>       https://git.kernel.org/broonie/misc/c/44f8d28191f1
> [5/9] ASoC: SOF: amd: Propagate PCI subsystem Vendor and Device IDs
>       https://git.kernel.org/broonie/misc/c/b2dc10ee0b51
> [6/9] ASoC: SOF: amd: consolidate local variable declarations
>       https://git.kernel.org/broonie/misc/c/b23e9b1f3b4c
> [7/9] ASoC: amd: acp: add acp-mach-common.h for shared machine driver types
>       https://git.kernel.org/broonie/misc/c/0e4c4081169b
> [8/9] ASoC: SOF: amd: propagate pdm_sel to SDW machine driver via mach->pdata
>       https://git.kernel.org/broonie/misc/c/439c43d9628e
> [9/9] ASoC: SOF: amd: add ASP carveout firmware loading for ACP7.B/7.F
>       https://git.kernel.org/broonie/misc/c/cec3598305a6
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
Hi Mark,

I noticed that the incremental patches sent as replies to the v1 series were
not included in the applied changes.
https://lore.kernel.org/alsa-devel/20261014114446.1476489-1-Vijendar.Mukunda@amd.com/T/#u

Please let me know if you would prefer the incremental patches to be resent?

Thanks,
Vijendar

> Thanks,
> Mark

