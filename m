Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794262927;
	b=HFk0GOrQ9iZ83ifiVAFhXxV61JhGPiKE/R0nfy6EWyOnwWzFdGh9NW98j3rrN9jRty+b
	 f0JWhexUKpdOEevYvlK7L2/C9Q65dG4AKIxEfpVsm5TnASwxZE1WA7vOcPHCqxeLNkvW9
	 lgKj2MP1CFN83RshES9iwTMJORevKu1Wk673ovJesG65m6Z3C/FzNOtfC8S9tJd0g+hzo
	 lJZGdbWp1jUZ/hOhixuhQYwEZAqK/8r/jNIY5V9cDkKg49gNl/5VfNXw2XWdzLjVQmMKz
	 Lw0wCaBQhGN2ZUC65A20Rn9K8cgpRDN8nwv9YHWt0koaVqjo6FT4TzK5wCjIddb4p6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262927;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:
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
	bh=5OXMlLIHAshyrzRhGQKqwkOqEYbVXHZJj0gBH94WXq0=;
	b=oJapm1kdWLAxt5hYmQATb83cHVq9oowWusLdYAo0IcrYDSt0JuQ5qpA7qVPYBczVtSQg
	 j95CAceTtFqpiHmEqf5qp8Mtz5Y/dFYUvcIoFwlgaJYYmL6VdNVz3pPZMfE/pQVWUGXON
	 W5yaynU5Mnd2NqaWwxhcxFwST5WiPf9o2pG57bQFk43AJcY9ojaccy+AnbsU+/NddTmF6
	 5r+flLMw4LCUpWNmPV0QxIXTaW11moQg/GqBf8YWMUCuEtQzP35xplEcY65OPGUOSWl8b
	 KsdrzPDDK17IKz+fQAkz5wvBTbkJ6WA50NPmkf6LkdnYyQiOspgtO0y7FQs+b3yWyeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BFwa1fz0;
	arc=fail smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A84606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3A84606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BFwa1fz0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794262926; x=1825798926;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ADKHT7fXVpRxSmwyQH006qX2x62SKFa+4Ih975Bozw4=;
  b=BFwa1fz05PnMP4stJYyWy9Y2Fk6534qM88rx5YeTvGO2QLZM7SbfOSTt
   CwvaETkt7Yk44SWa4HzgE0JhH7Xy5XKNRe2hfh92lAJY9brYxWUO7l3hf
   OZW+AtwaPuYtQ9loNwC4Ik0ArHlcP6Trl9qoH9dSACxtbI2Aif7KQA+XK
   BDObCqZxw/CR0PBRp6RhvDQi/xDgh53lggk38Gy+7CAYc/k6uUMFw3pQ5
   kUA269UZ5XrzNkWB0KCXhR5n0uEnmVKGgjptHj7BNdzadTmnTbNPkQcwA
   y7Gs+IGWBWBHj21zc5AgE0gbttXkNYSA1wo/6XyB0+5GzhXTGKmDUTVDI
   A==;
