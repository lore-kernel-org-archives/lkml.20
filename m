Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010038.outbound.protection.outlook.com [52.101.46.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF7A4DEC3F;
	Thu, 17 Sep 2026 18:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789671287; cv=fail; b=GBc9lEqV5wYetjP1Jhy8LJqqta5pSdRLM0EkgMeZzzj22olm9gjYSbeQa0aRtL70cKLyNtJDwv0LFPfmGU0av0Ie4GYVb716zZRqhy8GfMRrPI33Jv/vPgY28h30ovNQZK4I+hzEZiPujCQHrrz+BAKYJ92a5yO4pV3x6P/ewiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789671287; c=relaxed/simple;
	bh=dfWhQnvtmuY/MsRzO52Q98TCmkXD+zalYYK7DGjUFBw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VwGpXCZjQuhgzIDe80izlTgafwBQIODPOFz2C9bzD8EeboUsPDP6zJ6rHeiKPqosfQ8dWP1VO3OQvhjLx48NKsaLP42obG1EAFnMFz/hfPP+w+nc9/InV9U0rBVYGkaxgaK0w4QeMk89juYMo6m67JW+GzrRBdi/wrdtyhHSuNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FDafgP9W; arc=fail smtp.client-ip=52.101.46.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FDafgP9W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGtcjDUQUOn2lgoBo6omdYUSXufIFsNRJU+LmzdPtifk7y97TrMnIGjj0E/E0v9v7dD4MHcY8c7eq1TModo9TGry+tmwUo0xYkfmyD8Sx1qvmX4T8EnLQQcIdYaOxkkrR5LySv/BgeGfeDlcgTh+Xjy0C/e9CPfoY4AbDCd+yTC0L0J6MkjyQWdA1DKgOmHk6GMwD76cYJp2i/qWpJksWn+kFT84p3O71ImEfSDRGXQdRpH7lcm2QxU2gAHsWqIqzIlGpABSL7LRGs+j6orodOuAiMI40U7h555drZG1TFWYbnf1oHhrlPPNGDNQQctGG9zr/OFRtfKIYHucrYf74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UbMcub1LUUZz2LlYEf/SPkZqcQy0meqrboViHwEd+g=;
 b=R4tih2jqZgJ+TeKTWSUDID3W//agsPYQSvL0JORBTfDuklFYFORLa0NlieOwsyaNhT4mOb93vt2l2FcO/TV79zrWQBU4EX7KNrG8BrEWntgjWzFGz9HkQE1QCJG8slPkY2LW9jNAgfVKIrxZa9CKs3IPvvZFS6rPdXBWDdyQTY38HXqcwmQquakCoThgJbthr59/eLSjZoYi6Nr1nAITP6OTjWGHiEyYD8ywHN7XNbGDecu4pDLN3Mi/bZcCH+oOFQlIIKXHeZ2y9VqWst1FJPa/ps6cjtMAxSdZ53gnlPTZKYQFT/hU/IVnqSVXykqd3MKMw9QJHOcAOTzpDXz84Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UbMcub1LUUZz2LlYEf/SPkZqcQy0meqrboViHwEd+g=;
 b=FDafgP9WbKv6wC2hWjPeDxp/YVdNgONvtlW94ZYn6H8/aURlroKrkejmBJn1FcPlgV1dNniphcURkYfQ+alunuhDT/f1kCNPZiFNhxpaRUKaUYq8ZdZAHEAx2jqPCukPOZWYUH7SBhP2XcudgCqJUsvB03uvbJw19PxEa797vnI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by CY8PR12MB8364.namprd12.prod.outlook.com (2603:10b6:930:7f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 18:54:40 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 18:54:35 +0000
Message-ID: <a3896705-66c6-4b17-ba66-1665cf7dfb2e@amd.com>
Date: Thu, 17 Sep 2026 13:54:32 -0500
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
 <948f5361-fc46-4d89-a1b1-cfbcb2ce0ff6@amd.com>
 <e88c02c7-5dbe-4dc0-91b8-ab8231c50d50@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <e88c02c7-5dbe-4dc0-91b8-ab8231c50d50@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR10CA0014.namprd10.prod.outlook.com
 (2603:10b6:408:143::12) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|CY8PR12MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e7add02-d78f-4554-0559-08df14ed1e3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|22082099003|18002099003|11063799006|56012099006|10067099003|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info:
	Lq0L2mATuDp7mHYOkCgJ+vgSmDQdQN2eB0bg7xCjZp2pIe33AAM/LbSWvNeEUsWOvB0M/QIyW/8I8seIjbgFkV3u5BzIDJsRgjbQDHuxo+mltJm5Na5AcZ78s1KjfmkEHsuKjYftyPimXM1Kc/gFLFel+AaKeENiwFB/U6QIbRSeHo15hClFZjNnhr/9RlQldEQrKWBXiQod0wfEuMW2pm3S2faz/SkGMmWAhifgJr1JSTdnQT4t5qdANnPE/svqspX8QxYok9ZPvmkTWkb/aeaOnsboX/oAtbx3EHzjrt/lpp1S3ZXJcj+tPcGRD246UDLE5UL5zxVywHEDEJolSTuulWi/xXIUOM+niW1kf3Ay1CqmLQlNOmsz6NtWpE8f6hAxDeTCEyLxThf1GiZRpCn350FCdVjiuvhosEtMnrC8dO27DhmSDGePyFKFEa44TauifhTZ+G9JexF8hDT1hdyA2ER9kV6+CV0LXISIyjN+IfBg5N4weM7ZC2kZ2aDNcO8puZlw+RD6ypGaUzHodLuR0NysYLsyfWExTAP1ZaRlI1iK0/ieOG9MyF2yvY1xhYCLcB4THFu3NJpxprNYDt3oew+LPgHtZgG75CmdUyNCjLEXjA4naoeMma6AB7Y5TvTtaUOV7hWme5Bu4xsK0E1XKAJChIaO3M6RLutgiKU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzBoekxOam56K0p5cEhkcXNNMDNSTC9rOHg2bERuaE4yaHZIS2NkdXRNSGxM?=
 =?utf-8?B?aC84Qzd6cFQ0S0ZrTXBwSjFYTm1Yd3dHMEFyNVQyNkc2RkI2OEJqTXMzeGFz?=
 =?utf-8?B?S3NhU0pvVy81dmQraFVnZzlqeXVwR2tnaFRFVkdoWC90UDVvNDdXL2p4OS9P?=
 =?utf-8?B?bSt4cTB6R0tDbHBUdWhySXVoMkF6M1JaUHQrdWFoMTFjeWFXUmxsMk5LQkph?=
 =?utf-8?B?alAzaFBsVXpKczVzejV1YytsdWR2ZDM3YkF6NktPR0NVQTVlM0drNXZja0JR?=
 =?utf-8?B?U0UrbHc3Si9Mb2ZuVHlWZE5FOFZTcjVscWRKellDUVVlU0xwSjN2eWp6dFVm?=
 =?utf-8?B?RGhNTnViYVp1SFdlcFNZYS9YWGx3bmZOS1AzTmZ3MTZRLzVDR3ZDcGQzTTlD?=
 =?utf-8?B?ei92ZWxHRlFsOEt0Sytlc2NIMTljanVKUVZ1dkxrM1ZmSlJ1ZXEvNFJ3cXJH?=
 =?utf-8?B?ZjZ4Ni8xcWVJT1J2SHAxRm5ja0pyR2lKenBKN0JvTmlXaE42aVJrUUJmRnJ5?=
 =?utf-8?B?K0tIeHFjOXJMTDFQblM4MkJYekI0Q1Fod05MQWk3VmtPQUcrZmwwa3ZVVzYx?=
 =?utf-8?B?WUtTUzRxUWNySUVKd1hOWTIrYUxSMWZQbktnWXR5WkpvWmVIcXZxNXV2a1hi?=
 =?utf-8?B?SERUR253aGVEdGJkV0FwRFJYVWt1WTFMM1BFRjkvZFdFZktQOTJUYXJjS1VS?=
 =?utf-8?B?U3BaMy90ZzdnRzNpbmJTbmNkQ1ZVZFRqVlI5M0JOd0k4cC9SY3FuZ0QrZ2lT?=
 =?utf-8?B?YmhPVHNQTVBwYy9MaEVRSjZpUTZ4NkpQUXkzMUZQWmRkTnc3M0t2enc1TU9G?=
 =?utf-8?B?VFhBTHIwSEhzUm5kNjZTbU1uQms2SFdHMEtYclZ2S1YvYmxyeml0TEdDWnVR?=
 =?utf-8?B?UkNsTlhjL0xmenp5OEw1U0lRNGkxUndWd01KbzBWTlF5S0FaTk9BRVdnTE14?=
 =?utf-8?B?bXFwUDJnRnYvL3FKVVpYdmwvTVNMUGVHUi9xUi9yRGdZcVBpd29mRTFBVGtl?=
 =?utf-8?B?cTFYbENlRWFIbk1OazhvMVpDNDJGazMyQ0xSTFQxcmlPMlREQzhWd2NLSDlm?=
 =?utf-8?B?Tlk3Q1NjR212NFY1eUpraER3dis3T2Q4VG9kai9qcHh3eFhoMjV3bnJrTG9T?=
 =?utf-8?B?bGtqRXNUV3hxajluTXJwSlhlQTZ4NW9qL1ZEWEo0SDVkSXF6N3UzNW94YTU5?=
 =?utf-8?B?c2ZER2JJQjN2V2FzcmZpV1NXT015MUh1SXF2Y2dId0wwdmxMR2VpNG1oa05S?=
 =?utf-8?B?V2dDV1JSTXpnQm43d1N0NVg1YXI4WXZ0cFk5a1kxYmViSE1HRGQ4ZHIrMlFV?=
 =?utf-8?B?SlFIUko2Q1FJdm5LNkNpRGY1UmhXeVU2VlhPMjV0eTVOV05tZGhZSlNob0t6?=
 =?utf-8?B?enFKVFVQdUlqVTU4NzlOMGI2em9ZaVZzMXFMZGphc2pTbWlwZTk3OXJwZkdU?=
 =?utf-8?B?Umw3T3JsYkt4TmlUWkUwc0NLOHdVYkwxL3FQSGM1RE50bGp0NTZMaWVXQ1RN?=
 =?utf-8?B?SUwrZkxjYlBzcjA4b3ZLRFdKK3pjajI0RXFhM2x4U0pvcjN2QkdJbzJnY3Z2?=
 =?utf-8?B?aW41MXhzcy9MZUpvMHJOYWx6MjMwOVJuYS9nTTNPNU50MXRaRXlIUEd2OWFx?=
 =?utf-8?B?ZisyeDROdUR1VnAvRHlNOFBxWlQ0bWgwOGI5S3VIQUVrTUxkbVQyT1JVdFBD?=
 =?utf-8?B?M2lKa3Q4ZmJva20yMjdDU1J5VjdYWnRyeDFlMmJCZlAyK3lEeWpmYzdQcXR2?=
 =?utf-8?B?Sm1NQUpVd2VkQ3pRa3dDQmJuY0hIK3k1dnJEaUE4amw0YVI5cGZuWFJmM0Y0?=
 =?utf-8?B?QVBMR09ROFBYak0vclBJNEs2N3hzYk1mNEQwWHhyNlBpaUVoMXdzZ3h0QjVr?=
 =?utf-8?B?d0g5d3ZYRE9LVlQvTG5SMFNuemlCd3FPSWhuajBMZ0daYjV2TU1yRys3NHgy?=
 =?utf-8?B?WHpHYnNmSmk1N09XUDhEMjZ2OVUxUXZlV1lKZzJla0RLR2RRSk0xUURtYTl1?=
 =?utf-8?B?MExOZk1kbzRNTmYyVWtxWE1iYTJjSFduenBiSWROQ3Yvb041cXNDWU9GWWxs?=
 =?utf-8?B?WHpqYS84Wkw2d2VjY0VaVWdYYTMxaDZhSGExQ1VxK1doMmhaQ0l2U01XYUxR?=
 =?utf-8?B?OExsOER0bzA0T3lXQStYRUNBNUZLUDBhOTlIQ2NJTlpEaFJsaWV5dGNnRWRT?=
 =?utf-8?B?OGhiekVvalRUYklHQyt4TnViSUVLL0dCYXJBdDlZT1ljVmd4Y0d5L2ppV3o1?=
 =?utf-8?B?REI0U2ZKU05LNzZLZERrNTA1TUJCSWhLeTRyUFNpa0Juc2pEd2hBY1V0Nm9q?=
 =?utf-8?Q?q71WtEUSsiNO82N2yZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7add02-d78f-4554-0559-08df14ed1e3b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 18:54:35.7759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+iRX+qD6VOZ5AwPLZzKOEgshhkWV+Ujns8nb/DMrFkkJrW9qsLWhiSALbMKV4m5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8364

Hi Reinette,

On 9/17/26 13:31, Reinette Chatre wrote:
> Hi Babu,
> 
> On 9/17/26 10:26 AM, Babu Moger wrote:
>> Hi Reinette,
>>
>>
>> On 9/16/26 00:33, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 8/26/26 12:32 PM, Babu Moger wrote:
>>>> @@ -2377,6 +2380,33 @@ static int rdtgroup_add_files(struct kernfs_node *kn, unsigned long fflags)
>>>>        return ret;
>>>>    }
>>>>    +/*
>>>> + * resctrl_hidden_files_set_visible() - Show or hide files marked hidden
>>>> + * @kn: resource group kernfs_node
>>>> + * @show: whether to show or hide
>>>> + *
>>>> + * Iterate res_common_files entries marked hidden and show or hide the
>>>> + * corresponding file under @kn.
>>>
>>> As a generic helper this is not appropriate since it just blindly makes *all*
>>> hidden files belonging to a resource group visible or invisible. This pretends to
>>> be a generic function but then assumes that only kernel mode related files
>>> are ever created with the hidden flag set because as the kernel mode changes
>>> all hidden files belonging to the named parent changes visibility.
>>>
>> Are you suggesting that I update the code comments to be more
>> specific about the group, or are you suggesting that the code itself
>> should be changed?
> 
> Both.  The "hidden" flag is *only* about whether a file should be visible
> at time of creation, whether it is by default "hidden". That is accomplished
> without this function.
> 
> Whether a file is visible or not after initial creation is feature specific.
> For example, as is done with resctrl_bmec_files_show(). There is no use
> case for "make all hidden files visible".
> 
> resctrl_hidden_files_set_visible() is a hack because it pretends to introduce
> a generic feature but the implementation only supports two specific files.
> Consider the scenario when somebody tries to add another resource
> group file that is by default hidden. Just setting the "hidden" flag will be
> a reasonable thing to do, but that unrelated file will have its visibility
> connected to the kernel mode feature!
> 
> Please replace resctrl_hidden_files_set_visible() with a kernel mode specific
> function that only controls visibility of this feature's specific files. That
> could even be in a separate patch.
> 
I will separate this patch.  Will rename it something like.

void resctrl_kmode_global_file_show(kn, "name", true/false);

Thanks
Babu
