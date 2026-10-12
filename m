Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3914B341660
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812433; cv=pass; b=HOqanevw516x2ODgB4oldlA2YG+7sAiQsnyoGOZV+FD8GpwAzObmeehT8ZHvU/0rAi74otMDIwyjMRL5xHTCDYwaw+N0G+DsE7q4NLGnJeY3DQr9ivKWt8hXHFk1hbcmwXi+mEab6Eh1yktMslFVmlgSoN29+fRDo5/PQVWWy3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812433; c=relaxed/simple;
	bh=4/1ElOWO5BNKxT5MvJNoQN8Fw43GEH8XI4A6Lw9C6Ec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gAWEE+ad29PeFwTEp7PjFp313j9gTsLMUs2JpO7qJaI7XN+/nBJdyEQi/BSlcKSQkfbw4OixdRunfQPGeV0YAmIajC6v1N9l9xREaYJqczOIOmoj0zHWhfz9J6O99HFNjZwJgfLluafiUK28pGja3lcMuwD6qk13msbjIPJTmkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rv/AX4pQ; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rv/AX4pQ"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso2796630a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:40:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791812429; cv=none;
        d=google.com; s=arc-20260327;
        b=Rn8hz3X8KCQhlPcD5KG/Uv9gzyX1lfwSEFf/GtwZ/hD1H/B6+PcU0rHaFNSk88si/g
         2JHGVkmVOfRLMQb+0uBqvZizMCoG/N7prWKnvtZBw6omm8pP1SsFV2qVojhcMYIUQG9O
         0ru4CiY/GXe2ttWnntgkzbXLYVx+ZQvgmtSBpKZ7cf2raBPDJbipdnZvxBrcpf6x23jW
         YypVQUbU2azxn+krCeLbjgPITxMaf9ItigrSZuiTCys2FlTP8LryxCrUhlPmmU0VbPA+
         Y7t8u9x5+CW65JcRV30TubSoBoXCMWI1L3mlfuOFAQAeQPhDwehHlNWb+Cg1H0Gz+xgN
         Oh4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XkcOsUmEPx/xbduMz6xinC2kg1v55WNZj6M/mTq/tO4=;
        fh=vCh5QWw5YezjocFiLp051piFlRXAehzo7XPz4B7P7X0=;
        b=oDevnL+YQrA026uHAhbqZoYkyi82oD4HUn3DSnM/Q/2KPofhqF6er+xqKKApGcN+Oc
         ytpOvjMLY/qgO2WHovpFroQxVahaZVOOcZvHJQOps3zT++RC3D3Uzw1VtAmKaVPong2n
         jfTEOw2yWylvonJOfXOO06wbf/ir7WD6AIDPWJ3XROdTPPjoCELVkW/L4cokDlngfjc1
         bWtlE10AVsFCaUX4QCE1M7VnBs7mveNENq9NGtYFo0MNI7o3zfeseBK01xSHdR0WNrvw
         QVU+VbITwtm3SQ4CcRQLeBwl3X1G/yveZw6ee5qa4CPZ4hSyeinHoPXu08CEDGstsh5R
         zwOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791812429; x=1792417229; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XkcOsUmEPx/xbduMz6xinC2kg1v55WNZj6M/mTq/tO4=;
        b=rv/AX4pQGBn4NBHtaojd/WRMYOtYLtK1DMXnGD0QBkmgmbGs09djgt1qXUuhXnA7DR
         z7AW5b7tVubJ5x1IYL62YYXCO/44Wny9UVMuI/2HwHfv9GtOv+J52m44LBRpmQVHg2e9
         ma5iQeacvFwS4wus9hinMtLn+Ido3+tMPvNELxt9q3zwMXH4+fBjdXEJ3pkvS8wD7qd5
         tiL7fVdY4V+PiOmOm4WCDdwslLaqPhkjr3xD87j4GZjlwFm/29ygm/+A4rLnk2IkxEAc
         j9sU5Af+IWcwM2fW+LiTAUq81hst5aBRVbC9cC1ZuZmqXMOg18wZha5wjV3P/R6Zc/H2
         vsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812429; x=1792417229;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XkcOsUmEPx/xbduMz6xinC2kg1v55WNZj6M/mTq/tO4=;
        b=pARpggdUr5o9LXBUPGFrO6TMEynW2xqmPoBGnxv+Tlaip+4dy897aG8M85tDiyeM8o
         K1H+uHEKA4uYIV/7FV+/sq19CLb4oCRRRdjQFgyiQdPmRLPEQlZgFwNpH2I00hRG+srv
         V5zWtkEvWENYIPp5c95aqZxv7kDgHG22ySREuFUKufBfnNHV/3Ikddagtg5HILHUh5km
         fHiM+214UZRhXqIFEDkW9rmxYj9lfSjxY6j5w8sKXMqDBs5Ofqu2XQSDXlZoxUGjcQCs
         0RsLM5J27SsWyXWrhc0UV/UyWT+rno9rUB8zslUNcfs1KDDQQbhx0Sa5Rtgr+paU+4O1
         b5cw==
