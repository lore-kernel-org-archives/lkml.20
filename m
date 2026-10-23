Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792726582;
	b=vagx0nmskHhGV+6wAhUePwJ5LAz26TxDNlEWEKaQulT+qi4Qu+JAdS89rjg45XsBYSQE
	 IBhDO+i10rBWc9305PXCd0Izj9uLOGJr406FYr1rSbjA5H/lVKybF97l2KeuTvDaohA//
	 b6JD3b7Ao8w1BZAEDPnyRKD2C0mWg2z6DVJVKdK5ikzUn/6xoC5hoLCVOkkL6ql4uOFQG
	 D4N9l29mQh5oHW4AppB4O6cJ79E1rVxUGsK+IepdkoxtLGi6IcRfa6wTNJLV19kZqkxbU
	 f6HOyB8lRd6KmpkU6MF2Q1fnvQnWRbr+slNa5MHP0XJTywhkIYTXS6NJSzg/2pnbYpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792726582;
	h=DMARC-Filter:Received:Received:Received:Received:Received:From:To:CC:
	 Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-originating-ip:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=7ifxDBexjlAFq0DGvf8En0rkTMN3cr12jODWP2ATNHg=;
	b=iO/IWEXDhMFuNBp06LXBKnxNyIi9x821xq0Cl11RU1ylk+cDR/mxoyVAUtCwsQhW+0tK
	 aKrklxI199cTPP8HfhJG6hd7+MLVsV4rw+rxlnEFMefczK7cmHkBwyKAVHWaSiaLYIQwZ
	 c1GtN6psKVcdQdKVbi1Z/99HiLhRjWiUBtGpVhhIWO37ooCH4Pxi/wWILS43xixIJAXGQ
	 hJ+CV6lA/Bshmvt3ykgXp6Z3CuOqSQetthkmnBDJIJlzojk7Tdk6/P2QMHH9UmxiIRoFz
	 IGgzRSp11NZG0YH2lZ+xelcS2mhaHldUsU3Sbmx0u45pdR+izLnAX65a9ABr6HRrcXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EA8606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0EA8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4j9pZq5dFdzg1cQ;
	Fri, 23 Oct 2026 11:36:03 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by spam01.hygon.cn (Postfix) with ESMTP id 4j9pZn1qcCzg1cQ;
	Fri, 23 Oct 2026 11:36:01 +0800 (CST)
Received: from cncheex06.Hygon.cn (unknown [172.23.18.116])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id D2A051655;
	Fri, 23 Oct 2026 11:35:51 +0800 (CST)
Received: from cncheex04.Hygon.cn (172.23.18.114) by cncheex06.Hygon.cn
 (172.23.18.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 23 Oct
 2026 11:36:01 +0800
Received: from cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d]) by
 cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d%10]) with mapi id
 15.02.1544.036; Fri, 23 Oct 2026 11:36:01 +0800
From: Jianyong Wu <wujianyong@hygon.cn>
To: Chen Yu <yu.c.chen@intel.com>
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
	<justin.he@arm.com>, "chen.yu@linux.dev" <chen.yu@linux.dev>
Subject: RE: [RFC PATCH v2 02/23] sched/topology: Introduce a NUMA distance
 matrix with unique distance values
Thread-Topic: [RFC PATCH v2 02/23] sched/topology: Introduce a NUMA distance
 matrix with unique distance values
Thread-Index: AQHdNiA3jheQVPdvikWpN4gB9aTKG7a3i1wAgCMFioCAAQKWYIAAjPiAgADjB/CAAIHNgIAF/bTAgAVsM4CACnnIsIAAKraAgBcFEeA=
Date: Fri, 23 Oct 2026 03:36:00 +0000
Message-ID: <854b5714024b4d5b97be916b740ce003@hygon.cn>
References: <20260827122816.756234-3-wujianyong@hygon.cn>
 <20260831115004.GF776954@noisy.programming.kicks-ass.net>
 <da32ba66d95fd88869ba052f97698b9a4d6c3dc6.camel@linux.intel.com>
 <09261c8222994a41a04ace5f342475df@hygon.cn>
 <ce95ec57af9dfaf4d9ed604ad7337441a543f538.camel@linux.intel.com>
 <f6ebab3d0e44412dad17ac64a3b93339@hygon.cn>
 <112e526b4013e23c70adf5b8883db8e75358b473.camel@linux.intel.com>
 <8a0c239b5bdf40c99b645087dec8fd18@hygon.cn>
 <2a120db1b0c052eb88dcbc2ed1de6027a16542b4.camel@linux.intel.com>
 <4d2b5dede1f64350ac17ea9d0a5428a1@hygon.cn> <asfGTaJjCGMLW6fp@chenyu-dev>
