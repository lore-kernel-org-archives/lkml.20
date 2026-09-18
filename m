Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7C32D781B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789773103; cv=fail; b=a3zpmC5mSnpanoi11W1sHFv2JKKdlxfv1Z1HVTGVe3TcI35nEDVGyO5oMOpdyGlZNEmZ0J+eRVbJIEmgctrQIpWCuhqQot8XcDHWqIyj7MqTyLCfs46a7+WUmc7LrSK7jU3bEMsmh8MO3HWTVKYToPF8s3hONmf5pH7baE7l/PI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789773103; c=relaxed/simple;
	bh=bzZ2TGQxvP53at0I0ZX4QHDVvEC+ZTE273VEef9UbDA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o31edPTZInNmmXrC3G3BXPsfM9BXopSkfjRoilnXeXXNxCCr0akdkCmFJXsAcIDWiHnLZfeS0NTnC4cnR3N2xs29xGeX6PG4EDb+8mOdUMeQtAjG8ZkMlSmV8liIZuGLHTsPHa0Dh65QY7v9NJpNMKw0j9xJdE24RWL4aQR6eDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xs1h5o0w; arc=fail smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xs1h5o0w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789773101; x=1821309101;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bzZ2TGQxvP53at0I0ZX4QHDVvEC+ZTE273VEef9UbDA=;
  b=Xs1h5o0w8QdraFIXxffkuVcx94FkPQJpRuh8eTvl1NZKmXbZfT/uwY+F
   cNNcH4nPKO9y3ljioaKFQkfqgJwBjw/X5nH2wWo3ktMhlFTUImzHhph3M
   zla20C0rDAfUE3rFyQvRTn2HM/sp7UKIPLhBkiR68ikc1bghUAMEYID3y
   4pEyl3IXcp7XJ7EgWNFtJz6YcYyiAl0gQsq1Y+rBo1DdEmq3Rk4OVLbEb
   +eOszppE+tL4L6QG9s4nVFSXUh27E5DSHBt68T2+HPFsN1Z6q6h9bcUd/
   vHd9UBM3Ik4FPWFbgwz7HRns8aQtoHuE+RM2zD3FyrRZ0lxmDtAWgd26h
   Q==;
X-CSE-ConnectionGUID: R59rcfxrQvCCQoK614qKXQ==
X-CSE-MsgGUID: SR8HLzt4SJScLeTGND8T+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="808932"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="808932"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 16:11:41 -0700
X-CSE-ConnectionGUID: lXn0sGxkQvaSOGdYTPt7/g==
X-CSE-MsgGUID: wqCm1okgR1K6NjmkwyYjew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="268334403"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 16:11:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 16:11:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 16:11:39 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 16:11:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgOlJYMePrSDOZjkdMv+oWw/Tc9vPwPp5Os6JlwuHf3NsvNeEFsqXlCeyxppHbOFOkFKhnHSxUiZpbLYXhtE2kBG++YA9BEXXqYVCwzGSJ+3lYNpGDfbyLyKLYfEKDF8U/Q7eWuUHOFru6rM2shag3f1rpgPujJ1UDtPGMfKEwGA9bI1mjVbYjXmALNThRZH7c1sHe2lHbJZjxiWBT5b/bZFNXKtn689IyJ5Oh95sO7YnbskHjFfXLWNJwknwzJ2DzxU/hAsAtMRqvbBHz+vdyt0hdpUS1xEg9+fto4Avw3fl4Zu+RXhphSQhJ89GHJ5lwgK3GUsd8fX/RllLWJ+pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lASKxxJBa2isVOBTft2Vj9hJuA9xmgxkjTvQs8WHYDk=;
 b=q5WPhyBkV1QI9flt5A2sIbAfvmpSwy686nPxNlZHp7uVuF2R4fJ4NbrFSVmmRbxmjQifRpCvylrNS4zHcdkVcq+/CaGTybweIrNkbJcBVL8QocPfFZQKk2hcRKwftNy28canVSP2b1az9Uv4ICOpIH4vQGRhEiXsCEWBGw3R0o/INomPKj1ev0jU/yNkQo6qfz1Ml2Yc9ChdxB/OEkYGWuYeIyLdsN0VAKGM+dzy0CDt1YmO7UrWsTd14IbmTpU9DIt6q6EMTjd02RTog/VOT+OVjPN2f0ZC57XUgoAi7Wp+YFxA8h00AjCOTulMLRRBQRX5siDuzp2H6QchSBvX6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ1PR11MB6156.namprd11.prod.outlook.com (2603:10b6:a03:45d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Fri, 18 Sep
 2026 23:11:36 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 23:11:36 +0000
Message-ID: <da618b0e-aced-42b1-8497-61ba4b0bb973@intel.com>
Date: Fri, 18 Sep 2026 16:11:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2] arm,x86,fs/resctrl: Generic schema description Proof of
 Concept
