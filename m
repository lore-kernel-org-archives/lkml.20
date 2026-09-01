Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837E518FDDE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265441; cv=none; b=UjuS5QA2zo7tFU8DXS2adz3j21S4e5SOKA+ylNIm/HFP2pb1ZiTdmIUK5yqspXSoI2o/0zMr2F9yhY2UaHbjaPQD0TrqfRB0rt6TqG1UfwobaiaGyQc1iuDOylQ97HUO5AEG2MzNoNCLJtt//lLB1ukZ10qQNE6zCKsDjIknwjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265441; c=relaxed/simple;
	bh=hgHF9hvpZGsOvKeMdy5XX7liSca4vUhz9S3bR2C7cV0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YHMJLoZVfj2Ny7SXn6LraoJi8ajTm6nx5u16pRx9mkCPA/CU/FDllAl7obL6NlNpZcA7GCLUHEuPDfHwO5BmMm6aWUNQArFeKSzdCcgd16fj1DOBJk4vTCRh6Z0ZQ7CgBg2iOj2cBVkTMLn8G8+qsb8RZBbfHy32x02tBvBQRF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hZ4lZ3qqrz1PGCt;
	Tue,  1 Sep 2026 20:23:38 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hZ4lY1Cj5z1PvqJ;
	Tue,  1 Sep 2026 20:23:37 +0800 (CST)
Received: from cncheex05.Hygon.cn (unknown [172.23.18.115])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id 0C1653104808;
	Tue,  1 Sep 2026 20:19:46 +0800 (CST)
Received: from cncheex04.Hygon.cn (172.23.18.114) by cncheex05.Hygon.cn
 (172.23.18.115) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 1 Sep
 2026 20:23:37 +0800
Received: from cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d]) by
 cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d%10]) with mapi id
 15.02.1544.036; Tue, 1 Sep 2026 20:23:37 +0800
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
Subject: RE: [RFC PATCH v2 12/23] sched/cache: Introduce rq affinity gain
 calculation
Thread-Topic: [RFC PATCH v2 12/23] sched/cache: Introduce rq affinity gain
 calculation
Thread-Index: AQHdNiBG+fpHPMsZSUaXodgYa50Q5ra4/pAAgACsOzA=
Date: Tue, 1 Sep 2026 12:23:37 +0000
Message-ID: <97476ef46a42491f83599fac8fe4c8d6@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-13-wujianyong@hygon.cn>
 <20260901095840.GR4120091@noisy.programming.kicks-ass.net>
In-Reply-To: <20260901095840.GR4120091@noisy.programming.kicks-ass.net>
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
> Sent: Tuesday, September 1, 2026 5:59 PM
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
> Subject: Re: [RFC PATCH v2 12/23] sched/cache: Introduce rq affinity gain
> calculation
>=20
> On Thu, Aug 27, 2026 at 08:28:05PM +0800, Jianyong Wu wrote:
>=20
> >  #ifdef CONFIG_SCHED_CACHE
> > +extern int max_lid;
> >  /*
> >   * Record the statistics for this scheduler group for later
> >   * use. These values guide load balancing on aggregating tasks
> > @@ -11998,6 +11999,174 @@ static bool update_llc_busiest(struct
> lb_env *env,
> >  	 */
> >  	return sgs->nr_pref_dst_llc > busiest->nr_pref_dst_llc;
> >  }
> > +
> > +/*
> > + * Get all LLCs that are closer to the destination LLC than to the
> > + * source LLC inside a NUMA.
> > + */
> > +static int get_affi_llcs(struct sched_domain *sd, int src_llc, int dst=
_llc,
> > +			 int *affi_llcs, int *affi)
> > +{
> > +	int j =3D 0, src_dist, dst_dist, cur_node;
> > +
> > +	if (src_llc =3D=3D dst_llc || sd->flags & (SD_NUMA | SD_SHARE_LLC))
> > +		return 0;
> > +
> > +	cur_node =3D llc_to_node(src_llc);
> > +	if (cur_node !=3D llc_to_node(dst_llc))
> > +		return 0;
> > +
> > +	for (int i =3D 0; i <=3D max_lid; i++) {
>=20
> This isn't safe. max_lid isn't stable, you should use sd->llc_max which
> matches the actual allocation size of sd->llc_counts.

Yes, max_lid isn't stable. But get_affi_llcs() receives env->sd, whose
llc_max is 0 - llc_max is only set on the base sched domain (rq->sd).
Since calc_affinity_llc_score() already holds that base sd, I'll pass its
llc_max down to get_affi_llcs() as a parameter.

Thanks
Jianyong


