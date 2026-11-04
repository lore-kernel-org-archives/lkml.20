Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793808050;
	b=OZ4AN/pu9eBnS8Ro7z+ErZgEqoHaq5ZUan49x6dqaUMEQKJ4UYtzENAfcPZTxQInpnIT
	 w/aAZGsD6hoOtmn9Ylv+7pqnJtXD2KDqOx//Hha57/rcID74nW39yiKSIqm/tfbGQLNaK
	 43Z69dr82nTZse4vCFyw02H6OuFqa0eBqEYG+VpNNaYq7/UfSacZCUHXcx7IuXm/ifWCv
	 p0am+W/m/wMnTZyPaQG00VVNrl+ONEbmDZIGD5Ru4XxkJYNDJAj5Af5/nidlEGmvWI1m5
	 ttR4oCNFcrBJ+00u/b0JiXs19QKsIUN8g2szo4BO3tismrky07bWdYRL4//QVZwZD6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808050;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=QjEIjCOU5P0AaSwtn9r+AXFd0HqDe/zZnE+Tq4U6ra0=;
	b=BfhwDqpDqRxYr/WCq9Mo069IHBogjU3mI3XFik+2FRJI4fzLlpxSQXj7RoGT64LObsMN
	 S60aLBqwNGzutP54cc0+ebHmH7SmJPjR9EjNDf8sb5UWlfZ1kEPMq2TYmZI279Q4+k3gk
	 T7JZBXdVDqdKgoWNGCy+agALWF0OJIWcaDPK2mS9Z3HNp588IVhjWYy3HhdA5obr6Rwd8
	 btlXvxh9szuBZt9nyxiJxK9zODi1IH+ApXLyeRr8IjTXAc8BKQIgslycehJuLsL42ZQuO
	 twIwl+ccTRP0gR95iHMbKZxchbuAXa2yGvb4xfw3q2R79gSCzOlFjYxvFPC+qS2Q78Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=o+WFccak;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.66
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011066.outbound.protection.outlook.com [40.93.194.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1056606A33D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1056606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=o+WFccak
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=en399I7LJGhAHdiqBCtNcfZWLPlZ+ZxgGy2xKz1fJKgOC1DFbOeSvjTovKAzxnNGYNmOqthuvdAarP5mCUzD/jRAFsvKqkuVDBErt0zlvQgdCwu7Ioi798DuMhsjLVhTZG9z6RUssWTYN3bE3Fom0N0A02lEARcPwtSF1lEghpy+IIAOAE6l48DZckDNPljdHe3hzzYOH1/6UVQW/+fLWom4JOHiuCo8MefuBFVq53mepNstaiYTgUbq44v+wvw+TiJBrwk/DiEeqlLphb10Anb0jfXSLZtybhRrH7yca30uX1ozxF8JQBwY3H+QxwWhJdESEH7LcRb3mDSxLMwOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjEIjCOU5P0AaSwtn9r+AXFd0HqDe/zZnE+Tq4U6ra0=;
 b=JpAed4Hvrz1Fw4kE2KR+gFnNa4JJoYbZWKPzunSM8facEzIZTcGEbiOUdALPWf+d+UbEYlMvE4o40m9DYSlxU7bOx8N2TEZEQMlw09y3p/BP/nbT63gbPhkIk3xaG+x0fp4Q+r3ibLGr3IFqEFSY3IFnmDokDkhD+aJ0Yoc2MbMyBdcOBcixXgdk0OsilbHX9ALbZb6ObCuY6ixQG+tKfX19rM/tYJfnKsdygCbqFSp6576kDVYzPhInaCwTF8XjrKs8qD1GgjNrXxj9F9LRy4F5vH4akW8gjc66QOkU38M6NNAqp+NX1ocENNPzUS+rOgVaDV01P4abipaO59ntJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjEIjCOU5P0AaSwtn9r+AXFd0HqDe/zZnE+Tq4U6ra0=;
 b=o+WFccakIhjNK07LqYjszE2CnF+xAkf3/crfjkwt8D0EuBmYRrp7V/bO3KS+1UQrr9hpqIoAFkJZFiPwxfOOzeldOqO1zMv3feapaFrwTeg9ZF1qgTtJg07f0w6vzH0hUrA9h4ErxbKAx8jRHcvI9mYBIBgQO7BZsE6T36dC6Ug=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB8131.namprd12.prod.outlook.com (2603:10b6:806:32d::12)
 by MW6PR12MB8957.namprd12.prod.outlook.com (2603:10b6:303:23a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 16:00:46 +0000
Received: from SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46]) by SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46%6]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 16:00:46 +0000
Message-ID: <20fa5e8e-56f1-4dab-a7c0-e4a82fe8016f@amd.com>
Date: Wed, 4 Nov 2026 10:00:42 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/sev: Fix kmemleak false positive for the RMP
 segment descriptors
