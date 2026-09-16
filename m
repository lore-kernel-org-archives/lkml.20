Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1D237104C;
	Wed, 16 Sep 2026 05:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537819; cv=fail; b=bcY+TVwTD9H61OpFnnkF3nxOIt7ig89sFMgdY4waCRFxRUjbcQ0lbixVkj0NuFeNaUoIm35D2kCfulqomcAaQqnAPe3+yL5LNkACehPqV6hpnQuVs3dYR0Ie68Um/0mu5hVmUUI0sPUf6OWIuqn4ll/U6fNf9CHIwLKjj1+RI64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537819; c=relaxed/simple;
	bh=C+QrAgUipwMQyLB3FY0pDUFLsQZU6HjoNB0TS67Aw6k=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qEYyhIyjrcl0Rdw4/1OTa84Ozxl8Y6SDDTV2UHixsUH8AlrhkuZditBSvUdBMLjAcu+rTHOVvxe8+qzXetgen4qkFAU6fJJ4qr6t3BTA5QnGClX6ctTMXCAeFNyUb7Oz8vRyze+6EfNcNi02c0d7ff9WY24T6isW8Z2xNrMuwew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dhUo2s2i; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dhUo2s2i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789537817; x=1821073817;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=C+QrAgUipwMQyLB3FY0pDUFLsQZU6HjoNB0TS67Aw6k=;
  b=dhUo2s2i2z7YKYfb9B3kNhnLYGoEiCmdKgBDkk9dObdZvSr3ht6FTo+k
   aSTqXGVkK42VK795EZ6wzgQ4hLGGiUB4MRNrekn6HJbjcpOoMDsTDaour
   kO2JY88ffjeXtXSIWrDP01khbhyZt+5VGoIvEm+r7ItH6KRcX2A8cLMDV
   axIE3oVjTuTA/qEq229h8Y0QzYHf7/bnpC2AFgLz6XqhT2Q53e/8WKaKF
   UPQlVx5nOTjPqYoRxEtVVgpvvWmydRu8ZozCCkbCK3JdVnSySowqChQda
   YtkVPW0sHqr/27+x1JXmIKAExmgtKuWUcXq4D4tvRCjD4td3LSa7k0RHk
   A==;
X-CSE-ConnectionGUID: zQ3EBVG4SaqA08T6LqO/aw==
X-CSE-MsgGUID: QUfiR3+TRiC7SdZgWnZJEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90044457"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90044457"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:50:16 -0700
X-CSE-ConnectionGUID: yv5GIQ0XRAC4l51zEGZ58w==
X-CSE-MsgGUID: 7yvTUL8GRUCjWvrHnzA5oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1452200"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:50:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:50:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 22:50:15 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:50:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z6XL+zFRgtJp898uIGFza4rAq641j1RDUEiOoKOnbMbGoYmRzBbH7RYgK4OkSRwpBksIrDn+R2nx8wceTAiRnIayBULIO/VVPkhNQDZ7JdHVf9rDIEYNDQqvPsenldX8VzID/XriL2y6HVCjB0bwO3/p+YrkPuIyw5I3TrcXUvpqAJobUmglfkJ7PL4M6nE3q0pxDYjylh8U6xb73Qx0toZ4+fmTyemtHeSCquiz8RdFCgYDN69WeP44Hcbvuorha8wkOFeKVCsCRuhLCtE0f0smTV7Zns2mXPKNUmNlhSDcfSNbLlPZuJuNrAAhCmU/XDs6dF+/3s7qrNVfTlPLdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K56pwxBhuDByDSdByquV3S2gOIGMzy4xH5tR0PU2FZk=;
 b=oWpdaPJ3mswPvXTTrf5/VlI+RwUtz133fYs2AgOTacu3whG3XNguQ3qtYnwgY9bdoDj+hSXIHrFoWV/EOQwJAX6USdVGp/jxhCe5Ph/zoaGoTdyXRDN1HF8LUOIg3O0WK9gGtT53EntnSI+a/3ifXW77eBT83+mDEyLLJmHDOubyUBTnNAI+SWakK4lopcg+ughIUGUKrPyOYI7cndGegVvdvphgBJjTrKKHxsf7+ZNUT/g98BARJlwnSzZbPgwOti0UXCeXTDSnnizgc84TveNRvFWg0hWVjK1yXIGkvNQisopqv9uJ6oK2MFHIDr968l29wxUmwUibtdKCHaeVrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 05:50:11 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 05:50:11 +0000
