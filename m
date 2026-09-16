Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F7D3446CB;
	Wed, 16 Sep 2026 05:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789535708; cv=fail; b=ooEDeJPTUcljxQl5H4sk200sNzfRZZoJUSXcRDoOmVEkUDph3pKJ0b/CRB/UPOEsXWJYWmWguzD4XiF2BjtKuE5W+3BRQHPK3WmLOIl2XPu5R8hf4HzxciWjPO9cceEOXXHfHYMyrTvtHVGW3/54yA2IOv5pswzcpaiTtI7WRTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789535708; c=relaxed/simple;
	bh=+afrH5U/xpUAlpY70XurjlFRRt5YsUSjlvAO6HyJbt8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QN0a4zsQ3kiqgGxitv+ZkN8POY6NRn1cEMiQEKU1rKILeXQbYzAB83c+KlUiq8AOnARCKaDHQusIsuzwFmAsWNsRNi/En2ctXA4+puavLjsqgjOO8cwrRrufmqvfFcoM/T/1K1h2SpnlInGDkEx+VNJHZNy1xeXjSKgfX9c8Xtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TUMlXPGh; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TUMlXPGh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789535707; x=1821071707;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+afrH5U/xpUAlpY70XurjlFRRt5YsUSjlvAO6HyJbt8=;
  b=TUMlXPGhG6BBsMQpB0DROCu9z2YkVxJKHUV0uXNEA+x6PSCO42q19A31
   z0JUnFd5wa6bKvtvN7Psnct0OpI1z/NFVPilrFluV0HnqYba4kSqcPAVb
   ta0EumjUVeiP5kq1PPysmSsq0NA2OjUrX64CfMQTF7/Y18ldSqGz5jti3
   wehRjKEfqoGXndbvOmTNMWQPPAwUgVMN72x2n4FXNHo6R+08xfgw3RwLz
   roB05vYGFvGjM5lNjGqIzedBiKfaMSQnggOgVhYXtfW46p3SeaAhY0eu1
   u5MgL32d4EuC59fJmf6UkTI262eqKNjtSoaxzX6AkzeRYU4wq6edS6mi3
   g==;
X-CSE-ConnectionGUID: bL4ReUZ3RO2JDr9y/LsAyg==
X-CSE-MsgGUID: c6pNJ4YZSyOyZPlVGpP8Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88843723"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="88843723"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:15:05 -0700
X-CSE-ConnectionGUID: x+oyxloGQfCdCXrfVPwm5A==
X-CSE-MsgGUID: EuwXkVdAReSYC8ejFgdptA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271775716"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:15:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:15:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 22:15:04 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:15:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMY/cYwtWChmj+kRKi1NBY8Ixzc1csCe6BVF0VEVofmEtHv3MK0xUN9gy5lGfH2MoWhpE/DehaWa1v7a4cLgm7BCi4/pgPZ0fyDovaJ+CBw6Bk3ECgunF+Nkzx0O6c8PnHIubN7Ye7wiqrpe+d7Ekp9ZBuKeVhBirR3lSJcjFPyLqrQ5YtbePH+ZQXcPyC+xk2AUYeFOP5YykmFgxcWiqmAQEQwvtcGDVLw3Eft2e2tVUNzcAtALP/fRpWOr3b4EhCm4x61p4J5sfItUTdm0GUb4vSIix3YwzWjKMdsk/P+6EN/4s+E9qZrsoc8v1C5l2JPq2JKOYvLMS7QNEIElGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=laLbuiXTenPfTmFocm1E1QySWPzfwAyO0B+Zgk/0acA=;
 b=eUKxZFQe6WJhzdTG4HrVmjk4RSRJPx0OtgmvUNlOWWq69wb7fcYAF6eOwQ0pDnSJQRP72kjJcfKrplvcW+pDcz9dHmGK6n8gTWDh3BV2IO5pCcJp5FIJA59noFlC/tPnGGPlCBXGtAhbMn6e1AC9iNfERT8qPsopP+mw+EH+PXqSNB6G3VRA6PO4lkpUiBjivJFPmVpay3a3nDfgNEYw7g3nmfh+lfW9/YsirJ0WjlZO9YB5maCzpAQQL8bJZsGaquNQj1mKAsXj+9EDU2/OKiYB34Len0/ltKi55f9p/bF15qFN1Oy60LSKtjUHBegHVeDuTAjnUXbzRZSUVzpSxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Wed, 16 Sep
 2026 05:15:00 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 05:14:59 +0000
