Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28B04CCDDD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249944; cv=none; b=fWWbJjzlCE2dfd10Re3QYFiHZ9FQ41AciqMmJHjMnAcYcSsr45fqIioS372XqIrDg9nVpbqcI957SN7u7a1leGuiIFtW/2we/AgTEy6n0LF63gd4Y4fd0f5cIm6kZotP9YMqtgZhKr45tiSwPTA3yGEFWZFZFwlmYnCaHPBoun8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249944; c=relaxed/simple;
	bh=IjfA1fxSXaT1NDKdzwoU1MH5kx2wH1EC2314OuUQCv8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ox/ejpPS8MpzbBBa474MbjoP0Ii3mjnFVCA55xl1kq4FjM0VhSR/SEg59dEzc3S9DLzabdKz6WoR9eFtl49NcilOggPYoQG1ZN8d6hga6eoednHbUHj7ERV50iXZSpO4ex73B1a3+IcfkX/fgy4UTO/3EODfCYr58GJtH9j41tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hYz1Z6Qwmz1PvqY;
	Tue,  1 Sep 2026 16:05:22 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hYz1Z4T9pz1PvqY;
	Tue,  1 Sep 2026 16:05:22 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id C830F30004D2;
	Tue,  1 Sep 2026 16:01:30 +0800 (CST)
Received: from cncheex04.Hygon.cn (172.23.18.114) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 1 Sep
 2026 16:05:22 +0800
Received: from cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d]) by
 cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d%10]) with mapi id
 15.02.1544.036; Tue, 1 Sep 2026 16:05:22 +0800
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
Subject: RE: [RFC PATCH v2 07/23] sched/cache: Prioritize preferred NUMA node
 selection over LLC selection
Thread-Topic: [RFC PATCH v2 07/23] sched/cache: Prioritize preferred NUMA node
 selection over LLC selection
Thread-Index: AQHdNiA/Gl7/wvc7qkaJjcGUBBSfi7a3pS6AgAG8IqA=
Date: Tue, 1 Sep 2026 08:05:22 +0000
Message-ID: <82a9b1c118424a48a0b70439ddae6905@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-8-wujianyong@hygon.cn>
 <20260831132229.GL4120091@noisy.programming.kicks-ass.net>
In-Reply-To: <20260831132229.GL4120091@noisy.programming.kicks-ass.net>
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

Hi Peter,

> -----Original Message-----
> From: Peter Zijlstra <peterz@infradead.org>
> Sent: Monday, August 31, 2026 9:22 PM
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
> Subject: Re: [RFC PATCH v2 07/23] sched/cache: Prioritize preferred NUMA
> node selection over LLC selection
>=20
> On Thu, Aug 27, 2026 at 08:28:00PM +0800, Jianyong Wu wrote:
> > In the current implementation, the preferred LLC is selected based on t=
he
> > LLC with the largest running time of the thread group. However, the
> > preferred LLC may be prone to frequent migration when the workload
> > spreads across the entire system, especially when the number of CPUs
> > sharing an LLC is small. A better approach is to first select a preferr=
ed
> > NUMA node in the same way, and then select the preferred LLC within
> that
> > preferred NUMA node.
>=20
> Hmm, if we're going to look at nodes, should we not also consider the
> numa balancing preferred node, and perhaps priorize an llc inside that
> nore, rather than the occupancy wise busiest node?
>=20

The NUMA balancing preferred node is already covered by the scan:
get_scan_cpumasks() folds p->numa_preferred_nid (plus the node of the
current preferred LLC and the current running node) into the scan mask,
so it is not ignored - it is one of the candidates. And it filters out othe=
r no
related nodes.

The reason I don't hard-prioritize it is that numa_preferred_nid is
per-task while the preferred LLC is per-process. Different threads of the
same process can hold different preferred nodes, so prioritizing any one
of them would make the process-wide preferred LLC bounce between nodes.
So instead I include the NUMA balancing preferred node as a candidate and
let occupancy decide among them.

>=20
> > -				a_occ +=3D occ;
> > -				if (occ > m_occ) {
> > -					m_occ =3D occ;
> > -					m_cpu =3D i;
> > +					a_occ +=3D occ;
> > +					if (occ > m_occ) {
> > +						m_occ =3D occ;
> > +						m_cpu =3D i;
> > +					}
> > +
> > +					cur =3D rcu_dereference_all(cpu_rq(i)->curr);
> > +					if (cur && !(cur->flags & (PF_EXITING |
> PF_KTHREAD)) &&
> > +					    cur->mm =3D=3D mm)
> > +						nr_running++;
> >  				}
>=20
> This level of indenting seems to suggest perhaps breaking things out
> into a helper function?

Agreed, the nesting got too deep. I'll factor the inner LLC occupancy
scan out into a helper function in the next revision.

Thanks
Jianyong