X-Forwarded-Encrypted: i=1; AKwUvBwo7z6f6LkEq4ZNZaO5/GqBUIAbaBW5dSWQXez7h8AqJxD4Wq9QXLPAzI3LcekYmDEqqX+y72SPI/LOR5A=@vger.kernel.org
X-Gm-Message-State: AFq9FYL20XhuhRnA/c7PJRTsCteov+WWgwglnXWJ3BzSrxHvjGYVfkA/
	ue/lvRUZo9AXSER4aA4P7aT5G0tpRmQtTJmeh2zTxvX6kT6LxXJNIgBrThkeCw7D1nnCbKDvBv8
	54fMe9J9zxga2bU6Gm3h7L/PHtxCTRYdGJMOfQoScyQ==
X-Gm-Gg: AYBFou13UCOPkmgM9CcW/eWbrCtS4tktrW+RIl4iQQLSJcIAV5atBkpajNem+z9idmk
	Na8RDgFiftwMR1oBJWQr4eWut2YqdECNoiSQIBFj/QyyCT1Qhs1sUbUVvehGv76shG1lXFcc7rD
	EyRKXv3HLhUNEsd1Zx3EfoCUyinQ3g3EzZuZOS4dhwx0yA4whGuGr3dWpZ/bEAHxkIRjBZn3YUM
	1fV+bdA/0nUNUCFUf0bAfF0gTeGASzI1ydBLg76SdTOaMuCXEU5wJVbxmac4jJ4izjReISt6w6d
	pmsfNZ0KpdV3STkTr6vjeB88t7GzwehxcErkcRjkxBWgH4qtGvJLhtbbU3KoLoYz5fEwqwsntP/
	VkD5lvXSRSq4=
X-Received: by 2002:a05:6402:44d8:b0:6ac:773b:9c55 with SMTP id
 4fb4d7f45d1cf-6b17c28a85fmr6598962a12.40.1791812429194; Mon, 12 Oct 2026
 06:40:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003114656.105721-1-kayracizmeci@gmail.com>
In-Reply-To: <20261003114656.105721-1-kayracizmeci@gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 12 Oct 2026 15:40:17 +0200
X-Gm-Features: AclHuK9ce8JdN4ScGl5cXoWnKLESUy9Yiy9YRGK51gj-hDYgleQPp9cogsi4RLA
Message-ID: <CAKfTPtC_DjYGmnHuV8x9HEoea87pfrpfNWwHT=sGeSP8UOL2Og@mail.gmail.com>
Subject: Re: [PATCH] sched/eevdf: Fix vprot across reweighting
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, christian.loehle@arm.com, 
	elif.topuz@arm.com, linux-kernel@vger.kernel.org, sh@gentwo.org, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 3 Oct 2026 at 13:47, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
> Currently in reweighting, while a tasks vruntime changes dead protection
> could go alive, or alive protection could decrease, increase and go dead.
>
> To fix this, implement rel_vprot similar to rel_deadline. Only
> major difference is that rel_vprot is not dependent on
> PLACE_REL_DEADLINE, because there are no mechanisms (unlike deadline)
> that recalculate vprot. So it gets carried.
>
> Fixes: 80390ead2080 ("sched/fair: Separate se->vlag from se->vprot")
> Fixes: bcd74b2ffdd0 ("sched/fair: Only set slice protection at pick time")
> Link: https://lore.kernel.org/all/20261001164609.244156-1-kayracizmeci@gmail.com/
> Link: https://lore.kernel.org/all/e4700a93-ebd5-4c7e-88b5-d606437a13c0@arm.com/
> Co-developed-by: Christian Loehle <christian.loehle@arm.com>
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
> Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> ---
> Hi all,
>
> Base is commit 4a3b51aab6e25244d97936aa65e6d5425adf98e1
> on tip/sched/core.
>
> NOTE: Christian, this version is really different from yours.
> I still added the tags, hope that's not a problem.
> If it is tho, please let me know.
>
> I've thought a lot about this. I was at first thinking about
> a simpler approach, but to be similar and consistent with the
> current approaches to the similar problem on rel_deadline,
> I thought this would be better.
>
>
> I also ran some tests, from a VM that was inside a VM that
> was working on MacOS on my Mac. (This is like a war crime...)
>
>
> MY GREAT AND DEFINITELY 100% CORRECT ULTRAMEGA TEST
>
> We first pin 2 tasks to the same CPU, (let's say TA and TB)
> Then we change TA's nice value 3000 times between 0 and 10 (like, 0,10,0,10...)
> We save weight and rem = (s64)(se->vprot - se->vruntime) on both
> __dequeue_task() and enqueue_task_fair().
>
> Then, we multiply weight and rem for both savings and
> divide them. If they are between 0.95-1.05 we accept the
> results as correct, if not well... Wrong.
>
> I'm also terrible at math and a bit less terrible on coding
> so these results should be 100% correct.
>
> MY GREAT AND DEFINITELY 100% CORRECT ULTRAMEGA TEST RESULTS:
>
> NRTP = NO_RUN_TO_PARITY
>
>        Live Protection Wrong Counts
>   +--------+-------------+--------------+
>   |        |     BASE    | BASE + PATCH |
>   +--------+-------------+--------------+
>   | Normal |  6002/6002  |    0/6003    |
>   +--------+-------------+--------------+
>   |  NRTP  |    53/53    |     0/55     |
>   +--------+-------------+--------------+
>
> On Base Normal, maximum amount of increase was 4.49x,
> while the maximum amount of decrease was 0.17x and the average was
> 1.64x.
>
> While on Base NRTP, maximum amount of increase was 2.27x,
> maximum amount of decrease was 0.31x and the average was
> 1.08x.
>
> Well that's all. You may or may not ask where are the revived ones are.
> This test does not really covers that part.
>
> Or as I like to say it, my computer ate that part.
>
> That's really really all. Aside from the code :-).
>
>
>  include/linux/sched.h |  1 +
>  kernel/sched/core.c   |  1 +
>  kernel/sched/fair.c   | 34 ++++++++++++++++++++++++----------
>  3 files changed, 26 insertions(+), 10 deletions(-)
>
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 7b91cae4a59c..bd9e2d119910 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -584,6 +584,7 @@ struct sched_entity {
>         unsigned char                   on_rq;
>         unsigned char                   sched_delayed;
>         unsigned char                   rel_deadline;
> +       unsigned char                   rel_vprot;
>         unsigned char                   custom_slice;
>                                         /* hole */
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 71d3c948e14a..f1241f572cdc 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -4638,6 +4638,7 @@ static void __sched_fork(u64 clone_flags, struct task_struct *p)
>         p->se.vruntime                  = 0;
>         p->se.vlag                      = 0;
>         p->se.rel_deadline              = 0;
> +       p->se.rel_vprot                 = 0;
>         INIT_LIST_HEAD(&p->se.group_node);
>
>         /* A delayed task cannot be in clone(). */
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index b42a0ca2a69e..0bcd3a77aba4 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -4614,7 +4614,7 @@ dequeue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  }
>
>  static void
> -rescale_entity(struct sched_entity *se, unsigned long weight, bool rel_vprot)
> +rescale_entity(struct sched_entity *se, unsigned long weight)
>  {
>         long old_weight = se->h_load.weight;
>
> @@ -4712,7 +4712,7 @@ rescale_entity(struct sched_entity *se, unsigned long weight, bool rel_vprot)
>         if (se->rel_deadline)
>                 se->deadline = div64_long(se->deadline * old_weight, weight);
>
> -       if (rel_vprot)
> +       if (se->rel_vprot)
>                 se->vprot = div64_long(se->vprot * old_weight, weight);
>  }
>
> @@ -4720,7 +4720,6 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
>                            unsigned long weight, bool on_rq)
>  {
>         bool curr = cfs_rq->curr == se;
> -       bool rel_vprot = false;
>         u64 avruntime = 0;
>
>         if (se->h_load.weight == weight)
> @@ -4733,7 +4732,7 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
>                 se->rel_deadline = 1;
>                 if (curr && protect_slice(se)) {
>                         se->vprot -= avruntime;
> -                       rel_vprot = true;
> +                       se->rel_vprot = 1;
>                 }
>
>                 cfs_rq->h_nr_queued--;
> @@ -4741,17 +4740,23 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
>                         __dequeue_entity(cfs_rq, se);
>         }
>
> -       rescale_entity(se, weight, rel_vprot);
> +       rescale_entity(se, weight);
>
>         update_load_set(&se->h_load, weight);
>
>         if (on_rq) {
> -               if (rel_vprot)
> -                       se->vprot += avruntime;
>                 se->deadline += avruntime;
>                 se->rel_deadline = 0;
>                 se->vruntime = avruntime - se->vlag;
>
> +               if (se->rel_vprot) {
> +                       se->vprot += avruntime;
> +                       se->rel_vprot = 0;
> +               } else if (curr) {
> +                       /* Reweighting must not revive expired slice protection. */
> +                       cancel_protect_slice(se);
> +               }
> +

I don't get why you need to a se->rel_vprot and all these changes . If
we want to ensure that protection will not be re enabled because of
rescale, we just need the below

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 5c98d8dfce5d..e83836fe44ef 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4951,12 +4951,15 @@ static void reweight_eevdf(struct cfs_rq
*cfs_rq, struct sched_entity *se,
        update_load_set(&se->h_load, weight);

        if (on_rq) {
-               if (rel_vprot)
-                       se->vprot += avruntime;
                se->deadline += avruntime;
                se->rel_deadline = 0;
                se->vruntime = avruntime - se->vlag;

+               if (rel_vprot)
+                       se->vprot += avruntime;
+               else if (curr)
+                       se->vprot = se->vruntime;
+
                if (!curr)
                        __enqueue_entity(cfs_rq, se);
                cfs_rq->h_nr_queued++;

or the below which is even simpler because vprot, vlag and deadline
are rescaled with the same ratio but it implies useless div64_long()
when the protection is already canceled

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 5c98d8dfce5d..5d1b16780b52 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4936,7 +4936,7 @@ static void reweight_eevdf(struct cfs_rq
*cfs_rq, struct sched_entity *se,
                se->vlag = entity_lag(cfs_rq, se, avruntime);
                se->deadline -= avruntime;
                se->rel_deadline = 1;
-               if (curr && protect_slice(se)) {
+               if (curr) {
                        se->vprot -= avruntime;
                        rel_vprot = true;
                }



>                 if (!curr)
>                         __enqueue_entity(cfs_rq, se);
>                 cfs_rq->h_nr_queued++;
> @@ -6297,6 +6302,11 @@ place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>
>         se->vruntime = vruntime - lag;
>
> +       if (se->rel_vprot) {
> +               se->vprot += se->vruntime;
> +               se->rel_vprot = 0;
> +       }
> +
>         if (update_zero)
>                 update_zero_vruntime(cfs_rq, -lag);
>
> @@ -8143,9 +8153,13 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
>
>         dequeue_hierarchy(p, flags);
>
> -       if (sched_feat(PLACE_REL_DEADLINE) && !task_sleep) {
> -               se->deadline -= se->vruntime;
> -               se->rel_deadline = 1;
> +       if (!task_sleep) {
> +               se->vprot = protect_slice(se) ? se->vprot - se->vruntime : 0;
> +               se->rel_vprot = 1;
> +               if (sched_feat(PLACE_REL_DEADLINE)) {
> +                       se->deadline -= se->vruntime;
> +                       se->rel_deadline = 1;
> +               }
>         }
>         if (se != cfs_rq->curr)
>                 __dequeue_entity(cfs_rq, se);
> --
> 2.53.0
>