Message-ID: <3bc39dd7-b7b0-4203-a493-0bd872fdc644@intel.com>
Date: Tue, 15 Sep 2026 22:50:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/16] fs/resctrl: Add interface to modify kernel mode
 via info/kernel_mode
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
 <d50aaf18d60787e960b600494d7f33926fb0b51a.1787772750.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <d50aaf18d60787e960b600494d7f33926fb0b51a.1787772750.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:303:b4::8) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ0PR11MB5214:EE_
X-MS-Office365-Filtering-Correlation-Id: 16096e9d-9a60-428e-504a-08df13b65e9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|366016|18002099003|22082099003|3023799007|11063799006|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: JTRhPwqhBCVYUSZqgTf8cLlrjhh4EDhhtvRgoI+WFfOvKYbLkPB8ecfHoAausp0M7JdUciKZJwcVYJKgLO+JpI4G3x4x/KZIcEbH5AZRkCVc5EOwLP2kTBha44l8gfWsqweOWSjbGonvldeTdTAZsDXrfyjKurWGDpeE2eJ2zlOj3hSto1rakXQv/6VbhVOFKScwL5TpIJQGQ0nJWr6i/S1NEbrV8Oz8mBhZLM1n4QaPeiCHF3YCIPdeMW7hygtP5DkkORrNi+tiZrtYTImXWL3xDB+D0AeRUZz2ESUJMUARRNbidnYyLqluWYV57cP74WzzG3bPGWbuuAeFcXvwMR3LD3FUlZsMeuMd/ylyyHGT0k8wBH+Wt9pciX+2nkzfvMOu6vMY4HcsfBzStNT4GQCSKOgMzbsgNGFtc66bW9W5rExWv+LCpgBJFl5hkgf/4fd8aELwWBkD1mqcQee+D4bC05zsfPWMKkuQCpR9/8C/npoO8vtCGJsJUkZb1XAmHcqbodF1QGEh7o2AXsioUrY6N6z02qr25TAgvqtBVPKTRA1ktrcXhbyPp0QZvZnEKSWk0khMuomrsRDO762jublfdB8HXXY8Xr6peTBv0qM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(366016)(18002099003)(22082099003)(3023799007)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXVBZjJUQVdiWjBvZWtvOGJxb2xnR2lQcjNPV2V4b0tqeGdYQUVRQnM2dGR4?=
 =?utf-8?B?dGhFclo3bFo3bnlvQTFsQXVrbmJzSXNxcldKbVEwUng3MWVmZXNIZ3hVajN3?=
 =?utf-8?B?UnRJMDZtMm1vWS9WcXhFSlRQUE9mUXQxL042MlRMMmUvZCt3LzVXN2wvZERu?=
 =?utf-8?B?NHdYcElMWVh2Qmp0Q1A0eFdJc3c1RDY1UDhhaXMzSThGTEVoeXhZT3RSckl1?=
 =?utf-8?B?MHdvYmt4YllaTjZCQVlZZWFHZWFQejMyM0diSUVKTHk1Y2IxTzU1R25DUDla?=
 =?utf-8?B?cm0wbzRjVUx2U3N3TWtBUDdGb3MvL1pER2RZOVcrQzA2L28xZFAwREhTcG4x?=
 =?utf-8?B?dFl6M2N2Q1V1R2xkVEsvaEhrOVlqR0lQR25BbVdVM04wVFVGVGR2ODNuR0d1?=
 =?utf-8?B?NFNYN3ZjYmhUQlBtVGthblBwb0hoRmEvRnVTQXBnVlhWOHdxMnh2RjVvUDJk?=
 =?utf-8?B?d1RtalhQZ1R2amM3c0hCRWVjeEduek5jTmNFbGd2cWhoMjJRVU5nOVc5bWwr?=
 =?utf-8?B?cWJGb1F1cU5rMFBzVVNuYit5bkJBTUJNeVhDMDVFNm5BVFRZRUVMbHlkNlAz?=
 =?utf-8?B?TFRFWDBYZ0J4RlFFVW1ZT3Vvc01iQ0xZYk8zeGdZSWpmSnRsdlgycTRSa1FW?=
 =?utf-8?B?NVQ2ZDZ3aXVjMWhhR2dqOHJXamliamlhQllIeDZSZGI0dkJFY3NuNDhka21G?=
 =?utf-8?B?eENhR1BncFN3aklqeUhERnBKT010K01JNVZHbi93cVAxYzhLa05xQUh0S2xT?=
 =?utf-8?B?bURWcmorVFlJdTYvdHRsNGRmU09uSDZVSHNCYi9lWC9GaWQvRWdhWDMyZkRM?=
 =?utf-8?B?TnFHUkV3c1pob21lVlpiT0ZRbXE5bW1NdnZ0cEp4L2tOZ1RDNW4vL1R0eHpU?=
 =?utf-8?B?M0xaWUZOOE42TVYxTHQvQXZrdjBaNHBhU1lsWWpRQjhyNHVDd0lPZVlDOXdK?=
 =?utf-8?B?RFhnN3Vnb2kxOEkxLzNrb28xUmttWDdoOTJhQVE1Z1dGcjZaNnIzZklRRzV5?=
 =?utf-8?B?RDdUc095MDUrV2ZDdjNOeDBGYlJWN2JKSzVTc0RaTXBESGdYbkhieDJtRklR?=
 =?utf-8?B?NkJRMEtXUW9wY01tcXFibU9mRlF0S1pCK0s1MSsrckJ6Nyt3K0xyb3JabXVs?=
 =?utf-8?B?UmNJUkYwNDlvWDBXS0loaGdIQ3NRMC9XZGw4NUw5WStYQytjaVRnQ0RnSk1I?=
 =?utf-8?B?VXMyYWtlSDgrTGprWU5mMHMzdklOZXRnZ0ZwbHR1NFpLZE44QkZyMDVUdzhI?=
 =?utf-8?B?UXlJcUQ1NFJjUTg0ek1ISGZHMXlLSVdMejlvYXdoSjNpdUxrMGdQMUVPZmd3?=
 =?utf-8?B?RjZ3Rlc3Y2VCZ2RGVmh6bEJsMG8ra3FHTkNueTd4UUNKVGVHSURmUkJVVWQ2?=
 =?utf-8?B?OEJIc1NYQzhVcnZ2NjdFcWZhZUxDU1NlRzhKMUpkdXlZcFMrM240SjV6ZDBP?=
 =?utf-8?B?RWxGQTFLNWdIdHFMOWJ3NUExbVhhY3J0cEpzNHVPYmtsMEtLTElsR0d5SzJo?=
 =?utf-8?B?RWJJczF3cG9wNWlRZG4vVjQzMXZPd1V5dy9PYkxGSWptdS9CVmx1ZDc3ZCtT?=
 =?utf-8?B?RkVsZldHNHN4ZXFEZEhiOEFCek04RXFGU1lIdHl0ZytyMGdxVFNBa3liVWpk?=
 =?utf-8?B?Rk1SY0ZUWEdlZExGSWRlYlJWSGFRZmUvZHMyWE1JZ1crZlh1bFNEbEFmR1Ja?=
 =?utf-8?B?eUZWNjZhNVd5QWIzNHh3MS8yYzhSdjRZUVVxZ2tWUG1jL2ljSEdIVVhLNzBa?=
 =?utf-8?B?OG83cVo1aXArNE54a25rOUFhMUx6aFU3N3M4RmxveEtieTE2akN2dFprZVBo?=
 =?utf-8?B?UW1aVXdicEJIUGk5Q1o4QU4wS3paY2laSUpSdmpIcml1QU1kL2xWOWZZVXpp?=
 =?utf-8?B?WE14NTZiNmtON1FhOW1vZ2J3M1plWkhTMHU3aFhHakQ3NVA3N01HVHg0NHJT?=
 =?utf-8?B?Ung2dzA4YXhteGdaYVlMek1vWU93N01ZMG8yL1lhZTJlZnNhUU9obzNjOGtp?=
 =?utf-8?B?aEpMYzZhbWVNMDRUM3NERjZXZUo0cGpEaDU3dmhYME1KaEkzS3YyOWdRSlEy?=
 =?utf-8?B?WTNhOHlUL2ZzcmVoRENhZVJJSTcwSmdGbFR3TmZwMkcyd2pZTlpIL3J0YkZZ?=
 =?utf-8?B?YzNjTjRJMWplR2lWdERXSUt6VnBNd1JaNzN1VjV1c1psKzNFVFpINVNvTU5y?=
 =?utf-8?B?YkpieHVKbTRia1VjTW9YdytzbGNOdk8xOU5qREFXSjZuQ0hLcFFZQzVyYzdq?=
 =?utf-8?B?cHVPbE02OXBGWDIwMCt0ZEVTeTVpYjJMc2ZJc25yOVdXWkpzZnlSam9CR2Q1?=
 =?utf-8?B?T1ZuTVI4MVNuSU1ZZW82OERwN2I5UzRyNjZaMGVObVM0dWNYR05qVVlBUlFo?=
 =?utf-8?Q?E13WI76PvRU6HSVM=3D?=
