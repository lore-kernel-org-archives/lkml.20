Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748D43EC835
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188149; cv=none; b=O9Dw5bjcQDTiDDz1sSVIt/vInxZdURdv4Gx6x/1aaChMvgAEMuJBQHPtXbE9058BVEC4ILBCRymdqOZXylGkGq3Kjet4jllZDLeSQvZHTqrZp4jhnwo1ThnLSTpOcD3HNIeBRqXrWr0e9D3+lRnc3YOBXQjsDBpfMt2HvWW6k/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188149; c=relaxed/simple;
	bh=E+5H6Hkg/bzB1vGeLXUZfraHnynICvJ3BjbD8z4M9VA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D61KDPfp3QZviGBqqUl4M0qMLlUR9JaNkbQwmsDUh3Kfzr8hCtg11r2XzWl++gQRWc2ZjndSPW8janxXrIMQDZ7syCuT69gSXIb7Qe0f9HryEj6GVBEuv2c0pJESBpfYURj4NmHCRt+7M9mORelC/27U7mAcagklVkNF9mbUxp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8lttteH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8lttteH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790188146; x=1821724146;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=E+5H6Hkg/bzB1vGeLXUZfraHnynICvJ3BjbD8z4M9VA=;
  b=U8lttteHXneseBNfQWasoh3lzsDTyQp7GUGlgSoiqvPeD42huoKpExsq
   Yg+oGJ2fwPgwn4X3faW45+RObJadd/lh+/eq5fY3EpuD3hQTRYzVQco+M
   hyRMMygG3k83uhobpG3z90fRBYvQ/RmGKjCHNE1KkwUKBFrNBtAN4LZGt
   pXK8kzWl9Vr7wYalRMWJBuHF1NcCiaPHspW/Tg9veFNDFyiDHtnj8OMYQ
   VYT6q1Dwat9qe3Cmk0QuMNOEZEDFwwVb2cOHWT3mw6h42K8Sk2xrq3zCl
   QVKNpyrWe1oPC6foYYUi9Bc4Qr3Uje4jnitYkCBv2dE3ljHzJfrDg7Vt3
   Q==;
X-CSE-ConnectionGUID: Q08GQktlSlyPqCBE3JOUYA==
X-CSE-MsgGUID: 2mTFZxqARcurivc0Ajp9kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="94735402"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="94735402"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 11:29:05 -0700
X-CSE-ConnectionGUID: GQ8QUU1bRyimf5Xjg38kZQ==
X-CSE-MsgGUID: CjwF445XRACo36KlNejzMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="301675316"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.110.121]) ([10.125.110.121])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 11:29:04 -0700
Message-ID: <ce95ec57af9dfaf4d9ed604ad7337441a543f538.camel@linux.intel.com>
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
Date: Wed, 23 Sep 2026 11:29:03 -0700
In-Reply-To: <09261c8222994a41a04ace5f342475df@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
		 <20260827122816.756234-3-wujianyong@hygon.cn>
		 <20260831115004.GF776954@noisy.programming.kicks-ass.net>
	 <da32ba66d95fd88869ba052f97698b9a4d6c3dc6.camel@linux.intel.com>
	 <09261c8222994a41a04ace5f342475df@hygon.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-09-23 at 03:14 +0000, Jianyong Wu wrote:

[snip]

> > >=20
> >=20
> > I think what we really want is an ordering of caches within
> > the same NUMA node.  So when one cache is full, we can
> > pick the next one down the list.  That is essentially the
> > net effect of the distance de-duplication.
>=20
> The goal of this series is to provide a system-wide LLC affinity
> ordering, rather than only an ordering of the LLCs within one NUMA node.
> Maintaining one large system-wide LLC ordering would be expensive, so
> the ordering is represented hierarchically: a NUMA-node-level affinity
> ordering, followed by an LLC-level ordering within each node.  This
> patch only deals with the NUMA-node-level part.
>=20
> >=20
> > So how about introduce a llc_next array.  We will initialize
> > the array such that it will return the next LLC in
> > the NUMA node.  So for the example that Peter has above,
> > assuming C0 maps to LLC id 0, C1 maps to 1, etc.
> > then llc_next is
> >=20
> > 	    c0 c1 c2 c3 c4 c5 c6 c7
> > llc_next =3D [1  0  3  2  5  4  7  6]
> >=20
> > When we come back to the orginal LLC we start off with,
> > we know that it is time to move on to a LLC in next closest
> > NUMA node.
> >=20
> How should the next closest NUMA node be selected when multiple nodes
> have the same distance from the current node?

You could use some other means like node id or load in the node
if there's a tie in distance.

>=20
> That is the ambiguity this patch is intended to resolve. For each
> source node, it disambiguates equal NUMA distances and produces a
> unique node-level affinity ordering. An llc_next array can describe
> the traversal of LLCs within a node, but it does not determine which
> equidistant NUMA node should be visited next.
>=20

Agreed that llc_next only covers intra-node traversal and that you still   =
                                                                           =
               =20
need an inter-node order for the equidistant case. But I think             =
                                                                           =
     =20
sorting each source node's row by (distance, node_id)                      =
                                                                       =20
already gives a stable total order; the node id breaks the tie. You can    =
                                                                           =
               =20
also break it by node load if you'd rather balance than pin. Either way    =
                                                                           =
               =20
no new distance value has to be invented. =20

