Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794859704;
	b=V3/CtIulRUBKnBtrxJbj/ZHH95fN+pX/PFC1n2MwnXouTx5aUA16QQlQuLxPk52gsMQ9
	 dWiyabhQEzOKwcQHmFriN0qu3Mgafe0dEMziqGEpRxOH5UA/4Hx1wfNfx3qie+M9IymgD
	 oNdp1aNL20YYoPZPW8QxiRQf28c/WJuCrh7rvsrhXnfOXhmEo2XoRINt6O8wLpYpgl9oY
	 w0igr6jjUGN+MnsA4bBU620sSMktLrGUSWDSMam15zTGbOmXEHZ4Pb83oOkRSe249a7lX
	 gmvqxKtIjC21GrpTBAlnrdc6QYJK3J1Up/j/7Z/w4mEaX7HCOtA4EHHAJymNFpoXyFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859704;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:In-Reply-To:
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
	bh=DAJ2m9wRvb0+1hb7/1SydL9qyN+cMUlmIXmuORmESEg=;
	b=Rmtkd9gZU1enp7KHl5irVIccFy8+BFFMRqsdLSS8Lirw/uH6TNN0g4s5BQCv9xcJPd6x
	 NnliQvXF1Ac6126/Pi2Eul1VIGxyCZJ4zobp0sD+ohs/6UepDogF+Z1Iu71BbUguHBxTl
	 suO5BW+Tdv3uyatO2wY9w1mhcV0AiqRifNnF3vetjBa/sAXZZRx6oM4wLnaW4di1Tv62E
	 dxsUWgCguEDz90PUl/H9h1GI9dwAEIurCUGy3u6zAGbg+y7x0vWvVR4DQab/MYq15rvpI
	 E3qQNSHdq4/ogkQSDWVZRlUNny2xpuNiKZxLNPQyw/Nc7AuoRuwuVnWjJBmDFQ14mNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=AghJH5J0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.21
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012021.outbound.protection.outlook.com [52.101.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75E7606A31C;
	Mon, 16 Nov 2026 20:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B75E7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=AghJH5J0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MonLv8Oz4QWtnyI0m+NacWeWNfCy62ZTjXeYy71I3A81nW8R2jznIfJFOIAOVhQmzFvOe/dG5hZyjqi8fSohK9Qn5lu+oFW6oYAKlplEz5eQ3wD6fYFOTwgHe4azFCq8Ex1+cpz2NNTq3dCB/Ebd70+tL5grI2wGk8hgLOWFwrAI0D14Y/Bwqoi4AkaAlkR02y1wvqpGyjhCGqEuhzjfhAbZCMTUcl+wZSrt/MemEVTcNRmi/f6jd8J3ySZbalBLVimvNX/isXOqVEyKqPFABi7/tDE6jIx1ap9G6QfuCBDijnFCiz27vKyCXeQdH9VAXn+Wg+lRnHvOW3c7Ws9Zjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAJ2m9wRvb0+1hb7/1SydL9qyN+cMUlmIXmuORmESEg=;
 b=roBOwC4IWsfoIlFlmtu0oy8q4q/kzGpkd2JyMhGGDeJqs1EWSEG76660I3jDT4uJc5M0Tb/7B4W5gW5C/EHIXmB6ddshhmHl63DPkuhfgu2NR9tJmpHQnXNLqjzs/SSHKVSa5E7fiO76kWNsV2nvTOp+M56/KFlVabGj2Nk/Kuv8pESAz2NJvsRj+jwe5FmsPe4SEnhbNnamooL+6+f+5eS1TCp6DOHKqJl2cwkUhTXxBEPTDeUb30xX1ves8Z1c3JzFEOA832RHQ+OIvO5zLc4rxm0y4WBVglnVImwJ95hYkQR6k86MKAymUUBoj2ijrRDXO+zby/vSrYtlVfIYww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAJ2m9wRvb0+1hb7/1SydL9qyN+cMUlmIXmuORmESEg=;
 b=AghJH5J0CRoLEbK4HrVT5Fbeb0GRstzkZKqXqxKzoHzFHk+6t73tDmbuyFOFJBzormVGpHvv+6cStuA6syIA3a1L9sOpJyfQ1hJN4QURpdqZQg99meSaz0s7SrqugGD1aA6TDaCwOi/TJV5ozMlP85EODLisKa0n1h5Aej9ZLcI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by IA0PR12MB8648.namprd12.prod.outlook.com (2603:10b6:208:486::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 20:08:06 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 20:08:06 +0000
Message-ID: <79684ccf-9b77-4c2c-8f86-0fee306a8745@amd.com>
Date: Mon, 16 Nov 2026 14:08:01 -0600
User-Agent: Mozilla Thunderbird
From: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v7 13/19] x86,fs/resctrl: Add CPU hotplug support for
 kernel mode
To: tony.luck@intel.com, reinette.chatre@intel.com, ben.horgan@arm.com,
 Dave.Martin@arm.com, james.morse@arm.com, bp@alien8.de
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 x86@kernel.org, fustini@kernel.org, tglx@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 rppt@kernel.org, arnd@arndb.de, kmehltretter@gmail.com,
 dapeng1.mi@linux.intel.com, elver@google.com, enelsonmoore@gmail.com,
 jlayton@kernel.org, seanjc@google.com, ewanhai-oc@zhaoxin.com,
 binbin.wu@linux.intel.com, nikunj@amd.com, ashish.kalra@amd.com,
 peterz@infradead.org, superm1@kernel.org, thomas.lendacky@amd.com,
 prathyushi.nangia@amd.com, kim.phillips@amd.com,
 ricardo.neri-calderon@linux.intel.com, darwi@linutronix.de,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1794437052.git.babu.moger@amd.com>
 <a46c34d2cb1cf11daaece5ef49f7e7936082d026.1794437052.git.babu.moger@amd.com>
Content-Language: en-US
In-Reply-To: <a46c34d2cb1cf11daaece5ef49f7e7936082d026.1794437052.git.babu.moger@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P221CA0033.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::16) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
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
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|IA0PR12MB8648:EE_
X-MS-Office365-Filtering-Correlation-Id: 121c283c-42ea-4979-1eea-08df441d5394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|261102123227099003|10067099003|4143699003|260925022911599003|260925021311599003|11063799006|5023799004|260925021911599003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261022105027099003|261021121427099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	tR/irdM22EXBh6a0fCP/FD/ytd3BeLHWH3pYPw96j9DoK/NTAWzqIbPjg5fpMZaxWCtnQBgPq1Zkd0sNx2vWSruvGIufEVnvLOA93tPOlS58QetLq2Q7suV57VISscxISeNHbuL05tCRzIAk2F+6okbbieV/Ox3mmMbzYTfYhrDgPrdoux5CLf4G3V+OmogtL53NZZ7vXBsEQ09wwZF4rWWouzdIVn584AN5aEC9zC+ngDSHYJN0ymJu5Mnp35Ej+obwouB8c3TNKkdsdeR6bi43ht1WoMlhxtAoCEjvzattM7tZQ1XV6AJAXQHCoZh5diaF4VNhLYkXvg6Qdh8Efamhvn/hwFODPE30QiWbBnGKtkkR9Nz5bFnYKlTFpMaqAozDqzX5UBlFFo0f4pe+g7G4RUkZWICBaSAPk5vCVEJ8INCSXY2bi8f5zEMnPe544BDMuGs3ozBs6+lDJnomnPFjuYE5/L60ExUCgaipENusmZddHll+V7psuOmTSI7Y/DbwWkVKRlcEktmfk6BM6EOWOMVPp+UUusyghNRDFhi2tVKSV2KAN06jHeJS2Lz3KAsM55QIGOxk0B0lU/LFf98nXAa4vAAclBVghbWINRI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(261102123227099003)(10067099003)(4143699003)(260925022911599003)(260925021311599003)(11063799006)(5023799004)(260925021911599003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261022105027099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qy9XQURvcGpjYjU4S2dHSmh2VXV1Rm8zcUJXQW5IZmpnajk3UkZHRXVEL05H?=
 =?utf-8?B?ZkJJR1hPT05Wd0pqNldqWVZFS2NLMFBBRlBpK3g4YWZTbWYrRU0xS0pKZG5u?=
 =?utf-8?B?NVZNOXB1S2ljRk90QWErRlFmMXVDdzhIZ1VkWVV3Y1I3dEFuV0ZDTUI4VDll?=
 =?utf-8?B?TTFJeTU4ckhUK2cyUlNBWHJJMXNiQmpvai9qK1hxK0Q4MEtTMzkxWlV6VDN6?=
 =?utf-8?B?K0J3ZHh0M2M4aGJvZitzc3FoOXhCSW9MSi81T3g0VnQzWkN4WUZwSnJNZURO?=
 =?utf-8?B?UmhUUmdOYUxGNGZNS003L1FmSUhUN0dWb3lLSCtNSWkrOWIxRzNaQ21yUFBF?=
 =?utf-8?B?ZEN6d1JPTUczazRTUHQ2NVNTU0RDSHJpM24xdHRTMm4zSk0ydFFrc1ZzdWRl?=
 =?utf-8?B?TUlmS1NJOG80TDVEVVRBTExZYXZkem1naFM2SVNxMzJrdkt2enR3ejJpR1Ni?=
 =?utf-8?B?d1NYV01rNXdWeU1uc096TVFodlhWeUdlT2xsNmo2d3lqcVI0S2VFZTl3VVk4?=
 =?utf-8?B?UUJnRWJqd0tmN2xpR0Z2MnFmbU5GellxQ0VPQ0pQblpsb2g2VGZDSmEwRy9V?=
 =?utf-8?B?THFHRk1Id0NZVHRvRGE4d1ZJaGRCcDczVFlxWUszZXZ6bm8rWTFTcUN2MHlM?=
 =?utf-8?B?ZGRsc1BMRGxGbUZSWTJ0ZEEwQUNJQTIrRUI5em5MQVB3dmtnTm1PbDU4WFpP?=
 =?utf-8?B?TkNrN3hNb1VmaHA5VTBGTUtISnhGWVI5VjRiL0dSeisrMlg4bW5sTUV2Ylcw?=
 =?utf-8?B?UnU2T1d3NkxKQ1RqemFtdThSalNHZW9Ka0g3UUNwb3U5MHFyZGxVb2M4bFBu?=
 =?utf-8?B?Y2U0OXpwNDZDd2d6Q3VnanBRTHlsWFBBcTBWeGlIWGxOM3BLUnp6N1RrWHJ2?=
 =?utf-8?B?KzZ4WDUzOGFkS1NhV21hUUZPQ3N0dWppOS9TZlBhUzYvN25iblhGbXhoeVh6?=
 =?utf-8?B?bDZCUXJKcm5IV2VkRUh6MkRLQi9peFF3a1FqNUg4YjNNc0FVWVhWOHFOY2dN?=
 =?utf-8?B?K1BwclVVdmphM2tDL25CcVRNaW5HdGRUVUptaUFpQzVEYW9scWh4UFZSRmhG?=
 =?utf-8?B?OGkyVmpkdnJCdE95YW1pVFVaVWVPMnNqMlNyM0xLYXZ1TDdIQkx6ZTFOTEYx?=
 =?utf-8?B?WGdtTWpScGhHQjY2dWJIL2hXVU81RWdGcm5qTnhHbXRDNHpXa1dEWk0yM21x?=
 =?utf-8?B?SHVnODhtMzRMd2tIZUNyMCtoWXhYdU5zeUg2QUlib2hremVmNEVIalJQOWNH?=
 =?utf-8?B?RTgwUFIzaUo4RiszZ0ZpVUp0YmVYWjlUNldJRHJDVFBXbmFmUEl4QXJMRzdx?=
 =?utf-8?B?TWxaNGdZeVV3TTdHWU52RFRlYldvRStNcVdLK0pzVkk2MU16SW44VG02ZGRq?=
 =?utf-8?B?a3JrSEZBNWs1RDVNc2FIY0M4dHZ1Rmo2Rk4yZGNoWHRmdzB1UlhNS3E4RmZr?=
 =?utf-8?B?NkpyMVFNekhpZ0FaNTZqdCsvYmFzeENMQUZrbXhjcVN5K29nSmZROFhKZkpw?=
 =?utf-8?B?RExSSG1MS0poUHpWQ1hIOU5xOWFpTWxLUzZwTkc1ZHp6ZmNxM2F1M1RHYmEr?=
 =?utf-8?B?K1RXaHdpa3JGcVNyUll6R3VFblFJUGJtZm9TZDJURGlTWmswZXJEZ0crellt?=
 =?utf-8?B?ZmVjcXBoSk52NkZKcDJKem5SYkhOTk9zcUhOTXNCaU1lSDFMa1cwWEx3UFRK?=
 =?utf-8?B?b3BtRHhiSTdrZHlhclU5UEV1Vk55Q2huUlpMQjlxZEwyR1FWemQvZ3ZZME9Z?=
 =?utf-8?B?d0hKdS81czI1TEw4dU5GUUpFY2pibmh6RExSKzBkU09DWW5NeDEwVzZ5YUxt?=
 =?utf-8?B?NklGZVdmWGpCQ0FxNjZjK3UrYmtoU0Q4QldhN0huVWN0VFU2MnRlTTEwTTc3?=
 =?utf-8?B?RHphYTRobE0xVFR5cjh6M0ZrVk9BUDFWV0JVR0Z3a1EzQzBNd2xJR1h2T3hy?=
 =?utf-8?B?TmxrY1RHZ1VKTUl3WEtzUFhrTmhHbW9Nblc1eGNjZzFYOWJIRUdKcENvcStS?=
 =?utf-8?B?Q3NORkFZR1oxM1ZUcFVRd2ZDanFZQW9GVW8vclRXMjJlN05GUFA4a3cxbWxt?=
 =?utf-8?B?WnAyTVlVVWlUMEdXblgreGJDN0xDZWZLM3JyWDFlck0xa2pRandnakMwbUpq?=
 =?utf-8?B?YkhNbUphV2p2RFlaenRmMkN4UEdXSlpPdzJucDVPd1hUSDVwMXZwOEFSYSs2?=
 =?utf-8?B?ZVhQOXhRRDRmQWdnQVBLLzJUYzZLK04wZ0V2ZmFUWWhaOWpDTnhXS05oY09w?=
 =?utf-8?B?QzVnZG9yVStsb0xrTDBsSnR5R2dTMGhGb0pOUHNEL1NxdDZNa3A3VHdkTHpI?=
 =?utf-8?Q?dj0K2Xw6kQ2sL1mzhU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 121c283c-42ea-4979-1eea-08df441d5394
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 20:08:05.8976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1zc7g4VMErWrZOlH5ftB4mzc3AxmReFwsMH2OLG6nMOSjUbpBhbVBEL1U70REVt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8648



On 11/11/26 16:44, Babu Moger wrote:
> The RESCTRL_GLOBAL_ENABLE_PER_CPU kernel mode allows the CPU's CLOSID
> and/or RMID association to change when transitioning from user mode to
> kernel mode. The mode is enabled or disabled on a per-CPU basis through a
> backing resource group. CPUs that come online are brought into a state
> consistent with the active kernel mode, while CPUs that go offline are
> removed from its CPU mask.
> 
> Integrate RESCTRL_GLOBAL_ENABLE_PER_CPU mode with CPU hotplug handling so
> that CPUs automatically join the active kernel mode when they come online
> and are removed from it when they go offline. Also, ensure the register
> state remains in a consistent reset state across kexec boot transitions.
> This ensures that kernel mode behavior remains consistent across CPU
> hotplug events and kexec transitions.
> 
> Introduce resctrl_kmode_global_online_cpu() and
> resctrl_kmode_global_offline_cpu(), and hook them into the existing
> resctrl_online_cpu() and resctrl_offline_cpu() paths. Also update
> clear_closid_rmid() to reset MSR_IA32_PQR_PLZA_ASSOC register across kexec
> transitions.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v7: Changelog update.
>      Code comment update.
>      Added changes to reset the PLZA register during the bootup.
> 
> v6: Update the changelog in non-bugfix form.
>      Update the code to remove rdtgroup->kmode.
>      Introduce new wrapper resctrl_configure_kmode_global() to consolidate
>      architecture calls.
> 
> v5: Added resctrl_kmode_offline_cpu() to disable the kernel mode
>      association and update kmode_cpu_mask when an associated CPU goes
>      offline.
>      This addresses sashiko comments:
>      https://sashiko.dev/#/patchset/cover.1783461016.git.babu.moger%40amd.com?part=11
>      https://sashiko.dev/#/patchset/cover.1783461016.git.babu.moger%40amd.com?part=10
>      Also moved the patch earlier than patch 10.
>      [RESEND PATCH v4 10/15] fs/resctrl: Reset the kernel mode binding when an rdtgroup is removed
>      That seemed much more clear.
> 
> v4: New patch in the series. Patch taken from:
>      https://lore.kernel.org/lkml/20260611111706.1981788-5-qinyuntan@linux.alibaba.com/
>      Updated the code to enable kernel mode by default whenever a CPU comes
>      online when one of global-assign mode is enabled.
> ---
>   arch/x86/kernel/cpu/resctrl/core.c |  3 ++
>   fs/resctrl/rdtgroup.c              | 56 ++++++++++++++++++++++++++++++
>   2 files changed, 59 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> index 14530c11bbd7..d7faf30c2885 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -704,6 +704,9 @@ static void clear_closid_rmid(int cpu)
>   	state->cur_closid = RESCTRL_RESERVED_CLOSID;
>   	state->cur_rmid = RESCTRL_RESERVED_RMID;
>   	wrmsrq(MSR_IA32_PQR_ASSOC, val.q);
> +
> +	if (boot_cpu_has(X86_FEATURE_PLZA))
> +		wrmsrq(MSR_IA32_PQR_PLZA_ASSOC, 0);
>   }
>   