To: Breno Leitao <leitao@debian.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>,
 Nikunj A Dadhania <nikunj@amd.com>
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 kernel-team@meta.com, Dave Hansen <dave.hansen@intel.com>
References: <20261103-sev-rmp-kmemleak-v2-1-9c1ba28cf7c5@debian.org>
From: Tom Lendacky <thomas.lendacky@amd.com>
Content-Language: en-US
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 WiyqywZI5g==
In-Reply-To: <20261103-sev-rmp-kmemleak-v2-1-9c1ba28cf7c5@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0415.namprd03.prod.outlook.com
 (2603:10b6:610:11b::26) To SN7PR12MB8131.namprd12.prod.outlook.com
 (2603:10b6:806:32d::12)
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
X-MS-TrafficTypeDiagnostic: SN7PR12MB8131:EE_|MW6PR12MB8957:EE_
X-MS-Office365-Filtering-Correlation-Id: 20d544b6-722c-45b0-df3f-08df3a8cc9b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|366016|1800799024|260925021311599003|260925021911599003|260925022911599003|5023799004|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261022075727099003|261026121527099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	IvZJAxj89vGtp9MwtBDYumbUvvMQ+O4ALcgYXYjXctjGy97GigGbMQ3LBZM7gRLxj5vAac/jVF+UesDP+M9Tmp3f30uEg1KOVUQceVvK38F2D6qm1zG5MCQ5UQEu0RxxV1Teg207ubPmKeByZ/CXf+NLRjT6xQttwR/khMPYF87Q+hJwglm6UWAeEIXbemWAQ6KRxXmkRCIo9V5vkKnhBRyyU8as565CaZz1JwfJMZDE0wN7tj8yX5DWhlceg5HsRJnvCEPooXz8BY7ustencSTgsjV/CM0OIAQRQtmIfgq7p7kfx5r7w2VxLa5clsh203kX8otlfFh13uVjwlb5Fb3hr1soVk07O7ynP0cxEy8fn3/B58rzRdbyyzWJJcyXzTcrb/GFkbVXRzQlD4riNlBmHCrfrDSN87wBKi6XI8NHPSYAYhgoJtue2PFzESXFXLTQxt4g071asniy3cDR4Ghrt88BJrd6fMnujSkW2YOkXES96eaBlLieG7W1mds9M31XmAun/84sxgsCdWmhF4DNar4yiVUnZ+9eeuNWSAfXp1SADCFRtqe39GX2+4gJuqkKbCoLEKumEIO9n0wvpcVtUGqxF+Rlq8NThuhiZv/JfjTyZqXwphhbMQwXl634
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8131.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(366016)(1800799024)(260925021311599003)(260925021911599003)(260925022911599003)(5023799004)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261022075727099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2hpcmQrSHAzLzlPb3JTZWh6WTQ3WjJKMlkxY1BVL1UxSFNLN2Q4V3FtSE5I?=
 =?utf-8?B?SVBXNDQrUElxcVRVVlJ6cytqQTVmQ1JKejlON0dEZjlZMWdTUkRXOGk2MTZ5?=
 =?utf-8?B?SGIwSFErcC8xdXhsQlcxRkZTb0lNRjcwYkJKRTkraE9EMVNtTjNvSE5sTnRM?=
 =?utf-8?B?Y1NPZzR1OWk5TDNFMmFTelByNEhEa1VsS2VpSXhQRlQ0akduTFdzeTcwMURZ?=
 =?utf-8?B?dTd3RjVMMjM4Yy9jTThJSGdDN1grdGVQRnl0MWUvQmlTSE4wRFc3Z25rZENy?=
 =?utf-8?B?MXZlMjRwQzJ3ZjMwMkFDbWxMQ2hlZ3ZPU3NSMll3WVpOd2NVRjFiOExjS21s?=
 =?utf-8?B?M1Axdkcxb2RrRW0zWkRjbXlocmwvU1dib0oveGtlbTRManozc0FUQnA5WVNV?=
 =?utf-8?B?eTBsWkFRRlMwV1hIY3hzVTBxb3ljRys5TzhPYzBteHYyMW13TVRCYkJmUFc1?=
 =?utf-8?B?L0RONnVlaGs1dkNXS0l3MVZDUjVJLys3NGQrQVhtdkZSd1ljMEowMUJsVyto?=
 =?utf-8?B?UkVYd2lkam8zNGJtQ2pSRVkwYTFEcXhqYlA4aWdsWHRhZVhYZE82NVlsTTFK?=
 =?utf-8?B?SURneTQxM1RUWWZ6UWRDVjVldFdGYkh0TTh3SE0wMEpXSnB0eUVGREcxUGJF?=
 =?utf-8?B?eHAraVZoZElBSU5ROW9kQ3lESFc5VkZocEtWNzdlTHRmbCtDT1BMS0J6WE56?=
 =?utf-8?B?VUYvcDNGaDRUajBaLzJXV3lBMUNob0RQZE5DeGF4cGpSdi9WVWVGVFV5Mkky?=
 =?utf-8?B?WkdrM2tZeURTMTRzK1FCOVhBdzVrNjdzNmErMlB3S1ZYWVl3TzBWaGs5a3Av?=
 =?utf-8?B?WG5wb3hlaW1qenVBUVZQWGVTNU1DbFo2M0RlQXJmbXFadkFZRXBXeFRKb1BD?=
 =?utf-8?B?MUkxMVp4S0VwVkcrZ0MzM2E1TjY2ZUhhS3k1cXBqeUhWbnF1QS9YN29DZkZO?=
 =?utf-8?B?dmJOcTdRWnB2bXYvdmI1NjE4T2JSZUgzTFBPR0FRV0pZR2hJQ0FHa3hFTmFx?=
 =?utf-8?B?cGtTZ3I1MVo1MC8vRkhrMzIxblZnWm1OUmQrK0l5Qk0vcFlLbXhucHJiaTRF?=
 =?utf-8?B?cEJ6b3J4a3pLYTNkSTVLY0NVYkJDMFRYQmJQd2YzQUh1L3o0aUpHTG5ZVmR4?=
 =?utf-8?B?UUpNOXpPb2E2aDQwZUFnY2MwdmtNaDBtbWsrMmRFZ1liVkM2eS9wRnYraU82?=
 =?utf-8?B?aCs3cjYyQy9MRmxONEEwYmkzL1NBMUVrS3NPUzNYZndFOFVJS1hKb0tkNlVT?=
 =?utf-8?B?dHV3VE9mZG42c1lkVUFoODh4Sk14eVpxakpkOVNKOThWbS85a2pxR0NWRGUy?=
 =?utf-8?B?WTJ4RDk3T0xySHBnRlp0WnZ3czNYUGtxeDk3Ym9rY3JyUTZqYjhMQkhUSDBC?=
 =?utf-8?B?dE9YRmpnby9QQkwxRTRjaDZSaEppcnlVR0o1eWlENXV1N05PZUdhcDBJbjRv?=
 =?utf-8?B?Zk03V1R0R2ZpeWtUcTJ4UUcvck82Y2UydTlMNmhCUTRMM01UM09YZkFQNWtK?=
 =?utf-8?B?WGNiRGxaVW04MDJkR3VBLytTQVdNWk4ralNncmNkYlNjZ0Z1ajkrVXJ5VmFy?=
 =?utf-8?B?NTAwN2pMZmtEdityZXBRWktsK0ppWWFlMUtPQXZTN3RjaDd6NGpRSThScW9P?=
 =?utf-8?B?bDZpSmtQZm1WbmZSQkVYcnRPVUZMYUZZR3NraGVCanBjbDZSWHRucXRONlNW?=
 =?utf-8?B?OXBDNTNFaFNWRkRIdG05dEpwZ1VIQk14L0RoNEhpQXAxQmpPdWJzcUNwQll2?=
 =?utf-8?B?NnIvcmZYY3VZTUVnN3Z3SjJOS1JjQmpGd1B5b1B3VmJZcm1lZkJGSzdKbUp5?=
 =?utf-8?B?amRkY0tBYm9PKzhCUy9RUEJpNjNTNnRlblFoZVRvd0YyU0NqZ2JrYmRBczJL?=
 =?utf-8?B?Y0hnTFlhem5DUXFmbW8vL2krRGEwdnpMeHVqcXJkOGlyOExPQjNacG5vZ0ph?=
 =?utf-8?B?VXdPOUhlZThySTE1M2liS0l6QkdFL0hwQ281TnlmMGkrTHlNREJXZnd0WDJl?=
 =?utf-8?B?N1VaUCs4d3d5UUlTY2tpdkRYc1VNRGQ2RXc5bGZjejlTZnlwc2owdlJWUDFP?=
 =?utf-8?B?VTU2L09nODRUUkRxV3A4ZHVTa3dOYVo2U3d1K3dhWmpTbFAyNlZDenRGMnVx?=
 =?utf-8?B?bUw1d2hxNlU4eFUybldpWFpVa0QxTlVqaFo5UFBZcEk1TWpnZDY4M1Z2R2Rn?=
 =?utf-8?B?ZEttcDNwTG03UXJWZVdEc3NCbno1MVptS2pLNExhbGlUczVRZXFZYWUvUXd1?=
 =?utf-8?B?b0twMDAyc3J2U3lDb2NXTkRXU1VPL1lsbXdnMFFIMlZpVjd0RTRhZW1hQ01i?=
 =?utf-8?Q?Czkk1yAmWwNh+yDZL0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d544b6-722c-45b0-df3f-08df3a8cc9b1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8131.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 16:00:46.5519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9aD4AAp4sS/ojg+Ifixg5G1seGxKRYgLseM269Jl66raYo/gf9434Hkvo7tbZNNwktkWaU1EyMsk9wtvp0hsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8957