To: Chen Yu <yu.c.chen@intel.com>
CC: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, "Thomas
 Gleixner" <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Newman <peternewman@google.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dave Martin
	<Dave.Martin@arm.com>, Ben Horgan <ben.horgan@arm.com>, James Morse
	<james.morse@arm.com>, Babu Moger <babu.moger@amd.com>, Drew Fustini
	<fustini@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>, "chen.yu@linux.dev"
	<chen.yu@linux.dev>
References: <d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com>
 <9e38f138-7872-445d-9a11-105f9d0fa4d0@intel.com>
 <07a79f5f-ad39-447d-b43d-01e44c7870a2@intel.com>
 <e859ba7a-d488-4c35-b0e2-fc88cdb34f29@intel.com>
 <ef14b978-1b58-446f-b07a-691422220cb8@intel.com>
 <aqdguFLXpds-FrEW@chenyu-dev>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <aqdguFLXpds-FrEW@chenyu-dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0353.namprd03.prod.outlook.com
 (2603:10b6:303:dc::28) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ1PR11MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: 80b29071-6137-479b-2bae-08df15da3007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|1800799024|376014|366016|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: yWaZ8SLeDo55Nf6N1shwDgKjSnmSuwoT+ySpWTRvICHeH0uOIhl65Cu8hb5tjmBcTbuENIWrlWl7zke5b1FY6pkJhJyjP79Ux4SqA3hlXhnE7HKG6A97GlMHNyW0w/a7sg+zdZDdh7844X73H/rq4LDm5qH+IDMM7DGMEdRHbu257wB/fGbCKguOoy3g8xUM4WljU9IhRMjZMzPoAJKVkICpeB5oIDCUxUhQFGcKbjn1VS2WwCGLCDQf+s4UVkbEAxXjtidfhcqrCzNym+cQdcU6PXsrLU3DnrfoTV6RQot63/ibhLSkaGPvQlPt4EorDg6KVinq7T4lCVtOAURBNXJtjSwQnV5qqq2P9c1zlmOuDNDwN3uL2sH4Sl+duxryAQD7UkwTzOdN5zGeliDAeT/2SionbgEsolnqIh6/HuY91uYtHCKj4+mnlHWMBSnsRZ8Sz9mfwL/euJGgqBz8ejPHmmvSi4idNuzIonf2TKdXYGOpEcCYqU9J1U6UMHhyVV1Rpl2kiJRN2Wl3GmCyBEq5xd0fZUor6zMuoBgLEt9RtFV5nJUF5H5rGNthIB8NhyBF47h1+asm42wLZmiglN9QquPQ0NGDchITuJoUuV/qty3W4jav0AnTZGYn6U9BhT1/z/alH9tloaZKoUPZIVILknG/jtS7TSeiME5e5qY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(376014)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTJkcFRUdmFMTkZGSklVQ21iRXg2ajByZ05PU3JGcE5BekZyZG8rWi9hUDd0?=
 =?utf-8?B?T2pnWnlicHFpcWdxSTErQ050d3FuOXpuMWZmelY3VlR2cjJpRVFCd1J1dFVS?=
 =?utf-8?B?d3NOODdLaHJkZEZ6bVEyakEwbE4yODRrd0VaVzNST29NT09semNIRU9qcFFQ?=
 =?utf-8?B?TnJjSXNOOUowcnJncE0vZUNhanlld2ZXUVJIVXdYYUlqVmNHRlI3aGVJU3pm?=
 =?utf-8?B?NkV4ai9MUnl2U0lPWUFDMXNMVFJGS2pTRFFpdG9lV3ZHTEp3SWFCR0ZhZXl1?=
 =?utf-8?B?cytoNGlGSW1aN1VBaFQwc0hYK2hkSDduejFueGJDNWozRWI0dzdzV09yLzAx?=
 =?utf-8?B?N29wZVBQNWNaRDBMamo4Z3ZtNkZOb2paSUY0T2RoY1hmdnIrMVBFOGpRem5P?=
 =?utf-8?B?RVNoZzlWVWw1aWNBSmFmSWVTWGNKSVY2dkU2NGtuSlpVSHowZkRYNGp5QmZR?=
 =?utf-8?B?WmhoVmFZVW1wcnltc1hMK2VHUjRWUUpKWi9TRWgxU1ljeDJkb0F6MVczSWhn?=
 =?utf-8?B?ckpKRWdNNFJ6dmRidGZvcC9XRk5lS2hFZHJzQ1hxYnJ5bVBwNWUxMWRhNTh2?=
 =?utf-8?B?NThaYW92NjZxVjgrRk9qSG90QWN2OW9zN3BoTUk1WnpnUEpmak9XTjRLWXFq?=
 =?utf-8?B?VFN4ajZVQVUxcXNVcTNHSzdWcS93LzBsaHJTOG5KY2NidnJUd2FhTkhRV1cw?=
 =?utf-8?B?Tnp5MUZZQ3liR0hYWlVLdTNIUWw0alZheUt0WGljT0VTS2xjSVdtNldyNTh2?=
 =?utf-8?B?K1E4c3FLRHljRDZ1OXhJb2JGd1U3ekI4K1lpamFOSHE5NEMzcEN1SjJZTDRo?=
 =?utf-8?B?RDRxRkYyZzJoMHVqTXBaSUxIVDltM2pjOTNIek9na1NhdCs0U0FqVmhTNEJF?=
 =?utf-8?B?NlFoYVk5S0V3aTUvSTQzVERJeUFXaHNlamNFSnhtcnc5NXJEbTV1NWVKN0lq?=
 =?utf-8?B?dURsVEVBTU1UUi9ZenhzcFZ3dnBsdXJJYmdlcnBYRjZzbis0MW5ySDFRcVdB?=
 =?utf-8?B?WW5CSk1FMzc0aS9BeG5rbllDS01vQThMUE5RWWVHcVNhRnl2VUI3bElmaGdY?=
 =?utf-8?B?S2w2Ulh6aTB5ZE5TeTVkVDR0d25zVEpaNWRiVzFwTFVMOVlUSXZOUFRFamRu?=
 =?utf-8?B?YkVNWXpxNE8wNWxSdll0NWpOaFFIWEI4V0dwYUhrYUZvRC9EMU9aMmIrRnhs?=
 =?utf-8?B?NVVyMTNESkNNSnNZbWVRbG9IZkpRVUFhdVVFaTJyN2pRVURkaDlURnRleGZu?=
 =?utf-8?B?MU9tUktDRlJOTmxsRm1MYXN1TnRJZXZvSmdpTEQ2WXFiSVh3WGRMelpPd1dx?=
 =?utf-8?B?Zm54YXNNZHgvN1RNWmlBYjdOZ0dFV3loQ3pJRS9ZcDlMNUxwZndPNzc0RmJJ?=
 =?utf-8?B?QU9FcXFncTJ3aU5xYXFkakNLSHhiU3JVTVhmZEs3ek05c2thRmJOWHVEUTU1?=
 =?utf-8?B?YkVST3VtUjhoQThmSGs3OHV1Q0E2NElVV1QvVzZCSkZ5ZGNHeWRWc2dRNlo0?=
 =?utf-8?B?ZW5oVnZqVDJnVWo2UW96d2hnd2IrNnlvdURZN294VkxtbDhYc1UyRHhDRFpP?=
 =?utf-8?B?ZWk0ZVpyWXgvNWR1ZzFvU2NOUzVrcnlxT0JwNFVJVzQ2S0tUeTA3bGEwTFhY?=
 =?utf-8?B?NWRXckNid2xJTjlMaU5yclRyODVQM1l3TURobkdQOWRHSnlWZkdXZjVuZnRq?=
 =?utf-8?B?bWJnMmRlSkNRRnltNEdscTU0NGlVczN0djJrYVdLQndEQWJidlY3cUJXSlcy?=
 =?utf-8?B?c3NOSVFoMXhkRURsRU1KelJORVJhMzRFV0UzQ1B1bmdSTWF1eFhaSEg3QnNn?=
 =?utf-8?B?MTd4QjRmalQyV3krSzF0WkV4dDc0N2FxRUd5ZTRCd0pWOVI3ZTMzUWZrMmVj?=
 =?utf-8?B?UUNlNWJscjRIRmZra0RFQUtCckp0bjFKU1lBZzlSM2FGVDJBMVRLRjZXQnl5?=
 =?utf-8?B?ZW5rZStVN0ZqT0dLMXRTZ2d5T2s3TVQrUVJVeXJMTFNIWktRVDJib3BsT3hF?=
 =?utf-8?B?c2hyRDhPWHlFUHVmUnM5ZWZpaTg0OU5qWWZtcmJxSmN3MHlUU2lHYU41ZjNq?=
 =?utf-8?B?WjVzSU5QOG9vTncrekUwcEsvNk03TlJYV3U3NUVxdEl4RWpRTUJRcU1YR3E5?=
 =?utf-8?B?MU9RMUZCclREUXgwQWtXV0cyQWZ5TmpaaVhKN2FrbWFZNTZGL29VblR1Yi8x?=
 =?utf-8?B?bkJwYkF5dFhWdWg5Nm5yR3piZDR6NVh4ZmJweGJDRFpvTnIzYTR0RUNaczdh?=
 =?utf-8?B?Sy9IdmlKMzI5ZTZ0WCs5U3daaHd4THk3L3ZTck5KWkJGTmtKOU9kVGF5NEZl?=
 =?utf-8?B?b3Rrcys5bmpXRGZFaG0vNGZURlFwZWE3enpuVittWUhyZFRrWmc4NnAzOGhC?=
 =?utf-8?Q?GZgGep54fVwbNwC8=3D?=
