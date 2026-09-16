Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65003382F0F;
	Wed, 16 Sep 2026 05:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789536398; cv=fail; b=LaF/60PcMeYn6La3YOVKZ24P59zxApzLlU4GxLCTyryjZjsnJFN+NPHGHWJo4enFt9xReUynIcjr/KlXHJZnkv0dGLPk9R4C/zj1DWnlXNQHZYopqqvTiBtA7yENPI3C53YGw+gd+gtC3a/sFCVG29W+kh5Xcez5c22KcQS3Gfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789536398; c=relaxed/simple;
	bh=XIKJHT/035incgw/GQeigtXWeadGYwrmFxINywq8ntU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZtoRLK0oCZVzOarT9bvhHIhVEoy/ZjLfP6dhM3RHqMh1UL9nqgDzAlkIJTfEdw9jZv2sf8/o94lSG76Z+UsyVrFhLBs5jsF0LBVTJ40Ah2czrjZLo2HHc0dZH/NMPCn49gc7dlZ8Mjvq5nIiXzPNQcZkC8idOeKfnJeNpTNnILo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMdOh/zP; arc=fail smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMdOh/zP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789536395; x=1821072395;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XIKJHT/035incgw/GQeigtXWeadGYwrmFxINywq8ntU=;
  b=TMdOh/zPuDjIdlAPSGR/BQhcHIr31q9APXNnsT2I1qzwdoGuYnn3VqDz
   weLfLE55T6t6yng+qCYYNGsggjtGDV5lfHl8YjA8OEgrR/EqIvPdfkKsC
   YCgrbtOumLQq749N1uaHMQ3hQVERoywGGbbbkV9P7J9jH4AELCYtrsceJ
   ONy+quKGNeS8PByGLCqmED2KYDAPmP9IymllQ9W7pC7t6NLgqyNB3gtui
   Pyl+ClqEcF4V9aAwmiC27s6pIDvKOAKY14JnrCkxxCrlpsMqafEcYOIV0
   l+0kjed/T7QTXBvzA1KXvTf/HYMzvzyZgFmrsaFCxV0uBFetnd/VyB200
   w==;
X-CSE-ConnectionGUID: 9eZDvhKMSSul8cX2Ejypvw==
X-CSE-MsgGUID: odwu30MSTAOID8NChfJFeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="417826"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="417826"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:26:34 -0700
X-CSE-ConnectionGUID: 5spHNeFESFSvWOyNBb7fSA==
X-CSE-MsgGUID: duHcSDDtSOCAuGk7/1ETSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272760491"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:26:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:26:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 22:26:33 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:26:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7X2gNh5vhvIq7uiPZ9Q13wE3AmR9F7YgzA1rSWObC9obxh7+bt3nKP8QlX50a4saB5oZkek3CdoABQUdg33v6KMnNt0AfM1g029SHsHQGNmhglGaZzmyeK67o5gNs5Pwu2WJKWHF8zjcCStzchTNpmqsGpZechOwo3y6QMPhHU5LokR8y7SHm2YbnM2YdJ8b4n9pmlP4t9HGMJqyHUXy8GghkCVZ41eTyhP9xngs1+W1HEPGKG4eIHlCg+Yskz4256o2nI6AG/NpggoAPXYkEfiWeDYS1TaIGi0t6RXCm2Wxx7KYQczTAFm/w3wlk9qvr0gnzI4oqR7dYzdDX9ScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrFHeLJFZDQNvnjjlM7OIqoRXw8zD9BT8ba2v7Cyjsw=;
 b=XjIkl09F5alsAhPVvfGuwKQaiWQRpy38bel3GA+wFX3wxv55jzqhPS7Gf9TS1zE+aNCuKnn3fBbrbniovYZjqoe+hEpIEWm5CWE2Iy/x/tQEcPa616FAbP/7Xbavmguob6eTN0Fhr3KxxJ6V8g6uKViuzGIfOJ/oxaZI6JiiI3XsL1+fxUhxrUeXch2VyZ/RltZQGjtSZ1vipeaWViZyD9fwXjln3TSLtV9pRdNv0PbNsif6YHax/OzRE7lakfYdmyenKdSg5t5WoPiG2HKSZHGzJCQmwA04gEovds2CNi9+lcAS7q7Zv91bdjNjt9qnzwrv2GAtHtdMpCgQ/hDmAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DM6PR11MB4708.namprd11.prod.outlook.com (2603:10b6:5:28f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 05:26:24 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 05:26:23 +0000
Message-ID: <543008be-688e-424d-a7bb-398bf98b3613@intel.com>
Date: Tue, 15 Sep 2026 22:26:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/16] x86,fs/resctrl: Introduce architecture hooks to
 program kernel mode
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
 <be2bfecd0ac11f2b564860bb2066a7678466bc1d.1787772750.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <be2bfecd0ac11f2b564860bb2066a7678466bc1d.1787772750.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0043.namprd03.prod.outlook.com
 (2603:10b6:303:8e::18) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DM6PR11MB4708:EE_
