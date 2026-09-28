Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A6737CD59
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790631474; cv=fail; b=ozLVKGfUHm1wti04ywyoqNlTBmdcP7VWTr0UQAyMFMIV7EsiXS3YY7UROIWub5vDVPd2e9kPRbvie6umR5TvCVxfamq1JJ9QKiULJ0kKG4gCykWsCLNwxxv7Q3bZIWAl3zoaR2evcfGgDREqBEoifimimntmDgcXyluKLKpC2A0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790631474; c=relaxed/simple;
	bh=KYO/j7i0tpBtGWiWVbm5gcSnNtUvvlSpQhB0AzkzYG0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=irp+qBn8hXBnnzfLva+njYX0o+yq24kt8ODsXl4yVLqCQRaoOyhLrUSPHDmbyn0IvvJP/OFbgCZQbkKMEGn1xqU71HijXN5lYpAhY/9d3BRC903GiqXa/5jrtHqupHdoUykv8HOhvAFDg8cOrOj4L3dEmY1/9Xr/Ri8eL5PAaCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FQ0OlEfw; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FQ0OlEfw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790631472; x=1822167472;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KYO/j7i0tpBtGWiWVbm5gcSnNtUvvlSpQhB0AzkzYG0=;
  b=FQ0OlEfwFPv8D4ZKdvR7L9Wl6vN1Zz/JTfpR7HV1qjrXRAdJevXEDX/N
   xzutppf/eQYwbzYeH5f2XST3udtp4MUeIXrLuibwustwNTAouYjKqcyUi
   mQ8X3ejo2kn4htI7jaUcL3DqVR5p+RFz+nq72JEst463STf8LAoRdyHPZ
   vvG0dypaz8u+UipuSHPnt4XzPtpn6rmhk/5TRBBur2A9GoKStezHgqsZO
   CuKToBeUqukqDwtI7VdW5jZE41oM9bxvQ1CCAazae9zujDT8dCjQMRki7
   /9aTfwUd5PmhjpwYcJJrNX1+KVcB0w0eWpy9w10Bkw5eMzX8eWR1E3Fbv
   w==;
X-CSE-ConnectionGUID: /a+noJ7VRfGCd3lz9UKJQg==
X-CSE-MsgGUID: YH9nC2VtQguJ7l47Yirg2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90242622"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90242622"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 14:37:51 -0700
X-CSE-ConnectionGUID: 72Yl2+uYRUaeM5GUOMjVag==
X-CSE-MsgGUID: 9S6rV7L7S/yqV0I0VbAzwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="278984669"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 14:37:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 14:37:50 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 14:37:50 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 14:37:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TOLe1iCSZEDXDzvHVtZqZSA4Gb1lkzVnHdFF+vxLdodaMvyZljsmuwEgQMoCGNI37V95vLuuGZEaCMLM5H/TBCVgFllhlzSrS0JEEwNe2jPwh+bMDBbWVEJM6O5HTr65WWsoX4atPGurRdImfnBULmvUekOv9sQPUg+09e2QsoQcP3C1p9kWqkU5OBfL0T934Qu2Z3LuBDpg+VEZCBxZp3fx+uzuunnKqQcLQxXBjfZeluzJdWZDdv3fFYXcTh5YlWwgRKMkeQ2wnoU0fTZqMakObD/LYAZ2nzF4rj+bBXYV186v1dAdBoJCi/FpQ4SOVDGHNYdXZhRnceoFUre2cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSeb09pk38kzqnFrrqJaduxkLC9r/3tXPQsyCerw5Us=;
 b=Y5nyJ2pcRYNuHVjnQ9RlWb4EWopjdWYW7FNwmJ3/z8tlyzY7STDXOdrT4tmnGp0DCU8B94/oZP72U4F5gdGg4V70uwN6il5LDGlhMMxyXyz9S3HUFKvhYsS8ELzlqD1IF65Xdt0Q0G+isYPttVguoOXfxolqxBgyLfw4QrdbXsDU9gYBWa8s7Jen3EjOvV1tlvuYUiJSecsqtNRPMRlmG2QPHj2Uyg/yqviiulWTbBgSf9MqPC+9m0554izIMX41rCy43+/6X5O35jtZnsdUo+/rELhTc8g3T1ASdXr8yJlOeoGpghTcPsPeHysXmM5MocIpcFFCcxpyUPXAiq35pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH3PPFC067E5C7D.namprd11.prod.outlook.com (2603:10b6:518:1::d48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 21:37:47 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 21:37:47 +0000
Message-ID: <60ef81bc-fa71-4bce-a6c6-6e3592617800@intel.com>
Date: Mon, 28 Sep 2026 14:37:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/9] x86/resctrl: Parse ACPI ERDT table and save CACD
 cpumask for RMDD domains
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, Hongyu Ning
	<hongyu.ning@linux.intel.com>
