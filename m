Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011035.outbound.protection.outlook.com [52.101.62.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11E030E85D;
	Thu, 17 Sep 2026 20:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678470; cv=fail; b=azpUXlmlCatQlmTF4aCcYupwRyNPw6U0pyEYZHqGcI8S6Kbh0XyJD3a469ESiw0Ya9hRzFNDjg0h7LPH8QBiwqIj65UeO1gLBmEQBGy5zAlZmEFgkifv2k5Q50yVAFPoHNhvQZQAk71Gg655lOrEVn8Nhu7cYeeyY3fwmN3cJMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678470; c=relaxed/simple;
	bh=vscVhQBj1wthV82XO3QUV+yp7DDkERoEuP6MhAlqgIA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cdp3kN6xhJ9Np4uIGekdi6uZxVgMEh7W8kFCGk7WcVBPm0iwKHZFPA+oHBwvZwK10Cgjz/mePbV8OL3002ExaNxPjLbuJVlfXtCHDqwknb4A04tZ78n8Q6LHqgR+GiBMRaiXoB+wGcAHQ4VVe5/EKcZ5ROSuE+DPWrlQhQCKIQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=espxQeTa; arc=fail smtp.client-ip=52.101.62.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="espxQeTa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqudgBzxwwPFDmIal2jvFelcgVVFL7WQeAVM1Vm7kIYqnxqlMypCJoxRmkowtc9uW9LTRPTmUSiUV0wdPG1NqNtR+wW/nQfShMHiUKlcqB6flMu3JTxLqJR4dzWbcjZW15nX/pkPcaStvsffb9OMGkiU2bQcNl/jzzb5AMs3FipebnOwFimUfY7R/fWa/WpQn11RrEpJv0eeFhycyWgRXy0bImQdspnSYP5m11XmKJd+380J1QWqYYQ/Sk1bkk05Wzsezq4s7yNTSrQ+XPBwl9vYJYI56YYtNeSQMXBCF8zMhs92RO8zSHuGyuS9xJr7yKEQ0yR3RpVJo7fCRQhDWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PiduHhyJa2rDxgZH1tu0kNgTJldr3/A3O7ExOPdfP+U=;
 b=jFKP1MvhsQ+tzKTeRA2/8cvmF7JS3HX2oKYi22leXEEWbX44t/qAAXBIs3w13oEyoZwuFpJfngoS6a6QVRuBOadcLqKVROErEN/qq93LaXl0aOOVwLf+v2PxpZatZT9PuxkXqNlcjygAgmov0phoL0ONaH3oHALb0/tjBRgqjwVyVdNSG17UkeZIIYaOKQ1fZL9k0/KLahRAIgMdLMftM/6sqE1jq0G0MBNUGRSCz09q75wNFvcM2k3kZzh2tBdzFLgRC6bK9+fcIzfbcXK+7CNr1vUMyHHL4cWoPYCGaGsOkixJv9ezdAjej7hvYcKSvyxzb5WFmcZefifKKiC3WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiduHhyJa2rDxgZH1tu0kNgTJldr3/A3O7ExOPdfP+U=;
 b=espxQeTassetlHKp3KjS11JCAoLs0PQiRJcO/wArWqNBRpNRUwN/0wFoh3aezjp6xAq1anfw7nEeDnYiOnw9JMqFKfkbYQ114MOiVk7Xm7H5GS6fSCkunTqQf5h4+l5RhCGBy3tqzoOZp1hZS+XCUxrOXaoS7dL2q7RWQOCc+KA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DS0PR12MB8293.namprd12.prod.outlook.com (2603:10b6:8:f3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Thu, 17 Sep 2026 20:54:24 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 20:54:24 +0000
Message-ID: <ed3c3e8e-9524-49a7-b9fc-be4d48d73cde@amd.com>
Date: Thu, 17 Sep 2026 15:54:20 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5 14/16] fs/resctrl: Add interface to modify kernel mode
 via info/kernel_mode
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
 <d50aaf18d60787e960b600494d7f33926fb0b51a.1787772750.git.babu.moger@amd.com>
 <3bc39dd7-b7b0-4203-a493-0bd872fdc644@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <3bc39dd7-b7b0-4203-a493-0bd872fdc644@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P223CA0008.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:116::19) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DS0PR12MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: 97887a64-b007-47f2-5456-08df14fdda91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|6133799003|3023799007|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PokFRFajTwnOTsQbFfFG6PnCGmQInw7vxWdi45F43i9kyuXpx6fqjsSIfGGczJxUx7vXmY1jMFycKrDzrSGV9cqz29853t7oAdyZN9bZx+iaDfogdh1uFrXMQpzkhc+zWYgZEgGxXxOvktiKynLPbJ3Ih3RwDrGW+gP9dO6eNzwHDAyBJhpILNsC08Yan9F4270mLys88ZgRW4JoBPnnp529wQXw1om+75rhXdFV6/EDcSibbVGud3JqO8fbeq6qmqyAQPCw+Du+yPk5pSo8f3Fo0+TKUJ6R7QSDxG9TYBoDe3PkCeMCTOhS6J2aRS0FGapTNR13dURr3IdSfj5nD24N1O+tpHNtRJ6jo2ZiCoEHgIJOTDWMnYNcwYb1p7/UgiivXaFso3SCsFLJlR1/DOk34Hmh8Y+DXV4kLKuXEfJTopsv+17/7r5zslO/KmzhODM9yNodNs7xUEGqCinndJui1CyTBFNxD9ySv0FftgDA1fAJa2esV+NgxoS1NxfkyD+rcO2skAgQok+MpvTNglYdLpH+HJudA7Nizpk8LNhSYc6AwHrYmhI1cRxs5YJp0Pj2wsqSNOx8vWpDZc6pQmgFDQCBEScUUhL2dUXt6Qs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(6133799003)(3023799007)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEx2L3lPbHBrUDFuQ21DZ0xGMWhVR0FpZld3ak1kelBGK1NZeGltSWNGYm56?=
 =?utf-8?B?TEdCNFhPYlp4d2tnb2EwRUlwV3k2K3MxZUFQeU05cU9qdGptbTZ3UHZmYnFj?=
 =?utf-8?B?SU9WY0hwcUFYRlVQVmI0VU1rZHUwQnBUbEMwUFNrT0pHWGxwekFzV25JL2Uv?=
 =?utf-8?B?UG5NRXhkOEZNSnNTYW9RU3JHOW8zUzJLNVJ6RndaM0hKSGZQUnFqZEpncWJZ?=
 =?utf-8?B?eWFRQXhDcDZJNFZjc3pmaFFiYnZMampPR2hyc3h6K2FXYjFWaTFkOCthWWk2?=
 =?utf-8?B?S2tvZzYzc1FuMHIyU3ZPaVg0enlwNlV5ZlEyMlZpSGdydEVGTzF2NG1QelBp?=
 =?utf-8?B?Y0pDRk9LR1pnTWN6RGphbHMvdTRFZHlPNWZUSjFWRkIzOGkzZU9tUjEzU0hs?=
 =?utf-8?B?TTNrZUtpR3E0RU1xRmhCR2ZRalJiMmtQdjJ4bXYxcWlCSnk3OTduQ090dU9t?=
 =?utf-8?B?RFVqb3BJeUNqVXZ0ZFdSOGgwbElsTDRWb3gralNSZXNqWjd1YnJ1a1ptaGdY?=
 =?utf-8?B?T2dxb0ZQeE9YdXBwa01iWk92bGdaZlU3K0sxck1pbkZGbkpiOFM4ZkM1UU5R?=
 =?utf-8?B?WXZCSUI3dE1ZUmRtMjdwaE5oVW43aTdaejB4a1NZdkxBUXErV2h1NElmbmJF?=
 =?utf-8?B?RkN4ak5FTjdhbElDRnNZeDFNT1JRd1Y4ZXZVdUN1NEJpc0FxN3dJY2Y1cTNN?=
 =?utf-8?B?VmhHZDdwNzhiQmNDK0tubC9JV2NkaUdlamFvY3h6Q1hhaXc3NVZzMEN1bUVl?=
 =?utf-8?B?aXhDK1dDNG9udkVqdjE1SEE1WXF2bmtBdHdwaitNUUd0QUtsUjR1N2xjMkpR?=
 =?utf-8?B?dU1sQklYS3ZiWDhNSUlIMjJlNnlsZGl1VjNvSklmYXF4NHE1cHNEc1Zyd3lR?=
 =?utf-8?B?eHNCZEFZdWNwTFROOVBKc0RJR3hYd3hTQVR2RldzaVAzYUQydi9zOXZWOU1G?=
 =?utf-8?B?UTFSOVlXQyszWWpJSXdYUDljc3BTVTlGVDA0dHUrQlBlUjZtcXEvWi9acjg2?=
 =?utf-8?B?bGJPMHVuTDB3Mkh0TmFocSsyMjhTYVVEUzgrdHB0Y2srUUdpekRBb0ljYVJL?=
 =?utf-8?B?ckJoSjMyR3Y4S0JBL3VLUVRxMXZCc0tQYXdpN0llbHk4WEdqdWRmQjlTd045?=
 =?utf-8?B?bEFVVEYweTFYWTBueEhzTEoxak13cXRMaFJUaDNJbVZDaE9tSUtxVUpOU0w1?=
 =?utf-8?B?ZEtsYXA0Qm5xTVhRNFNLTUhpWW9tTmxTSFdBN0VOSE1kTTBqMFdLMkRnWkw3?=
 =?utf-8?B?ZWxDK2VMbTk5eU9tZ2dZaUE0V0VtdzRFQ0JxYzQ2cHZrUUZOamRDRFBZZ3Y0?=
 =?utf-8?B?QVdHazJFbEJCRzkwaG9xZUpxZms0c1ZtMFQ3VisrOHFPdlAxMlU3VUN0QTVB?=
 =?utf-8?B?dTNQWkswOHRUc256OFJEVHN1MXJRTkNZeXZELzVvUkdOeWp4T0VTcWJwcFVS?=
 =?utf-8?B?bDlTZFpkbDJiSXplWnFMVlV0RHNob3ViMmJLOS8zYithN1JQVUVkWE42UUkx?=
 =?utf-8?B?TEFjVGpwWEd1cy8yZUg5V2ZuK0t3UVdpTmhtaDhSaVNjRVVWbE1RVUVTQnlC?=
 =?utf-8?B?NVhRM3AxT3FKK3kzbFZzUlhBNkJxNmt2WDgybVBlbXVmSHZqazlrcm5GSVlU?=
 =?utf-8?B?ZFU3ME5kcDltUCs2ajAvd1gyRFNJSno1Q2FEZlpiREttSkhWdG16ZXdPdUt6?=
 =?utf-8?B?YXljZ1BOQUJLSW1XSlladVZLSnVTNVdpYTgzVG0vVlJvcTBSU1kwN0VrTHYx?=
 =?utf-8?B?R0crS3MxdzloZFE5ejN2UlJhWkIrclBkU2FCYWpzMlAvMlV2L2NlaEUxUXlB?=
 =?utf-8?B?Qk1vekJ1TnNYSmYvQ0xjZmNKeGxTLytwcCtrTkRZU29yTlJWcFpEWnYxSVY2?=
 =?utf-8?B?eDhId0VxUFJEVGFIRk1kSnc3OUYwTng4VVEwQW54NmgzTmJub2orR0hmeitq?=
 =?utf-8?B?Q2xja28rMUc1UVJIZTkyMlF3ZEUzeVFRZmF6VVFlVW5iME5iOFFZS2JtdG5n?=
 =?utf-8?B?RGNOTnJhS1NXeld2SFViTjRWSFN6SEw3NHMwVVdNempVREdDd1gzblRtR1dU?=
 =?utf-8?B?d0w2RDR4YjJVaUk4SmlDQ3pjL3NiVW5LZ3hhbkVXT3RFcFJyWUdXSEtSendq?=
 =?utf-8?B?MUhjS3hBejlrdTJBeWhNUElsM0lxeHFPV29SMjdub0hxclpWS01mQXZ2M0JN?=
 =?utf-8?B?N3N3S09LNEdoQTVJaDFUT1dCTWxRS3JVcm96aCtUMGUyRHhWYm9SalZoMHZK?=
 =?utf-8?B?N1FYVWZuZHVFWExpM1BYaGs4cmxOMXFKdGlVSjJJMC9CT2dKMHZjTGdSa3Rk?=
 =?utf-8?Q?4bleLorhp2EoovZOoV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97887a64-b007-47f2-5456-08df14fdda91
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 20:54:24.2304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBbWkQJiaCYDmDarnM8UXJgFp/uMWRXjRaOaPWKtDbPVaOojDaE9zXbzgmVdg08T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8293