X-MS-Office365-Filtering-Correlation-Id: c2d0ead2-68fb-40c2-8d43-08df13b30bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|6133799003|18002099003|22082099003|13003099007|3023799007|10067099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: xzvKj/Oua0OZQD9GCAndPBujRqYdC3dIdpA+rw+L8RoACtk4dqsxClY2i0EwrqfvPUbmWrHPSJA25Ixk5q+/skN1qskP0EbPUWTgEzG63VwrVwEuN0Q3+95gDv2R9v6kLtGx5d3ELA6lQgcxW3X3yA7VLI0t49qTjp1Qpptc+h/G6KjTt6dIoA2rQ1/rq9TCtxRodCMiYhxRpG7Ng48BRbKm/KHarosfnv5h4TdMzIGAFUHS+MxDMhelsdU+W0TQGqTPpWGG+HUsdNLdqoC/u33PWyAxoEqx2mJriYDUqBIftT/XjXXl0F5aD/LY24ccJrSHuP9X7rbjx8iF5wIgH08lRcC0g2nm7QgNtfpusW1Gj7I0ezLhcxcBX+c3JP1DyqsImbQh5Ccd++uVtT/TfhnK54WYPI9T7bNHg0KDKT7JISkS1IsKENkHiKD1rr1KnIkKIzh7tP3OsaPZMUUrP1DmLf1hXq6sxe5hdEXn5hDdzcT6KdeQSLcZ+SPW3E+Vf4F/qTURCvuHk3RUW80ZcIRPSGiSQKlwHXc/kZsjd14lohVjwkk3oAiCXPBJUSfxDeqFrWJhV37MMx8Zd+Phsa5r+1QG+hWVzz1At/K4M170HEIALTax8PSSF0iI/K9lHA+/ydoRD7pBMg0vvXn//lI9qxXxjMGXDyfWfF/1J2E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(13003099007)(3023799007)(10067099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZExoL290dHhQeHNscXNJR1gxMDRwNWtpOHp0MXVteWxPK05aYUd5SjBsMElO?=
 =?utf-8?B?MXJzTEV5VlBYTHlyQkNONHI2SHA3ZHFyM3NuYmt3SHFLd2R6MzJobU1PMzVY?=
 =?utf-8?B?WEVrR2JjeE53ZDFGSmk1aWJydjdCMXJrZ1dJZlo5dE13dzNpVUhrN1p6ZDJj?=
 =?utf-8?B?Sk5seWFDcGhHZXBkeTM0OVhUeDBtZnRpaEFjdysrQUJlZGcvOEhnWHZqcGZz?=
 =?utf-8?B?NHZqTkl4QkViNGRDOFZ2Q2NOR0xwNzhsR1Z5T3FpTFB6dTZzRkIwMWdPdXpR?=
 =?utf-8?B?OTR3czhrREw3VHNtaWZXWDBzUnRDaW02b1hyZ1JwdXdkYkNNeGdNaGx0Smh2?=
 =?utf-8?B?WjdaaytVZzJaYVRYS2RMcGE5TDNlUlJBbWdFV0pEVUppK28rTFRHbC9MN2VK?=
 =?utf-8?B?R00wTnZiaXl3WWpmMytGMjlPS3lyek1la2dBVTN2U00yT2hOR2VVZDgxWktZ?=
 =?utf-8?B?VnRNdW1mMGd4aDVJYzF6V2ZGelkzUjE2RXBNYndQSmw0bFFyR2hlTUNWMHFm?=
 =?utf-8?B?MURNcVBvbnArTG1ibktZSitlWVgya2czenBMZG16YVp6TjFpN09abVFwTEQx?=
 =?utf-8?B?SWFkSVQ1UEQ4d09neWZWSVRVWWl1MlpLZ09ZVXpPaDEwYU02OXBiN2tWTGZq?=
 =?utf-8?B?ZlVWSWcyWVN0azg1SXpwUzZ3QVBGQVdIeTlVdGgwRXRUUXJRTDFPMzg2NENW?=
 =?utf-8?B?cWhwQ2NINlFBUHB0L0QvcWlJY2Z5UWJxaXFSSVhQK2ZFenJxWHpiTmFLdjl5?=
 =?utf-8?B?S25PQUlaUXQ0R0lNbXZWNWh1S0dPSmtqZFkwYS9wQWJxUDhPQlR6N3JRNjJP?=
 =?utf-8?B?d24xb0VhUDJoanpQQWxhY0M2RkpJc0dSakVFYS9MSnRSd0NrOHFqOGs3Vk05?=
 =?utf-8?B?NmJoSXphVUZvZ2g5ZGN5VUhrL1VoMXNXQWEzR1N4MUx4MjZZZVdwdFl1enlZ?=
 =?utf-8?B?KzRucFFsZEZwaEpxQk9vY1JwN2tjZU1KTU1oSGFUbjBrcDhYM1NJTDNBYisv?=
 =?utf-8?B?bDVpMlpWeXlYT0ZVemdrV1MxdldKd3pPdVpNU09oNzU2RU5WaEJTdVZ2Y2Ur?=
 =?utf-8?B?N1I1RkJaeUc1V3ppcXlaVlhxbUxCR3I5Wnp5RktOZTNKcXhiRk1xN2xqWkM4?=
 =?utf-8?B?alZoZE1obmovbnY1SDk0c2FaUklvSkpoWHRZU1pXd3FkUVV6S3NpZkU3ZVhE?=
 =?utf-8?B?dDQrdEx2aDBYc3hZKzFsd1Z2Rm92VktibFlEcCtjS0QzeVpOMkluc01KNmU3?=
 =?utf-8?B?RnhJd3Z1YkVDNkZTRUJzejZJYmNGVitYWGJlWGl0REx5bVhwbkxaMHE5Slho?=
 =?utf-8?B?Um9FUmpPZ1M5NEc4YTROeW40TTNJeWxsK2dxQVM2bDJoMFBTL29oNGp1SHpO?=
 =?utf-8?B?SXUwclBybWZXTGcweCtVWkEyUjNQb2NWN29zZ1YyclJSdWJlTzMzN2JDcnE1?=
 =?utf-8?B?UXZGdG44RGZCOHpKL2ZWRFdYZ3JXM2dJc1krck16bFFFeHl5UVZZckg0V2Iy?=
 =?utf-8?B?MkhzYVZqS1R1RXdMcWQvc3U4ZkRVNnhNQVdxZ0ZzOXlWRFJPdXUrRlFlazMx?=
 =?utf-8?B?RnFZdU15bEd1NThwZCtUTnZiRzlLMy9mazcyTDJqVWw4R1daS2wwN2loaEZ0?=
 =?utf-8?B?UXQ3Q243aXgzWFppSVp0bTYxREd2VVZXeEVvTXp1NDVrZUFnczZGa0c4aCto?=
 =?utf-8?B?SERIVk1xZisrS1h0dHlHRDR3SnFZZE92dlV4R0V2dUR0WTFyVHM3VmFHUmxE?=
 =?utf-8?B?bTdtaGhDcG5uSDZzaHprUG5KREdpQUsvM2ZRa084ckF1OWpDcVowcG96aklJ?=
 =?utf-8?B?Z3ZFZVVwZG9FUHJ5a1pwalVSUG51S2lxRXpmV3JLb0xNMm1ocWloUHhFRHpw?=
 =?utf-8?B?ZmJaUytwQ1JFUDkyVU5FcHptdWZTcG1Ia2g3WXN1YlZKU1NmWUJieURTNmxj?=
 =?utf-8?B?N2toS0g5ZUVqdFNabDY1d1NzeHFrd3krdm55dmFPbUpmTWlSMkxWSnFGV2ds?=
 =?utf-8?B?cjE0Q1ZVM01vNjV5WWRZdVZkaml6ZHE2ejEvZkFVWmJFQTFCbGplczlLVEVK?=
 =?utf-8?B?b2Z0NjlKRUxuSGVNMjBwNUtKTTlrNzYzRFZMR04xdEZITWVTbS9VZUxjb3ps?=
 =?utf-8?B?WkFKNHllV3llREk3aDRkQ1pJRDRBK2hFQTEzMS9wNEs2YnNXT1c1WG9JbXhW?=
 =?utf-8?B?SXdZYURMZWgrMURpM1kzd21qZ1JUT0RWL2NXYVZBNzBhMDF2YW43TUxab0RS?=
 =?utf-8?B?K2RwSVo1UXh6TVZib3VSTFBNSWZIdEVZbXYxWHMzbFNuekRMQW1EYVZ5NVp4?=
 =?utf-8?B?dUUyTEk1aUd4K08vbVU0bnZuWDFGVWxiMUlvUTRuZVBXSExMUkFpZDV3dDJ4?=
 =?utf-8?Q?2uT+zUawMj+kiPuE=3D?=
