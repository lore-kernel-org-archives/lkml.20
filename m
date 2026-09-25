Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012044.outbound.protection.outlook.com [52.101.48.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68F94E1C66;
	Fri, 25 Sep 2026 16:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354327; cv=fail; b=VinsSj+cEzSKj+0YaDCJ0RzGfjtqv05mFpVnDS51DqB5T5JwwhNJHdiYlAz+nwsEVr49H8s9nEEwLMINv1wIbXhjRqfLiM6r/K9Y5aWJ19fq6Ja98WsZRQxWYRDijdW+Tw/msUpH+XNiC4HJctN5jOHb8y2/A3r8Xgfy9nblLR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354327; c=relaxed/simple;
	bh=JLMYJCKmYMNypLJRK6NqWlxNtyZV8Jiyue6vdFbwh6A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AwN2+CP7yRQuFgDbZA7xhvs6xWXhyICuRMCmOfSC9OF+TA+arJDCHsFKLTjGMWvG1DNWYJRfC4o/AO5b59cDocl818Rol7ncQYvXwSUPNgtL6Q/HggVx6xB2Tj4BpGBnacrBTzPrs6XHCBxILRyzVrvkmqOIb6dowGn0iqTx12I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uBEa+pXV; arc=fail smtp.client-ip=52.101.48.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uBEa+pXV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0Ql6snzBhc/qCyNnvP+tNqThitG03+5HFNFqczY1n3ifa+8LBdxpfWdRs1n2Zm3bAnfGM8r4pvs8OVPS0DQZ1GsaIMGFCosFUdIDVgp9FMzNqaZUR1Q7l8Uqa/Q7hvbLeNiBotQmrLWfkA7OIKYBUp8DHXz/2coceeqPnB8eF/EB4Ez1HAMjuQzs1MWokfHHBF+JAtArFtbAMiPc5RftfimOoGqG+Kp83TSO7AJnADjcKRiC6211P6lCjUY4iIytLfrRm/tasTR/zSOlrxk+WtiAwrVxfZFAtLBjD/WfSFfcXqsEksUfM4BiH1veLSmOJISEM0GZdSUnKfhv0m0yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMsRuxZETeIWjeaAb/O+MmVcCAPqkoMZcCa6c31F6PA=;
 b=dzEGIlUTyJH63ERVuuECFi8JoNfPHumDu+hF5g1y6Unma8ve1/FqSVo0mhZxM4/DXhtv0AZBngHbGbke2ZfP4bH44PVaji64Z5E37JuPShKaqRrg0aiFRKAlVAKsZMLEo0/qefJZl1GOBZsNl0mU/EPZhPHr2xvBsx2IEdj8QTjg7gLOaQoCqB2VLqGkiYpdwC7s98cfguwalldim0BPmIr9S/JInSWM8oFFzOD4kBjGSxWfUCsIQkOUB9ydNTpZM8IxvcHGFJwILioTMKm7n7JkWihiVEv0Q6mlY9WgCahRtyUaS0fDTdULoor7U4KymUXaOBnPrGtqCuZ267BW0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMsRuxZETeIWjeaAb/O+MmVcCAPqkoMZcCa6c31F6PA=;
 b=uBEa+pXVfoAZBvK/P0ALFZwyk9BwfaoPtvbERXwoBdsmUUoHJsbRz/bQOFErM+RA6hbgsxYDO7Ok4edwmdHpDTOw0DeeIh0+yPl8FtHfXr26SAglMvE7xyCTiFbgfpY1fOHuUvkUJspjlkAeHUQjGhN92jhyYKdsKCgx2F2zwGY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 MW4PR12MB6973.namprd12.prod.outlook.com (2603:10b6:303:20a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 16:38:35 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 16:38:35 +0000
Message-ID: <b76e11c8-4f0c-4ef2-ac42-f6f062a1646e@amd.com>
Date: Fri, 25 Sep 2026 22:07:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: amd: fix building without CONFIG_ACPI
To: Mario Limonciello <mario.limonciello@amd.com>,
 Arnd Bergmann <arnd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>
References: <20260925131104.118993-1-arnd@kernel.org>
 <9f8e5988-ca08-44a6-b047-f5aaa133da41@amd.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <9f8e5988-ca08-44a6-b047-f5aaa133da41@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0136.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::23) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|MW4PR12MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: a589ae2c-e62f-4e3a-b6d3-08df1b2371a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|10067099003|11063799006|5023799004|56012099006|4143699003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	b32MbjGPwVwQ6GwTRIedQPcQGs2rGUB8vZwPk/KkPAtEWL7pxamTKC185Z4rkEA/YOZbLz3zioF+Ixy8U/32Uni6ZzysvE30CZAd1c/y6ph3MA0pd6fVg6mblE3kDIXf3Cg8KRSB70hQlxjUF8nfXFjJ7YVCljSAnYtlDYw5Qd4dzuT1ItjnK5OKNzIRbQcPQgovQ5eWInzrOuciszTzoYsX2ji/qw9HF94c4fln7T1JMjctgYvCISRd4x6cEERVgVCS+MLbwK0XMxhRDDZAFh5nfEWTbWCLsq+FUP5qEJLO0XxXlBYaeylVj4ziqYOhVnr9eF4qz0SdYiDxhrQmLi7LDAOZJfgROAKFsUaY0fMvCEQxkBv7L+o5D2hu2Sq4LzAPwQEpEpqj4jDl1S08Bt4cvr2D7Aq0cjqpxQz9GsZ81FmkUloj3MRaO4+NEmhS4ywW+ou+rmykSQ6GZQm8L70ufYkUUaQh4Gud1990lJpDC3Sj4+Cijl8HN2Zxg4FjO9I3SeGMwUayGYFjmLGU+TlGW73XviHdvZzYNjBQ3Yd9Zx3L06h0l+S8l5Y3DPvG6yKMG3Yf8OS0g1nV6S2RZln58ofHVSdqCOaLCWdsR9JxO5/b2lWiTCTqQGRfW2Ka
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(10067099003)(11063799006)(5023799004)(56012099006)(4143699003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWZBV3M3REgrY1l3Qlh5OHROcW9GQkNvV3Q1d1pKektJUHFoTTUzS2U5YUxI?=
 =?utf-8?B?Y0hjcGNrWm1qYnBPd2QrZUF6SXBFNC96RkIveksxMWNaKzBUanV6OGRsSzZv?=
 =?utf-8?B?S2Zkd2FXcDN3MnljTzZuK2JqWithQmtpTkdDZmNCRFk1dHZMejJFbk0yZHJG?=
 =?utf-8?B?V01vd3FxenNtSFlZcjh2RlBXdjhPM2h4ZmpuS2h1RXc5cWxJbW5RZGdOY3VR?=
 =?utf-8?B?SWJNdWNWQWYvRzNOeVJjSnl2dWRsQ2t6Wkc3MjR2T09Ja2RaUFNCSlMwUEw3?=
 =?utf-8?B?RmhCUksyT3Q3R21qSGxrOHVOaUZxak1nZ2JlemZGQW1zazZWMWR1N0lYTU4w?=
 =?utf-8?B?SU5yeDFDbnhOazFHSFVwaHVnOGc4dnRlRzhJRXNrRC9MZEw3bVd4cllnM2dR?=
 =?utf-8?B?U3hpN3NtTFBPYXZTUmR5N2FYaUNTV0tTTnFSallaMkJSRWpZTGpIK0FpaEpV?=
 =?utf-8?B?K0pxR052M1NRTVF4eFJOTnM3akhmY2ZwcUgyWnVsQWtHTmVvMDYyY1VvRnc2?=
 =?utf-8?B?Y29TdTJDdnllQlRlU2RUOU5HSDNCV0hLVU9MY3RwSHA1Ymc0S2RCMkxRMENL?=
 =?utf-8?B?RjZaWnJ5WE45ZW1WdWdRa0JLbm01S1Bid0dPL0s5c2FKVWdNZ0RGN010SzR1?=
 =?utf-8?B?ek45YXQ2WE96ditjdS9hSURtN0VGc3IwUW5lMDBEdFdwcUdlY1FTdXhTVWgz?=
 =?utf-8?B?QzhLZ2JNcGtXM1hyQ0NKc1BzSzhKWG1LbWVnYWVJbUU3RUI0UGtCWGxHSWlt?=
 =?utf-8?B?N3h4clJRVDAwdG1STXRNbWlQV0pSTGtuT0RkSnJydlFEczBFeHJIT0JXRnl6?=
 =?utf-8?B?MENsaHFSNXJkMHFsNnRpV1JNbGFnZ3cwTXlJRFh6NnoyaDBNa3RYV1VScVp5?=
 =?utf-8?B?K3lPYWwxUnlidThzb2hJMHJnVFkzbUFxbVBDc2FoaXZISGR4ODJPOVBLSjNa?=
 =?utf-8?B?aFRlRXRqNEE1a0NFUjFEQ00wZWgybjByRVFNVXJDVWQ4ZjVJTUxTSk9PMWFr?=
 =?utf-8?B?M0M0UGtrbzdYZVNXRDVET1NsWVZ2OHdqSzFsOWhjRlRhMVN5QUhHSGdQTnZV?=
 =?utf-8?B?ck5QYWlETnJCcFk2TzVPOGsydFBVaW05dDBzbmhsa281Q2FNbENuMjBENHRo?=
 =?utf-8?B?RFFNcGNmdjVNUUNVZGhPbHJiNVRxVkRnOTFoMVhSRlI4cE8wdHlaRml6NjBU?=
 =?utf-8?B?MGo2YlpUSXpwNS9Tc2JvMG1qWHF6ckRUc05xYmhFS3VxS2lSTHNRb1BieEIx?=
 =?utf-8?B?S0xQSHhYd0U5N1duM0F1Q25UTTlveFJyNFdDTGh5eW5nV0E5SmlPZDdOakps?=
 =?utf-8?B?ZlgwYThLdU40UE1BNSs0YVJZU1ZncFQzSmNRRlpvcSthdWlWSDljVWk0cHRY?=
 =?utf-8?B?Ny9INUw0Y292bWZpeEV1VlQyNVk2NERsNVpmTE1WbVIxczA3UkJnQk5vQ0Ny?=
 =?utf-8?B?NEFFTjhBQlpRZERkWWdmcFhJdURsaTkxeE44WnArUFZxU21meldYU3BISG9r?=
 =?utf-8?B?UzJiTGF2M3g4WmxNOVNUNStpSWxrQy9ZMTdXejd2SXpEbXMyS0U0bHJiZmEx?=
 =?utf-8?B?bzBkRFVwV3d2ampqV3pDaU8yMlNyeE96VWExekliN3BvbDQ2L2kvWlVjNHBM?=
 =?utf-8?B?OWVSR2UyQVN3c1Y4TGtlVjVZdlZiLzBxdVZCR0ZZUUhBcS9ub0R2ZmViS1h1?=
 =?utf-8?B?eVNqa2hqbUFOU3ZkcTFuclY3bS9iMjhtUkJLeVdvckdXTWdUK0J4UnNuc0wy?=
 =?utf-8?B?cDltWkR0MjJTN3p3dmxjVjdhYWo3cmFxdkE0OHhlQS9zTE15Q28zVk9CV01R?=
 =?utf-8?B?bVlxbzduY3ZkWE9kVHJlQjI0bFVDNDF0WmpOZXR6S1M0Z2JEcm5odUZwVHk3?=
 =?utf-8?B?TUF4Q3I1Z01EUUZmcU5zNFI4VWV3NTlveU9YUWZ0OWVwTVprcmcxNE96OW1N?=
 =?utf-8?B?NXM1ZDdLN3o1bm4rOU9iWFBYaDE1QUFYYktNbUZZd2dTY2lPUmVaNnpXZW0y?=
 =?utf-8?B?WVBTMmYzb1lvaHRaVFRocVhzNnRmZUpCWk4vcnVxWTBwdWUrMHJib3ZVY0l6?=
 =?utf-8?B?K0FiMU1VeEhGVExjZmwzcnVaSS8vOEE1cmpoNUtQZUkvTGtzcDJZVjUwV1BG?=
 =?utf-8?B?dWFOTHdJeHJEc0xIWktkMU5RUG9JaE1ZajZsaEI5cTFpRkc3VmZEOGFHMFpJ?=
 =?utf-8?B?bHdHa0k3M2lVbXVFdGkxbjVnWG9Wc3JOTXNmTnZXRGJWVkFFOTVVUVhrWm1P?=
 =?utf-8?B?V2lDNjBrVWc4SmRseUw5bW0wTjQxWkd0ZEpoLzl6WjhNekI4Ym5rNkZHOWM2?=
 =?utf-8?B?MldpUVJFcC9iYjNYYVZSdUZHQ3FPa2xJdC8xb2RBbU56d0xXdlNUUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a589ae2c-e62f-4e3a-b6d3-08df1b2371a4
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 16:38:35.7786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gn5cQgQmvebQ2JnPgw81+NwmUeXYN8J3G/1fyb6ma/Kq0c977Ph8qwFNxeKuK9juy0i+hGpEa2b44c3Mv+oPGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6973



On 9/25/26 19:02, Mario Limonciello wrote:
>
>
> On 9/25/26 08:10, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> When ACPI is disabled, this driver runs into a build failure:
>>
>> sound/soc/sof/amd/acp.c:1374:13: error: call to undeclared function 
>> 'acpi_find_child_device'; ISO C99 and later do not support implicit 
>> function declarations [-Wimplicit-function-declaration]
>>   1374 |                 pdm_dev = acpi_find_child_device(adev, 
>> ACP7X_DMIC_ADDR, 0);
>>
Hi Arnd,

Thanks for catching and fixing this issue.
As the author of the original patch, I didn't receive the
original bug report. Was it sent to a limited recipient set,
or could there have been a mailing list delivery issue?

-
Vijendar

>> The code block is already guarded by an 'if (adev)' check that
>> can only be true if ACPI is enabled, so add another #ifdef
>> to match this.
>>
>> Fixes: 203ea76c4b0a ("ASoC: SOF: amd: add ACP7.B/7.F PDM controller 
>> scan and pdata propagation")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>> I also tried adding ACPI Kconfig dependencies, but that quickly
>> got out of hand since the acp module is selected by a number of
>> drivers that then all need the same dependency.
>>
>> It may be possible to work around this in the ACPI code by adding
>> a stub macro for acpi_find_child_device() that does nothing.
>
> I reproduced the issue as you reported.  The stub approach seems to 
> work too.  I've posted that option here for Mark and Rafael to weigh 
> out, thanks for the idea.
>
> https://lore.kernel.org/linux-acpi/20260925132031.4073551-1-mario.limonciello@amd.com/ 
>
>
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>   sound/soc/sof/amd/acp.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
>> index b059039c9e0d..4b2d7cb244c9 100644
>> --- a/sound/soc/sof/amd/acp.c
>> +++ b/sound/soc/sof/amd/acp.c
>> @@ -1059,6 +1059,7 @@ int amd_sof_acp_resume(struct snd_sof_dev *sdev)
>>   }
>>   EXPORT_SYMBOL_NS(amd_sof_acp_resume, "SND_SOC_SOF_AMD_COMMON");
>>   +#ifdef CONFIG_ACPI
>>   static void acp_sof_scan_pdm_devices(struct snd_sof_dev *sdev,
>>                        struct acpi_device *pdm_dev)
>>   {
>> @@ -1083,6 +1084,7 @@ static void acp_sof_scan_pdm_devices(struct 
>> snd_sof_dev *sdev,
>>       }
>>       fwnode_handle_put(child);
>>   }
>> +#endif
>>     #if IS_ENABLED(CONFIG_SND_SOC_SOF_AMD_SOUNDWIRE)
>>   static int acp_sof_scan_sdw_devices(struct snd_sof_dev *sdev, u64 
>> addr)
>> @@ -1299,9 +1301,7 @@ int amd_sof_acp7x_probe(struct snd_sof_dev *sdev)
>>       struct pci_dev *pci = to_pci_dev(sdev->dev);
>>       struct acp_dev_data *adata;
>>       const struct sof_amd_acp_desc *chip;
>> -    const union acpi_object *obj;
>>       struct acpi_device *adev;
>> -    struct acpi_device *pdm_dev;
>>       unsigned int addr;
>>       unsigned int irqflags;
>>       int ret;
>> @@ -1369,7 +1369,11 @@ int amd_sof_acp7x_probe(struct snd_sof_dev *sdev)
>>           adata->is_sdw_dev = true;
>>     skip_soundwire:
>> +#ifdef CONFIG_ACPI
>>       if (adev) {
>> +        struct acpi_device *pdm_dev;
>> +        const union acpi_object *obj;
>> +
>>           /* DMIC ACPI child address is 2 on ACP7x platforms */
>>           pdm_dev = acpi_find_child_device(adev, ACP7X_DMIC_ADDR, 0);
>>           if (pdm_dev)
>> @@ -1379,6 +1383,7 @@ int amd_sof_acp7x_probe(struct snd_sof_dev *sdev)
>>                          ACPI_TYPE_INTEGER, &obj))
>>               adata->acp_sof_signed_firmware_image = obj->integer.value;
>>       }
>> +#endif
>>         sdev->dsp_box.offset = 0;
>>       sdev->dsp_box.size = BOX_SIZE_512;
>

