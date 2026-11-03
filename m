Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793732845;
	b=RO8BMLWgg4hIbCg293RoI8cUOIxR0hB3Ong02AAzu6gjcyg2RxPiAGPRozZoavMdDUdR
	 7/8njDTHTPq8A7TZdhtxrXppj2PtH/7bqP8v8xc+Uc5rnKZJ4XkzLbAeZ4UQHz9UpALcj
	 Ke5/26/TzRfxc148s7ZhwT0oyhr+tkd7I/5H6XUvH0uXhbHw7TJiWbKlgX/tX8CV2aSiI
	 1V3z0WBjog1FV4fYi89N+T+NWodSTseSWLMwG8VlwUllrs4tPsUwDcG6uOLdmlFUGsWlV
	 Iq7DjWShU46hVsdoeeuEdGU2m+11eB0/OUzdB7HiwjHUSVvH6GlSlk50thweW8vzxFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732845;
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
	bh=NJJk0yXPX/jYm1loT9nY8Ht5KjY9UAo07LSBBxUi8QA=;
	b=GfYTbFzNV1FSR5VYa7Xmcdi7IpOGVeTgNbaAk5V7r5DyERLWjsfu7+lI5VCCVRXVclP2
	 7FZJ0ZLJLvsXD3AM9c8B5/H3ns6l/QiEMePfpnMDnLOPT1X5+I26upZB0sqZM3djHkEPS
	 S4sCqt+RuXfO+DBXvyIbNIBpKgYMLsSoE6lkMEIpL8RFGv8r9leijJeyVKhvezRccv+AU
	 I/ZE9CMQfthpIOM8+Hgh1Bb5oNjOYS/WZcgRerFsWOXUPNRoHKffHYEBBLTYwkYaMeQIm
	 6N7NV57J43aXrGu3xoIkrXsLtcwSETuv49FzV0Xw/adxk51Yl5FQ3fRqckFoSNxIxFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4mHmUoiS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.63
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012063.outbound.protection.outlook.com [52.101.53.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AF2606A324;
	Tue,  3 Nov 2026 19:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89AF2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4mHmUoiS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OV4qfbBB2bzkrbpLeP8t/DEZLPyQmIcQmHfZ7DPEpgu/MGX94hvegqOP3nOSVMptYziHN4vQoe5n8Lz1REZox96JF1grLrDiTfPOVQxBK+R+6EYkY2AsjkbtdC8CysaPxHGEu6ZNBJj0bMWdDpzxSjBvrZ3eLHb1LOOGEK8qu0GRcoDFCirwfoYutcUTosfaOipLWu6tG4YG33Zp3laLMtubatDjs/i/581DFNDbLZwl2Ntv6obFPzEqxFPJBqzJxP/hfDqgVLxWE4Sj20ODYSP6XVZ2xPeCXjcPpEFe+5xdkS27H0XwkvIijdHggy6uZrF4oWcA07TlJn3HfC7UDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJJk0yXPX/jYm1loT9nY8Ht5KjY9UAo07LSBBxUi8QA=;
 b=nhjDCUtaARG8pYK5L9nPU8se2HwOgZsWpilU6f03CY7AgbdYSCKsBYDw/Sss/045Kh2D4/3BhNGulaYkTKxO8osA8MMR+n8OnlTpTSfTG6h82CPOKLSGWY9BC1/dEt9JLEATwq2NNBdteqJoD5ohBrGpsyGBwr97XV03h+D4HRc1CpP/CZqAy9uB7qcvTwljJuYEqvlmPKyGqsOnGC/GC2HcXzrVa/G5UjnHwNhtXPDKO1Tv7vxHjH6CCTRHIw4B8iDr30tjD+f5wwoD893iw07xzp5Av7jKb8UXTGPKCC1fwO8RZbal/wLH7vww5ToA8VHWCEbolFtM0/9VjjH0kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJJk0yXPX/jYm1loT9nY8Ht5KjY9UAo07LSBBxUi8QA=;
 b=4mHmUoiSRNvOfTm03ttk3Zc7g/B5M0e3ZWi/m+aZ6JIzi2g0aAztrmErri2neW/E5W4mEQ3c6kl5Wyf5tTHhq58ZN9NnIKnv+mAZe/joUavx3dwMnYFERL3e7thVPxbACDNNaaVY9uSf0WS5iGzspdh7mvkNDBXcYQx/PUWFaSc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV8PR12MB9133.namprd12.prod.outlook.com (2603:10b6:408:188::15)
 by CYYPR12MB8871.namprd12.prod.outlook.com (2603:10b6:930:c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 19:05:20 +0000
Received: from LV8PR12MB9133.namprd12.prod.outlook.com
 ([fe80::d29f:9915:159b:b02]) by LV8PR12MB9133.namprd12.prod.outlook.com
 ([fe80::d29f:9915:159b:b02%4]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 19:05:20 +0000
Message-ID: <c653b237-c67f-4332-8a3f-364773366dfe@amd.com>
Date: Tue, 3 Nov 2026 14:05:18 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: amd: isp4: hold buf_list_lock while sending
 buffers at stream start
To: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>,
 Nirujogi Pratap <pratap.nirujogi@amd.com>
Cc: Bin Du <bin.du@amd.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>,
 Benjamin Chan <benjamin.chan@amd.com>, King Li <King.Li@amd.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026182442.229869-1-saif.elden.hatim@gmail.com>
 <20261026182442.229869-2-saif.elden.hatim@gmail.com>
 <bef07925-6a2e-48a1-a72a-127b390705d5@amd.com>
 <20261103150312.52812-1-saif.elden.hatim@gmail.com>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <20261103150312.52812-1-saif.elden.hatim@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::35) To LV8PR12MB9133.namprd12.prod.outlook.com
 (2603:10b6:408:188::15)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9133:EE_|CYYPR12MB8871:EE_
X-MS-Office365-Filtering-Correlation-Id: 59ac25db-6996-4b45-77f2-08df39dd6774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|18002099003|261102123227099003|22082099003|56012099006|4143699003|5023799004|261022105027099003|261026121527099003|261021121427099003|261022075727099003|261026140227099003|261009223027099003|261028144727099003|11063799006|260925021911599003|260925022911599003|261021123027099003|260925021311599003;
X-Microsoft-Antispam-Message-Info:
	l4G50FsbMktgewU1uFF0yqS6VV6NxPv/9DuIpMM+AMvf/TSDWxYMaBhnU4T05+jliDJT/CwwZOCwIp3XW84GgkKosfdWSo08ooSpdT0SZdorM13r3R5YivNTwVOg+XlxjoIK9jgGfBUC8o83D8EDtYxQ13K5hEVcrOY7pE7x2hNubWjYcNmo/Q4KZGwk1TIJ2fpUm7U9VAQSOrdnAEotMLtFrh+HnxyHlYTBxIXTvZMdm2Z19gihwN1Avc/hpEVH0NHiufZQeMrJHeRXEYFKmb+CkKk5H2ITTOvGr7bGtSgxqqtDIP+/9p9oqh3FtvwcLW5CVrxh+qJC2ep9HFWmq6mlWKpai15CKei+99wMZDLOyzsBjbWKNCGuRQb18l/phzTJm2UGuEqNM8jHWp63P24pbQ3HFjw0P2JkQJ8XMvTI+ojIhwcBjlj8wmMg8xm4V8uuhQQrF6lhFTocMFDYGL2tMYlVbYS34zmcLGom771FQChRpHoLjux29GcWJXuUFCkAiaOUR6//yuJp8H23WZRXBbv11Tln17ouwLnEOY//vz2h+EhGAb09QFnN4sKbbrqMNNUkFzS+5f8Xz5bOHrA/RhXjH3fbQnLLjayiLpDPHsf1Fq0neu3Bj9xvCJvGlbiPp5gN0nmSE61AVHf7stCF/clcP5CHuViFz5JQP00=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9133.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(18002099003)(261102123227099003)(22082099003)(56012099006)(4143699003)(5023799004)(261022105027099003)(261026121527099003)(261021121427099003)(261022075727099003)(261026140227099003)(261009223027099003)(261028144727099003)(11063799006)(260925021911599003)(260925022911599003)(261021123027099003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck9hZGVya2pPRDBDa3hwSU15NXIvZjluWEdoWTZBbFhGR0ZvU3FXS2RUNzlU?=
 =?utf-8?B?M1dqWE5Mdkl6T0hXdUc1VXZYTkxnZXVCdlVRMWIxalZKTThXQTNTU1p3RmJD?=
 =?utf-8?B?MnROMzNkalo3NkJHdmRua1l1UDNOeEo5NEE3M1hTMkhVdjZFdno3K0RobmZ5?=
 =?utf-8?B?YkJoUkFlN2FxRTBiZTJSaE1NYkdmTlVPY2t0QnlIT2JhdUJiUUw5TlRvM1A1?=
 =?utf-8?B?YkR3N01lajYzTDF4OHBFVUdSb2VLWVNNVFpGT0dFOGE0aEVEeFNDSWV4SFR5?=
 =?utf-8?B?aEtEc1NUR3J5N3N2YXhCNlFKV0luUlJQYVBvbCtnQmhQcGFaZ2xXenZzY0gv?=
 =?utf-8?B?R3NBNGxlaUhUZDVmQkd0eVg0MzdQY0JWSHZja25zdkFVYjRmN1krL0NOcjBi?=
 =?utf-8?B?NVdyWHQvVDFXdUpDWDNsZTFLWGZkeWdHUjVHRVc2YWhzQ010Mk1leFgvTXpy?=
 =?utf-8?B?RVRKOCtQT0VmWHNjc1ZUQ0NIZzNZWGJmbTZLWGtNb2VxV2xRTFA3Q2Y1ZjFu?=
 =?utf-8?B?cTNPN3lDWmtYSVo0K2xZeWNpRlIxS1BrSktRMnI2ZC9ReCtNZ0ZMaUY2SFJM?=
 =?utf-8?B?NEtDNlNjNjduOWUxdmQrZU1wbmtDSENIbVVFVCtTOHZxb1FGenNqYVQ2dzJk?=
 =?utf-8?B?b0pqNy95WE9CSDJ3WjBNY3BVcHVRLzJibXVLWlczOTVlZExxWkpsNCsyQzEw?=
 =?utf-8?B?TlBIWjVUbWNMd3dtdTV4cE93N2p5ZGVJNUliZjVHcVVlODc0bis0TlNVU2NT?=
 =?utf-8?B?WGt0M0w1Qzh5R0lkdVdOc2MySk5zai9MTzRIYWs2NFZQUlNZRHNSdWsySnJ6?=
 =?utf-8?B?ZEV5R1V5Yk9zSlBjN2RwRC9DVTI0ZUh5cTREOVNoVUVmUnZIL2ZEZzRhcXlB?=
 =?utf-8?B?SWNyQ0lhOThYUUhMZ3Q1b1E1UC91ZXB4ZUc1U1RNb2E1NnRlKzk1eGw2TkxF?=
 =?utf-8?B?RVZMZTRSYllsdXhhdGEzajNmLzFYQXRUdWJIVnMzOFp5Q3JKbldIZWxuSm8y?=
 =?utf-8?B?N1pMWXZXYmxmWkVzcTNoeEZ1R25zaVp6aWtCWWRMUlE1Ty9OeEhRVVVtT0xC?=
 =?utf-8?B?MkJ4alVJeTlUektzRmkwcmNVUmM4REpvU1JKSjdEVDFZMUswSEdRZURLSDJ0?=
 =?utf-8?B?K1oydG5BTVY1d3ZMdFprVmxQNGN5M21XN2ppR1JtTXJLRnFKbkhVV2orOWcv?=
 =?utf-8?B?YWRnOGUxVWFNNnZ6SWJWVitQZTU5c3BXQ1k5RVhTMW5iSG5TWkJrdGJ4VTZG?=
 =?utf-8?B?RE5tRFMyaGtUL1ZYUlZENVo1NmFWcE5Zc3RWVFBqbUswTkxaWDlWVnFRcEhW?=
 =?utf-8?B?aTNOMHlPcHlscWtRWjBGdHI0c0JLN2xwLzJhWkxPNzVsU0JuZmlFQlN3cU5D?=
 =?utf-8?B?dXZKN1FMVXhpcHMrTTlPdlZhLytMWmhlMVpsUWNuQzV0R0kwK2lBejBLVnZn?=
 =?utf-8?B?WUJFNFd5NHdyWmZlMlg2SjVyZUtob01EekgzWTh4ek5TbWdYOTRCclZSZXFV?=
 =?utf-8?B?YzBKaWRVdGcwclFzb2krTVo0aDFDWVpwcXZ4T1ZUeDVDQWY1VU9Ud3gvN3Vw?=
 =?utf-8?B?cndub011Y1ByYjZBQU9reVhTclI5dVl6SEw0ekVmRXE5MEFrb0hwRXFub1VM?=
 =?utf-8?B?eXVhdWEvT0k4aXJZMElvSi9IbVJQVnF0VnJEL05icUtHTENTM05BOUxmYlVO?=
 =?utf-8?B?OHgrVGVVd2J4akNGSy84L0Jsc3N6Y1F0dktHVEI4VEVYMm44Y0hNTThtOGZR?=
 =?utf-8?B?c0RncmVzbWJKU2d3YnFGckJmYkNiVVVGNk5uMHRQMlRZTE5JTzhvZWVVUUwr?=
 =?utf-8?B?TEhEd3RnaTRRUUdqeGJKRjVzQU1DTnZXeHJEelljZElGWEJieHl5d04xbGI1?=
 =?utf-8?B?VXdKTWVJK082YXVLWmdxUEhlbmRsTHRqNWFTcHkxUjBMVEZEMFVtbGpFbGxp?=
 =?utf-8?B?Snd4RU5QYXhndnpvQmFVSHVMRlpsbnp5dUo0ZXlTZ0krUlExUmtoTy8wUUQz?=
 =?utf-8?B?YVNzalZOV1lvaUQyb2MyVVp3ZE80bzUybEdGOHpSUnJFb2FxTWFPalFycFkv?=
 =?utf-8?B?M01aTi9Dcy95Z3N5S2pTdzRZTFdLZjdNRy9HR0YvUXUrT1VOcG1FdDBqNEov?=
 =?utf-8?B?SlpOa1dLZUJaMFo5MkZmQUg0TjcyOFNKTzhFWVFpNnZyNFRNdWt5V29xZXdF?=
 =?utf-8?B?UVZlc0U2TURQZWdJeUkyZUcyN1E3Y20rR250dXdadTBQenVGT2pYNTF2a09w?=
 =?utf-8?B?TjB1MEs0bXJiZllBMkx0a0hQbkN2eFU3bGsyNVR5UWc1TU5xSlgwVkNTNXpp?=
 =?utf-8?B?RmdvNUQxS1RiU2RKQjk4ZTh6UmhZK24xOFBaMzJIOTFiTE5vVXVLdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ac25db-6996-4b45-77f2-08df39dd6774
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 19:05:19.9274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9IX8oTUHezxloSHjVhyE5c98WQXsxIcatj+fQcP8jE0Z10thE0A5wRRZOsoGlIlVwEF24/Cwi5njVUCxV6TgUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8871

Hi Seifelden,

On 11/3/2026 10:02 AM, Seifelden Abdelmonem wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hello Pratap,
> 
> On Mon, Nov 2, 2026, Nirujogi, Pratap wrote:
>> I’m curious about the sequence you are using to reproduce this issue.
>> Would you mind sharing the details of the sequence and steps involved?
> 
> Thanks for the review. Nothing special on the userspace side, just a
> plain capture; the exact command from that run was:
> 
>    timeout 8s v4l2-ctl -d /dev/video0 \
>        --set-fmt-video=width=1920,height=1080,pixelformat=NV12 \
>        --stream-mmap=4 --stream-count=30 --stream-to=out.nv12 \
>        --stream-poll
> 
> The oops happened inside VIDIOC_STREAMON, before the first frame
> reached v4l2-ctl.
> 
> What made it hit was an out-of-tree change on my side: the sensor was
> started from inside isp4sd_ioc_send_img_buf(), right after
> START_STREAM was queued with the fourth buffer, and that path had about
> a second of debug sleeps in it. By the time the call returned, the
> firmware had already completed that buffer and
> isp4vid_handle_frame_done() had removed it from buf_list, so the walk
> followed the poisoned next pointer. With the stock driver the window
> is tiny, which fits it never showing up in your tests.
> 
> To make it reproducible without the debug sleeps, I put an msleep(500)
> after each isp4sd_ioc_send_img_buf() call in the start_streaming loop:
> 
>          list_for_each_entry(isp4vid_buf, &isp_vdev->buf_list, list) {
>                  isp4sd_ioc_send_img_buf(isp_vdev->isp_sdev,
>                                          &isp4vid_buf->img_buf);
>                  msleep(500);
>          }
> 
> and ran the same command again (my out-of-tree sensor start was still
> there, the debug sleeps were not):
> 
> - unpatched loop: the same oops (GPF in
>    isp4if_alloc_buffer_node+0x37, RBX/RSI dead0000000000b8), 500 ms
>    after the call that queued START_STREAM;
> - with this patch: the capture completes (30 frames), no oops.
> 
> I'd expect the same msleep() to reproduce it on the HP ZBook.
> 
Thanks for the detailed explanation, that clarifies why the issue
hasn't shown up with the stock driver in our testing.

I can reproduce the same oops on the HP ZBook with msleep(500) added
after each isp4sd_ioc_send_img_buf() call in the start_streaming loop,
and with this patch applied the capture completes without issues.

Tested-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
Reviewed-by: Pratap Nirujogi <pratap.nirujogi@amd.com>

Thanks,
Pratap


> Regards,
> 
> Seifelden

