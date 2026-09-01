Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1972237C906
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250515; cv=none; b=igMNJBnYYUuOwPfZO4TsGiqq+X0pD83ICduw+QGcQiJruXxgAiKovUwOoa83h9FusE21hBaDBkkmmoBuxJuhqDiDPbUuOuXqen00gpxUWOcV5Ef/2NWPuYTeObLBkJ/qwULH0/6m8RgpjUC8FRZWl1GIK0FoJnrFfa11o29PtfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250515; c=relaxed/simple;
	bh=PnTybXhaMNxD9tW+KPeCdr+ySDqwBDy0OhqP70QS2b0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kCLtK9bydv0v19jEVOYJzggG9WtT1S6M5LaK6ZPFsS/JOznlb+QJSrrW5fkk8VXdcOIJVLVXX/muWwf3r1c6q0YfZyGpI92dFMU66wp9sJouW3j+MIXHJTlqPEj1jeBVJVh6a/QvOntFol92gg4FEzf/Wb3WRonI7Srw93GIVDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hYzDb6jm5z1PGD2;
	Tue,  1 Sep 2026 16:14:55 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hYzDY5LFnz1PGCN;
	Tue,  1 Sep 2026 16:14:53 +0800 (CST)
Received: from cncheex06.Hygon.cn (unknown [172.23.18.116])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id 8A73B16EC;
	Tue,  1 Sep 2026 16:14:48 +0800 (CST)
Received: from cncheex04.Hygon.cn (172.23.18.114) by cncheex06.Hygon.cn
 (172.23.18.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 1 Sep
 2026 16:14:53 +0800
Received: from cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d]) by
 cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d%10]) with mapi id
 15.02.1544.036; Tue, 1 Sep 2026 16:14:53 +0800
From: Jianyong Wu <wujianyong@hygon.cn>
To: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, Chen Yu <yu.c.chen@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, "Shrikanth
 Hegde" <sshegde@linux.ibm.com>, Phil Auld <pauld@redhat.com>, Andrew Morton
	<akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "jianyong.wu@outlook.com"
	<jianyong.wu@outlook.com>, Yuan Zhong <zhongyuan@hygon.cn>, Huangsj
	<huangsj@hygon.cn>, Fengyu Wang <wangfengyu@hygon.cn>, Zhiwei Ying
	<yingzhiwei@hygon.cn>, "justin.he@arm.com" <justin.he@arm.com>
Subject: RE: [RFC PATCH v2 08/23] sched/topology: Introduce a per-CPU tasks
 NUMA preferred counter
Thread-Topic: [RFC PATCH v2 08/23] sched/topology: Introduce a per-CPU tasks
 NUMA preferred counter
Thread-Index: AQHdNiBA7oAH9eDim06x96D0XIAuLra3pXGAgAHAgtA=
Date: Tue, 1 Sep 2026 08:14:53 +0000
Message-ID: <20587720d03445f7bfb9f25f4b4826df@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-9-wujianyong@hygon.cn>
 <20260831132325.GM4120091@noisy.programming.kicks-ass.net>
In-Reply-To: <20260831132325.GM4120091@noisy.programming.kicks-ass.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



> -----Original Message-----
> From: Peter Zijlstra <peterz@infradead.org>
> Sent: Monday, August 31, 2026 9:23 PM
> To: Jianyong Wu <wujianyong@hygon.cn>
> Cc: Ingo Molnar <mingo@redhat.com>; Juri Lelli <juri.lelli@redhat.com>;
> Vincent Guittot <vincent.guittot@linaro.org>; Chen Yu
> <yu.c.chen@intel.com>; Tim Chen <tim.c.chen@linux.intel.com>; Dietmar
> Eggemann <dietmar.eggemann@arm.com>; Steven Rostedt
> <rostedt@goodmis.org>; Ben Segall <bsegall@google.com>; Mel Gorman
> <mgorman@suse.de>; Valentin Schneider <vschneid@redhat.com>; K
> Prateek Nayak <kprateek.nayak@amd.com>; Shrikanth Hegde
> <sshegde@linux.ibm.com>; Phil Auld <pauld@redhat.com>; Andrew
> Morton <akpm@linux-foundation.org>; David Hildenbrand
> <david@kernel.org>; linux-kernel@vger.kernel.org; linux-mm@kvack.org;
> jianyong.wu@outlook.com; Yuan Zhong <zhongyuan@hygon.cn>; Huangsj
> <huangsj@hygon.cn>; Fengyu Wang <wangfengyu@hygon.cn>; Zhiwei Ying
> <yingzhiwei@hygon.cn>; justin.he@arm.com
> Subject: Re: [RFC PATCH v2 08/23] sched/topology: Introduce a per-CPU
> tasks NUMA preferred counter
>=20
> On Thu, Aug 27, 2026 at 08:28:01PM +0800, Jianyong Wu wrote:
> > Like the existed task LLC preferred counter, sd->llc_counts, introduce
> > sd->numa_counts to denotes the task number that prefer each NUMA
> node in
> > a certain rq.
> >
> > Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
> > ---
> >  include/linux/sched/topology.h |  1 +
> >  kernel/sched/topology.c        | 33
> +++++++++++++++++++++++++++------
> >  2 files changed, 28 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/linux/sched/topology.h
> b/include/linux/sched/topology.h
> > index b5d9d7c2b8ad..b31d2cf16592 100644
> > --- a/include/linux/sched/topology.h
> > +++ b/include/linux/sched/topology.h
> > @@ -121,6 +121,7 @@ struct sched_domain {
> >  	unsigned int llc_max;
> >  	unsigned int *llc_counts __counted_by_ptr(llc_max);
> >  	unsigned long llc_bytes;
> > +	unsigned int *numa_counts;
>=20
> This is missing a __counted_by_ptr() annotation ?

Right, I missed that. numa_counts is sized by nr_node_ids, so I'll add a
numa_max field to struct sched_domain and annotate it with
__counted_by_ptr(numa_max) in the next revision.

Thanks
Jianyong