Sashiko reported:

https://sashiko.dev/#/patchset/cover.1794437052.git.babu.moger%40amd.com?part=13

=============================================================
commit 87e9e9cf13d544344f9797647860bcba9ffab37d
Author: Babu Moger <babu.moger@amd.com>

x86,fs/resctrl: Add CPU hotplug support for kernel mode

This commit integrates RESCTRL_GLOBAL_ENABLE_PER_CPU kernel mode with CPU
hotplug handling and resets MSR_IA32_PQR_PLZA_ASSOC in clear_closid_rmid().

> diff --git a/arch/x86/kernel/cpu/resctrl/core.c 
b/arch/x86/kernel/cpu/resctrl/core.c
> index fc59d66f77de1..33965b760aed0 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -735,6 +735,9 @@ static void clear_closid_rmid(int cpu)
>  	state->cur_closid = RESCTRL_RESERVED_CLOSID;
>  	state->cur_rmid = RESCTRL_RESERVED_RMID;
>  	wrmsrq(MSR_IA32_PQR_ASSOC, val.q);
> +
> +	if (boot_cpu_has(X86_FEATURE_PLZA))
> +		wrmsrq(MSR_IA32_PQR_PLZA_ASSOC, 0);
>  }

Does zeroing MSR_IA32_PQR_PLZA_ASSOC in clear_closid_rmid() clobber the
domain's active PLZA configuration during CPU hotplug?

