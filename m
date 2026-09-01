Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD13937FF6A;
	Tue,  1 Sep 2026 21:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788297254; cv=fail; b=XCc2H5AeHUeyHKADZTBjQtIJupIBmFe7RpQX9ATMGpXTM5/Dh4dUe98hGt+RiWP9c2XxxVsbHTLI18ZVEHK58r2Lhk1u4MDS0rTXHYZJAoKKS4ndlqrS/fgg2SyqlqktahYiq0zs+T5BSfNhSWyiu7fgsrq+szX5VBRnAnTyWtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788297254; c=relaxed/simple;
	bh=fRZZ/fKpIt4h7WpbUeto2FAkfqk+/IUiT+mI6vE++EE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dqXAQSAFoEdL836aLcF0sxTDZb9eVc+A1nFbPO2avSNZPGxmCKSQTn8VnlSAyJ1aoePaUEe8hVQMYdkxHrAMw45vwg43M7jQt+i6WtcrNrv4SqQuOkMnz6S1zgfSOm9FHrIZYQQ+WEMAc8zKkboLSXpf6sP/aOA+FMS2emVWV0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AtrC78Rc; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AtrC78Rc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788297252; x=1819833252;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=fRZZ/fKpIt4h7WpbUeto2FAkfqk+/IUiT+mI6vE++EE=;
  b=AtrC78RcoAdzeVqsoJgkKm1Uw2VSti5n+iYC/V78nBAyia+vK4px/eWi
   SIxUYl+K2iDwUa/jV350vYAmFxjY1SamDy5p98M1RGaOJx5MWA2tchg4Y
   8LXCPee3Q1+mPkvQK9wbOJvR/8y89LcaJ/SpbCNCqIQwNPiuStcfNa3fn
   pzD7+bFbsH16w+ni7z2GB4Naba5/10V2AwjAkNIj3y/GiZQiIey3lwyqq
   g+csrdkJ/gIt+pAOu16ps1NDF1e7+YjrXkvGA1u+Rx3ilfu1fTeYejnCj
   BA5r4lVFeRSCCBi5vTQ9Hz136IXd/TL/etkcHW2UaW2zSMVjXK6s5EJ2d
   g==;
