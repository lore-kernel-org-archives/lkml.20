Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794604810;
	b=ajBxjARXKn/UQEReMf0bzfytW01xHfk3bxSM3pmwARk0bBLYTx6evEsdp7wstSEko/7z
	 KHRnm6Qgv0D0vK/j0pFBZhp7IZf5Fnab0xd5afzEKmty+aYl6F61cZbsWvPy9iY9xI6om
	 aTUrk2BHPAOK7dB1qsNiHWuJKsshsQtGjEaBrZ/h2H+en+i7hBbzurSMvFEpCBEHO/ox9
	 rJr0ApApBkDqmQ0vcgQ0xh3BmiH4rJCX4duDMpW5kaQVmAtkEt9QlLUpwS9RE5SHKT1dv
	 QpKmi00ZOhvPZogId44OMgPUn3epu7dafJYGoWa3CLYMuupjqxAFeL0J7wc6W4PmD6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604810;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:Content-Language:To:CC:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=ATC6O9HAxz+dp7LKHvV09k01pAUPoHy0LwGR2NrkiO4=;
	b=agYlC4qHCDNlRph6334w9NraGlcMH7BnmZ+mLxIXvL/qhib3lhTstNrY5yOTu7bH8pF9
	 iHPm9XMkGL0uM8mHMXnWVBTZplMEE7ciRiyNZrRHBh/nawrD2H7OjENtZAfDV0iYjH7sI
	 7KhtQVnVrReYB/yoEhiYRCaTC4/R9nt4jFMBqmJSJtpGdYMkJwPZuXPGrXEwtjHfCDnJh
	 gsCkdtMZ01DSTpzKSUdRqstgpuTqrJvQh27MjqQMAst1Mi03cZsrhAJam+jmTOXgUDMgT
	 2sv4IohscLGUDavU4diiehrmsVv3bCWIELbaR3XZUoEMlPInjW5uNMFwXKYfOv7LSQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j+gBNwhG;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b="S/HyMVHU";
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3441606A327;
	Fri, 13 Nov 2026 21:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3441606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j+gBNwhG;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=S/HyMVHU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794604810; x=1826140810;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZhKWObZGhiWOxWe2DvnZH0cXW/GfObDswTJEtF3BYo8=;
  b=j+gBNwhG4bWS3m4kiE/14sDt06EAaKczpaA5Ib2JM2bXXL+O8CSIp/io
   iGfsFva0B+nP2+dUd9ZlPCZl70hYOD6aF6vWyQlZyA9cjPFAO/Yc+81nr
   RzqgDWcym7ZHLCQj8j+Gqufe+L5O0mX8EQwt+lM2idWs/8q1M+v5p5E+9
   H007daSQdOaYFeHkzLrScMZ8QK7gls22lZjqf25Z7s39vz2iBhMFhAwox
   KZWNlMuDAnPGmvCvfifayBFgwJPIikBB6YC3i/aa1TlXSrkT/nDBeRG/j
   833h1zaN4z6CgJFGqypTUkcs/4F+oWQXOMl4YbS+nxWtu+35tWHNUR4sd
   A==;