Hi Reinette,

On 9/16/26 00:50, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/26/26 12:32 PM, Babu Moger wrote:
>> ---
>>   Documentation/filesystems/resctrl.rst |  33 +++
>>   fs/resctrl/pseudo_lock.c              |   5 +
>>   fs/resctrl/rdtgroup.c                 | 319 +++++++++++++++++++++++++-
>>   3 files changed, 356 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index c6e8cf828e18..490e8f534d37 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -557,6 +557,39 @@ conveyed in the error returns from file operations. E.g.
>>   	  [inherit_user]
>>   	  assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=//
>>   
>> +	Writes use the same line format as read, without square brackets and
>> +	with a trailing newline. To select inherit_user, write that mode name
>> +	alone.
>> +
>> +	For assign_global_enable_per_cpu:
>> +
>> +	- Writing the mode name alone selects ctrl=assign, mon=assign, and the
>> +	  default CTRL_MON group.
> 
> Please do not commit resctrl to use specific defaults. The documentation can just mention
> that read of the file provides the defaults.

Sure.

> 
>> +	- ctrl=, mon=, and group= are optional, use the same syntax as on read,
>> +	  and may appear in any order. ctrl= and mon= default to assign;
>> +	  group= defaults to the default CTRL_MON group.
> 
> This just repeats previous point?

