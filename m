Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012017.outbound.protection.outlook.com [52.101.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CF0497387;
	Thu, 17 Sep 2026 15:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658969; cv=fail; b=LiQ1hA9JRXxnP+v+UgC8zTid89XpNMn5kO0nB3y9e/BR7e9JueZNF1TjMlrq9lpa/8D1GlH8yJdduxDgV6vn/8JQUDIOh8Re7kb3DchlQ825mulwC7OTX4piQvwzYllf8lsJRwPxKzqiCgpYYiYDf+Z3nT55DNokDq1xbJJGIew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658969; c=relaxed/simple;
	bh=QxduImbOM9h2FQ8kPBbwRgoO81dPWxJ7+MnrRv3fJ9E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ykg7rutOlVqENbU07A3Q0QSDxRcCSCnXFsUi2bZEm1ZBJtyMrQM7OiuByANbZkfx4jXB0R5jW0fUHDbIdSjM9pLSTkAMTbKFLqKrGKblCyqMvWPgUslg0qdHdAWramLIx2ywedqN1ETOAldiX4+qKZ21AjtdNrID7xIVRXQcJ7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=E3MF2nVC; arc=fail smtp.client-ip=52.101.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="E3MF2nVC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIQWysZuFq4GodIdn6kKx7yxU3LWhLpFiqJTD3vXaLloPS4j7RUuphu4Z+s/voI0dgqyRMfYJncZbKSz/n/tCAT5cFFR9t7nPJzKUkWh+LcGdYeDobtpLZ4Rdp13t03a2y7Ks13DweA3lrNMbjSmYLHVN/LFD5o3MeedlIexFrqqkC+3IcoUS4T2j+cTBpRWW0RnGTEz2fRTq6qaaIdzFSXJHS13tCdF4mQoe/TA6kuB1fl2rJ1/WRQ1YvjgKZJm2JKSRBMhaotG7cvbDEizsa44V769iHWI3I8KU3Ny06jfAKvb6qKglH3IO0f2EZX9HBsjM7mGGM1cir9FMQY2HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGm88tsFwkAJ+VQgCZlPotE2PYVvCn4wBgeJdCLwg6o=;
 b=b7ff3i/fLPBnyGY2vOXuC51fGk+N6fFrySnk4lqQphPubERoOUC5mODPzN8K82qnvq7YDGzKi/6hIR89RDcw7CSkpzMEESuDllEq3sb/ciQFArFSja/qPBTnbocGM0UTp8hzwX+num+xF3q7oHjsPTDj+m2AwltsRX6uNJYWAVv1KcK07bkznCyzpcrDZhjXtrbh1rKoYCCGbIQJMEqlvHjcAjy7yv/OZWBuE8GoNtC53avgOd4OC+Q5S2kyyRFMBunan8NMajAsLgnwuExDTuauJuC2QyMusQw+m5oeV3gcFUUMEQJqQYJtLDGWMe98uxPbIwOtTtQCRDonSI+Xmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGm88tsFwkAJ+VQgCZlPotE2PYVvCn4wBgeJdCLwg6o=;
 b=E3MF2nVCF6+n0C1yGRRQVpZSWtHMSP6mnmQMUSCGGbovEXtGfKFqHWq+p8c0f504XfcUAc2PMYu+fjHI6ZOPn6SGNBa91MvPCljmxS9ePbh2ZE8PQaPyN245Wl/o9QLns1/w1XGSLA59UMy7o06Kr4grI+XvRj0p6PHzEAVUjgg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by MN0PR12MB6199.namprd12.prod.outlook.com (2603:10b6:208:3c4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 15:29:10 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 15:29:10 +0000
Message-ID: <31a8026e-a1d3-4866-b32a-780b5127d7a1@amd.com>
Date: Thu, 17 Sep 2026 10:29:06 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5 09/16] fs/resctrl: Add interface to display supported
 and active kernel modes
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
 <530d77a64117347dc1a4d2666967df188a3a4757.1787772750.git.babu.moger@amd.com>
 <4d22e8ff-1050-4a88-af47-e78c96db1f6e@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <4d22e8ff-1050-4a88-af47-e78c96db1f6e@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:610:52::37) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|MN0PR12MB6199:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ef995f-5471-453a-0911-08df14d06be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|56012099006|5023799004|11063799006|4143699003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	6s+0jDvFfw1f+bHxZ2RwTHkzSy91QKE2BPHpOenNRabGqrecwZRVSu1+HJ/LJwyEij0f0cCmLMXpyrgd1nkVXmrKkIk1cMOxk1cN25uKir0QfA5z3Q5/wcFFOhr09FRgDLhSkMYKetjm6pyXxJzVpdh1x/ySiV3iMi0asIpvImcXaeJRd0WNUDv/4kTJchShNjPFMtjAfoXwCDUMWNO+ZcQMLQTeJ22tVxTslD3X+kCZyiZEh/qUjt8Tn6Y8SGj7idL+R7eAhSoHLnA9LqleGesU2EP3MyzV7y/HzgdXDjdjy++Tx9zwiZaqBNznvFW1/2hm8SZmcpUbvx8IFHqpnOYt5M4BQPDEfnmN3D4unUx4aKuncFWWNsH0sIOCaHFxmz7ShTeGA2R1rrhBQXgEe66KfEvVnvNJdBNip6mfP0vhiQ8eITEUrfs3brDL36h5ekws/N5Twk/d0qOueeWqMxctpPhucxgeMmFRwWjr/hfs4ETzMEuPtlvrBE5XNiL35WF9LdPE9eIEzePWsjQhd+dDcOhZTn+1+19O7+DWq7LHXhfwqH6ZUGVwxM/67DxYM3zre8haSw1i4jE6CMjAwx57ICxb9AHRGLR3Vz0iOjE+lEKRZsxXqqyLiknhDi0jeNkPSVuyEy3TMWXaVn4WrYFCD14RnLEX/7V8TY/iAJU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(56012099006)(5023799004)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWRrbDU2NXpmQVBVR1FtOHAzZGlNSkgyWHBrN1g1ODJBNzlhb2Evc08wOW9U?=
 =?utf-8?B?ajhtVjR3dys5WVVPeU5XR2JRaWlOQ1JEOWZpUXRWSGt0d0pvdmNPb2NZQ3py?=
 =?utf-8?B?R3lRZEZnMUp3RVRxa3RPUE8wTDU5N052Y0dXMldxdUZZMmQyalU2S01IN0xC?=
 =?utf-8?B?cUphKzJOZjF1aWYzZVFlcHA0UEhzaVpkdUxHeDBKeDFGQVZaTU14UkU0SFk4?=
 =?utf-8?B?d2V5Y0tBZVZ6b3hpeFRCQzJ6ZU9pelVXdTYrTlB5UzlUSTV2VVNzeHNuWTNz?=
 =?utf-8?B?dFNOMUx4bkhJMXQ2dXI4TWdGTW5LWXNNMElWMGxBZ1BDcWxQdWVYTzBIc2xi?=
 =?utf-8?B?bi92cVNIMzI2eUhEc2NUeFNxVTBBUEtvYzhhdGRDb0RvZktKbUFlMGMwZE51?=
 =?utf-8?B?L2RXdU5TQVVGbWNtdnplQ2VDZ0lTaDRtYjBxTllCQVFkNlVwblZOMlU5dEo2?=
 =?utf-8?B?bjRKRk83L0x3V2RLQ0hDUzZyRzJUZTI3WmtXampESGJTSE9yYkRLY3lnSHcy?=
 =?utf-8?B?T3RJcENGZDFqalBEakJtQkdjQmRBTkpaUUlVQXdOZklMaFpENlJGck1ka204?=
 =?utf-8?B?bHdSeFV1VFFmUDljNmRZakhKRWJQRTlyRU81RitxbDZubWx1WGQxRks1Z2Fa?=
 =?utf-8?B?aU9qdHdLbFIwNlJqc1R2K3FpbG9aUmZ6WXFxSUZzeUd5emxiakEvMWZhVi9p?=
 =?utf-8?B?ckt6MURxand6SFBzbEErRXUvb1hkbkxXTDdsa1RUT3BJa3JsYm5PeDg4VUV5?=
 =?utf-8?B?TEdxemg3T1NCWThJaUkzR3UyeE5udVFrYkh6WkhzeVYxVzN1Wjl3aWRjeE9T?=
 =?utf-8?B?VlBxUmRZelZYUGxUaStEUCtYOUlRYU9ZZzZvcVpjSURpbzA4cGRMeGhXZCtP?=
 =?utf-8?B?SHFZWDI4WWlENDhtOTI4cFN3RzdtTEdFbW9EclJHUFpJUHNKdUFmbHdJVmlC?=
 =?utf-8?B?YmN6Y3QrMS85UjhXWG1EY3JzWG8wUDZMaDNyeVpIc3k3TzRtcGh5ZEdVb2da?=
 =?utf-8?B?UDJUSHFzV0tETGRMSE5leUMxYm9ZU1FSRjNJYjhXUDRkcEwwYmM3eTVjeWhx?=
 =?utf-8?B?eHpWbEhwQVRjS2MydnlWbEpxVGIwV0thU2xndXFYZU5scUNKMGFzTENTVlFD?=
 =?utf-8?B?Nno5NmZLbDJjZEd3WWExb040RHhFeGwwMGZWQXFPWjJ0TVliZ1NWN1lDNTVS?=
 =?utf-8?B?aXgrVWsycjZobndqckgxWXVyQXBDNnFHMkdhQUpJY0lQbUNCVm51bDlxb0NB?=
 =?utf-8?B?eS9DN0pORWpNdnZrSGlCY2F5Z2JuMG9TUVdDSnZOVjZ3aC9ZR1k2VkVEMlh3?=
 =?utf-8?B?UHRNN04za3c4LzBLTTZ6VWMxNkg5bS9mK253WTd5TGVMS3BFakNFYnRxOHc3?=
 =?utf-8?B?dXUwK3JoR0RVRWd1NS9XT0puT085UHlwWTRPaStpSVppbDZ6OG1jK2xOYklW?=
 =?utf-8?B?Z0ZJa2VTQ2dma3BCZzgxQVA1dDN2V2EweGJIRFFPNURoeHdVMVNYMU9zSFF6?=
 =?utf-8?B?RGNZYkQwT2RjbU5MRXNFQWNSdXl0WHp5Vk15aHVWTGlEUEFLZFRHOGlXeDdu?=
 =?utf-8?B?dlA0WmhMMVdqWWgwcHFTM3JNcjdINHFNenZHQjZhYXVjREtHZklqTTl3NWNw?=
 =?utf-8?B?Yi9FY2Ivd05JUUVKRGdaR0YxZlVwSEhLbDZjY0UyNy8zVlgxQ0dleTJrZXk1?=
 =?utf-8?B?UWlndHV5ZVIxYng4VVh3ZHp2ekNWN0kwVTZwb0lGUHpJR1JjQlFRaFBGYzgx?=
 =?utf-8?B?a2FFWTlrYlh1WkpmTmVMK2tmMFhQM3BwQWdoeFJPSzNodHhVN1VOOUhmZTM3?=
 =?utf-8?B?ejd2bmwwNUd0bG1TNmFEaGRvNnJ5d1ZOcWtiVEk0d0tjSHdVWHorM2tldTJQ?=
 =?utf-8?B?Rk1lamcyRE9MUHR5SldYakxXc0VCTDNVNWFjbDF6aVdNRkZUS3BEblY0NnVB?=
 =?utf-8?B?RTloSmU5SC9Ba0U1TUp5alBLSkJaVStrNHlVN3NGMk5JMlc5akplanROa2wr?=
 =?utf-8?B?UFFDUUYwcCswUU5kSXpqL2tROCtFZ3lHNVFRT0ZtbGVGem5xQlU0anNMNWZ2?=
 =?utf-8?B?eU51WmFFVHJKaWdPc0RSZi9hbThJU1N2UlRkdG5pYXJaTkdjZHNaMENlMXBa?=
 =?utf-8?B?Mng1LzhiSUFNc1gyS2FSQTd2d1c2cVdZZ3JCb3k1cHBxOEZLSEhnQVExTGtW?=
 =?utf-8?B?YVBpOTUzNnpJdVBlbUE3U3l1bG5nbVdmdG9MMTIySlB2eFZqUjIyQ2hKbUZk?=
 =?utf-8?B?RFpaZ01TOUl6ZlRWbndJOTFWaDU5cnlEb2d3TXBkRFZ6MjNCTHRWYWNRbU5k?=
 =?utf-8?Q?KC8p4ejvgBj1jA5SF8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ef995f-5471-453a-0911-08df14d06be7
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 15:29:10.7076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymphhLvao2HXTBisFZ13TSvrUC+xjerkWDlbobljdRHszRoVEYarxAa3G0326CNq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6199

