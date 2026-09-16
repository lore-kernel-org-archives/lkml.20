Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B89D3B42C5;
	Wed, 16 Sep 2026 05:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537012; cv=fail; b=YKcK8FfKNyWT4e2AYmWnrMQSt5DBr1GMt3zDjBa9nvbP8rZUeouRo/UdIFvKloq5eamKzKVYi/rXLm1/S9qzz/SVVD+58DF900Sx06eVVUhRh13uxzcN45KfwW/i/eH3bwy+b6F4dSrQClsGpGjlJBw0FsiLgerFMJL0CCbRgEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537012; c=relaxed/simple;
	bh=XX8afT2oW/nzO3acRmo9yK8ZA2DgRg89bywSx0CZpOE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t63FQzWIHx9oJHVbQsL3OakRBp1P1NSJOKjkC5t+WQ+V52M7oeDLu3xUVqRc+Jg5OSLlimRZgalCKPb85jEm3GsjT8zBMUbpLwvRFquR9AEK8dzaNwIFQFnkYn5fAgyKr4hzbz4KdASccO6nAvmfuOEteS67Jh3PaxKk0EIurQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EfMQAk/K; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EfMQAk/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789537011; x=1821073011;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XX8afT2oW/nzO3acRmo9yK8ZA2DgRg89bywSx0CZpOE=;
  b=EfMQAk/KE9/m/n/AFtYCycQxqpKlYWvVOS8SM8sYLODTWaTYIWXNPk5P
   9KwIdrYd7QktKmRMfPi199ZdXW/aa+p8CKuS129gYFUuzkZfS0TX0TpAI
   t2qFvPLd9biOPBrzfrs8Bphj+FusbSSYrJj8ODcj5+k1NTkG8IzKby36V
   elJ3sALFsNlrZzyoH86YX4iZTKmmCo0fWbKk/h9DUtDomx3J7Bsr/xODc
   4kMLz1DiDsFXfFsas/SCI9534/cAZfHgoH2z5dkHo/deMDEI1UzJMFb/x
   MJ4tj2MYC3oKypwDvL4WEu/6JUvbQA6lwSFfqxC6iQ0eLN04+HNYWIGYN
   g==;
X-CSE-ConnectionGUID: 5BoFMdz3TpiOc5eF6B5aDA==
X-CSE-MsgGUID: BJqeJHxYQW+FKNoKvVRZAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77470507"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77470507"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:36:50 -0700
X-CSE-ConnectionGUID: SZrqYZWETY2ND+Q9pTeFtw==
X-CSE-MsgGUID: 5TdWlTszRN2EiXnCXf8Y3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1459643"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:36:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:36:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 22:36:49 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:36:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EzgNfOqRU0PfUjLnqTFRbdolUg7CYJYd3agWN+fpw7ULhJe9rR8Rmrw/rr7i6aKht56nOX2IPICtGMY+ev2n9mQZ4dMLfWyIdpcze9Hx3JPMqckHfZzrxJ19KoIEhlGnRmUGmc3e1OkazbEA1gIJNmVTzm+zdk5nTRjHfCKBlSwpC4vNCSuwhL2difM+DispMaqgRbwxrLNi/GV1b3U6dcGYAKCjk1jCmtxJU0BBsNxXlReFdap6r+Ptsjeu5yexkcDt+56ZMRA5AWx9H0E5cXmQCIgBzSRREMvwfwYweVmKgwyCCyc6LIAtlFaBAbhg6OKHFsZ+udjlgPymaS/3/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiXcgNGCq7K67Fx1ACEE94UGloMf9Agj+AQK5s1PAAE=;
 b=oK3MYxIcj3B1q+TVULnD30XzxoaEMMHAaoU6eqtgjFQjYc+1DHRccHzEyFcut0M6LmaEWxUsYt9HxiPomX2QTtjFNpOM0QOwKpMmh4BIg53ed6e+P9WVkR3UATQOAPKOxBw7ovW4GccfMWb36j0oYE61Cktw6yajBOxuvKjAEA4IpP+6/UxqcsZEK1nQN8T0mYCFu/yCrZv5mI/yrET/V3zKYodhtJEOCafRN6meet9887nVLY/Ay3qPIX/dFFVHUzSs5rj2zdB3e8m8VldQGDucxuONq3mCKRdgmKIMGnqiTwWZlngwcaL9psSgswEo13rAtjLKjt8BQgkciqRUow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SA0PR11MB4544.namprd11.prod.outlook.com (2603:10b6:806:92::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 05:36:40 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 05:36:40 +0000
Message-ID: <9dd7905f-6180-428d-8c9d-10e9353b5091@intel.com>
Date: Tue, 15 Sep 2026 22:36:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/16] fs/resctrl: Deactivate the kernel mode
 association when a group is removed
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <bp@alien8.de>,
	<ben.horgan@arm.com>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <fenghuay@nvidia.com>, <akpm@linux-foundation.org>,
	<rppt@kernel.org>, <dapeng1.mi@linux.intel.com>, <elver@google.com>,
	<jlayton@kernel.org>, <enelsonmoore@gmail.com>, <kuba@kernel.org>,
	<ebiggers@kernel.org>, <seanjc@google.com>, <peterz@infradead.org>,
	<chao.gao@intel.com>, <jmattson@google.com>, <naveen@kernel.org>,
	<ricardo.neri-calderon@linux.intel.com>, <tiala@microsoft.com>,
	<chang.seok.bae@intel.com>, <prathyushi.nangia@amd.com>,
	<kim.phillips@amd.com>, <elena.reshetova@intel.com>, <darwi@linutronix.de>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <x86@kernel.org>