X-CSE-ConnectionGUID: vRxOc7UDSfaSvNPQo7ZQiA==
X-CSE-MsgGUID: RUHG16/MSoyhNiSNWS/tkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3027082"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3027082"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 14:22:05 -0800
X-CSE-ConnectionGUID: 8NfhZyfIS72LKr1LPPRGmw==
X-CSE-MsgGUID: 1b8I5sjxReOqNfhVpvMkRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="9763542"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 14:22:05 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 14:22:04 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 14:22:04 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 14:22:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcD7/P+KbuRfKL4f5ApmzmhFBAVEM4MiGsaaAjzdBZ4tYgKN6u08NCyj2IAYnZObE8Zu8nooWYF41U3tXF3S0c+B/0WBa6yKsPX9tR9JPKcZNEwILnff+XEnVkfLAdLOGjFAGZW6Mriv0NyYphTVZNNmndwsX3VN0USbSz2+Fzcw5ipnSKeEwAUuEJZxutbQR4NHYiIQ18RNRE1n+VMBQdK2+UwerYue8LEIhQWIS/BhZN48cFUoPQctJ5xavJrgx9Yb9nOOaAra4STGonLfX+vy/Bs4dE3PoFqAoRC1hg9soCDmegvA9NKmEL319HQccu21IKnmSLFTguxd2q+2Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OXMlLIHAshyrzRhGQKqwkOqEYbVXHZJj0gBH94WXq0=;
 b=HtuH6GCszZeKY8gihPplVIL0T5uUvlQjul3ScILfOsRhNIS5Ok4aDMByTMcYDmkgP8WvBwzRfmCYzMMNqt7F/XPu3zvrYu7evt1LR/w5A8/7+y3Se+xlIfN/koHYQtwUmQwl7J2ftp0U4dTuUf2g75IXD5WgDKimGSMcbySbcuNB1VX1Ikrp0Kuw9Q/WhdTEhiTGYb7icHABLZrhoHU7LecfzKnOtJIx/qIzCM1NQkiJ0Vt0j0bnw2mFXh1gqSJ9kJfk//2AUcV/gEoCg8ujs9RH2gQxLOdzApn81tatTURuWbOOOHuQwtWJu0mH3NeN0vbhT8q/teWBoGXPyaxjlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by CO1PR11MB5105.namprd11.prod.outlook.com (2603:10b6:303:9f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 22:22:02 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 22:22:02 +0000
Message-ID: <04f252d5-0dbc-49e2-9e05-8fce4a166648@intel.com>
Date: Mon, 9 Nov 2026 14:21:59 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] fs/resctrl: Unmount resctrl with the CDP state it
 was mounted with
