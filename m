Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazolkn19010017.outbound.protection.outlook.com [52.103.66.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B283243B3EF;
	Sat,  3 Oct 2026 18:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791053109; cv=fail; b=Eh9oVM9LDdaPvAsQCJb95cgzElqcPpLfvqW5v7o2deYl0QXJNgrThLbycUE/OLCj97E3IebsUs5UPkFQbV5zkjOIBJexH1J+Mz53goCsjET6BeWbeqEXAU/XijxZfd6ButOVbc/hYhwEOAy0qfyUjPGPY4viqf3gS+Q9DrGrlgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791053109; c=relaxed/simple;
	bh=GlV2f6Oaa863q+3jZQxQIs8BX1Q45L7y/jeHEJoPiPw=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B0pIsFIdF3kXmvu5l1I7cCYuf0L8z5PAMPKz4yqEwyJFcUtll2M7BnhDHYljPxYP35+LQzhnacGNg8jnW9mgxBumbQ84aFXMHeRbEpkIwliseRckcs83fBTBt5G0JAy7GD8Bo0XPNyCPxOkAFKwTpWuHFLnpS+KXdiN0ELIv4oA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=mSVD0Reg; arc=fail smtp.client-ip=52.103.66.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="mSVD0Reg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKcxPO56lapjsaMVALXlDRp2A3wMnCAzbuhvDpz5bf+CX5zIa2+KmrRQguhXXpkUc8O64MVxUCSqvt7pu3zox7qJleYzzQcjbW07s8cuastWFbD+tOWUtIsqWZpG/G6u3TyI93reKwRE3zYqpMmdNie6JY25LiJFFoIZ05M3CfmmSMRbdYxGsfIm4FG/VFZM3HykvX6TqcEEBrzfzoHwBDEjL6jAL8NdddijCGUZHo1Q14AHOq7g+89y6AftTuQCoNvEgsGX4tnSAXf4Iau/nMZs1BiciV5tFGfBh6TEiVlBXC8kacB9AFSYTG5soC5IGXKWfQwB1ytuDMrg9NwgrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKlWQW5yWq5Um55ujijLtcZBG9F0LDTFYyw7grMxd7I=;
 b=F+Ne0SaID4V6MV6Moja/07dNMN9E93a96fFH6OZvAf7h72o3bLqhfFNzoCYCw4xxZ4VB5W1qErErCpoQ8lELZHJeV6lqLIYITTcbspLev7S2MK2DvXis/OmukArUZ5vLej9vycwtWdFtO4ADjYWrabHfdWWUCmCd/nG1G0qjhBNvBWcsacrFYlY6J6/c98yOIfnEXol4GGmaV2q/qUa8wJ+q1Wi1aiSM4HVVRMXOYalnGAWpBHYcezY+uKE5bV4Qd8ia3sv0SyfIr8KN/bc9Q5LgTdy/6lv115EygjHtOadjdRqyiBKXxf76u1dCZy1/BoXkggWPbBiOyg0nwzBJlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKlWQW5yWq5Um55ujijLtcZBG9F0LDTFYyw7grMxd7I=;
 b=mSVD0RegBxJARBz97aQtlyaYQM/KJgIgg3dNz6Jm6/GRtE69/AAX++XdeG0fdw8suzYdzTsJzSjIm3DCyK4g5l4G1tiPEU7Kj/LFecMbhi6Y0DQOfP8PkZT47NvB1p2BnGTH2v+2b9kJejU3JckY+NaaQ9WMJY9LqgW8ps5IvqFV58jETw7Y6P18k7bgNGr7nOBspTfDWsvRy2bDGIRVuAv9CfYuy7X0+7pycMGn3ENej56fm2JHhGcJhOYTLxbpPRnffiSAorNwoJTdmeYkRkaluU0kiifsIi/N7Kx0sahSpY5f4iLGibwxD/+gh+B5JgSJT0d91f8dr2R4c/Xqzw==
Received: from TYVPR01MB10892.jpnprd01.prod.outlook.com
 (2603:1096:400:29a::13) by TYWPR01MB11909.jpnprd01.prod.outlook.com
 (2603:1096:400:3fc::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 18:45:00 +0000
Received: from TYVPR01MB10892.jpnprd01.prod.outlook.com
 ([fe80::911f:7aa6:717e:cac3]) by TYVPR01MB10892.jpnprd01.prod.outlook.com
 ([fe80::911f:7aa6:717e:cac3%5]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 18:45:00 +0000
Message-ID:
 <TYVPR01MB108923CFD066C9059AB2F6BBC98882@TYVPR01MB10892.jpnprd01.prod.outlook.com>
Date: Sun, 4 Oct 2026 02:44:57 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com, Syed Saba Kareem <syed.sabakareem@amd.com>,
 "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
 "Flove(HsinFu)" <flove@realtek.com>,
 "venkataprasad.potturu@amd.com" <venkataprasad.potturu@amd.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 Oder Chiou <oder_chiou@realtek.com>, "vkoul@kernel.org" <vkoul@kernel.org>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
 "pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Fish690103 <fish690103@realtek.com>, =?UTF-8?B?TWlrZSBMaW4gKOael+abieiDvSk=?=
 <mikelin@realtek.com>
Subject: Re: [BUG] ASoC/AMD ACP70/RT721: ASUS TUF Gaming A14 FA401EA speakers
 silent and headphone jack buzzes on playback
To: Jack Yu <jack.yu@realtek.com>, Cristian Timohi
 <cristiantimohi@gmail.com>, Mark Brown <broonie@kernel.org>
References: <CAAAbPi4w+YO=W8vFr63wy6++1WQ2mHUDVfUDKyWR8xcTWKXCKw@mail.gmail.com>
 <1fdd17c6-a0ab-42de-8362-8e1374d42fac@amd.com>
 <bc542e80-e572-452b-81ba-53e57ed3126e@amd.com>
 <30fed968a6f54a6c81eca4ee23ea4166@realtek.com>
 <CAAAbPi4MekJAyNsCAi2Ww9QHVVrrGkW2cdDTrrpttZYmh7yZHw@mail.gmail.com>
 <3fa3de8f2bf24041ba9c029e0984abfb@realtek.com>
 <TY4PR01MB144329FF6B2B48FED9486F12E98BD2@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <99e1afd842c4466ea562c83bb736fa74@realtek.com>
 <TY4PR01MB14432C55B885DB8231CA07C6298BB2@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <aqg5OYBZ5eYqd-QX@sirena.org.uk>
 <CAAAbPi5fkpV3V1Ju+RYFOHWqNO+KjwoRVXnDgamNL5DVG0rbzA@mail.gmail.com>
 <a61ca5276d914235808711d7935e0f3e@realtek.com>
Content-Language: en-US
From: Shengyu Qu <wiagn233@outlook.com>
In-Reply-To: <a61ca5276d914235808711d7935e0f3e@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY4PR01CA0036.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::6) To TYVPR01MB10892.jpnprd01.prod.outlook.com
 (2603:1096:400:29a::13)
X-Microsoft-Original-Message-ID:
 <c3a7cf47-2dc9-4e36-9d71-4242e73edb3a@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYVPR01MB10892:EE_|TYWPR01MB11909:EE_
X-MS-Office365-Filtering-Correlation-Id: 77e2317b-d2e6-4dc3-a719-08df217e6d65
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|5072599009|4140399003|25010399006|8060799015|6090799003|19110799012|23021999003|15080799012|12121999013|24021099003|41001999006|2607281247196008|440099028|3412199025|26104999009|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3drbzJDdkYzVWFUZVBOUnh4dGlQWkxKelo3NjJpTXJQbmVQd2ZUVkROT3ZN?=
 =?utf-8?B?SjA4SFdFYVNhK0VmZlBUbzBxLzlNQ0hrQ2hmMUpRUHA4ZlJUcUhrOXlLSVpM?=
 =?utf-8?B?R0RzVUtIT09HQ2F3ZkNDZ0ExSWpYalVVdWVldjFnT1k3bzNyTitRVUFXdXhM?=
 =?utf-8?B?WkhCTW5nZDJlV3Q2UXBLU2JEYWpib0x4d0ZWcVdPdFZYbWQwR05UYStVckty?=
 =?utf-8?B?dit4RVRVbUJoWm9tZ2RYejN0eENvTERFblVuU3RtcjJMVFJBMWZXc1k2di80?=
 =?utf-8?B?dFcxSysvWGJoQnlnbCtBV2xZRVYzZlhhcEpVZ1QvcnhWT2tiN0hMZkptcTFB?=
 =?utf-8?B?aDQ2d2tVK0FKRGJycXlsTUcwYVVOVVNpMmRhQWFUbjN2WGRqN3pTeWZ6R0l3?=
 =?utf-8?B?S25tcmMxSTRkczBvakF1dmE1VU1BMXUvQnVsdVhrWFM3Sm0vL0syZUd1dXVv?=
 =?utf-8?B?QTQ5dm1IQ1BGbzBjM2tITmIwSjBOYk5KTVU0TEc3KzFPQllFOGZRb0txVUE1?=
 =?utf-8?B?dWdxQ2dPN0xmSTdSbmkzS1k0aytMNWVvcmtSYVFLZzR2WmcxUzNwNStURWJK?=
 =?utf-8?B?Rm1XWEZPTjkvczRGMDJJNTg4cm0yMHRva1k0T01aYWlZR3RRL3FpVy9mWmtF?=
 =?utf-8?B?ZnUxdUNuT2VHUnlyTUd4aHl2QlNZbExyVmx4VmdWUDJNemZXeWEvaklQNWxH?=
 =?utf-8?B?N0NwVkFieVdrY0xyaUVFOWEwRlVSSjhzQnpVRGhiUmVZMUVYb3pkU3QvUTB3?=
 =?utf-8?B?dERwajVoQVF4VW5tSWgyMWJvWE5QYVkya1c2eEd5OWlwVWxOeUdock12SVVi?=
 =?utf-8?B?MkJwbXdpMGRwazhvUEd3SXhMZ1E3WllwQ0lEQW1QcXp5RkhDYTh5blZaZHhk?=
 =?utf-8?B?M2hKK1UrczdSK1VsT1ZHcUhKZTlXYWJ2bW5PUkF5a2FoR0J6S0xrRDRoSXBK?=
 =?utf-8?B?TzlaU1B4K09SNmxyRUY0WVFCMEhJMWx1aXFKVlFMSTFIZ0FXeDhGNXlEMU56?=
 =?utf-8?B?YUl2UzZDMnZsSzRGaDZIbTBtaG52d3oySEwvc0JuVzdIV040RFRNSTRqT3Jn?=
 =?utf-8?B?ZzNmeHdRSG1TcXNwdTdQcXdKQjZwVjh5QTE0ZlVVVmd1ekYwNjJTenZKbnV3?=
 =?utf-8?B?M2dJOVVmWjltNDBoZGlUbzJiSnQ3K3JWTVl2c2F2a3Q3SVF6WC9kczB2emFX?=
 =?utf-8?B?TklUT2FMc2tacnAxWUhOU1dLRmlTMFB3dnBYZUQvSkVSU2ZaemRpS0p6Tkgy?=
 =?utf-8?B?cVdNZm9McERzOUhCSkwvVlJ2UDhVSFExQU5CUmthbDU1NUJSWG50M09mVlpG?=
 =?utf-8?B?Z0N0RHRoZk1SWFZaQjMxR1ltV2RwYTV6M2dqV0JIbzVXZ3kydVk3NGNUT1ZJ?=
 =?utf-8?B?TXlQUVRiT211dEVEOVNLdVJic0EraXVDb1prcTVhYTJhMGdYOGo4YnR3NDJl?=
 =?utf-8?Q?1ASzdYRh?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEVMZHBhcE44Qm90UDA0WHZCQnNlWFlZWCtBeHRrSDVhTGI4MEtJT0hCcmxF?=
 =?utf-8?B?d3M5eTk1U1lhSVN3WVh6bEV5RnVxZ0xWMlpTZVRSVGNYSEF0WFduakdSdE1Z?=
 =?utf-8?B?NkNxbFJVcUhCVzNvOHdscXNNRnBSZy82azVzRmQybU4xd0VJQkFwaFBRbVpt?=
 =?utf-8?B?aUpmSW8xQ2dUR0MxZXVUc2Q3S2RzM2laVFdBM1pDdHhrUTdYQzdtbHg5dmNC?=
 =?utf-8?B?aXpxWi8xOU04RFdzT1JDSjA3TWxkbzZXMXpQaDRsUFNCNUNaVzNiSjlPV1Ry?=
 =?utf-8?B?QmtPOXFGcE1kZXVTU2hScjhNaFlNN25DMVhaSG9jWU14TkEyRHdRbFhTVWxy?=
 =?utf-8?B?RlRKc3ZTc1N2bG85NnAwV0I4MjBiNUhzRkozVy9UY3NDcHlwT1hPS0FLWHEy?=
 =?utf-8?B?K1JmVmRoTGtyNWVpb3BaS2N3dHRrVGdLNURxdXhySDR0N3RGODdaN1A3OWk0?=
 =?utf-8?B?NGVycUMzbnN0UHNlTUVwUGI5b3RrdWtNK2NJdzZJSEdwY0N0RW9qVysxSmdL?=
 =?utf-8?B?OGxCSHBEaGVmMmhFTWMxbzgvb0d6WmFnSTlkazBZTmYzUG82SVVMdjFsQXpS?=
 =?utf-8?B?YllId1hlQTJvdjZrdHFpU0xxN2tqNmMySDFMTm1ML3BSTG9zNW04UE1meDNl?=
 =?utf-8?B?QVlROWk5eWxGUllUOUFnK0YvVzZhbFBNNDFiYWJGRjlnTHQ5cUczYTlvd21n?=
 =?utf-8?B?WjJyeGp1Wm9NTWlWa0ZSZ00xRGo5KzRUNGhpcFdkUVQ0NExTQmtReUZicFRa?=
 =?utf-8?B?QUQ1NjgydU10ZEd4MU1KUjdIWEpiM0h3UjQyZXBGTWxnUTRpZVUyc200SEJZ?=
 =?utf-8?B?U1l0dWE3UFRkeGQxOSt4VCsyYzFiOVRzbm9pejF2VUpGUGVNSW5QVWthSnI1?=
 =?utf-8?B?UWtLUk1mUE1BRSswdHRDK0NmRUg4L2t2dTZYS1d3L2ZOZEEwUkljdkNXV1No?=
 =?utf-8?B?cFVsWC90ZkVWWE9CSUpRelpOM0taYlppU3A3RlFsejhXOVdUR0cySjVmbzRy?=
 =?utf-8?B?b2FQVXIwSVYvWTZwTkVhdjBUa2lSdXo5ZDdQTzRTekxjTjlRV0dUMmM0TmNa?=
 =?utf-8?B?cjRGSnhhUHFrV0JGUFZtYkFUZ2wzamo4V1dOUWtWYXU4UHF3Zm5STDVjZXQ4?=
 =?utf-8?B?YUR5anRCQ1JxcWhnYWE2NDcyYm1DZTcrUXduRjJHZUd1MTRJc280RHpjWlZj?=
 =?utf-8?B?SnFjVkNuTk9HV1d2emFGam1PRzBxWnRaVG5ZV1dvTTRCYitKb0gyTXRITVhK?=
 =?utf-8?B?ZHFrNzI5dllKa1hWWGhEaE8rVWpUNm54aEhoa0RhWU9vNXRkbTF4VXhMYzA2?=
 =?utf-8?B?b3BDRDZOYkxEWGNHTVF5Rk0vc2s3VUJSeDFsVXpWY2duZUdFOExWa2orV0JH?=
 =?utf-8?B?QmlQY0VPcFZnSUEwYVJjTHRNckN4WmZ2UWZ3VFpHbSswcEQreGVzL0ExUUhn?=
 =?utf-8?B?c1d0SFVnVTI3eVVFZ2NyOTVWL0N1UUtLNjluNmF6dm5QdGI3bkhFOVVxbm9B?=
 =?utf-8?B?aXBpa0lCTnMyZXJhNG9HelF4aForUTVOL0lyTkJaS1V6VGdEZ3ovUmZ4cTZM?=
 =?utf-8?B?dDJ5ZVVNMEw4a2x0YnBXTVJlYjZndm9XZ3FjT2NzTlpBRVFBd0hnY2NaTWda?=
 =?utf-8?B?bVVtb3RoZEY1SUFGblJNMzl1YlNSYTJ5MmsxR1hKckdraU9qWW5KK2d1cWVj?=
 =?utf-8?B?aDdPMFlBS3VzdFVQUm9YT2FzMWRPS0hydkVCc3VqSDllQzM1WnpJMENkV1BW?=
 =?utf-8?B?ejFSblBndUU5eDZvT3E1Y3NMZ3NZQlZxbC9RY3EyTG9jT01lOFQvZ0VOTGlX?=
 =?utf-8?B?Y0FSNDZnYVh1WkoyeWVLZGxoUWVJUVhrNnFjNkNETlRySVo1N2hHeGxnNVRI?=
 =?utf-8?B?VjhNN2NjQUhYNi9ZQTFCM2lDRWkvaTFEYUFZaGVqbEwrZjRPR1VRWWlHUUZU?=
 =?utf-8?Q?m0nFNUMD6q6nEyeEWy0aN/kCROUPB6uJ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e2317b-d2e6-4dc3-a719-08df217e6d65
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB10892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 18:44:59.8550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11909

Hello Jack,

Any updates?

Best regards,
Shengyu

在 2026/9/15 11:44, Jack Yu 写道:
> Hi Cristian,
> 
> Could you check if the attached patch fix the issue?
> Thanks.
> 
> Regards,
> Jack
> 
>> -----Original Message-----
>> From: Cristian Timohi <cristiantimohi@gmail.com>
>> Sent: Tuesday, September 15, 2026 2:52 AM
>> To: Mark Brown <broonie@kernel.org>
>> Cc: Shengyu Qu <wiagn233@outlook.com>; Jack Yu <jack.yu@realtek.com>;
>> Syed Saba Kareem <syed.sabakareem@amd.com>; Mukunda,Vijendar
>> <vijendar.mukunda@amd.com>; Flove(HsinFu) <flove@realtek.com>;
>> venkataprasad.potturu@amd.com; linux-sound@vger.kernel.org; Oder Chiou
>> <oder_chiou@realtek.com>; vkoul@kernel.org;
>> yung-chuan.liao@linux.intel.com; pierre-louis.bossart@linux.dev;
>> lgirdwood@gmail.com; linux-kernel@vger.kernel.org; Dommati, Sunil-kumar
>> <Sunil-kumar.Dommati@amd.com>; Fish690103 <fish690103@realtek.com>;
>> Mike Lin (林曉能) <mikelin@realtek.com>
>> Subject: Re: [BUG] ASoC/AMD ACP70/RT721: ASUS TUF Gaming A14 FA401EA
>> speakers silent and headphone jack buzzes on playback
>>
>>
>> External mail : This email originated from outside the organization. Do not
>> reply, click links, or open attachments unless you recognize the sender and
>> know the content is safe.
>>
>>
>>
>> Hi Mark, Jack, Shengyu, all,
>>
>> I performed the test Jack requested for NID 0x5f / index 0x30 on my affected
>> ASUS TUF Gaming A14 FA401EA.
>>
>> I am including all details below because there were a few important
>> observations during the test.
>>
>> One note before the technical details: I am not a Linux kernel/audio developer,
>> and this level of ASoC/SoundWire/RT721 debugging is beyond my normal area
>> of expertise. I am working through these tests with ChatGPT helping me
>> understand the driver code, build temporary diagnostic modules, and perform
>> the tests carefully.
>>
>> I am trying to keep every experiment minimal, reversible, and verified by
>> readback where possible. I hope the results are still useful for debugging the
>> actual issue.
>>
>> ---
>>
>> ## SYSTEM
>>
>> Laptop:
>> ASUS TUF Gaming A14 FA401EA
>>
>> CPU/platform:
>> Ryzen AI MAX+ 392
>> AMD ACP 7.0
>>
>> Codec:
>> Realtek RT721 SDCA
>>
>> BIOS:
>> FA401EA.304
>>
>> This machine is already running the latest firmware/BIOS currently available
>> for the FA401EA. Therefore, at least on this unit, the issue is reproducible with
>> the latest available ASUS firmware installed.
>>
>> Running kernel:
>> 7.3.0-rc2-fa401ea-rt721+
>>
>> Kernel source tree HEAD:
>> 1a3fdcb408 ASoC: rt721-sdca: Adjust latency control to fix no-sound issue
>>
>> This includes the a20afec40ea1 fix.
>>
>> The following patch was NOT present during this test:
>>
>> ASoC: rt721-sdca: Update preset for all functions
>>
>> Audio card:
>>
>> amd-soundwire
>> ASUSTeKCOMPUTERINC.-TUFGamingA14FA401EA-1.0-FA401EA
>>
>> SmartMic capture PCM:
>>
>> card: amdsoundwire
>> device 4: SDW1-PIN5-CAPTURE-SmartMic
>> DAI: rt721-sdca-aif3-4
>>
>> ---
>>
>> ## DIAGNOSTIC MODULE
>>
>> I built a temporary out-of-tree snd-soc-rt721-sdca module matching the
>> running kernel.
>>
>> No DKMS installation was performed and no permanent module replacement
>> was made.
>>
>> The temporary module initially only did the following:
>>
>> 1. Added MBQ address 0x5f00030 to the readable and volatile register lists.
>>
>> 2. Added rt_sdca_index_read() calls inside:
>>
>>     rt721_sdca_pde11_event()
>>
>>     to read:
>>
>>     NID:   0x5f
>>     index: 0x30
>>
>>     at three points:
>>
>>     * before requesting mic-path PS0
>>     * after requesting mic-path PS0
>>     * before requesting PS3
>>
>> The existing PDE2A power-state request itself was left unchanged.
>>
>> ---
>>
>> ## BASELINE READ-ONLY TEST
>>
>> Before capture I enabled:
>>
>> rt721 FU1E Capture Switch = on,on,on,on
>>
>> Capture command:
>>
>> arecord -D hw:amdsoundwire,4
>> -f S16_LE
>> -r 48000
>> -c 2
>> -d 3
>> /tmp/rt721-mic-test.wav
>>
>> The register values were:
>>
>> RT721TEST mic 5f:30 before PS0: 0xffb7
>> RT721TEST mic 5f:30 after PS0:  0xffb7
>> RT721TEST mic 5f:30 before PS3: 0xffb7
>>
>> Therefore, on my affected FA401EA:
>>
>> 0x5f:0x30 = 0xffb7
>>
>> and requesting PDE2A PS0 does NOT change it.
>>
>> I then analyzed the raw PCM samples.
>>
>> Capture:
>>
>> 144000 frames
>> 48000 Hz
>> stereo
>> S16_LE
>> 3 seconds
>>
>> Channel 0:
>>
>> min=0
>> max=0
>> RMS=0.00
>> nonzero samples=0/144000
>> nonzero percentage=0.00%
>> distinct sample values=1
>>
>> Channel 1:
>>
>> min=0
>> max=0
>> RMS=0.00
>> nonzero samples=0/144000
>> nonzero percentage=0.00%
>> distinct sample values=1
>>
>> So the SmartMic capture is exact digital zero on both channels.
>>
>> ---
>>
>> ## 0xFFB7 VS 0xFFF7
>>
>> Jack mentioned that the default value according to the RT721 specification for:
>>
>> NID 0x5f
>> index 0x30
>>
>> is:
>>
>> 0xfff7
>>
>> My hardware returns:
>>
>> 0xffb7
>>
>> Difference:
>>
>> 0xfff7
>> 0xffb7
>> ------
>>
>> 0x0040
>>
>> So BIT(6) is the only difference between the value observed on my unit and
>> 0xfff7.
>>
>> ---
>>
>> ## FIRST ATTEMPT TO FORCE BIT(6)
>>
>> I then modified the temporary module to set only BIT(6) using:
>>
>> rt_sdca_index_update_bits(..., BIT(6), BIT(6))
>>
>> rather than overwriting the entire register.
>>
>> This should change:
>>
>> 0xffb7 -> 0xfff7
>>
>> In the first attempt I performed this before requesting PS0.
>>
>> That attempt failed safely:
>>
>> RT721TEST mic 5f:30 before PS0: read failed: -16 RT721TEST force BIT6 failed:
>> -16
>>
>> -16 is EBUSY.
>>
>> Since rt_sdca_index_update_bits() first reads the register and returns
>> immediately if the read fails, no register write occurred during this first
>> attempt.
>>
>> After PS0 the register became readable and still contained:
>>
>> 0xffb7
>>
>> There was also a runtime PM issue during this attempt:
>>
>> runtime PM trying to activate child device sdw:0:1:025d:0721:01 but parent
>> (sdw-master-0-1) is not active
>>
>> followed by:
>>
>> Failed to resume device: -61
>> Slave 1 alert handling failed: -61
>>
>> Because of this I did not consider the first attempt authoritative.
>>
>> ---
>>
>> ## FINAL CONTROLLED TEST
>>
>> For the second attempt I moved the BIT(6) update until AFTER PDE2A had been
>> requested to PS0.
>>
>> I also explicitly kept the complete relevant path runtime-active during the
>> experiment.
>>
>> ACP PCI device:
>>
>> /sys/bus/pci/devices/0000:64:00.5
>>
>> SoundWire manager:
>>
>> /sys/devices/pci0000:00/0000:00:08.1/0000:64:00.5/amd_sdw_manager.1
>>
>> RT721 codec:
>>
>> /sys/bus/soundwire/devices/sdw:0:1:025d:0721:01
>>
>> For all three:
>>
>> power/control = on
>> runtime_status = active
>>
>> PipeWire, WirePlumber and alsa-state were stopped during the experiment so
>> nothing else held the ALSA devices.
>>
>> RT721 status before capture:
>>
>> Attached
>>
>> The sequence inside rt721_sdca_pde11_event() was:
>>
>> 1. Read 0x5f:0x30
>> 2. Request PDE2A PS0
>> 3. Wait 10-20 ms
>> 4. Read 0x5f:0x30 again
>> 5. Set only BIT(6)
>> 6. Read 0x5f:0x30 again to verify the write 7. Perform SmartMic capture 8.
>> Read 0x5f:0x30 before PS3 9. Clear BIT(6) again 10. Read back the register to
>> verify restoration 11. Request PS3
>>
>> The resulting kernel log was:
>>
>> RT721_BIT6_V2_BEGIN
>>
>> RT721TEST mic 5f:30 before PS0: 0xffb7
>> RT721TEST mic 5f:30 after PS0: 0xffb7
>> RT721TEST mic 5f:30 after BIT6 set: 0xfff7 RT721TEST mic 5f:30 before PS3:
>> 0xfff7 RT721TEST mic 5f:30 after BIT6 restore: 0xffb7
>>
>> RT721_BIT6_V2_END
>>
>> So the requested value was successfully written and verified by hardware
>> readback.
>>
>> During the entire three-second capture:
>>
>> 0x5f:0x30 = 0xfff7
>>
>> After capture, BIT(6) was cleared again and readback confirmed that the
>> original value was restored:
>>
>> 0x5f:0x30 = 0xffb7
>>
>> ---
>>
>> ## CAPTURE RESULT WITH 0x5F:0x30 = 0xFFF7
>>
>> Capture command:
>>
>> arecord -D hw:amdsoundwire,4
>> -f S16_LE
>> -r 48000
>> -c 2
>> -d 3
>> /tmp/rt721-mic-bit6-v2.wav
>>
>> Capture:
>>
>> 144000 frames
>> 48000 Hz
>> stereo
>> S16_LE
>>
>> Channel 0:
>>
>> min=0
>> max=0
>> RMS=0.00
>> nonzero samples=0/144000
>> nonzero percentage=0.00%
>> distinct sample values=1
>>
>> Channel 1:
>>
>> min=0
>> max=0
>> RMS=0.00
>> nonzero samples=0/144000
>> nonzero percentage=0.00%
>> distinct sample values=1
>>
>> Therefore the microphone capture remained exact digital zero on both
>> channels even while 0x5f:0x30 was verified to be 0xfff7.
>>
>> ---
>>
>> ## SUMMARY
>>
>> Firmware:
>>
>> BIOS FA401EA.304
>> Latest currently available firmware for FA401EA Issue still reproducible
>>
>> Baseline:
>>
>> 0x5f:0x30 = 0xffb7
>> DMIC = exact digital zero
>>
>> Normal PDE2A -> PS0:
>>
>> 0x5f:0x30 remains 0xffb7
>>
>> Explicit BIT(6) set:
>>
>> 0x5f:0x30 becomes 0xfff7
>> hardware readback confirms 0xfff7
>>
>> SmartMic capture while register is 0xfff7:
>>
>> Channel 0 = exact digital zero
>> Channel 1 = exact digital zero
>>
>> After capture:
>>
>> BIT(6) cleared
>> 0x5f:0x30 returns to 0xffb7
>>
>> ---
>>
>> ## CONCLUSION
>>
>> On my affected FA401EA, explicitly setting NID 0x5f / index 0x30 to the
>> specification default value 0xfff7 is NOT sufficient to make the microphones
>> work.
>>
>> The machine is already running BIOS FA401EA.304, which is the latest
>> firmware currently available for this model, and the issue is still reproducible.
>> Therefore there is no newer ASUS firmware currently available for me to test
>> against this behavior.
>>
>> One interesting difference from the earlier reported register dump is that my
>> unit does not currently show 0x01c2 at 0x5f:0x30.
>>
>> It shows:
>>
>> 0xffb7
>>
>> both before and after the normal PDE2A PS0 request.
>>
>> The only difference from the documented default value 0xfff7 is BIT(6).
>>
>> However, setting BIT(6), verifying 0xfff7 by hardware readback, and keeping
>> that value for the entire capture still leaves both microphone channels
>> producing exact digital zeros.
>>
>> This seems to suggest that some other part of the analog/vendor power
>> sequence is still required.
>>
>> This could also explain why the community workaround which writes several
>> RT721 vendor analog power registers succeeds: that workaround modifies
>> considerably more than 0x5f:0x30, including codec-wide power state at
>> 0x5f:0x00 and other analog power registers.
>>
>> I intentionally did NOT apply the complete vendor power sequence during this
>> test because I wanted to test Jack's 0x5f:0x30 question independently and
>> provide a clean result.
>>
>> For reference, the internal speakers also remain completely silent on this
>> machine with a20afec40ea1 alone, as previously reported.
>>
>> If you would like me to perform another targeted test, please specify the exact
>> register/value and at what state it should be read or written, and I will try to
>> reproduce it carefully.
>>
>> Again, I am not experienced with Linux audio driver development and I am
>> relying on ChatGPT to help me understand the kernel code and construct these
>> diagnostic tests. I wanted to be transparent about that.
>>
>> Nevertheless, I have tried to keep the experiments minimal and reversible and
>> to verify register changes by hardware readback wherever possible.
>>
>> I hope these results help narrow down the issue.
>>
>> Thanks,
>> Cristian
>>
>>
>> On Mon, Sep 14, 2026 at 9:13 PM Mark Brown <broonie@kernel.org> wrote:
>>>
>>> On Mon, Sep 14, 2026 at 08:16:22PM +0800, Shengyu Qu wrote:
>>>
>>>> On my FA401EA this issue doesn't exist so I can't test. Maybe you
>>>> can ask at bugzilla so other users with this issue could test?
>>>
>>>> PS: maybe this is the issue for some old batches of RT721 chip? My
>>>> device is very new and this might be why I don't have this issue?
>>>
>>> Could some firmware update have done something that helps somehow?

