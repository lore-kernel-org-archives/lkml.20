Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423236;
	b=AdmeIKfJACueei98dys5EF05abL+VgP1ivl728w04sbNo54AxmCEU+XNbYFlMiFOEaBB
	 hEZjTLmC5v7Z7K5zsW+xh97DcONfsThPjsazNJv/lggdSTehvimEFeDch9de3zdDUd0o2
	 C5qWYg32/JQi6I7XyeCDF5qjzHr+iuY/9PK2i5YIA0Hd1G790KBHPdhgBBqwoAuNZCl9f
	 OaC2snNhYdhsbnEV3/MUKVMR28eB8qzBa4QXoTEA+kTovSavT6eYWxeTWTXtOahgFo/va
	 XtGHhRN3zpapd844Ux1F0T+OMBpw6+LF/8zXFJI1oH80X+e34eK7+QuIf2QEj/lmwEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZsskRaC63dfOip7CnCuJXkgpPqqQ5pj1PPP4KUv5qaA=;
	b=i2GQdnHg8ZH8+niAty9GBnNpeAKIyXoLST7dYQ+Uulpwh7Mw/vvNm4mB9wmGYtO9XS86
	 NVt+HObyIGfPwREbxXjen2eFogt1BAHitrk2S/HkcqW2iI7sP0KBfBgH/xpFd0kXlfFD9
	 v7ObGap7rRXongifWN3mEHE02tjfwKknbLR/xODMGmXXmIiB8bspXZ0cku2URVWksFroI
	 +CSXSGeAaqXHgFZPm4nXOCvk1rNSP4JXvbDT43iKI4mJ+18D0/cDO/JdLujmkU1Hs6A+r
	 xWQ21bIKIy+6dQCIdXCiUo9zBbgPCDzj7ii036a9MgNP1FyXy1PvbjoTIdNQ1BqiQGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T1oBreeA;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155BB606A890
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 155BB606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T1oBreeA
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a599e9110eso2486895e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423234; x=1795028034; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZsskRaC63dfOip7CnCuJXkgpPqqQ5pj1PPP4KUv5qaA=;
        b=T1oBreeAetOLSOAqGHV3zhFhC1lv69+xEpuVepsZqOD+RBuC4ccvPEdcq3akxBsMd8
         Xr6Va5lWWGdG8RKqaBslPlsR8+LEhKyTL11Fg+wQRtn7y62jOf8fJJ6DuS5aKf631Vpe
         E53ytXIGYE26y8Wzjyy+Vmoq+2DQrtKCQtHNnpesyX3vNJNW0dHOhSZZiEkyU7HWqi4V
         kLL55P2lF4B61pAFAZBa8MtolJppnYEafVkzn8iD4dK2yq3LZxg7SQyWU6FAkdIErrE+
         OHHVTM0GfJiaovvXuU8Dbes0r7tqwpYJ8TFpfnpXKkA6yHy8tsOCT5ygPs+q2KfNsE4c
         4H9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423234; x=1795028034;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsskRaC63dfOip7CnCuJXkgpPqqQ5pj1PPP4KUv5qaA=;
        b=Xb5Grr3gUdSie66ZWnRgfJ9m+PEZhQHYWmK0us08AvmhY0cAPdCywQiqay28ZeOPLb
         UNlxTMYoCAu5R+qI+26hpj/yRAUDcylm4fgYzAFEQHqdY7zfx4+YxKO7mibsx91XIhPv
         UwHFmebM6/ewk9mQvZh5Ipe3wiv8VkWqWV+wmNqoGTO0nXQMHHP9UFzIeUGsFcdkvIJR
         us+DKcsjykDy6uknbPtzlfSpzrLMc9BGpRuJ5Uo8yve6KnGUAZR8Ab8FLDJvUj3w+6w0
         AWyoihTq9g/OQYHll35c0PGYz0Z1E2qpfi5BaeJbI4bYmzJerhdd899o17qK53NSTwBv
         4MWg==
