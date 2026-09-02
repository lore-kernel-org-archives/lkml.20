Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E819C40EB89
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383772; cv=fail; b=KK0RakaaywWi8aE6njSr7b3RXl7hmfYOH/xQID7A9yK01qGJpweB0VnPVAiJx/QwG/7OWtv3goH0A1zuNPS7yt0+9kyQZ/497nKWoCCWpuwyEavx3ODHZrktl8W5GpWS188Bsadz9OrRxDmLIfHA+AcU5stxGhnOxXchoOKdGfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383772; c=relaxed/simple;
	bh=LyCxkotWnq9ouFHIEM7imEURulMCihR5K++ZQ+G6E0E=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TD2q7yZ36hKm1r7yWRWAVE443cHJ5XYxk3Uv4nw7gBWQVdNlQ5mDscklwJyBVuXMzBB1pCTRoJsK7z2IPqeLy6ovdSmyir0m5COaMLPXnBLpNeGk2WUF3hDB3qM9ATRdffra98FY4/Q+PPnJrkJzUGIiB/DeRo+WTG/CfB0sqtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bjGXPa3S; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjGXPa3S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788383768; x=1819919768;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LyCxkotWnq9ouFHIEM7imEURulMCihR5K++ZQ+G6E0E=;
  b=bjGXPa3SpJppAUL7yKZv0EXhbw7+gZRnF9xutWwoYpJ+LozYywbVeOQ0
   KYWkxqiw9xxmhiTT6i5L/c3G+PUyLn2vAfPHetCp1q/Sc5Tvmh/ZyOyac
   OqqV5kfAVCS39ivFthZzz1ryJrCBSyavJlW+8Rf3GScGzTyZKC8iyMQB3
   PaFf7v3WdAE9Ds3lmSbgdYJ6lUdrOwBFbYV7qbT/MSuxpGV69D6I/sct8
   P1l7yftsxJVDfMoYfEo/R4wgOlav2vDj4kbyAteqnjcnRjtEv/PWPaUvy
   k26Ef68tgKMy7evHHS0jr3tpEPcq1yAlRRheklq3n3cbOfPSMwvOl0hpi
   w==;
X-CSE-ConnectionGUID: 2XD5epJ2TxCMDnC6bdnPXg==
X-CSE-MsgGUID: 9T3It6xBSJW5SkjmJaC29A==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88703337"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88703337"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 14:16:07 -0700
X-CSE-ConnectionGUID: /d8x9qr3SRW3FslYu/okKg==
X-CSE-MsgGUID: hysCpzUaREG4IC3FELRoiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="271484856"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 14:16:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 14:16:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 14:16:06 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 14:16:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTznYIAnOEjBXsYVGyq6q1C8LnArszFc5peB4MCbbgwWd3+Vr/0AFSAov0Az4zOjBCAK86qcF7zzM+ZonUeJoxA7l2iCrW2lS7tOgTAzcl0V2/Eax5odj8o3e1OiKZxr8hzPMl5RjmuMHbfzynwOyJgaqp+BtJuIVMlYaaR56EiObHNNfm213SO8GGyLVsD+4dw3WBPinBBmRJyfP8TUHcr+aAHnzZznGAM6u0MAKITHU9oSDBEYDpurC6uUqUDY4HTNG/ktglGrcl75ayWKR4kKY9LMJ31yQELMkL/Gw3QqyilFsLlp7/yf4UXs71pGs7cLS1MnLhAFNDzgRr6/5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOj58wd+0pkF6MXZAZdWmBSJCPud3lkYqG44t8vP/LE=;
 b=iOXq7okNlrJUtztpRmRg/X9FqFLiuefw2Nk0EsbVXvwjiR3gfVGaPg/2qDdLQF4ecHfxoCZwqjuQ9SUK6XEHLp86LHuAH7+vHqo9KnnSaVcpMfn+sDrgvULPzOvbMow68eVmJF0ZIaQZrnlNHTNB0xRyFvuBX4WwpBSAjIywK2kCMtt+UdknoWNA2CL9O1e4JNU+OquayFAgdpkz9BG3R4Kt2IAPgGQxxX9Dnuhr1RnymVePtUpHW+w9KY26QE6ciQTkhcMUel/qBZEwP5zJF+PnjGMSUm8W4a8e/L4IPRGsJevpiFLRCgO0xveoPxfn8MX02EaFiL1XxsV7srZ/Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 PH7PR11MB8250.namprd11.prod.outlook.com (2603:10b6:510:1a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 21:16:02 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 21:16:02 +0000
Message-ID: <dc72504d-4ea0-436a-9604-51bf55e0cca3@intel.com>
Date: Wed, 2 Sep 2026 14:16:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] selftests/x86: Add a sigframe insufficient
 xstate_size test