Hi Reinette,

On 9/16/26 00:32, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/26/26 12:32 PM, Babu Moger wrote:
>> ---
>>   Documentation/filesystems/resctrl.rst |  29 +++++++
>>   fs/resctrl/rdtgroup.c                 | 115 ++++++++++++++++++++++++++
>>   2 files changed, 144 insertions(+)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index f3e941404967..c6e8cf828e18 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -528,6 +528,35 @@ conveyed in the error returns from file operations. E.g.
>>   	# cat info/last_cmd_status
>>   	mask f7 has non-consecutive 1-bits
>>   
>> +"kernel_mode":
>> +	In the top level of the "info" directory, "kernel_mode" reports
>> +	supported and active kernel modes available on the system.
>> +
>> +	Reading the file lists one mode per line. The active mode is wrapped in
>> +	square brackets. inherit_user is shown without options.
>> +	assign_global_enable_per_cpu is shown as::
>> +
>> +	  assign_global_enable_per_cpu:ctrl=<assign|inherit>;mon=<assign|inherit>;group=<ctrl>/<mon>/
>> +
>> +	- inherit_user: inherit allocation and monitoring from the user task.
> 
> To make this easier to read, instead of mixing the modes, could you please have text like:
> 	
> 	Possible kernel modes are:
> 	
> 	<description of inherit_user>
> 
> 	<description of assign_global_enable_per_cpu>
> 
> In addition to being easier to read something like above will also be easier to expand.

