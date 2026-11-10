Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317629;
	b=vLpmHgeC9953byzYhaAhdNfYiawXzLMIzb69J+BARigQ/gwCoGgFhPdg0yChaa/lrdCZ
	 So/8rKN96XGgmAAQpzS9bk4ca4AFe5x/YTp3d7/4V6jzoexbsILR9Z4mqYGiiMSlryA7W
	 2RHywe6zuMLcxwxLVHta/XtrnxOYMykOK8+FbxCUMkrf2XJdDG/gNqdGDkeSe1iAQskib
	 TcVHMRVzDDH2UTcyj3+7v9pMRVGqBrSPNIkHeUmobBY8OhYXeb0A9dhlvdFLBSNwFu8pp
	 8Z0I1ySLpgspsnWUvnG3UtwbmJVxP9OX5MlIdlVfJLB69dztELZg/iHc6ePbuyHSSgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317629;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ujFo72J8vpSw4kDslkzK1aoddZNK9JdR+fg8l1tBlyc=;
	b=KW5td51qhfmbsEhWK1JuNnk/l1abTkgpSoGTtqrgcvEng4xNDsSNLBuxRqgzHph2mVv+
	 sxeFWWJevgFtAf2QxrrKdW8EUnZS+F42/W3epH6380xEmG8uRqGwpr4QEqsp2+p0nvo1m
	 C0MocoK9hpEjew7GIc2v1w6G/pxcv0ncanNrm0Kbf5Ukbc9hRlMkJq8hhSSejW+PamVFD
	 mRFCkJ62PMZL3f3uJlC68j/x2fd6Qae6EAICB1X+T1agiI0r6nrV0TNMtR5+QWdbFyQao
	 2C5VJyJeZKsSuAf4H3KGG7xlyaPsARYKQ17StHPDxL8mOxScLN3Hg6/PC5sj+6P6SiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c1FqFlUg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCD4606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c1FqFlUg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426C11F0089F;
	Tue, 10 Nov 2026 13:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794317628;
	bh=ujFo72J8vpSw4kDslkzK1aoddZNK9JdR+fg8l1tBlyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c1FqFlUgQ8u0KWcPOm2dZkalPt9NzYQXOrosaMTB4MhNOS7eIzPZlN8TC3/lzaUvM
	 5g+XoQHYCkd8EDsvvCaDAnKOKs5A33l7ZLbjL32oFMY4yobG16tUVg3WoC12s5W5x2
	 uuG7EjzZd5NauWSjDd+LS0nxws9Xhk9LYMEs5Ao7NJyzU/p3Pcca0V88Hv/d8lCP1h
	 tKQkbKGIfnoMXjnUkSW/AVpINp89nD5oSpjJRJqgztwFCfQQhQnK/qQvkfqnEmDT4S
	 Lf88kJ/xecj9ZP6EpgZH8Z+fAUa1x/q0+zpaTHu2C8Wr7FQzuhJbZG9EP/Bv4YBnd5
	 E/J8CfgFLNnhQ==
Date: Tue, 10 Nov 2026 14:33:45 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>,
	Ingo Molnar <mingo@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH 1/3] tick/nohz: Re-evaluate the tick on polling idle and
 on user entry
Message-ID: <avMdOa44c5qvryuH@localhost.localdomain>
References: <20261106160621.347228-1-marco.crivellari@suse.com>
 <20261106160621.347228-2-marco.crivellari@suse.com>
 <au5RmN37RlOCp2m9@pavilion.home>
 <CAAofZF6_JpSDNSKUuePiJx+74tbRH8vJ4spyNGp9KbjFPrbA0w@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAofZF6_JpSDNSKUuePiJx+74tbRH8vJ4spyNGp9KbjFPrbA0w@mail.gmail.com>

