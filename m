Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BDF3C0A11;
	Wed, 16 Sep 2026 05:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789535557; cv=fail; b=Wrapujen2HQ7sNyr/HWZry0siXYuDg0YIzk52QgiUCHwm4aNg8wYKTJU5DPCHDzBbEF24Gj2unFX0QdvfnrB0zCaZrCgPHChzFIbFUJs8Kutpm7aPoFx/MViEuMu8MZ5W90w7wyXmzJp4Dy0Qn9PBq4zXc/A5KzTuQR3GSnFxuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789535557; c=relaxed/simple;
	bh=RqhdQMkwtMcf5ITwXtcv4FqjB6rWXFdsWaonJHSFLYM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L1OyAa3FQ1Xm3ZTwD/lzXqDP40goJNnn1NtgUO4HQD+QRbNe7tSSe1/CHUHpDkBOQdJk8UsU65wXvuUZufel3UreKuCUR4sZynfcViTpc3CQqcMLgfxz2FCMFQ+WiEV/lc27mHWqAHNUdydCJOXudc6twgmv0RO27S5rOWmGJzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fNF6wIHY; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fNF6wIHY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789535555; x=1821071555;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RqhdQMkwtMcf5ITwXtcv4FqjB6rWXFdsWaonJHSFLYM=;
  b=fNF6wIHYEXaCi7BbO8EtYDHOHHgm01Gs6iXqRHjNymOiaDwBFYvB2E2Z
   km6NyjG6PM6oyH88MfZHIojZivqduBCYlkzs/I4sEXEzHqnR4dffoEAoF
   DsHbXkSOAhA7CWJynxp761KIwLpGFxpfy5OS+zRCzelCB55LQujPNqTSu
   UVI9WGNjszQvx3T1q1GyltOKBEkI2n073EmaLPa9COYLD2Yra2Bg/Ov4n
   d/aFNNcp62l0rtGBJdzSAO7XrpuOo6KDjn2jsgZH/Dov+rXzuoVw7kylZ
   ujaRSG4auody5oz69QsZUhFbDsnhyUhAAbL8HvGi6xlbXay57svyRhwVr
   g==;
X-CSE-ConnectionGUID: yFNJFa/RTsODzc6I/sqeTA==
X-CSE-MsgGUID: h9/UdajvTgqpbIAPdNoeDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89749802"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89749802"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:12:34 -0700
X-CSE-ConnectionGUID: Tj3Cfg6mSLigxDwJ5xgtuA==
X-CSE-MsgGUID: z+xAoltNRva9Io43+NfWeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269541116"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:12:33 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:12:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 22:12:33 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.38)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:12:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYV5qfRWG7qbRnatZf1OXPmgGEsJJwZgCrX4PVMXjIpLfcQTjFKONgtqTL5S24zyErZgKJQPSixWdbwH02tSY2BjChaAg/tAgRju1M4l6lySrXrhHXeYMYgquN5ImyZyCgIwbXXMEqmyvkN89IIm8MLmneOHZfRNur2omM+dnC3gF/rTM0rVNKio3xTXvNdmkQirbpqs86eJQVZSEPFFsbTvA6gRhjwSYlZpXXvb3eIZqxW53wqaRmtDHwUtRiZ7GzUb48vZw39JjX+xp9oponbjcbSQ6W9SJ7J7pioErnObereEuj6EJtWRD0JgPvHFlZyucgbU84iBqfX4x7IEAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wz+a+hKOPw3VDXnFH11vz+GsfPKXmENaejcB/THiCYo=;
 b=uKN5h4GnwlDeesKBy5SdEE7w2n9miBpQ/phzOBANLRfLQ9tDkU2MJB2xLCn4xxntL5L2ZnfM5ttVg76+gWveMBLqm1kH19mEgswimUD4+8bxAFMUEdZggB0l3G8t2b1l8cmx/1HhALFaNqmteRviUbqCNr7hgS2mH2n29QZg09/S50/6f00h62ZHijfFUj1zvmgTcOn+PXmQzl92R8T0zm/jArpy9/R5j1rgWZnkFOxkNlg2DA7ka/4imiGdNMe3z5I5NAp86md6YTyyRw8bBcoXGZ6rwzWBDzOdouhGqU+QjHWDLm+HTy6R2tUE/V3GzW3LU095WplDPKGNgkC2dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH9PR11MB106777.namprd11.prod.outlook.com (2603:10b6:510:415::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 05:12:25 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 05:12:25 +0000
Message-ID: <0b4f2242-c22f-4557-99cc-ff622be9ee2c@intel.com>
Date: Tue, 15 Sep 2026 22:12:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/16] x86/cpufeatures: Support Privilege Level Zero
 Association (PLZA)
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
 <1e7f4c3b0cb570f6e501a01d361745b180271f30.1787772750.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <1e7f4c3b0cb570f6e501a01d361745b180271f30.1787772750.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:303:dc::8) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH9PR11MB106777:EE_