On 11/3/26 08:01, Breno Leitao wrote:
> kmemleak reports the RMP segment descriptor as leaked on SEV-SNP hosts:
> 
>   unreferenced object 0xff11000140e23b40 (size 32):
>     comm "swapper/0", pid 1, jiffies 4294680964
>     hex dump (first 32 bytes):
>       00 00 00 40 00 00 a0 ff 00 fc 05 04 00 00 00 00  ...@............
>       00 c0 5f 40 00 00 00 00 00 00 00 00 00 00 00 00  .._@............
>     backtrace (crc abf63fca):
>       __kmalloc_cache_noprof+0x2e2/0x650
>       alloc_rmp_segment_desc+0xdf/0x250
>       setup_contiguous_rmptable+0xb0/0xd0
>       setup_rmptable+0x13/0x60
>       snp_rmptable_init+0x45/0xd0
>       iommu_snp_enable+0x77/0xb0
>       state_next+0x184/0xed0
>       iommu_go_to_state+0x3a/0x90
>       pci_iommu_init+0x32/0x50
> 
> The descriptor is still in use: get_raw_rmpentry() reads it on every RMP
> lookup. Its only reference lives in rmp_segment_table[], and
> alloc_rmp_segment_table() takes that table from the page allocator.
> kmemleak does not scan page allocator memory, so it never sees the
> reference and reports the descriptor as leaked.
> 
> Nothing requires the table to come from the page allocator, so allocate
> it with kzalloc(). kmemleak tracks and scans slab objects, so it now
> sees the descriptor pointers in the table.
> 
> Fixes: 0f14af0d1d7d ("x86/sev: Treat the contiguous RMP table as a single RMP segment")
> Suggested-by: Dave Hansen <dave.hansen@intel.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>

