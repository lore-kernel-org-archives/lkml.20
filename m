Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706362;
	b=1G51jn6z59S4YBf7GaFA1DpdI1K0ynczfpGq0rE9RtpmNYj0zXPZ3LTxjinUcqr9EXFP
	 f1dxqFybyy+IckMYxs1NvmHrCT1x7sZlkWMPIIq+uHQxnP3ygZAFD6MLfR/lmNwaM/NCd
	 izsGM4FtqtWSb9yCgkY8swBnRZ5ml0KoIH+aoNOQzBEz+id4+nmm+qtHPls/yBylx4PqX
	 rBoltnrSJKAp5ravwDjR2DOvKm9t6F5AkP1J/+r1QDV/d4Ir+75kPMPAWefkglB/2CwHo
	 wcVoO7E0JNgPs4NIv3nE1iYBYijmMUVV3P7YQC2hxl0uOq0ehx0BYkB4dWZ0ZhqesBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706362;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=6Php9xYRH0bLSQYT24cIPUkIfS8LnUGsuhhaNu4rJ7Y=;
	b=YHHS5VveeOphKUAElj4Lo3WNDRS/+eO14W5Mv1Qap8v0ye2FOZqFBk0SFOl6gyDbXFTd
	 HhaZU/6kJus1sXCMFcRahLPaHJJvYkb+oLd545uGn9x3VBfiHpdfLFcklERQdwrDTMmIl
	 53/kH9psuD60HjIE2FpoY5FQo6+ip+dyPICuh36S++poOyvyJmhGz6THawYkmXzJJEjeK
	 730UNNNeV+DGE0ZqjqFP2EjMxXi4tB0fejnJhfnGwJH3dKN55x4n3yO3lJdIiO0bG38tU
	 ZK9q1638Vo3rm4O4Ru4835wI/25qfOEw2Ty/9KL65jnX1kYLosyDQ7S+rcOT5YZtUZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=up9tCnOL;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B264606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B264606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=up9tCnOL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6Php9xYRH0bLSQYT24cIPUkIfS8LnUGsuhhaNu4rJ7Y=; b=up9tCnOLcabOx3/lyD7FRQBCiN
	9t1c0GJHAnD+iOxt02wtAycFmneSuwS8l9LR6L8xBKeZXVb69p8fpbWYi1ByU26v0r90RRblP1Mx+
	FcfxQ5LPy5t29QOt4yGRPZnTnf585eWodwVBQD9TN15ZnDsbDFTCN613mTss0w8Vf0tgqJzlq6s/e
	aFsDJYw4pXLN4bUxFjoUm27VCEgw0tY+f4FMQ/R9ADirwLXe5OVGydeGkbv6+oFv1jVRd7OUrBVyn
	VYsvpTSzh58/wFhlp0jg7EKdWDYlPuFEqzYmisqJH71fjjB9/zwpHvNh/SiDEgqkasGUvbEzpVH/6
	qAZm6Vgw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCxi-0000000BnDI-25Ux;
	Tue, 03 Nov 2026 11:45:58 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 387B53012AB; Tue, 03 Nov 2026 12:45:57 +0100 (CET)
Date: Tue, 3 Nov 2026 12:45:57 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Tejun Heo <tj@kernel.org>
Cc: Daehyeon Ko <4ncienth@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/autogroup: Fix task_group UAF during thread
 creation
Message-ID: <20261103114557.GJ1813469@noisy.programming.kicks-ass.net>
References: <20261023013631.881730-1-4ncienth@gmail.com>
 <20261026115707.GF2668200@noisy.programming.kicks-ass.net>
 <20261030034540.2074077-1-4ncienth@gmail.com>
 <20261030154940.GW2668564@noisy.programming.kicks-ass.net>
 <36ce43428e53d1d6e47dddb43697ccf2@kernel.org>
 <20261102101759.GF1813469@noisy.programming.kicks-ass.net>
 <705081716ac8615650a0cc4b668689ba@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <705081716ac8615650a0cc4b668689ba@kernel.org>

On Mon, Nov 02, 2026 at 09:21:14AM -1000, Tejun Heo wrote:

> I see your point. Moving the autogroup handling into the cpu controller
> keeps it better contained though. sched_cgroup_fork() places the new task by
> its cgroup only, and the cpu controller applies the autogroup once the task
> is on the thread list. This isn't a hill I'm going to die on, but it looks
> like the better direction to me. Can you please take a look at the patch
> below?
> 
> diff --git a/kernel/sched/autogroup.h b/kernel/sched/autogroup.h
> --- a/kernel/sched/autogroup.h
> +++ b/kernel/sched/autogroup.h
> @@ -27,12 +27,12 @@ static inline bool task_group_is_autogroup(struct task_group *tg)
>  	return !!tg->autogroup;
>  }
>  
> +extern unsigned int sysctl_sched_autogroup_enabled;
>  extern bool task_wants_autogroup(struct task_struct *p, struct task_group *tg);
>  
>  static inline struct task_group *
>  autogroup_task_group(struct task_struct *p, struct task_group *tg)
>  {
> -	extern unsigned int sysctl_sched_autogroup_enabled;
>  	int enabled = READ_ONCE(sysctl_sched_autogroup_enabled);
>  
>  	if (enabled && task_wants_autogroup(p, tg))
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -4958,7 +4958,6 @@ int sched_cgroup_fork(struct task_struct *p, struct kernel_clone_args *kargs)
>  		struct task_group *tg;
>  		tg = container_of(kargs->cset->subsys[cpu_cgrp_id],
>  				  struct task_group, css);
> -		tg = autogroup_task_group(p, tg);
>  		p->sched_task_group = tg;
>  	}
>  #endif
> @@ -9598,6 +9597,15 @@ static void cpu_cgroup_cancel_attach(struct cgroup_taskset *tset)
>  	scx_cgroup_cancel_attach(tset);
>  }
>  
> +#ifdef CONFIG_SCHED_AUTOGROUP
> +static void cpu_cgroup_fork(struct task_struct *p)
> +{
> +	if (READ_ONCE(p->sched_task_group) == &root_task_group &&
> +	    READ_ONCE(sysctl_sched_autogroup_enabled))
> +		sched_move_task(p, true);
> +}
> +#endif
> +
>  #ifdef CONFIG_UCLAMP_TASK_GROUP
>  static void cpu_util_update_eff(struct cgroup_subsys_state *css)
>  {
> @@ -10562,6 +10570,9 @@ struct cgroup_subsys cpu_cgrp_subsys = {
>  	.can_attach	= cpu_cgroup_can_attach,
>  	.attach		= cpu_cgroup_attach,
>  	.cancel_attach	= cpu_cgroup_cancel_attach,
> +#ifdef CONFIG_SCHED_AUTOGROUP
> +	.fork		= cpu_cgroup_fork,
> +#endif
>  	.legacy_cftypes	= cpu_legacy_files,
>  	.dfl_cftypes	= cpu_files,
>  	.early_init	= true,
> 

Right; so by not doing the autogroup assignment in sched_cgroup_fork()
(which is before publishing the task) but moving it to
cgroup_post_fork() (which is post publishing), we solve the race where
setsid() misses the new task, since the task will update post publish.

Now, using cgroup_post_fork() seems weird (also, I'm not sure if this
calls cgroup_subsys::fork for *all* controllers, or only the enabled
ones).

But we can easily move this into sched_post_fork(); all we really need
to ensure is this happens before scx_post_fork(), right?

Something like so?

---
diff --git a/kernel/sched/autogroup.h b/kernel/sched/autogroup.h
index 06c82b2bdfb5..14cf3fde9767 100644
--- a/kernel/sched/autogroup.h
+++ b/kernel/sched/autogroup.h
@@ -19,6 +19,7 @@ struct autogroup {
 	int			nice;
 };
 
+extern unsigned int sysctl_sched_autogroup_enabled;
 extern void autogroup_init(struct task_struct *init_task);
 extern void autogroup_free(struct task_group *tg);
 
@@ -32,7 +33,6 @@ extern bool task_wants_autogroup(struct task_struct *p, struct task_group *tg);
 static inline struct task_group *
 autogroup_task_group(struct task_struct *p, struct task_group *tg)
 {
-	extern unsigned int sysctl_sched_autogroup_enabled;
 	int enabled = READ_ONCE(sysctl_sched_autogroup_enabled);
 
 	if (enabled && task_wants_autogroup(p, tg))
@@ -41,6 +41,16 @@ autogroup_task_group(struct task_struct *p, struct task_group *tg)
 	return tg;
 }
 
+static inline void autogroup_post_fork(struct task_struct *p)
+{
+	/*
+	 * If setsid() missed this new task; move it to the new autogroup now.
+	 */
+	if (READ_ONCE(sysctl_sched_autogroup_enabled) &&
+	    task_wants_autogroup(p, p->sched_task_group))
+		sched_move_task(p, true);
+}
+
 extern int autogroup_path(struct task_group *tg, char *buf, int buflen);
 
 #else /* !CONFIG_SCHED_AUTOGROUP: */
@@ -58,6 +68,8 @@ autogroup_task_group(struct task_struct *p, struct task_group *tg)
 	return tg;
 }
 
+static inline void autogroup_post_fork(struct task_struct *p) { }
+
 static inline int autogroup_path(struct task_group *tg, char *buf, int buflen)
 {
 	return 0;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 04b62c16fa8c..3e05f7c959e6 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4958,7 +4958,13 @@ int sched_cgroup_fork(struct task_struct *p, struct kernel_clone_args *kargs)
 		struct task_group *tg;
 		tg = container_of(kargs->cset->subsys[cpu_cgrp_id],
 				  struct task_group, css);
+		/*
+		 * No autogroup here because this is unsafe vs setsid()
+		 * which will not see this thread yet. Fixed up in
+		 * sched_post_fork().
+		 *
 		tg = autogroup_task_group(p, tg);
+		 */
 		p->sched_task_group = tg;
 	}
 #endif
@@ -4983,6 +4989,7 @@ static void sched_mm_cid_fork(struct task_struct *t);
 
 void sched_post_fork(struct task_struct *p)
 {
+	autogroup_post_fork(p);
 	sched_mm_cid_fork(p);
 	uclamp_post_fork(p);
 	scx_post_fork(p);
