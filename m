Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9500D4F55A2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539047; cv=fail; b=Ev7agAwJX/lF8oWtof7Muv3rwPCZi57KOH/82OQdM2L1SXMwrcUa8dV+p4ImR5MqIh1d2RA3hROpT8Uwb25mw7B9U1XHNYtBdfx0VqfY6l0puJsYochX7EwW9PCZjJC1tlGaCjlVJV/eDyr1L+P+s3jwfY6RWvIieI1ue92E83g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539047; c=relaxed/simple;
	bh=rfNZUWjX5TZrWpCnfvRK0oUy9mBVykr5QlmxSN0UTVQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UTnwvE6ScxWvAqwZP0WwYW9sLKfiOjsE/QXyAYFwiPPLTUucd1H6koi0fCoH6HIllhcIBdw9eBDdRtAXEOOLPjHDhnJgHKNC1fQUzP4f+oliRdTBpysHMGIcs3qwuLDergEVIRGaHqPsj1iaaWhYYnAn4C+qttAYbdApNOihahw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dk2yMAKA; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dk2yMAKA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788539044; x=1820075044;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rfNZUWjX5TZrWpCnfvRK0oUy9mBVykr5QlmxSN0UTVQ=;
  b=Dk2yMAKAWSbYRRyynLHFhBpr3ty0Y3P42E4Kxdgh+K/e/+nGtQipOkb/
   ylSXXBqKbGhV7Dd+Oh7q9PhU95dBbUp9vO2XdCmxFHDjPI1ttfaDiuPBl
   vyHlUNuesY3A99AmOIpq5WrBLQjVVQNlagk15kjyPxIrciutQUrLRfiZz
   GL9+YMXoFmzTAmfeVaLdzkSJube9i04wT28fcL7u6LoHg5dkIu8l00cFw
   uAXQzvxf6JmxinGRWbp9zZYFtLuQzlmCaIAwRwA4C1Qy1eMTNaFxtK0pY
   mmSprBfjJ3MNUgys2RcG/RUcNPF8+3v5HwOzzzF6dge7sexdyiJyP6bY2
   A==;
