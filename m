Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818967;
	b=I8jnRTSjZVhpecx9sexqKQ42hq2hRYTDcZ9eF2oQYNaVI3eN+s6R6rHrrc4AsoveId6t
	 ikPqwgov0VU3HW0jXFyOKAcmUbTen9kOQ3h0CncUw7QfqqBtyC8zoSwKaIGsuVNO2KeoH
	 6c3Zf12mrlq0OYKmRh50vGUqNHikYdSKFQFGFFeqGfPATuoxZrmfvs/AeN5L8a6kJQ9Fz
	 xuwf1EFY0rO38fKx2+yGejRHRgBlLBXt3mpob/AKAQH/vrmckLTQ2snbqqGEKA+utmsJC
	 Cpmd1OFjIRdFms0C7z26VWCcFLe4jjgpTZUpfoGoAhBj/q++lS5QVfkuY3vdpMQ6I7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818967;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=XpdhhkbeM3Oe6sh5E8lIGtym0hEvQkvMMeJ7mPd4+2s=;
	b=SBrak/shjCIuQV9YjvKnSLG2IhOKlDCni9YjSqi1x4IZgQ0jq4wYEsH5bEeNwNC0P8d+
	 FrloX3XUG/fg12VoZCt0L25GSkpOsSnGIZLLT0824M+0GVDweCeZjlriih53yGt62r1Mo
	 l28UfSCIn7ATUhDjw8DjYbWe3VaH2P/ji/BqkCt2T50+BOCa6ehhaH/HcQ9MiFFqalVR4
	 PV6xnf/MmISf18Q3uK+8tH0YHz7P8LS4yIzjlYOQ5ZUs+LP/lI0rQ/BhKj6BeqQLfuEhQ
	 vcGLSXusCL+7jsrisszjbw9b/ofqgaLQDVHYhQJnC30kW+qrkRC4yO85EmbBOjOG/Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n5Bd9p1J;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347D2606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 347D2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n5Bd9p1J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793818967; x=1825354967;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=2jjNEjvqjJ4IDWUbSeT5P7khF25EfBUJIiah09Dwr+o=;
  b=n5Bd9p1Jumh2rlyF7pKmycGfzuZfpGhHgI+hEu+g37FO2gnYb2lskCwO
   1o45dPH1CBWu8g0fYrQ4qkdOgshPcZjPMaGzDxOql9cfe4kbiYW49AkFM
   Iu0CggCLNNqDVXaHtmSYIJhi4h+9NKtpgJjeP+ePJOIH2ll3bwehsqdaO
   IUGzKH713I5+OLPyyZ//x2ZwhuA296tJybLeLbzNtRQwm6xNHDVUVWqN/
   DcvtM/TUMD6UDZn3ZNNsyWST+qQ23va/sdCVrIpc7uExqjSANOQvCypK9
   E4NMTilX2rf02RO1c41SLNTRhL0NLrRYbVXilAs+0BbzJJP1OHMJBbJ3E
   w==;
