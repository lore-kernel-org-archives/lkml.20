Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DC03B95E9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602846; cv=fail; b=LXb27kVV3+2uFQL5Yq13Tq2IBYh72vuDQvzmoYdJ7I7ncf+AcYXOJzZ4vSTjDdtwCTKr+wts64SiOoNU/MhGo7+g9MJMOWHb7e4QejDQMHYioG0OKZCjOfA/F06N8AYn5TTski1gGV/8+hN7FPfP6nAY2DB2IcyIp/DFgLusRgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602846; c=relaxed/simple;
	bh=sYXCBaTeImUbgUXxswmZqsMXGE8JH+9DdlxB5QLVkPQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VrDDPaPXZ2jWdvmWXj/ACNWfk3GPb5a2QbBfbYAE5nrHU3JadATgm0uZcsXD0aBOLdqdBquE3q7zzAnb7fw72PtAgN6aISlFj6Kc8WwdQOScJ1rGzvjTkxIDDJnI0pdmjH8TRLXn4tGFK066xJS7JRdgNgpDm++PYupXU3QYnvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7FU56yK; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7FU56yK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789602841; x=1821138841;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sYXCBaTeImUbgUXxswmZqsMXGE8JH+9DdlxB5QLVkPQ=;
  b=g7FU56yKSjiVAHUykGHsRRHUWv8F0up1AKIEyTvoVFS/hAFzfwZc7gOX
   Gh3qN4fY72z3YkEU5/Tl1OS4gm3dgRkbBNNLcK6J7uzkQU1oP6p/uyeeT
   wX6lwQ7emJX7XfATa45+iyTeEP4e3bhaWjVFqtoKgPrRMwvVoSEPgzT51
   izRZnemAVluK/9CjWAWOUpQMtRQWbVU3UNzN7oZWEMAYy9ODQbmNYbXxi
   LfON6hiToupyE5Kw/mN0RuQ23pkt5HSZhLnrMIhOipBHItq4gaAfnXxRI
   XL+Kvvui1Lqi0cIs/4AXC+JNxzhSlYxNY0WycQ86wkF2VECH8MIhl6uE5
   w==;
