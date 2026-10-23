Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792767124;
	b=ZdwI8sln9d8yqcHFCSXtfcCE+RKhfoFVW4ZWWucc8NrjeuBmnHY3vazgOXu42iI5+pXI
	 YiHEFBtYh7FZUhZSUNEshfDFNZe5NRi25kZ5x3m9fwVy2gNpGRlWcMrSusVjsB3Is/Nth
	 w90HP7LVA0MrqWgNpTpAXJBNzwX60FI2OqCyuBCrluCh0UpWa+ZsMvqKTRJR0Ri14bsY7
	 8wWgMTXOz13lGtLSZXynJlo7ze3BW8X9g01lR8GHOHl53tuW7Bg1N6eTE/m1/MaMiJbyM
	 DEEUS74vkYoDgm76SzoaLX7xpgU+B0z8ptEN7E0Ev86Ay531PWf0az7k5KmMSbXKizQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792767124;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=8GGQm0par2xYlhHGWpnRCh9QjA9O4agcGE21NtUUs6Q=;
	b=KlXJNuMB5Pblyoz+t/2+2nsBzAfYLw0apkpXzdn0f3JsKT6fAhGOYCEWWpVmAF2KDBqP
	 EEdoXYiM0f0LP7RShvdtxpaFowgOMz01CleR2Jubo6sRIErxdsxMU5xg8ZUj0oj3Nqh9x
	 0EBtit3mxe3uLwzgiVSFl9xg1F7RJrLrkLAR4EXc+neyAvV7PY9a3SvjyZ47Q9VPFvEZ2
	 Ds/JXhZHU5UvuoUfZ8ucL/dg3JHl7iEYXKPChVBy/lnon8j/TPFHzoUET4B/DfjiaWSh6
	 r1hKqSFL+V7+P6FxWsfA78ilfmCrgf5pWmQLlliD3NUXK/ANlkMtB+ewujuppdQV+/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CTDT5Wvb;
	arc=fail smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F779606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F779606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CTDT5Wvb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792767124; x=1824303124;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HUqauUBmpiiH2nZpH2VV50mxEnPMbrrzTRLqUfc10Ug=;
  b=CTDT5Wvb/l8SXojW0v9tMYRGw9FFsGN+YH++QCFSudRbd0eXI/YP/BFA
   wdCpM5v14lKSfBxdybZXGMgqfemkWlElu10enwvYWBM917VM9LLsLVi5A
   oUd3iaC9ZMLAkkPfpliiz5zh7boB6XSQ72WcE4jXGkqYJw1mNzzyXVNTU
   Da0gzSjFAUgEYvYDVNVECJSY40HSL5kMAT+DglCBOYqeLLaXFG924CgXW
   buhxp4Ts26JEcd0ujU/SyYYzfqV5TurfawNtXTnUycB5rar4PLEjZTbvr
   t4BZjT3Z8EbhnoveDHLJ08IO6H67CQSF4O7AlZeDxNEPDaFQPQzBK6ZZE
   A==;
X-CSE-ConnectionGUID: UGnj4jNOSki8F3dnnS5xDg==
X-CSE-MsgGUID: H3lzMqyrSty9mmW3IxJujg==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1539294"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1539294"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 07:52:03 -0700
X-CSE-ConnectionGUID: T1eb3HkRQvGbRHJ8Jrq2ug==
X-CSE-MsgGUID: 460wDdazShiABXw5Nnsk2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3757299"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 07:52:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 07:52:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 07:52:01 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 07:52:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDh9AsL3YLH4b6rrKHwMn6Pp8To3Gs9pva10XBu9BtXvXCw5KHFdP2o/AqP3ia9ebIDBeMwO/ncsOQ4qu/diKGZXIpE9QGU3qaybsOzOwUUUJ2Yh1WjXJZhL9QFytwPDz9geZNMZ79fF8AaxHVffwkzyS2o4JKOv3RrhJXkQw6rlp7qAwX23+1SEDp//kla/uWOKCzN8M1d36nUISfYtYdAxL474q2dgAQfy4V4kftgA5S+OOlv1BUQLqZ/gA0wZ/K8x25b/u8oVj4LvFs8m717utl1zwaLkH3mVr/Om1KHHgitiUKFMeE/0FCt/6ZaVz+9XvfuIPBHTlJAS5+K8mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GGQm0par2xYlhHGWpnRCh9QjA9O4agcGE21NtUUs6Q=;
 b=jum4XERQe8/f/rgrIFYd8t3FP0YNpvtLPI5Zc+a0Rqg8Ze/52fxemmAXJuIy2fh8+/Jy754WKQtZx502DMDR+Q5EHehZC8Ow9zomDCrZL47MjZIcVq2+fNQvfpO5LOrW15aFLWptpBEjMeSGlCKVNZVSW9PTEFMqMkZCH/lHusqqQkaW/WBdy3VyO3XxzqwJIyscTaGiKJkioqXVn2CVGkrOp7bw+cfRAEkvX9ZdsmsAHRNsM76RJC5qZzJwD7Ne/NtLpb4XITuh/MBRNxSVt2FGJ3dpAwRKxNFlOjs0mbq4U3QugUNqtlEDkKVQewQ80A+Bzht799/Fhrc7bUSAXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DS6PR11MB203949.namprd11.prod.outlook.com (2603:10b6:8:49a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 14:51:59 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 14:51:55 +0000
Message-ID: <96795f1b-08ff-4d26-9b51-8c54bcbe537d@intel.com>
Date: Fri, 23 Oct 2026 07:51:52 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 00/19] arm,fs/resctrl: ARM MPAM MB_NODE support
To: Jinjie Ruan <ruanjinjie@huawei.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Tony Luck <tony.luck@intel.com>, Ben Horgan <ben.horgan@arm.com>, James Morse
	<james.morse@arm.com>, Dave Martin <Dave.Martin@arm.com>, Will Deacon
	<will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Shaopeng Tan
	<tan.shaopeng@fujitsu.com>, Chen Yu <yu.c.chen@intel.com>, Babu Moger
	<babu.moger@amd.com>, Drew Fustini <fustini@kernel.org>, Vikram Sethi
	<vsethi@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>, Newton Liu
	<newtonl@nvidia.com>, Richard Cheng <icheng@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
 <87ecba5b-e396-45db-bab0-4eff0f30cb25@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <87ecba5b-e396-45db-bab0-4eff0f30cb25@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0291.namprd03.prod.outlook.com
 (2603:10b6:303:b5::26) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DS6PR11MB203949:EE_
