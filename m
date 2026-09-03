Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010063.outbound.protection.outlook.com [52.101.56.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C063911CF;
	Thu,  3 Sep 2026 05:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788414129; cv=fail; b=SzI5t3eY9wCyykk7NI91hkrainip2hOWDRUNjIbAuuIPQDMtxH7AA5z5ZwXpkvnLie5NH5XZc/kLumRALV+jzVN3Jo2m4XqjBnrA3cFGb9dMblnHJAm126SB3JyZG5smQF96+6zphCoTlEHm7nqYfimpzf3//M5bJtfl3law9A8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788414129; c=relaxed/simple;
	bh=V8OYKhgFqw+c1tmYDao0G+y+lCqUKwoZ18HfJR8BFz8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VEB+kilHKLh2n3ucdbfdnz/rT6LLu/iYQt5Qlpghsl+EAM9aDyerPBQocDYSLLoEvG+oV//dgHVqG6cwdyOJvk7DbXPUYoC6Dw7Lbz3WBh2ZSuune5iNP79+ncQjFY5qeZeH1N56YgW+wVJ3KfZB7/++8lNZ1YlKYVneA4/LZUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SjAVmyNo; arc=fail smtp.client-ip=52.101.56.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SjAVmyNo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3plT2t3GocH5ip8UxfQIklU11hgyuEz9posoSaWvmDKOd6xLpeHGdrDaxM8i84gyYlsSG2bwfXei+TsB4yh1K9LBtV+TLYph5dE+pAfUmKYHx2bWtjN5jaJI6WsFaCyqu3O4dECL1swfPaoeELsumLAUy0kEX3IWAhFMEIWHh2g/StESDuvJXlQ4aQMMtO5hOH9zqYSkgxG0Z/oJrnx28XD3R3ZHkpPt2YTRHZPlQCbcDUym4rsAo1b4gArdZITLdNMe1mHSTfbOVMzl5VNiDCRARfPKexoGD+g3GvhXmjIGh+qt9i1YbyepZ8FDyTGIBpTdZVbdMCLyyn7Qg1MLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEzZGOLz8G3arvO8hbKNzz6nmhaNeEdyxgySt/Oa3gU=;
 b=WaOQRoBlGK6d4aPc1x9w37WQ/ruAJH0ECbHA6DCdinOG2eRTKfCPuOS8VMa0J7hcf+oK+uGQnJPhqSvByjb8rGzjw9AKQtbPz88MRJJv7R3zz4g9ERcwjWnSuAAmCUlianCFlXbgkPx/W+4SDENWfRVfE4lf1UfJR8NGS75bENrm/SmF45r1qqrU7znnjtXM5nSJPRF2niPknOv5b7xWHidwBobxvcd1TlYm8RUMR93yuyMKRIQ1qh3jCQwPowYH2TZJaFw3WjK6glXpJJc2cg6/CQ44xT+FjHg3UB6GGYqhXgcMYviW7otFRNrSAKXMGpYJe8r2WOb9IZe4jzCYtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEzZGOLz8G3arvO8hbKNzz6nmhaNeEdyxgySt/Oa3gU=;
 b=SjAVmyNohXeAuR7242XlqZApGIna/f/6sLul+gbfW15CTMvyghemSWmJIvSYNtaHib91yp0Shkr7sJo9c3wKTG/ett17DL0uLM40G4erOVahjI8hCeTgA+zd5wk74kUd21LCCZ8NpX8Supc/3NuPYHn732h5SJPsqKYv4CLyfn4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 PH7PR12MB5976.namprd12.prod.outlook.com (2603:10b6:510:1db::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 05:42:02 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 05:42:02 +0000
Message-ID: <1fdd17c6-a0ab-42de-8362-8e1374d42fac@amd.com>
Date: Thu, 3 Sep 2026 11:11:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] ASoC/AMD ACP70/RT721: ASUS TUF Gaming A14 FA401EA speakers
 silent and headphone jack buzzes on playback
To: Cristian Timohi <cristiantimohi@gmail.com>
Cc: venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org,
 oder_chiou@realtek.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, broonie@kernel.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Syed Saba Kareem <syed.sabakareem@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <CAAAbPi4w+YO=W8vFr63wy6++1WQ2mHUDVfUDKyWR8xcTWKXCKw@mail.gmail.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <CAAAbPi4w+YO=W8vFr63wy6++1WQ2mHUDVfUDKyWR8xcTWKXCKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0124.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b2::10) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|PH7PR12MB5976:EE_
