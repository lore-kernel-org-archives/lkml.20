Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D80931C567
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267778; cv=none; b=Yun8UFgH6IWMgGtQHlPVf+/QPehW8okEyR6kzokRff/a73jLKW6wMMXxRswSq/ouJVAbcIlxsN/lgvihq97Z/gmK10LZVufY4YlIeJnEOee0EGyzp769g3R+1xJxnZpfbWOHddlzrnZfxUtDsCyoERPNke5WNPYDe9+FuH8qttg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267778; c=relaxed/simple;
	bh=sI0Z4AmXxY1lZ7xDIPNV6mCKNYnkz787wrfj2YigtF8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TCwB9HUL+TTewNtRMrUuQdFEJq3WVNbLQsGwqR4DiOvwDXRabbYPIgqN5zP9uKSt6YKGs3tcudGh9DxbhFZnNnoWcLErRT4q0XRCclewEW5kUN1enGqPJTXx8wOCVR2UB9I0etFRpa4duH1ubUAnJWGy7tVipQMW/p40k2Uz+Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hZ5cS5Rgsz1PvqP;
	Tue,  1 Sep 2026 21:02:32 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hZ5cR38pyz1PvqP;
	Tue,  1 Sep 2026 21:02:31 +0800 (CST)
Received: from cncheex06.Hygon.cn (unknown [172.23.18.116])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id 40F5531D0309;
	Tue,  1 Sep 2026 20:58:40 +0800 (CST)
Received: from cncheex04.Hygon.cn (172.23.18.114) by cncheex06.Hygon.cn
 (172.23.18.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 1 Sep
 2026 21:02:32 +0800
Received: from cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d]) by
 cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d%10]) with mapi id
 15.02.1544.036; Tue, 1 Sep 2026 21:02:32 +0800
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
Thread-Index: AQHdNiBA7oAH9eDim06x96D0XIAuLra3pasAgAHCg5D//5zAgIAAsU4w
Date: Tue, 1 Sep 2026 13:02:32 +0000
Message-ID: <80ded281acca43a28043b261e850250c@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-9-wujianyong@hygon.cn>
 <20260831132414.GN4120091@noisy.programming.kicks-ass.net>
 <8eb55be5c1e9497c9f34f15436b9d665@hygon.cn>
 <20260901102127.GY687043@noisy.programming.kicks-ass.net>
In-Reply-To: <20260901102127.GY687043@noisy.programming.kicks-ass.net>
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
> Sent: Tuesday, September 1, 2026 6:21 PM
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
> On Tue, Sep 01, 2026 at 08:31:35AM +0000, Jianyong Wu wrote:
>=20
> > > On Thu, Aug 27, 2026 at 08:28:01PM +0800, Jianyong Wu wrote:
> > > > Like the existed task LLC preferred counter, sd->llc_counts, introd=
uce
> > > > sd->numa_counts to denotes the task number that prefer each
> NUMA node in
> > > > a certain rq.
> > > >
> > >
> > > To what purpose? Is not the node occupancy the direct sum of its
> > > constituent llc occupancy?
> >
> > numa_counts is used by the affinity score in patch 12. It holds, for ea=
ch
> > NUMA node, the number of tasks on this rq whose preferred LLC falls in
> > that node.
> >
> > You're right that numerically it equals the per-node sum of llc_counts.
> > The reason to keep it is granularity: NUMA-level load balance scores at
> > node granularity (numa_counts[node] * distance_delta), while
> NODE-level
> > balancing scores at LLC granularity (llc_counts[llc] * ...). Maintainin=
g
> > the node aggregate costs only a single llc_to_node() lookup (an O(1)
> > array read) plus one increment in enqueue/dequeue, whereas
> recomputing
> > the per-node sum would have to walk every LLC of a node each time the
> > NUMA-level score is evaluated.
>=20
> Consider the trade-off. Adding the accounting adds a cache-miss to every
> enqueue/dequeue, while re-computing the value on-demand adds some
> little
> cost to the balancing (slow) path.
>=20
> If the llc_counts[] array is dense in node order, then it is likely all
> relevant numbers are in a single line and computing the sum is in fact
> fairly cheap.

This is a good point. I was considering the number of operations, but not t=
he fact that the additional accounting is performed on every enqueue/dequeu=
e and may touch another cache line, while the summation is only needed on t=
he load balancing path.

Since numa_counts[] contains no information that cannot be derived from llc=
_counts[], I will rework the NUMA-level score to sum the constituent LLC co=
unters on demand and remove the additional numa_counts[] accounting.

Thanks
Jianyong

