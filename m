Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793098373;
	b=NrlJ2y4USYrMy7zplrJ9rlk69hQ7tSkZBHY4aEf9c7UdivxvwtN9XYfeunW3SIn29jOz
	 7GocB3sLuHzYuG4SSRTPYQQOODJpi0OJhTP2gaywGGv0n4xgbKHtwjToUd01A99S33isc
	 VJwIJt81u5hD7qnvjjIodtX9w0JAyJeHzrk4gsMiKA7dks4yyWQFqRaAKMgm55uvBTZBY
	 4zYnaH3HHSu1jpdEyxqVMf7kGgN172mfi7xk28mDO1wSqptmYLpL8s1trNBxj5/woK+ng
	 11oorXAQuxIErBRd2qPsROab6/3wfsiKrJ0BqNYnKATA8wJDNWoisLvOeQQCwsCdW6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098373;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=FDgl55ASKZu817HqybSK31lIrNh7GkCZnAgzrT8nAG0=;
	b=sOKnxS4KecEBkPhAlzoSDJFVhCT6RJkF2H2UpyXawRWPCy/ytKLIgBjFxenWLVtB60Wq
	 zaI1wqS/LHwdCx6ix8n/sOCf4BdS9jlcmjsa8W9VF9L6wI1ShCiepBgoOAIaQRRCYzi/W
	 Q7z9ZnC+I3hCa6/5inF3yi6qpmz69TcNlXqCukz4Al6OscJnWoKLaTr5Ong2sK3ahYBbV
	 6C2n1jjdK+ar0rqW5pZRDLTl2e3tnJYvn4DAOh8Tyda5oJKGiDHwZCsIDmNxTciwq5tM6
	 GmtwnQvtdc9myZltvUE+MPKIBGZ5zW5dJAH3Q3WzIzRYHqOlFU2P5AV5RQm8DWmewXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S5AQ0iDq;
	arc=fail smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AB7606A335
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1AB7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S5AQ0iDq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793098373; x=1824634373;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=PLot/rO2pqAGLryhVrR7ghqdpuy0V8p+4H8HlXimRRY=;
  b=S5AQ0iDqhwNz1/eoGEovt26HCl3cT9pv/5o1cb4aBrRCbzTOOf+mVtL3
   nX2MTwkBhEqBsFOwK4ybsLgVefKoCPly3D2G4ZAjnrrcp+v/g3CS15DG6
   NcbG+2ZNcZaIAva59oY7qEO/KxwrGu9rCLA6IjbqmsYDntM9SMBShldfo
   CCZVHbAQYbwkZN65xMVnxXyDnIN3mJpK9lYZJDBTxQLoK2iJUncb19dtF
   jlVYiSb624mTflq4epFOPlSFfsM0QQFBKhlydvgABeduSRvfA5MbyZAvm
   hnPKDCqHC93ZVuhjeykzboDVbqnx29BvSgIyimUWNnfFAwVIfenOgusIb
   g==;
