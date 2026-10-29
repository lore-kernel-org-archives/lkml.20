Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793245411;
	b=iEFD34PGVXIz9GrV2/pmcullenAm0GWHtTGWRECehEsQkPQbchhgZJzrSXyV63AD4xaq
	 MiRgEWD1RK2R8qErDliKGiTPPcZ8ogNhHnr7EjokUMzhNNUxuB6mRGx3zVANeBj2rtnU3
	 pOOivhvwT2tPcvYMaWOxQwYygC/h/JTYm1Cv/nUd+lEe6Fe1NIK+w3mR6mfc5MnG6q1Gd
	 W7TCeeOuzrjVPhIrVPkc6NNdxfL5SRf0iIB/Vmm8iMg0yGM0T+h4cgUdFdZ9Ja2wLuWqH
	 efh0mwYbgnteApsto0oi4VrrInZCzoVesm63fEye+Gx67BjCWFntzaxUN1jF0BVQPzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793245411;
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
	bh=WXjUQjoK+Uoy/HI/Ss0r+7N7ePx50N/QWSI5E9hdMLU=;
	b=G/w9BC7WYVxnYhcra/BeuT602erggrz7g1F3ERCNsp/MrHpqKaE8XJe1vTidFT3IiPXg
	 SMqb/cagkkzNhor1heEX2exEytcIoK9bsExksq//N7SU/1AL55KzZS2fuz/dei8Js0TQI
	 0xkqtPYxml36aWanSDTFSFu9eBt9YkVHxiAwmTVFrsAXyCz6yOpEjAjsZmmjiWvK3N6pU
	 qqH+cWrLBLePTBaOfCbgGYQ8m+4qyjDyp9wihkrmjgyWkVln9m0qnYdtxnT2jKtkI4KAo
	 Qeif9GTq3+xwqjD83byCGQzmG3TJB9OzQqKfGvPSFBFiVxMeo0cajCoYSWVT/xNyeNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=t0ukLk83;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.46
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010046.outbound.protection.outlook.com [40.93.198.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FC8606A31C;
	Thu, 29 Oct 2026 03:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07FC8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=t0ukLk83
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdZlfhv0itgnaez+pqhaDalnSRv0/ni01Acrs8ueeqVL+tA6MeDYcMKsLQZHpdyQBFYu1+IUOPyp6oUJXd8cLjLtVHn1K8y/6ggwXUvPmOLnBywT75FFN+eeMsO9juF4v3fyrABm3cJtccYrnbFjzSbOy6mdxYV1TDsuYhBNVcV4JMBp1D8j5IC69DVF24TZwcEGuX+CYWVgKXY1ztryrbJu7srTOdkDiXgfkeHnrn+WbKjwSyBa/YJkiTWwd1KfPZTUQ6rB/bqn+/6aVtd0Z9RvUgo4Y0j7eHT30p69Dffh5kER7Znmfqvcc0AdX0s8fnE5GYGr30TRwuxe28/ZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXjUQjoK+Uoy/HI/Ss0r+7N7ePx50N/QWSI5E9hdMLU=;
 b=GoVMoceivcPy7RqUG5X6o1uopffvQjw264NVQlz1l0N9EKgp7Py2h7MTizHKhZTrcS6lsWOR4ME6yPP1JFeT2soTEW4eDhJfNTTHssHFCg7h8jwHbOaqnXhS+5IYjTQiBzYkbvhk9AjVL/hLcxiM7+1ufW0i3DiVGtZHakd0z1wARTEBCzVEXsELWGBtdc5wu88PqRFzUuOvlJ+zdV5pkuGyRcxFJ7YdBt0JDVeMih2CS3fyNGJHuRpK9kBtQftHbbl35bR0MOWvanSZ9PpNz+J0PtVjGWwm5PUrH9zopmGH4PbNT1Sm/hNgU0x36iwdVBXRAbj2u7VY0A0VWu+Vuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXjUQjoK+Uoy/HI/Ss0r+7N7ePx50N/QWSI5E9hdMLU=;
 b=t0ukLk83hAE3WMv1Sah8ls0RxrdS0sI3e0gkXieOJ6iF+P2oK3GgMHteshVFfjGzFf9faPNkrOkD1/FJIwway3i4JWkEonxpYyKQt/XZJ9XyAXFYyiLG59xo/LYBeTcyJmeJaIuAFaURQ0g113OEAhz8hYLiNoGs/xR2keFFk24=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by CY5PR12MB6035.namprd12.prod.outlook.com (2603:10b6:930:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 03:43:25 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 03:43:25 +0000
Message-ID: <49a0f7d8-2b9d-4228-8fbd-f3c28c45bc09@amd.com>
Date: Thu, 29 Oct 2026 09:15:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] ASoC: amd: acp: add ACP7.B/7.F SoundWire link
 count for machine driver
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yung-chuan.liao@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
 Mario.Limonciello@amd.com, Richard.Gong@amd.com, Poojitha.N@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
References: <20261023065216.3473883-1-Vijendar.Mukunda@amd.com>
 <20261023065216.3473883-2-Vijendar.Mukunda@amd.com>
 <7942f795-9473-45b1-8c36-309b9121df17@linux.dev>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <7942f795-9473-45b1-8c36-309b9121df17@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0057.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:270::11) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|CY5PR12MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: a34952ac-64cc-42b1-4a5b-08df356ec943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|261028144727099003|11063799006|4143699003|56012099006|261026140227099003|261009223027099003|261022105027099003|261026121527099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MCSvV55ETNVCUGwCeA6Y+9kxfAk+7G4ZMXIwNU2YMvgCRDqyWc6CHgFO4kUZ7bJ7zOzWXdERpYO0H4HVnVPPWM3SkHezh2OPpGmg7vy+eOJHWInbVmgaK6hKkad8vLJ81CX6rf5CMO2XTlB8fdsC38l8saOfLA9WDPRI3Yhal5IXXS9pnI8mgDoDrTNIU3FpZa2cRr4NFQX4UPQRFcQi46bdJ8yEHM2LqAczqqPwIhejUkOXYTMBcufPyZN96CYMd+z6iZiq/7z0JrKhVy0hXSCceJnNdsfj5n5w/l6cgTMkB1iosC7f0Ry93Ck4kf/BGHQlP9QJyB6oh25L5ePTY7WmUDv2xhGrjYqmi0OpSDqK+d8AXjgQcpybfqHhhra5+6THqHk/AYQXidcadQe8D2SKEC4G9wmLNaAA2XbkeCGQqwY1uWNO9/9GIhCkvluGRlftUzCyTn60hgcfBfiwYvZeEPUrJDKFA1e0TPBC+8fzWXuMOGBXR+q8ohWRtcCQsf7ZeCCWbP08ex7zEvIWa8H1nMlHxBfy6HdIVE/SLUeMXzFxhu/MkiBJBDgmxJbpZNkpplsDmMMzT3vRNfNSWed6ZcdYKHy+6aGWN9AKGQOXY2Bmy8MpQB0blbGc2I1JGrnyBw81muRiGfgkspBbNg9ChIhrWy8aIYkkRUXzjzE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(261028144727099003)(11063799006)(4143699003)(56012099006)(261026140227099003)(261009223027099003)(261022105027099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1J4THIxV29DZnpwLzNpS1F4YUE1dWI1UVNHR2VJbi9OYXBqc0lnWWh2dzQ5?=
 =?utf-8?B?dGVwcFdCU0ZUeVVLNThXWW14SEQ0cUU2WlJBYzJsaCtRaXNCU2dwUUppQ2Yz?=
 =?utf-8?B?VzdBd2JZeVIvdGpwcWxBdjRNUTgwOE12TXBSRnpxOUFDMFljS0dOeVZ4dXpT?=
 =?utf-8?B?TEx4SU8wazhUNUtQQjVLUFp4dFAxaUY1bS82cUc4UW1RbjY5d1o0THBsWWdQ?=
 =?utf-8?B?NmUzQjIvWG5keHlFcmdOblo0N3VwMlBuREE1bTRPT09EcWM3Q2Z0TmlLUTM5?=
 =?utf-8?B?TklQNllLa005dGxJa3RSRERNdXFITHZwbENFUEJOUUphdHB1YXphVkcvbmFv?=
 =?utf-8?B?YzYvWlMxbVI1UVdjeFE3ZlhUTU12ZVpPZUh0L2p4dDRiUDhhWW9yZmd5amY3?=
 =?utf-8?B?Vm56RE40ZnBFbDJESytmRGt3c0hWUUV4WWxmZ3R1ZEhPUTRZeFh1bmk0a1Y1?=
 =?utf-8?B?SEJ3eWxxSjZmbks3QmxqWWdOSnVBK1R4alVocmJYQS9LVWRIako5dFoxcVAy?=
 =?utf-8?B?ODk3QVV3bTVJQ1JaRGJER0VCTDlRTDZ4blg3ektlT0gxbmRvTjR3Tjd3Wkhr?=
 =?utf-8?B?MHVyaHFURzZveWJnMkVBZU1VQVlLbmkwL0c1aUtqdkR2VkNDL0Jaemh5WXVY?=
 =?utf-8?B?aHp4elhGRjg5Z3IwUG9VZUxBNUljK05wTExIck5nY0g5K0Q2WkIvY2M4ZkZJ?=
 =?utf-8?B?a1dSc29vM1NUV3dTVTdKeGVtUi96QndSeE5SMnU3MjFKRFBwQjR1S1lTT3Qz?=
 =?utf-8?B?d21GMUU1bjdqc1JaYSsxYjE2SXNLekNwWVk1amsvbDhTTmYyRWg5YjdySU1s?=
 =?utf-8?B?bkxzcWVqZVdiQzhGZ3lWZjhRS3lBd29IQ0xyRUxZSTl0cFg1WUtacEtnTWg3?=
 =?utf-8?B?ZGhZNFhPOVY2VTRHaW1LMUhsd1VTdm1LY3dTWTl0c3g2dnlJdDYxTVBqTFU0?=
 =?utf-8?B?eGgwR09jVVJLQUpFMUpGV1RITjEvU3hkOGZ2S3BIZzRkK1ljcGxPMTdhSjlH?=
 =?utf-8?B?MlRJSHVmUWh6aHdrVUgrYzk5Zk5NR09IWVNPZUFxU0FGWkNsVmRRWXNVb2h5?=
 =?utf-8?B?ZUQ2bkU4MVluaDNBR3VSWnQwYjQ2eHQvWWdhRkpNQ1ZTRjFrZFJGSHNDcnhk?=
 =?utf-8?B?VEFlNEtIUDlRTnlOc0RYSGZzOFlHV2ZObmUzbXA1QkZ1UkJoVzFZTStGR0Vz?=
 =?utf-8?B?V1BMRmxxRCtpTlNSOG1ISGtNUnJPMHdLYTRGT01UUExMK2ZPQXozU1ZhNkdl?=
 =?utf-8?B?RDN6VGRTNWhxaUR1QkVVMXBxK002RXhabkVtbHJncTI4dXV6c0FvRkxzdWpy?=
 =?utf-8?B?bVI1dmRwS1JFd0c4MmZKV3pzckFlaVc5OE44TVNPSjJCRHIxMzNwMm9BeHdq?=
 =?utf-8?B?VzFiaCszbUpBQzNtSWZJM2JRZFh3TmRZSTZYeXZxc296dDhPc0Y2WVJmMUdC?=
 =?utf-8?B?ak5JcUV5OU9JUnNnVnRGZ2tUYnpYMzYyS211SlhMZ3BiNzV6L0orSlkvaWlZ?=
 =?utf-8?B?SWhwK2FxZjZDblJSQlhBazVvRzZBR0llU0JDWlF1LzM2djQwdlhRNTVaR1JP?=
 =?utf-8?B?N24xQ093OGR3NVJIeHljcXRQVmw3bU1qdWZVMjFxbU9uZGR2eGRjL3VwVTYx?=
 =?utf-8?B?dm0vb1VubnR6dmlyb1duRXNPbzdCRklXS2RVWVE1ZUpUSXpzbGI1V09KdTM1?=
 =?utf-8?B?NGROZ25lSVA1K3lSTkhUNWpsVEo0Z2NkNmZFNHdyd2s4bC9IdDFUT2lEcGR6?=
 =?utf-8?B?akJLUVFlZk5PV3dqZy91cVMrcG12TnZ3QWRaTWptbXNjTXlNQ2hCYXJIZXJv?=
 =?utf-8?B?dmpxdDI5Sjg1WG5vc0lMRWVVeVBUVjE1N0xQb3hObjZuQ2FvaEF2R3BpSmVW?=
 =?utf-8?B?VS9zV283WEFMUCtyeG9tWDMvM2lET1h3OXhqRkdIY0FnQ3lWQ1pzYkxFNm5o?=
 =?utf-8?B?enRIV0hQa3lmaHhYQ095a29rMm1ldFBZVFYxa3dOSXVTaUtLZHcwK1JzdU83?=
 =?utf-8?B?dE96WFY0L1hsOFJBdEplbkVkSFltRXY1UEpqMjU5RUQxdlhGeGp6U3czNzlI?=
 =?utf-8?B?MjFSdmwwTCtIM3p6WnhjU2dzK3E4bEZvWnYzc0VjbFJJdVY3MlBGa2RsdDhN?=
 =?utf-8?B?bjBpamtMYVR3KzkxYndwemJoRGJYY1RVaWVCenhQR1FsNzFQYXNKNFUyMWRl?=
 =?utf-8?B?QmF1d1ppNnJmVWRFZ09hNlNRL3cxNFk3ckFJR2J2Y3NLME00L0lqMHpXMkxt?=
 =?utf-8?B?aC9SYWxueExldjBxR0ttUjRxRGhYdU9ZaGpqS3NvMmFFeHBrNlpLWHA3Ym9T?=
 =?utf-8?B?eUE2SEdFelpFQTEybVMvZlFranBGT1B2T2pNSzZPRHYvbG1sc1VlUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a34952ac-64cc-42b1-4a5b-08df356ec943
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 03:43:25.3803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qojrmx0WcS+8DsI2bamq3OYBEYAYoSgqsdChKK/i95nX96MxX7uxD091zViEcHdA9xF4Pe3XAzcvp4QaBzXUkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6035

On 26/10/26 02:29, Pierre-Louis Bossart wrote:
>> diff --git a/sound/soc/amd/acp/soc_amd_sdw_common.h b/sound/soc/amd/acp/soc_amd_sdw_common.h
>> index 034c9ab6e4ea6..5b9410eff56eb 100644
>> --- a/sound/soc/amd/acp/soc_amd_sdw_common.h
>> +++ b/sound/soc/amd/acp/soc_amd_sdw_common.h
>> @@ -17,12 +17,15 @@
>>  
>>  #define ACP63_SDW_MAX_CPU_DAIS		8
> do you still need this define? I was wondering why there's no ACP7X
> equivalent but I can't see anyone using this ACP63 definition?
You're right. |ACP63_SDW_MAX_CPU_DAIS| is currently unused. I'll remove the
definition and send a supplemental patch.
>
>>  #define ACP63_SDW_MAX_LINKS		2
>> +#define ACP7X_SDW_MAX_LINKS		4
>>  
>>  #define AMD_SDW_MAX_GROUPS		9
>>  #define ACP63_PCI_REV			0x63
>>  #define ACP70_PCI_REV			0x70
>>  #define ACP71_PCI_REV			0x71
>>  #define ACP72_PCI_REV			0x72
>> +#define ACP7B_PCI_REV			0x7b
>> +#define ACP7F_PCI_REV			0x7f
>>  
>>  #define SOC_JACK_JDSRC(quirk)		((quirk) & GENMASK(3, 0))
>>  #define ASOC_SDW_FOUR_SPK		BIT(4)

