Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCB329B78F;
	Wed,  2 Sep 2026 00:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788308495; cv=fail; b=kMfeaYhS5G3VA1arjElZ0aN5xfQO8lAc880PXtecgnjKb+FE0yY96N5JYcnQJmKBOZu33OPiBUZPokHXTw3aa98Gjh02Z6f+7noikY8pzOvpNpgTSXQPNge7GGkWZmJtUWYkK8zW6GvDTLdWuphNs7sXuYY4vDFTaeYEeTZP070=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788308495; c=relaxed/simple;
	bh=0MV7GiGXdQ8dEghqC8AZGaF2Mt7+CEU4oG8ocsd2+d8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UMu1y+aoiNdc1iEMUvGBF+KLLTnG6Boh5KQYvsH69S2+wz6ddGDPvO3+Ifa62iUfCRC/hVIQisIPzqDDOny6I4rD4VaXR94r1lg+aKJ64EWlnjmIxYldqTAaMrBWPTucT+N//7qFStULQjmrNU8XtRHUC5qKJBV/GpT9NIEMVts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YVkY7BIK; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YVkY7BIK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788308493; x=1819844493;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0MV7GiGXdQ8dEghqC8AZGaF2Mt7+CEU4oG8ocsd2+d8=;
  b=YVkY7BIKoWfuJ1suja9rlFQrQeDHoM1nZtKZ5TyiWKGsPwID7hJ+vSPC
   5+qKJA4c9kZ8XDHDe1uiZU/FrReO0qU2n8GNhPAxiFCZrL9GL6adHZMf+
   pUdtXbO2CseX3dhDVnZQKY6kMalJsU2cpEsPeekRCHn3H2+YRkPalmd1u
   qsEA6enPf23/w9wIw/cek59qkVgVJ2oSxRrv3vJsikoQN0eYTKQ6iRjIW
   ruXWlXRPNdUPc5Ft4sHMn415yxraOln+OhS/qHrqdATwR9yblLJ6sAuAz
   LTnY6SU6/MP6jriYX0qvq+ehp2WW90V7FYUSDhIPLr1GyaEfVWoBhOe/k
   w==;