Sure. Will do.

> 
>> +	- assign_global_enable_per_cpu: kernel mode may use separate
>> +	  allocation and/or monitoring associations. ctrl= and mon= show
>> +	  whether each is assigned or inherited, and group= identifies the
> 
> Earlier is "ctrl=<assign|inherit>;mon=<assign|inherit>" and above is
> "ctrl= and mon= show whether each is assigned or inherited". This is rewrites
> the same thing in different ways without helping to explain what the parameters
> and their values mean.

Will add of the descriptions of "mon" and "ctrl" states.

> 
> 
>> +	  associated resource group using <CTRL_MON>/<MON>/ path syntax.
> 
> This text is difficult to parse. It switches between "assigned" and "associated"
> *in the same sentence* when referring to the same thing. Please use consistent terms
> and just be specific about what this actually by avoiding this vague language.

Ok. Will rephrase.

> 
>> +
>> +	Only supported modes are listed. On an inactive
>> +	assign_global_enable_per_cpu line, ctrl= and mon= show platform
>> +	capability defaults rather than the last active assignment, and
> 
> I find the text to be very vague. Above could be moved to section dedicated to
> the assign_global_enable_per_cpu mode and be made specific. For example,
> 
> 	When inactive, the parameter values displayed are the default values
> 	that will be used when no new value is provided during enabling/activation(*)
> 	
> 	(*) pick a term and stick with it