To: Jinjie Ruan <ruanjinjie@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<bp@alien8.de>, <tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <jic23@kernel.org>, <ben.horgan@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261105070934.2258613-1-ruanjinjie@huawei.com>
 <20261105070934.2258613-4-ruanjinjie@huawei.com>
 <7163c46a-2abf-42d2-842a-8a43dafecaa3@intel.com>
 <dc148861-35cc-4029-835e-2e93c8b64f05@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <dc148861-35cc-4029-835e-2e93c8b64f05@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0293.namprd03.prod.outlook.com
 (2603:10b6:303:b5::28) To IA0PR11MB8379.namprd11.prod.outlook.com
 (2603:10b6:208:488::20)
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
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|CO1PR11MB5105:EE_
X-MS-Office365-Filtering-Correlation-Id: bb5960c9-582d-444e-46ed-08df3eafe0c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|921020|261026121527099003|10067099003|261028144727099003|4143699003|5023799004|11063799006|56012099006|261021121427099003|261022105027099003|261009223027099003|261026140227099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: dvUfZX+PzW1PkC81BcOYW6VPfc54jRNhB4lH8+vSXdUQfTR6Ol5AnujMU/YPlSkguG4qPAnC2MenMjZP9+ha0l8fUeYMMceWKsyZWGfy3Qq7o1zGqIrdfg9/sD+Gcx7s5/0vMdYZPvKBe7qiZS/ZWc+xqnth6urD55PIGRM0Wjdz1Kr3NIJHa8vk50+m4KSsEs8ZDld1ThEiFyKGgdty+1KuLEF+ZfXoYHffpsWqf2f6uHcfptNYL+1UBDUFzIjJh+8vwhx9dZg3ZMXXo86gf7kNtCb/5pCf3tii+Ea/8i3ylt2Ix7jLiYE/DagiLUGjVtTA5s5GS95NjafAkWNkGbPSNb2Mr12BBIVD4y+QLszecBomzlmJy9EYkBTjd2u41y0iwpq6yAJ4mDSINOwoWvAR3hOIREzqMBZKdxYxoeHy5GRzQGBnUqx979SXX6lJXSJUI6PCoTRtCsYGE+ETnVfrWe+7n+O1s39o3l4TvE5TTaXVpCXLbTAcXL0lvD4qAUI6lxjD9NuIt+HwzOdp7nMOapZIsWsD6gPQfB78aCwerBPGwpckofeH8GDd0tosZ6UgawO10q74y3xHh25kLQ4nfrOVuoyORO8tAzSwKFMUivcclZNbEjiYo+NBVwT5dT/LSLeUJZJAlb2eqDEcDgY6kWbzCCF1saZhN/7aApqWFBgPsWuZ1WsqJEL8Lhgi6QvqGJ3Ix5PBrMZovcMjUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(921020)(261026121527099003)(10067099003)(261028144727099003)(4143699003)(5023799004)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003)(261026140227099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXorSDFxZklPOGFaWFhTVzZVSGNNRE1sdWdXRGdFOGhnU2pvV2NQYzF0djNs?=
 =?utf-8?B?TEJ0UVRGUVFmV094eFdqenJVQ3V3aENqRVZZNXRsWWcyWFI0SXpXRzVJK214?=
 =?utf-8?B?dE44Mk1NOEcyM21Kb2tXSTZWem85YkEyc1Fydjl5SmxON0tLalV5dFBNNEh2?=
 =?utf-8?B?MGtwNTQwNGFHV2JUUFN4VG5lbWFLT1ZWblJjT3pHNlRPT09seFNZeTNmeEty?=
 =?utf-8?B?d0lkTUwxRmRoYmt3eW5zRDcvekIyR09NQi9LWHVGYTdFMExHMXpqME83b3h5?=
 =?utf-8?B?R3B5ZUltUnNwQmordTBIQmlveUZSUXdKZE8vL1BuODFGWFJUQ2swTjFtT1No?=
 =?utf-8?B?TXZVRWEyZTBzYjljZTVRYmxTd3JvbDJVTlpER1lpMU5RRGkybHU5WCsvc2Fz?=
 =?utf-8?B?VE9obzd0eWwzNkYzV3JVbk1ScUV5Q2wyY0t3akk1REZLTjJxQTJzQVZvaVhD?=
 =?utf-8?B?SldFZmRzY0hpdkZUS1cxVHgxaVdaOWNTcC9KRGM1T3IxUjF2c1VnTVRNeTNO?=
 =?utf-8?B?LzNmZ0QrU1V6aWI1cjBraEVEQ0htN1pGdHkvMDZxekYvTUI2K0JVcGZDL3Jo?=
 =?utf-8?B?YkdldU9QUlN5eVE3VG8raE5IelIxbmJZVFlPTWNZWEVtYjU1MGYwV3ZiSmpU?=
 =?utf-8?B?NjRtWUM5eEt2dzNvT1VGM2JTSytQMEhmRDMzWmtQREt3KzBUWFpiM2JFb1c0?=
 =?utf-8?B?K1ZhZUFPTnhYMTAxSHQwVmVsd0ZhOTBzR0s2bjBvWFFtRVoxQ1hUenFYWkFq?=
 =?utf-8?B?K0tTL0RJZU5mRXI3U0dkWFNJRnk5eEUwTC81UHJzaDJJdXMzMDZFWE1NSU1s?=
 =?utf-8?B?c1d4Ulk4VHM4Z3lRTDZjQjlDd2prUExscEpWMFFyWkFnckJrWTVqVDh2U1FP?=
 =?utf-8?B?clJWSTlrMkV6TFNLc3dLRXpmMlo2T1ZtTnVFNjk3LzczaGRFRTVRK3FDeVhS?=
 =?utf-8?B?UVBpZDZzaUx2UWpJc2Qzd3dmTi9CRTlXdDVDaW54RGRUMm9uRkRwMmRrUXFv?=
 =?utf-8?B?VmVXM01CejJxNjFDVGZIdjJhOUFQNFZpcWIra3doRW1hQVF2ZWJxdkxVdG9V?=
 =?utf-8?B?WWI3eTl4d2VpS3RBMDlMVk1KZzMvQUhFWUs5VUEveUVxay81NGhjejhFOE1m?=
 =?utf-8?B?T09LM2x6U2xCRnNRVkQ3NUlCUG16T0RTem9FdlpHZEl0bGsvMWFrQnhjekcz?=
 =?utf-8?B?aURWQkJCb0NTT0RVQW1XeGp6QzBRM1o2TFpuNS80Z0FOZHFoaURadFl1dTFL?=
 =?utf-8?B?VmxwNXJ4aGI5Ym51VHRpcHdYWVQrbUFpUXVmU3ZDenl0M1RnWEU5d2VnOW12?=
 =?utf-8?B?aEp5azJZM1lBdzE5WjRnM0RWak93aXVjNlROd09KYkxUb0gwSlVDYkE3cFht?=
 =?utf-8?B?TnE2amlEYUZLRDk5alNRMjlpNmkycmtiajVUK2tLbzFQWGJWK1lndUh5WHZB?=
 =?utf-8?B?NVpvZHRCVkEzRi80T0JtaTFjSkFqNitSaHZYeUJTdzZZeWJVT0s4NWxZajJJ?=
 =?utf-8?B?L1pzRStTYzYyZmt2MjcwL1JWdU0yNUhMSTh1dkdyS1V3aTZoYTUvY0d6Q3NE?=
 =?utf-8?B?eVFwL2ErelNOb1M3UHVoNVZzcGFsK0FHbFZrKzFxZkMvVXE4enpqRG9WVHI4?=
 =?utf-8?B?djNGNit6c3c2NG9DRWJLUEpSREErbjFtekh6aXlTdnY4OVF1TnhtK1lRUEhW?=
 =?utf-8?B?U2ZRcjUxUUFPREpXSnpLN2RMWkZaaWREVS9NTG05WitpS1lRbG9vakR6Q1dH?=
 =?utf-8?B?Z1psZXdkakFlY1RITkJydklSbFhxS3B2MmprTDN0dTRLTDhWSitoSTR3SkYy?=
 =?utf-8?B?MTZycHRzYmlKb3FxNm54Z2lXNVVNMis4UzZxbStlcGRDcTVkbndzTkJCRVFK?=
 =?utf-8?B?a05IYjFlNHgzWlM0RStmM0dUNHBxQ01GMmZxdlV1T3JDSkhqZTdlWUxxNFFD?=
 =?utf-8?B?QjQ5QlJodllQTkRZWTlKcW1hU1BvTER1c3pEK2tDdEFKMTh5NFNWSFE3WEpR?=
 =?utf-8?B?Z3JIV0FjVU9mS3MyNVRqZG9GUUpONWZPVmdJNVhia1kyTUVPanpWMXBycnRo?=
 =?utf-8?B?YVowN21TL2xZVFFYV2FYNzBiRjRUQnZtMHdMcm1aczZLRGwwQXRaY0Y0YzFM?=
 =?utf-8?B?RnpmMTl1ZGk1MFpBSXRJb3ZScHNiZ1Q3TzZ3MUxUOUlkTlZWckJOdTRUdUFF?=
 =?utf-8?B?VUFsTWNqMHBwUlFtWXRNRk5QbGdPVlNmYWNSSitUREhlSTFkK0lTL2JzNFJm?=
 =?utf-8?B?dmUyZ1orcG1YM1duam9lV1hzYmR3ZW4vN1dLOG9vcEJLamlYZEZCdDNJdi9k?=
 =?utf-8?B?Sno5T1pHSC94WEc4VEtSQVNYNlliUEhnRW04VnBIRllLTUpKbjNmNU9yd1RN?=
 =?utf-8?Q?N1eFBpxh+F/VYLSk=3D?=
X-Exchange-RoutingPolicyChecked: kpToFLsfYBqTxUCKLK3RDdXCOzWEdR3r95myskA42bkm1JDoUwOv0nBhU/IPK6pdHzRB8QMRZd38ufjHEbwhSRU1bJG1ikJmfvvLJx72OiwXphzG7fj/JI51KzWWYnmy3Vd8Xai3t9CoO3RItnFgrfKi2O9C8fSGwu+jTztcTQdPCv6c5hSbw2AjRA14yOgrwf6wbk3A1SPn9P528ltlJqMW4xGQ93Ygsg4UXYkC2mzyl9l7LcnthKXuhTFyL2uEqDbK/wp3FXtJ3jQ3wE7POja67zDq9kKyUP9TwZTrXYXezhAm0IaffbkmFAZtpn/aDDGSgKZ7rwgxwdeIjilLIg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5960c9-582d-444e-46ed-08df3eafe0c3
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 22:22:02.2157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CL7aR1fGT2eGj4vmeQjw64hf8lm0CI/LTtrex+cA9vQm7R8dUj8AaoZLXx2zSB1WrrVB2bBx9FdMEs3xPN/rXTj8rPAZBwlHK334LyL80Qw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5105
X-OriginatorOrg: intel.com

Hi Jinjie,

On 11/9/26 3:48 AM, Jinjie Ruan wrote:
> 在 2026/11/7 6:52, Reinette Chatre 写道:
>> On 11/4/26 11:09 PM, Jinjie Ruan wrote:

...

>>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>>> index ae9ddd380515..717c3888c2b5 100644
>>> --- a/fs/resctrl/monitor.c
>>> +++ b/fs/resctrl/monitor.c
>>> @@ -70,6 +70,11 @@ static u32 *closid_num_dirty_rmid;
>>>   */
>>>  static unsigned int rmid_limbo_count;
>>>  
>>> +/*
>>> + * @limbo_cdp - The CDP state under which the RMIDs in limbo were freed.
>>> + */
>>> +static bool limbo_cdp;
>>
>> The variable is described as "The CDP state ..." but its type is a boolean.
>> What does "true" mean? Could this be renamed limbo_cdp_enabled?
>>
>> Looks like this is only set if CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID is set,
>> please mention that in the comments.
>>
>>> +
>>>  /*
>>>   * @rmid_entry - The entry in the limbo and free lists.
>>>   */
>>> @@ -852,6 +857,10 @@ void cqm_handle_limbo(struct work_struct *work)
>>>  	 */
>>>  	mutex_lock(&rdtgroup_mutex);
>>>  
>>> +	/* Don't read the RMIDs in limbo until a mount sets up the CDP state. */
>>> +	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) && !resctrl_mounted)
>>> +		goto out_unlock;
>>> +
>>
>> Is this IS_ENABLED() check needed? There are several flows managing the limbo handler
>> yet just cqm_handle_limbo() and resctrl_limbo_resume() use this IS_ENABLED() check to manage
>> the lifecycle in a unique way that I am concerned will trip people up in the future when
>> trying to untangle the limbo worker lifecycle.
>>
>> I understand that the IS_ENABLED() check is added to support MPAM specifically here but
>> I think we should aim for as much as possible similar behavior across all architectures.
> 
> Yes, it is for mpam.
> 
>> To that end I do not see why limbo handler should not run on MPAM when resctrl fs is unmounted
>> while on x86 it should. 
> 
> Is it because the CDP implementation of x86 is different from MPAM, and
> MPAM is implemented through simulation?