X-CSE-ConnectionGUID: OjQNkM8PS1Sy7weELpVuzA==
X-CSE-MsgGUID: 3y5gZITNQEO58Hrqo2pn2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1824857"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1824857"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:52:52 -0700
X-CSE-ConnectionGUID: UIurccThQDm0oZ/y4JX1GA==
X-CSE-MsgGUID: 5WsZPpSwSvuVb7KfOTsBJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4597455"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:52:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:52:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 03:52:51 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:52:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtQMPcs0th+tbUQc9suncAfBTyGWnshaA2T+bsfXvnpsoap/bVmR19NVXTjZ9GOzLTBb0y83uL6hvyYRB3RpJN73r2p8+Haaoh/P0KvKM23c9KNAdMjm1ZfzGSPl94cRFgMEkGs+Jmzvmkg6Sn+nItmWInuxCH9H0ylTjRIZ14WjDjKq11Hp0TL5/6IvALTGlJ+bf8TocVdpkP64ueLWuzgJjJhyMd3+42fpRV7XVTqXf8Keo23f16kVwFcaeufq2BfO5bTUrCKglt5caaUQfUhzWVWS+hfknn32nZ8W3bQAlJkn3j8RhKKP0HdSsIftF9CITyKbpOXqBVGzvPWpqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDgl55ASKZu817HqybSK31lIrNh7GkCZnAgzrT8nAG0=;
 b=cMCONKtoZrdnWn6LLeRFgrj0FiBcLPndPZz5aY++b4cO+AddMCBje8ruBiYymG54sjG+9MmMp6g0MEv8RwPsSljIx1qMLZbIFkNbNkB5294DVxMPDRUyV9CBHnsng9gZs38QQnX1AVkYBiLyGUicDtSU0cYZq5fwTZ7fqLEr6iOJIOXEq5b/PeqmUuNOgDS63WfLPTPA5fFQgSTvft6v56gdMPyawQK7Lf6pLW94MU0V9O9z65k+bc3LqPsz6pCaqEHGe/3SO0V1wDj88/Ro+BCv1hgE9dKksfD7bkeSb7hlIHFbjcfIKenySKeADX/ExHsctuT/bwZqs0CGUnxlwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 PH0PR11MB5144.namprd11.prod.outlook.com (2603:10b6:510:3e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.20; Tue, 27 Oct 2026 10:52:44 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 10:52:43 +0000
Date: Tue, 27 Oct 2026 18:39:50 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 06/12] x86,fs/resctrl: Move
 resctrl_arch_round_mon_val() out of line
Message-ID: <auB_diiEDQ1x2sKJ@chenyu-dev>
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <e3d614c6c6d9cbcb92e5dcc975cafae4bfb059a6.1791933001.git.yu.c.chen@intel.com>
 <89c4bcdc-7ca6-47d5-b24d-85befda08392@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <89c4bcdc-7ca6-47d5-b24d-85befda08392@intel.com>
