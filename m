Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013037.outbound.protection.outlook.com [40.93.196.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2DE4ED197;
	Thu, 17 Sep 2026 17:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789665983; cv=fail; b=EazARMSAQwMnd6Wn2MWxze+JGYEpvBCCHpAqRFohOy58Uvjbc6Ccfk9Bc/Sh45QjviZoJU44BoSY6Y0jng2IYARmGCkqF0U6iVy1V2SmSMifG4XkS1I9LFecs5ZytDo87w9SIPF9sIjgVFYPFW28ATeh1J6N03xucEW0T5LtSf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789665983; c=relaxed/simple;
	bh=YT9DXBK76oFy/iaHv3WH+VVgnZno2hDc/Kx7qhwJ3YE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b5c2sAyiLAnk9qNs1YDcsai8bavZaMT60B4OxUBir3Nwo1Bha4+A+k/0D6SZ9sb+ZOEmaAhkysjxxI1OhoQLReyIiNUhv47eSiEjUN7588Lez3R3oxBHJX+hS66k/NTM9y157il8cUq09DdwhEGmJq1gS7mD6qYSV/HrZqjtK/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OSZuS1Hy; arc=fail smtp.client-ip=40.93.196.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OSZuS1Hy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dog7G4wVvM8Xn0MNhWMG3bjcrIU9TIwPyUn/UeYwI9kkr/pjP7tb2FLqU2tLORrAHh8nlUpv7/TmkM+SEPaSF11duCw4RUmIyE400G+w5y2v7hrhDHYbkcIjnsFtkBN3szsErashzxsbQ+KPl5caBwCPpZORTryOQVgwZKfgE5niq0Pw87u7swmsLBurgnL0dZFZFEmlQTpgigfynh/RPSN4Ip6gPiviJocmhsn6fD8NqaVmRjmm6dVbBxtB+PgpsBfvcEIBzIRH9Y9N/lFsFNdvmmsrfjJJIv6fgaGSz3g3UUWE7ZpUBPi0hZBypRoXNVnXmvDUfHfN+J/TvyaLew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+nWuN4LMMH7HGSBvdwJv0WYpXcHAmAsbGOZqo6xO6c=;
 b=x2EcP3HCHKiIxDmjeDumlKzGyg5zoDEKdVUXh0t00yukhM4GF/6WVuJcSQVrWCym0uYq6JVoJNzZCE2C6NU4D5Zzxn2hUexZxMEjF03/aseoFpKJ0XkPjLD9pPAe7JtGT2pjGT4RYuTymZpU0rkTtYbXCi4cRv+ZD8yRe0PrTen/5Aq9Mqb6jST9BsBBJezKPjI+zDtSCycecWcK6FbmCCQs2Bu54wLffJ5MdLRRj+Yfk9Q6dYJgPQwRH9dCvrGjZmNDj1Lp9f6qZu7Vn+b+AQlOhcXiuXmxk+wR8weRtKXEnh8lt2uiY2NwfnGW8H1VbArz3RhsG6r6H4aSi5s1PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+nWuN4LMMH7HGSBvdwJv0WYpXcHAmAsbGOZqo6xO6c=;
 b=OSZuS1HyHSNyDq1lDmckpPMLJLnxJAm0QKxeOu9WcLShsm0xIvNJIDFKXuD/N0dZbYcXqweZbuBwBFzstmhGvDbwE+S31HSPuVKy3UK4AlNBNvsss73IbefFq9ZLFiQL/ZGu1Ct3TNik8AlaGlpC6MKRkaxIBQ+frVKHO5VYIlc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by IA0PR12MB8905.namprd12.prod.outlook.com (2603:10b6:208:484::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Thu, 17 Sep
 2026 17:26:17 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 17:26:17 +0000
Message-ID: <948f5361-fc46-4d89-a1b1-cfbcb2ce0ff6@amd.com>
Date: Thu, 17 Sep 2026 12:26:14 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5 10/16] fs/resctrl: Add support for hidden resource
 group files
To: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, bp@alien8.de, ben.horgan@arm.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 tglx@kernel.org, mingo@redhat.com, dave.hansen@linux.intel.com,
 hpa@zytor.com, fenghuay@nvidia.com, akpm@linux-foundation.org,
 rppt@kernel.org, dapeng1.mi@linux.intel.com, elver@google.com,
 jlayton@kernel.org, enelsonmoore@gmail.com, kuba@kernel.org,
 ebiggers@kernel.org, seanjc@google.com, peterz@infradead.org,
 chao.gao@intel.com, jmattson@google.com, naveen@kernel.org,
 ricardo.neri-calderon@linux.intel.com, tiala@microsoft.com,
 chang.seok.bae@intel.com, prathyushi.nangia@amd.com, kim.phillips@amd.com,
 elena.reshetova@intel.com, darwi@linutronix.de, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <cover.1787772750.git.babu.moger@amd.com>
 <f7bcf19ac8113a1e3d9575739c1a6400c455ce6d.1787772750.git.babu.moger@amd.com>
 <34aa4824-810b-4c81-8188-f2f37e1dc277@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <34aa4824-810b-4c81-8188-f2f37e1dc277@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:610:b3::8) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|IA0PR12MB8905:EE_
