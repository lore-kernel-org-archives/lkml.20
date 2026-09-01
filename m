Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9532445563D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248664; cv=none; b=jvMsUVb6asi/8s3my3odoHq9q/Xknhewvt2bRSHgqepaA/MkMnyWjCtDxphSrQEGgnZ/BdRnnaPHUn49UH8XBilF2nvr/p4Tk++IivusIUqDVjW1iK4CoJW00mSkYHZ24MfFTR2+jtJKzALvcv0SLW7Q1IoOFmyaAXcns2+STP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248664; c=relaxed/simple;
	bh=WPeKMITdc6NNFvQy+ZCvC6oVHtvCFdQY7IqatDoo4Ys=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iq9V9yc+OEZfTLL3XezYF2feN+Yk/e1LjJKN7XPalFviJlR8hGoJ/Qt/2EjMDoYdF4FjbbROPbzwHJaj8ZUeKiPivtwrz4/TqLmQ+UvMxxJOSU9zcHC8LCIZUZL6xohkvrV610DDgbkBPupJ7RRIu/MODVLu7EvkfHJfgWy8FEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hYyY25fKwz1PGCN;
	Tue,  1 Sep 2026 15:44:06 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hYyXz6XqWz1PGCN;
	Tue,  1 Sep 2026 15:44:03 +0800 (CST)
Received: from cncheex05.Hygon.cn (unknown [172.23.18.115])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id 24A5330004D2;
	Tue,  1 Sep 2026 15:40:13 +0800 (CST)
Received: from cncheex04.Hygon.cn (172.23.18.114) by cncheex05.Hygon.cn
 (172.23.18.115) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 1 Sep
 2026 15:44:04 +0800
Received: from cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d]) by
 cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d%10]) with mapi id
 15.02.1544.036; Tue, 1 Sep 2026 15:44:04 +0800
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
Subject: RE: [RFC PATCH v2 07/23] sched/cache: Prioritize preferred NUMA node
 selection over LLC selection
Thread-Topic: [RFC PATCH v2 07/23] sched/cache: Prioritize preferred NUMA node
 selection over LLC selection
Thread-Index: AQHdNiA/Gl7/wvc7qkaJjcGUBBSfi7a3o5GAgAG7IQA=
Date: Tue, 1 Sep 2026 07:44:04 +0000
Message-ID: <62e8081a9432407893fb6a9a8e397d87@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-8-wujianyong@hygon.cn>
 <20260831131643.GK4120091@noisy.programming.kicks-ass.net>
In-Reply-To: <20260831131643.GK4120091@noisy.programming.kicks-ass.net>
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
> Sent: Monday, August 31, 2026 9:17 PM
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
> Subject: Re: [RFC PATCH v2 07/23] sched/cache: Prioritize preferred NUMA
> node selection over LLC selection
>=20
> On Thu, Aug 27, 2026 at 08:28:00PM +0800, Jianyong Wu wrote:
>=20
> > +	/*
> > +	 * Avoid switching sc_stat.cpu too fast. The reason to choose 2X is
> > +	 * because:
> > +	 * 1. It is better to keep the preferred LLC stable, rather than
> > +	 *    changing it frequently and cause migrations
> > +	 * 2. 2X means the new preferred LLC has at least 1 more busy CPU
> than
> > +	 *    the old one(200% vs 100%, eg)
> > +	 * 3. 2X is chosen based on test results, as it delivers the optimal
> > +	 *    performance gain so far.
> > +	 *
> > +	 * Moving to another node takes precedence over moving inside the
> > +	 * current one, as it did when the two updates were applied in that
> > +	 * order.
> > +	 */
>=20
> Comments should never refer to old code that no longer exists. Comments
> are for the code as it is now. If you want to expand on details of the
> transition from one implementation to the next, that's what the
> Changelog is for.
>=20
Sorry, I'll remove the "as it did when..." part and keep the comment to the=
 current behavior only.

Thanks
Jianyong
> > +	if (m_a_n_occ > 2 * curr_m_a_n_occ)
> > +		new_cpu =3D m_a_n_cpu;
> > +	else if (pref_llc_cpu >=3D 0 && pref_llc_occ > 2 * curr_m_a_occ)
> > +		new_cpu =3D pref_llc_cpu;
> > +
> > +	if (new_cpu >=3D 0)
> > +		WRITE_ONCE(mm->sc_stat.cpu, new_cpu);
> >
> >  	update_avg_scale(&mm->sc_stat.nr_running_avg, nr_running);
> >  	free_cpumask_var(cpus);
> > --
> > 2.34.1
> >
> >


