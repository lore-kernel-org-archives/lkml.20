Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3238330301
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263744; cv=none; b=OmUSd2HvxyoDzVC3rtX/dEBABftPcxQAr2DmJ9KGOfPYYPyPN23nBCot26JdTFzJU0ew9E1evAzSH3Mc4BpydQKe93b7PIzZLF/E9qElraVsq3KroTzW/xdV/+Qws7r4CwXFls+4ZHC/ZKs8aWvkq8p4kKWUJR60gO9DQld2JcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263744; c=relaxed/simple;
	bh=kPkMLXXosDdWxgaTXdQY6oNEPdCQELIHs7pk7GBU1c0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ReYnNtOBY0roJUNJ6maP88YGJaZDwJlg5ockZ9HkmmAxHIYHJkjzYbGaYjHtJIrclUoETicb59Q/eliiYBX5hR8EHOOHFKwj+qyFQj1pxwH7emMEik7SZSdpdfOVN8nfJOZcrVoth+UCViocwhK7hXgvM7hfoFEZnHWJNFPlNiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hZ46w2p96z19hDf;
	Tue,  1 Sep 2026 19:55:20 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hZ46v5V5Zz19hDf;
	Tue,  1 Sep 2026 19:55:19 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id ABDCF331318B;
	Tue,  1 Sep 2026 19:51:28 +0800 (CST)
Received: from cncheex04.Hygon.cn (172.23.18.114) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 1 Sep
 2026 19:55:20 +0800
Received: from cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d]) by
 cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d%10]) with mapi id
 15.02.1544.036; Tue, 1 Sep 2026 19:55:20 +0800
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
Subject: RE: [RFC PATCH v2 10/23] sched/topology: Add per-sd scratch for the
 load balance affinity score
Thread-Topic: [RFC PATCH v2 10/23] sched/topology: Add per-sd scratch for the
 load balance affinity score
Thread-Index: AQHdNiBDy0ERu3mi6UyRqHFq3CjCPLa43gQAgADGn7A=
Date: Tue, 1 Sep 2026 11:55:20 +0000
Message-ID: <474b22fa14554c4eac6f8d59edfc678f@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-11-wujianyong@hygon.cn>
 <20260901080210.GP4120091@noisy.programming.kicks-ass.net>
In-Reply-To: <20260901080210.GP4120091@noisy.programming.kicks-ass.net>
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
> Sent: Tuesday, September 1, 2026 4:02 PM
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
> Subject: Re: [RFC PATCH v2 10/23] sched/topology: Add per-sd scratch for
> the load balance affinity score
>=20
> On Thu, Aug 27, 2026 at 08:28:03PM +0800, Jianyong Wu wrote:
> > The affinity score computed during load balancing needs two small
> arrays,
> > one entry per LLC: the LLCs that sit closer to the balance destination =
than
> > to the source, and the weight of each. Their size is only known once th=
e
> > sched domains have been built, which is why the load balancer currently
> has
> > to allocate them on every call.
> >
> > Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
> > ---
> >  include/linux/sched/topology.h |  6 ++++++
> >  kernel/sched/topology.c        | 28 +++++++++++++++++++++++++++-
> >  2 files changed, 33 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/sched/topology.h
> b/include/linux/sched/topology.h
> > index b31d2cf16592..569ff562dbdb 100644
> > --- a/include/linux/sched/topology.h
> > +++ b/include/linux/sched/topology.h
> > @@ -122,6 +122,12 @@ struct sched_domain {
> >  	unsigned int *llc_counts __counted_by_ptr(llc_max);
> >  	unsigned long llc_bytes;
> >  	unsigned int *numa_counts;
> > +	/*
> > +	 * Scratch for the load balance affinity score, llc_max entries each.
> > +	 * Only the bottom sd owns them, like llc_counts above.
> > +	 */
> > +	int *affi_ids;
> > +	int *affi_weights;
>=20
> Per the below, these should also have: __counted_by_ptr(llc_max), right?

Right. These arrays contain llc_max entries and are only used when llc_max =
is non-zero. I will add the missing __counted_by_ptr(llc_max) annotation.

Thanks
Jianyong
>=20
> >  #endif
>=20
> > +		p_ids =3D kcalloc_node(max_lid + 1, sizeof(int),
> > +				 GFP_KERNEL, cpu_to_node(i));
> > +		p_w =3D kcalloc_node(max_lid + 1, sizeof(int),
> > +				 GFP_KERNEL, cpu_to_node(i));


