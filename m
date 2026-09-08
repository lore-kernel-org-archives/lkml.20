Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803DA4A5C4A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 23:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908882; cv=fail; b=VfRbTTReTi8fzfYNQNlciMJbxAQPYjscH4Bj/YJA1Vagut4YGwqaKdX3NuO88sJzU9922whfcH5hLyuKLtuOPOIdQxqE8nQm70KHUPEZHBEUKoRRF9wbzZ69Grj4yfnERBhXD7HCNSywLEdKp5PAyfof45lMEJEtUCqqqzpDtEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908882; c=relaxed/simple;
	bh=qPITnT0/U3hjN8j4IY0J3el1EFHMOhpIDJq0BOKqsSk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YPDRv1gS5vpuGDVzUtoOosDFBjzRlLRADf58ODcx4AujC1TE0lhqO2fdRC0jK31/kSLW0DilHHalgktNR2H8smpNTMJ3NH8T5fIFnpQ0D2t02T86fL7IYW0PKk8L+wdX8QWnXpOFHcriJRMzwI0b81DxxBQ/+NtlIDQumXmms70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cBhtTCWm; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBhtTCWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788908880; x=1820444880;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qPITnT0/U3hjN8j4IY0J3el1EFHMOhpIDJq0BOKqsSk=;
  b=cBhtTCWmloyDRFQLySqMTRwnAK82/l7H5bVKPemj/cD9sA6wIDUnWHCe
   Z1H6zFhoCpJNpv72xfm1SPRz3gloRWFqA3SJaAi/Krb87txGIewadM+oq
   L8I73F9IKXG9Adh7ifUqpWUOb1Ali9G/bYkR7mDSYsoZHgE+CFLfO4iN+
   r2MM2rjIIA9ATjCQmu9mfnS3b8tcWTQOALRtWwtQc9Xiu8qfzej5M4X81
   vCxg3T4uiH8YPfyFC1lHY5yOcSwdPfRgOzsyqpVnJfckc9NceSopTdpuT
   EbZ3yfIEm3QZEVZIxK1aclwldn4tMxEt0ZMk+x0aSzvEf8I7NHKJ8byTf
   g==;
X-CSE-ConnectionGUID: ZS9/V0dER3S0Qe56TyzBjg==
X-CSE-MsgGUID: DLwY1lW/QbKL0fIvUmx5VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100484960"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="100484960"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 16:07:59 -0700
X-CSE-ConnectionGUID: FDQuzRCzTbmCiCSD+fuJYQ==
X-CSE-MsgGUID: uCWwwZLRSBm5/L9GhISPFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="273091942"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 16:07:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 16:07:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 16:07:57 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 16:07:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+XOgtQ2MCw9YayC8E0Wj7G4HRUbbNTxNJu12Pr6DT5e+qTa958qdPETu2MNjSEomgovtkZX4XmvvSNqDG7zHWB5ILfPlTSPQSYuvvbL1xWqenaVPSPUGONgpSRUD6d08uZBU3cdTdaZ9sIWvFrR4YtBMawDT4vQUUvPmkPIkkbtcq1ApxH0fjFwZCoJDK46nWj/XPP8wpTZ9v7PYii0OsvOrSbGDaVwMp/xK+JpbJj+HiglxP/3SK33N2Sc/qDy99ctxhtY/J8PsyR6gN39WagMWFrmhgBh1lMbADb07QwFofsuQkOCSYntWtwfEIEs45Xs6DmhcSFhqCSHkSeNFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGv/bbPjFdOuihwi4V3D0S9sKDAn/jo9vXQ0crMBWrk=;
 b=VTII4YtJvvVBqhlu4WQkbr44a+2muWjSBWb9ex91R2trDDpxIsYdQlVtxjSLWnz2aJHSywIkMrKgdpEJ2AQPuRXXT4uiPcm2o05UymB3zFfYX4It8JfmB26f/s9rme92bmj/zxvdiNW+ugTi2Qx4S+iM35jy9FHHIHQaMUCUBuWAk4cfGdrD30PE7dQP7xOzUQ9gBZRw1K2P0Zv8bDQTqYZPfHIOTdY5Lw7PzmwNNXcks0H2rRzP6Wlg0lOxLlV8VEiSK4prZMhGmIgrQU5D1bDr+bkYvQSTr2EW/g2KKNeYapUcFhWZnVh+qj9Tm6PYPANmPBP0CTPW+XhKNTkZfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 PH7PR11MB8455.namprd11.prod.outlook.com (2603:10b6:510:30d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 23:07:54 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84%7]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 23:07:54 +0000