References: <cover.1789705667.git.yu.c.chen@intel.com>
 <16e1ac77eb48c5433f16c3a7cefcd4217a19007b.1789705667.git.yu.c.chen@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <16e1ac77eb48c5433f16c3a7cefcd4217a19007b.1789705667.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0153.namprd04.prod.outlook.com
 (2603:10b6:303:85::8) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH3PPFC067E5C7D:EE_
X-MS-Office365-Filtering-Correlation-Id: 05b48b60-5c32-4b5d-8d23-08df1da8bd27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|260925022911599003|3023799007|6133799003|10067099003|260925021911599003|5023799004|260925021311599003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: kfRpBLmrFdR8oQEcVogOfyu3Z8ArFnfog/FbdQlElkXKbd5oYQp4U83Jvw0rJVg1VXdD7F1PvZS3QsCMoO3gHDO9sMFDHLggqnc8ZuA0nCNmyG+G7isidWBpGt/8dKmJfeDP6k7HGmJkJ42TqMmG3mjNNIQuQ55Z7en1G70Bb7EUj31o3Pw4xIspdGKro2102NAKm68TOPRkUyCC5gm0V2Mf+h1ghxm7uXoEE6LVCbIjCkylIeSsBZJZHzEFtVweG9TP3oy+dj1Ak6GajoZm4aimNlRWDaJQX66PkM5i+GPX+2k7IY9toyprpFBbK0ek4kez4Gtb6OamKqbQHogdO9kVTMZhXXeHo2JT4H07oSZ/bQrwb3Odd0smsllkQRSUKnvr8cMWkMMfjrl/r/C3dBkOqArEjcRg8Bb+gD4pVsfxqNzmVUZbAKYkv+rNPAOX9+HsBGQRaAaaFPMygyagsm2tbNQ3xhmQiA6sKsP++k0rDobj1eunMuZizSyzPkOet0wc3N3F17/Ov43HXaknqnpuRUIulXzC4hdA9xr2BXS+mOALugm80ckmsvlWrHzofwRkA4Mutd1ndusLMtYDW4Ahlno91ieu2BADJPTGf5A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(260925022911599003)(3023799007)(6133799003)(10067099003)(260925021911599003)(5023799004)(260925021311599003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?US90VHdDeVlFQ2paNzVkOVdyNEtKdnpSODZmck01OTdpVGRDN3NPbk01WUdE?=
 =?utf-8?B?UWNnbVhjVzdEVWtqQmZXU0U2b21lWVpHWjVmNjVxc2RFNDVOdEVSQUlJV1NK?=
 =?utf-8?B?KzNmVlJUYzgvYWw1TWJxYmdWTXFNWnZTeExVN2g2TnE0VzhEbVRRYlIycFkr?=
 =?utf-8?B?ZUhhY0toc2ZqZ08vZjRJRll5TzU4Y1MrbXpiWEhweVdveWY5YlQyR2dXOXlT?=
 =?utf-8?B?d2kwQTFsRXNjL2JNaXR5cjJPaEU5bEhKTExXeDhzWSsvWXpGVFlSTXhCZXgr?=
 =?utf-8?B?QjMvN0ZCYnc3L0Z4b3Y1UW5pM0JOMEc3OTRib1drTVV0K3h6TURXK3J2dTJX?=
 =?utf-8?B?bTQwdXozTEwzNVFLajBGbWRIbkIyVENWd1l6dVVtZFRBUEFvTVpPZVpheGdH?=
 =?utf-8?B?dUp4TmQ3b1drOTNWTlRJN1VNbHBoZFlsQUlOVkp4U2xHU29rcFBEZHNQcXpt?=
 =?utf-8?B?MEdyeCt5cFdEOEhwNDRXclZhSFVnNGNPL3JLV3JjTDNtRHE3Nytnbnh0OWln?=
 =?utf-8?B?aHR5MFVnVk0xek5BYlAvVUUwWGNRWkMrL2NnZW0rWGxIT1BxekR6OHh1eWtK?=
 =?utf-8?B?dEUxSHlGdThaQzlOWHQyc254YXJNeS9uNW5sSis1dUZJQ1Vjckgya2paTGMy?=
 =?utf-8?B?b0lQTm9HMmVvU0pKWVQ1MjE1NE13TmZQbVBiZEd2a09aNW1oMVRVVkk1N04y?=
 =?utf-8?B?WXdURDNIcHFlbVJBbmdlNS9sQ1R3Z21rK0ZQMHRQa1kzaW52NnlodUg1V0hp?=
 =?utf-8?B?VG5lR2lRTXdzNmFuWkswRG1jVTk5Q0xCdmFtbzk5VkRQMHFmT3RwL1NKVVpt?=
 =?utf-8?B?UUtPWW5LTVMxZk9jM1VZei9nTHcrdDNLbWN6emw4WEFhVndmdHFxUnhTQ3FP?=
 =?utf-8?B?bDRvZTMzNlcwWkJIWHc1RndrZnBsT0QrVGJHME5HOUdMZXBSbmhiOU1KOVlG?=
 =?utf-8?B?N1Y3YnBsZWltMlFYTkdhcmtwT3FNUVBoaEVsRU50eGxSbkVpb01Hak8rWDZu?=
 =?utf-8?B?ZGJCa2w3NVltaVJXV3NIZXdxd1ljZFlUVWIxQm9nRjdpUmt0SXRTSVZUNmhq?=
 =?utf-8?B?Z1NMVVljOE11aGNENzJRSHFsaHhGak1uREllbTAyNGdxNUlYdEJyaVRRUTNI?=
 =?utf-8?B?T0RuVG1UWTc3MUFHSGhseWRaQ1VkczN2ZzVLOHBuaEhVc3BMa2ZGTFUxSHps?=
 =?utf-8?B?TExjOHE5bGEvVHU5N0hrUHNYaGZ4dzNQUkhZZmVwbVRhRVVkRFZtRmF4Y0Ny?=
 =?utf-8?B?UWtWdS8zazNnREkzRDNmTHBRVFVlNXp6S0RVQnYxOEVWSjZoOHRoZzZPbGxC?=
 =?utf-8?B?ZTRWRDE3ZTJ0ZXQyUW1GUWsrOEJkWkxxdDJSY09BMDVNM3R2bGFGZit4SmpU?=
 =?utf-8?B?L1pqNTlsNC9WeHdMb0tRcFlXSlJDbXMwdk1wTDBRVW0wN3dxTHlXSlBVQXJa?=
 =?utf-8?B?Ymtoa3lzTDRCZ1ZwdzJxL045N0hhbHBhb2lJblJmWFpPVTFNUFpHdWlrRkV4?=
 =?utf-8?B?YlJzajBkVTdNbG1hRGhXRTBrNi8vWjlFQ0EzendCM0hIVDQ0TUJ5VTJFZzUr?=
 =?utf-8?B?bGZWdHk3NFc3cFc3OHk1VVhrNGRZNGN6Q0dwZHk5ZGJ3RVQxNHFVZ3pKMWxR?=
 =?utf-8?B?ZlFvT05wL1hXcnU5ellNNTdycnNsSEI2WlJ0Z2JoR1hqeVF6Umw1dDFxand1?=
 =?utf-8?B?Qmd3a05TRkhOeXZnZ21xMGRuUlZxU0ZUa0pWV1daa1c3N0Y5U2M4SW56SXdD?=
 =?utf-8?B?S1kyeDU0eDVpWktCcE84VGRrcGNFZmNRbDVTM2tFWFJuUGRmOUNPZlhrbEo0?=
 =?utf-8?B?MFNVYXkwSUxEaVJqMFdHWFlqNlFLMVo1TWJHak9sSGJxN1paRUw1K3IrbkxM?=
 =?utf-8?B?RUQzQk5vdXBEbG9LRWlPM0dsQTFFQ2xQWGFGVGw5WHV2Z0JzUHNxQ2ZrMk8w?=
 =?utf-8?B?M016czVJVDgyMTgzanVCNHVjZWRrZE56YldHMFdNSDVIQk5rR3M5cW00S3E2?=
 =?utf-8?B?a1NxOUtIcGhYalYyVGxNQzJkeWppVkRJOFZpU3RlbDJtWmZlYS9ZYXp2RnBr?=
 =?utf-8?B?WGI2NVJxS1JPdEI3U1p1Q1daQTR3bVVRdHh6VnArTVFYeVJGT0ZRTkFWUGdz?=
 =?utf-8?B?U05IdFV6R3R3Mktnb09nQTFiM1BhclJ6Y3kwZ09rUjFFR1BxTnE3S2VYdzhH?=
 =?utf-8?B?elZxZFFCcmhkSko2ZjVlYUs1REtiK0ladEE0Y2NZMUZFZEluTElXS3ZHSXAx?=
 =?utf-8?B?S1NTMWtZSWJmUWsyZnBNQkNLWks3MHFtTi9SdkFlajFIZUl5SHVCbWQ4ODVi?=
 =?utf-8?B?bXdvVWRGdmU1OUtWVHYrYm5SRWEyOEhGUEx5SHNub29mYTZEWmRNTkoyZlNV?=
 =?utf-8?Q?3kjlEZY0CQBES/PI=3D?=
X-Exchange-RoutingPolicyChecked: AxiuGpHlw56Gy2gisJPzU8Sj30VOkIBVVMDBpyXAA36FMypU0gI2mK7PuNNkoTOoHJi71GXnAvKQmLoYbNt57bz5EieA3RPuqBQkpnKLtO9moz0GfQy/4gkBSNPQOEWy+M32dbEGUeTRbgzIj7wwUQ/IMWa8rLGdAspOXF+G4Tr6T7axuRS3AKz2ezyjn0kkoWNpGGmy+oy/6JwYTKib/UKGhOfWtODNZqBJRMglbMpKQzosHOmMOwP/EwVC90WwGw1tmaGZjPdKCGWtHitvzTplj5eL3eM2s0iOuOd3CWuXyjvBSc7x5A/L20TteUC2Ojq6AbDNSY3/xTww2IzA6Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b48b60-5c32-4b5d-8d23-08df1da8bd27
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 21:37:47.6737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xj1iZasAly4qcdLFaECEYdHYf0hYOPnJks9ieaFQJbzAChmAd2GMUMo4Uuljk0pFwXVHoaN4DIR0QYSkkdZppYNbVsvqI3MBpN6WvbzySrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFC067E5C7D
X-OriginatorOrg: intel.com

Hi Chenyu,

In subject, "RMDD" stands for "Resource Management Domain Description" so "RMDD domains"
reads as "Domain Description domains". How about (another suggestion later):
	x86/resctrl: Parse ACPI ERDT table and save CACD cpumask per RMD
	
On 9/17/26 9:49 PM, Chen Yu wrote:
> There is one Enhanced RDT (ERDT) ACPI table per platform. Each Resource
> Management Domain Description (RMDD) sub-table within it describes one resource
> management domain (RMD), also known as an L3 domain, and carries MMIO base
> information for monitoring support. The CPU agents within the scope of an RMDD
> are enumerated by their x2APIC IDs in a nested CPU Agent Collection Description
> (CACD) sub-table.
> 
> Parse the RMDD sub-tables within the ERDT ACPI table and their nested CACD
> entries to construct per-domain CPU masks.

Above paragraph can be dropped since it is just duplicate of what follows.

> 
> For each RMDD, parse the associated CACD, map its x2APIC IDs to logical CPUs,
> and save the resulting CPU mask. Associate every ERDT domain with the CPUs that
> belong to it to prepare for attaching ERDT data to resctrl monitoring domains.

The last sentence is the primary motivation for this patch but it feels buried at
the end. The changelog also understates what this patch does with reader learning
about many other changes from comments in the patch. Consider an alternative
changelog below. Please do not just copy and paste but consider how it motivates
(the "why") this work and how it describes the change on a high level with the
patch providing the code details.


  x86/resctrl: Parse ACPI ERDT table and build per-RMD CPU masks

  Enhanced RDT (ERDT) exposes per-domain MMIO registers that resctrl needs
  in order to read hardware monitoring counters on the upcoming MMIO-based
  path. The kernel discovers this hardware through a single per-platform
  ERDT ACPI table.

  Each Resource Management Domain Description (RMDD) sub-table within the
  ERDT table carries the MMIO base of one resource management domain (RMD) and,
  when RMDD_FLAG_CPU_L3_DOMAIN is set, identifies the domain as a CPU-scoped
  L3 monitoring domain. The set of CPUs in the domain is listed by x2APIC ID
  in a nested CPU Agent Collection Description (CACD) sub-table.

  Walk the ERDT table's RMDD sub-tables in preparation for attaching each
  ERDT domain to a resctrl L3 monitoring domain. For each CPU-based L3 RMDD,
  ioremap its control-register region, walk its nested CACD entries,
  translate each x2APIC ID to a logical CPU, and record the result on the
  ERDT domain's erdt_domain_info. Record the largest RMID that is valid
  on every RMDD so a later reader cannot access an RMID that is
  unsupported on some domain, and require every RMDD to advertise the
  same set of sub-table types so downstream code can rely on a uniform
  shape.

> 
> Based on original work from Anil S Keshavamurthy.

This sounds like "Originally-by:" tag per Documentation/process/maintainer-tip.rst ?

> 
> Suggested-by: Tony Luck <tony.luck@intel.com>
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> ---
>  arch/x86/kernel/cpu/resctrl/Makefile   |   1 +
>  arch/x86/kernel/cpu/resctrl/core.c     |  16 +-
>  arch/x86/kernel/cpu/resctrl/erdt.c     | 265 +++++++++++++++++++++++++
>  arch/x86/kernel/cpu/resctrl/internal.h |  29 +++
>  4 files changed, 309 insertions(+), 2 deletions(-)
>  create mode 100644 arch/x86/kernel/cpu/resctrl/erdt.c
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/Makefile b/arch/x86/kernel/cpu/resctrl/Makefile
> index 273ddfa30836..2216ee084832 100644
> --- a/arch/x86/kernel/cpu/resctrl/Makefile
> +++ b/arch/x86/kernel/cpu/resctrl/Makefile
> @@ -2,6 +2,7 @@
>  obj-$(CONFIG_X86_CPU_RESCTRL)		+= core.o rdtgroup.o monitor.o
>  obj-$(CONFIG_X86_CPU_RESCTRL)		+= ctrlmondata.o
>  obj-$(CONFIG_X86_CPU_RESCTRL_INTEL_AET)	+= intel_aet.o
> +obj-$(CONFIG_X86_CPU_RESCTRL)		+= erdt.o

Please keep the CONFIG_X86_CPU_RESCTRL entries grouped together.

>  obj-$(CONFIG_RESCTRL_FS_PSEUDO_LOCK)	+= pseudo_lock.o
>  
>  # To allow define_trace.h's recursive include:
> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> index 55214d6fdc49..54cfdf12dfbb 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -1016,10 +1016,17 @@ static __init void check_quirks(void)
>  
>  static __init bool get_rdt_resources(void)
>  {
> +	bool succeed;

Please use "ret" to match style of get_rdt_alloc_resources() and 
get_rdt_mon_resources().

> +
> +	erdt_init();

Why does erdt_init() have a return value when it is deliberately ignored?

>  	rdt_alloc_capable = get_rdt_alloc_resources();
>  	rdt_mon_capable = get_rdt_mon_resources();
>  
> -	return (rdt_mon_capable || rdt_alloc_capable);
> +	succeed = (rdt_mon_capable || rdt_alloc_capable);
> +	if (!succeed)
> +		erdt_exit();
> +
> +	return succeed;
>  }
>  
>  static __init void rdt_init_res_defs_intel(void)
> @@ -1141,12 +1148,15 @@ static int __init resctrl_arch_late_init(void)
>  				  "x86/resctrl/cat:online:",
>  				  resctrl_arch_online_cpu,
>  				  resctrl_arch_offline_cpu);
> -	if (state < 0)
> +	if (state < 0) {
> +		erdt_exit();
>  		return state;
> +	}
>  
>  	ret = resctrl_init();
>  	if (ret) {
>  		cpuhp_remove_state(state);
> +		erdt_exit();
>  		return ret;
>  	}
>  	rdt_online = state;
> @@ -1169,6 +1179,8 @@ static void __exit resctrl_arch_exit(void)
>  	cpuhp_remove_state(rdt_online);
>  
>  	resctrl_exit();
> +
> +	erdt_exit();
>  }
>  
>  __exitcall(resctrl_arch_exit);
> diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
> new file mode 100644
> index 000000000000..0dfe5eda166c
> --- /dev/null
> +++ b/arch/x86/kernel/cpu/resctrl/erdt.c
> @@ -0,0 +1,265 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Enhanced Resource Director Technology (ERDT)
> + *
> + * Copyright (C) 2026 Intel Corporation
> + *
> + */
> +
> +#define pr_fmt(fmt)     "resctrl: " fmt