X-MS-Office365-Filtering-Correlation-Id: e7eee151-c138-4c4c-8963-08df097e145e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|11063799006|6133799003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	QvY2b+nYztLNqxrPhFEZiWpWKdWsuyrG9qiqJ/GLSrD11HMYmESt3HZJB4yjavbM6YVQOwkPoqFkKol6iOAisr/UqyTE3Uco9Al9bmPoOXnVDuR44rn4RJEw45TdOFTVILaY5e0vKvrqlftgDDoX+/x2dC+EBjmL4D/AcO48TtZfdpk6R1UjOh4z+4xxSQ69Qp3/y57dICVYxj5Eq6FjcKgXHVmuXsUbi5rNF07xgSVCe/sD0mosSTpWC0tVYHjnxsQjvPUVJ6gszj+3flQM7BnosOjVO7oGfq0Yov7hOjOn4v+YhL4eBVBEeDWbjHj7igG6Uo4Xt9fvDGSe7SjGj8+WcqGT/yFpIvY9Y+BGUK5fMjdHwW+CaUHVm+ZqC+4yen5659rRTAE59G7yYtjZJivygocRiteJaE9tMSGXs774z/Y7ezXr+R6zzwD1oRErl6s+T3IkvzbPBL6bJXbTpHF20yBfuMKfa2s89EJH7+rvIbP9x47vYqte0xZdI4A4NAk8GEZft3ArrIpwCM1Ihkh6Gbi+v7YcW/diYFcvVbJo6/y7pKJ/FYhp+tmxO9GknEDFKM3h8alCUuhM4eReoTiOjStXSVAO6+gTMHRsKB6nU2oeHdXJWPv9294SMFg73Jq7Ubz+ehazMjIB86+JIj179iMi5iKw9h/886wxT+g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Kzk2Q1laN0loZUhJUmdvdXA0NEg0dG41WmUzQmJ2Y1JhNE5nYkN5ZUFuVGNE?=
 =?utf-8?B?UFc1VGFNeU4zcnQ4SHJrcWJBSGorampKMm56YW1mU2ZFODlnZ0tPVUt2bldP?=
 =?utf-8?B?MkdiZFFBaEJvdVBYRUVtd2dNbUdYVFVydjEwR3BpblpJd0pnNmVhbjhFaWZt?=
 =?utf-8?B?c2U3NGZ0Q2RIWHJJS3FidG02TXkrL2g5bWlLTGZ6MHQ0bkJldUZGT3B6bEh5?=
 =?utf-8?B?QXdRcjgvYnROaXNKckhGY0RoN1J6N0haMnRXeXBVMWpIbjArbFVTRm0xeS9n?=
 =?utf-8?B?NThnNkRPUnJQYklRdWRwenBkYk1aM2M2Y0JhZEtkcldZL3o3OGRwZTVCYXRT?=
 =?utf-8?B?dXZob0FDVjRvdml4djI1TG5DaEUyOERTMnV3aDRYNTRRVlY2aUtUbmZzUXZn?=
 =?utf-8?B?YTgrbmpWVFhkci85MDc4Q0tGVHBxWmxIekpNNVFlL2loc3p5b0Fma1RrSEFq?=
 =?utf-8?B?RllzZkYxZnRxdWdCNWFGaVU3a1k4dlUyOUxjamtuYjJCUlJJYmV3Z04vQ2Z5?=
 =?utf-8?B?TitjeU9UQ2tUd1lZR2J6clhFTjY1NGw4RDdTMGR2SVF2M204OTdvekhQQXIy?=
 =?utf-8?B?c0pYYktBRFpKT0Zmb0JWMUFYdWdycnZqSmNrcVZWbzhndncvR1lnV1pocmo4?=
 =?utf-8?B?RjRrN3BjWGZmZUNTRC9vWnR3bURPMDMwRUNzUUxsWHJUZmxDYmhLaHlrOU4v?=
 =?utf-8?B?WWh4d0VodjBrclZlaFc2Vm5FbW1nK1ZIOVZXbHlDRUJxREpoQ2hiTG9pcGJq?=
 =?utf-8?B?V3dWbUhaSHJhU3QyTGxRQ1pVeTJIZnhmYzRvTDVGeDRidyt0amRhcUNTL2s2?=
 =?utf-8?B?VEM5SVJtU0NJUVpYYXZLdjhqUVZKRi9yWE1PWkZtVU5CcVNJbWt4a0xZN1JQ?=
 =?utf-8?B?am9rdUliUTFQTEwvZlBOSWV3bWduNWZzd2daR3NoWVZrVGM0TWVHbU5HVExD?=
 =?utf-8?B?Z1ZJYnBwMmEwU1hnTXNBdTFWb256OW5ZT1FEWDVHdFZUSzFRTTdqR0tKZEpF?=
 =?utf-8?B?UU5YdmJSR05aem1jZ3VFTVRKdWtaUWMycEVmcmZvNE5hWDg2Q3Z6YXY0K2ND?=
 =?utf-8?B?VEpRZ2hsKzN1TG5sY0Y2SzJueDlQMEU1Q29TM0tsSU5jT3ZMeWNReXV6OGJD?=
 =?utf-8?B?MFRnUlVkYzJFS0pSTFlRbkU1Nm1vMXdMSzkvTTlsM3k3ajAvNHVpWDZwOWpL?=
 =?utf-8?B?WCtTNDRSMzlkY0FqTWFHd3VsWGxFTlhlTVBjL0o1YllRblBUd3ZERkZmSnNs?=
 =?utf-8?B?RFp6T2J6L1NNdTYyTDcvbXdvTnhSR1B5K21qM3U3NXhSd21aSllIaFRVcEw4?=
 =?utf-8?B?ZjJKaEsvNXJkZTQ5ODRZMFRpdFJFQ2pBdkFEVEpoaGxqL1gzZFc3czdWYmlt?=
 =?utf-8?B?VzZPNkNWYnVTa1hqYmRyeS9uMUtOQnk2bUpxaGdlLzlJSno5QUx5T2ZzRzNN?=
 =?utf-8?B?SmFjZHBuaVNLSDkvbXJEKzcxOFIzZjhIZlJPVFhNeXB3WW5HK1hwSHY5eGNH?=
 =?utf-8?B?Z3dtLzZYZXM3OEhvNTJHZXhjVU9ESG9MQUFQcDQ2aVZwZWFrVkx0OHZwOG43?=
 =?utf-8?B?OUdwc1FQMFVqT2t3L3kvaUNUSVBZMWFmdVVPOFZpSmZ6bEpnZWMwQ0svOG1V?=
 =?utf-8?B?aThvVzRLbEtlaUVKc1ppWXVwOUszblE0L0xrNk9RSCtQSEdMVG0vSHlxUFBk?=
 =?utf-8?B?TjllT0tlWDN4ZmlhRXovbWxadkJxOCt0d3ozUHMrQWtKK3RUQmRsZGxzWkR1?=
 =?utf-8?B?aDB6aVh2eVp4WGVTL21RWlROTFJtZVl6UHFJZFlreHgwQ2JJeHQ3VjN2elB0?=
 =?utf-8?B?QVZUclcrbkZWb3pZdGNNakYxd2dpUVo2T3h5b0owRGZhMVRiZnpwWEhraDAy?=
 =?utf-8?B?OVhvRGkweHk2RElYdUIvVVBnY1dpdDNXSkpRM2hVbjdmajhFUmIvR09seitD?=
 =?utf-8?B?K2lZWCtBNHp6RVExd3pKd3V5ZXZPNHRycTREQzdvcDlnRkt5ZGZKWk5lY2Yx?=
 =?utf-8?B?STZLTmpHZWNPT3FSamNaSlFadW9GbGNWNDV6NVZVKzVWZEdJS2xCRGJSLzJD?=
 =?utf-8?B?VVZrTXNJaWZNYUMzenVjU2I0NUxHQ05HTFJBRXEvejFnbSt3M2pSb0hUVHFY?=
 =?utf-8?B?WWN4eGl1c1pqd0lGQmpQUEI4Ri8rcG9tQUhiZHIyQ1hYSlhBVXgvS0syM1hW?=
 =?utf-8?B?Sjd2VWdPZTVHUENoUTJKcnZubFAxc3ZhdlQyaTgyRHBkek5pQTBjcy9Qa2RR?=
 =?utf-8?B?R2FqNXJhdEYrN3h2VUhKeVI3NWhrdG5Bd1FOVGYzUHExUndaS25YRFlDazRS?=
 =?utf-8?B?c1B0cFBLNnBpT2xKOUI2TlphUWJ4RHpwa2dTMFR2Y0hvLzVubjZEQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7eee151-c138-4c4c-8963-08df097e145e
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 05:42:02.3350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jyF8XT9ZbM/hXFI6Jnq34QjgK9r6wKjeHmk1O7wFwR664Q8s6s3IWDBGgSRZ6BLAfl4j+uAW+gQel/X18ngFCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5976