X-Exchange-RoutingPolicyChecked: x5HCObl10+isEXc01npGWMqiFdZs9MiL7uz2D7dTHRsgzj5b3WnSdH/4MdqlVXtYK62/AYCd53KW1W41e6hRhvpN836/Nl9ClaDqVUZI8gySj+yrgDeDmAYXNWLYW4qdno7PeQBQqVMlWa7kQPEXI6CkpRKVIC1AQuSdY47EPKBD15a/Sgc1pKr1+S3cwnmdI0X8Tr7CVuEzPWIObiM4Walb6EUEPX7ZHW578qT5+w/mqI1tKjLNvsGpjoKNJDkRUSvCiko8dw50DfdHga94jTGc1iSIvBzPalEM7TmnA675jJdW4vJ3FKJrGrzAzZIBnB7gCd8vnR0+I5UyxdMRUQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d0ead2-68fb-40c2-8d43-08df13b30bf3
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 05:26:23.2266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pntr58sbRMrKbfxFxXERdSng/dvFHmWj+1BTvBaEjdQGGkaO2n3Tn5sw+vcI4z09CeU13EtkSfQN0q60WJbpmLzgxtLuQs3vxofuLOlN6WE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4708
X-OriginatorOrg: intel.com

Hi Babu,

On 8/26/26 12:32 PM, Babu Moger wrote:
> Kernel modes defined by enum resctrl_kernel_mode must be applied on
> the CPUs when user space activates, deactivates, or updates a
> configuration.

