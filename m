Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793858171;
	b=OEyMUowyoNxwhX4q0epMzMD982dq4vnbCrCMPlAmaVdB6d3lJpBtNT2i6xC/2VDNNpNf
	 XECrE2BGUWhfNpHbA0FWbDNGrNjMKDFs8FOXjOtchrLEYthRB4UIWv8vdvUfHYv2mQTWY
	 5YE3V4zPy7HlEYYPL/B/nNfO0h3o24nMP6rNWefneOqhr92G6QoifNZW8IK4Ev0V05/H+
	 9p75y090sjWOUAOkqXm9k3xujajnCeceJWujtAww/jqNLd5UgaKiM7Kwxs0OAUJHbakLN
	 HKzTwk7YBbysa6GXPJuu47yoaA4JTCjhCBzJ3LW1Gd/vxW9YlCI54q396pzP2tAHO8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793858171;
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
	bh=kk8HXCyvZOEbGZyMeQ28e9QBBae7tq1PQfQmi7TskcU=;
	b=c6nlKKip1LMKF6OP2R94kMdXIUXLY3lLxIDnTUorYxB6ShEG5jTDTPLLljKLz7KwdMxE
	 o9Jtha2QmZXymmkxuq5fw9MM2ulGJKZKqVYf8Y92jvOpjy94yVGjV7Tx0NeC+SKz2SuNp
	 quIrAn9cgXEDKjZjAnyEYfylgWn2dUoiPcsoMTbNldnLZj9xWK2Pu81ASV+I1P6UmjkJt
	 /3XiBn1gu2ULVLMtAKKw9VxwPbckPIUxxnenp3NmBlq/QNwiNrFrDRDkkSIhepgOfcZ8X
	 mX9A/0oHeEafEXWjL0wMfb2W8RSC7A6Ds0YQlFLOySjT0q7b2fRYebZefo1FZhMbdMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=STVIo6Ug;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.14
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010014.outbound.protection.outlook.com [52.101.85.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459A2606A31B;
	Thu,  5 Nov 2026 05:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 459A2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=STVIo6Ug
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eilzNNd4duOLfGqgg0QFJLfczlk26SwA6roTO4tuUbvXrMEBiJChj/EfzTtsrm1c2g5Wr87ScAHO3eZdBd0SVshy08NKVNGv6ThQVFcTWQY2U7lvKPP35K2Q8ljjr6mkOuWoySKTUL4xUFhIJyLWOncHBnyoVJNJOa/RS0F7jAvFsbxt9JxHV3/zEhUQ4aJxbQMraMGq9xTi2504nnNnSAxBYi41Q4kCTg0O40w9qR0qjpkNl62XSuSkidLqhyqAKFwi9bW5MaAiqJmayJMcttCZbdawkl2ppuQKo2CzAHPbPs6eKLVyd8MTOH4IXeLyH/+/Im0dTZCblfkkFR7OGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kk8HXCyvZOEbGZyMeQ28e9QBBae7tq1PQfQmi7TskcU=;
 b=lbasptUSl4RNK/5YxZSdPlFOsLRaxowBSniKMIAJkwunfX9gbEw84WU+uJYOtMHU3STpbl8kcS8KQ7kMsn1NWuS3pimjweLn0LVnatW5s2CmLODiP8MZN2ldhZZRzT+1zo/wakha1hwYYtG5z9NEjQYybmPILIuch/8FO9LFclMfpnbnHAiKV3wt9cUO2nGnLE5hVR7qRwQ8RDoBOfyhiCWwVf818TE6To/YoM/NLgggtDAqHKZ19vioUO+9IscqvAFeMTzER2bWjQjK+8bo8x+Pmzo6zrfG3Dlq1BV5u2MJSQuVTQELzXeMvvyWhZR+kSzr0oVr7WAkoHF2siUCKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kk8HXCyvZOEbGZyMeQ28e9QBBae7tq1PQfQmi7TskcU=;
 b=STVIo6UgZkX9MUac4qoETLT62ZNZ07sfgtk6J4khkJCkyRNqZA6plas00RI3Ow07lUWrZSlEeroYgML0D3zZs5vLpWPW2/54cNqxzIlYHxwoz+xeA/Mi3T5F3yDmDxfPxOJg6w9WmqyClM3xazXDHYv3uqEhYw4ZT97CprpHQZc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by BL1PR12MB5780.namprd12.prod.outlook.com (2603:10b6:208:393::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 05:56:07 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 05:56:07 +0000
Message-ID: <8bf1a5de-0f7d-4db9-b607-d44979fdbb4f@amd.com>
Date: Thu, 5 Nov 2026 11:28:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for ASUS TUF Gaming A16
 FA607NUQ
Content-Language: en-US
To: Zhang Heng <zhangheng@kylinos.cn>, venkataprasad.potturu@amd.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <20261105015428.54091-1-zhangheng@kylinos.cn>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20261105015428.54091-1-zhangheng@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::11) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|BL1PR12MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bc15b86-85c1-4983-80bd-08df3b017bf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|18002099003|22082099003|3023799007|261022105027099003|11063799006|261102123227099003|261022075727099003|261026140227099003|261026121527099003|261021123027099003|261021121427099003|261009223027099003|56012099006|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	J4Zwek7ZwHi3VP9/SgXs0KVIXrxTr7leIe0u9JT/gtC2Kyv+2PXyjVVLKkXTQ48TbJI2aAW1SOjoOxpITklEBBHheYWacdoxxYmDJqxYFJTIA4h2bkX/eqRuch/LoE/TOPit63CJRRwiC13d84jKp+XKUXf4Vn7p2YpqyLnGagOypHHNeAHize5Usac6vxzsa4m591XXvtqKK3LjJnSaU0yp29ui02d7q4kQ2mXKVcI0Ur1RK89mYaajVLjOag0n6tNOkyWP7xV57RN6phVoOinTe773Izh0tk4MEF9f4hftxo9OhSTLb0VUKQZaTrsmX5Z6LFsLCF/Zy9GCw43TTa9Jjko98n3sjM1EmFTD1vqTMd18welkva7GOUKwpPYNYFovwjk//ldpfSyDE/oeaVOR13LVefJ0EQsrpNvzwMEYuEfFE7Rx+0a6wqvjpl3FGwKFtYFQLC5fCLdXc2bFhaRdIh4rmQVyN3ZVYWSBnFnmLD2H7YRucXVkgSg4F6nPaLj6FenKdA+unr0sSul/GoMvKrPV6oIrFSeyxEHBudMdw9DpfrydBmXRjQVdSmXh84GgOio82NLyo8hliPb3MsQllG9cIDklXlQk13XHs2ljrPhokACHKUTxUKJN3z4z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(18002099003)(22082099003)(3023799007)(261022105027099003)(11063799006)(261102123227099003)(261022075727099003)(261026140227099003)(261026121527099003)(261021123027099003)(261021121427099003)(261009223027099003)(56012099006)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjJrYk8ySzh4S0dQVVUxdjJBTzJKRXVrNE9sRHJrVTNVNm9yWFk5c1ZhTGVh?=
 =?utf-8?B?ZksxamRYS0tCQXNEdSttd2ZVZDhtUC9QalVCZ3hhdEdSeExwM3NFZjUrNW9n?=
 =?utf-8?B?VnQwSTI1NFZ6M0pjSVR6R3ZnZUFoK2hoWldVclk1eHUwTnppVGpBTnBCWUNW?=
 =?utf-8?B?eDZkRW4ybzJiNnlSWXRUODZzdkhNUVZHMXVCRm9IeGhPTmdWQnNUajNZVkJF?=
 =?utf-8?B?QnBqVFRjdUJjNzN0NFBOWk9ydlNTWTZhdnA0bUlLYnZSTlkzdUlYaitzQ0M1?=
 =?utf-8?B?TDdWNThxYS8xQUlhVzNHeGRkcHg3dytZcVRzRWNYcTM2dGhxRXY3MzNHUEts?=
 =?utf-8?B?Z2FKVUtwd2d0UG54NXdXellRNEN0T2cxcjdvbDhMNkpnMTczL0t2ZzdHbHM5?=
 =?utf-8?B?aXBiRFJMTlRmN2dJcENMcXExY21FRFZ4V0ZuNGhuZytuSDJhbGpnQzZ1S3Jz?=
 =?utf-8?B?eGVTT2tMcDFuUTFjek51RDlicFlUcW1kSUk4SzdDUklnVEZoSlhKakliTTFE?=
 =?utf-8?B?Ti9IOGhrL3J4VUNCUFFWWnpTTjV3ZUtDQy84L0pZUTV3QTdFUWtyVmNEN0Iw?=
 =?utf-8?B?cmxoNU1aS1dzMEJ3OHJVN1IxZk5HdU5rK2RvYTB1VGh3RU91Rm1ZNE9SMGVD?=
 =?utf-8?B?c2VnS2krcFNQM1U3VHFiMXVYZGZaWDg1Q3J5VWF5eUxZdXRtU3NOZlJYcDlo?=
 =?utf-8?B?QjNyeWM0ZnpMOCttRUw5QWg4OVFLU3hZdWh1UGMvRWpkcWlac1hBTDFkUnM3?=
 =?utf-8?B?ZjRYeGNQMFNoUFlmM3FHMmEybUhpYkcycXoxZy9GV1p6VnZ5OWNQb3RjSS9l?=
 =?utf-8?B?czIyYkpTNC84eDQ5eC9QTDN5aktSQ3llblB5VzNBempkRUJJWGxrU3VmY1lr?=
 =?utf-8?B?eklSaGd2ajFzWHJjVENaQXZlTTRpSkJQZUFicXhxNWxDWnJjSWorTEhNYWxQ?=
 =?utf-8?B?b3VXc0ZvUTNMakFSMGVmTDZpS3pUTzhrYXNqczBPWTUzaTQ0TEFWVnVQdisy?=
 =?utf-8?B?bWd0ZWFFaFJOVStybW5iT1hhYWd5cGs1OW1PNmVpeklJTzRUQjc1Q2VvcUlE?=
 =?utf-8?B?b05EalIzL1JCN0hDZCtKVFFGYkZTOXRGZTlKY0RmaFhtYnBrUFB1ZGVBUXRF?=
 =?utf-8?B?dkEwdEQrV05vMmEwOVVaNFVIVTlhOTgxd2luS242UEZDQkZVZlRTS2R3MERB?=
 =?utf-8?B?UjRWZm5MMDE3NFZaaVBkQUVGeGRueWx5cG5BbEt5WVBDVHRkcTJwSDhWQWdl?=
 =?utf-8?B?UUFZS3k2MmVHc0R3ZHI2NUM5dzZubkRyN1dickVwNjNoVlhxZExRR3ZlblpX?=
 =?utf-8?B?Y0VZYUR5bS9kSTdGNFJReFgvR3lsR3BKU0VqUzhkWnJmOXRYUnRsZnIxWXh2?=
 =?utf-8?B?WlFsSThLbm15TEpibzg4cGxSRjBRTEpSa2tCUHZFT2RkeGFKc1JCWncvajli?=
 =?utf-8?B?czJ1RXJSeTVuRVk3NTZ1REpvK3FHVitQTk1ObEFBT3FCcjFHSmV4Mnh5dmdG?=
 =?utf-8?B?SGoxTUhrZEk0dVFWc1RMVjIvOEdYTllVcFJaM1YrdCsyeGdySFJyNUllTE9S?=
 =?utf-8?B?VmF6c3NFazV1VVI4cS9ZUnpxWTNnSHZwMDNxVGU4V3ZwV3lUMHdDYWhtaDhy?=
 =?utf-8?B?OXpLT1UrcXhtY0JHa05Bei9yclI5ZG41ayswOEJlUnFTYlVPMWlUYncwNzJj?=
 =?utf-8?B?T3ZDT0xPdC8yeWswSlI1MUMrejF4WnRJY1RYSlpUVVp4YWZRNmxUR3JqMGRw?=
 =?utf-8?B?Yi91TEZuSGJ2VCt5UVB2R3hZQUk1OURqb1hJTWpqMWpzM2JhZERUS21VOVlT?=
 =?utf-8?B?ZGZJaFlqY0EvSEg4MFFwWGM4Rm5tZWJ5YkN5eXBWdTdGdUhrZ0Z3bU1FS2Zy?=
 =?utf-8?B?b0p6dlRjY3N3V1dTSGVOM0JVNFJWQ3VWYXZJdnd4RTJla2pYYk5FZXNRbTRr?=
 =?utf-8?B?clpoR2lGL1d5aEkzaXY2blhlQlk1NStxelRDQVAzZC9OUlB0bkNoa2FKUzdL?=
 =?utf-8?B?eFp6YmpmM2trYW5aU0EvN0t1eTZQZFRKVWVmL0Q4bkVyTGQ0ZVNEY1RsV3pY?=
 =?utf-8?B?aDByUWNQVFBPR2hGd1B1ejhpZ1liaXZPemp3cXE2emlkL1FIZUZaYkVnTTEw?=
 =?utf-8?B?cXVwVmxjNnlqT3ZaNUlsRkd5NStwaTFSVGtuL2trRmN5OXNmSVNzV2RYWEE2?=
 =?utf-8?B?UFRNdlhNVGpreGpHOVUwZWl6aHczQm5oVDc1TGsyMjdnYzBrcnJyVmM4REFx?=
 =?utf-8?B?c0U2cldLUEp4MCtPMmcxejErNmJkcVZ1UGcrTEUzVU8wZUQrSGxGcW5aTmpx?=
 =?utf-8?B?UHc4Q0lwdFlqOEc2aG1MN0ZQMk9SRkFNekFZNTlKdk9GYi90eGtYdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc15b86-85c1-4983-80bd-08df3b017bf0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 05:56:07.3908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UzyVGaE1GHGb6iDa4MAckZuur4K/wDILroeQdm72FTnWmVDfILVzylbjTZSezKT5/fTKMTha+PcgET4YZYENyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5780

On 05/11/26 07:24, Zhang Heng wrote:
> [Some people who received this message don't often get email from zhangheng@kylinos.cn. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> The ASUS TUF Gaming A16 FA607NUQ has an internal DMIC array connected
> to the AMD ACP 6.x PDM interface, but its BIOS does not configure the
> _WOV ACPI method correctly — it returns 0, causing the driver to
> return -ENODEV before the DMI quirk table is consulted.
>
> Not all BIOS implementations report _WOV correctly. The DMI quirk
> table already serves as a fallback for machines with broken ACPI
> values (the _WOV read-failure path already falls through to it).
> Extend the same fallback to the _WOV=0 case so that DMI overrides
> can take effect for machines whose BIOS reports _WOV incorrectly.
>
> Add a DMI entry for the ASUS TUF Gaming A16 FA607NUQ. After applying
> this fix, the internal DMIC is detected and captured from correctly
> on the affected machine.
This patch should be split into two patches:

1. Allow the _WOV=0 case to fall back to the DMI quirk table.
2. Add the DMI quirk for the ASUS TUF Gaming A16 FA607NUQ.
>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222214
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
> ---
>  sound/soc/amd/yc/acp6x-mach.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index 4908f4cc147a..fdeaedcfb178 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -969,6 +969,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "HP 255R 15.6 inch G10 Notebook PC"),
>                 }
>         },
> +       {
> +               .driver_data = &acp6x_card,
> +               .matches = {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "TUF Gaming A16 FA607NUQ"),
> +               }
> +       },
>         {}
>  };
>
> @@ -1000,7 +1007,7 @@ static int acp6x_probe(struct platform_device *pdev)
>         if (!ACPI_FAILURE(ret)) {
>                 wov_en = dmic_status;
>                 if (!wov_en)
> -                       return -ENODEV;
> +                       goto check_dmi_entry;
>         } else {
>                 /* Incase of ACPI method read failure then jump to check_dmi_entry */
>                 goto check_dmi_entry;
> --
> 2.25.1