X-MS-Office365-Filtering-Correlation-Id: bbe8adc4-fe24-4357-9118-08df31152e34
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|261009223027099003|261021121427099003|261022075727099003|261022105027099003|260925021911599003|260925022911599003|260925021311599003|10067099003|56012099006|3023799007|6133799003|18002099003|22082099003|921020|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: HD1RIAMOFjFY9AeKKO/JJSWZGefsTDBe2PAxpf1JxYWExEz8nc9KFLeSXhkaMD7xQPCKYan2dNGKkrTG/BN2VCdiaueXFVDVVAeJuVPEeks8wv4gAT4MUP+41arRWwT3bdnEuIlAgbQiveyU4weNsSWDwvnRLqVBA6QsjKWJ7usduLDHYtIbnv+fSg2JoZdZiNm8c94ASI7sjqcgYYlqaoWsjHV+kVohvVLsoDqvSGrMnEGXTsvW1Sa7A5cTec1gMa8ONbOmXZiyDs3WI9E7qwiyqN1MqsX/Z2yX5Wwk9MSthoZ1wUPYOBvEURpEgwgnE0yq3rtNM8GOwwxzB70Epr7OqtltDTmrtB8bea48MmCTNcl0CeW1BVoc1wz0gk7jHxwUzKFuWCHK0xKFtgTxhbeIFoYlKRYyVZRBfXAMQitzztLir1Kyx8XiAsN2QckPlYOnqPX1jE8KEr4G0T8FilywhoROPXbLLrbty+1eYfYjETPg4RasNquwXZxrQij31G5ITmgfAMH7so6EPMw9HPfpA71ZoBC1ZoAjW8aAmIYJACuzkajkmkv0j3rTntxAcGzu6f4iNyEmuTztkIaD/esNGM1gEed5icVEtFneBgacc2srkDhCk3ebg/HVL5Y2N1VJZRKdgQEagtJpYFHilLtMZiNPhVD12mBJDIj6nAg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(261009223027099003)(261021121427099003)(261022075727099003)(261022105027099003)(260925021911599003)(260925022911599003)(260925021311599003)(10067099003)(56012099006)(3023799007)(6133799003)(18002099003)(22082099003)(921020)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2lsVmNLUzJ3ZU5mU01Jcml3OXFVeWhXeW10UjlPbVNQVUxXUWVNVnhVRDBP?=
 =?utf-8?B?Yi9LSFFEQXEzdjU0ZnFuOGQvVFFyOXJqLzRqOS9lQUhBRlFkaFRzTDl6em1o?=
 =?utf-8?B?anRxTFd5Wlk1dDc5ZXZGMXE1REtRdjc3ZS9rbzJ2YkVTanBsY01EK1M5NFNY?=
 =?utf-8?B?eU5yUURZcmYzZWRUVVBBcnNtcGRFKzhWZU9oVGxaZStPc3ZvdmNOMTQ2OFVa?=
 =?utf-8?B?am9sVGM5VEF1T1NHY0s5THlocnVRN29Mcm1zTVNIbmZuc1FINHoydFBrSXpX?=
 =?utf-8?B?Zi9Demw4SkduZzQ4dnh6TUIrdVBjU0RkSVl1dldsK0FOWG9SWWs3QVplc1g0?=
 =?utf-8?B?bEt2NWpVSm5CVnlqSERPSlBlRnFwb05XMXpHcWlLclh6WWNoY0VqSXBnRWhl?=
 =?utf-8?B?UWFXK08vSnpjc0pPVWtNZElHSVhrVDVFRlhJQWRVeHdWUld4VDZEWEdXWWEr?=
 =?utf-8?B?elRPeVhwZDAzYlRKak54MmhyK1Jaa09MUWo3dlpNWXRmaXRFR0tYS0YrWitR?=
 =?utf-8?B?ZzR2OWVMVW5sOXUxVTRocWJ3Q3BsT0FqVjVWM0tBY0E0QU85TWxUWm1MQkpY?=
 =?utf-8?B?bENFdFlGQnNmL2JmYmdwU2xWd01lSEo1ZU9tdE5IenNpcnZicno4ejNoc0dS?=
 =?utf-8?B?Yk5DU0tpTWdIUHdCdlRpcTI3bmU5MHFsUXZ3YnA1RFpnTzZacTh5dGhTMGZi?=
 =?utf-8?B?cjVUaTJ6R1orVTVvQ0JOMFdTRTI3WXVBTjZaMzZNbDFEVEZOTEs1U2xOZ0s4?=
 =?utf-8?B?SktmcU50VUJObHVrbDNyYkFidWloQWZBTURmZmM4bWxTK3o5emxwVk14L0Fm?=
 =?utf-8?B?cENnUzJvWWVrdG52SUYwZDltRk9hN2NlcG9IUlJHVzZCUDRlbkpXMlpIMyt5?=
 =?utf-8?B?RHFBeUYzazRsbmpUenlsUmlScmtBY0h4QXhQaDR4anladzU5b1IyMlVPdE8y?=
 =?utf-8?B?NDN5UG1GOHVxdndmZlRNMFdPNGh6d01jcXd5QUVCSG9MU29KVldvNVptaGtn?=
 =?utf-8?B?eE1mMFFMdExyK20xclpieHFKM0U4Y29rbHM0SnNGZFRpU280T056N29kSjFs?=
 =?utf-8?B?ZnNmczJ2OWs3SmZJaGVBekQ4RlBRRDA1MnBidzlYVzhNSjFTcHRtK2R0ZFJ3?=
 =?utf-8?B?VXptTWlFMnIzN3pWUUt2MWt4OWxHTWpLNmRzcnhyeHdoV3dYSTZNZkN1aTJX?=
 =?utf-8?B?KzNNSHBmdXpSRjlrN2xjckNxNkdmOFF0QUZPcmJaNmJ1bGRCaExFUXQrSHc3?=
 =?utf-8?B?dVVwRXVLVnNWUUF1dGpmdStwbjZGZUlsUU1RSDU5SE0vdE9qV3BkSGsrTDFS?=
 =?utf-8?B?bGRwM0dnY3lJUzlsUkRVcXZPSHdrUE1XdVl0ejBjRUtrYU14cjQxZy9ycE5z?=
 =?utf-8?B?SWVuYmRGei9lVitmZ053R3VMNzR1NE9MOGhUM1pIL0hnRFczVFJuY2pLNmVi?=
 =?utf-8?B?QkNqY1pFeGtEY0dVKzFiSmlORERQTytpdXZ6ZFZwMWFSVk5vTi8zT2pmYUJD?=
 =?utf-8?B?R0ltWnV4VkJodzkwMDZyS3ErYlUzK2tNRC9iZ2RHKzlUR1RXRjZOUmZ0WWtZ?=
 =?utf-8?B?S3pRWWpxc0JQejAzS244czdLRC9ZR1h3L0lnU2xPL2pkUHJ4Wi8rQmdGVTVZ?=
 =?utf-8?B?aDhtU1ZGR2QvN0RxZjJRK0Q1MmRJQktrM0ZTWDIyZEhBZVFUR3hyNlJsSTNu?=
 =?utf-8?B?Y094L0ZoLzhmYWp3U0ZnWjg1UTB5MVliNWpaY1hHU1F1WGxrM1hzTVgyRXoy?=
 =?utf-8?B?bWsybmMvb2RaNW9tNDYzQS8wWmpZenZoMlNsYXVuN1VCT2ExazVNNzI4S3gz?=
 =?utf-8?B?cVE2RlRzOVlZclQ1a00ySEJlWGpjUC8vN2FXb08yUHhXaXZ6cXhsQ0VMVDgy?=
 =?utf-8?B?R0FJZlVIQVY3djg1ZndUOW94U0g3Y0REanhyRmU4Y3I5RDZrYmVJYWJHS3ZS?=
 =?utf-8?B?N0pXRjVUOUNJVUpUUnRhazdwenV6TVoxbmF1USs4a1BTZk83cytJNlFXZWpm?=
 =?utf-8?B?MkZGWTB4ZUtBNW9KTkY5c29qWjNHUnJlSTJyeHIxL0tEbWtuVFFLRFg5WjRr?=
 =?utf-8?B?eFoxMS83RnVxTEx6eTNBMTJoL005NGVyNDZFalFhYXBVY0lGbTZjdHdDYjJh?=
 =?utf-8?B?NW9aQkY5S2h1UFZxVlZuOXBsVkJkSm5Wc3FyRVliZk42Mm00VWdFdlUwbVY3?=
 =?utf-8?B?YTFZWVpHQnl1R2Zwc0FNTVhMRHU4Z1JIVk82QkJhQm9Eb0ZEZGJ1eWdrK0R2?=
 =?utf-8?B?ME5UajYvQXJBU2J5TFJTUXVuVUFNSFpGWnJMaWlLVTdZcHh5c1E4UGdmVjRV?=
 =?utf-8?B?aGE0S3FyT2tKMnVIUkVpTjBmTjNaZFNOL2RudXJnTUpvczkvbm01aGFMczdI?=
 =?utf-8?Q?IEveKAr3Pk8D2vCY=3D?=
