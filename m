Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793081517;
	b=1wdNgBSzc3cPqeElkloc0d8B3VPMe6usB7CIsJvmgBlYgOqRCDvIGTU4ZI3B8tOLuHmC
	 79VXKYnSpIvRVKEzCSzO1PKpyzmYZroYBqthQ4UFzWcKD3cHO5GMbm6u9QlHO1BT2wsAn
	 TDT/IvtAr5k6hdxa5uL//HtyMYkIBBk/b2aPWC7b42tELtHBMpaVPWZ4ExMd/gSUGzJR7
	 KvUFG5CG3Gai+y1fzGXxo8QW4vRD7yvyOPV8XQR4Vis+08VtEEYETGBqX7oE4HRzSDjTB
	 S/tE64BRzUSToA9KYMcH20DscotrUXYoFCO/MPaB0FVOmWmF1bZj0Onr3dZ3s3/paLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793081517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5kexO3pKrSjTVZIyhdyvFipC0HG64+yg4PyPnNe0Gpo=;
	b=hTzCRND3oC+AXKa5eABPfd3JRGyPX1W9lj2qeTNrMQic0CtTy4oVKJQPpPSsq6Ct3oz5
	 Bw0cHizzveGjXlVyy5GNlr5BHj+GfknuIJKfItRsB1DlnDpnF2mbrIwNT/IhAyCx2T0HV
	 F3JTG8brGf2XbdmNi0S0+bdBoAG/yHp/rAty7KtuYuzms6im9Bm6afNf1VHoB+PsMLuQA
	 1ZbdF3LiWAaPiOgn1i5WXwXdU/qdzzHetxS6xXO33c1bUge0WzOJghD1gE1QRgyvxhPTi
	 bL88EFXcT5xG9o9Zh0aaXw4FnGnUOTcJZkK6qvYHpFZWkJ24bOrd+8pfjao7qJApk9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="DWU/hmmm";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0EF606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA0EF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DWU/hmmm
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5348aaba5so2473395e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793081515; x=1793686315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5kexO3pKrSjTVZIyhdyvFipC0HG64+yg4PyPnNe0Gpo=;
        b=DWU/hmmmuoFd7O9Kpk9bjQLgmeOkGwYwyujd4FQviu9gF6WxYfl8Pskm/k89Xy8XzH
         T3A7x2UZP31TrBNBBgiYCm04W2FXY2oDmwyGwL8U2KeHcmMUmADkkkFG/HsQqJTyuhLG
         bpT2jrQjlvk2cJFElGGwLW2701TggW9Ex0ABQsi0bLsx4MnN+Jw4yop3aZbAVZ27NgxG
         VBmwS/+b/hk94hXIJ3cdZBFmLU6KMnVtBMhYVkfst1lfR/0cIP91hpBTXFMjm8BvG+zU
         bN2RCXZ8XnTjl+XGAWh4d+CZ9qB023s+CQ3M7yZlrZWdBtotrjdDicwZC1s7VGnLAzQg
         kY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793081515; x=1793686315;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5kexO3pKrSjTVZIyhdyvFipC0HG64+yg4PyPnNe0Gpo=;
        b=TaOtvUG7a5S6OS7GXChVTtiKElK/b136CaLhpRScrLjYY7x/9IsID/P7iZgw3yS/z8
         UjxusEtDQmXl7qHDnyEjp0ZJvoAdNzmjOaEChLKuEV5mlcSjTPo8eNTk46JeM2DkPDhk
         +rfD/GcQH9IKcIsa8VH6jtCDJNDKlVt4Jiw18x5DU+KfU59UHSUXD1tfrTJ0oo+wwqBC
         QarIwuVZbZUj/8X4qDchtM/iHp1/aDZ6ZXyg35cnRjWrmZ/YLat2O3E1b47IW2f0Fm5o
         xjskrgGGJwmU3yGubCJ17hiVskXlHW+G7TKXidUvjwyyhLshAbXGIVlFNuNIAt7qbhzV
         enWA==
X-Forwarded-Encrypted: i=1; AKwUvBzV2Lh1xVX5bIi/OE2bfnrPWZLcfgOlU8W7zYYwV1Xosmmn9tJfi7XRdIn3DJNIfK6/B9mxUPKjVpaigsA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrfoLZQqOZRPu2o2MOCE7W49a2ATRw6/ARQcC/G0ifhnQaL5fl
	KFbn89wOY2X4srmpr9ehWswZ8xOeZI/xB+2SUlgojMXPZJ7U5NUiBb/l
