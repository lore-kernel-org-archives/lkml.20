Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794361995;
	b=Sj6hrx1OV8CT6PjAo2Nd5Ju5eOHA3NfHS5crxWGxKENstSUuLQLGX1RzKXwkJlCtl81t
	 13FfCMe3DQi5WQ8xd+Oz4BIqWcYF9XHHF3JRfh15QYouu+w1zZCkcRAAa3JUYQ39ExjzW
	 lcDXArAo4ivqcpxNCIxgJMpqVQPzWGVIu7bDyTAcgML4Cj6f9SEy8xyGIkYw0ej5CDHbf
	 OAEs1hEP1HFkVyRnmBw3w6H1iidid2de8zNCywDAlN2pwPsA7KZC8ifC9uy/L3s+CpoON
	 TT8LAwJ426NjPKm/Zyj8cHVepYju8Xeu5XtFv6WtpvjKLXORSOO4CBXK6g3WaWgSpUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361995;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
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
	bh=MOwL9D5rZ9Dx+kqszqU9gQRHYPWhblKW8vLGj38zbac=;
	b=awKk4xtqEd4TitoMZgWLrBwo+lq8ZKyahCmDZn0p6TFfiLQ982LkWzJ0bcV5PFSrB6lI
	 1mzfrUMo5CmutIUOUC9Hj1O815mTdiEaIRez2QsihR7DDda5Zr9UoV5zVC3+Sm9pQdSeG
	 P0G/r7ugWHSqRqABKEGB33wbVdPqZJFcg6F4y1++8y3nnc9OUlygiF2KQgxxsu+5dfj3+
	 glJEjQZmKQ0gc1QvS3Pr12OIRS18nHSn8hUP5xfchLUF71SfvzPGn93V1BOP4T/voou8t
	 x+ef+24s/U5etfgOe6A4gvoufQhMSNvl82GDacVw6raNa2/C18V4Lnzc36DUSP4IAAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=AerZDqEK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.16
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010016.outbound.protection.outlook.com [52.101.201.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9842D606A321;
	Wed, 11 Nov 2026 01:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9842D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=AerZDqEK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJ/4M+W3EAeSlThASspiL2E3Cpn0DvjyfRR+Tr4KvNErUV14ylvZN8SznJI3xjNhZ3nQr4KtxGHflC03/9Ok7kNoTc/zWeSzCL/Ugb5rjSHjFnkAvhlq2Cj89Cxl22JzWqmcEDrAqjxI16pBgvLVKaUqWVyR5mwlmC+V4oggMp2N30TCMuj7WpZz3PA1cWDTYTtDTg/d1vOyI9M0X1ARfRLQ67tvKRBJU7k9ZueRpOo3LNCPVYEC/rwcw3j62LXadIEOBO71hc2OBM3sJX3fKVc5TUW9oW+sZzePNRHUQr1PZFZ1l9AMrPsGeBmxnofvJ2tpM+IfiSReTw5hYx0kMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOwL9D5rZ9Dx+kqszqU9gQRHYPWhblKW8vLGj38zbac=;
 b=dHCXwnlDn7JdFdZm6J9Lpi0wlYbJDrfKmsy7lGOA+Y3XSUrAxclF3w1lGN7xB2F2TKOw6GPSON0POg2yRGk5edb/pQjkwmNFLmAAEEbW1d6FuW4Dzioh0qsWgJ+rh49TPFX1CXjzldGTmIxamojea/aqz8+7Pt1hIFVNgrG/62Dt7N04YpUyi2RGaXDlIUtWatCPC1kNQr5HVKKDBZAe7JSSjRKHIO5SEiqlwv9gEpdMh9Y5QmbxqyymFL4DG1VjFMCY5bs5smK6p3DNsMhlGi5sqz4n+tvddOajQw8xspSslMRMZU34TvEr2UbWFSgBcMuOiB6MiPAwItoYGQvxBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOwL9D5rZ9Dx+kqszqU9gQRHYPWhblKW8vLGj38zbac=;
 b=AerZDqEKzIWYd37z7FkaDk6N+s4CVetGbbth3siN76mNHhtvtGbgARHxz7vrRxcsDTK4BhvUwgv8PNYI3Ze2zR2jxvLQURF1ZuAf+864synVnIkniIcJnMK0Yfy+Ys2siutMPmbGYmZBfuqJokP2WNcek8uOubE0kVgR2FZzRY8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by PH7PR12MB5853.namprd12.prod.outlook.com (2603:10b6:510:1d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 01:53:11 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0592.012; Wed, 11 Nov 2026
 01:53:11 +0000
Message-ID: <dddc324c-254c-4bc3-ad77-916f079a7301@amd.com>
Date: Wed, 11 Nov 2026 07:25:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/2] ASoC: amd: SoundWire audio for LG gram 16Z95U
 (rt713 + rt1320), speaker still silent
To: fixca <jaehoon1744@dankook.ac.kr>, broonie@kernel.org,
 shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261111013953.4011-1-jaehoon1744@gmail.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20261111013953.4011-1-jaehoon1744@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN5P287CA0016.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:265::17) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|PH7PR12MB5853:EE_
