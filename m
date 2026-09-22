Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0332773D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102345; cv=none; b=MVUInZzVdm23/cbqYkHs9wzYKa6+ajMST4cflAZVNy2dnNWNmEfQ+3E0TGIuO508qZSmO8rmElrM8zGgvKc2ciUpmufrgBQOpEdkeytwrtgmANCXhOrQ4UIHrzdsDTJL1cc4phft3aHTPXl55d+N7jXHUlRHa27S6gN9F1eTklA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102345; c=relaxed/simple;
	bh=HuG3XnawN8dKLAFss/ijwZ7TG4b3UZXI4qbSUN+0OPA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f3elTvY7vPR5CfDudM4qS+IR9na4xC7f+nm+zoXmptMD6/yGQJUp+k+qol60NmqyeRowc5jduj6YGK8sOHdb7AXMyL74EjRTa1UHFdZ92ShdDet2nc24OccncFYCTsdNLaVHUnt2zz8ga5MvsM0s57t6MyL/oXJhYF0Z1hpdncs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=huatf1OH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huatf1OH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790102344; x=1821638344;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=HuG3XnawN8dKLAFss/ijwZ7TG4b3UZXI4qbSUN+0OPA=;
  b=huatf1OHcOVZPmBMHT5N2Ql62bEewhDERb8P+EYr1g7EW7uWtt4xIxZa
   r0QD9AOJ18Wf9xDvW1j3RZnKb6sbZbnnH6VD5PjntmAkY/ggTzg3fYlHk
   E8p+yPvt/+qurUAPvxD570PwiDhOJLH3j7Mq7mRKxsIxyREeMjBUAh0sw
   mr8zChKspQlYblDPqucEs9hTGMOFKadTJaGBu2EKMjLDQo6MW8Wo5fpEP
   pyJQbfwefiHPm5qzcBHzrfBzCHP4VDZAN0dWXOfqfNreQRIjxFOWilLYz
   haAs39sqy0St9g9O3h8dUDlZ+rOaViHaJr6JvkJE4CmcVrNOQNkQNjLxk
   w==;
X-CSE-ConnectionGUID: CIdzM0qgQveRJQ2pScEB6Q==
X-CSE-MsgGUID: GGkAYjsdSfOGghjlpnN+Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="78288189"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="78288189"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 11:39:03 -0700
X-CSE-ConnectionGUID: Tel5TxJaQgeAHuE7Mt7fLA==
X-CSE-MsgGUID: 7neKGePaRW6cJa6EPTvv8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="278015642"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.110.39]) ([10.125.110.39])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 11:39:01 -0700
Message-ID: <da32ba66d95fd88869ba052f97698b9a4d6c3dc6.camel@linux.intel.com>
Subject: Re: [RFC PATCH v2 02/23] sched/topology: Introduce a NUMA distance
 matrix with unique distance values
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>, Jianyong Wu <wujianyong@hygon.cn>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, Chen Yu
 <yu.c.chen@intel.com>, Dietmar Eggemann	 <dietmar.eggemann@arm.com>, Steven
 Rostedt <rostedt@goodmis.org>, Ben Segall	 <bsegall@google.com>, Mel Gorman
 <mgorman@suse.de>, Valentin Schneider	 <vschneid@redhat.com>, K Prateek
 Nayak <kprateek.nayak@amd.com>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 Phil Auld <pauld@redhat.com>, Andrew Morton	 <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, 	linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, jianyong.wu@outlook.com, 	zhongyuan@hygon.cn,
 huangsj@hygon.cn, wangfengyu@hygon.cn, yingzhiwei@hygon.cn, 
	justin.he@arm.com
Date: Tue, 22 Sep 2026 11:38:59 -0700
In-Reply-To: <20260831115004.GF776954@noisy.programming.kicks-ass.net>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
	 <20260827122816.756234-3-wujianyong@hygon.cn>
	 <20260831115004.GF776954@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-08-31 at 13:50 +0200, Peter Zijlstra wrote:
> On Thu, Aug 27, 2026 at 08:27:55PM +0800, Jianyong Wu wrote:
> > Builds a refined node distance matrix based on the raw NUMA distance ma=
trix
> > provided by BIOS. The refined matrix preserves the relative ordering of
> > NUMA distances, while assigning distinct distance values to node pairs =
that
> > originally shared identical distances within each matrix row. This matr=
ix
> > is exclusively used for cache-aware scheduling and has no impact on exi=
sting
> > NUMA topology logic such as sched domain construction.
> >=20
> > For example, consider a system with 4 NUMA nodes. The raw BIOS-provided
> > distance matrix may look like this:
> >=20
> >         NODE0  NODE1  NODE2  NODE3
> > NODE0   10     20     20     30
> > NODE1   20     10     20     25
> > NODE2   20     20     10     20
> > NODE3   30     25     20     10
> >=20
> > Multiple duplicate distance values exist within each row. After the
> > deduplication step, the refined distance matrix becomes:
> >=20
> >         NODE0  NODE1  NODE2  NODE3
> > NODE0   10     15     20     30
> > NODE1   15     10     12     25
> > NODE2   20     12     10     15
> > NODE3   30     25     15     10
> >=20
> > All entries in each row are now unique, while adhering to two core prin=
ciples:
> > 1. The relative distance ordering from the original matrix is preserved=
.
> >    For instance, original distance(NODE0, NODE1) < distance(NODE0, NODE=
3),
> >    and this relative relationship is retained in the refined matrix as =
well.
> > 2. The matrix remains symmetric across its main diagonal. Maintaining
> >    symmetry is critical to guarantee consistent pairwise node distances=
.
>=20
> This example uses Node only, but the code in question is specifically
> aimed at Cache granularity; might it be better to use a cache example?
>=20
> A little something like so (I got tired of prompting Gemini to generate
> more complicates / less broken examples)...
>=20
> Pre:
>=20
> Cache |  C0   C1 |  C2   C3 |  C4   C5 |  C6   C7
> ------+----------+----------+----------+---------
>   C0  |  10   10 |  20   20 |  20   20 |  20   20
>   C1  |  10   10 |  20   20 |  20   20 |  20   20
> ------+----------+----------+----------+---------
>   C2  |  20   20 |  10   10 |  20   20 |  20   20
>   C3  |  20   20 |  10   10 |  20   20 |  20   20
> ------+----------+----------+----------+---------
>   C4  |  20   20 |  20   20 |  10   10 |  20   20
>   C5  |  20   20 |  20   20 |  10   10 |  20   20
> ------+----------+----------+----------+---------
>   C6  |  20   20 |  20   20 |  20   20 |  10   10
>   C7  |  20   20 |  20   20 |  20   20 |  10   10

I think what we really want is an ordering of caches within
the same NUMA node.  So when one cache is full, we can
pick the next one down the list.  That is essentially the
net effect of the distance de-duplication.

So how about introduce a llc_next array.  We will initialize
the array such that it will return the next LLC in
the NUMA node.  So for the example that Peter has above,
assuming C0 maps to LLC id 0, C1 maps to 1, etc.
then llc_next is

	    c0 c1 c2 c3 c4 c5 c6 c7
llc_next =3D [1  0  3  2  5  4  7  6]

When we come back to the orginal LLC we start off with,
we know that it is time to move on to a LLC in next closest
NUMA node.

This will be storage efficient and more straight forward
to use than maintaining an artificial cache distance matrix.

I dislike the artificial distance matrix also for the
reason that there is no guarantee that there are enough
available distance slots between two nodes.  Say if I
start with=20

        NODE0  NODE1  NODE2  NODE3
NODE0   10     20     20     30
NODE1   20     10     20     25
NODE2   20     20     10     20
NODE3   30     25     20     10

and there are 16 LLCs in NODE 1, I will run
out of slots when I try to deduplicate as
only 10 slots are available to fit 16 LLCs.

Tim

>=20
> Post:
>=20
> Cache |  C0   C1 |  C2   C3 |  C4   C5 |  C6   C7
> ------+----------+----------+----------+---------
>   C0  |  10   11 |  20   21 |  22   23 |  24   25
>   C1  |  11   10 |  21   20 |  23   22 |  25   24
> ------+----------+----------+----------+---------
>   C2  |  20   21 |  10   11 |  24   25 |  22   23
>   C3  |  21   20 |  11   10 |  25   24 |  23   22
> ------+----------+----------+----------+---------
>   C4  |  22   23 |  24   25 |  10   11 |  20   21
>   C5  |  23   22 |  25   24 |  11   10 |  21   20
> ------+----------+----------+----------+---------
>   C6  |  24   25 |  22   23 |  20   21 |  10   11
>   C7  |  25   24 |  23   22 |  21   20 |  11   10
>=20
>=20
> > Each row of this refined NUMA distance matrix is sorted in ascending or=
der to
> > generate a unique per-node affinity sequence. This sequence will guide
> > thread migration logic introduced in subsequent patches.
>=20
> IIRC greedy has significant worse bounds than many other schemes. This
> would result in more unique distances than strictly needed here, right?
>=20
> Since this is all on slow paths anyway, does it make sense to pick a
> slightly better algorithm in order to reduce this bound and get better
> results?
>=20
> Anyway, let me continue trying to dig through all this.
