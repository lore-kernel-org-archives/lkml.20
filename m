Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86084E2F09;
	Thu, 17 Sep 2026 19:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789674556; cv=fail; b=o8kLIaj+zm1wYrHfi48aArZL2QskUf4nDm9hL3Li0c5Kl2o2RZrNZNiyRFfdisHvUa2+wp0ShPc9QuzeRlHj8SMlX1TRZE1Y8jNPSRdieJ72gRqP6bDy5uPTPkXK1hJhN5qwsHyR6ga2KhNiCEAgqdHF4ToQqGoI927j4dGXeF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789674556; c=relaxed/simple;
	bh=1LlQdVaOkeQyPssRjkXSGOzpIkXGnOEfd9+E8BdOSAQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZwbaTLIa+H7oDTBeTkP8Uz2R3xa0ye954W+s1jICBs66VE8+1ZnactObQgAGDMCOaJ3zCK5Pvlgr5UY/t7wr5b/Pezz09LG6So5+K4DdmuD5inXKjhHeBJxJTgCFcb0xlUQOM4OgjVGS0DtB9qFBRLEBmje4NNn+jrMsgyvt1lI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AbaiIkgR; arc=fail smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AbaiIkgR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789674554; x=1821210554;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1LlQdVaOkeQyPssRjkXSGOzpIkXGnOEfd9+E8BdOSAQ=;
  b=AbaiIkgRYIwjAIjggCLCq1Rg12b2AV5bpKjQJfyQeWclIDCDL/Bxqewx
   uqRkKDQjpst8Yp0jMv4ZHLFCK5leWj+vATMp7YL6W1nageDhSiwJGd5tC
   YPio1Gtqn023J2K4PUHTHEoVNcLAgOTyhmD2pGrk/h2kr5K0mi0LZRBnH
   ZoWI5kAyzEwEGfM0AwHcJdef61VfpZfJI8txnZLOz82a736M8nO6u5THK
   gYFJZhSpyynY14zuAAnMifft5Ef3WxFL8uDCFPHM41Bil49t/EeiDsXqx
   afdgy2HhAS0cbbyae1F/rjkbURFDOOq/uGuJkDoOv8rvwkZ3BNyY2EIq3
   w==;
