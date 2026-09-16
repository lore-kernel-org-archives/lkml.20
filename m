Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DED1DA60D;
	Wed, 16 Sep 2026 05:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789536889; cv=fail; b=Hivcx941h0NRgjRl9Taaprzufb7F05IIBjOLSNmmkPyeYHxxKeortJQbeoubcnjfeZDRY6QHDPkfl1R8Un2wIh3XicSuW1ujnp7h/x6hb0/xw3uc+8WGK2eI0/A2/lKkChrfXInEd38ysZiZkbvizT4iSgBliANm+Rn4uUJCq+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789536889; c=relaxed/simple;
	bh=w0ph5t54R8mLZ4dp0YlwMtE7Rz478B9fvy99IOA0X+M=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oKp6230In71J8YWra2fAjI5LZspZ+3zDauYZ7ESID10LA/ocB+J3NTNHVxTdHVz0xJcR9vuiQrFKonnnJ+Ubu20du7U2MA3i4I/bqAafnGKgU6npjvcEzAG+n+UZTOLulT4DkbnEJV33HDMWsRoTlsn6dXeXu8SeZpSNEbQpXGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZBn4dja; arc=fail smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZBn4dja"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789536888; x=1821072888;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=w0ph5t54R8mLZ4dp0YlwMtE7Rz478B9fvy99IOA0X+M=;
  b=JZBn4djaGZ7Wo73UM/Mp5yYPQzeeviMoCe4ekfKXodbUNbuVW8qvIzAO
   6okjN1VqYGSEOZp57ma67e0JFkvbYaGcbvGL0vYh9GHMvQfM8T86KvIDB
   zHAJLeytw1qHhBP7VMNAiEmp4SL9CVPBdPI7lYFROXIH34kbs0JMHT2Dg
   3VGsC9g63rfIDDugNFp/UprTnCYzUUAX//MgbPFXVO1aT4UO06VCgUhjM
   2f6PmpYkDKicPczaCMlBBGOCJ27jQYTWti1zL28nCDgxmvEGlnh2TkfNG
   Zg5p645ml0/BfXV/oVyRNFxmpleXYJzTVr7KTezEyvsaB6zy/4ydeaQrc
   w==;
X-CSE-ConnectionGUID: yBkKHAchROyFjuFO9VfymA==
X-CSE-MsgGUID: Le+gtDVzSWCdb/YtniLeYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="412289"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="412289"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:34:47 -0700
X-CSE-ConnectionGUID: S0Cv+E4uRXmiWBAC72v+XA==
X-CSE-MsgGUID: zPMNr+NxR+WuZ7ovdRXCtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296728992"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:34:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:34:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 22:34:46 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:34:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWG93IbksNC+uxLPe8Gh4+MfYGjkqrx+HtDu6lA1gZ3v6RAcwvnZ0PcjS/qwv7boHjklCbfhkPlSeof96zvakA7QMUuuu6BdptAW0iTs9Wu5PXtOxMvdiZUuyzJResaOW8a18b8G1K9LLSpYkjtjpO5XiEN72rpg3h053Cuxg6bdRNI7vb+7T4SijFnxwUjNq2C9TWPMSiU03aqg4WekLwM2FKaiGbNeyBnji1FF0E/whZOiLlaLtfI60Mp8NN9dQv0Jc7O+xpojgb36kXpfFYcoRn2C2srhhp0oSMAGimFiqGq6Ah541FHSTaD7eVnWClzAioV0S59Jv/Kk0EX18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpfR/xl8Eu37Ygqp6mgFwMp1XYvggl2h3okGDpad0nc=;
 b=KZZnG8lqiMtEZQZ32rPX+z2GQ6nw385Lbw9qofxQPBjl6HoXqzZClLfiwJj4/2vOzk48eR08dYgiv2lnnsaE0CFVmnHbhrZO4QN+ePqSaojnKqKk6iNEmCb8bf0Y7YyTNq60XNRKPnMkO65WHII1lqzaeVoC2AezNoHJ5v/Cr9FMAJFzqOqBYjfp/AtEEoNv6pFO5rkJibPw64wsBaScVN4a+sU5Sd1W8uSs5v2bTeK9JwtPExkxOc6m73jWYoMMxKxXXmFcRxJh2ZsXNQTCzjRMJex5N02ohxIk86oN3t8sImmo8wKfQsDxwBopN1BJna8kPmDrFqtRrizz5cX8tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DM6PR11MB4708.namprd11.prod.outlook.com (2603:10b6:5:28f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 05:34:31 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 05:34:31 +0000
Message-ID: <ef8804d5-f20c-49a1-87cf-ab39437a5f0d@intel.com>
Date: Tue, 15 Sep 2026 22:34:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/16] fs/resctrl: Introduce kmode_cpus/kmode_cpus_list
 per rdtgroup
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
 <0ad1110a1fa2c041d71f50b0d756815676c4dee6.1787772750.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <0ad1110a1fa2c041d71f50b0d756815676c4dee6.1787772750.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::7) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DM6PR11MB4708:EE_
