Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793620295;
	b=Re2PzPKbPs9UswkVvG9R70bChLmEwtXEvL/6D9OFx2FI8QzwIX4nkqGDEOxEnZ4mPb9f
	 efOe4fjzGBGRtzUDfBo3CDLQx8C1GRAlkgsdffvYTN/RX+7qA2jwzCCLJACMe5HMZlMuY
	 R/G66+P3GBtT9DbzbxGaQdarc7dbmZvOAwifUda8SyZ93dueQHk8i6W3FmePKoBGvhAP8
	 adHm3jjuuVrdkyu2lTGARpV5jPD0DyxTwE5gSdOqWCH7/bZJAULs84FRd7HgA9M6w3Dbf
	 1NYs0o8iBfBmBU/AIUJs4g7m1Nssq3Mu9SVhZ4Dv4rGA/VspIWmjYXsfmNm2F6Dlsaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620295;
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
	bh=rnZmcVW4MUMMIMJfsdgbhHqxz7kCQV5HCffA9o3EzD0=;
	b=Eijp08hidrJjZHd1YgFEGD0CaH5jD8A44hlGDkHDTVirfvgQRYFVroPwRNuIV3ATfGaQ
	 YDaWj4LlfQaBn2Qk+IqcDcbDyR9F0HO/GS4XBkFmBr2fLG4kMeEY/KgPAVoaYpmpF56iL
	 BMwMakxf1lguFDjXyT9YcnlkILZhB0aBgsrGO9uILtt/4Ap0xuQqSbWyQJQDVBm3NzY3H
	 dZ6g2Vo7aTiBsci9p+nb0LsfOpMNmziHpGyFAXBWiKzy6jDaciUCkzzKijrKOp48fxzJI
	 a1Ib1cDfS3lUXqxLlQ63pMNEuJ2WnSYmnpiKqLwrfEi7wUnY1p57igPcXccWpScYktQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0Sx7pyXz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.59
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010059.outbound.protection.outlook.com [52.101.201.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DBE606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43DBE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0Sx7pyXz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oy9JhogJk2IJLsWtSjEu3EEKHOp3pOA9qDxR2W7T/WFDN4J2TeceYWPQNfJUsi9EpRpTyWCky3WOwf7o1cUqDlX9UYD7i8VAScGdLRXqk+Q8lvJGuz33JP80EFlqTVDuOSps+c3vpugPM10T4o+Ntwgn3lWQ6OxJW/ZahDDqoGFu4pZiP8AteBG4F3xvdI6CNQ6lWM12CiaaFtILa98RUReLIiXPl1zFEQY5URfl3R5PjGZzB2oPufoRwZO6nM+O65vlm8B4YgycseoV40kbszyzcQy/93VlB4fTfnm6/ItY2MOcJyBeGKMtvTrReYffgtp7FJAd0XLu2C0V6gYrZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnZmcVW4MUMMIMJfsdgbhHqxz7kCQV5HCffA9o3EzD0=;
 b=BLAP2+SxZZ8EGSY+Tyz58fxi1o3ixx9+SVQ1wBbBaszfHCxRGwopUJnumAMNiX54YIpHWAEtjctouY2daRIcgZb74KTjfQK6UCSzIHDP0/DQAtiTdWQJ+TRNpRqmKSWk90x18Blv8O1tvFTuVxAf8Re8w6o1KuQ7WHFLziyqLbGEE08jVSUWvxEbX/xCyw4n76A7hVnP86bHybZPOTX1cxTw/RZcQu65HYs9gEqIlE8FJtvINXmTfUtc622dWn8qJzrrpFou+Jy25xQ4iQ8atHLkLOWcSJIPebl6fgtbuc9KSUgTXJvOiIDE/jBqmwfdXy3lPXi0DH9/dclhUNxhpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnZmcVW4MUMMIMJfsdgbhHqxz7kCQV5HCffA9o3EzD0=;
 b=0Sx7pyXzZsHdXOCg9PtrLOc9gyAUfPlZkGTCLVlS5QQ9BE3vSt46fNydVwMrxg7CT4XFPI1qfUqa8dh4Mwk0twIR+L3EXOGjzunjhaKleO5C1CAPMAxyQyxbXnntPRc/n5//86/4wFuOrhlSkaXVXVQ0cSsfT7vP8xBXgs0dWDE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7771.namprd12.prod.outlook.com (2603:10b6:8:138::6) by
 DM6PR12MB4044.namprd12.prod.outlook.com (2603:10b6:5:21d::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.12; Mon, 2 Nov 2026 11:51:32 +0000
Received: from DS0PR12MB7771.namprd12.prod.outlook.com
 ([fe80::9a3e:791f:33b6:3d8c]) by DS0PR12MB7771.namprd12.prod.outlook.com
 ([fe80::9a3e:791f:33b6:3d8c%4]) with mapi id 15.21.0569.010; Mon, 2 Nov 2026
 11:51:32 +0000
Message-ID: <a9fb9818-39fd-4b6e-8998-761bc3439893@amd.com>
Date: Mon, 2 Nov 2026 12:51:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/unaccepted_memory: Do not accept ranges that are no
 longer E820 RAM
To: Ard Biesheuvel <ardb@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 linux-mm@kvack.org
References: <20261102113127.161823-1-pankaj.gupta@amd.com>
 <bd56cfa0-6fdc-4e83-b571-f2abf647afa2@app.fastmail.com>
Content-Language: en-US
From: "Gupta, Pankaj" <pankaj.gupta@amd.com>
In-Reply-To: <bd56cfa0-6fdc-4e83-b571-f2abf647afa2@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0220.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:374::16) To DS0PR12MB7771.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7771:EE_|DM6PR12MB4044:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e7f3d9d-2e63-44ff-e68f-08df38d7a34e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|261021123027099003|11063799006|4143699003|56012099006|261009223027099003|261021121427099003|261026121527099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NRRcgKhWNkgg3RPCrl0KyT6qE5oaPC+mde94p04/NXgX3qNW7iJtrhod29vLWev/h7J1ASBeVUeiGJqJ5bymBv0Kge3D/89dGWxC1FgkYfGetxJIwj4czmt40UhfFFE7fFWXnfjPgl9xunmXhS8gxH0YI//ITevzQ1pOQQnkiAUcJlQpakXiZ/eye6xA+IBV0mVapJKvrHpAZwqU5r7bp2J4SPBq3d6FJLJADzWz8Uf48pAqJp0eAuWTKoARp2Qq226uHNWSLgSVmGlfcyGcSo84rnA0ssESuUf8MHkgksFWJVLr+TWs8hPPR7L6qxW015n8MAE8ZkvJBm045/FQ3j1GfcCrQZ3cRQ5+BZaR6n0BoYHOwS/o/poRXUYo5XnM366uFlNmtcNed9MSw9jgsgEdnhMnL2/fK8tXF0353rJSzrPyrsybiW7xqqwQubifR71fgy737tHd7Cs9nr4iy+B7UBVIVzQZoE7zWOSXvIuzyycPNQWy9EaTMeM7eyJmc7872jG3DayuOqlvUEjxh/XhiL6JN5brEyeH0IHzdW5KfJLRoksmdiH1pSmCQIxbHJb5hl9s+4mGVjT9kQb9f1KN3N3Q+2al2xTBhSARQavG+gphelC5syAYX5FnUkmU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7771.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(261021123027099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261021121427099003)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWRqOGEyZGlLaFNCNStHZ2YzT2tlSkhvdTRCMUpBRmdzQjlWSXkyWDlyKzYr?=
 =?utf-8?B?MWtZQmJxM2t5V3hRSHB4VWlVZzdORnBDd2VqekREaDRoRmpCdGhtRkp2cHZu?=
 =?utf-8?B?MVR5LzJBRm9oVWpveEg0dFVOUFUzNTkzVkY5eXd5RFpIOFRma1k0QW95UFp0?=
 =?utf-8?B?WVo2WjBoaFpFaks5OTQ5N1RYU0pYRnNJV1c5aW91bnV3N0w0SmFRYzBocElY?=
 =?utf-8?B?K1UyVEh3NUhLNHFGOUN2N1JialhtS3dqaU1zei80VC9qZnp1bUtlSmVYMjQ3?=
 =?utf-8?B?cHNWeWJiVUFGcXFKY0M4VmFrZjJMeTkzN0xudjR6UTk5clNIRFQ1TWxscjNy?=
 =?utf-8?B?bGFpYnAvRklNZGF4NU1wV05yTUtsdWFCT1FGcE9SWlRsTGVXemdWT1p2d2lL?=
 =?utf-8?B?RnpnWlRSRjBIRXRHdi95Q0JDa0pXNVQ1cWFPb1JvcllIdm1hV2ovUFFNU2g2?=
 =?utf-8?B?azc3RXU2c2VMNGZPRzhkV0gvaENTRndvR3hvVjA2YlBhdFIrUWpwaU82d1Rq?=
 =?utf-8?B?aGxBZ2pyZmtGdGF0MW5nR2FLV1RrQUdwdXBPQmxNQkV3dFpSOWV3bU5USUxv?=
 =?utf-8?B?dmhGUkEzSm1tUkQzek1PQTArZWRFMXFNNkdYQmZBUTVsWkdURjc5VkxoaFJ6?=
 =?utf-8?B?ZDlJQU95L1FFSS8zYkRnUFM5dng2UG9Pb3VkdWhDalY4L2ZESC9NNCtmMjNH?=
 =?utf-8?B?cmVwQlpzdm0weFJYM3JCakI1UUg2VzUyZUZSNGZxenVrRkJIWjFpNHlVTGY2?=
 =?utf-8?B?MFRUa0w1bWtxbTBrckRMbTIzWVNKRmUwRlBqQ2ViK1M0NjJXRlFwM1h6Z0pK?=
 =?utf-8?B?WG9mZkpZTjZNU1lpMkZpL3NsZ3NVOVN0aGgwVE03eFdkQVY4NHdDNVBDRzdD?=
 =?utf-8?B?cmlpQ0NpTWwxT1YzM0JjdHl6U0R0WGtXMnVUSmliaHJHbHFDT1dENER6cEdu?=
 =?utf-8?B?U1UvZjFjc2ZPYlNFNUJUcm1VMjVWS2dTY3N0VGdVeVhGTERzVEJOLy9CbGZq?=
 =?utf-8?B?K0U5TCtOcFk3ZlRuMTl1MWVVRDB1TWdta3ZvOWxad2QvUmZ2Zkg4TlcxczJp?=
 =?utf-8?B?ZS9HeTU2RUxtUnBZd3JUZVVHOXBPWVd1T3EyVHZhV3V2dzhmRHU4SW9yMDJM?=
 =?utf-8?B?SFhMRG1jeVFiZFlRdHlHMWg5TE9RTzNJd2RqUEY2bmdieGFqakdOdVhpcEQv?=
 =?utf-8?B?eXdFTU85QWljOHJwVDBnMnlVSEdIWmlJbnB6ZTNJMkRxT3FKRW9ocHVLS2xD?=
 =?utf-8?B?VlJVQUpYcjFkOXJjNmdJMlZ0a3ZMRW1Ed2Y1RnhRQ1NtZ1UrV0xOQjdzcHJM?=
 =?utf-8?B?eVNlZGRmaG92bHRxekxZR2lFcWNPeXBMM3Ftc0tiOU5mdGY1LzFhcU52V1Ny?=
 =?utf-8?B?RzZKcHZ0MmRFZWR2U3hQY3ZRSEpVR0UwVzM5TkY5Y1QvNXBZWmJzdS9aZ3lV?=
 =?utf-8?B?b3BpaXk2R0xqS1hmaWRBZTVjaVhmYUd5c2U5NnZMU1RtRDBESkVLWi9rdjlJ?=
 =?utf-8?B?bThzLy9mV3l0N2dSclFKMGRRV3l0MHdFTElITnYrVVNMR3lRVGRMVW9BQUZj?=
 =?utf-8?B?NHNCUnRFUXFyUExTSVg0djVEcURYMmhSbEp0c0l0YmRjb21wVGhESzd3ZlNS?=
 =?utf-8?B?ZzB6c25Qenl2R2NheU1oZFJzekdIWWdJcXFqNGZNNm9ScmJ4dTgydlhJRm1w?=
 =?utf-8?B?ZzQ0WDRPSllpZ1JnMXRxSGt1cm1MSnkvK3BwdzhXSi9GRUtBSWprTXRheDdS?=
 =?utf-8?B?KzNkNDNuMTN6YjJWdE5LK3hPL3RaQmY4a3FZb2cvcERIMWJjSjNUczIxSzlD?=
 =?utf-8?B?NmJ5K29VZDg3eVIrSFNjUzlxcDMvdkl4bmpab2RWSUpyOTE5VUZvdWplV0Vz?=
 =?utf-8?B?VnoxOVJOcFIrMEZRZWpIVnpEZTdlRExvcmp6eDZOSys5ZUFGL3plWmZrYUdU?=
 =?utf-8?B?V1piNmRKcXg5cDQ1amxHenkzd3hTcURZSVN6ckVtdnlYY1dTNFNxdHZDczhp?=
 =?utf-8?B?cDkxNFZ4UFhwRHpRbDhiZUJhcklpM2xFaUVNWnlzOWtFdW1VZWxabnZINnR4?=
 =?utf-8?B?NjZBM1VmT0lHamkyeHZCZ3NRL1Q5NGZXWUk0WDFlcVkzMUs3NUw1Q0lqM0RE?=
 =?utf-8?B?d2lrdXdvWkJKcSs3blpCT1JGb05CbXFQOGltajFzQ0VQWitzcTlVUDNSOGY4?=
 =?utf-8?B?TW4wemxsOVptLzNKSlpEVmNzdVJUWWtGOTVMNERHdk8vTEtxYjA1MnVhd1FC?=
 =?utf-8?B?Wk8zK0JxV3FXU1pDN0paKzd3b05HU2ZvNU0zZnN4UndNUXZWeUorZURiQUxu?=
 =?utf-8?B?L1JYU3hmWXFJTXlnY0EwMzV1NHNHWEk4WDVITWVUMFIxVmc0QnVmUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7f3d9d-2e63-44ff-e68f-08df38d7a34e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7771.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 11:51:32.0433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u3AaykUShJwG8hEDYox85Gf3xojdh49oTkxg7fuKvykgAeySo6ScuW7LFf5FPwlOp5NTIpfwQ0YHRy3HGqPOJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4044

Hi Ard,

> Hello Pankaj,
>
> On Mon, 2 Nov 2026, at 12:31, Pankaj Gupta wrote:
>> The EFI stub builds the unaccepted memory bitmap before the kernel parses
>> its command line.  Option memmap=<size>$<addr> removes RAM from the E820
>> map while its bits are still set in the bitmap.
>>
>> The removed range, such as a memmap=...$... hole, is then still treated as
>> unaccepted RAM and accept_memory() tries to accept it.  The hole is not
>> mapped, so on SEV-SNP the PVALIDATE faults and the guest crashes early in
>> the boot:
>>
>>    BUG: unable to handle page fault for address: ffff8a14bfe00000
>>    RIP: 0010:pvalidate_pages+0xc0/0x250
>>     set_pages_state+0x41a/0x440
>>     snp_accept_memory+0x3e/0x50
>>     accept_memory+0x186/0x260
>>     __free_pages_core+0xd2/0x240
>>     memblock_free_pages+0x1b/0x30
>>     memblock_free_all+0x275/0x2d0
>>
>> This was seen with memmap=2M$0x1ffe00000, a 2 MiB hole in RAM, on a 19 GiB
>> SNP guest with lazy acceptance.
>>
>> Fixes: 2053bc57f367 ("efi: Add unaccepted memory support")
>> Signed-off-by: Pankaj Gupta <pankaj.gupta@amd.com>
>> ---
>>   arch/x86/include/asm/unaccepted_memory.h | 23 ++++++++++++++++++++++-
>>   1 file changed, 22 insertions(+), 1 deletion(-)
>>
> Can we just disallow memmap= when running in a confidential VM?

My experiments showed: memmap itself don't have a problem but memap with 
a hole is causing crash.

There might be some usecases which are already using this, e.g:

https://lore.kernel.org/all/20261029-cma-multi-v1-0-2cbced8b5cb7@kernel.org/

Thanks,

Pankaj


>