X-CSE-ConnectionGUID: csSOcIn2QfGahSd1dMAS0A==
X-CSE-MsgGUID: Mq1kdcqcTlCynLzA9tK9lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88923810"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="88923810"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 16:53:59 -0700
X-CSE-ConnectionGUID: o9Wkqw7AQFWNv2yxpH8dWg==
X-CSE-MsgGUID: wfRjvYTHT+2Aki4SlgVmOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270852472"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 16:53:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 16:53:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 16:53:58 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 16:53:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gD8zwAs41LwHLUSNnwUX5MNBenxaBap61eOgRQbja2tUgp/4iuhH1kMmWew6EQk59yjvaNO1Uo2vN/sAmOdweJ1nbhoBCHICtvlrdKteVFZiTlEZSAX+G7mCTV0uWKrgcMNQz2vLr9UCuBDweBd9PdYTb6opUfTQPKHPePK2yq3FkB0wZj+BNnxk/b1GBF6hq0ZBahHtpxjxx1nKt5L5aYysg6eP++RNN/NRpN7eHpt4IwSZMllFoVZIdvwI9l93/zQS9IAWgpa6MInWrmSZIQAL/eWWR517KklXqsBfAsX1kxZ6DSzyfwldYdHgFuuWTk9QY1ujlueEg6WxYgvnsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1YwF5EHIZQTay4fvzZ3MDaAsUKg/kJ/KT3FoVX7PJ4=;
 b=gIC7Rd0Fq/cqhC59Auv+WWfpwcQl1oB9yWTuyGoAhGgUI+mHX/yOyz29m4md+5ZIDZV+U8+CSnv02W0sHxm+IJi4eWuiY6/6f1nG+xlPzkNFmZmQ4IwOt64A9Iu9e8V30V4jy0WXQh0TC8tvtQx35JwT1VunvdVs/V19LN3FVxo0FyotUHkMPci322GCcxAYwN4JSnhNaul7+VqCDAiwK/iag3s/RpZZO/xIGWL9yi7BPVCXXZFJe2Y71N9qUIDX6GCswA9l7fi0o2LeoVZ7CU3vgx3NyEdjQdBCpff+jNo9p+2so4CO1RrkbDWqm5ZOVBpA0wTTluq1J/zoWmp3FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 MN2PR11MB4582.namprd11.prod.outlook.com (2603:10b6:208:265::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 23:53:50 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 23:53:50 +0000
Message-ID: <3d18678e-070b-4f8b-95e6-ebe879cdf6ab@intel.com>
Date: Thu, 17 Sep 2026 07:53:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/9] Introduce MMIO-based CMT access for Enhanced RDT
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <chen.yu@linux.dev>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <cover.1787976868.git.yu.c.chen@intel.com>
 <88fa6969-c9bd-4c53-89b4-aee2c185fc97@intel.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <88fa6969-c9bd-4c53-89b4-aee2c185fc97@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|MN2PR11MB4582:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ea572de-1250-4e8f-3eb9-08df144dc181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|18002099003|10067099003|4143699003|22082099003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: wL6Xj+hYwdL70cfLR5Upsr4xGmK5UrV2A+PAKO+gp1AgMyh90c8zd393i1sOn+/RHhKCMopXam9abk3gD0FYo3HJlOCJOGvBDDciDJrGSYnH8s57j/WtB37CAnABj/fk99vIzevFlCfGCd+Np+OqQQCXEM3ZLZWMQHlbvCbCx5OmiaeYcanLzhLLuYB05fVSNT5hlHzdMI+EX5YPKRdNjJNSnLGOWEUfTskQfHbtmZtPb1WHpr2YsJebjAImHLNS0EMIl2Nkk0lzp5Y3KMPT0v8o4N1Z290L25yHWABTRYSZLPRTTjQszgAZlyTjy5u2TYcFkzJwaWTJskc5HNwBRqO0WR/AvJ8ezMjqqLht+PIOfVCrAud6ahAWOSwa4IzJga+6AlFW+4ZLGbb3z6jgzjbCOaGtRcMcoEL5N9ZXhngtt4wQk1GIiOs0edgcKhOQ8XrKyKsLG7cRNZwKD5EG4xlWmva35Q/kZPcs8TZxVfYYtetHE2rfsL/lgSJoezYQXL9zD/XHyXB4VlPGY99LX8abK0Rt30SzpwdMEYKPI6lSNZgiNqULb09pkJ/mAkaLfKStpfgfmzvmwwWOvcoRsFc20jkeZ9TyqZFRTnN9WmgxsVB9NbusZbvKzyt4PSBBlEvyJae5FtdT71QoKkhZh+HJplzUcPTSXuKnkgHi+LA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(18002099003)(10067099003)(4143699003)(22082099003)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHhjdDlnNnVtV1JEbjRCSE1HSHFsZnNQOGtZbkJycysxODN5MUhib2dQSWFw?=
 =?utf-8?B?TTFUVWNHR01OZXFyNFI4NGxTdzBFdkxqQWhaeXdyTnU5b3hQM1ltL2s0aWJv?=
 =?utf-8?B?Wjg0em1FWm5LYnpkME45eVd2NnVCSnpUSm0xblFqSFM0M2xCeXozR1NEczRT?=
 =?utf-8?B?cWoyKzNPN0VZRTBaS2QvdElmdWVRdnY2TUpjcWlaVzluSnF4blNTWi9RVVZN?=
 =?utf-8?B?cTM4RVUwRFlhNWQycUxvblduMEVKL2RKOXRVSTNpUGxDSm1KMjBVaFRhbWxG?=
 =?utf-8?B?VEpUOFUzMFdaeUgrRzFKZHMrVmUzM2U0aUEvZ2VyTnJqeHpDNmlVK0Z0VlBk?=
 =?utf-8?B?S2RIeUFrUWc5Sm9BeXQzZjZkUkJRUXVnNzQyTmt0UC9QcVJNTlJoSTNxNWZz?=
 =?utf-8?B?NmtmWmxTREt2UGh2WFExaEJXMUdEYzhvUjBvSjIrVG9wSVF2amVsMDA2RzFG?=
 =?utf-8?B?cmdmUWFBdERmZjJoSW5MbXlabXZydTZLZW5wYkd4VGQrZ2RXNkdEaHB5R2p3?=
 =?utf-8?B?aFBtKzNTU3VkNVAwcWJ1S1VnY09GV3NGMnVIcWsydkdkUnMzUUwzYjNmTVlv?=
 =?utf-8?B?QVlpUThHMGV0ZmF0MVhhUDNWNW9GUlZaUHBtYko2aXRXc1FnUDlLMk9HY2Iv?=
 =?utf-8?B?YXNjRjVOcDdMZm9xOW1yRWNPZitBZ2tja1JJQldFd0ZETmpCbElTT3FSYTRH?=
 =?utf-8?B?KzZmbisvOFJDVDlCZDhEbnQxM05kTlNzU21lODVTSUJiV1pQZmdZcUJFZ05J?=
 =?utf-8?B?eDVwYmlpSXBERllaam1ZTy9lSjJiMTJNM2lKV3JjdTRRZ0ppeUZzdjk0c3Z0?=
 =?utf-8?B?OWVhZ21NdlczUWd4bDZxdXY4ektIMHRQd1R2cjNHSjFCMXNUMk1abWJOMmxI?=
 =?utf-8?B?WElCMU9rQ0xGSVpaZDdUUkRXOW15Wi93TnZKc2V0ZEY2MnoyMTZtR2dFU3Az?=
 =?utf-8?B?aVNaTmd1R2grM013T2szSzYxUWI1Z0xZcjN0QnV1Q1p0emh6MHBobDhZYlpP?=
 =?utf-8?B?TmpoeVhCK0pyZlY0VEd6SFlLNVVENyttZ2ZleUszbzlVaDVQbjZQY2R6Qlcz?=
 =?utf-8?B?djhOTSs3ZkFoa2NiSDJQYlFNa3B4SzhwL2owTUxXQTJCSWkwbmx5d0w1S2k5?=
 =?utf-8?B?cnoxZFdzc1dycVJRalNKd1J6VjB4VENQaGlFaGlZck5XS0s2cUUxUDg5eXFo?=
 =?utf-8?B?QThXY2swQkJQZDd3Z3BqWGpTSzJXL2pPb21XSlpaY1VNeDNxcHdwWWdreEx4?=
 =?utf-8?B?VlZlMkZHT0dhekRVVldabm03T2o3eDVybXU0Q1ZpNVgxdDFGdmtPNzBQRUdv?=
 =?utf-8?B?dUI2QmZ5eTN6UFp3OWZDT1VUZGpnMGVXNktaaFlDMkV0N0lvRG5IYXdabHlQ?=
 =?utf-8?B?Wmt4bjNob3c0RWdKM1B4OGlGbkJJbTVQZ2JteXY0VjhWQkc4WlhmTnhTT2pl?=
 =?utf-8?B?clllRWJqaHZ4aXdGdzRqT1lTVCtOTGpFWElPNUdNT1dYK0ZSaEdUdDRrb05j?=
 =?utf-8?B?YlFmVWxFTzhCbm9HbndYSXdTUnZ5c3VEdHlvVWRJNWRsR3N2Z0pCYzBQeDVQ?=
 =?utf-8?B?eHA0RFpmN05ZOFZScUpuMi8wM3RoVHBrQmJmanVDTTU2NTZxbVozYVBYNEhh?=
 =?utf-8?B?Y2JvbWNIY0tBVFVJTlQ0SzFIWTVUZUJ3bXh6SkNHeGpSL2t0aFRnNHl5ZVhm?=
 =?utf-8?B?V3RGNXNUc1dQWTRZNlZGRUxJZ3BReURlS1VWNXZhSGhGMGM4M3FEOWtDMXpl?=
 =?utf-8?B?enFWK1Nqc1NKcXdxdmJPK0dzTTF1OWg4YWZReVVBdTNwSjd6WkZMdk5rY2NV?=
 =?utf-8?B?cmsxb2NXcjRlOEZQS1NCRVRnUE5ZNWFtTVB4OTVrRERFWDdOc2dGUWIwdVNY?=
 =?utf-8?B?SmUxTC93YjQyVlZPbnlkWitzZzd3VWdTU2VzZlBNQTFPeHczbWRUU3grTGxt?=
 =?utf-8?B?Z01tUDh2UFlORklIK2Zncm1TaWFwNVJCUW1NcVYyZy8wZE5qVTZiNVhjUkNP?=
 =?utf-8?B?SWNuSEdoWWNBVlJFOWF2WVpYeGRPTHd3ZzRjbUVuSWc4TjIvWlpMK2lYM3Nu?=
 =?utf-8?B?OTYvYXc5bW1wVjA2YVp4SUs1Zlo5MkZ3T0VoRituV2kxd3d1SjNKLzA5d3o4?=
 =?utf-8?B?bWhKY3lSVUhYWEFlQmdrOWh4aXNWK0dhV0U2WkJLWk0wVmVYUzFSS0oxV1lI?=
 =?utf-8?B?M2pveEpsdCtCQ3o4VG9nMnJVS1JSU3crTThScDkyd1E5aERUY3o2dG0vVmtR?=
 =?utf-8?B?SFN6bEE2ZFFCelpxQVdxczFUVzh6K2xPZjduZURabWNJSkpxckM5SUE0Rk9F?=
 =?utf-8?B?aCtHWXo0NkZVaE9xK3lEMStzOGhUU2FDVE83NDZnQVN2bVY0bkxDZz09?=