X-CSE-ConnectionGUID: nfyOkDksTUK9DgA42rc8vw==
X-CSE-MsgGUID: jO0Qi1o0SxSSDufDzn2YFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3339438"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3339438"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 13:20:10 -0800
X-CSE-ConnectionGUID: ZGffEQReSs2qEyH8DR/V5Q==
X-CSE-MsgGUID: 4zCWPhqMQ1S+Mug+oFX9Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9343281"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 13:20:09 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 13:20:08 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 13 Nov 2026 13:20:08 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 13:20:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQ5vNJGC22ah+FzjZjB9m8+wS+ATlJLlRqr5EqU2TMJhETS+RiZCyNtPNKJP68CDZkFkwqxtgvztkQw1EETCOlsQv3v7KwldglmAJOIJPUMljqwnWybYYwl+t3gIf1iELe7gHnwU3J6xSgjWtKBP+RploesKpoMhT14rnodbME+uJzfRgOWFxZDYfi0TGYS7z36E1Xg3ZlmG1UaHv79uapqLKX0XbhTb+NZ5Ooi9Dz41Ew/9CKWPDnYZuAQadzxdoep5otYd4dayPljRcuR4rHsa8uGSJT43GHPeCTdckTtl8/ZoYDbR2ZIFVVJnJQOhYu8IZkfdR8wm5peirkC2TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ATC6O9HAxz+dp7LKHvV09k01pAUPoHy0LwGR2NrkiO4=;
 b=OMo1AMptIxWm3x2YciKMlIVkMMKUYZSjWNLs2WAGte0GbwEeHf/ktqZU4YAGHy/vBuL86JYTrWKVZT4L/eskR8PndrQBP3JrrkX0VaM8Tx8PG0V1kGlq4O/zRcO7LiqdkrrAtQM6RnDfAnuIaL9Kl6KTCK+uph43w7ft/NzAmLnwcGVwVUHObtDnI1taRI5Ln1oN/LrPxsf/1Mecl+Kvx9+5Lb4ev11pQHQ1UrWHz4OQXQ95ETMKkzfcW8uIgfOOXyEVMgFftns9iFMSOysAX6SwSf5dAnNGKxP6Fe7octgLWAHdyvTAVMwAMcjqnOD0NUZCn2oixj5Vd0DSVTdGNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATC6O9HAxz+dp7LKHvV09k01pAUPoHy0LwGR2NrkiO4=;
 b=S/HyMVHUgGkXgoC/pigOJIFpUN26qRZC/2nyvgbBiFDewwrRPD2kesQKei8VEM2yXIgWLAReeAazcCWFlFz78isZ67FpjDHfIRvaDOhq3a3sjYBk//g/wO3rSJoumahS/2SQzsjF8FTzdSyxcPa3oZtdGu4ityq0BqR1FRmOGog=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7846.namprd11.prod.outlook.com (2603:10b6:930:79::14)
 by CY5PR11MB6365.namprd11.prod.outlook.com (2603:10b6:930:3b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 21:20:06 +0000
Received: from CY8PR11MB7846.namprd11.prod.outlook.com
 ([fe80::cae0:d05c:b2fc:c395]) by CY8PR11MB7846.namprd11.prod.outlook.com
 ([fe80::cae0:d05c:b2fc:c395%7]) with mapi id 15.21.0592.010; Fri, 13 Nov 2026
 21:20:06 +0000
Message-ID: <3650daff-48cc-48dc-a2cb-cdfbe91ef3df@intel.com>
Date: Fri, 13 Nov 2026 13:20:03 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] x86/mce: Rate-limit the CMCI storm transition
 notices
Content-Language: en-US
To: Breno Leitao <leitao@debian.org>, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Qiuxu Zhuo
	<qzhuo@nvidia.com>
CC: <linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Rik van Riel
	<riel@surriel.com>, <kernel-team@meta.com>
