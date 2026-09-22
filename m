Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2454942376F;
	Tue, 22 Sep 2026 15:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089233; cv=fail; b=F5wMzPKD0VwT6vQUdBhayBD67VXDoJofzZ/WMP7RkoxFY5LlO+QO9Skleco0qMfC0ozJxnihJd8MWnVzoxk7hxhRmUFHolh262MMcMPas1a77vQg4hNfcMW2b14E6Fy3uCKCYEC4JCcTOkrrYaUi7MnfIi968gbrvI/6lFY3h58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089233; c=relaxed/simple;
	bh=t5bUUbKFpXUKngoh54M+Pq0tLjO4gmrz75a+E55MsNQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=I1F8E13+qS3vYdCpb2zPGqGlK1LjIvVO8qkxCiJAAltYTsqb405TwssotMl5XuNe2SxvFcdkLsVEHKzh3bNZWojvwgNpZhB6jfcH80BaoD9NGGdL3S9AWDYWnp7F4pjrxtOJVHcTqyhGWviZKB5/oOEIrdkfJfrqEoHakrPEcUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQsHuvpb; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQsHuvpb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790089231; x=1821625231;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=t5bUUbKFpXUKngoh54M+Pq0tLjO4gmrz75a+E55MsNQ=;
  b=XQsHuvpbhhGi9hTmRMcUWl5u5M1LT+NYEG1+HHkem8+6uCU/dn1TM1dY
   ERFUgkPNZHPRU810UZ8qOnnlgNWy8xPGdw1sy0exFyD5u8iyy2ydDYnoQ
   fiDAZ2zVXr0wafa2zpyGPtkSBkgUQySSbwOiq2UgcRDJuwHydMAlldiCF
   ii20UvbWFRV/ojVQsg61k+eAb5HbExVVzQAmq5ElkrYfprhG+c6h/8Vid
   YaxynkfDIg4cIZO65r+m8+ecVd/c7BKHrBbbLaA/S3DI3kqdHRTq7I6A4
   r1iGc4VdfJ8Uk1FV5ojVjDG9Wi4jAxrkWJKLw84ii/cK+6UhVIvtFHA/x
   A==;
