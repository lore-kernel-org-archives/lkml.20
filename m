Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011020.outbound.protection.outlook.com [40.93.194.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C62F3515D4;
	Mon, 19 Oct 2026 02:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792378327; cv=fail; b=j+LruobRkHsssD9ck7mIg1ztuj6jHfM3Q1Gb9GacSXBU0aoTJNFkOaUkBasZIgxBsV5rFnQGYMNAXkQ8dmg5X2myhg1VdGZr9eLKt1jxSE0dsZL91gJgjzlbZIiXP961FwEAwjDcsnjRUxg25X9LRMD7Mzbf1tJh44PG3mYo1mU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792378327; c=relaxed/simple;
	bh=OEALOWYLPAh/EFFYyDX7aRMIFHLRyaEn57nUsF6Z4vE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DBIKI5yy2ocB6P8znsmSFpiuoN/khRond6REDPgy44wyR1lFwe09li3x7Ney7IxrGTg4fCbjcYJnvPShm7CIvKeGsTsl8XUaYBSqXMYl/dR9PS6IWaQOmTUfIo+ivysUVK6lK3wXZFacXiWV13Mav2bGmzW1fZT/qjy6c0ISzdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=myKC3OU+; arc=fail smtp.client-ip=40.93.194.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="myKC3OU+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsYnMU2ys3D8pTq2YklJ1oQyA2+LZ+Sv7j2+/6oE1GKKVLQtgIxHiJaN6r7CEhpwmCI/rH/QYlDiBABm5ISGHAIKi9OSf1mqMsWX8covW+mRQaSyi3pX5FaEPWI2WGnPqpyR+nnPq3CXbQ5hXP1ThBWOmDm/B/euyYUgSihV4OAYKr6A7wLFU8915eNoxuBGaWb/i6L86O2gyktihG5kGxTT8kh3VONjtQ+3Q8a5sTPIjYV0oC3ra1ICwdK+H247rHxilNe7u68fu5m0Y/T3BLnFs4xKwb0PMO3eDxBWz5C/uQwSpPtBOemwEam0kaI/I7G4L3LwNfibJosC89Z5zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/o7GT31ZvyAfAJmpHNu0IvQHedlBi3qrgGGJLSEBfQ=;
 b=RVBJA325UKI84HmU1m3Ii3seIRFYAD+cTkKU69QjpJBOT2YvmopHG7OswD87rYxTvCGEWG7kII1ebgIyTY9j3oZRky5ATGVyYZ/FbLpYSk5Lka+n3xajvGUz8bWm7dx8AirxOUYioFK+c6HJAi8jQwLFTN7r44Jr0SosRdBrCPftZlT7WszyBdiFBanVLspSNN0G99Y7y5XN2DkpEBbTGcFcN4h0zy1HzgBXIY7fchqYu+nAZbwm5vO8MuTBEW1yVWCBpPMPvUkw1HL0v6/SGNuSqRSoLCjlAj05Js5lLLEjjabTqxe9TEwbWDDk2yTgNLo5cw0ix/AW2gkSITQnAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/o7GT31ZvyAfAJmpHNu0IvQHedlBi3qrgGGJLSEBfQ=;
 b=myKC3OU+0j7L/aI86VO/8r0IrOZv18hdXDDt6B182sYtIeE46je/ADAHQcCv1ODbXC5xvqyVe6h9UNMK7jLnPOLfmJ6f16esbodx4/QasWSym35gkD0FcyC122ycad/WllrebhqQnce9xpbH8N9IvJ2elJwlRNC1Lw0PF361tJs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 CH3PR12MB7668.namprd12.prod.outlook.com (2603:10b6:610:14d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.23; Mon, 19 Oct 2026 02:52:03 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 02:52:03 +0000
Message-ID: <0021f3b5-397d-4519-8ca4-54292da73a22@amd.com>
Date: Mon, 19 Oct 2026 08:23:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] ASoC: amd: acp: move ignore_internal_dmic gate to
 DMIC enable condition
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yung-chuan.liao@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
 Mario.Limonciello@amd.com, Richard.Gong@amd.com, Poojitha.N@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
References: <20261014101817.1240200-1-Vijendar.Mukunda@amd.com>
 <20261014101817.1240200-7-Vijendar.Mukunda@amd.com>
 <5fcf8148-5775-4043-920e-650b3bedf7c2@linux.dev>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <5fcf8148-5775-4043-920e-650b3bedf7c2@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYP287CA0082.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:25c::6) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|CH3PR12MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: 42bfc4dc-8bff-4780-24ed-08df2d8bf3dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|261009223027099003|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1NSf5TZcjX4tmMemhegwDmLbMBVICA0kUO5k8kq++g4WC8SWsFCh9prHfhrT4/5MOBnqyiY1D9ahk868woHhl7QMaUzWCe4v2HiM7fdx82vj4s8hW3fmf83K/LOSEXmzkUZujQVMt4eL7aKeM7UgQT2SEuLFx8Mo+O47PBp9I6vtq9YA6tcT57VthtD9XP3nK114ARQsKdcoOa+AJjDRJHmZ/ZsPXXbM6O7GMz74sRn3PU9HqnejpiOPEz7+hLGbUbbNNDlcz16ig+buP/GqqrQAtLqGSZq9KSNYBI4kLkDvA/InijK79ZAJA684qciUlKRz/+G6oS2aXlrIIzEADWiaOWr9omnxO+W0dRr5EOA87zOtWx/7pFZT2zHQ970u6wz6yiFoTshevlMPQYncYgHikg6sH9hGUUwIY1d562pwpA9KAhhrx7U08bUAQviC1S/tpUpC8S2SFb6hS7eS3a2kRHIhNL4IrDzKvseN9/rKEHSVgl7J+0n4PVgRXpbE+MT23ehYXx6L4ipCgjwdXKrSayqfDxAWW6D2v9guuMIuotdIxbelO2Wv6rYFz7xe1CCLMo061Pj7FRy/DuTPKmdiHHAZwwAM41qKC7r1YHOoMOWu/+8KEHiuxYExLGJ6vK5GSb9uocfKVGukNLjYPcg9jZ6/nASTzO5ji6i1r74=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(261009223027099003)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWVUWTZFdEx3ZFV3UTdLT1BiTnk0WEVVV3haa2h6TGtoNUViaE04bjZRV0xS?=
 =?utf-8?B?V25XaGEwSXBCMnNBZWRPVkVoeVpKVFNtS3o3Y00zdXk0dWV0aFpTM1dKQjF2?=
 =?utf-8?B?SmZmQjNUVU1lVEVOSDdrMzN1K2F0T0lxK0ZhTHd3OGxhbTFia3JmTVNJTGsy?=
 =?utf-8?B?N2FzN3NRR0ZsY2tqK0JsbjVkWklFVEdCV1FqeWxDUGR1TjVlbnkyTTYySWMy?=
 =?utf-8?B?QjhNYk5qMk9XNlhHOFkzUksyRzg4Smc4c3d4eDRYbW93T0dHYlptZ1FLOGoy?=
 =?utf-8?B?SXAwa1NXSXdPRFVPdW5uSmY5M3hSWVhJVlZYWjNGeDc5dlVCYkNXQjRhdGU3?=
 =?utf-8?B?c25aQyt4TDkva0NuV0F5MzZDbkpYTGNZZUhVOW1uYWorNHc4aGhkWHNqdmw4?=
 =?utf-8?B?R2JZRDZ1eHM4L21oc0F0eXN0Q2JzemtjREJGb0RuUExMck5jNDN5bjZxaDR5?=
 =?utf-8?B?SW1yMjRVckZKZEVueFVzOXArbmlEanNRMFE0UzRZZFZrSlZhUmNPd2xvclpP?=
 =?utf-8?B?dERCQld3a3JwVStGSTI2VEw4c25MNlluaURvTkdpVkd6ZkptOE5sbGlvRVd4?=
 =?utf-8?B?R0J2aFJxK2JBaVIvUjlYcFlGYjFhQThHMTUyQTV1dGhvL1FPSnZLcFdnQTMy?=
 =?utf-8?B?RTVVRXlvd3NEaEVZRzdISkVaeE4zRU1BWVJlQzVZNXc1WEVpK2FOYkRLcU1C?=
 =?utf-8?B?WmJ5T251NlMvRjlON0RIemU0Ykhub0w5QkRQVUt4ZzFuWWlLT3FHSm8xOHlv?=
 =?utf-8?B?RjdKZTcxQXFpdW9EQlFPTERUdGgxVnBVNGhiZGl0RlRMVVpVK3YzRVljRDVN?=
 =?utf-8?B?OW1BSFpoMjRvTEx0T0JIZkhSaVB0UkdBTzhvanhKVlVKM0tVYzBWVkVYVWhh?=
 =?utf-8?B?M3Zab21sbUo5UU44T25ERlZydTNiYXVmVkV6aUxkQ1ZMcCtBa2N0Ukw5aWZQ?=
 =?utf-8?B?ejZmNlM3YktSWjVMMDZYc3JDb3lDWFNJdlh6dWw4TGhCbGVZalJuUS9STFFU?=
 =?utf-8?B?ZHF3VEJWNkdrb0VaOGkyNlgveGU4RWwyS2t0ZEhqc1VyRll3ekExeFRWQ1dD?=
 =?utf-8?B?V3NNeS9NZm9Ndkh2VWNYN1RtNHd6bndiUklUQzBBbDM4a0w5TFgwcyt6eWta?=
 =?utf-8?B?STdJRGtFeHJWaGlSUXBHQmNQUlFERkREazB6dzNETUw4bmtyUXhLWjY1dUFF?=
 =?utf-8?B?cFdyQnA2eHlMZ214aWJHRS9TeS9vd0p4OFZnODl3UlVFU3VZcEhUYTJma2hi?=
 =?utf-8?B?ejNrQ3dSbHFScElSbFB5ZUxidW05RnRBMkx6VnFyMWo1bFZuU3VzME1ueFhz?=
 =?utf-8?B?RElHMzh6UENSWGNJSGQvMGdvRUpXcENvN2QrQUJzcmFsVjI5SGlHNDZPRzFn?=
 =?utf-8?B?L3JNNXJnSzZNeHZZVlJiZWxiWThaWnlEMDgwQUNES05PY0piTW1VcmRBZkhs?=
 =?utf-8?B?aS9kUDN3dFBYK3d4VDJVQ0g2dm5rMlFHdnNoS2VlSVFsTk9FQWhzMjVUK3pU?=
 =?utf-8?B?R3VzZ0RKMHIwQkVaYjh0TjA4VTZ5RTFzVzRKVFkrN2Y1UWJoOHFENEVUM1NS?=
 =?utf-8?B?dHlJZWEwUGs4akpFYzdCKzI4VHFLdWhITHBzQ1BGeTFPWFJPRjJacW54WEI4?=
 =?utf-8?B?Y1pxRytzYjUzZThkaG5yUGJyVlYrL2pYTkRDVHN3cjIvaU91L0lIL0ZJTnli?=
 =?utf-8?B?MXZPNW9TR2pLRkpMYWhhcWNBY1duUW04dUtoS0hTTlc2YnhmemRHdDFoQU9p?=
 =?utf-8?B?enVZSXcxbVg5RGdRRE1McmFqZDAvZFpVWWZBOHVxM3ZHc01UTUNPcUEvSllF?=
 =?utf-8?B?QzU3ZUtGOUNwSTdYOWxJMGhycTFUK0ppWFVsaFVyVDB5VU9BRGhpakVLRzdJ?=
 =?utf-8?B?bGI0QTlKUjJwVGNVbjcxTFVneE9DT1BOUXlaMjFWSmVXUDJEOUE2S1UxYjl0?=
 =?utf-8?B?N2loTHVVYmI4d3pKbDloNms3dDh3cFNHckNURUl3cmozaVo2WnBRaG1WZHlx?=
 =?utf-8?B?dUVDQUo4T0QxbTJqclJyWnhLSGIxZUtvZlV5bU44MkF5Qm1tTG1DMlBEQkhN?=
 =?utf-8?B?VWV4bDNuZE9kWmJHRWdtckloK3FYWWhOOWZkeDNRdUNrcTJ0SjFPU2RCQW1k?=
 =?utf-8?B?S0gzNWFxTTBKaXFEMjJJRUY0Wk1HM1pNdUlIVTdGQURsL1F5VExSc1AzaDhD?=
 =?utf-8?B?Q0hLSXJHekxFcm1pbWxlSjhWeGszN0FZcVgrV21TUTU5dzl0OURYalZHZWV2?=
 =?utf-8?B?Skh3bXVvYzhRUUo4TWhwOStUcnlvYW5FTkUyQ0p2ZW4xV2s1ZFhxN2R4cUNt?=
 =?utf-8?B?ZUFqMm8xd2lQYlY0QUxMQ2QzOWYydDlUbllnYVkxd0tTNnRhMHdpdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42bfc4dc-8bff-4780-24ed-08df2d8bf3dd
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 02:52:03.0024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8BMBMBBdpr4qDjPso6/a/jpGU5lmljCWqpoSJS2qx/pMN6xZ3W4xJtBnnfSNoYHlhcKzNUqBynkgmK5IEVLHaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7668