On 9/2/26 22:13, Cristian Timohi wrote:
> [You don't often get email from cristiantimohi@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> ****
> Resending as plain text, as the previous message was rejected by the
> vger.kernel.org mailing list due to an HTML MIME part.
> Apologies to recipients who received the previous copy directly.
> ***
>
> Hello,
>
> I'm reporting an audio issue on an ASUS TUF Gaming A14 FA401EA
> (Ryzen AI MAX+ 392) using AMD ACP70 SoundWire and a Realtek RT721
> SDCA codec.
>
> I have reproduced the issue on a clean current vanilla 7.3-rc1
> kernel, so this does not appear to be Fedora-, PipeWire-, or
> desktop-specific.
>
> Current clean test environment
> ==============================
>
> Distribution:
>      Fedora 45
>
> Kernel:
>      7.3.0-0.rc1.260901.786262be.417.vanilla.fc45.x86_64
>
> snd_acp_sdw_legacy_mach quirk:
>      -1
>
> There are no remaining custom snd_acp_sdw_legacy_mach/modprobe
> overrides in the current reproduction environment.
>
> Hardware
> ========
>
> Laptop:
>      ASUS TUF Gaming A14 FA401EA
>
> DMI product:
>      TUF Gaming A14 FA401EA
>
> DMI board:
>      FA401EA
>
> BIOS:
>      FA401EA.304
>
> CPU/APU:
>      AMD Ryzen AI MAX+ 392
>
> Audio:
>      AMD ACP70 SoundWire
>      Realtek RT721 SDCA
>
> The SoundWire bus exposes one peripheral:
>
>      sdw:0:1:025d:0721:01: Attached
>
> I do not see TAS2783 devices enumerated on this unit.
>
> Known-good cases
> ================
>
> The laptop's built-in speakers worked correctly under the
> factory-installed Windows 11.
>
> USB audio also works correctly under Linux. I tested Corsair
> Virtuoso USB headphones and normal audio playback works.
>
> Therefore the issue appears specific to the internal
> AMD ACP70 -> SoundWire -> RT721 audio path.
>
> Actual behavior
> ===============
>
> Internal speakers:
>      Completely silent.
>
> 3.5 mm headphone jack:
>      No intelligible audio is produced.
>      When the analog audio path becomes active, the headphones produce
>      a continuous buzzing noise. The buzz stops when the playback/path
>      is deactivated.
>
> Opening the desktop sound control panel can also trigger the buzzing
> while the analog audio path is active.
>
> ALSA playback devices
> =====================
>
> The amd-soundwire card exposes:
>
>      device 0:
>      SDW1-PIN0-PLAYBACK-SimpleJack rt721-sdca-aif1-0
>
>      device 2:
>      SDW1-PIN1-PLAYBACK-SmartAmp rt721-sdca-aif2-2
>
> Direct ALSA reproduction
> ========================
>
> Internal speakers:
>
>      speaker-test -D hw:CARD=amdsoundwire,DEV=2 \
>          -c 2 -r 48000 -F S16_LE -t wav
>
> The PCM stream starts normally without an ALSA error, but there is
> no physical speaker output.
>
> Analog headphones:
>
>      aplay -D plughw:CARD=amdsoundwire,DEV=0 \
>          /usr/share/sounds/alsa/Front_Left.wav
>
> No speech is heard. The headphone output only buzzes while the
> audio path is active.
>
> Zero-PCM test
> =============
>
> I also sent only zero-valued PCM samples:
>
>      timeout 10s bash -c '
>      dd if=/dev/zero bs=192000 2>/dev/null |
>      aplay -D hw:CARD=amdsoundwire,DEV=0 \
>            -t raw -f S16_LE -r 48000 -c 2
>      '
>
> The headphone jack still buzzes while the zero-PCM stream is active.
>
> Therefore the buzz does not appear to represent corrupted application
> audio; merely activating playback is sufficient to produce it.
>
> Mixer / UCM
> ===========
>
> Speaker:
>
>      Speaker Switch = on
>      rt721 FU06 Playback Volume = 87,87
>
> Headphones:
>
>      Headphone Switch = on
>      rt721 FU05 Playback Volume = 87,87
>
> I also explicitly enabled the corresponding Speaker and Headphones
> UCM devices. This did not change the result.
>
> ASoC DAPM during speaker playback
> =================================
>
> I inspected debugfs while speaker-test on the SmartAmp PCM was
> actively running.
>
> All relevant widgets were ON:
>
>      Speaker: On
>      rt721 DP3 Speaker Playback: On
>          stream DP3 Speaker Playback active
>      rt721 DP3RX: On
>      rt721 FU 21: On
>      rt721 FU 23: On
>      rt721 PDE 41: On
>      rt721 SPK: On
>
> The DAPM graph therefore appears to activate the entire expected
> speaker path:
>
>      DP3 Speaker Playback
>        -> DP3RX
>        -> FU 21 / FU 23
>        -> SPK
>        -> Speaker
>
> but the physical speakers remain silent.
>
> Kernel messages
> ===============
>
> RT721 attaches successfully.
>
> I see:
>
>      rt721-sdca sdw:0:1:025d:0721:01:
>      Driver needs fixing: Unsorted reg_defaults, sorting the copy
>
> On an earlier 7.2.x boot I also observed:
>
>      soundwire sdw:0:1:025d:0721:01:
>      PARITY error detected before INT mask is enabled
>
> I did not observe additional SoundWire/RT721 errors when starting
> or stopping playback.
>
> Kernels tested
> ==============
>
> The same issue was reproduced on:
>
>      Fedora 44:
>      7.2.2-300.fc44.x86_64
>
>      Fedora 45:
>      7.2.2-300.fc45.x86_64
>
>      Vanilla mainline:
>      7.3.0-0.rc1.260901.786262be.417.vanilla.fc45.x86_64
>
>      CachyOS kernel:
>      7.2.2-cachyos1.fc45.x86_64
>
> The current reproduction is on the clean vanilla 7.3-rc1 kernel.
>
> Previous experiments
> ====================
>
> Before testing clean mainline, I also built a Fedora 7.2.2 kernel
> locally and experimentally changed the RT721 speaker endpoint in:
>
>      sound/soc/amd/acp/amd-acp70-acpi-match.c
>
> from:
>
>      .aggregated = 0
>      .group_id = 0
>
> to:
>
>      .aggregated = 1
>      .group_id = 1
>
> This did not change the behavior.
>
> I also tested that custom kernel with:
>
>      options snd_acp_sdw_legacy_mach quirk=32768
>
> The kernel reported:
>
>      amd_sdw amd_sdw: Overriding quirk 0x1 => 0x8000
>
> but there was still no speaker output.
>
> Those experimental overrides have been removed. The current vanilla
> 7.3-rc1 reproduction uses quirk=-1 and no custom modprobe options.
>
> Question
> ========
>
> Could this FA401EA variant require a different RT721-only topology,
> ACP70 configuration, SoundWire setup, or codec initialization quirk?
>
> The fact that all-zero PCM causes the analog headphone output to buzz
> while the stream is active may be particularly relevant.
>
> I'm happy to test patches or provide register/debug output.
>
> I can also provide full alsa-info, kernel journal, lspci output,
> SoundWire sysfs state, mixer state, and DAPM debugfs output.

Could you please log a Bugzilla ticket adding ACPI dump, dmi information
and along with alsa info output?
>
> Thank you.
> Cristian