To: Andrei Vagin <avagin@google.com>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>
CC: <linux-kernel@vger.kernel.org>, <criu@lists.linux.dev>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, Alexander Mikhalitsyn
	<alexander@mihalicyn.com>, "H. Peter Anvin" <hpa@zytor.com>
References: <20260817042048.1579415-1-avagin@google.com>
 <20260817042048.1579415-9-avagin@google.com>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <20260817042048.1579415-9-avagin@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0151.namprd05.prod.outlook.com
 (2603:10b6:a03:339::6) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|PH7PR11MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aa85554-3adb-4118-5559-08df09376431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014|23010399003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: twLDX5Rn22r2uT8GhNQ1OjbSGOkEKF50rARF+WxrCdOlORIEW4cSqCU7zkUhVFILc1Rhb41sMp1Wzt3HWQREh6HjsYtqMB32HcV2cfvXMw7hK3I6sZy+J/Jc34Si5ARgNDZ71JKe3owGOvN7w3vp2UdMs8azVoIF5RdzLj/UsViSGMmPEIN110cU59WHWyo60ry5vimArVFO8dbMlWN9z4ugqGQ1PzDMOS9o5kur1xge3KCDnoG3pRyefo7JYZM7mT8ajFJAB2kniXlQrBBp2EE1kLZaDlcvr7ikZsU+RwoSVuZ6LogC5In2j13u9InQh5Ag+FsxJZGURQLRZHckn9OUK4ZDi7QDFkege7BsVKNKbAVizqDnRr1Sg6CUr2jFaujLUwVnpZR8UA/VjBTQ24eQc6E3jm3aBfS+CJll30+FRih65Z/R1G4tSgCZlEofNRmgemaach4EMg2NmWc+p+ca1Lqbbn7mc9nFaVPVRZOuMyjyB0+GWnjEVurtMAwogJXwbwuxUXQ+m0vgonYBV0zcte7f6vNsoW5IuH7X6Fw48l3BvlUpP6RC826iSCXgQRgfAV6EdekuA7ZF0wfGHwauzGHDvNN3brw2iFzU3Iyb5xvwOI1xvs60ZaWgp1MNzZsXycpjIRAz1QrZQN/htncGblC7cPr69k1ujk2qQds=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(23010399003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGdabTFxQ2YrNjBqaHZHaWFGR0Q5UUZzcWk3cVpabC9GR0ExaTlLMEtzSkhY?=
 =?utf-8?B?WlNaM0FFa3l4aE5memppMVdFOWdhZlppY0o4UFBVNENrZ3R3aGJoOTZlMkli?=
 =?utf-8?B?TUlHcE15U3loRzNSeHhsbC90ZWw3YUVLd0M3S0lkamswclZLMElWMTBkaFpE?=
 =?utf-8?B?TnFNaGVjOEErVm9IL3VkbHlkTmV3d3VTVmlCQ1hUYW05LzNjNCszeVlIbVR1?=
 =?utf-8?B?WWc1OFphaFFGM3hGWUcvSmNLcWEyMEw3L0dhT1BIaTZyNDVGRkI5QnBqSnBI?=
 =?utf-8?B?aWIwSVF6dVIwOFF6cGVFMTNwZ251dUxHZ3pZcUdzaExodHlxdWJGNlA4MTlG?=
 =?utf-8?B?R21JVXkxYTdlMjd6cjFwRmI4Q1pNMlhMb1lZelAwK01DTHNXb3ZHbzRQMnpW?=
 =?utf-8?B?MjFvSjNIdG1jb1Y5aG9BVkdvWUlIUzkzV3B1V1FTMU5qTDVsTzJDTkRLdjhn?=
 =?utf-8?B?d2M5bUZnNDlFKzZRTnhhdVpyU2dHcGVUMVUyYXI0Snc0Szl6bTBlU3NvWEph?=
 =?utf-8?B?aUtYcTE3L0RxelpnWEkzdjBIOTBYYSt4bW8vd0tIeVcyU0xiTVdrY2ROQTVu?=
 =?utf-8?B?WFdMQXNsWFZUN1BxWmFXSEU0TXVucWJHdW5QYVRtTEQ0dDFhRmpLNEJOcjlM?=
 =?utf-8?B?ODhXbm9zS3JjNTJabTZjVjlGbThGTk9QSlJmN2o1bEJTYTFWanpPTWFSUkpS?=
 =?utf-8?B?ME9BMDRSY09xRURuY2xRMFZpcTFRZFI2V2xSc3dkN2FDQmRsQ3Z0UVhESzNI?=
 =?utf-8?B?Q0g0RmxKcFhIbTNKTjZWWlBXOVhjZTJzaEtYWjlYUzFETVlhNTlVZ1lhcjFm?=
 =?utf-8?B?NFYwZWZ1K0NqMjFoT01ZbEdob2FtNU1DRnlSZjlTVDBCQS9vRmFXeVl0T0Vi?=
 =?utf-8?B?QjNDU2VFcVM3c1VwK1ZmZnVna1R5WjkrMlptTFd4MXVkMnNVWlZWd1NnYWJZ?=
 =?utf-8?B?TjYvUUNoSU5nVFdBc2F6WTJxME5SbS9EVEFMZzBTcDdDbHFjeUtFVmZEeS9S?=
 =?utf-8?B?eDdHUnFDamRESm1Ta3FEQlpXN0NOcDBjNVpUb3Fha2ozOVdTRFcvd2xYc0RV?=
 =?utf-8?B?aXpNdnlwbnJKZDUzSHB3dm85emZaZkVPOHBMUmphNUt5Q1JsNzZkRWpaZTg0?=
 =?utf-8?B?M1EveHlKOVU1OFJRRk1GTG4zVExBT1F1aUpDMndMZmhYdmxkR0pJNXRlK20y?=
 =?utf-8?B?d3FLQ0VPMy9qdWVGbzhRemZ3aDZML1RDWTgwZmg4elVtdEpZQnpXOC9SMW1n?=
 =?utf-8?B?N3pDalAxTktVRmg4T3ptSU9vQWJwY0lMZ1JUU1pZNlB6Znl2VU5jaXVYMXJZ?=
 =?utf-8?B?VzJlY2dwZ3MxSjJ4ZWdkMklPNG9DcXBHamc3UEpBYzZXMGEvRTU2RGFNaXR5?=
 =?utf-8?B?K3QwaU0xNFhxNWZCTVBuVnNuYzdXT0RyeVErQWpBZyt5M0lXWGF3RXN5dkh1?=
 =?utf-8?B?azNNc243dEZPZWJTTTZjTE1zQ3Zpd2MvMm8rYTR4S1hMKzFVa09rbWl1KzB4?=
 =?utf-8?B?M0NpVkltK05xSHNmc3ZncGZTR2M1WjBCVU9RQTFNVEc3UDBBdG94K0tJMUlx?=
 =?utf-8?B?UHEzd0VuREwxOGJHWDVWRS9aK1VRR2dPUEcrTDdvV1ZrNEQvQ2NIaTlLd2hh?=
 =?utf-8?B?Wjk0c3VJMUYvVUxlelZ5UTVPdVYxa3hDVHpieDZyV1pNWDlGTjZZK25QT0c1?=
 =?utf-8?B?NEdySXFiaUt3MFQyeEpYd3lBak1CMCtwRDh4SUY5cFdLRWFaNFJMcXBITGE1?=
 =?utf-8?B?Y1lwdjRjT2JaejYydHZzTWRER3JsWnppdW9KZnk4TjZPTFJjb2Q2ay9BU0Fi?=
 =?utf-8?B?S2JmVERzbHBJUGo4TURCdU5ZUUxVbzhJZHJvNUNjZkpJaEdkWElCbEVSOE9C?=
 =?utf-8?B?T3c3RHRIZFUrR0FLd1B2Ujk4eEl6L3NHV3BDQW1sc1BkNE1rVlpLMWtKMmV5?=
 =?utf-8?B?b0cxeDZBR1c1QlZVL2pJblcrWDRDV0x5TnN3VzFDYThSeElVaUlaS3F2UWJm?=
 =?utf-8?B?alYyeGlLN3U5S0tCbzJ6VllzUXkzM1NaTXpEZ0pGMTZoMDJIdGJ0TWRDdVhD?=
 =?utf-8?B?c0hEa2IwK3c3VFVRU21pOXl5TEVOTldJcTBxSFJrWjhQZFVsbEpGQjJGcUp1?=
 =?utf-8?B?NEJrRUxFK2J3WEc1TzhlMi9wSDF5eW1LajhEUWhwalV6Sm1uMStQVXhHRG5n?=
 =?utf-8?B?MTc5VHk2cGpHQzkvTjArQzdYNHFhUFByV2RRRDcvR1pQcVk1MEx3b2lGMkM0?=
 =?utf-8?B?Y1ZXWENhQS9ySzNwVk40SCtIV3BVaXhiZlRjYXpOZXZUSllUazdyUk8wT2tp?=
 =?utf-8?B?MHJqSVQvZVYxOXMxeGcvRGxxcmQyZ0dwQU1rTDdYNEpHWUVsRzJ6UT09?=
X-Exchange-RoutingPolicyChecked: qKKzQK4gC2KHOpqGOm/rJUA82D5i3J50pwBqFLQYJQ+Km+9EWi4OVb4G+2fd1D574c3ZYDUJYD5rb/TJeiKLMT1ZOHy+uBufsh93pp84Zi7jNFp+ouEvD1fwq758vYXFhlQcfbrynL3CbAI3ysAwY1c94R1nCZtbSq4PAajelyLaZPbDDb3pssbbPiW5pMJDNMN7S4U0WS4mvhPnGaqJL74dXMN6E6i/CPUbA0EwcIwMqwvydbIAs6w3T5rBPwbCfhkjS0BZ0YYTPM0EgUeNiWaq2r3xwZJW5ImtR+f/jlyqVh02oDbmVzji9e5z8hJCeDq1BBZmIInQCl9jsYbNnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa85554-3adb-4118-5559-08df09376431
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 21:16:02.0411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tiLtOPHXUhDhp1Zd6hnrPjneE1i/o7ym0utI5OCX7uA+RwLSboU0lhow0RGzcHH7Oaf04rLExQu3NmdsflStG1I6fqXyWDdM8kX4imi3BVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8250
X-OriginatorOrg: intel.com

On 8/16/2026 9:20 PM, Andrei Vagin wrote:
>   
>   /*
> - * This test verifies the FPU portability of the signal frame.
> - * It verifies that the kernel correctly restores the xstate context even
> - * if the frame size has been manually reduced (shrunk), as long as the
> - * FP_XSTATE_MAGIC2 marker is correctly placed.
> + * This test verifies the FPU portability and consistency of the signal frame.
> + *
> + * - test_shrunk_xstate_size:
> + *   Verifies that the kernel restores state from a frame with xstate_size
> + *   shrunk to only include active features.
> + *
> + * - test_insufficient_xstate_size:
> + *   Verifies that the kernel rejects a frame if xstate_size is too small for
> + *   the features enabled in xfeatures.
>    */

...


> +static void handle_insufficient_xstate_size(int sig, siginfo_t *si, void *ucp)
> +{
> +	ucontext_t *uc = ucp;
> +	void *fp = uc->uc_mcontext.fpregs;
> +	struct _fpx_sw_bytes *sw;
> +
> +	if (!fp) {
> +		sig_print("fpregs is NULL\n");
> +		return;
> +	}
> +
> +	sw = get_fpx_sw_bytes(fp);
> +	if (sw->magic1 != FP_XSTATE_MAGIC1) {
> +		sig_print("magic1 is not valid\n");
> +		return;
> +	}
> +
> +	/* The origin frame contains an AVX state. */
> +	sw->xstate_size = XSTATE_SSE_ONLY_SIZE;
> +
> +	*(uint32_t *)(fp + sw->xstate_size) = FP_XSTATE_MAGIC2;
> +}

I think one of the main differences between the two tests is whether
sw->xstate_size is updated with a valid value or not. If that's the 
essential piece to differentiate them, would it better to highlight the 
delta in code?

Right now, they look like two tests that validate orthogonal behaviors 
at glance.

Thanks,
Chang
