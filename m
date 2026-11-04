Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793783668;
	b=BQSH85ZMZHZ8wBlZSxmEiwRSUiW9q8JMqR9lqoy5W7Y0SB1zcchf+Dm3dOOPSSzh52S6
	 r2ueCxMjAQuWq3EUG9UdAKgq2Tu1Lv1O2o6TRd09OC3LbuaQ9PvmSNH+Xq0hgcOpKSI5P
	 OFk5uuIceKNi5BxZMgch+hN3uh7VIcxISMoHIXXqds0ss0e4yJ0DFoB6N5IhV/a+lb6hq
	 VleRctCzOs6fyuI3t7+cRLL1sKgQ5EYh3bFuTam4w8Tk5Us8LcArwbwFQ4FRdE/CKg4oi
	 jIPhLCnLrgHYUlM/mRBRlTx8Jmx15cvoiHCuLDLFmmE0PwzVy9h1LVap/9a/00043sg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783668;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=gShm6OuH/0+FdG/T5JYIgeqc7KYY35hac3OMh+tZ28k=;
	b=IZT0zyhpph5hIoyVeQuy0Pz462xpsyawQv3EbLtRIeMEU//9gwnC0Sxt8pag4NwsWltJ
	 F/4/bz22OlqRSiiwt5Pzx4PfrsNoRjQwgKRPCSBrpLOisX5AHDEtqmvCdG7nAKjwoAO8D
	 rjqCYfPlMOytzgzE0z4V6W8X/ePMuEvq9GksF2UDo7Ihdb+WCRxbzSBBN/WC6dFRLHBE1
	 yXdvTMkQccrlhlIoAAybozBJfZTncy3wZ8kcb7ACRYyOWtVdEGNM1gekVsvjkhhh5t+al
	 mPFqDBIKuuUtG/gV1e0yeB6srr4ZCocV1JymcOcBOsb/w6iXBeAjFk6xoRAn7Y5td5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PeRSmd9Z;
	arc=fail smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98958606A31B;
	Wed,  4 Nov 2026 09:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98958606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PeRSmd9Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793783668; x=1825319668;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bhfj8V/39eoANEOvZY+YRHntels5LgYA2/9bYaHFPN0=;
  b=PeRSmd9Z6Lq9j8t8qSOjlWN7ToLjIju/Is3/eLg29HEjE8lkvPTLyh1U
   1P5bi/vy2glfm1Hpld+JShGE2QQN5QCAZHBO0VYbebkX18IsxzFDi6Qaj
   Fi7eWk+95n0lUsAIQf8BkhLb7NHJXX5PQeK8AAsrCHefU5sduJGbH5oDT
   qO3wn2mgs5k9IQuw55+P8TxrXepZcJyrPgBpxasnvIhORmQ4OeEvCD4GG
   MieI+vRdR1lqW7nVb2jpMphHtz77a0W/TD08/LDfZUkeCnvxTbTh+KZvA
   jxvjO2Z+Hhsl7VNUonHuNsIW5ME+hdBD2xHPSuPkwVqdECjY1DWm/PTKI
   Q==;
