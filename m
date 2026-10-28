Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793195460;
	b=tYj06/bgXzmpgUDzL5n+oGhDEbW8iNDb25F67n0Z3M0tJ7xyHCrArO1mdkONyBvEnpGL
	 hP5JnLDg0+yM3myIkpVjaPWq53ExREeHqo/F+yDtp+SvTLu6vQnYQoGougKLPPUmsOww4
	 8ItvpRtWxk5jlitsJQ7jKTspC8KZLDSu1pqwRH1JYx2bKOB5vLA0LCFJdjtBe6QrUHZfw
	 On1xlvTEJEtkOlOODFHDJAbELkiGR7N4VZwnGt2A3kYcs6EkN7HF0hbfWjn5nfEG44XFu
	 5gUREQvdh64dg7yAAUBh4Pf9vLfq/Pu9Nk3jOI/ZIX8UDJBb4vwz9OiEbLH3RH2NV+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195460;
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
	bh=Mn1AqonGscKCCdfjXQwASsIJn1ahHP6rNkFwMBm/cOc=;
	b=O3+luHMJxclxJWtiMIcyiq7cr7/BcC6t8GU+fmwx+1+ypBF5QzFvVgvM8HMl+m+0vgB1
	 atLyMuLbdCy61lw0jkgwI1T+BcsTREuFQw7SLYx9WXBgfZf4dfnPOf1Sz2CDIgFXpA+FQ
	 skzFIDPj8S0wKJ6pkqzhjPZXdpM1oAebs2QZHvCPqcTY/CX9WHdacrQ3e8zYf2alhiRVl
	 JczrxdVyezaV49g7m4PVJssZEw745koQR+bpgWwOo2zYvMgIMmnbN5praIXAg+tJdtBPQ
	 ZZKxN/o3CYBEAdx+mauq4liBaDJQT7/qrSiO1ozol6h6v0cMigLUEAAiXK+IxSe8L/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XQPLFVIZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.68
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013068.outbound.protection.outlook.com [40.107.201.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ED3606A31E;
	Wed, 28 Oct 2026 13:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0ED3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XQPLFVIZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDYG0u2tISpNbvUiOJk+IH3gx91kmmTZBUp8oV1fnNZQC5TtgMr6FvJSBdwCPfjXqVheNlUgVyFkJd2rag0Z9bZ8QMN0HP7Je2jArGBzMDibEv+bDLFBqptVUTInIsdEo4u+kAfFyrhGDtJ7UZRtsmgHl5l/vXCGtfrB/RQRSkTCq57gcQdp346qySPL6WiJdn5+OjrzLYPq28phweSWOu3gy3cVvXm0bLfvEOMbTbFm1Nlwt09gZ/TfcNYY9zZRmOs4LpfoiS3BoH+URWzU3DgvDcnowq2cqxC4g13tCZ2QRsDM6dD3OnIG0i+8Dk/mZe4xoXUb34vYvhQUC8LRGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mn1AqonGscKCCdfjXQwASsIJn1ahHP6rNkFwMBm/cOc=;
 b=Uvnl0Dpc9PFkopBKRHMrbQ6xKUejktTZoCGNU9uSdYn8jAm0yWsVyTqjEp+MYqVz6ch7QwNTyfExYWF/QgbwNJabfbfoFP+gHqDk3Ese+KZt7BNVPELNxlAiAGcPKHDEDaUzRPPAS2tuR/vCmsaoJGlZOnL3ztlheFMBSgqChPDU+94dgSiNk4BzH+oPe4V7FBkdkAKS6NLNAasjng5njCG2ERFoXvPIwHUu6hR/62Yx3mqh7RXTZ8qKVtB/ZOEME5TtU0CMt3xx/Zb+sy4A7HSDwH5iKV/9DfD29gIOGlEK8zuvx8VRv/oMZCS6FY1K+aE7HpGfJirTGFcbA04frQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mn1AqonGscKCCdfjXQwASsIJn1ahHP6rNkFwMBm/cOc=;
 b=XQPLFVIZTfGw0pV9sQcLqFA8Wgg0Ja9qaa5iNmLkBuKhb3opGbILEwS1X7Qu/2OV/QONGmHfHnzm/apYtrUR61v+sGdtraGIC+9cZKfzYK/gOY2bNCfu60+uzp1Oyh3kCYgrIAMDL6SpXOfnH8zjvjG7U2+psHwmpXKCHVbGZZw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH2PR12MB4230.namprd12.prod.outlook.com (2603:10b6:610:aa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 13:50:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%3]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 13:50:55 +0000
Message-ID: <f06b9b70-0ed6-4798-bc9d-4d340a05b084@amd.com>
Date: Wed, 28 Oct 2026 14:50:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Restore the scatterlist entry count before
 freeing
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Kevin Tian <kevin.tian@intel.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Ankit Agrawal <ankita@nvidia.com>,
 Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20261013-dma-buf-fixes-v1-1-0e2d9ca41f3a@nvidia.com>
 <20261019183146.GH64621@unreal>
 <dc91d903-139d-4253-83f7-51a78dd4530b@amd.com>
 <20261021150104.GT14213@ziepe.ca>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20261021150104.GT14213@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0239.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::34) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH2PR12MB4230:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e90672e-25c7-4dc8-07c6-08df34fa7c86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|260925021311599003|260925021911599003|260925022911599003|11063799006|4143699003|56012099006|261009223027099003|261022075727099003|261022105027099003|261026140227099003|261026121527099003|261021121427099003|261021123027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	cW6cSCfebbnuQD3ILFQZ/MT1TuoV3jAvuy1ejtjd7yj6RmyJO9X4GgMBxN/GQ80ZKEGDXzW+4IoKp+qd9xyPhbc240smyMo4brdIkdbZsepBt1PxHjAe/dGpQs1KV+q/dS3BvG1+PtGsOFY54Oa01AtzJkOXN0lTYHMxggtY+2UVq5aLcbMDJbAFsMnaAMBoEZ+Z7jUokmDenYvZqtLAECRwrzpEwvHhMO4mC5LUtBr6uV+CxjS6c2jqeIW1U+wKu/HKfKen0PpyeDDy9+urxOj3dLsuCGRBuBEbWd/sl2Sv3/dn8Id52XnEKyHMQgWzc3Q/tNpUY8t1SJaKJlqU53OrgcYwN44eMy9EpRt0OQkid6lk6cwfuu2kQ7I2EHo2lPuOTUtsDt+YMruqB6K6F1kfnKUhWt4nP7lkLA3OveXFIs19dAaqZUqvihaNq98pzg3CMseIL1w3o7M66GFljt1ofOb0NYwV7PBYbeqWEQ5vPROxogO6b25BkE1Wew9xDBDbUeXfZwCUmwsigR3DZH4HP5dDBbICSI0t05UkB9lksFCzlI1zkIKCO5xf3g/7xhrcDkHS4d205CspPvk4sWFrhHX2OjPQCJry179o9M4pwTdBaPCjL6DCBsro9A7STOJhu0RXEm2MV3B2j0LDpru2UaMz7oQEhgu8SqcWVb0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(260925021311599003)(260925021911599003)(260925022911599003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261022075727099003)(261022105027099003)(261026140227099003)(261026121527099003)(261021121427099003)(261021123027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUZkOTZyR0JBTmdob1prRUJEamdHVWRSWDMrbW1GWEpmeDc2d0NuVmg5T2VP?=
 =?utf-8?B?UW1PUGZGa2VUNnZVZHpBU0hMRk9SSnZVdjVRK0pKVmdKcTRMWVhlSVJ3SGk5?=
 =?utf-8?B?VGxsMlRxQXJMd0J6RGdONDhDa1QxSGR4eUoyOU1iOER2L3JFOXVUM21icXBt?=
 =?utf-8?B?czdYYTlRVlc2ZWFzZTZYYWtmWUh0ZUZsSjBkUXpvSTIvWk1HQ01rTmZWc1BY?=
 =?utf-8?B?aGNybkNtV3pHMlV3RFd2SkhLdTNoaWx0NVZMZ0N3VGZtWjRlcVN3enFXZ2NQ?=
 =?utf-8?B?bFFKRUQ3SGYvK1graU96NkZ0WGtZSFU0NnM1cVhBVGxXYmVxYTZGZkxENmxo?=
 =?utf-8?B?YmFtQmYzR2pHajErcUx0eWdzWGJPSU1naHJicmxPNFdZakhUUWIrNmJRcHFj?=
 =?utf-8?B?bFFpTUptVDRQWVhzdG45UWR5dDhQNXM0aFBvV1I4K013RlZHTndlN0s1K0Fv?=
 =?utf-8?B?bWN6Y2JyRy9ocXpqSTRpS0VwbmJRSnNNeGJ6VGJRdytlWC9NVTFmOWYyT2h2?=
 =?utf-8?B?RldqTXRIODRyc0FKN2c4aHN6TFBPVXZRaXN3SWkxbitwMkVvZktUZkwyQldP?=
 =?utf-8?B?alpneHdhUEI4SERvY1FGK3pkRDlzS1VyOHFXS3R5d3g0ek4yZFdqNDNiQVR2?=
 =?utf-8?B?QU43b3hZQVRDNllzNUhGd1RtVkJYaXRWbzhKTWZWZEdJRk9yQlEyNUpRcnJR?=
 =?utf-8?B?RUtRbExBSTR5cDBLSTB5VmdsdS9DZ3J0MjhrVld6YVJmY2RxRTBIcWxVSERt?=
 =?utf-8?B?eGowUzNEL3VPSUs3YnlpOTRqcko0ZTFvdnRJTFFBL1BaQjVXVlNxTG1ONy9R?=
 =?utf-8?B?ZCtmOUtTZUNNcXlIdG1TNnNOc1cxL3hpemwyUTNGcENmYzI4ODBkakNXUlVR?=
 =?utf-8?B?SERsTWI1Y3g4dG5ZM014ZjVpWjd6aGZhc00yeWI3Y01nTUpRblRxVElPS3ZZ?=
 =?utf-8?B?Y3dTUFdCblZNYlhwejRHZWRITVg0THhTODZmWGZwMWk2ODIxUWxiYTN2aFd5?=
 =?utf-8?B?YSt2YjZQWkdwQUdsOUVGRHpUalpVaFUwMW1qRzZyVW9FSGZFQVJLeFpsQUt2?=
 =?utf-8?B?dEVIWUFWdVJlMDVFcUJobWk0cy9Zc2JSVTdSQmFXLzR1UC9tZGcxVDN4R3Zi?=
 =?utf-8?B?K2s0V3E0cklBdnIvdzRqYUs1YXpWSzV4MDF1SGpaZks5SmdiaThyTDgxM20w?=
 =?utf-8?B?VzUvaVhnT2kwUzhidzloUXlITUdiZlFNLzB0cFhkVzluQksrOCtqaU1ON3pw?=
 =?utf-8?B?QUh6Ym1zVG13Vmp2WkJjNUVGYVRDSnR2M0hyMFlBS3d0Z0ZoNkZiVUNmU1RU?=
 =?utf-8?B?L2xkeWZVVkowSHl6RFZscmhaN1VKc2xjeEh1b0Y1bU1MWDBRZkdBZ1BPN2Vx?=
 =?utf-8?B?ZlZlc1JNNkUxWSt4OXoyemp5WXFNZkhVRWlpM3pjZFlhMXJid3lVdEdmYnlU?=
 =?utf-8?B?cVVRbHJ6ZE9GU3dKRko2Q3AySTZmK1hDUGFhNmhZWVRESVB4dnBkYmRzZDA2?=
 =?utf-8?B?ZWhtSWtpRmh4Q0EvWEsyVlNISTk1aitTaXZOR29XMmJ1ckt0WS9HV2prRW10?=
 =?utf-8?B?bGYyNXRGbS9xalN2N0hNVko3Ui93R2d1a29OQktIaU9uL2JUTnVybTgvTml2?=
 =?utf-8?B?RHRWT2ZMOWxteERaTDVraFlGSEYzaTBMck52Rk9mK0RnZ2orTUxFN0l3ODFr?=
 =?utf-8?B?N2dHT1hvaWNDb2Y3V3ZEcU9wekFDaitQSndGZmhTeTlnTDVYcjRFOGt2RHgy?=
 =?utf-8?B?R3piVVNGMkJ6VERDZkwvdUE3L3AyeEhwTXBiQWVGbFZ1LzByUExnaktISy9j?=
 =?utf-8?B?M0JSR1pBeS9DVUljNnNlbUV3YkZsOWpOY1pWSTNtYTc3ZjFSU0xZa2hGMEVy?=
 =?utf-8?B?UnNCaGFNOXNxOFpCVzR2d01OcUJRR2VoTVlvc2xXdmpBcXNuSFo1K3RpRkNl?=
 =?utf-8?B?eXIwYkFucTBaa3VUdi9qTTBFZVlieDlYQUE5c0oxWkpBd1NicHVaT1o2dnpU?=
 =?utf-8?B?UjdlMXppdGhSR1RTL0RXc2VoN2NrWFZCelVONW9xM200WmNuVW9nWm5vZW4y?=
 =?utf-8?B?T3dOUmJwRDZ4ZFRJM0JEVnpPOHA0azVSNXZlUzJTSFQ2c1NJNXVSMjNYR3Jl?=
 =?utf-8?B?NDk2WklXVFVaZzFqRkdLL3BWWWRZdS9NZzArQS9ubTdhWHJrcW9kcENJSklF?=
 =?utf-8?B?UkZ5aDRxU3dKMEhwenpLa2NXUVlVVGYwbUs3S2hFaWl4LzlIOXdKczh5TXJx?=
 =?utf-8?B?ME1RaUJUalZFMFJBT0c2YXg1TXBqdHVnWGdGQS81Z05oeGZzaDErYlMxZC8x?=
 =?utf-8?Q?GBx5yWvAzibEOzV1Ur?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e90672e-25c7-4dc8-07c6-08df34fa7c86
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 13:50:54.9151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvxwnndVzpxdWnZMcCrwYH/YWRV0E2TUnh3nzvl4pBEJeA0jQLtaKMtFnrk/a+5P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4230

On 10/21/26 17:01, Jason Gunthorpe wrote:
> On Tue, Oct 20, 2026 at 08:42:18AM +0200, Christian König wrote:
>> On 10/19/26 20:31, Leon Romanovsky wrote:
>>> On Tue, Oct 13, 2026 at 02:46:24PM +0300, Leon Romanovsky wrote:
>>>> From: Leon Romanovsky <leonro@nvidia.com>
>>>>
>>>> dma_buf_phys_vec_to_sgt() clears orig_nents to mark the returned table
>>>> as DMA-only. Since sg_free_table() uses orig_nents to walk and free the
>>>> scatterlist, dma_buf_free_sgt() leaks the allocation on every successful
>>>> map/unmap cycle.
>>>>
>>>> Restore orig_nents from nents before freeing the table. The helper
>>>> allocates the DMA list directly, so nents retains the allocation count,
>>>> including for chained scatterlists.
>>>>
>>>>
>>>> The reported kmemleak output was:
>>>>
>>>> KMEMLEAK LEAK: 2 driver-related leak(s)
>>>> KMEMLEAK LEAK: unreferenced object 0xff11000125ceff00 (size 32):
>>>> KMEMLEAK LEAK:   comm dtr, pid 4432, jiffies 4295031027
>>>> KMEMLEAK LEAK:   hex dump (first 32 bytes):
>>>> KMEMLEAK LEAK:     02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>>>> KMEMLEAK LEAK:     00 00 01 00 28 38 00 00 00 10 00 00 00 00 00 00  ....(8..........
>>>> KMEMLEAK LEAK:   backtrace (crc 4e8077f2):
>>>> KMEMLEAK LEAK:     __kmalloc_noprof+0x451/0x8b0
>>>> KMEMLEAK LEAK:     __sg_alloc_table+0x2a0/0x4d0
>>>> KMEMLEAK LEAK:     sg_alloc_table+0x24/0x170
>>>> KMEMLEAK LEAK:     dma_buf_phys_vec_to_sgt+0x84f/0xed0
>>>> KMEMLEAK LEAK:     0xffffffffa1ad21a8
>>>> KMEMLEAK LEAK:     dma_buf_map_attachment+0x138/0x690
>>>> KMEMLEAK LEAK:     ib_umem_dmabuf_map_pages+0x249/0xc90 [ib_core]
>>>> KMEMLEAK LEAK:     0xffffffffa138f8d2
>>>> KMEMLEAK LEAK:     0xffffffffa1396abe
>>>> KMEMLEAK LEAK:     0xffffffffa1331a5f
>>>> KMEMLEAK LEAK:     0xffffffffa13320dd
>>>> KMEMLEAK LEAK:     0xffffffffa1ad696d
>>>> KMEMLEAK LEAK:     0xffffffffa1acecc7
>>>> KMEMLEAK LEAK:     0xffffffffa1acfd17
>>>> KMEMLEAK LEAK:     __x64_sys_ioctl+0x72c/0x11f0
>>>> KMEMLEAK LEAK:     do_syscall_64+0xa1/0x4f0
>>>> KMEMLEAK LEAK: unreferenced object 0xff1100016dbf3a80 (size 32):
>>>> KMEMLEAK LEAK:   comm dtr, pid 4432, jiffies 4295034705
>>>> KMEMLEAK LEAK:   hex dump (first 32 bytes):
>>>> KMEMLEAK LEAK:     02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>>>> KMEMLEAK LEAK:     00 20 10 00 28 38 00 00 00 10 00 00 00 00 00 00  . ..(8..........
>>>>
>>>> Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
>>>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>>>> ---
>>>>  drivers/dma-buf/dma-buf-mapping.c | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>
>>> Reminder, thanks
>>
>> I'm waiting for anybody familiar with the code to review this.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Pushed to drm-misc-fixes, sorry for the delay.

Regards,
Christian.

> 
> Jason