X-CSE-ConnectionGUID: MBNHIvHmS9GwO7EAYj5XqQ==
X-CSE-MsgGUID: eJunc6rnRSuD1TvXsZov/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="114587494"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="114587494"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 09:23:59 -0700
X-CSE-ConnectionGUID: 3V3D1wyjRQmR3mnhWKyeQA==
X-CSE-MsgGUID: ktC/djxPS7iWMIouzBkuYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="270603759"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 09:23:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 09:23:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 09:23:57 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.58) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 09:23:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MoSkfCECPdqcuDPVdAXlHV/fHbLJig8yy2LHjfiLTCxbUJdIcCly7WJ9lAgxhNBuz/+J9NvARK03U4dqG8z1fo5Wxhn002/Ra6Xy5ZZ4qUTAeln63DRb8P1JdBtnbG05Xl2UdMNu7tpgSssrDOg2x6VPKJCvSnRmQuqhKdZI9gxTcq+Y4o/ksIRhfhcmOJ1nHyoiJNMbLcklMOlZlK6lbDSoTt2IoRjSANuljlBFxw7oxeOCk+WX/PcSNQ1PsrJ5ku4NviHLxOmHxRI9kUVeyCnPNzczjcUYUdnR2wCNu2XDuhNe7dOlmaJ8JX+mVkosWZET9mxUugakrJdELlRgGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKPRpzChJQiMzIztF+StWqQ1C4Ecv94e/GVr6LksFzs=;
 b=wr/qeC/9YuSceBEK0WBiJafwBaeX9XsbgidNL6qRfXlgHzEWb6XkfWemZjSecY/84pwrEL56GSzqkNgvBtsFDEp10bg4VEN/HM9DfbAwoTimMT/7C8f+8X2/V3V4hXusLSC6IFe9nrJLda0ru4eo2+y/3tHKnvHAX+6PcwLPzboN94lEStzy3HxXojRJGwoZ7s1azxOK5t5nSqPsI7jc+BCq2OrsHdnhPDXN6j9sBehSaIbtlY9J7Hacf0eawL5YYFhQq9BEwgmCvZZXq3DUaiDEPS2/JBzbVWmCjYpfMvNbITBaCilqtPMlUb5mZSPhKB3paDiQ4Wj/4lHIWodHZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 DS0PR11MB7412.namprd11.prod.outlook.com (2603:10b6:8:152::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.10; Fri, 4 Sep 2026 16:23:54 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 16:23:54 +0000
Date: Sat, 5 Sep 2026 00:10:27 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Tim Chen <tim.c.chen@linux.intel.com>
CC: Hui Su <sh_def@163.com>, K Prateek Nayak <kprateek.nayak@amd.com>, "Juri
 Lelli" <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider
	<vschneid@redhat.com>, John Stultz <jstultz@google.com>, Ingo Molnar
	<mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	<linux-kernel@vger.kernel.org>, "chen.yu@linux.dev" <chen.yu@linux.dev>
Subject: Re: [PATCH v2 1/2] sched/numa: Drive NUMA task tick from execution
 context
Message-ID: <aprtc9-xD2qCZeW0@fengwei-dev>
References: <20260903041154.2479761-1-sh_def@163.com>
 <20260903041154.2479761-2-sh_def@163.com>
 <4593a7a4-cde1-499c-bba8-2fbe24f35422@intel.com>
 <08f682ba75a4700694d6f94719b367b4d26c032f.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08f682ba75a4700694d6f94719b367b4d26c032f.camel@linux.intel.com>
X-ClientProxiedBy: TPYP295CA0040.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::12) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|DS0PR11MB7412:EE_
X-MS-Office365-Filtering-Correlation-Id: ea1a78e0-35ba-46bd-6e0a-08df0aa0e997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|23010399003|10067099003|56012099006|5023799004|11063799006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: WRqD52VGSJrauQGivuUiKu/slWQYtTmKDfoGpEPj6sMoKBiqDPDDaepBxqfl9BzBb2HXs0eDJ8uNAb3XhavSu/WWCW6edQjDqISKiJjYWroODBiUBtvNAMG0YPoGjDU/r5EyuwwrFo7xBb0BU14B9QE11K6VsSOLLpPkv1JlF3oXmVV5VYIi3sxu/+yg0dE5AamtNBaH7icRMj+salsISIHxuFVvTMMT4Af8aA13mjzTNdGV2ZXCkcHwST28DPlJr7YDKlqsBmDZMzPN+u3h6y4Vs7S8PjSNgJLEzPpM5ju22YLdDEAaS8fYfHGExP1Vlxfrgd+woAWY877n2YumJMamgvbVBBf6qBPARuCjegZeaERsxAGqfi1f19D3w5aAq8Awz9+5Ygk2JbZlOAS11pFvPkSblhXDmOx4bUZtLA57xD0EOsGnTRKFEKQA0wouv8yrsAcB8MLVpoU1JYPs66ptjOJdzLoM3/pSFeynmiy7gj+4kQZrDPt35tagu08F+FZWqX2mnkEthcNTU1+QvfwcdZPgussPwhBNQnfgdOqW9H3ngTQfKwcxHPVm0kpLX+AZIOeuXKHjpAWCxomfdojY0lBJq3szppdS+KgGjuM5OT3i/aVHbWhmChCxOrSL7+IymvDpSSctf8RIOFEvOL40qHoEkCM5JC62VvTQiwI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9Zx4nFnn1TSpaqwxFXSkXiuJ7oCxyXVGe62KJmLMxsshnpOWiK5lwOqsB6?=
 =?iso-8859-1?Q?S8dr0kDCW/9cDC5u2UNqaANELAKZCMMMt8wy75tAMpCHvQ/zxbSAa04MQJ?=
 =?iso-8859-1?Q?Bs0WrLR3fpZebPuSrk2BOtM+qUf3icYkx54C9j2u4WQKeovmN85AtcNzev?=
 =?iso-8859-1?Q?FlMbUtaQruKBmTQaxgkQs8QP5WVrbqc7snif0Hvu78xqCaQ1m/43fwqwDx?=
 =?iso-8859-1?Q?EOd91EP4emzolGkuWz1bqI7JAHQvYNE0fiioit5pj1UaZqgdsm0GtbeY3S?=
 =?iso-8859-1?Q?MbS1mqS6uXwMGUq88fU3K/WmCDS/rMUXXHu5E9O/j/aqaNRhgnnhoqnWTm?=
 =?iso-8859-1?Q?7EtAds6ge1KmSS1836wzg+gD0yOTyEHfP33plAg0ziRaAeO5UcUq6t8Kyu?=
 =?iso-8859-1?Q?fW16Oc+Cltpx8wdYQFe6z8P5pEvSZmt/5SNy4yeBb1Cb90LFX39VGQeLbG?=
 =?iso-8859-1?Q?FzSL3bUsNdiNzNCX+08lLPdEKxf98P/Ov/H9W5JxPtbwTKrME0bItIy7fc?=
 =?iso-8859-1?Q?USYMdlcLX3nKnIlbn/8g8DIjGHvR6JQ9JCOupMTBLrbGuusMI+ZzpHYtxF?=
 =?iso-8859-1?Q?YFt1sHiUAvkQxU6/iIS1uzgYgDHI92MtSzz57tUeGPNltCsTaCxnZD5dGK?=
 =?iso-8859-1?Q?8djlwTCdpFR8ZimUDifzS1DpO6UByEFZPzD+B8WX9fBfRy4blL5xUwMk0u?=
 =?iso-8859-1?Q?BqO4mI0tPb2bX1lheC/NVbli8mD33Jh7mNY0RfboIz1HO8Gr1fF3Nmhf7p?=
 =?iso-8859-1?Q?zbUwakMZZQxeXL62BrhXKKwuODZc/E3hxD+GFiUWBTNrkCJKIecYWK6c5P?=
 =?iso-8859-1?Q?7OHqr7Ow7CZCLCSwhn75RIH6ZGu57061weLcVSd6KiLKswdXfOTDtTc547?=
 =?iso-8859-1?Q?HWT3vIaEWX8SkyF/iyJT9RyHo2ki7YWEg/cqWZfl5zGhANBE2NebYR1lzh?=
 =?iso-8859-1?Q?2RAla1jjUsHzenOALt4bTwAlGpz48Fg/rdf74k+VSIxIkJYzAUSJWpeHf7?=
 =?iso-8859-1?Q?wMx5UfnQAu+lbx6fabn50eMQviUnQ+4cPZiR0ubeilcUVwGvYSkfpLDrjA?=
 =?iso-8859-1?Q?BnWLviOasKvfToIaDwRMNDk4LRl2Co2VI0PdGyqrMHV0yk9XxbsoWmA6Y1?=
 =?iso-8859-1?Q?hG2mS047GFxgjPWuqPf0i/CZPXHEZoTdus9FuZ56u4QZLojvprC1MJNBMd?=
 =?iso-8859-1?Q?HQ/EDiUVzOdK9zR8PGkqWYsdVQiNtd6aNXFy5isRGu4f+Nv4qZOe1faq9/?=
 =?iso-8859-1?Q?DmWwfATJhzTvJ5iUAk1CIilpZMrijJvMjj2WpVMhdiaYqnQ+XPyjAE0Ze3?=
 =?iso-8859-1?Q?hLF0hy77yA9BFpcAwV1ilwtcFp91tSxBwL98VzHRroOynIsRd/fCE91p6Q?=
 =?iso-8859-1?Q?QdwNN7MpHOL2lVgu3B0d3zS1mBxGoi6/LRr1JB5/Ppx98RFuXDTdkmWGT3?=
 =?iso-8859-1?Q?l73SKN4B1BTKNy2AOuoWe5msRR9tgJN7xqevD00v9bXBYCqVq2oXRZ5DNS?=
 =?iso-8859-1?Q?Juw/tOtr6jY+eDjNSlEIehhkT8If2mh0zlCGHCVbZEGoWazR51bAVrN02Q?=
 =?iso-8859-1?Q?t39rh3E/yRHziWAmZnERR8/fQNZH1WV/e2h+m0csSPf0QbHM4hkJzZJ6JW?=
 =?iso-8859-1?Q?oqjG8GAFVtRtVf+KnJiGGvvAEXR+VwndLDMfRUy8avZPcbqGXebZ9sFDrP?=
 =?iso-8859-1?Q?FERehI1nkmKvSZ52xCHxFb32fek9t8vmjgw9z2NcM4zeNwOIaVdd+xbrSx?=
 =?iso-8859-1?Q?M7dfenA3Ob7RD7q1pW9NqSQYZxRAiXB5hFBcJtuNwkqJetYj84vx13NZRo?=
 =?iso-8859-1?Q?hyoY5hhhyg=3D=3D?=