References: <20261113-mci_ratelimit-v3-0-ada38c5a6c88@debian.org>
 <20261113-mci_ratelimit-v3-2-ada38c5a6c88@debian.org>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20261113-mci_ratelimit-v3-2-ada38c5a6c88@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::12) To CY8PR11MB7846.namprd11.prod.outlook.com
 (2603:10b6:930:79::14)
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
X-MS-TrafficTypeDiagnostic: CY8PR11MB7846:EE_|CY5PR11MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: cdbbe908-cdc9-4df8-53d3-08df41cbe374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|4143699003|11063799006|56012099006|261021123027099003|261102123227099003|261021121427099003|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: TvhsGDJ7aN1God/trwE4H42uGWc+qR2PYycriSBWuf/ch9v1RbgLp3dFtiVXeYrNo/bZwkaOvZo6Ajxq8M8btzDPu+aXh7+irNJDgSIPSXaNt2ZaTsk+H0uyX85fahTS4YvXL6dRpWFL5j8VopdZf+Rw3864At3HPQ3W1sgghofOqU/xTlrL1i7dMtv6XFo0gykcS+B/hXkw7JIJG8BwcsutryJCkLu+zfSf+hOSnT0V3oLnuuFls4lpovcrGVbeezROyExmdKvRH1AWAxhvYkOc9kV5CVJEEOnkvrUGZLw/tgoQb9I47mXa/ZWKAce//GNL57a93Wa7j6tGUVe1+3jFohYvPwVQlLCrOYzxTonSY43URkPmAB8Z2if83AfgdXmOfmj62y6Hkq51U65YtNLn9h8neg+R2tBG41k+t61ZhFEZJLSI8tm2Ir58DXsJAhKj064vVguep9Aw+lb29fns4dI7rwqrfvswTXwicSc2nmXuQf6syNq+u3JklHZicBftFBU0TFh/Yg7gJwH274ocHGCjJzINYwLuXH2KCGiq1uAw/9bO6yDe55GnYdCS+3s8w3lb2Ml8G6NQQHAgGpyT1JmGHO8SnZrGXWtkzT7dZ7SXNFpWY54DjJtOicGyqPbDY1OXIz6wCtfMvptQZi5mG57yUpOJmUCK8nMKEuM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7846.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(4143699003)(11063799006)(56012099006)(261021123027099003)(261102123227099003)(261021121427099003)(10067099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzhuUlJ6aFFCNW5iODNrR2ZvRGVVZkJYL1I1ZlF0YVdEWmptbUhDQmp1MnhR?=
 =?utf-8?B?Nkw0a2Vmb01TYzBuUXF2UjgyME1Mak1wdFRMRzlLektiVWgzVG5KL1IzZTV1?=
 =?utf-8?B?WEdyTHAxb2lSOFRjbTAvQW5ZZGRnczBvOFRrMHVSbGl0ajlZbFhlN1lBOCt2?=
 =?utf-8?B?UXFGRkY4UmxlTXhXMVd5R3lHWEpjdHc1ZXp1bFNHT3ZtVE1GZDRuRkJIZHpZ?=
 =?utf-8?B?NTVtNzAvVm9BU09aT0x4Z0lxY2cvKytSNEp5MklqMUFnOWRoUDF4enNtU0ZO?=
 =?utf-8?B?cTlBcnRQUnU4SVRWREhwWEVwa1RnTThhbFVvdWZvMFp2cFZ6cklKdmgwUDJs?=
 =?utf-8?B?RmZ6ZEU5SS9Zdis0L25xTjVmYlRzWE1rTHIzdG9QWGFRaEU0cXhyZ0hSRFlS?=
 =?utf-8?B?NGlkTjl5Y29WMGNrYXgydjIxcGY4em1zL2QySjA2U2JZREVhd2xSOEV2d05O?=
 =?utf-8?B?VnE4ZkNZeWptU3VuMVJQYkIzTkVrQnhaaDlyVm9DOXlkaVdpMUNtaHRhdUhz?=
 =?utf-8?B?THZXd0ZzNWp5NmJ1YXpKTXFsZUhETS9uVTZDSENENEl5RFVHckpzRTBZTEVU?=
 =?utf-8?B?a1ZHYk9HVHUyNk80WFJkaXVMdGFkYUFwYkJ6dDRNK0tBOEtEdkJBSW1Yb3ZU?=
 =?utf-8?B?YXA2OTg4ZmYzd09qaUN2Z1BpVW1zbnBwdFdqRStWUE5oTy9zT2RYVXFWWVJ5?=
 =?utf-8?B?ZW5LdkJWRDZkMEc3RnBQNXVEa2FLTU9tTjByN0FZeEVDRGJ4Y21OL3E3NGhZ?=
 =?utf-8?B?bnk2c1l6WE9ybnhkZTY3NGI0a3BrMlUxdytCZXdXNHo2bkplNi9SOHdGNERK?=
 =?utf-8?B?TGVPSitpVmZ5YjI4V0RiSnRVM0VOYmFTVnhLQ3lONk9yQW5mcS9CenpOYzlM?=
 =?utf-8?B?RW5aejVYTW9qU3diVzY2L3VTTFJhWEFYbjY3TUhjRUJXc2xNZ2ViSlhNYTBJ?=
 =?utf-8?B?aWc0MFlOMTZmSi9va09KOGVmUUcvVzBYMkR6MUprNGRLUXE2OVFzcDhwZFlY?=
 =?utf-8?B?TkZWZGJhYjZQN05kQjFGVkx5NHJaQVZ1bGxhdXJMNWJyUFk1M0ZMZ2ZxNmlB?=
 =?utf-8?B?VVZHYkttdC9sQjVLbzFDcVpnSU53VW5RK2RmWEErWnBmdGxmdldPeUg2VTFs?=
 =?utf-8?B?V09idU43M25SeitZQlJoNmJybkJEV2VjblpGOTlMOUZIMlpNSHFMbFdRL21K?=
 =?utf-8?B?QU1YMVFRdjVLY2N5OVdsdjF4TUtmU0FTelF6blczRDBvRDB4ZjI1bFJ6d0lm?=
 =?utf-8?B?T1NUSmpDeUJEOGlzdGRxMGtSaDdjNW9YYlA2VGlxSXRtZWxjaG84dVN3R20y?=
 =?utf-8?B?eWFoVXhWZ0Q3bUFCd09nbTljbE1jdVMwdGl2d1orOW5qa0ZCM0V5clYyTVlR?=
 =?utf-8?B?bnozLzJZVDF3SmJjcktxTDFaa052NjNlcUdXWjhOblNYYk1lVWl3MmxUdy9y?=
 =?utf-8?B?ZGQvMnpvZ1lyQlhhbXB4cHJoM2lrOUJac1BzNHF0YUtlRDBLcDFIQlZacjJV?=
 =?utf-8?B?aHczRWlTWGpwcm5aTzM0cUF3am9nT1dvWkg1Nmw1Y0NSYW4vcGJTUEtCSTJ6?=
 =?utf-8?B?aXU5R204RFdQSXovU2M3QUI5c0JZVm4wbUdKQVdNUDByVVZqeERNM280c0Fj?=
 =?utf-8?B?dHBML3NsWGhCRzEvOXMzT203WFVEUFhsYzVIR0kxR2ZHWndiL2RUNm81cXJK?=
 =?utf-8?B?UVE0d1NOWWFkZ053ZGZnR2FYZTlhYlZaQ21uWEhEcHFXRFNXTnFpUjFZVzBE?=
 =?utf-8?B?QUp0eHNnZ0IvdnhkWFBzdzV2V1VlNGVpYkZxS1VQNkliaDkrVGgyTHRNUFdu?=
 =?utf-8?B?Q1QyVkY4YVBvd2wzUk5TVWRVZGlncTVFZ283Tm5GR3BqU05jUVIxVnpseVYy?=
 =?utf-8?B?SXJqbzRQR2hCa2Y0MTFidnM5R0loVEZhQTh0Yk0zbm1hKzVkVVBmMjVrSmhU?=
 =?utf-8?B?NTdMY3FSSlVDc0V5YzE2V28wL2NuRllqTTR2QWk5Qkt5akVhUGovWkdTY3ZG?=
 =?utf-8?B?cS9pQWlQYldnTE5Va1NmWjBhaHB1ZnJnZjJyUnc4Rm9PMktTMU5XeHJtNk1i?=
 =?utf-8?B?dFdIcGVucjlydXJ0eXg0R2tNbEkydWZacWwxd0VzN3Y2VmE5b2RTUlZOcFh6?=
 =?utf-8?B?ZGJIK1JjWmJOejlkNHI4bDFFTHc3bHFOUlMxbEEwT0RlZzFvTDNuN3o1ZEdQ?=
 =?utf-8?B?bnNER0EwWlAzYk1zOGQzUlFIOGFtWjhuRFliZzVNSmlhajlGRjErN1NTSWha?=
 =?utf-8?B?b2NzVDJOUjExcGFTSldmVlZ2OFlIa2xvYXg4SXBMdzRNbEtBdXRhdHpKRGJz?=
 =?utf-8?B?WkQ0WUNrR1ZPdzZNUGJWS0c1Ly9lZDFVNEtxaXFhUUp2VFZJZHpTZz09?=