X-MS-Office365-Filtering-Correlation-Id: 2304c01a-5ce1-4f92-171b-08df13b1180d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|7416014|1800799024|11063799006|56012099006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: buSmB/dWTzNyee1t4eSGpCF8L473O5NCMvftOWeoyb5XNFq8A1J7OqrmHBLsdJ60NKIqeHPhGE8dGwW8ll1qKqHyVa5cOal/65nSMNlEVyFqtB/k32BUgIBlJwnlTRNqL5Wh2NMt2OFM55BOF5hC2kqHYjcqAFfZx94T6/aP8qwEAAUik2RW5DVT6dPp2n7KL5clJUhE5Vh7WEuqPQWOP2Pgh/IGRe/ZZJ+qhdd9HWgKEphpNYUacZXLf7AILGj1s/Q3rVWtydgDbFqTXvIqdIjIqevH+VkbBH3iZ3erpGrjAjR55kFYdFc291sLLtiz05go/2nvODNL5q0SSpMIb7i12J8tgozrHK20crkPCykesqTVXWPA+6ORyqZ0VbimOahhQDX3jfZjJKukSQxJHM1wUGHBVLyvOQjHt784XXJMEWbziksoNL//fpDABi710qcXtH9QI+BfB7EP9GxPKSKGA8rsaZiIW9aYOrxKDzc4BOl32PXv1EcA99oM9Z5vjBr3FmUrLBro3Fl9ACt0B1seEZjKjlH58t9wjsJG37NKK0U8zQZ0bleiLMCLU9vQhCAbTmDKTXuBm6SFmaJVIIkksTnAdiRQOJ5z1GpfWG19BbP0CIWTiWqhkpfBfes7K6d0qY0oQ8f6RH1qWjkLuy7/jazzKyapm1kn7T3TiEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(7416014)(1800799024)(11063799006)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGE5cjVuWnR3NTlNakxobHowNHlhNlpSc1ZWZjFJdXl5eGZtOEQ3ckM3Mzhr?=
 =?utf-8?B?alpXc0R5blJWd1A0cjBwTHR6QWtNY0dZRW1mck91RGY5YnZpQlUzNmdnNGZE?=
 =?utf-8?B?OUwrY0poWEMvOXJZb2ZzeExXK1FraERNT21uNWdFaHhPdTRDcnY0ejhjVXhW?=
 =?utf-8?B?aCtaamRTVjlvZmxES3hURmxWb01iS0tCTVc1M1pDeThTZlhMaTlFa2I2T1dS?=
 =?utf-8?B?UFpuem5HSVBKTTNjaGFJZm0xNU1mOVBYYVVWMGNMZ09ib2M0SXBRMHZkbkha?=
 =?utf-8?B?SWtIU0wxQzlZVXVyNTlieDY1d3hwNWNuYlRmVW5jSEpjTmRQMUtrdE5NZEdJ?=
 =?utf-8?B?KzRpaWdDczN0TTlPYzRuRnRpMzlpaG12YXFXR0dwempZaDAwMEtOSjdMZHdq?=
 =?utf-8?B?OEIrNFFFMXlpTHZONXZHdTFuOEYrYy9CMDdOOWhUVUYxNzBNekFQWWU2elZR?=
 =?utf-8?B?eTJOVlJPWDFiK1RPa3lDMi9kQ2ZkL1UzeE0yRmVOMDJuVnd3R3RYTUE1N0l1?=
 =?utf-8?B?M2Q4cS9KSDNyYS8yKzA3NytMMGllYXdTVVQreVZUNzFFUWJaM2pCR3loU1R4?=
 =?utf-8?B?WC8wK3R1TmsxUjVCY3JJMTVFdDRwVjB6MEZJd2hPRFBqKzRTRHRHZVpUT2wv?=
 =?utf-8?B?b1JqelRSaDNGM09rQVhrZTlKZmdiWlNJQTlBY1NuQ0VzQkpMelpSWjBZTS9B?=
 =?utf-8?B?dGJxdyt2MklMMkRhenhpUDEwU0FnZHVUU3ltZHpxaUFTRldvTjFKNmg3ZDFB?=
 =?utf-8?B?U2JZSGVaaUdJaStjU3JtVEYranJLalZlVVBSOVZQNHhIb1NHRVFZL0Zad2t6?=
 =?utf-8?B?RUZ3Z3NTdndiZTVHY3lnajlKKzVYSTd4OEtLZkwxVmZuVFB4ZWlVeTRWV1pI?=
 =?utf-8?B?a1NUanp2RmVCL2dWMkVZSUNzUkEzU2FhQlcrOGtzeDQ5c3k1a3FlSlRNOUJP?=
 =?utf-8?B?eVptUExBemFVL2JqNFV2T2lobzNzNXkzQmZSUitsOWZDVm1veDE2TlhBeGtY?=
 =?utf-8?B?WEVtVUVkc0hZWk1lMzJOd3ZBSlZIbzhUdFdBNDQydGx1NVF6WnRDOVNBUFI2?=
 =?utf-8?B?S2ZCcHhhSklESzFpVTFkU2NiTkxtMVBlMkU4Qm5Ld2NqUVR2akZtbkZPbU9C?=
 =?utf-8?B?MXh6QUwvNitYTHdVTEtST2VFSXREQzZCbXVMNHpPTkRFZXlGZFdPdVpjZDB4?=
 =?utf-8?B?TC9UVU56RHpiSVRSWEFSZUxtS1BzbWljUExJajdaN3N1L1pOS2djQkUrSUFa?=
 =?utf-8?B?c0l3MFo3NDh4Q2hUd1dpMzMwS1JsTmVuS1puaGVSN2plcXNhV2lrTjVlcll3?=
 =?utf-8?B?R3lYZTZrc08rUXF1RkN2TVRaVVV1eWp5TGh6b0ZYSXluTkhORTVoMWFkelpn?=
 =?utf-8?B?QWJERDEvajJub3hxOUpaTis3WXErdnVHYjRTN2VBa3NBQVhSMmtsekFJODI1?=
 =?utf-8?B?eXNrK3ZrYno3RHRMdnZCZGlhbE5vU21FQWhabm52UnRxcnFRTS8wcHBRWUY2?=
 =?utf-8?B?YVkzbmIvREZqNTNERU1hWmhpM0xkY2h1TmhaQW44Vnh2ck83Q1FVOEw1MGNX?=
 =?utf-8?B?UUpoSDlVQjRNNWVrWkpWWU9TcGcrdmxqRHRGSlplei91aHM2R2NkTFBJZTFB?=
 =?utf-8?B?RGlITk4zZkVpWlhDRllKbXJXNGIybytDcXVUVEhoY0c3SGtBQXVUb2JrQ05X?=
 =?utf-8?B?RDFvQmRrdStYS3BrdWRkdHNtV2UxaGgvZVV3SVFmWEZmWGtRZUZFSjdOd1BB?=
 =?utf-8?B?NVhFWVRlRUJvTCtHUXAwL2Q3YjhMRzdmVUpZU3htemQ3UW5vaXB3R1d0ZnN5?=
 =?utf-8?B?SmhHNTBUT3o2N2dCNXRyOGFocXdBZHcvWUhTUmVQVnMvYk9rbjZOQTEwdm85?=
 =?utf-8?B?QWN0eGdWcDBYTWJiVnNkK3RqMVhPNGY4QXdZdHc4SElxMFE4emJ5QmNkbGJB?=
 =?utf-8?B?NDRWc2ppMnc2aVQxTmMzL2tjYjZuQ2ZLVW5hVHQyVng4ZTlJdGFLQ1BxMU0r?=
 =?utf-8?B?UGVZRkgwWGhvUnNYMmZMMzA4emRldEJIMUw4aXhCdDZ4K1VLZ3ppbW5wdW1W?=
 =?utf-8?B?MHlldmpvamJ0VmdhZTZtOWI4SEd1V1FRS3oyVE1sNm10Y1JTOUZMSHRHTHQv?=
 =?utf-8?B?VmtwRTRJc0pOcVM2ZzlXM1lrV3ZTbTlNRnR1ZTdIQjkxUUhJeVlYN2hXZnhG?=
 =?utf-8?B?V2VqT3h5NlA5SnAxN3hJS2M4QlVINzFzeGdWTkFGZ0NIY2RZSEpzU0UvU0tj?=
 =?utf-8?B?ajVxaytRMUtDNDk4U1RmWm9PVlUvMGkrWUR3WHl4KzBIVFJNL29JckZuWGpZ?=
 =?utf-8?B?VXBGWEJkZjl6anNGOU9uNmpTOTFYbHNMVHRmUnkxa0M3Wm9heWRDQkJObi91?=
 =?utf-8?Q?yQyEfU0unUURPs0Y=3D?=
