Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855BD47142E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269146; cv=none; b=rkufIfqpCtccFSQ43ltnkIiU9Om/ruJS8uDJ5QSAxiypdWfEhU1v40GRqjyu6JYvrTP83fEh4gJXyJXdotpltP62IGJQdLxDVC0G70ptXPsL72/K82XOeQF7C/JSTrWsrhqXWk6rZvbkiuaZWjhDODuCxrt62o8HVqZh7XOak40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269146; c=relaxed/simple;
	bh=OSzpi44JqB5H4bqRSNRKk48DHmuO9XtaFtj5iBW1zCc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qZRtzv6T259hWmQUtRl8iVYC4i5BN5pSG2RNE0LFNojHHWCVdfO4B5P5LGzjgCkCZsvqtu39GHkv3ePadcK8saWD9SHV+h5FvF7KGgLzOSGuzcKzG+lzAQlPt6s9WYwQT93iYLDkvsuGlbTR3agYjlym/lZ8YvPDC0DC/J6K/Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hZ66q65M4z1PpLT;
	Tue,  1 Sep 2026 21:25:23 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hZ66p2cBZz1PGCm;
	Tue,  1 Sep 2026 21:25:22 +0800 (CST)
Received: from cncheex06.Hygon.cn (unknown [172.23.18.116])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id CFD2FB357;
	Tue,  1 Sep 2026 21:25:17 +0800 (CST)
Received: from cncheex04.Hygon.cn (172.23.18.114) by cncheex06.Hygon.cn
 (172.23.18.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 1 Sep
 2026 21:25:23 +0800
Received: from cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d]) by
 cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d%10]) with mapi id
 15.02.1544.036; Tue, 1 Sep 2026 21:25:23 +0800
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
Subject: RE: [RFC PATCH v2 14/23] sched/cache: Drop prefer_sibling restriction
 for llc_balance
Thread-Topic: [RFC PATCH v2 14/23] sched/cache: Drop prefer_sibling
 restriction for llc_balance
Thread-Index: AQHdNiBKk4QhTa7ViUqzXSOXSWPySra5Bx6AgACzrPA=
Date: Tue, 1 Sep 2026 13:25:22 +0000
Message-ID: <a064643f494b45c9bb0b8290308a1329@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-15-wujianyong@hygon.cn>
 <20260901102917.GH776954@noisy.programming.kicks-ass.net>
In-Reply-To: <20260901102917.GH776954@noisy.programming.kicks-ass.net>
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
> Sent: Tuesday, September 1, 2026 6:29 PM
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
> Subject: Re: [RFC PATCH v2 14/23] sched/cache: Drop prefer_sibling
> restriction for llc_balance
>=20
> On Thu, Aug 27, 2026 at 08:28:07PM +0800, Jianyong Wu wrote:
> > group_llc_balance performs balancing across LLC and NUMA domains.
> > The prefer_sibling constraint unnecessarily limits its scope, so remove
> > this requirement entirely from the branch condition.
> >
> > Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
> > ---
> >  kernel/sched/fair.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 584297528a9e..5c35a43e5e38 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -13274,9 +13274,9 @@ static struct sched_group
> *sched_balance_find_src_group(struct lb_env *env)
> >  	 * Try to move all excess tasks to a sibling domain of the busiest
> >  	 * group's child domain.
> >  	 */
> > -	if (sds.prefer_sibling && local->group_type =3D=3D group_has_spare &&
> > -	    (busiest->group_type =3D=3D group_llc_balance ||
> > -	    sibling_imbalance(env, &sds, busiest, local) > 1))
> > +	if (local->group_type =3D=3D group_has_spare &&
> > +	    ((busiest->group_type =3D=3D group_llc_balance) ||
> (sds.prefer_sibling &&
> > +	    sibling_imbalance(env, &sds, busiest, local) > 1)))
> >  		goto force_balance;
>=20
> Not sure about blanked disable. Maybe only disable when cache aware
> scheduling is present and enabled?

The prefer_sibling bypass is already limited to cache aware scheduling.

group_llc_balance can only be selected when llc_balance() returns true,
and llc_balance() immediately return false when sched aware scheduling
is not active. When CONFIG_SCHED_CACHE is disabled, the corresponding
stub also cannot produce group_llc_balance.

Therefore, the changed branch cannot bypass prefer_sibling when cache
aware scheduling is absent or disabled.

Thanks
Jianyong