Message-ID: <bf94ee57-ba7c-46b9-9799-4a7927f80475@intel.com>
Date: Tue, 8 Sep 2026 16:07:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] x86/microcode: Address GNR errata and follow-up
To: <linux-kernel@vger.kernel.org>
CC: <x86@kernel.org>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <andrew.cooper3@citrix.com>,
	<arjan.van.de.ven@intel.com>
References: <20260901231634.714144-1-chang.seok.bae@intel.com>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <20260901231634.714144-1-chang.seok.bae@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0100.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::15) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|PH7PR11MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: c8ba4d95-35f2-4895-44ce-08df0dfe035f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: h2F2PjDI18ZzNihpVwH9EayTzjbegRIzCUR/A8bR7SPXSCpwjeZzeh5l4YO/bIyI1IJXjzjksFzPIihMUV5nC2hmGLVWZdWDdECx+jjddZ2DMSlsTiytgOBpX4rcqxkZpgQE6bFBdTWKpzj/3YpkrW1m9nsw/ivu80C3UO1sTHygIa4Wcwk/6rcEJIGIV7o4uAxJhJ8lixZrrrT9gbHbIxKrlmYd7Wv8pkNoMkDQCQtjpC6uQYEWIbAPINfxB4S1rjDCyHf1VzxYDSCm7OJhsTnQ96ZGy9prD40t7d0SLCBS0ZphVie433Ct3JY6kUXBAOHgXyjQcq3WIWXJbUGtu33jwSkvTqTBCsWG7qucb6d3qQhiAQKuOSN+NTA2xkRLOItzK8lYfPad6d444pVUUVzfaSHIk32Bgt4iF98g0y5nIH7zrUfeHQCi41MDuF8nV/vq7uPeZdFb+qHARsJ82vjpfJEpulWievvnv9ayqGR8+SNtYQNStbSxveACi7kjOUBCGNDdJlKGSuqx42BNRk7xahRJPAH806wo8B5OVZzT2rH/cNd5ihDZiMFke3vwMVFBfGzpOXuf2UVDLyU4rQsEGerfKh2QGCuWzLuvjOidNRnBEqqiwtVNmM4fJ71nx+FLTfNRchPPD4RSz+NBBkwQKmAWNAj0ZPZvC6O3b+E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3JIVDg0aGdoUkhzVTNZZlcxczJ5WEt2UTdud2Q3dHNPRTZlcXFrdmx1QVM3?=
 =?utf-8?B?RkNUbmpSSWI4aW5uNnVFeVJ6S2lrV2ZBYzdxSzlDcVpiMmRVVXIwQzV2WEd4?=
 =?utf-8?B?b3BDa2JBVVN3bWNLa1NSWlh4ZHl4cEFROUxIbng1a1ZvdEVFSUp4VTdIaGhK?=
 =?utf-8?B?N1dRZGRTSTVOUzMxRzAwMEN4ZWxheTZTZXZCcC9FU0Q0Vlh5N1hzVEM5dXYz?=
 =?utf-8?B?c3g0T0dvZiszaWxlcEZ2OFhqQTVnTWFxMnhjcjJOSm1aV1hncklKSWZlOXNr?=
 =?utf-8?B?QVljZUVITmkxZmtwWXNKQmY5SFFlUzFXNE56TFVqUGNCUUhvQ0ovY3k4S3lG?=
 =?utf-8?B?Y1ovR0ZrcWNtNDMwcGtKZno3VkYxOEovQnQyQ2JlaERvQVhVTEJQQUxNNG5o?=
 =?utf-8?B?REhncTU3RDM4RXdrQWxtOU1TMklDUzBHTFdlemV0VFhsdmh0TXhjVU00cFo0?=
 =?utf-8?B?VGpzSHljNHhjTjl5V3F1Y0N5TVZmTDJJYUp2d0xPZG00aHJoKzhGU045RkdR?=
 =?utf-8?B?VTBsZ1N6dUdOUVp5Q3BNaS9JblVKenJucnlQVk9YSmRCNjBMTkdyRWMza0gx?=
 =?utf-8?B?WkNTbTFFd0VqTmNNR2VUam5vbm5DRWQ1VFFsUitwa1pIVHg0ZmRUZS9QT2Y3?=
 =?utf-8?B?OVZvZ0p3dno1eUhuOVlKTmVhM0pMNE1YMzhsTDJrdzJNSHR0a0l3U3JjdmU2?=
 =?utf-8?B?dDIwdzRsTFNkUWloQnV2YmZlOWJuTks2T3A2T3BtaEdBZ2xJdUxBUVN3M3d3?=
 =?utf-8?B?ZzZ2M00wWkk5QkNjM0dyekFvV3B5dDg0SG9IaXdWMHlrY2p4MFU0aFVjN0Rl?=
 =?utf-8?B?eWhKMk13eEowd2dYSmRPNWhQU2oxb1gxam9CU0ZIRDFVYTJYbGlvVG44VUxG?=
 =?utf-8?B?NUZ1OUpVZWhOdXd0V0trTE1Qck9OVlYxZFZVYlZtS21lRmRFMHVXT3dtbmM1?=
 =?utf-8?B?L1U2cExpMDRYSFpwKzZ3MURFWmQzamhWOWFRR0YzcEtSa2htYzB4UG9jUElU?=
 =?utf-8?B?Vk44OER0cVp4dVZBM2UwT3NBaStReG9qSFpOMGdKOS9UUnh2Z1BiQUU2VDhH?=
 =?utf-8?B?K3BzL3NpdXRPT1h0cGQyWCtHanZBUzk3dFp3QTFNV3A2RTV1S2FwTHJ6aUJL?=
 =?utf-8?B?S0dsa0dnVHlwY3RCb3RRYjFudzNOQmdyTFJaVEp4dkJGYmE2cThHQlVJaXBw?=
 =?utf-8?B?SjFqeXVia2lBT0pZSDBVcDk1OU9CbTZxU2R5Szh4VmFwaWRpb3krQ3JxNWNR?=
 =?utf-8?B?bTQrN3RteEFEbEJtVkk0SWg4bTlYbjZBYU1tYmpKclZIaFAxOUNKTWwzeTZK?=
 =?utf-8?B?Qk5BUlZrY0doRkpvYzZmWlFXaGUraHQvTjMwWWZUTkZUcC84WkVzdkkrVS9N?=
 =?utf-8?B?eVUxZElta1FOMkdTVGx6Smt3WktKTTlPb2IvcE9HNjk3SCs0K2ZNWmJjeERP?=
 =?utf-8?B?K1dER2xZZFkzbUhmRnlQUE5DOGZNalNuVUphYXpVRzFNUjM0TGRuMDFMQXdx?=
 =?utf-8?B?T05iQ29NTHlYQWIvb29jUmpXR25ZandJbzg1UUFPTHRRMG5pbHRRdi9ocGZP?=
 =?utf-8?B?Yk5tN2JXenpZRVpJZ0RYUjBpRmtOUWpCK3JNVlIwWXVMNVRjZEc0c0JEK3hw?=
 =?utf-8?B?UzQxcCtMRU13NTJRWDhORHdTRDFHajNWRnhKUlZhT0VIYUpaWTBiN3NPbUdy?=
 =?utf-8?B?cU9Ia3ZRK1lKc3pvd2tlWDkyVERNTzVxc3BYYXByK0QwMzZhZzNTOEpIUXpN?=
 =?utf-8?B?dFdiNk10MTFrU3NKSnpUQkpQTVhiZzVKcmYrVUYxVFhCbUowczVsQzBBUGww?=
 =?utf-8?B?N2kvLzRHYzJZam9nZjZoTWpPMHkwblJGQlZobFhIUGV0V09RWVI5Ymo5Rkha?=
 =?utf-8?B?cTNuaGsvc0hXUlByL2VsZFNqYWpEbVBBb0J2ZEVsVkNsdysvSTNPZWtwQjBW?=
 =?utf-8?B?UGdvcjBsOTB4OHYwem1xeVI1cXdKd0tGV1lSS3ZObC9SUGphemlWZFFKTDlC?=
 =?utf-8?B?Z1BPcEZhNDdVQm53SnhHaktLdmdUV0txdkJZQVFhblgzT1dpOWZtQ0w5TitD?=
 =?utf-8?B?aExMckh1MmFKRnpFUm5zakJ6dHFUUFVRS2hRV3lrMW5YaHF0QWhpQmI0VnZJ?=
 =?utf-8?B?ZDdJakdVOGVNVXVOY3ZSa25kUU5BVFJyeStaN1h1QnVjREIzVUhJcG1qWFFX?=
 =?utf-8?B?VW9iWjNYRkR2SFhSR2VXVTNZYmtIZjV1dENDSlFodVVlNSswSmd1QU9vYy9U?=
 =?utf-8?B?U2IvcGxnYURhNTY4elowV1ozL2pnL3ZURTA0L0VVZ1JsQnBrZWFWeEJ4S215?=
 =?utf-8?B?UXVXTmQvc0JNY2NVUndwdFFnSVRZTmFEekZ0S1J5MzUxRy9FdGFFZz09?=