X-MS-Office365-Filtering-Correlation-Id: 428d8d89-c57e-4949-817b-08df3f968a54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|261009223027099003|10067099003|3023799007|261022105027099003|261026140227099003|261026121527099003|261022075727099003|261028144727099003|261021121427099003|261102123227099003|11063799006|5023799004|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ohBlEHF4a7e/1egXHsR0X6qwnBe4pc9fPjTE/rbTP7rjNtRMb9sRzHNjrNbzISvZyfP2s+qs1NQV2gr1FOwJ371Nd3SKdQKwkv5EZv4KVRe4fJip9AWnrjsctT+EnHVUFdJVTiWGQVJl9WumWyn23nr0s74ee0th8GbT8iwP0uXHu2900M6Sk7KzMMbptSNfEKzSvWsdDZoJsfWip5FoLPkasbpczkkrj+m9SrINTMBbSpD0Tfuu2gF7cFZAt91Qhgi+gWvi4oQS3nFsZDQjwRsEnRSYIE+uNwK9iGkwyRK4vX1tWj4KI5EkTnOjtQwPZMR5oco0cq3qm+fKCszb4PYZhATRDe6aXJzv9XiR/fBR0sfBWi5GdMUEfczZu1dVrloacvigebVkVjCK4SPD2t7+SIVdZELyDZ4w5qi1YUOn5MutlZyaLzZqf1SOSBUdKasaYINecy8JttRlGYU1Es6iEckwl2LYCPPGhXyBmVvCk3r+DpeQ8p8oejYptoNC/gyniM90oF1W4B+OMGDwAfFqTvBFpgxHcyTfKg2wolo3+3t9gu7g+3QMLRfVSWojoeWd/Jx+/A50Z+OiO5sKNDIXOlJ6Xo8b6PB4DKgAVQjZcQnQAIzmqUrukFX3kpG0BCYvjWY9aEyBlo9mJFxnOPKega0fQUZAUzr0k4vq6rI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(261009223027099003)(10067099003)(3023799007)(261022105027099003)(261026140227099003)(261026121527099003)(261022075727099003)(261028144727099003)(261021121427099003)(261102123227099003)(11063799006)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXhneEc4cXlEU3ZORUVzVm9sajFoY3F5dHJEbTM5Q2h0a1hsenJXU3FaNzh1?=
 =?utf-8?B?WVhOWkh4UHpvc2VJRFRIQVhRdDluak40RzJqVzFlOXE1ZDYxNk5vT3V3TXJ5?=
 =?utf-8?B?eHZmU1NjenV5eWo4WVlRWVNhWjhpdTRtQ0Fpakt0ZVRhZGVPZDlGRXBaSjEx?=
 =?utf-8?B?SCsvN1pJSlR3V3I3M3drblE4a3RHeWRPcDdqMTRqdHNvWkNzQTJNR25YWnpx?=
 =?utf-8?B?NWFXUU9mQzVkaTNXSkllV0xOZ09MUC8vNFZoYkIwUGI4bktnRzhNUW1teDN4?=
 =?utf-8?B?ZnlBWUZndURpbVdEWnJQaG9Ddnl0MDlFQ3ZMK2Job012UHJpeFdDbUc0aVFp?=
 =?utf-8?B?akJXZ0tEaTJ3VjZFMlNkZWFxeDMrT0Q3R3Fra2RyMWtWbkZpaThpSVZLVDhH?=
 =?utf-8?B?RUdpam9lSk94b3FadDh2NzFGaTNSWFhSQ2owWjJvaHlWYk5UZkpDNnUrMG05?=
 =?utf-8?B?Z0w1VkxhZkFhUUo2dk52bitrZFlXMWljcWdKa2hTWTRNTkxidU9GTzVsaFho?=
 =?utf-8?B?R1NyYmQvSnhUKzNjdTByQlZUTWlnbmN1Wi9sQ1daWGNNYVFkUTk3d0NNb0dV?=
 =?utf-8?B?OU5RMUYzbDdqdUxQbWR4ZUxRSFZmUG9Ka2tVQ0F6L0NraTZpUEdpYllvaUpP?=
 =?utf-8?B?dVd4ZWFwR1JHK3cvejc0TjA1VkdLZkE3a2NMajFvUDZYTEwyc3piazVVSklm?=
 =?utf-8?B?a0lMU0lyZlkyZ3ZUaEN1UTdWYjcvTmlwZ2xEQ3FPaG0yREt3citLb0RnYUtw?=
 =?utf-8?B?MUxrWDJkY29KUGZ0UjJNM1JCRWE5eHFlQ3F3dmtIeENkWnl2NVdmUGlVcXQv?=
 =?utf-8?B?UTJDVFpmbGZmRGZlcWpHZGhxY0V6NmIzTDQ5cy9nU0tLbGdVaThldC9YWE1D?=
 =?utf-8?B?K2dBc3hqWitBZ0RtUURqNG1HMTA2US85bTZpVFNyUGt3c0RFcEtwNjJxaGwy?=
 =?utf-8?B?SXBmWjlOQWtkS0ZHMXQyZ2J6STZ2OVVrck5BcUNUODdhd29VQlkzZHAzTjc0?=
 =?utf-8?B?cCtLTEtEbXpRUzVRUTJwZTdkWHhRQi81aEdJSmhaMmdieXZQUlFGeWgzWHMv?=
 =?utf-8?B?S21ZYnNZR2tMZzBJVjJxR0FncUdDN215S2NoTDJDYlQrMnFzRWcxUXY0eE84?=
 =?utf-8?B?QXFON0czNTFEcndrbWZzdXF2NVhPbTB6aS9IWG1xb1NFTytjNDg3YjA4NlNi?=
 =?utf-8?B?bHNvMC85Wk50OG0yNEZLcjh6MnBRWmdTTm9FMUF6eUFhdExRbTFNZVA2V2dR?=
 =?utf-8?B?NVFmRjVwaGpQT2Q4TkxWcXdheFlmaXEzNHUrazc2clNPb2licFVyQkNHU0Ns?=
 =?utf-8?B?TDFjT05VOVBHT2wrWTVYMm54dkVKMFpqWHQyeXpaVGcva1VFT3RvTUFFMjdv?=
 =?utf-8?B?MCs5U2xLMDlyYVl1aldEVzI5TnRzb3BLQ0xCQ280MDhoRWtjS01CbXArNkVl?=
 =?utf-8?B?WWNKeUdQVkNvZktSQUdNTVZXT3dQeGNuUkpTZGJYZ1JUTDA4RzBUOEh4NjlW?=
 =?utf-8?B?V2FSblhvV2RqV25sVmV3MTlkQlRQNlgxaXFoeEdWVDNMQW9FRGI1dUtXaHdm?=
 =?utf-8?B?L1V5aVgzZjRtaE1Wam5NUGl5d1BrYWloMzVRRGIwczBuY3AyK0VnZEMwVjZD?=
 =?utf-8?B?S1hlV0VKTGVKbXd3SWlpazRlMXZRL3BQY2RrMTdTWThiTjRMZGR3dTJ0bXoz?=
 =?utf-8?B?WFBVUVpoWXNwUGtGQjIydXYvTEVWWnNSajlob3hnVFBWSDFwSzBMOWZtTjRD?=
 =?utf-8?B?RDFMTDlSTXFRZTZlby9PYVRESXNRL3pPVFRNNGlUN1BhQkZmZUZ4cDBSb01Z?=
 =?utf-8?B?bWYrbDEvaVFiY2lET1VUak5oU3hDMktFQ3N6dW9qU2d5cGx0MXBZc1BRU2JG?=
 =?utf-8?B?WS93QlV1ZklDZUpsSVF2RUxwMUJDVGtoWFVqWm8zbmRUR2lRQlNXWVA4NXpx?=
 =?utf-8?B?UlpxYm5QU1BLc1RuU3FKVURZMlMvNWRQUm1KZ21FVVV2UGErZzVTcSttUVhK?=
 =?utf-8?B?R0ZhalBXZDJPc3hhM2l0NHZ5aWhmRkg1V0szb1dzNTZvWUI5VStUZVN5WkFC?=
 =?utf-8?B?UWZyQlJDWDRKRHAwOWpCaUtJTFJqSkJodXUyTkJqaU9Dd21RT1F3NzRCbnky?=
 =?utf-8?B?aTVkYU1IYi9WZnVWQUthL0VJb01oVlF1M2g0RjZtYlFET2ljMS84bUNRU3E4?=
 =?utf-8?B?TE9MMjV6blh2THdIQ1lsQnFFVWNsdVBabERIVXVFTi9oUHo2UHRFWjMyTHdx?=
 =?utf-8?B?cFBFTlRnR3ZOWVUrNTdya01lMjlybU9waUdRSzllcjQ4SWN6YVNKTWVacDB0?=
 =?utf-8?B?YTNySWVnS3NhdnBaRVcrZlNYZXdIdzJRYzZER0dudnh1VXo2OFd2UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 428d8d89-c57e-4949-817b-08df3f968a54
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 01:53:11.1940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uuL6ZqWMU0WXqW/Y6Orh++I79/1rTT1wEjxvhyxDhknIEU8GOy+syhf/ktdvrczKkoRXLbolPyypuVEVDx7M1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5853

