Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012000.outbound.protection.outlook.com [52.101.53.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666E2419304;
	Thu,  3 Sep 2026 08:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424865; cv=fail; b=Rvj5lT9Mfs3Rb0YxY8l8wIqqGmYRqfnPo8KzmbCsWpGzdzKTwHlC4vsCcTVpLxiIc2ys+VIE8Kj3NHBKRcHnzyGrngE/rcuzWj0Luo2IQ37wIXQYso3ex1nTY62T+KpK/1/+RuIhl2QeV3yk552tVUg3/z7sqFDaq6z+XeFO09A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424865; c=relaxed/simple;
	bh=T1yMYrBivkTkWP8lhD0/Wmr79m2f9NKCAV9YBBw1azQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XwG7TruzmXkLG0U24La0c92P01+fR4sIoJIQmbSiX3YLD47Wh7R4OHBFHRbqS2rJEdhR8L+4jtw1NJY9VKSzAUsc5L8zuGrQ2U3m0yOqpr2LyxFh5Zr3cjB5sDctCj3DwhPcVMrCTvGscB88lqnKNtIVdycaGFqwy+chqqE7pAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QDqVIYVz; arc=fail smtp.client-ip=52.101.53.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QDqVIYVz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fys83cWN7muk1dPgekQks96jm1qh/A9sIEvWfjXZtnATgCmR11rxuXw+0RvfH7PAwl83T3lplLJqwNF5ZplHyisnYOA01riFDi603g0gbWW/5TLCfajrPXErleMv37T4pArPyYOTyLd+tAw/WiROZrWMSW46xi03OLRHj3eFTepRA1tEFQT7cPVzoSgEM9QWSjaELJscK45XfKoRoHDoq2+l8fx0cnHbuT9Q/C//QA6d+QoYshDsNwYlbAgpzeUSQ8WE11TFWZkl0t/oFRAyXp81d5QQkofAwdVnRsuH6J6lQgRepLOyRPSwS8LHsbCWr/UwiCfi50Jnk1JaZfbDgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZPfox3ylqaoH6Qv1Ber3W4gNWRAZND/hAa3P7SN9GM=;
 b=dngvGSiZlxOF3tkKbOhyeU7rsl+qNzR+vFWdytCpcLwE15XipL7Vf0RxPtPoDqMA64YlGFPilbWNty23leixLI/VudZ48PuWQZuZJyx+CaFqqLmx4w5f4moemZ5eh96qOkv4zqsGzR1TQOsH1SaHa4tN/au7wm9xbzK89+a1FvhXWBaND3SmWYrnQt+ZVaQw9H3IYMTY7bh3TXor1pJcel9qtNeh61xnKnHWdeqCtwo72OPl0gUdvtfERc+JkYG3h+ChytRivUgXaXrMP4jGIkmEzu8vaHchJdVv2Gf+S/jDhmkinuKU8p+Co4qJV4a1rAAx81ejqpuX4gzgwaXg6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZPfox3ylqaoH6Qv1Ber3W4gNWRAZND/hAa3P7SN9GM=;
 b=QDqVIYVzQRhLbY89iTRwYCuUSg0DmEqEtVGYEakuEwtlJ3xBaA3GJtRXS1bs9OXGyAnSm4iAXtwJfxpqtD3+akgUsZdQO8OKsunt39NwtPbGlEyyFnOVvZvYAPHhSqMMDLKVaL2wAUE3BJ29UnpW+WA0e5Sat9JqeO2TPZcDBgI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5356.namprd12.prod.outlook.com (2603:10b6:408:105::23)
 by BN7PPF7C0ACC722.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 08:41:00 +0000
Received: from BN9PR12MB5356.namprd12.prod.outlook.com
 ([fe80::8e9c:2f3d:9679:942e]) by BN9PR12MB5356.namprd12.prod.outlook.com
 ([fe80::8e9c:2f3d:9679:942e%5]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 08:41:00 +0000
Message-ID: <bc542e80-e572-452b-81ba-53e57ed3126e@amd.com>
Date: Thu, 3 Sep 2026 14:10:53 +0530
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [BUG] ASoC/AMD ACP70/RT721: ASUS TUF Gaming A14 FA401EA speakers
 silent and headphone jack buzzes on playback
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
 Cristian Timohi <cristiantimohi@gmail.com>, jack.yu@realtek.com,
 flove@realtek.com
Cc: venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org,
 oder_chiou@realtek.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, broonie@kernel.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <CAAAbPi4w+YO=W8vFr63wy6++1WQ2mHUDVfUDKyWR8xcTWKXCKw@mail.gmail.com>
 <1fdd17c6-a0ab-42de-8362-8e1374d42fac@amd.com>
Content-Language: en-US
From: Syed Saba Kareem <syed.sabakareem@amd.com>
In-Reply-To: <1fdd17c6-a0ab-42de-8362-8e1374d42fac@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::8) To BN9PR12MB5356.namprd12.prod.outlook.com
 (2603:10b6:408:105::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5356:EE_|BN7PPF7C0ACC722:EE_
X-MS-Office365-Filtering-Correlation-Id: c04d79c0-3064-40b6-7d56-08df0997147e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|6133799003|22082099003|18002099003|3023799007|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	bW6LI/BECvFdueMJMOaKuKbHB7nK5j8fnXdak68VjPdEI7POkcuWc4uwuXZq3wotwdICl25XT78ipLDHwIdkzIj8ft8l2v1t4RX4N7rsDCrAU15W/+XImOUR06g8mf1oNGmEsIqoNqhFb/uJmJJb7tsPlNNTHXoNX6dU1HBuZ09JRx7XkEWUu1FNypeUx9nrWSpIN/Eur1GffsUGpJepFnXZPKgoX/E1u6V1BaZTRchrXy/eyGaRDckSmJ7IoQxSH81h5ZZYbZwj78Lkdbbuougg+EcMd5cLbVQo1HEzvJN9ABXBJab9YLPkKVCBcd5xfin1llpeV5mvkDeWhoYO6MbCDukT/K57Qpja4/2nkqHdLZEKNUqxgMJBFIMX5RYFp6I1OLS26GUAoN7sZ7PNLtqOxriSP96K+zU4/tPjtrRFqQK6SMQeikvqbi4nq29CbnKANuVMNksOZdQviehWeyNkHKVLGVu+ZtfDt2mT5LxFtS7C6MoBTEE3gT36nM29udhrknT1OQMv6AMPijPTwLDaQ/dv5zy0+aXsgkc3ZjrdwOyGV9rkpuO0amqzZrqiMWvvMqPkfDxK8MY3303y0whrQ8hey7p++5fkbdMREh44Mmw77v6TvIeK3QUwN6C52untiOvw/C68qzU7Jjpb7FWLuX9TMlx2S0/jSuPOQD8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2EyQzN3UlljMVoyUUxyRW1VZ1JxT1Vvb3lzSTZ0cmI5KzdrVG5rd3RkR1dz?=
 =?utf-8?B?TEpaU2t5RVo4a0xUSHdPSGlYNmNicS9ZM0ZTMXJ2VUpYZ2F2MmtRR01mb3Vs?=
 =?utf-8?B?MWNSTkxxelorM2pYaWNTK0pZamJkd0xCT1BTdmRqL0JZWnVQV29VSDFSRm9Q?=
 =?utf-8?B?MlJyeDQ0YjJZNHd1T0JvSEpoRmFQbGlXQWswMFhEQ2NrVkQxSkREVVVKUTRS?=
 =?utf-8?B?NjFrakVXcTBLTFgxbm8vUUZneG9FYnJ2cmhuL3lLQUhaeHpvWVVvdlJ6dlBC?=
 =?utf-8?B?N3dVWklNRktvSUhTZEJzeHQwVXB3OEhvNGVhcVA5RWQ2M2YxbHd2ZHFBNjNP?=
 =?utf-8?B?a3V6M2U1em5kaFNoTEtJbGU5N2hKeHFUVFhPeEx1c0RRQ1V1TVkyRk9ybmxs?=
 =?utf-8?B?VGZaZnl0UmltR2IxS0lCNHNqN1IzVzFHc085Mmtqa1J2V1IrcTVtUWdNU2FT?=
 =?utf-8?B?VmYwMlhNSUFXYWtLWHJzNENXTUNGQzM1YmliVnQxREhDQ1BUYTJTWnRyZG9X?=
 =?utf-8?B?QmlMRmdaSnNsbHErLzBnb0RwNktZUGFOcktVQSs5NllrYWhqUWgyUHNGbngy?=
 =?utf-8?B?a08wNTM4MnpPcjQ1eXNMOG40bU51bTErSktIL2p5NHhEOENiMmZXTGhtZUl6?=
 =?utf-8?B?QTJaNERia0FQSlk3bm81MGt0T1c0TzVMVm56eTZkNkVxcHRPL0p6cWNodzV4?=
 =?utf-8?B?NSs3eXlIYUpPTkVxdThpZXh2dWJ6VTBMN2QyNzdXZlIxb0l1YnV3dnQzZ2Jy?=
 =?utf-8?B?OHNKY1hMSXFEU3VzY3R3STFYdGVJQWpjSis1VU5ncUorYzVlK1ZIdWpyREs3?=
 =?utf-8?B?OWVLc0s2OFdRM3haTkExaXFkN01GRkVDTnRYd0lxdFZHSW5mWVUrNUJvcUFY?=
 =?utf-8?B?MUordk5LZTZkTzNVZEI1eXB1WUxrY0NQWVNMbTJieXBWdGx0MDNBWmhKbGdE?=
 =?utf-8?B?SjZNZjhiMmxzUXFBbHYzdXUvTjY5Y3BPUFVHMXV3OFdnTG1ueDBHOFFydkp3?=
 =?utf-8?B?d09ualRxamM1TTgwOXh1YjBRSkRQWk5YRzZyeUpBU1hsQ2V5N1JmK1VzMzZH?=
 =?utf-8?B?UTVPbFJZSG1ZT05HaTc3bnlWOFI2cWlOSVZTcXBkd21CWFRaTUFaUnhXdWNF?=
 =?utf-8?B?Ylc0ZXpOM3UrdG5XZFZOK0ZXWXRWUWl2ZVZNRmVQUldxZCtjLzk5RHU3MnBv?=
 =?utf-8?B?Ukx0RkJCMVNrS0hzZVpESGpLRVlYSzc1S2Qxa1dvSHpPc0lzQlZvTHZ6QXNC?=
 =?utf-8?B?WTZYSUV2KzBmWjViVGdQdUNOd25kZDJpUHMyVTBNVDFkWmppNkhsRGw4QitM?=
 =?utf-8?B?SW9lczgvOXNGOVVxNERTaG9BRVZBM2d6Y3ZUMVJBZVY1c2ZUdzNkcHJtSlVo?=
 =?utf-8?B?dEZ6WkdXd1FLanROUllvMzN2cUhTUHFSSUtMTFdkN0tMQlF0dy9vUTl3Y3dW?=
 =?utf-8?B?OStjMVVhcDZZajlac29uVVFrakhOQzRLeU1mcUIrQWg2U2VNRllyaFJObWdt?=
 =?utf-8?B?Nlg1K2d1Y3k0TmNxaFoyaTNJeHRPaWI4TXMvS0ltOTJ2VDBkN3l2L3N4U21w?=
 =?utf-8?B?eDA2TWZaaWx1TWgvaEIva0F4cVdSRTB6R1IwamgxclppbWt1WTRhOXVTc3d4?=
 =?utf-8?B?aXBTbld1blZZYklPRW5xOUVabnMreFNoZVVDTHcvcXZGM2pPZ1liZzR6K0xl?=
 =?utf-8?B?TXBEM1B2ZGhYZ0l3a3JjdEpRZVZaRHg4bnFpOTNpdWRRZTZCUndLWUY1d2k4?=
 =?utf-8?B?RFFrQjg5bUwrV3VIZE5YSkVxOWNwOTkvRGZJakF0ZWgrRS9hR1dHazA2cU1n?=
 =?utf-8?B?T0tWaGoweCtuVTBMem1nUThHb3d2TFlxa3IraTBBMDMvT2ZoYThCYWkwanRt?=
 =?utf-8?B?MURhUmV1T1JQZWJ3SG5kWG5iWmptRWJ3c1FwM0dTOSsxbnF1ZWlxYWpnMUpF?=
 =?utf-8?B?TGJPcUVzbFh3ckJzSXdTMkowSUEwWFlBL1ptRG4rTkVDbEtnZkR6UEVOdXhB?=
 =?utf-8?B?b3dxajNpWWppSkt4RTFZZ1R5Z2tHblpsZE1PWUo4Z0RXNTZ6MFNPUlk3SS9F?=
 =?utf-8?B?amNoZFdvSUNXTzNxLy84aXlqTndSay9OY0ZxT1Y3WlFnV09hN1lHYkIzRG1u?=
 =?utf-8?B?Zml5V3F2emRNV2R1Y0Q3Vm43WDlMclNGVmxCUURXMDZ5cHZRWVV1TmhxbDFm?=
 =?utf-8?B?bllMNFE2VEc5ZVV6bmtSRU50c2pFVHVtRmNDVnVJTzgzK2trbGFwK29SWVVi?=
 =?utf-8?B?L20rZGpiT2tuN0hXZVh3aFV4U2Y0MGZNbVJ4SFR4TnlybURncVdpNWYvUHJZ?=
 =?utf-8?B?RnVEUkVBOXFxOXg4RERQdzBETTZqaytEdzlhZUY5ckN5c3F4Q3lCdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c04d79c0-3064-40b6-7d56-08df0997147e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 08:40:59.9804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDNZW9nhjtBW/y47tOEl+T/CT0S48H6SeUz4voty0Pe1UtAhUSW2mJn5Irz2FRgA6aEgzvsN0RI3fDaoujYsMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF7C0ACC722


On 9/3/26 11:11, Mukunda,Vijendar wrote:
>
>
> On 9/2/26 22:13, Cristian Timohi wrote:
>> [You don't often get email from cristiantimohi@gmail.com. Learn why 
>> this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> ****
>> Resending as plain text, as the previous message was rejected by the
>> vger.kernel.org mailing list due to an HTML MIME part.
>> Apologies to recipients who received the previous copy directly.
>> ***
>>
>> Hello,
>>
>> I'm reporting an audio issue on an ASUS TUF Gaming A14 FA401EA
>> (Ryzen AI MAX+ 392) using AMD ACP70 SoundWire and a Realtek RT721
>> SDCA codec.
>>
>> I have reproduced the issue on a clean current vanilla 7.3-rc1
>> kernel, so this does not appear to be Fedora-, PipeWire-, or
>> desktop-specific.
>>
>> Current clean test environment
>> ==============================
>>
>> Distribution:
>>      Fedora 45
>>
>> Kernel:
>>      7.3.0-0.rc1.260901.786262be.417.vanilla.fc45.x86_64
>>
>> snd_acp_sdw_legacy_mach quirk:
>>      -1
>>
>> There are no remaining custom snd_acp_sdw_legacy_mach/modprobe
>> overrides in the current reproduction environment.
>>
>> Hardware
>> ========
>>
>> Laptop:
>>      ASUS TUF Gaming A14 FA401EA
>>
>> DMI product:
>>      TUF Gaming A14 FA401EA
>>
>> DMI board:
>>      FA401EA
>>
>> BIOS:
>>      FA401EA.304
>>
>> CPU/APU:
>>      AMD Ryzen AI MAX+ 392
>>
>> Audio:
>>      AMD ACP70 SoundWire
>>      Realtek RT721 SDCA
>>
>> The SoundWire bus exposes one peripheral:
>>
>>      sdw:0:1:025d:0721:01: Attached
>>
>> I do not see TAS2783 devices enumerated on this unit.
>>
>> Known-good cases
>> ================
>>
>> The laptop's built-in speakers worked correctly under the
>> factory-installed Windows 11.
>>
>> USB audio also works correctly under Linux. I tested Corsair
>> Virtuoso USB headphones and normal audio playback works.
>>
>> Therefore the issue appears specific to the internal
>> AMD ACP70 -> SoundWire -> RT721 audio path.
>>
>> Actual behavior
>> ===============
>>
>> Internal speakers:
>>      Completely silent.
>>
>> 3.5 mm headphone jack:
>>      No intelligible audio is produced.
>>      When the analog audio path becomes active, the headphones produce
>>      a continuous buzzing noise. The buzz stops when the playback/path
>>      is deactivated.
>>
>> Opening the desktop sound control panel can also trigger the buzzing
>> while the analog audio path is active.
>>
>> ALSA playback devices
>> =====================
>>
>> The amd-soundwire card exposes:
>>
>>      device 0:
>>      SDW1-PIN0-PLAYBACK-SimpleJack rt721-sdca-aif1-0
>>
>>      device 2:
>>      SDW1-PIN1-PLAYBACK-SmartAmp rt721-sdca-aif2-2
>>
>> Direct ALSA reproduction
>> ========================
>>
>> Internal speakers:
>>
>>      speaker-test -D hw:CARD=amdsoundwire,DEV=2 \
>>          -c 2 -r 48000 -F S16_LE -t wav
>>
>> The PCM stream starts normally without an ALSA error, but there is
>> no physical speaker output.
>>
>> Analog headphones:
>>
>>      aplay -D plughw:CARD=amdsoundwire,DEV=0 \
>>          /usr/share/sounds/alsa/Front_Left.wav
>>
>> No speech is heard. The headphone output only buzzes while the
>> audio path is active.
>>
>> Zero-PCM test
>> =============
>>
>> I also sent only zero-valued PCM samples:
>>
>>      timeout 10s bash -c '
>>      dd if=/dev/zero bs=192000 2>/dev/null |
>>      aplay -D hw:CARD=amdsoundwire,DEV=0 \
>>            -t raw -f S16_LE -r 48000 -c 2
>>      '
>>
>> The headphone jack still buzzes while the zero-PCM stream is active.
>>
>> Therefore the buzz does not appear to represent corrupted application
>> audio; merely activating playback is sufficient to produce it.
>>
>> Mixer / UCM
>> ===========
>>
>> Speaker:
>>
>>      Speaker Switch = on
>>      rt721 FU06 Playback Volume = 87,87
>>
>> Headphones:
>>
>>      Headphone Switch = on
>>      rt721 FU05 Playback Volume = 87,87
>>
>> I also explicitly enabled the corresponding Speaker and Headphones
>> UCM devices. This did not change the result.
>>
>> ASoC DAPM during speaker playback
>> =================================
>>
>> I inspected debugfs while speaker-test on the SmartAmp PCM was
>> actively running.
>>
>> All relevant widgets were ON:
>>
>>      Speaker: On
>>      rt721 DP3 Speaker Playback: On
>>          stream DP3 Speaker Playback active
>>      rt721 DP3RX: On
>>      rt721 FU 21: On
>>      rt721 FU 23: On
>>      rt721 PDE 41: On
>>      rt721 SPK: On
>>
>> The DAPM graph therefore appears to activate the entire expected
>> speaker path:
>>
>>      DP3 Speaker Playback
>>        -> DP3RX
>>        -> FU 21 / FU 23
>>        -> SPK
>>        -> Speaker
>>
>> but the physical speakers remain silent.
>>
>> Kernel messages
>> ===============
>>
>> RT721 attaches successfully.
>>
>> I see:
>>
>>      rt721-sdca sdw:0:1:025d:0721:01:
>>      Driver needs fixing: Unsorted reg_defaults, sorting the copy
>>
>> On an earlier 7.2.x boot I also observed:
>>
>>      soundwire sdw:0:1:025d:0721:01:
>>      PARITY error detected before INT mask is enabled
>>
>> I did not observe additional SoundWire/RT721 errors when starting
>> or stopping playback.
>>
>> Kernels tested
>> ==============
>>
>> The same issue was reproduced on:
>>
>>      Fedora 44:
>>      7.2.2-300.fc44.x86_64
>>
>>      Fedora 45:
>>      7.2.2-300.fc45.x86_64
>>
>>      Vanilla mainline:
>>      7.3.0-0.rc1.260901.786262be.417.vanilla.fc45.x86_64
>>
>>      CachyOS kernel:
>>      7.2.2-cachyos1.fc45.x86_64
>>
>> The current reproduction is on the clean vanilla 7.3-rc1 kernel.
>>
>> Previous experiments
>> ====================
>>
>> Before testing clean mainline, I also built a Fedora 7.2.2 kernel
>> locally and experimentally changed the RT721 speaker endpoint in:
>>
>>      sound/soc/amd/acp/amd-acp70-acpi-match.c
>>
>> from:
>>
>>      .aggregated = 0
>>      .group_id = 0
>>
>> to:
>>
>>      .aggregated = 1
>>      .group_id = 1
>>
>> This did not change the behavior.
>>
>> I also tested that custom kernel with:
>>
>>      options snd_acp_sdw_legacy_mach quirk=32768
>>
>> The kernel reported:
>>
>>      amd_sdw amd_sdw: Overriding quirk 0x1 => 0x8000
>>
>> but there was still no speaker output.
>>
>> Those experimental overrides have been removed. The current vanilla
>> 7.3-rc1 reproduction uses quirk=-1 and no custom modprobe options.
>>
>> Question
>> ========
>>
>> Could this FA401EA variant require a different RT721-only topology,
>> ACP70 configuration, SoundWire setup, or codec initialization quirk?
>>
>> The fact that all-zero PCM causes the analog headphone output to buzz
>> while the stream is active may be particularly relevant.
>>
>> I'm happy to test patches or provide register/debug output.
>>
>> I can also provide full alsa-info, kernel journal, lspci output,
>> SoundWire sysfs state, mixer state, and DAPM debugfs output.
>
> Could you please log a Bugzilla ticket adding ACPI dump, dmi information
> and along with alsa info output?
++RTK Team

Similar kind of issue reported in another mail thread, realtek is 
working on it.

@jack could you please comment on it.

>>
>> Thank you.
>> Cristian
>
