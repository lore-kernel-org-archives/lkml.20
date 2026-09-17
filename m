Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C28C488203
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789671039; cv=fail; b=M9GPrKFeVvCPmVY5lw+dTI5l+U2XTAMIL1ZzWxjH3400xGW1wwxybfNwzluhl+vXOJsN/aKmMXRRvPFwSiuPd7sN0EVVMocHwJO+l/M72IkoYh7jileWp/lxnQa9B+onA1M03O1HJlIookqsTHblTl0CMqomnO6SiJzByF0xs/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789671039; c=relaxed/simple;
	bh=fbdhqb0sUSzNDzvAoeJjcCcJfFqv+8t2brbTEn+THqU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g859YG/UerkPCTR1hvVHgD1ViC04Bs/PwECrjGRJcHR+QIoZDXlpANkfrGGJPv0sACm3cI7rXT+H9K2aRKgmZx8Ls+JoNbqvyaKU0rJvfbHDrCIE3BNuHczCrWJmQzTnF05Rnaw7V4fwJaqdSWoocFv9BlPry/WQP1bnESgjGwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nWgl1S0J; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nWgl1S0J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789671038; x=1821207038;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fbdhqb0sUSzNDzvAoeJjcCcJfFqv+8t2brbTEn+THqU=;
  b=nWgl1S0JlCDCqem0Ngwz1oL/K2o7+tjy2ztYj8BckrcIISolA1KE+Z9t
   q0If/y5wmbgwg4rk0Hc+suXloLiy2luUE4qdi/Tgt937aybt9p8kA2FXU
   5JPbKQU0YfxAEx3nEJm2TG0518OieRtKe7dGazb4xdPbkbXBhEy7VMi4C
   J2N21zdOBKHnDSzx2E7cDlj5toHRQRridYwDSTAHuqquEKvFEHVkhonxD
   cqeoZzQFJb9kv8xoGDml9e3kyr2ptzmeeBH41WI5lhLbZEgh915YhtCyf
   0OgNQaKRatYgpN8+X4YzNwWaPYq1g/cCUUfEyMr0ZErUbndlmERYGPEaV
   A==;