X-Exchange-RoutingPolicyChecked: h/YZNdkQa4Ts6b/Uuzz0BvcJ2AuR09NFlfJ6RmNNuuojFTCvM7eyB1pKbEnSDDALgDIx4ORmkiXLI2mDUX4AyWV/vkknhanMl2QhqFfEBB75lYVhDqE5Z2BkxVDfn7Hr1IScyHkpb5+HicYRFxveQWFg8v2ZPElVwfdhK2o54olxj1xpOrLmMEMBQAkjREIXtHJ+bMT8plxMocuFc6Fn/Mf0XPnktylL4Dl+r/qTgVoaLCH9Hp6t8ic+0sv/ZHHdW1nCNB8TRlkPrRKfW/sZDkt1iQGCogFKcp7q0oZqthqdf8zVI8F0a2Mv1HW8skOKa9qn4d+iGE7AZfqMUXiyMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 16096e9d-9a60-428e-504a-08df13b65e9c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 05:50:10.4789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kl24mu3LrBRGruZGgo2MH0R9hPxU4UVERGU62C/BDiImqMUxGfIV7/PQ60GP9i4AFlbxRiSdqGjGM39VNosJhucnh5q1z9Pi0kzvzNTcDOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5214
X-OriginatorOrg: intel.com

Hi Babu,

