Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CABA3655CC;
	Wed, 16 Sep 2026 05:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537481; cv=fail; b=lFEkvanXJ9yQ4QMpTQDFd5tVoEIq2fWBVMrhlbQy+3h/ju3L2/FjPrRY1he5eKoc9hkQUGiIoVt4JiWfIodnifDraTJNCKRgpstG+jZykVyqdD3MXmbjo4W8M0kvsL3NSarr2QC17dATDnAYZeDRs8INxfzGjpFymZnm3HUfQg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537481; c=relaxed/simple;
	bh=LuvDjms7GDn7zrS1CHkTomHI6TnoojbrHGN7Lfr074M=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DQUk3oCXtoDLKXJhCq3qajhekxFxuJCa5qkvRrhHRj6bSRc4n98EzXEKj+sDdSk+eo0D8sxS86zsZFY2s26ULBuwCSsdbVFKuNkWkZ3oeenmP5ZdIw1qLn1XOLMbmu/CRcBNE+4IPEVuxoOWsKJRlQECPm6AvpTTHJ/Tzpe5apw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFa1mKHY; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFa1mKHY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789537479; x=1821073479;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LuvDjms7GDn7zrS1CHkTomHI6TnoojbrHGN7Lfr074M=;
  b=mFa1mKHYEDbgGLcV6Tjx6DTTB2b+Lur/vVNgmBqrvkVk1Ap41DIEJDXD
   xfGCykWp0BxXXDIfPUdli0zl4QocXbLIhFcnupuRbzq3NhfG9SCBd6fak
   LRlt3aGnJPIHA/87SYjsjULFZEeAz7cTqLeXA0WzryAf3JYWE7642EYhV
   YhnXLf8KHVA6jSPVyme2i8eiD/xrfV9D5djQJiRZE30BWd5K+39hUux/0
   byOMH7NIV9m5msRnnpqA6QorZB9FjgnzjNAxEidacWvjgdV54Otr/ih2q
   PADk/+eIFq0Fz8/Tnji8ofoI9pNZwQVesDuRcxI98hgmnvC55nTMo8hbi
   Q==;
X-CSE-ConnectionGUID: CFQxCxMbQ2q5gU2yrWzxHg==
X-CSE-MsgGUID: hkzJ8gaTQAuJEqm0MR7kaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101060517"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101060517"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:44:38 -0700
X-CSE-ConnectionGUID: sy7dM2xwSeW9WkjxJyz+Gw==
X-CSE-MsgGUID: 1qC8h/7rSZGK/QZYgGMixw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273774444"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:35:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:35:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 22:35:31 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:35:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVumrmaeopF2YQ3paiPY9WjIGI7T8at3YNw0rxA3NBZ4HkDprjPGo0zpszePJegqtLtF6gBf7i74jUCB4G8CdJLBm0wJ3uXAJD32SBr+ASn2p219deqUDCuGVJ5FlTaVAk9JSBW4QbmbHzFxVbT8m6mJ7Qrq+7ds0P0GkN+91bWHKotLE6q5qWq0sDgNvnHD0zfH4Rqz8om2x7NvpNxO0Lb8CkiFX+WzQEu2hOXun5/o/ZbjOSOXd7tCO/DA1Bpq0pHbdBhR557UiMBeGUUo74uq/+ED565lYZoYd5759iUkosvODIbkJLZpfEGr2hStq//75qSpC8/RE/33dWM8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dz9kYSkcyosSMZ9cUP0E76i6fK0f+UPGHlKBU71lybU=;
 b=Rpx4JzcnNf+JRcdEOjFgbxsD8XxKEDMyLpl8edFS2IdOFvbzN7IZEEdAWPG0epZufflgWH3FQ43v1T9n5zmcJ7M7oBuL2wh73CW6qo28lu5SbyoAzUT7UaZzOQwIrHH10fV8lCHgsMR1Nk5fptx1dL721jeK640O8Q8lVXiD/rmpHz6+CpzyAJO1eo4K8Im1Ozm4/fyxVQG8KiZWBR0Qw01JAaPuyTxYdpjUoe+WNgZ2fA5L5HRHLszG39VywJguMYfHsIJBpHZZUuJAvh0JOL4Kv86gzzAegWbOSQSjldoJeTUOIejoI5lbKY5Vs24ghghyeYGYUzm4j3iS4XAmtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DM6PR11MB4708.namprd11.prod.outlook.com (2603:10b6:5:28f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 05:35:26 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 05:35:26 +0000
Message-ID: <f93c9241-8fc9-4076-a290-47b89021e1b2@intel.com>
Date: Tue, 15 Sep 2026 22:35:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/16] fs/resctrl: Program kernel mode assignments on
 CPU hotplug
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
 <16b8b0e9d91c9224722691009317464c4d585178.1787772750.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <16b8b0e9d91c9224722691009317464c4d585178.1787772750.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0178.namprd04.prod.outlook.com
 (2603:10b6:303:85::33) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DM6PR11MB4708:EE_