On 18/10/26 22:29, Pierre-Louis Bossart wrote:
> On 10/14/26 12:16, Vijendar Mukunda wrote:
>> Move the ignore_internal_dmic check from inside the dmic_num > 0 block
>> to the DMIC enable condition itself. This eliminates the dead if/else
>> inside the dmic_num > 0 block - when dmic_num is set,
>> create_dmic_dailinks() is always called. Demote the suppression message
>> from dev_warn to dev_dbg since ignoring the ACP DMIC in favour of a
>> SoundWire DMIC codec is expected behaviour, not a warning condition.
>>
>> No functional change for platforms without a SoundWire DMIC codec.
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>>  sound/soc/amd/acp/acp-sdw-sof-mach.c | 18 +++++++++---------
>>  1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
>> index ac4c9e852f671..1207e35ffb581 100644
>> --- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
>> +++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
>> @@ -351,9 +351,13 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
>>  	sdw_be_num = ret;
>>  
>>  	/* enable dmic */
>> -	if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC || mach_params->dmic_num ||
>> -	    amd_ctx->pdm_sel)
>> +	if ((sof_sdw_quirk & ASOC_SDW_ACP_DMIC || mach_params->dmic_num ||
>> +	     amd_ctx->pdm_sel) && !ctx->ignore_internal_dmic)
>>  		dmic_num = 1;
>> +	else if (ctx->ignore_internal_dmic &&
>> +		 (sof_sdw_quirk & ASOC_SDW_ACP_DMIC ||
>> +		  mach_params->dmic_num || amd_ctx->pdm_sel))
>> +		dev_dbg(dev, "ACP DMIC suppressed by SoundWire DMIC\n");
> this looks weird with the same boolean tested twice, can't this be made
> simpler with
Thanks for catching that. It was overlooked. I'll simplify it as suggested.
>
> if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC || mach_params->dmic_num ||	
> 	amd_ctx->pdm_sel)
> 	if (ctx->ignore_internal_dmic)
> 		dev_dbg(dev, "ACP DMIC suppressed by SoundWire DMIC\n");
> 	else
> 		dmic_num = 1;
>
>>  
>>  	dev_dbg(dev, "sdw %d, dmic %d", sdw_be_num, dmic_num);
>>  
>> @@ -384,13 +388,9 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
>>  
>>  	/* dmic */
>>  	if (dmic_num > 0) {
>> -		if (ctx->ignore_internal_dmic) {
>> -			dev_warn(dev, "Ignoring ACP DMIC\n");
>> -		} else {
>> -			ret = create_dmic_dailinks(card, &dai_links, &be_id, 1);
>> -			if (ret)
>> -				return ret;
>> -		}
>> +		ret = create_dmic_dailinks(card, &dai_links, &be_id, 1);
>> +		if (ret)
>> +			return ret;
>>  	}
>>  
>>  	WARN_ON(codec_conf != card->codec_conf + card->num_configs);

