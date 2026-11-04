Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793791601;
	b=E694x9U0gV6/LO8ErQUlIKk24dsNCh5N8o+ewM1w2+Y5bdi6r8NXan7PWEMJnJJP6ZjW
	 doy4vbDrL5bAC7Tl6m61RjFajsAkw3CmLO1tVfgcMjBPFG6vuK4mmf9YKaKYF+L6x+pk6
	 OZvN2/3WLo3dWZJoabAqcPijH4mW1ofh0xsB8b1n77ku/CzC6TpqWBcH+SUGAo18PqY6j
	 +IDveIiG3YSVE1rHbGMYU38W+tIIR+xhVu5+uD7sY7/hE56UgLKb1j6hFdyF6yZZbu7Fp
	 U1BL37JafuLcfGDAbpaNr5I3tv9XwoagkctVRXUDrxF7RspzNKw/0DT7qirp/Irj16A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791601;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=JFCqsGtz1wx50FZUb9gJ8zmbDt5elcaXdUuFG4T5kZM=;
	b=RTBBwldAygCENXooujdQEmB+GJewFkRU3hjO6KjNNf34wLCwTc1ttmCuzzjxE0vSgkmG
	 qulgQQo5Xl04j3siLGHZTf8YAsMem7J5hjaIjJLcGonEj4H3cFvZqxh/nWi8NKf6sHCsW
	 CFA767ggYDUe+Ro1APJtMpK8l/6RLWpi+g16Lq78e+iRQvpXeQb0ECFt91tma32eyYtkh
	 p14EkAcqIjSV6PvfeRme7XtAhdWYZM8BmAfsLbbGIiHqvtwtvMzi2Wd5czz72KuzVV5B0
	 YrQ+xfiF9XLZUOluKxM5fx4tFVkb3ewS0Z21sm80tVo3PcdAz+inOvT/8umG1HJMd/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=eoYabmMZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.14
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010014.outbound.protection.outlook.com [52.101.46.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87D2606A331
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D87D2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=eoYabmMZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SuKY84zskhm2Rt2230JvcWkQl8nJJDYuL8N0VTyKvuRUunXi0rUTvCDLYRJT4j74f22sVop+ruJ/xTDpDR1yQecaxOf4FpX/9yM4xR7MJo2NnRPKIbh1syBSoOHJcqPSs7qpMisM/1V/eMDwy4fb9g+hEI4Gn6vqxBZOyQvQ3xJP4MwxLDXTwRYCIbo/JL2rOGqcvdKPZzaaBpGnPef2yjcKrRdElUHRIGUioYV8tsACceg+S30bae36B/JnPQpIfE33btPo1GvaV6StSCmhFIMwL2LvM9lgfm/g/5qXeV1jRwHmL5ts47NMOdw8u1ImoHosoavuCzKAmfo0jwBQfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFCqsGtz1wx50FZUb9gJ8zmbDt5elcaXdUuFG4T5kZM=;
 b=UViTfEzePgXVt4fCTkXdzCPJBgSh8/ukZs2OY5t5mNwXxLms3mupFE2ydwO6ipr4a/5KozwY4oSn6P//wfv3GrO7MCDJ5d0+tZgEwJtlB1N4vdzXZFDqU81hE112nUm641MWZ16/6isNkXmHgickp7uPHSxZF9qkJKYumkE2iVRPW4Rk69piH4ZljKE7uvTiogU3g0kBvx4j4iVPyG8fHSVRCCTAJG/D9ovKo4NuXhmg8EwFr4UyjBpVMXSAIBbt4nlvjB1T9dm5S+4rQ07hY6NwrSIEQucEdX1IcmoxmMtwmxs+D4RRrKp1kOFOuf1EpZopQSka8PkeXyB91nuFig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFCqsGtz1wx50FZUb9gJ8zmbDt5elcaXdUuFG4T5kZM=;
 b=eoYabmMZXVySzzkpivzd4SjWEEmFcNqvHx5g3RVQTc3S72uxHBYDTwd9peSHVCocb+cWCr9P+EXErt4iOqESCRHMyGiu0gQWRm0bYkQpdxWGrhVAZGf24bX/UELAe9rPUpuic6wRCdhMCVmvR4pizSh9aFLZLKo6y+CbSK3lM+I=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by LV2PR12MB378049.namprd12.prod.outlook.com (2603:10b6:404:302::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 11:26:37 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 11:26:37 +0000
Message-ID: <98df2f8d-14c9-44f7-b25c-b0d4cf359647@amd.com>
Date: Wed, 4 Nov 2026 12:26:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: xilinx: Request pre-allocated peripheral
 nodes after bulk release
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, git@amd.com,
 linux-kernel@vger.kernel.org,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
References: <20260923100343.3147243-1-jay.buddhabhatti@amd.com>
 <20261019102110.3448932-1-jay.buddhabhatti@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20261019102110.3448932-1-jay.buddhabhatti@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0190.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::15) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
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
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|LV2PR12MB378049:EE_
X-MS-Office365-Filtering-Correlation-Id: bfb98443-c476-4f64-2830-08df3a667d73
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|18002099003|22082099003|261009223027099003|261022075727099003|261022105027099003|261026121527099003|261021121427099003|261021123027099003|261102123227099003|4143699003|11063799006|261026140227099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	UAJbDH7EuyjjMUpYjvDJ45JdCMBf2G6dwvX9zqHJYLzEpjjGwIJzw0K461fJsQObrd5ANfo1kD8hRJdLQveZ6CewzrNfHrr7If9p7hvzL6LRc/pa10jq+sSPPZyRH8RqmYh7TdnAwBKY5CqfSauUByHSl83TKoeBhrxysZ5GYz8R/f+Y++/+1PCOnNilIYr+OogDDOTR3pBpdYvUFog7X28x/D8iphoLeVyb9ZxgUIh3l3PA2xr4uCVCe42FVKr1Ashlyucl6AsoP4esStHhXL7+VJOrHYy60w19VcKbQDtYlmrM4322x8sT60cSlG+i0esPnbGdNsDOXTbeZvetJNVIWW5h7HduouCreJzBMM47p5/B2TmRXyMQL/p0Wd1E/vxE/iTOLAuZRHDArWaQ+8kyYDK0mL8DGfLCEZ1j82LI5i9pdl3RgBt9dqDGDF5pSkikxfek3ucGMBJy9K+KFbzpLA+arDeAAvKV68yJeGRn29i4fk2sHrbMP+V2h+tu/LRcvq+ElmIteIVkaVRPa2HDmdWmD7JFBwpm2fHSVNJKE5TVY2zlwDKSVhxtd1UF6MiABPowV523SMWo4hz+gHHNoFDW/tVqZX6IxLNXNXbL3lqLZe+PVIDD1SJlVwWz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(18002099003)(22082099003)(261009223027099003)(261022075727099003)(261022105027099003)(261026121527099003)(261021121427099003)(261021123027099003)(261102123227099003)(4143699003)(11063799006)(261026140227099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0Vka1VCVUp1YTZhbGNjbWhqS3pyeHFOUUphMndBam5MWTlXY3Q1czR1MkFN?=
 =?utf-8?B?RlJaUHdZbE5vdnBjUm50NXRrQk5RaCtRRmE2blM2TFpQSURpazRKNG9ISVRR?=
 =?utf-8?B?RWhWc01GbmFja2wyaTcvbWdFRXc1R0FBWUNWWmh5K3Nsb1U4anJ2ck15amVp?=
 =?utf-8?B?Z3RDQXVwVHpoNHh3bE5IUU5pa1hUSnoxc2JsVFFlSmw5S0I4dHlNdER6TW1R?=
 =?utf-8?B?Q2RtK1VkWHc4L0hYVzZrMmFNRDZxSGhVcmtNMUtqMzZnQ1RQbngrVzZaUStz?=
 =?utf-8?B?KzdJWWNJVWZlNDFTZ09IWmVXYTZ0VVFUNWxXK25uSGg0UzBjR09RbUlzcm5I?=
 =?utf-8?B?Y2YwVVplQ040U1k0bFdVWDk3UE5Hd0l6ZE5zVXo1Mk5hQU1senVyU25FZ3hD?=
 =?utf-8?B?VTR2eXUrdVJNVmNMREl5Q1RaQ1VZOEtyZUdaVnh5bFlscEc5bUI2MUFOVjVS?=
 =?utf-8?B?VFdhNm94MVBaSlB1YmxydjROd1FKdTgwTThhWUR1cEtXbFhpWkg1MGkzVFJw?=
 =?utf-8?B?dm5paU1pc1owSjdEQXFKNGQ5czdabFFIYmZwRlFRbnpIREwxbjJPa2h2QW5o?=
 =?utf-8?B?alZrZGVsaENYSi9KUHA0Q2lmSjdKNnJEaGl3L0VUNmVuKy9xcnFxbHNXZnYw?=
 =?utf-8?B?ZjgveG5UeHZNVjY5ZlM5cWNmeHJBVFNENEE2YUR2azdEb3NXSlg1ejFWNGJa?=
 =?utf-8?B?TWFOM01LNEhydVZKSDlWOHIzeVNKNWpDU0xETFBZT2ErS2xUNFRndjllaHVX?=
 =?utf-8?B?WmVBTGNlSXZ6dGp6VEQ0ZkJQQ2E3d3hFSHlZUGdyWE4wOHFOL0VyaWl2b0M0?=
 =?utf-8?B?Smg4enExMmVEVXlaM3FrRWNIQjZKQ0wrd3RtaVBRMENUZEFTcXdWRDdXVWp2?=
 =?utf-8?B?RVROT0t2M1E2eEhWdXZ4TzZtYmMvVkMxQUg2VVRaaVU1ZW4wR09LZ2xmK1RB?=
 =?utf-8?B?MEtVWkhmSkhURWplVjNIRXlOOVZ2Q0FUMVk3aTZXdlljK2VOc1NrQVhDQWpN?=
 =?utf-8?B?TjZKTmNqN0Z6TVcyeGs2MFRFZUxxN2FISkZyUjlzSmJSNUxpN0JhUEFXNVlT?=
 =?utf-8?B?UlkrYkVoY1h3Uk4yY1V3bFNxdldjNnJjVUE5K3BEMU0ySmd5N3M5eHo1dDlY?=
 =?utf-8?B?VFVxVUtodUIybUFyMmRMVjd5WXo3K0Jscml4OUdVV24wZTltL3FYVXpBdnRi?=
 =?utf-8?B?MFBoUjBGTGQwMk5WN3AzWndwVHpibE9ISDg0OEFwVmtSNW9XcWpFZUFuZW82?=
 =?utf-8?B?WHdiMkc5ekJuTHA0cFdFbTh2Q0dNUjNvSDZFSnNZdC8rbDVUcnJuNkxPZ3ND?=
 =?utf-8?B?MUgrVFAvUWVocjRHL0ZyVVo4T0VYUkpvak0wamc3WkVxZjVicWpWNkYvK2VG?=
 =?utf-8?B?UW9LaHhSZjVLcUN1c1R4czhjKzJnTHE3cy9VRFAwbnlDOGtaOWJwb1JHT29X?=
 =?utf-8?B?Q1BkWW9PclVzd25IOStTUHpFVHRSdjRtTU5DcHdmYkFqQVFTRVhmQS9rTGtD?=
 =?utf-8?B?dDh6T0J4dEZjMDlTQkU2MUlHR2k4WG1wTGtGdjArd0NhOVp3S1pDcGpkOFFq?=
 =?utf-8?B?TUJQWDNFb2FhNHNpS3BxWUlwclRrWHNaZzQ0VVlCdFkzVmRXYVA0UVpuZkdX?=
 =?utf-8?B?UGFTSVlNSzYwaTdyZmRQVDUyWVZna0FxcnhEaFFXeE5sUDBJaDJ3dzhVbmph?=
 =?utf-8?B?NHRJYzFmWkphdVVoMFJjSDVxTitKSWhCbWJnQmIwNjExdkRqY1BVelVIVm9u?=
 =?utf-8?B?NU8wTlkxWWRIdDBoUkFScmJzTGdsbkhjZndzM05mTU92N3ZvVVNLRVdQdVE4?=
 =?utf-8?B?QVFSRVJTeGJPQ0pxQ29tOWFwR2FiUTREMUJmWFZudHM4bVlaOXBHaWJSMGd6?=
 =?utf-8?B?TC9rTVljQWM0cEJ6OVRCZ0ZKMVFnMzg4ZnFpTzZJcHYxbFJVajA1aUhWajdp?=
 =?utf-8?B?Y2RuaVdjdVQ0c2VSaWRIcUNDalNwTGRwcmNodm11NFB5NTFTZFRkeGlTNHVZ?=
 =?utf-8?B?S0xHMzFDTVNTNWUwc3EraS9LdUgvYm5BcC9JOTZJN3I2RUVRdnpSQ1pIZFVU?=
 =?utf-8?B?YlFrWVFpRjJJMjVzWlduRHlDQlh3TjhWQXpXeWlxVWJMa0lPUkFLVmdsZC90?=
 =?utf-8?B?OWJrZ1dSaytuRDhuNGVLb2VwRXBzT3N1SVBUbm00R1duV0dSSzhLU1VVMSta?=
 =?utf-8?B?SmJTM1ViN1BkLy9RUzVXQzQxeEZOa0NXSWhvK3gvN0hBcU43MDU2VXYwVHda?=
 =?utf-8?B?NHpUWHJqaUU1MGZCcVMxM3MyOC9xZVYyUFIzeHhPUUQ4cHR5SGZuTEFrZ3BV?=
 =?utf-8?B?RkxtS0VydklUOUJ6TDVlTnJSV2xrQlZMS2lEVmV3SUgyRnYrM1pIQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb98443-c476-4f64-2830-08df3a667d73
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:26:37.7246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AnmjU7f4WqHNJNQXZK/sCLhlEUPu0x+CvqjniP/8JmxYn9DEC+t15jBZ+KKzqw0p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB378049



On 10/19/26 12:21, Jay Buddhabhatti wrote:
> During a kexec restart, zynqmp_clear_pm_state() releases all peripheral
> devices via PM_DEV_ALL_PERIPH. Pre-allocated nodes are then left released,
> so Linux no longer owns them and later peripheral access can fail.
> 
> Immediately re-request those nodes with zynqmp_pm_request_node(
> PM_DEV_ALL_PERIPH, ...) so Linux retains ownership. On a graceful kexec
> this runs from zynqmp_firmware_shutdown(). On a crash kernel restart it
> runs from zynqmp_firmware_probe() in the reloaded kernel.
> 
> The bulk request depends on firmware support for PM_DEV_ALL_PERIPH
> (PM_REQUEST_NODE feature check version >= PM_API_VERSION_3). On firmware
> that does not implement it, the request is skipped and a warning is
> logged. Errors are already logged inside zynqmp_clear_pm_state() and
> zynqmp_firmware_probe() does not abort if the request fails.
> 
> Also, drop the redundant ret = 0 assignments whose value is overwritten
> by the next do_feature_check_call()
> 
> Fixes: 84dbfa5519cf ("firmware: xilinx: Release all peripheral devices from firmware")
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
> Changes in v2:
>    - Add Fixes tag for the bulk peripheral release commit.
>    - Add Reviewed-by from Radhey Shyam Pandey (v1 review).
> 
> Link: https://lore.kernel.org/r/20260923100343.3147243-1-jay.buddhabhatti@amd.com/
> ---
>   drivers/firmware/xilinx/zynqmp.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
Applied.
M
