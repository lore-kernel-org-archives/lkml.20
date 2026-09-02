Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4ED3515F8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335765; cv=pass; b=PERy8KpmiDSQCtgjme0nlhXv4BqowLMgLZFUC3ZH0vrfJ61S9G1UeZDQ2r2fCl0ADLiTT748AaOfqV8n3+PLlVrSlWhpaZbmPWDyxcZm2rh5c30qjlXDKxlKLdYPYuyX+mIVOjQwrKQEJVylrzr7LzhG+t1lC0DQJcUcvv0dJCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335765; c=relaxed/simple;
	bh=xW90Y42ZITUqUKM2NiOR4tKzzoOke2to52hYsvXnkUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cNiGtACmO/ehxXD3TV0Dqh0q6yefSaXSLbn3t3A2T2kmJGx3uaJgX5757yZIdzV/c3EJP0Bh7sYIKyKen74reYe6q8/sbg4JH2/NmUwa2jo11VS2q+3JPTdy+WN5cQSbz326TY5sgh5PVE9SMrB3uemh6lN6czvwSkh12eTnD3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d04L7Vtz; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d04L7Vtz"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c207cb16cf5so90284666b.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:56:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788335761; cv=none;
        d=google.com; s=arc-20260327;
        b=CSca9qwnJEvdsMeslzL4MBkUhmD+cvSiI21Ed5R9l+h7IRdzYJvBetx7j81NWEIU7k
         aFBJFyPtGgjrO6hQX7Z612AjCT7sLyRg7i5HDGk1aqsVzAOCXJ09J5k0R1yxSAySbqup
         PD3FfK7D6Vd7ue7guIF84X/qZM4AkhcIOTALxRkCCZqf2bBjnVIaVNUCRIsWcjJz5+2e
         zLQmCmiXC0DGxzdqOx4MnPtaUn4xlWuF2nIPx0aPA5htr34wLs2p+CAT2w8TxKdzH6gQ
         xYjDC4h2MPavBYjbO44FysbpdMxANU/KVHkpX0/EwH0Pz/IOtBEaG8AWwBegC1nUzhea
         scsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tSZT9AR0GafKEqrGs5o+oknbOEl3OVV8y6JgW9H/Q5k=;
        fh=oblwFcGYdWxhjcUN5FnDPqtEmCRp9GPlenQBRjGQjhc=;
        b=G6IqVpOrUVjATyXQYuVJWH6k4GBqAzgcMr/H+OpPdeXenIxLV1WdXxNFjmQbcuWsgS
         Jv/7ruMZTyH7l9vbDfmgaQKfLJAvFIv35GwCJqd4QT7Ov2JuwQ768zAksvf8GeNITvtw
         oOv1RPOMJFWby4DyIsCUaT7mO+qHfAY42HztkiCPbMDqrq3iZlQglPLTflxLV7SaxHdj
         G7Rr2hOQIXneC3qyjgvketXievGJ3sLSdVIbMYiGKMXO3qBSFj96ZcUAZwsZhOYhMC5c
         5zvw/y/DqAUIfa2ABncQY5Ogq1no0bjMpAwJuWR3AykTylv7X2ckIWkME0g70QvtwI3f
         m6sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788335761; x=1788940561; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSZT9AR0GafKEqrGs5o+oknbOEl3OVV8y6JgW9H/Q5k=;
        b=d04L7VtzzvmsQ2Zg3ehn5xCC1pQp8wTe8csVunKkOYubU5126EjQ5MOyVhLThc71DP
         DCibuRUPTpBx+xg+r83vTm5TdQPiO+Hn/o4zQMXSqUhRq8K/NKCoXLChFGW3YxuW2gwe
         6lEC394DCfOV8Kr6m6jb8/jYHqztIsL3wlxqy1f8t0zSkloOfAOIUC7V2CQIxmFb3JBG
         kGX+O1VAs0WxNoMU0sdZntU6RWsjOjFrARz80z8XFFe0ow+bm5oyIf8vxgBE9U30FeqQ
         p0TTum95EAK8qvYS75CWKqo1cYpL1xOs/tzA3Eq9TEag1FznqVAeYeYAb01BJB+muzDp
         2MTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788335761; x=1788940561;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tSZT9AR0GafKEqrGs5o+oknbOEl3OVV8y6JgW9H/Q5k=;
        b=HiJ9AsemJFi1uK9IBXJ30dSJJC89lZ9IQN1CuWrJPgs8iij+BX30PnuJTs5eVqXbYl
         4aBd0nh3jW5ea8ZeWJvIAoT67sQKY6d+sahyKe7iGryHtvNICAY7qXtAsYAoQerxCWIM
         2wztUmU4sXbqj5t+5LCkZxnJjYZuRgVac8rJ3RIr78g/rPYGtx5Nbkk8XNDX/CaI9rNL
         +V1t2kvvkqC7ch8k27NxRmaMfUxaI44UdLYHAB/GEXA0GPIbRSfRr4Ss3r5/DqfE/iUW
         hHeLbDyZA3VbXq4BwYvPOq78Hx/rHfNTXCjJGwAbH6vP+YaeKpsLCkUlcUi4PpEIQaRl
         Zsww==
X-Forwarded-Encrypted: i=1; AKwUvBz8+DC5OLeulvPPYI4GLevM8E/uwlZw67dvybDDk/RaOPZ0it2bjrA9XgZkM/wTuWptnQkqWnrEGp/j/8U=@vger.kernel.org
X-Gm-Message-State: AFuF++k0JlHysLCHfgzL9cOp2UX+VRI1bgaQzmcfCMmuUKecJzDzCJDB
	vvunqPdOrRaYRu90VwwRXPNi7qBbUCUC/t76SNhovTlSu8PCJqW18PR5YA0po9jyCrJ4JjDhi2q
	NVQCI1U9+VLXraI8nyI7ETeUQ+m8TgOM4rPXvzguwJw==
X-Gm-Gg: AYBFou1tE8euBMEiovNWgC/Kd63dZDFLwDmGYntII0TCn+Ig3IzHSO2pni/+LqCQ3if
	YkfvQSrwSt9ed8JUXGwBLd+yqGqoN9Buk95bCdMH1qjnd7NSs/JG+6/R/ZRJ2s/SBsnRdhPkctF
	eF4WxurMOWmTsp5mNv68AvHSbIzBoa+1aSd524rVjzL2vNXklyKMeyN8bhOjw/QY0MuFO4OR2Hk
	Z7HRpJL6SiepnkN5OYPomL1LzEMIiMiv/FY9VQzXBPQ7lCYx9wsV5ckZrT2tgf92+xAbQaFSpaN
	eV0f2ktINIa6U7KTZW2rBoFQpeT+oksUI5v3alQCDW40Yep/4vh7j52N8Q5nb7MfoAxUVhY0NNr
	2abA=
X-Received: by 2002:a17:907:7285:b0:c1f:983f:d8a with SMTP id
 a640c23a62f3a-c25d55978a2mr184118666b.24.1788335760747; Wed, 02 Sep 2026
 00:56:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828074059.232353141@infradead.org> <20260828075558.660152190@infradead.org>
 <apezcsScwu5hdNrr@fengwei-dev>
In-Reply-To: <apezcsScwu5hdNrr@fengwei-dev>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 2 Sep 2026 09:55:49 +0200
X-Gm-Features: AcwNN1XD78T-K7gU3xz6isFwn5BuwwnsjHF5EIH0NIUFyN5S2s0YDftsDCbTXAs
Message-ID: <CAKfTPtBNAGQUQZbaDKYU7+Nsrcnj4M4p=54XkeML7rrLy+x+ZQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] sched/fair: Rework/fix task_h_load()
To: Chen Yu <yu.c.chen@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, mingo@kernel.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, tj@kernel.org, 
	linux-kernel@vger.kernel.org, chen.yu@linux.dev, tim.c.chen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sept 2026 at 07:39, Chen Yu <yu.c.chen@intel.com> wrote:
>
> On Fri, Aug 28, 2026 at 09:41:03AM +0200, Peter Zijlstra wrote:
>
> [ ... ]
>
> > @@ -15230,6 +15255,9 @@ static void set_next_task_fair(struct rq
> >                       weight = __calc_prop_weight(cfs_rq, se, weight);
> >       }
> >
> > +     for_each_sched_entity_bl(se, cfs_rq)
> > +             update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
> > +
>
> It panics during bootup on a 192 Cores system,
> [    9.445362][ T1687] Oops: general protection fault, kernel NULL pointer dereference 0x69: 0000 [#1] SMP NOPTI
> [   18.987940][ T1687] CPU: 58 UID: 0 PID: 1687 Comm: systemd-udevd Not tainted 7.3.0-rc1-flat-hload+ #9 PREEMPTLAZY
> [   19.022374][ T1687] RIP: 0010:pick_task_fair+0x43/0xd0
> [   19.175316][ T1687]  <TASK>
> [   19.181239][ T1687]  __pick_next_task+0x49/0x1b0
> [   19.189229][ T1687]  __schedule+0x14b/0x6b0
> [   19.196711][ T1687]  preempt_schedule+0x3a/0x60
> [   19.204543][ T1687]  preempt_schedule_thunk+0x16/0x40
> [   19.212931][ T1687]  _raw_spin_unlock_irqrestore+0x2b/0x30
> [   19.221833][ T1687]  autogroup_move_group+0xc5/0x160
> [   19.230124][ T1687]  sched_autogroup_create_attach+0xa7/0x180
> [   19.239280][ T1687]  ksys_setsid+0x12c/0x170
> [   19.246753][ T1687]  __do_sys_setsid+0xe/0x20
> [   19.254292][ T1687]  do_syscall_64+0xbc/0x470
> [   19.307858][ T1687]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   19.316405][ T1687] RIP: 0033:0x7f347bfbcb9b
>
> It seems that the crash is a read of se->sched_delayed on a NULL se inside
> pick_next_entity(), so pick_eevdf() return NULL

I faced the same crash while testing

>
> After the following top->down backlink traverse,
> for_each_sched_entity_bl(se, cfs_rq)
>     update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
>
> cfs_rq is not the root->cfs_rq anymore, but a middle cfs_rq(autogroup
> in above example). Meanwhile rq->cfs.curr remains NULL because the
> rq->cfs.curr has been dequeued if the task is runnable and queued:
> if (on_rq)
>         __dequeue_entity(cfs_rq, se)
>
> se = &p->se;
> cfs_rq->curr = se; /*wrong cfs_rq*/
>
> Then later _raw_spin_unlock_irqrestore triggers the scheduling
> it picks from rq->cfs_rq.curr with a NULL tree.
>
> Maybe we need to restore the rq->cfs_rq after the
> for_each_sched_entity_bl()?
> se = &p->se;
> cfs_rq = &rq->cfs; <--

Yes, this fixes it for me too

> cfs_rq->curr = se;
>
> thanks,
> Chenyu