X-Exchange-RoutingPolicyChecked: s6boXhHXmvlIS9r9VqlLKu7S5y0l5tRlpQv/muBSvqf1qleXpxTRfd4m8j5pQqrwmw8oa38sPiRYSXa8mBai4a7I3HrXUBtv30qmWG/uAbUTPRdfyZPPDewMyt4bsGfl8ZqlKfOwaHWJZENagHJOrQVYvrprFJyK9axtmprzlX7klU9heVX7l4s9yuh8CldI31lBfPmlOP1kpyJlQM39qA+vkUOIoyJEc/8jE06zBLPfRnTrvcpbxP2W3PaF0QNYbB/houbAZb+YqP84pBjxTUOZ8y34PEKMxP5WxCbjFZqq9CRX+JJjs49t6BGrTsY15ub91mt8nrevRXXc4jZ2/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ba4d95-35f2-4895-44ce-08df0dfe035f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 23:07:54.1113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drFfJwo379lkuV2nlU/fnGbfnBITBeMpDEPYGBuA4yV9MrVoSEnWHCY30lvTyjg3va2isGKIzzBdFMt2UMmIx/47g2makwWUn09eHFIMDL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8455
X-OriginatorOrg: intel.com

On 9/1/2026 4:16 PM, Chang S. Bae wrote:
> 
> It would be much appreciated if the short-term, one-off fix (patch1)
> could be sorted out first to allow backporting.
Split patch1 from the series and posted V2 separately:

  
https://lore.kernel.org/lkml/20260908223209.916758-1-chang.seok.bae@intel.com

I will revisit the rest once the workaround finds its way.

Thanks,
Chang
