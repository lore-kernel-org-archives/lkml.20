Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794362078;
	b=SzNZcdGJZ67m+/5kUD3dMsEC4YUhyAg4lpcdzO5KXAOOONsYMgVUWZVD6nKFUtXYIK4D
	 +j7Rn0/Dq38Qhm70GihM/SBECH+a95EdBobumSZs+wlvkKVzBHqpi51WxOaePFnyYmGzP
	 B4r2GiFbxm6RCaTy0kYSdcPCA5oij/PbfM1AHfVYxr0s4blWiO1sGgKKE8NoGfJvr5LxS
	 mHvwuR26NUwstDaFTeG9bqmjjtUo2YipSVfwczZFl75IkXq7Kx3Ign3dECLSMS6j6sE7N
	 rwnu1PNd9VW0Retj8XuFm+GGVZFdnfKqEs9XEvbnwt8Om5kZ2EgkOCAh2dV6KhDlsNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362078;
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
	bh=xu7FU7R8sIuiC6+a8D2Sdx1InNm0Y7C87Ep38COM5oQ=;
	b=5bY3Pz1fGRJ+LL39TV5eLWEQm+IP2eUxk2JVxHuGpYLPQMa2Y2UlSaVOP31VU5yt5T+a
	 nXvDpKPG9SZX/OD3NE7TPlgD2LUvqChMzCXmMxPdLN2Q62P6jsX9Kz530BzzWpqeQcYKu
	 ZOdJAqbGR9yQq6T//PYIrQuT0TNDMZ/yk/ZP3RxuXoE/YWiS7WgtDtzzPPYt8EYJt7JvY
	 Mqc51EaULDxPo7vIlr2zQaSG0uwfMySpNHZAH9r3cthz5hhFg0CIgI++jk6B/DsSnxJTO
	 QQC8HfWdswVTzlkIhkuiObn3hRx61Cfg/iZhd1uDinRdc8SVNIKQJOhMwxCGi94dzKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=z5Cz9V9C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.53
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012053.outbound.protection.outlook.com [52.101.43.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FF0606A31C;
	Wed, 11 Nov 2026 01:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5FF0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=z5Cz9V9C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwIZvJnIU/3IeFy9scemFAj1s5LkLswHSOioiJxeZNUo3pp5sewuFouaDTSFhYEQAIyF95IgPmTcw8QSE6vg2x/4Jus5qNJSRmYAa0CKt3rLisqD+8ynJZiRy9vIWZJidSXEWGUwBRj13/NyNFpHfJws5tXlP6jyGrq4tQ+iEfVArA4MgsJEASWIhXXh7ZcRmXQvKvZZRLAkRX8aZhPo/TXpuGP7IVQAkTQ2Kdv9RvEkMx944/GZcyicHjT6OFLi+tjJdMibxjJ2maF4082JFeATmNcdE3QV/KQ/WthsdZNFEoNR5l1IOEZ88V0iwUidfgoeg8w8h1BSwtepR4SMiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xu7FU7R8sIuiC6+a8D2Sdx1InNm0Y7C87Ep38COM5oQ=;
 b=YZhcHdEic3Fc9P4p67odJPJM7yIMkMkLtYp3wYKh1xQarGD8FKK0MOYdQB5dNnrMLoI5uqAtenpudKBsnRvWKLs7vPaHNdXyBEkfKrLXNJcRsE5yD0hxVYiSO+WBkr4JKV5UFQpl3VR8o3yzL2CwcEsqGlGYHZus5rsAoal5UZeOlyBSRvE6U3KSd9pFD7+bo+dWgiUWenDH4+YCz1A91pJQhcwOt8YsPUh/OFdOqonjQ5ETjMvPj6nYp1WCFHgj6G5WkI4iD21mOeDhm4fXLh1Z+qBa6ohaFEjxqjAQbpC+s5QWREBa2I/vBQOS+p5w6mptJoqpDqQR0x5B7CRwvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xu7FU7R8sIuiC6+a8D2Sdx1InNm0Y7C87Ep38COM5oQ=;
 b=z5Cz9V9CfBo+zqM1czF2/55J3j7ohLQ77IQ6b74F1s9PfKbDETFU+V/6cK9SeyVo+iULkAzuvCiuZ/lwsJHguVix4K4/WrOSc0CgxyhyxMIdF4UtB/165Y+53SVNm7kXUjJkVVpkdHUKh6hf5iFfqn4ooDpk1ZezfUbSzCnK7L4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by PH7PR12MB5853.namprd12.prod.outlook.com (2603:10b6:510:1d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 01:54:34 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0592.012; Wed, 11 Nov 2026
 01:54:34 +0000
Message-ID: <dba2a6d6-ab00-4c7e-be70-f0ef02ec72cb@amd.com>
Date: Wed, 11 Nov 2026 07:27:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/2] ASoC: amd: acp: Add ACP70 ACPI flag override
 for LG gram 16Z95U
Content-Language: en-US
To: fixca <jaehoon1744@dankook.ac.kr>, broonie@kernel.org,
 shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Claude Opus 5.5" <noreply@anthropic.com>
References: <20261111013953.4011-1-jaehoon1744@gmail.com>
 <20261111013953.4011-2-jaehoon1744@gmail.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20261111013953.4011-2-jaehoon1744@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN5P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:265::8) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 22dc5ab3-23e5-498d-364b-08df3f96bc37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|261009223027099003|10067099003|3023799007|261022105027099003|261026140227099003|261026121527099003|261022075727099003|261021135927099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|11063799006|56012099006|6123799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8QhCl8o+h6AoOOnR29TVbdaEcmkzyVnb439gh0TcmDLe9G/cRO3arY5HVwDk9ilkxKUYt8V1aivF9Kutg1I4wwyJjopLtVxgU56AK+eopcc90zqngwGikrljhIphqfatzZk1cykVZ1og4jcxJcKzxJ5jb8PdX/O39WPOOnG91CWCxoxJLE4xanVAnC6KLxBk5ImHAWhOIMwp7gJPr0e7q8K3zif+D30uqijn6Ey9Ot6q+InPravA7Xgqh3shUfVjGFgSMd3gzmehdHNyhUAbIjzYP0wd8Oz12xAVvhUeG+wlBK60egLKa9t85gh8ludEfoKHYEvebU80ZsRJpQEwKnVb8e0kPnPMTuk72lXs1FLGOpONcr3iX8nvv2tIbiSclxMe0QmtjP6yf+86YrumbsNiwYKKZ2GO4bUamY+ZZDCUjIpkto7riU8ARzGuW4aqdN/grzDSPjayMzOfMrIgvSr+BQ5le4SOsOsFERU/a3ssTiL2tgNECi+RceX+BpWQ7JlcRh+9fYSYnJcsiPJM8WQFUe9wl6v00qnZYU42teMDXjFe9Q+UE/pMHNAZmCnHovZ5qc4WE+p5dfKNMcCkMBvUlMykvjP8KkS9k0vsS5K5Pi6wV6Mdqvmyk9SiYtxbHvsYtj+GYvuwY0T8n7PqLUcowmX8nr8sCPupUdoQFt4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(261009223027099003)(10067099003)(3023799007)(261022105027099003)(261026140227099003)(261026121527099003)(261022075727099003)(261021135927099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(6123799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlJVTzIyVFE0ZkNmYXRoYXBLSXlaVXRNNVllTUU1N3RwZXdTdU5pWGdaWWJ1?=
 =?utf-8?B?bUk4RHMzWTJsc2NwMkk5dTE5TkwvWGNJLzd2TmYyT0E1dEQvbFpzMkNFa1lN?=
 =?utf-8?B?STE4cHlpbTI0VE4zckwyeHhobzdPSUxxejh2amt5Y1NBc1JvNHVlRnRhZ3lt?=
 =?utf-8?B?R2JjdVVrMlBHVml5M0dCZ05oSmxOQVRjL3MvSjFWTm05N1dRalgvSDVPOVh2?=
 =?utf-8?B?Q05WckkvY1B1QlluYkdMTEZTUUxjUVhFakNMVnRsZGNpZVdaUzJKZ0kvUTdx?=
 =?utf-8?B?ZDJLcFRwWExRV0xCSlRDWDRQV0JJelZlK1hVVFM0MURHd1FjVEFFSjVNTTFZ?=
 =?utf-8?B?RnZaVmlYbTJidWdpeUE1NnFvbGZ2cUFpMjI5UWhaUWxGdDNrWEN5UUt6S0hN?=
 =?utf-8?B?S3RjZUZTbWYyelpKdUVlenB5Qk14NXd1UVdJVjFocCtrMnhJejZSUGdadHNp?=
 =?utf-8?B?ZW9JL28rWDBTUkVNcUExYjBaejBlZEpGdXhwUHZ4VC9tRDAweitDN292QUd4?=
 =?utf-8?B?dEl5YndKL3BsbnRhOEd1ellQSmpIQ0pJTjQ5RFlYdnd0ZDQzckRyR2JVSjNO?=
 =?utf-8?B?eWdRQ0VtSnpnYUlFaXgzRG4zdGtOWWUwUEMxVTNRc2pQaE1YNzVlLzhVNmZ5?=
 =?utf-8?B?V2QzeHZzOGI1YlRqQzc4WnJrK3ZSaVpmU0wvY05QNnNIYjJaRUlrVW5tdmlw?=
 =?utf-8?B?dCtQa250Q2dOOE95UUE3RXd4Y3RyZGw1ZlZiaDFXb2Q4YzNrSmFqeTJzSzE0?=
 =?utf-8?B?eW84Rmo2MzJZYVdPbThyQzdOUlY3SWl2SHhZZllpaWZ0UTJUcG90RS81Q0Zv?=
 =?utf-8?B?SmZYSndLLzBRZ0tDcjBJU3l0UzIybW1VZnlCc2xPT0MvVUp5UFZ0dE8zT2lo?=
 =?utf-8?B?c2dmUENsbUh1WFQyd2Z6MVVScTlUSTd2cWZwTk1sT0RKaHAwUU55S2VuZTda?=
 =?utf-8?B?T1l5L3E4c1l5Qm1VeWZtY0hRR1M4d1NUdGRkVTZhUEJoczlESFYwVUdwelFs?=
 =?utf-8?B?WUExWUpPYmxYU3VSVmJ6dVdxZFQrWUtOSzUrc0M3Rml0K2NJd0J5aXlKcHdO?=
 =?utf-8?B?VG1IYlNveTFqbzdqdlRjUDQxc0xjNjl6dm5sTzlFWTBPSGs5NkdodlQ4ME51?=
 =?utf-8?B?L0QyRWNvbk1ub1Z3QnFtQlhnQm1CcWppVWxYZGxKNjVnTjFkdVdaT3Y0K1M0?=
 =?utf-8?B?cmNCRUpTODllK2M3VDhMMEp6Vk43UzhMZHRvZXY0eGczWDRQcStsNTNxMVBv?=
 =?utf-8?B?VFhHWEd2WFFDYWhvL002dVZ0TWpiWHpzUGNNNHcyakl6RVVIcTNXNFZOZjB2?=
 =?utf-8?B?RDVGaXY2dlg5c0ttbzlKaHpMODdQMUl1ZlB4L3plRlppeTVJQWxrWnhiS2wv?=
 =?utf-8?B?TTRVNk9SVTE3N1RjckEzZUpnaG9BSUJUMGZtbFpXUGx3SXZXcWZpblc4SW1O?=
 =?utf-8?B?cXZsV2tJamlRNE1MR0lvcWNQMzIyUE9mQUV5ZFlYaTVWc2liWmdoa2tLMHZu?=
 =?utf-8?B?TkRTdndTUkQvbXFyenFFbUU5WmNHbUVBdHRYTmhNbnh6UHFGMzZ0OHRidHFn?=
 =?utf-8?B?ekRVY1pyV0FhT0xBNE13c2FqVHlCOXNqR2JWcmpja2RLVW9RUnMyMUp0Yk1N?=
 =?utf-8?B?QkxhcGV0ZWlUR0I1Y0orYVRXZXZpeGNxdDBiT2hvOElBZ0VzcytYU20zaGhO?=
 =?utf-8?B?UG9ETDJpVzBpRUFPeEp5clQ1TXU3ZGpYMDhKZmpaWmdFUC85QjZpVFRYQmph?=
 =?utf-8?B?SHpBTk5qc2VaM2xsNXhlS3ZlclNmdnR5OXQvZ01jTEZkVk9OK2dmRnJ0b3dR?=
 =?utf-8?B?anczZWx0RVhTeU9xWlJKZEtwcFdVZEhlNjl2MTNBUjlhMHZCRkZKNGt2T01Q?=
 =?utf-8?B?NEFZeFQ0RHBTWlcvakhLN0R2d3RIdVJDbnh4bnZzSzNCaW14Ym9ubG9aM212?=
 =?utf-8?B?V0pudVpWZ2FXOUpENEh0VU9sOCs2UUZTT0t4NmlMZnc5M2hGeERqYUpmVnBK?=
 =?utf-8?B?Rk1lN0tDRitTZHpNSnhwMU1hTFlwZHhCQlIwK0RHUVloZisyVkFLUGkxVE5Q?=
 =?utf-8?B?aTNZL0hUbHc4MFQwSUcwdGgyS25QU0ExcWhuRitkQnh6TDVyamtaVDVPdG0z?=
 =?utf-8?B?YWw2WURoMTNkZTRSNGttOERaQ28vZWdrWDJVM1F1cGR1ZzIrYnBFODJPQlVo?=
 =?utf-8?B?QlBjNGdFZWdFcE05NzNUZTd5MzRGYUxiQ2loaEYxaGM5UTdSYVZ1c0pjUnJG?=
 =?utf-8?B?NG15a0pnZUgzQ1RnQjB3amt2UmowYW1lV2FBa21BUkhTWWloLzJkQnNKdWYr?=
 =?utf-8?B?RHI1V0RrRTFJcU9Pd09DaHJGdTZ6VFl5SEZvakFWOU0yZWJNOTU1Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22dc5ab3-23e5-498d-364b-08df3f96bc37
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 01:54:34.8653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 86ba1mdar9kPSTqOICbvkUuorENouJlQKqhzyoxlL8/SdIE8mMA5L+Uu4XmzRreVQZ5c0UWMudY99DzPftlpTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5853

On 11/11/26 07:09, fixca wrote:
> [You don't often get email from jaehoon1744@dankook.ac.kr. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Jaehoon Kim  <jaehoon1744@dankook.ac.kr>
>
> The LG gram 16 (16Z95U, AMD Ryzen AI 400 series, ACP rev 0x72) BIOS
> sets "acp-audio-config-flag" to 0x10 (FLAG_AMD_LEGACY_ONLY_DMIC), but
> the machine has no ACP PDM microphone. All audio endpoints are
> SoundWire peripherals declared under the ACP SoundWire controller:
>
>   link 0: RT713 (UAJ + SmartMic functions), _ADR 0x000030025D071301
>   link 1: RT1320 (SmartAmp function),      _ADR 0x000131025D132001
>
> With the flag honoured, snd_pci_ps bails out with -ENODEV, the legacy
> snd_acp_pci driver binds instead and fails with:
>
>   platform acp_asoc_acp70.0: warning: No matching ASoC machine driver found
>
> so no sound card is created at all.
>
> Add the machine to acp70_acpi_flag_override_table so that the
> SoundWire path is used.
>
> Tested on LG gram 16Z95U-GS59K (PCI SSID 1854:056c): with this change
> snd_pci_ps binds and both peripherals enumerate
> (sdw:0:0:025d:0713:01, sdw:0:1:025d:1320:01).
>
> Signed-off-by: Jaehoon Kim <jaehoon1744@dankook.ac.kr>
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>

Reviwed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
> v2: rebased onto broonie/sound for-next (v1 did not apply).
>  sound/soc/amd/acp-config.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
> index 3d4c852..febf559 100644
> --- a/sound/soc/amd/acp-config.c
> +++ b/sound/soc/amd/acp-config.c
> @@ -140,6 +140,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "Dell 14S DS14265"),
>                 },
>         },
> +       {
> +               /* LG gram 16 16Z95U (ACP 7.2) */
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
> +               },
> +       },
>         {}
>  };
>
> --
> 2.43.0