Yes. Will rephrase this whole text.

> 
>> +	- Empty ctrl=, mon=, or group= values are rejected.
>> +	- A write with both ctrl=inherit and mon=inherit is a no-op.
> 
> ... because this assumes there are only two kernel modes that can ever be supported
> and the other one must be "inherit_user" and thus providing "inherit" for
> these two parameters imply that "inherit_user" kernel mode? Could you *please*
> consider other architectures?

We don't know how other architecture's modes going to be. I will remove 
that line.

> 
>> diff --git a/fs/resctrl/pseudo_lock.c b/fs/resctrl/pseudo_lock.c
>> index dea2b4bf966f..a0b22b95fc08 100644
>> --- a/fs/resctrl/pseudo_lock.c
>> +++ b/fs/resctrl/pseudo_lock.c
>> @@ -536,6 +536,11 @@ int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp)
>>   		return -EINVAL;
>>   	}
>>   
>> +	if (rdtgrp->kmode) {
>> +		rdt_last_cmd_puts("Group has an active kernel-mode association\n");
>> +		return -EINVAL;
>> +	}
>> +
> 
> These snippets (also the changes to rdtgroup_mode_write() and rdtgroup_rename()) noting
> when it is and is not ok to make other resctrl changes is not related to support for
> modifying the kernel mode and should be in a separate patch.

