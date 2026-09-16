Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F8243BDD2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789601838; cv=fail; b=QUR8NEoP8fpLkH7VkfD79o5xk+U5N2lz6WKflVYsKTqAReWFeyZTNrH0ZOLXKBpMMPVvf72nupbo8AT61M89Cefixy2NFdwNYuK9CXz6/tuPvIpXS0tWU3lrLzWKtXQFnDgk5X/bz0bqEwijWRHR3lRvTTvjp5hnH+SwU9daZ6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789601838; c=relaxed/simple;
	bh=Trv0+X2XSSEo6ZpTyTt7MTjzunIOGH/ZLd3IZVF0h/I=;
	h=Message-ID:Date:From:Subject:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WmragtgBZ5bhaYbQSof27ZwJABvzvXamUCOKJ702OlBdES4oaeGVEbsQjPhqZQCxjb23jaVi0X8Lo0iEEoFUXoVhzqufDBTJpktDTtR8lEEp62N6rgZCbG3S4K1h1cttE1JefiUV6cJzOuPbSutwBU+VUX36uzwk4OM7SasOmeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UUSsKokd; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUSsKokd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789601836; x=1821137836;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Trv0+X2XSSEo6ZpTyTt7MTjzunIOGH/ZLd3IZVF0h/I=;
  b=UUSsKokd8OrViMt8tzNmgW4/I4lAl25F7WE8d6lPSyI14kY+L16ne03/
   JqNXRkQ8GYS5oKxUjaOm6fjBRBOWJtniBzwwMbQbNtypkDNbzXMBC/opN
   k8+vXpNFTJYLuUMVKjrWH+skzhP5MPvG5bbCwnRAOnWwmUdENKudfjch4
   8toBYmYmLvPFf3qSiRnEWmAn/j/hhbN+CmkdLTuQqKq888/5j8OZOoWfi
   kCdxzOMR6J5LtYAFppmqi2e+W0uPNo6vXm+D9YPSx1DF0xFJL8CpppHR9
   CzSG04Cgln3a9W7S4yvsiCwcHqNOLbYozgE1Vk3moM6irL452tyw0mu5I
   Q==;
X-CSE-ConnectionGUID: bLw+WBdLSfCnuwfKJTCl8g==
X-CSE-MsgGUID: YAC32R+3Roi3vqK9sO1Erw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93813609"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93813609"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 16:37:16 -0700
X-CSE-ConnectionGUID: OMBOkj9RSkyRkIDy37mStw==
X-CSE-MsgGUID: iMB+zeh3QL64KP7Sc8uQ4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1886223"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 16:37:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 16:37:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 16:37:15 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 16:37:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMw2hHi+FwktKR8jrj58T26uFl2eVWrzWAR9SQNl5PxMFhdFadkjj3Nk93gD1FuslNumNiyJZIutvxpKynYsAv5rqYmXtKInYu9IAtrCN9pHEiAsLA72vKlpG1Tr1P6lm5IQAUVXm8u1Nco46jzTk++Cc0xvhVuGzfUS4EjNRsDmI6h3NA6kZUT2mMaLYBMsruwC4gFJhcMfkedVexrflUNq82uXipDYh2r3kH0KMOY4o9MiAaYmsCwdvIP2q86jcjv8Oyy7u3c0cErviPF5lpc8uiXfqcwtc6n5jQz/nhg838vXlRIRr2nOE5Rvd9Z86YfNekffonz8nos1xnbFfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcaN8BHZqe7ljMWVJvuUuzUKU6Uklc5HesOa3xleR9c=;
 b=vThpSwWNpGKw08rbmK3Gaw/Hbjh8jc7fhJPxInOd/hW2tzL6/gB4sfWdIRZkRuRb4ewZo6hpsGf/ur0IDM0SE6dc+MqA0FwU7zgWYwkF2lkwxtUWYaAXkEouFXiTaGfkvBdMOMT1SficXCRdMyfWtWhP5giwHN7J9hjdNZHg0BBUooT/11av/d+Oe6Vr455FpyJUGn8LWSHxuXDuXMVxvdCHc5Ws6yprwG2EiryQ69W4O+PaxNbQZWmIiFG2FXPJXLngAmDOlPs5xVzw9VVCLkIeqJJ3UTrbjbleMzSGqq1rpW697n8fZ+JcyGw2551Wx7iSR/ZVUIpNdvVQExiynQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 CH3PR11MB8382.namprd11.prod.outlook.com (2603:10b6:610:173::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Wed, 16 Sep
 2026 23:37:04 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84%7]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 23:37:02 +0000
