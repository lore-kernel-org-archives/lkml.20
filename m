Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010007.outbound.protection.outlook.com [40.93.198.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A1A4E06DF;
	Wed, 16 Sep 2026 20:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592054; cv=fail; b=Bads12TjuebKKE7UOqlVlu+r/j5vq/Xx/AEYk/qYvXKFCy3UIgvCYWxrWRSynUj0wq5/ohS4F3Su2/OmDRoelmr2vT1jorrRMxnHObzjGgH2Uo+PRvY1DP+PKmVsYbGWLJnfb5CKC6UZNaVgy+IoGVcs19gX7Q8pNax3VDOYKf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592054; c=relaxed/simple;
	bh=sTPbxk6UK8v6lEq88cEFtsx4RsyZyAoSSoF4MezZcI4=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kEBsUqD8xk2xZf/lFLu3hhL3H/QvWSVpSokIuR0NUJU2Zuw4+ciD4Peq1RqhtPmxBgIAAdiYZq6lDYlA5Gaa/SG3pWSE/mXvRfmuv7vj61dKXnwi//kw3W8MlW+0kMClsfelidwVjN03W+svTmKB4gEaoJ4/NPnbVhKKj4XAHgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=c9JPS0Tb; arc=fail smtp.client-ip=40.93.198.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="c9JPS0Tb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jf/QPy4u8okJc4KEcEFV32lrf2rRGdDShAi8W0jb28rhflhSZaeC4auTB4120FJZkTuClCws9tsvTkp3eLVqRc9STdIm9vVC/8XDm1fxMWfAn+uBMUx5C+INjpDv8DkimkokGszNp0ABRF3MLP02fo90A5DKy6449+KoT//g3x0Mo/BFVshYXaFTTLx1jsJsLZYv7sMGbNtIb5IMnuNsn62e1R56wLjZt7C4l4jvJowyXxlg+61d/Uti9Hg+CaOReWHiphlZJvcoqnA4Yi1SLlm8dudAmzV6mmLOvWIImEWeY4l09v7mW1QykxHfHswXpjPZ/AsNKO76BjyH0uyutQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EWXheQWvvK91gl2riUfKWCra9d5E39I/bx05n6uyEI=;
 b=PZKxBsaDUppznowvilMCAdf8UWUryYZcSRnywRk2Gq1HrKLWXLQOJHfLxkSn8ufKnh6eT0fwUSbAim7/OzuWejOT8ynTvpmW/GjjrLAszL2VsaiSctj9zT22rDkSzxyvfv76emI3RegfXo9Rz2ICePbixgMK4Zd0gvTaw0azswfcD2CH7sIdgf43870VeJduB7mZyP/K0ut/zgaLJgH9do6lmKOqMWKh97JV2YoAtOAMUbCBMcP+AdgSqPaRN9/3/OEIx5bXIPO3V/g9KkImTu0bCU905w6VHcrLrKBJDzD+JeB27iIYON74lshPOlSIECxJ93uosn1uEHkEHDH8wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EWXheQWvvK91gl2riUfKWCra9d5E39I/bx05n6uyEI=;
 b=c9JPS0TblYeXG0IwBskNc8+RdtAALV0iagQmSq9gklZknZ5vG8iRYAdJNOyBS+Y+c5BL87Nldqvi/7vGq79qkZ54UScFdxvZ2o7L8XYfcDyTQBuyeHhZ2iixqswwxnlGXUMbTJ64LKYriFY9HaV147EbB8oON4XmRjK7j3WIOg0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SJ2PR12MB8133.namprd12.prod.outlook.com (2603:10b6:a03:4af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 20:53:54 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 20:53:53 +0000
Message-ID: <ea65c041-384c-4d16-810e-c3ab070db317@amd.com>
Date: Wed, 16 Sep 2026 15:53:50 -0500
User-Agent: Mozilla Thunderbird Beta
From: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v5 04/16] fs/resctrl: Introduce kernel mode policy enum
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
 <a4fc2a485b26b94b8ae604ac3e82dcf33e39684d.1787772750.git.babu.moger@amd.com>
 <5a85e139-99de-4821-97ae-5a7b5b4b5027@intel.com>
Content-Language: en-US
In-Reply-To: <5a85e139-99de-4821-97ae-5a7b5b4b5027@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR17CA0021.namprd17.prod.outlook.com
 (2603:10b6:610:53::31) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SJ2PR12MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: a349c524-e90d-4ac9-eaa8-08df14349e4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|6133799003|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ixKEozAkNfuT99T/Y3QxAldcTDRnOdFdCTq+TmE3UKSaCaKl7TJ8uojyn7Pe9Y+TKMjohIuZG1fM6iwDSDssvTI8c6Cn9m1lef9wNv4gfaA/4dRMfLYEXlpnuwVJXoU6wbcVvYHHzLkcJLQQ0BWRc5ZTMx5fZLKwySw6LxBOWmAy8aD4NvRH691B3BvTqYTrX65aFtR0twB+aKHvCj6Hqwbd2MxZbrsNKD18LJVZ9t1kLisQP+zIcTjtWAwa9oGuglfok6Fl4RjlVpcMurK6HL+78wd7hvci54Wgb8ln+Z943Nl4JwgF4GwHRu85e9Vll/DTG19hOiHf0bC+a58YA7L3zPcKdcKpjPC9MWk4hiGKTBSnYB9Prch6nsrefJSvBHP+LCGQxR/VQvRGyiCw60zq8Xm/FrsRFRUu72/TRCQi8R5St0nCzdxIrjhewX4v8nSRGpzKUOWAd9JoNb+2E0Xsm8DYpod8RzuXN8DoMYeL8B/owyU/ebJKl0m19zmLQdnT0nOTB/sKBWZ+9u5xfxaxuReJDjODEoIXYKwfM7vDqFWWQ3XL+AuxhA/GN17+jFTZwtTf9owIrpNEbBIB+sTVlF5oIz91860phxm35VtH7pEKhZwc0SJrIEab1zz+EKn44rWhulY6ebEGISLyj4bfiUQqT7Z7nM+ZXNQqlMs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(6133799003)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THJ0YmxRSXNJZWpVbk4rR2VvUW5GemN5QVorOFhuejR4ekZPaTA3UjRORlhv?=
 =?utf-8?B?YlYrMFlwb1Z0RG05Q08vZW1WMFRyWklRRDBDQ0dkOVc0VkVPS2xZWXR3VW9L?=
 =?utf-8?B?bzdUL0UxdmplRUd6a3ZWKzFMR2dMTFozdWs4Mjg1cnFxbXMwRXRsRUo1MDdI?=
 =?utf-8?B?SVBURkFPOTJkWlFwNU1jd2xHRC8zZkpONThZMG1Ja3VheHljcnc3VHVHUHhs?=
 =?utf-8?B?L242RUQzbnRZVkYvT0xraFEyZVBQM0luSVVMc09EdkMwUkVFMTlRU3hrUG9C?=
 =?utf-8?B?YTdXSjE1Vzdlc0xxa1AwRXd0UDVLQ1JNUWVEbG5iS0duVWJlNkE5K21EbmpY?=
 =?utf-8?B?VUk2QmVITjBFVklhTnVTQ1lXOTV6emY5MHAvdnJncVRsQ1BsdGwveEZIWnV5?=
 =?utf-8?B?c1pwcUt3WlR5VVdNalVtNkQzenJoM0YyTCs5Mm5jNWRUWVBqRUxMTld2bitH?=
 =?utf-8?B?S25jNWxZWkU0QzR4eVBiYWcwbjI0MmlsNmNrZHg2S1FlVnZ0RThYUkdtMlRz?=
 =?utf-8?B?ZlgxZXd6WTBON3RPUVNlMjZCc0RnS2lNUnpQTk0vaHdKTno1VWZoeStXbVF1?=
 =?utf-8?B?M0pPWkJGK29QZWFQUnpFN3VHdVhDbGQwQUZjTUF0Vi9JbWw5RjZTekZSUTRS?=
 =?utf-8?B?Z2RscTR4ZGlHVk1qQWN5emxQVVd2YmREOFIya3U0cWpUMzEyMXpyKzNuZ2dl?=
 =?utf-8?B?eWtKMnZzUWp0bkU2VWxLK2JHWis0ekZJVDNTd3BaLzlMYldjYjJZUWJoa2VG?=
 =?utf-8?B?cnZOak5vNGtmdGF5NUlvb3NXK21GWXhHZ3dzVkh1L013STd3OXJEMkIwczFK?=
 =?utf-8?B?YkRpWmZ1SDBhT1ZDSExiWUFudjJ4S2FhKzYrMGRTaS9qY1IrMC8vMkZxeExo?=
 =?utf-8?B?NGFDbW9SdTVTSzB4Ym5DTm9VcThFVzVXbE1mbnlyZllDQWRaY1haNW5uanZX?=
 =?utf-8?B?WGxFY1FualhyQ3VPVnFZWnVXV0laRGpJSmpYR2VHTHg0MzdtWjdGM2U0aWVx?=
 =?utf-8?B?L2xpWEYvSk5sdmZCd1U5SlpTWUlNb3JVb3FnLzVVWXJ1TXZKSG9MVXF1eERM?=
 =?utf-8?B?eTh5ck5JUVRiVk4zVWY4MGZsN0pTWWNqOUxuYVB5enZZdDlKaU1qSElvL0hW?=
 =?utf-8?B?bVcvNVl4bVlnOFN5cjN1WGcrbEVYcTEwbVlSdU9pdHZGZUc0eXppZy96d2ha?=
 =?utf-8?B?d2UxczZBYnU1OGFBbldBK1JiOUpUN2xPMzF3Z08xRWUzck9raDFWa092K0RB?=
 =?utf-8?B?QlFMVUk3bGNaOFNYSTNhODk1aDZST1Bzb3dlM3JRZUwrbmJBNmJuNkhjSkhF?=
 =?utf-8?B?MHpGemxBQ1JXVjFsVmRmVVUxZC9YY2ZNZ2JMR3c0b2ZOWUtMQWxHR2JMSW9u?=
 =?utf-8?B?RzE3R2kyQ3BDL092eFg0bUhYL21TZzEyblVZUW9sQVNlTnZEMGFyZXJ2U29z?=
 =?utf-8?B?UU1aSnFnNGVjd0VxUS9YOG1rYWVVaXJVV0lac2laa3k0NTAyQ0ZiL3R5Lyt3?=
 =?utf-8?B?L3BJT2pNdWdYWUJLVXFSS0krOU1BS1hKemk4WUpkUTdOb3JqK1JpVnJId3ht?=
 =?utf-8?B?WXFDZ2JNR2RIckJaTVEyWEg2Rnh6Tjc1V2FheFFBdllCUHRYaVZmVjQyZTlR?=
 =?utf-8?B?NkNTL0s3Sm1xUnc1c0JlMU5qVi9WZ2dwYkMrZWJXSFk3RE5La2lBY2JML0NI?=
 =?utf-8?B?YWxsMUZSbXNpMmtOSHZsb2IzdU0yait6cW1yQng2ZUNlS1hQYUdqckhnL1dW?=
 =?utf-8?B?b3QrYUMxTURycjFVWDYzcXlPY0YzTncrdllGMFY0T3hsVVB6UWJLU0FpY1ZB?=
 =?utf-8?B?cGswQmlNSDhYcUd3akpuNnBnMnNVcnF2alJkenJUWnZKaGt2SzAvVXFUUE83?=
 =?utf-8?B?Y29adGZJeG93Y1Z0akJxWnBXTmtKSVBqcU8wVDhjd3hqbXJ4OXp4ZnYyQ0tU?=
 =?utf-8?B?NmV6bmg1VVFIQm9Fc0w4L2VLekY5QWVLSU1PY2lVMTdhRll4MmZmT1dVbGFv?=
 =?utf-8?B?RzdPZHo3SnV5SWZ5bXBNNnNHdlZkQ2tzUzRyTVRCN1VqY09GbUthVHJPdU5u?=
 =?utf-8?B?TEUxWGJidGRGdkM4NEc0UzhQbXpQMkdjV0w3Y0xPOUNLZU9BVG1lTjVoT1FF?=
 =?utf-8?B?dDB2OVdmWXRsekoraVk1Qm5rcjZyY1ZkaThlUG5IZStxSmhIbHU0V3cxTUsy?=
 =?utf-8?B?aTBrVWJsOGFDQzBQUzQxQk16bWhmRHFqa1FyeStjcE4zYThERUcvZHdITWY0?=
 =?utf-8?B?WGFwbDBlMHhhYndhNks4am8vVG1xbGFSakl6VDY3MzEwb25rR3JvaHFlN25U?=
 =?utf-8?Q?y1Xep90rxL7x++8K/6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a349c524-e90d-4ac9-eaa8-08df14349e4e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 20:53:53.7670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBhZ86AsSCI52fNOsx5xTne7sPGU8yijvp2jY/1PYP1FBewMgJngKvA0LSOUA2uO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8133

Hi Reinette,

On 9/16/26 00:14, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/26/26 12:32 PM, Babu Moger wrote:
>> Kernel mode traffic can use different allocation and monitoring
> 
> "traffic" -> "work" to not imply this is just about memory traffic but
> also includes cache allocation?

Sure.

> 
>> associations than the originating user task. On x86, Privilege Level Zero
>> Association (PLZA) enables the kernel to switch to a different CLOSID/RMID
>> when entering kernel mode.
>>
>> Architectures need a common way to name kernel modes before resctrl
>> can report what is active or what the platform supports.
>>
>> Introduce enum resctrl_kernel_mode:
>>    - RESCTRL_INHERIT_USER: Kernel mode inherits allocation and monitoring
>>      from the user task.
>>    - RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU: Kernel mode may use allocation
>>      and/or monitoring associations that differ from the user task. On x86,
>>      CLOSID and RMID can be configured independently for kernel mode.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> ---
>>   include/linux/resctrl.h | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index dd09c2ce9a0f..4245d1e65ccc 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -704,6 +704,31 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
>>    */
>>   bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
>>   
>> +/**
>> + * enum resctrl_kernel_mode - Kernel mode control and monitoring association.
>> + *
>> + * @RESCTRL_INHERIT_USER:
>> + *     Kernel mode inherits both allocation and monitoring associations
>> + *     from the user space task. On x86, kernel uses the same CLOSID and
>> + *     RMID as the user-space task.
>> + *
>> + * @RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU:
>> + *     Kernel mode may use allocation and monitoring associations that
> 
> Why is this "may use"? Could this be made more accurate? Consider, for
> example:
> 	All kernel mode work uses the same allocation and/or monitoring
> 	association via an assigned CTRL_MON or MON group. The mode can
> 	be enabled/disabled per-CPU. When the mode is disabled on a CPU
> 	then the kernel work on that CPU inherits the allocation and
> 	monitoring association from the user space task, effectively the
> 	kernel mode becomes RESCTRL_INHERIT_USER on that CPU.
> 

Sure. Thanks.

> 
>> + *     differ from the user task. On x86, CLOSID and RMID are configured
>> + *     independently; either or both may differ from user mode.
> 
> Please first provide all details that support what resctrl fs exposes to
> user space before, if at all, adding any x86 specific details.
> 
Sure.

>> + *
>> + *     All online CPUs are included by default. A subset may be selected
>> + *     through the resctrl group interface, and a CTRL_MON or MON group
>> + *     may be associated with this mode.
> 
> Please note that the word "associated" appears in multiple contexts here.

"assigned" might work better here.

> 
>> + */
>> +enum resctrl_kernel_mode {
>> +	RESCTRL_INHERIT_USER,
>> +	RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU,
> 
> Something that stands out in this series is the multiple occurrences of
> "assigned" in the new interface. What do you think of just dropping
> "assign" from the kernel mode name?

Actually, I was thinking about shortening the name here.

Let's remove "assign" from here.

Thanks
Babu
.
