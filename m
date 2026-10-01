Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC3C493D29
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790890502; cv=none; b=W9HWc9twhOlT/4SwbVdOeOmkPGhgI5MG8ZXYrAkzaX20HUW7ruD6IAk6qpPqQCbZL55C4Q245FwzTzJP678HuegqDPT24KS0PK6dUGLD8MO22ynKODLQv1ETM109pqJpy+maW3Oiu3KVhmhLbQ4QyghTnfeq886u7SkgAQtnJZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790890502; c=relaxed/simple;
	bh=nInExJJAIMRYT3jRnh0HyI2QeETviSjgpKZt2A8C92A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=txHWoKaw1tbhTHc432tZxHb+SWdO7mvTFzL+8xRlppIdM5lSmQv/ytVW5WTVIgd6aLVm9e0lkIjRiWsyw7EnQPTak/TvD4Ohgd1l1jGUImirjxfBYm0VROyAz7VXbhgv25fBR7fuUTLkfcADHsHEyAYvxQ0QHcWO+PTHVMzpvig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jlmaD9ST; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jlmaD9ST"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790890498; x=1822426498;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=nInExJJAIMRYT3jRnh0HyI2QeETviSjgpKZt2A8C92A=;
  b=jlmaD9STZ4dfV7oDC1th30vTesp2QuOB0+QmJfz0en5BYjPIC05+W7MU
   0C+NWj5GfCojK0QkzRvXt//FVsm3GqodIsA2nYqNWxCpXSmo09hu4Oeay
   ps/timwwNFWIGRngNaxGKxihfZtRTTMlgfuqId3mhCiaJBUhK4T34xzmg
   0V5IZDgimZGUFwkE6nMPjOr/iidkbYWCuL+Uq5aLDhBqbiG6Yh158cvx6
   1XZ6EhgRk+9Cr9qOxVlHL8QiPHSwyQBKffikbifYvwZGnQ3sYTLUigWhg
   qhOdbR/JggjUkJAyNpMHUy0brEbD80IjFW5n7Bw5IUlApxXc47Pn4525j
   g==;
X-CSE-ConnectionGUID: ce++8kNDSiObOxHOPG5fDg==
X-CSE-MsgGUID: jPg+pMDTTR+UhMcLwAQyrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="95473732"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="95473732"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 14:34:56 -0700
X-CSE-ConnectionGUID: /U7JZTmmTCui1YFTRNqrqw==
X-CSE-MsgGUID: jw0YYG9jRV+xuOp3ls3hzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="177025"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.108.6]) ([10.125.108.6])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 14:34:55 -0700
Message-ID: <57c0b8017ec57818815dd833963b594304d61447.camel@linux.intel.com>
Subject: Re: [PATCH 1/3] sched/fair: Add smt_balance and llc_balance to the
 decision matrix
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Jemmy Wong <jemmywong512@gmail.com>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot	 <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt	
 <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman	
 <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek
 Nayak	 <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org
Date: Thu, 01 Oct 2026 14:34:54 -0700
In-Reply-To: <20260928042018.10618-2-jemmywong512@gmail.com>
References: <20260928042018.10618-1-jemmywong512@gmail.com>
	 <20260928042018.10618-2-jemmywong512@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-09-28 at 12:20 +0800, Jemmy Wong wrote:
> The group-type matrix was introduced in commit 0b0695f2b34a
> ("sched/fair: Rework load_balance()"). When commit fee1759e4f04
> ("sched/fair: Determine active load balance for SMT sched groups")
> added group_smt_balance and commit f38cc2f0d8a3 ("sched/cache:
> Prioritize tasks preferring destination LLC during balancing")
> added group_llc_balance, neither commit updated the matrix table.
>=20
> Both types are only tagged on non-local groups in update_sg_lb_stats(),
> so their local columns are N/A.
>=20
> As busiest, group_smt_balance is only set when dst_cpu is idle and the
> SMT group runs more than one task. Against a local has_spare or
> fully_busy group it goes through the nr_idle checks, where a non-SMT
> dst group may also force the pull via smt_vs_nonsmt_groups(). Against a
> local imbalanced or overloaded group the local group is busier and the
> pair is balanced.
>=20
> As busiest, group_llc_balance is not an unconditional force. A local
> overloaded group is busier and the pair is balanced; otherwise the
> nr_idle checks apply, with prefer_sibling still able to force the pull
> when the local group has spare capacity.
>=20
> No functional change.
>=20
> Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
> ---
>  kernel/sched/fair.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 7455a83a6a99..f9ddcecfd19d 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12947,13 +12947,15 @@ static inline void calculate_imbalance(struct l=
b_env *env, struct sd_lb_stats *s
>  /*
>   * Decision matrix according to the local and busiest group type:
>   *
> - * busiest \ local has_spare fully_busy misfit asym imbalanced overloade=
d
> - * has_spare        nr_idle   balanced   N/A    N/A  balanced   balanced
> - * fully_busy       nr_idle   nr_idle    N/A    N/A  balanced   balanced
> - * misfit_task      force     N/A        N/A    N/A  N/A        N/A
> - * asym_packing     force     force      N/A    N/A  force      force
> - * imbalanced       force     force      N/A    N/A  force      force
> - * overloaded       force     force      N/A    N/A  force      avg_load
> + * busiest \ local has_spare fully_busy misfit smt asym imbalanced llc o=
verloaded
> + * has_spare        nr_idle   balanced   N/A   N/A  N/A  balanced  N/A  =
balanced
> + * fully_busy       nr_idle   nr_idle    N/A   N/A  N/A  balanced  N/A  =
balanced
> + * misfit_task      force     N/A        N/A   N/A  N/A  N/A       N/A  =
N/A
> + * smt_balance      nr_idle   nr_idle    N/A   N/A  N/A  balanced  N/A  =
balanced
> + * asym_packing     force     force      N/A   N/A  N/A  force     N/A  =
force
> + * imbalanced       force     force      N/A   N/A  N/A  force     N/A  =
force

Thanks for picking this up - nice to have the table match the code
again. I walked the new rows and columns against
sched_balance_find_src_group(), and they line up, with one exception:

> + * llc_balance      nr_idle   nr_idle    N/A   N/A  N/A  nr_idle   N/A  =
balanced

I think local=3Dhas_spare, busiest=3Dllc_balance is "force", not "nr_idle":

        if (sds.prefer_sibling && local->group_type =3D=3D group_has_spare =
&&
            (busiest->group_type =3D=3D group_llc_balance ||
             sibling_imbalance(env, &sds, busiest, local) > 1))
                goto force_balance;

The group_llc_balance clause short-circuits the sibling_imbalance()
test, so this pair forces unconditionally once prefer_sibling is set,
and prefer_sibling is set for LLC-vs-LLC balancing: the groups span
per-LLC (SD_SHARE_LLC) domains, which keep SD_PREFER_SIBLING (only
SD_NUMA strips it). That also matches your changelog ("prefer_sibling
still able to force the pull...") - the table just reads nr_idle where
the prose says force.

Could you flip that one cell?

 * llc_balance      force     nr_idle    N/A   N/A  N/A  nr_idle   N/A  bal=
anced

Thanks.

Tim

> + * overloaded       force     force      N/A   N/A  N/A  force     N/A  =
avg_load
>   *
>   * N/A :      Not Applicable because already filtered while updating
>   *            statistics.