X-CSE-ConnectionGUID: 2HNmFlJBQieDp2beAcKFwQ==
X-CSE-MsgGUID: DgtkeiQNRTCpPRPjtfIk3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2407369"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2407369"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 01:14:19 -0800
X-CSE-ConnectionGUID: RLBkD/LKRtCm9W3s7+BCaw==
X-CSE-MsgGUID: zsXONZ/hTZmXaRkkrsRxtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="8442904"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 01:14:18 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 01:14:18 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 01:14:18 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 01:14:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxfG5IEUQ8aAomDd8vlmLpfVw1hf5iZTcl8ao/gKD7tDSSSwc4ahT78lCTqYVCzRh9VAuEdLC5fe6Jfr3/SEjPsD7G8lxdoMB7gY3Vtqwq9j47d8lQDxQKEOj4fr2/HZO9fq3Uo10Qp8rN9hqlXqMxxRa0uvABHcXabN5JSxMkrEtioGCjhEBSO9XYOgGpklfzuTRP4EMy8i4Mq4FgQnlW9iHrVcrhsWRo8AvvhwhlpLf1lgHbB8CjE4rQm/N1oxkgL1Al77iOnyCkesOLyEnH9MRfh+KxrHW3YGZ7ZEdibf8QcvxslUguLp12n6f+FRkQPnAslUPqF5+BuM9semRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gShm6OuH/0+FdG/T5JYIgeqc7KYY35hac3OMh+tZ28k=;
 b=DU8GcLC+MjSHMRr+yzXjB4XgkrT95vbt+wxCAkpAnRvgTJjeBmfw33TOdjSPx4Cr8i4JsPDuS8Jv2LznLNWOvR+QCPkLF7ZFwz4VKqkKv1u2Eu+NUNedVVIqDQZYf7Yzi5OWp1G3e9jrZdSfHdN7We+fCQRzXcs9bTo3VI5KLgPVbeHq8oXMn+iupk83WXeoBRtocmDPdR7jKjMDpKj3pYxszWXtl9msyvgAHszlzg4t17LVKei1Eg3kcWhqmmEc1iefLKqQhzZNlL3oqO/PUjMvIFXjzTROgZOCDZuHvYaM7zf+T/I9Sl+f0wkOJCnh6XfDuKnngLF7p537c9FR1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 by CO1PR11MB5058.namprd11.prod.outlook.com (2603:10b6:303:99::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 09:14:16 +0000
Received: from PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086]) by PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 09:14:15 +0000
Message-ID: <9da94716-4dde-4389-9574-12f90b52e05a@intel.com>
Date: Wed, 4 Nov 2026 10:14:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] ASoC: Intel: avs: Soundwire support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	<linux-sound@vger.kernel.org>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-kernel@vger.kernel.org>, <vkoul@kernel.org>,
	<yung-chuan.liao@linux.intel.com>
References: <20261103134958.2089136-1-cezary.rojewski@intel.com>
 <bcfe64de-359c-4f16-9014-5d6f8bf30c40@linux.dev>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <bcfe64de-359c-4f16-9014-5d6f8bf30c40@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::14) To PH0PR11MB4952.namprd11.prod.outlook.com
 (2603:10b6:510:40::15)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4952:EE_|CO1PR11MB5058:EE_
