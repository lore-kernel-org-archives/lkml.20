Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794859631;
	b=x0+vu41I3YNDU/SItbRXeMbJERBdmVTQezI1jlMnmMAIe6q6e7WQ0OP97vhk32k0KJF/
	 DJtEPMwodSID4Ijp7bMNGYgU+z0NrM2O81j098ejnNBocIbTMmDrBp6RAe2GLBXBq1GRh
	 MOXBXYUu/zdEzT9nOkk/rQKpw3RFUsPKiHjR3FyQc/NoK8VraxZgFAKx9fLn9rJ8aDSkL
	 7aOAYg3bdubs9I8kHlp+cjSVysFr9FpBgz3vwGakcl1Q3k5iQ4ftLSnjX/b2oJgQA3G8q
	 bjOG+zJDGLBJo8cAd/jgUyhhoLBjY4mDX5enEj26xqN7fqzkpJeGcLebSdhSBkyq8zA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859631;
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
	bh=4TBapUEVdgqFMc02G0Lu7NAPtw9O2+vayYgGX+avrjc=;
	b=j0JCqNCmYvZrYXxFFbQAqssvrR0nin18wK1/TxHR6xLH3x5fKMy8gCnBFraKeJjJJzfv
	 TAnZw3kHN9V/7KAcpDwXmZTz0OXFo7LVVFSwZupWWXDlWFudf6jvcvqEpjA2mjnmDcC+M
	 qVObtlWsw1lNna+8pUAdU3XYWLebjLSWhg8N/HzDEckl7cRaFn78SVN3oqxWHrFGfdztl
	 4oAsOr2RhGgXO4ICxFWhdiFE0ApH1rHulOrlrDxE32axA+yS4oCQehi/4EnaancuRTCXD
	 gn+uGdf1S0LHiQ9o3/D4P4mBtDkCyFxMBGjY5F80iRdGCw6riA/Vka3GxyLPYxlrGag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=PCE+8l6D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.9
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011009.outbound.protection.outlook.com [40.93.194.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580C0606A31C;
	Mon, 16 Nov 2026 20:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 580C0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=PCE+8l6D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJeMf2CBji7OgfG86r1lKIEToGjCfrAGpg0kkF3G9gBvGsg92wIHv1lM2ErQ8/GLVDWMsBzo9Q8y8p4uRuPYy6pYlcPnJ3m9NyD+tVAWMjQO+s7hazd8swJSoiB7sMiRUS0UrGm309PV/KgprZjFIRoJqo+Yipt8n0t7M8iBapANYN4iPiIuOnZmGG/diNXqZTtX6sMJuHySBbySYXYHxP9qIZ0JyNt5LINFMl5/Ldi5C46XnThNY2ggGenhvxAjLbs4zm4FfWhmus6cZFlWj8a8cHDyOMawfQVmTG92n6muJwGXvcqzaLnBGzOypnxGUE4gfJ7oFbWiyeoXgakSuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TBapUEVdgqFMc02G0Lu7NAPtw9O2+vayYgGX+avrjc=;
 b=HjsbB6nwW/hYPmtSPcPet8Kc7INcxjl/HzRo7ZaGEsjKfaJhreP2kkMVe1id1aSxeJTUObhCX4eADu22MGvZ+LxBUHcY140c5CCK5JTWR9a6Pweu7ZdH2mAnSBAWO1VSiAOKODEjnJjmRl8YlEQeNwOTaUNMAdznumjO+UrsR+RhTW2nT5XySNKmGGzU23MFO9fY7AnfFTNZ4gtln88EshyrghshfeNqYUKk8yhM6z1DHTN5o37EFBj01DRpZUBHdZoPg66N6wWrBRNmWxt/JedyM7ZznjkJ0WwMP8LhAJHHKcY5Y4xQpqZgDW6sMsC8Lya3G5v3lOdGyPAkd0niwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TBapUEVdgqFMc02G0Lu7NAPtw9O2+vayYgGX+avrjc=;
 b=PCE+8l6DeyGEpw9gaUjX29O6rULhF3rYMQg+S1g63E599u1TGW1OHLxOy0cgdftAGR41VI72RJvBlgLCJDO+eau/kgsY9sh4BvXu0nFHr4lfOBEWOjPGDzPxyTKJXBJN17pHXsWNsPVuudx/aRueOJwfdjsKC6526MWp9wX3xSM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SAEPR12MB328447.namprd12.prod.outlook.com (2603:10b6:802:209::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 20:07:08 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 20:07:08 +0000
Message-ID: <125f8f2e-0ab8-4833-96a5-136c4ebd8666@amd.com>
Date: Mon, 16 Nov 2026 14:07:04 -0600
User-Agent: Mozilla Thunderbird
From: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v7 04/19] fs/resctrl: Introduce kernel mode enum
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
 <a0251dbaf1c493f84ef1c1dfd7afe9d1cbafcf5a.1794437052.git.babu.moger@amd.com>
Content-Language: en-US
In-Reply-To: <a0251dbaf1c493f84ef1c1dfd7afe9d1cbafcf5a.1794437052.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SAEPR12MB328447:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bf109f8-d916-49a9-3f23-08df441d3155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|260925021311599003|56012099006|260925022911599003|4143699003|11063799006|260925021911599003|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uEQYg+rFBsM4AQC9srPIMS4S9jU89V21QCt5DQ64oCA+BdBMAlPB8Kd6/eFjwMwFfn+AmQjoxQt57q2r6dOfDN4RVk0Flbg2XTfg3ZYjqmJpyZ8FgBUs8MRNskGjG7hDo1nBbEJ9lN595KUJzDRAWaOv0tZWHgq7W0pDX5BfraOFLnWAtWp7vkF0/NGu0qCzteI4/Udqm94UWmFo4SUAVSokVHaVJTrDTP6eaZeeX/8ZzqYHHFu+2JRmk1bbQIfe4Cs8apcPvH8clIsL0k5CQaPEAOenx4OB587hXqb7DLEdewneXZT/MjOaX92uySLLjjCWIRd58QpFfKz/QFs2UNQZQvlikRX0KkoS6VEXmcBcaKXgoL7nDm0MZo8RYpnmCGgaiM81GRObBJJ+pMjECcFla1GXuf6CsPLM+E/+RTApT0h7xsOj9cJSCmt3sBW29pjIBEu6SpT+zD4JdIqbz5z7HPbVijn6c1WHaowjv0KUmU+0WShKdk/mEI6k3B0J322ckMpU6j8ZhFEqJaQgeOkPaGzziea0Sr6ZC/E5s/C/nj8v4b3FKkZBi+ydNtvAyTstkKW76X/SF/jy17QPo+rI1fzaBIPQnO+IlBp7z5g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(260925021311599003)(56012099006)(260925022911599003)(4143699003)(11063799006)(260925021911599003)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnkwWERUZ2VmaVd2UEkrQVFQcElaNWdrZ2F3VVZHY1lzN0svSnJkcG54MHk0?=
 =?utf-8?B?QWs5S1NSUTRCR0UzNCtBdkNkaW5ZRzJoM2tWQ0dYQzAvTHVnR2ZJcTY4OG9W?=
 =?utf-8?B?RHB6Nk1LcWRvVHNKamo4RjlwTEdVR2c3WjRHNUh1N2p2a3AzbHhxekFWTWVn?=
 =?utf-8?B?WW9lVTBJMTVCSEphK2FTV0l0disveUtLM0dKTEZWMENMYi9pbHQ2TDFyZ1F2?=
 =?utf-8?B?bHFsbWtUcS8rZmgrcmp4eGJCTm5UeUY0VlpuS1dpdTBYcWp1R3doUlZRZjlB?=
 =?utf-8?B?ZjExdDZ1RkZqbXYxbXhETk0wblBkZXpORlFLR2FsUFpQMlVRU1dWVk8yNGVy?=
 =?utf-8?B?UTE5Q0s4bGp4YXF6SllweXY1aXhobG5uWWs3bnZoTml3ai9PeUlzdmFma1k5?=
 =?utf-8?B?R05ZS0FxNWM2RTVxQVVha2lveVlraWQySXNROGNjOWZ6VkdWcWpBVlIwaE1B?=
 =?utf-8?B?cWZ0Y2wzQVJhR2FGTC81eEI3QU93dklZM2twZnl6Ly85TTQzUWpadERoemhP?=
 =?utf-8?B?YjgxK2VSbUgwR2JLVEw4N2UwdWxyRmtjSmlWcjZjU1FSUm8rOFY5dmtNbkFa?=
 =?utf-8?B?bHpMalIvZXgrVVp5ZG8yMERLRlBUbEZ2cG5zSmFxQzdZTWhxbkFBYWE3Qk93?=
 =?utf-8?B?V3Rpc1M2S3hMdWo2Y241SktWK0VYU016Q3A2S2lIUzZrMlZjZCtlaS9XNllw?=
 =?utf-8?B?eVpaVEFUNlFVd3A2OXdDdGlrZm1mb0tPcmpWdEVKNEJvaHdGTkc5VzJsZCtB?=
 =?utf-8?B?Nko4TWtraUo5RXBYQjYrQTZBK0cwNko5TFljSDBOSHJQbFQxNXBVVDVETUt6?=
 =?utf-8?B?VmFxQ1dWcFZzZllHN3AyRGhDZUhMTEZHNmY4QWFGbHduOHF1WGdUVy84TTBW?=
 =?utf-8?B?WERoUGwrV29KSWJmZ3VsZnFGblZ0L2hNVDZ5UDBNcmhkb3ViK1ovbjk3Q0xw?=
 =?utf-8?B?U21GNFhsUFZ1U1ZZNWFENHdyVmY4aVA5KzNkM2xtbnY4NUViYm1USHo2WnJI?=
 =?utf-8?B?Z01Zd2p2amVqU1hiM3hjSzBRSm1SSXBpWk5Hb1kzdGxYY3lXVWRJUFdDL25D?=
 =?utf-8?B?WkVpTW9RSmMwMTZjQlVIVjBiSnJkWnMrMzBHWTlYSTRhQ2N1UjJ5TWlYeE54?=
 =?utf-8?B?REh1SXJHVHN6eHU3dHhQUisxVDh0cG5rN0ZmTE1XZHM3Z3Q1Sk04V1pmclpQ?=
 =?utf-8?B?NmpMeW5OT2x5RlFLM3djWWc5OWU0L0tHT3ZFMTV1WDJXOGU4SytnQkNzVkZ4?=
 =?utf-8?B?SWVmQWoyNGVEdDRTMXpTRHhFRVJyNWZyQ2V4bjhMQkFrb2JIVW8rNTBOWGNi?=
 =?utf-8?B?VVYzM0IzNllHQ3dmWGU5OWlwMDlTVE9mTzJTbTVZUm1SY24ySy9OTHVCU0pH?=
 =?utf-8?B?WUlGenJsQVRZeHlSYjErVmFIbWZneTFGRXNGN2lOcU4yOGV1eWp3ZkRxRjIv?=
 =?utf-8?B?dVJhbjVQRkRBaXhZSjg1Z0lQaDBYTWU0UmhQK1hNSzgvYXVPWktPZklDaUh5?=
 =?utf-8?B?TGhnMjhzRGRQMUc2bHJGaldMakdnM0trVElKbi9LRXRxYXJwd052N3lSdEJK?=
 =?utf-8?B?ZE9Rb0toODVYUnVycHZnUHlvU01MSy9XNGc1UDVLTGdRZk50cVJqa0NrYWV6?=
 =?utf-8?B?ams5bmJWOVhzWDhuanhhZU5BWlNDejZFd1E4RVBCZlpPb2l4RnFTRXZyQ21h?=
 =?utf-8?B?TmtiYmlueDQxeXl2TEtPbUcwaGFONjFLOUJkZDAzK1pHZzJqQ3d3UHc2akRD?=
 =?utf-8?B?ck5sS0NyODBrOWJCVlhFMW5mcTFnZHlKTElTVlJjU3JsN2FqaUpQUU13bC9K?=
 =?utf-8?B?SXRRcWYwTXp3NjU5ZmM4TzMvZHpNNk51WjBreGdGMHpNVUNrVG5wdEM0MjVG?=
 =?utf-8?B?VUptclA1QW8zdHU3QWZQQnhiT0JMTEVNQU54ajRwV2E4MWVQVTk2ajBZOGNq?=
 =?utf-8?B?VDNRcDdHTTNQd29NeHJwc091TGxTemhnRCs3M21RYjJFRWJhTzZXa1hCUUpo?=
 =?utf-8?B?UDRHS1VISnVna043VHBabExURWNXeStoWkJ3YUsrWklZaEhDS2xScWdSSS9L?=
 =?utf-8?B?cHcrUGRuRW5aMUwrRjlrbWN5SWd3RUtjUGZBQWwwMmxoaGRJalFISHNhaEFP?=
 =?utf-8?B?dTNxcDZmdFJtSGxQN1BvZzFxc2k5bFBPcHF6RU9PZW5qazJIRlR6TWhhQzUr?=
 =?utf-8?B?ZDRSbmpVbDhIeXk5N0RjMEJMMUMzeDk2VGZoMXZJN1ZBTThUbnpqUHlSYklY?=
 =?utf-8?B?bnhKeHpBN3FyWXNNVEI1V0EwVHoxNU03clFqd3pOZDFrOUxTcUNRTlNIWWtp?=
 =?utf-8?Q?VDOZ/l1M8WT0XAP3yO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf109f8-d916-49a9-3f23-08df441d3155
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 20:07:08.4402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54bWlGKDIE4BgxUBSPaZlhulagaZ5G1YnxyJWOuR9u91qYJBfaEt2kpDc6xXEot9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR12MB328447


On 11/11/26 16:43, Babu Moger wrote:
> Kernel work need not use the CLOSID and RMID of the user task on whose
> behalf it runs. On x86, Privilege Level Zero Association (PLZA) enables a
> CPU to use a different CLOSID and/or RMID association while executing at
> privilege level zero.
> 
> Resctrl needs common definitions of how kernel work is managed so that
> architectures can advertise the kernel modes they support and user space
> can query them and select the one to use.
> 
> Introduce enum resctrl_kernel_mode:
> 
> - RESCTRL_INHERIT_USER: Kernel work uses the CLOSID and RMID of the user
>    task.
> 
> - RESCTRL_GLOBAL_ENABLE_PER_CPU: All the kernel work uses the CLOSID
>    and/or RMID of a single resource group, which may also have user tasks
>    assigned to it. The mode can be enabled or disabled per-CPU; on a CPU
>    where it is disabled, kernel work inherits the user task's CLOSID and
>    RMID.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v7: Changelog update (Reinette) with minor changes.
>      Code comment update.
> 
> v6: changelog update and code comment update.
>      Renamed RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU to RESCTRL_GLOBAL_ENABLE_PER_CPU.
> 
> v5: Collapse the two global-assign modes into a single
>      RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU value. Update the changelog to
>      match the enum names and descriptions in the code.
> 
> v4: Updated the changelog to be generic as possible.
>      Moved the enum resctrl_kernel_mode to include/linux/resctrl.h.
>      Updated the code comments to be generic.
>      Removed resctrl_kmode_cfg from the code. This definition can be fs
>      specific only and architectures dont need to know.
>      Changed enum name to resctrl_kernel_mode from resctrl_kernel_modes.
> 
> v3: Removed resctrl_kmode definition.
>      Changed the kernel mode definitions to enum resctrl_kernel_modes.
>      Used BIT() to set/test the features.
>      Added details to changelog.
> 
> v2: New patch to handle PLZA interfaces with /sys/fs/resctrl/info/ directory.
>      https://lore.kernel.org/lkml/2ab556af-095b-422b-9396-f845c6fd0342@intel.com/
> ---
>   include/linux/resctrl.h | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index b6b4519a5190..6f3e57ec4aa3 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -716,6 +716,31 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
>    */
>   bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
>   
> +/**
> + * enum resctrl_kernel_mode - Kernel modes
> + *
> + * @RESCTRL_INHERIT_USER:
> + *     Kernel work inherits the CLOSID and RMID of the user task.
> + *
> + * @RESCTRL_GLOBAL_ENABLE_PER_CPU:
> + *     All kernel work uses the CLOSID and/or RMID of a single resource
> + *     group, which may also have user tasks assigned to it. The mode can
> + *     be enabled/disabled per-CPU, all online CPUs are enabled by default.
> + *     When the mode is disabled on a CPU then the kernel work on that CPU
> + *     inherits the CLOSID and RMID from the user task, effectively the
> + *     kernel mode becomes RESCTRL_INHERIT_USER on that CPU.
> + *
> + *     On x86, CLOSID and RMID are configured independently; either or both
> + *     may differ from the user task.
> + */
> +enum resctrl_kernel_mode {
> +	RESCTRL_INHERIT_USER,
> +	RESCTRL_GLOBAL_ENABLE_PER_CPU,
> +	RESCTRL_KMODE_LAST = RESCTRL_GLOBAL_ENABLE_PER_CPU
> +};

Sashiko reported:

https://sashiko.dev/#/patchset/cover.1794437052.git.babu.moger%40amd.com?part=4
=========================================================================

Should RESCTRL_KMODE_LAST be documented in the kernel-doc comment or 
placed after a /* private: */ comment?  Without either, 
scripts/kernel-doc warns that RESCTRL_KMODE_LAST is not described in 
enum resctrl_kernel_mode.

Also, the blank comment line before "On x86, CLOSID and RMID..." ends 
the @RESCTRL_GLOBAL_ENABLE_PER_CPU section in kernel-doc, placing that 
paragraph into the general enum description instead.
=======================================================================

Will document RESCTRL_KMODE_LAST and also remove the blank line before 
the line ""On x86, CLOSID and RMID...".

Thanks
Babu


