Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776143;
	b=Hi/SJWQ0AW4ziUyZRB4IqM2if/cctv5XMcv72IcqxkSrTYQFPGTl3Zq+BNveEaKnPK0v
	 XM1h6hR0rSPLXMCI3oImP4SFGoGreKN0zMq5xuzMIxBQXlGGNF7AH0hCuFV2ZEDfmNS6H
	 +H7+IZY1EnxSJ/POccBFL4vr0v8AJDMEK4hEL8OPHnVAZm15okON/+HVsix1KC24sno/6
	 Pf6wm0edcVXigczAPk4H2KUKZunwjzYXvgRiLoU9USHzHSqjOwM0Kp7Ui+sCNy46MlMXP
	 fZXdPAipV+KP6PyxfKlYa1Y3ObEL63BMGr2+1wdFgymBhMi3QkfKTOsZunhhUIZI3bA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776143;
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
	bh=weHEswQWp808YXMY3btiKaVmP5F26z4VGS0f6zyy8ic=;
	b=OK7mS1q85uTQvM/zQ8LQbrAyr1aBF6EmXK73S/dOoNdqOj5zM2NpGMbA8oZ2CUY2T7X8
	 9iD3feDMOHpqchLrKQpAZO8+5b+HjZHPbX1Z5skkgmN59Cfvea/+OLwRNGppakxYgpnbS
	 7g9L0KLZqrNUMMvbHbgks64UbHNZbTGSeiY6K7l8NNy/qliFjI1s0fV3EulInP+L4EaKY
	 yH41KbJlZbeWwnjeXgO5vMIQS/KZPQgCHOKZdMJuRhNbIHlUqvN2APhOWLDxPdQhdHvOK
	 db/Fuq7VKV6Vv5p0dpr2ldkVKoXi6CMgjw33zSGkEBZn9HrIZVCdt8gLOFl7uNk5VzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=v+N5zpLI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.64
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013064.outbound.protection.outlook.com [40.93.201.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF81606A31B;
	Wed,  4 Nov 2026 07:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BF81606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=v+N5zpLI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PoD6eaXi1kmOUdLdFeuX1PI81ygsBWl4gt+/DyVE8mUQCYQI1slp6C+GQWSQqSTe9EpBXojKFJe1wpgz8wB2HcmPersWE7CH9EfAAeFukqPOum3iJEt/9PFxKDnsZTaDFGhMjHE+JJqnbtg9/Qi0cVHxo6Cc1Y1IrZeVE8m4Rd7uHpLJar+LGQdO08WBP5vQ0EOv9xxAPLN7pRNH89kz8smMfV11uu+lkJBm7Hjqq7tvSx9myTvULmPeIrc29iZg5acmC/5J1DgyFcS4FSZMKvpDykD7yqK7FusvD2/rXDnYwxvISX6m4vH+joihbqg0Xk1ZHTE+RFrLdTpTqu0N7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weHEswQWp808YXMY3btiKaVmP5F26z4VGS0f6zyy8ic=;
 b=h78jq39cU/g5ZY2kozQYw0d1TFz0gLdQbT30q1qkNcUFmhzyVswbf7kwEH/c4rFLETrkuTUKJ2CeMn8RCJUIBPtvAuHOajoI4Dfr/m6surhOiqpSrW+dkbNLqdh1X2/Jh3jeBEQg36JZ0zqjBcsW/bKLAza6aOosou4yk/jLPtMgKq5KqhvmtPMH4d3iwWHiM/bQrPkoBrTsJRVATlw1flcLTI7lIjbfGN2CCCW3JcIaeX2TefHHHagusCJOJNq+6oJ/DXJPQYA56LV00CkZhUWUOrPJuyumHCn5HB43cPZ2AiH7IbR76ezERjnearpqX7ke4oB1Lzm/AUtw22NOVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weHEswQWp808YXMY3btiKaVmP5F26z4VGS0f6zyy8ic=;
 b=v+N5zpLIeQijBNTND19PAxSCqcoONC6Q9TCZPWsON/3mcAtV0fQupZZtgWLhko3Dm4gSSDbaKthcoOKXHTIlTBY2Xpzp0ghTU6M0U6phwKsw/yedoBvOQQUiMQDTX2ESuPg8SqIRSnXKYaa38CBKDId8doCnj4b45Q38C5rcutE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6053.namprd12.prod.outlook.com (2603:10b6:208:3cf::14)
 by PH7PR12MB8825.namprd12.prod.outlook.com (2603:10b6:510:26a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 07:08:59 +0000
Received: from MN0PR12MB6053.namprd12.prod.outlook.com
 ([fe80::7657:d4df:ffcd:2e7]) by MN0PR12MB6053.namprd12.prod.outlook.com
 ([fe80::7657:d4df:ffcd:2e7%6]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 07:08:59 +0000
Message-ID: <4e9a0c81-7a79-4b1d-97bc-7f7b315db1cd@amd.com>
Date: Wed, 4 Nov 2026 12:38:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: gadget: udc-xilinx: guard EP0 dequeue against
 empty queue
To: Li Ximo <lixicaicai@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Simek <michal.simek@amd.com>
Cc: "S M, Suhan" <Suhan.SM@amd.com>, Aldo Ariel Panzardo
 <qwe.aldo@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Wang Haoran <haoranwangsec@gmail.com>,
 "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>
References: <20261103084722.1821982-1-lixicaicai@gmail.com>
Content-Language: en-US
From: "S M, Suhan" <Suhan.SM@amd.com>
In-Reply-To: <20261103084722.1821982-1-lixicaicai@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0171.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::15) To MN0PR12MB6053.namprd12.prod.outlook.com
 (2603:10b6:208:3cf::14)
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
X-MS-TrafficTypeDiagnostic: MN0PR12MB6053:EE_|PH7PR12MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: 010e3b02-26c9-4804-2921-08df3a427f9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|10067099003|22082099003|18002099003|56012099006|11063799006|261022105027099003|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	leVc1l4e+Wdvu1kDFFNdREZXDn9tIp1g/P0tNN/amPQpeYI35IcdJHxP0Wo0rri+EC9Q3A+1cvctax8GcDFHBgS1ghaoeaF89zukiq6tpvXgdg4cXhj5PcdvASZ9SUKf7QNkS+MCG3Uu8PmyYFVaW5lZQQbQGWAEIHzTDfgMddFCZKsSmBI8OuRM3vTh81hIYEHcC2vTBeFhHx5zHnF7ZSumkwEm6E2Q0o8MZu8gddKLYG9TYqvsVqbpx7utn8DUcuC++MLsXmaEKVinYgGSAa7tePm92zWntlCKlqNii+hn0z0gVOHQT3WKfPbWaB7HamGnX28LnJ8xPygJsi7iy2Ithv9AKHdHzlhhT12iGKw7f2xbevAWPSZRCTIJinHQrTxgOHggVnmDyPpEQY/wioWX3sjDpuKmP5UfcGPRgt56arCBgyBJU5slTTvPOCpgLCaJVx4dmDd7Crny+q3K9mi3R2ybVkwiLjv9D3yzOSEQyNgtmJaTynLeX0Kjy035K0hG9/7mVwSmxubJFcv8S1Vn6RFFo+7jdQldKu2OD1KwNr2qNL+NYD/1Q9zqqQihKZhpSU21cQk04WSJdQheaeUa758w01zW3821grlHDs3srj8UynI9u1o2nScj4euA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6053.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3UrRGExejgwNHY1SDNiN2IxS0NvQ0dDMFFYTkxrV1lGa1NIZG84QUp2KzNt?=
 =?utf-8?B?RWJvZm1KSk54akh4MGhGMWh1dkZiTEdISjY3eDdTODZaWFBXRzBoSkNpUFlE?=
 =?utf-8?B?ZVFlWjdZUXkrcEIzVW9WQ0FZTmkrUEFzNjJ6NE1GcldyN29ZRjFqTFBmZVV4?=
 =?utf-8?B?Sm0zV1dQekpHaGpEZURjRzZmU3JLc3ZhL2JwWEx5Tnk4SXRJZEdkZFlDUGc2?=
 =?utf-8?B?THZnbXNrTk8rdUpsZEtmTCtIRHJqTkdNc0RYYzZPRG84dHEydzRqT2xibDFK?=
 =?utf-8?B?cU5NaVQwYmdzWVRXVzhTbHdERzYvL2YrekxXa0U0WGtSNlZRR285T1EzQ0hV?=
 =?utf-8?B?U2JRRXJnd3ZWTFZzbGt0UzN3dU5GWjl1NWIxMldBKzVuOWZSZWZPZ2M3bTQ4?=
 =?utf-8?B?ZjJkaUI4Sm00L242TU9JNEF0RDNYNDNnNkdsdkY2ZnUwOElXK1haNEZBekdh?=
 =?utf-8?B?dk43YnE3SUFJaHVmUkVmUGhtQ2dQa0JRekRtem8yS2Q2Tkd4ejh1T28zMVJz?=
 =?utf-8?B?ek5iOEhmNmtmb0hXdU13T0VmK1l3MlR5K1hhemRpWU1DNVdwT2JDejZvc1FS?=
 =?utf-8?B?Q2tGT3pYMUQrd2Z3YldUZ0k2YnQ5VC9rRzNneUdMMzYrZkUrSU0xTkFkUHFK?=
 =?utf-8?B?Y2ZLRDJ5bHEvWlI2TGR5Q2Zaa0Ewb3gyZUZqTTF5Q2Y5NndCdlZ2WmQrSGsv?=
 =?utf-8?B?K0w1M3JDVUM2N3FFSkU0RGZkNzl5bXlFZUhEUUpCOGFKdGhrcFNFTGZwZ3hx?=
 =?utf-8?B?K3kyVEN6WUhwTGZrZCtBRU5CK1NaQXE5Y00rdVczeVA2bng5MzZlR2ZvYVRP?=
 =?utf-8?B?YkRsT2Y0Qi9CUlN2R0xXOTJXenJIWENjcjZvOGswSjdFanFHY2k2elUyVWM5?=
 =?utf-8?B?bXUrODM1S0x4MXRTdDhFZnNXYld3TGF6UDlnNk1EbmJWYi82YXVJTlZrMnBi?=
 =?utf-8?B?dEo0REZSbHVsM21kbm1ycUpqdlJlMXRjU2ptekNwUUdRdi9naWhxaW9DNWZ1?=
 =?utf-8?B?QXZXOVZPVzkzK0hneGl6Y25OLzBEZ3ZUd2k0NFRyK1RYS0poa295dS93cnZD?=
 =?utf-8?B?cUtBbVI3K0haYlVOZkRITE5xVmJUUDcwaXpBZzk2dnZ2ZmxCWFAvdFMrajc4?=
 =?utf-8?B?WXEzajBJaWlweHE1YjFySStoMXpjTEdlTXk2dkppckZ6Y0ljSnBGMGt3ek14?=
 =?utf-8?B?NEhzSmVKTnRVZGpuYnY1VU9LQUgxdjRoTDFWREFmZmRUVlJQK3hGMHFpYzZH?=
 =?utf-8?B?NXFEWmJJK1NaTTk5Lzc1Z1pKM01yM2FIQUNmcGZqZEp4ZFdobnNZQjRJZEFz?=
 =?utf-8?B?aWFjdW9QYk5wdEx5SGh5aXhqUHlpcVUxZHpwTE9Sd2lCb3BxR3ptU0MySFlK?=
 =?utf-8?B?bis0UjltUTIvODZwNGNYWkZpZi9XNllrYnNGNHIvMXlnT0JQN1pPdHlva3Az?=
 =?utf-8?B?M2xWLzFoREJYNVA4U1RQdFFJaUJ3OVNZcElyK1hvZlBpbmswZ3JhOVZ0RHN3?=
 =?utf-8?B?MWlFUEZyK1R6Qjg5a00yL1A3WVJSLzIwcHpNSXJZMmN0Qm1MRTNrQ05kR3Yy?=
 =?utf-8?B?RmJVdGtQWVRveEwrTXgzTmpCaGZDQVJCMlhlQ1lJeFVtSkZtNG5sNm5DcVNz?=
 =?utf-8?B?U0U1Nit2SGVGL1JWUlZzTTNsVTUzT3JxZS9MdWEvblpjQ0tvSnMxQmlNTTVz?=
 =?utf-8?B?emNUdmlrcUEyZkRGelI2ZnMwN3IyVWJvOU9Xd2RZTGlvVXYrcEJVWG9FNW90?=
 =?utf-8?B?QWNMZC9QSWNJTUY2RlV6YnZON0s1YzVBQ0N5TDJHbXZ1c0p2VURZYTZKLzg2?=
 =?utf-8?B?QkRNOUdZUTN5S0wxUWtsUTEwN1FjYy9NdWFtYm1MUUFnRVJiVzU4L1ZrdmtS?=
 =?utf-8?B?Q2wxVXBmSzJYTVlhZ0Z5VlBmZllWbXNINUhOeTBBM09tdXRrUWpkQ1RLYnAy?=
 =?utf-8?B?MHB4azVmMzNkT01zc0tUUEF2d2pHbi9Qa3lOOXV4Yk96ekFGQ3Ivb3JVcVFE?=
 =?utf-8?B?Z0I0bHlNc0R1V0NEVUdoWkRXVkwwenBQdjJlTTJZbFBLSEIrT09Ta0V4ZG5F?=
 =?utf-8?B?V0drbXIvemF6SkxNcTh6ZkZGaW95NmQ1RFJBODZ1emhibTQ4eUtMcG5WQzlu?=
 =?utf-8?B?VXFZZXE5Q01tZDFjRG8zV3RTZnJaN0oxV3kyZTRtQ2RvOThFNDJCUk5RV2Q1?=
 =?utf-8?B?U0VWQXoxZ09oY1dTVEFoMDBFS3F1SDRGVWpRdWdld0JzQWovdTFVcUxiUmVr?=
 =?utf-8?B?NzBKdkJYRGhwNGJSeGphaTBEcjZNeDRaVkRiTUZhN2hwTW4wOW9lYTNHbDVK?=
 =?utf-8?B?VUdYVUt2bVpEajBoOFRxM2hLeDhpYWJNbUgwWEZ3UVJ1VEI5RmExQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 010e3b02-26c9-4804-2921-08df3a427f9e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6053.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:08:59.7257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VB/a3dmMihubOZaXoAb2gFG53RXDfVKho9qlNBKksVU+gFRxWpWiYV42HL9NmDhIGMTOAN3v/4RjMv8QetUDlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8825

On 11/3/2026 2:17 PM, Li Ximo wrote:
> From: Wang Haoran <haoranwangsec@gmail.com>
> 
> The EP0 dequeue side, xudc_ep0_out() and xudc_ep0_in(), calls
> list_first_entry() on ep0->queue without checking whether a request is
> queued, while the enqueue side __xudc_ep0_queue() already guards the
> same queue with list_empty() and the non-control endpoint handler
> performs the same check before its own list_first_entry().
> 
> list_first_entry() never returns NULL on an empty list; it returns the
> container_of() of the list head, i.e. a non-NULL wild pointer into the
> enclosing struct xusb_ep. Switch both functions to
> list_first_entry_or_null() and return early when no request is queued,
> making the dequeue side consistent with the rest of the driver.
> 
> This is a defensive consistency fix found by static analysis.
> 
> Fixes: 1f7c51660034 ("usb: gadget: Add xilinx usb2 device support")
> Reported-by: Wang Haoran <haoranwangsec@gmail.com>
> Reported-by: Li Ximo <lixicaicai@gmail.com>
> Reviewed-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
> Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
Reviewed-by: Shaikh Mohammed Suhan <suhansm2@amd.com>> ---
> v1: https://lore.kernel.org/r/20261023073131.637062-1-lixicaicai@gmail.com
> v2: refactor the commit description as a defensive consistency fix per
> Suhan's review (the originally described bus-timing trigger is not
> reachable without software first arming a buffer), and add the Fixes
> tag. Carry Aldo's Reviewed-by. No code change.
> 
>   drivers/usb/gadget/udc/udc-xilinx.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
> index bef06fe75..032d9f04f 100644
> --- a/drivers/usb/gadget/udc/udc-xilinx.c
> +++ b/drivers/usb/gadget/udc/udc-xilinx.c
> @@ -1822,7 +1822,9 @@ static void xudc_ep0_out(struct xusb_udc *udc)
>   	unsigned int bytes_to_rx;
>   	void *buffer;
>   
> -	req = list_first_entry(&ep0->queue, struct xusb_req, queue);
> +	req = list_first_entry_or_null(&ep0->queue, struct xusb_req, queue);
> +	if (!req)
> +		return;
>   
>   	switch (udc->setupseqrx) {
>   	case STATUS_PHASE:
> @@ -1875,7 +1877,10 @@ static void xudc_ep0_in(struct xusb_udc *udc)
>   	u8 *ep0rambase;
>   	u8 test_mode = le16_to_cpu(udc->setup.wIndex) >> 8;
>   
> -	req = list_first_entry(&ep0->queue, struct xusb_req, queue);
> +	req = list_first_entry_or_null(&ep0->queue, struct xusb_req, queue);
> +	if (!req)
> +		return;
> +
>   	bytes_to_tx = req->usb_req.length - req->usb_req.actual;
>   
>   	switch (udc->setupseqtx) {