X-Exchange-RoutingPolicyChecked: caSz66UlW4SqYK3KTCfRTBdV7mW/Q5PNPZTgSMXWoyzQKLLxupcGKlqMaLUR7HB67f6LkHtAZP58+Z2ue09hYYKzTftgKGfyhwRP60uqdq8P4R6XEPJCzDehElt3IZ1M6d8lqzWwVxvwXtDoYaEbcoMoN3cXd9MgICMXyVikqQiFxiuY4cQWabo3lUdauYZ0b/62sgE0wi3H2w3naXtcMb6jLFmb0gVDGIRn8uIs4Q6nSt5QcoXEzfI1hLBt3qzW1cBPpt657LxUaL+OH8EdGyYM7abKK9IoQAPWy0p2h6qbcsyhqpa2Fsc1UNDjYEhMVMtYYb/H0KC3HKsZapNCUA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea572de-1250-4e8f-3eb9-08df144dc181
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 23:53:50.4629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7k/ZN10/jYAHZX6h0gnzg8bo8DuT+mAf9Q/FGmCs40Fi5cAOgs4dZH22Gn6SPXqfodpw9fKRuzx9Fpr+/2fnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4582
X-OriginatorOrg: intel.com

Hi Reinette,

On 9/17/2026 2:16 AM, Reinette Chatre wrote:
> Hi Chenyu,
> 
> What is this series based on? It does not apply on top of resctrl changes
> that have been queued for more than a month before you sent this version.
> 
> You can find latest staged resctrl changes on branch x86/cache on
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
> 
> Could you please rebase this series on top of x86/cache and resubmit?
> 

This patch set was based on v7.2. Let me rebase this on top of x86/cache.
Thanks for the notice.

thanks,
Chenyu

> The baseline may need to change to master branch of tip.git when considering
> this series also touches other x86 code but for now it can start with
> x86/cache since it does not change as much as master.
> 
> Thank you
> 
> Reinette
> 
> ps Looks like Sashiko found a working base of x86/core of tip.git which was/is
>     at v7.2-rc5 and without any of the staged resctrl changes that have since been merged
>     into v7.3-rc1.
> 
> On 8/28/26 10:55 PM, Chen Yu wrote:
>> v6:https://lore.kernel.org/lkml/cover.1784968626.git.yu.c.chen@intel.com/
>> v5:https://lore.kernel.org/lkml/cover.1782866200.git.yu.c.chen@intel.com/
>> v4:https://lore.kernel.org/lkml/cover.1781332698.git.yu.c.chen@intel.com/
>> v3:https://lore.kernel.org/lkml/cover.1780710620.git.yu.c.chen@intel.com/
>> v2:https://lore.kernel.org/lkml/cover.1780587063.git.yu.c.chen@intel.com/
>> v1:https://lore.kernel.org/lkml/cover.1779872016.git.yu.c.chen@intel.com/