X-CSE-ConnectionGUID: lHV11aFdRH+rDcq90/LuRg==
X-CSE-MsgGUID: 8aI5jP2yRzaEcScUtv86Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="644470"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="644470"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:49:13 -0700
X-CSE-ConnectionGUID: XRI3Ez77Q1KAHopJzhBLJA==
X-CSE-MsgGUID: 9d97pdIXQX67RjR3C7ofiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271338386"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:49:13 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 12:49:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 12:49:12 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 12:49:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctfFz5fPTRZo2bqapFM0DNNVgLYvbCazEZU9xHmdjeqSeRV0bZgbfFqXza4uxepClIDPElK/HMxn1i2YPQbhNSPQaYnRdMaGdqngbGLjKkf6UJ5RpPOLQzXmtpo61hz8xDu6LMkrqA03LFBTVNj/CFLAMr9NDQK1UEfMsQLZIni0+SntMZUqDczYhWV0xJjIqyviuDFjWWWy14iBHvAVNsEB+mvbOATDxszE6U4kuVIAnbVtlYH/NumMK5QSDHWEelKjruKkmTEONZWsSMKjv8ZpQFmnKhY4973qCmsg+MyIcgFRovZWmoWUiwaPeD+4ujrZMTTr3qwCuzWOeJaayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhs0ustwjLodIGZxUS/WpLuZcSaLZUM+kyevgdEt0RY=;
 b=JWZ5yfU2x255K1wYCJ5QuB9udfYVy1DEnNTUQA5EBrYVUrkIJoxpnI21YuCtnOx/pfopMkh7fxv9DZ8twpe8l7AtOgq8UQK6Kyymq/AbKLOPWREa/KjWvmpZOKfMJcR4vkhvEEYuI/J9BvamGVYYVThxLxg07DPhLD250R/60r1SI7ggHI6Wq+Nl7kqT3JnrcVGymE4YnqzKZcnHsZXPf+bi6NP8cKxoU0WJoNDF+us92DX2kNGJ4BRyrF16DsKkvxENNfnwV5Pl2imK1TSCLwfn/j5fK8x2NhRT60m4E73qogRro8893S6+O0ZZ14BLYGbHh7MEvf9Ized3hQovNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by MW4PR11MB6960.namprd11.prod.outlook.com (2603:10b6:303:226::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Thu, 17 Sep
 2026 19:48:57 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 19:48:56 +0000
Message-ID: <4132c1a7-9cb5-4ee1-86da-6b85e8f7e46d@intel.com>
Date: Thu, 17 Sep 2026 12:48:52 -0700
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
 <9dd7905f-6180-428d-8c9d-10e9353b5091@intel.com>
 <45e322b2-a808-4b26-b33a-4ce7c84d5241@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <45e322b2-a808-4b26-b33a-4ce7c84d5241@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:303:8e::31) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|MW4PR11MB6960:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cde549e-06a1-4425-f636-08df14f4b5d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|10067099003|56012099006|4143699003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: I+ZY729bsBoB58wVEbZCY1cFBzIhneF+/t9BmjdI0dJwwgrgJ8j0D7eMp1fCi0Z5oKM9IcUuUxLa6HUuikT+G0iXIC89O+FR4UePqL/nxEnmUV+hAF/9qIYRvV8KSetaPbNa6ly5IOK33szmVizJ+EV4Pqtg3O3oCW/EGhwZppqLaznI8KwgRftrRJY2JEZsdcaDvN6CvUj5l+z63pwLyj+hOJ2f393UWE7bRb5vxtR/7BrBcALTQvzQ0JHDg7n/ZtLrgP1rA7dceEPJiHHfKIf9jp9aW9/Q7afPJJycby1eHeOaSsR32rM7+eb/hKgClQz354xQzwoL/Mfq/XjIw5iGhe1VLxr0usuJN84dG0ykZcg/fBkcwnrRJj3edJmAweqTyLZrx/ndJuPH6BzUiCRf2jRlm1UCBucuVkN31+lATdDWYkoGBqv8ipJ5ohWsUzkKN0eUtXQqdJbDbynC0jfW7PCiobS/ZnR7JIltVe+0UgEcShpi0Sus8GWnLlq8GFI3IpBkYKi3UnrfadwRbt1YTHsWqDNOvMPYadTvAl/NfBKue1tCxIgSckz246Xyn+AYlrTAA0e+8T7YrHrdJrQWf7mPQgoMtRziTdzFBVYA9tYDHeqyHDWPSeZMp4EBNNZD2J9jbnfMXeaCmVXxrzUcAgHPxhFRGnlOyr+UL0U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qmp3dTdacEgrdFo0RC9xOSsvbkJ1L0ZDR3IvbDJCNkY1N1NXc1dWTVJXdGsr?=
 =?utf-8?B?TGhTSEVxL0Nkbnd5SElkZVFQVkZueDZhZGhIbCtySFJJUUV0RUx5LzBOK1Ja?=
 =?utf-8?B?ZXBwVkt6aDBBYXQzR3ZMWUhLVkxrRmQ0RmlzMUpDeG5PcCt3YWhvQ3Z1QnVr?=
 =?utf-8?B?Y2ZaVlg2Q212RmxDdGpEWTcxSWVVU1NYWTk4ZXBqN0drbTBCSFNla002U3p2?=
 =?utf-8?B?ZmhSd3FZSDRibFl5RFllbUYyL3l0dzVEeVorYnVZNEhIY1FHK1dOaWJibFg3?=
 =?utf-8?B?RThNNE1pazVZZWJJVk5YakZhYWdFK1ZYUEp6WjRlRlRXOUwwcnVURnBGYjI0?=
 =?utf-8?B?U2x6MmZHQmV0ZjlOV2VWNXpEdDFHSytMTURaa0ZuQWdKVHd3ckRldUtyTGY5?=
 =?utf-8?B?Yk4yZzFtYTk1bVlIZXlOaDJicGhkRVdYd3NPQVUwdFpxamVRWFJQOXhRODM3?=
 =?utf-8?B?NkcrdUxVU0x6ZUlPQ1FXZFBoMERyOHhteFRobmNaa0VZeDNsWjUyRG1BZWRW?=
 =?utf-8?B?NXF2UkpGS0U2U3AwbllEVXVjVUlZNWdyNU9tYTRQaE9YenRoTnE5QTMzZkpC?=
 =?utf-8?B?dDVuZFhlV1g2Y21wRS9KcXhCSEp1UjQwcmRZME5tTXUvTGpEdFFRUG43T0dV?=
 =?utf-8?B?YW5wam85RjVIaDRzS1QxZGt1b3JmVkdGVHlsMHJWeVBGSkdoV0Rud3pBZllu?=
 =?utf-8?B?ZEhUbEhENEtXaG5JN3JIZVJJR1d1cnpIclF1MGcrbjJhdUV0dlVHSVF0aXV5?=
 =?utf-8?B?cDVpRS9xN2FYeGowU3RZa3BKbU4rYzNHZkdyRTJNeWVzS005d3ZaR3hNS0Jm?=
 =?utf-8?B?NmNzUFc4c3B6VitPMGpUcE1wbzNnY2xKNDlwUHhnOFRWc0JIUkl3SHcwbFp5?=
 =?utf-8?B?UmVqQmVEUjhENlhKM0NYR2hKWTB4dVozcG4vM21YWWdiQ3BJUW1jekF1QVdy?=
 =?utf-8?B?eEF3emtzbDFEOFNuZ0ZEaVVpNjhIdWRNaEcvelBFYzRXR2VsZ2NUQWhEdjFq?=
 =?utf-8?B?M01YeEtyOG5wNVVHRmRXRjVMZTg3ZWxvRUlvYldrQW1CQnVDOUFuZG5OQkMr?=
 =?utf-8?B?dmdQaW5QTEZDK1hlRmpOODNBTFlFQXhiazVsbE9tQlNLL2lQL1d1RkZyOUla?=
 =?utf-8?B?Wmhhc0sxTHdibXoyeTd6SFl0bGE1L0pOQjVPbmwva1MzOE9mY0RLdHc4Si9o?=
 =?utf-8?B?YlM0Y3duc0J1RGhXWHFHR3VEeEhNakFGbXh0cUQ5QjN2N3k5TzlSeXJFWHpZ?=
 =?utf-8?B?U0dDL0VmK0dIZnNDQ1hkell0L1F2SHZISURnRlFBTm5YN0JMSjZ5Zm51c1JR?=
 =?utf-8?B?SFpLekZqMmdTT3Y1ZzhjY3dCOHhXYjE0ZG1TY3FTOXlhZXdxelJEekRiQ3JH?=
 =?utf-8?B?eEkyR3FXNEozTWJPNE9kdS9lNTR3QTJpME9kU0h4SkVyODg4RUFFM2RvenNz?=
 =?utf-8?B?Tjk2cmN1dG9lNjN0eWV6QlMyWURmTzZqWFF3WC9OdFpSek1INWViaDRKUW9j?=
 =?utf-8?B?V3JuTk9zQVFEL2loWlZqRUFyZS9KVGhPV2dkNjEwSFJzNmp3QXVZYlFjLzZk?=
 =?utf-8?B?eWVuZENFd0ladHFkZTEyWEcwK3RnYitHakpyczMrNVlXb0s3bW9GRHBDSnF0?=
 =?utf-8?B?VHdJTWJ5dU1ScXVnVy9sN3pic05VZGg4NTllWGxUSDgrZ3Q0bEgxdVhuSTl6?=
 =?utf-8?B?U1VPTSt4emlwMnZXRHJsWmVxWmRmanEyRW1CbzF0T2JCVTE0eHU4Q3NVZ2NH?=
 =?utf-8?B?MnBaQVpvTjFiZXFXZ29CcnptT0xrckVnNHBiSXpYRklqWWxyVi9vMWNmYktu?=
 =?utf-8?B?cC9pK3hNYy81MEFGM0p0NGJ1VVZqT0VXZUtGWUFtSjF4VGhpT0hOZk8zandT?=
 =?utf-8?B?KzAzMlVvbENJWFJlVjRwc2J6OUFkYkNzTW5RdHp4MzlkMHo1dDRMSWlyVlhl?=
 =?utf-8?B?UkNrNDAybTRKTjBMM2RFUVhLKzNsbDIwNnlzRThZMXZLYkk2SEtZaTRtNjBm?=
 =?utf-8?B?VUxOa3dCekhBemdmS2psNklRQVlCNUdZb0hEbktISnYyNjNGS1pxbGVtWlBG?=
 =?utf-8?B?STEwbU50bmxJNS9YSVlGU0ZLWlNUeW9qMVBTbVpuN2xRd0xPZWZ2ZFlCTkZt?=
 =?utf-8?B?QmJJdWhCSlJzc2xOOCtrYmQwSGlKanZ4dGEvVVNPRWZQTW5samV3MkJ4OFZq?=
 =?utf-8?B?b2ZlMkljZ3RxTE0wdnNJYWlSVUJjOG1acVlNUUVqRStSRGNBalRNS0NINVd4?=
 =?utf-8?B?dVZBdzZsUWlZQjkxK3d6dTBMdkt6bmN6YUYvNkQ5WTJuaURNRzBBM1Q3WXp4?=
 =?utf-8?B?RWZvNXl0aVhFN2xFZ3ZiQ3VpRE1UaCt2ZngvSmpsQnBqQTJjemVmMklabmhH?=
 =?utf-8?Q?1wR7qUcoY+NbmZXQ=3D?=
