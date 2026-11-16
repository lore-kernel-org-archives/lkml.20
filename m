Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794859802;
	b=KNAXesbWBC/S4gTNFiXJO9KGPi2zKZzhYtUH5dA/BcgN5mI+IrrK8rK2c8Pd0pxKxdxK
	 KkpudEuxnWkmZFGwcTOH9HQ6EIf2n8oEwOYWFVrioQ1hhyxpM007wKXC4mvIF4XlrM16N
	 caPw4uoUwvRmvSql7Dx9nHykantYexY4fmEDKzoBs/xhFly8V+3E5VanQHqQFWa84eQD0
	 9KR2OG7r6/a+vAJzQlNyA3ye0YOG9W6w75XPhBU2CLADaH7st+Sjz3eEl+VljQaTToFin
	 /yJ5nRK41kiMmJZ7ZRd2P6VNx0NW0iRj6q2OsfLusWmI8WLJrzM2SFJx1ZoqV484+mg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859802;
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
	bh=fG/18cGLF5B8a57O4KwzcmIVoZeUUdwldllbg52dRjg=;
	b=dgKu6QEFAOtXU25N4RYGyEG9G1lNV3ns+a3A4NdZPUQRNH0a1upY/GWqRTfps9kOaCWf
	 jXwzwgnxfp2r51qmuoBY2DU4fpl98U9FYVxiTwO0X9EXqt/IWIEj5AeTbUoRB/6/06/sr
	 GXIcKufZg0zPTmfhEJblBmK8saNyScO840YODF8EZ02HLLdgvFWNBgpLoJr+zYsI7wT+y
	 ePYFF1z7UBv1cxBg3hHvlMpS97m7KEegypFV8jqcGH16rNMOLNNb724osHNCQmpPa2U6V
	 jtHB0V0bmKycjYBfvGO8S7lj7NR6J68OifrWfutd7DUoMj157+FnmStXId3kaJNuITA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="nNT/B9Ud";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.63
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010063.outbound.protection.outlook.com [52.101.61.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED877606A32C;
	Mon, 16 Nov 2026 20:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED877606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nNT/B9Ud
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jepUUw6ijwSs1BwvRMIsyn+wTqBxR+R3c2jYeGFq/yK1k2h+TofaNgF2NKXA4AYMlV/WSaKPH8vAqeBTgzY8i/z86dDJZzyB3nBVQJ1cOuLwMjzGclBYphXFzteHGEMWiT/6yV94Z+jd7IQ5sLZyHsb9BWHxyQyuDku+zIKDZOttmLjQf71KEpIwS7n57NDaeGO1yAPSrWAENtoeBtf4GePffRjunvU8UIYMB1nm2WqYdjuQdTeGejTpATSW9IdH5dv7fn22z0kl/00csOzTdqME07CQ/o/AR6qVBc9w6arSp4S2fWgUeqLWGA9hWGifs7pglmnZ+fAteI4tqxvsWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fG/18cGLF5B8a57O4KwzcmIVoZeUUdwldllbg52dRjg=;
 b=qGtJexsyQ8fasNsmDRegs4i57hxCqBhtsnOte6cunznO5rZXreuCJCHm19Men82wP/S4Q2/IHUPmyg1TFmS1E09DaFD6yydvAYt+82IagHi6iaR2yj1D3U3HLvxBlJXXXY/7IbgOi2mnx4WPSiwkgpEbloygdrAtVRaHyC2TE8u5GdGYWQo7JoHMC4Blv5ms/IgZee6+UQkkHsi0pIeVphaMVmxVdlBx3S4GAWPeSr3Qm6Jsod7Skw6CU4jnvDcY18PJBhDZGP/wOanrTH6czKVYG6gJpi1/urtZUOWFZYKl2aCfnfeUHSWLXJ76SnaU/VWr0NcTwx7O4zQUQ5/g5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fG/18cGLF5B8a57O4KwzcmIVoZeUUdwldllbg52dRjg=;
 b=nNT/B9UdJBS3H+hUKhZTn8YkXikNOViTNZ2zmUX1BTfQVMSxgCUS+fS0HCvy2TIW2CG5YHYIGDIR+dxIQV58MyAmA4nbpjWf/hSEKfFncOkfCxtOawYLKTfzwwSc6VTEmhjp9ulrc8YFoDicdDb/4h9KX8OZsM3590tiO/cUmus=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by IA4PR12MB429550.namprd12.prod.outlook.com (2603:10b6:207:128::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 20:09:52 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 20:09:52 +0000
Message-ID: <3d008992-dab9-4353-a25e-0007926e19a4@amd.com>
Date: Mon, 16 Nov 2026 14:09:48 -0600
User-Agent: Mozilla Thunderbird
From: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v7 15/19] fs/resctrl: Extend info/kernel_mode to configure
 the kernel mode
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
 <f2ad1989facce953f3ffe1b8687ae4fcf8629a26.1794437052.git.babu.moger@amd.com>
Content-Language: en-US
In-Reply-To: <f2ad1989facce953f3ffe1b8687ae4fcf8629a26.1794437052.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|IA4PR12MB429550:EE_
X-MS-Office365-Filtering-Correlation-Id: 422ea58f-b238-422b-c80e-08df441d9314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|260925021311599003|56012099006|260925022911599003|5023799004|4143699003|11063799006|260925021911599003|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	JZd1QzHFlmoptTqWhrFOwW5HywKXnAAiFEn0g3/aTLldIDusPGDHgtwFOg/ANx4ACkyrBTKCazq1Ltt2Jh/kSrk2GwzWUzwtD6eatyD9L8WFEw8lpRV0DYLEZv28bvVTh8rwP7/DewdQfdFS7cOC8dF/TNy0BADqTp8rDASqS6eXM1bGM0C7ZU3Sap12/yioCoH35pZI4s69C3BrNdUuHFSmc6jzcQ8iOkSUtplb0pSmd9ClbUATT6DMQKNc9CC4sDTzQwR1V5RmE8xVJiGTHgNHaXsp/u7gt8sibZV46j5adHMwvwdJT0UabbPQmjpt3DNhJ2Nrt2CwvGTE8m//xDfm9wvFhnMdqJtu+NjhupaAPV0TA4EAdRNdR1eXc6c5Ha23ugV8ICK1KEYPXkyi4un3xMmNZY9CKe9ovChNYMrzoX20hFDf4UZcK3bqYZym5Km14QzkEHvh3X/3oGDjcpG4/ad+EDZwif9WUJiNNc81ne1ynQzzeOYeg2/uyETgdQNdPwfrtueBEY8wt/7Yd/wVDu6M6f6PRVuSA8b8zidcvzJr+MImacLYIbl2cdmiU5yloowux9fgkA93xOnWHlP/0RqqE+d6MGGYNilVBw8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(260925021311599003)(56012099006)(260925022911599003)(5023799004)(4143699003)(11063799006)(260925021911599003)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWJjUmc1QUJNQlFqcGxXV0U4Q3dqOEE0QjVBYWZaTFpzSUI5NjBLblA1OVUv?=
 =?utf-8?B?RWFSS1hFTU5LazdRY2VjcTNoWmJpeVJISXRsNEtXUC9LZDNqT1NCckVWeWU4?=
 =?utf-8?B?R2wwRk4zR1hObEpOdE5hM3V2UkU2YWV6aU9rdFEvZ0wxRkQxKzVlQTVEMGNH?=
 =?utf-8?B?R1A1MXk3eUdCZTJ4TWpscWZLd1k4ajB2YW9WU0RUYmd6b3ZRdG5EbUlOVGNI?=
 =?utf-8?B?eXBlUTJ1VmE0NWdNeWYwbDdldmxSRUlSRHlMTjBKQU9Mcy9LcGdqV2dXNmxl?=
 =?utf-8?B?VGxiUFJ5UlNIVEhEb28zYWlHTEJkeVk4STJQRGk4bmhjZmU1U0FDak41ejkw?=
 =?utf-8?B?TDBLMzd0blFjZ09raWR5ckMzNWFtOVJObWhZdkF5cjFqK3I0MkwxS090M255?=
 =?utf-8?B?TU1XdDRCUkNtVVowOE1DMWlSZXJ0TlkyRzF5V3p6SFhpSXJsRS9VQ0JKWDAz?=
 =?utf-8?B?d0dpSlJBa0hPUkw1Z2tDZ0czVTRqM0ZVbUpxcEU0SHphcnluTFBsaytkRGpP?=
 =?utf-8?B?UjZPN2ZFOGt4NFFHaUl1bTBKbS9QZVRwY0hRQjdWNGpPSG5KOXZTRTNZV2dD?=
 =?utf-8?B?L3h4YUliWDJTbGlXaGw5ZUYwMDk2YjJocS9uT0F1YlRZUVZRSUc0SHNVR05J?=
 =?utf-8?B?REpsNTZYUUkzUzdkZTAwV1hBYTZQbkM2S0FKTGIvVTV2VjVCRFJQekMyRDdY?=
 =?utf-8?B?NVpZVHR4dE14TW1Kd2RYSlh3SHNzMHRwTU9WTnBYbHU4Ujd2WlJYSkhlOTlE?=
 =?utf-8?B?K083NUxwajdhTSttZkxJTnl4Vkx6S0todW5LREdnNmJrTjVTbm9QVjNTaHp0?=
 =?utf-8?B?bGZUbjZHR3lzai95L1BnVkRad2Z4V1BseDNRbXdLV1FrMkFtSTVBVjlZaXBZ?=
 =?utf-8?B?ZlIreFNQQ1g5NC9NbEFXbjdGdk9vUFMyR2U2VmRYMndkR0J0cURUL0dDb2M1?=
 =?utf-8?B?ZTdlQWNMZE5wWXMzM3ZFRG4zWHRnelhxQXhQbGpsWkp6VGNtNVIzMVQ1Wnp2?=
 =?utf-8?B?c2FGVHVob3lqT1NKSE5mWis1TXg4ekF5ZndGMEl3N2xHVTFjREZydllNSHJw?=
 =?utf-8?B?OWIrVGk4RVhRMWlIOTh3WVRYU0lCN1dzOEZxNTk5Qy9wbEttaU1BMUNYZ2tZ?=
 =?utf-8?B?emNVRm03ZkE0Mlc1RWlwOEpXUnBtUTJMN2pVRnEzZlh0czhSNEdnOU5wSk9B?=
 =?utf-8?B?a042Y2VrcVNTSmhBRVhTYUQrbVBtcUNCMDd2bUV5RnlEaldnZ2k3dGFIVHpZ?=
 =?utf-8?B?dDRVNjFRK0dVcjBwUXo3eEhxN0xqa25sYWNOdGtHOGpJRnEyenFHWkVJNzFw?=
 =?utf-8?B?U09HaUl2TWxMblVkRVQ3blpDRW9COE9BU1QycGRnQ1diTUt6RzZSN0xJZTlk?=
 =?utf-8?B?dHQ0TXJOb0puTVdGUituOFo4ai9FQTBpNUlyYVZEemlFclF1aVE1YWNvd21H?=
 =?utf-8?B?dWtidGVlN2dRZFNYb2hNYVJoUWxIL3QveGRmUldJMDFWUVFEU01XOThvK1dw?=
 =?utf-8?B?ajVsYTJ6eWRkQnlHTGdUNTdmcThrbEZsaU5odEdlUlgrL2J3Q1h5ZURoYms5?=
 =?utf-8?B?ZWhiaEJsMThVQmhmblRFdWFwMlE3bU1weTJaVE5BY0NnSjUvbk03RE85Smtu?=
 =?utf-8?B?R2x6SlNYbjk5NHdqdzR3ZHdRcUpqRExFNlNzdzc0QkNRdHdTbjJUaHEwVE1j?=
 =?utf-8?B?TFRhVVJXQ0liZVpES3NwMVJDQWtsdXBPNldCdW1IQ09mNUpLOUdIUVVRZVpk?=
 =?utf-8?B?c3NoTndEWFNoUFFFcitna2dGWDdmbGlwT2xHQmZ6dS9aNzJjRG1icWM3czlo?=
 =?utf-8?B?RUN6MmFKWmk4TmYyMEVON3FIQ0ZUN0NvWWN5TjVFN3h2TWJmaVBLbnU5eTlH?=
 =?utf-8?B?VEJkSUNDUTNtTHJnSmtOdjZmaGtsYTN6bjZIRmt5cUd3KzhFS29VRllMSHR2?=
 =?utf-8?B?dTRoVVR4SHY4YksyaEY5ZlJHY0M3aTRPalpodVpNcGJ0azdZakYveis5NG5L?=
 =?utf-8?B?OXlDMEoyL1lqYnFpSEhLMFZMRlFQSGRFb0lpZ3o5QXZIeHBUcG9lZkc2SDdL?=
 =?utf-8?B?YTRibUtuWE1HNlNlbVc3NkxaV1g5aGt2TnNCY0dMSFpYN0UxVWdXRzVEdmtX?=
 =?utf-8?B?amJjbm9wdTlhOEJGQmptdW9nenFMYWFPU0hEcGJiY0VBTFJpcXhxSFU0K2pD?=
 =?utf-8?B?K3RnWDdKbWhlc1ZiOVZRUURMVGtsc0FUbnVZS2hUVDh6c2tzK0xWRVJpQTZw?=
 =?utf-8?B?Nk9kRit4VVRPWWNzaFVEL0l0RmpuQ3h0TVZUZEZ0cUtYdXMxeGpZc2orb2pV?=
 =?utf-8?Q?I1+5nhdEK0eHuBFXeB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 422ea58f-b238-422b-c80e-08df441d9314
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 20:09:52.3799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Iik4LeJfiP8St1Nty52+57NoezB62dx6Ffara9bkJqKZJTRAGQ54o8mk+joqiQy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB429550



On 11/11/26 16:44, Babu Moger wrote:
> Kernel mode support allows the CPU's CLOSID and/or RMID associations to
> change during the transition from user mode to kernel mode. The resctrl
> file info/kernel_mode lists the current kernel mode configuration.
> 
> Extend info/kernel_mode with write support so user space can configure the
> active kernel mode. Validate kernel mode configuration before activation.
> Restrict backing groups to shareable mode so the kernel can use the group's
> CLOSID and/or RMID, which are shared with the group's tasks.
> 
> Document the interface in Documentation/filesystems/resctrl.rst.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v7: Refactored rdtgroup_kmode_global_activate and rdtgroup_kmode_global_deactivate().
>      Removed resctrl_kmode_switch().
>      Refactored resctrl_kmode_parse_group().
>      Handled the "group=" as the last parameter.
> 
> v6: Use flattened resctrl_kmode and global_enable_per_cpu. Omitted
>      parameters keep the values shown by reading the file. Drop the
>      ctrl=inherit;mon=inherit no-op. Parse options with strsep(), as the
>      other resctrl writers do, and split validation out of the write path.
>      https://lore.kernel.org/lkml/3bc39dd7-b7b0-4203-a493-0bd872fdc644@intel.com/
> 
> v5: Adapt to the resctrl_kcfg caps and active split. Accept
>      assign_global_enable_per_cpu:ctrl=;mon=;group=<ctrl>/<mon>/ writes.
>      Treat both ctrl=inherit and mon=inherit as a no-op. Use group=// for
>      the default control group. Show associated kmode files through
>      resctrl_hidden_files_set_visible().
>      Added kmode check in rdtgroup_locksetup_enter(), rdtgroup_mode_write()
>      and rdtgroup_rename().
>      Simplify kernel-doc for write and activate helpers.
> 
> v4: Validate input before tearing down the active association so failures
>      retain the previous association. Allow assign_mon on CTRL_MON and MON
>      groups; require a control group when control assignment is inherit.
> 
> v3: New patch to make info/kernel_mode writable.
> ---
>   Documentation/filesystems/resctrl.rst |  40 ++++
>   fs/resctrl/rdtgroup.c                 | 274 +++++++++++++++++++++++++-
>   2 files changed, 313 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index e57361dd342e..1a1877222624 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -608,6 +608,46 @@ The top level of the "info" directory contains the following file(s):
>   		[inherit_user]
>   		global_enable_per_cpu:ctrl=assign;mon=assign;group=//
>   
> +	Writes use the same line format as reads, without square brackets and
> +	with a trailing newline. Errors are reported in "info/last_cmd_status".
> +
> +	"inherit_user":
> +		Written without parameters.
> +
> +	"global_enable_per_cpu":
> +		"ctrl=", "mon=", and "group=" are optional.
> +
> +		An omitted "ctrl=", "mon=" and "group=" keeps the default values.
> +
> +		If "mon=inherit", or monitoring is unsupported, "group=" must
> +		reference a CTRL_MON group.
> +
> +		The "ctrl=inherit" together with "mon=inherit" is rejected.
> +
> +		A MON group requires "mon=assign".
> +
> +		"group=" must be the last parameter. The group must be in shareable mode.
> +
> +		Selecting a new kernel mode, parameter, or group replaces the active
> +		mode and updates "kmode_cpus" to include all online CPUs.
> +
> +		Empty values are rejected.
> +
> +		Example::
> +
> +			# mkdir ctrl1
> +			# echo "global_enable_per_cpu:ctrl=assign;mon=assign;group=ctrl1//" \
> +				> info/kernel_mode
> +
> +			# cat info/kernel_mode
> +			inherit_user
> +			[global_enable_per_cpu:ctrl=assign;mon=assign;group=ctrl1//]
> +
> +			# echo "inherit_user" > info/kernel_mode
> +			# cat info/kernel_mode
> +			[inherit_user]
> +			global_enable_per_cpu:ctrl=assign;mon=assign;group=//
> +
>   Resource alloc and monitor groups
>   =================================
>   
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 97d99406de00..872755532fb4 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1201,6 +1201,277 @@ static void rdtgroup_kmode_global_deactivate(struct rdtgroup *rdtgrp)
>   	resctrl_kmode.mon = KMODE_ASSIGN;
>   }
>   
> +/* Program @rdtgrp on every online CPU and show its kmode_cpus files. */
> +static void rdtgroup_kmode_global_activate(struct rdtgroup *rdtgrp,
> +					   enum resctrl_kernel_mode mode,
> +					   enum kmode_state ctrl,
> +					   enum kmode_state mon)
> +{
> +	resctrl_kmode.active = mode;
> +	resctrl_kmode.ctrl = ctrl;
> +	resctrl_kmode.mon = mon;
> +	resctrl_kmode.rdtgrp = rdtgrp;
> +
> +	cpumask_copy(&rdtgrp->kmode_cpu_mask, cpu_online_mask);
> +	resctrl_configure_kmode_global(&rdtgrp->kmode_cpu_mask, rdtgrp, true);
> +}
> +
> +static int resctrl_kmode_parse_state(char *val, enum kmode_state *state)
> +{
> +	if (!strcmp(val, "assign")) {
> +		*state = KMODE_ASSIGN;
> +		return 0;
> +	}
> +	if (!strcmp(val, "inherit")) {
> +		*state = KMODE_INHERIT;
> +		return 0;
> +	}
> +	return -EINVAL;
> +}
> +
> +/*
> + * group is "<CTRL_MON>/" or "<CTRL_MON>/<MON>/". The MON component is
> + * optional: mon=inherit and systems without monitoring do not require it.
> + * An empty name selects the default CTRL_MON group. Names are not trimmed;
> + * "/" cannot appear in a resource group name.
> + */
> +static int resctrl_kmode_parse_group(char *group, struct rdtgroup **rdtgrp)
> +{
> +	struct rdtgroup *rdtg, *parent = &rdtgroup_default;
> +	char *mon = NULL, *slash;
> +	size_t len;
> +
> +	len = strlen(group);
> +	if (!len || group[len - 1] != '/') {
> +		rdt_last_cmd_puts("Group must be <CTRL_MON>/ or <CTRL_MON>/<MON>/\n");
> +		return -EINVAL;
> +	}
> +	group[len - 1] = '\0';
> +
> +	slash = strchr(group, '/');
> +	if (slash) {
> +		*slash = '\0';
> +		mon = slash + 1;
> +		if (strchr(mon, '/')) {
> +			rdt_last_cmd_puts("Group must be <CTRL_MON>/ or <CTRL_MON>/<MON>/\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (group[0] != '\0') {
> +		parent = NULL;
> +		list_for_each_entry(rdtg, &rdt_all_groups, rdtgroup_list) {
> +			if (!strcmp(rdt_kn_name(rdtg->kn), group)) {
> +				parent = rdtg;
> +				break;
> +			}
> +		}
> +	}
> +	if (!parent)
> +		goto not_found;
> +
> +	if (!mon || mon[0] == '\0') {
> +		*rdtgrp = parent;
> +		return 0;
> +	}
> +
> +	list_for_each_entry(rdtg, &parent->mon.crdtgrp_list, mon.crdtgrp_list) {
> +		if (!strcmp(rdt_kn_name(rdtg->kn), mon)) {
> +			*rdtgrp = rdtg;
> +			return 0;
> +		}
> +	}
> +
> +not_found:
> +	rdt_last_cmd_puts("Group not found\n");
> +	return -EINVAL;
> +}
> +
> +static int resctrl_kmode_parse_parameters(char *params, enum kmode_state *ctrl,
> +					  enum kmode_state *mon,
> +					  struct rdtgroup **rdtgrp)
> +{
> +	char *key, *tok;
> +
> +	while ((tok = strsep(&params, ";"))) {
> +		key = strsep(&tok, "=");
> +		if (!tok) {
> +			if (strim(key)[0] == '\0')
> +				continue;
> +			rdt_last_cmd_puts("Missing '=' in kernel mode parameter\n");
> +			return -EINVAL;
> +		}
> +		key = strim(key);
> +		if (key[0] == '\0') {
> +			rdt_last_cmd_puts("Empty kernel mode parameters\n");
> +			return -EINVAL;
> +		}
> +
> +		/*
> +		 * group= is the last parameter and may contain ';'.
> +		 * Restore it if stripped.
> +		 */
> +		if (!strcmp(key, "group") && params)
> +			params[-1] = ';';
> +
> +		tok = strim(tok);
> +		if (tok[0] == '\0') {
> +			rdt_last_cmd_puts("Empty kernel mode parameters\n");
> +			return -EINVAL;
> +		}
> +
> +		if (!strcmp(key, "group"))
> +			return resctrl_kmode_parse_group(tok, rdtgrp);

Sashiko reported:
https://sashiko.dev/#/patchset/cover.1794437052.git.babu.moger%40amd.com?part=15

=====================================================================================

commit c63c65a55b0de1c92fbdb68970fd3628b6b0e821
Author: Babu Moger <babu.moger@amd.com>

fs/resctrl: Extend info/kernel_mode to configure the kernel mode

This commit adds write support to info/kernel_mode so user space can
configure and validate the active kernel mode and its backing resource
group.

> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 6f51db3cb283f..fd551dd527b9c 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1201,6 +1201,277 @@ static void 
rdtgroup_kmode_global_deactivate(struct rdtgroup *rdtgrp)

[ ... ]

> +/*
> + * group is "<CTRL_MON>/" or "<CTRL_MON>/<MON>/". The MON component is
> + * optional: mon=inherit and systems without monitoring do not 
require it.
> + * An empty name selects the default CTRL_MON group. Names are not 
trimmed;
> + * "/" cannot appear in a resource group name.
> + */
> +static int resctrl_kmode_parse_group(char *group, struct rdtgroup 
**rdtgrp)

[ ... ]

> +static int resctrl_kmode_parse_parameters(char *params, enum 
kmode_state *ctrl,
> +					  enum kmode_state *mon,
> +					  struct rdtgroup **rdtgrp)
> +{
> +	char *key, *tok;
> +
> +	while ((tok = strsep(&params, ";"))) {
> +		key = strsep(&tok, "=");
> +		if (!tok) {
> +			if (strim(key)[0] == '\0')
> +				continue;
> +			rdt_last_cmd_puts("Missing '=' in kernel mode parameter\n");
> +			return -EINVAL;
> +		}
> +		key = strim(key);
> +		if (key[0] == '\0') {
> +			rdt_last_cmd_puts("Empty kernel mode parameters\n");
> +			return -EINVAL;
> +		}
> +
> +		/*
> +		 * group= is the last parameter and may contain ';'.
> +		 * Restore it if stripped.
> +		 */
> +		if (!strcmp(key, "group") && params)
> +			params[-1] = ';';
> +
> +		tok = strim(tok);
> +		if (tok[0] == '\0') {
> +			rdt_last_cmd_puts("Empty kernel mode parameters\n");
> +			return -EINVAL;
> +		}
> +
> +		if (!strcmp(key, "group"))
> +			return resctrl_kmode_parse_group(tok, rdtgrp);

Does calling strim(tok) before the "group" check strip leading 
whitespace from the CTRL_MON group name?  The comment on 
resctrl_kmode_parse_group() notes that group names are not trimmed, and 
trimming tok here causes lookup of a CTRL_MON group whose name begins 
with whitespace to fail with -EINVAL ("Group not found").

========================================================================

Interesting.. reesctrl allows trailing/leading white spaces in the group 
names.

So, we cannot run  "strim(tok)" for the group names.

Will move the strim(tok) after the group check is done.

Thanks
Babu

