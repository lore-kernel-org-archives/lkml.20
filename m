Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E174CCDE8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788241810; cv=none; b=BbbyZ98O0SNIj0MxOMpd8kkdyFDcuoU8XqY2L/dTDNGMfatPZhyGD88ft95b/b2jvf/QhiKNL2oUKDfJEWa6bp68Fx8zr4ub77gqlW0NiMLROchgmhm6wyqeya4ybYCA6dXh1t3poEtkHUqKDJHmbQ+uBMoFPfwePrViKKXTz8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788241810; c=relaxed/simple;
	bh=pnefHhZaUXtX9LZJSQSVuGsmrJHNS4fDTg5BE652prU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OfVm5pHPzH4O1g+G8/Yju0cVm9hYqsoDPQA5U21bZ+For6WU+MH95s0KYyOitd2qcS3b+bFny0LM5238w9vOtbBjW1Gw4Qk3z9eW5cFlgdbHr+ENLJG190KWIb096pnZIsIskdKbmlaiUAcAQxIREi0aB/EW2v5wBctnL4zeX0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nCo2qke0; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCo2qke0"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso49577545e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788241807; x=1788846607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4pcXHVNN/f/FBlxkFnWJyCbKKWRhxlmaVfGPhM+aRWo=;
        b=nCo2qke09DupsG+ZFNXMH2PDIaupq4Jw/gP90W+C4f6YmVJjfvN5vJqeIdDdaZSXOB
         6Qe1oe7dsG8Ym7krDZdOngpcRBKQ3KERGujSE/nZZpwC3I/Nd/hyXMaQ5Wl6iFI2LWcp
         BWlBxHn7a2ZX1xssqbnrnZ1hbIzor61Vshv7CJhKkofy07iORBClKnQluSowH1yT0PvI
         rdL1/xSNwqGsTMzurN0OKiUGy+MDI0/ibBtwA5TpdahbppxqxoB6pJ0Xhmg9ZWxkt9ln
         i+i6jE/wxl8Rmf5fpUJpd8wNUddB8Fbjc4hZ7397qP3l5Ywh0nH0EbhVjZXHf/Pz3kP+
         hRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788241807; x=1788846607;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4pcXHVNN/f/FBlxkFnWJyCbKKWRhxlmaVfGPhM+aRWo=;
        b=i2pB+R2QLdc5+rE1pTFekUV3v3Q8eNEUbOUcVMNodyzK7f/hJ7KvXalFSnZIicqcG2
         45alkQVV1Wq7Zpv0jnqzaPU5wbPVoAnwucx5ZuiuFcn6y2x/Pd0TczWSrWbbVaCwX0qz
         i0mPlcXwe7OxzslJ+Ap3MR4XpoY6oFSxZ5Dfglk4FQ9lxGoeRFuSbgwvow9G0dj4YVDe
         2NLrN2Mx6m66sM4enJCUgtZmqVQsFLUZjc/QWd2vGtcRA2lsSedq9Fps0TnKzrze72O8
         M8TdHkNMqVnfCO7c6KUtYpr1wvO5N7p0rD9fqe0J//4FBWXXRONluDOvpztGrRe2/BIa
         E8qA==
X-Forwarded-Encrypted: i=1; AHgh+RrqQMyKJ5cyNOlxX1nuttyen/isFLKNw4ZfezN8jAhxRY4n7X6biYeOOkYUmt3IZr457mDGsStfS5KdJ5U=@vger.kernel.org
X-Gm-Message-State: AFuF++kMPT7CHMWqva5dEr+CAqKgzPqOsEi/7MPk/oiIYZTRHj2LDXgC
	JML40aK1CyqRg25wh+rlZrwapEuQVWtjPm4ekU5YM2maqD15KTw+n2Fl
