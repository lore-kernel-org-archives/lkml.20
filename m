Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B08393DF3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119974; cv=fail; b=qVeMezW6RihYHZJTUjDXD3tj2JGzuic/tCAVYprelUNQ7HQ2986Gs5Tk7qTnI+QSLeX+C2ChZfINMHXN/0KaN3lUIKQuPhi8ljRa15bicXQZF6Btti07jEurrhxTP70OIraeNCjaAIFq7nbsSa+kUPyBLJkRVg9aQVY6HtcruRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119974; c=relaxed/simple;
	bh=JMS/gGjRbblHZcCy2x2Wdhx7y0rli0/Xa2PRP0xb3l0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eAN1HRCfMLSo1adJQCSnzvOU1VrXuk28ztw1le58w3BM+XGyXlhkoyj7ME6G3SXJBK5SakVp2Ap06CZHu72mp4bBJovNIzHFSpf/jrBGmu7sZbMcqtDpKM+TfRs/brcYXHnR/raZC1dkmbeSCesUHt+DNOmq6pQvdywQSnQK8jw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6TeQH88; arc=fail smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6TeQH88"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790119971; x=1821655971;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=JMS/gGjRbblHZcCy2x2Wdhx7y0rli0/Xa2PRP0xb3l0=;
  b=T6TeQH883UU82XBX4LQZwWyRJXnewuMQd96ZRtHGJwkqQ9JTJ7Evt7R4
   ijtqgnjdrE3dDAAXN8xrPam6L2Y7fMEbJgG/Qna/fNwkRXtfVP9mPjLsI
   o1pnAmSR4LnzlEtfpH2ivGACux0L+gFLZ3RS3jJapmOx+pvSPT7/bmHUk
   +yv8+H6VO6+5/51ZJMY7ilscBxCcy6ck5dU8HUtbEzQst1qTwOBdIo8TP
   nrmfXJYDvTNqqDePUsYVkW1cF+7qeksCR2nO482lirIMEQHe1LG1VYoFS
   96nVCjeky4olcRngpfpXuG9huC+fX+AWGhVdgjgtclenBGaknidOjjyGJ
   w==;
