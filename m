Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A07372B3B;
	Wed, 26 Aug 2026 17:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787765629; cv=fail; b=J1p6D+r3PQ9QhzZR3PLr5PTdobOoNhsZZXy8BWZRXbFopZNGwYDQ7L5ooAcw1zBZt5WE1rdBZ4nlS3udPauyW3GauyC949/ufjBu+PyP48+8gVK7gAsbQzlYyIsQozEII6/h0+nojMbr+MvTbqzzTutkp1RQOEZxomOZF+FMfkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787765629; c=relaxed/simple;
	bh=rFqb/3bcBYXowFdyv3LJoxmWdbKucqxTVV1tkn8j6M8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=erOaqr0zWBlRd1H2LyJPkDN22XwdeYs3SqH3RltCeG/UfNdDQH0AZ7cLCu0V/hmLRDOHGaHUp40nlN1/AxYuASb+CyVKepw5rpS9/UP+v8TqMZ7Fq8tLMQKEDNpZ+htSnR/EhW7ooSChwBsa26Xyy9NqbclQO8Jvv3prkCzs86M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kS6YMZU1; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kS6YMZU1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787765624; x=1819301624;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=rFqb/3bcBYXowFdyv3LJoxmWdbKucqxTVV1tkn8j6M8=;
  b=kS6YMZU1TRw7sZJKt7xm8TjuecSOsqRbV4QCS8mXIa87OpvC6cQOyaap
   dHP7u9K0MTFdfVksrvMxIvms25OkJLQe1mnRxLbmW1Nqewhr70973ELp7
   wTqVEYoMQ7XIpMIvLNFXhnu9eNV2Gwcv0x2+qlrQvfXO6Dxr5Uz3KpxFq
   UVfUxhMVz7VXDj4kl5EfDjxv9mD6HdbMue7oODcd98k+dLAyvWJ4LXsbm
   505tTAVTx5avN2GWs42WcIIEwCKDyrzExQeW6to3mmwHiYJY1rgE3rFBA
   EtmGF24pvvM4p7zRjhjmcqAZ0q4Y/NeghJZh0DNbcBVbUX4o2hNoqFD1M
   Q==;