X-MS-Office365-Filtering-Correlation-Id: faf41770-2d82-4e57-1061-08df3a53ff78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|22082099003|18002099003|56012099006|11063799006|4143699003|261022105027099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: NYKPBDWjeMqq+GYhm2SCEiiO2y11BqLerl8y8NfBrdbPebyXnkqqfDT7DE2SZF3aimzzK4ngY8NWcjQHbfuw+ohMHX2n/uKM8YmZrplOBRGjlZk5MMV09/lw6tobvXiApBYGFmgQWrqCepgqq9YR+uF0kIpFjlzVVorFc1NMRM/ejAm1Ad0iNnoF8u0cX/S6nMGDQHfsthJkESQoxx0sKlbQ+pi7c5juoFIcwIlwF4LsVzWNxS0gqqtVXvF+25hAhmFZ2va/j7eBLrZ8CN+g8kwFv/SWq5ipGzsLG3rD0YEtaleFTiwBkAHbkFYURFRfQ3arocnaVwsu1YQx5lKN2G0LoYyJvATdstA+mFazFOpu1JPQAZp43hgtk8oi86h/yfofRCv0YFcztq8WMSPnFf0p9epckCcWdxXUUsIPk8dmNOYoMmyyx4N9nIxy7iuttgy1PuqLtaqfdWLOfp1rHA+NsBohajmPCubM3vkZIFHw8q0hiIrXN5Loq2hTRrvqQj5K2dcTDLCMWwt112oHb0oFwra46AHdS11lLe++MVVVKR/4jmgeG7zZcDQnY+NvmJOYG+VvUllzyUdL6Gd39jfj7pPaVjxx6QkHnYzywxGNUbrEHguQovaYQiJXPdvCVJlwwzUF8ZLSAaVEHEsjMQDmbN/8HPX59Azj52Sz2Q4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4952.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261022105027099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEhnU2NGWFAvczJLakpGa2JNdU85Vkd3MGFBQTVTUEQrTXlab2t5RytYMzZo?=
 =?utf-8?B?STUyaHdabCtyNWI1RkE4NHc4akVpZXJsNU1Sc3dLWkxUTmgrSHFiY1ZXd3k4?=
 =?utf-8?B?ZWpDbDlWOW9ncEExNlp1RUd6ZDVGdjlyekVuZGR1N09ZUU8xSGlrT2o0TnVZ?=
 =?utf-8?B?VjFEVDIwN3NUd0twbmZudjhzM0VlU1ZobmJ0V1JCVEh4Lzg0ZUdXdVhLVHAv?=
 =?utf-8?B?NkpTRkpDdFFJQmJsd3YwR3ZILy85M0Q4SEt3eTJCc2sveU1HTXRqbkRpWTZx?=
 =?utf-8?B?UGZHUWwrSTNxM0RTVWp1eDFYZ2pEeGRRMURpNHBZN0lDVlFaNGd3OWlkckpk?=
 =?utf-8?B?K1hJaFA0MmdKRWVXNnloSVJteFcyM3BLSVVDNmJkRGRiVndIR013NWFYeGNS?=
 =?utf-8?B?NTByaFpqWHlmVkJtbWVzMTBoTnRGMXlVdGc1TzRNMzJEVllFV0FWbE90a2g1?=
 =?utf-8?B?OEZGVnUvK2xXRElHVlk2ZnkycEFoYVg3UE0wYnNwZzRMMVEybERZWS9ndTYz?=
 =?utf-8?B?RFJmdlF6S2tOS3k3bFJ3K1IrWEdWQ2JWakpndWNkMmFqSjNuZ2kwM3Rwblhq?=
 =?utf-8?B?bWluejN0cU9URHpNY1dpbFZKK2UrY2NqNkZBRVM1Ym1NUTF1U045Y3ArZ0NN?=
 =?utf-8?B?aHk2ckloWkc0VjhwUHMrbVZxTHNidlRvNkN6Q05qbytEWStlUnJLSExPL29i?=
 =?utf-8?B?Qm5tS2FvVVZidlViWWNMV1pRTkQ3dVZwYnZPYm9ZK3NqYm95YytJcjkvK2ln?=
 =?utf-8?B?aEhDeUIyWlFWWjFPcHI2SW1qbVk5RllGVkVsZVRiZE9DNVNoQkZIbTQzUk00?=
 =?utf-8?B?TGNHendtQVUwTW9FUkFtQktjUXdpWVVVL0R3R3BaVFlTa2ZHU3l3NHhTajRY?=
 =?utf-8?B?c2JLeGREblhmeEQzbkxRcHViaE50eXQwRmc4T1pQQmpJcEZVbTdkQllnMk05?=
 =?utf-8?B?L21tWkxWa2JWQWZiNSs3dDdRVEtxdDE3L1dTME90SFp4ZG9ocm1kdGc5WFRV?=
 =?utf-8?B?Zk14cStHTktqK0tIQ2owUjlVNmVGeUpKRnhpR3MzUHZwRWc3NklGVDMzeWtI?=
 =?utf-8?B?NlRwYTlDSmNmTlpNSG45c3Z4QTV2MnZ1NXdEZ0g3WGRNVFpOOSt5cWJGU1g3?=
 =?utf-8?B?aFMwcHZtSHpVYlR5UlN4dkp1V3A3Wm5OcXMyZlpNQ0tQQUtTVEZPUFEybG04?=
 =?utf-8?B?eG1nMkg3d3RraUZOYUhxQnNEUlVQMzBpWW9wT1JYdnhENmNBSVM3NnBoajds?=
 =?utf-8?B?L0NrOGFnRFZCd1F0ejVVR29ZWEY1QmpDSTluczJxK1NLZm8ydlRJZmxINzVT?=
 =?utf-8?B?OTU1TUJ5YUtGK2E1ekpMa0xxc3V4eFFQdE4vZnNGOXN4czRPejQrT0Rra1dD?=
 =?utf-8?B?aHUvbllKa1dqWEQvV1BnMC9XSC9ublQ4c0IwZkJSLzQrbHRCVkg0TXh6cmRP?=
 =?utf-8?B?QlEwWUpEZTJyMHpGcUphUjMvaXFlbDZ2RVBlYUVXdzg4M0hkWi80Y0l3aDZI?=
 =?utf-8?B?TnhCRHJ5dEFLekxRUHdYaTMrL3puNnJjb0tvaWE3YUczamJmL0hrQ0tmeC9Z?=
 =?utf-8?B?OVh6NUkzN0FKVEdGb2d5UXphMi9ESU85S1VHdDFOc3E3cm0wVitiUFhsSC93?=
 =?utf-8?B?RnJhMjc4NzVlcnBhR0ZjMzR1R1dDbVo4YnUyWkU3QWFlZkVHTy84Q3VkdFRB?=
 =?utf-8?B?eTdxRWxVOWdSTWk4M0R0ZkpvaDk4MnNVcjRnNWIza3dWNFlDNnV6YkR0MUNy?=
 =?utf-8?B?TlliaWt2VUVmY2lZaHNLN0JsNldpK3NYcHpZUXlYZEtmaHEwNWdtYUg0SmpM?=
 =?utf-8?B?c2F3VFdZbWRIY3l1SmVPYTl3SFJ2ZjR3UGk5SjhZczJhWXR0RldIckZDWDN6?=
 =?utf-8?B?YmtGci9ZZkpMb1hZVXVDTkZ3REVXZEZleG1kdjYzdzdFTktaK3F4RGZFd0Ru?=
 =?utf-8?B?bGpJTWN6S3hCeWdMUW9hNEFjZlBsU201TXBXeTNvd3FsUC91MXNSMmVzOWpM?=
 =?utf-8?B?Y0xDZmZ5b1FhY0M3Q0VyaWNwblpDOEZEdHdPd1VQN09FTEdRemdyT2pLL1Rp?=
 =?utf-8?B?ZGNmWVMrTSthL2lFVXZxVEgxa0tGejZ2L0RHYjF2SjN4M2VVOTJsQjNOa3pL?=
 =?utf-8?B?NVprSExtcDJqMzBBMEN0MmVRUTh1YVMwTnQxT04ybE1ESk5MaDEvSUw1dy9o?=
 =?utf-8?B?SkltVlVLaG1RSnJiWDZxeWxSNzlFV3dkdHdGU2luYVdwY1kvR1ZReFFaRmFi?=
 =?utf-8?B?UjZNRG5JQ0lLNEVsdi8zRG1LVzUrZk1nRXhYVFRYVUQ2bzU1NktvMXhzV0Nq?=
 =?utf-8?B?TnhIZmkvZWNIYU9iVXpXZkZCSEFpb2ZUbGlBc2tPU1JqV1JUZllmZ0tRRmhU?=
 =?utf-8?Q?IthHc57cZxab00f0=3D?=