X-MS-Office365-Filtering-Correlation-Id: f00f8216-0d72-4f6a-e1db-08df13b44f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|18002099003|22082099003|10067099003|56012099006|4143699003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: tfsHM68dqVv3O+jD0Mv9zC8bFQ+691slNMcV8qZ7tRQxcNztXC+/nYEdV17XBB8ttWy7jV8+/ckZNOjkpCDnxEU5dOJYoSfLh4KVUWVWZtjqC7k7UmPDaNt7ze6TAP17UZyfkvJvXWB2TSooGPKC948BNO/F4OHnaEfbSSccsKjIKEFyxiADWv3ifRvJzhiZ4/VMWBwDISAiZK7wq39ZKZLKXMvrVmDwHe4+FzkY5MkjwsoafZxdXbFBouHE3x12JfAp3VTg4LwkULCqxm0PFOzs0b1bC4RK4VAkixIy5UP063f6hwAlV55n3uzaHr6B9nNBPOxUS3D7CPIeNE4y9b10RDIql1ZbpplFI8rXCtaG7tdd81Zt9OshEHw9CdSXWcqFUKu7LkiwmsRRovOB067mN9njI/GEgF/7JJcudcRdltGETpeGNrmzx6JijeuL2lGnbJTZlqbIJoSQPVGI8Qx337o2uuE1yy8AZDRofquGtwQKYxg1juXeKJDdoZ/JHP6TStlQjHDPwFXvFJStOEcYYUxi/ZOxKkR4qndMlD1NBrOmf9MQkaeMosfgbKW121s0Jec401fUTqP+hESeXIoOZDi0Yjg5K6hDeIOyQIaicblap+sTq36aTorpqms4Yo+DG8BmRDyPdX0mxZo53yPmbqa94PmOFvafnI4cJas=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1pTUXphTSt0WDBXVzY4b1BvVmYvWW5vbEJvTVBoK2VTY0lJcUFheU0xK2w3?=
 =?utf-8?B?K29tTUF1WENIK2J0WXBrQk9QMWd0ZWVVT2hXWHp5elVybHM5azcxUEJIYWZL?=
 =?utf-8?B?Mmg4THc3WDFrK21oYTlLSGNUNll4TWxXK0pBendmWW8wSjBBc2VZTXNwUHE3?=
 =?utf-8?B?OEs4MmpBL1M5VUFIK3NpM2N3eUV4NVFXRk9QS1JvSlFtL2JBMytJeGRKR1FL?=
 =?utf-8?B?S2dJZE1yd3lkZi9QeW9PMVg1QW5ETlE1T0xWVklKbGlyaTN2dEdGdGNvY1Mr?=
 =?utf-8?B?b2pDaEpYWWZsWHEzVHhXSjcyYWthNEFCZE5mZGdjSEhJeEdURUF2enFrYUd3?=
 =?utf-8?B?R1pZYkVkWW5PZ0pDOFR6OTFRdzByTDFkNUh1bTlhNysxY2o2Skc3bjFrZUxV?=
 =?utf-8?B?S1BWQUZOM0p2VE9CRUpTQ3ZDWkZORG1SdXEraXBTSzNTRXFIN0RnOGZ1VHFJ?=
 =?utf-8?B?OVduVk9Vdll6WGtwVklhZ0MrcUc4TnM1UktKOXFpbGlYcGZBRU0rQlZwUDky?=
 =?utf-8?B?NmRPMk9sandseXRFODdSb1hMSWtJN1lXZFY3TTByWkdKRHRuamRXMHBpcmJP?=
 =?utf-8?B?dHdSeC9nZkl1UDhqSWpydmpxVWJnMUpxTzhZYkQ5RnRaZExHbjNwdDA5UUZv?=
 =?utf-8?B?V3pLcGR0YkNJWEFRS28zWWU0cFJQdSsxNUJzMnc3UEg0b0VQN3BIMUlxZS96?=
 =?utf-8?B?cUhvYjNEOUxYOWVuNmNZZUxhcW9Qd2ZPVStvTWplenhqTWtjWlgzbTVkeGVq?=
 =?utf-8?B?eXJxdmJoaWRqSmd2d3B3NFpOV09ZcC9XaElLNS9TS3E0NlplVmdBVDhSTzF0?=
 =?utf-8?B?WUh5dFZNdllhUjN3dXBWaGNhZWRyWDJ4NzVmWTNaRVNzRi9Ba2dwbVk2VkpT?=
 =?utf-8?B?TmNONTIrWUlkWWJ4dVpkcW9nSEMyZUJMaEZqeWRWcStFNkEvdVRGZkFmQW5H?=
 =?utf-8?B?WE1taWJtdFFFZm9mRGJpNVZmV09LTFpxVnFaNmRGNG5mOXJ1OFdVNyt4dDZv?=
 =?utf-8?B?ZjNMbnRSbXhUMlJoNENMV1BYc3BOQUdZMWtKOGRwUk9WNjdkN1Rnak9sMmhl?=
 =?utf-8?B?RU9UN0hFTk5XQ1FCdUZuWU5teXUrMDR2TEZTTXNlb1VWbHVHMUFXcWpndktS?=
 =?utf-8?B?YmZKZCtnQXhPTm1rdTFiWkxwWnFGakY2OElkN0ZzWTBYOTFmQzdpMFVnamph?=
 =?utf-8?B?YWtIcUhNV20xcUd2Y2VoTWI5KzhjaGZOd2RGTGFnVWRhQnUvZE1raVNicnhs?=
 =?utf-8?B?ZWNSOTd1QnFOa3d0bkY1NGdqVjdSV3F6R1VaRHZsNGFvS3V0QU9BdGwrcjYz?=
 =?utf-8?B?SDE2NzBGQjlGTForaVp1NUZ5enhueVJibU1tL2hOd3ZQMnkraUhvUkZxN3o3?=
 =?utf-8?B?U0RSdWFoZGxLZjNGeVp5V0JoTVhvdlBnSHQxeXZHNisvd1FmMktZV2NLektj?=
 =?utf-8?B?WGVqVGs1ZGJVVEt2UXUwOTIydlJmdkhvMERPd0RYM3lZNW9KQU9xUUEzVDcy?=
 =?utf-8?B?NnpNMmxTWS9ob2JkTEZQcmRIZnVNdlVkd1IvVjE5ZlZxNXFTbHlUTGRvNDJ3?=
 =?utf-8?B?cm5pUnJQVnQ1QjhkckdmM3ZaMTlKTUhEdmRzODNFMGErYnNvZUlvS1VwdWdL?=
 =?utf-8?B?dnB5WnpZRklGNlI5N1JycU5yYWs3OHZJZytHZjhRdjF0ZlJ3K2gydElZUFN5?=
 =?utf-8?B?Zm9ZOHN4dUl1VWU4M0xNZU5Td2ptYytnbzBVbERMRTVLWTlZbTZUNldyRHZV?=
 =?utf-8?B?VDYwV1FaN2xEcFFuQzhRSzA5ZU1oamtpWnd3R0Y4TkZHMG81WG5KaEtORXZx?=
 =?utf-8?B?c3RFSzlqSk12RjRKZG5rdzB0NVhFWHpwOW9HYWlBMHlNazBDMERuVllWZWdC?=
 =?utf-8?B?bUYyemhlVzZNRFFZOFN1cGxsTndweGJ3c2NxTm1ZQVB3bTZtUVBqT0gyQTlS?=
 =?utf-8?B?Rld5N0RSVSttVmx3UnR4ZXVmNkpVV3FOaVNiRjZ2Z2I4dDJVcE5wYlNCeVFZ?=
 =?utf-8?B?Tk1wdXpTVmZOTUloa3dtN0d2WmJ0QUtYZ0ZqdmtjZXJiWG5VVE82bTZsTkcw?=
 =?utf-8?B?ODFpRGROZzlVVGlvRzBzKzlCNHFEaDVLRHhzUjI0UEFQVFdoS2dNZWpjTTY2?=
 =?utf-8?B?WDZ3VXJDRGZLSnI3dkRSR0h6RDNIQ0pJUGFIOUpGRUY3dWxoNE5oRE1PTFdD?=
 =?utf-8?B?UHlmU3MxK2U5ei8vNmNYQ245NmtyMVBGc2xpcVI2MGpYOWZhN1RRYjVScE1x?=
 =?utf-8?B?SDV1TXVWL0I3QXZRTjFyVW9wckhyVDAwS1pPMk91K2FSM29xQk5ZK0hTSjBq?=
 =?utf-8?B?TlFtRWRQb1hBSGw1Vlh1VUNrY1JCUUV0cUFjNW9Ba2sxaUFXY0xKYUJBUjFT?=
 =?utf-8?Q?SqLyUlq5GKqePuz4=3D?=
