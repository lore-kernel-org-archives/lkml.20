Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793620920;
	b=G9OsIHPn+hiwk4TsK+x2kyZgtcj3wOPx5iaqaxbg1sXLqa3keVBZMa2/in9hBmILVm9A
	 0DRbrCGZza23CtNrtCj046UGokWaKdB+24fSihxU1bp/pvZt5OTonY0iwU02MyZwnR8Wr
	 IVOO814YoIsOCCgkk5CyMSItL4ClcY3U8uexf7GsXvU+W/T/EyypGjsyf+dZbM3fw6Byr
	 8pnT+3Mz34baX10VlGgd4IgNQdXVEJ9kZBf6S0TxXCaXpauobtags9LUchPTVpdZhxv2J
	 eadHwQ44LUMCiAykL0VTjg52zd/UdqmZGIdoIHZge6nOdgKhXeNKEndEtEQJqctGMhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620920;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
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
	bh=bgVSr5e24PcaRye3+pb56SSUJHvpMmVSoKLrdqhQzd4=;
	b=pDumB8FXgHCYHr5vmdCMga7SOfGYJ/Z3Ep+iwKmBybQE22Z8sMhdxl7oJff7uHfFA6YR
	 HSTz9+vcM0HZmU/HYiceVK6Xj+NHl0hH1/JqmNC9ys9rwdjgqo4B339yC9552yw7fTPCf
	 kYn0hHoYIzrj/qwS6eGLUWPKN3MBnH/Q7rlPxsO8/xsaHrD1F6KeJxeEq0KxgCivzHzTB
	 /q7Mkdnme4cRNu6RZ4VwnBB1xvjLl/NQI9PWtpum/aNAmUHAZQa5AAw55Y2aszBRF6bca
	 ndsyclPiRe1DgcKjSOKCB6Y/oCTa4wZuPk/ebeFJo61lIE7JraKsPGRi5sotcLsmwTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4ntmeYhk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.26
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013026.outbound.protection.outlook.com [40.93.201.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0B9606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C0B9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4ntmeYhk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUR9MglwPYCaK8w4cYKNzz4+0bFEwCQLE2SUEdEnUtNDkunmMqBgC24pWufTVyly+EuqOtG7c0bncPf3kkdGX5TJNNGhzu+aaKuSNYHjWsgybPbN3COz/a0v28RGbgyybpxwEU505TqHCiE0Aqxncge6w35WVtgJ8hmOk/NE7swl1OCejooTtyR8DhDhq0S+wRGHWq4248cZmc194SryHGN/3xIXBqsMBsVTZlN4qCoXK33D5eiji41gBeHcZZbIU7SEB6aQHxmy+B0HGkfkYPUWI6qEJI+JYcwLwjYaBxg00kuaK32ZEHyB/mqctD9YyXKNWUVkfhA3BirpcIAJHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgVSr5e24PcaRye3+pb56SSUJHvpMmVSoKLrdqhQzd4=;
 b=mk46NBoB/19DuEmscurjNCl6K8ibNC8hGOyTxfz1LzyxLcYOps0mLM0YAJZehdWHff/0ZjL09VIfQUwMtjXZnSwdOstQcq4UlkVxKRR/w9D5n0gSerWEGX1N8U9/X+cw1n8G6ezgu8w5G0RtVQHSTGRLEcoDPYRIPIApX4VB6M2bAe6JGFROMg6mnQWiXjUtEgioHKwLbKnbYSfAxsoF29UpfVpjdl4E1TZkcpN4CEoSQxfsVBl1etMCYattadlbigk6IaI7ygxrLKkTa4pKEBD+AIPx1M9QKZpQpkNfv2VFAKahBsGJ6VbRFiWp08/ELMCys2m2+8FsutXmCkzfTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgVSr5e24PcaRye3+pb56SSUJHvpMmVSoKLrdqhQzd4=;
 b=4ntmeYhkixJzhsT3jggwGYY6RktD3YRdJKKzKywuvx8UiciWEz+TmQLpWuaP/g9TahWFwNWVDHVygLu2vP1AyZ1eBPkRD4pf/k2uEIh5HbZQfks4K0RVtRIonLXrRawMxBqT2QdxMPP3DPQYBefArFTtlWihAGXmrHHQY/EogHM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7771.namprd12.prod.outlook.com (2603:10b6:8:138::6) by
 CH3PR12MB8459.namprd12.prod.outlook.com (2603:10b6:610:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:01:58 +0000
Received: from DS0PR12MB7771.namprd12.prod.outlook.com
 ([fe80::9a3e:791f:33b6:3d8c]) by DS0PR12MB7771.namprd12.prod.outlook.com
 ([fe80::9a3e:791f:33b6:3d8c%4]) with mapi id 15.21.0569.010; Mon, 2 Nov 2026
 12:01:57 +0000
Message-ID: <f241f883-39f2-408b-9f44-574ce8d2910a@amd.com>
Date: Mon, 2 Nov 2026 13:01:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/unaccepted_memory: Do not accept ranges that are no
 longer E820 RAM
From: "Gupta, Pankaj" <pankaj.gupta@amd.com>
To: Ard Biesheuvel <ardb@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 linux-mm@kvack.org
References: <20261102113127.161823-1-pankaj.gupta@amd.com>
 <bd56cfa0-6fdc-4e83-b571-f2abf647afa2@app.fastmail.com>
 <a9fb9818-39fd-4b6e-8998-761bc3439893@amd.com>
Content-Language: en-US
In-Reply-To: <a9fb9818-39fd-4b6e-8998-761bc3439893@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0031.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34b::13) To DS0PR12MB7771.namprd12.prod.outlook.com
 (2603:10b6:8:138::6)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7771:EE_|CH3PR12MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: a81c35e6-90e8-486b-a7b3-08df38d9183d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|4143699003|11063799006|56012099006|261009223027099003|261021121427099003|261026121527099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MmvANkclssvv6Gt7LBLTn24c+lP4ql0OClBVPjMCa/efAmgswE8eF32+6CQU11wXmjdVLqGMF3kzgqVaoKG/pwrRh1OC4Pd8KimgCMi6NdXrDD9ML1BMR7bqiH4osdqttL5EFOoZsf/dkhLNLVPDrBfSLktRQqDyJPZ9/2blRcsqWaDkf7QjxxTyJ5hNjxWBuk9pGwm7BesKPyrbQL3XctQnwy7hle2pPUPznYeGdApU5SLXnB/EMIWByl4yjbAkNGbmJPji2mk1VudUt0FB90Z87qhFTG+P6nDfc0rao3yPf6c4WAfWbEHtZRqVHrq/K2uOItO9iNR8wONfZcvC25v1LDE2ICwfilnSfApe3eT+SZHwW5omvBqcol2WOo9qp25dtEoi9m51BT17azPxr2dyJUb3p6KRi1gDwEqbMYpfm9vx/wU3x+24IOQe9p9IHVFOJEY8ZnlOkIyIkM3d1LZDmEXQzGQjo0TnCqyrZOYHZ+Ul0AH6hgmq06dwA6RBQozDaqvdLcb5DuL2032W2lH1W04xPG6olfbkjB/LRtWNaEmfJa1KTnv9uMpFzo89J0jVrsHY2p2MD4XnmtWGfmyUYaFfUp0vGOW+FPDUKlk4Fg3oPs5I589rhsoVE3Xy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7771.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(4143699003)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDE4bnpwUjVHTm0zSkRrTUtQRXBjTFFORWpmbDhGSUNmcU1FNnliNkF0OTZa?=
 =?utf-8?B?NzNVQUN1VkVsTUVHc24xc3VPYzNCRytDZkY3Wk5yT0xQNEIxdVBwYjFaWUta?=
 =?utf-8?B?QzNQaUg5WVRuS3RlS1JqRVlIMG8rQ0hlNzBOWFl3OEtCL3NzUmdtYXVBb2VL?=
 =?utf-8?B?VmNnazRCUUJtN0tlQ0puM0xReHQ2ZkhHZXgwNFJGWGZMbWVjbzhvWjV3cDFj?=
 =?utf-8?B?cGlVSHJObEpmNG1SWFhFNk80dC9nM1NwRW9UR3RlUWhxSkdoamRoUFl1cUJM?=
 =?utf-8?B?VDhZRE1PbjF5aVRhcXlVaEdhNlRXZFdLb0FhdjdsVnFWMjZ6Rlh5cHpvQkxP?=
 =?utf-8?B?dkQycHhYVkpQd3FPY2hPRml1Q0VYOUNnSytHY2gyZzF1STZjZHYya3FFSmRj?=
 =?utf-8?B?RXNHdzJPWTNrWlVVOElLVVVacXc5NEZEV3FxOFVsVWhyZDY3R29OWHI5K2o2?=
 =?utf-8?B?Y2p2YjFCc2IzTVlpWW9WaW9LTUdvU1R3VFNFbFN6Qk5XYkcwc0NCa21oV2pj?=
 =?utf-8?B?b0lieE5uZ1N5V1o1Q2N5dTdGNEtHVFFxbmp1OFdTMi9OTnB6S0FLaHlGVytt?=
 =?utf-8?B?MVFJUm5iWWpwSmtGOHJ0eXVONEU2Yys3QnhUTGQ0UFdtRVJ1Si9JeGZmNTcr?=
 =?utf-8?B?MmpYQnBrajd5QnpuMDVZbnpLSzRIQWNOOHdzTkIzRjBwSTFGbDAvUWZzUys3?=
 =?utf-8?B?VjhTTUxQOTRydGRuUnM5T0EwRnA1bk9zV2hWNDZzUjJQTjZlVkpJUEk1VEZD?=
 =?utf-8?B?dU9ldUo0a3J3K1lRa3hoUVlycW82WkZidjBVeTlnTkFxTjFMU1h2dnVLMExF?=
 =?utf-8?B?WG51eis4UklnV3p3TGxGNjFMMXlBaEtnSFk1ak8vdW1BdVdyM0xmT2hlS3VK?=
 =?utf-8?B?SU5hcCtCMjR2VEN0ekd3UENnMlpYZnVPRk92V1RkNCtQdUIvRmUrRDZTelg4?=
 =?utf-8?B?UVNxOVZWckZNMWNTNVBtV0pWTnNDRi9ZRDFHc3dvQktxVjgyUEFFYmhYY2Ni?=
 =?utf-8?B?S3NIeXVRbGIwRHJiYXl4Zm9DRGZTdnYwdTB2SGcxeFFCeVdKZDR5UWhDeXZD?=
 =?utf-8?B?NDBFSm93dVk4SjRadW5CNEZIMWVlc1phUmd5OVlTcHZHZVhWOUFHTjZnbExJ?=
 =?utf-8?B?bUNpOXZISnhkeVoveG92emdEOXRsS0dmUFNYSkNVenRCVnhNZEYvbk5sVVg0?=
 =?utf-8?B?SjRzOFpqUkU0WFdSMS9tQjVzeERWc01CME5XRkl3OGpuOVJkUzMweFU2S2Zh?=
 =?utf-8?B?MnVPR0IxOVJYRHFuRGhxbHM3S3hJZkJpSFRTMTBSaVFYby9QdVV3VlVTTko2?=
 =?utf-8?B?RTkybzJUNXBQdEVpQXNObmxrZEZKR2tOSWFWWFJmbjVnN0ppNC9jSW9IbFJw?=
 =?utf-8?B?WFp3UDNJVmY0cE4wM1FUZVRBWDVxME53K1hpd0JnWUlkL216Sy83bmdFditr?=
 =?utf-8?B?UmJyK2pyWXJnYnlGdFUraFVpbkxWMVg3V0JlMXREeHF1dFVlVjZyNVFnYzhr?=
 =?utf-8?B?NmlqTTBHNW4rb05tczA4TkJ3QTJJOEVmRFpvN3V0QVRIQXhTcXllRHMvMUJy?=
 =?utf-8?B?V1JkN3JXNmxIaVZ0VEtkcVhSQUM2ZzJXcE9RQUxRTkdoSkZ6ZThQOTlkZ1VV?=
 =?utf-8?B?dy9qaCtBOStWT211WWFscHBoREpXTjdHM0ZNWVhNVUVEV25icHp4SitDaG9r?=
 =?utf-8?B?bDVNd2ttTHd2eUtlNk5lR3RxdHFSMTRTTmVnek1CRGJhUzA2QVpHdkNkclB6?=
 =?utf-8?B?cnNsSmFDT0hjZjJZK3FlSW1HS3ZFU2RQL0J4b3lmdURDZkpUUXRLajV2TWJS?=
 =?utf-8?B?N3lSVVFPbFMvbnN3Unh4NGlpdVVOOUZIM2ZOdDJaY0tuSzFLSmg5eDNpZzNV?=
 =?utf-8?B?T0tybHFUU2NkQUFESEVaMzBaNlZSSzBZVDZ1b01hSzFlWkxpcGtBY2NBQ2FT?=
 =?utf-8?B?bnI1RHBVUzBHem9BcUhzTDhuS2s4NzBBKy9HeFgzK0Q1NEYyMVd4dG1WU0gr?=
 =?utf-8?B?NUMrOGM3bWlFME8wWUl0amRWWUlBeXI2RFVwSjFXWWJMN00yZHNHWDlTWmNp?=
 =?utf-8?B?YWZaK1NQclZMTEdKbW5nYzZJelBrM1FiU21UTGVrcTdXTGljQWtmNzQzUGlN?=
 =?utf-8?B?dVBPek5leWlWbnk1bnNBUWtkamw3TVBJamNnN0pFZjFMZ1lQanJVMGtpa2Y4?=
 =?utf-8?B?Yk4zZWZwaDV5aTY1THB4VktyZmE2M3BIOHg4dzljL0tJZkJkMTh1SG1PNzdv?=
 =?utf-8?B?U0NMdklyN3d2T20yYmp1TUhYTVVlSTU5R1MzdEZVUDcwWVg3T2M5dXd0bkVl?=
 =?utf-8?B?V0kvckNEcUQwVUlwYmUyeVJrd0xvYk1CME9ReWZocUJ0QjFCOEFqdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a81c35e6-90e8-486b-a7b3-08df38d9183d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7771.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:01:57.7836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7Mqhxj9pFirm88NqHv51JSb4ICvns+VXrLgifQx/7+LM2OHLWJloUPtA2sIaHHvcFaMGjlnSiv7XAGsIHYI8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8459

>>>
>> Can we just disallow memmap= when running in a confidential VM?
>
> My experiments showed: memmap itself don't have a problem but memap 
> with a hole is causing crash.
>
> There might be some usecases which are already using this, e.g:
>
> https://lore.kernel.org/all/20261029-cma-multi-v1-0-2cbced8b5cb7@kernel.org/ 
>
>
Its also good to have a general safeguard to not accept memory that is 
not marked as RAM in e820?

Thanks,

Pankaj

