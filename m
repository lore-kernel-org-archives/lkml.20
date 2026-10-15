Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C526C4D6C2C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792084315; cv=fail; b=T4iOhMOdxFhBqDQqPshy6pLL0ZpAiXhW0tA4yJwt8lpmDSOjCMl+LxIrDXOJvT4pd3xNknwnK1Jmoux+L4E4NVCg4Nv9OLWHF7hmEAAnJ2gRofvUTbqJaJJHHfSGNPL5Z5TXmM1V/QeNrwQIxhcR4IpV4CMugurdcNeAKxovzHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792084315; c=relaxed/simple;
	bh=uqE4BPNZOxv4XcCIZbigBF0/gaIQg20z641CfXNaP0Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fjydybPG5Xd5nfWJg3ZgDYLhvsVzs8BFHJ7B+5VaajyaS4TC7Ff9UcBSoLxigkAKtMHybl/bDSdZ7fTCtHqyCUAUu0lbL9nm3HnHWBxSIvSzBhAY4uuN0pWHUQqT4sQF3goZkbXeCVmxLe+uJidYMSe+tSqxnkybgHF1vXBHZZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fn20cQ+c; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fn20cQ+c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792084302; x=1823620302;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=uqE4BPNZOxv4XcCIZbigBF0/gaIQg20z641CfXNaP0Y=;
  b=fn20cQ+cC0Ge6rbGEIMGmH91US8ka81I1InFTPU5LDoJnsLC2EMprdJI
   9LZ1EpJidkOEPDYV1m0RDjbtVnMT835AJcol3ZXe6nuX4nsnyjooz7quo
   qi86I8kh6xcx6SdBFU+ilcfML2tdhr9NmaQ9WWZ2/gx5ilM/YwoSYT3ZI
   T2AQt92nWtlI/uzteM2jrDyKaw5uI6VXCTiHey4+ervQfVU36pa+vndcJ
   DbKPS9rafum1qATecnmR6BHDtyvl7sDE1Wn9aXdCPvZpfpK4enZfqGOrE
   0MkbTSJZ5Ex5Fvv/uEwkLqKS10n0kks/oSpbTaHSYcAfZyPXblW8buU5h
   g==;
X-CSE-ConnectionGUID: b3nnchsZTDiieE77kwnFdw==
X-CSE-MsgGUID: FEURkf4YRxKGHtBV/BDgLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="759753"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="759753"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 10:11:41 -0700
X-CSE-ConnectionGUID: LSuz4qTdRRqGULDY3I9UNw==
X-CSE-MsgGUID: 2i/ZQWW8R9+hvf7BM/KvKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1702467"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 10:11:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 10:11:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 10:11:40 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 10:11:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bO/HR4GgoNiwcqQyWKxaAGShc5edp1GIEJizForgAUl5XNm6XhyIgcHBOlJVmgnTfMthEYVsUc2jQoUWVtTGKs48vK22JymHtl8CyMQgK2jYBN30i5BymcpCFD8t90lgqZtS8iFW+nbdeu+596yrs4zWLbiEsVMgte3Nb4NFI9KWoM3dDgxfzCzH5hI/TZkyMgeXFw8lvcj6dFZ1MrQaHb9pfLSQJWdFO1Kp1AZNTNJ3Dtdsp2jWCNkDVaV2Dnjs7zkLun1MHiuHVgPiFxUzDPRvOFlkjQRjA06OsKP1DJXSIMLkC7Iwn7Rldc20y7XIIocKILzCbGYNysZjAffdtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJVQiHVjAWgHObVhl0pSAIPSPTT5f57NnuYKQ7QXHaI=;
 b=GmQRwWCB7AHqlIto0Abupc4D97iCJyCHjEUZLxIcn5r8ksrxZys7XOVS7T1y6mogzBRacH+r3KPCYhYIya+XiGp/T8ug3alK1pBXsja7soJG9RbmIThgWFjwxC3wZXyJySNpnJA15wH9CwNAA8FubOvPIP1iNo14tf468eCBh3O8U5tu3LMIgnDACbsFNQbQzs9YTzYATrPs8GBdy0Jf3FioSmjZ1JIW324M5Hr1I6d75Co60HRXwfPaiU3Ryn0VSAFTXES//ruuRsE1vUp3L/dk+VlqgAHh0onm+13gAnXBA/9Nb6YV1c/PoErP6pPPSCXWrCLvJ3ENnOXm9y/xDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by DS0PPF4C13E72FE.namprd11.prod.outlook.com (2603:10b6:f:fc02::507) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Thu, 15 Oct
 2026 17:11:36 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 17:11:36 +0000
Date: Thu, 15 Oct 2026 10:11:34 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: "Graf (AWS), Alexander" <graf@amazon.de>
CC: Reinette Chatre <reinette.chatre@intel.com>, Dave Martin
	<Dave.Martin@arm.com>, James Morse <james.morse@arm.com>, Babu Moger
	<babu.moger@amd.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>,
	"x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "nh-open-source@amazon.com"
	<nh-open-source@amazon.com>, "Elshahed, Ibrahim" <lshahed@amazon.de>, "Wise,
 Jasper" <jaspwise@amazon.co.uk>