X-MS-Office365-Filtering-Correlation-Id: fc59f90e-2ac6-404b-66e5-08df13b42ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|18002099003|22082099003|3023799007|10067099003|56012099006|4143699003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: J+88qG1fD3gpGP1Nj7v4moJlMvz9w3ZbmStybcKkmiPGb1+Hvo7sCTEkD+CVfWpI9A8+LVyJ+ILuHtUHJyNoGQAykwqGzQYw8MfaRAA6UQAzflI86Uc8P7mrPMiqNjcjzm3Tqkz8tWE6z4nOR4M7EmxhXXxBvPGnuUMSZruTyB6RiiZEfUlMu4ifKWEursjtO+VUFO5tJceahNlL0UxPRRbXnYjEnoHCNbjhIx0NAsdmuQBZ+JHrP70w/eDuqR7VBcAOHG6+lUT6sgj3KBDSKr8aZUYWXiz9BOBg4VKH6ryCixxBD7cBcDopzPzUejOG2bQ8aQDRb7oZGEUGnOpKg1JWxJkxAjPsjsNV3dzBbU8drz8kuT1iQtK8uv0urkpPdbg7ZwRatN5J07UbKsjv1N/aUPccbyV+l6CfCRbVeG9j7fJxYghoxyTfGjleEM6Zah1lNYAb+86qQLVLyhLldahEQ6VMgif8VNexd1FMxJm5ADAt5LVP1QNk1zcJY3vISFh/pOUIqP6hsRFPTNq58P8PB+77GD0dWD8iC95qKIe5iuHmQeQC6LHzRvYDj0pW7VyHAE30nRGfWe/UVy5PtXbKzaZEITE33xvvG5KUAB4JkznaJSQzfyuC6liM8vOq+WGyyNnSN6QnGlDewPzdeBDl0tmoxlYYpZfSNHPrg9Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjNHU05UNGpWYjNnanhxdWJiMnZEWEZRUUdiODlJbCtOY21xNEpkREgrN0ly?=
 =?utf-8?B?RjJ1dnBXejd0TmdzblhZUEtJMm9HSVZ5YnJXSC9zd2dMNXZEVjM4NWc3SXdy?=
 =?utf-8?B?MWNmQ1Btb3h3Ykl6aFZPTzN4VmV6REErbUlBazNXaXhwTjgrTlcvQzduTzNN?=
 =?utf-8?B?YW1RbDNocS8yaUk0WDd2aFU5Z1o0d3pqSWJCbTB2dVhtZ0R3MkR4VGxCUFNP?=
 =?utf-8?B?NjQ2Z3o3dHQrbkViMkY4SkZYUGVLWXRRTUlVcFpuMmNya3dGOEwyZk5iZnFr?=
 =?utf-8?B?ZjR3bE9aQ0xFbkNTNTVGbWp2ZTI4WTcxbE9Ec1ZieEk5MFJpYmdGYU84Q1RQ?=
 =?utf-8?B?SlF2ZlBaUW1VQWltQkZFYW1sSzBncHg4dExHeGVpZHNVaHVuRjRJSGxYZlZo?=
 =?utf-8?B?K21va2pVeEV1KzlZVjViMWJobStHYjFCN3BmQm5NTGsrUDVkOTFwS0VGc2FB?=
 =?utf-8?B?Um9OcUF2N2p5ckN0WmtUMXNiMUtNakRlUmJyaDM3cWxORjB4cVcySEtHWVd5?=
 =?utf-8?B?LzdseU9WOGY1eFdPNDNEUXNDTVpSZkZZbVVVcGZDY29RK3pWSUVDdXZUREFa?=
 =?utf-8?B?QTdPV2pRMEd2OW9oQmRIK3V4ZU9FOHRvYjhacnBQNlk1NWlxVVdSMkpJMkdz?=
 =?utf-8?B?Ym5DbStzZlNxYnAzbEo5TXhpZSs4eHp1QTBZWnYvMURqMzF3bVhFWnVoMjFW?=
 =?utf-8?B?MUNKdUM5SlBjWjlqVms0cnFiYUtEUmtsOVZneTVMQnVYV1VoRHhmd0hhYVhi?=
 =?utf-8?B?cUhZVW9HVC8vbFpUY1NKdHJpUGhaM3dvUjhLMHlocFdhTjNWUFd6Q2ZzalFq?=
 =?utf-8?B?cHlKVVNFWWxYRUhBUnpyVmpSN2dQdTl6NWY4TEloUElNMW1QcG9tUDUrcUdx?=
 =?utf-8?B?Rnc3bDU2bDlOS3JkT0dwbHZnTmdHc3prUWoyYVViOHRLTE9rOVVNem52Y2FG?=
 =?utf-8?B?ZGRKQ1NWbG93WUg2SXJIZHdMeFpKcFNQMS84Ym9oY3NuRjJSRzBLS25tMW1O?=
 =?utf-8?B?dE5hL2VGNnNaaUs4VFp0TkFHTkZXSm9QRDZYMlJzbDlDdzVWbDk5c3pzSXcx?=
 =?utf-8?B?a0dGdXpMR3NUOTNpR2pLZkl6TlpxNUtBQkNwOW5oUFlFVlBHalRNMGFKTnNr?=
 =?utf-8?B?KzJqYVFoa05MVVRNbmR4YnVwQnluV0MrMmZnUHRjT1BZK3hUOFlTTElTckcx?=
 =?utf-8?B?UWRpanlucDVXS0hXS3RXL29wVE1zSFpmdlVzUGZ1Y2s2cys5eFFCZTVVRzNz?=
 =?utf-8?B?cDF5R2dMd1VtY2RhbmYzZStYblJjNWhlWnk3MFUvNUJLWmVqY1BPdCt0dUc1?=
 =?utf-8?B?a0NwNUFNdnRsZ3g5T2hrdEhEOVV2K3BvcEVNSTRVaWRDSGxlQ1JmYnJuL3BI?=
 =?utf-8?B?V2phb2hnZHNORnFIa1FKRUdRb0VpcWs3bWN6V2VMSlRtUm1yZGZIN0V1azhT?=
 =?utf-8?B?WVBXWWNqRUp2VjdPcERLNGlFMloxRzQyWkdpd0Vqckp5aUY3OGMwUW9Zem01?=
 =?utf-8?B?blVvSHlnaG9DM2d3eTBCUldFNlpwZmZKODBMTTR5UUpEd25ydVU4ME9QUFFI?=
 =?utf-8?B?cWw2WXhsUFBIVVB6OEt3V05ZQ1MwK3N5ZDM2bmpVUEpFSEpIZGxaaUJMK09M?=
 =?utf-8?B?TmRyL1F1R29yK0pUQ2paTEYyZXBFRVNIU2RJQ08yM21pMWV3Qlp2VWMyWE5U?=
 =?utf-8?B?UVE0eXowZ2RtQW9TTlYyWjZFWFFBeDhGbVB0clVVRXRLYjhhaTY5Qm4zQ00v?=
 =?utf-8?B?TjJFNUZtRjFKeitYVzFVLzVZd3l0b25KeUlSdjJUckpvSldpaXI4dWFQS0dK?=
 =?utf-8?B?UlROdjd5ZlVkVzNFa0Z6RUs2Nm0vREoxZXpkSjlQUVV0NjRSMDFnK25UcWxL?=
 =?utf-8?B?Y1JzMW1SNEdlZkt5d0k3RmV2NlZiMGVWTVQydjRObTBaUFFaSmxaTGdXVkhn?=
 =?utf-8?B?WUw0TDNaN2hZK2llREkrSllBZTMwNElENUhTU2lYblpzdXJGb0tDZDJCVzFE?=
 =?utf-8?B?TWhUSzdnYjJzL0FWNDBNWThwaGNLTHVDbVhMVU5ZbnBlS3V4NHkydk1JMjQ1?=
 =?utf-8?B?cnd4dnRqbTFoNlJWOFlGdXVTRDhtOHNFTHhMZVk3STJMSWE0ak9mREplWHM2?=
 =?utf-8?B?YkFZaW5ybGs4UGhxanhsVHpDd3EwYks5dDA5a0p6ZGNPWFlRT2Y1WFVUREcr?=
 =?utf-8?B?a0lKV3lDUDk5ZUJoRXNhODBYeE1mcHF5OWo3UStTNnowWEdIV29SRkFmL3Nr?=
 =?utf-8?B?dkpOcWt0ellxL05FVlJHMUNWUElHbWxXOFYyMVltR3B3bWNhTjcvQm1kTzJB?=
 =?utf-8?B?TEFXZGE4MkdwbjlweFhsTHlrTWEwWXRZbUJVTnAxV0VjemNTcWdpN3BlUHhx?=
 =?utf-8?Q?VBnBJ63PcK575B2w=3D?=
