Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591350;
	b=Mxue6D569n/iYDBzNhCyYg/PLxVF/iK0L2hrvP7ClU9PjJb/cCKeAYKuDFgDe0POSoWl
	 IJ1OGWX+dx/0tg/57bXFL0VxVFQnZnAp66tNPoo++ARz2/Y43lfUMBUNt+aHOMvlxTocu
	 uaRWv5GP7NCBy8vuHq7SjNjw4m7L1aRNcD0duVBr7X07wDAoRUHUj5IC9Os0CDVcSawiH
	 aUNEHRrO+bIURBNI4NxwfxDbPio1VZ6OJkaV3OU4S4wwf2ajp8JeHj3F/HcVIVUtgb66C
	 E/VzOTUj5EKxEmNsybMrkZpgaMm/ByzFRvjQdM0TR2Dk0S3CnBydSykp/V/OHXarsqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cjoVJNoB5AVdY0dFkBp7jx6Y4AzZznyz3fzLLbO/PbY=;
	b=tUtb3eZJST9SQPcfCBWvWBIeMEy8guzRw3UG8peqIo06pVMLhSzLlG3mrwewPy4Nn2Ny
	 wjE8EhasjJQO0zNoummfY2E2jrB41c/dTHjqAyg3ozzm1os5J4d9l0GLsF3M4g+om1hTU
	 7ltaOfU9hV1r/EoemHzd7dSsn4F09Gb/CbTmCzaowsTemrzzQLnNON8FN0F7F/zm4QEi8
	 YisO94IwRmYiPMvwpMEeg3zDUQFtPAfaclPGZdtHyIHfXcntJ2ScB3VwiBJXcMZRqxdS2
	 ZGIm+gPnlflf7Z0nFy7llMXHgVr4Hn3ZWDR4jz2uCK4g/8YTjybXHqgXtZGv1tnbphg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20251104.gappssmtp.com header.i=@layalina-io.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=NJgR+yNG;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1367606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1367606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20251104.gappssmtp.com header.i=@layalina-io.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=NJgR+yNG
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ba328513b9so684710e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20251104.gappssmtp.com; s=20251104; t=1792591348; x=1793196148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cjoVJNoB5AVdY0dFkBp7jx6Y4AzZznyz3fzLLbO/PbY=;
        b=NJgR+yNGq8QJP1LnciSxI9Y72k47oAz2eDZKjooMVhw/8gLq9jJUR8ScfmhTR83XeM
         m2oP7XgxDJIHjLiR6ljHsuHJB4DZh9UvNCkp4N9GRPwzBh7XeOLCPbrXMNSuffpkj6i9
         EODrZEx4bev/Ad8XS3tjpAHCapDsMis/Md3U8JG7c6cFo2Dm/T5xqG9n/6yjPljT8yD0
         UZb+N1CaND0uPd0dgxJsR2T8NrriD8faa6YHTCBCpXtyC3Ruv4qD/RLamUWVBnvxePTi
         Z/M52VILNr7t5gbb0Ty3mt2z5u7W4ZmYjxjuf29QEDp3gZnOPNKav+XRJqybPeWOO+II
         hCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591348; x=1793196148;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cjoVJNoB5AVdY0dFkBp7jx6Y4AzZznyz3fzLLbO/PbY=;
        b=Sf9yNSPyJCgZx86fdiXURFP1B/UzsA3/E86a8DQ6fzt8PL3c2IVw9A/Umyl92WF8Mp
         PlxOlSFgly0dXwhmVPdhh5p8jmzQ5YUmTp0YJGyog0IzhorIQ2mT/XUixLZ9Cjhv9FSm
         9iJkNeaQck8R7OCfBLCPhgYz/i3wt4fSQ/DHzsUlVmK6a+2ND93vDL1+QCZWpfYwL6JF
         thSdzRlecauFFbBi50vYeub3Snlniafq6dLeh17g2n3JeaPLJ85D+eTNKbnvZ4h5/2Yn
         miAzzUBgYSnCK++DADewhGZx7RDS/fJzE821ckZbeEtsebKjRzx4ABH2G2XBKsgOvR4r
         Xq8A==
X-Forwarded-Encrypted: i=1; AKwUvBwtMz/fWI8RZObg4TCSrGDLvdz6WTktmI2dfr8X4QLuSBGtfepUuD/WDWvm0TsuWH8giKwbrGT/Oyg1WTc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpgzS13rHbu7ItYMYw0pnelBILShfNfmU4IS/Idl0mIOPi1RGJ
	DvEQH1dx1IIoaYZ98ev1k4aM2pWIIfBVWVoiFLRWZX0shycRDtDohPO9kRmjGDGuRjQ=
X-Gm-Gg: AYBFou3OJ+vmGz0LrFFhLJrygkKX2VPrb2hcEPteE2AAnZqY0Pku7pDYYCSct9TxWBe
	W0EHUsz++2AjrZ0z0trnSlJRRtLUpZYvQnDaPuW0eeNwHwRekDOyENHbUzzH/HBWi7/ShhjgoGF
	wI/53nAOYTH1B6i3aoDD+x9tFRSDw8GFBfZlhIo/GY/RY8ZDmSOCTaBnXWdpS9r6gtMWgkXmMPz
	cTM5su7oYsRvG1NpeTvXIvZW2K5LMdG0HDPBuvhC7Zo0fAH+/U25B/e2gZ32hfMyEVjI2e69MKS
	cbfc1c44Kf15B3qxfp9hjes7roAfgpbsUwTEJfJS1hwKr1bz2EVIcXBjkStGaFRGlJfbl9Av/Tc
	M6j4d8XS9egPFky4YPssSKR6xKmMT9QIZCla+QIpRz6P/UPtwiWNqH7ptPA1XEzA9Gg5nR0a7f5
	zqI6DwUXt7P+6AC1vG3FizfHJkkYIyoGSCeNqXao0zq4ld4+QhBQV1Wuti6EC0qxXsRSe1VBf7+
	X9f+BzfvPvkiTtiPWuMa7AaNiZDTTGxPkLW3BKsmIQ6do/ITROouR6TDg6SAuTNhjl37E8=
X-Received: by 2002:a05:6512:3187:b0:5bf:a191:4458 with SMTP id 2adb3069b0e04-5bfa1c4e893mr892758e87.55.1792591347746;
        Wed, 21 Oct 2026 07:02:27 -0700 (PDT)
Received: from airbuntu ([149.40.63.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258213cesm5645984f8f.11.2026.10.21.07.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:02:26 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:02:22 +0100
From: Qais Yousef <qyousef@layalina.io>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Qais Yousef <qyousef@google.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Hongyan Xia <hongyan.xia2@arm.com>, Ingo Molnar <mingo@kernel.org>,
	Wei Wang <wvw@google.com>,
	Patrick Bellasi <patrick.bellasi@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>
Subject: Re: Uclamp races due to non-atomic static_branch_likely updates
Message-ID: <20261021140222.tazz6aw4j5pvqwox@airbuntu>
References: <CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com>
 <20261020152933.16989549@gandalf.local.home>
 <20261021113806.GE2823843@noisy.programming.kicks-ass.net>
 <20261021132058.kxzyumgxzir4jzi2@airbuntu>
 <20261021132956.GO2823843@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261021132956.GO2823843@noisy.programming.kicks-ass.net>

On 10/21/26 15:29, Peter Zijlstra wrote:
> On Wed, Oct 21, 2026 at 02:20:58PM +0100, Qais Yousef wrote:
> 
> > > Also note that a simple global boolean has the exact same problem.
> > > Adding runtime conditionals isn't going to fix this.
> > 
> > I have something in my memory that could be complete garbage that tells me all
> > cpus should see the new update after a grace period, did my brain invent this?
> 
> This is true; rcu_sync() implies a memory barrier on all CPUs, and
> therefore all CPUs must observe the prior state upon completion.
> 
> The thing is that a grace period is of 'arbitrary length' and during
> that you can still have some CPUs seeing your variable set while others
> will not and you get into the very same problem.

Maybe this arbitrary length what contributes to the size of the race window
otherwise I struggle to see this being a problem practically.

> 
> > If not invented, can we do synchronize_rcu() once on any cpu seeing the code
> > enabled for the first time to ensure the rest of the cpus has seen the newly
> > enabled path?
> > 
> > eg (not even compile tested):
> > 
> > 	diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> > 	index 7d2ec527b8a2..a6093ec88103 100644
> > 	--- a/kernel/sched/sched.h
> > 	+++ b/kernel/sched/sched.h
> > 	@@ -3715,7 +3715,16 @@ unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id);
> > 	  */
> > 	 static inline bool uclamp_is_used(void)
> > 	 {
> > 	-       return static_branch_likely(&sched_uclamp_used);
> > 	+       if (static_branch_likely(&sched_uclamp_used)) {
> > 	+               static bool do_once = true;
> > 	+               if (unlikely(do_once)) {
> > 	+                       do_once = false;
> > 	+                       synchronize_rcu();
> > 	+               }
> > 	+               return true;
> > 	+       }
> > 	+
> > 	+       return false;
> > 	 }
> > 
> > 	 /*
> 
> This cannot work; two immediate problems:
> 
>  - the do_once needs re-evaluating for every switch

I think uclamp can only be turned on, but yeah for a generic solution this is
a problem and the do_once will need to be reset on switch off.

>  - you cannot do rcu_sync while holding rq->lock ;-)

Uh-oh, right :-)

> 
> > The other alternative is to just accept this race can happen and do some sanity
> > check and reset/cleanup on going to idle - which should be pretty cheap and
> > straightforward.
> 
> This seems the sanest option.

I think the below should do

-->8--

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index d7c3b43158de..c6780358a797 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2111,7 +2111,7 @@ static void uclamp_post_fork(struct task_struct *p)
        uclamp_update_util_min_rt_default(p);
 }

-static void __init init_uclamp_rq(struct rq *rq)
+void init_uclamp_rq(struct rq *rq)
 {
        enum uclamp_id clamp_id;
        struct uclamp_rq *uc_rq = rq->uclamp;
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index 76f3c84ca684..64ea91b743bb 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -502,6 +502,14 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
         * lost_idle_time of clock_pelt
         */
        update_idle_rq_clock_pelt(rq);
+       /*
+        * Due to a race condition when enabling sched_uclamp_used static key,
+        * we can end up with imbalance where uclamp_rq_inc_id() has happened
+        * on a CPU without uclamp_rq_dec_id() on another CPU that hasn't seen
+        * the static key flipped. The race condition is unlikely, but ensure
+        * the uclamp_rq() state is set properly on each entry to idle.
+        */
+       init_uclamp_rq(rq);
 }

 struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 7d2ec527b8a2..6d7be3e3b36b 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3704,6 +3704,7 @@ static inline unsigned long cpu_util_rt(struct rq *rq)
 #ifdef CONFIG_UCLAMP_TASK

 unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id);
+void init_uclamp_rq(struct rq *rq);

 /*
  * When uclamp is compiled in, the aggregation at rq level is 'turned off'
@@ -3802,6 +3803,8 @@ uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id)
        return SCHED_CAPACITY_SCALE;
 }

+void init_uclamp_rq(struct rq *rq) {}
+
 static inline bool uclamp_rq_is_capped(struct rq *rq) { return false; }

 static inline bool uclamp_is_used(void)
