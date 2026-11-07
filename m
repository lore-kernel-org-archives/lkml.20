Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794080660;
	b=5UXvNwuOtCGYlBeP3miI4gjngbMemTmSN+uLNaxlG6uIS2DysatMayUoZQBrgwjr4kOD
	 qVxOTB1VWQZYPA3V1uxfyUNXHNaNzeRgvuQ1ZhInZld46ZJJjlxrE5vyNHp+v2LvGlFYB
	 Yz3NioBX/+Ebj8z1vaIRsE3NYELXQDYssHGmM/aISATP3/CQD1QQ3Qa8wlQNVUFEm8Wkb
	 rF4IK2a/z7xCAyN3kARmAp9UrV/uOuao47UWJCSPCkck3EfFq0EqJ4Fd7cFDRHJdSbbOT
	 eW/+waFMRZUFxzFPSn3JKudI2iWYRxRsFaKpP2h0IuBDi2jo8tYhFhyHpJavPSdl9kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794080660;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:From:To:Cc:References:In-Reply-To:
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
	bh=GkZdJhhnvQ949kCOweiAuie7zrTlLqtPKHGSlv4/tY4=;
	b=sbhy/ZCqwY8iB1aJFWiZ1AjLPUxDwIMEbLFqf/w4zdD10WmAzVQVLRhZIXuSrz4rx8Wm
	 vEFnyRGa7LIe6UDe+BVrYT/Gk+d/B28W0R3Gnshe/d9e/wvujn+TB+LJHJUTJjNJ6zLFC
	 auhDr1ok9GgIkgWgf5RU9KjqDrsYm7u9A21NURMg4c828ozUvzPLjlvf/Fd1fT/UtpdTM
	 sNg42b80vnPUs74K04Wlk0zZuCAn3t4KCTiPABmCRGUPVW7FqSTnfvCYHJicRcHtBy11l
	 4JucopqYmDrUH3am+nHyMrBdBNkIhvqvQdVf+l6CXXuxsFVOo56N2ZPYqrfkBavpQrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zYaM0PuP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.70
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011070.outbound.protection.outlook.com [52.101.52.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A100606A326;
	Sat,  7 Nov 2026 19:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A100606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zYaM0PuP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGPzPk7mFwoQXQheEws9NshliGSyb+1NxzgeLL7P43hzi6hQEuadCDL7yAkQ6H78RFz1itNC1DSU5tKVJlRG0/dSTPCl4QYXZaNUKhIMTmlrmiOav+nRrGzTlyyRZc04XhJSGDDWFRwAemor/NEXOOqrwx+sYXjsH0RK7153p1PfAn3ojIH4hYojHzqWrzoM+FP6K6DezGXHaen4X3AB00BugESuadB/g36pQA/9UVyCbYKsIV1Mf+Ql8ayRTvEsWA3jiva+xEWchoAvXV+8iKFes83rDbOZmLMW22K5gziTnVgWO097rNGC49lLsgpalSY+ngdbYo5jR+IHZ+Imsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkZdJhhnvQ949kCOweiAuie7zrTlLqtPKHGSlv4/tY4=;
 b=ZIro82NCWXLi7lMqXjaIjTUE8NBm2EL/IA2MLt1cgZgAhyqFU8Vnokivnhp0Hjo3DCBYe7mFw5LTMqFd/U+dzIMd6fhTvajKzGdx1NJvdR6XYFkoRFcZws+3vAEj7xSKsChEwpCHoYyiARP1X+3c6xV9gm4ekjFyTvYNs4BzSkQoZB3Enaouiu8D8O436B5HmYTNGBHMOSDmsGQpB8WQDY1sQQgzpMfITgFRLbgv/lNvAoKwUi3gAflh6vT2L57tQ0HLJQ17g5Y5UMBkYwdX4iCAvcGs80yx04i0fx72K8gRVzONa55gWGTbXcnD5PfIOays6mxeFf4Uy4gO8Paelw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkZdJhhnvQ949kCOweiAuie7zrTlLqtPKHGSlv4/tY4=;
 b=zYaM0PuPiVgYcwpCdY049yHxqe5Madc/tJz8oe+R51vkNJNPINJ0mzqMIne4LAUCFb9pp5X3BE1nekE1WYGHIdvRLyeSuysesrrTDdbrksey5REaEwyBZf9uzFE95s3CubZ1VH7Ah6mRm2Bp1DnvoGU5DjcidDDUSaLMzu2+KLU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by MN2PR12MB4253.namprd12.prod.outlook.com (2603:10b6:208:1de::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 19:44:16 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0592.009; Sat, 7 Nov 2026
 19:44:16 +0000
Message-ID: <e670da04-fa7d-4c7f-a766-00bbf5c4db84@amd.com>
Date: Sun, 8 Nov 2026 01:16:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ASoC: amd: fix IRQ handler races in AMD SoundWire
 drivers
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
To: broonie@kernel.org, vinod.koul@intel.com
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yung-chuan.liao@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
 Mario.Limonciello@amd.com, Richard.Gong@amd.com, Poojitha.N@amd.com,
 lee@kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
References: <20261107175339.3547918-1-Vijendar.Mukunda@amd.com>
 <f2f294f0-55bd-482f-9b47-fdc9f506fe53@amd.com>
In-Reply-To: <f2f294f0-55bd-482f-9b47-fdc9f506fe53@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:279::7) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|MN2PR12MB4253:EE_
X-MS-Office365-Filtering-Correlation-Id: c83b5f9c-32c2-48a9-389f-08df3d0781c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|18002099003|22082099003|10067099003|4143699003|261026140227099003|11063799006|261022075727099003|261028144727099003|261102123227099003|261026121527099003|261022105027099003|261021121427099003|56012099006|261009223027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	Z4dilWFQ4cB+DGtBIu9X+VUT9ucJi9TtdmDthjsjH19iJKs34SEBD6FkPvvaeACksZBKteaFx22+VczY2E1xRj8W4zWQSrNhKkxpbPVDKBa2Qd96hKfghkjQgZmEWCkk1191XhCJ6P1C3aiuUqFuLf3AwU2j34fxUSVyxNhVYNV0h99+uolqrHEvHZ06PzuFGpDYaLmOg1geBz8Xq3Vf0czUNsy4DcUO1EGtH4bQsM4TwNR7x4SZvCN3/55JoHbhQk0kProHJwX2ZXLL4yvIdWK7YL+R1NKA/Cf42O1erldXnWRxBKUiNV+l8Iin7JaqAdPtBpWKwfIAf08iOtnCI+FE6el1xhdJdqDcCexr1YCHppKaKe1yj9oLCbgwcdfx9XXvBPDTiidgYcEXdnX3RhnhnaOnoFTSi34OfWhbJ9UsH/PXIWrWLaiOSrCkdYAzfGqh6FM32JZQjxU0QVU23CvdrVqtWTH+PBFuHjoRTYnX6qExhLUOnN1AMD4RhlowWnb2117B5+MR4qCKN/SJXhF8N7oGXa8GEGHeknqygOgjj7RzpiaUgGwxp1etyNt79UU9fja0LsKz62154bT1RXAIhtV9I+doAD20FMlzHGw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(18002099003)(22082099003)(10067099003)(4143699003)(261026140227099003)(11063799006)(261022075727099003)(261028144727099003)(261102123227099003)(261026121527099003)(261022105027099003)(261021121427099003)(56012099006)(261009223027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mi9Rb1BlZzQ3dkV0Wm9vSWN6U1d2S2JRZGdoUThzZjkyT29jZnpXYU5FbmM4?=
 =?utf-8?B?ZTI4Z25PdWpBNUFpMUhTRW5vc3Y4QmhFRjcxbjE4M3ppM2ZxWURWQ0NyRFBu?=
 =?utf-8?B?QXhvUjZjS2Q2UVhvWmVsMHhSVVlyQkR0TUlEM0NzRUpRVDBFejhNR0JyQ1pq?=
 =?utf-8?B?Tk1oODIxaEwxdjFUWVoyOTYrMlREMjU3S1d2MjREeDFsVWNlSzBBV2MrN0Jv?=
 =?utf-8?B?dTZweUYyY1hBMDA0WEdPNHRENjJWOEN0emxZOGl4bUNuSk9sMENXaDlneHNj?=
 =?utf-8?B?eVdBR1BaMmVDVVpNUHMzSTBTRWE2L2Q2M3ZZSDZDRFQrc1dyQnY2cmZmNExw?=
 =?utf-8?B?MG5La2hZL3RGT2ZVM2xONnZqN1F1Z3BsRjFQakl2MnFFbFVQeXhEUFJ4UjNu?=
 =?utf-8?B?N0ViTmEyaTUwWktWTEsvWEdsTkVNeEk4YmJJYkxUeDN4eWF3akcvTERTK3FO?=
 =?utf-8?B?bWRTNTYrdDdaUGc4MG1heS9VL0lKRm9NWW83aVQrdHJsZnVReUNkQ0RlbldO?=
 =?utf-8?B?L3J3ZXBlam1qRUtxZHVCdHROY3A3RXlZVStNUitJWXA5Z2kxVW5YaGtoaFox?=
 =?utf-8?B?Q0RJQzNxZkM2YkluSHlxYnkrcFB3a09VVDNrMTMvbU5MYjE1TE5MZVJHT29R?=
 =?utf-8?B?dFIxS3ZOVDdkTVAvdWN6c0ZVOXhzVTh5TnVMYkxKUyt6S1pRTkczNHlqZGVQ?=
 =?utf-8?B?ZEk3Ui9oMng1QVBTdkRHL2ZYSmV3dExmR3pPN0MvbVRzQlhhdS9VK04yMkUr?=
 =?utf-8?B?WDRnQXd4cFBKMDhrT25HRFhsWjFZR214NFlBdERRQm83c1lhVWh2b0tIL1Rh?=
 =?utf-8?B?V2lSdzVENlhkNTRCUHFTaXJmRng1azdwZDE4N2JuZUc0V2dEWmM0by9RTy9o?=
 =?utf-8?B?RVg2UUZZWkFzdEdXZks0OXVqVFZlZXpjU2hpRXczamNUL0hadjhkNkhjT1NY?=
 =?utf-8?B?Sytpc0l6ZVdVSzBVaDdwa0RSZGlKSVF5OGw3V3ZiSFJpMlVQb2hjVC9FWitO?=
 =?utf-8?B?b2w3TnZKUGJwSkZaV0tORkpPRlM0NlFsZVM0Q25lQ25UOGx4SmtRa0V5VXI5?=
 =?utf-8?B?TWU4UUxWd3NxWmRkeWQvQncrVzJNZ1d2dW8ydjV1N3RUYlhEb01ibnRkYmVV?=
 =?utf-8?B?YmR0U1B4YVZqcEhnUlpnWWVBSEM3a3FvQmFsTm1ITnhrbTdteUVQY3F3V0R0?=
 =?utf-8?B?SFpaZlFHQmVNQTdTU251ODduR3RodS9HSkc1OW1HWnVneFVwWWZXRU40eHlK?=
 =?utf-8?B?SWhNRU9PbS9nQ1lmWUpRTklrQTluckNZVzRFeTRKSnNOenlBMmt2Q1Ntc2Iw?=
 =?utf-8?B?aGRaSWN6aVFra2dzNDk0R2M4cWpKTy9wVnVWYlVzZU50U2JwaDViVDA0Zmpq?=
 =?utf-8?B?OCsxbHRnRkhxOGEvU28rWWdOWWtMOUw1cmdGWG9tajJ1N21iVnNPc0t6Qm1H?=
 =?utf-8?B?UitIOFJOUHdhaG9JSDZURW1BSklqQmo3YjUrNkgwVTBJWmhpMDErVTh6Qytr?=
 =?utf-8?B?L2JNYWNsUjFkd0NpTkNTbGZDNFFZSExFM1o4c1VrcjRZVzNlaGFKWlhxdzNj?=
 =?utf-8?B?cGxIODRBelAyUklJQSt1dzhsaS9WMktyWmpTc1V4TTRLZUgrSW9WTXBjSjVF?=
 =?utf-8?B?cU5zMWJieXRjRk9oV0h5bjVUYjFGdHZrWG9WUVMzTnZvZWFSYVRseHZnVXdp?=
 =?utf-8?B?Vk5IQzFwdmNtNm5RalMzTUxQcndrMjZPRnZJdjliSUo1TjFKMkdzUkwvSFJh?=
 =?utf-8?B?WUpRN2dmWkhTdjdxUUtxUjBjTG03MGU0cTBEUDZQckhFb0dQNHBadmdDSUpt?=
 =?utf-8?B?NUtCTXdTQkhEaEl4MUo1dlR4YWxIaksyL2ZvVmcxdWtqOVQzMXlHdFdRYmdX?=
 =?utf-8?B?RWZ4L2Y4eE8zekpwTTRLQXFDMTZURjM4Q3J1bWM1VEV3UDk3YjEvOWRLYW93?=
 =?utf-8?B?SE1qU3RzSnNIM3Q5TWhjTTBFZFI0RG1mZEVzRXZ3RFN3U29IYkV4ZFJ2QnlN?=
 =?utf-8?B?ay9PLzkxOTg0d1FyYnlxM0N2dHl6emRFaGphNUZ6dTA1RWw3THpUaHpFSXAx?=
 =?utf-8?B?cDUybXdMbzA1eWVTYjBWM0YrNWRRTi8zT2FSYlBPdm5nR1RCWFZiR1ZJMWhF?=
 =?utf-8?B?dFU1My9UaDlZbkloOUtDcy9sUVVIS2dBN1NYNzFXTEVTYnEveURFbkY5NUFM?=
 =?utf-8?B?RmN4c2VVMnZ6aXpvSk1LU24wbEo4Rm1EQ0p6Vm9Xb0ErU2o4NUNKWDNLNkxZ?=
 =?utf-8?B?VnMvMGFmc1cxbldDdkpKL3lGRWpQM0xiakJ2eVVmMGtTam91RWR0a09YWGQ4?=
 =?utf-8?B?RmIvbnl3QzZLSXRKYlAyalJMNzh1Wmh5Q200cVE2NmtEWDNkRmdYUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c83b5f9c-32c2-48a9-389f-08df3d0781c0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 19:44:16.4425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekMyX/Fbj9BpaYOW66akqydkKOxgxcTpnIGhMmkjVSD0IR9LZ11hxZHxlf389Gkq2XdNApvyh8dfxHo+MzejJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4253

On 08/11/26 01:09, Mukunda,Vijendar wrote:
> On 07/11/26 23:22, Vijendar Mukunda wrote:
>> These four patches fix two related race conditions in the AMD SoundWire
>> IRQ handlers for the PS (ACP63) and SOF platforms.
>>
>> Patches 1 and 2 guard against a NULL dereference in the ACP external IRQ
>> handler.  The handler is registered before sdw_amd_probe() assigns
>> adata->sdw, so a stray interrupt in the probe window, or one that fires
>> after sdw_amd_exit() frees the context, can reach the adata->sdw->pdev[i]
>> dereference with adata->sdw still NULL.
>>
>> Patches 3 and 4 guard schedule_work() calls with the interrupt_enabled
>> flag so that an in-flight IRQ arriving while the SoundWire manager is
>> being torn down does not queue new work after amd_disable_sdw_interrupts()
>> has cleared the flag.
>>
>> NOTE: Patches 3 and 4 depend on the following patch which introduces the
>> interrupt_enabled field in the AMD SoundWire manager:
>>
>>   https://lore.kernel.org/linux-sound/20261107154659.3358223-18-Vijendar.Mukunda@amd.com/
>>
>> Until that patch is merged, patches 3 and 4 should not be picked up
>> independently.
> Hi Mark, Vinod,
>  
> The following two series have a build and correctness dependency on
> each other:
>  
> SoundWire fix series (25 patches):
> https://lore.kernel.org/linux-sound/20261107154659.3358223-1-Vijendar.Mukunda@amd.com/
>  
> Companion ASoC series (4 patches):
> https://lore.kernel.org/alsa-devel/20261107175339.3547918-2-Vijendar.Mukunda@amd.com/
>  
> ASoC patches 1/4 and 2/4 reference the interrupt_enabled member of
I was referring to the patch ordering in my local copy, which differs from the
series that was posted. In the posted series, the correct references are 3/4 and
4/4 for the |interrupt_enabled| dependency, and 1/4 and 2/4 for the |adata->sdw|
NULL checks.
> struct amd_sdw_manager introduced by SoundWire patch 17/25, so the
> ASoC patches will not build without the SoundWire series. SoundWire
> patch 18/25 delays *sdw_ctx publication until after startup succeeds,
> opening a probe-window race in acp63_irq_handler() and
> acp_irq_handler() that ASoC patches 3/4 and 4/4 close with adata->sdw
> NULL checks.
Correction to my previous reply: I quoted the wrong patch numbers.

In the posted series, patches 3/4 and 4/4 have the interrupt_enabled
dependency, while patches 1/4 and 2/4 contain the adata->sdw NULL checks.

Sorry for the confusion.
> Because the two series are split across trees, the Sashiko AI review
> tool sees each series in isolation and raises the cross-tree dependency
> as unresolved races:
>  
> https://sashiko.dev/#/patchset/20261107154659.3358223-1-Vijendar.Mukunda%40amd.com
> https://sashiko.dev/#/patchset/20261107175339.3547918-1-Vijendar.Mukunda%40amd.com
>  
> When both series were combined and run through Sashiko as a single
> patch set, none of these cross-dependency issues were reported,
> confirming that the concerns are an artifact of the split rather than
> real bugs. Reposting as a single combined series would give Sashiko
> the full context and make the review cycle easier. Please let us know
> if that is the preferred approach.
>  
> Thanks,
> Vijendar
>
>
>
>> Vijendar Mukunda (4):
>>   ASoC: amd: ps: guard adata->sdw dereferences with NULL check in IRQ
>>     handler
>>   ASoC: SOF: amd: guard adata->sdw dereferences with NULL check in IRQ
>>     handler
>>   ASoC: SOF: amd: guard SDW IRQ work scheduling with interrupt_enabled
>>     flag
>>   ASoC: amd: ps: guard SDW IRQ work scheduling with interrupt_enabled
>>     flag
>>
>>  sound/soc/amd/ps/pci-ps.c | 32 ++++++++++++++++++++------------
>>  sound/soc/sof/amd/acp.c   | 32 ++++++++++++++++++++------------
>>  2 files changed, 40 insertions(+), 24 deletions(-)
>>
>> --
>> 2.53.0