Message-ID: <4e801667-d494-411a-be86-dce4b953a114@intel.com>
Date: Wed, 16 Sep 2026 23:10:19 +0000
User-Agent: Mozilla Thunderbird
From: "Chang S. Bae" <chang.seok.bae@intel.com>
Subject: Re: [PATCH RFC v1 0/8] x86/microcode: Enable uniform feature
To: Borislav Petkov <bp@alien8.de>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <kevin.shu@intel.com>
References: <20260912000815.997720-1-chang.seok.bae@intel.com>
 <20260916004502.GCaqnmjjj7kApOD6_M@fat_crate.local>
Content-Language: en-US
In-Reply-To: <20260916004502.GCaqnmjjj7kApOD6_M@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0374.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::19) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|CH3PR11MB8382:EE_
X-MS-Office365-Filtering-Correlation-Id: 078e8788-597e-4112-1df7-08df144b68e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|5023799004|4143699003|3023799007|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: kpIU0ViokmN+kScylyIhIsu1kECpvHVWE+J+6D7Dbv9ZK19VwJBV/CrUWaDYX3bRGR3itphNkiBRRWHag8ikvvWeJS6gRr4bLaN9nD9GJHUSnxmsA7Hj/Wdq367wnI5S2a6s90ypvhFRtqnh+NtseqO4+x2UoNWI0DbERAWBjnyaIinX9Mg+DI/voVgIdSdXL4IUXGFUeSng+iVluE8mxc9OfgTCxNLFQhr18NqO7ino5G3pQj5NuHP9IQLl6gN8oXaLQQaGh4o4hAv1FKQF7XDs6+weoogsfgMvwYQOCddazOQsgi6UHh4ztwHL3GeXS8uINHjoubFjNaV+/eJ863pagXifCqbxaQMpHGJCRhJrbiJ5R0jOsb2DToKVfTrDk/W8IkarBNdMUZPQWKGdoWWHxcy1aN4wK9CqDuf094VGRYTy9PykTQK6+6Bt0MdONBXcLKwMSbSeeogdC+yo0mFAxYmVFr9okABQk2ARqBaqGF8LvqjajJaEI+akzli4pxB+jGvETGcXV+81HP8zCSo9GewTd++0wLltUw8E4kOJNOBjY4VYRzwFiHGvUw+AiaKaguXvzC82KH8c/qolOBnnzQqU0K4nGYsUNoo1FrOgtVQejvr5Uld28K7KURSQP1uGGfENOI8E+BAExiu5GzvOjYxb5VL7U9GouyTDjiA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(5023799004)(4143699003)(3023799007)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHdyVVZ0Mk9keldJQVhzb21VeDhLVUdnS2hDODV5c1lJeUFFbnNVclVFUG5o?=
 =?utf-8?B?dHB2WGJhbHZmaVFqaXJILy9CUFF2U3FCSFNFUWJsVTh3MU84emhGSncrSTFo?=
 =?utf-8?B?Vi95RUFIbWtBYU1VcDllUkVla0l3OTNCNjFUSEdPVUlCYWRNbnBaQmlIcWVR?=
 =?utf-8?B?RStURWh2QTFQUWhyd1ptUlJSNWxzbVVzUGtIamc2TkwweDR5aEVIdVMrOEVY?=
 =?utf-8?B?V2FNdnRGeWVNcUxQQ1BkSU5vOTRobm9PWGNMVThwNFJwa1hKNGh5d01scWxj?=
 =?utf-8?B?U2x0aW1ic0lSdmY4RFZKYVpUSFJWTk1hcVpIaWhNTklweVJsY2hqNFN4bmRh?=
 =?utf-8?B?UjNjY0l3Q2FlMXNkSVJieDZRWUQ2VXFEbmUyNklIY1NpN0pHTXFpSVdXdXRM?=
 =?utf-8?B?Z0FwTlB3bnlMU0tNV0lZbFA2Z0htSFlpTVo0K3VhOUFiamM4YWh4ZzZZUzl1?=
 =?utf-8?B?UEx3MVQzK3gwR09VWE4zcWJVOVI5TTlEMWYzME9PbU5mOEt0OHJ3aFUzQ0Zt?=
 =?utf-8?B?QndqWnk0aEJDQUVDbjdlTnRycGd0TWttTW05L1UzbVFqemJYYmdMVk1jVWlq?=
 =?utf-8?B?eHliaktscGQ1a2lqekxSbTVQTkZldG9ZTktOb2tIa1Q5elhLSVdIdHVScXpQ?=
 =?utf-8?B?S3JGYjFXZzJmL2VzS1VWcnhrcmNmdXFSVTVoeHdseDJDaVUyclNTeTE4TFJv?=
 =?utf-8?B?eC9kbU5UYzRtbzFoYnZ4bktvR2g1L2xHblBsUmRmcDZsU0dwMCtDWVdRdmw3?=
 =?utf-8?B?RmFVTjdQU2xUeGd2ZnVydi9FWW9kcWRCS0g0TDVuYlhFS2dJeFJFSXhqVjl3?=
 =?utf-8?B?WW1PeTVDb2ZqaUpWTlBZWFNHeGUyRlhoVkplODNsZGJUcUlXY3FPWGhFTXY2?=
 =?utf-8?B?ak1JNkZwa1oxeUttVDhWdmpzYUR5V0RBWnpNS0Q3MDhSVGNuc2tQemJZTXk4?=
 =?utf-8?B?MDZNUHg2T0hvM2s5Smw0VFlFTExsUW1DRTV1RnovdGM5RFI0VSt1Mmo1RUlz?=
 =?utf-8?B?Um53ZDk1dTVUSk5ZdGpIVGFRU3JEUkhmMEptQTIxbFczZU42OWUxaWhwaW9a?=
 =?utf-8?B?N2ZrMml2alcvL05jVTFVRWZzeWJFdjhBdzNQRXAza0JWR1JBYTRWc0xGYks5?=
 =?utf-8?B?YnVLeTR0cTkwTHVWWUk1aVpBUE1xcExUZXd6RGZBUzdHOXJxWExpWUwzWG4y?=
 =?utf-8?B?dnFvUFRUMkthTEg0TjR1S0pWT0NUczhRQ2U4T1FrdFBDWndBTldXa3lqc0Ri?=
 =?utf-8?B?WndwOXRKanY0eUZocGU5R0JKZ3FRM0hPbVBGVENGRGRuZTFSU3l3SUtxbnN2?=
 =?utf-8?B?L3Z4b0R3NGRMVkJxeGZnOXBMWnJXV2Q0b3B3TklDd29VeGhmRXJuN2xIMGUz?=
 =?utf-8?B?aUNueUZ3TGRJMVV0blpqZGUyR2owQXVpVVJiOFNMem5tWkVkK2VQRHYzNWZu?=
 =?utf-8?B?ZW1lMnRzalhwTXRFR25jYkdtSExDb0RiM3V0L2VZaEVVSzNVY3JQVDVham1V?=
 =?utf-8?B?UkFDMkh2RnJOZXQzVVBCWUxLV2R2Tk04dTk5VEdWek9FWUplQkhCN3dWa0NM?=
 =?utf-8?B?SkNQSnZRS0JXeGVXT0QrRjI3TlBoT04zNGt1dVMxL0tWbWVyc3QrN1RJN0RW?=
 =?utf-8?B?azNDb3A1Y1JxVm5GbUE4YjE3cjBYV2VpVXNqaVJHTzVIa2RBeWwxRUlDY2xk?=
 =?utf-8?B?MU1FS1hrNCtmQ0YvWXNDeTExWTVrcW9FMjJHek1nTDcyb1BSYXZoMGJWbEVt?=
 =?utf-8?B?cUdVelRXK0k2c1Q5RCtSL01qVk9HYTk2VjZCYXJvZDQ3Z1I2SGpCeEJnV29M?=
 =?utf-8?B?cGVUNnZwSnNJTnd0MSs4VzA5MmJ4aWZXTG9YTEJWZVhVUDYxQW1iUVpta1VM?=
 =?utf-8?B?VkhBR21pV3JLajR0cUhUcnBWRmNsTzcveE9EdG9MWmtlTnpKZXdmbUcvUWlh?=
 =?utf-8?B?UzFNV3BQbElPNElzM2hKWVcwa3RnRkt6QllYbTg3b2tuUkZGYTFHRXNRSHJ6?=
 =?utf-8?B?UVVmeVltc3dpaVBIN3dMY1pybG1mb2lDZkxqRmszVklwU2RGNVNWNzg3Y2Nj?=
 =?utf-8?B?TXM2Tmt6WmR1MkduU0RWRDRnNTBSUERTZTRBMEhVRmFGN253UDRjWHF6M2ha?=
 =?utf-8?B?Yi9NaVljL29KSEJhVDNsalB1TXNCQUdsU0szSExhZm1ZUy9Ka05rOUpzOWpR?=
 =?utf-8?B?QWVzbUpRSW1McS9TRUNxQVRBREorTDk0a2YzdS9EUEVYNGRMTkhYOE5rQjZo?=
 =?utf-8?B?b3BIcExxOHU2V0Q5dm5kRU5XTHVXUk4xWWhXbzVmUGdCcVBHUmFyLzBEZURm?=
 =?utf-8?B?Qkxqd3p0anRiWFh2dW1kSHVLTzA3MkxIeEw0cm9GekJ6ZGt0dXdydz09?=