Message-ID: <5a85e139-99de-4821-97ae-5a7b5b4b5027@intel.com>
Date: Tue, 15 Sep 2026 22:14:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/16] fs/resctrl: Introduce kernel mode policy enum
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
 <a4fc2a485b26b94b8ae604ac3e82dcf33e39684d.1787772750.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <a4fc2a485b26b94b8ae604ac3e82dcf33e39684d.1787772750.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0357.namprd03.prod.outlook.com
 (2603:10b6:303:dc::32) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ2PR11MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: f94c611d-ee84-495d-8c2a-08df13b1748c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|23010399003|376014|366016|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: b7NqJAghhGzG1rJBkIkgy129rAuuD1GxeCYn/1/1DmlJrtEoc100x40P13Jc2PD63gGVWB4MZ6dpoUd31MieTgYSgMnjzcLBxzjGGmFs1vgDSV7SmNOtZ7tIs0zZkeI64uYr+aev1D+zWkLJsBwriKdscqqA53e/qsDCHLw6QOEQN0MATg/iW5/sKuywsGUV5YCf6AMtdy1Vbnk/+ldvT7a1ZsOZyndalWhIFV2QqetazZAGS02rrr4/Wl+hZqBZxstAvnOwdJNwv0FLPY+D37Q2ZN2a3XzOySgqrPonJhjiXn6vjx9148c1rwtC4yuCYKmKAEZpbUERijDpUCTSrpjWzSqiXdWiMbj0S8D8sAecnxJ79e4WSsTprpsn7Bj9GTY0JITUiq30MJthsiDbHnTcFW9LplFAZJf5RMuI620BpR1XZw4D56FFPpErcbggEtOlefQvOxCr+379QeqKJgqKTjPJVYmEjMNFZMazuOA6B+mr9htwQrwFQXzuH0uHZYx7Z3G0YhYy5l8qfaXcQyYTXyPvQLZsF8ayIaKMcWme7+Jl8hzC2hIWK/A+k40U0Mhmrqw3F4zV10im7aKE+Wnihe1zzPH9KC95zfgdaETXh+GDMb6tuUZojLK4Z+R8Gx0ONpyC2+ZZyCSf+MeYvonRz/gH4iQnGLQMW/1dYpg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(376014)(366016)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkJzVmV1WDdtVzJqYm9ITmZwTjh3S1NWL3hZZ0VtV0EzSHBWa3dsVGgvejc2?=
 =?utf-8?B?Vk4rVjUzcVV6NDQ0UVRxVmo2algxTDBYTWFHcC9PM0pCVHNKN1dTMzY1SUs4?=
 =?utf-8?B?dTQ3RWY2alR4ekZhSTBtTHluT3FUdUxjME9HYzVtT0g3UlU1R08zV1hnYWd0?=
 =?utf-8?B?LzNBZU0zeE1teWtpNng2djR4eSsydUhBMEJHOWI2ck1aeXhzanF4REtNTXVE?=
 =?utf-8?B?bVhmWEZEYWhvM2ZBYjFLTXRKcGtvOUo1MHVuYlllYzRXWmR1L3FlVVVGQlBw?=
 =?utf-8?B?Uno3V0tVMXBKK1MxL0JBaGFDc2ZReGJKN21RMVlvTkNQWnJXWC9McSt2VHlJ?=
 =?utf-8?B?MG9JOTAySENQMHExN0Z2dFBZbTQ2SHN6M3VHSEYrUXFIdGowRW1YOVo0ZTM3?=
 =?utf-8?B?SnZmd3VhM3hINzhkTVhPOTZ2UHZKZEZHRmNXK2pjSlRrY2MyNklLbU9ISitw?=
 =?utf-8?B?UktUZzNHR01aSVVnU0lNcTZrQ0pGTGxGdXZJT0ZOVEMrZ1cxMlRtMnlCUEhy?=
 =?utf-8?B?S1FEY0tKMThXOFYxaDdvdFVvL3lwaHo2Wk5VaG53cVM4alVFQXFjcUE4Wi9J?=
 =?utf-8?B?OUd1dG95citoMi82NlJZNG80dDdrdkpVZzVvQndJUmRmVGZjUWZvL3lBMGsw?=
 =?utf-8?B?S3c0S3AzeDgzeFlBa0xvSXg2UlBVem1NL3JZcDFURUZYSXhaNkFrSmtFS3hE?=
 =?utf-8?B?RHovazNRQk9QdXVIYk5KQS9IazdBbmsrYStWcDJseHd6dWFUamVVWGEvWlBC?=
 =?utf-8?B?WEJYeDJmWUZUQnNJU2liMDlJbU1kVmMwNk50ajJ2ZzFxTlRudmc1aEhPNzhx?=
 =?utf-8?B?c2s5ZlRIdzFkUUcwNWZkU0tvRnRYbXA5NHJaWC9DVnY4Sld3Qkx3SUZ1Witk?=
 =?utf-8?B?QzcxQTlSTXdxUXBWRUZOSk1jbzhqUFlqazNibm5iNktqNjdyUDdYQlJ4aXhl?=
 =?utf-8?B?SXZLTTdBcWowK3B1SnFsTjNYTHZzMGtDNWZwaHRlUVZBU0tJN2QxbU85YlRM?=
 =?utf-8?B?QloraHlLdXdXWmFRdDJHVndpZXZsVDJDbDZoNDFoZGhkSkd5eFNMNXVmckVD?=
 =?utf-8?B?ZlFaV044eCtXUE56YmJ0ZGJxaWJGUW9wbnNmb3F2TitWVENvMkY4cGVwNmp1?=
 =?utf-8?B?SGQweVBUakZYQTIyR01sdTNZdWlVTTUzeXp1dXdvTEVmMDd0Ym9LMWJ5Q0xs?=
 =?utf-8?B?Ykx5T2UwN3Q1b0Foa3BhVnhWUWhiYzBXb1d2b0FjeDhsN3Nua201bVJMNjNB?=
 =?utf-8?B?Rkx2MDlrclc4WXdFd09jVTVWcG1aTXlrYzEzaDR1bnBPSFM0ZW5YQlRuckR5?=
 =?utf-8?B?Wm50RGJweitmOC9oeGJKTmU0U3BCa3hMRWJQblJvN0hlRnRRV2IvQTB0d0FX?=
 =?utf-8?B?Y1BWUmc3S3RlUEE5VHN0OWM1anVCeWVkTk4yUms2SnRZUTkvSGxNNHJ5SHk1?=
 =?utf-8?B?MndSWlBHQzFkT3JERUJFOWVuQWhMb0Vwa3p6QXJOV3FxZGQ2UFdMMEhZd0Qx?=
 =?utf-8?B?enRoampyRzEyS0ZWSjREbjhTakdvVjZiaFpQWVEzVko2bjRCZVpQYXRaVWgy?=
 =?utf-8?B?dHA0TGhRN014N093T3ZnM09Fa212T1NXMGZtdEVoQW50Wk1VZkszWGJSVXdX?=
 =?utf-8?B?Y25hc205cWZZdWJKMzFtTm9NZmQzSEJDOUd0dWYycEN0R2o1QnlTRGlqcTlz?=
 =?utf-8?B?ampSWldPWk9jcnFzN2hjUVNUUDBQRS9zTjJ5YVhaRXU4YXJtUUc5ZGlZdS9u?=
 =?utf-8?B?eHpTWE9XT1pGcVZCbWpmS0hwczR4WEFRbkhCbkR6andPYkJJQkhCRkJQTkll?=
 =?utf-8?B?SzlDMFA1Y1UzWnRCdWlOWldMaFFnU0xXTU9aNE8yUm1HV050RGVvSWxNUFUx?=
 =?utf-8?B?RVhqYm8vaXFHendqdGN0YTlaUGRHY1NoUk0zM2UxRGhlTmFsbnA5dlFMR2tt?=
 =?utf-8?B?ZzhDMEtFNTdVMWJOQkRyOXlwWkJoSWZxdG9BUFNxRmZXUnpQYTU5blhROHJi?=
 =?utf-8?B?ZERLWGlCZ3RQVVluRHZpOXdCdjRnWFAxcmt4Z0F6TGZHQlFhN0VIZzFWN2lT?=
 =?utf-8?B?a0hVK1NyL0ZqNkxicW1TSDJqSElVTDAzUGwzOG9DWWxJamxIem1zczZ2RGZ1?=
 =?utf-8?B?c3RNNUJkTXRNZDllczNWMnY5QnA0TTVYUkRQVEJxeDkvUGxlMmMyMDlQMGtN?=
 =?utf-8?B?MDNsNlNsZUg5cEJUTjdQSmNpN2wrc2Q3OFROOVYwYm5PUWRBQ3FlVnJvbWRi?=
 =?utf-8?B?QWpHbzBpREdBN3hkZDArWEFEak5LVTBNTkhOVmgzUjdzSkFrTkxBRjBGaVZO?=
 =?utf-8?B?RitSaTE1V3ZzZkFUaSs4QXNuUDlCRkJRUG9zdUViSER2QnpDQ3F2KzdtY3Ez?=
 =?utf-8?Q?o/qt/BGeF5qo+mco=3D?=