On 8/26/26 12:32 PM, Babu Moger wrote:
> ---
>  Documentation/filesystems/resctrl.rst |  33 +++
>  fs/resctrl/pseudo_lock.c              |   5 +
>  fs/resctrl/rdtgroup.c                 | 319 +++++++++++++++++++++++++-
>  3 files changed, 356 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index c6e8cf828e18..490e8f534d37 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -557,6 +557,39 @@ conveyed in the error returns from file operations. E.g.
>  	  [inherit_user]
>  	  assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=//
>  
> +	Writes use the same line format as read, without square brackets and
> +	with a trailing newline. To select inherit_user, write that mode name
> +	alone.
> +
> +	For assign_global_enable_per_cpu:
> +
> +	- Writing the mode name alone selects ctrl=assign, mon=assign, and the
> +	  default CTRL_MON group.

Please do not commit resctrl to use specific defaults. The documentation can just mention
that read of the file provides the defaults.

> +	- ctrl=, mon=, and group= are optional, use the same syntax as on read,
> +	  and may appear in any order. ctrl= and mon= default to assign;
> +	  group= defaults to the default CTRL_MON group.

This just repeats previous point?

> +	- Empty ctrl=, mon=, or group= values are rejected.
> +	- A write with both ctrl=inherit and mon=inherit is a no-op.

