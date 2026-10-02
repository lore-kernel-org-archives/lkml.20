Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C173945D939
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790976996; cv=none; b=ITetfwVpZ+Aq0Z4NMhub0Us8m6C7gN3JHikv8we3zeIdhUzsDjyw01K/m5gfGxMN4AssuSQRrkYPtXw0kLOhBMDTtX/mpJLjyHIQNLOm0hJPZjy/q0wzdeCJTwlnD0ae8bP/lQUOgobQfSenYCFr0ItKHyKp6ZbKv4eY8/idxrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790976996; c=relaxed/simple;
	bh=0SkmrcqK3/V5SNi0TtrnPL4ttC+EtvZ3quhkJzheAq4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gD+WPIwuvLQimza2dLAjnlIpYjuCMa6qXI/7fomOz4faGRJRcHaCVTiujW4XM4fpPc4N3t/H0N92GJf2aLBa3oJ8pggJACO/0N+ZS1uLbxSRxmi8Eh85O4XACIUHvx/AyVZp0oz0UwStR8WM+abDkDnHIqYn2xyymmR4jHASy10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DKgDdwW4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DKgDdwW4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790976991; x=1822512991;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=0SkmrcqK3/V5SNi0TtrnPL4ttC+EtvZ3quhkJzheAq4=;
  b=DKgDdwW4RJ5uMzNuWGDqWZHdvZQB/xs2189AnqumEc/2vqu5Mv4b549g
   6E81yeQoZ2cDJRMZAnwvJRRWlxJ4T6Yp4h94TVnIZ9irUduKOzscPUP47
   9ubIWCA3AeorItV22BebIWPfA/ZR0+mnLk71bHHuKZRl76HmP9uEd8aNy
   MhE34vl7qyCDWa3zpO8XqfaNSY5jeCw4X/bOaP1rTcameMRzEl5LHAURM
   b1NK7CW9XTxIorRO3YbeakQMIthVlfvfllwuYH3uoo0eMYRJ5fel5D+Gj
   hvnuyhMI3iXTW/3amyfVLbAVtnINm3Uq1DnD/4gTTzy4LS1lk3WGoYrU8
   w==;
X-CSE-ConnectionGUID: QCmkuAUCQgiF5s1VucWrmw==
X-CSE-MsgGUID: kfNRANOgSGGHDqWYVliQaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="101078599"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="101078599"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 14:36:26 -0700
X-CSE-ConnectionGUID: mtjbZGTAQmW9D0HeVJAV7g==
X-CSE-MsgGUID: DBwWWoHBS3yaOPZA3I/8GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="274150050"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.108.68]) ([10.125.108.68])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 14:36:25 -0700
Message-ID: <b71a4c1c1ea96f786672f1c18f39a85252f4baa3.camel@linux.intel.com>
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
Date: Fri, 02 Oct 2026 14:36:24 -0700
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
