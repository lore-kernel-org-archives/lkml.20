Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1385B2EEE8C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791478120; cv=fail; b=jGas8U6iSfp6QC5W++kMOdCFfBIMO0Pbf9vx/JdE7nBCGp+LUfkDVnBley2b83crXnOasZC6u4zRZ6xkSlO0QgbjJb/mFgPCQhDj7mg4Y1eLnrNxw1QlzHczadrijqWvv7N6JaiT8i+9Uq+jfAi38UMWCNgg/++SyfyyXtCvRHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791478120; c=relaxed/simple;
	bh=SO8YIbgCHVbzSmZ51oJax158uYEWTZ0Jx1cJdmnclZI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nFxfD8mSAFbia5ioEFbwI6BOa0f6qUhi7JYePPpXTmXmdMtmKOMztl5Y10guCjsKKxRxwOXYdmBG91UYYMXKDOTbNQxUYDaBlHLI9HFYDtfuLaWq5FYYuBU5BSgndz5ETQEwUXSPpWSjg3STN2pjG4zivZO9EUIASxZrCLb6fgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fw52MxBU; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fw52MxBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791478119; x=1823014119;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=SO8YIbgCHVbzSmZ51oJax158uYEWTZ0Jx1cJdmnclZI=;
  b=fw52MxBU5tJnlkHKOfHnTYWjqkQBjinwy2sxt1y4phx+yosGfPrXP2/J
   a1nEgYyQ+muVM/qRmZhVbhnLhpRa7aIVEggxAcQeBM7g10U+cBdShDn7Y
   tAXPANX7zyjk187bJ/3QLsYcEVcyguyNdlY8cxAM6KhR7CdUWW1mls1vL
   PjHKo5xSPAlyeoLa05eEB0wNV6HhtR06p7g5LGIBlVamEN9T7jgJIC9fx
   LnyjWQDuLglNghqXI8W7ZyHgufJUqtydM4KIpMzScsqHXNcg67M2Pk9sC
   c4wnqCeei2BON6q8fB1IrYnJrXNMmHB+Pxigk3SMVC3yJN8LQNEYBCR33
   Q==;