X-Gm-Gg: AYBFou3i5hbxgW9zdCRvyp1yU7BX4jlyHAuNLSRBwu6PAY5obnbdL65xrzLhn0eOjQu
	QuU882ibVu5A4qc6MgXXyoaFSktl6xhSfJR65hHLKljWoWCZItVon7mrVTkBu5KtHZ4ET2o+tZr
	0S163AmMyxsfOjBY0mJoNfX+kZ0wfQMCDEponxUWu1/qyf2oQE0yKK8gDWpLC7bUA2o1tsB2fiB
	Ibuic43MkVskGGtwY5fDfH4/Tey9zoLctfRsHtc2Ld2JtPVbG/pTuHMqPoUUvuW7nsxSHtpEkJb
	esDsABXh+zvEDY7BtuSkofjTgraUSyeaxMECXAOSZGZlFkB7GEayqDM07JCLlchtKeDvsneiPvL
	s4ozBLZICJ6eiqXDj35clJVvtDI+vStCVPprBak5tBA0JePG8g5+1jSCeD/OvKSVi/rHxKp1Z1z
	bIlckySPsZEq5BQ0AiYfXy4aq3kV7nFBuBVC8UF9EiPHmi66ctKtCF5tITlzN8jtnFn3seQdvhc
	uDd4B3ubKDsO7H5YDNQd24nbfB77p8MU+SXBRr49WJrufkYRZR26VFx9p2iVtw0asWJVEaA3YX8
	SA==
X-Received: by 2002:a5d:4245:0:b0:48d:f4e6:7b2 with SMTP id ffacd0b85a97d-48e3eb8705bmr11155500f8f.3.1793081515036;
        Mon, 26 Oct 2026 23:11:55 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f36asm20915252f8f.1.2026.10.26.23.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:11:54 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:11:51 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: albin_yang@163.com, albinwyang@tencent.com, bsegall@google.com, 
	chen.yu@linux.dev, dietmar.eggemann@arm.com, juri.lelli@redhat.com, 
	linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com, peterz@infradead.org, 
	rostedt@goodmis.org, vincent.guittot@linaro.org, vschneid@redhat.com
Subject: Re: [PATCH] sched/stats: Fix run_delay over-count for proxy-migrated
 blocked donors
Message-ID: <auA7AQ_S9iwPHr4d@scheduler.schedules>
References: <72a6eb77-0461-477b-a0e9-c06a486e3e0e@amd.com>
 <20261026133831.4111227-1-albin_yang@163.com>
 <36f12b2f-9fc8-46e9-8312-536c918722f1@amd.com>
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
In-Reply-To: <36f12b2f-9fc8-46e9-8312-536c918722f1@amd.com>