X-Exchange-RoutingPolicyChecked: 2LTxfbH+4NP4XWLRha2QtqiQ7x+/lJmQHN0XI7VIR2kzAea8W/Vbc826BHF99mEn7Dg1Y0MBiYNabuTo17iu3a0sqfiTngICLwXAxueNEXt/dBsh7fA4KlA6FIMpjLLyBW0+wSmywzYDcpgx2lcybOWVy1Mx5BsNA3K1TO6jJAHEMFzoNCiTlrihJiMUUQ7df/N7/A1GVDaNYXzNDe1O7hI7iC0IUK/jNgOpIUoqR36TDjHPr0pVqPWzwMwarmhFxvV3Qn9/8aaWv1LnSFTW2UASCxn7MSlJtqfNp7CvuybWAtNem+jbGGWJRDdJlqFrxeR7tZSqMAVpOohNPpTNqg==
X-MS-Exchange-CrossTenant-Network-Message-Id: faf41770-2d82-4e57-1061-08df3a53ff78
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 09:14:15.5002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0RVVsLHYMMeIacgkR6Rz017+KwPDQUpOt8hbdVuL3MXZ5uSEQYZeJvyTEcKgmNf45XpQ1SD5kdX9EjxsxQxbBVAgSixhYOLBHaZXmESxdeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5058
X-OriginatorOrg: intel.com

On 11/3/2026 6:20 PM, Pierre-Louis Bossart wrote:
> 
>> Also, the existing code fetches the PDIs based on pre-defined "dai_id".
>> That's not the case for the avs-driver.  It simply asks: "is any PDI
>> free?" and assigns it for the substream if one is found.
>> No predefining.  Again, this aligns with how HDAudio streaming is done.
> Yeah but at the end of the day there's a 1:1 mapping between cpu_dai and
> PDI, no?
> 
> All PDIs are created equal, a dynamic mapping doesn't make things more
> efficient. It just makes things more complex to debug since you don't
> have a fixed mapping between dailinks/stream/cpu_dai/PDI.
> 
> Put differently, couldn't the AVS driver work around that fixed mapping
> to avoid changes to legacy platforms that have shipped many moons ago?

Kind disagree on the debugging part.  Having SDW streaming follow
closely to what is done for HDAudio from the beginning (no hardcodes)
makes it easier for a developer to debug stuff.  OTOH if one of these
two follows a completely different path, the developer has to have such
hardcodes in mind when debugging the PCM code or even when looking at
the topology.

At the same time, I'm not going anywhere and I do intend to work with
Peter and Kai to update the common code. Simply put, such a refactor
would be routed through SOF GH first.


Kind regards,
Czarek