X-Gm-Gg: AR+sD138naCK3/R4HKRnafZJLet49SzWbuoRaE3mIzle1O4te5mgFist7WdxznNeZnA
	Ntf3Sg8+Y6H49vHhCcm7iaKiJ2gl9ta0HSCZnJ+PMk0k2dlw8S7ikHQkq3aZ5VAbPzAKloeEDEc
	8iWdB0vmyLtyQDSd27qyN1h1u9NDFYgAvCL/dWD2kwDVM5ahz9TqKNW7TAzeSQ69bEMaQ8hKMaj
	zk/8yH2ZHeRqvrtvuYR/5Cw+VhuopUXHVeyt9a5XPcMhxFprr/ftzWsCTwBzdGe6nf2rrm6Fob/
	VJ0gRu/sQJS+eeKTUpSXSlYYu2mHqYhIeb/fUW43M0LH8x1MRFcdmx21urcrJFoNRHWTwt6dQPo
	AsNfduNrmwuqAqIz0ONF+mGfoZHj9Rp1s+pLXVY1LYQTZN0r53Yj3wJOFU1LyE1p0NJ/Zc5pAFU
	85HBC60JyYtQGNiU5Ycn+E9lJS33D0CB1HjFg1YmT2Uv7/WX/Hy/cOryB1jBMltE1KSLvKuxEH9
	t8DEP0HRZ3kizqbnrnOpVNknG+rkKRypuC3FTryhOS7CD0NMt4Rz2lqd8ceNIwVqAZpy0TME/OE
	t7vi1uxOOzfVHauouWwj22/wRWAEJPiZtkMkxs0n667tTWX+l0xifUxc4e7Mr+Fy/A==
X-Received: by 2002:a05:600c:4f8b:b0:49a:2c4b:403f with SMTP id 5b1f17b1804b1-49b91c46494mr412146165e9.13.1788241807067;
        Mon, 31 Aug 2026 22:50:07 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a16a-7801-fd8c-4b37-36b4-e53a.310.pool.telefonica.de. [2a02:3100:a16a:7801:fd8c:4b37:36b4:e53a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce11e0fsm40774365e9.9.2026.08.31.22.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 22:50:06 -0700 (PDT)
Date: Tue, 1 Sep 2026 07:50:04 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Marco Elver <elver@google.com>, Bradley Morgan <include@grrlz.net>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	linux-rt-devel@lists.linux.dev, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] kcov: Suppress timer and scheduler coverage leaks
Message-ID: <apZlkC1lCUFFMKsl@gmail.com>
References: <20260811154111.64669-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811154111.64669-1-kmehltretter@gmail.com>

On Tue, Aug 11, 2026 at 05:41:05PM +0100, Karl Mehltretter wrote:
> 
> Add a nestable KCOV_PAUSED bit and a kcov_pause guard. Use the guard for
> deferred hrtimer rearm, __schedule(), the try_to_wake_up() wakeup body
> and wake_up_new_task(). This suppresses their instrumented callees
> without excluding those callees from task-context coverage.
> 

Andrey, Alexander, Dmitry,

Could you please take a look at this series from the KCOV side?

It fixes the CONFIG_KCOV_SELFTEST failures covered by this series. Some
architectures still need further architecture-specific KCOV
instrumentation exclusions.

The three syzkaller A/B pairs from the cover letter also suggest
better coverage: at matched execution counts, the patched kernels had
14-19% more coverage and 42-54% larger corpora.

Do you think the pause mechanism and the places where it is used make
sense? Do you want me to continue with a v3?

I also looked at the Sashiko dashboard report:

https://sashiko.dev/#/patchset/20260811154111.64669-1-kmehltretter@gmail.com

I don't think the remaining warning about reordering or removing the
kcov_mode stores is real for these call sites.

One small change opportunity for v3: In try_to_wake_up(), I would take
the kcov_pause guard before the preempt guard. Cleanup then runs
preempt_enable() while KCOV is still paused and resumes KCOV afterwards.

I would also replace "uninstrumented" with "built without KCOV
instrumentation" to avoid the ambiguity Peter pointed out.

Separately, I will look at turning Peter's IRQ-exit preempt-count
proposal into a standalone patch for instrumentation in general,
especially KCSAN. It does not replace this KCOV series, since it only
covers work run directly from IRQ exit.

Thanks,
Karl
