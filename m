Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE5234DCF3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245889; cv=none; b=UE4s/r00NS4WExB7p5FS4WyJUR3n3OQrpsZyrNAbhIAS89r608DAiGntTu/Six5Vr2pWqQjOp8nsQqTv5d0cdOVHrfbOingLCUMZQPwXZiC1RlrB1YXrZe713PJmETINoQL6kL8z15hNHBVa7w4Q9Va/mSNVG7vdj/hAShMuLxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245889; c=relaxed/simple;
	bh=IEKaCs7DVtAp47E8WQhgVCFmxXkNh4PeZMo7BO9ds1I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FdlijQRm06nzcPc0w3dNm/Ri7MEIHWSOimzFMYBJL0xdS55L51EQHeN2dmTFLzkN7Ba3G/sCMho7/JzarG5Q3A2reFDFLGyXvu5h5WzQSzf1f0wqRib23QFLhIXyn2pRIOuyoahGgAGxR5Kf0HEHvJ+5e05QrUZdf0MlkAzYHWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hYxWY3qdCz1PGD2;
	Tue,  1 Sep 2026 14:57:45 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hYxWW34y9z1PGCm;
	Tue,  1 Sep 2026 14:57:43 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id AE13330004D2;
	Tue,  1 Sep 2026 14:53:52 +0800 (CST)
Received: from cncheex04.Hygon.cn (172.23.18.114) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 1 Sep
 2026 14:57:44 +0800
Received: from cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d]) by
 cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d%10]) with mapi id
 15.02.1544.036; Tue, 1 Sep 2026 14:57:44 +0800
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
Thread-Index: AQHdNiA3jheQVPdvikWpN4gB9aTKG7a3i1wAgACO1RA=
Date: Tue, 1 Sep 2026 06:57:43 +0000
Message-ID: <ee97dce1db374f50b8e87e51ad133d96@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-3-wujianyong@hygon.cn>
 <20260831115004.GF776954@noisy.programming.kicks-ass.net>
In-Reply-To: <20260831115004.GF776954@noisy.programming.kicks-ass.net>
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
> Sent: Monday, August 31, 2026 7:50 PM
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
> On Thu, Aug 27, 2026 at 08:27:55PM +0800, Jianyong Wu wrote:
> > Builds a refined node distance matrix based on the raw NUMA distance
> matrix
> > provided by BIOS. The refined matrix preserves the relative ordering of
> > NUMA distances, while assigning distinct distance values to node pairs
> that
> > originally shared identical distances within each matrix row. This matr=
ix
> > is exclusively used for cache-aware scheduling and has no impact on
> existing
> > NUMA topology logic such as sched domain construction.
> >
> > For example, consider a system with 4 NUMA nodes. The raw
> BIOS-provided
> > distance matrix may look like this:
> >
> >         NODE0  NODE1  NODE2  NODE3
> > NODE0   10     20     20     30
> > NODE1   20     10     20     25
> > NODE2   20     20     10     20
> > NODE3   30     25     20     10
> >
> > Multiple duplicate distance values exist within each row. After the
> > deduplication step, the refined distance matrix becomes:
> >
> >         NODE0  NODE1  NODE2  NODE3
> > NODE0   10     15     20     30
> > NODE1   15     10     12     25
> > NODE2   20     12     10     15
> > NODE3   30     25     15     10
> >
> > All entries in each row are now unique, while adhering to two core
> principles:
> > 1. The relative distance ordering from the original matrix is preserved=
.
> >    For instance, original distance(NODE0, NODE1) < distance(NODE0,
> NODE3),
> >    and this relative relationship is retained in the refined matrix as
> well.
> > 2. The matrix remains symmetric across its main diagonal. Maintaining
> >    symmetry is critical to guarantee consistent pairwise node distances=
.
>=20
> This example uses Node only, but the code in question is specifically
> aimed at Cache granularity; might it be better to use a cache example?
>=20
> A little something like so (I got tired of prompting Gemini to generate
> more complicates / less broken examples)...
>=20
> Pre:
>=20
> Cache |  C0   C1 |  C2   C3 |  C4   C5 |  C6   C7
> ------+----------+----------+----------+---------
>   C0  |  10   10 |  20   20 |  20   20 |  20   20
>   C1  |  10   10 |  20   20 |  20   20 |  20   20
> ------+----------+----------+----------+---------
>   C2  |  20   20 |  10   10 |  20   20 |  20   20
>   C3  |  20   20 |  10   10 |  20   20 |  20   20
> ------+----------+----------+----------+---------
>   C4  |  20   20 |  20   20 |  10   10 |  20   20
>   C5  |  20   20 |  20   20 |  10   10 |  20   20
> ------+----------+----------+----------+---------
>   C6  |  20   20 |  20   20 |  20   20 |  10   10
>   C7  |  20   20 |  20   20 |  20   20 |  10   10
>=20
> Post:
>=20
> Cache |  C0   C1 |  C2   C3 |  C4   C5 |  C6   C7
> ------+----------+----------+----------+---------
>   C0  |  10   11 |  20   21 |  22   23 |  24   25
>   C1  |  11   10 |  21   20 |  23   22 |  25   24
> ------+----------+----------+----------+---------
>   C2  |  20   21 |  10   11 |  24   25 |  22   23
>   C3  |  21   20 |  11   10 |  25   24 |  23   22
> ------+----------+----------+----------+---------
>   C4  |  22   23 |  24   25 |  10   11 |  20   21
>   C5  |  23   22 |  25   24 |  11   10 |  21   20
> ------+----------+----------+----------+---------
>   C6  |  24   25 |  22   23 |  20   21 |  10   11
>   C7  |  25   24 |  23   22 |  21   20 |  11   10
>=20
>=20

Originally I tried to use a single big LLC distance matrix. But once I real=
ized how much memory and computation time it would cost, e.g. when calculat=
ing affinity scores in later patches. I dropped it in favor of a two-level =
scheme: the first is a NUMA node distance matrix, and the second is an intr=
a-node LLC matrix that only encodes the LLC distances inside a single node,=
 so it is very small. This way, both memory and time are greatly reduced.

> > Each row of this refined NUMA distance matrix is sorted in ascending
> order to
> > generate a unique per-node affinity sequence. This sequence will guide
> > thread migration logic introduced in subsequent patches.
>=20
> IIRC greedy has significant worse bounds than many other schemes. This
> would result in more unique distances than strictly needed here, right?
>=20
Yes, Greedy edge-coloring is simple but can't guarantee to get the optimal =
result in theory.

> Since this is all on slow paths anyway, does it make sense to pick a
> slightly better algorithm in order to reduce this bound and get better
> results?
>=20
This matrix currently has two consumers:
1. it is sorted to build a unique per-node affinity sequence;
2. its values are used to calculate the affinity gain in patch 12.

Therefore, when changing the de-duplication algorithm, I need to consider t=
he requirements of both
Consumers, For the first use, any symmetric matrix with no duplicate entrie=
s in a row is sufficient. For
the second use, however, the actual values and their differences may affect=
 the affinity score.

It is not yet clear whether using a more optimal algorithm would provide an=
y real benefit for these consumers. I will investigate whether a tighter ma=
trix can be generated without introducing too much complexity, and then dec=
ide which algorithm is more appropriate.

Thanks
Jianyong

> Anyway, let me continue trying to dig through all this.