In-Reply-To: <asfGTaJjCGMLW6fp@chenyu-dev>
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
> Sent: Friday, October 9, 2026 12:35 AM
> To: Jianyong Wu <wujianyong@hygon.cn>
> Cc: Tim Chen <tim.c.chen@linux.intel.com>; Peter Zijlstra
> <peterz@infradead.org>; Ingo Molnar <mingo@redhat.com>; Juri Lelli
> <juri.lelli@redhat.com>; Vincent Guittot <vincent.guittot@linaro.org>;
> Dietmar Eggemann <dietmar.eggemann@arm.com>; Steven Rostedt
> <rostedt@goodmis.org>; Ben Segall <bsegall@google.com>; Mel Gorman
> <mgorman@suse.de>; Valentin Schneider <vschneid@redhat.com>; K
> Prateek Nayak <kprateek.nayak@amd.com>; Shrikanth Hegde
> <sshegde@linux.ibm.com>; Phil Auld <pauld@redhat.com>; Andrew
> Morton <akpm@linux-foundation.org>; David Hildenbrand
> <david@kernel.org>; linux-kernel@vger.kernel.org; linux-mm@kvack.org;
> jianyong.wu@outlook.com; Yuan Zhong <zhongyuan@hygon.cn>; Huangsj
> <huangsj@hygon.cn>; Fengyu Wang <wangfengyu@hygon.cn>; Zhiwei Ying
> <yingzhiwei@hygon.cn>; justin.he@arm.com; chen.yu@linux.dev
> Subject: Re: [RFC PATCH v2 02/23] sched/topology: Introduce a NUMA
> distance matrix with unique distance values
>=20
> Hi Jianyong,
>=20
> On Thu, Oct 08, 2026 at 07:35:10AM +0000, Jianyong Wu wrote:
> > Hi Tim,
> >
> > > -----Original Message-----
> > > From: Tim Chen <tim.c.chen@linux.intel.com>
> > > Sent: Friday, October 2, 2026 6:04 AM
> > > To: Jianyong Wu <wujianyong@hygon.cn>; Peter Zijlstra
> > > <peterz@infradead.org>
> > > Cc: Ingo Molnar <mingo@redhat.com>; Juri Lelli
> <juri.lelli@redhat.com>;
> > > Vincent Guittot <vincent.guittot@linaro.org>; Chen Yu
> > > <yu.c.chen@intel.com>; Dietmar Eggemann
> > > <dietmar.eggemann@arm.com>; Steven Rostedt
> <rostedt@goodmis.org>;
> > > Ben Segall <bsegall@google.com>; Mel Gorman <mgorman@suse.de>;
> > > Valentin Schneider <vschneid@redhat.com>; K Prateek Nayak
> > > <kprateek.nayak@amd.com>; Shrikanth Hegde
> <sshegde@linux.ibm.com>;
> > > Phil Auld <pauld@redhat.com>; Andrew Morton
> > > <akpm@linux-foundation.org>; David Hildenbrand
> <david@kernel.org>;
> > > linux-kernel@vger.kernel.org; linux-mm@kvack.org;
> > > jianyong.wu@outlook.com; Yuan Zhong <zhongyuan@hygon.cn>;
> Huangsj
> > > <huangsj@hygon.cn>; Fengyu Wang <wangfengyu@hygon.cn>; Zhiwei
> Ying
> > > <yingzhiwei@hygon.cn>; justin.he@arm.com
> > > Subject: Re: [RFC PATCH v2 02/23] sched/topology: Introduce a NUMA
> > > distance matrix with unique distance values
> > >
> > > On Mon, 2026-09-28 at 09:39 +0000, Jianyong Wu wrote:
> > > > Hi Tim,
> > > >
> > > >
> > > > Makes sense. So, what about the following solution?
> > > > Given a node affinity sequence, a move from src to dst improves the
> > > > affinity of every task whose preferred node i ranks dst better than
> src.
> > > The score
> > > > is then
> > > >
> > > > Di =3D raw_dist(src, i) - raw_dist(dst, i)
> > > > affinity_bias_i =3D position of src minus position of dst in node i=
's
> affinity
> > > >              sequence, counted among the nodes at the same
> > > distance from
> > > >              i (zero when Di is not zero)
> > >
> > > Do we really need an affinity bias?  I think your intention is to use=
 it
> for
> > > breaking a tie.
> > > If there is a tie in affinity score (without injecting bias),
> > > just use the position diff to break the tie.  Having a bias distorts
> > > the affinity score.
> > >
> > >
> > I think there is a misunderstanding about the purpose of the bias.
> > It is not intended to break ties between affinity scores. I want the
> > score itself to reflect opportunities for aggregation, including moves
> > that leave the raw NUMA distance unchanged but follow the fixed node
> > affinity order.
> >
> > That said, I agree with your concern about using artificial node
> > distances in the score calculation. The magnitude of an artificial
> > distance or rank difference should not determine the weight of those
> > aggregation opportunities.
> >
>=20
> Thanks a lot for working on this.
>=20
> I think there are two level of aggregation:
> LLCs aggregation, and Node aggregation.
>=20
> Your current proposal uses a best-effort strategy for multi-LLC/node
> aggregation. It tries to migrate towards a preferred LLC mask, and the
> size of the LLC/node mask is the "range" you calculated in
> task_cache_work().
>=20
> Take the LLC case, for example. Suppose there are 6 LLCs, and in
> task_cache_work(), the range is calculated as 3 for process P, which mean=
s
> that at most 3 LLCs can hold all the threads of P.
>=20
> The strategy allows load balancing to move into the preferred LLC
> mask/range
> in random order:
>=20
> suppose the util of each LLCs are:
> LLC0: 45% LLC1: 40%  LLC2: 30%
>=20
>    migrate task from LLC4 to LLC1? OK
>    migrate task from LLC4 to LLC0? OK
>    migrate task from LLC2 to LLC0? OK
>    migrate task from LLC0 to LLC1? no
>    ...
>=20
> My understanding is that the introduction of distance comparison is
> because the NUMA nodes are not symmetric to each other, so you need a
> realistic sequence to saturate the nodes. However, this might not be
> true for LLCs - they are symmetric, and you can start with a pref CPU
> and get the next LLC via the LLC id sequence. That is to say,
> dist(LLC1, LLC2) =3D (rank1 + rank2) % k + 1 is not mandatory. Why not
> just generate the preferred_mask by adding the "range" siblings of the
> preferred LLC, and use preferred_mask directly during load balance?
> That seems to be straightforward. So we can get rid of the distance
> comparison (at least for LLCs).
>=20

v3 no longer introduces artificial distance values, at either the node or
the LLC level. Ties are now broken with triangular numbers, which
simplifies the ordering.

Thanks
Jianyong

> thanks,
> Chenyu