X-CSE-ConnectionGUID: s4BzPmlhRSqnf/+bDMCAeQ==
X-CSE-MsgGUID: j1nfvF7ESg+O/KDLP00NmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101286963"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="101286963"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 08:00:08 -0700
X-CSE-ConnectionGUID: +gxKfvksSGaanjWN6yALhQ==
X-CSE-MsgGUID: NMe1JVj+REOvJolMEkgI+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="299427177"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 08:00:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 08:00:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 08:00:07 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 08:00:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxKA97bLMgPXnO0nueN3HghDgw7gm/Mph/xLM3FfPUyY7cSsXOUKgXoIh0ReL2zd8nrxxCP+BXI5QAriLx163yeIs1NGM8xmh75GlO/jbu3L+7G4o2EQcNxhApRUG++Y3IYH94yswe6Ns+nCRseL1nTI/WFYcv80xn8JiXlWUHJzB/XUeJDJoPHgZ9XeCgGf7/Tbho/xRUyDUz1bhFQumQJbTDB0fvICZEsLhCr9MvIsUj86DizifUMIlzi2xJPKHq2VqBFU+2Y+tyQUjM01VtSuqTLw3CUeChO1yGWHlkn6HqAPWTV/zGaeHTZUwGO+7StTnf4w2Ru6eNmdNVAn/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aSSBN+wcb+mGgXTLrGI4gxoKmYGVhXNTr0NkeRMf+M=;
 b=l09X1Pd1sGXdCQ1CGABnROv5plrQR7Gy5ccV74K8/r1fkaNkA2viK7g5PFxc35qJi/6s2gG+/wYKGHiqhskflbtrzEMjaum533SBgMFpbifI4zX5j+5MJKdCZ8r3u3oe5owtYh2Yp9nEnZ5GEeDec1idx6WKtfMnrLf96JhWNHGhjD+HKccauQ7xo6CAOJAVnyLY7XMx9Bi65LuvBohr5KkmAGSrlJMZw+wMwQmV/otmzhLxed7BwjCbxA2J4L/BIn18YW+TECUN3CmnjlChb/OB3Rr2nj8uXPzQdF433qzkt536Il2UnflRU9cc+h3+dJAfbbp8M1ZzNwXcxZ5e7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by DS0PR11MB7382.namprd11.prod.outlook.com (2603:10b6:8:131::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 14:59:57 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 14:59:57 +0000
Date: Tue, 22 Sep 2026 07:59:56 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Borislav Petkov <bp@alien8.de>
CC: Wentao Liang <vulab@iscas.ac.cn>, <linux-edac@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <qiuxu.zhuo@intel.com>
Subject: Re: [PATCH] EDAC/i10nm: Fix mdev reference leak in
 i10nm_get_ddr_munits()
Message-ID: <arKX7O905e7yv3Ra@agluck-desk3>
References: <20260916091251.1997522-1-vulab@iscas.ac.cn>
 <aqx5UOLpXdDnDsi7@agluck-desk3>
 <20260919053437.GEaq4e7SFEZqRzsjim@fat_crate.local>
 <arFVjp8k-3kvSkhf@agluck-desk3>
 <20260922045057.GGarIJMRAjfqj6mkhE@fat_crate.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260922045057.GGarIJMRAjfqj6mkhE@fat_crate.local>
X-ClientProxiedBy: BY5PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::30) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|DS0PR11MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: aa670ec5-53ac-4842-6f76-08df18ba2ae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ey0c+DshmPq8f7VoKlXoM+q0C3vSw8cCGiUEeVmq7D/U1+SvSivPWBRDbW6zdKhBxUMA6KahPRz98wZHXH8kcN88olCNSoL+h3cimeu89IAKNtGhjBTgs1d2eEVrASyBnz8uhHYPTbJQoTyrRK1e8apn52GIsXuUjT00F8U5OSrL6xhOTPB+kQLlgKMgTqlf1/H0MIjYXCXlNARK2IEbmcFE3nFoLL0kV+hbxIgRucInbuQMIKCBTuJvcI/Jr282mTI+4Fft36pOsr4GrSQwxg1MJIqAy4zovS5MOQh+p+VwUk99Y+1mSKFulRZzifFjIbRlss4cLHA8lquo4LyDUy61eafLW8DyqZdjfSaJysKUVnsBE6u7B0ZcXp9l90lPgfZ//+VhxmV+JZj64BLkanRGv6eThMtAnDsEnvFPASciVRjxfq9EZOlyJHseBKmLiQlhPDy0qQ3iOOv5qmUWXc4BBjAzYRNRTUPaul/E3EGg/HjMudyNMOPO/VvE6cvWppnhuFrWVRuvwIL7DlSYIXy6rLN3QRTYsDMcEPiHX8XN0F2ByFr34D0yPWz5CngN2EwkBN4sA3DlRyd+pbVb1HHIB7EkgZSu/usLlBIDPX0yCjrlObJpdt8UIytJ0+6ug/UArhFk1ldY4wrtMoxbFGJPt7w074j3YruzaD7gurg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d+mV5IpQ+z+ijvHn74x0w7NuTVQAvWuhGqY7FQvLRjFb5yRLZID8UqcM7QLZ?=
 =?us-ascii?Q?qe3utj+hWJ87tMXhTeH1vBVPyMLovYuz6F+Dy5SORMpt8mV81boNPq9AzsbG?=
 =?us-ascii?Q?acDsuIJBNAN5LUL/FdrjyjVqd26klpIQBdVwFA/Bj/MnOFVmj7du6zqa0d+K?=
 =?us-ascii?Q?qm6XiZmc+CAyE2Wn2rgwU9iPzU/JIHO3gddzHSGHHHYCsRUp46id8EIqq6Zf?=
 =?us-ascii?Q?GemY6trgnegSB0stG8ARY2h+Sn5Hwfc6hLvM21TPImAaCo+JGrCn3of/m5VD?=
 =?us-ascii?Q?IIq0TyUg+KQPSmQCws/N8iYdEKksy+lzcgXQln1dSInTUu+l8NSSBeBDB92r?=
 =?us-ascii?Q?qH/yPx1bLk3fgENFRUiWC0kDEHjg65dS5q5k22ccgWltINM6qknrfGsMxgPS?=
 =?us-ascii?Q?Z2wpidyHHLfooseEsNbcN5ZXy/xaIen6rG4D8KJVE0qvq4anVfpB0U3fyx2+?=
 =?us-ascii?Q?dYZHVK2KGRY49+xRk0opca/asSW+sgXWFJqSZRcKLmgDIXhs7jJOBApSDNwi?=
 =?us-ascii?Q?TnCFHEWW0987JyiWIxZA4ixjrgnV+wkT2g4FgmN0w89qGJEJNRbrTk7HEaD7?=
 =?us-ascii?Q?IDG+Xpq2nTbMwpLFYgaEFUC31pDjr7t5T4PWpKstIsG9mWC2p4Q5yaFzLgpm?=
 =?us-ascii?Q?d6homp0eVm6bNdkfomGPPkKxz0fwFppckP5ZYK+vNzPUjcAnPfBpAMtiJ8b8?=
 =?us-ascii?Q?Eo1zXbFEPhohv7nQH1WcVi1plLmA60KPiARZu9rQeJCj0sZY25MwBvDrxMok?=
 =?us-ascii?Q?LZiLyeaQZ1Uq7wv4/SVzrLhFWFf/og9hLjHGnb4Wi2AdMb2Br7F4FHpWI3Xd?=
 =?us-ascii?Q?Ua+1uElTMkqV8Jj99pDNwgSDV+qtPciulNBbOF9Pzr5YlJMkhmWIWGPI9EKU?=
 =?us-ascii?Q?gDVdCe6iEt948cCib4V5sdjTPSQq4C1aq6ju0Azeo0u9mdAGsgtOiBJGddmJ?=
 =?us-ascii?Q?hj3urDJm6niLfNJ4rPGtop3OX1yqUuoztj3cV0sSVMaAW8lt07J49aMxn2TN?=
 =?us-ascii?Q?pokRuoBBOKPAyjkH00D1GwQS3cfPPCea6vZQl2DKyESfNP2CRkZkaMK3sy8o?=
 =?us-ascii?Q?bjEdyXftn7pT6/POvSA/dU4C+GYajcq5L+sxDdjLwvhRpkfWoR9bXh5RbGC/?=
 =?us-ascii?Q?JhQOHLmiUrh3lEf+r5W3U8PH/y/Mj6CH/HCWSDFPC3o/+1jn/dpFSos7estQ?=
 =?us-ascii?Q?pAnWiathbkbszI/blE+E+hp7M2xxdOcKXW2pVpMDxSucsqbIhokqMymwJh24?=
 =?us-ascii?Q?DUSUCaeJCO2yJZ7fk8DB551fX9hE5pnOKA/0WA/8e9nXxFZUZQpkg/eOd4R5?=
 =?us-ascii?Q?n4ISapTNEueHgk/f57MCOQzEIB+Cwtw91QydTp1cCZDZkV8Cf7QhSmk8Lexb?=
 =?us-ascii?Q?pmNb2Cn0pzpZ5DUeWHD7JsRomorPtl0w/cAWjeqNH0YVRzmoMLQtURioolJY?=
 =?us-ascii?Q?0bFa4JUaWpAS1P21dkHypOyLwRclgDh+CLpvd8VOZDBAyX6ysPA7vsCyflms?=
 =?us-ascii?Q?Apkx26Sk11xh49Vft1AnfDj7642Or76RkccAHhlcZClcSryTaSg2yveGC4QN?=
 =?us-ascii?Q?UcxVaH/rTPfO9Z+BjBiLgyJdzKF4xUed6EKC0a3LFIubPeycWVoc8mH5DCBu?=
 =?us-ascii?Q?R73OgA2dNC50SfuHBPEawL+rXajKD9/VmYcKkB+pp9FPTGOkWI2t20y20tRX?=
 =?us-ascii?Q?ljrGuivgTTfqo+uYiUUSofFRHYeHk8EuKIks7/GLLvs+w0HMfUkDgdBBMkLx?=
 =?us-ascii?Q?0qUtuEFZpQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: KBYkq91MF9w7fXLEskZaq2ikmAWt1RGVpaqYsu/QxVeqOONQy/fA5/aEkRwhSowvTCdEkeufyE5Ul4r87O18tVMHTOzd4+NCscQNlW/bIbAvx/u0ubFPbAASglsomeOxMME9p8CXUVv0JOzpAWHjax1fg6FDibG5jD7GnqE+O1QOUBCJ8llOKJT8KtEg+p7YEGjui47CdalRaAS0QaQ46Swrz5dKDgKeuzP1HubcwxsytAba8LgpTxD6SjdMhrDwmDZGWHR7GWRDszxkqPxWA6U7KDPXFqUbId4sSKh9wLgt3Ru7IEJo1lDCRYxMaNoj0jvFV5VpuPdoxmiFTW0JEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: aa670ec5-53ac-4842-6f76-08df18ba2ae1
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 14:59:57.3715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jo4sPdyU2tux6YbBXluKTR1YxWQ2RaWSgOppF/j3ViFlKL8VhvYzxKJzrLE2Jqo6iDmD9EtAvvsytEQfuo2aMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7382
X-OriginatorOrg: intel.com

On Mon, Sep 21, 2026 at 09:50:57PM -0700, Borislav Petkov wrote:
> Dropping stable@ from CC as it shouldn't be on CC.
> 
> On Mon, Sep 21, 2026 at 09:04:30AM -0700, Luck, Tony wrote:
> > I though urgent was for:
> > 1) Fixing something that broke in the current merge window
> > 2) Fixing something that's really important (security, corruption)
> > 
> > This is just an old issue that's been around for ages.
> 
> If this patch has CC:stable and a Fixes: tag, then it'll get backported to
> stable. So does it matter when it gets sent to Linus?
> 
> IOW, those two things do turn it into an urgent patch.

The "Fixes:" tag is a matter of fact. The "Cc: stable" is just an
opinion.

An extreme example would be a patch that fixes a spelling error in a
comment posted on a Friday before Linus is expected to tag a "final"
release in a cycle. A "Cc: stable" on that patch shouldn't trigger
sending to Linus via an urgent pull.

But if you want to add this patch to edac-urgent, then go ahead.

-Tony