... because this assumes there are only two kernel modes that can ever be supported
and the other one must be "inherit_user" and thus providing "inherit" for
these two parameters imply that "inherit_user" kernel mode? Could you *please*
consider other architectures?

> diff --git a/fs/resctrl/pseudo_lock.c b/fs/resctrl/pseudo_lock.c
> index dea2b4bf966f..a0b22b95fc08 100644
> --- a/fs/resctrl/pseudo_lock.c
> +++ b/fs/resctrl/pseudo_lock.c
> @@ -536,6 +536,11 @@ int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp)
>  		return -EINVAL;
>  	}
>  
> +	if (rdtgrp->kmode) {
> +		rdt_last_cmd_puts("Group has an active kernel-mode association\n");
> +		return -EINVAL;
> +	}
> +

These snippets (also the changes to rdtgroup_mode_write() and rdtgroup_rename()) noting
when it is and is not ok to make other resctrl changes is not related to support for
modifying the kernel mode and should be in a separate patch.

...

> +
> +static int resctrl_kmode_parse_ctrl_mon(char *options, const char *field,
> +				    enum kmode_state *state)

run checkpatch.pl --strict as part of your patch prep.

> +{
> +	char *opt, *val, *end;
> +	int ret = 0;
> +
> +	opt = strstr(options, field);
> +	if (!opt)
> +		return 0;
> +
> +	val = opt + strlen(field);
> +	end = strchr(val, ';');
> +	if (end)
> +		*end = '\0';
> +	if (resctrl_kmode_parse_option(val, state))
> +		ret = -EINVAL;
> +
> +	if (end)
> +		*end = ';';
> +	return ret;
> +}

This is an unexpected and new pattern to use a temporary NUL in a buffer
then restore the original character. resctrl has a couple of instances where
options separated with ";" needs to be parsed - many of them written by you!
ctrlmondata.c:parse_line(), ctrlmondata.c:resctrl_io_alloc_parse_line(),
monitor.c:resctrl_parse_mbm_assignment() - why invent a new pattern?

sashiko seems to believe there is a issue here. Some of the other sashiko issues
look real to me. Please consider the sashiko feedback:

https://sashiko.dev/#/patchset/cover.1787772750.git.babu.moger%40amd.com