X-Exchange-RoutingPolicyChecked: Kj/A3lOu/Ahg0fdH5FJx8lZ1CBOptT1FCCRXn9ASi09ps/9+6fZWlAZd80VUL3KEpZpVdqT2Qe0L5pYdcfshwfmyw0Orjgt6zRlhzyeLMSPuifsmjsODYPz0A8LfprrgaV3lOdkWvo5zRTJsVXygdPb8ZWzycGkgK8cNznmZ3KQHKY6RB8BeaVTP38Z6YobFhFsMYYaW9UD08OhymMNYLunHoRrXLzQmIg14wNvMcY/NYHkDrXeOd9RPHvO5/bNDc27tlPbgGoLeSf0v8Oh3AO5CAAWiBsKUihE8TpKOF7w/p9IoANlSz+YSh7SEixPGTd5zdPy01XKt6Ip7SlO88g==
X-MS-Exchange-CrossTenant-Network-Message-Id: fc59f90e-2ac6-404b-66e5-08df13b42ea4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 05:34:31.2102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ge1Q277BaEUBNvS35ygIZ057cfTNYUytgJMGnt7V5GHA8HweMJAZ7Q7h9cDkVoTR17sRcr/4mBuvS5gZb/uOukVeoLm2KumfMqBnNsQNjzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4708
X-OriginatorOrg: intel.com