X-CSE-ConnectionGUID: ce9hco3FStCJ1w6VfdfFuw==
X-CSE-MsgGUID: i/BqThFPRNCzNXsnuXhEMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2620638"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2620638"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 11:02:46 -0800
X-CSE-ConnectionGUID: FvY/NQyzROyaBeWX59Bu3w==
X-CSE-MsgGUID: IKAqYksDQe2a2oxeSyMDvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7134074"
Received: from unknown (HELO [10.241.242.209]) ([10.241.242.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 11:02:46 -0800
Message-ID: <5b9e949a64935bc280ae72b3acea80745a5600f3.camel@linux.intel.com>
Subject: Re: [PATCH] sched/cache: Fix group_llc_balance being unreachable
 above the first NUMA level
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Jianyong Wu <wujianyong@hygon.cn>, mingo@redhat.com,
 peterz@infradead.org, 	juri.lelli@redhat.com, vincent.guittot@linaro.org,
 yu.c.chen@intel.com
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, jianyong.wu@outlook.com, liuyibin@hygon.cn, 
	zhongyuan@hygon.cn
Date: Wed, 04 Nov 2026 11:02:45 -0800
In-Reply-To: <20261104141313.185433-1-wujianyong@hygon.cn>
References: <20261104141313.185433-1-wujianyong@hygon.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-11-04 at 22:13 +0800, Jianyong Wu wrote:
> sched_balance_find_src_group() only considers group_llc_balance when
> sds.prefer_sibling is set:
>=20
> 	if (sds.prefer_sibling && local->group_type =3D=3D group_has_spare &&
> 	    (busiest->group_type =3D=3D group_llc_balance ||
> 	     sibling_imbalance(env, &sds, busiest, local) > 1))
> 		goto force_balance;
>=20
> sds.prefer_sibling mirrors SD_PREFER_SIBLING of the busiest group's child
> sched domain, and sd_init() clears that flag on every SD_NUMA domain.
> So on any domain whose child is itself a NUMA domain, i.e. on systems
> with more than one NUMA level such as multiple nodes per socket, groups
> tagged with group_llc_balance by llc_balance() can never take the
> force_balance path, and the group_llc_balance test there is dead code.
>=20
> Such a group falls into the !group_overloaded branch below and in the
> common case ends up in out_balanced, so a task that was placed beyond
> the first NUMA level is never pulled into its preferred LLC.
>=20
> On a 2-socket Hygon system (8 nodes, 32 LLCs, 4 cores per LLC), with
> "spin 3"/"spin 4" (3/4 busy threads of one process), all threads were
> in one LLC in only 41/140 and 0/142 samples; every failing case had a
> straggler on the other socket. With this patch: 195/196 and 180/196.
>=20
> Only require sds.prefer_sibling for the sibling_imbalance() case, which
> is what it was originally introduced for.


Hi Jianyong,

Here's a suggested reorg of the patch to make the code logic clearer.  Also
incorporate some suggestions from Peter on your previous proposal
https://lore.kernel.org/all/20260827122816.756234-15-wujianyong@hygon.cn/ .
So we do not do the llc_balance check for non cache aware scheduling case.

Tim

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index cfc982205b98..8a7442189a3b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12192,6 +12192,16 @@ static bool update_llc_busiest(struct lb_env *env,
         */
        return sgs->nr_pref_dst_llc > busiest->nr_pref_dst_llc;
 }
+
+/*
+ * The busiest group has tasks that prefer the destination LLC and
+ * cache aware scheduling is enabled.
+ */
+static inline bool busiest_llc_balance(struct sg_lb_stats *busiest)
+{
+       return sched_cache_enabled() &&
+              busiest->group_type =3D=3D group_llc_balance;
+}
 #else
 static inline void record_sg_llc_stats(struct lb_env *env, struct sg_lb_st=
ats *sgs,
                                       struct sched_group *group)
@@ -12210,6 +12220,11 @@ static bool update_llc_busiest(struct lb_env *env,
 {
        return false;
 }
+
+static inline bool busiest_llc_balance(struct sg_lb_stats *busiest)
+{
+       return false;
+}
 #endif

 /**
@@ -13303,14 +13318,25 @@ static struct sched_group *sched_balance_find_src=
_group(struct lb_env *env)
                        goto out_balanced;
        }

-       /*
-        * Try to move all excess tasks to a sibling domain of the busiest
-        * group's child domain.
-        */
-       if (sds.prefer_sibling && local->group_type =3D=3D group_has_spare =
&&
-           (busiest->group_type =3D=3D group_llc_balance ||
-           sibling_imbalance(env, &sds, busiest, local) > 1))
-               goto force_balance;
+       if (local->group_type =3D=3D group_has_spare) {
+
+               if (busiest_llc_balance(busiest))
+                       goto force_balance;
+
+               /*
+                * Try to move all excess tasks to a sibling domain of the
+                * busiest group's child domain.
+                */
+               if (sds.prefer_sibling &&
+                   sibling_imbalance(env, &sds, busiest, local) > 1)
+                       goto force_balance;
+       }


>=20
> Fixes: f38cc2f0d8a3 ("sched/cache: Prioritize tasks preferring destinatio=
n LLC during balancing")
> Reported-by: Yibin Liu <liuyibin@hygon.cn>
> Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
> ---
>  kernel/sched/fair.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 57360f5cdde4..205a0891b0a0 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -13294,9 +13294,10 @@ static struct sched_group *sched_balance_find_sr=
c_group(struct lb_env *env)
>  	 * Try to move all excess tasks to a sibling domain of the busiest
>  	 * group's child domain.
>  	 */
> -	if (sds.prefer_sibling && local->group_type =3D=3D group_has_spare &&
> +	if (local->group_type =3D=3D group_has_spare &&
>  	    (busiest->group_type =3D=3D group_llc_balance ||
> -	    sibling_imbalance(env, &sds, busiest, local) > 1))
> +	     (sds.prefer_sibling &&
> +	      sibling_imbalance(env, &sds, busiest, local) > 1)))
>  		goto force_balance;
> =20
>  	if (busiest->group_type !=3D group_overloaded) {