X-Exchange-RoutingPolicyChecked: zrPKZeb3MBstxGdxMgwMxYXg0DYp5H2jrv+vVsGAdBP266Qk1cU0iJJLHavw0AEAakE9hb/HCjJgoEKsPUB30jwb6azmT7R4ixXhCM0n+Fx2qKOk4rA1dtxny3daSBY5wlk6CQAKSJTkWkUdUg+daPI3TV2qGnfNiQ4OQK/WRUji5A8riIakAbXK19G/CABCsh+i7j/d/sywan39/Pidjac2ZnYl1GtuLrE/qVYO8OZYRwWaJlqZhcZ2zqVeW4EBo8kPYxD8kZhLDjESzD1ebrNwH+4pGh9tacAkmNLp7DYv/lhYLWpOLzbC+i+as/DlbETLf3dLjQr1vEMY6uIpDQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ea1a78e0-35ba-46bd-6e0a-08df0aa0e997
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 16:23:54.1186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTZFfqNbT/TlIItqKrlnTglzr205N1MuEzAgl+7iYkx5EC1Bm6DIaZjIbPQ//aNhDoOhG6o5HAAeK9KKd0DTDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7412
X-OriginatorOrg: intel.com

On Thu, Sep 03, 2026 at 02:30:25PM -0700, Tim Chen wrote:
> On Thu, 2026-09-03 at 20:41 +0800, Chen, Yu C wrote:

[ ... ]

> > But I also see that in task_tick_core(), the sum_exec_runtime is also 
> > leveraged
> > to calculate the delta "wall time" via __entity_slice_used():
> > se->sum_exec_runtime - se->prev_sum_exec_runtime
> > does it mean task_tick_core() also needs to be bring one level up to 
> > sched_tick()
> > and passed with rq->curr?
> 
> I think task_tick_core() needs to stay with the donor's context
> as it is the scheduling context.
> 
> task_tick_core() is not about the execution context -- 
> it decides whether the current scheduling context has used
> up enough of its slice to let a force-idled SMT sibling run. That
> slice belongs to the donor, so the donor is the right task to pass.
> 
> There is a separate issue lurking here, task_tick_core() measures consumed slice as
> se->sum_exec_runtime - se->prev_sum_exec_runtime. Under proxy the
> donor's sum_exec_runtime does not advance (update_se() charges the
> runtime to rq->curr instead), so that delta stays near zero and the
> force-idle resched may never trigger. 
> 
> Passing rq->curr does not fix it either. __entity_slice_used() takes
> the runtime and the slice from the same entity, so passing rq->curr
> just compares the running task against its own slice. But this check
> is about the donor: it asks whether the scheduling context that owns
> the CPU has used up its slice. The running task is only borrowing the
> CPU through proxy, so its slice is not the one we care about here.
>

Got it, I see.

> Maybe something like below (only compile tested) to fix the issue.
> That said, this is somewhat orthogonal to the issue that the execution context
> series is trying to solve. It should be fixed separately.
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 8dff37059faf..cd240bf52d03 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -14748,10 +14748,29 @@ static void rq_offline_fair(struct rq *rq)
>  static inline bool
>  __entity_slice_used(struct sched_entity *se, int min_nr_tasks)
>  {
> -	u64 rtime = se->sum_exec_runtime - se->prev_sum_exec_runtime;
> -	u64 slice = se->slice;
> +	u64 vslice, vused;
>  
> -	return (rtime * min_nr_tasks > slice);
> +	/*
> +	 * @se is the scheduling context (rq->donor). Under proxy execution
> +	 * it need not be the task executing on the CPU, so its
> +	 * sum_exec_runtime is not advanced and cannot be used to tell how
> +	 * much of its slice it has consumed. Its vruntime, however, is
> +	 * advanced by update_curr() with the proxy runtime, and its EEVDF
> +	 * deadline reflects the granted slice, so measure the consumed
> +	 * fraction in virtual time instead.
> +	 *
> +	 * This is equivalent to the previous real-time comparison in the
> +	 * non-proxy case: both @vused and @vslice are scaled by the same
> +	 * weight factor, so the ratio (and thus the min_nr_tasks test) is
> +	 * unchanged.
> +	 */
> +	if (vruntime_cmp(se->vruntime, ">=", se->deadline))
> +		return true;
> +
> +	vslice = calc_delta_fair(se->slice, se);
> +	vused = vslice - (se->deadline - se->vruntime);
> +
> +	return (vused * min_nr_tasks > vslice);
>  }

This fix looks good to me. And just one minor question that I'm
trying to figure out:

Consider that there is only one running task p on one of the SMT siblings.
The original comparison is between:
se->sum_exec_runtime - se->prev_sum_exec_runtime vs slice,
and since there is only one runnable task, p continues to run
without any preemption, so se->prev_sum_exec_runtime remains
unchanged, while se->sum_exec_runtime moves forward. Therefore,
the duration delta of se->sum_exec_runtime - se->prev_sum_exec_runtime
could expand to many slices in theory.
After switching to the vruntime-based comparison, even
if p has not been preempted, se->deadline together with se->vruntime
will move forward by update_dealine(). That is to say, we now only
consider the delta within one slice. This seems to tighten the
restriction for task_tick_core() to trigger a force reschedule.
But Overall I think it should not be a good deal to check
within a slice period.

thanks,
Chenyu