X-ClientProxiedBy: KU2P306CA0043.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3c::6) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|PH0PR11MB5144:EE_
X-MS-Office365-Filtering-Correlation-Id: 5702ec85-90c7-4ed5-2c54-08df34186d86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|6133799003|22082099003|18002099003|10067099003|261026140227099003|261026121527099003|4143699003|11063799006|56012099006|261009223027099003|261022075727099003|261021123027099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: TDYCT2bn2UOqASOpIzK/vwgsatxWQwIEKSIl+Q+EKpFnqT7OhHS+8+14ENAGArlCX7XBXf1NmLOzWgQwOq9fHZqJjDn/obfGxRnLZSndH4v/Fsztd9SeCr6sJaqu7XlmrGkvwpDo7CCSYnwHU/G4rxoKL7j63xc3YJTWegumtDQBJqQTJZdNYtHtmeHKCXI/mBUzjyp4VPeveCiO599GOl8B01IQnsfAapuueg3W1qkGfOUVyd4gWMyBQbCf2MSoU8whNPUWqpbmG4w6X/Mza6eA6XZL2ORFKeXhvAPxfETVDg48JwkFSj3gUAfi1rRVo2GeoqP7Snd14Xs8ek4SEhpGU1lrXu5NLROngPSgQS1O7qpeYBATTyY9vizleOw/PVWTmM503IXYvzqwOwcqp4DWxbKniCrNYOKCDGi7HJcuhccNLea5UgbznFvnlszvHunydi4yps90A49gEwwBugxyTtFaCnodFDDeWjNbMTkitkmL54btH3T6cGJZNGdBmCcE2uDh2ANIPm5inHGnLAtEOJ0YhSNGSlFTmKjPcxV6mE9nLtjc0p31lAw15EBaWsL5fqXk9ZUBnWMgdHke8JBoCmrNOxIIM7WRvTr7e8WfaAlTXCtaGsFNBApz+pF8eUs5Tvc2lR7ygF+po8kbemKTIc73PtUr7u0k4dJgZdo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(6133799003)(22082099003)(18002099003)(10067099003)(261026140227099003)(261026121527099003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QGpb5RwCyQil2nJYXWE80dYmDtO0y5svU7HAjlKQdyc48JtLKEsPFcb+cYBv?=
 =?us-ascii?Q?iB60G0LYqpZHYk2bdD56OFjbQEklaR8bN9kBZMvnuvbIAUUGKEI/W+S97Pku?=
 =?us-ascii?Q?cy0Cz3qsw+PT46uqJkodtQiK1an6Tcc9MRhpXXm4NOrYRxG6gEzkV1OK1CJf?=
 =?us-ascii?Q?vSyBxy80Pgw/rnqA13vZCeuEKg7kAuOGatzHY5RW91eKlVgWqmkUY6bhfVhO?=
 =?us-ascii?Q?g+9f3a68OsK2Pa2YT2NVSPcS2BlSfUESWsXnLU9U9dQ+UAzbrq91Offr0XNz?=
 =?us-ascii?Q?1ts78FrBPur5E+3+PVzl6+GPymSGHVrWEVNLldQhvdGqsGaH65Mvv9OUoO/3?=
 =?us-ascii?Q?oNprX/eT0I2HkL1scSVZQxPslE1ULy7Efj2QcZTDNdPcBxwKgKWQjCz7J58K?=
 =?us-ascii?Q?B9LgwbZbuxCum/rKaT/zmxcgHIFuyN/P67khVD+NXtjZyOZdAYwszTzH5QOh?=
 =?us-ascii?Q?7DiY+2LsxHzQO6DjhmNixejRz3DFu1kl2GeGZBS81qDXWcM8sFFzDXTrQTOq?=
 =?us-ascii?Q?GzKrRBNA/gqaQ8RQK1EhxKW+RA7kxszWU24Bx9FntxUuBKmzbDkiCxgRbeaO?=
 =?us-ascii?Q?3DkxZRkqrKu9tQBrAWTYj9i6u0F9TUk607IFZVE681BVYme0Txv2aVloJIOy?=
 =?us-ascii?Q?G+yP9HOWFHFn5rN36OVIzZY4zs1XkD28+vJTtsQTjYNFyYHU0b0DQsLX4Gcj?=
 =?us-ascii?Q?mWMI9ek/oV4YSSLK7wojvhzuozOsAew6lsERmFHxuZlgmmBZV65VhamDVNCZ?=
 =?us-ascii?Q?8fl5c/2DGadVDMMe96l+UJsEZsK7VtuhJgBeGU/MJo5xhEuAx9l9O/24l9uI?=
 =?us-ascii?Q?R5d7z3uWllfOJbPW0S5Yyt8CuJTwdibUZwzSTkGWscTsqABJrlCI5banv6fr?=
 =?us-ascii?Q?ERCw98mhfL73rabD6yAiRyJAgC1IK1dOJuxMwS/Lz0ZRhh/y+fHG07yHx8rZ?=
 =?us-ascii?Q?MwdgV90UZcUuO16ZJ9XSCVn2nqo5JsrZob08fYCQZrwRpvkJTwNJ413npJxl?=
 =?us-ascii?Q?DMfZZ4xw10CsDRC4tHpX74Us7gntsLNrVB3a8dGbx6rX5kVyzeV9v1bbR4ml?=
 =?us-ascii?Q?Ew1phDYnf2sBZ35JSq2wfx5T27wiIDdPmGjOGevItla9xInCcjiiNWiQsKih?=
 =?us-ascii?Q?m7OydED4xsQgNBzz5QNaAAoE3w4D78q+oImA4FQtvRmXqiw15EV3iuUroHpp?=
 =?us-ascii?Q?JhhIyC3dbtSQU3mFRVO977GkRg1xKUlizCIi8q/ujNmzfNvzHaEhnoGobFJa?=
 =?us-ascii?Q?+KL0oOVjOvRa9NYpmYCow+jhlVXCvkgkvcAc0AWZOjQgBAX/QPbI/rZ+pO4O?=
 =?us-ascii?Q?DaQtkWBmauSKRZaDNA+Z0t9WEWRYBg+Y7cOlRQuZBi79+P3L43ZxRetrzXEr?=
 =?us-ascii?Q?RRwiCelYaFrzRVYNCW2rknqK6nwYVRcD+DbtqF0mTU9AfkNuEduI0k3B/PUm?=
 =?us-ascii?Q?IAJhaKmieagKnlIrDaOQdIRl4MScJcq60ozFC8wnKuZCLxAIb9w3TtHWKQoZ?=
 =?us-ascii?Q?N9j92aWaryrOg37dOf9p2g1pJfTHusxYVzhfmQkouOc55M/E+DXGJTQdAD3J?=
 =?us-ascii?Q?eiVSOv5kMwIBeEmRmP5oVOMJ6QElR0/RTldhvdNdxjMH2MALF1XQM9l4Y0eh?=
 =?us-ascii?Q?FeUB9i2/TtpjzVezlYCk1K4dmps3VOqzki59Z/2LoJwMCYH1qzoXeP6Aof5z?=
 =?us-ascii?Q?G6OsxyGiYf2ZO6x7Vrsc1F2UX5/t2xnNE8wjmMkLPiugeaFiHGx+NM1rd7kQ?=
 =?us-ascii?Q?TYbAFdxRqw=3D=3D?=
X-Exchange-RoutingPolicyChecked: q9y1n7nvYXBgUQsrkT5ok23wmaEC6xzNG0n+yspDSdMLpQnnmwXSb1jUMx0HjFLZ4peP2uadZL85CM3ywgOza9Mj9aHCmCCFewck0UhwDaCXbaLOUA6dB2RJ+3zUBLsp/oSV0bs6GqpmJzmED3af/gr01Oq5gFlVFfD/9e+gjLJLHQsHe5381mxl4o97kuo1/nvfvzsx6yR5V2KTL9CQscMmJQjMwK0BAakXtRxqZ8IE22IATw+cDaLaaxPQGI2Hy+/Z3yyAwtNaMCzqFLcw7h55gMr5gHAGmCIkwsAM2ryYufFefiMlXahK3tAhLpw4walwk+dgFYekTdlmJdedxA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5702ec85-90c7-4ed5-2c54-08df34186d86
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 10:52:43.2313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FbczR0yLqf5bp+R+Qw7fuK96pu/rs5aOf+0mreVSr/QDxPLbu4pF2n2FcKAlrri4P8LcEQUzdv8qWJiMr8fNKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5144
X-OriginatorOrg: intel.com

Hi Reinette,

On Fri, Oct 23, 2026 at 04:59:35PM -0700, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 10/13/26 7:59 PM, Chen Yu wrote:
> > resctrl_arch_round_mon_val() is an inline function in the architecture
> > header. It is only called during resctrl initialization and when user space
> 
> For emphasis this can be:
> "in the architecture header" -> "in the x86 and MPAM architecture headers."
>

OK, will change it.

> > writes "max_threshold_occupancy", neither of which is a hot path that
> > benefits from inlining.
> > 
> > Upcoming ERDT support needs resctrl_arch_round_mon_val() to consult
> > ERDT-specific state. Keeping it inline would force ERDT prototypes into the
> > architecture header, fragmenting the ERDT code across files.
> 
> For emphasis:
> "architecture header" -> "x86 asm header"
> "fragmenting the ERDT code into the x86 asm header where it does not belong."?
>

OK, will do.

> > 
> > Move resctrl_arch_round_mon_val() into monitor.c and declare it in
> > include/linux/resctrl.h alongside the other resctrl_arch_*() calls. Move the
> > MPAM stub from arm_mpam.h into mpam_resctrl.c accordingly.
> > 
> > No functional change.
> > 
> > Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> > Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> > ---
> > 
> >  arch/x86/include/asm/resctrl.h        | 9 ---------
> >  arch/x86/kernel/cpu/resctrl/monitor.c | 9 +++++++++
> >  drivers/resctrl/mpam_resctrl.c        | 5 +++++
> >  include/linux/arm_mpam.h              | 5 -----
> 
> This needs a subject prefix of "arm,x86,fs/resctrl:" to draw attention from
> MPAM maintainers.
>

OK, will do.

> This needs an ack from the MPAM maintainer and at this time it is really
> buried within this series and unlikely to get attention.
> 
> Placing this change in the middle of the series also places unnecessary burden
> on MPAM maintainers since now they need to review all patches up to this
> change when only a review of this change is needed.
> 
> Please move this patch to beginning of series, this could be the second
> patch in the series after the "x86/topology" change.
>

OK, will do.

thanks,
Chenyu

> >  include/linux/resctrl.h               | 1 +
> >  5 files changed, 15 insertions(+), 14 deletions(-)
> Patch looks good.
> 
> Reinette
