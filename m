Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE8737AA7A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252140; cv=none; b=g/lVS/+0ndWhl20qfEfc06z+IHIaECYG0sjT2ePojbyIJu56XB7N10Odgt028geSuTumhL7LbADBXUKtCAbj/oLveNDLXB9GpYe7MclOBAjJk3akHLAFUTYcNQovz+7mjjBj5PB1hzoIFIoWv4UHCP8XisAQzsdVijCbZyqLfFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252140; c=relaxed/simple;
	bh=KNgv1Uu7jpoFtkLPKa1otCXispNoaKRAhLQuUIgljV4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nt3p2BT/8YZKJkfxFcEEEmwEHmmKlFmjvBH2vzKHIkaZDxODuaLgR173nrOpdzpIcHShBYQz9hY6erkI2s4a/uFiQGRy5thfK9ftDtJFFCYvggYEQsdLWuZX0U0sFIA/7X0avpVXDZx3Klf8xu2QRDg/KncgZHPkT65w+j2duw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hYzqq0w4zz1PvqW;
	Tue,  1 Sep 2026 16:41:59 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hYzqp5ztfz1PGCm;
	Tue,  1 Sep 2026 16:41:58 +0800 (CST)
Received: from cncheex03.Hygon.cn (unknown [172.23.18.113])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id 9620391CD;
	Tue,  1 Sep 2026 16:41:53 +0800 (CST)
Received: from cncheex04.Hygon.cn (172.23.18.114) by cncheex03.Hygon.cn
 (172.23.18.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 1 Sep
 2026 16:41:58 +0800
Received: from cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d]) by
 cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d%10]) with mapi id
 15.02.1544.036; Tue, 1 Sep 2026 16:41:58 +0800
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
Subject: RE: [RFC PATCH v2 09/23] sched/cache: Account percpu sd task NUMA
 preference
Thread-Topic: [RFC PATCH v2 09/23] sched/cache: Account percpu sd task NUMA
 preference
Thread-Index: AQHdNiBCJVRJ7kz1s0edST4cJKOnbra43ACAgACSGvA=
Date: Tue, 1 Sep 2026 08:41:58 +0000
Message-ID: <5098b37beecd4249b49eb0942fc5058b@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-10-wujianyong@hygon.cn>
 <20260901075457.GO4120091@noisy.programming.kicks-ass.net>
In-Reply-To: <20260901075457.GO4120091@noisy.programming.kicks-ass.net>
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
> Sent: Tuesday, September 1, 2026 3:55 PM
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
> Subject: Re: [RFC PATCH v2 09/23] sched/cache: Account percpu sd task
> NUMA preference
>=20
> On Thu, Aug 27, 2026 at 08:28:02PM +0800, Jianyong Wu wrote:
> > Account for per-NUMA task count preferences within per-CPU sched
> domains,
> > mirroring the existing implementation of LLC task preference logic.
>=20
> So in general I would really appreciate a few words on *why* you're
> doing things. I mean, I can read the patch and see what it does, but I
> cannot divinate (esp. not without yet having read the rest of the
> patches) why you're doing things.
>=20

Fair point. This patch lays the groundwork for patch 12's NUMA-level
affinity score: that score weights each NUMA node by how many tasks on
the rq prefer it (numa_counts[node] * distance_delta), so we need a
per-node task count alongside the existing per-LLC count.=20

> This is esp. important for large series -- or series that do complicated
> things -- or like this case: both!

I'll document this motivation in the commit message.

Thanks
Jianyong
>=20
>=20


