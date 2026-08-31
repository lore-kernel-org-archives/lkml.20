Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076733DDDB1
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169465; cv=none; b=VBQehnaosNb6itWrfIkqyLwcFOn1ab1r+VNxTxT7hhSuLHC2mZNg+gkqAs/A4j04RrwZfblyFNRkJCaHeDhn79T7vFIQqp2Kl2nykxZoArI7BQQ1QWC8ZPEKHMqdJWfiVJaD/nAgYrWaJe84jyLgf8WEUXLVtIk2wpFiyvXvSz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169465; c=relaxed/simple;
	bh=qpcQfZcLvMhxiqw7aau7QfCQEaGRn6bJlLY5RDqSU7s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kYoK0bi+9sL44juQr+VmMFeeiOUXqS+To+XwzKVJuM/GGwgV5Z96LoZbEfC9hLLE7+CbAZ55DCD0QyfhV1mEihe1IOp+3TXmdfmrXHE4YPHv1v8zP2q7s0g0sMrGy6LkWFQBfdsqhBBpJuci6rQVa5vEOlqi1L7vfbfnYT2TIcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hYPFr55Fhz3lk13;
	Mon, 31 Aug 2026 17:44:00 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hYPFn5Kbpz3lk0r;
	Mon, 31 Aug 2026 17:43:57 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id 937EA312D305;
	Mon, 31 Aug 2026 17:40:08 +0800 (CST)
Received: from cncheex04.Hygon.cn (172.23.18.114) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 31 Aug
 2026 17:43:58 +0800
Received: from cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d]) by
 cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d%10]) with mapi id
 15.02.1544.036; Mon, 31 Aug 2026 17:43:58 +0800
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
Subject: RE: [RFC PATCH v2 01/23] sched/topology: Add llc_to_node() to
 translate LLC id to NUMA node
Thread-Topic: [RFC PATCH v2 01/23] sched/topology: Add llc_to_node() to
 translate LLC id to NUMA node
Thread-Index: AQHdNiA1S4sPkM2eVUS9eLXgGPoHhLa0UJ0AgAOVqnA=
Date: Mon, 31 Aug 2026 09:43:58 +0000
Message-ID: <2ddfaa8335fc41f0be394de683013ead@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-2-wujianyong@hygon.cn>
 <20260829103102.GE776954@noisy.programming.kicks-ass.net>
In-Reply-To: <20260829103102.GE776954@noisy.programming.kicks-ass.net>
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
> From: owner-linux-mm@kvack.org <owner-linux-mm@kvack.org> On
> Behalf Of Peter Zijlstra
> Sent: Saturday, August 29, 2026 6:31 PM
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
> Subject: Re: [RFC PATCH v2 01/23] sched/topology: Add llc_to_node() to
> translate LLC id to NUMA node
>=20
> On Thu, Aug 27, 2026 at 08:27:54PM +0800, Jianyong Wu wrote:
> > +static void rebuild_llc_node_map(int size)
> > +{
> > +	int *new_map, *old_map;
> > +	u8 *seen_llc;
> > +	int cpu, llc;
> > +
> > +	new_map =3D kcalloc(size, sizeof(int), GFP_KERNEL);
> > +	if (!new_map)
> > +		return;
> > +	seen_llc =3D kcalloc(size, sizeof(*seen_llc), GFP_KERNEL);
> > +	if (!seen_llc) {
> > +		kfree(new_map);
> > +		return;
> > +	}
> > +
> > +	/*
> > +	 * for_each_possible_cpu() revisits the same LLC non-consecutively
> > +	 * under SMT (each node's LLCs are walked once per thread), so
> > +	 * dedup by llc id via seen_llc[], not by comparing against the
> > +	 * immediately preceding CPU's llc.
> > +	 */
> > +	for_each_possible_cpu(cpu) {
> > +		llc =3D per_cpu(sd_llc_id, cpu);
> > +		if (llc < 0 || llc >=3D size || seen_llc[llc])
> > +			continue;
> > +		seen_llc[llc] =3D 1;
> > +		new_map[llc] =3D cpu_to_node(cpu);
> > +	}
> > +	kfree(seen_llc);
> > +
> > +	old_map =3D rcu_dereference_protected(llc_to_node_map, true);
> > +	rcu_assign_pointer(llc_to_node_map, new_map);
> > +	synchronize_rcu();
> > +	kfree(old_map);
>=20
> Could that not be: kfree_rcu_mightsleep(old_map); ?
>=20
Yes, that would avoid synchronously waiting for the grace period here.
I'll replace synchronize_rcu() + kfree() with kfree_rcu_mightsleep() in the=
 next version.

Thanks
Jianyong