X-Exchange-RoutingPolicyChecked: igej791kCdqcUO25czhDSytegnXAi1YKuWedIUSi2NhUx87D6waNaQ8WhBH4w9in9SNVB9Lcf5vJZbtdlRm0qD9k+VVqXeKVSZ7+TGY5M4nHm7C1Q2qAMdql8qhvPgZRpJaQCM0dioog8TaiKPTUkYXICIO18u9H8fr7g7nH4jGyq/WSVRf+ECyx15ffOa3iB7oci8bjfdnjBS66FooDCRFqvhZkmlZW2FYppZG6GU/0/Ijyyg3AUyVKVEAy8xET9HT6M2w98z1Ym3v5vxTFHPeVqDJ3X5pg9c0BtNv6/Ne0rj9JZkBbuOuDod0oi3uyd+4U68JuA1d+CjRu32OkoQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 078e8788-597e-4112-1df7-08df144b68e2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 23:37:02.7410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PuMziqP9lgKdq8BNWUiNfYHI28wyJiRC4bM9CJmkiY/iVX9zn2Hz92XOzH7piJmKGUrCMnoujRZGzOBuo7Zq/dSKK0eTKpQaA3cODimmvKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8382
X-OriginatorOrg: intel.com

On 9/15/2026 5:45 PM, Borislav Petkov wrote:
>>
>> == Introduction ==
>>
>> Traditionally, a single trigger updates a core-scoped microcode, which
>> thus requires executing WRMSR0x79 on every core. This also means that
>> there is a possibility to load different microcode patches between cores.
> 
> Are you talking about heterogeneous cores?