X-Exchange-RoutingPolicyChecked: 4nx/nHVWNx6tlUydisobVulqzV84sznfe8OVtQ1NWhgmWfiXilyw4sm32Hwn/luF7g41tMOzwVKIshu49CywgS790roXiDwbLluJcb4flLl6GIJfP0jjqWQcBgEQrCkq4LmpUR7SW0xb2n956SwtZhw4lFMWSwAzHfPbabMnigcObmKhbCN+ADY+2pxGApgXMcPxFqmsz9QO7Nxoi8Bf2XfEHB1yrEMEMpzkxSHYTxmeNzUb6JleP8g7QuB7zg5VGyz7BseYTRruPabex3Uat1GdUqRXXpR5OI8HJZ9231sZLDsXwVAQg2hNCclI64PkE6CGbycG+eS3kIIBQyNTFw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f00f8216-0d72-4f6a-e1db-08df13b44f66
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 05:35:25.9537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3w1llva6DP/1oChaIY50MyhKs3OVz6PmSjfJfuTe9U1G7jwSDRIYZzBS8Kp6Czbq9bNQngA7h0bdQFoHVxRuiZKLJ1lZBP8hmC3YY2yTFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4708
X-OriginatorOrg: intel.com

Hi Babu,

On 8/26/26 12:32 PM, Babu Moger wrote:


