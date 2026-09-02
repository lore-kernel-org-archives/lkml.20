Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974AD4AD4B6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383752; cv=fail; b=KCIXWCMa5CJWkZc/I7HHbiL+nYA7TTDnnV6PEljsKYOjqw8Q07oYpwK9/kIKhuEjtNd32HSlxSgRry4TcGBZNR0u9e/WKlQaaYCQtHYOWxBQdzjUeQTLNbXgqadWlQOP/Hb+w5zTjwPlFLFZ5ElGLVRCLxPZ7LRUC1j+9l/9VSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383752; c=relaxed/simple;
	bh=2S9p1+8ZcfDgsJpVtUsqMUdfle+dGgntUdEreXRM2G4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AjREGhMYFIq6+YvUcngi4qy62kj+fzYNhMAbdD19dklZNLHr7g6nSDj3q+qzsSR7PgYYo+ZP7d2Z4H/zE1Jyss03C9gikpdIsxLqPxv7JvElZ3lsZGIzV+a+TPo/olXIFwqONL2nHpjioVD5Qd164DwrjEw/nZwwQpwT+fSQwO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gY4XdMJF; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gY4XdMJF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788383746; x=1819919746;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2S9p1+8ZcfDgsJpVtUsqMUdfle+dGgntUdEreXRM2G4=;
  b=gY4XdMJFt4m/PIrZE6Rbg/nGA+NKKzEF0JNUSXNBosN2/tC+k+Hnup7U
   Tv1BKdBisR3O3gwhagsVFR7lVbChS1BqGNWN+tSesRsVsx7/j93RYcGv/
   upsfB65jzWGoxBpPGoglUrnwANzfDHEM739H7Hj5sTfO9cb14yaJ3vKf4
   YBQXmqVJ+E3Sayb3m8tlsWb2cS2k0IuWGqqGLmUKpk1KcBHBO4q+8kMJJ
   sHGfs3uCe9YC3wRrgcJi5URj4lqtPsje0WJ/KTwaHRzA7z6jBdlThx29b
   /x57s7PgSuJkpmYnoiwrnOXNl56hW0in2zBemIDsxf027ZZp0I41Ww7N4
   w==;
X-CSE-ConnectionGUID: v3RxTrvMTZGmU/Ex1EHung==
X-CSE-MsgGUID: PLaeXWohQNiaTa0aJazlRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92723923"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="92723923"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 14:15:41 -0700
X-CSE-ConnectionGUID: QWqRcdhoRhe97jNOVTxWYQ==
X-CSE-MsgGUID: Sg3V5up8Rj+taMiYE4+YxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="274807332"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 14:15:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 14:15:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 14:15:40 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 14:15:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FeaafIvJwDb7/zqiuUmJSuPq/DQZrlY0dEVx0dWyEFlPgh5BsEEBrho8U+ofQ247XghsJTyslTyIRP6Vnzh18Mguh4zf8IIEZ/pNp1i0iC19VU6DuJhDZyRIoW63bSdd8Z9oSLfP7qFf+LcebuVux5tTrKENRdVJRXF7r1omjx7N8p8Bu4i/C+wVtColHS8PcQDFfwlLhQ6CdNbhtrR3wCMRy7RXoHGxHT7kBohTOVnmiQqVJfLfgSBqWWsC7jqMuhjiGOnwkldMe/nuWvXLxgaBGBTMheMMmGEKJB8siLzceArd7lEWG1tUwDU/33n4hvvm+cTBYmF+CVVeKTuV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mlRI2eRkywcip47Fzja1VoUeBgkeOS4KFBBo1uzmOk=;
 b=O+Wjopba8ExEXXOWy9PPN1GSdofclG8rlh7aMu9bAW9XFC54ErOfqxiKvxPS5Z/cS9HLH6EfpY+o+qdzNdeXB7p07IEzKW3Z4djwknRL2Vno2sYMKYfdUuUXVYFIbWNZKiJlDa4rnVbdbaj8HgwaBW6DiqTl14p/LvpGknl8XqH2CRc/sDnj31k9PJD8ivmClHST1mAZ5t07lFvCtJMs99i7JvrI3IU1CDt1Y6xIB2Cy0d3mzPN9HmSWdJ9KRd+xYnWs8vxL4onC2nJo+xqf64FHv6Ssr37nDsoNBU7Sckz5EJut2T1My3z9FKjVatYmNwtf/f1R+oBe9xaboHf/Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 PH7PR11MB8250.namprd11.prod.outlook.com (2603:10b6:510:1a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 21:15:37 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 21:15:37 +0000
Message-ID: <f1e3cb3f-a76d-432f-8d32-9a48c0a8d111@intel.com>
Date: Wed, 2 Sep 2026 14:15:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] x86/fpu: Document reasoning of FX-only fallback
To: Andrei Vagin <avagin@google.com>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>
CC: <linux-kernel@vger.kernel.org>, <criu@lists.linux.dev>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, Alexander Mikhalitsyn
	<alexander@mihalicyn.com>, "H. Peter Anvin" <hpa@zytor.com>
