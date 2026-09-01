Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5CD46C85E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248270; cv=none; b=jcGeYA7Pjd0UVk9qseGx1GySiCE1DJR3lwY9VgvsO+ooYu2tYCYKHIJ0JGUi9TJwcv4JE8QYc76WTk4JajuhIrgDF9wQ/mN5bALphFbv926coac4HXBDn02lpYnwne+X2PQDmyXsp+4zo1d84iNulEsPz4mni5rKRsNFZGLV+d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248270; c=relaxed/simple;
	bh=idrQ73kwv4S5/0jMgAlSIU6uQg9mX3ir4nWJY+LoBS4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pA+gCKnYi9SJnbioGGl96K7gCQ98AVaq7rhmHv3BQ1jCp2/+fKZ3aBzQaGICN7tiHXWtWk4U19ewLZ6UPRL3q6FWQXl41w25Df8JQqi0OPuweMeUCUp75q2xMPM2zeOf2Vtj7WZLEmKKwyTZF08eYprT0J2JGWQPHPeKBVTzZ0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hYyPM5ShSz1PvqX;
	Tue,  1 Sep 2026 15:37:27 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hYyPM24Chz1PGD2;
	Tue,  1 Sep 2026 15:37:27 +0800 (CST)
Received: from cncheex05.Hygon.cn (unknown [172.23.18.115])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id 7F17E31F55DC;
	Tue,  1 Sep 2026 15:33:36 +0800 (CST)
Received: from cncheex04.Hygon.cn (172.23.18.114) by cncheex05.Hygon.cn
 (172.23.18.115) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 1 Sep
 2026 15:37:28 +0800
Received: from cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d]) by
 cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d%10]) with mapi id
 15.02.1544.036; Tue, 1 Sep 2026 15:37:28 +0800
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
Subject: RE: [RFC PATCH v2 02/23] sched/topology: Introduce a NUMA distance
 matrix with unique distance values
Thread-Topic: [RFC PATCH v2 02/23] sched/topology: Introduce a NUMA distance
 matrix with unique distance values
Thread-Index: AQHdNiA3jheQVPdvikWpN4gB9aTKG7a3i1wAgACO1RCAALYwAIAAigwQ
Date: Tue, 1 Sep 2026 07:37:27 +0000
Message-ID: <c1c4cf3afa434a3e90768444e57703d9@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-3-wujianyong@hygon.cn>
 <20260831115004.GF776954@noisy.programming.kicks-ass.net>
 <ee97dce1db374f50b8e87e51ad133d96@hygon.cn>
 <20260901071322.GX687043@noisy.programming.kicks-ass.net>
In-Reply-To: <20260901071322.GX687043@noisy.programming.kicks-ass.net>
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
> Sent: Tuesday, September 1, 2026 3:13 PM
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
> Subject: Re: [RFC PATCH v2 02/23] sched/topology: Introduce a NUMA
> distance matrix with unique distance values
>=20
> On Tue, Sep 01, 2026 at 06:57:43AM +0000, Jianyong Wu wrote:
>=20
> > > This example uses Node only, but the code in question is specifically
> > > aimed at Cache granularity; might it be better to use a cache example=
?
> > >
> > > A little something like so (I got tired of prompting Gemini to genera=
te
> > > more complicates / less broken examples)...
>=20
> > Originally I tried to use a single big LLC distance matrix. But once I
> > realized how much memory and computation time it would cost, e.g.
> when
> > calculating affinity scores in later patches. I dropped it in favor of
> > a two-level scheme: the first is a NUMA node distance matrix, and the
> > second is an intra-node LLC matrix that only encodes the LLC distances
> > inside a single node, so it is very small. This way, both memory and
> > time are greatly reduced.
>=20
> See, that would've made good Changelog material :-) But yeah, fair
> enough, the matrix will get rather big I suppose. And going to
> triangular matrix storage will only save half, while you still scale by
> n^2, so that's not going to help.

Right, I'll fold this into the commit message. And agreed on the triangular=
 layout - it halves
the storage but stays O(n^2), so it doesn't really change the picture.

>=20
> > > > Each row of this refined NUMA distance matrix is sorted in ascendin=
g
> > > order to
> > > > generate a unique per-node affinity sequence. This sequence will
> guide
> > > > thread migration logic introduced in subsequent patches.
> > >
> > > IIRC greedy has significant worse bounds than many other schemes.
> This
> > > would result in more unique distances than strictly needed here, righ=
t?
> > >
> > Yes, Greedy edge-coloring is simple but can't guarantee to get the
> > optimal result in theory.
>=20
> Right, so the theoretical count is :delta: or :delta:+1, but the greedy
> bound is 2:delta:+1. But IIRC (and I really am not well versed in this
> particular area) there are algorithms that are still relatively easy to
> implement and get better bounds.
>=20
> I just asked Gemini (so take with a big pinch of salt and consult your
> algorithm book) there are simple algorithms such as Eulerian paths, that
> exploit topological constraints, such as hypercubes or 2d meshes, to
> still reach :delta:.
>=20
Thanks for the pointer. I'll look into Eulerian path based coloring and che=
ck
whether the per-tier subgraphs in our topology are regular enough (hypercub=
e/mesh-like)
for it to reach delta. If so, that should let me tighten the bound without =
much extra complexity.

> > > Since this is all on slow paths anyway, does it make sense to pick a
> > > slightly better algorithm in order to reduce this bound and get bette=
r
> > > results?
> > >
> > This matrix currently has two consumers:
> > 1. it is sorted to build a unique per-node affinity sequence;
> > 2. its values are used to calculate the affinity gain in patch 12.
> >
> > Therefore, when changing the de-duplication algorithm, I need to
> > consider the requirements of both Consumers, For the first use, any
> > symmetric matrix with no duplicate entries in a row is sufficient. For
> > the second use, however, the actual values and their differences may
> > affect the affinity score.
> >
> > It is not yet clear whether using a more optimal algorithm would
> > provide any real benefit for these consumers. I will investigate
> > whether a tighter matrix can be generated without introducing too much
> > complexity, and then decide which algorithm is more appropriate.
>=20
> Right, fair enough. I'll continue trying to digest the series.

Thanks, appreciate the thorough review.

Thanks
Jianyong