X-MS-Office365-Filtering-Correlation-Id: e9dd2dff-f40b-4a2d-a31e-08df14e0c829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|56012099006|4143699003|10067099003|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dvmt7AcriG20TJU7xvnybOPaXvoILxETzRaHmJSKI5o7QMUJ/aTy9zd+x/DrgkCoZKBzWt12CLIceMDAx1YvcHGc5GYj5HaJZLq9TwvP9VvYVFtIXcNnreuyFAsyMHltmrfnD+wBGLZb9fqK65eB5UL+pj72i4xnIOJ8FZNyNOj91OkREX010sPh8u/4IsYswyzzfoWXrMn5nSk5/jhKaxQ7qJfdRMissgGPSCJj+KDQ8ewrlzsmx+RK5yQDRp6x23y7Kp6M0ONcTiZ6yruiY+Hv2TUG2UBGBMr6Z3AwqNsym1l+JEJbg0xknLwmWvzd/oSPcHGg5BSVmeL4NE3fBu7kLi9TBOugbUozN+9dus93zNfO5puLekEVvCU3saTFpY3YlAHpMHBUhnb0nNA4ETnrzLoSYz/0rXtD/i6ThKd5xGuMmguEapVUWqvC48wUSuaPJ9iQ6wJCFSaM0O8rFFU6SsUGO5EX1kbcANsueyfLos7Ilqgu1bpFnDGS1aQ9xzWlMijjXLNRdbU3MOXqk9B7+it0D0Lh3XrosiSmvukoyaa2n3cw1WLlDL1LLu+bp8In4C1yxjtlhIfV+tHDfYKhAcCv5h9CpNeOaO9ofPtbfl4i0Zk9RmQGiXEOFNkDtSPyNIqW5dDafrifEdPMLsIzBGfL3E5uGEwkvHUsewM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(56012099006)(4143699003)(10067099003)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXBQOE1qdDdjS2FRN2lRYm4waXgyellNeFI3MGhackx1VWRLbUlPckthSjd0?=
 =?utf-8?B?aEREZTlIUGt4dkJJSEo4aGlVZnJNV3JnalA2L0xxNnBqNHlXRUVoK0xwT0la?=
 =?utf-8?B?VmFnQXZndWJTSm5zYUU1Q3lINXJJeS9EdksremhHc2FFT2c5NzBtQnUrQ29B?=
 =?utf-8?B?V2QrZ2lhZHkvbkVlWk84K3Q2M1VKUHRqTEVSSUZNR25OTit2cjJMSk5zMTJi?=
 =?utf-8?B?TDBGUXJqaXBOZzQvenVGMGpsS0d6OTl4YytLbWowZ0NPa0FxVHJVZWxwTFJH?=
 =?utf-8?B?Q3Y3YldHUkxYRk5wNnJwU0NEMlo2UWlYWUlmZDc3SDRBT3BYbEtYcEsxQTQr?=
 =?utf-8?B?MVp3eGZJdk12QjhmSWFnVHQ3Uy9FYlg4Q3lGOUw4NWZMQXN0VmVKSGNSUkF3?=
 =?utf-8?B?cDZ1R1F0SERhRVZVakdLdXhKYmp1Sk5LM1YwN3R4alhGUlZaTlBWWGg4a1VM?=
 =?utf-8?B?VkkrUjRnNEMzVjhUbkg5VTZmbGFuMG11dWY3MkRBNDZIcHNTc0R0R2xtcHhp?=
 =?utf-8?B?N2pEQW9sYllTOHdKSnVMU1BHaGZpbHNnU3NVajkxZU1yNkdTblFjT0tJSExY?=
 =?utf-8?B?ZnR1Ky9ma2V3OE81eDZDRkUrTVVZMWl5SVhDQXRhRjlZSE1qeUE5ZGY1R0Vt?=
 =?utf-8?B?TURTdzVwbDE1OEU4bHMzU0h0REt6aEtDRnYxYlN6MzA3WFQ3UlNiTFNWcG0v?=
 =?utf-8?B?VWhpWDdBVE5GZ0FqTGc1UERqV2JmdmRKTXRQVnhDOENzR2czSzB3L09pTlFh?=
 =?utf-8?B?TURNUHFKM1R1V3lkd09Ebzhwd1VLYUgvQVlETFd5MTcyNURWdmZjVGdzTS9O?=
 =?utf-8?B?MDNrRHJFQVFTNzhjd2VUSEZJZHhuT0UvdXo0a1hNVjkzTGtyNktRZHRVNXFt?=
 =?utf-8?B?TkhLRnNyM0VnQ3RrYTBjdjh3MGprSVN0RTFSaStLZDllSERtOXptMjhta2Ew?=
 =?utf-8?B?SUxFbkgrU1g4WHBhNit6RG1PVkdyc09kUzZFWnZQV0dmb2swRzBJQlNwVFpo?=
 =?utf-8?B?aGN4dGhaZjBsVFRwcDBBUmxDK00xY2xSenpmQmpMNm9CcTFWWU40L1ZLVWVy?=
 =?utf-8?B?UStRN3JRZjIyZ2JydCtzMTBIbTdPK0hqT1ZIWEVhMGxMMVpGOTh4NUJQMTVp?=
 =?utf-8?B?SFArUEFMbnh6elkzK3V4Nk51Y0dSOFdZRlFNZGtsTG5PcWZBS1QvZGZVaEhY?=
 =?utf-8?B?VDE2REFvSHhvaVNhdUdKanMxTDU4b1BiKzAwYmNVWDNNa0dmQzZuVktBSzRB?=
 =?utf-8?B?TkpldW0zK1FzSWpwc09QV3ZHUytnd0ZBaWt1dUh1YmRtd0tyMHpyNG12SkJz?=
 =?utf-8?B?S1VPYkRHbitKKzBpcTkzSS9jVmRoS1NqSEtwZXp5NUJtdTJUazJ6Q2tBYWxQ?=
 =?utf-8?B?b1RZMlpnZHJqUlFocmk0V3ZyVUtnczhUUi80bTVuT1dTZ1lPRlYvQnJva3Vq?=
 =?utf-8?B?SmtOdG1ac3hBRElESnBva0VuWmpkS05XaFR3ZXJOdXY4Z2tNWmlrenJVNnlW?=
 =?utf-8?B?OS9PMVg3akdwaFIrakhUek1HbkovN0kvV1c0cmh5eEd1Vkd0WGk4SGFxbWdx?=
 =?utf-8?B?QTJ1bmJxSkNjNG82MzJKdXFDcW0vOU1sZjcyTmtkcDcyR1BXSmEzZ3RETFAz?=
 =?utf-8?B?NTZwNUpNdlZHQzlyZDBVaks0VjcxOE5qYmJTODlzQ1FJZ0U5b3RWMmp5b3oy?=
 =?utf-8?B?TDNzMExXNmtyR2E5K2lHTWJRUzQwSUlEQUtHNmNkbGJKV0pEQTQyZUZGMWtl?=
 =?utf-8?B?VmRiWi9id0piVk9QaHpjWTFBVmdob0hOeWREMnhjdUY5VEM5b2xuL3pyV0wy?=
 =?utf-8?B?a2pLR0RUMmJtbXBERWRydjZqVVc0Q0E2S2ZGT1psUDFaSmFlTFBtY1ZDWVVN?=
 =?utf-8?B?U1ZPU1pJN1FWVVpIQ2EvVGt2Vml4eTlWUXExWEVrMnNlelg5WTdQOXUyaDB5?=
 =?utf-8?B?L1ZQOTFnbmVhUzU5S3BMQWFVM1RiMm9EbWN1aktpUWQrRlE2RzAyenpmbVJh?=
 =?utf-8?B?ZlFiZ0Zoc2lRdWdSRmhkSWN4SVh1MWVINnBtcXJLd2JCekJwZ0F2MmdkcUVE?=
 =?utf-8?B?QnFtVHg4RzVxNXJOQUdsOHNqcjQzSmg2eU1pdlpGcW5hTmx4ZmZzQVhDUjlp?=
 =?utf-8?B?LzUrSHNTcStVSTAzZXhXeGxDeXFyekVIVDhxa0E2bkJiMFF2RDBKMHBvUC9u?=
 =?utf-8?B?UDZhM1pxeXFLd1dVV3JLQ1c1ZXJTclk4L2tIUi9lQVVOcCt4Q2ZDbTJ2V29s?=
 =?utf-8?B?bjArVWl3K2pGY21CN3BndXRnL2VFeGhUakl6OW4zQmQvZFVSTHk3VVhaMlgx?=
 =?utf-8?Q?OD60/GbKkLJj3c4Lk8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9dd2dff-f40b-4a2d-a31e-08df14e0c829
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 17:26:17.4366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQ+8Cm6DHLetx+7E95GUCrcVGqgbAUZPSzvIB3JBetKNlJ1O7jnQngfFqJckjgZ4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8905

Hi Reinette,


On 9/16/26 00:33, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/26/26 12:32 PM, Babu Moger wrote:
>> @@ -2377,6 +2380,33 @@ static int rdtgroup_add_files(struct kernfs_node *kn, unsigned long fflags)
>>   	return ret;
>>   }
>>   
>> +/*
>> + * resctrl_hidden_files_set_visible() - Show or hide files marked hidden
>> + * @kn: resource group kernfs_node
>> + * @show: whether to show or hide
>> + *
>> + * Iterate res_common_files entries marked hidden and show or hide the
>> + * corresponding file under @kn.
> 
> As a generic helper this is not appropriate since it just blindly makes *all*
> hidden files belonging to a resource group visible or invisible. This pretends to
> be a generic function but then assumes that only kernel mode related files
> are ever created with the hidden flag set because as the kernel mode changes
> all hidden files belonging to the named parent changes visibility.
> 
Are you suggesting that I update the code comments to be more specific 
about the group, or are you suggesting that the code itself should be 
changed?

Thanks,
Babu