References: <20260817042048.1579415-1-avagin@google.com>
 <20260817042048.1579415-5-avagin@google.com>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <20260817042048.1579415-5-avagin@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0204.namprd05.prod.outlook.com
 (2603:10b6:a03:330::29) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|PH7PR11MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: a6dcc727-cd8e-4154-bdef-08df09375558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014|23010399003|11063799006|6133799003|4143699003|56012099006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: /dmQZp+Uci53CLY6BhTjvEAx3j214XC2YaoBJzsLLpcwlVO4ZK9Rx0BJdXE7am9TeiBNBaRu386yvN57vqX4flSpGLZENeF2OGWgYmfIg1GS4Zxdvf8hB4Y8UG6HvhSrutqi8jBJCElien8cXZHsRCmLvAVGGos0HKZG71Pro9MCY42d7FYQAQ1N/C9HAmP69a5amHsNuc+ZIz7c9Oi2UmYR9WABs5K2wHOolCoCbaszUpu3G6krsVHdxJxDGFUtwtpR2MApWtHj/j7IUz8ZLbNqZNng/ro45mra4Ep0gztBoMoMwTPYacwRjUzobnZOrRs2KYOI3TOsn4aedBeLjBCd/JvDK6NpxSzi7U2MmCaXkr99Cnwn58awcPaQntfQiS9EDBs5B9eRvmz1/HGHthc5pGXIXsaDor8rrLrIL++BdjUYIeVBpHHG2rftWWHDgTvy6aDeCmDto6Hn4EjE0MbwS0baGeHn3150Gw2fCPQEi3g/f3hYXwq3W8TgpFSNxV9rBk3cPrYmQyNTJ8Tc6vYn/fxBt1C4tNJB3dhsw/sqtBoXxqJeA0J4TisYcJsxsbTMFWomkaKNwfqJqU9QQayRb+vbWy7Ni+PqrBdTVnfYQHb40I5hbsKql5er/KmXzkbIGggkTiFqE8rGuonr1r0yJmfFq5jAIWUmEY4y4DY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(23010399003)(11063799006)(6133799003)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1FoQmxJV0RwZDJKMml4UnFIKy9jT0JpZjRKY2tTUlJVV2crV295VE0vM2s2?=
 =?utf-8?B?bmprY2gyTlJLOFNLbWs4cStRdDJNTXNKZFo5N3lpa2FJSnRxMjZYaFVzUG5J?=
 =?utf-8?B?ajRGc0RUZ29KdVZvOEdPTUc2TDQyL1VxM3B2aC9oWUFOYWFGb3c5UlBiQnBT?=
 =?utf-8?B?d25MN3ovMzNVaVdadlVEOHhMN2RXRWliUmJoNHgyWldYYjBBVEJFWXZuZGVR?=
 =?utf-8?B?MTVETFIxRFdWdTVKeVBPcDBhUFVDK2ZWTWQvRWdkOFVSOENGQzVrQTFTNnRL?=
 =?utf-8?B?Tmx1ZW1zeHlzMWxNQ2p6Slp1TXdwZWRsVWRMOHJMVGdYdzlCUjNzelRTNzFJ?=
 =?utf-8?B?aXhSTTB5dDZFN3FaRTFFdjJqcW9FdmdDUitnbjhGaUFlNkFhVTBrKzdUS3lQ?=
 =?utf-8?B?bTdySWRCWm00aTVkQ1hoR1Zpam5Ma1BVNHgrMm12VEVlZ1ZUbVpwRnFRSU44?=
 =?utf-8?B?UGVFSThwZERUNEdUL2RmVFdCK0hSMGlBeHNPY1Jxc3UvY3NKd0tNU0dHeVBH?=
 =?utf-8?B?dGV6MVNZbE5uQ2toaW5YTUJQR0phbm5sazh3UWVZYzNkWTdaS1RURE1UNE9J?=
 =?utf-8?B?aXQvMTVBZmJoWEwxbVBDeWJOMGtldGpEcUhOa09QRFBLcVZFMDlzRUI5VSts?=
 =?utf-8?B?ek1tV3hTN3hYam5URHFBMjBvbXdTYnhJakE2dlk4bHhOQ0FMWHVhNXBsL1lF?=
 =?utf-8?B?dXNEUm5CekhRaHFrajgwTkNGdmtwOGp5TW5CcEJrWmY2OTdadDlkTGxGZXYw?=
 =?utf-8?B?YUJZdDM5c2VHWmJKdjA2RW94dUREQWRrT2k2Nmc4WW5hMG9aZnUvekFLWXZl?=
 =?utf-8?B?TFJtRlVBM0pCUzZNYy9pZG9zSWtSOTJadUh0V1JVZS8wMEpMWHFuQVVzOXps?=
 =?utf-8?B?ZXg2dUlaa0U1dmtZTDRYMGVYaG0rZUlxY1pkSlZtY1pCTXpzL1lZMEMyN1dm?=
 =?utf-8?B?WklDMWpMQ2M3a3ZJUDVTZnMzeWFLcXZ0YXhWWFZZay9SMUJiR2QvK1krR1Vh?=
 =?utf-8?B?SEU0OENncWFCUFFRMWVyYjVOaDhpbU1wT0NNbER3Nk1UMjdjcDJ6eWtSdkNu?=
 =?utf-8?B?c0RxOUNrMU9STEhrblhCRzFVdTBIR2FBRHRXSC81RS9hSXdUVHVzazhvckdv?=
 =?utf-8?B?dGV6TVZRQmNVSi90WjlTUWppemFwaWhGQW1iYnR2bU44ZnJ4Ly84MVE5M1NW?=
 =?utf-8?B?SWQ1RlNUTkNJbyt3UnFMbHhGTGVEcWlERlhDRnVYZEdMY1Jqd0hmd29nQmNo?=
 =?utf-8?B?TDEyVm5wK3RwSU1LSVFnMnpuMGJVQzZOdkZtRlNQL2hlZUQ4cHdiZnF1cmRF?=
 =?utf-8?B?bXFERHBiWkFqQ1FBSDBPQ0ZURjhQSWxQQTRFWnNxTTA0NEk0RW03clUzVHpo?=
 =?utf-8?B?L3FMMjEyaTltUC95OWVVR21QdUJqUjRUQVJoSXR6c0FDV3hXNk4rZWZlZ2tG?=
 =?utf-8?B?ay9oNVhJd3BacWF4d3JiLzhBeHNyWVNCL21hOEpsZnh1WWNaY1NaZVZoSGVQ?=
 =?utf-8?B?VmJkbUE2NDFpZ1RWQ2pFLzAxSkwxSUVmRVVXK01lZmdieHpnNE5YZHluZ0RE?=
 =?utf-8?B?Q0xyMGprZUJSdFl0ekl3QUcrRnBSbHlEWVJSOEcvL0J1Z1d1bzZNZHBCcWZ2?=
 =?utf-8?B?S3kyaFk4Tnl5a0txekhjcHh2bElVODFJOUl4UHpySFQ1TmFkSThSTTBhRzVH?=
 =?utf-8?B?SlRmYWl5SHdsYjV2SitBQVBydXNsYmxzT1orc00xY1c2OFRYSEs2czJFTVQz?=
 =?utf-8?B?RGFvRURsU2RNb0hzdVV1OXpiMnhUdDAzckVhb20vWUowclJIY2M3UGNueHRu?=
 =?utf-8?B?bWZXQmxITTNQM29uVHpWSHVuS09OL3ZzS0wyN0pUQ3ZDODNLYW9nMG9NdXM4?=
 =?utf-8?B?QzBWYlo2SFQ4QjM5Vys0VUVkYnZnb2EwUjgxek5vcDhtRFF2UmI3dGhRSXQy?=
 =?utf-8?B?ekU4eW1jNDEvcmlZYTZRTnR4alQ0MyszU1NYbUJ1ZWtoOTl2K3k2U3VZRmt0?=
 =?utf-8?B?SDBZN3FGVHV3cms5RWcrdXl0ZXEvNmw1QXUwNHI0WmJxM1BnUTlIbkZMWnpz?=
 =?utf-8?B?V2N3ZWdlUWFCMzV3WmRSSzdyQnU0V3JRazl3NlVtZVorTkp6bVJ2aDRjQzBM?=
 =?utf-8?B?RmNqQ0NENjZFUkdjM0t6dDN4MWd1WitnbmV2Umh2OHBVTFBJVjAzZjBrL0lr?=
 =?utf-8?B?c29YMVk1SktXSmp2NkMyMnViVnRyREpTNVp2UkVac0pZc0lSc0E4TjZGWW0z?=
 =?utf-8?B?bjZpRWYvL3RLcUdKcjJuamh1dXE2NS83clc4c1lpdjY2SU1qWFBmS2szSERt?=
 =?utf-8?B?RDR0WVpiVFVhZzRhSU9Va3NXWnNxd05zVjdiYUxMVjdsNUhGQ013Zz09?=