Ok. Sure.

> 
>> +	group=// is shown. When the mode is active, ctrl= and mon= report
>> +	the current assignment state and group= identifies the associated
>> +	resource group.
> 
> Last sentence just repeats the paragraph above, no?

Yes. Will rephrase this paragraph.

> 
> 
>> +
>> +	Example::
>> +
>> +	  # cat info/kernel_mode
>> +	  [inherit_user]
>> +	  assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=//
>> +
>>   Resource alloc and monitor groups
>>   =================================
>>   
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 3bb0e3a203ac..992af586a194 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -1010,6 +1010,114 @@ static int rdt_last_cmd_status_show(struct kernfs_open_file *of,
>>   	return 0;
>>   }
>>   
>> +/* Sysfs lines for info/kernel_mode; indexed by enum resctrl_kernel_mode */
>> +static const char * const resctrl_mode_str[] = {
> 
> This is incredibly close to resctrl's existing rdtgroup_mode_str while being
> very high level. Could it be renamed to be more specific to this feature?
> For example, resctrl_kmode_str[]?

Sure.

> 
>> +	[RESCTRL_INHERIT_USER]	=			"inherit_user",
>> +	[RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU] =	"assign_global_enable_per_cpu"
> 
> As mentioned earlier I am starting to think that the "assign" in the name
> is not necessary and creates confusion with the "assign" values of its
> parameters.

Sure. Will remove "assign" from the name.

> 
>> +};
>> +
>> +static_assert(ARRAY_SIZE(resctrl_mode_str) == RESCTRL_NUM_KERNEL_MODES);
>> +
>> +static const char *resctrl_kmode_state_str(enum kmode_state state)
>> +{
>> +	return state == KMODE_ASSIGN ? "assign" : "inherit";
>> +}
>> +
>> +static void resctrl_kmode_group_path(struct rdtgroup *rdtgrp,
>> +				     const char **ctrl, const char **mon)
>> +{
>> +	*ctrl = "";
>> +	*mon = "";
>> +
>> +	if (!rdtgrp)
>> +		return;
>> +
>> +	if (rdtgrp->type == RDTMON_GROUP) {
>> +		*ctrl = rdt_kn_name(rdtgrp->mon.parent->kn);
>> +		*mon = rdt_kn_name(rdtgrp->kn);
>> +	} else {
>> +		*ctrl = rdt_kn_name(rdtgrp->kn);
>> +	}
>> +}
>> +
>> +/**
>> + * resctrl_kernel_mode_show() - Display supported and active kernel modes
>> + * @of: kernfs open file
>> + * @seq: output seq_file
>> + * @v: unused
>> + *
>> + * Lists one line per mode set in resctrl_kcfg.caps.kmode_sup. Brackets the
>> + * active mode. inherit_user is shown without any options.
>> + * assign_global_enable_per_cpu is shown as:
>> + *
>> + *   assign_global_enable_per_cpu:ctrl=<assign|inherit>;mon=<assign|inherit>;\
>> + *					group=<ctrl>/<mon>/
>> + *
>> + * When assign_global_enable_per_cpu is inactive, ctrl=assign and mon=assign
>> + * reflect resctrl_kcfg.caps.ctrl_en and resctrl_kcfg.caps.mon_en, and
>> + * group=//. When active, assign state comes from resctrl_kcfg.active.ctrl_mode
>> + * and resctrl_kcfg.active.mon_mode.
> 
> The code is much easier to read than above summary of it.

Let me rephrase it briefly.

> 
>> + *
>> + * Return: 0 on success, or -ENOENT on error.
>> + */
>> +static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
>> +				    struct seq_file *seq, void *v)
>> +{
>> +	const char *ctrl_state, *mon_state;
>> +	enum resctrl_kernel_mode mode;
>> +	struct rdtgroup *rdtgrp;
>> +	const char *ctrl, *mon;
>> +	bool active;
>> +	int ret = 0;
>> +
>> +	if (!info_kn_lock(of->kn))
>> +		return -ENOENT;
>> +
>> +	for (mode = 0; mode < RESCTRL_NUM_KERNEL_MODES; mode++) {
>> +		if (!test_bit(mode, resctrl_kcfg.caps.kmode_sup))
>> +			continue;
>> +
>> +		active = (resctrl_kcfg.active.kmode_cur == mode);
>> +
>> +		if (mode == RESCTRL_INHERIT_USER) {
>> +			seq_printf(seq, active ? "[%s]\n" : "%s\n",
>> +				   resctrl_mode_str[mode]);
>> +			continue;
>> +		}
>> +
>> +		if (active) {
>> +			ctrl_state = resctrl_kmode_state_str(resctrl_kcfg.active.ctrl_mode);
>> +			mon_state = resctrl_kmode_state_str(resctrl_kcfg.active.mon_mode);
>> +			rdtgrp = resctrl_kcfg.active.k_rdtgrp;
>> +			if (WARN_ON(!rdtgrp)) {
> 
> Just pr_warn() is sufficient and avoids the discussion about panic_on_warn kernels.

ok.

> 
>> +				rdt_last_cmd_puts("Invalid kernel mode group\n");
>> +				ret = -ENOENT;
>> +				goto out_unlock;
>> +			}
>> +			resctrl_kmode_group_path(rdtgrp, &ctrl, &mon);
>> +		} else {
>> +			ctrl_state = resctrl_kcfg.caps.ctrl_en ? "assign" : "inherit";
> 
> This does not look right. As I understand ctrl_en represents whether the system supports
> allocation or not. So above means that if system supports allocation then the allocation
> state is "assign" while a system that does *not* support allocation inherits *allocation*
> association from user space?

When allocation is not supported, we should not print "ctrl". It should 
just print "<mode>:mon=assign;group=//"

Same way just print "<mode>ctrl=assign;group=//" when monitoring is not 
supported.

Will take care of it.
> 
>> +			mon_state = resctrl_kcfg.caps.mon_en ? "assign" : "inherit";
>> +			ctrl = "";
>> +			mon = "";
>> +		}
>> +
>> +		if (active) {
> 
> Why are there two separate "if (active)" blocks?

Will merge it.

> 
>> +			seq_printf(seq, "[%s:ctrl=%s;mon=%s;group=%s/%s/]\n",
> 
> This does not look right. The reason why this version moved to a single global mode
> with parameters is to be able to support systems that do not support allocation or
> monitoring. Having these separate parameters thus enables resctrl to only show the
> "ctrl=" parameter on a system that only supports allocation and only show the
> "mon=" parameter on a system that only supports monitoring. Above just keeps showing
> both whether system supports allocation/monitoring or not.

Yes. That is correct. It should only print states that are supported. 
Will change it.

thanks
Babu