X-Forwarded-Encrypted: i=1; AL+hErEL9A/8/c8WkbfoiishW/5JGtLr9m8cP5Re/b3n77EPyLzpoi4TftGgg3GRz7E//7ZSFn42Y6ot9Jf7hH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+S8c+JtSdyvG7sMJuIFTSm+ZBDKKkx2HNohWEUgHffEaltGHv9
	RlX110XEiRDwXhpidanfvEoanmTsHVACdqV9kUcY8POVNwKpzQ70qECD
X-Gm-Gg: AYBFou0YZqy1qNhc+YB2RkIhOP2AzJEpLep5kSJvyDY/Kyb28K0/rcwm5k1iLRgyNgX
	n9Y+TvcXcBLzcs8Al1EbBHrZlKz0le95w9c+i8poMq/abjed1O3YvGqRnrrSAmBMLPjw0ebT+7B
	PWgkSZHsCmB0MwNDj2EbWonZx30b9wA0QZpoREu6+3SOBVPsRJ1HJ1WqCxQvY7uvu/rxAnO+bYC
	4GPY7r+octMF+cyLiAJA9hOxsyeRLMgmik9+6xNBSPFYXUigMqDjy3xqS4ur7B2MqN1JeR2kHfm
	h1ljYEXsrrPhPiVvuCjXmfTrTq/W6b0PB39gFUR3bq/ZB93R213X7mCAIAnJp+GUpTYbD8Fe6TX
	2AmPZ3jXs27f17ikuACYFwCmgK++eqI9VuPB4DfWEHez+1xA10P+2TGfVEMToATGbNQr39MenSK
	1COVX6VTX+Mkgxt3EZY+nbNZconliVwQ+1n4/iMfOA5TjGPfy33tFmYGFJ9CipOcZTvxYDzXSbR
	NYtxHMAhTGGxNJUzqxITROkFWbsbLD9jwotFkNi/LtE0XJgUvfHCxHf6elIXwSHg7GHY02TnNdK
	wO8cpTd6ScTTUW8q+SG5pJyWQrSWO8/GFVNiaD5gf5tn8HAVo02r4qpf
X-Received: by 2002:a05:600c:1986:b0:4a1:7dcf:be1f with SMTP id 5b1f17b1804b1-4ba0934e57cmr57201645e9.1.1794423234200;
        Wed, 11 Nov 2026 10:53:54 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e33ae5bsm6253495e9.3.2026.11.11.10.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:53:53 -0800 (PST)
Date: Wed, 11 Nov 2026 21:53:51 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Tejun Heo <tj@kernel.org>, mingo@kernel.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 12/12] sched: Remove sched_class::balance()
Message-ID: <avSYpkVnyRKfaZIo@scheduler.schedules>
References: <20261107115913.261163891@infradead.org>
 <20261107120208.153536827@infradead.org>
 <a98c40701cc874318e7fe475d90795c6@kernel.org>
 <20261111130512.GO2668200@noisy.programming.kicks-ass.net>
 <20261111131152.GD2669272@noisy.programming.kicks-ass.net>
 <avRzGYNT-_p3KP9R@scheduler.schedules>
 <20261111154724.GO1779021@noisy.programming.kicks-ass.net>
 <20261111161522.GD1922751@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261111161522.GD1922751@noisy.programming.kicks-ass.net>

Hi!

On Wed, Nov 11, 2026 at 05:15:22PM +0100, Peter Zijlstra wrote:
> On Wed, Nov 11, 2026 at 04:47:24PM +0100, Peter Zijlstra wrote:

> > 
> > Gah, you're right. This don't work right. Let me try again.
> 
> Here, something like so then?
> 
> ---
> Subject: sched/deadline: Fix wakeup_preempt() vs dl_server
> From: Peter Zijlstra <peterz@infradead.org>
> Date: Wed Nov 11 14:12:25 CET 2026
> ---
>  kernel/sched/deadline.c |   40 +++++++++++++++++++++++++---------------
>  1 file changed, 25 insertions(+), 15 deletions(-)
> 
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -715,8 +715,7 @@ static struct rq *dl_task_offline_migrat
>  	return later_rq;
>  }
>  
> -static void
> -enqueue_dl_entity(struct sched_dl_entity *dl_se, int flags);
> +static void enqueue_dl_entity(struct rq *rq, struct sched_dl_entity *dl_se, int flags);
>  static void enqueue_task_dl(struct rq *rq, struct task_struct *p, int flags);
>  static void dequeue_dl_entity(struct sched_dl_entity *dl_se, int flags);
>  static void wakeup_preempt_dl(struct rq *rq, struct task_struct *p, int flags);
> @@ -1184,10 +1183,7 @@ static enum hrtimer_restart dl_server_ti
>  			dl_se->dl_defer_running = 1;
>  		}
>  
> -		enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
> -
> -		if (!dl_task(dl_se->rq->curr) || dl_entity_preempt(dl_se, &dl_se->rq->curr->dl))
> -			resched_curr(rq);
> +		enqueue_dl_entity(rq, dl_se, ENQUEUE_REPLENISH);
>  
>  		__push_dl_task(rq, rf);
>  	}
> @@ -1520,7 +1516,7 @@ static void update_curr_dl_se(struct rq
>  					replenish_dl_new_period(dl_se, rq);
>  					start_dl_timer(dl_se);
>  				} else {
> -					enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
> +					enqueue_dl_entity(rq, dl_se, ENQUEUE_REPLENISH);
>  				}
>  			} else {
>  				enqueue_task_dl(rq, dl_task_of(dl_se), ENQUEUE_REPLENISH);
> @@ -1812,9 +1808,7 @@ void dl_server_start(struct sched_dl_ent
>  
>  	trace_sched_dl_server_start_tp(dl_se, cpu_of(rq), dl_get_type(dl_se, rq));
>  	dl_se->dl_server_active = 1;
> -	enqueue_dl_entity(dl_se, ENQUEUE_WAKEUP);
> -	if (!dl_task(dl_se->rq->curr) || dl_entity_preempt(dl_se, &rq->curr->dl))
> -		resched_curr(dl_se->rq);
> +	enqueue_dl_entity(rq, dl_se, ENQUEUE_WAKEUP);
>  }
>  
>  void dl_server_stop(struct sched_dl_entity *dl_se)
> @@ -2379,8 +2373,8 @@ static void __dequeue_dl_entity(struct s
>  	dec_dl_tasks(dl_se, dl_rq);
>  }
>  
> -static void
> -enqueue_dl_entity(struct sched_dl_entity *dl_se, int flags)
> +static bool
> +_enqueue_dl_entity(struct sched_dl_entity *dl_se, int flags)
>  {
>  	WARN_ON_ONCE(on_dl_rq(dl_se));
>  
> @@ -2418,7 +2412,7 @@ enqueue_dl_entity(struct sched_dl_entity
>  		if (flags & ENQUEUE_WAKEUP)
>  			task_contending(dl_se, flags);
>  
> -		return;
> +		return false;
>  	}
>  
>  	/*
> @@ -2442,7 +2436,7 @@ enqueue_dl_entity(struct sched_dl_entity
>  	 * deferred task and still got to wait, don't enqueue.
>  	 */
>  	if (dl_se->dl_throttled && start_dl_timer(dl_se))
> -		return;
> +		return false;
>  
>  	/*
>  	 * We're about to enqueue, make sure we're not ->dl_throttled!
> @@ -2457,6 +2451,22 @@ enqueue_dl_entity(struct sched_dl_entity
>  	}
>  
>  	__enqueue_dl_entity(dl_se);
> +	return true;
> +}
> +
> +static void enqueue_dl_entity(struct rq *rq, struct sched_dl_entity *dl_se, int flags)
> +{
> +	/*
> +	 * Deadline can enqueue entities from various timers; and esp.
> +	 * dl_server() entities will not pass through wakeup_preempt().
> +	 */
> +	if (!_enqueue_dl_entity(dl_se, flags))
> +		return;
> +
> +	if (!dl_task(rq->curr) || dl_entity_preempt(dl_se, &rq->curr->dl))
> +		resched_curr(dl_se->rq);
> +
> +	rq->next_class = &dl_sched_class;
>  }
>  
>  static void dequeue_dl_entity(struct sched_dl_entity *dl_se, int flags)
> @@ -2534,7 +2544,7 @@ static void enqueue_task_dl(struct rq *r
>  	if (task_on_rq_migrating(p))
>  		flags |= ENQUEUE_MIGRATING;
>  
> -	enqueue_dl_entity(dl_se, flags);
> +	enqueue_dl_entity(rq, dl_se, flags);
>  
>  	if (dl_server(dl_se))
>  		return;

I tried running the tests, and the second I tried it crashed :/.

Then I added WARN_ON_ONCE(!dl_se->rq); to catch if dl_se->rq were
causing all this. And changed resched_curr(dl_se->rq)
to resched_curr(rq).

Warning triggered, and because I changed it I was able to test it,
it was around 13 us. (Base was around 12 us so I would count it the same)

Changing it to rq seem to work correct. If I'm not missing any gears in my
brain...


Here's the warning that I added since I wasn't able to get the real
crash logs:

[   45.193366] ------------[ cut here ]------------
[   45.193472] WARNING: kernel/sched/deadline.c:2466 at enqueue_dl_entity+0x4a/0x70, CPU#1: stress-ng-cycli/1918
[   45.193480] Modules linked in:
[   45.193573] CPU: 1 UID: 0 PID: 1918 Comm: stress-ng-cycli Not tainted 7.4.0-rc1+ #36 PREEMPT(lazy)
[   45.193576] Hardware name: System manufacturer System Product Name/TUF B450M-PRO GAMING, BIOS 4604 03/22/2024
[   45.193579] RIP: 0010:enqueue_dl_entity+0x4a/0x70
[   45.193583] Code: 00 00 00 74 25 48 8b 43 20 8b 50 6c 85 d2 78 1e 48 89 df e8 48 36 fc ff 48 c7 83 a8 0c 00 00 30 e7 d1 96 5b 5d e9 c1 a4 c6 ff <0f> 0b eb d7 f6 45 53 10 75 dc 48 8b 80 50 02 00 00 48 39 45 48 79
[   45.193586] RSP: 0018:ffffd38d4b597c70 EFLAGS: 00010046
[   45.193590] RAX: 0000000000000001 RBX: ffff8b5a162b6b00 RCX: ffffd38d4b597bd4
[   45.193592] RDX: 0000000000000003 RSI: ffff8b5713e1b0a8 RDI: ffff8b5713e1b090
[   45.193594] RBP: ffff8b57059d0208 R08: ffff8b5713e1b090 R09: ffff8b57059d1048
[   45.193596] R10: ffff8b57059d0000 R11: 0000000000000000 R12: ffff8b57059d0208
[   45.193598] R13: ffff8b5a162b6b00 R14: ffff8b57059d0000 R15: ffffd38d4b597d78
[   45.193600] FS:  00007f3fa07444c0(0000) GS:ffff8b5a7d950000(0000) knlGS:0000000000000000
[   45.193603] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   45.193605] CR2: 00007ffd6f7c1688 CR3: 000000012dccc000 CR4: 0000000000f50ef0
[   45.193608] PKRU: 55555554
[   45.193610] Call Trace:
[   45.193612]  <TASK>
[   45.193615]  enqueue_task_dl+0x5b/0x170
[   45.193622]  enqueue_task+0x88/0x210
[   45.193629]  sched_change_end+0x147/0x1d0
[   45.193636]  __sched_setscheduler+0x23f/0xd10
[   45.193648]  __x64_sys_sched_setattr+0xb4/0x1f0
[   45.193659]  do_syscall_64+0xed/0x1560
[   45.193664]  ? srso_alias_return_thunk+0x5/0xfbef5
[   45.193668]  ? srso_alias_return_thunk+0x5/0xfbef5
[   45.193671]  ? find_held_lock+0x2b/0x80
[   45.193677]  ? srso_alias_return_thunk+0x5/0xfbef5
[   45.193680]  ? __lock_release.isra.0+0x57/0x170
[   45.193684]  ? count_memcg_events+0x1c9/0x290
[   45.193689]  ? srso_alias_return_thunk+0x5/0xfbef5
[   45.193692]  ? find_held_lock+0x2b/0x80
[   45.193698]  ? srso_alias_return_thunk+0x5/0xfbef5
[   45.193701]  ? __lock_release.isra.0+0x57/0x170
[   45.193704]  ? handle_mm_fault+0x218/0x380
[   45.193712]  ? srso_alias_return_thunk+0x5/0xfbef5
[   45.193715]  ? lock_release.part.0+0x1c/0x50
[   45.193718]  ? srso_alias_return_thunk+0x5/0xfbef5
[   45.193721]  ? do_user_addr_fault+0x4ba/0x7e0
[   45.193728]  ? srso_alias_return_thunk+0x5/0xfbef5
[   45.193731]  ? srso_alias_return_thunk+0x5/0xfbef5
[   45.193734]  ? lockdep_hardirqs_on_prepare.part.0+0x9b/0x140
[   45.193738]  ? srso_alias_return_thunk+0x5/0xfbef5
[   45.193741]  ? trace_hardirqs_off_finish+0xc6/0xe0
[   45.193745]  ? srso_alias_return_thunk+0x5/0xfbef5
[   45.193749]  ? do_syscall_64+0x5e/0x1560
--
[   45.193815] ---[ end trace 0000000000000000 ]---
[   57.602578] ------------[ cut here ]------------
[   57.602584] WARNING: kernel/sched/deadline.c:2466 at enqueue_dl_entity+0x4a/0x70, CPU#0: stress-ng-cycli/1956
[   57.602593] Modules linked in:
[   57.602601] CPU: 0 UID: 0 PID: 1956 Comm: stress-ng-cycli Tainted: G        W           7.4.0-rc1+ #36 PREEMPT(lazy)
[   57.602606] Tainted: [W]=WARN
[   57.602609] Hardware name: System manufacturer System Product Name/TUF B450M-PRO GAMING, BIOS 4604 03/22/2024
[   57.602612] RIP: 0010:enqueue_dl_entity+0x4a/0x70
[   57.602617] Code: 00 00 00 74 25 48 8b 43 20 8b 50 6c 85 d2 78 1e 48 89 df e8 48 36 fc ff 48 c7 83 a8 0c 00 00 30 e7 d1 96 5b 5d e9 c1 a4 c6 ff <0f> 0b eb d7 f6 45 53 10 75 dc 48 8b 80 50 02 00 00 48 39 45 48 79
[   57.602621] RSP: 0018:ffffd38d4b6ffa70 EFLAGS: 00010046
[   57.602626] RAX: 0000000000000001 RBX: ffff8b5a16236b00 RCX: ffffd38d4b6ff9d4
[   57.602629] RDX: 0000000000000003 RSI: ffff8b5713e1b0a8 RDI: ffff8b5713e1b090
[   57.602632] RBP: ffff8b57059c0208 R08: ffff8b5713e1b090 R09: ffff8b57059c1048
[   57.602634] R10: ffff8b57059c0000 R11: 0000000000000000 R12: ffff8b57059c0208
[   57.602637] R13: ffff8b5a16236b00 R14: ffff8b57059c0000 R15: ffffd38d4b6ffb78
[   57.602640] FS:  00007f56864024c0(0000) GS:ffff8b5a7d8d0000(0000) knlGS:0000000000000000
[   57.602644] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   57.602647] CR2: 00007fff971de0e8 CR3: 0000000127ad3000 CR4: 0000000000f50ef0
[   57.602650] PKRU: 55555554
[   57.602653] Call Trace:
[   57.602656]  <TASK>
[   57.602661]  enqueue_task_dl+0x5b/0x170
[   57.602670]  enqueue_task+0x88/0x210
[   57.602680]  sched_change_end+0x147/0x1d0
[   57.602689]  __sched_setscheduler+0x23f/0xd10
[   57.602705]  __x64_sys_sched_setattr+0xb4/0x1f0
[   57.602720]  do_syscall_64+0xed/0x1560


Cheers,

Kayra
