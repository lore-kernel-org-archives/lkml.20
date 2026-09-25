Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013024.outbound.protection.outlook.com [40.93.196.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B23D345EAC;
	Fri, 25 Sep 2026 13:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343150; cv=fail; b=cwT+cXzS0PgYu2WtkxHXKtYgs5MQUWEZ6VVLDH1246d5dz4IgsApUArzFQR/7gB6s50FEOHcxA9XS0aLq0IPxqSxz7A3mAQgAbz7xraO8t31lhSZsOLTxGGJQQ4uuOmnUqgyVAjBRqOI0Ng1TC4G/aBewCUywLjgq9SzPsdOgcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343150; c=relaxed/simple;
	bh=ARn5iaiOdm3XaKpND8eeCMFG7pJzmQh8SB3Z8nLw0Kw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fYzqY+TB68DNf/XpwdRxS1D/WhCWbxK7lmqGM3BkWtmlkjQzMeCJVNVNQO/976WIBVy6A+sFaWYySe8zIz0vbPcUvQE00mewyowz5gAW4Ikz+VqnibqjjssENfPx2LmzkHoWFU0cRE5u97IRkKkdVjpiN0ve15DcdK+HLMx7a6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=F53ET5QU; arc=fail smtp.client-ip=40.93.196.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="F53ET5QU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=etzZ5weMAkVuhR43MfEepRPXJ1VP2elnn86JK26gGIR3LvzIEjgAFEgN89R+CwSPCis4siybFlSOyoQgs7rkHdZonHLhYLGa4bo94OIJMckXoWtDEGda45HXFY5FBXZNt1VORWkDvM2YTbI1ta4vJeCg/2NMcTedYVlcvr3+fKlatqUfGlyMiTMoe1GQsP4nwREd3pvb3QPN5GRsM0zgeslFOoWq4k9XHc8Nu6bwwTJ6H5W7cifNUhWadrh+yJazFI3N7hAwp81TOmMoiiHBK4buRWSkf8pBO/WAE4IjSeANQwqKGOoqPHRiIdSPeqsBdDQa1taiptnE8WJJvipYLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFGKUCSfG+b5FQE4/0fy7mkoNZMg5nSJlN69Y64zIUM=;
 b=pqV7pQZtclMszlQ2yMwCPU/iKmE5rj0IWTtM7uujUNpn2J68WQJJo0dZojad6PQjgh6x3CwLfbonSRBYQoQ5Egj4d9MoufqsA6IMow39D5TUfxFF2ATM28ZRdSARJKhzbcoeT7vZYmLSa+5FWioYoR6+woXIwY8CBFEMwUnPpIQfltZXMRY/MbFq/zkRQTPxmyS9juqVTuKpnCWOJGQeF04YXJTxLuGSeGodCf5f/yWkVPI7zwwU21XI88N7V4l5+4A1HGiPs4EvDtgE5A41Lg0FdBWJnxEs0p3A+e+9LAThzXiX8uKmYAY0uN/NU5GKlYToaNFeE+Ts8bxbOBl0mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFGKUCSfG+b5FQE4/0fy7mkoNZMg5nSJlN69Y64zIUM=;
 b=F53ET5QUwJwnMx7JHsH5X4pOp+Dn5xdnDhr+4bR4W/ZFR2Lb/Y1KGXX7eXP8+S4PCb7WKxbrPNb0tlXQc7uQKiImG6yx2PFbQPStUW7Sh6jKnbOmAM0SICZzAXb6GQm01OlWS3dlRuVKTe7nesdCyX7Uf7CSWWt600jNmXHxdV0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by CYXPR12MB9425.namprd12.prod.outlook.com (2603:10b6:930:dc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 13:32:25 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 13:32:25 +0000
Message-ID: <9f8e5988-ca08-44a6-b047-f5aaa133da41@amd.com>
Date: Fri, 25 Sep 2026 08:32:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: amd: fix building without CONFIG_ACPI
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>
References: <20260925131104.118993-1-arnd@kernel.org>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260925131104.118993-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5PR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:610:1ed::15) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|CYXPR12MB9425:EE_
X-MS-Office365-Filtering-Correlation-Id: e3be4141-c1d0-4e30-90b8-08df1b096fba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|22082099003|10067099003|56012099006|3023799007|11063799006|18002099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	wyI/oo8bGvQfZmlMMYYFjycvqEcwpY/hP750g8qSKSUTLMpRcl+89qIae/cgnryq5tZ/CN8kLaD1Ce2HxcQPvrgprg6rAXfmXHeSUhn5AZgleczX1D20VHA7tt1ZAr3pYJsMI/OPlP8nH1IYm1xneXRqB15AhYMwhG27wCKgY9/wzgByuX7v7/sCiW7q8z97gDOB0stz1jQGv9YliS94D2e8lTc61e15bIC6/poVGps/3LTBbG7bSEGwvY7qrY1d5hWS7CgDlzIIKIWPnjuLBTI+kqqQGWkUmPzDyY9CFUGqU0ZaWJlySDWZCLAWWzPtosu2oAq6rRqPhgNgsAnwn+HvZP1cZh94DWvwSXJB5+XSciTe1DCmSSqf2weVH42hLkraFRMuqI5FnpCPPKIDP1AiELRTkUbW6hi7wumZxtKo8RLI5KOqprg3TqECM3Rtv+QK+E7vy/a29CYnOlsEuxJ9ARaRK6305N8bUjWSIytCKKRuGo8s9FSllpebMcQlpXUs3SOx/5dV8tdp83ejL/SQATz7WtbP82ve9PojOFD9LkhTMcPjwlk/tPQWJmN76Os4sakwONdvyX/eHaCapms6kW1xxveiBGB1s4Qar8w2ZXlZR/OHgiHAmMSYLKBy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(22082099003)(10067099003)(56012099006)(3023799007)(11063799006)(18002099003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OW9wNTVUWGdaaUVWTGxDZHNWMXZFd0ZkMXA4RjdLUk1QTHJ5LzhyT3N4T2du?=
 =?utf-8?B?a05CWHh6M3VKM3pRYmRFVkEvNDVxZy9aZ3FOcWVMeUF5VzQ2T3I3MEUzeTFG?=
 =?utf-8?B?TXRnNEhXdlBmcFR5cERHay9hZmxnN2lmRm04ejVJZlRHZHgyQWc1SGdFZ3Mx?=
 =?utf-8?B?bHRmb0FDR3RuNGJQd3FVUGZwT2RqdS96cmVtcUVHRzUyU0dBMDhyRVU1RlF3?=
 =?utf-8?B?TDZ0QmxFTnNsRHdMNEhZcEpiZ2pUK3htNVlCZmNjb00yZHBXcDdPb2o5QVNu?=
 =?utf-8?B?SDEva0VNRVFRWjVld1M2Vm9zNjMyaGYwMFM1UnZHbFVCdU4zTkQ2MFp2ZlIz?=
 =?utf-8?B?VmVSNU9kNDZHRDRUZFhaQ2FNUzA0ZnplN1IxVWk2dk1YcHdNMnQ3ZmxOQU1o?=
 =?utf-8?B?Qkx0WGg1NVpXeVM5dGVld2RSZ2NucTdFQmwwVDd0bGFGZWVtWHE3UlZOQ2RJ?=
 =?utf-8?B?VVQ1enE0STNwMjVvdTdOMmZNWHVzNU9EU0xublpVWEkxOE5yaWt3T05PZ3hp?=
 =?utf-8?B?UXI1WWFyNFV6a0R5d0c1WW5YbGYvSHhMSE5lakU3N0o1Q2dGcmtMcWFTK2Ji?=
 =?utf-8?B?ZE1EZFlzbERXc0NSR1htQm5CVktGVnM0QStJQkticFArS29LUVJDc3MyYW0w?=
 =?utf-8?B?ZWdDMGcxVk1MRENFWU5xUnFBaEFPVHVnblNOcmY0NnVvb0J6Sk9TY3UvZFBm?=
 =?utf-8?B?U0hnVnk5NWZ2R1I5YTUvTWlmdHJ0YU1HVkh1bGpBS0xQWU1NOWx4WURMd0NB?=
 =?utf-8?B?WUdoSE9Vd09GWmZyeGttYkVrSVlxZmxkNWFDbnJwR2tiVnBkSWltZXM1VGk2?=
 =?utf-8?B?NGF4YzJWMXdzT2w5NmdaMmZaMFBQT3RacHRValhNWGJYbXUrYjhtcU1zcUM0?=
 =?utf-8?B?SHVIbWdVcmYrKytBZ2FZZU9iMFhENmFPWlJKbnVydXJkUkRieTNaaEswdDdH?=
 =?utf-8?B?R0hTTFlXSDRteHdIeXFlRklQR3RXamxtcW1TV0crZ2tHZG1wSytMRWVYVmwy?=
 =?utf-8?B?NEUrc3FaUjdVSm1TMStCZVg2R2Y3MzJkRXBNeDdZckRKWUwyQXVYVTNTc2x1?=
 =?utf-8?B?OUk4L2NTWStXM3lnRVRweUN5aWswWXY2Z3Fia29pSXdiNXhXdjlBUWcvTDZn?=
 =?utf-8?B?aWNHeDhsTnpDYjhHOXFnak8waVUybUc1MWJmVUkrK2cxMThqMUpSM0czZXh6?=
 =?utf-8?B?UllHcFB0cVhWMzhIdmdZS1dDRE1CRU4wRzdWNGxCKzZEUGxYMWhJUWVtUDR4?=
 =?utf-8?B?bHBGcTdQVkFkVENwQzRyMW4rSXdqam5nZnZBSUcyQU1XRkd1WHM4WkJXSVVC?=
 =?utf-8?B?RWpyWDAwcktkN3lUL1lMNndWUERmWk05VEtPcitXcEk3WmR6QWZmQ1ZPMVM1?=
 =?utf-8?B?MHRMVWNyR1ZTbENXZG1KbGJLT2xCdkJ2ZDQzbWh0cEtxdXIzTFZkRDNWSTRR?=
 =?utf-8?B?bTltVnVkSlBhSG1ZTlNDSGZZdGFaQmQ3Q2tCQnd3em9pMGdFYkFFeEFBclhG?=
 =?utf-8?B?dURqWUU3T0FLNGZsck5UWGR4UnJIUUtuSjJHQitpTVZ3a3VXcTN3RGRPTjdX?=
 =?utf-8?B?Tk8ycEFQbFpkeTk3T3gzVVBWcmNuSHI3WW5WTVJZVHkrMWVHL0RkSEdtWnVx?=
 =?utf-8?B?ZGNWWTJSY3p1QWpoekVKZmRPVGFOK1BYVnpxQ3F4eWRoaTlLQ29oSWZ5Tmwv?=
 =?utf-8?B?ekZTamJWZC8zRVgvMzl0MGVKYVA4ZFVZaXI4ZGcwdWthV01oZnFHamNla3R4?=
 =?utf-8?B?b2czaUlOVHpYUGRZQ2E1Q0t4b2paaC8yZXNTVXJ1ajdYSExRWnR0aTFjRm05?=
 =?utf-8?B?bU5kR3g4TllQNEFtU2xWTmFGWjI4T3FpT3lzcVFZaWVpWW5yNXV4dE5JakpT?=
 =?utf-8?B?aG9NazZXWjB2OGhvb05LQWF2eXJ3N2NMT2RnZXVxVDZxZ3I0RDdIVDllUFlt?=
 =?utf-8?B?RU5uNFlaQmtVRFY4eGMvUUc0UE5DR1F2MHo5YTJlQW5vYkM4Z2J4TXhwdHdF?=
 =?utf-8?B?eHlScmVKa28vb3BRZ2QvRURMWEl0cFovQ0VTVnRjQU9OOWxSWlgzWURQNmF6?=
 =?utf-8?B?Qy9lS3AvUnhLR0NzQXVvZHAwQ2JVL0haYlNkZ2lmMFBiNzdLTWdWMmdzcGYz?=
 =?utf-8?B?TWMvS1dLS09XM3VrQmRvYmNwc0RMNEtvWVJvWlRZNmtEdVluVUoxOUwrakZE?=
 =?utf-8?B?ZUNDVUUxN1RoNTRrN05NTHNtQ1l4V3kyTmxIUGVrSUZvdkU1R1gyanVzcHl6?=
 =?utf-8?B?VUg1SXBQb2V4bndsMERoOVhWMUZBaHluM3dqZ0VFWDc3N21vdDRVamFvZUZq?=
 =?utf-8?B?Yzd1VnpReFdyeURLRjBjOUhzQkVxb1d2NHZKS2pCQ0NZSVVobnlJQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3be4141-c1d0-4e30-90b8-08df1b096fba
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 13:32:25.5476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qy/jvBD5+mX9n7ETq03jmWdeGECcB6gD09vNzM4oEUP0p9rcuSw/ZQlM7AQz94EgBXF2fzHRI5bH+iM0/Gi7cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9425



On 9/25/26 08:10, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When ACPI is disabled, this driver runs into a build failure:
> 
> sound/soc/sof/amd/acp.c:1374:13: error: call to undeclared function 'acpi_find_child_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   1374 |                 pdm_dev = acpi_find_child_device(adev, ACP7X_DMIC_ADDR, 0);
> 
> The code block is already guarded by an 'if (adev)' check that
> can only be true if ACPI is enabled, so add another #ifdef
> to match this.
> 
> Fixes: 203ea76c4b0a ("ASoC: SOF: amd: add ACP7.B/7.F PDM controller scan and pdata propagation")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I also tried adding ACPI Kconfig dependencies, but that quickly
> got out of hand since the acp module is selected by a number of
> drivers that then all need the same dependency.
> 
> It may be possible to work around this in the ACPI code by adding
> a stub macro for acpi_find_child_device() that does nothing.

I reproduced the issue as you reported.  The stub approach seems to work 
too.  I've posted that option here for Mark and Rafael to weigh out, 
thanks for the idea.

https://lore.kernel.org/linux-acpi/20260925132031.4073551-1-mario.limonciello@amd.com/

> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   sound/soc/sof/amd/acp.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
> index b059039c9e0d..4b2d7cb244c9 100644
> --- a/sound/soc/sof/amd/acp.c
> +++ b/sound/soc/sof/amd/acp.c
> @@ -1059,6 +1059,7 @@ int amd_sof_acp_resume(struct snd_sof_dev *sdev)
>   }
>   EXPORT_SYMBOL_NS(amd_sof_acp_resume, "SND_SOC_SOF_AMD_COMMON");
>   
> +#ifdef CONFIG_ACPI
>   static void acp_sof_scan_pdm_devices(struct snd_sof_dev *sdev,
>   				     struct acpi_device *pdm_dev)
>   {
> @@ -1083,6 +1084,7 @@ static void acp_sof_scan_pdm_devices(struct snd_sof_dev *sdev,
>   	}
>   	fwnode_handle_put(child);
>   }
> +#endif
>   
>   #if IS_ENABLED(CONFIG_SND_SOC_SOF_AMD_SOUNDWIRE)
>   static int acp_sof_scan_sdw_devices(struct snd_sof_dev *sdev, u64 addr)
> @@ -1299,9 +1301,7 @@ int amd_sof_acp7x_probe(struct snd_sof_dev *sdev)
>   	struct pci_dev *pci = to_pci_dev(sdev->dev);
>   	struct acp_dev_data *adata;
>   	const struct sof_amd_acp_desc *chip;
> -	const union acpi_object *obj;
>   	struct acpi_device *adev;
> -	struct acpi_device *pdm_dev;
>   	unsigned int addr;
>   	unsigned int irqflags;
>   	int ret;
> @@ -1369,7 +1369,11 @@ int amd_sof_acp7x_probe(struct snd_sof_dev *sdev)
>   		adata->is_sdw_dev = true;
>   
>   skip_soundwire:
> +#ifdef CONFIG_ACPI
>   	if (adev) {
> +		struct acpi_device *pdm_dev;
> +		const union acpi_object *obj;
> +
>   		/* DMIC ACPI child address is 2 on ACP7x platforms */
>   		pdm_dev = acpi_find_child_device(adev, ACP7X_DMIC_ADDR, 0);
>   		if (pdm_dev)
> @@ -1379,6 +1383,7 @@ int amd_sof_acp7x_probe(struct snd_sof_dev *sdev)
>   					   ACPI_TYPE_INTEGER, &obj))
>   			adata->acp_sof_signed_firmware_image = obj->integer.value;
>   	}
> +#endif
>   
>   	sdev->dsp_box.offset = 0;
>   	sdev->dsp_box.size = BOX_SIZE_512;