X-CSE-ConnectionGUID: d3cb1hBGTOq8XCscSEBrGw==
X-CSE-MsgGUID: moqNd4xVQLyKr5y2scC4xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="151265"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="151265"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 09:48:38 -0700
X-CSE-ConnectionGUID: dTYSTVo8QA6GQ0FRmZyl8A==
X-CSE-MsgGUID: ZpAA25Z6TayBJqicC9C79Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="415844"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 09:48:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 09:48:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 09:48:37 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 09:48:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjmJ8bum0EXr47IeRapO63kqPrQvfxo9bf3eWVLUpDRiKOO3yT/3tgpvNR6yOR/I3UnaQMWNouvvMlRgSVBmdQtBHIlJxtb50MB0ZLQAxrZgUr85fo1Fr4rfxBKubZmT7h1y0s4WA68LT09Www/oJuxze//XcDG3F3H80y6SoxOTiMgdXuQ+gMr1ZJkgvSJWmPzpLU3UhoOX28Hgx0o7Gk6OV+mBYIzBTdZI/K8C9ZiHdBl2GUDOBjaDfmGw9w2kAccrQ/pKBwO59n4ZDF92a1OEGl6in74qFDOEjh+CKoJU4o4bWFiPD07nlEYWLOZuHChhbmfio4ODVellzgsOzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4d+qJH/cxfkoIymr4cQUcRiYCVeiLnaAAIiEdlKmEN8=;
 b=JJBotang9IqiffaXAxLSHKbgdRNx09YQ8KOo5kqfSq0aF8DlQ9kpn6sQD7IeWApmVfruLS3ypiqXpDiIbPh6VB9eSmpa1ns8pt+opVTOzRUJLEMevHgAJRoNG0lGh0AEu3fw+1QV7Ls7Py3qy6cCoc+HH6ACylSDue5Rm/EiDyFvCUfxqh30Odn2lnhCzs3BdVdTZxd0p+1RySLgUbUmlzltwCevSDaoiMiUltKVCNfhlij0eQaJX3Q0/IHnSyNXiE1pC8M4j3HS6zO7tIO4c+36uNXF2wcAEikr79p37q6ErcLgSesAUP6cOIUQo4dAx8r4UB0ALAFLgddyvbHj0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SA3PR11MB689426.namprd11.prod.outlook.com (2603:10b6:806:58b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 16:48:35 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 16:48:34 +0000
Date: Fri, 9 Oct 2026 00:35:25 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Jianyong Wu <wujianyong@hygon.cn>
CC: Tim Chen <tim.c.chen@linux.intel.com>, Peter Zijlstra
	<peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Juri Lelli
	<juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld
	<pauld@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, "David
 Hildenbrand" <david@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"jianyong.wu@outlook.com" <jianyong.wu@outlook.com>, Yuan Zhong
	<zhongyuan@hygon.cn>, Huangsj <huangsj@hygon.cn>, Fengyu Wang
	<wangfengyu@hygon.cn>, Zhiwei Ying <yingzhiwei@hygon.cn>, "justin.he@arm.com"
	<justin.he@arm.com>, <chen.yu@linux.dev>
Subject: Re: [RFC PATCH v2 02/23] sched/topology: Introduce a NUMA distance
 matrix with unique distance values
Message-ID: <asfGTaJjCGMLW6fp@chenyu-dev>
References: <20260827122816.756234-3-wujianyong@hygon.cn>
 <20260831115004.GF776954@noisy.programming.kicks-ass.net>
 <da32ba66d95fd88869ba052f97698b9a4d6c3dc6.camel@linux.intel.com>
 <09261c8222994a41a04ace5f342475df@hygon.cn>
 <ce95ec57af9dfaf4d9ed604ad7337441a543f538.camel@linux.intel.com>
 <f6ebab3d0e44412dad17ac64a3b93339@hygon.cn>
 <112e526b4013e23c70adf5b8883db8e75358b473.camel@linux.intel.com>
 <8a0c239b5bdf40c99b645087dec8fd18@hygon.cn>
 <2a120db1b0c052eb88dcbc2ed1de6027a16542b4.camel@linux.intel.com>
 <4d2b5dede1f64350ac17ea9d0a5428a1@hygon.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4d2b5dede1f64350ac17ea9d0a5428a1@hygon.cn>
X-ClientProxiedBy: KL1PR0401CA0036.apcprd04.prod.outlook.com
 (2603:1096:820:e::23) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SA3PR11MB689426:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d822df7-a546-413e-e3a1-08df255bfdbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: yku/7AcwllHrZBVVanWSzGI7MyeW8LtMqsfrWPDcBqFBtjWUFAHIoHBvvaX7X1kSxWfcj19zB71lDyy2CNqgBExqH5bTt47sFGEXiFwTdW4zJ88Ls6k6gfu5RjUyr6Q7dLUqoZVLspMUdXrQGXdLp7/1wZlS1rFd6xKmXnXr810FfovTSoxSYg/Z8vUvnHnd6jiZGgYDKPxxh5kFw7YcozTdclzSuZY6V0eTUV0IFXqP1ZGkBSB9TjoPTTcvutbt02836CHw2HhzgXOv0NCRZqAscdzDRhpO4PqzXaQhfUh5HEu+0E2VhH+wKb43ooedNK1psl4XFkLObHhZoAPqJVEZnM+QPu/gJ/Er2eqGJjONR/gzwPphNkLWhcnk6oN0zrCyqFLpOK6vauIlzOYAhogxTEfgWOqSrzjV/9WgEMxW12PMO3OgcDyUHr9TayNp7J1e3yoNrIyzcEmXBffXGm1VIJRx+3VpVqF/zhfFEjU82ilm/Rik/6AtoeZV6C5Xo3l6a54t1UGWvftOJmfcbhd/+9vy4BLOLuuU3iZbS6dNlWFi4uD4zTjRBT9gFlRXGvT+d7DEL+uDlfdoBhqT9IeR6+d824+w/BraYSKIy7fPyxzaDIk8XmYoQIpsLTNewNifU4sAMYlXc22JPjTNQj8SV6QwN6y2o9JHx+AAy6Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B+WzxuSeDOAbZ7HdXdQZMR53u9QvYuGo5BdBAkHQVIy7BnMk4jiUVbUSK2wG?=
 =?us-ascii?Q?6EdsB0ib4N26dsh0n2bV3s7lyVRPUIUogMbZ2e/iGMCawsFffwBfCEZDL7Ao?=
 =?us-ascii?Q?qpNHuU9IKE3L9pJYZilst85BzBwMGdzhkh0dXF7+IVPJ3a8wtm1IaZAmdTU+?=
 =?us-ascii?Q?/rpCl3Kis77xVmTiBYdTz9WAt/2mpiAxNdba0xydlQiY3bMLA/dpkh58M4lh?=
 =?us-ascii?Q?65X8EXh7HqR3eoK1DpQh0S0OYNFt7K8zA7AShpMcqnh0jMlPk7lQaqVoTDWf?=
 =?us-ascii?Q?FIBCMhPzbT4XV20w6js/90Hsw7e0MvQpnMmhou/4UPlNhhzk9bGBj+2a0Hfw?=
 =?us-ascii?Q?/6ZH/QoBj1sF5QBuh82RTf7r4q87/+F5CeMue9d07Y3zaCvjXM8EuEFziBto?=
 =?us-ascii?Q?oEDqy7PAlLCMDDsTRDjHtWaRmofGMKrF9SZZJEhRoANBRMOZL2vjlvKnCXnc?=
 =?us-ascii?Q?knA5GfADM3FwBXJJwmARQPfqauTXObxfT3EUna2eUx0oqYSzGZujBjJzDysB?=
 =?us-ascii?Q?+Jw3kT0tf+ynDKsuXuf0sF/WCWYkqq5XQA6ZQW6CpG1pZr4tcReoV0/WwCSN?=
 =?us-ascii?Q?KHVDXj9WlZ7OltyW4sRKkm0dcHluCIurcNwZn2r3Y1dq8WD1cYk6SfE7BUGD?=
 =?us-ascii?Q?WTI6D6dvPM032AGqLo4yYiyxVvAs+ao06X0A4hcf7V4GOQ/VC2MpPTti1MDE?=
 =?us-ascii?Q?OlMYDi6g05Nq+/zBom16XgGKbA/S1fGu81dwb6oSyWHeQbsJ6YBh5hje/3l6?=
 =?us-ascii?Q?Glnovk8miL7Uji+vXFh+zG8VyIsImyj1EPCLL2ZJSrd5N2nF9u1HgTs/39D+?=
 =?us-ascii?Q?txXjT32hvKvI+hVMT8nwC6tgI92sVxck0Ywez/TacT5288H8ebBEAMNHlieo?=
 =?us-ascii?Q?DBLVY1qY/0Fx/iBd3SuBPKVa1y54zjgVmSrZEPP1VPGCbQHPeVAYXfoWRMmj?=
 =?us-ascii?Q?KVt6J/JBP/EnemgCOOPAHWqaKqklypK3F5IFFoGZ7LW5E+ZPLRfMP3NWNLXw?=
 =?us-ascii?Q?x4OrBbpyuDbGbUu6uOdezrCw/uVMIDfQobCnh3+iWGYdqXfulVf2Uf+6my1+?=
 =?us-ascii?Q?I1d4psseN0K7fM0HLTB55o4QIJBvQ8a2T39UU5B4MgMbvBMfcg7acBP4/smV?=
 =?us-ascii?Q?hpyvYgwUezsm3w15EML6koGtnukl+h/uvB7qgjwQUM6YiXOgdO4zJmh9Q3uf?=
 =?us-ascii?Q?J7sTgMrrl7Wo/1evnKmQEgHYAhLWB8FPC9/g1jLt+Fb1SKiQel41WIBUkmyE?=
 =?us-ascii?Q?nVw2SLBxFnb6/ZB0pIcxnIRJ0HQLy+Q0cwrVoT3qjOKpG/ewV4R0QRSjl+hO?=
 =?us-ascii?Q?cFoWzGGQT4Kg3QOaHpsVeCJ7Dri5MJV2gCk1ChJpzIJoQFmDgKNDhgZn99di?=
 =?us-ascii?Q?IVpyn5UGl9f4K+N/l3VB2/x6yCunGDPeW8Jdi1wmmKFXeaPexZX2rHd7Q2El?=
 =?us-ascii?Q?D1+mads2GIDzg459Jdt2oIlXHUsYvC3wUjXYrHTfZ6mvFrcGbWjBbA5SPz6k?=
 =?us-ascii?Q?RVHCkWUCsDCauqBl2uu4Xuo+OBroaXYfC0yPYsbfBIB2wdNGnnqfqWSE7G2+?=
 =?us-ascii?Q?UxUz8lPIDqzb4XVg/D89k9BxjziHY4Cgr3PsGfR/vLi79XYedV8TRZry6vJK?=
 =?us-ascii?Q?pVUeK984pNel3izbKafGIaJ8sCEe0ADWQIdym3g2kwlWY8z2N6OfjKSe4170?=
 =?us-ascii?Q?U0zvhmKgfI/A3TnHFeab/0leoKx25ixrZv8zeWGvugG1nudLa0fB0xgHkk6k?=
 =?us-ascii?Q?Ef2CN9D9Ug=3D=3D?=
X-Exchange-RoutingPolicyChecked: fL4bmTD/i17qYcl4BShf9ZNZUV/Dqo/Rq/Iqk03+FvENjZqb9NOOFu0AKv7tpO/EOdsdPQO6NzSbDA14zp/5b6pKy2MWxn8ngL1U53j10cbtdmIvGfXyohsLMTCQyw/wUV4RmnBVx6BuHffECGCKmEPprVNf3HzxoXgCf90AuCuR0lteViBUEQM6mw5hBLb3jxUP613pV8jJw65UniaMpU3jiLR9BMaZZEG8hNFuEmbXKhgx/Q5/60aMzTDFJbAotZ0NPPe7m1IJkaUkTu2+Wgm6kIsnoapLZpuh0giXu9W8266ifOLe21OSyXa7LjMYp5PuhZDp1Z7IMxGMlkYEow==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d822df7-a546-413e-e3a1-08df255bfdbb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 16:48:34.4632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dQ7xCxs6G+iA6N5LzIFi3HRY4zBmsxnPhNoP4yaMI6AH24sOM/+vuybjAfAg+90OB6pPqa9inMUkOCCTaQuzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB689426
X-OriginatorOrg: intel.com

Hi Jianyong,

On Thu, Oct 08, 2026 at 07:35:10AM +0000, Jianyong Wu wrote:
> Hi Tim,
> 
> > -----Original Message-----
> > From: Tim Chen <tim.c.chen@linux.intel.com>
> > Sent: Friday, October 2, 2026 6:04 AM
> > To: Jianyong Wu <wujianyong@hygon.cn>; Peter Zijlstra
> > <peterz@infradead.org>
> > Cc: Ingo Molnar <mingo@redhat.com>; Juri Lelli <juri.lelli@redhat.com>;
> > Vincent Guittot <vincent.guittot@linaro.org>; Chen Yu
> > <yu.c.chen@intel.com>; Dietmar Eggemann
> > <dietmar.eggemann@arm.com>; Steven Rostedt <rostedt@goodmis.org>;
> > Ben Segall <bsegall@google.com>; Mel Gorman <mgorman@suse.de>;
> > Valentin Schneider <vschneid@redhat.com>; K Prateek Nayak
> > <kprateek.nayak@amd.com>; Shrikanth Hegde <sshegde@linux.ibm.com>;
> > Phil Auld <pauld@redhat.com>; Andrew Morton
> > <akpm@linux-foundation.org>; David Hildenbrand <david@kernel.org>;
> > linux-kernel@vger.kernel.org; linux-mm@kvack.org;
> > jianyong.wu@outlook.com; Yuan Zhong <zhongyuan@hygon.cn>; Huangsj
> > <huangsj@hygon.cn>; Fengyu Wang <wangfengyu@hygon.cn>; Zhiwei Ying
> > <yingzhiwei@hygon.cn>; justin.he@arm.com
> > Subject: Re: [RFC PATCH v2 02/23] sched/topology: Introduce a NUMA
> > distance matrix with unique distance values
> > 
> > On Mon, 2026-09-28 at 09:39 +0000, Jianyong Wu wrote:
> > > Hi Tim,
> > >
> > >
> > > Makes sense. So, what about the following solution?
> > > Given a node affinity sequence, a move from src to dst improves the
> > > affinity of every task whose preferred node i ranks dst better than src.
> > The score
> > > is then
> > >
> > > Di = raw_dist(src, i) - raw_dist(dst, i)
> > > affinity_bias_i = position of src minus position of dst in node i's affinity
> > >              sequence, counted among the nodes at the same
> > distance from
> > >              i (zero when Di is not zero)
> > 
> > Do we really need an affinity bias?  I think your intention is to use it for
> > breaking a tie.
> > If there is a tie in affinity score (without injecting bias),
> > just use the position diff to break the tie.  Having a bias distorts
> > the affinity score.
> > 
> >
> I think there is a misunderstanding about the purpose of the bias.
> It is not intended to break ties between affinity scores. I want the
> score itself to reflect opportunities for aggregation, including moves
> that leave the raw NUMA distance unchanged but follow the fixed node
> affinity order.
> 
> That said, I agree with your concern about using artificial node
> distances in the score calculation. The magnitude of an artificial
> distance or rank difference should not determine the weight of those
> aggregation opportunities.
>

Thanks a lot for working on this.

I think there are two level of aggregation:
LLCs aggregation, and Node aggregation.

Your current proposal uses a best-effort strategy for multi-LLC/node
aggregation. It tries to migrate towards a preferred LLC mask, and the
size of the LLC/node mask is the "range" you calculated in task_cache_work().

Take the LLC case, for example. Suppose there are 6 LLCs, and in
task_cache_work(), the range is calculated as 3 for process P, which means
that at most 3 LLCs can hold all the threads of P.

The strategy allows load balancing to move into the preferred LLC mask/range
in random order:

suppose the util of each LLCs are:
LLC0: 45% LLC1: 40%  LLC2: 30%

   migrate task from LLC4 to LLC1? OK
   migrate task from LLC4 to LLC0? OK
   migrate task from LLC2 to LLC0? OK
   migrate task from LLC0 to LLC1? no
   ...

My understanding is that the introduction of distance comparison is
because the NUMA nodes are not symmetric to each other, so you need a
realistic sequence to saturate the nodes. However, this might not be
true for LLCs - they are symmetric, and you can start with a pref CPU
and get the next LLC via the LLC id sequence. That is to say,
dist(LLC1, LLC2) = (rank1 + rank2) % k + 1 is not mandatory. Why not
just generate the preferred_mask by adding the "range" siblings of the
preferred LLC, and use preferred_mask directly during load balance?
That seems to be straightforward. So we can get rid of the distance
comparison (at least for LLCs).

thanks,
Chenyu
