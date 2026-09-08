Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91519373C12
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853422; cv=none; b=oBhCHh89fMNN8IsU/MOObrsfYMxorK/+3UmxDBSWy9izLbS679mazI4ARMAUN0H8232SlYkaLkht5JJ/CYWSPm+k+gGq6eKfruvlThd4XSznDEmAOoiHQa/Z/2gQ4PW8+7cr9orDN5QYcVcg02f7trkjbVMHoVzycYkt59daZss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853422; c=relaxed/simple;
	bh=NK5G9o5ezsAsqrBCZmwJLNi0WCgJ8f/urKL18vh3vyU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PRY7BIBYE/7FMT7aunzLK6/vj1MSMkc/P4IvQffcn96N5SqyfmkEdlOzvLwKoK3Oy+Qu0zOLm7DJM57KTNGL3qKa9IcRXhJGco74idjamF+9zVGbr4A7QSY+5iriNFTbP78KaRdQ0w0ztcP2XrS8Jaqt0PlzURSHUs3Mck/KPgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hfGBv4PwRzVcB6;
	Tue,  8 Sep 2026 15:43:19 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hfGBv23GPzVcB6;
	Tue,  8 Sep 2026 15:43:19 +0800 (CST)
Received: from cncheex05.Hygon.cn (unknown [172.23.18.115])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id F06E330A6E44;
	Tue,  8 Sep 2026 15:39:14 +0800 (CST)
Received: from cncheex04.Hygon.cn (172.23.18.114) by cncheex05.Hygon.cn
 (172.23.18.115) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 8 Sep
 2026 15:43:19 +0800
Received: from cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d]) by
 cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d%10]) with mapi id
 15.02.1544.036; Tue, 8 Sep 2026 15:43:19 +0800
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
Subject: RE: [RFC PATCH v2 20/23] sched/cache: Estimate utilization of the
 whole thread group
Thread-Topic: [RFC PATCH v2 20/23] sched/cache: Estimate utilization of the
 whole thread group
Thread-Index: AQHdNpMnbRlIzduVrECfPaikBnRoA7a5TZ6AgAsO2lA=
Date: Tue, 8 Sep 2026 07:43:18 +0000
Message-ID: <3994638d89da4fd58365cefe62ff94ed@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260828021156.785662-1-wujianyong@hygon.cn>
 <20260901144449.GJ776954@noisy.programming.kicks-ass.net>
In-Reply-To: <20260901144449.GJ776954@noisy.programming.kicks-ass.net>
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

Sorry for the late reply.

> -----Original Message-----
> From: owner-linux-mm@kvack.org <owner-linux-mm@kvack.org> On
> Behalf Of Peter Zijlstra
> Sent: Tuesday, September 1, 2026 10:45 PM
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
> Subject: Re: [RFC PATCH v2 20/23] sched/cache: Estimate utilization of th=
e
> whole thread group
>=20
> On Fri, Aug 28, 2026 at 10:11:56AM +0800, Jianyong Wu wrote:
>=20
> > +					mm_util =3D mul_u64_u32_div(cpu_util,
> > +							min_t(unsigned long, occ, NICE_0_LOAD),
> > +							NICE_0_LOAD);
>=20
> mul_u64_u32_shr(..., NICE_0_LOAD_SHIFT);
>=20
> will probably generate better code -- I *think* the mul_u64_u32_div()
> ends up being inline asm and as such cannot optimize the divide
> properly.
>=20
Good point, will fix.

Thanks
Jianyong