The pr_... messages inconsistently also add "ERDT:" prefix. Would adding "ERDT:"
prefix here help?

> +
> +#include <linux/acpi.h>
> +#include <linux/overflow.h>
> +#include <linux/resctrl.h>
> +#include <linux/sizes.h>
> +
> +#include <asm/apic.h>
> +
> +#include "internal.h"
> +
> +static LIST_HEAD(domain_info_list);
> +
> +/* True when the ERDT ACPI table describes at least one domain with at least one CPU. */
> +static bool erdt_enabled;
> +
> +#define ERDT_VALID_VERSION		1

How is "version" different from "revision", which is term used for variable this
is compared against as well as debug message?

> +#define RMDD_FLAG_CPU_L3_DOMAIN		BIT(0)
> +
> +/* Bitmask of valid sub-tables found in the first RMDD, used to ensure all RMDDs match. */
> +static u32 valid_subtbl_mask;
> +
> +/* Domain ID of the first RMDD that established @valid_subtbl_mask, for diagnostics. */
> +static u16 first_rmdd_domain_id;
> +
> +/*
> + * The minimal max-rmid of different domains. Using minimal is to avoid the domain with

If "max-rmid" is intended to refer to the struct member then it should
be grep friendly "max_rmid".

> + * small rmid accessing an invalid rmid.

Please use upper case for acronyms.

> + */
> +static unsigned int erdt_max_rmid;
> +
> +unsigned int erdt_get_max_rmid(void)
> +{
> +	return erdt_max_rmid;
> +}
> +
> +static void __iomem *erdt_ioremap(resource_size_t base, u32 num_pages, const char *desc)
> +{
> +	void __iomem *addr;
> +	unsigned long size;
> +
> +	if (check_mul_overflow(num_pages, SZ_4K, &size))
> +		return NULL;
> +
> +	addr = ioremap(base, size);
> +	if (!addr)
> +		pr_warn(FW_BUG "ERDT: Failed to map %s at phys addr %pa (size: %u pages)\n",
> +			desc, &base, num_pages);

This series introduces a lot ot pr_warn() messages and it looks to me as though some of them
could be triggered multiple times? Could you please consider all these instances and use
appropriate variant based on how frequently it can be triggered? For example, pr_warn_once()
when the same identical message can be triggered by user, pr_warn_ratelimited() when there
are different scenarios needing visibility, leaving pr_warn() for when it is really a one-off
message.

> +
> +	return addr;
> +}
> +
> +static void erdt_iounmap_domain(struct erdt_domain_info *domain)
> +{
> +	for (int i = 0; i < ERDT_MMIO_NUM_TYPES; i++) {
> +		if (domain->base[i]) {
> +			iounmap(domain->base[i]);
> +			domain->base[i] = NULL;
> +		}
> +	}
> +}
> +
> +static void cleanup_one_domain(struct erdt_domain_info *d)
> +{
> +	erdt_iounmap_domain(d);
> +	kfree(d);
> +}
> +
> +/*
> + * Save CACD information for this RMDD:
> + * convert the X2APIC to CPU and save them in a mask.
> + */
> +static __init int cacd_init(struct acpi_subtbl_hdr_16 *subtbl,

What is the use of cacd_init() making an effort to return errno values
when caller does not use return code and all related code use bool?

> +			    struct erdt_domain_info *domain_info)
> +{
> +	struct acpi_erdt_cacd *cacd = (struct acpi_erdt_cacd *)subtbl;
> +	unsigned int num_ids;
> +	int cpu;
> +
> +	if (cacd->header.length < struct_size(cacd, X2APICIDS, 1)) {
> +		pr_warn(FW_BUG "Invalid x2apicid CACD table\n");
> +		return -EIO;
> +	}
> +
> +	num_ids = (cacd->header.length - sizeof(*cacd)) / sizeof(cacd->X2APICIDS[0]);
> +
> +	for (unsigned int i = 0; i < num_ids; i++) {
> +		cpu = topo_lookup_cpuid(cacd->X2APICIDS[i]);
> +		if (cpu < 0) {
> +			pr_warn(FW_BUG "Unknown x2apicid 0x%x\n", cacd->X2APICIDS[i]);
> +			return -EIO;

The Sashiko reported issue looks real to me:
https://sashiko.dev/#/patchset/cover.1789705667.git.yu.c.chen%40intel.com?part=3

Were you able to try the example where system limits the number of processors
via maxcpus= and see if ERDT still works?

> +		}
> +
> +		cpumask_set_cpu(cpu, &domain_info->cpu_mask);
> +	}
> +
> +	return 0;
> +}
> +
> +static inline struct acpi_subtbl_hdr_16 *rmdd_subtbl(struct acpi_erdt_rmdd *rmdd)
> +{
> +	return (void *)rmdd + sizeof(*rmdd);
> +}

