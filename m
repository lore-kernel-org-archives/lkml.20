Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F073E4109
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 21:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791237383; cv=none; b=djH8TPO7ENTLFIiqrpAEVG3LL1XDzwAfJJ8/+MiLp7ur0soTrI4+nbh95lOjIEn8VDkqn1FRmRnaCjvGmEyAGmy19T0FHGv6AhN7mhv1uQLkklFAUxJaCWa6hGFBGXgY9SXEx7Uyh077ocM78SPzX7laNa/y3fqPmBb7+mzVluI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791237383; c=relaxed/simple;
	bh=wNOk1B9Fw6kEVDJfH7+3oqs1YGf9LbkX9L4EQd5SBj0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dkkKtXAL+a9LGKHOuZ7UCZJSzFs3bxFfQtBVrevBk34ZWBc5ZcNmMwqGj+R2+p+PJsjyY5jZz3u3DvsHo4bs9pvfz6WfOb/qrP9fjEaQk/PlHsXGW5Bq37T+N7Ix/JOaWWea2btfbQThga+/1SbHPGktlV4cc71uekrAgr3Tjjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cOHK3jfF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cOHK3jfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791237381; x=1822773381;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=wNOk1B9Fw6kEVDJfH7+3oqs1YGf9LbkX9L4EQd5SBj0=;
  b=cOHK3jfFDOkIOgwZuM3i9u/qRCjfENwU+DyYqKWW0OZ9uT58kIbYiD9T
   0V6J6XWb1OhFRFyViI4QVuLrSB3d6Kovh7eUICHQhQGt0f7G/fz5yfiS8
   +HCLIRdF1yhaLT0Wpq4EdOE1115JvUIB0dIVQLPgXKbp8Q69YnZlpqMdy
   E1JBT15gV4OhxGYrH1I08XLwxf9Vr68qXpQn0qSsrwmUbwXFdPnEn3L4c
   Vep3CJDcupOOgWaV7c4gDpV3Z+qtuPWb4v4rZVT0/42eLM22qO7X5OI/z
   kXwO3yOFZfwCVSG/bPFZwzEBrlPtfvIYFHjZi5EnKSW/JC0IGts0BbwZo
   w==;
X-CSE-ConnectionGUID: 9sfsx3SCSNibqYmnrAnaUw==
X-CSE-MsgGUID: /f/GOgV4RpOeMFSew+eA/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91781473"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="91781473"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 14:56:20 -0700
X-CSE-ConnectionGUID: FRZaB1ViTt2K4vhg49zCww==
X-CSE-MsgGUID: UnIrFq5xQjOkNy0EYmrDug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="280215996"
Received: from unknown (HELO [10.241.243.185]) ([10.241.243.185])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 14:56:20 -0700
Message-ID: <ff375bd27d03f4e13552c39b212c839254409b70.camel@linux.intel.com>
Subject: Re: [PATCH v2 1/3] sched/fair: Add smt_balance and llc_balance to
 the decision matrix
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Jemmy Wong <jemmywong512@gmail.com>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot	 <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt	
 <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman	
 <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek
 Nayak	 <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org
Date: Mon, 05 Oct 2026 14:56:19 -0700
In-Reply-To: <20261002154634.71878-2-jemmywong512@gmail.com>
References: <20261002154634.71878-1-jemmywong512@gmail.com>
	 <20261002154634.71878-2-jemmywong512@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-10-02 at 23:46 +0800, Jemmy Wong wrote:
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
> As busiest, group_llc_balance is not an unconditional force. Against a
> local has_spare group it forces the pull when prefer_sibling is set,
> because the group_llc_balance test comes before sibling_imbalance() in
> sched_balance_find_src_group(). SD_PREFER_SIBLING is only cleared for
> NUMA domains. Against a local fully_busy or imbalanced group the nr_idle
> checks apply, and against a local overloaded group the local group is
> busier and the pair is balanced.
>=20
> No functional change.
>=20
> Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>

Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>

Tim

> ---
>  kernel/sched/fair.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 57360f5cdde4..bcb9987952b9 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -13184,13 +13184,15 @@ static inline void calculate_imbalance(struct l=
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
> + * llc_balance      force     nr_idle    N/A   N/A  N/A  nr_idle   N/A  =
balanced
> + * overloaded       force     force      N/A   N/A  N/A  force     N/A  =
avg_load
>   *
>   * N/A :      Not Applicable because already filtered while updating
>   *            statistics.