X-Exchange-RoutingPolicyChecked: EHfqP4zlbJkBhBMbWqWIUda4KrJd0vrbJRlRNJHHfMK1OzCcPVdVbXvhFYq961x451gdb1dZEyZx22NbIQbdc9FoLqDA83VAQ+gSZ9wnhKe9ItI10TGwu80Sn4Wt3s19ZLqqxE2bjTFTG9gur/403V1W213JUaFJ/ClcVIY29umq1iDdk1cq2XOSl978fL2pDQRdFTQKn1F1gPYpq/prWMdKXD8qV6wSBQbxj7W2bgNDPmy65xoDb/BCD7Y4Qwv1bUWZMlJC1yhyE9q9RWUqHoTYbjUiUvdRJ8SQp18LPmuY+2JyM07rNkGfsr+1MUILbSiPxPX40Do9L3WIWFhqmg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a6dcc727-cd8e-4154-bdef-08df09375558
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 21:15:37.0798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: If43SdWk5fXXqfkicOCWGrmiMAaeZanEbQLQ5bsENM+fFU6PqX4M8Hn/RIFIBVjzEQFVZ8MKJzs9v/Q8Q0CkaSHFoZISPbwCnX3Lpn2xtHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8250
X-OriginatorOrg: intel.com

On 8/16/2026 9:20 PM, Andrei Vagin wrote:
> Add a comment to check_xstate_in_sigframe() to explain reasoning behind
> falling back to the FX-only state when signal frame metadata is
> inconsistent.
> 
> The fallback is intended to preserve backward compatibility with legacy
> user-space processes that are not aware of XSAVE states and might only
> fill or copy just the legacy FP state.
> 
> This fallback is dangerous as it can trigger silent corruptions of