When a CPU goes offline while RESCTRL_GLOBAL_ENABLE_PER_CPU is active,
resctrl_arch_offline_cpu() first runs resctrl_offline_cpu() ->
resctrl_kmode_global_offline_cpu(), which clears plza_en while 
preserving rmid, rmid_en, closid, and closid_en in 
MSR_IA32_PQR_PLZA_ASSOC (or leaves the MSR untouched if the CPU was not 
in kmode_cpu_mask). Immediately afterward, resctrl_arch_offline_cpu() 
calls clear_closid_rmid() and writes 0 to MSR_IA32_PQR_PLZA_ASSOC:

arch/x86/kernel/cpu/resctrl/core.c:resctrl_arch_offline_cpu() {
	...
	resctrl_offline_cpu(cpu);

	mutex_lock(&domain_list_lock);
	for_each_capable_rdt_resource(r)
		domain_remove_cpu(cpu, r);
	mutex_unlock(&domain_list_lock);

	clear_closid_rmid(cpu);
	...
}

That overwrites the MSR value just programmed by
resctrl_kmode_global_offline_cpu() and zeroes rmid, rmid_en, closid, and
closid_en on the offlined CPU while other CPUs in the same QoS domain
still have the active kernel mode configuration programmed, violating 
the hardware requirement documented for union msr_pqr_plza_assoc that 
all fields except plza_en must be programmed identically across every 
CPU in a QoS domain. During CPU online, resctrl_arch_online_cpu() 
likewise calls clear_closid_rmid() after domain_add_cpu() and before 
resctrl_online_cpu() takes rdtgroup_mutex to program the active 
configuration.
=======================================================================

Yes. This is an issue. We cannot write 0 to MSR_IA32_PQR_PLZA_ASSOC in 
hotplug handler.

Couple of options:

1. Introduce the reboot notifier for resctrl and clear 
MSR_IA32_PQR_PLZA_ASSOC. Reboot notifier is called during kexec reboot.

or

2. Just clear the PLZA_EN bit in clear_closid_rmid().
    if (boot_cpu_has(X86_FEATURE_PLZA))
        msr_clear_bit(MSR_IA32_PQR_PLZA_ASSOC, PLZA_EN);

Thoughts?

Thanks
Babu