X-Exchange-RoutingPolicyChecked: ubSy/wnqJy0ZvEfs1YoNzKzvZ3YoVdYPi8NrUXcOJzMAJlMXvQEp0Gs7r3+xwn7HniERAeqjam1gqg5ZVM9aEAIourU+oxjaQ1FHbpQHMcHogmjU36+MaBLu1rrFY5do9Fbh1ijxZPrvIxrJXMV33nGnXS4rEbhlLwrpVE9+4QzZ6EcenjTFxhpWS7zU3CFSvOdq3qv58sZSxw6xdtjqzNXyi1heV2yHnyzxHsSltuYTQdH5e8cg6z5i7JoVHv5wdBt1a55vnasV55L2zkqqiDyFCuJHEkDAj9aImr1FaQxRlByO4V7P2IPssCg357JOyihyNixLgXZtp/Hw+dRYkA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b29071-6137-479b-2bae-08df15da3007
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 23:11:36.5064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rpPmqFkJxgtZL0p5+dtjMZEnyFpeID7hI7FIaQKV+TXFteSaSb3++86qYSFIfTry+OqirTZCZ0+yaZ4wkh3Qh10EBMmGjKtlRWNvLwEJWqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6156
X-OriginatorOrg: intel.com

Hi Chenyu,

On 9/13/26 7:49 PM, Chen Yu wrote:
> Hi Reinette,
> 
> On Mon, Aug 10, 2026 at 11:09:31AM -0700, Reinette Chatre wrote:
>>
>> From user space view "legacy" is the existing percentage based MB control
>> that user space has been using until now. The only way to support this "legacy"
>> user interface with region-aware hardware is to use the MSR interface, no?
>> User space does not care whether the hardware uses MSR or MMIO, it just uses
>> the MB interface.
>> That is, as you also say, until it is possible to map legacy control value to
>> region-aware control value at which point the MMIO interface can be used and
>> user space can continue to use the MB control without interruption.
>>
> 
> While looking at the context of control_mode under the info directory, it is
> currently used only for the controller to switch between "legacy" and "native".
> However, there is also an explicit requirement for the MBM to switch between
> "legacy" and "native" TOGETHER with the MBA.
> 
> According to the RDT spec 6.1.3.1 RDT Control Register for CPU Agents,
> it discourages mixing legacy MSR for MBM with region aware MBA:
> "It is recommended that software use Region Aware MBM when Region Aware
> MBA is enabled and vice versa. Mixed mode use (e.g, legacy MSR
> interfaces for MBM with Region Aware MBA or vice versa) is not
> supported and may lead to inconsistent behavior"
> 
> That is to say, I'm trying to add logic in the code so that, if control_mode
> has switched, the corresponding "mode" for MBM will also be adjusted to the
> same mode. The code can enable/create both legacy MBM events/sysfs and region-aware
> MBM events/sysfs during bootup, and make one of them visible according to control_mode,
> similar to what Babu does in PLZA when hiding a file in
> https://lore.kernel.org/lkml/f7bcf19ac8113a1e3d9575739c1a6400c455ce6d.1787772750.git.babu.moger@amd.com/
> 
> May I know whether this approach is doable?
This sounds reasonable to me. Since so many changes are between current resctrl and those
changes it is difficult to envision how clean such change would be. We should aim to
avoid sprinkling "if ("region aware") then" checks all over the place.

A switch like this will force "region aware" to support the same number of CLOS/RMID
as the MSR interface. Is this a concern?

Reinette