> > This will be storage efficient and more straight forward
> > to use than maintaining an artificial cache distance matrix.
> >=20
> > I dislike the artificial distance matrix also for the
> > reason that there is no guarantee that there are enough
> > available distance slots between two nodes.  Say if I
> > start with
> >=20
> >         NODE0  NODE1  NODE2  NODE3
> > NODE0   10     20     20     30
> > NODE1   20     10     20     25
> > NODE2   20     20     10     20
> > NODE3   30     25     20     10
> >=20
> > and there are 16 LLCs in NODE 1, I will run
> > out of slots when I try to deduplicate as
> > only 10 slots are available to fit 16 LLCs.
> >=20
>=20
> There is no system-wide LLC distance matrix in this series. The
> de-duplication is applied only to the NUMA-node distance matrix.
> Consequently, the number of LLCs in NODE1 does not affect the number
> of distance values required by this patch.
>=20
> The algorithm also takes the available distance space into account
> when assigning the refined node distances. It does not simply insert
> one value for each duplicate into the existing gap between two
> original distance levels. The distance values are adjusted as
> necessary to reserve enough space before the duplicates are assigned.
> Therefore, the algorithm cannot run out of available distance values,
> regardless of the number of nodes sharing the same original distance.
>=20

Fair - you're right that the dedup is node-granularity, so my 16-LLC       =
                                                                           =
               =20
example doesn't apply as I stated it, and I'll drop that objection. It's   =
                                                                           =
               =20
moot anyway under the argument below: if the ordering uses raw distance    =
                                                                           =
               =20
plus a tie-break, and the score uses raw distance, then there's no matrix  =
                                                                           =
               =20
to pack in the first place and the "enough slots" question disappears. =20

> In addition to providing the node-level component of the LLC affinity
> ordering, the refined node distances are used to calculate the
> affinity improvement score when selecting a source scheduling group
> or runqueue during load balancing. Please see patch 12 for that usage.

This affinity computation is where I think the dedup actually hurts rather =
than                                                                       =
                         =20
helps. The score in patch 12 is                                            =
                                                                           =
               =20
                                                                           =
                                                                           =
                 =20
    Di =3D dist(src_node, i) - dist(dst_node, i)   (kept only if Di > 0)   =
                                                                           =
                   =20
    p  =3D sum_i  numa_counts[i] * clamp(Di, 4, 1024)                      =
                                                                           =
                   =20
                                                                           =
                                                                           =
                 =20
so it reads the distance *magnitude*, not just the order. Feeding it the   =
                                                                           =
               =20
refined values manufactures gains on exactly the node pairs the dedup      =
                                                                           =
               =20
perturbed - the equidistant ones. Using your node matrices:                =
                                                                           =
                =20
                                                                           =
                                                                           =
                 =20
    raw:                          refined:                                 =
                                                                           =
                 =20
          N0  N1  N2  N3                 N0  N1  N2  N3                    =
                                                                           =
                 =20
    N0    10  20  20  30           N0    10  15  20  30                    =
                                                                           =
                 =20
    N1    20  10  20  25           N1    15  10  12  25                    =
                                                                           =
                 =20
    N2    20  20  10  20           N2    20  12  10  15                    =
                                                                           =
                 =20
    N3    30  25  20  10           N3    30  25  15  10                    =
                                                                           =
                 =20
                                                                           =
                                                                           =
                 =20
Scenario A - a locality-neutral pull gets a fabricated gain.               =
                                                                           =
               =20
Dest CPU on N1, source rq on N0, 5 tasks preferring N2:                    =
                                                                           =
               =20
                                                                           =
                                                                           =
                 =20
                  dist(N0,N2)  dist(N1,N2)  Di   contribution              =
                                                                           =
                 =20
    raw           20           20            0   5 * 0 =3D  0              =
                                                                           =
                   =20
    refined       20           12            8   5 * 8 =3D 40              =
                                                                           =
                   =20
                                                                           =
                                                                           =
                 =20
N0 and N1 are physically equidistant from N2 (both 20), so pulling those   =
                                                                           =
               =20
tasks to N1 buys zero locality - raw correctly gives 0. Refined scores it  =
                                                                           =
               =20
40 and the balancer may drag all 5 over chasing a gain that isn't there.   =
                                                                           =
               =20

Scenario B - two physically identical options get fake-ranked. Dest on
N1; candidate sources N0 and N3, each holding only N2-preferring tasks:

                  raw Di   refined Di   after clamp(.,4,1024)
    X (N0)        20-20=3D0  20-12=3D8      8
    Y (N3)        20-20=3D0  15-12=3D3      4
   =20
Raw Di says both are 0, i.e. locality-equivalent, and load should decide.
Refined ranks X over Y purely from invented deltas - and the clamp floor
even promotes Y's fabricated 3 up to 4.
 =20
Note the dedup only ever perturbs ties, so the skew is confined to
equidistant pairs - which is exactly the case where there is no real
locality difference and load should have been the tiebreaker.

Stepping back, the matrix is being asked to do two jobs at once:

    - ordering: only needs a deterministic total order, which
      raw distance + node-id tie-break already provides;
    - scoring: wants true magnitudes, which raw distance also provides
      (equidistant =3D> Di =3D 0).

The dedup is only necessary if one matrix has to serve both - and that
coupling is precisely what injects the fake Di. So if you need a node
ordering, I'd use the unaltered distance and break ties by some other
means (node id, or load), and feed the score the raw distance too.=20

Tim

>=20
> Thanks
> Jianyong