Hi Babu,

On 8/26/26 12:32 PM, Babu Moger wrote:
>  fs/resctrl/internal.h |  5 +++++
>  fs/resctrl/rdtgroup.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index b56f95625072..01f9f596f9b1 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -216,6 +216,9 @@ struct mongroup {
>   * @mon:			mongroup related data
>   * @mode:			mode of resource group
>   * @mba_mbps_event:		input monitoring event id when mba_sc is enabled
> + * @kmode:			true if this group has an active kernel-mode
> + *				association

This really just seems specific to the global per-CPU kernel mode. Why is
it necessary? Is resctrl_kcfg.active.k_rdtgrp not sufficient by itself? (more below)

> + * @kmode_cpu_mask:		CPUs in this group's kernel-mode association
>   * @plr:			pseudo-locked region
>   */
>  struct rdtgroup {
> @@ -229,6 +232,8 @@ struct rdtgroup {
>  	struct mongroup			mon;
>  	enum rdtgrp_mode		mode;
>  	enum resctrl_event_id		mba_mbps_event;
> +	bool				kmode;
> +	struct cpumask			kmode_cpu_mask;
>  	struct pseudo_lock_region	*plr;
>  };
>  
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index d2fff8adf915..06e74b027044 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -389,6 +389,32 @@ static int rdtgroup_cpus_show(struct kernfs_open_file *of,
>  	return ret;
>  }
>  
> +/*
> + * Display CPU masks for the kernel-mode associated resource group.
> + * Supports both "kmode_cpus" (bitmap format) and "kmode_cpus_list"
> + * (range list format); the output format is selected accordingly.
> + *
> + * Returns -ENOENT on error.
> + */
> +static int rdtgroup_kmode_cpus_show(struct kernfs_open_file *of,
> +				    struct seq_file *s, void *v)
> +{
> +	struct rdtgroup *rdtgrp;
> +	int ret = 0;
> +
> +	rdtgrp = rdtgroup_kn_lock_live(of->kn);
> +
> +	if (rdtgrp && rdtgrp->kmode) {

First, it would be helpful to explain why the second test is needed since it
is not obvious that a resource group may get re-assigned while a user has this
file open.

Second, could a check of rdtgrp->kmode be replaced with a comparison between
rdtgrp and resctrl_kcfg.active.k_rdtgrp ? If so, why is rdtgrp::kmode needed?
I think one part of this is how this series blurs between a generic
"kernel mode" and the specific only-supported global per-CPU kernel mode
that makes it difficult to know what state can be used.

> +		seq_printf(s, is_cpu_list(of) ? "%*pbl\n" : "%*pb\n",
> +			   cpumask_pr_args(&rdtgrp->kmode_cpu_mask));
> +	} else {
> +		ret = -ENOENT;
> +	}
> +	rdtgroup_kn_unlock(of->kn);
> +
> +	return ret;
> +}
> +
>  /*
>   * Update the PGR_ASSOC MSR on all cpus in @cpu_mask,
>   *
> @@ -2288,6 +2314,23 @@ static struct rftype res_common_files[] = {
>  		.flags		= RFTYPE_FLAGS_CPUS_LIST,
>  		.fflags		= RFTYPE_BASE,
>  	},
> +	{
> +		.name		= "kmode_cpus",
> +		.mode		= 0444,
> +		.hidden		= true,
> +		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.seq_show	= rdtgroup_kmode_cpus_show,
> +		.fflags		= RFTYPE_BASE,
> +	},
> +	{
> +		.name		= "kmode_cpus_list",
> +		.mode		= 0444,
> +		.hidden		= true,
> +		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.seq_show	= rdtgroup_kmode_cpus_show,
> +		.flags		= RFTYPE_FLAGS_CPUS_LIST,
> +		.fflags		= RFTYPE_BASE,
> +	},
>  	{
>  		.name		= "tasks",
>  		.mode		= 0644,

Reinette