Sure. Will do a separate patch. Also, I need to address couple of 
sashiko reported issue(more below).
> 
> ...
> 
>> +
>> +static int resctrl_kmode_parse_ctrl_mon(char *options, const char *field,
>> +				    enum kmode_state *state)
> 
> run checkpatch.pl --strict as part of your patch prep.
> 
>> +{
>> +	char *opt, *val, *end;
>> +	int ret = 0;
>> +
>> +	opt = strstr(options, field);
>> +	if (!opt)
>> +		return 0;
>> +
>> +	val = opt + strlen(field);
>> +	end = strchr(val, ';');
>> +	if (end)
>> +		*end = '\0';
>> +	if (resctrl_kmode_parse_option(val, state))
>> +		ret = -EINVAL;
>> +
>> +	if (end)
>> +		*end = ';';
>> +	return ret;
>> +}
> 
> This is an unexpected and new pattern to use a temporary NUL in a buffer
> then restore the original character. resctrl has a couple of instances where
> options separated with ";" needs to be parsed - many of them written by you!
> ctrlmondata.c:parse_line(), ctrlmondata.c:resctrl_io_alloc_parse_line(),
> monitor.c:resctrl_parse_mbm_assignment() - why invent a new pattern?

Sure. Will re-write similar along the lines of 
resctrl_parse_mbm_assignment() and resctrl_io_alloc_parse_line().

