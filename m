Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794362554;
	b=DAzmj9V3hKU5akRsb3YIn4NjuEN9yjMEVDVkHtbDSQjyJb+S5VmwtyarK3ZWtH997nIn
	 XlswJFiJ4VhYtDh7x7mu1BXtn8ei9hGlRfgRG48AuJf5gQAYBnm3YdYqLI+23t9aIP+o0
	 XJlcO88qiwPyLhIBQqWOCXNDq5+XuhwPB8e0uTQxyMNEI6jhSGnRzN56n7Lzv3TMiGd62
	 JMp6UDzOq9X10dweRVfCX9dOPBesBLGZeerV/VGjPZWgUToK0zHDqyvn//3ua88l1UNyf
	 pdRsruw+vzZ+aWxFcUysiK15vLL6FtVwqWK+/QAMDBdYyKVeQ60Ycnqc5TfTVkPxh5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362554;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=GWWBCrecTEA7wjQVHlGiOaDhojUdZ8WkR49KBkN2ep0=;
	b=3iq1Xraf8hGuO0ol4hbuRkHWH3s9XkQiFc4fpx0EHqajiQ3hP91QU+3zdcNFwEuFUcMV
	 jXbyxIMJ4kdr13XC9xswp7ZQQinmxKZ33MbgDTPfdBXjOEyVDx49XgibBMDt/oS7Hxve1
	 BzWs5paxuPzSs5bBw9PD2Q/+Bp642CRIiIOy36dsppWu51oZ8exv0nuhjoYdkPC5uJ7U6
	 q8JIhzFj4Ho5dokbhoIPaEE/5nwP0rwXjVmbYMU3RyRlrIbWSYH/7sj4CCaaBZMvG+17+
	 aXdk3cwpL1+/Ij5381ab3/pvaZH4klhA/A3Gww0UJZUyQUzQYslDliYIZlG+zRg9qQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=er8I4iwV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.21
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012021.outbound.protection.outlook.com [52.101.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D42F60A261D;
	Wed, 11 Nov 2026 02:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D42F60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=er8I4iwV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPigw/59uhjvvs16S6xKu5XbQPvGYTvSISR+uQ/cXjrst72rwtL3MsjrR1ATOdYhA9WiP0UWkMEPSoNU8OmkcqoL+5pKAhYiN9sN/5Kl7Xkxh4IYQqtXHKr8+MjeYNYHs/zGcmbwJwQOXJggAZZqIW0L46TcrFSEZib8RNkumj0XqF3wP/FuQyYrsBQ9CCO8dvQpZxQXmXme7f6c/dvodKIT9bUSB0dxwUH4bPds5ilzaGNfCtkKcs+A3/Sx3uKBsgGNn5gkvs9SU28ZG3bdE9Wkj4sCfIoLGSVKnFbUWEGZlcDLsvu0JwukPKflLfyKlV/+rujVvsqD4URs6hClGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWWBCrecTEA7wjQVHlGiOaDhojUdZ8WkR49KBkN2ep0=;
 b=waiIrQPFKMkWk0q0ZF3kqzPrCoh+wxyQrRHXnV6IJwq0Mddk/N2Ejv4W2drgGK9e0syrZ3TV9+t0MFv4/ooeSaieOhRYAZqVG8zEryG/DDYj5xIfUKcdUpZsXJynhZZyfqn3qMP0FrOxHKE0thMsXu3NdhTZzLgargiNz8agrJTB5UVB03DZ8b08Oz0m9QhFYA6MQncRNdXyvtotKNCPVzWAf8QtVvhGmaTTJK3uKAbNuAyTBX7UBIcuMW3dNVtDxRFaN6BQ/U3KUeqOrwCoiv6K/q+gYWzffkLSR/iWUaxCF9msgok9J64EhdUHGpKmyqfpawkClbShtlfGvY9AiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWWBCrecTEA7wjQVHlGiOaDhojUdZ8WkR49KBkN2ep0=;
 b=er8I4iwVoT5SwRTOT58gzgtO4V4iiDsXohJ5SL/oPE+TlE6Qi0wSCcwlwGQ8aX/JR8esFKehJ0+eSlAMRQaybhNZJXsqyJLVnXqX1i03Fk6FiuRBy31JzzRZPR8TZZXTqcmHmZtdfEX3dTSFuiOxcyxFfVUPtxGn23E0S21BoLA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by SJ2PR12MB9244.namprd12.prod.outlook.com (2603:10b6:a03:574::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 02:02:28 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0592.012; Wed, 11 Nov 2026
 02:02:27 +0000
Message-ID: <3ed4c949-3c22-473a-917f-fb604c7f468c@amd.com>
Date: Wed, 11 Nov 2026 07:35:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/2] ASoC: amd: acp70: Add rt713 + rt1320 SoundWire
 machine for LG gram 16Z95U
Content-Language: en-US
To: fixca <jaehoon1744@dankook.ac.kr>, broonie@kernel.org,
 shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Claude Opus 5.5" <noreply@anthropic.com>
References: <20261111013953.4011-1-jaehoon1744@gmail.com>
 <20261111013953.4011-3-jaehoon1744@gmail.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20261111013953.4011-3-jaehoon1744@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::12) To CY5PR12MB6252.namprd12.prod.outlook.com
 (2603:10b6:930:20::17)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|SJ2PR12MB9244:EE_