Not necessarily. This is just what PLZA/RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU
requires, no? The "applied on the CPUs" seems specific to the
RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU mode - hence the name includes
"enable per CPU". Above text implies that all possible kernel modes
require this, we know that upcoming ones don't so this could just be
specific to the only kernel mode that needs it?

> 
> Generic resctrl has no architecture hook to apply these modes across
> a CPU mask when the active mode changes.

I cannot believe this. v3 of this series wrote the changelogs of this
new feature enabling as bugfixes. I asked you several times in v3 to not do this:

https://lore.kernel.org/lkml/2429a51a-92ad-4810-bee9-44bd6fba3443@intel.com/    
https://lore.kernel.org/lkml/57f6324b-6340-4633-b3a0-b40683a5ec12@intel.com/    
https://lore.kernel.org/lkml/10c18df6-d990-4050-bd79-1ca914eee673@intel.com/ 

v4 did not follow that style ... but now this style of presenting enabling
code as bugfix is back in v5! In v2 I already expressed frustration that every
new series seemingly starts from scratch 

https://lore.kernel.org/lkml/57c72d52-e62a-44f6-a08a-891a354058e5@intel.com/

Now a new version seems to forget feedback from just two versions ago :(

> 
> Add resctrl_arch_configure_kmode() to program kernel mode allocation and
> monitoring associations on @cpu_mask. Accept separate assign_ctrl and
> assign_mon parameters so CLOSID and RMID can be assigned independently.

Below is just a sampling from the last two versions of me asking you to not
just verbatim describe the code:

https://lore.kernel.org/lkml/db9c0b3e-184c-4100-b59a-91f6e818fd31@intel.com/ V3 
https://lore.kernel.org/lkml/6273f424-9701-4731-9568-10b3eef8b5fd@intel.com/ V3 
https://lore.kernel.org/lkml/57f6324b-6340-4633-b3a0-b40683a5ec12@intel.com/ V3 
https://lore.kernel.org/lkml/0764a430-f64a-4655-a44f-5c2ff15f2ed7@intel.com/ V4 
https://lore.kernel.org/lkml/0764a430-f64a-4655-a44f-5c2ff15f2ed7@intel.com/ V4 
https://lore.kernel.org/lkml/681e0257-80e0-44c3-b826-20e314a3eb0d@intel.com/ V4 

Again, please do not just verbatim describe what clearly can be seen from the patch.
Use the changelog to describe why the code behaves a certain way. 

Maybe you need this request to come from Boris instead before you start following
the guidance? Here are some examples:

https://lore.kernel.org/all/20240702124524.GEZoP2ZKcTcKl1ca1R@fat_crate.local/  
https://lore.kernel.org/lkml/20250911165433.GBaML-yTUZHkywuJIe@fat_crate.local/ 

From here on the changelogs all seem to have this strange pattern of:
"Architecture needs X"

"Architecture is missing X"

"Verbatim description of X implementation"

Apart from the issues mentioned above this interchangeable repetition turns the
changelogs into a blur. The x86 format for changelogs is described in
Documentation/process/maintainer-tip.rst. Just follow that. This should not be
new to you.

Do not expect further comments on any of the changelogs that follow. I consider
them all unusable.

I clearly demonstrate above that you ignore my feedback. There really seems no
reason for me to provide any. I'll make a final attempt to provide feedback
to *just* the patches (as much as I can without being able to use the changelogs) to
try and help this work make progress.
 
> Implement the x86 hook to program per-CPU PLZA settings. On x86, PLZA
> programs these associations per CPU, with CLOSID and RMID configured
> independently.
> 
> Provide an MPAM stub so the filesystem layer can call the hook on systems
> without PLZA.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> ---
>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 38 +++++++++++++++++++++++
>  drivers/resctrl/mpam_resctrl.c            |  6 ++++

Needs "arm" in subject prefix. 

>  include/linux/resctrl.h                   | 33 ++++++++++++++++++++
>  3 files changed, 77 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> index e74f1ed54b86..40fd5e31c94e 100644
> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> @@ -131,3 +131,41 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
>  
>  	return 0;
>  }
> +
> +static void resctrl_kmode_set_one_amd(void *arg)
> +{
> +	union msr_pqr_plza_assoc *plza = arg;
> +
> +	wrmsrq(MSR_IA32_PQR_PLZA_ASSOC, plza->full);
> +}
> +
> +/*
> + * Program Privilege Level Zero Association (PLZA) on @cpu_mask.
> + *

Please follow the custom with function parameters described first, followed by
description.

> + * When @enable is true, kernel mode allocation on @cpu_mask uses @closid from
> + * MSR_IA32_PQR_PLZA_ASSOC if @assign_ctrl is true, otherwise the CLOSID from
> + * MSR_IA32_PQR_ASSOC. Kernel mode monitoring uses @rmid from
> + * MSR_IA32_PQR_PLZA_ASSOC if @assign_mon is true, otherwise the RMID of the
> + * current task.

This just seems to duplicate the description of union msr_pqr_plza_assoc?

> + *
> + * @cpu_mask:	CPUs whose PLZA MSR should be updated.
> + * @closid:	CLOSID to use for kernel mode allocation when @assign_ctrl is true.

Contrary to what the comment states the closid parameter is always programmed, whether
assign_ctrl is true or false. A valid closid is thus expected to always be provided?

> + * @assign_ctrl: Whether PLZA should provide the kernel mode CLOSID.
> + * @rmid:	RMID to use for kernel mode monitoring when @assign_mon is true.

Same comment.

> + * @assign_mon: Whether PLZA should provide the kernel mode RMID.
> + * @enable:	Whether PLZA should provide the kernel mode association.
> + */
> +void resctrl_arch_configure_kmode(const struct cpumask *cpu_mask, u32 closid,
> +				  bool assign_ctrl, u32 rmid,
> +				  bool assign_mon, bool enable)
> +{
> +	union msr_pqr_plza_assoc plza = { 0 };
> +
> +	plza.split.rmid = rmid;
> +	plza.split.rmid_en = assign_mon;
> +	plza.split.closid = closid;
> +	plza.split.closid_en = assign_ctrl;
> +	plza.split.plza_en = enable;
> +
> +	on_each_cpu_mask(cpu_mask, resctrl_kmode_set_one_amd, &plza, 1);
> +}
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 9d223057953a..286284ac8423 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -139,6 +139,12 @@ bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r)
>  	return false;
>  }
>  
> +void resctrl_arch_configure_kmode(const struct cpumask *cpu_mask, u32 closid,
> +				  bool assign_ctrl, u32 rmid, bool assign_mon,
> +				  bool enable)
> +{
> +}
> +
>  void resctrl_arch_pre_mount(void)
>  {
>  }
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index 4245d1e65ccc..8b30eef835aa 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -729,6 +729,39 @@ enum resctrl_kernel_mode {
>  
>  #define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
>  
> +/**
> + * resctrl_arch_configure_kmode() - Program kernel mode association

resctrl_arch_configure_kmode() implies a generic kernel mode callback but the
parameters are specific to the global, per-CPU mode. I expect that either the
kernel mode self be a parameter or the callback be unique to the kernel mode.
To simplify the parameter management this could be the latter and renamed
to something like "resctrl_arch_configure_kmode_global()"/"resctrl_arch_configure_global_kmode()" ?

> + * @cpu_mask:	CPUs to assign the kernel mode on.
> + * @closid:	CLOSID that matches the RMID to program kernel mode. Depending
> + *		on the architecture, the counter may match traffic of both
> + *		@closid and @rmid, or @rmid only.
> + * @assign_ctrl: true to assign @closid for kernel mode; false to inherit
> + *		association from the user-space task.
> + * @rmid:	RMID to program the kernel mode. Some architectures may use
> + *		CLOSID/RMID separately, others will consider them together.
> + * @assign_mon:	true to assign @rmid for kernel mode; false to inherit
> + *		monitoring association from the user-space task.
> + * @enable:	true to enable kernel mode association on CPUs in @cpu_mask;
> + *		false to disable kernel mode.
> + *
> + * The function can be called in the following scenarios:

"can be" -> "is"?

> + * - If a per-cpu kernel mode is active when user space switches to a new

per-cpu -> per-CPU

> + *   per-cpu kernel mode then resctrl_arch_configure_kmode() will first be

"a new per-cpu kernel mode" - what does this refer to? There is only one
per-CPU kernel mode, no? It may help to refer to the kernel modes explicitly by
their enum value to be clear which modes this callback applies to.

> + *   called to de-activate the active kernel mode on all CPUs that the
> + *   kernel mode is active on.
> + * - When user space switches to a new per-cpu kernel mode then
> + *   resctrl_arch_configure_kmode() is called with cpu_online_mask.
> + * - When user space adds a CPU to an active per-cpu kernel mode.
> + * - When user space removes a CPU from an active per-cpu kernel mode.

Above scenarios all have the "per-cpu kernel mode" in description that
confirms that this callback is dedicated to this single kernel mode and
not actually a generic "enable kernel mode" callback.

Below does not seem to fall under "scenario" like the above but actually
represents a contract between fs and arch that can be separated and
highlighted.

> + * - resctrl fs will always provide the same closid, assign_ctrl, rmid,
> + *   and assign_mon parameters when activating a kernel mode, all

"a kernel mode" -> this callback is not generic so it should be specific to
which modes it applies to.

> + *   interactions (adding/removing CPU) while the kernel mode is active,
> + *   as well as when de-activating the kernel mode.
> + */
> +void resctrl_arch_configure_kmode(const struct cpumask *cpu_mask, u32 closid,
> +				  bool assign_ctrl, u32 rmid, bool assign_mon,
> +				  bool enable);
> +
>  extern unsigned int resctrl_rmid_realloc_threshold;
>  extern unsigned int resctrl_rmid_realloc_limit;
>  

Reinette
