Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DBD48595F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 22:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790892260; cv=none; b=j84dUIA0iEfA0DieqVp2kKI/KBgwad+87E4FPxBlzLjbJUsTcp4JHC9HuL0SlPBbStdmKkGxseCNabDAxWnPztddVptc58Q5t722DWsa+xbBaZPDZv42YQLkXs3vxsGUON9mD3vet2mkHGHglj5TPmnM3/9F7ejNhh8K9HEAwow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790892260; c=relaxed/simple;
	bh=+QvXiGyo+x42cCw7RBt1plcNMLWUrP1Y177UVng5cbs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PRGNGxTjMI2x0gt3QkxZl/muCODuN1PFc63ZNNB6LGgZ68A5k0OQGSYu4tH4UgumTwD7DOkKymIr5MkOmbW/stINRbwyz0N5FlMrkbvXuVowr6d7QZscRY0YQpbOL3jQ18UP0cQYCuZ/d9QQbVtUZ/5VuV6kqOV7C6b8sY7sO14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhXpjEOk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhXpjEOk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790892249; x=1822428249;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=+QvXiGyo+x42cCw7RBt1plcNMLWUrP1Y177UVng5cbs=;
  b=XhXpjEOkTW/fBkWYyeWN6F5e6gjzTy5ptDw/X8NeJrxjK9q0Dpnsz6WS
   AJZ/dKlDgsN88+nPHnh9YnJim+NxLAB8mbIUk3o91N8VHrjZkzOen+Nnr
   iTQZO6c3KxLlrEKuIUAqya5jQbLltlPAT/480DPRUWL9RCpqRysILcmwo
   +LJPGWOnMm4g/pqnnfX0qppbSNOauKi2MlOvPHe/Oqy+dlbjTCaQCrbQg
   YkyBWT78YSREdCUNZ/k4VvztD8ap9JtfOtejEHT5o8m3fJ5JGgrfz2SUx
   qNbwc9wmhW6k3y9xuegTZRS6NA/+LxXaj8TafftFBdCmdTHRnkaWUbccu
   w==;
X-CSE-ConnectionGUID: zz9sJKdVRoiP/z4IjDqh2A==
X-CSE-MsgGUID: 4WzquoiTTEmdlAchsVidBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91684141"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="91684141"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 15:04:08 -0700
X-CSE-ConnectionGUID: pySp5X+8Ss+SzNAHXCkSNg==
X-CSE-MsgGUID: jJiaaVqORH66Q0KvXHo5TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="276206270"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.108.6]) ([10.125.108.6])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 15:04:06 -0700
Message-ID: <2a120db1b0c052eb88dcbc2ed1de6027a16542b4.camel@linux.intel.com>
Subject: Re: [RFC PATCH v2 02/23] sched/topology: Introduce a NUMA distance
 matrix with unique distance values
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Jianyong Wu <wujianyong@hygon.cn>, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, Chen Yu
 <yu.c.chen@intel.com>, Dietmar Eggemann	 <dietmar.eggemann@arm.com>, Steven
 Rostedt <rostedt@goodmis.org>, Ben Segall	 <bsegall@google.com>, Mel Gorman
 <mgorman@suse.de>, Valentin Schneider	 <vschneid@redhat.com>, K Prateek
 Nayak <kprateek.nayak@amd.com>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 Phil Auld <pauld@redhat.com>, Andrew Morton	 <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,  "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
 "jianyong.wu@outlook.com"	 <jianyong.wu@outlook.com>, Yuan Zhong
 <zhongyuan@hygon.cn>, Huangsj	 <huangsj@hygon.cn>, Fengyu Wang
 <wangfengyu@hygon.cn>, Zhiwei Ying	 <yingzhiwei@hygon.cn>,
 "justin.he@arm.com" <justin.he@arm.com>
Date: Thu, 01 Oct 2026 15:04:05 -0700
In-Reply-To: <8a0c239b5bdf40c99b645087dec8fd18@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
				 <20260827122816.756234-3-wujianyong@hygon.cn>
				 <20260831115004.GF776954@noisy.programming.kicks-ass.net>
			 <da32ba66d95fd88869ba052f97698b9a4d6c3dc6.camel@linux.intel.com>
			 <09261c8222994a41a04ace5f342475df@hygon.cn>
		 <ce95ec57af9dfaf4d9ed604ad7337441a543f538.camel@linux.intel.com>
		 <f6ebab3d0e44412dad17ac64a3b93339@hygon.cn>
	 <112e526b4013e23c70adf5b8883db8e75358b473.camel@linux.intel.com>
	 <8a0c239b5bdf40c99b645087dec8fd18@hygon.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-09-28 at 09:39 +0000, Jianyong Wu wrote:
> Hi Tim,
>=20
> > -----Original Message-----
> > From: Tim Chen <tim.c.chen@linux.intel.com>
> > Sent: Thursday, September 24, 2026 11:46 PM
> > To: Jianyong Wu <wujianyong@hygon.cn>; Peter Zijlstra
> > <peterz@infradead.org>
> > Cc: Ingo Molnar <mingo@redhat.com>; Juri Lelli <juri.lelli@redhat.com>;
> > Vincent Guittot <vincent.guittot@linaro.org>; Chen Yu
> > <yu.c.chen@intel.com>; Dietmar Eggemann
> > <dietmar.eggemann@arm.com>; Steven Rostedt <rostedt@goodmis.org>;
> > Ben Segall <bsegall@google.com>; Mel Gorman <mgorman@suse.de>;
> > Valentin Schneider <vschneid@redhat.com>; K Prateek Nayak
> > <kprateek.nayak@amd.com>; Shrikanth Hegde <sshegde@linux.ibm.com>;
> > Phil Auld <pauld@redhat.com>; Andrew Morton
> > <akpm@linux-foundation.org>; David Hildenbrand <david@kernel.org>;
> > linux-kernel@vger.kernel.org; linux-mm@kvack.org;
> > jianyong.wu@outlook.com; Yuan Zhong <zhongyuan@hygon.cn>; Huangsj
> > <huangsj@hygon.cn>; Fengyu Wang <wangfengyu@hygon.cn>; Zhiwei Ying
> > <yingzhiwei@hygon.cn>; justin.he@arm.com
> > Subject: Re: [RFC PATCH v2 02/23] sched/topology: Introduce a NUMA
> > distance matrix with unique distance values
> >=20
> > On Thu, 2026-09-24 at 05:41 +0000, Jianyong Wu wrote:
> > > >=20
> > > > On Wed, 2026-09-23 at 03:14 +0000, Jianyong Wu wrote:
> > > >=20
> > > > [snip]
> > > >=20
> > > > > > >=20
> > > > > >=20
> > > > > How should the next closest NUMA node be selected when multiple
> > > > nodes
> > > > > have the same distance from the current node?
> > > >=20
> > > > You could use some other means like node id or load in the node
> > > > if there's a tie in distance.
> > > >=20
> > > > >=20
> > > > > That is the ambiguity this patch is intended to resolve. For each
> > > > > source node, it disambiguates equal NUMA distances and produces a
> > > > > unique node-level affinity ordering. An llc_next array can descri=
be
> > > > > the traversal of LLCs within a node, but it does not determine wh=
ich
> > > > > equidistant NUMA node should be visited next.
> > > > >=20
> > > >=20
> > > > Agreed that llc_next only covers intra-node traversal and that you =
still
> > > > need an inter-node order for the equidistant case. But I think
> > > > sorting each source node's row by (distance, node_id)
> > > > already gives a stable total order; the node id breaks the tie. You=
 can
> > > > also break it by node load if you'd rather balance than pin. Either=
 way