X-Exchange-RoutingPolicyChecked: eofMZJafYYyWhGv8FrsEucvTmdHoc+lfXveO1MgnBvIwf/m++Op9Gxtsthp91XTgAZ/NBUbxfVHgMnbr18yaWwHB0ExOm1M2/87uPjdmOtA5UsGr/x8xkLNsmmBUOdu07ovFFpiqDWaRdo9/4Zk0977vKH6bb3KtwjOwt6lxOFR8LRldxoHg16igfOT2q8F8Pk39UFjX/1Qn3EzShaiNSwz5NY89K2hEz58LdsgXUJTiBxIbQr9gI6wMcGBuFKKcC2Kqqc74w0kLoPPH6pD3zful0EiwbknVcVm7kISG2Ba+PTXxRiDeqVhWxTelv5/I/JAGgBVvhL6OQ+Tbe4W16g==
X-MS-Exchange-CrossTenant-Network-Message-Id: cdbbe908-cdc9-4df8-53d3-08df41cbe374
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7846.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 21:20:06.2128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1kIc7jOvVTkjdZUQWHq3u7au/Qs4z9EpHcRPgq4Y9USb9Yknf9+9Qn4uO7H46p8hu7vbw7h3SiTplpYnOu91qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6365
X-OriginatorOrg: intel.com

