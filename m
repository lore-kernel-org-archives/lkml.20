Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A156738C423
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331417; cv=none; b=hj2Qe8FT5lpJmYqV8uwPmI5AlFpf/VMbisTbAej43bjH8wzkIGkpMEgCgB8P7lxq2Z/1iMb32t7ZbstN55KKZjCL3O4OsqdpeocHQ6ezi08fH4D25072HSFNGumVAOOs1b1HtLfCHNdbdM4/7P+jjAjQEVs7HFNOFVMddCX05ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331417; c=relaxed/simple;
	bh=r9iRZSOl8Tt/Kh07e/86WqYizMIyCf13BvOcPpY5xIU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p2uxC4LdNyYIrnng9NA9R7uOMYfF95BUfaQB2QohTAvfV1VwZmYtc84NMWNk2rk8H9llnUnyEAQF2P8ewBEF7pgc/F94tnRyT1vcE5He8nMF9VCNPxoYU2nLPU3pmNBM33iqol4MRk80zqxalWl/uZBFdSgccw19BYo7XCoOMK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hZY8K4nwCz3kRHS;
	Wed,  2 Sep 2026 14:43:13 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hZY8J0t11zB2MsD;
	Wed,  2 Sep 2026 14:43:12 +0800 (CST)
Received: from cncheex05.Hygon.cn (unknown [172.23.18.115])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id 9BC1936F1F84;
	Wed,  2 Sep 2026 14:39:19 +0800 (CST)
Received: from cncheex04.Hygon.cn (172.23.18.114) by cncheex05.Hygon.cn
 (172.23.18.115) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 2 Sep
 2026 14:43:12 +0800
Received: from cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d]) by
 cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d%10]) with mapi id
 15.02.1544.036; Wed, 2 Sep 2026 14:43:12 +0800
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
Subject: RE: [RFC PATCH v2 17/23] sched/fair: Fine-granularity NUMA balancing
Thread-Topic: [RFC PATCH v2 17/23] sched/fair: Fine-granularity NUMA balancing
Thread-Index: AQHdNpKMDbSLcq9Yek+pOPkvBmkkCba5LN8AgAGoa8A=
Date: Wed, 2 Sep 2026 06:43:12 +0000
Message-ID: <cad0ece3700c4ff894c1d6d26fa24a77@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260828020731.785556-1-wujianyong@hygon.cn>
 <20260901124736.GI776954@noisy.programming.kicks-ass.net>
In-Reply-To: <20260901124736.GI776954@noisy.programming.kicks-ass.net>
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
> Sent: Tuesday, September 1, 2026 8:48 PM
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
> Subject: Re: [RFC PATCH v2 17/23] sched/fair: Fine-granularity NUMA
> balancing
>=20
> On Fri, Aug 28, 2026 at 10:07:31AM +0800, Jianyong Wu wrote:
> > NUMA balancing currently consists of two coupled components:
> > task migration and page migration. These two mechanisms work in
> tandem.
> > However, task migration may conflict with other subsystems such as CAS,
> > which aggregates tasks solely via task migration. Conflicts arise when
> > both CAS and NUMA balancing are enabled simultaneously.
> >
> > This patch addresses the problem by introducing a fine-grained NUMA
> > balancing mechanism, allowing task migration and page migration to
> > be enabled or disabled independently.
>=20
> Sorry, but this doesn't make sense.
>=20
> At every point NUMA migration should take precedence over LLC. The
> remote node penalty is much greater than the 'other' llc penalty.
>=20
> It is always beneficial to get tasks placed near the memory, and if
> tasks cannot be so moved, to move memory near to where the tasks are.
>=20
> As a secondary concern, it is beneficial to keep tasks constrained to a
> minimal set of LLCs inside this node.
>=20
> Disabling page-migration or numa task-migration separately completely
> wrecks things and you might as well just disable NUMA balancing.
>

Understood. My intention was to avoid conflicting task-migration decisions
between NUMA balancing and cache-aware scheduling. I agree that separating
NUMA task migration from page migration breaks the coordination between
task and memory placement. I will drop this patch.

I think patch 18, which folds the preferred nodes of all tasks in the
thread group into the scan range, may help mitigate the conflict between
CAS and NUMA balancing.

> Now, if the process spans multiple nodes we should go do the same again
> as this patch set does for llc, spread/interleave over the minimal set
> of nodes that do fit.

I think this patch set has the ability to spread threads into the minimal s=
et of LLCs
even when the tasks span multiple nodes. This is the main aim of this patch=
 set.

Thanks
Jianyong

