Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CFA4078DC
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790891704; cv=none; b=fyH9nmwN6Shqc0lF0o9aFbv6yGz/8H0/Hb+3mnLJRvoQ2WgkGltk6pEsmnFpfPGeBMVPEIV0ojV+Wz5Be63wBhz+MDZMSjOJ9nW36ZwRIhRUy/f0AieIDkIll28GODEJI3BHBsBmhYPF5y4er4U4n2EkCgHnHbucTadbdtaprPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790891704; c=relaxed/simple;
	bh=k227Sw7GESYXAbhF/BZM1Xe5SlltP8tDEyv8sVotVGw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=np4NUUbfwN5SsAC43iOXiuOZ+hDTw8Y52uG2azJ45OsRJGT4MGr7kyh8TBFDT0QKptzE5+1HAs3iUfKREPNSogI4OVA04Yq4H64P099ITVvSTC/it3obfF7EbVCA2MXACtpnFQw8FWp4TlRv8DezXcbAUrA9yEjz96ve0svpNFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYEaujDu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYEaujDu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790891703; x=1822427703;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=k227Sw7GESYXAbhF/BZM1Xe5SlltP8tDEyv8sVotVGw=;
  b=bYEaujDu0hjU7qeH3cWSp7YAQUAGUtsn819KIb6wq9nZYPbq6Aj0w5mI
   7R2h9ZOKA9BAv+S/b6bxAgA1mJRS8Cg7bKfGM14tUpeTD2yEJyxkQJNub
   qQFhaKrw7shKQ8xHiE4X03UWIYlnemZV4cwtuWQU3azhVPP5TGhNXV3Zi
   XWyTaWyFc9fj3UPgjblzmmTX7a5gK5eO/GGdp+qsSKMAU4LRUJGhZFRby
   9Ekmkr0qNYEdUWaUJiLt3YtdGk3q33FxsLAy2SUN53dFZx/uOG+go72LL
   cX9g2bYdJhFEnXyPN+341UuV6hNxrP194rioRAgvQpr22U7CTCcXDyVGW
   A==;
X-CSE-ConnectionGUID: 6b7NsSfmS/qypX7kaBf8Mg==
X-CSE-MsgGUID: 5dOQOD8JSZOVPpDLofc3Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91683213"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="91683213"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 14:55:02 -0700
X-CSE-ConnectionGUID: NXiTJDphS26CxbCke+ZFxg==
X-CSE-MsgGUID: Dyo7jFDJQjCkBQ4rwVk9mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="276203756"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.108.6]) ([10.125.108.6])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 14:55:00 -0700
Message-ID: <88f28ac61e238cef9bcf8bda3adb4326c15ba15e.camel@linux.intel.com>
Subject: Re: [PATCH 2/3] sched/fair: Rename group_imbalanced to
 group_pinned_task
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Jemmy Wong <jemmywong512@gmail.com>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot	 <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt	
 <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman	
 <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek
 Nayak	 <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org
Date: Thu, 01 Oct 2026 14:54:59 -0700
In-Reply-To: <20260928042018.10618-3-jemmywong512@gmail.com>
References: <20260928042018.10618-1-jemmywong512@gmail.com>
	 <20260928042018.10618-3-jemmywong512@gmail.com>
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
> The name dates back to the original group_imb heuristic, which flagged
> a group when the load difference between its busiest and idlest CPU
> exceeded the average task load. Commit 6263322c5e8f ("sched/fair:
> Rewrite group_imb trigger") replaced that heuristic: the flag is now
> set only when a lower domain fails to balance because tasks are pinned
> by cpus_ptr (LBF_SOME_PINNED), and kept while all tasks are pinned
> (LBF_ALL_PINNED). The name was carried over unchanged and later became
> group_imbalanced in commit 0b0695f2b34a ("sched/fair: Rework
> load_balance()").
>=20
> Today the name no longer matches the condition:
>=20
>  - group_classify() checks group_overloaded first, so a group whose
>    load really is skewed is usually not classified as imbalanced,
>    while a flagged group may carry a single extra task.
>=20
>  - calculate_imbalance() does not measure any imbalance for this type;
>    it moves one task (migrate_task, imbalance =3D 1).
>=20
>  - Elsewhere in fair.c "imbalance" consistently means the amount of
>    load to move (env->imbalance, imbalance_pct, calculate_imbalance(),
>    the lb_imbalance_* schedstats), and imbalanced_active_balance() uses
>    "imbalanced" for repeated balance failures, unrelated to this flag.
>=20
> Rename it to group_pinned_task, which describes the condition that
> raises it and follows the adjective_noun pattern of group_misfit_task.
> The enum is local to fair.c, so no tracepoint, schedstat or other
> user-visible interface is affected.
>=20
> No functional change.
>=20
> Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
> ---
>  kernel/sched/fair.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>=20
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index f9ddcecfd19d..aa63950976aa 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -10363,7 +10363,7 @@ enum group_type {
>  	 * The tasks' affinity constraints previously prevented the scheduler
>  	 * from balancing the load across the system.
>  	 */
> -	group_imbalanced,
> +	group_pinned_task,

I believe we are trying to fix imbalance due to pinned tasks.
Perhaps group_pinned_imbalance is more descriptive.

Tim