No. On a SMP system, this should be disallowed. The software does not 
leave different microcode revisions running on different CPUs. If ever 
happens, the system can become unstable depending on the differences 
between the revisions.

So this is just about the loading mechanism itself which has been a gap 
in theory to microcode people. It was intended to bring up their 
motivation which I thought interesting as hearing. But the introduction 
made this unnecessarily confusing.

> 
>> Despite this fact, the kernel currently enforces loading the same image
>> across the CPUs.
>>
>> This uniform microcode conceptually eliminates a chance of running a
>> different microcode within a scope of CPUs. From the loader perspective,
>> the uniform feature extends the loading scope to a larger number of cores
>> than one core.
> 
> What does that even mean?
> 
> You want to avoid loading different revisions on different cores, you want to
> support heterogeneous cores where you must load different patches, something
> else?

The starter seems to have done a really poor job here as seen implying
heterogeneous cores even, which is actually the opposite to what the 
uniform loading is trying to achieve, that is avoiding different 
revisions being loaded between cores.

Let me step back here. It looks rather clear that the introduction just 
stays in a very brief, something like in the spec.

> 
>> A few points worth calling out about the feature:
>>
>>    * The CPU enumerates the update scope such as package-wide or system-
>>      wide, depending on the implementation. The scope is advertised
>>      via MSR and isn't programmable.
>>
>>    * The scope reduces the number of triggers, whereas staging primarily
>>      reduces the amount of work under the WRMSR window. Unlike staging,
>>      uniform loading is applicable to both early- and late-loading paths.
>>
>>    * For early loading, only the parallel CPU bringup is relevant. In the
>>      legacy serial bringup, once the first CPU in a scope completes the
>>      update, subsequent CPUs will observe the updated revision so skip
>>      WRMSR0x79.
>>
>>    * Staging introduced a new loading process. But uniform loading extends
>>      the semantics of the existing flow. Software that assumes the legacy
>>      scope remains supported. The next section discusses this
>>      compatibility aspect in more detail.
> 
> I am more confused than I was before. I have no idea what uniform loading is.

