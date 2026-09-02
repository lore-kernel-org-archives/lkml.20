Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670CC370AF5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 05:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788328042; cv=none; b=jzdUvhfQdhWbAZNYfJfOtPdIc9NSU0WrmoLujCtMTPFXfGvdhRhOXZC8VJmxSNsgBP6FdwR1PKzKzHwrGFxn+CvFWXWvAKUr18GFH4yuAY4ZUaCPc3FUvQu9qXuJgh5eQDGTJm0JDMWdBNhKNMjUnIXgdbH25j3haCqo5hu60ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788328042; c=relaxed/simple;
	bh=krRo7FtC1rquekV/lVVspFNsdqDtO+e9ElrBqOuu3uY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Pr2d8x46PN5B/FaYrXtDopUVzlZXYsntBKALGyC7lPWKxYlCNFu3Ru2DE4sTtAIdp+1MmRzOMrYWXwtHOCt1G0G28DcRpC5NaNkrFB1P2xv7g6IQ+kKFsVsB/wFWlec7dd9Wxi8hfuMfkR84/YuYSGyIjaKIJ11KFzZ5fMzF/LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hZWvT2gDjz2LvWy;
	Wed,  2 Sep 2026 13:47:01 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hZWvQ4pSJz2LvX2;
	Wed,  2 Sep 2026 13:46:58 +0800 (CST)
Received: from cncheex05.Hygon.cn (unknown [172.23.18.115])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id 28E3116E4;
	Wed,  2 Sep 2026 13:46:53 +0800 (CST)
Received: from cncheex04.Hygon.cn (172.23.18.114) by cncheex05.Hygon.cn
 (172.23.18.115) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 2 Sep
 2026 13:46:59 +0800
Received: from cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d]) by
 cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d%10]) with mapi id
 15.02.1544.036; Wed, 2 Sep 2026 13:46:59 +0800
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
Subject: RE: [RFC PATCH v2 11/23] sched/cache: Introduce helpers for task
 migration decisions
Thread-Topic: [RFC PATCH v2 11/23] sched/cache: Introduce helpers for task
 migration decisions
Thread-Index: AQHdNiBFF6wQCkMonke4aXPvTe8F7La5GKyAgAG3MCA=
Date: Wed, 2 Sep 2026 05:46:59 +0000
Message-ID: <89add08a0761429a851196d7ea5a10a2@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-12-wujianyong@hygon.cn>
 <20260901113207.GZ687043@noisy.programming.kicks-ass.net>
In-Reply-To: <20260901113207.GZ687043@noisy.programming.kicks-ass.net>
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
> Sent: Tuesday, September 1, 2026 7:32 PM
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
> Subject: Re: [RFC PATCH v2 11/23] sched/cache: Introduce helpers for task
> migration decisions
>=20
> On Thu, Aug 27, 2026 at 08:28:04PM +0800, Jianyong Wu wrote:
>=20
> > +static bool get_span_stats(const struct cpumask *span, unsigned long
> *util_out,
> > +					unsigned long *cap_out)
> > +{
> > +	cpumask_var_t mask;
> > +	int cpu;
> > +	unsigned long util_tmp, cap_tmp, util =3D 0, cap =3D 0;
> > +	struct sched_domain *sd_tmp;
> > +
>=20
> We prefer inverse xmas ordering -- where possible. So please go through
> the code and re-arrange things. Eg. the above becomes:
>=20
OK, I'll go through the patch and re-order the variable declarations into
inverse christmas tree style.

Thanks
Jianyong
> > +	unsigned long util_tmp, cap_tmp, util =3D 0, cap =3D 0;
> > +	struct sched_domain *sd_tmp;
> > +	cpumask_var_t mask;
> > +	int cpu;