X-Exchange-RoutingPolicyChecked: nbNhG6sFdfLMUoBguM0Ge5pjIFME3FB9gSbYilkYpPNsBluT8XLmOU+M0sDrSOhMXxpKcxRaapu3YJ1csun0nBK6Yzjpg1OxIAHPgqp3vZqH1Vl14ElNSaXkJOYBu506xbJVxVh9eMH3oJSCJYeSfcyMVjc1h+NWAQVyCB0T5KzMK9qFIMuaJne6KDwN//RXnDyAqNTkCoijYlVcZm3W6wVTk2t4mgAq6FXdlAtWzUQm+K56iETC9Ft/Bh4ex3kyWcpJcJap4L7X50z7FPe5pTP8bHbmsChY16B/jwtxPIPgXqY9aJuPwKnygsp/LtOt0YZuFsyg50B9baxKiNZRgQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe8adc4-fe24-4357-9118-08df31152e34
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 14:51:55.0801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0FTGiiqg6KNb20DD5JmY4gbPEgtRBneKBuaCAzKYZaxUq+TlcMvmhS1tchL9kaHsmUEEB5f1wFCYANOW64dcPqwZmEJnVU07PtQN6V/TAh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB203949
X-OriginatorOrg: intel.com

Hi Jinjie,