I don't think the fallback itself makes it more _dangerous_. To the 
kernel, this is one of handling options _once_ an error happens. This is 
for the better interaction with user space.

> user-space state by resetting extended registers if the process was
> using them but the frame metadata was malformed.
> 
> Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
> Signed-off-by: Andrei Vagin <avagin@google.com>
> ---
>   arch/x86/kernel/fpu/signal.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
> index 6a14b528ac7f..85021c5ea649 100644
> --- a/arch/x86/kernel/fpu/signal.c
> +++ b/arch/x86/kernel/fpu/signal.c
> @@ -54,6 +54,14 @@ static inline bool check_xstate_in_sigframe(struct fxregs_state __user *buf_fx,
>   	if (likely(magic2 == FP_XSTATE_MAGIC2))
>   		return true;
>   err_setfx:
> +	/*
> +	 * The fallback to FX-only state is used to preserve backward
> +	 * compatibility with user-space processes that are not aware of xsave
> +	 * states.
> +	 *
> +	 * In all other cases, returning false (to trigger SIGSEGV) is
> +	 * preferred to avoid silent user-space state corruption.
> +	 */
>   	trace_x86_fpu_xstate_check_failed(x86_task_fpu(current));
>   
>   	/* Set the parameters for fx only state */

With all discussions in the past, yes. I'd vote for putting such comment 
on this path. With some massage in the changelog,

   Reviewed-by: Chang S. Bae <chang.seok.bae@intel.com>

Thanks,
Chang