> > > > no new distance value has to be invented.
> > > >=20
> > >=20
> > > Yes, using (distance, node_id) pairs is a straightforward way to orde=
r
> > nodes,
> > > similar to the memory zonelist fallback node sequence. I once
> > considered
> > > adopting this approach, but dropped the idea after realizing it lacks
> > > symmetry.
> > >=20
> >=20
> > Ordering symmetry can be resolved by looking at (distance, abs(node_id_=
i -
> > node_id_j)).
> >=20
>=20
> > > For instance, node_affinity_distance(A, B) is not guaranteed to equal
> > > node_affinity_distance(B, A).
> >=20
> > node distance is symmetric if you don't modify it.
> >=20
>=20
> OK, So, What about using a triple (distance, abs(node_id_i - node_id_j), =
min(i, j))
> to rank node-affinity sequences? The third component is what makes it a t=
otal
> order - given the distance, the gap and the smaller node id, the pair is
> determined - so it guarantees deduplication and symmetry without inventin=
g any
> new distance value.
>=20
> > >=20
> > > The dedup algorithm can enforce this symmetry property for the
> > resulting
> > > node=E2=80=91distance matrix.
> > >=20
> > > > > > This will be storage efficient and more straight forward
> > > > > > to use than maintaining an artificial cache distance matrix.
> > > > > >=20
> > > > > > I dislike the artificial distance matrix also for the
> > > > > > reason that there is no guarantee that there are enough
> > > > > > available distance slots between two nodes.  Say if I
> > > > > > start with
> > > > > >=20
> > > > > >         NODE0  NODE1  NODE2  NODE3
> > > > > > NODE0   10     20     20     30
> > > > > > NODE1   20     10     20     25
> > > > > > NODE2   20     20     10     20
> > > > > > NODE3   30     25     20     10
> > > > > >=20
> > > > > > and there are 16 LLCs in NODE 1, I will run
> > > > > > out of slots when I try to deduplicate as
> > > > > > only 10 slots are available to fit 16 LLCs.
> > > > > >=20
> > > > >=20
> > > > > There is no system-wide LLC distance matrix in this series. The
> > > > > de-duplication is applied only to the NUMA-node distance matrix.
> > > > > Consequently, the number of LLCs in NODE1 does not affect the
> > number
> > > > > of distance values required by this patch.
> > > > >=20
> > > > > The algorithm also takes the available distance space into accoun=
t
> > > > > when assigning the refined node distances. It does not simply ins=
ert
> > > > > one value for each duplicate into the existing gap between two
> > > > > original distance levels. The distance values are adjusted as
> > > > > necessary to reserve enough space before the duplicates are
> > assigned.
> > > > > Therefore, the algorithm cannot run out of available distance val=
ues,
> > > > > regardless of the number of nodes sharing the same original
> > distance.
> > > > >=20
> > > >=20
> > > > Fair - you're right that the dedup is node-granularity, so my 16-LL=
C
> > > > example doesn't apply as I stated it, and I'll drop that objection.=
 It's
> > > > moot anyway under the argument below: if the ordering uses raw
> > distance
> > > > plus a tie-break, and the score uses raw distance, then there's no
> > matrix
> > > > to pack in the first place and the "enough slots" question disappea=
rs.
> > > >=20
> > > > > In addition to providing the node-level component of the LLC affi=
nity
> > > > > ordering, the refined node distances are used to calculate the
> > > > > affinity improvement score when selecting a source scheduling gro=
up
> > > > > or runqueue during load balancing. Please see patch 12 for that
> > usage.
> > > >=20
> > > > This affinity computation is where I think the dedup actually hurts
> > rather
> > > > than
> > > > helps. The score in patch 12 is
> > > >=20
> > > >     Di =3D dist(src_node, i) - dist(dst_node, i)   (kept only if Di=
 > 0)
> > > >     p  =3D sum_i  numa_counts[i] * clamp(Di, 4, 1024)
> > > >=20
> > > > so it reads the distance *magnitude*, not just the order. Feeding i=
t the
> > > > refined values manufactures gains on exactly the node pairs the ded=
up
> > > > perturbed - the equidistant ones. Using your node matrices:
> > > >=20
> > > >     raw:                          refined:
> > > >           N0  N1  N2  N3                 N0  N1  N2  N3
> > > >     N0    10  20  20  30           N0    10  15  20  30
> > > >     N1    20  10  20  25           N1    15  10  12  25
> > > >     N2    20  20  10  20           N2    20  12  10  15
> > > >     N3    30  25  20  10           N3    30  25  15  10
> > > >=20
> > > > Scenario A - a locality-neutral pull gets a fabricated gain.
> > > > Dest CPU on N1, source rq on N0, 5 tasks preferring N2:
> > > >=20
> > > >                   dist(N0,N2)  dist(N1,N2)  Di   contribution
> > > >     raw           20           20            0   5 * 0 =3D  0
> > > >     refined       20           12            8   5 * 8 =3D 40
> > > >=20
> > > > N0 and N1 are physically equidistant from N2 (both 20), so pulling
> > those
> > > > tasks to N1 buys zero locality - raw correctly gives 0. Refined sco=
res it
> > > > 40 and the balancer may drag all 5 over chasing a gain that isn't t=
here.
> > > >=20
> > > > Scenario B - two physically identical options get fake-ranked. Dest=
 on
> > > > N1; candidate sources N0 and N3, each holding only N2-preferring
> > tasks:
> > > >=20
> > > >                   raw Di   refined Di   after clamp(.,4,1024)
> > > >     X (N0)        20-20=3D0  20-12=3D8      8
> > > >     Y (N3)        20-20=3D0  15-12=3D3      4
> > > >=20
> > > > Raw Di says both are 0, i.e. locality-equivalent, and load should d=
ecide.
> > > > Refined ranks X over Y purely from invented deltas - and the clamp
> > floor
> > > > even promotes Y's fabricated 3 up to 4.
> > > >=20
> > > > Note the dedup only ever perturbs ties, so the skew is confined to
> > > > equidistant pairs - which is exactly the case where there is no rea=
l
> > > > locality difference and load should have been the tiebreaker.
> > > >=20
> > >=20
> > > My intention is to distinguish equal node distances and give a defini=
tely
> > > task move direction.
> > > What we want to do is aggregate task to as small area as possible. If=
 N2
