Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854255;
	b=AH+MJqtvHgXsRFIZnQkKgMIycsf9Ajumt7oCUje6Aet483wNt4YUA77IRoO7DGpsTXda
	 vMkpnOC+xeDG75gzGyt5FMKNWgqYmmZseeabgRzEGnWb0fWHZRnZ+BuM2cUM8/Rw3Ds00
	 MNWROHmtQyE0LtNlbOk1FReM5/nRRO4h7TDIIJtDz57iA3Z70CVrt5OJCSOuXtZJQ/3g3
	 sPoYIT99/GgKAgss86EKFYGnqZcVvHiaLU2HayuS4N+HgyhtdP+gEHwEmU7dpVrNSZuKy
	 3++wWg/dABTgOQ6IfaSSqydlZuEBMbmcGpaRPySuf7sOQKQZxAFWL7aC0dm1JjWi2XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854255;
	h=DMARC-Filter:Received:Received:Received:Received:Received:From:To:CC:
	 Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-originating-ip:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=a15eZ1GO5RhdStmXnLAyIP5/wcZSQKnyYEDvHOYqII0=;
	b=AwVpbOOYHgWp0FRanWObXS/cKWnz0vwvfUf86Je0ER8z7p/wO3PWrWcCSvYnFUdUSswL
	 G/NMxBV/kOU8sV5oQP/IDG1WW5zke56vVtmVLo+dqSteX/0PdAzpi9nz442hUzg1hKoo8
	 bUorTAvokyAvJqfmseuBiYkV2XojLgJJ5fiOLyqWpc0LUDKI0r84ww6KR26RhhynDyqFK
	 eBOUPsE0meeeg95Xr24np7ddj8pskipr8dWnV+QAsiHZrqOL7jIoG4KTUaSa0i1KN2pqs
	 0iWn97n0tswi3DGh9NLLaGbsQfI5DD7AkCa3Op4GqAYphK1PtGBzWgjEPH/aVYsnAxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BAC606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9BAC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jKqcs2TKhzwVJY;
	Thu,  5 Nov 2026 12:50:37 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jKqcq1HBfzwVJY;
	Thu,  5 Nov 2026 12:50:35 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id 388471549;
	Thu,  5 Nov 2026 12:50:27 +0800 (CST)
Received: from cncheex04.Hygon.cn (172.23.18.114) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 5 Nov
 2026 12:50:34 +0800
Received: from cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d]) by
 cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d%10]) with mapi id
 15.02.1544.036; Thu, 5 Nov 2026 12:50:34 +0800
From: Jianyong Wu <wujianyong@hygon.cn>
To: Chen Yu <yu.c.chen@intel.com>
CC: "mingo@redhat.com" <mingo@redhat.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "juri.lelli@redhat.com" <juri.lelli@redhat.com>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
	"tim.c.chen@linux.intel.com" <tim.c.chen@linux.intel.com>,
	"dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>, "rostedt@goodmis.org"
	<rostedt@goodmis.org>, "bsegall@google.com" <bsegall@google.com>,
	"mgorman@suse.de" <mgorman@suse.de>, "vschneid@redhat.com"
	<vschneid@redhat.com>, "kprateek.nayak@amd.com" <kprateek.nayak@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"jianyong.wu@outlook.com" <jianyong.wu@outlook.com>, Yibin Liu
	<liuyibin@hygon.cn>, Yuan Zhong <zhongyuan@hygon.cn>
Subject: RE: [PATCH] sched/cache: Fix group_llc_balance being unreachable
 above the first NUMA level
Thread-Topic: [PATCH] sched/cache: Fix group_llc_balance being unreachable
 above the first NUMA level
Thread-Index: AQHdbGdEfgKK63ccNEKIGUO+lEtYvrceRcQAgACNj1A=
Date: Thu, 5 Nov 2026 04:50:34 +0000
Message-ID: <dd193a850d164b02889fbcfafc556623@hygon.cn>
References: <20261104141313.185433-1-wujianyong@hygon.cn>
 <auvyMJU02aAFRB6P@chenyu-dev>
In-Reply-To: <auvyMJU02aAFRB6P@chenyu-dev>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Chenyu,

> -----Original Message-----
> From: Chen Yu <yu.c.chen@intel.com>
> Sent: Thursday, November 5, 2026 11:04 AM
> To: Jianyong Wu <wujianyong@hygon.cn>
> Cc: mingo@redhat.com; peterz@infradead.org; juri.lelli@redhat.com;
> vincent.guittot@linaro.org; tim.c.chen@linux.intel.com;
> dietmar.eggemann@arm.com; rostedt@goodmis.org; bsegall@google.com;
> mgorman@suse.de; vschneid@redhat.com; kprateek.nayak@amd.com;
> linux-kernel@vger.kernel.org; jianyong.wu@outlook.com; Yibin Liu
> <liuyibin@hygon.cn>; Yuan Zhong <zhongyuan@hygon.cn>
> Subject: Re: [PATCH] sched/cache: Fix group_llc_balance being unreachable
> above the first NUMA level
>=20
> Hi Jianyong,
>=20
> On Wed, Nov 04, 2026 at 10:13:13PM +0800, Jianyong Wu wrote:
> > sched_balance_find_src_group() only considers group_llc_balance when
> > sds.prefer_sibling is set:
> >
> > 	if (sds.prefer_sibling && local->group_type =3D=3D group_has_spare &&
> > 	    (busiest->group_type =3D=3D group_llc_balance ||
> > 	     sibling_imbalance(env, &sds, busiest, local) > 1))
> > 		goto force_balance;
> >
> > sds.prefer_sibling mirrors SD_PREFER_SIBLING of the busiest group's
> child
> > sched domain, and sd_init() clears that flag on every SD_NUMA domain.
> > So on any domain whose child is itself a NUMA domain, i.e. on systems
> > with more than one NUMA level such as multiple nodes per socket,
> groups
> > tagged with group_llc_balance by llc_balance() can never take the
> > force_balance path, and the group_llc_balance test there is dead code.
> >
> > Such a group falls into the !group_overloaded branch below and in the
> > common case ends up in out_balanced, so a task that was placed
> beyond
> > the first NUMA level is never pulled into its preferred LLC.
> >
> > On a 2-socket Hygon system (8 nodes, 32 LLCs, 4 cores per LLC), with
> > "spin 3"/"spin 4" (3/4 busy threads of one process), all threads were
> > in one LLC in only 41/140 and 0/142 samples; every failing case had a
> > straggler on the other socket. With this patch: 195/196 and 180/196.
> >
> > Only require sds.prefer_sibling for the sibling_imbalance() case, which
> > is what it was originally introduced for.
> >
> > Fixes: f38cc2f0d8a3 ("sched/cache: Prioritize tasks preferring destinat=
ion
> LLC during balancing")
>=20
> This patch looks reasonable. Is this an enhancement rather than a fix?
> Before this patch,
> NUMA node task aggregation is disabled and task aggregation across SNC
> nodes (Intel) or
> level1 Nodes (AMD, Hygon with NPS2/3...) is enabled. After this patch,
> both the NUMA level and the
> SNC level enable task aggregation.

Right, it enables aggregation at the NUMA level too, so it can be seen as a=
n
enhancement. I'll drop the "Fixes:" tag.

> Maybe some benchmark results in the
> next version would
> be helpful to indicate that no regression is found while there is benefit=
 on
> multi-node
> domain systems (NUMA balancing enabled/disabled, etc.).
>=20

Sure, I'll run benchmarks with NUMA balancing on and off and include the
numbers in v2.

Thanks
Jianyong