X-CSE-ConnectionGUID: dhETzNVzQsGvkr9YYQfbwg==
X-CSE-MsgGUID: 50bEJ05hSke+xUYqwb1yKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="100096147"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="100096147"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 14:14:11 -0700
X-CSE-ConnectionGUID: VC91nOzcQpW5PZjL5YUSlg==
X-CSE-MsgGUID: SRUBejGNT0mAapdOAT4HVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="267907563"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 14:14:10 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 14:14:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 14:14:09 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 14:14:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYf5YL0jJLqmAjHhCAcLWTEmwxtL4mK/yPQL2UzJac8/nsneo1VuwyDhSr+fqQpPj39uj6cvSFEjJ3Ey5Tcs7iclp5Uz6lu6KM9O38z5ZyJyssClRCMwwFHpciNYkDJzLu+hFLx+P7N6As1xwcjVyEzQSCwE/VcPie7w1LnWlDogqJ1B8qEnaZniPGnh3OhXVS1HtS2u1OZRFvERXLiTGzxEUkUQVnej6rYdECNR6pYM1SMVnQLYAvWlXOyB1mcYECkVX4G9UUYU8NtBkoDTEAYu7FPK1iKpiHwyvFpe2m3PUTaAud7ZpBBT1s4pBPNRg6U1RWhxpJ84LtGO4TvOgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=za5OV4DxxJjX4P/Q8VTI5dWYKyhur7tBeT8wGMoc2IY=;
 b=bwiHPG1wJf8yjN5iJdyD0D40GfJvp/eCGtIkUOYqmyJs1PULOMSTKWw1Hgru5848GBLgs5ocYvLL09YFq8SlLvlUZbJmNgUOtcLrc/92kPDUp86dBVQ4CI692hpfEq8KOIsTcZBKvmfLn0SgGWEFYMZhvHQhK3QF9SSkJqBAwqjgfRutWfJTSBIe550mQ9JDC/xAbupzBl05T93pJ8e0LW4hkghUglhwI0yZDIEs+tu0c6bMLmJyqVyfIY8VM3xTyNPoEYADWwI5ksmVCleH9VhgW+K/64tPeNHLPMWzRvinh7t7TZf0yp3fucIOpyFVYmECxrlWX+Twkl2ycNoM/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by MW5PR11MB5883.namprd11.prod.outlook.com (2603:10b6:303:19f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 21:14:04 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 21:14:04 +0000
Date: Tue, 1 Sep 2026 14:14:02 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Babu Moger <babu.moger@amd.com>
CC: <reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<bp@alien8.de>, <ben.horgan@arm.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <akpm@linux-foundation.org>, <rppt@kernel.org>,
	<dapeng1.mi@linux.intel.com>, <elver@google.com>, <jlayton@kernel.org>,
	<enelsonmoore@gmail.com>, <kuba@kernel.org>, <ebiggers@kernel.org>,
	<seanjc@google.com>, <peterz@infradead.org>, <chao.gao@intel.com>,
	<jmattson@google.com>, <naveen@kernel.org>,
	<ricardo.neri-calderon@linux.intel.com>, <tiala@microsoft.com>,
	<chang.seok.bae@intel.com>, <prathyushi.nangia@amd.com>,
	<kim.phillips@amd.com>, <elena.reshetova@intel.com>, <darwi@linutronix.de>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <x86@kernel.org>
Subject: Re: [PATCH v5 16/16] fs/resctrl: Add documentation on kernel_mode
 with example
Message-ID: <apdAGiN6zvIDU1kD@agluck-desk3>
References: <cover.1787772750.git.babu.moger@amd.com>
 <c04c7a9e2e47d472c6cf4b184ef9c3be5ef6b4c8.1787772750.git.babu.moger@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c04c7a9e2e47d472c6cf4b184ef9c3be5ef6b4c8.1787772750.git.babu.moger@amd.com>
X-ClientProxiedBy: SJ0PR03CA0166.namprd03.prod.outlook.com
 (2603:10b6:a03:338::21) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|MW5PR11MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: ab03c6f8-4833-4a0f-509f-08df086df3ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|10067099003|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: kRhERN9QILDNWHvJZoKMiC3KNFSK4G7jAKfOxFLSHKmnvzSUZ2m/x1ZMR0pulEwMzRKMWyCONWEDn7+t9ysYebgNoNMjKp73CYpCtjHfCQ+rHyJDnTRdEi6at4Kg2s99Uf04KvpVdDBk//EeLmSgWdQYTiRiirnD0BbVvZh0tFCy1/+ln80ZfMq5EA1dffBtzKd7Wfd5TIl9Nxw9zz+J6BLh3CDoz2zKX2uZk0T2VMx1r5lXtqtuTskXOJo0P7JdEePjsym5mb21DIom23hX9zf9qC1BveKT/52kf0KzEX5VEgfoSHwGudaNFzyl9D75Hj70mdB32brSZT7MYL/2mz7ECSNmH6+oh5VUq3QgR6c3CBAZcxJv7Rr89t1qq3hnHY+pQQCD/nWe+7GAqYSArLR4NJesFXjxcjBgzKS0yeSi1Ya4xPubvbkUY9iwDZWGJL3P2wLlx7uLvHgWqQB+S5boe65eL5m73XR4Mx7JuKLbIxbQj3/PfD4Z9b514l6pBNOFuOdwwMBboAyLXtsHD3MIhqRwiovWMq7v4nfNVD6swgBuGMBMuLgIsvUr38GfTIGTI9evxyByqgBNxP+i61tRANfeftHqTgwRSwm7oc9aouxUSCVoagl4mtH13+/0P4A3hEUdkxI+N3dKBBVFJpSPJxKej15OyCIZw3djec4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(10067099003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VVpb08mgmWVfnSPw7qJwMXJnlbUkTiNQ3eIz0odzTv37o0uocaFTjg3NB0za?=
 =?us-ascii?Q?Cr0xgKOQrvv0ETSs+TxI0Qt2nxvKZRnvgvphkZusDK1RHhLqZbTQTvdPPD45?=
 =?us-ascii?Q?YhYgO5qzYxZwffAHz1sD/jxYYpXGSHQhVFY5An67ktLnVTMzObF4Mj+an5l9?=
 =?us-ascii?Q?8+ygBHFEmx7lgs3gmB2Cfe7TVCgqm/94jRq1e82ekayA1YPjkVOEwcC4i9HN?=
 =?us-ascii?Q?DvKtXz+RttF1WXlm13N6ec5AjEXqiLbGzS7RbM6xmtNSFADQ6cR+fSL5SORy?=
 =?us-ascii?Q?7mLLVF+IM+FJ8nWM8PPwDhOr7WDyWotcQKoJCLKU5LXxiTutX0X3P+axeoKt?=
 =?us-ascii?Q?/g4N78WenFcz1+GrIkYKyErTIyxAxmS3cDc4mw+okeA0mSJlSf82qrCztTDe?=
 =?us-ascii?Q?HV3vehMOSl2lGOzTLtlxWKtmIUOoRAQlhGsM0w1XvsweClVrsYEfpLbfGFy1?=
 =?us-ascii?Q?zppZgUwmhAkLtE+VYgT2gc6LeWacJ79xGYnZrPQaO6FoxVyEDSnO7jOLuBxh?=
 =?us-ascii?Q?/dZR2RHuNI0k2kRXxdAGOoHZSELdcovPfJzblBqf+0Z6vSal5D4olof0uy4N?=
 =?us-ascii?Q?IaegVjiEl0TAr/we8rhzSJjIXuyxEY/f//uFJcLjw8xAXqv8kSGPfvapU10f?=
 =?us-ascii?Q?h+T+a+l65BnZCg6hJNlYS2f92e6MVMtuUoJa4o0+AGSTRWAvwd+wyFiAQ25o?=
 =?us-ascii?Q?PcsALzc6zaga8EoAUPrCu8eNg9XuLcNqYyIvnVRPx7aWfURGQDM8w+D4nhTO?=
 =?us-ascii?Q?RRS4ruDDreD0AfGpakQbWJEb2fBgZJC5ZDsBwinSGBzddcHj+1jO6PLrOD+M?=
 =?us-ascii?Q?EgALACLjce12IhZM/ciciBvUge+FfB1keHsMzofrxESQysk34mAPbcBdIjeI?=
 =?us-ascii?Q?jAs/HdaIXUtev11GrSpVvDPCpXSUhPsTcqx2NpfOCMct62R6XCe8ThEdCmPd?=
 =?us-ascii?Q?UMwwlO4PAOdvPwvujnw2kMetMN7hwiTHaBMkx3YjW7ztt7nIvqu1yYYonJO9?=
 =?us-ascii?Q?CF53Q3KyXqKGDFCPbvcL1CvDck8po9BmYBxucWB+sUPJSF4fjQlcZFZ/ma83?=
 =?us-ascii?Q?+ihLqNN+Db8dk8P8iS5YSaQhYx9bO9MWDjLpTx1vPCSwhS7a2NcJ5WPoL11c?=
 =?us-ascii?Q?APTRU9iUdojpy98E7hGuHSA0tiHIpvZ69s/Rg+rvO6oAc7i/LceSZw/+wtQV?=
 =?us-ascii?Q?CrMdfEwpWEqZFZ4K5fQ/+IBNObzDl5fvzstJCqim6PxFtTp4nvetWlhQNMuB?=
 =?us-ascii?Q?Xqo8KrVvdt65FPhdxeWIPZ5j/1CzFhzRmNkGdW2MevvFnVIwwEGzrUZ8XcnD?=
 =?us-ascii?Q?B7SlinFA3eHKshSC0i+JVuyxQHfwp0CGdXL/G8CzdQlj6ObwU1CxxpxNAJfS?=
 =?us-ascii?Q?DHb4u6+xW219NQ/Z2qOVA+PToqUalag9pzU5HwLz2/1d7Iq7/GCnLwGXl3sM?=
 =?us-ascii?Q?lO0WhTXEAKxhlxySV4JUZlKt7i0Y4elX69gIGLxSMZdr7eNYLkpexyCwvWqf?=
 =?us-ascii?Q?WrTDADckVcyDqedKBhL45nq6p5LtrJRW1ZKNmAfvDEf+3/Euiu+z+TtFQHd9?=
 =?us-ascii?Q?VtwTU0d/JsoS/DM/S7ibRBC1FvuaOz1TeCmksbg9ug1IZeMeC1MynzBcH00e?=
 =?us-ascii?Q?ofbVUFarTBvWyWp18Cizc2y11mDE0+din4vkDPJh5XW/PRzoEAoFpYdWm640?=
 =?us-ascii?Q?YsOTMSejx5axjZDMYq+lJGIMLNY2NGyafyHFQhGF6IL4SSHhG365IaNtOA56?=
 =?us-ascii?Q?HYlWK2WKxA=3D=3D?=
X-Exchange-RoutingPolicyChecked: WTFJdQbsA7enAqhTtFiONtGWW5ZuT+ErTuZW9zoVLAbgKJSwS60y4h/h0Ghx90XLnTS0mm4Z2+9ivsLtNTqyQFcf62fVG48yFR3WLX1Ew6NTi7kZCbQOaW/dK6/iYqwNTjwd8dQV7g552OQiQmfGQ5uWxAbsaYCnlOpz3v2pbnRXIXrEYBRAfKQXL2ok4Xzcu8Y7tX5h79k4GT2dCSTXmMQcHhNjzgJpl3xbHIBbc4JrtfjTleA0sBUfJxNR7QFQnU4bUBP1KzApF6IHlyspFNvfFIMLVR7sSWN1n0NrKuzhYjSj74Jju4CXBPUyzpQk0IErSk7HPLWP/uyFkWfqJQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ab03c6f8-4833-4a0f-509f-08df086df3ad
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 21:14:04.5103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhyljcUUnkZMURNAmIuLA3cv9hq2KUQ1hgW0HR0jfH1WIGn1ExbEkVja7RQMQp7HBoqZYH8c+GDApJXIOFnqmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5883
X-OriginatorOrg: intel.com

On Wed, Aug 26, 2026 at 02:32:30PM -0500, Babu Moger wrote:

I fake enabled PLZA on my test system, replacing the wrmsrq()
with some console logging. Tried out several of the examples
in the documentation and the ones I tried all worked.

> +c. Narrow the association to CPUs 0-3
> +::
> +
> +  # echo 0-3 > /sys/fs/resctrl/ctrl1/kmode_cpus_list
> +  # cat /sys/fs/resctrl/ctrl1/kmode_cpus
> +  f
> +  # cat /sys/fs/resctrl/ctrl1/kmode_cpus_list
> +  0-3
> +
> +The write reprograms the association:
> +
> +- CPUs added to the mask are enabled.
> +- CPUs removed from the mask are disabled.

More precise to say:

PLZA is enabled on CPUs added to the mask.
PLZA is disabled on CPUs removed from the mask.

Or perhaps
PLZA reverts to "inherit_user" mode on CPUs removed from the mask.

> +- Offline CPUs in the mask are rejected.
> +- An empty mask disables the association on all currently online CPUs, but
> +  later hotplug CPUs are still associated automatically.

Is there a use case for only enabling PLZA on some subset of CPUs?

The special case for:

# echo "" > ctrl1/kmode_cpus

seems particularly strange. It reads to me as:

"I want this PLZA feature enabled, but don't use it on any CPUs".

-Tony