References: <cover.1787772750.git.babu.moger@amd.com>
 <432f0cbfb811aee3c8c51bbc42faf66174375d8b.1787772750.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <432f0cbfb811aee3c8c51bbc42faf66174375d8b.1787772750.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0151.namprd04.prod.outlook.com
 (2603:10b6:303:85::6) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SA0PR11MB4544:EE_
X-MS-Office365-Filtering-Correlation-Id: 507c7831-4978-4a1f-4362-08df13b47b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|23010399003|376014|1800799024|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: lnYkiFp2IjporpiAq30azoZKmvWA2HHTArUxytdmH5HaRNhvzL9maCmxht7AUR4m+zKA1YdEUx0LgPm0ApP3yVdKTi1Ymx8oYRwcLqgTtsDih8MWzZ4XBh3JZIcaaCLyUVZy+0VzmnBEDz6aPusCNk0QxuzcCeXYTcOiUOO7ao6KiYbA8I1PtD4dkPX4kDW5oIHcjYbCexRStCZInI4A/ePxZ7oqJySteXOtiOr1V4u5j+aH0on8ckjZe/TFAXqhOYCQwdGTar3pkSyYWXLpNTp2SCGMCd7FWVuexf3f/ekBpytVFk4/3Lm86OWb5Rqk7bfgm/1WlxM6k6MnkJcKhmSxC3UmmpEx9QSf7/b7rffMNDBINtIx7J1krVEhsgbCveRgJ4e6UYUhDa8s6R7zYuSjS8grQBhOyODu/TQfRAU5iyjfqPYhz+imhcqnaWcHldYI0DSJ9IT6pQqrigL49VDRL9bWwHqB5+skq9ZAycDxqlIcSmm2pcpeTqQq/K8bEeFzhIEk7bd1dZ8d0Jq+qYfm2x7WkeDMxA898x4chyLp+TnFxIlLNJIyxny13eNp83fuJCjENkXabkeaRaVWYhJl/ViVdAtzM2YV3dUNTlZxF6aPIGp/a4GeYfyxcY+O9eMty/vRZbGCuYMfjnmnCrzrZUxnLas5x5aAQLaRyLk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(23010399003)(376014)(1800799024)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emhnSlBPeUxVbHh3TGhoRlMrSXo5Qm1ZOHpLdlpCT25QSU9ZbitxSHR6Ujlx?=
 =?utf-8?B?bWVTeVpBVWtDRDVLVlUwM3A0Z0FNbk9uUmI0OVRmekd2MjRTakZzNGFsOEZv?=
 =?utf-8?B?SVJ5bitQV1RVdEIvbWtVMzRJM0ZLZnpXZDZJSEhsVmZWMzZaWDFzaHY1M3Jt?=
 =?utf-8?B?NFhkL2tZZCtRWXRuSTJlRnRWOFVSa2hCOVVhcEVpM2JheHNQam8rVDJVaC9K?=
 =?utf-8?B?MVJWczZZcEZRQ2hmYUFONnA0bU94VlJkQUtIRVN6WGVFcmo0QWVHSG5hc0pC?=
 =?utf-8?B?ZEEvbEtZOW5aVytrZk9oNUUweHZTQWw5WlhZSmZIQWZkekRZemVrV2hxb1pt?=
 =?utf-8?B?MjdrQlRlb0NzdHZQd1F5RWpSeHlwcWFlT3ErS2I5ZlMzWU50TmRnV2hvRnhj?=
 =?utf-8?B?d1JhVEt6TUZadlRhZ0J2OVR2cDBrejBCeG44eVdycmZ4Tjg0bS8wMnlDZ3Fs?=
 =?utf-8?B?TE5TMTF1d3M4cnZEWjB2Rmx6NzJNWGZJTGpBa0JuUDNQMmI3NW5IaDU4UVh0?=
 =?utf-8?B?alBveHVyWFZWUnQ3ZXFuRmxMSXRmZy81aUtUL2tGL0pmb3I1Q1BabDFLZVBk?=
 =?utf-8?B?VjdZSDNPQjJNaTJybXJGeFlHWGFYa0JSSU1DOCtVbFZIaFVqQ21BTHJKR2NW?=
 =?utf-8?B?T004N3ZPdGNpaTZNbGcvblgxMEJnR3U4VmFZYUE3emRGOEIzUjVSTWJqeDJG?=
 =?utf-8?B?eUhhcDBKdm44aXd0dWhkc0FFZlRDcTMyQVE1TE1nMm8wcGZ0blVpeEFyaGJE?=
 =?utf-8?B?MlVYTU9uN1UzSExucUl6TjJtSkRNZlYzMGpZQ21kQThBN1p1UGRmUFUvdExI?=
 =?utf-8?B?NGJvbWVhVS9wamxJblNud2dEUldDYmRubmYyYmZYQ0tOVTdiUXI2TVFLbEow?=
 =?utf-8?B?M0FsbDdaRHM0aGE3VEZYVDhwZDhYVHpPVVdpZEI2QWpzMVhSLzAwcWN4ZDJ1?=
 =?utf-8?B?THI5TXl1ME1DZ1FSSnk0UVBrN2FQUG1OUjdEUURxWHpHc1I0akVlOXk4VGJo?=
 =?utf-8?B?THVaMDczWG51bVJYYWRRd0VSYjdyK1BxM2hDYkNvTmlKWjVRczNwNld5ajhP?=
 =?utf-8?B?VzVmVW5Qc05oa2tlTnZ5eHE2cEtWQlV1U2MzQ1NSQm9Ud1hZa3J2WS9DMmlv?=
 =?utf-8?B?MzBZd2NoYk5EV3laOGRQV01BV3VScE1zd0tyOVFFT0xUcFYvLzVycFdPNWJO?=
 =?utf-8?B?c0VSeE1NdTZEdzN1c1RWdGNaQTUvTmsyTU9XYlQ2YUwxdHkxNld1TjBxWDQw?=
 =?utf-8?B?eGNadHRyL215ZXVuOVZHdUd5aFNWK0hLTWpBQ250L1MyU09nVGdiWFNXL05W?=
 =?utf-8?B?SzU0SHJ0YTM1VHJDaHF5MkMrY1dmbm9XTVhWdXhMOGVqSkpZS1dqSDJGTWRm?=
 =?utf-8?B?MVhqS1I5UW84UFNLeFozR2VNUjE2ZWV5WDVqM2lNeTg2TE9BY3M4QlZEL1hn?=
 =?utf-8?B?T2U2cXB1SnJINUZJb0RCVkZneG5tV1hCeHd0dVJpWHBydXhTYmhVcWNTSEVi?=
 =?utf-8?B?N2t2QlJBNmxTUzFlcXFqcXVSSWJwUG1SNEsvU05ZZ29VVjdMeXMwN2VxWkZo?=
 =?utf-8?B?OGJ5OVFSM2pncVlySXlSNTVZVFpYMWJreUc5VnpZRDZRdnRpb3pvZGNqOHNS?=
 =?utf-8?B?WEkzemlHTnZPTC9PbThNZjVhSk9pY3ZTREk2VmlOSzdLek83WWg1YmhnM1U5?=
 =?utf-8?B?ZXd5NVJtbjNFY0lpTEQ1N1F5MnFIV3VGN3o2TjFnajZCeDhFcVBCT2pDS1M3?=
 =?utf-8?B?SFluMlpvRWtNWm5MdEhqb1liL1ZRNHVqb3FmZTI1bUM4bGJybmVCWEx1SWFX?=
 =?utf-8?B?bFU3QjI1cGttcFNyTnFCd1JVMzBjY0dPelNaL05kaTFyNk5jeXlqVTA5YU9S?=
 =?utf-8?B?bnZxbCsyOXZXUnRhYmhYZ3N3eWN0VmJ1Uk5UTmxabVJUTmdZWWhPVDlabXpE?=
 =?utf-8?B?V1FCRGkyTW9sSUVyNk5Cb29CNmtoSDBVRHRmdWIrYnFTWFNtREtvcFQrY0M0?=
 =?utf-8?B?V2l6eVVQbUo0UllFTmxzSUFtQWtEQzJicjZIRVRlSEJZOXdROU9sT0dwUW4z?=
 =?utf-8?B?UHRTRks1YzdvZkFuUWxOaFQzNGR1OVpYdEtVTGMyeW9UVDJTcnNFMjd1MXNY?=
 =?utf-8?B?QVJjOFdSM1cxZHZyS3F6Q1NtbGpoMklIYkxHTkZFZktPMktEcEU4UzNRUGtI?=
 =?utf-8?B?TmtjNUI1RjdMa0UvNHhpMXdmU3FrU2R2d0lRZnZWaGNKdTNQbFNoRGRTYldC?=
 =?utf-8?B?L0FEUGZvUkMzUDE5MVJWNFV2WkVIemc2WnBoVTBRQVhmRk5TYWxyUWRpN0ZN?=
 =?utf-8?B?VkVRQzc4ak5ENU1aV1VCL2I2Ui9wNzdYVlVMV2ZNcWFBU0dPRlR4bXhlNmRW?=
 =?utf-8?Q?X/MtKKFZaYUDdv54=3D?=