On Tue, Oct 27, 2026 at 09:41:51AM +0530, K Prateek Nayak wrote:
> Hello Wei,
> 
> On 10/26/2026 7:08 PM, albin_yang@163.com wrote:
> > Hi Prateek,
> > 
> > Thanks - using is_blocked as the single indicator is certainly cleaner than
> > piling up exceptions.
> > 
> > I rebuilt your diff so it applies cleanly and gave it a run. I'm afraid it
> > does not work as-is in my testing
> 
> Thank you for testing the changes!
> 
> > two problems:
> > 
> > 1) sched_info_depart() now calls __sched_info_dequeue(), which no longer has
> >    the "if (!last_queued) return;" guard. A blocking task has last_queued == 0
> >    (sched_info_arrive() cleared it at switch-in), so delta becomes
> >    rq_clock(rq) - 0, i.e. the whole uptime:
> > 
> >      cross-cpu: blocked 169.80 ms, run_delay delta 169047.52 ms
> >      same-cpu:  blocked 168.70 ms, run_delay delta 185515.00 ms
> > 
> >    The control is affected too, so this is not proxy specific.
> 
> Ah! That is an oversight. I didn't realise arrive clears the last_queued
> and yes, doing it unconditionally will account the full uptime.
> 
> > 
> > 2) sched_info_enqueue() now arms only when t->is_blocked, leaving ordinary
> >    runnable tasks with no counter at all - my sanity check went from +39 ms to
> >    0.00 ms in every iteration, including the control. I do not think either
> >    polarity works: is_blocked is still set during the real wakeup enqueue
> >    (delayed sleeper: inside ttwu_runnable()'s is_blocked branch; donor: cleared
> >    only later by ttwu_do_wakeup()). So it can gate the charge side, but the
> >    arming side needs something already cleared at wakeup - task_is_blocked() or
> >    sched_delayed.
> 
> Ack! I forgot task migrations. So based on a better look, all we have to
> do i start accounting when the task becomes runnable again (p->is_blocked
> is cleared) and don't account any time when the task is "on_rq" while
> being blocked (p->is_blocked && p->on_rq).
> 
> > 
> > The delayed reproducer shows 0, but that is easy to misread: it measures only a
> > delta, and the bogus depart charge lands before the window. Its absolute
> > run_delay is polluted too. (The 0.00 ms sanity figure is from the proxy
> > reproducer, which carries that check.)
> > 
> > For reference, !sched_delayed && !task_is_blocked() gives 0.01 ms on the proxy
> > case with the sanity check intact (+39 ms), and 0/20 on the delayed reproducer.
> > 
> > Happy to retest whatever you come up with.
> 
> So all things considered, I think the following should work unless I'm
> terribly mistaken yet again :-) I've left my reasoning as comments:
> 
> diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
> index ebe0a7765f98..c4c624deb25b 100644
> --- a/kernel/sched/stats.h
> +++ b/kernel/sched/stats.h
> @@ -239,6 +239,15 @@ static inline void psi_account_irqtime(struct rq *rq, struct task_struct *curr,
>  static inline void sched_info_dequeue(struct rq *rq, struct task_struct *t)
>  {
>  	unsigned long long delta = 0;
> +	/*
> +	 * If a task is blocked (blocked donor, delayed dequeue task),
> +	 * do not account the queued time as runnable. A task that is
> +	 * blocking would have already cleared the "last_queued"
> +	 * indicator from sched_info_arrive() when it got a chance to
> +	 * run on the CPU.
> +	 */
> +	if (t->is_blocked)
> +		t->sched_info.last_queued = 0;
>  
>  	if (!t->sched_info.last_queued)
>  		return;
> @@ -290,7 +299,23 @@ static void sched_info_arrive(struct rq *rq, struct task_struct *t)
>   */
>  static inline void sched_info_enqueue(struct rq *rq, struct task_struct *t)
>  {
> -	if (!t->sched_info.last_queued)
> +	/*
> +	 * "t->is_blocked" is only cleared after the enqueue is done and
> +	 * the task is woken up. If the task is blocked, update the
> +	 * "last_queued" timestamp to that of last enqueue - if the task
> +	 * is still blocked while it leaves the runqueue, this timestamp
> +	 * is ignored and is cleared at sched_info_dequeue().
> +	 *
> +	 * To transition a task back to blocked after wakeup, it has to
> +	 * run on the CPU and naturally reach a safe preemption point.
> +	 * sched_info_arrive() will do the correct wait time accounting
> +	 * based on the last "last_queued".
> +	 *
> +	 * Any movement of task after being marked not blocked will be
> +	 * correctly captured as queued time at enqueue + dequeue
> +	 * boundaries when "t->is_blocked" cleared.
> +	 */
> +	if (!t->sched_info.last_queued || t->is_blocked)
>  		t->sched_info.last_queued = rq_clock(rq);
>  }
>  
> ---
> 
> That "t->is_blocked" check in sched_info_enqueue() may not be
> necessary either but I've left it in there for now since I did my
> quick testing with it.


Hi Prateek,

IMO too doing this with is_blocked would be cleaner.

But I think this not works on a case where a donor is in a different CPU
from its owner, like:

A holds the mutex M in CPU0, B is the waiter and its on CPU1.

proxy_migrate_task() gets B to CPU0.
After that, A suddenly wants to goto CPU1. And it goes.
Now B goes back to its home CPU next to A.

Now in here, timer starts.

And suddenly A drops the mutex. Now B is not is_blocked.

Because B is back to its home CPU, there is no dequeue.
Even if there was B is not is_blocked so timer wouldn't be reset.

Normally we need to add the time that task waited for itself.
But in this case we add the time task waited for its mutex + for itself.

Or am I missssssing something?


> 
> -- 
> Thanks and Regards,
> Prateek
> 

Thanks,

Kayra
