Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013038.outbound.protection.outlook.com [40.107.201.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD96F46F481
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522761; cv=fail; b=h/rljV11odV2KJZLJFLyuI7YIgSKwfh55wHu4deptOtuRkt1Rf1wn/YBTG2qsUkRATzyzIneUzy+W2DgM3c9v8HlZp4j+efhTRVgcqjAFRa0CmFxDCAMvHOv2vd/biD65owQqgiMuixtAQdjIFQlpFBehc3vF0TIfj/WJsXRevg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522761; c=relaxed/simple;
	bh=ZUcyRoH4IgqgQkXGYidfsBrJEiXFPBqJ5iPluydZ5Vw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NYIb4C9UDxw+xd+x1weSMOFf2TTbYotqlqiOvtyQ3l+crnSsVhOpBA4ZMSYDqD98xn6ZeKzMEZnMvudHuAqSIjaZdLjsGh9rm1k1G/3memc00ZxFHRNNuwxFKVDv3VDnds4mdrhey8IZVo1Pia8OTPeGeXV5ygcXZkwXIArRdk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0+xC3hUs; arc=fail smtp.client-ip=40.107.201.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0+xC3hUs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIhHtIODt0XxTE8h3IVtIlUxfzE8Dr83R2qDR8KGQoRrPmVCo2Ae3dKHflfVdch3C79ev000Br34xmwVm0OJeQ1WDePJ3ZkZWctQOdL7XtFeZBrxJKPh71bdCJxQgrp8JMjsnZOyhIiCsYBLVIGuOvsgSUvghKAv3gxWAjY4LxdSwd1LIr92tdp6Tx7tCA62RlICTTgYnnGmYTMdGi/2RmsXyMSieuXZ8yPxWLNyFUs2BvEEZQj6EL4CBZLqZ+SgOARTDJCESLYfGWp8qeGg5Ih/b0pht7klf/gqz5ap9ZGlJB/SacN0Hx1sN/Nlb67EJbTDoc1r4HerdgQutEZevQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpIKD6G4sRDnkIuGVlvv69q8sq05KrH9hUjeG4mvtr8=;
 b=WVFu50cDzCrTg5Ks6iSGHusZrF+npW7N/NSCWgpiuSm1UqA7KkMUyfj5PGYxh7EGqrNrcgCXzd6q9ekMaWnUJ3BThVGTxA0l0lz1idzhuK5GQPGIiY7EDe1+HjvcDYRF/BSFWddq/qoWYwKsVWKULQQabP5nLq0uc872avveAwvttzWTHFC2dS2C4DoucsnxYB1uK9P4DBBZFIt+p/VODHZSJpULsReWLucEtd53WDen/RoKPGcVCwyl7APqxPn8lTbncm/KGziKmOdjIa+5B8hDjT8pRzDhFCKwCjq5/IN7uhTebh4VSParVGM4yxb55a4qP5Ctl7U4Kt7qsRX3UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpIKD6G4sRDnkIuGVlvv69q8sq05KrH9hUjeG4mvtr8=;
 b=0+xC3hUsTuhUL1xRLYtIxoneEpLYDrIpk+L7jeYZruMIj4ZxZP3dridiXiQXfsaL5ZPMgMLTLLopBHnYhxxtFrZoPBNPi5am5t3sqCFGXusy/zlSxELlrszGFsytJeJWvSbmCqqzb/eelw/EzCXMqnfOkVC2uT+AxxrlDC3wvgc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by CY8PR12MB7243.namprd12.prod.outlook.com (2603:10b6:930:58::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 11:52:36 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 11:52:36 +0000
Message-ID: <f9e53ac8-dc5c-461a-b556-40a3131f80ab@amd.com>
Date: Fri, 4 Sep 2026 13:52:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fix typo "retrived" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260904115018.3397-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260904115018.3397-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0032.eurprd08.prod.outlook.com
 (2603:10a6:803:104::45) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|CY8PR12MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ab2c384-2d54-41f3-3fda-08df0a7b036d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hkci39tKRnRxQ01HobN8zcSz0xzhZGsOiq6KdSdyxZhuE5AfUM44rtY4wCzP/FI+SDxuTm1wZy5ImS7DvO8XMu3UXGnBAIUFTCUv62g1skKi2D+eCLkHbVCK00dbfAMxF1Wg7nOzoOhx52KuaFhu6UhPH7lsHV1rYJok4SikSgXvJkFNVPiU3WAvmfktY+LdhOsWX3sGEl1zqwffi8B0YUalWaEe9Xoi6JsA3GUcbsqUtvvsaFyH+sZ1YYb96OB7pxz7GF8BrXc69qysVeQnaeAoaV38rBdW+4rws+OxOhxkiMg3QUJRdL2tVxTHe0NgLxgESxZ+yHG1hTVFM5nEH2VtqsqPgx/YBAerUJb1WUzrmIH1myKysW8eKFmpXB2JHVWOz1VKTAfQAGAVdJBAhAHjpL4VQJ25YlT8vrntSMgHdgXlOQcA1WTuJWgn3s5H9K+IBhttzDmtyRO2KDyBtI2eyi9F6W7tY7hN7q/4QhdnisbfOa7Bed7pi8wlc4Nxf98pD9dxNs6tuCuMof8iFxtMVfb870M2xOQKodMWR2Lr7vSJqydSbBWpcJxwG6yyRae9e9AjLEruU7DO4QMB6vRqaGUCWEAxZ+iqW79UqZpkk1FbPYdFD5ana0RhQuVbK5PFINZzyn/YUIscDbT7k40yXLxGFbrEEPrm/qBLj9c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnBEMDRWM29yQzErZk11QytpVyt5ZGhuOFphK0RCVXBhODZaandzYk1NSmEw?=
 =?utf-8?B?NmZYeW1vZkYwMDRkbVZxYjFIMGY4QW9qWjFBcEE1am9SQkFqdkZDQnFRVjMx?=
 =?utf-8?B?OS8zbjFIUmh3cHp3bUErOVJZN1BTaENBckcreC9NRklrdXFKNGJITjN4M0tI?=
 =?utf-8?B?MXVIcGxmQ2hrZmZuS1UrOU5jQ2xsaS9BeWFLUVdiYkpXcktsdGgvSTVQakg0?=
 =?utf-8?B?c3lIeXN4RmZMaGNrV2YrSEhpWG9qVDhJYXdYQzRnWGdVQm9EeVJMTE4rOWJD?=
 =?utf-8?B?ekVKUkFNMmE2U055UGVaZHQ4WFNWSHB6UWtiZUMwdmRqUjhyOUM4bjNLRDFp?=
 =?utf-8?B?blhFQi9QRzNXV2I5MFNlNGZUUm0vcC9LYjNuTHl2eTBHWEMwQWN2YjJhd0R1?=
 =?utf-8?B?U0krZmRLeDl4TlJ1SVBNNzNiZWcyRzdOeWJNcEFSSXlua0t1NGh0a081OHlt?=
 =?utf-8?B?MThRa1VyNXBGdEh1MlEwL0E4Vjdod1VkRWFVMVN4ZERpbzlnRWJpZ3doQXQ1?=
 =?utf-8?B?djFOYkxjZFhuakNhNFEvd2krSDVJd1QxQ3ltYXF5a25nMmNzQ0RPSGFpU1p2?=
 =?utf-8?B?L1dpeExiMHZvRlpyWHBNeW42cTY0MksyWmR2K1ZaVnhIVmdPaFlEQXVobXo4?=
 =?utf-8?B?ckdxRE1zMmczZHQ0cXk1MC9jd3ltL3R4bjhpcmVvZEJJaW83RnNYWlFOS0pm?=
 =?utf-8?B?THY3blZyY1pld21KK090WkprU051K085dUI1d0UvbE5UQ3VWTW4rK1VuY2hM?=
 =?utf-8?B?aUl6bmRGL0tIZ1l1RURLUkgvVUI1WS9TbWRGTmwzWnB4MkxvUlAyOG5SeVZn?=
 =?utf-8?B?VTRrUFEwejNyeVRtaU5ScE9lTmtZNFZvbGhzZURhS21hY0RzUG5ZNm51eU5Z?=
 =?utf-8?B?QkxTeXNlUkYyVVowYVNvbUxOaE9CcmdrWVZsMVJQaHhxUENDKzE0ZERvL0Rx?=
 =?utf-8?B?ZUhJakVCV3dSTDJrcmxnOVprYnp6QjV2L0xOSXpkdWYxWVcyc1V2dUxqUkJs?=
 =?utf-8?B?NWtRSEZCc1lnc0N6N0xPWGtZemNDdzBEZDdlZFArcGhnKzhnSHpQRTVZSHd6?=
 =?utf-8?B?RDR3QW5ralduZklaaXhDejNtVU1LRHRkall1TzQzTUI2VHlMeTFEYlVFUHFy?=
 =?utf-8?B?TGozRHM0NENBOGlkMXlydEZtUEtWTVI4dC9GTWV4bTY1UHJSZlR1N2R0Y2ZF?=
 =?utf-8?B?dWtkS0lSNjdLeXBJS0xXUzRzcHVwdzdNR3dabi9WOWY4SkRidGlpWnMrQ0Jt?=
 =?utf-8?B?MVpzNEZBZktDMVB6Q0U0UGpWcUhVRFN2NmY2cVA3blJ1anZGSEZVQlVNZ250?=
 =?utf-8?B?UVdUNFVnNVdyRStMd0VJWG54OW0rN1hlSmxNUjM0MUpXbVFZeG1hWXhYalRR?=
 =?utf-8?B?MksyeHNjREVkSkkwS3N2b3ZjM21qR0h1QVVJZTJuR052K0NXOGgxQWpteU9V?=
 =?utf-8?B?ZmFCZmJnbDJSOVg5cjNVWVpqU3ZveHJlOUpORXdsTVJiMHNKMFkwYVY0L0RD?=
 =?utf-8?B?T21UaHRhdXhxUkpmM2g5eFAvQTNsUkFMOUdwR1RPUDhmSEphVW5PelIvTmcr?=
 =?utf-8?B?OW5GdlUxMDBZSU5GcE43TVJ4Mm9JamFoUzB1OERqcUhtRkVLdm1EUTNSR09o?=
 =?utf-8?B?S0QyaUpYNGlTSmpZNnJqektoYmI5VTNrd1pkNlNrRkZKL29PSnpLZG95aGV0?=
 =?utf-8?B?M1RlQURNd0dqcjZzYUI2b2pHdUVSK2Z4eE04b01vMlFRS3RxZnVWakduUnpQ?=
 =?utf-8?B?bkU5WVVaWjlsc2tVYnVZKzFrN1YxUXArQWdhODNtNTl6TXo4WmtpUEczZmNL?=
 =?utf-8?B?cWEyNUo5M3c3QVhxYURPMHh0Rk9oWVZLMGkraHV1b1Q4ZGJoNXVTTzdGdkts?=
 =?utf-8?B?d3c2cWNCN2tORDlFdnUzOUFpeU9FV2pGYzMwc0QvK0xDTXBtYU9KVFYvR0dr?=
 =?utf-8?B?OG9NVDdOS081MUF3OHZ6SWRucmZ1ZFpEZGk0cmpDRVFKVWtVUUVmSlFmVndL?=
 =?utf-8?B?ZjgrSEJiRWF4RGFzVHpXN1ArNm9vZnkzUnpDb0gwajZzMDIyVUhFeEJlUnlL?=
 =?utf-8?B?ejVWT1VEUFF2ZWNja291MGw3RkZudWRtOHIyajNGT0NFa0hic1JaWmFOUmlN?=
 =?utf-8?B?b2l0RmpyUGdqYWJMYW52ZlRFOFlYcEMxa2I1S2M4aTNKTUYrdFhYRzNJQ0Fu?=
 =?utf-8?B?ZUtSbFB5Mm9pWkVORWt5NzNhcUZwTlRzRmR5OExQV0h4UHZiRUJ4dmtoUUlv?=
 =?utf-8?B?MGVaZytIeVVBOTNicmlOd1NPaElNdTV4MHoybEhEdWpxUzZlK1FxUEw3dUF0?=
 =?utf-8?B?Sll3Wmx0V0Zxd0F3bGhxRWZZSnZFeURtR3Y1dnEzaDI5b0xCWmhaQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab2c384-2d54-41f3-3fda-08df0a7b036d
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:52:36.5275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zljjRNJhLQb2CUs2won0nohXGpoTPm1bjUljosCUer4EztU7lCieIPjE9T8m7vF4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7243



On 9/4/26 13:50, Hemanth Selam wrote:
> Correct "retrived" to "retrieved", reported by scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Only touches comments, no
> code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>   include/uapi/misc/xilinx_sdfec.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/misc/xilinx_sdfec.h b/include/uapi/misc/xilinx_sdfec.h
> index ee1a42ae6f46..d98d4c1c49f8 100644
> --- a/include/uapi/misc/xilinx_sdfec.h
> +++ b/include/uapi/misc/xilinx_sdfec.h
> @@ -234,7 +234,7 @@ struct xsdfec_config {
>   };
>   
>   /**
> - * struct xsdfec_stats - Stats retrived by ioctl XSDFEC_GET_STATS. Used
> + * struct xsdfec_stats - Stats retrieved by ioctl XSDFEC_GET_STATS. Used
>    *			 to buffer atomic_t variables from struct
>    *			 xsdfec_dev. Counts are accumulated until
>    *			 the user clears them.

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