Le Mon, Nov 09, 2026 at 06:24:22PM +0100, Marco Crivellari a écrit :
> Mmh I'm not entirely sure. Look at this:
> 
> Without that hunk:
> 
> <idle>-0       [002] dN.1.    21.838685: csd_function_entry:
> func=idle_cycle [nohz_poll_timer_test], csd=0000000006a53f0a
> <idle>-0       [002] dN.2.    21.889256: hrtimer_start:
> hrtimer=000000007acc0071 function=tick_nohz_handler
> expires=21879000000 softexpires=21879000000 mode=ABS|PINNED|HARD
> was_armed=1
> <idle>-0       [002] d.h1.    21.900238: local_timer_entry: vector=236
> <idle>-0       [002] d.h1.    21.900238: hrtimer_expire_entry:
> hrtimer=000000007acc0071 function=tick_nohz_handler now=21879002056
> <idle>-0       [002] ..s1.    21.900246: timer_expire_entry:
> timer=0000000076975009 function=test_timer_fn [nohz_poll_timer_test]
> now=4294689147 baseclk=4294689147
> <idle>-0       [002] dN.2.    23.737243: hrtimer_start:
> hrtimer=000000007acc0071 function=tick_nohz_handler
> expires=23716000000 softexpires=23716000000 mode=ABS|PINNED|HARD
> was_armed=0
> <idle>-0       [002] dNh1.    23.737250: local_timer_entry: vector=236
> <idle>-0       [002] dNh1.    23.737251: hrtimer_expire_entry:
> hrtimer=000000007acc0071 function=tick_nohz_handler now=23716014595
> <idle>-0       [002] .Ns1.    23.737255: timer_expire_entry:
> timer=00000000134bb09d function=test_timer_fn [nohz_poll_timer_test]
> now=4294690984 baseclk=4294689177
> <idle>-0       [002] dN.1.    23.737261: csd_function_entry:
> func=watchdog_check_skew_remote, csd=00000000ecfea5e9
> 
> With the hunk applied:
> 
> <idle>-0       [002] dN.1.    10.363861: csd_function_entry:
> func=idle_cycle [nohz_poll_timer_test], csd=0000000046d09235
> <idle>-0       [002] dN.2.    10.414660: hrtimer_start:
> hrtimer=00000000ccc99756 function=tick_nohz_handler
> expires=10405000000 softexpires=10405000000 mode=ABS|PINNED|HARD
> was_armed=1
> <idle>-0       [002] d.h1.    10.425656: local_timer_entry: vector=236
> <idle>-0       [002] d.h1.    10.425656: hrtimer_expire_entry:
> hrtimer=00000000ccc99756 function=tick_nohz_handler now=10405001482
> <idle>-0       [002] .ns1.    10.425660: timer_expire_entry:
> timer=00000000654cb5a4 function=test_timer_fn [nohz_poll_timer_test]
> now=4294677672 baseclk=4294677672
> <idle>-0       [002] dN.2.    10.425661: hrtimer_start:
> hrtimer=00000000ccc99756 function=tick_nohz_handler
> expires=10435000000 softexpires=10435000000 mode=ABS|PINNED|HARD
> was_armed=0
> <idle>-0       [002] d.h1.    10.455656: local_timer_entry: vector=236
> <idle>-0       [002] d.h1.    10.455657: hrtimer_expire_entry:
> hrtimer=00000000ccc99756 function=tick_nohz_handler now=10435001994
> <idle>-0       [002] .ns1.    10.455659: timer_expire_entry:
> timer=00000000a060ca9a function=test_timer_fn [nohz_poll_timer_test]
> now=4294677702 baseclk=4294677702
> 
> With the hunk, the stopped tick firing for the first timer sets
> TIF_NEED_RESCHED, the polling loop exits and the tick is reprogrammed
> for the second timer within a few microseconds; the 10 iterations
> captured take 0.92s instead of ~18s. Without that hunk, the CPU stops
> spinning on an unrelated event.
> 
> So in my understanding tick_nohz_idle_exit() program the tick only for
> the earliest timer; when it expire, the tick is stopped and not
> rearmed in tick_nohz_handler() (HRTIMER_NORESTART). Without setting
> NEED_RESCHED if another timer has been queued it has to wait for
> another event that set NEED_RESCHED.

Hehe, you're right :)

Let's try another strategy then. TS_FLAG_INIDLE is what tells nohz_fool whether
to manage the tick through the idle loop or through the IRQ exit.

So why not calling tick_nohz_idle_enter() on each idle loop iterations? That is,
from cpuidle_idle_call(). And call tick_nohz_idle_exit() right before
cpu_idle_poll()?

Then you can remove tick_nohz_idle_restart_tick().

Just be careful: tick_nohz_idle_enter() and tick_nohz_idle_exit() may now be
unbalanced. If TS_FLAG_INIDLE is already set, tick_nohz_idle_enter() should
return early and tick_nohz_idle_exit() as well if !TS_FLAG_INIDLE.

Also IRQs may now be disabled while calling tick_nohz_idle_exit(), so it should
use local_irq_save() and not local_irq_disable(). OTOH tick_nohz_idle_enter()
should always expect IRQs disabled.

So the purpose is to move cpu_idle_poll() outside the dynticks idle logic, then
it's safe against nohz_full timer management, the tick keeps being stopped if
possible and it's only restarted for dynticks idle.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