On 11/13/2026 4:49 AM, Breno Leitao wrote:
> mce_track_storm() prints a line every time a bank enters storm mode and
> another every time it leaves. Neither is bounded, so the log volume
> follows whatever rate the bank flaps at.
> 
> One host in our fleet logged 9970726 "CMCI storm detected" and 9970734
> "CMCI storm subsided" lines for a single bank over four days, which is
> a bit excessive for all monitoring purposes.
> 
> Put both transitions behind one ratelimit.
> 
> Acked-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---

Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>

A minor nit below.

>  arch/x86/kernel/cpu/mce/threshold.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/mce/threshold.c b/arch/x86/kernel/cpu/mce/threshold.c
> index 6c370d5af5bd23..8591715ce24306 100644
> --- a/arch/x86/kernel/cpu/mce/threshold.c
> +++ b/arch/x86/kernel/cpu/mce/threshold.c
> @@ -4,6 +4,7 @@
>   */
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
> +#include <linux/ratelimit.h>
>  
>  #include <asm/irq_vectors.h>
>  #include <asm/traps.h>
> @@ -111,6 +112,13 @@ void cmci_storm_end(unsigned int bank)
>  		mce_timer_kick(false);
>  }
>  
> +/*
> + * Shared by both transitions so that a bank flapping between them cannot
> + * outrun the console.
> + */
> +static DEFINE_RATELIMIT_STATE(storm_rs, DEFAULT_RATELIMIT_INTERVAL,
> +			      DEFAULT_RATELIMIT_BURST);
> +

Should this be defined as a function local similar to patch 1?

>  void mce_track_storm(struct mce *mce)
>  {
>  	struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
> @@ -150,13 +158,17 @@ void mce_track_storm(struct mce *mce)
>  	if (storm->banks[mce->bank].in_storm_mode) {
>  		if (history & GENMASK_ULL(STORM_END_POLL_THRESHOLD, 0))
>  			return;
> -		printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm subsided\n", smp_processor_id(), mce->bank);
> +		if (__ratelimit(&storm_rs))
> +			printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm subsided\n",
> +					smp_processor_id(), mce->bank);
>  		mce_handle_storm(mce->bank, false);
>  		cmci_storm_end(mce->bank);
>  	} else {
>  		if (hweight64(history) < STORM_BEGIN_THRESHOLD)
>  			return;
> -		printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm detected\n", smp_processor_id(), mce->bank);
> +		if (__ratelimit(&storm_rs))
> +			printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm detected\n",
> +					smp_processor_id(), mce->bank);
>  		mce_handle_storm(mce->bank, true);
>  		cmci_storm_begin(mce->bank);
>  	}
> 