> ---
> Changes in v2:
> - Allocate rmp_segment_table with kzalloc() instead of registering the
>   page with kmemleak (Dave Hansen)
> - Add the Fixes: and Suggested-by: tags
> - Link to v1: https://patch.msgid.link/20261102-sev-rmp-kmemleak-v1-1-e6fb2eb96e79@debian.org
> ---
>  arch/x86/virt/svm/sev.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/virt/svm/sev.c b/arch/x86/virt/svm/sev.c
> index bd70c4d0b774a3..18141c93b6d7c8 100644
> --- a/arch/x86/virt/svm/sev.c
> +++ b/arch/x86/virt/svm/sev.c
> @@ -361,7 +361,7 @@ static void __init free_rmp_segment_table(void)
>  		kfree(desc);
>  	}
>  
> -	free_page((unsigned long)rmp_segment_table);
> +	kfree(rmp_segment_table);
>  
>  	rmp_segment_table = NULL;
>  }
> @@ -369,14 +369,10 @@ static void __init free_rmp_segment_table(void)
>  /* Allocate the table used to index into the RMP segments */
>  static bool __init alloc_rmp_segment_table(void)
>  {
> -	struct page *page;
> -
> -	page = alloc_page(__GFP_ZERO);
> -	if (!page)
> +	rmp_segment_table = kzalloc(RST_SIZE, GFP_KERNEL);
> +	if (!rmp_segment_table)
>  		return false;
>  
> -	rmp_segment_table = page_address(page);
> -
>  	return true;
>  }
>  
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261102-sev-rmp-kmemleak-053969ac2126
> 
> Best regards,
> --  
> Breno Leitao <leitao@debian.org>