X-Exchange-RoutingPolicyChecked: VTC54q59Sn0/6NBt1mo3nApeLV9jnirfI3rEciUJIbeaYz8n5GzhKdHmXwDnJ6gpZ3x0njBp0ueLpS44+3JSBXS6o/g127vtCYPe+sJFw7vKVbjicQzH/WXpto4V1zG+4tNk9ClwTu+BVdNgLZShdSLHqnESJaBysaZ3GG6hYOCfmqJXrla3Y3i10Isb/9Uwsrnf90uIpHeW/Y9tbBvBobn17d/9HPbdtNXo6Q44zDj/A8gj7iT8Jdi4szU5F+Xwsd3gEoya/igdOvd5c8ucZi+mto3tI+iOGwX/buY+jatlHNa9GRfvn3cR8+gbJnUO9HoKvGBAiATzKrY55/eVWQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cde549e-06a1-4425-f636-08df14f4b5d8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 19:48:56.7913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QPrCf/fRfx7iyjIVLXzhtEESC1FQp5JuI9OMtNC88IB8Yn5AbsddnxQPSIrjYc7U8OJRtJUV6clLYv1TmDaS4auQJFQdmRfIi092k6Qe5ZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6960
X-OriginatorOrg: intel.com

Hi Babu,

On 9/17/26 12:25 PM, Babu Moger wrote:
> On 9/16/26 00:36, Reinette Chatre wrote:
>> On 8/26/26 12:32 PM, Babu Moger wrote:

...

>>
>>> +        pr_warn("resctrl: kernel mode group not valid\n");
>>
>> Please just fix this file's pr_fmt(fmt) instead.
> 
> 
> Hmm... It looks like we have a pr_fmt(fmt) inconsistency across multiple files.
> 
> Some files use:
> 
> #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> 
> 
> while others use:
> 
> #define pr_fmt(fmt) "resctrl: " fmt
> 
> > My understanding is that these will produce different log prefixes.
> For example, KBUILD_MODNAME will typically use the object file name,
> whereas "resctrl" provides a consistent subsystem-wide prefix.
> 
> Do you think we should standardize all files to use the same prefix?
> If so, I believe that would be better handled as a separate cleanup
> patch rather than being mixed into this change.
> 

Thanks for catching this. Yes, I think all files should use the same prefix.

Reinette