X-CSE-ConnectionGUID: RBu7KTz3Rxe4aVF/gb5ckg==
X-CSE-MsgGUID: rD+C+ANSSv2y8mNRl258EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1275437"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="1275437"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 16:32:48 -0700
X-CSE-ConnectionGUID: qos+gD7ORliG1P3ExKzfHg==
X-CSE-MsgGUID: n8jFjhb5Q4ydk3Jw6Uofxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="281422764"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 16:32:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 16:32:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 16:32:47 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 16:32:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBvPxzoqYbTrPTFNEHRcHi2SAqP4dxXdAzqC2Y3WLe1Rqyie/nomQn5UnfN7SEcy5vH8uAB7yPsuQzfL8rLtGx7faLnC+OSkEaYvWU9TlGqHmdAYNCBnnmZp/denLqrDa0tPC1RGYz2rEtP5VrGnN9Q1yeamV2DNA4QNztyezAQmKcCSL9TWqM/lzeyXUIc6EjF3yky8q2FDvYkFONtnJ7syN3dx+XgU0M6hfnP53Bw2MEvqng0nUadOYBybE7YhQL8ZHclaM7+cSHdMHIFeggsmsdDGlbk0jBjGY0aAlgm3VR8xP8+AHW2pG+mnkLBN130JIj1SC6iO09S8G6FmUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGfg4NFka0NwWplzpGobmIGc0qPyRHmUScdYeV/Xy50=;
 b=v+pFjKHE/qq0AiBwttJeJoFZyZqkyKqAWHEPjMYW2fTfuaEH/Bj0T5YobZLlUBFQpsqzYigCNgnTe6MdeEOFZFV3EhsQx88vVlDsSyMCZHKGq/aGRTvvxsBUZ/1m4vqhfTAhrMVvkd0iyCNX8z6BLVvwR/g/p2rZilYOLg0DmirGu0mQyxjHnOh2e2/BxEBAxLp3VYYdxQI01eArQNtye6wZu1LkOnfPDlqwJnRK4nN7ElZ0lAf3kr7fclYWaOm4ruZAwmtPTDY2CiiPWKFGHMAzfhx5K8HYFx8sGMJ7UUZUvBFFQuIZOPYEITxGuH+Wi3/cZf6a38wlDS+J3fSouw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF0BAC23327.namprd11.prod.outlook.com (2603:10b6:f:fc02::9)
 by DM4PR11MB7374.namprd11.prod.outlook.com (2603:10b6:8:102::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 23:32:45 +0000
Received: from DS4PPF0BAC23327.namprd11.prod.outlook.com
 ([fe80::e721:90d7:9214:2d53]) by DS4PPF0BAC23327.namprd11.prod.outlook.com
 ([fe80::e721:90d7:9214:2d53%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 23:32:44 +0000
Date: Tue, 22 Sep 2026 16:32:41 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Guixin Liu <kanie@linux.alibaba.com>
CC: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Jonathan Cameron <jic23@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] checkpatch: don't flag ACQUIRE_ERR() assignments
 in if conditions
Message-ID: <arMQGUpW2snww9-a@aschofie-mobl2.lan>
References: <20260916020921.3480730-1-kanie@linux.alibaba.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260916020921.3480730-1-kanie@linux.alibaba.com>
X-ClientProxiedBy: BY3PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::22) To DS4PPF0BAC23327.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF0BAC23327:EE_|DM4PR11MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: 1625291b-0602-4bb9-6d2c-08df1901cd77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: vDR7UVjjY+T4HfvEfjyHS/x0EEyahQyZj2En4uDFLU487K934oxC2PIVqvmxIrImXUFh9Co+bbQjH59Rm+RPBkZFUgjR2crtd8VjS5zotv4iawfSvbuL1hD8aZaVC0ufy0c4mYTNpltIG8BQODeYYbMxYgZmpR9GCJNHD+ND1C4Qa0jM2UAyvF6opr5XiiaySliOOou8GGtA7sXVVWRxDTf5+yftvJYZk3LUFqGJ3dI9yKy5zNz4aeC7tCfxGlObig8cEhumRAElHQybcILsDdQG09IQmBfJJtVE2QsKV7+a/cmKwVrDx0q7e59u9eN8BnTr9Vgmyqwu3dfwUvhlXkCMi6PCc0t5JRXRaon6iPgjHfcFokXWLP30TeJU0QvPexWP2vhyNkmqTx1B0d18lQIZJBJv+rXULRQsQ/9D7Jqcf3WsPGkg72TSYwB1KVNm3D24WRTXBbcEMwyaXDDMNibZBGboDeg+bXXQMcRyrPQbc3GjKf8KNJcZk8htH88B6n+/JoD0+EQ5dlrP2qN9hdyhjJs8+5evxdeKnC9dr7h5YwHcIuaIJ3upas4Dubh+5p5+UOOnnOKYZHusrOnTyJPJ3pikzVnc7jVfrZSFty7B8UUv7i58zFYCgW9y744HmyrZZbFl4Pb7DRDmprYf3EajZRYrYIf7Op7AMwK+W84=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF0BAC23327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5mUYDlnDfdY5mHrccw2w/yqhXVN8Xkmfdy71YzwfHcLPoF6Ggypi0cG452RO?=
 =?us-ascii?Q?5TDMtuic4Y+I+JAnmQwbt3DnrHE/59EJMUsiaKOAJSdjDC9XJ7yZNK5w+YhD?=
 =?us-ascii?Q?8kgW5IuaoGYegyJr2lwptRrtvDvA9gSB1jgrFgJdQJ89J48q6Ug/FZnXg6n4?=
 =?us-ascii?Q?lFwrDzzfRzgGs5f0GZAdrlEdekM5kmIMAcpYfC3FsdiRujiqCS5ISXVBjlF4?=
 =?us-ascii?Q?GVJD0up2JJIfqJbXtF/GYUnCMO4bGpG55bbQ/fUJ+cPlC8XCnnGchXNDOVi4?=
 =?us-ascii?Q?8wlX2vfcikw68NNv9fjjzxOiZiqcMfKS442uYSjkDaNqxkHDlFglis8v4nR6?=
 =?us-ascii?Q?aRbtX/GXEduwnpW/UFsr1DVGN8zDZ6l9UJTDVRCGkENghQPW+87YydbOvvCi?=
 =?us-ascii?Q?ByOcYMkuT51xnF9TVJeeUgH/7yq6ovP57xH5ItIK1+ArwNp5Qkr10fF3qIyB?=
 =?us-ascii?Q?5PyactDfiIy2hkmxYS6rdDh3XmLYcZU2BQO5nQXUtqxNFgS1DzKGwG6rMg/f?=
 =?us-ascii?Q?LC//8rhk9CNZUOYyGXFDOMDJkBCWJDvxM94szwzl0YK0d+fQa4KPIWepMior?=
 =?us-ascii?Q?2IxaTuiO3s6kh36FU0y7Iv2o+6ZmAWJnIzk7hvJVvcJ39WJilpP7+NhHMdM4?=
 =?us-ascii?Q?Iq5h4EnGwfbcA25Uc9uO61kqyTWLXfOAlctsNBZlOy+M5tXMa+3+KBj7D2+M?=
 =?us-ascii?Q?2vCQ3QgWd0boFteChPAtRHUCd9zpfXy0ZEjtyacnB8q4yhBUB1kdS1YuoVQL?=
 =?us-ascii?Q?INw2PoN9SdJifDFydYXpP86jZKxeQYgcimKT1l9Hp4zZInVG63Sr1HYiJqFb?=
 =?us-ascii?Q?TqWvKYquJ8/EiwqY7qRa18db7Yb0h97/FUpOfxDYVkgU9DzMTnhBFC+Cen+W?=
 =?us-ascii?Q?cURWmTj6fEuVzwE3CgvhqkawSybMQf2h8Ol1guHQbFyqZ12wbBGyarfWalNS?=
 =?us-ascii?Q?h+PFsd/6WT7xRbkOcNCRKgeXjBrDMUGrg2lz6rMxseX1tW8U9RN2lfnaoDm9?=
 =?us-ascii?Q?Ag2YILazK3mny6FWm4oVcOFtYcThwLz4CRyUNm/zYfK4aXx3pAhSLGoZLQnG?=
 =?us-ascii?Q?B35BYgcXA+BPLnVNcJte9Nqh/FhH/I5aUsbotJ8FreWeIkJo0QyPYOdHubL5?=
 =?us-ascii?Q?HnW5+iA4qARotmpYPJ+oq6dagYHB8UCeF55ZcRXxWVDL5Q9XSehyYhQ3c3Ys?=
 =?us-ascii?Q?y1XmPf/buqL+Ym4GvxkGsCQ5pNFCGqtbjNmWFrl9c+aWAJWI9RaSETBD7v2a?=
 =?us-ascii?Q?ZcLeWZOSepYW7dW+l6fgCThzTazPEOZJn9pOnfOItfcHIBstu6mAaYu8yWsK?=
 =?us-ascii?Q?EQc1eusSNi0zjVqleEdwwT4xXY7A+02GU+l73j9zMuLsBraOQ9GZgIAujIKC?=
 =?us-ascii?Q?l99hEpJ7Mi244I9OxFuc+T9CFLM5TZm+kLeWL0p3KqO9qFD4p4V3NRwbIqJw?=
 =?us-ascii?Q?oSdCnEKdNvFH7aRTzusXoZzluOACCXhkdhduyZEDLgGsZ9iA5jai93dEN7xK?=
 =?us-ascii?Q?EUL0O2SJHup/LVpZ1CUzDksggtCkDkCfngwyQAlMXiqTZLfxOeYUbhG+3rHh?=
 =?us-ascii?Q?xI5lpWFOejDeVgqgG2jao+ApeSkVQ1vcaqHiDhQmLV+R03AEotye+iHR9jUH?=
 =?us-ascii?Q?sZ+Gj/8gtKpp7vjhrAdYUG/osKlLCR/cLgUQJS8BjZFgdaZlLvEFGrVuT282?=
 =?us-ascii?Q?JWWFijVhVHf3LXS+N9sArvAccqSlgqZRJXiiTruwWAiKG1YPTpCDc2B2/J6X?=
 =?us-ascii?Q?UwNlZtIgvdhcY3CAC9Lz7EZ5D89r3TY=3D?=
X-Exchange-RoutingPolicyChecked: N6s/p9h/4TVrXTvt4tn3IB0gMe/yjVLltB/H3ZTbO32GZtBwVetpcymzwVLQOahNitQmriY0bSjoK0GYir0TuYZpHeelPYm4Ul2aYYZIuRssSuM0uNx5O+RoS5KCpv/c9ZrDDejom63/yUaYEY4qToHyC9T37HbPuG6EyqY+Pg4C9l+MUH5ugQoMY/UXE4qsHACbwn+JbNp6ZDYgoSV3UlEbIWxxDLvpeoGMmea2wWxRlJZ8vxWvaKV0buXoUllr3AaFsR0qsg9eijdOffxNJ06H2FmbJ7zxZAFQOU5OIs9mGAChDBk0jtlTtPHGN0vZlPQWiaPtbBtyh4rpRe5Sag==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1625291b-0602-4bb9-6d2c-08df1901cd77
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF0BAC23327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 23:32:44.6514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gJFYeloMY/rKB5oDaQvU4uH2YiBfbtTpnUmC2vtSpx0V5lnlu1CMj28MumRxX1GSbzLhRD9A/Bx9x+NJxLU3YFueRKcBm0fXIVT7l2wuBAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7374
X-OriginatorOrg: intel.com

On Wed, Sep 16, 2026 at 10:09:21AM +0800, Guixin Liu wrote:
> ACQUIRE_ERR() and its wrappers, PM_RUNTIME_ACQUIRE_ERR() and
> IIO_DEV_ACQUIRE_FAILED(), report whether a conditional cleanup.h guard
> was acquired, and drivers consume the result directly in an if
> condition:
> 
> 	if ((rc = ACQUIRE_ERR(mutex_intr, &lock)))
> 		return rc;
> 
> That combined form is the established style at the 49 in-tree call
> sites under drivers/cxl and drivers/pci/tsm.c, so ASSIGN_IN_IF fires
> there only as a false positive, and every patch touching those lines
> carries noise that reviewers have to wave off manually.
> 
> Skip the check when the assigned expression is a call to a macro from
> that family, matched by the *_ACQUIRE_ERR() / *_ACQUIRE_FAILED() naming
> convention of its wrappers. Plain assignments and near-miss identifiers
> still get flagged.

Hi Guixin,

Glad to see you picking this up!

I tried to address the same checkpatch false positive last year. Joe Perches
gave some useful feedback on my v1, including a suggestion to use checkpatch's
$Lval, and I incorporated that into v2 along with some test cases. That may
be useful for your next version.

More inline -


> 
> Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
> ---
> Discussion leading to this patch, where the false positive showed up on
> a cxl patch and covering the wrapper macros was requested as well:
> 
> https://lore.kernel.org/linux-cxl/20260910094017.4032170-3-kanie@linux.alibaba.com/
> 
>  scripts/checkpatch.pl | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 8a7787d228a6..fbc500bcfaa1 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -5777,7 +5777,12 @@ sub process {
>  			my ($s, $c) = ($stat, $cond);
>  			my $fixed_assign_in_if = 0;
>  
> -			if ($c =~ /\bif\s*\(.*[^<>!=]=[^=].*/s) {
> +			# ACQUIRE_ERR() and its wrappers, e.g. PM_RUNTIME_ACQUIRE_ERR()
> +			# and IIO_DEV_ACQUIRE_FAILED(), are intended to be evaluated in
> +			# an if condition, with the error assigned in the condition:
> +			#	if ((rc = ACQUIRE_ERR(name, &lock)))
> +			if ($c =~ /\bif\s*\(.*[^<>!=]=[^=].*/s &&
> +			    $c !~ /=\s*\w*ACQUIRE_(?:ERR|FAILED)\s*\(/) {

What happens if there is also an unrelated assignment in the condition? For example:
	if ((rc = regular_function()) || (ret = ACQUIRE_ERR(lock_type, &lock)))

It looks like the ACQUIRE_ERR() match suppresses ASSIGN_IN_IF for the whole condition,
including the unrelated assignment.

Could you use $Lval, as Joe suggested on my v1, to make this more precise?

I also suggest running this against a small test program with the expected-pass cases,
ordinary assignments, and mixed cases like the one above. Feel free to reuse or extend
the test cases from my v2 [1].

Could you also Cc linux-cxl on the next version? There are several users of this form
there, so it may help get some review and testing tags on the patch.

-- Alison


[1] https://lore.kernel.org/linux-cxl/20250815010645.2980846-1-alison.schofield@intel.com/




>  				if (ERROR("ASSIGN_IN_IF",
>  					  "do not use assignment in if condition\n" . $herecurr) &&
>  				    $fix && $perl_version_ok) {
> 
> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
> -- 
> 2.43.7
> 