> 
> sashiko seems to believe there is a issue here. Some of the other sashiko issues
> look real to me. Please consider the sashiko feedback:
> 
> https://sashiko.dev/#/patchset/cover.1787772750.git.babu.moger%40amd.com

Yes. I need to address couple of issues reported by sashiko.

1. Avoid changing pseudo-lock state of the group when any of it's child 
monitor group is assigned to kernel mode.

2. Avoid changing the mode (not kernel mode) of the group when any of 
it's child monitor group is assigned to kernel mode.

3. Avoid changing the monitor group's kernel mode when parent group is 
in exclusive or pseudo locked state.

Looks like I need to look thru all the children to check on both these 
cases. It may be another new function.
> 
> 
>> +
>> +static int resctrl_kmode_parse_group(char *options, struct rdtgroup **rdtgrp)
>> +{
>> +	const char *ctrl_name, *mon_name;
>> +	char *group_str, *end, *slash;
>> +	struct rdtgroup *grp;
>> +	int ret = 0;
>> +
>> +	/* Skip parsing when group= is not present. */
>> +	group_str = strstr(options, "group=");
>> +	if (!group_str)
>> +		return 0;
>> +
>> +	/* Isolate the group= value from any following options. */
>> +	group_str += strlen("group=");
>> +	end = strchr(group_str, ';');
>> +	if (end)
>> +		*end = '\0';
>> +	group_str = strim(group_str);
>> +	if (!*group_str) {
>> +		rdt_last_cmd_puts("group= requires <CTRL_MON>/<MON>/\n");
>> +		ret = -EINVAL;
>> +		goto out_parse;
>> +	}
>> +	/* Split <CTRL_MON>/<MON>/ at the first slash. */
>> +	slash = strchr(group_str, '/');
>> +	if (!slash) {
>> +		rdt_last_cmd_puts("Group must be <CTRL_MON>/<MON>/\n");
>> +		ret = -EINVAL;
>> +		goto out_parse;
>> +	}
>> +	*slash = '\0';
>> +	ctrl_name = group_str;
>> +	mon_name = slash + 1;
>> +	/* Require a trailing slash after the monitor group name. */
>> +	slash = strchr(mon_name, '/');
>> +	if (!slash || slash[1] != '\0') {
>> +		rdt_last_cmd_puts("Group must be <CTRL_MON>/<MON>/\n");
>> +		ret = -EINVAL;
>> +		goto out_parse;
>> +	}
>> +	*slash = '\0';
>> +	/* Resolve the path to an existing rdtgroup. */
>> +	grp = rdtgroup_by_kmode_path(ctrl_name, mon_name);
>> +	if (!grp) {
>> +		rdt_last_cmd_puts("Group not found\n");
>> +		ret = -EINVAL;
>> +		goto out_parse;
>> +	}
>> +	*rdtgrp = grp;
>> +
>> +out_parse:
>> +	/* Restore the option string after temporary null termination. */
>> +	if (end)
>> +		*end = ';';
> 
> same here ... removing characters from buffer and then restoring them is
> unexpected.

Will re-write them.

> 
>> +	return ret;
>> +}
>> +
>> +/**
>> + * resctrl_kernel_mode_write() - Set the active kernel mode policy
>> + * @of: kernfs open file
>> + * @buf: Write buffer; use the resctrl_kernel_mode_show() line format without
>> + *	 brackets and with a trailing newline
>> + * @nbytes: length of @buf
>> + * @off: unused
>> + *
>> + * Parse and validate the request, then update the active kernel mode
>> + * association.
>> + *
>> + * Return: @nbytes on success, negative errno on error.
>> + */
>> +static ssize_t resctrl_kernel_mode_write(struct kernfs_open_file *of,
>> +					 char *buf, size_t nbytes, loff_t off)
>> +{
>> +	enum kmode_state ctrl_mode = KMODE_ASSIGN, mon_mode = KMODE_ASSIGN;
>> +	char *mode_str, *options;
>> +	enum resctrl_kernel_mode mode;
> 
> needs reverse fir
> 

Sure.

>> +	struct rdtgroup *rdtgrp;
>> +	int ret = 0;
>> +
>> +	if (!info_kn_lock(of->kn))
>> +		return -ENOENT;
>> +
>> +	rdt_last_cmd_clear();
>> +
>> +	if (nbytes == 0 || buf[nbytes - 1] != '\n') {
>> +		rdt_last_cmd_puts("kernel_mode_write: Invalid input\n");
>> +		ret = -EINVAL;
>> +		goto out_unlock;
>> +	}
>> +	buf[nbytes - 1] = '\0';
>> +
>> +	buf = strim(buf);
>> +	options = strchr(buf, ':');
>> +	if (options) {
>> +		*options = '\0';
>> +		options++;
>> +	}
>> +	mode_str = strim(buf);
>> +
>> +	for (mode = 0; mode < RESCTRL_NUM_KERNEL_MODES; mode++)
>> +		if (!strcmp(mode_str, resctrl_mode_str[mode]))
>> +			break;
>> +
>> +	if (mode == RESCTRL_NUM_KERNEL_MODES) {
>> +		rdt_last_cmd_puts("Unknown kernel mode\n");
>> +		ret = -EINVAL;
>> +		goto out_unlock;
>> +	}
>> +
>> +	if (!test_bit(mode, resctrl_kcfg.caps.kmode_sup)) {
>> +		rdt_last_cmd_puts("Kernel mode not available\n");
>> +		ret = -EINVAL;
>> +		goto out_unlock;
>> +	}
>> +
>> +	if (mode == RESCTRL_INHERIT_USER) {
>> +		rdtgrp = NULL;
>> +		goto update_mode;
>> +	}
>> +
>> +	rdtgrp = &rdtgroup_default;
>> +
>> +	if (!options)
>> +		goto validate_kmode;
>> +
>> +	ret = resctrl_kmode_parse_ctrl_mon(options, "ctrl=", &ctrl_mode);
>> +	if (ret) {
>> +		rdt_last_cmd_puts("Invalid ctrl= option\n");
>> +		goto out_unlock;
>> +	}
>> +	ret = resctrl_kmode_parse_ctrl_mon(options, "mon=", &mon_mode);
>> +	if (ret) {
>> +		rdt_last_cmd_puts("Invalid mon= option\n");
>> +		goto out_unlock;
>> +	}
>> +
>> +	ret = resctrl_kmode_parse_group(options, &rdtgrp);
>> +	if (ret)
>> +		goto out_unlock;
>> +
>> +	if (ctrl_mode == KMODE_INHERIT && mon_mode == KMODE_INHERIT)
>> +		goto out_unlock;
>> +
>> +validate_kmode:
> 
> This long function is difficult to follow and this usage of goto is a big
> part of making it difficult to understand since it just jumps to the middle
> of the function instead of a cleanup label as is custom in the kernel.
> 
> Please refactor.
> 
> Stopping here. Something is off with this series. It seems to be created
> without the learnings and patterns accumulated from your previous resctrl
> contributions while also ignoring x86 (and even kernel) customs.
> 

Will refactor these functions.

Thanks
Babu