On 10/22/26 6:23 PM, Jinjie Ruan wrote:
> 
> 
> 在 2026/9/1 1:22, Fenghua Yu 写道:
>> This series enables MBA bandwidth control emulation on ARM MPAM when the
>> default MB control is disabled, using a node-scoped MB_NODE control as
>> the native backend.  It extends memory-bandwidth monitoring and
> 
> Hi everyone,
> 
> We also have the requirement for the MPAM node-scoped MB_NODE control.
> Are there any follow-up plans for this feature?
> 
> Is there anything I can help with?
> 

...

>>
>> Apply the patches on top of [2].
>>

...

>>
>> This series is in https://github.com/fyu1/linux/  cpu_less.rfc.v2/
>> which is on top of [2].
>>

...

>>
>> [1] [RFC v2] mpam,x86,fs/resctrl: Generic schema description Proof of Concept https://lore.kernel.org/lkml/d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com/
>> [2] Reinette's resctrl control branch RFC v2: git://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git branch resctrl/controls_rfc_v2.4
>>
This work depends on [2] around which I believe all discussions have now settled
with the planned changes shared during LPC:
https://lpc.events/event/20/contributions/2368/attachments/2066/4625/resctrl_2026_combined.pdf

Please note, as highlighted in 

	https://lore.kernel.org/lkml/9d2f589a-7d10-44ee-a7a4-7d75d860e988@arm.com/

as well as the LPC presentation, that the support for MB_NODE is planned to look
different from what is presented in this RFC.

Upstreaming of [2] started with two series currently outstanding:

"x86,fs/resctrl: Cleanups in preparation for multiple controls support"
	https://lore.kernel.org/lkml/cover.1791406459.git.reinette.chatre@intel.com/

"arm_mpam: resctrl: Separate MPAM domains"
	https://lore.kernel.org/lkml/cover.1792443633.git.reinette.chatre@intel.com/

I see that you already started to take a look at the MPAM changes. That is much appreciated.
Any reviews are much appreciated.

Once the above two outstanding series land I will work on the next batch of the foundational
work on which the MB_NODE support can be created.

Reinette