Could you please drop this function and instead open code this in parse_rmdd_table() to
match the style of enumerate_erdt_table() that makes the parsing easier to follow?

> +
> +static inline struct acpi_subtbl_hdr_16 *next_subtbl(struct acpi_subtbl_hdr_16 *subtbl)
> +{
> +	return (void *)subtbl + subtbl->length;
> +}
> +
> +static inline bool subtbl_valid(void *end, struct acpi_subtbl_hdr_16 *subtbl)
> +{
> +	/* Ensure the header is within bounds before dereferencing it. */
> +	if ((void *)subtbl + sizeof(*subtbl) > end)
> +		return false;
> +
> +	/* A sub-table must be at least as large as its header. */
> +	if (subtbl->length < sizeof(*subtbl))
> +		return false;
> +
> +	/* The entire sub-table (including body) must fit within the parent. */
> +	if ((void *)subtbl + subtbl->length > end)
> +		return false;
> +
> +	return true;
> +}
> +
> +static __init bool parse_rmdd_table(struct acpi_subtbl_hdr_16 *rmdd_hdr)
> +{
> +	struct acpi_erdt_rmdd *rmdd = (struct acpi_erdt_rmdd *)rmdd_hdr;
> +	struct erdt_domain_info *domain_info;
> +	struct acpi_subtbl_hdr_16 *subtbl;
> +	u32 subtbl_mask = 0;
> +
> +	if (rmdd->header.length < sizeof(*rmdd)) {
> +		pr_warn(FW_BUG "Invalid RMDD length %u bytes\n", rmdd->header.length);
> +		return false;
> +	}
> +
> +	/* Quietly ignore non-CPU-based L3 domains */
> +	if (!(rmdd->flags & RMDD_FLAG_CPU_L3_DOMAIN))
> +		return true;
> +
> +	domain_info = kzalloc_obj(*domain_info, GFP_KERNEL);
> +	if (!domain_info)
> +		return false;
> +
> +	domain_info->dom_id = -1;

Is this "-1" handling contained in this ERDT file? Could it be a named constant to
make its usage easier to find?

> +
> +	domain_info->base[ERDT_MMIO_RMDD_CREG] =
> +		erdt_ioremap(rmdd->creg_base, rmdd->creg_size, "RMDD ctrl base");
> +	if (!domain_info->base[ERDT_MMIO_RMDD_CREG])
> +		goto cleanup;
> +
> +	for (subtbl = rmdd_subtbl(rmdd);
> +	     subtbl_valid((void *)rmdd + rmdd->header.length, subtbl);
> +	     subtbl = next_subtbl(subtbl)) {
> +		switch (subtbl->type) {
> +		/* An RMDD table has one or more CACD sub-table(s) */
> +		case ACPI_ERDT_TYPE_CACD:
> +			if (cacd_init(subtbl, domain_info))
> +				goto cleanup;
> +
> +			subtbl_mask |= BIT(ACPI_ERDT_TYPE_CACD);
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	if (!subtbl_mask)
> +		goto cleanup;
> +
> +	/*
> +	 * Require all RMDDs to support same set of sub-tables
> +	 */
> +	if (!valid_subtbl_mask) {
> +		valid_subtbl_mask = subtbl_mask;
> +		first_rmdd_domain_id = rmdd->domain_id;
> +	} else if (subtbl_mask != valid_subtbl_mask) {
> +		pr_warn(FW_BUG "RMDD %u sub-table set does not match the first RMDD %u\n",
> +			rmdd->domain_id, first_rmdd_domain_id);
> +		goto cleanup;
> +	}
> +
> +	if (!rmdd->max_rmid) {
> +		pr_warn(FW_BUG "Unreasonable RMDD max_rmid %u\n", rmdd->max_rmid);

Is argument needed when the value can only be zero?

> +		goto cleanup;
> +	}
> +
> +	if (!erdt_max_rmid)
> +		erdt_max_rmid = rmdd->max_rmid;
> +	else
> +		erdt_max_rmid = min(erdt_max_rmid, rmdd->max_rmid);
> +
> +	list_add(&domain_info->entry, &domain_info_list);
> +
> +	return true;
> +
> +cleanup:
> +	cleanup_one_domain(domain_info);
> +	return false;
> +}
> +
> +void erdt_exit(void)
> +{
> +	struct erdt_domain_info *d, *tmp;
> +
> +	list_for_each_entry_safe(d, tmp, &domain_info_list, entry) {
> +		list_del(&d->entry);
> +		cleanup_one_domain(d);
> +	}
> +	erdt_enabled = false;
> +	valid_subtbl_mask = 0;
> +	first_rmdd_domain_id = 0;
> +	erdt_max_rmid = 0;
> +}
> +
> +static __init int enumerate_erdt_table(struct acpi_table_header *table_hdr)
> +{
> +	struct acpi_table_erdt *erdt = (struct acpi_table_erdt *)table_hdr;
> +	struct acpi_subtbl_hdr_16 *subtbl;
> +
> +	if (erdt->header.revision != ERDT_VALID_VERSION) {
> +		pr_info("Unsupported ERDT table revision %u (expected %u)\n",
> +			erdt->header.revision, ERDT_VALID_VERSION);
> +		return -EINVAL;
> +	}
> +
> +	if (erdt->header.length < sizeof(*erdt)) {
> +		pr_warn(FW_BUG "ERDT: Invalid table length %u bytes\n", erdt->header.length);
> +		return -EINVAL;
> +	}
> +
> +	for (subtbl = (void *)erdt + sizeof(*erdt);
> +	     subtbl_valid((void *)erdt + erdt->header.length, subtbl);
> +	     subtbl = next_subtbl(subtbl)) {
> +		if (subtbl->type == ACPI_ERDT_TYPE_RMDD &&
> +		    !parse_rmdd_table(subtbl))
> +			goto cleanup;
> +	}
> +
> +	if (list_empty(&domain_info_list))
> +		goto cleanup;
> +
> +	erdt_enabled = true;
> +
> +	return 0;
> +
> +cleanup:
> +	erdt_exit();
> +	return -EINVAL;
> +}
> +
> +int __init erdt_init(void)

Please place the storage class attribute before the return type.

> +{
> +	return acpi_table_parse(ACPI_SIG_ERDT, enumerate_erdt_table);
> +}
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index e3cfa0c10e92..156206088372 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -21,6 +21,31 @@
>  
>  #define RMID_VAL_UNAVAIL		BIT_ULL(62)
>  
> +/*
> + * Index into erdt_domain_info::base[] for each MMIO region.
> + * @ERDT_MMIO_RMDD_CREG: RMDD control register base address
> + */
> +enum erdt_mmio_type {
> +	ERDT_MMIO_RMDD_CREG,
> +	ERDT_MMIO_LAST = ERDT_MMIO_RMDD_CREG
> +};
> +
> +#define ERDT_MMIO_NUM_TYPES	(ERDT_MMIO_LAST + 1)
> +
> +/**
> + * struct erdt_domain_info - Per-domain ERDT information

Since resctrl domains can be of different scope, could this highlight that
it only supports L3 scope? For example, "L3 domain ERDT information"

> + * @base:	Array of ioremapped MMIO region base addresses, indexed by ERDT_MMIO_*
> + * @cpu_mask:	CPUs belonging to this resource management domain
> + * @dom_id:	L3 cache ID shared by all CPUs in this domain (-1 if unset)
> + * @entry:	Links into the global domain_info_list
> + */
> +struct erdt_domain_info {
> +	void __iomem		*base[ERDT_MMIO_NUM_TYPES];
> +	struct cpumask		cpu_mask;
> +	int			dom_id;
> +	struct list_head	entry;
> +};
> +
>  /*
>   * With the above fields in use 62 bits remain in MSR_IA32_QM_CTR for
>   * data to be returned. The counter width is discovered from the hardware
> @@ -253,4 +278,8 @@ static inline void intel_aet_mon_domain_setup(int cpu, int id, struct rdt_resour
>  static inline bool intel_handle_aet_option(bool force_off, char *tok) { return false; }
>  #endif
>  
> +unsigned int erdt_get_max_rmid(void);
> +int erdt_init(void);
> +void erdt_exit(void);
> +
>  #endif /* _ASM_X86_RESCTRL_INTERNAL_H */

Reinette