Subject: Re: [PATCH] x86/resctrl: Require force for L3 CAT on early Skylake-X
Message-ID: <atEJRr6iJhZv9lvU@agluck-desk3>
References: <20261014083637.65430-1-graf@amazon.com>
 <4bc68d06-a45f-45cc-80a4-f72806d5c976@intel.com>
 <841a8030-f639-423e-9bd4-c4d4566450d2@amazon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <841a8030-f639-423e-9bd4-c4d4566450d2@amazon.com>
X-ClientProxiedBy: SJ0PR03CA0148.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::33) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|DS0PPF4C13E72FE:EE_
X-MS-Office365-Filtering-Correlation-Id: 48a00f76-b50d-4c2c-69df-08df2adf5eab
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|23010399003|376014|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 7USnArrNuP+BXYMioJJleBgeb8qb9+YG3qAId+swbOWkyLBSx7jcqqfMj8IDggmTQxXF7NcRquHW1dCRhi1hUdescu/tn194Y5d4vE12SgClVsR1BXXI60t6ROkr6f4s7LHYSb75CD8tfwBrdl6KweBOyqImjvhU9zWHlvnb84Wv9dF+l11Kls3k+vV77GNwoujfDKh2ErzhB6WOlGrkkdbslzi3Csr5i3CcgzXcA/YwypEiXUUnBGOSZ2sUEKFGrC7k+eip/0DZiYlB1s9Rpy9m9GuMbxtfUhVZQheq1OFViUpG90r7iUhFLF9ZZEKNUGS46IsPfs5Awf6O8oMnHjmZGq9d3nESkvxKbETuqZ0JZOwBVpjDn7td6UDCcLCEmkcSd7CwQoE22K0a9eoKAxVhWMYh+bNejxErg1G0pSBfJ6d307BJfOYeJyOjX2DK0iMaqrMjqTb5yDVS5I27R1XT/+avNfwwwqxof/gjWHdyGlzqsbOt86XAVwa070YvQCdLxl7l89GvRmOYAdiBmy9lc03gqxUIt4JoFv6460kLHX+TxQCgkDLTkctHZ5uQFkwig1UvNIxaE1sL7AUTt8P18aFIplOYwpzW9uCpCyVoDBjjLsBeYCkvk2mMFOPoEo9xrxZ59kefu59mi8LPltuuHlr5e+mY06nC1kGkI2k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(23010399003)(376014)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VoIHje9+REPyK7n8AORHZdfDiNUGVsEsE8ebkBX+BkRjmzUEfUqYEwmnBZF8?=
 =?us-ascii?Q?HxcEeveZG/DkRRG08XSxyNwVGErp0CgmmU1SMx3bIkzAng2CcQ4+JguMK1w2?=
 =?us-ascii?Q?CMzxhvJAZTsuZEryhJpoXR/NaFONWs4e5N9MaMtmXCre88hEBf+lj1m1UPiF?=
 =?us-ascii?Q?im0MzGlIgVvUl+rweSnwuZ0UJACV3HUz+TOR4kuXyqcd9vSqVKVM5rLJ+2P7?=
 =?us-ascii?Q?V6AKyD26c4J8PvIP03GeZyi18XEwcU84lba98NvLTwSKRXZENYmsNiaMm21L?=
 =?us-ascii?Q?giqHe7On4zEdkyiFCLA32YVV0v109bqhR8R3OaW+L5XGL8eSORV3TeT/B4fk?=
 =?us-ascii?Q?xwEYCXoZMvaSbaE7w7HQLAX8iexlFECg5CdzLp2Hr7aYbksLPR0TncaLac8+?=
 =?us-ascii?Q?Kpev6QN1uMA86uZRc/0WU7h1Ca8sw6IzPirBW2RAVn0EsSNZ3CFgH2R3Z9xP?=
 =?us-ascii?Q?8iBvE4N08OJ9G+YmOXCATGnqmbL/7eK4N5ZBamt9G8Jb+3Z1hHj+ViNEgM32?=
 =?us-ascii?Q?7by5SMt0x0Opum6V/OAIMzRaHb+8q7FjAjJHPowcZZ83MTwzPTi2VqGCZCf6?=
 =?us-ascii?Q?PHa2t8oovWYh13Ht0CkoCwHQbjKO2+0hR+XaosBF+ZTKygEF4lVbk/By+v6e?=
 =?us-ascii?Q?VGsw2SmdaTE2V5cLf09LlD6rKHe/9YhgS4jAXwkZAYXHlvGVcuLyM/nqss+v?=
 =?us-ascii?Q?QEFH3VaTDLBbzRM2uppn93IgypGjEQRWsPG0dJp4a24clm6mP4uYqGd5dvnm?=
 =?us-ascii?Q?2ywtGq8bvrBshStwngK+LY1+06OmffbQDBMfFjEmFPEuJOBSFZAP6nZ2iy/E?=
 =?us-ascii?Q?siA6YyCnPd6JuHOBooKFzwYnctHuzzK2/dh36TswAM+mDstuMMDtQxOjMant?=
 =?us-ascii?Q?LjTdblMsqj8QopCUrFQ529Shh4t81w8xa0c9qKNtwEvGpyDgbq/CUg9cEO33?=
 =?us-ascii?Q?in6lldquwjIwfr/7gv/xSsWDJN2jHv5kCWjPTf9mlXgvzwY32QWhYFcfjGow?=
 =?us-ascii?Q?Lc5YSDzhfN8NWQWIfW7L7//MMRShPDnGPra8yrEJYGX9ekATopR3Q/JRxpmc?=
 =?us-ascii?Q?Qe8c535ux1s5M1t5/cFICFxGNO4IerftqaeeHVhP72HQLFaS0WpHMRSFuVUZ?=
 =?us-ascii?Q?0DGUtdYFXuK3ZuhiPrImAjy0aBuOSF+jZmbrH4v0Z+MthQ3CsQx0BvpSTOR+?=
 =?us-ascii?Q?MaLKtd+lsbzY+CjAjZfS7FZXSFzkP6064nN/K/rZu57P/5KFR+jCSv4jjUvy?=
 =?us-ascii?Q?cOJUOpnnDNunCK9en8zFDw8bPDFhhm3TTUbi7W3oREImFybSfDUxKq7VWkS7?=
 =?us-ascii?Q?KDDY3d8PMd2CCHonq0tBY5uDh7nxlamv2l7TihoBAkgxUB/FRJsrhodIZSRI?=
 =?us-ascii?Q?q2fuv+s4//v8dj8ZRuLiSCCvD6+XKVgGtb5own6gP11paKPLidofZNn6BLAd?=
 =?us-ascii?Q?1eGR9O8uek3vUK0wZ1Fj5outxXmWcN/uCo+o6oOdJ5W9H/tmbbeA9kAfq9+2?=
 =?us-ascii?Q?GGNXErJP/Xzio8qJDqlYBh5OH1W1SUuMUEfTiQHIZZ9Bd0PLgedh0mrElEGJ?=
 =?us-ascii?Q?+QkIsuiIOEAtvvq9iAllAKHn0H4wsgHNYokjwHfY1RV6BAoRIminRMX8n6yw?=
 =?us-ascii?Q?tvbmut5KznZ+JRP4pNnH+qp6XU3J3082WYFdsJ6S6V+1ZgkgVUhWN/q5CWRc?=
 =?us-ascii?Q?3vIR5ShCetlf79zjovjRUm7B7z359vx9Ta7sfYOhmdmjRHs20D3GSXdEAcg3?=
 =?us-ascii?Q?40TBwtVuwQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: V1De01Q50q+9LpGInuYmw5kNOrX54B1IGp03arw8EudKEmLBMM5bj5UoHejMksj4p94V4xvQE3Mb60hGYnyIL7ZKYz+Hw27AeWk7S8+S4qCn7r0ReVVWQ6zzRU9qnvxDUF2QMeGb8HWONn04QwKLO+9SJB10L+h2ZklLLY++ItBSCL13mBvrNM3ZPTpdo1BEzH13WxmRYKow1KU5bdj3bx1ah8xpg9zQEQaPQcykCcPuVE90AEiLo8QdLw/o4iR5pOqcNMSu3QQa3hh4Pdscj8l1QYqFVarH9gcIhD/TaD8u5gF1BsFYs6pa83cGS78FtoTvQTwjVjO39LplPSAclQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a00f76-b50d-4c2c-69df-08df2adf5eab
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 17:11:36.5493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fy3Y+F4dYgVSn3Fv8I9WIldyBpMbqk2a9v96teinHO76+fFcIFNY3kYg9Z5tKAHimUeZfdlMf3NQU0RFmVjeww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PPF4C13E72FE
X-OriginatorOrg: intel.com

On Thu, Oct 15, 2026 at 04:58:46PM +0000, Graf (AWS), Alexander wrote:
> I ran a few more experiments. This seems un- or if anything only mildly 
> related to kexec. The real culprit is the microcode version. In my 
> environment, we boot with older microcode (0x1000159), then hot load the 
> latest microcode (0x1000191) and then kexec. In that flow, any write to 
> IA32_L3_QOS_MASK_n stalls the socket that write happens on. I'm 
> collecting a bit more data - including microcode version bisects, early 
> load, etc - and give you a full rundown tomorrow or on Monday, depending 
> on how quickly it finishes.

Alexander,

I don't think that an upstream generic kernel solution is the right
path for your very system-specific issue.

Can't you fix your deployment scripts to look at system stepping and
use that to choose the kernel boot options? I presume that you already
have checks for CPU model number since there are lots of different
options appropriate on a per-model basis. So adding a stepping check
may be easier than battling upstream Linux submission process.

-Tony