Okay, sorry about that. I guess mentioning staging is just distracting, 
first and mentioning its applicability at this point may distract 
readers, too.

> 
>> == Backward Compatibility ==
>>
>> Older kernels assume a per-core scope, being ignorant of the uniform
>> loading scope. So, they trigger loading via WRMSR0x79 on every core. And
>> the spec [1] has the following statement, in Section 2.4 "Uniform
>> Microcode Update":
>>
>>     NOTE [*]
>>     ... It is always allowed to load the update on more logical processors
>>     than necessary, which may result in unnecessary additional latency.
>>
>> So this means legacy kernels remain functional on uniform systems. To
>> provide more context, folks involved in the implementation agreed to
>> share additional implementation details with the community. Their
>> write-up is attached at the end of this cover letter.
> 
> This sounds like you can load microcode on one logical CPU and that covers the
> whole socket? Or L3 slice?

Yes, loading on one logical CPU can cover the whole socket. That should 
be it in this introduction now I'm thinking...

> 
>> == Appendix: Microcode Implementation Note ==
>>
>> The uniform update protocol is an optimization for boot/runtime microcode
>> update. It is backward compatible with existing microarchitecture of
>> core/thread scope update and any OS MCU drivers that rely on legacy
>> method of update.
>>
>> With uniform update, if multiple logical processors attempt to load an
>> update simultaneously, there is a race to an internal semaphore within
>> the microcode. The winner of the race assumes control of the update
>> process and sends an internal interrupt to all other threads (if only one
>> thread initiates the update, it is the winner by default).
>>
>> All other logical processors receive the internal interrupt at an
>> architectural instruction boundary and proceed to load the update under
>> the coordination of the winner. This ensures that the responding threads
>> load the update in a controlled manner while at a well-defined
>> architectural instruction boundary. If a higher priority interrupt or a
>> fault happens, all logical processors will see it either before the
>> microcode patch has been applied or after. In either case, all logical
>> processors will see the same microcode revision and nothing intermediate.
> 
> I think you should lead with this, hm, weird requirement.
> 
> So let's first, please, give a second try at explaining what this uniform
> thing is.

== Introduction ==

Intel introduces a new microcode loading feature - "uniform". With this 
feature, loading microcode from one logical CPU can update the whole 
socket or the entire system. The hardware implementation works as follows:

<-- paste the appendix here

Then, I guess I may say something about its side-effect which in fact is 
one of the motivation to support this feature. Could be combining next 
two sections into a summary before calling out review points.

Thanks,
Chang