> +
> +static int resctrl_kmode_parse_group(char *options, struct rdtgroup **rdtgrp)
> +{
> +	const char *ctrl_name, *mon_name;
> +	char *group_str, *end, *slash;
> +	struct rdtgroup *grp;
> +	int ret = 0;
> +
> +	/* Skip parsing when group= is not present. */
> +	group_str = strstr(options, "group=");
> +	if (!group_str)
> +		return 0;
> +
> +	/* Isolate the group= value from any following options. */
> +	group_str += strlen("group=");
> +	end = strchr(group_str, ';');
> +	if (end)
> +		*end = '\0';
> +	group_str = strim(group_str);
> +	if (!*group_str) {
> +		rdt_last_cmd_puts("group= requires <CTRL_MON>/<MON>/\n");
> +		ret = -EINVAL;
> +		goto out_parse;
> +	}
> +	/* Split <CTRL_MON>/<MON>/ at the first slash. */
> +	slash = strchr(group_str, '/');
> +	if (!slash) {
> +		rdt_last_cmd_puts("Group must be <CTRL_MON>/<MON>/\n");
> +		ret = -EINVAL;
> +		goto out_parse;
> +	}
> +	*slash = '\0';
> +	ctrl_name = group_str;
> +	mon_name = slash + 1;
> +	/* Require a trailing slash after the monitor group name. */
> +	slash = strchr(mon_name, '/');
> +	if (!slash || slash[1] != '\0') {
> +		rdt_last_cmd_puts("Group must be <CTRL_MON>/<MON>/\n");
> +		ret = -EINVAL;
> +		goto out_parse;
> +	}
> +	*slash = '\0';
> +	/* Resolve the path to an existing rdtgroup. */
> +	grp = rdtgroup_by_kmode_path(ctrl_name, mon_name);
> +	if (!grp) {
> +		rdt_last_cmd_puts("Group not found\n");
> +		ret = -EINVAL;
> +		goto out_parse;
> +	}
> +	*rdtgrp = grp;
> +
> +out_parse:
> +	/* Restore the option string after temporary null termination. */
> +	if (end)
> +		*end = ';';

same here ... removing characters from buffer and then restoring them is
unexpected.

> +	return ret;
> +}
> +
> +/**
> + * resctrl_kernel_mode_write() - Set the active kernel mode policy
> + * @of: kernfs open file
> + * @buf: Write buffer; use the resctrl_kernel_mode_show() line format without
> + *	 brackets and with a trailing newline
> + * @nbytes: length of @buf
> + * @off: unused
> + *
> + * Parse and validate the request, then update the active kernel mode
> + * association.
> + *
> + * Return: @nbytes on success, negative errno on error.
> + */
> +static ssize_t resctrl_kernel_mode_write(struct kernfs_open_file *of,
> +					 char *buf, size_t nbytes, loff_t off)
> +{
> +	enum kmode_state ctrl_mode = KMODE_ASSIGN, mon_mode = KMODE_ASSIGN;
> +	char *mode_str, *options;
> +	enum resctrl_kernel_mode mode;

needs reverse fir

> +	struct rdtgroup *rdtgrp;
> +	int ret = 0;
> +
> +	if (!info_kn_lock(of->kn))
> +		return -ENOENT;
> +
> +	rdt_last_cmd_clear();
> +
> +	if (nbytes == 0 || buf[nbytes - 1] != '\n') {
> +		rdt_last_cmd_puts("kernel_mode_write: Invalid input\n");
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +	buf[nbytes - 1] = '\0';
> +
> +	buf = strim(buf);
> +	options = strchr(buf, ':');
> +	if (options) {
> +		*options = '\0';
> +		options++;
> +	}
> +	mode_str = strim(buf);
> +
> +	for (mode = 0; mode < RESCTRL_NUM_KERNEL_MODES; mode++)
> +		if (!strcmp(mode_str, resctrl_mode_str[mode]))
> +			break;
> +
> +	if (mode == RESCTRL_NUM_KERNEL_MODES) {
> +		rdt_last_cmd_puts("Unknown kernel mode\n");
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +	if (!test_bit(mode, resctrl_kcfg.caps.kmode_sup)) {
> +		rdt_last_cmd_puts("Kernel mode not available\n");
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +	if (mode == RESCTRL_INHERIT_USER) {
> +		rdtgrp = NULL;
> +		goto update_mode;
> +	}
> +
> +	rdtgrp = &rdtgroup_default;
> +
> +	if (!options)
> +		goto validate_kmode;
> +
> +	ret = resctrl_kmode_parse_ctrl_mon(options, "ctrl=", &ctrl_mode);
> +	if (ret) {
> +		rdt_last_cmd_puts("Invalid ctrl= option\n");
> +		goto out_unlock;
> +	}
> +	ret = resctrl_kmode_parse_ctrl_mon(options, "mon=", &mon_mode);
> +	if (ret) {
> +		rdt_last_cmd_puts("Invalid mon= option\n");
> +		goto out_unlock;
> +	}
> +
> +	ret = resctrl_kmode_parse_group(options, &rdtgrp);
> +	if (ret)
> +		goto out_unlock;
> +
> +	if (ctrl_mode == KMODE_INHERIT && mon_mode == KMODE_INHERIT)
> +		goto out_unlock;
> +
> +validate_kmode:

This long function is difficult to follow and this usage of goto is a big 
part of making it difficult to understand since it just jumps to the middle
of the function instead of a cleanup label as is custom in the kernel. 

Please refactor.

Stopping here. Something is off with this series. It seems to be created
without the learnings and patterns accumulated from your previous resctrl
contributions while also ignoring x86 (and even kernel) customs.

Reinette 