X-MS-Office365-Filtering-Correlation-Id: e30cf477-77da-4a43-db33-08df3f97d613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|18002099003|22082099003|6133799003|56012099006|4143699003|6123799006|261026140227099003|261028144727099003|261026121527099003|261022105027099003|261102123227099003|261021121427099003|11063799006|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	t5gb8fH2Fkqyr0KZ/XPjNyuASKmuxvs387IrI4920GF45LahJ4Jd/wfvEq64LETxBLQkFaw6pRIwpX29Wrp23lxS/mSs9gitczQ6/pQ002C2y/nG4jERUyrIBlusxaq2WTKfP3WnguY0Irb4RIHQCTb4Bj3M/bVZIxh5UBkgMgT2Bgy/vIlJ5/DBHhnu5emt+ERylgplJQzbxpOdWvAoNxUZhAfWW1ApEs1cBAPgTnWkEMYxe51CozwU9bFelekXxra2kSNvdOY27OA5JVxUCD+3hnqw2gsmjF5YFdXJItlLaB/fjdmkQ3LSwMlRf9DiouGbh5sAe9d0rrDCs0OUaY61Ql1RQLn7q2h06eR/oNn6UNzSnQ3YPrnf/mE9mNsZZ5y+yeX07JzH3KS4cnRTM3Kru8+or221ht7N3DtNbATTj2vZLAaaOhRW0j12A3DYagVcWqG/kV7Uix4XODEI2W/IzCWFcw7/oVB+aUaV8EPbrhO5J+FLY7M5i7tomwAvH2VtP+Zp54W6Qvrl/n6VO+HgecUGxwazIWJEjuXyKvSPbtSzuNeGWzZSiEtLJI5IFtbxFeEL8hDD/fIDgoPw/xMvo//kquoYj7H9w02MiMTNJutKhMosOKvswAqFsXtVbqx/h0Urwvh/SPfg3bCzfwLPkg53LMmb+CidbLiE8to=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(6133799003)(56012099006)(4143699003)(6123799006)(261026140227099003)(261028144727099003)(261026121527099003)(261022105027099003)(261102123227099003)(261021121427099003)(11063799006)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDk0dWNQLy8wSldnQjR4dkxtK3ZuV1ZwTGRYYURZV0dWS3ZpdjFIck5MNnF1?=
 =?utf-8?B?K0JqZEdnU2JGUTdmT3crcExpdllSVUd0QzZiQUhFcFYwMEJTVmNaeElYUWZB?=
 =?utf-8?B?ZUdrSFczVGFYekZPYlQ1U2JEMWlFMENXb0pJVERaVkJ3TEl5dDVySXVBanZk?=
 =?utf-8?B?MFFFaWVsalQvVDUzWElLVXNtN3pRUTVxN1lwRmZOM1YyZFRVc0JIZkFQZ05a?=
 =?utf-8?B?WVpvMVY2dXdTeitMWEZGVGNLcUpVVnlCRDFweDllanBRNklHQXB3cGlRRUpQ?=
 =?utf-8?B?L1B0OFZEbUFtTDZJNjdneTA1ZUk0U1YrdkxybERGUFdkWEJSRHhXYmR0ejFu?=
 =?utf-8?B?azdZRStsdFpHVUVST3AzWlJvV1NoNFN2OWZKWG9qREpUOGlEdFIxMzZTT3ZS?=
 =?utf-8?B?YXpEZFE5UzlSR29zODRodnp3RU5MOXF2ZVcvSDAzTjByRDRWVUxGNFlvUVFF?=
 =?utf-8?B?TkhRTTByOVRZTFlPK05JcHQ2WklSV21jVHlWRllIUjVOYVVRZ3BkSXZhZnpP?=
 =?utf-8?B?cHNzVFEwNkNweXE2Q0ptZmduVVpRendFL1NDOFRKenFRcnQ2U1ZPRWxBdzNx?=
 =?utf-8?B?L0MyNXFwQnJoNktwWjNpQm1PN0RUcDVxMWdIQzhPeHdIZEpTTFRYNXRZbGRR?=
 =?utf-8?B?QkJNMGg0cHprUHRiZzRCZThScks5WkUwVnczSTVpQ0poSmE2UHZwVkhYai83?=
 =?utf-8?B?bmVqUFZQWlBVd3JVYzRxd1FwZmJ0cDUzQWhwWFg2TFl2ZkN0M21NemNCVCsz?=
 =?utf-8?B?OFVnVEszRzZEd1NSQ3lBK1p2UVY0dE9mbnJtT0FDTzdZOUlCNWdxUWF1OE5M?=
 =?utf-8?B?SnpsS2lnYldDRlFyb1RLdDZMekU3M2dmRTZ1Tk13R2cvNEJtclVaSkhzdjZB?=
 =?utf-8?B?TmpGdm5zZU55QWhMVXllQUpGZ3k1VWdGR1djYjQyNEpMZjNUekovVTNoN281?=
 =?utf-8?B?aDlXcVJtdnpWQWpPZUFJeWd6K1JjZVBmK1FNV1pKbDZPVEgvckJRMzVRaHE2?=
 =?utf-8?B?M3Izd0pTM05LUjZiSStCaXFqVmtFYk1FY0ZxenNuckJMNUZ3ZU5ncWVreEdw?=
 =?utf-8?B?c2o5dFhpVmlZZnZYcDVtV2o2dmVWTWRIMFkrazhOT1ZzWnU2MEJ0bGdNdWhT?=
 =?utf-8?B?cEszenB1ZzZGKzZ1SmZqeGNVS0JRbXpKRjZtanpWQ1dReGFkWDY0Rkl1a2Fh?=
 =?utf-8?B?NGY5Qks0RUJraGNKcEwxSEpYTmQwek1FSjVadDBVSEtRUW15eTBtYkdQUFJ6?=
 =?utf-8?B?eCtVRVF3c2kvbEJSRjBOVkxaOHUwcktyb2FVZk9palBXY1ZZQXF2WmVDZDdt?=
 =?utf-8?B?R0JCeTlqckJBSHdnTGVIV1AwbDM5RGNUU1AvSitsRjdXRXRpcW1ROXZncWpD?=
 =?utf-8?B?UEtPZlBudWt1MW5zS0JOdExQeWZNLzRYeXdsUmJETmtXTDEwalUyeXVZS1Mx?=
 =?utf-8?B?QlhDZ0toRVB5TXRFUnljeVdEb0huUjdHcG8xUG14R3lsWDFtMjcraHBRUWxa?=
 =?utf-8?B?VEc3MlNaeVRQakpJR1VkUUpyellHMW8weC9WVytXSXRXM09XZmpZQVJZUHhJ?=
 =?utf-8?B?VENoYTVJRXZVUWZMVW1FNnpJQ2FoYmhMMHZYeDdXSjZYRUhRUHZLaG5Jb1Rr?=
 =?utf-8?B?L3lUc1ZUWTB2ekp0Q1IzLzROT2pnZEcwdmNlN1FUZVlQZUN2eUVtVTY0a3dn?=
 =?utf-8?B?QzJlRVcxR1hsb0RpZGk5c0xta3NZallKelEvOGdWQ3RpV1daamw0OUx6a25z?=
 =?utf-8?B?YnZiZ0lFL2doZmlCV1dEY3VCUDhTbVE3Z1F6clhnQ2QycDVoZ3A3VXZNTkhE?=
 =?utf-8?B?ckprbW4wQVluSHRzNThUdmFkSElPL29uWDU2VGZiZUNUM1NEbzVkUjJnWnA3?=
 =?utf-8?B?MHNsV1A3Q2JjUnpxZU5naDN1dnJCazA1ODNWQ3R2V2RNVlQ2RmtQNUxiS28w?=
 =?utf-8?B?TnBrejgzaGE2TVZvSndQUE0rc01aVG1KeGVoVklQTTZkREgrQ1Z6RkhTeTA2?=
 =?utf-8?B?TXIyTnI5TGprY2JYVDdzT0FTUldrMEZ6bzZLVHJSdnlob3JqZ3VrLzlrMk50?=
 =?utf-8?B?TjFwdHJjWEg3Z2hENTBhbzFBVzVJdUw1VlZoMSt0bmM1NkpxOGJJMFUxUlpw?=
 =?utf-8?B?d01WeEVKNW9kYmQ3M0FiUE1NcXZkVVdPcjZlV0V0ektiaTN3eEEvWlJxMVc3?=
 =?utf-8?B?VTBQQllXTHdoeTY5eXcxdzFjSkZoM0liYkhvdks2S0tOWG9UN05jcTFYR01w?=
 =?utf-8?B?UXUrR0N5WkVWZ0lDU2ZLTWJXdGJwNkVnMm9vQTZaTFd5NjZZTXBNQVlGaEZC?=
 =?utf-8?B?YjdpdTJqTlF2cmlGWTlrRUVZZ1hocm1LRnRiNERTZGxkdnI2MXp1QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e30cf477-77da-4a43-db33-08df3f97d613
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 02:02:27.8545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxA9wc6K3PHg7BDkH3vThT6pH71LvJxYGODSt4u1QLFw/+bfKTLjCettm8WG0+wbyMbPzgZr9nay61BEuI+uTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9244

