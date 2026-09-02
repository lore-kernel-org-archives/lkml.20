Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783AF3BB669
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333130; cv=none; b=PRQJM0lO/OJdzNHNLTWbnoUDGvRW0N/YQaVqrc3HlG76yFIwkx331fl8m/uU6LOSwTOogFkEUepdEMGWO+KFA+TiM6qEJ2ESwOREHiDEK9AChpGxTDaK3R/VGgxR6r82MI8dKqVGjOGS/3YsbC5u5NCvtM7fCe2O4wvrtLilw/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333130; c=relaxed/simple;
	bh=4VAA318YIQ8/oGYnEU7e6m7f70EQzqMhJ2pKjCH+SbQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iIwkOu1mWtALz3vOPvAwhdhal8hsZFmRKXo25IG+zridgMLe6853qR95DQ0p6FHwq/ay+0iJ5HA0qG7c53I96WXy1RhHyzmf/4c+5Hb+QzEq5dHWPf8kZqI0ZiwXarWO6nZnfiFnpNCbtl3zWIJxvVRfbvVhNJVx1CCNL8MviDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hZYnK5qycz3tlrP;
	Wed,  2 Sep 2026 15:11:49 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hZYnK0Ln2z3tlrP;
	Wed,  2 Sep 2026 15:11:49 +0800 (CST)
Received: from cncheex06.Hygon.cn (unknown [172.23.18.116])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id 6BFA91547;
	Wed,  2 Sep 2026 15:11:43 +0800 (CST)
Received: from cncheex04.Hygon.cn (172.23.18.114) by cncheex06.Hygon.cn
 (172.23.18.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 2 Sep
 2026 15:11:49 +0800
Received: from cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d]) by
 cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d%10]) with mapi id
 15.02.1544.036; Wed, 2 Sep 2026 15:11:49 +0800
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
Thread-Index: AQHdNiA3jheQVPdvikWpN4gB9aTKG7a46tIAgAH5vHA=
Date: Wed, 2 Sep 2026 07:11:49 +0000
Message-ID: <eb0d68d8cd744eb9a364606065b3e6ee@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-3-wujianyong@hygon.cn>
 <20260901084800.GI4121339@noisy.programming.kicks-ass.net>
In-Reply-To: <20260901084800.GI4121339@noisy.programming.kicks-ass.net>
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
> Sent: Tuesday, September 1, 2026 4:48 PM
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
> >
> > Each row of this refined NUMA distance matrix is sorted in ascending
> order to
> > generate a unique per-node affinity sequence. This sequence will guide
> > thread migration logic introduced in subsequent patches.
>=20
> Hmm, I wonder if __build_all_zonelists() wants to use this, rather than
> the unmodified distance table. This would ensure the node fallback order
> is distinct between nodes.
>=20

That is an interesting thought. Before building this node distance matrix, =
I
tried to reuse the zonelist fallback node matrix. But I dropped this idea w=
hen
I found that that matrix is not symmetric.

After searching the code, I find that build_all_zonelists is initialized mu=
ch earlier
than sched domain. So, it seems it's not easy to let the zonelists use this=
 refined
node distance.

Thanks
Jianyong