X-Exchange-RoutingPolicyChecked: xoFsT6cVFopX4uxpzlzZbZcyaPvZ8haLt7mjO3EkKpVZQlLznbKKS/b/b8SVVNtRjb3vCbFjNMb7vP2z/AjKOSMB8Qv840Rb70ichhnS3lUgbquXv1DE1e2tAkHrIgBxCyeHH28//SDrzHU39BIycQPdv6V8rZAM5Wk9CJsblBWZGcnnOMi5vmhzBKgyU6pyOhZX1+5mMCB/4vFRNX9kbIcaviDAGqaGmLlOdm4a40qMSTU/YlXh5yhZezbDCbSOSvoIAaJKXnMn5qDJPK4zr8WbYlO81kswhmwCH9oKerUihIeK+reFLQ2A3A3+Q1t13nQRhZB5jBvh/DOjpr1+GA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f94c611d-ee84-495d-8c2a-08df13b1748c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 05:14:59.6599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +3Xf6Dbvp0vqeI7hFEdHocHRaywVcJl+zCEcgvLnkOr+PiUc/9IrR7VBE8Xs3IDxFjng8OD33DeKZpTPOmewnMaDnacAbZbABnqtITrcdDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7573
X-OriginatorOrg: intel.com

Hi Babu,

On 8/26/26 12:32 PM, Babu Moger wrote:
> Kernel mode traffic can use different allocation and monitoring