> ---
>  fs/resctrl/rdtgroup.c | 59 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 06e74b027044..97e4176669e5 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -4951,11 +4951,67 @@ int resctrl_online_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *hdr
>  	return err;
>  }
>  
> +/*
> + * resctrl_kmode_online_cpu() - Program kernel mode association for @cpu
> + * @cpu: CPU that has just been brought online
> + *
> + * If assign_global_enable_per_cpu is active and the rdtgroup has an active
> + * kernel-mode association, add @cpu to kmode_cpu_mask and program the
> + * corresponding kernel mode association.
> + */
> +static void resctrl_kmode_online_cpu(unsigned int cpu)
> +{
> +	struct rdtgroup *rdtgrp = resctrl_kcfg.active.k_rdtgrp;
> +	bool assign_ctrl, assign_mon;
> +
> +	if (resctrl_kcfg.active.kmode_cur != RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU ||
> +	    !rdtgrp || !rdtgrp->kmode)
> +		return;
> +
> +	assign_ctrl = (resctrl_kcfg.active.ctrl_mode == KMODE_ASSIGN);
> +	assign_mon = (resctrl_kcfg.active.mon_mode == KMODE_ASSIGN);
> +
> +	cpumask_set_cpu(cpu, &rdtgrp->kmode_cpu_mask);
> +
> +	resctrl_arch_configure_kmode(cpumask_of(cpu), rdtgrp->closid, assign_ctrl,
> +				     rdtgrp->mon.rmid, assign_mon, true);

If I counted right, at end of this series, resctrl_arch_configure_kmode() is called
six times and _every_ call is preceded with the same two line pattern above:

	assign_ctrl = (resctrl_kcfg.active.ctrl_mode == KMODE_ASSIGN);
	assign_mon = (resctrl_kcfg.active.mon_mode == KMODE_ASSIGN);

Could this be simplified with a single helper that does something like:

static void resctrl_configure_global_kmode(const struct cpumask *mask,
					   struct rdtgroup *rdtgrp, bool enable)
{
  	resctrl_arch_configure_global_kmode(mask, rdtgrp->closid,
  					    resctrl_kcfg.active.ctrl_mode == KMODE_ASSIGN,
					    rdtgrp->mon.rmid,
					    resctrl_kcfg.active.mon_mode == KMODE_ASSIGN,
					    enable);
}


> +}
> +
> +/*
> + * resctrl_kmode_offline_cpu() - Clear kernel mode association for @cpu
> + * @cpu: CPU being taken offline.
> + *
> + * If assign_global_enable_per_cpu is active, disable the kernel mode
> + * association for @cpu and remove it from kmode_cpu_mask.
> + */
> +static void resctrl_kmode_offline_cpu(unsigned int cpu)
> +{
> +	struct rdtgroup *rdtgrp = resctrl_kcfg.active.k_rdtgrp;
> +	bool assign_ctrl, assign_mon;
> +
> +	if (resctrl_kcfg.active.kmode_cur != RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU ||
> +	    !rdtgrp || !rdtgrp->kmode)
> +		return;
> +
> +	if (!cpumask_test_cpu(cpu, &rdtgrp->kmode_cpu_mask))
> +		return;
> +
> +	assign_ctrl = (resctrl_kcfg.active.ctrl_mode == KMODE_ASSIGN);
> +	assign_mon = (resctrl_kcfg.active.mon_mode == KMODE_ASSIGN);
> +
> +	cpumask_clear_cpu(cpu, &rdtgrp->kmode_cpu_mask);
> +
> +	resctrl_arch_configure_kmode(cpumask_of(cpu), rdtgrp->closid, assign_ctrl,
> +				     rdtgrp->mon.rmid, assign_mon, false);
> +}
> +
>  void resctrl_online_cpu(unsigned int cpu)
>  {
>  	mutex_lock(&rdtgroup_mutex);
>  	/* The CPU is set in default rdtgroup after online. */
>  	cpumask_set_cpu(cpu, &rdtgroup_default.cpu_mask);
> +	/* Program any active kernel mode association on this CPU. */

This comment is not helpful.

> +	resctrl_kmode_online_cpu(cpu);
>  	mutex_unlock(&rdtgroup_mutex);
>  }
>  
> @@ -4999,6 +5055,9 @@ void resctrl_offline_cpu(unsigned int cpu)
>  		}
>  	}
>  
> +	/* Clear any active kernel mode association on this CPU. */
> +	resctrl_kmode_offline_cpu(cpu);
> +
>  	if (!l3->mon_capable)
>  		goto out_unlock;
>  

Reinette
