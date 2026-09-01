Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2037135E948
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266068; cv=none; b=SjhJ/fBEdzTrc/mX0yaI55QSh0/KUy3tNuobI7daU0OsrcHGu/OeRn6+E6w0MPshg4uNihjdN97Vx0IefREZCNU2f8P4y+CMlM/Kil0Cf6pmOuoxA0K6dV56fX0DbsH03NUTsQj+p8boaVBoOCNbOUFWGW11Lutz0/Z5+Pg33+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266068; c=relaxed/simple;
	bh=8Jtvv9mv/xg4aveNOd1HeMJvNPBMI8Rc+/ZHL8DjJkM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PIghAP6wwihdELl9RtiNoWTaiY+SV8eGQ438Rf7cD5Fhfs28YkVsBp9uK/FMGa5vUyEB11eDsKOWfQAGhuMHSOeCK4eec72iPtf0zNGDoa2Q9QD4Ow9yGv6dQPxAJP1/lQhAmQgm6vd1JaeHzsms+1Im7H1KZShmWrU2NMODP18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hZ4zf4DtTz1PGD4;
	Tue,  1 Sep 2026 20:34:06 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hZ4zc1rRHz1PGCm;
	Tue,  1 Sep 2026 20:34:04 +0800 (CST)
Received: from cncheex06.Hygon.cn (unknown [172.23.18.116])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id C6D60B355;
	Tue,  1 Sep 2026 20:33:58 +0800 (CST)
Received: from cncheex04.Hygon.cn (172.23.18.114) by cncheex06.Hygon.cn
 (172.23.18.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 1 Sep
 2026 20:34:04 +0800
Received: from cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d]) by
 cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d%10]) with mapi id
 15.02.1544.036; Tue, 1 Sep 2026 20:34:04 +0800
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
Subject: RE: [RFC PATCH v2 12/23] sched/cache: Introduce rq affinity gain
 calculation
Thread-Topic: [RFC PATCH v2 12/23] sched/cache: Introduce rq affinity gain
 calculation
Thread-Index: AQHdNiBG+fpHPMsZSUaXodgYa50Q5ra5A3GAgACsSKA=
Date: Tue, 1 Sep 2026 12:34:03 +0000
Message-ID: <e92cc24da4c94d6d9d20383921adf5da@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-13-wujianyong@hygon.cn>
 <20260901101607.GG776954@noisy.programming.kicks-ass.net>
In-Reply-To: <20260901101607.GG776954@noisy.programming.kicks-ass.net>
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
> Sent: Tuesday, September 1, 2026 6:16 PM
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
> Subject: Re: [RFC PATCH v2 12/23] sched/cache: Introduce rq affinity gain
> calculation
>=20
> On Thu, Aug 27, 2026 at 08:28:05PM +0800, Jianyong Wu wrote:
>=20
> > +static int get_affi_llcs(struct sched_domain *sd, int src_llc, int dst=
_llc,
> > +			 int *affi_llcs, int *affi)
> > +{
>=20
> > +			if (src_llc > dst_llc) {
> > +				affi[j] =3D clamp(src_llc - dst_llc, 1, 1024);
> > +				affi_llcs[j++] =3D i;
> > +			}
>=20
> > +	return j;
> > +}
> > +
> > +static int get_affi_numas(int src_node, int dst_node, int *affi_nodes,=
 int
> *affi)
> > +{
>=20
> > +		if (src_dist > dst_dist) {
> > +			affi[j] =3D clamp(src_dist - dst_dist, 4, 1024);
> > +			affi_nodes[j++] =3D node;
> > +		}
>=20
> > +	return j;
> > +}
> > +
> > +static int calc_affinity_numa_score(struct sched_domain *sd, int src_c=
pu,
> int dst_cpu,
> > +			int *affi_node, int *affi, int *last_node, int *num)
> > +{
> > +	int src_node, dst_node, score =3D 0;
> > +
> > +	src_node =3D cpu_to_node(src_cpu);
> > +	dst_node =3D cpu_to_node(dst_cpu);
> > +	if (src_node !=3D *last_node) {
> > +		*last_node =3D src_node;
> > +		memset(affi_node, 0, (max_lid + 1) * sizeof(int));
> > +		memset(affi, 0, (max_lid + 1) * sizeof(int));
>=20
> This and..
>=20
> > +		*num =3D get_affi_numas(src_node, dst_node, affi_node, affi);
> > +	}
> > +
> > +	for (int i =3D 0; i < *num; i++) {
> > +		if ((unsigned int)affi_node[i] < nr_node_ids)
> > +			score +=3D sd->numa_counts[affi_node[i]] * affi[i];
> > +	}
> > +
> > +	return score;
> > +}
> > +
> > +static int calc_affinity_llc_score(struct sched_domain *sd_cur, struct
> sched_domain *sd,
> > +			int src_cpu, int dst_cpu, int *affi_llc,
> > +			int *affi, int *last_llc, int *num)
> > +{
> > +	int src_llc, dst_llc, score =3D 0;
> > +
> > +	src_llc =3D llc_id(src_cpu);
> > +	dst_llc =3D llc_id(dst_cpu);
> > +
> > +	if (src_llc !=3D *last_llc) {
> > +		*last_llc =3D src_llc;
> > +		memset(affi_llc, 0, (max_lid + 1) * sizeof(int));
> > +		memset(affi, 0, (max_lid + 1) * sizeof(int));
>=20
> ... this. Why do we need the memset()? AFAICT the get_affi_*() functions
> use direct assignment and the sum is limited to the number returned.
>=20

Yes, the memset is unnecessary. get_affi_*() assigns directly from
index 0 and the sum loop only reads the *num entries it returned, so the
rest of the array is never touched. I'll drop it.

Thanks
Jianyong
> > +		*num =3D get_affi_llcs(sd_cur, src_llc, dst_llc, affi_llc, affi);
> > +	}
> > +
> > +	for (int i =3D 0; i < *num; i++) {
> > +		if ((unsigned int)affi_llc[i] < sd->llc_max)
> > +			score +=3D sd->llc_counts[affi_llc[i]] * affi[i];
> > +	}
> > +
> > +	return score;
> > +}