X-Exchange-RoutingPolicyChecked: CtqKaZEs0VQU6tCfmlS5aF4Nxe8FfEwliPeAC2Mr/fdoLflTvc2eZwlYbVrnx1ELWaeB4TcwJZhSfQQD0X4nfvPpRkTR1koaT4m+DHOQyAYHdHpfGqmjEfy87lGJUpSwaxLXjAo0tkpdXUXwHIEJUsgaXCgMK1+Xg4DdhIYxM/cH5mSZONe6YYAhjpypIU4v625+SanALXNZ1SJeeHw54jXL8Eq5Pnx+n/sBVxI+2n4B6JxfKNLO/xMdJoLdzINRcg2d4ReqJKmwl01oLHNhaxsfRYVMWzHc04CuU7OkGoU2tZCuzccy4MFOeIdMR+iT9WNtIfeGCuMhUh9EF1dSNg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2304c01a-5ce1-4f92-171b-08df13b1180d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 05:12:24.7636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBLee2CmcFl/EVL3AWXiMxHU1FWQ7xrCVMZ+kgEfMyjlGwlN4zbPgwJSNmiVaw/P1LAgmQ41M7D0bX3k9aKmFM4+vTTksdXaeUTHwcwAjM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB106777
X-OriginatorOrg: intel.com