> > is
> > > Preferred node, and N2 is saturate, N1 is the next node of N2 in the
> > > affinity node order, it's natural that prefer N1 than N0 for task
> > aggregation,
> > > right? Thus, we should give weight for task in N0. So N0 is more like=
ly to
> > be
> > > chosen and migrate task to N1. Consequently, the task can more likely
> > > aggregate to N1 and not evenly spread in the two nodes.
> >=20
> > I think you should get true affinity metric based on real distance. Bia=
s
> > based on node
> > property can be applied separately and a easily controlled manner. =C2=
=A0That
> > has the advantage
> > of setting the bias based on factors like load or others.
> >=20
>=20
> > It is a bad design to have to tune a hacked up
> > distance to change the bias.  It is hard to control
> > the magnitude of the bias and use a similar and consistent
> > bias with the current approach. The distance you inject to
> > disambiguate is not the same from node to node.
> >=20
>=20
> Makes sense. So, what about the following solution?=20
> Given a node affinity sequence, a move from src to dst improves the
> affinity of every task whose preferred node i ranks dst better than src. =
The score
> is then
>=20
> Di =3D raw_dist(src, i) - raw_dist(dst, i)
> affinity_bias_i =3D position of src minus position of dst in node i's aff=
inity
>              sequence, counted among the nodes at the same distance from
>              i (zero when Di is not zero)

Do we really need an affinity bias?  I think your intention is to use it fo=
r breaking a tie.
If there is a tie in affinity score (without injecting bias),=C2=A0
just use the position diff to break the tie.  Having a bias distorts
the affinity score.


> p =3D sum_i {numa_counts[i] * (Di + affinity_bias_i)}, kept only if (Di +=
 affinity_bias_i) > 0
>=20
> When raw_dist(src, i) equals raw_dist(dst, i), Di is zero and the candida=
te is
> selected purely by the affinity bias.
>=20
> I would rather keep it fixed than let load decide. Load changes between p=
asses,
> so the choice can flip and the same tasks can be pulled back - not every =
time, but
> it is the direction the aggregation is fighting against. At the node leve=
l,
> equidistant nodes are indistinguishable to the metric, so the order betwe=
en them is
> a convention in any case; I would just rather it be a fixed one.

That's fine.

Tim

>=20
> > >=20
> > > Also, give a preference between N0 and N1 can limit the task migratio=
n
> > from
> > > N1 to N0. By this way, we can achieve the goal that keep tasks inside=
 N1.
> > >=20
> > > > Stepping back, the matrix is being asked to do two jobs at once:
> > > >=20
> > > >     - ordering: only needs a deterministic total order, which
> > > >       raw distance + node-id tie-break already provides;
> > > >     - scoring: wants true magnitudes, which raw distance also
> > provides
> > > >       (equidistant =3D> Di =3D 0).
> > > >=20
> > > > The dedup is only necessary if one matrix has to serve both - and t=
hat
> > > > coupling is precisely what injects the fake Di. So if you need a no=
de
> > > > ordering, I'd use the unaltered distance and break ties by some oth=
er
> > > > means (node id, or load), and feed the score the raw distance too.
> > > >=20
> > >=20
> > > Yes, the refined node distance serves both purposes mentioned above.
> > Hence,
> > > dedup is necessary for this patch series.
> > >=20
> > > Both affinity=E2=80=91score calculation and migration control rely on=
 a consistent
> > > refined node distance matrix. To keep this consistent, we should avoi=
d
> > using
> > > the default node distance for one objective while adopting a differen=
t
> > > variant for another purpose.
> > >=20
> > > The only open design question is whether symmetric node distances are
> > > strictly required. Symmetry is preferable but adds implementation
> > > complexity, so this represents a trade=E2=80=91off. If symmetry is un=
necessary,
> > > I can construct the node order following your approach using the
> > > (node_distance, node_id) pair, which is significantly simpler than my
> > > current implementation.
> > >=20
> > > Your question touches on the trickiest part of this patch series.
> > >=20
> >=20
> > I think the design can be much simplified if you don't have to invent a=
 new
> > distance matrix.
> >=20
>=20
> OK, let me try to remove this artificial node distance.
>=20
> Thanks
> Jianyong