"traffic" -> "work" to not imply this is just about memory traffic but
also includes cache allocation?

> associations than the originating user task. On x86, Privilege Level Zero
> Association (PLZA) enables the kernel to switch to a different CLOSID/RMID
> when entering kernel mode.
> 
> Architectures need a common way to name kernel modes before resctrl
> can report what is active or what the platform supports.
> 
> Introduce enum resctrl_kernel_mode:
>   - RESCTRL_INHERIT_USER: Kernel mode inherits allocation and monitoring
>     from the user task.
>   - RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU: Kernel mode may use allocation
>     and/or monitoring associations that differ from the user task. On x86,
>     CLOSID and RMID can be configured independently for kernel mode.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> ---
>  include/linux/resctrl.h | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index dd09c2ce9a0f..4245d1e65ccc 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -704,6 +704,31 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
>   */
>  bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
>  
> +/**
> + * enum resctrl_kernel_mode - Kernel mode control and monitoring association.
> + *
> + * @RESCTRL_INHERIT_USER:
> + *     Kernel mode inherits both allocation and monitoring associations
> + *     from the user space task. On x86, kernel uses the same CLOSID and
> + *     RMID as the user-space task.
> + *
> + * @RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU:
> + *     Kernel mode may use allocation and monitoring associations that

Why is this "may use"? Could this be made more accurate? Consider, for
example:
	All kernel mode work uses the same allocation and/or monitoring
	association via an assigned CTRL_MON or MON group. The mode can
	be enabled/disabled per-CPU. When the mode is disabled on a CPU
	then the kernel work on that CPU inherits the allocation and
	monitoring association from the user space task, effectively the
	kernel mode becomes RESCTRL_INHERIT_USER on that CPU.


> + *     differ from the user task. On x86, CLOSID and RMID are configured
> + *     independently; either or both may differ from user mode.

Please first provide all details that support what resctrl fs exposes to
user space before, if at all, adding any x86 specific details.

> + *
> + *     All online CPUs are included by default. A subset may be selected
> + *     through the resctrl group interface, and a CTRL_MON or MON group
> + *     may be associated with this mode.

Please note that the word "associated" appears in multiple contexts here.

> + */
> +enum resctrl_kernel_mode {
> +	RESCTRL_INHERIT_USER,
> +	RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU,

Something that stands out in this series is the multiple occurrences of 
"assigned" in the new interface. What do you think of just dropping
"assign" from the kernel mode name?

> +	RESCTRL_KMODE_LAST = RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU
> +};
> +
> +#define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
> +
>  extern unsigned int resctrl_rmid_realloc_threshold;
>  extern unsigned int resctrl_rmid_realloc_limit;
>  

Reinette