Hi Babu,

On 8/26/26 12:32 PM, Babu Moger wrote:
> When memory bandwidth associated with a CLOSID is aggressively throttled,
> and a task with that CLOSID moves into kernel mode, the kernel operations
> are also aggressively throttled. This can stall forward progress and
> eventually degrade overall system performance.
> 
> AMD hardware supports a feature Privilege Level Zero Association (PLZA),
> which allows the CPU's CLOSID association to be changed during the

CLOSID -> CLOSID and/or RMID?

> transition from user mode to kernel mode. This allows the kernel to run
> using a different CLOSID than user space, which can improve system

CLOSID -> CLOSID and/or RMID?

> performance.

"... and/or separately monitor the work done in kernel mode."?

> 
> PLZA also applies to cache allocation and monitoring features and provides
> flexibility to manage allocation and monitoring associations independently.

This reads like an afterthought. Are users expected to use cache allocation
while PLZA is enabled? Since only one resource group can be assigned I expect
there to be quite a few sharp corners when both are in use. Kernel work done
on behalf of high as well as low priority work will use the same cache allocations
and thus neither could actually get full benefit from having dedicated cache
portions?

> The feature is detected via CPUID_Fn80000020_EBX_x00 [Bit 9]: Privilege
> Level Zero Association (PLZA).
> 
> The PLZA feature details are documented in [1] available from [2].
> 
> [1] AMD64 Zen6 Platform Quality of Service (PQOS) Extensions:
>     Publication # 69193 Revision: 1.00, Issue Date: March 2026
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> Acked-by: Borislav Petkov (AMD) <bp@alien8.de>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537 # [2]
> ---

Reinette