On 11/11/26 07:09, fixca wrote:
> [You don't often get email from jaehoon1744@dankook.ac.kr. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Jaehoon Kim <jaehoon1744@dankook.ac.kr>
>
> The LG gram 16 (16Z95U) uses an RT713 jack codec on SoundWire link 0
> and a single stereo RT1320 amplifier (unique ID 1) on link 1. There is
> no matching entry in snd_soc_acpi_amd_acp70_sdw_machines[], so no
> machine device is registered even once the SoundWire path is selected.
>
> Add two machine entries:
>
>  - rt713 (jack + DMIC endpoints) on link 0 and rt1320 on link 1, used
>    when the RT713 exposes a SmartMic SDCA function (rt712-vb check).
>    On this machine the internal microphones are routed through the
>    RT713 SmartMic function; the ACP PDM controller is not used.
>  - a fallback with only the rt713 jack endpoint and rt1320.
>
> The existing jack_dmic_endpoints cannot be reused: it maps the DMIC to
> endpoint #2 for rt721, while on rt713 the SmartMic DAI is the second
> DAI, so endpoint #1.
>
> Tested on LG gram 16Z95U-GS59K with kernel 7.2.14. The "amd-soundwire"
> card is created with these PCMs:
>
>   SDW0-PIN0-PLAYBACK-SimpleJack  rt712-sdca-aif1
>   SDW0-PIN3-CAPTURE-SimpleJack   rt712-sdca-aif1
>   SDW0-PIN5-CAPTURE-SmartMic     rt712-sdca-aif3
>   SDW1-PIN1-PLAYBACK-SmartAmp    rt1320-aif1
>
> Headphone playback and internal microphone capture work with the
> stock alsa-ucm-conf (1.2.16.1) HiFi profile; headset microphone
> capture was not tested. Speaker playback through the RT1320 is still
> silent although the stream starts without errors; see the cover
> letter.
>
> Signed-off-by: Jaehoon Kim <jaehoon1744@dankook.ac.kr>
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
> v2: rebased onto broonie/sound for-next (v1 did not apply).
>  sound/soc/amd/acp/amd-acp70-acpi-match.c | 83 ++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>
> diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
> index c2f0479..b492cbe 100644
> --- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
> +++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
> @@ -583,6 +583,78 @@ static const struct snd_soc_acpi_link_adr acp70_rt722_l0_rt1320_l1[] = {
>         {}
>  };
>
> +static const struct snd_soc_acpi_endpoint rt713_jack_dmic_endpoints[] = {
> +       /* Jack Endpoint (AIF1) */
> +       {
> +               .num = 0,
> +               .aggregated = 0,
> +               .group_position = 0,
> +               .group_id = 0,
> +       },
> +       /* DMIC Endpoint (AIF3, SmartMic function) */
> +       {
> +               .num = 1,
> +               .aggregated = 0,
> +               .group_position = 0,
> +               .group_id = 0,
> +       },
> +};
> +
> +static const struct snd_soc_acpi_adr_device rt713_vb_0_single_adr[] = {
> +       {
> +               .adr = 0x000030025D071301ull,
> +               .num_endpoints = ARRAY_SIZE(rt713_jack_dmic_endpoints),
> +               .endpoints = rt713_jack_dmic_endpoints,
> +               .name_prefix = "rt713"
> +       }
> +};
> +
> +static const struct snd_soc_acpi_adr_device rt713_0_single_adr[] = {
> +       {
> +               .adr = 0x000030025D071301ull,
> +               .num_endpoints = 1,
> +               .endpoints = &single_endpoint,
> +               .name_prefix = "rt713"
> +       }
> +};
> +
> +static const struct snd_soc_acpi_adr_device rt1320_1_u1_single_adr[] = {
> +       {
> +               .adr = 0x000131025D132001ull,
> +               .num_endpoints = 1,
> +               .endpoints = &single_endpoint,
> +               .name_prefix = "rt1320-1"
> +       }
> +};
> +
> +static const struct snd_soc_acpi_link_adr acp70_rt713_vb_l0_rt1320_l1u1[] = {
> +       {
> +               .mask = BIT(0),
> +               .num_adr = ARRAY_SIZE(rt713_vb_0_single_adr),
> +               .adr_d = rt713_vb_0_single_adr,
> +       },
> +       {
> +               .mask = BIT(1),
> +               .num_adr = ARRAY_SIZE(rt1320_1_u1_single_adr),
> +               .adr_d = rt1320_1_u1_single_adr,
> +       },
> +       {}
> +};
> +
> +static const struct snd_soc_acpi_link_adr acp70_rt713_l0_rt1320_l1u1[] = {
> +       {
> +               .mask = BIT(0),
> +               .num_adr = ARRAY_SIZE(rt713_0_single_adr),
> +               .adr_d = rt713_0_single_adr,
> +       },
> +       {
> +               .mask = BIT(1),
> +               .num_adr = ARRAY_SIZE(rt1320_1_u1_single_adr),
> +               .adr_d = rt1320_1_u1_single_adr,
> +       },
> +       {}
> +};
> +
>  static const struct snd_soc_acpi_adr_device tas2783_2_adr[] = {
>         {
>                 /* left */
> @@ -820,6 +892,17 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
>                 .links = acp70_rt722_l0_rt1320_l1,
>                 .drv_name = "amd_sdw",
>         },
> +       {
> +               .link_mask = BIT(0) | BIT(1),
> +               .links = acp70_rt713_vb_l0_rt1320_l1u1,
> +               .machine_check = snd_soc_acpi_amd_sdca_is_device_rt712_vb,
> +               .drv_name = "amd_sdw",
> +       },
> +       {
> +               .link_mask = BIT(0) | BIT(1),
> +               .links = acp70_rt713_l0_rt1320_l1u1,
> +               .drv_name = "amd_sdw",
> +       },
>         {
>                 .link_mask = BIT(0) | BIT(1),
>                 .links = acp70_4_in_1_sdca,
> --
> 2.43.0