X-CSE-ConnectionGUID: QFE18OqaSEWqiMenc9Atmg==
X-CSE-MsgGUID: jM2oA7jMSQqkkqVf7udy2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88274184"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="88274184"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 10:32:22 -0700
X-CSE-ConnectionGUID: OF/MohXDS661TJRWQrAiIg==
X-CSE-MsgGUID: 9VIL176lQ5iA6dp1M41uKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="297527448"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 10:32:22 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 10:32:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 10:32:21 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 10:32:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqQbhzlctRJ/K+5+osbKIepPSxlfRd2sBSLzA9hr4gsOnE6Cdgxn+G8A5Ng35H9OF3ES+gx0cUvzkz7P7eJpGJjPIlifqE71JDzpZsDY+8CRTH6YAulnAhpTJhiRQA5lCIBurwiAthIGRYT+iU36wA2N8+R9F7aAvKfYM6E/emTl56flIch6NtJdXQ+lj7IX2iDh1Fkxiwmk8RuGMCjx0Y4VP3/iDXc4C453CBjc5rE/yMt7or0ql0dScG/evowX/iXg5m+gzQ4n0Owu+bY+22ZTEC20BrdyXs+tvSmpihfiV2hcdMVl3Nrehu8LxFkNuQUzFj/SJdnd2XwIfQgXag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjLykUrqYDLby5TJSTZmMXBa57R12z3f0PDMsWu7/e0=;
 b=hLsNmWTsYfwLO4n2cmPJNI87JSwgswg9X0KUenLVJ/OsvVjqwvqtxFQ7d22v4/DDvBbS2vlFICfZKnJ2cr8iEKmQA13lGMdJ0m4EWW+g6RO3TdZrDD3gE7Fo0ul4NPYEeYsFIgnZ/IGwvMEalrif3ZeAFBTVVH99V4Ko2lz8DNCJxmSdHKS2cxONDKfLf6pR20+3Q2yfYqEZpowP7qTnBzuLeWCiDwmWuFXR/IB/1KKlX+vhjXu7gCGYS44zWJQC+y79io29Y1VkjrMoAXnalFvpC8i1iIXpYWcn7+zmQoYs15ju1rdVuWdM0OSyrI8BWEDCkZyaGUyx5+PM22KoSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by DM4PR11MB6239.namprd11.prod.outlook.com (2603:10b6:8:a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 17:32:13 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 17:32:13 +0000
Date: Wed, 26 Aug 2026 10:32:11 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Borislav Petkov <bp@alien8.de>
CC: Breno Leitao <leitao@debian.org>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	"Jonathan Corbet" <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "kernel-team@meta.com" <kernel-team@meta.com>
Subject: Re: [PATCH 2/2] x86/mce: Add mce=panic_on_ce_count to panic on a
 corrected error flood
Message-ID: <ao8jGwH_mPDpACFd@agluck-desk3>
References: <aoynhOsTCcapwRbl@agluck-desk3>
 <ao2eT0TWS9EaA28N@gmail.com>
 <SJ1PR11MB60837D32B5D89336C87280A3FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825161625.GAao2_2d3U7xQFgHrw@fat_crate.local>
 <SJ1PR11MB60839657B965AC3FDA53C186FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825191555.GCao3p63v3fXzwa7E7@fat_crate.local>
 <SJ1PR11MB608315809B99B7194D167D8EFCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825225202.GEao4ckknyv8nRc8Dh@fat_crate.local>
 <ao7nGM9sCQyxJvsD@gmail.com>
 <20260826160934.GBao8PvsM8M-U7XuFR@fat_crate.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260826160934.GBao8PvsM8M-U7XuFR@fat_crate.local>
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|DM4PR11MB6239:EE_
X-MS-Office365-Filtering-Correlation-Id: e0bccc93-7e6d-455b-6b6e-08df0397f6fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|56012099006|10067099003|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 5u5Z3DgQftXWTC+WCLTRYy1RAKjjTTI/M2IycmoO2EA+S5Q1kZYKU3wjucvwDLhrK8v3GYWOktTEAR1zyQGUTlPxesPNa+kpVPdN49szF8Fg+NYtLI/w/v4DOl4EPMUZMjRoxMg+vV8fT172N9IV5s1C4Q1peCC8+9jLmbZinMDV3+SN5cKs+bG5bzaCI4eBJlBVW6Jd/2ZS9fL2QhJqCNVLTwdNRqFuUShqHgVG26ZPemLbs6iD8CylfeSiJnUwj+N7cybv+JbSUxpxQLtMGp2z9YVMxoyainboI4YOz08DF8iZPUyNxVL8fINgAHRk46AvUs9ascED51Tsp5TyCGPrJ5mAn2yVrb9SHkYFm3hZ/Sa9lcwn1UYGnDlsiEiWP5pbBpeeWY/CGjo9TbSUzr9kDxqBs81cxp2pihLQBCBDZW97puOKYgbVoDS5s2PssOXZTBYTxl9B9mHX2BSUMb2THpnyL68f2EcAzCj1TcKSKn5ZWk0xvYLg07RjnGOfQQEaSdQFfaDJP/nf/CJLwSDDK9XJuDum1pST4qlxNb7B/zSbq2m/3+tUFa+broN3pof/gUrkpffRDoP0tO9Ad/2uMfjEu4SdMnOACZKOqyKSPBTPCWl7cmgsu27EiJWhGIOE7P7qNgzGZGL1jHsGBTzwmHYlMSiihNloDyZm+hU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(56012099006)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z7UFagB+roohUyjzFw2jnsJJ2M3Rf+PJ8A/rjKsZY8gVC/ARmAX3a9Lake4D?=
 =?us-ascii?Q?bHhQ7YTvAHxp95kVyQCCiQGuQmwI+mzsMC+vkWzrq24+TWJ94a5EoLiTFMSC?=
 =?us-ascii?Q?e/hP5tOSkhGYjeEhsVCFsuOuR0bSD189uvwizpw1EHxInuahERCZi8mp5JsJ?=
 =?us-ascii?Q?jB9O/WT9uSprlyyUlfCqnKf+RbYNJT2Bfsv8xtV9Zv45JcumHzwOeBtF2Lng?=
 =?us-ascii?Q?1Jlm/QfiYmDCm8SX689+FDzSb5Suj/0PovLkoeqVP5Lj2pO7+FcUntTXvTGg?=
 =?us-ascii?Q?2kgLxDLZdCaCBF9DLOV5Be0sh9iLiQyhvSSC6lVocFz48u2PtMfuYFmlJt96?=
 =?us-ascii?Q?WR4vpsqKJUIoaz4cq9VrP0/eLndiX1i0Z1e2g9CRwnWInYuLhPPKonNHnkkX?=
 =?us-ascii?Q?BzCecHKabJfsT2y1tBN1VxQEsmjuWCwC01XDjJzeUNpbyqSS1UKn0LBqoatR?=
 =?us-ascii?Q?4wSdUjCTq9cAnf8Y7tb6A+DEA0o8yXhA2rkAFmUy4EfBzPqCC/oyxMT6+nOR?=
 =?us-ascii?Q?1DvO3EBWONYM2yfCRNEr2KXqBWg2iQb0pEXwTF0Nf7NuP/Qdx6wRC9b5RGZk?=
 =?us-ascii?Q?pAh2fwI1XgNqdUlchCwQcqlmpAyBh8MLla1CP1JHTHngeQC5qvFprXK3PKuG?=
 =?us-ascii?Q?TlVIRWS+oj0wbmMHijHFIGSd3ARg3VbIsPQydy2DjfRTf8+T6icJgfeR0StP?=
 =?us-ascii?Q?3hVj/Oz7HWiUjzcN3Oi8rf0bmbgGB+uderkbuVyAbsrj6mhv/X12hvUN/+Hw?=
 =?us-ascii?Q?mPJxMq+7Yys8Z212PNtwiKtZDtnt++58du0+/E1vdPn0w/zXHrRi3pujhq/3?=
 =?us-ascii?Q?Sgt7SOugMolro33iAz+4otqfgIn6xjMta2iNwBuIEaZf7zDMRCuFEr7n9J1E?=
 =?us-ascii?Q?cMeERUQfRqQUWscFURVXRpjjohDcEhuSh02uOI31dQtCyZW9Zxzu4e0K7lm/?=
 =?us-ascii?Q?IZ7IoKy+kDQJHl+MLlktkldDobnkFsaREN1y51kY0NQDGdK3KUojRU4ILc5e?=
 =?us-ascii?Q?0XsEOes89P0QjJKX3PnWZn9xSyXnqpslCkiqiO/v2MOcPgKIIxHGddfZmnRU?=
 =?us-ascii?Q?6F2b3GaVysvDVdkkvhTmZaWFGCdhybJwNe3TmATIrmjvojb4iyhVmIr7HS+o?=
 =?us-ascii?Q?eot419nP9189dMzBJYsDgORTUG5ViQ6+VnMsQO7BsH9cqoNM45YTqG7PgQ1r?=
 =?us-ascii?Q?C7gp1sxYyeTa70JgdSdjXvQy6wj+h4ZwWYSgPn6WSl9ZVUrmUMDO+Igo2nPb?=
 =?us-ascii?Q?4J2W7nETXp8NkaxIblqUnZz7Iap83C/VftAc2hv+/3TYayQDBB2VfO2lo6DK?=
 =?us-ascii?Q?VvdPmYGwNsQvh4z/5CtnT3txLu7A3ON/X27WQnoDvWBh0UPqSSRg6JU70lIS?=
 =?us-ascii?Q?dJbHlBhsHzGskzQn41LWcH+b2oLI56qWS09MoxM4zf4x5xuIbHNRUrMODBkK?=
 =?us-ascii?Q?MU/gh0lIatWtr0mqrgTbrD6sSb4eDscBPw7nmgaGVtsDs5KJoHV1VMgtxrhO?=
 =?us-ascii?Q?utjSerTNzMdccHCxRtQeqCGbH5BEd7YmVSoi+yExGD+ndOIQgPq9yYRTT6Dm?=
 =?us-ascii?Q?P11sPCYagLjRiZAybGLtFmit67kv/wtSPJ2Fnh36GARd5fhfnOX5KGJbxw+7?=
 =?us-ascii?Q?m/GLNy+DvmKJTJ5Z8iotMRSNgi1YhQXc/2D5O/AqKLFTTPHK1sWmIBcZagvJ?=
 =?us-ascii?Q?Q0Q+fMpomK+95EdSMwYeHxnSk8l62vF7W3HC/79Krsm0Betwhzhfepvc3QqO?=
 =?us-ascii?Q?GCFshp3SNQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: suYxGzTmJujh9XeJT7MluDJQqjqTbcEgGxjut0YCtjXck+RSkhVq2Osx/vyOUg2JbWMK4bqeviCISh1X7VG65Y7nJOIS0vBqVx4RNfo4FIe+xekm0fL2/nT94M3tY33f4nBTqRyS7RiQDjl8OGVym69mNkAIkRpJzhx5t7VqMbD00KSkzyiEx1K/MHTGPVIJLLKxLBhyejrR6EGr+UXQTHwH7vQnSwOkyGFFo0z3+8RSu7OeXUCOgXAU7duKiRa8XO12WKZxEXDR9CYO2UwCsxf7Oe4Xjph2vujJ7P4HPf0WeSo494TCMvy3jdjoareughAxi00y8P3g72nsJwsUwA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e0bccc93-7e6d-455b-6b6e-08df0397f6fb
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 17:32:12.9841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kb+EQa4nQiyGt45LK6mXX2p37Z+i333YAVZUXtAGfDnzW3L/fY+pmD1aaT/f5+NUWkFCXaBIuQ01n5bl27dmHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6239
X-OriginatorOrg: intel.com

On Wed, Aug 26, 2026 at 09:09:34AM -0700, Borislav Petkov wrote:
> On Wed, Aug 26, 2026 at 06:22:27AM -0700, Breno Leitao wrote:
> > In other words, I'm more interested in flagging that a host is a lemon
> > than in keeping it limping along half-alive, thus my approach in this
> > patchset.
> 
> This is your use case but I'm sure others would prefer the limping and
> gracefully saving work the system has done until now...
> 
> Putting my user hat on:
> 
> +               Panic once a machine check bank has logged this many corrected
> +               errors. 0, the default, disables it.
> +
> +               The setting is global rather than per-CPU, and it is compared
> +               against a running total kept per CPU and per bank. Lowering it
> +               below a total a bank has already reached takes the machine
> +               down on that bank's next corrected error.
> 
> Ah, so how many CEs is "many"?
> 
> I have read that correctable errors do not have any effect on the system and
> they can keep happening and do not influence execution.

The only problem they cause is performance due to the time taken to log them.

> 
> So what do I put there? I don't know... hmm.

Absolute numbers are a problem. Maybe you choose 8000 as your threshold.
But then some system ticks along happily logging one error per hour with
virtually no effect on system performance. Then panics when it has been
up for almost a year because it reaches the 8000 threshold.

Perhaps it would be better to adapt the storm code to allow tuning
the criteria for a storm and have a mce=panic_on_storm option?

> 
> ... Dropping user hat. Putting devil's advocate hat...
> 
> How many CEs do you put in your kernels?
> 
> Does the same number fit any machine and platform?
> 
> Or you simply say, after X CEs, we simply panic the machine - instead of
> gracefully powering it off after leaving a helpful message in dmesg - and have
> lab technicians inspect it?
> 
> Hmmm.

-Tony