On 11/11/26 07:09, fixca wrote:
> [You don't often get email from jaehoon1744@dankook.ac.kr. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> The 2026 LG gram 16 with AMD Ryzen AI 400 (16Z95U, ACP rev 0x72,
> PCI SSID 1854:056c) has no internal audio on mainline: no sound card is
> created. The same generation 15Z95U has been reported with identical
> symptoms (https://github.com/CachyOS/distribution/issues/516).
>
> These two patches create the card. With them, headphone playback and
> internal microphone capture work. Speaker playback through the RT1320
> is still silent, and I would appreciate advice on that part (details
> below). I am sending the series as RFC for that reason.
>
> Changes in v2:
>  - Rebased onto broonie/sound for-next; v1 was against v7.2.14 and did
>    not apply. No functional change.
>  - Patch 2: use a dedicated rt713 jack + DMIC endpoint array; the new
>    jack_dmic_endpoints maps the DMIC to endpoint #2 (rt721), whereas
>    the rt713 SmartMic DAI is endpoint #1.
>  - Cover letter: added what the Windows driver loads for the RT1320.
>
> Hardware, from the ACPI tables (ACP node \_SB.PCI0.GPPA.ACP):
>
>   acp-audio-config-flag = 0x10 (FLAG_AMD_LEGACY_ONLY_DMIC)
>   SDWC (_ADR 5): mipi-sdw-manager-list = 0x3
>     link 0: SW36 _ADR 0x000030025D071301  RT713
>             SDCA functions: UAJ (type 6) at 0x1, SmartMic (type 3) at 0x2
>     link 1: SW23 _ADR 0x000131025D132001  RT1320
>             SDCA function: SmartAmp (type 1) at 0x4
>
> Patch 1 adds the machine to acp70_acpi_flag_override_table. Without it
> snd_pci_ps returns -ENODEV because of the BIOS flag, snd_acp_pci binds
> and reports "No matching ASoC machine driver found".
>
> Patch 2 adds rt713 (link 0) + rt1320 (link 1, unique ID 1) entries to
> snd_soc_acpi_amd_acp70_sdw_machines[].
>
> Result with both patches (tested on 7.2.14, Arch Linux,
> alsa-ucm-conf 1.2.16.1):
>
>   card: amd-soundwire, components " cfg-amp:1 hs:rt713-sdca mic:rt713 spk:rt1320"
>   SDW0-PIN0-PLAYBACK-SimpleJack  rt712-sdca-aif1   works
>   SDW0-PIN3-CAPTURE-SimpleJack   rt712-sdca-aif1   not tested
>   SDW0-PIN5-CAPTURE-SmartMic     rt712-sdca-aif3   works
>   SDW1-PIN1-PLAYBACK-SmartAmp    rt1320-aif1       silent
>
> Open problem: RT1320 speaker output is silent
>
> The playback stream starts and runs without any error:
>
>   rt1320-sdca sdw:0:1:025d:1320:01: rt1320_io_init amp func_status=0x41
>   rt1320-sdca sdw:0:1:025d:1320:01: rt1320_vc_preset, RT1320_KR0_INT_READY=0x1f
>   rt1320-sdca sdw:0:1:025d:1320:01: rt1320_io_init version_id=2, dev_id=0x6981
>   rt1320-sdca sdw:0:1:025d:1320:01: rt1320_io_init hw_init complete
>   ...
>   soundwire sdw-master-0-1: Port=1 hstart=1 hstop=9 port_bo=65 slots=32 max_ports=6
>   rt1320-sdca sdw:0:1:025d:1320:01: rt1320_sdw_hw_params rt1320-aif1
>
> What I checked:
>
>  - Mixer: "Speaker Switch" on, "rt1320-1 OT23 L/R Switch" on,
>    "rt1320-1 FU21 Playback Volume" 87 (0 dB), "RX Channel Select" L,R.
>  - Direct ALSA playback (speaker-test -D plughw:amdsoundwire,2) and
>    playback through PipeWire both run to completion with no sound.
>  - Runtime PM: forcing power/control=on for the RT1320, so io_init runs
>    only once at boot, does not change the result.
>  - rt1320-patch-code-vc.bin is installed and loads without error.
>  - No DSP firmware is loaded: there is no "realtek,dspfw-name" property,
>    and linux-firmware has no realtek/rt1320/rt1320_<vendor>_<product>_<sku>.dat
>    or rt1320_RAE_<vendor>_<product>_<sku>.dat for this machine.
>
> On Windows, Realtek's SDCA XU extension driver (RtkSdcaXuLG.inf,
> 10.0.297.1) binds to this amplifier:
>
>   SOUNDWIRE\SDCA_10&MAN_025D&FUNC_1320&TYPE_01&VER_01&ADR_04&LID_01&UID_01&SUBSYS_056C1854
>
> It ships RTKDAT_1854.dat and RTKDAT_GENERAL.dat and references per-SSID
> ALC1320 DSP firmware / preset files (ALC1320\FWFiles.txt,
> FWFiles_LG_1854_*.txt, alc1320fw_preset_*\alc1320_afx1_*.dat.bin,
> RAE_XU). So on Windows a DSP firmware and RAE preset are loaded for this
> amplifier, while on Linux none is.
>
> In addition, the ACPI SmartAmp function carries a 5627-entry
> "mipi-sdca-function-initialization-table" that differs from
> rt1320_vc_blind_write[] in a number of registers (full list was attached
> to v1), for example:
>
>   register   ACPI   driver
>   0xc900     0xd0   0x73
>   0xc901     0x09   0x04
>   0xd471     0xba   0x3a
>   0xd479     0x40   0x20
>   0xdb08     0xe7   0x7a
>
> Questions:
>
>  1. Shuming: is the missing DSP firmware / RAE preset the reason the
>     amplifier stays silent on this design? If so, could Realtek provide
>     RT1320 DSP and RAE files for the LG gram 16Z95U (SSID 1854:056c) to
>     linux-firmware? I can test them.
>  2. Vijendar: is SDW1 / ACP70_SW_AUDIO1_TX the right pin for an
>     amplifier on link 1 with ACP rev 0x72, as used by the existing
>     rt722 (link 0) + rt1320 (link 1) entry?
Yes, Speaker endpoint should use AUDIO1_TX pin.
>
> I can provide the full acpidump, dmesg and alsa-info output.
>
> Disclosure: the analysis and both patches were prepared with the help of
> an AI assistant (Claude); I built and tested them on the hardware.
>
> Thanks,
> Jaehoon Kim
>
> body content if you don't wish to send a summary.
> From: fixca <jaehoon1744@gmail.com>
> To: broonie@kernel.org,Vijendar.Mukunda@amd.com,shumingf@realtek.com
> Cc: linux-sound@vger.kernel.org,linux-kernel@vger.kernel.org
> Bcc:
> Reply-To:
> Subject: [PATCH RFC v2 0/2] ASoC: amd: SoundWire audio for LG gram 16Z95U (rt713 + rt1320), speaker still silent
> In-Reply-To:

