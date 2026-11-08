Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794176791;
	b=uj094hKbJVcvdjpQ+VW9UHGIPQvt7/+xN8fUjBB6LDqw8MlJuWQ/YN9ZfQZjAXffYzHE
	 eCeVNBscO19TFDz0iIqDWCvP7LDQMTk43LWa6YUBX4NfeOquQUDQds7u9vt3rsjQw+qdO
	 miqnZFKtEtA5uAP1dwcx7/DBMMNk53GDAGsVTJ6nujllgiVu1Lf6osbGjf/EoD5bNx5Qj
	 2ucJtPO6QuB1ZNw1hpmGn2mIuqeYe8hZVvMPBErnd9IAMuZgFjrdygrHrwveIO+Y564cN
	 GQva/iAirbITOvdcUHuCR/bhwbdk5dOc7rpRo78pV5GFvkk2hb/YnHePbdwjXRKlxJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794176791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ydXLmoDHBFq+HgtCA/7QgfiFzFmmcrvDfsID5w4Xmdw=;
	b=NZO5Mib3tlDyweEj5aK4XXIlAm2ABzIKP55kYnHU8sZuppNedPmkRaeZ2H0Zp3nV3T/H
	 rSj9BpzQEsodNU5qLY0LQ6wXvUA5KwN3OTymJndv4Hv5gd2dMvHvVnzIIB7fae4oQpJra
	 Gu0h6Fkg8TnsVoU5pfFiToOIkiLuqjoE7SgC9usQDX4PdTcStCPAnc6Sqf9I1bq/7P4TK
	 3lAT7d51PeQRtfuHbBldiPzGNVc2sEzrjbrMGyGLNfJqBGKft94dARtoziluKNED1e83C
	 vcrIKSjJKwzLiwT7sWCS3rWJM9j+gUH+0t8i+dBpKxunA9r9Nhrlh8yMOJwzBctVMuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GpmIKvgh;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D6A606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58D6A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GpmIKvgh
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a73fdd2966so210565e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794176790; x=1794781590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ydXLmoDHBFq+HgtCA/7QgfiFzFmmcrvDfsID5w4Xmdw=;
        b=GpmIKvgh7g0XOYVV8DkCOhvAgCpzf/GPzUkoyilGwC+kZI51WY92o4YMGFs7lAsQk4
         BNRAFx5NSURG/HJ7HYZXbvXoXxVeR2+VdvcMywt4li29nkA5TjWLV8fcPYKUj8yJcxLr
         cdJ0npV6ergFmSHJJ7igxOUmpBSls5TOjLWHq0wtul7cBE7rbYkS9a0CAkNrt7ZHz3ab
         eJpwWCSnyNg8yPYRbRRAAOV24pqIMl2d3cgY5zsveAu0Noi6AALbs+JdWfo3V8tVm5US
         u0rostx4mc1WTiflg0+6cLhq/30Mq9YjTrwFwR3XaqEnzaZ/paVjfuAfIf/YGk6SxTWS
         bfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794176790; x=1794781590;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ydXLmoDHBFq+HgtCA/7QgfiFzFmmcrvDfsID5w4Xmdw=;
        b=gUPrF+JbCNmrvUFPYBDFA18BAWOoxOCqYalMdh3COS7Du15zVY9IhXVJ0gRvzCZAO3
         7BHXlLd/sukudJp7EPagF/in9aNSXH1ZNwcro5pUfWmC4l637pFBsplqyXqKzb3diVQ7
         7aVrEiV3f0QVlq6OOEVPNejKBFeAdDJTdsZBuEc8wVUAoEQ+JNGOX0/XXS166Gci/DmT
         z9AEKBMpbLg9SshqpqkF08xbkjB9fyd7fmsokGsqFdnmrRjS0zd3ALfgPCMz4z0Colxl
         VyahZDxlxB3UHiqva1+Y/JImyy+hPtY6VHQDOrar9ntT9dXOIC5OVAOALNrOy9EJNJZU
         kO3g==
X-Forwarded-Encrypted: i=1; AL+hErHFOeGOI+m9TwKhoD1EjpWIYmwLoMlUXY5K75oALUE4JgWc/zoV11LUK8P7fF/TSakRcXXj4Vsp9vh6tNg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rDuvzs1WZJ6a2bdojcbVepQvETD0bYPcQ4QLXJ9JGaUoeL06O
	LnFcO0c7Mo49nwxtA29JdVYpsPR/NyLIW2XKFDXbLqutKWgbiKv1TL0o
X-Gm-Gg: AYBFou2c/CEsVn83ddEy1KRf596+6OXQvfoVpBC7MlBYeDCNFwyBOdcflkld8wFklUy
	HyO2h92lDLSrD3y97bu3zCnrnqd6sitxRBdao/N0FYTSra1vf3X8da4JWh+MTt62ZryKWBwWBId
	t1J7Z4IpBFEghdz857NmthXfoujZsVXsdPbkOr78xvlfFICyE6LNnw+tYSDG+UJvKei+A+n/uG+
	Xpqoy1+IyA9SVZUsfx9EXqObIrm/1vicLEQkuZpekuq4K3Tpqjy8zW+nSNCZzOPHgRnFqt2JKLD
	BiBurp+ieDNzd7E//PmdwTommVAEb7WEzX/GRiLPXhbAO6dmmK7rrMs1IEPMfMWHa741wVOC6wO
	rCiMnH2oeF3d7vDnWXNerruKEde6calXCOcTuyNQEESK82ieFiR0htmc1tqi+3SKtNGiyl1j5Ra
	H1lGYK2ghIAd4naEIGxMLjCCLYT7ohkWN//ntFPyW/ekxOkfdK5WXKFNBn0SNNV0ApuOmIMX1l3
	LCfbRW36eYFb2be00SfwsaXhZU1euwviODpcEHcaH3ec8gMnbb/ujgIR3VHn1qwEmUcKq/2n6f/
	yIeUY9I2vNeSI7szhVRH20qouxUNapsiskrB08Vh+lwHCl9fh5CbESQ=
X-Received: by 2002:a5d:5e03:0:b0:491:1653:8242 with SMTP id ffacd0b85a97d-49585e90454mr4883106f8f.6.1794176789454;
        Sun, 08 Nov 2026 14:26:29 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f398afsm5925024f8f.5.2026.11.08.14.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:26:28 -0800 (PST)
Date: Mon, 9 Nov 2026 01:26:24 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	tj@kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 05/12] sched/core: Abstract/fix
 rq_clock_start_loop_update()
Message-ID: <avBDWS-AY6QQtCuH@scheduler.schedules>
References: <20261107115913.261163891@infradead.org>
 <20261107120207.242460109@infradead.org>
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
In-Reply-To: <20261107120207.242460109@infradead.org>


Hi Peter!

I drank too much tea, I'm going to throw up. Bleah..

BTW this patch was *really* fun to review. But now it's 1 AM in the
night and I can't even type this sentence good.

On Sat, Nov 07, 2026 at 12:59:18PM +0100, Peter Zijlstra wrote:
> The existing rq_clock_start_loop_update() / rq_lock_stop_loop_update() almost
> do what we need rq_drop_lock() / rq_repin_lock() to do. They freeze time by
> setting ACT_SKIP.
> 
> Rename them rq_clock_freeze() / rq_clock_thaw() and have them operate on a new
> bit RQCF_FREEZE. This is such that schedule() can safely nest inside
> rq_clock_freeze() as is required for rq_drop_lock().
> 
> Sanitize the rq->clock_update_flags handling while adding the new bit --
> notably do away with the full shift left which makes a mess of things.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  kernel/sched/core.c  |    4 +--
>  kernel/sched/fair.c  |   15 +++++++-----
>  kernel/sched/sched.h |   63 +++++++++++++++++++++++++++++----------------------
>  3 files changed, 48 insertions(+), 34 deletions(-)


>  #define RQCF_REQ_SKIP		0x01
>  #define RQCF_ACT_SKIP		0x02
> -#define RQCF_UPDATED		0x04
> +#define RQCF_FREEZE		0x04
> +#define RQCF_UPDATED		0x08
>  
> -#define RQCF_NOP_MASK		(RQCF_ACT_SKIP | RQCF_UPDATED)
> +#define RQCF_NOP_MASK		(RQCF_ACT_SKIP | RQCF_FREEZE | RQCF_UPDATED)
>  
>  static inline void assert_clock_updated(struct rq *rq)
>  {
> @@ -1815,7 +1824,7 @@ static inline void assert_clock_updated(
>  	 * The only reason for not seeing a clock update since the
>  	 * last rq_pin_lock() is if we're currently skipping updates.
>  	 */
> -	WARN_ON_ONCE(rq->clock_update_flags < RQCF_ACT_SKIP);
> +	WARN_ON_ONCE(!(rq->clock_update_flags & RQCF_UPDATED));
>  }
>  
>  static inline u64 rq_clock(struct rq *rq)
> @@ -1851,25 +1860,27 @@ static inline void rq_clock_cancel_skipu
>  }
>  
>  /*
> - * During cpu offlining and rq wide unthrottling, we can trigger
> - * an update_rq_clock() for several cfs and rt runqueues (Typically
> - * when using list_for_each_entry_*)
> - * rq_clock_start_loop_update() can be called after updating the clock
> - * once and before iterating over the list to prevent multiple update.
> - * After the iterative traversal, we need to call rq_clock_stop_loop_update()
> - * to clear RQCF_ACT_SKIP of rq->clock_update_flags.
> + * FREEZE rq_clock. This is used in a number of places to
> + * ensure things appears to happen at the same time.
> + *
> + * Eg. during cpu offlining and rq wide unthrottling, we can trigger an
> + * update_rq_clock() for several cfs and rt runqueues (Typically when using
> + * list_for_each_entry_*)
>   */
> -static inline void rq_clock_start_loop_update(struct rq *rq)
> +static inline unsigned int rq_clock_freeze(struct rq *rq)
>  {
> +	unsigned int flags = rq->clock_update_flags;
>  	lockdep_assert_rq_held(rq);
> -	WARN_ON_ONCE(rq->clock_update_flags & RQCF_ACT_SKIP);
> -	rq->clock_update_flags |= RQCF_ACT_SKIP;
> +	assert_clock_updated(rq);
> +	rq->clock_update_flags |= RQCF_FREEZE;
> +	return flags;
>  }
>  
> -static inline void rq_clock_stop_loop_update(struct rq *rq)
> +static inline void rq_clock_thaw(struct rq *rq, bool flags)
>  {
>  	lockdep_assert_rq_held(rq);
> -	rq->clock_update_flags &= ~RQCF_ACT_SKIP;
> +	rq->clock_update_flags &= ~RQCF_FREEZE;
> +	rq->clock_update_flags |= RQCF_UPDATED | (flags & RQCF_FREEZE);
>  }
>  


So, these are getting called from rq_drop_lock() and rq_repin_lock():

 static inline void rq_drop_lock(struct rq *rq, struct rq_flags *rf)
 {
 	 rf->clock_update_flags = rq_clock_freeze(rq);
 	 scx_rq_clock_invalidate(rq);
 	 lockdep_unpin_lock(__rq_lockp(rq), rf->cookie);
 }

Here, rq_clock_freeze() returns unsigned int. While rq_clock_thaw()
converts it to bool.

So below,

 static inline void rq_clock_thaw(struct rq *rq, bool flags)
 {
 	 lockdep_assert_rq_held(rq);
 	 rq->clock_update_flags &= ~RQCF_FREEZE;
 	 rq->clock_update_flags |= RQCF_UPDATED | (flags & RQCF_FREEZE);
 }

flags could be only 1 or 0. both 1 & 4 and 0 & 4 is false. So this flags
& RQCF_FREEZE thing always returns false.

Shouldn't this needs to be unsigned int :-)?


Also look here:

 /*
  * In double_lock_balance()/double_rq_lock(), we use raw_spin_rq_lock() to
  * acquire rq lock instead of rq_lock(). So at the end of these two functions
  * we need to call double_rq_clock_clear_update() to clear RQCF_UPDATED of
  * rq->clock_update_flags to avoid the WARN_DOUBLE_CLOCK warning.
  */
 static inline void double_rq_clock_clear_update(struct rq *rq1, struct rq *rq2)
 {
 	 rq1->clock_update_flags &= (RQCF_REQ_SKIP|RQCF_ACT_SKIP);
 	 rq2->clock_update_flags &= (RQCF_REQ_SKIP|RQCF_ACT_SKIP);
 }

Right now this clears RQCF_FREEZE too. On every call. It's called
from double_rq_lock() and that gets called from _double_lock_balance()
and that gets called from double_lock_balance() and that gets called
from alots of places but for example:

* pull_dl_task() gets called from balance_dl(), we first call
rq_drop_lock() it calls rq_clock_freeze() and we set RQCF_FREEZE.

* Then we call pull_dl_task(), it calls double_lock_balance() and
RQCF_FREEZE gets cleared.


So to the period of double_lock_balance() call to rq_repin_lock()
RQCF_FREEZE remains unsetted.


So to fix both of these I would suggest something like so, not tested:


diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 339a77864ec8..a91d12640f37 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1911,7 +1911,7 @@ static inline unsigned int rq_clock_freeze(struct rq *rq)
 	return flags;
 }
 
-static inline void rq_clock_thaw(struct rq *rq, bool flags)
+static inline void rq_clock_thaw(struct rq *rq, unsigned int flags)
 {
 	lockdep_assert_rq_held(rq);
 	rq->clock_update_flags &= ~RQCF_FREEZE;
@@ -3357,8 +3357,8 @@ unsigned long arch_scale_freq_capacity(int cpu)
  */
 static inline void double_rq_clock_clear_update(struct rq *rq1, struct rq *rq2)
 {
-	rq1->clock_update_flags &= (RQCF_REQ_SKIP|RQCF_ACT_SKIP);
-	rq2->clock_update_flags &= (RQCF_REQ_SKIP|RQCF_ACT_SKIP);
+	rq1->clock_update_flags &= ~RQCF_UPDATED;
+	rq2->clock_update_flags &= ~RQCF_UPDATED;
 }
 
 #define DEFINE_LOCK_GUARD_2(name, type, _lock, _unlock, ...)				\




In a case like this:

CPU1 calls rq_drop_lock(), saves FREEZE = 0, and changes FREEZE to 1,
and drops the lock.

CPU2 gets the lock, saves FREEZE = 1 and changes FREEZE to 1, and then
drops the lock.

In this period CPU1 gets the lock again, makes FREEZE 0.

And later CPU2 comes and makes it FREEZE 1.


Not sure above could happen tho. Could it happen? I tried to fix this
assuming it could happen.

I'm not really happy with below diff, but I couldn't find a better way
neither, so please tell me that this case can't happen or there
is a better way to fix it :-(. This is on top of the current code BTW.
Only compile tested.

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 104c5333689a..9b3f92c03fea 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5385,7 +5385,6 @@ static inline void clear_tg_load_avg(struct cfs_rq *cfs_rq)
 static void __maybe_unused clear_tg_offline_cfs_rqs(struct rq *rq)
 {
 	struct task_group *tg;
-	unsigned int cuf;
 
 	lockdep_assert_rq_held(rq);
 
@@ -5394,7 +5393,7 @@ static void __maybe_unused clear_tg_offline_cfs_rqs(struct rq *rq)
 	 * set_rq_offline(), so we should skip updating
 	 * the rq clock again in unthrottle_cfs_rq().
 	 */
-	cuf = rq_clock_freeze(rq);
+	rq_clock_freeze(rq);
 
 	guard(rcu)();
 
@@ -5404,7 +5403,7 @@ static void __maybe_unused clear_tg_offline_cfs_rqs(struct rq *rq)
 		clear_tg_load_avg(cfs_rq);
 	}
 
-	rq_clock_thaw(rq, cuf);
+	rq_clock_thaw(rq);
 }
 
 /*
@@ -7280,7 +7279,6 @@ static void __cfsb_csd_unthrottle(void *arg)
 {
 	struct cfs_rq *cursor, *tmp;
 	struct rq *rq = arg;
-	unsigned int cuf;
 
 	guard(rq_lock)(rq);
 
@@ -7290,7 +7288,7 @@ static void __cfsb_csd_unthrottle(void *arg)
 	 * Do it once and skip the potential next ones.
 	 */
 	update_rq_clock(rq);
-	cuf = rq_clock_freeze(rq);
+	rq_clock_freeze(rq);
 
 	/*
 	 * Since we hold rq lock we're safe from concurrent manipulation of
@@ -7309,7 +7307,7 @@ static void __cfsb_csd_unthrottle(void *arg)
 			unthrottle_cfs_rq(cursor);
 	}
 
-	rq_clock_thaw(rq, cuf);
+	rq_clock_thaw(rq);
 }
 
 static inline void __unthrottle_cfs_rq_async(struct cfs_rq *cfs_rq)
@@ -7815,7 +7813,6 @@ static void __maybe_unused update_runtime_enabled(struct rq *rq)
 static void __maybe_unused unthrottle_offline_cfs_rqs(struct rq *rq)
 {
 	struct task_group *tg;
-	unsigned int cuf;
 
 	lockdep_assert_rq_held(rq);
 
@@ -7828,7 +7825,7 @@ static void __maybe_unused unthrottle_offline_cfs_rqs(struct rq *rq)
 	 * set_rq_offline(), so we should skip updating
 	 * the rq clock again in unthrottle_cfs_rq().
 	 */
-	cuf = rq_clock_freeze(rq);
+	rq_clock_freeze(rq);
 
 	guard(rcu)();
 
@@ -7855,7 +7852,7 @@ static void __maybe_unused unthrottle_offline_cfs_rqs(struct rq *rq)
 		unthrottle_cfs_rq(cfs_rq);
 	}
 
-	rq_clock_thaw(rq, cuf);
+	rq_clock_thaw(rq);
 }
 
 bool cfs_task_bw_constrained(struct task_struct *p)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 339a77864ec8..d8f1784d0640 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1281,6 +1281,7 @@ struct rq {
 	u64			clock;
 	unsigned long		lost_idle_time;
 	unsigned int		clock_update_flags;
+	unsigned int		clock_update_depth;
 	u64			clock_pelt_idle;
 	u64			clock_idle;
 
@@ -1902,31 +1903,28 @@ static inline void rq_clock_cancel_skipupdate(struct rq *rq)
  * update_rq_clock() for several cfs and rt runqueues (Typically when using
  * list_for_each_entry_*)
  */
-static inline unsigned int rq_clock_freeze(struct rq *rq)
+static inline void rq_clock_freeze(struct rq *rq)
 {
-	unsigned int flags = rq->clock_update_flags;
 	lockdep_assert_rq_held(rq);
 	assert_clock_updated(rq);
+	rq->clock_update_depth++;
 	rq->clock_update_flags |= RQCF_FREEZE;
-	return flags;
 }
 
-static inline void rq_clock_thaw(struct rq *rq, bool flags)
+static inline void rq_clock_thaw(struct rq *rq)
 {
 	lockdep_assert_rq_held(rq);
+	WARN_ON_ONCE(!rq->clock_update_depth);
+	rq->clock_update_flags |= RQCF_UPDATED;
+	rq->clock_update_depth--;
+	if (rq->clock_update_depth)
+		return;
 	rq->clock_update_flags &= ~RQCF_FREEZE;
-	rq->clock_update_flags |= RQCF_UPDATED | (flags & RQCF_FREEZE);
 }
 
 struct rq_flags {
 	unsigned long flags;
 	struct pin_cookie cookie;
-	/*
-	 * A copy of (rq::clock_update_flags & RQCF_UPDATED) for the
-	 * current pin context is stashed here in case it needs to be
-	 * restored in rq_repin_lock().
-	 */
-	unsigned int clock_update_flags;
 };
 
 extern struct balance_callback balance_push_callback;
@@ -2030,7 +2028,6 @@ static inline void rq_pin_lock(struct rq *rq, struct rq_flags *rf)
 	rf->cookie = lockdep_pin_lock(__rq_lockp(rq));
 
 	__rq_clock_clear(rq);
-	rf->clock_update_flags = 0;
 	assert_balance_callbacks_empty(rq);
 }
 
@@ -2043,7 +2040,7 @@ static inline void rq_unpin_lock(struct rq *rq, struct rq_flags *rf)
 
 static inline void rq_drop_lock(struct rq *rq, struct rq_flags *rf)
 {
-	rf->clock_update_flags = rq_clock_freeze(rq);
+	rq_clock_freeze(rq);
 	scx_rq_clock_invalidate(rq);
 	lockdep_unpin_lock(__rq_lockp(rq), rf->cookie);
 }
@@ -2051,7 +2048,7 @@ static inline void rq_drop_lock(struct rq *rq, struct rq_flags *rf)
 static inline void rq_repin_lock(struct rq *rq, struct rq_flags *rf)
 {
 	lockdep_repin_lock(__rq_lockp(rq), rf->cookie);
-	rq_clock_thaw(rq, rf->clock_update_flags);
+	rq_clock_thaw(rq);
 }
 
 #define __task_rq_lock(...) __acquire_ret(___task_rq_lock(__VA_ARGS__), __rq_lockp(__ret))



>  struct rq_flags {
> @@ -1938,14 +1949,14 @@ static inline void rq_pin_lock(struct rq
>  {
>  	rf->cookie = lockdep_pin_lock(__rq_lockp(rq));
>  
> -	rq->clock_update_flags &= (RQCF_REQ_SKIP|RQCF_ACT_SKIP);
> +	rq->clock_update_flags &= ~RQCF_UPDATED;
>  	rf->clock_update_flags = 0;
>  	assert_balance_callbacks_empty(rq);
>  }

Ah you changed it here. So I guess you forgot to change it in
double_rq_clock_clear_update(), no? :-).

I'm gonna sleep now. Woo...

Cheers,

Kayra