X-CSE-ConnectionGUID: QlEFipZ2Tfix+6CezenKKA==
X-CSE-MsgGUID: T2KRE+tiSCeQlxtPj6IAXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100791985"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100791985"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 11:50:37 -0700
X-CSE-ConnectionGUID: GOCghWq7TZa2GnrJTSbFoA==
X-CSE-MsgGUID: WEkPq/OXRoalMuV0aAKuTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2401239"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 11:50:37 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 11:50:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 11:50:36 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 11:50:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSB4JCindHGvSKMGlq09FqKZavoaHZoycH7W012DzXbKLTeHYKmgc1hG61FrEwOSwgckXUpkL0PBC6s4cyt+rQ/4tfuAUnr0+INb4Ju342reX6VFXHkkYgYwitqCcyaMhUptbqgNJRgwu64r5sHCeEDaX+6B7ZMc/zUJsfxr8mulnjlWpvqwsCrUrhHVKfs+5falhnyLt5W1EY3o5J+no1Q9Wzi26W0zEaxJAYECdSnwgc7CwjUbxKk/qu9M9xE5N+fn9tl6E9Vn/F+icWTIWrxemIOeC52JlBB6RFWK81Q7RPL8iyhvpH/VZ55zO0Hva7lky0BxmjWHnnyRTON+ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6m7XioIzVdnHz1ybyE4OuWb18fHkBmtd0S4db+Mrsw=;
 b=czmMRZkRlq7KD5O42eA4fVEdTkaCP2UjNW/1QoRj6JWGzT2oyCwiNO0L5XjbpWXii2W9pA13IQvDxjQfl5zTOP4EPMVI8mqkyJaAh1yDiRTrk+wKnQun1HAPUhuLkp8AZrO2PE19hb8GXywSdubg6WlE8GE5KsysxjKujE3WvKKGloC0WD1xuyZtiHAFhRU1yTkFcMHfm8IksgRRMNh23+vEPBILSvvsbXeSMpE5RyFbo24ptzxY2SPeHMkGyWPkMC43okCO7maTwIzGb7NDa9csdXHSUyI01wbvWHC/FccmhN2wOVa5SfG/7zCPNGjuADOsn/bL8atb3VjENGyU/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH8PR11MB6705.namprd11.prod.outlook.com (2603:10b6:510:1c4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Thu, 17 Sep
 2026 18:50:23 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 18:50:23 +0000
Message-ID: <e741cbee-342b-419a-9c71-bb5e1f3b8570@intel.com>
Date: Thu, 17 Sep 2026 11:50:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fs/resctrl: Allocate rmid_ptrs[] using kvzalloc_objs()
To: Ben Horgan <ben.horgan@arm.com>
CC: <tony.luck@intel.com>, <x86@kernel.org>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <fenghuay@nvidia.com>,
	<bp@alien8.de>, <linux-kernel@vger.kernel.org>
References: <20260911160608.1091121-1-ben.horgan@arm.com>
 <980ca6b6-fc5b-441b-8025-755e2f6d51a9@intel.com>
 <0bb072be-71d6-43b9-a258-aa745711012b@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <0bb072be-71d6-43b9-a258-aa745711012b@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0179.namprd03.prod.outlook.com
 (2603:10b6:303:8d::34) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH8PR11MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: 12dc0c62-3cd6-4770-4ddd-08df14ec877c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|56012099006|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: LOQZbLI6mkbBbgRxlyPazo6FZcFTXL6XU+2nMbO/BOxyZ2jhcb4kBV6OtQcbsd7FluflnjDBjSVUK7ulL4iN11xLRxkK/rwImSdO7sjIWzvplg8CASAVB1OZ6NAIsbEcrHttzdg8Y2RxBsujDnWUTeBeW5YTHScwrk/ZPAqoEGYeBHNOKo+rW3vGlruanRQGfA+3VozYh7K994j0E0jWUHvW7QNXVi6Eka2wXMemNv27V7wX9Vrofoggt1Ss+9DT4kEArUHT5bMQWPdc052HOFvMAMQFkpWlia8LS19GSo8SUjALuZniKL47PYbyabDef26GDsbSsnxMqB7LUXMVitRaTwF0dcCSK/9VOpUcDJpLBmtNyqL7bNQZ1O4XxdgjuQA0f6MoT+mcYJvQFpcyZQ++jYhcqBZ7Z+8h9R+1AzHzpx8s+OaVrQMIAO0JqW3ZypM4uTY3ZWoTqDDmGtaCd8R+vuoGv+8FYWukQAh4xbGgUkvVVghZrzaU3flXSKlJp6oEwryAkQ/JLvY3GLo+Rhqfv8GhqcZuAHODWJu259PS8afDc1i2+HLzmYYIRtW1zj0U7S43e5xn8k1TJ4lLRGxVsgOFUH/si8Yi6wO1ISkDx9RVi3GuhWbmLPTZv8/nrK5MxIyNrvUzxZsGdLkTq/tDo6BCqKBWIe3hu5qHH0k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(56012099006)(4143699003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUs4MFVDRjZTVHlzMkFaWEdQaW40YkV0M1VkT3hnWmVGRnpVbGZVVTVqSDAx?=
 =?utf-8?B?RUhMZHhxV2F2bjI2Rnk5ZUpURVREdjRMVUZjTTFmREJQY2EzeTc2TDFnWnRQ?=
 =?utf-8?B?ajdQelJOemllN0VEUjRUNDk1dWFXb09XYUF4aXdzZlF4UVk1dUlkMGlZY3Nl?=
 =?utf-8?B?ZGtQY2twVEtTaUhFM0dyNXV3dVVZa3JGQUM4dVpRY1lKWTl1a2pIRWJNWGdU?=
 =?utf-8?B?TzBMVUVpOVQzS3c5dmpVdzJpeCtuUUdRVVFiU1o2Wm5Td0ZFMWRsaldoYzB1?=
 =?utf-8?B?RTU3VGxrSzIwQnd2MC82dWYvblFTMnN0UVNWR0gzVDk1SStUSGlPU1ZxbWJ6?=
 =?utf-8?B?RW96cUV1bU5XcExSUjRHcm1qYS9UZVE5cUhJLzQwZVRON1FRT2RWdkhIVHVJ?=
 =?utf-8?B?T0djRFh3Mkh5cWRxL0lkK09RYlRVL0sySTBWQnVkNnZYdUE4MkY2RlU5K2Vq?=
 =?utf-8?B?V0lCOFd1cm9NYjNrVXJncDUwa0k0ZUdXWmJtQW16UEZ6alVDaEw0RUFvTHN5?=
 =?utf-8?B?TTFCOWdTbGhZMHBES2FhQ1JSZVcxVHltRnp3ZEVjRFkwTkJpRFNWd0FZM203?=
 =?utf-8?B?eGVRR0EybVo5QUJLT0lONS9zdnAvRzIrVmQzWFJBdnRvRFh2T1FPR01zaUVw?=
 =?utf-8?B?cmd2VEMxNHp3UjV6N0tmWlZQUDQ4VitqdGgwNFZoTVNUNVBsdWpVbU42a3hI?=
 =?utf-8?B?czV3OEUwV3FnL2Qyd2g1WC9NVTJuaGVodG1laXVqc2pySnNjSXo4c1JIelFT?=
 =?utf-8?B?Sm81QXZiSmhKRlpiVnl1a2svMXZNN0hCQlh6WWFSdEFCZUtnaVExeVV4b05U?=
 =?utf-8?B?VFNBZGg4TzhNR21iT2xjZFl1aXI4YXNYL3k4UFZ5alVPYityOGxPZ2NMSEY3?=
 =?utf-8?B?dHBPbTNZa0wrNG0zOTR4UUV0TEtYaE9ZTHFYdk4zd1BLWDNVUC9pTDFnbkdS?=
 =?utf-8?B?VUtiNnQ5bmtrd1Z4U1pOUG9WWS9oOEhRUFI5VkxGTFNDNVp5Y2NWeW02RXkz?=
 =?utf-8?B?NnVWTWFBMEM0RGxhU1VKd2ozb3MrTytRZSsvajVWQS9wUDR4MU9XWnVuL2Nz?=
 =?utf-8?B?ZFI2Mk1PZldtaWVrUDdqS3hlYlJ4NG1JeE92SjJ2WDdJM292NW82ZWxTR1Fz?=
 =?utf-8?B?S3d2MG13YmJtUXB1bHNZWG5Pdy9jYVQwNzdzNFptQkdBUWpVbk1uVTRpWE5Q?=
 =?utf-8?B?YlpjUlhwTzdLQk1qY0NkclQzWFVOVHhNeFhnbDlsamxUUWJxSkVYNHNrZjR5?=
 =?utf-8?B?UEJSTmVEVzlyNWFXcFBOZk0yQnViNmZXVUo5MkluNnczSFhiejMvMWdNU0J0?=
 =?utf-8?B?OWpMWDdlZlpkK1ozbXZ6Tk5Ia01UMVJkb0t1RzBsWXlLUzcyQ0FxYmtBbzhu?=
 =?utf-8?B?NFo2elEyK28zelN0YW10QkNnaXVhM2tIZ3BvUG5CYjcwcFcxZXp0cGxkNUkw?=
 =?utf-8?B?SW93KzU3L1V4RmhTaU9MT0xWeTh6TFVaR0FCbmNLVUM5UHZjc2dVeTFBRzNJ?=
 =?utf-8?B?SG95V2tkMWJPRzVLZlFBbHh0dVZQU05pRVNqM3ZMT1Nwam9ZL3VRUWJmdENq?=
 =?utf-8?B?aGJJK2hWM240MU1SL3lSa1pPZzdKYjdieHphVW5MSkVLMVBvOFVTbXZWQnBi?=
 =?utf-8?B?eERYZGdrN1grY3NrTEVSRkptV0ZBbXJVU0EvV1dsYlV5N2lBY1VkbzYwMC82?=
 =?utf-8?B?dzB1VmtleWpzaVNvZmd2Z0tQVlNoSWlTUG5JcVM2Qm9HZXNDOEtkRjM5VkU2?=
 =?utf-8?B?VDQvVlMxZU1EdWprQzdST0FIVWhnckdMNm1sMHdBcWVndlYvNVNxYW5WejRG?=
 =?utf-8?B?cHBMY2kxNDMxeHV3YXQ1bzNuVTdQNjM2NExiVS9LY1BwK29rTnNuOHdCTFB1?=
 =?utf-8?B?VWx6VTFUdWFJbW96TkFBOGh3cy9Sc0M5VTVuNVJ0ak9IWlZCTTROb2lIcUZF?=
 =?utf-8?B?c083M09TL2VDL2g1NC8xbk4xK0NzTXVPN3VQbEpicGUwNVZVSjhyV2htM0dO?=
 =?utf-8?B?NFdOZkMrazBPRnpLRkRobjdRU1lyT2JMSmRYOGR1T1dpUE85R0dOQUgvZnJ1?=
 =?utf-8?B?bjFtV1lybXovUjczdUdsMTlnUUNUM3hpWG5jcjZXa1drQUtvenkyM2FVbFZv?=
 =?utf-8?B?VVErYSt3SHg2V0N1UFpZWmZXNk01WTNpbTdrbnV6a0syRUNlNDN2VnZqR29y?=
 =?utf-8?B?TUM3Y1V1N0NBOXhLa2c1SkdEckVDQ1BCa0lpRkpOd0s3bjkrS1NPNVdsM0E1?=
 =?utf-8?B?N29hR3NiVm5FU2hyOURHS01saHNNbXhaSHF6ZUhrc1hVeGo1eEk0SVUxSzBz?=
 =?utf-8?B?TGs2cTBQeXF1dU9TVENZRTUwS3hqTHNscjlEMWt0d2s1dlorQ0dTTWQ4WEJu?=
 =?utf-8?Q?rdHcqrb+rM8+iySY=3D?=
X-Exchange-RoutingPolicyChecked: BomMQX7xt48EsHKeDx/BEe/AwP54f9fKSpt96rbClWmXDsk11gg4f+WUXMkbJ1lBkbXftt9wQbhuRdZfxUbYeyWWZWu7j++Nwe2H6t5/NXdKSD23CuyDExrF6VqoSZbkMY35AcLyE3I5Apu3+cWB9pp8TLfhO4NocoeOY4w1O/Vde5jYIlE8VcbILknR/swACPorI/WJajnRz5M2rTKDX/MWyyjxAzClxq0ypdIYlSDNV0ZB+A8SmcJ5F2XmecggwoLEbZHff7NGuWn1secd2DDDPPN73G/kDwBMnxyaDyxgpsQN6uA6pm816CIZBLO/xAwFsdPilY+pPobck3XC/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 12dc0c62-3cd6-4770-4ddd-08df14ec877c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 18:50:23.0118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /iHUTTeMHzm4WIS/lbsnMJsoTGF2VuSmEMcMfUyBrQuI3oEuCLerRSlzT97Axw1+Je5+1N29k1cJPNmksSjpGkwYKAUBhl1etnh2vxUcCjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6705
X-OriginatorOrg: intel.com

Hi Ben,

On 9/17/26 9:15 AM, Ben Horgan wrote:
> On 16/09/2026 17:52, Reinette Chatre wrote:
>> On 9/11/26 9:06 AM, Ben Horgan wrote:
>>> On an MPAM system the number of entries in rmid_ptrs[] is the number of PARTIDs
>>> multiplied by the number of PMGs. The maximum possible number of PARTIDs is
>>> 0x10000 and the maximum number of PMGs is 0x100. On a system pushing the limits
>>> of the MPAM specification this can be large enough to consistently fail the
>>> kzalloc_objs() allocation and hence fail to mount the resctrl filesystem.
>>>
>>> Switch to allocating rmid_ptrs[] using kvzalloc_objs() so that large allocations
>>> fall back to vmalloc().
>>>
>>> Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
>>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>>> Reviewed-by: Tony Luck <tony.luck@intel.com>
>>> ---
>>> I found this by testing the extremes of a software model and don't expect this
>>> to effect real systems.
>>> ---
>>>  fs/resctrl/monitor.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>>> index 73413cb128ea..2d7df60973d1 100644
>>> --- a/fs/resctrl/monitor.c
>>> +++ b/fs/resctrl/monitor.c
>>> @@ -979,7 +979,7 @@ int setup_rmid_lru_list(void)
>>>  		return 0;
>>>  
>>>  	idx_limit = resctrl_arch_system_num_rmid_idx();
>>> -	rmid_ptrs = kzalloc_objs(struct rmid_entry, idx_limit);
>>> +	rmid_ptrs = kvzalloc_objs(struct rmid_entry, idx_limit);
>>>  	if (!rmid_ptrs)
>>>  		return -ENOMEM;
>>>  
>>
>> resctrl_arch_system_num_rmid_idx() that guides the rmid_ptrs[] allocation is
>> also used to size the L3 monitoring state rdt_l3_mon_domain::rmid_busy_llc[]
>> and rdt_l3_mon_domain::mbm_states[]. Each RMID is expected to have associated
>> states in these structures so to fully support this their allocation needs
>> to change also? 
> 
> At least, rdt_l3_mon_domain::mbm_states[] should use kvcalloc. I realise that I didn't hit this on
> the model I was using to test this didn't have memory bandwidth monitors.
> 
> For, rdt_l3_mon_domain::rmid_busy_llc[] the allocation will have succeeded on a model as there are
> cache occupancy counters. The allocation here is smaller than the others as it allocates a bit per
> RMID rather than multiple bytes per RMID like the other two allocations. This gives a limit here of
> 0x100 * 0x10000 / 0x8 = 0x200000 bytes, 2MB. My view here would be that, although this is quite big,
> it's not standing in the way of testing on a model and physical systems even approaching this size
> are not likely to ever be built and so doesn't justify either open coding the bitmap allocation and
> freeing or creating a new bitmap allocator. Does that make sense?

I think this may still stand in the way of testing on a model since it depends on when that testing
onlines the domains and how fragmented the memory is at that time. A simple "boot with all domains
already online" may be ok but I am not sure.

Reinette