In x86 the CLOSID and RMID are independent so on x86 the RMID (index) does not change between
CDP enabled and CDP disabled.

>> Having the limbo handler only depend on resctrl_mounted here will make the behavior consistent
>> across architectures while also matching the overflow handler. Keeping these behaviors similar
>> just makes the code easier to understand and reason about. Having resctrl filesystem provide
>> consistent flows across all architectures ensures the same flows are always tested.
>>
>> Yes, x86 would lose the ability to drain RMIDs across an unmount, but nothing needs these
>> RMIDs while resctrl is unmounted. This work ensures that the RMIDs are freed shortly
>> after a mount when they will be needed.
> 
> I believe this behavior is also universal for x86.

Right, without resctrl fs mounted there are no user requests for the monitoring data backed
by any architecture.

...

>>> +				release_limbo_rmids(d);
>>> +		}
>>> +	}
>>> +	limbo_cdp = cdp;
>>> +
>>> +	if (!resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
>>> +		return;
>>
>> Could this be moved to the top of the function? QOS_L3_OCCUP_EVENT_ID
>> state cannot change between mounts and this is the event that determines
>> whether limbo handler runs at all. Moving this check would also eliminate the 
>> need for the "d->rmid_busy_llc" check above.
> 
> But limbo_cdp must be updated for next time check.

limbo_cdp (or limbo_cdp_enabled as per earlier comment) is only valid if
resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID) *and*
IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID). Since QOS_L3_OCCUP_EVENT_ID
state cannot change between mounts there is no need to ever update limbo_cdp
if QOS_L3_OCCUP_EVENT_ID is disabled, no?

Reinette