X-CSE-ConnectionGUID: +ro+bvFrQJu6QUZreHrkPA==
X-CSE-MsgGUID: dxCjRa4xRW+pjb+T5lFPBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="106126480"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="106126480"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 17:21:32 -0700
X-CSE-ConnectionGUID: q0AbpfRYR8Wwu+8jJsn+7A==
X-CSE-MsgGUID: Q8HVDRbGTh6/u9g/O5XlrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="274521913"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 17:21:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 17:21:32 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 17:21:32 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 17:21:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvLKbpwLDR7PlZ0zhv1hvZXi2EAvZku26v3mxb3ngXsYLD5Np31y/xQliRnT1R7YtNvyMiFwxIKLSnEX42uw4e+vnZNRrrTi6YeQVwsXYzByK5oDlwI/OepIvRTLqWPbyR0LS4T9rN5XcLJlHFnixJcsHRki70EnH98VdTs4fN8k0PfppxVvGo5kE+sEcu4O4Wq2qiYpxZTEO3nY83B4NIRLljG5l3mtXOibePpB2biisCOccSUoo5GX2b0EPN6A5YEZZiL1eotiFRpEpJqSEoZRKvU8u82L8Mx/TKocw+uSWLfVfkVMT78upw1jzAATLHb2J4IebVsb9lzkMzMeRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APQs+RlkVrz665fA1l8MDKKEY31+sTLZfGtdGnXFxHo=;
 b=hGQ9atsBXBtu0jlbgee6yBFjgiYFxZ+FSJm5zhBTKmeVOcs6KIEUFOQWSLnnB4CifBm1DQjuUAjsq3o85Wg9vvmv6ph/EhzVJUGEggHPNnF3AqqcOVcLG4O2kSzN4Biws15ARscB8eySmKJvAoQ5wwGSL5PK3wCqE/7wlP2r/6bq4/RqTrHh7s7sGJIrt2OT+iO4lelPovDOVImOrP4whbIYfu+8jep/+ipLU6iOtispMvwoC7Ehq3S0tBLDuq/EfqG4JDOkHiBijKsYCcOFh3mcjNkUd4KBua3STEHkmffg7re4fVXqXhFqSLavJl0lDcrBvpF+7ndHwTHevBdHwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CO1PR11MB5108.namprd11.prod.outlook.com (2603:10b6:303:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Wed, 2 Sep
 2026 00:21:22 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 00:21:22 +0000
Message-ID: <4a81506d-87a1-428f-b797-d9391aedcc7a@intel.com>
Date: Tue, 1 Sep 2026 17:21:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Borislav Petkov <bp@alien8.de>, Babu Moger <babu.moger@amd.com>, "Moger,
 Babu" <bmoger@amd.com>
CC: "Luck, Tony" <tony.luck@intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"Dave.Martin@arm.com" <Dave.Martin@arm.com>, "james.morse@arm.com"
	<james.morse@arm.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "tglx@kernel.org"
	<tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "Eranian, Stephane" <eranian@google.com>,
	"peternewman@google.com" <peternewman@google.com>
References: <4bfafa1e-a7da-4c37-8da9-9fbba14106fd@intel.com>
 <20260801012227.GEam1KUyMz601QOzrT@fat_crate.local>
 <5f10ceab-5569-409b-8e78-c4a4f232489f@intel.com>
 <20260804191608.GDanI6eK2Q07w6pNcb@fat_crate.local>
 <98be93cc-f2d8-4bad-bbb0-f309e912054c@intel.com>
 <20260804224703.GFanJr52UbKBrCOTij@fat_crate.local>
 <112cebea-d455-4b75-847b-bb7d4aa4847d@intel.com>
 <1fe5cb09-aa2e-4b3d-9fbd-293d8e9f33d7@amd.com>
 <ad90a776-7be2-4d5d-88b4-280bc46b7387@amd.com>
 <d476ea5e-340b-4d65-8207-cc1a0055b4aa@intel.com>
 <20260901232139.GBapdeA0fj1XjLsjAM@fat_crate.local>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260901232139.GBapdeA0fj1XjLsjAM@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0207.namprd04.prod.outlook.com
 (2603:10b6:303:86::32) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CO1PR11MB5108:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c6a7e68-0767-4f79-fd2c-08df08881e38
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|10067099003|18002099003|11063799006|4143699003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: UTJRwgytVvFBIcBBzCDIFF4sZevhyPlMs30jfapMBI59IJxcA5yF7Ba6fPJH9R+Y2c1K+WJVJ59GHbEjQwDO88E5JfCmdc9zjp97pp7GiCijSWgB8bdh1SWfyCTfXuYWr1WXlGhkS89Dr2973yoFhG3Oy5qF8HLGuwc0YWx7JNmsJkvSkp1GF3kHH6xYtX4I9q+A115GzyeRHi/vjGtqc2mwXPmqghr2ONd5zlYhuiz53A5mNhMHG0cv8OGgdT/iih501IDbFje6bCoj2RtPeOdU1ZsA8ZdI+LQPl1iam4UxXYF0ZwOw+4I/r7OSCSzvREA/fvLX5APHG1K7R3MB7Y0L3s8NZrbmZBidVHnXL7FO6ATopgV2OKQbGYWT9nijPNh8x2ZbwFJdrJWQwA5/YXYGG3gqo+RSkxq+n9CpkXssJ3SoGPM2CvuuKVLP/ltFynjaKAKXICK4PzJLpW4bvwBoP65fWxK37xyXZa7iV5HOR3Zxm0oOynJMKexrbM7SVcVQDAPcqLa0B2q6C6RpUqrhIyZHa6WnKVPrYIVg8H7Yj/d6DQMNWake2CpQGKFb9OYlBZSfKd1gWSQ0m8g0P066+ti8/WExfj1BQ04SxFWUkyZBNxVnRaDh+Mvtf9tP4XRj491w/TrfdQo0T+ZN5eJ4O0DQZzyO+3aV3hCicvc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(10067099003)(18002099003)(11063799006)(4143699003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEgzVURtenBDdFpKa2R4eEhRK2RtckFrSEVVQzcvUUcxcURDQXgvbFdOdHZl?=
 =?utf-8?B?aDZnMWZHYlhZbm10V3NraHZmTmptdlUrNWdnbGp1Y3RUSVo4QlNwT2Q5RXgz?=
 =?utf-8?B?ZWlvNzNBVjcvVnBQY3l3VHJ6TFpreG9UaHdvRTA4a0lFeEI2SUJKM0NWcnFO?=
 =?utf-8?B?UHBzV04rZk5BSEN4Uk9XOVNxaDVsVzE3Z01uUG02ajRkZmxsNzJ2dGRZSlN1?=
 =?utf-8?B?cDl2YjNGbmVOOGV2clZNVXZydnRFdkFTYk1vUmFESGh2RmZDNS9LQ29nSnEv?=
 =?utf-8?B?WjQ4b1lhVHkrNUl0QWxOZEdNcDVqLzZDSklpSVFZTE9GejArQUVIRlluOUFF?=
 =?utf-8?B?NUlWdUZ6OGw1SUY5L3RVL2NnMVhpR2JCSEpISER0YnJUalN2UnpkYjNZaUYw?=
 =?utf-8?B?ZmFEUGptVlBMOElEd1hSQlNBTi94bHFHUytMZGdIdS93UEVBVjFvTkw4Nm94?=
 =?utf-8?B?Nk9lOVVkWjdFUkpkZC8rTWttZXBJY0MyRGRmMEJTTUxjTlVURFRkaTBPaWNx?=
 =?utf-8?B?RHJwd0MxTVR1Q1MvK2VxMUhxSUtJM0dTcG9HNldpRFVGZE5SRk44Q3FtS09S?=
 =?utf-8?B?N25LWHorSklZN0pwSisyU0J6eUovaVVSNTlOazJveU1xRC9GT01BRnFGY05w?=
 =?utf-8?B?Q1dsdElMTDV2WkxLSXhkTnhxTWpCYXRiTUp6a3luMThqSkZnZE9uMUVPV0xD?=
 =?utf-8?B?NHQxYi9FVjJRYTdMQ3pBWEJXakJDaTF4UzBRQWxsS1ZOWjV5OElmZ1JvS0th?=
 =?utf-8?B?bHVyYWI5d1lHQkgrbTF6d284YXc5QUUrQ056U2Q5aEJhZG5GdkxnUWdRVUc5?=
 =?utf-8?B?L1VLWWthMGJGS2hQc002Mlg5djRSRmx5UTBYb0NnSHdYMVRmb0lwL2VGYkg1?=
 =?utf-8?B?RmI5d2RXSzg4K3VXVEpKcFRuUWwvN2w0bUR3NUE2Ty9yTm9BUkdpUDU2T1F5?=
 =?utf-8?B?b0huN1pUdmdBR3FDOEo4cW5SSUo5dGk4NllOU0hOSjVQWlQ5enE5L1ZVVk5M?=
 =?utf-8?B?aEtuRzNGQXBDNkp4MU1CVTBDYzFJa2lLM2tmMWZBOHZjZUJyalA3QWpYS2F1?=
 =?utf-8?B?bFEyK1hsQWJ0RFArMGk5Y1ZmWFlXZHRBdEc1M0lHMlFDNVV1aGFRbHVJUFZ3?=
 =?utf-8?B?dGFUOFp1ZHM3SW0vMld1bnJodEltdG54Y2p5QTNoMEpkQ1pBb3ZMZHBDSUVM?=
 =?utf-8?B?OGZUV3dwTER0ZFNrYnkzM242cTc0WDhoTVo4TWZxMWp5Y2lvN1Y0c2hpWm5h?=
 =?utf-8?B?SENwa1Z5a29HK0pLSElvQm5IYVZrN1VDQVlRd3FrbjU3ZG54WE02Lzg1b05r?=
 =?utf-8?B?cjJvQjdFVCtOdVZ6SzRwUy94TTk5RnVyTDVwZ01udGtxNE5tTDJFU2ZzbFQz?=
 =?utf-8?B?VXBIN1Q2T0hkbDNKaU5uZzA3SU13ZXRKMEFoSWRGRENPRFVUbnNBcXVrWDln?=
 =?utf-8?B?RTVkakhwdzltRlNTTkQ3MEVUYTZZa2NoQjB4dnVHY2M1NHl1Q0crNG5yb2Rx?=
 =?utf-8?B?ZmcrNWt0TjlOeU1iZHJMRkk2TjhKTE9SY28wSzh5Tm5xRGJyZVp4N1BZd2I1?=
 =?utf-8?B?dHVSWnRFVzhRSUEwRndDZXVBb3gyaFpKalNRVEZvYWR6UjRTWEdxSHFlSzB0?=
 =?utf-8?B?QlBQNzhITnVCRkFmbm9GTWd3WWpSN1g2ZXZ6bGlMdjEwMlFXRVRDY1IrcXRz?=
 =?utf-8?B?c21OUG5NME5UbUpsZWI5MFRNUzRGTllBVG02MTRDdTVDd2dvUExacTNneG14?=
 =?utf-8?B?cSs0R0IyMkFjekRtRVM0MytTK3V6Z2k2SzRLakNUT05HcUpQQ0NaUVZ1bU5s?=
 =?utf-8?B?WFliSVIrZlB5MzdRYkc3blJzTFpWNUZXWHdJRmgrdGtpSWl1VmRJVEtEWVdn?=
 =?utf-8?B?cUlJeE1zZGRzaGNyazg1cDY0MkJRS1hSRHJaeUppMVJ2QithVy9iMW9rUHFV?=
 =?utf-8?B?Nm91bzlKREN0N2hsakIwQ1hYSk9VSWJBUGFrUU5kVnpLVVZkbFRKM1lmTjlW?=
 =?utf-8?B?SEUwa21MZ28xdy9aYWhiRTJsUjdlQ1dIcmpjVlcyZG9Ia1JHU2J2dFRjUnRx?=
 =?utf-8?B?cXgzaU01QldIZndyamwyMEVQNGQvcS9DVmZEVC9Gejdoekt2RnhqdmRFU012?=
 =?utf-8?B?SE5RZVFJZHEyV2N0Tzhlc1dhUktqeVpVWjgyMWFhcHd4N2lrV0E0OG56Sjc3?=
 =?utf-8?B?N2xJc0VuSjl4SVYyRGpkd0o1bjRYNWdZVURQQVJzTVF0T2F6Q2dlNXg3dXpK?=
 =?utf-8?B?NVdkL1hUdDRDeHM4NmxNNXRPUEMwZFZOWEQrakhnT3psNGNTT2w2bFpCV1Jr?=
 =?utf-8?B?REc5c1Zaa3VNeXYxZkl0NFQzWFkwd3VQQ0F1NE91c2lvaTRwbitVMmNTQ2Ja?=
 =?utf-8?Q?l5kTZfdBt4HeaFTo=3D?=
X-Exchange-RoutingPolicyChecked: sl4CdA9Ve1UwUa1RUcnTRzZ0mNRmY4oV8lKuxcFqoig2yQTzrL5UrYJxL5BXWdqPq5pN4b1JjlNEqMywjiiyKT+vJZsxd5E/qZ1BTcnqVUvjQLGwSNe8pZ6pk/cNiNX4ODfMyPz8U67oQ34RmpaWCa8Rg0cbm/QLsae7vi/tF1TaffJtVqm1Su3YI6iJxw+xDL9XHp31nzf90D8Zw1c9aWVZr5q2sfJtUFup1JZ978kd+Fi9wKcFWwcEruKtM8/jLKr2Vo2NPdWECJ2bvqY2R3+XODsjO1TH9a3y1OPCGYJmO9WevYn0anQglRiI5P+BSAZgVnDYB0WlutkgzKbOaQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6a7e68-0767-4f79-fd2c-08df08881e38
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 00:21:22.7320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6YBhuFOGZONCLzVlyPn1PFEByRZH+joVqeeUEQ+0cSsYiPL04ACoW8Urg81ow0B25tsvEUPEN4p8bZRQqegT3QmSGSqxGQF37FDh4Vr/FUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5108
X-OriginatorOrg: intel.com

Hi Boris and Babu,

On 9/1/26 4:21 PM, Borislav Petkov wrote:
> On Tue, Sep 01, 2026 at 12:26:16PM -0700, Reinette Chatre wrote:
>> From my side I provide a very high level summary of my view below as we await
>> guidance per [1]:
> 
> I thought we agreed on that:
> 
> https://lore.kernel.org/r/20260804191608.GDanI6eK2Q07w6pNcb@fat_crate.local
> 
> and
> 
> https://lore.kernel.org/lkml/98be93cc-f2d8-4bad-bbb0-f309e912054c@intel.com/
> 
> I am reading your reply as you're agreeing with me.


Boris:
	I agreed to follow your guidance. I did have some nitpicks in the email that
	you linked to and the discussion that followed created the impression with
	me that	you were considering other options. Specifically

	https://lore.kernel.org/lkml/20260805002138.GHanKCEmyMcvK8Xg4w@fat_crate.local/

	is what I misunderstood as this topic still being open. My apologies.

Babu:
	To answer your question on how to move forward I thus think what is needed
	is a minimized patch for easier backporting that is marked for stable. Also
	consider 

	https://lore.kernel.org/all/d476ea5e-340b-4d65-8207-cc1a0055b4aa@intel.com/

	when writing the changelog. For me to sign off on this change the changelog has
	to be accurate and complete. 

	Please also follow up with pqos team on the issue you created there to motivate 
	this patch.

Reinette