X-Exchange-RoutingPolicyChecked: jTci2BqLKwOAndFkuAO8FO5QQkVWrMPgMDzA3RrbxkO/e+iZxVSvtSNmlaklD/SA+PLIQHjWHG+H1GdNz+FHkZPqZZDp51ft6dnaKTAbFxMJ8Pw9h4Ux/ucsAFVmvE8bg13quzrQvdckK27ZykETyFVh1I64Ewy1gWwQ0FOW8oswyRg25ccjsCanxAcZqmHmWQqMFI9lghUGVehEhUv6NEADg71gEE75i75LJ6sseBARf5JUbbaeEiM98XqMOQuYl25i72jlWecCPJKg7niYIlFJY83zFo5FW60/Sl+Zbg7qbtJXkd2Q50XQauYTnuYDQDjf5FaF2VopkeNxzVycQw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 507c7831-4978-4a1f-4362-08df13b47b66
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 05:36:39.8972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MywCQBvqcYZZFaR5j5uZhgleH5qRaJZPjSztNpcuRg+wEnevAjT6ayqc56b0BTHCWaGchtw0Ek/EaYynbdAzP2uly8yUVwH89ivpk/dSJ/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4544
X-OriginatorOrg: intel.com

Hi Babu,

On 8/26/26 12:32 PM, Babu Moger wrote:
> +/**
> + * rdtgroup_kmode_detach() - Detach @rdtgrp from a kernel mode association
> + * @rdtgrp: Resctrl group being removed or torn down.
> + *
> + * If @rdtgrp backs the active kernel mode association, disable the
> + * hardware association programmed for the group's kmode_cpu_mask,
> + * clear the associated kernel mode state, and restore
> + * RESCTRL_INHERIT_USER as the active mode.

I am not going to keep pointing these out but please check entire series
and remove all these verbatim code descriptions from function comments.

> + */
> +static void rdtgroup_kmode_detach(struct rdtgroup *rdtgrp)

Similar to previous comments this only seems relevant to the
global per-CPU kernel mode so function can be made specific to it.

> +{
> +	if (!rdtgrp || !rdtgrp->kmode)
> +		return;
> +
> +	if (resctrl_kcfg.active.k_rdtgrp != rdtgrp) {

Related to comment in previous patch this double check of rdtgrp->kmode
and resctrl_kcfg.active.k_rdtgrp seems to support that only one is needed?

> +		pr_warn("resctrl: kernel mode group not valid\n");

Please just fix this file's pr_fmt(fmt) instead.

> +		return;
> +	}
> +
> +	rdtgroup_kmode_deactivate(rdtgrp);
> +
> +	resctrl_kcfg.active.k_rdtgrp = NULL;
> +	resctrl_kcfg.active.kmode_cur = RESCTRL_INHERIT_USER;
> +	resctrl_kcfg.active.ctrl_mode = KMODE_INHERIT;
> +	resctrl_kcfg.active.mon_mode = KMODE_INHERIT;
> +}
> +
>  void *rdt_kn_parent_priv(struct kernfs_node *kn)
>  {
>  	/*
Reinette
