Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013003.outbound.protection.outlook.com [40.93.201.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED9A476076;
	Tue,  1 Sep 2026 23:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788305315; cv=fail; b=UBiHLStT4X4BTsYI7XWpGKn25J7fd9GF9amUHluUCshRNMedwOs2QjLPmMbv96X6/pTRnR8ems8lu+A6b1pe8f64udu5N2NuMGK2tPv80BZEDF36f/btJLo/my24cYYtbdz38MjUrRbzwBcVeSdTtF5F7Lu1SL+0G3iR1FWHa9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788305315; c=relaxed/simple;
	bh=H5toaUoYuJ+b1ltckeXf24/sN779vl0nAreCsdP7fvI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DG0sXtRUcbuZCEccM6Un7AFnVa3XxaaWQ7WV/hXGl6EmnFH46ukkfxsFGSwarDTlp3xab7HAT8cwfQaYAc7K06zEXAYQEY27PcPfUu65lxeTWr9rgCqE0UVq8BqQr2l+8MftkxbbUlXvwSRjmLhuc3CKdMmBd963SRVEsJ1fMV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EWVw2qm0; arc=fail smtp.client-ip=40.93.201.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EWVw2qm0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sb0euop9wxx1WGjBnbAffwFTtngTcLR15X9hjmh2Rehfljhb3lFSfTF4gtf9w3XPO0DDN3fVyLPj9pyykAYI8bIU54a8Xgne2UcEaqMVlgSkyhdg6Mlwm3Kqtw/ZWlJhv92ZJpw2zt4f8R+0rbt/DiY43dxla06BsDLLW5/gpeeX9+/1uyNQt8JN9tJagH716rmvAdwclPvNvqbnFmIhBuNDLKbNjaa6mPbqfqzTLkziI+z3ZCvHDAzmngjKOUAwi+US7D/oDInsvzXY2bxH9xiMtuThy3GnxxIoOzFCvqWK6YIpOTiAPnfqo6ED6BZ/XSledrZEcTaaW2ImFFiTSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tI4JWEUJzvsp5CfNG8rbU5ipO6zkO5YrnfgaE3xOXy4=;
 b=KiGp+Xl0l6a0elOzY13I+gzyaRL82HGDLqDST5yl5r9YUU5IS5LMs09Z/ub6+DUsUL+jbmn0rGQChBDfDpFVL0YWc2lVbipvLFkI9DMcflQP65OK9R5JCBlu5GywOHwebrIPBFw5+VkApb2QBV953Y9uviHlOZ6CeYtfzPH1ebuT3TLKjGwxPg9JRmOTyyRDTcOeyYlbNmqCQ4ulvLvE6wy7Iyg3YFLGo3jGseStffCi3relXnQacuviUuGuiL0Kq73WSCQpOjLg7gngsWhazGJ7i5m/yVULyyKNJqf75qFF67YMlMs7eKY5EXva/hqfNSM4a9dM761KYYyM2W0y4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tI4JWEUJzvsp5CfNG8rbU5ipO6zkO5YrnfgaE3xOXy4=;
 b=EWVw2qm0JMiDcpe4miU+kaTC9LrWUEinJFlHgCMd7ZLEamsPMVUmUOGXRyIOJBGUelGM3DtFtm+PU9piFgo9vlBr1HGkWO0nQzI09zSmDI07GCt0VcNG92SEz/gpWbn0Bfadv2lnECZ+nB4wGnOEDXJvIlk8ABvCfxf6oZb0M6Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by PH7PR12MB6810.namprd12.prod.outlook.com (2603:10b6:510:1b4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 23:28:27 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 23:28:27 +0000
Message-ID: <3c871aa2-62c6-411e-9213-5776899ee22d@amd.com>
Date: Tue, 1 Sep 2026 18:28:25 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/16] fs/resctrl: Add documentation on kernel_mode
 with example
To: "Luck, Tony" <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>
Cc: reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 bp@alien8.de, ben.horgan@arm.com, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, tglx@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 akpm@linux-foundation.org, rppt@kernel.org, dapeng1.mi@linux.intel.com,
 elver@google.com, jlayton@kernel.org, enelsonmoore@gmail.com,
 kuba@kernel.org, ebiggers@kernel.org, seanjc@google.com,
 peterz@infradead.org, chao.gao@intel.com, jmattson@google.com,
 naveen@kernel.org, ricardo.neri-calderon@linux.intel.com,
 tiala@microsoft.com, chang.seok.bae@intel.com, prathyushi.nangia@amd.com,
 kim.phillips@amd.com, elena.reshetova@intel.com, darwi@linutronix.de,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org
References: <cover.1787772750.git.babu.moger@amd.com>
 <c04c7a9e2e47d472c6cf4b184ef9c3be5ef6b4c8.1787772750.git.babu.moger@amd.com>
 <apdAGiN6zvIDU1kD@agluck-desk3>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <apdAGiN6zvIDU1kD@agluck-desk3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR2101CA0024.namprd21.prod.outlook.com
 (2603:10b6:805:106::34) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|PH7PR12MB6810:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f458ffa-d0cd-4408-0cea-08df0880b94c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IiX8EQoCm5SId8nCUG6D+hrEKR+6f5vrtpUR8F8FoeJzIVlixE6uT0uYZMwpiF1w5CtksqRgOj43RrPDX1hL5GF7rcqJCfroeul/Gn6NyvVloNi1Tk/6YszRICxr8NNYL4QF4IAmD0dI3LqqQVX1LKLDgZxXnKeiXmogDPMZx80lkxXtUifQRINkBfg5gBf6mHXhQ6BkxloKCFNEBzRuJstTkmNfFbn/vvgLAxdxDsXkzLSdHujFp4hfKQIUA9HQna8wD3sPev9l/Rgt2HVADAi6uJso551w2JTjD54yJ+89Iyebid2JzHEgP/1rufSkC6OUdpziZJF0fREk+pmh5RjCxDV6InxZlYQKDQ/9tFxGQ05LnRq02abZsWWjqotz1e+zL45cURnfyeNQ7o38FcW3X9EFZbRLXYKU97oCrX3q8S1Xs3XFOEme93rVMSIHV4m7Olcw6SOT24OIeaT6zFpxsfofz+SYTniwEJmawQXuvSw79Z73dHmal732tMPmRuv9oZWCyjTGnf7l32z6NtpwMnKOhfOsZm2K90jxDs0DpMsXw0cKyipMvzE/C8GFzfKdJe+v/dX484UZigSuiAMDkoWz30wO17RUq3Eha5Kbe0gYnHVvx6eJ/PA52nY3tHmJSCF9cLldqtb+NzFlMxiOZ3yGN6upZFfGZIcLvXE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTYvb0NkOTRsWjVqMlROa1c1Sk9VMkV1dzVveVhiK1hhdkZNTmJqRzVzWERh?=
 =?utf-8?B?VG5oYlJZbVhmZWtnNE51Qi9ENmRweWdyZzRJajZ2OFEyK05EVzh3eEJCeHZE?=
 =?utf-8?B?U1J1Nk85MHA5MFI5WjZhOVdMdDdRSnV6T1VBVWl1WVQxMUJhYW1KVmhLeTlT?=
 =?utf-8?B?RU1hdHhNb0lFUXJmVHNSSWYwSDFRbzBuMUROaFdtcERCbFZEeHhBK01CUzZk?=
 =?utf-8?B?Q28zMWVGaEpXa0hXTGhCVTdJRzVSVzhOd0VSVUVQU0p0YnJoQ0NHcTJweGRp?=
 =?utf-8?B?RzBiVXJad21mVytkM1M2YVZmUStGYTcvbDFyS0hHdURkcVU4MHBaZlovNzlj?=
 =?utf-8?B?ek5hcnlRZmlEaWZLbys0d01keFVxNnQ1UWRJaFVLaHRRSmVzVlYwTEVkZy9h?=
 =?utf-8?B?aklueFljeUIvaEt6UHlTV3JKOXJRM0lSQlplNU1OZVVOVlA4L2E0enFWMVVa?=
 =?utf-8?B?TkdCdzF4eWYzeDBMV1lGT2d5SG11Sk5HUitYNjN5ZHE5bWpjb0hYUklNZVRU?=
 =?utf-8?B?dEduWnhnRHp0MUxmU0VBeTlCUy85enBjRzQ4bWlWOEZ4R0t1aUtWMWdFLzhn?=
 =?utf-8?B?dFVTaVJaeGRVZDFhcUFHZlZDU1c5RzFHZ0JwY0ZRbGtzeGIyWnNwNUcrQnVv?=
 =?utf-8?B?NkNnOXpUTWcvOVdyMlpwMm5UWSs0bXV0T0JEMWFJUXZhWTE4M3NCUnliYktE?=
 =?utf-8?B?YmkxVjFROTRTZG1DNWVDN3R1R1JUQ2s2OVhub3NWSGdRY0pzVER3SlV2c2FI?=
 =?utf-8?B?a2pybzEzOGNicnpYekN3UDE1UnJERDdwa3RyeGdVdEdnVjA0ZmltbEtnVWNt?=
 =?utf-8?B?ZWVPVUR3RXFhS0N1YXk3M1dvemo2bUNhV3ltcmhQSm9jRTVRZzV3RGNJanFv?=
 =?utf-8?B?UGNYaE05cmwwRDFJQmRjTWo2bUFQdzBMQ3ozVXRsZUxWa3RlcW5OSlVlM0Zx?=
 =?utf-8?B?L1EvTitrVzBYVVgxNGNZS2Jab0ZVYWdxUkE3dEdzQW1vNnB3OFpPUEl3STlZ?=
 =?utf-8?B?b1k1aE1qWExqUFBaVXd5ME5hR3FIZ0IwWWFzTlRmd0J6RkNja2t3ajczZllH?=
 =?utf-8?B?MW4xYlJKK3R6eHQyTmNRMm1kZHVRWnFyR3JFeUR6MTBKU04zMDFXd2pHNjZj?=
 =?utf-8?B?NU5uTG1qUWtpSFQwRTI1Y2ZCQXpST1dFTGJLVjh0dmx4MCtVKzRPYVFqYmF3?=
 =?utf-8?B?UmFLS0VqMXI0UkN6ZTZGV2FiaTZwZUsvaFFaN1lZNU40Ujd1dVRObEt4bVZG?=
 =?utf-8?B?NnNMVE9wbHc0ZG4zcmdoREpkU1FPdFdKR3h3K2ZZaWEyWlFOdkxLenlwczJv?=
 =?utf-8?B?T0VWSlVJdm5WLzNkckFFV2grSDgybER4OSs0dUpEb1FaWWw5eVFKdXozOHBv?=
 =?utf-8?B?VUsyTVEzZ2o2K3ZQeHhFeU5CeE1LSk9qYnQvZlgwbjZ1bW5BOE9LZjdhRThI?=
 =?utf-8?B?TFZHbGg5S2l5WGRXR2dRQzcwb1c2QkNZMGEvMUtwbERCNCthMkZSTEZnNVRF?=
 =?utf-8?B?TmVKVTE1SWZPYTZuakU2Wm9ScmZ6ZVdZRkJVaDhuTlhWUGZrbHZRR1lGRFFB?=
 =?utf-8?B?WS9SRzBCb0RRQm9ZblVNVzl1ZmROM3hBUEhMUCt4b3hqajRBUy90bVdwZDlE?=
 =?utf-8?B?U21DWXRPZDlINkliTUJvdmRlWER3YTIxV2g0R3RtbE9CVzNqVUhINHNrSDRS?=
 =?utf-8?B?emtQcEUvRm9IbFFWc3E4NzNWdG9tVm1saHB3dm1VUVoybVJBZXJvcVhVbkhj?=
 =?utf-8?B?Zlo0dkZNajhocW12YmZONFV1UUR6SnI2dnh5dmJpNlViWjVEWjRpZTRscklU?=
 =?utf-8?B?WnhKMEJSMXZFVXpHVm9TYThzVTVYRms5ekZMbUIydzlmM1ViV0ZpZURWM1Iv?=
 =?utf-8?B?Y01FSEp4R21rOVFsTlpGVUxDQ25aWW5EUVd1V1h1Yi95SmZpNzVKbXVmNXpG?=
 =?utf-8?B?T2FOUUxOZ1RiR015ck9ld2txSEJvMVd3L0JXdmJRakVtK3hKWG5TOWxVeEdu?=
 =?utf-8?B?VXRYaVhPdmZMajZJcm90TThaRmRGS2N5T1lIQ2wyWHpIM0RHRllaSXo1bUR3?=
 =?utf-8?B?WVRxSlRyQm5XWE8zRUJrTG9JcE91aWVaSTRlZk4zQ2gyYnhoNk1WSHY5aW15?=
 =?utf-8?B?Uk9FaDdjaDFtRXE5cTdQWjh5c3lreEZuOXIwaGNydmxKYzE0elNLUTVxRUli?=
 =?utf-8?B?ZTlPalI1NGMxcmdjNHh0NzhFMEd2UzZleEZJUTlZSTJVcHM2azNwcmcwWGRl?=
 =?utf-8?B?M1BrV0ozUlpwODRMT24vd2dDWDk2U1BSK2VsNzNvS0QzY3F2VE9uTHJ2ZHBu?=
 =?utf-8?Q?VOQSrwgD8bLx1dgiXR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f458ffa-d0cd-4408-0cea-08df0880b94c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 23:28:26.9652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZEMC3jDAjEXfKSWMaM3+oPtYCE/KRfCe9W5L6Isil/7t1H8L1Rfyqcn82eVa4Emg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6810

Hi Tony,

On 9/1/2026 4:14 PM, Luck, Tony wrote:
> On Wed, Aug 26, 2026 at 02:32:30PM -0500, Babu Moger wrote:
> 
> I fake enabled PLZA on my test system, replacing the wrmsrq()
> with some console logging. Tried out several of the examples
> in the documentation and the ones I tried all worked.

Thank you. Appreciated.

> 
>> +c. Narrow the association to CPUs 0-3
>> +::
>> +
>> +  # echo 0-3 > /sys/fs/resctrl/ctrl1/kmode_cpus_list
>> +  # cat /sys/fs/resctrl/ctrl1/kmode_cpus
>> +  f
>> +  # cat /sys/fs/resctrl/ctrl1/kmode_cpus_list
>> +  0-3
>> +
>> +The write reprograms the association:
>> +
>> +- CPUs added to the mask are enabled.
>> +- CPUs removed from the mask are disabled.
> 
> More precise to say:
> 
> PLZA is enabled on CPUs added to the mask.
> PLZA is disabled on CPUs removed from the mask.
> 
> Or perhaps
> PLZA reverts to "inherit_user" mode on CPUs removed from the mask.
> 
>> +- Offline CPUs in the mask are rejected.
>> +- An empty mask disables the association on all currently online CPUs, but
>> +  later hotplug CPUs are still associated automatically.
> 
> Is there a use case for only enabling PLZA on some subset of CPUs?

Probably not. The current use case we know of is enabled either on all 
CPUs or on none of them. However, I think it's best to keep the option open.

> 
> The special case for:
> 
> # echo "" > ctrl1/kmode_cpus
> 
> seems particularly strange. It reads to me as:
> 
> "I want this PLZA feature enabled, but don't use it on any CPUs".
> 

Yeah, that's true. However, it is consistent with our current cpus and 
cpus_list interface

Thanks
Babu
