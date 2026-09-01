Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421A4366048
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272610; cv=pass; b=n17+B/UT+BYgn7DguDegylm8L+QuK+AJa9dhZxMIgbMe0xbV7Rgg7myLVdGJ3z7pfSGj2kKiA7DrOLMrJSk5s7A7lqcG/yrmtkB7uL2o0WSH0dff9fj+PNaiIdKkDuHXbEksWaA1o1qMd3C2L3OHZ61gY37mBIwu0nwquiY+mWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272610; c=relaxed/simple;
	bh=qVZFdLEELdtpeRS48YE/BFx4PZCoxsypLGymnPxXdSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n5wWIKti87aehO9m1G1gOq60y67oGHbh+lNpC1ZtiCE4f0FQwBzit9U2Sr2zR6PaDTQcmd9y0Eom5NrakLZMKuEYVZF9i3uxBl3McibfI6+0DOHoowqoaluIs2wSP6WCWW0uMPHDExJTaPXokcoF/ZodekHjHi2+tvF2gwvoR1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uQUdlL3e; arc=pass smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uQUdlL3e"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1ceadbd16so5405499a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:23:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788272608; cv=none;
        d=google.com; s=arc-20260327;
        b=O1qALRYsAyE7fwI6OfQ/Sj0QNhE0CeinbPGsg/zoFWQ5lPTaiFodANKqECXN9NjSRm
         PEs1s0nigiQmZMBNwkt12QZQ1XxwMNCH0ysgAhk8Rh5dRxzIVCjNMaFpccurPIBFIvyH
         OFkEnQDhMrFz3jStYHjginDM2xZ+2bSZZNeinS8rLXC3MRozhe1jt+TQ2BqMygHmZ+vS
         zMDvGX0fc8HPcaJ11jjSEn4YqVboc++w5M5IbpKRuoQZy7RgeM4ZZYbabQW7BJtX+iDL
         gGW/IY2LCCc7bLGkK8agY6gRdl8dDjdZpYbMMGszDS5vdXm9JObiPpEqNBxlVOSuU26t
         eyhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yRvC0bVDQMbTYiwzOOlxphxSOpTPx7t/v7axgahVkgU=;
        fh=+G+AqdMLrx1DzP/7z7X80pQ1/l4xIvS7jrRHCHDeM+8=;
        b=njNe31iYa5Sq+XuikCC70Kt0HdW21bp7TuhMRsIKWDHq9Acux8VCRDbSjwinRfMT8D
         /O9o8UzT7s6xVrhlgCICBSJ62QW3zVSXto9N9s4IMvFynZLsX1XlwMNmL0VVXkOka0Hx
         l72dC/9HIAra0fTztWl/dUbrsWz2vN6iViegScIg7JtC34m2pefXJwDrYj0IpOpFNLCR
         qjAifre8cl54/ZI4x4i0jjD7a+5h93GzyorHeM05/kMeQm2Pg1TrT67DMjKuhpbuD3IR
         fNOjHlY+4tOd/3IYnRQmuo5pbfgGdjv5LsV6TnMCvjZJ4h0f/UC0fBtgk99X8+5wQ7wH
         4HMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788272608; x=1788877408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yRvC0bVDQMbTYiwzOOlxphxSOpTPx7t/v7axgahVkgU=;
        b=uQUdlL3ejNe1Hl996+iiEPDexpYop9A7HD22wQEIbIJbIezQpRpgTzy1/9XFL4I+sh
         UOSGEJBVpHu+zGcDTXZuVPz9OPnBWlhZdBUhxi/nTQ2BgsiY7w9wJ2lsI4GZDBTKwGUG
         TJVlDRg0MhcBUwFeTeuyPe+1W/Q+6XFaPSZGDbckJwt6Z6F4Dcoa//A3vQdMHmp5Mhuo
         fBTU+1G7fiqwAIC6vx8ldjNqty4BHckXmUU0AynMEwb9u3qklIsrJDrfVfxYne+UEmJk
         AIBXCQvUpSQGz9nWa+WV2ROPXWoVwFi4A0fwqdC9d1snBOtiE1tu/WltNc3gr7yeyNMS
         mfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788272608; x=1788877408;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yRvC0bVDQMbTYiwzOOlxphxSOpTPx7t/v7axgahVkgU=;
        b=l4fYqjzZgg+3L30JRfUySnjE7LlywAtRIVhr0Wzf4XuPjuwOnU0V8aU2a053s9LiIW
         THcqWYwkS0xK3NETaXglZH57zYv7JWqElJPTDWILfBqcTLmQUkvoHzjwF+qDzL+ag/dh
         QkAXZgtBbaa/R6S80P4SXk4lHNRW1WRi1XqEcEPMQE03Y+EdjFiaVwDu1w+XOmDw8zMT
         cTR5CPLRbAGes9Bsf11VrrwS7/drMal+EYzaNBc0KU3x22wvwWEz7nBZQMe7bAVjobyD
         glrJqWUYWNhDLoYr6zzs41mkJ2ePyUQthot3Z9h3AZR+ATWx7SLJEs0xbJ0Dzt11f3pm
         eWUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxk8nsUpBaI65fFHnCKqBZX6dwNZ3zh9EkpTbB8S2cIG+VWe27UHMNRsuryPEr+yMwom97d0nLfx6X8jD8=@vger.kernel.org
X-Gm-Message-State: AFuF++lVmqyVXdaB1voSbyBe/6e1IKUksYmTtgl7sRPa1IejZHXpEX/I
	ALox6P2UqRYGuNlVfsm+mFn/O2SKiH4cabRMzHrsaUYXB9T4jAsKPyZ1hPmYdH3EkvwZ3kfFs58
	vA7ylWU5w3B9P56BNnAIOZyOHGPcmVs/Se0/vHzzj
X-Gm-Gg: AYBFou2+56+iNvi4RjkZk8bF3s0VEufZXULAaFwsJn2GlBo5rfUG9yAIrPcUkkzVo/C
	LvdjfIJ9gX+OLUQ/Ir1NjMrz2FniKNlrfhpN6unIE5FeDcpEz7tFCYjmqetIVHntbEKRFk/lM8a
	hBOm+ZJ9pgTdFceY1OPlYVFVoD+UxUeQLbxaB7xGTTAsiru7lLHKqhUet0pDDdiG1F/80FnIRD3
	sKo4rQnj+S9LkRHqcySR+eamgvsWIVeSSrMhIHvxJD5ov9gEBK3bUwpsdTGZLm32DsXh0xo9oim
	BbNKiY5xnQa3sD27P+fM4OGccbGGJF2+FwRnZTGFMFt4GONSo4hJ0yTpnItP7l/tbuSvt+0P0gQ
	=
X-Received: by 2002:a17:90b:57c8:b0:398:9bd5:4910 with SMTP id
 98e67ed59e1d1-3989bd54c5cmr37828396a91.23.1788272607558; Tue, 01 Sep 2026
 07:23:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811154111.64669-1-kmehltretter@gmail.com> <20260811154111.64669-3-kmehltretter@gmail.com>
In-Reply-To: <20260811154111.64669-3-kmehltretter@gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 1 Sep 2026 16:22:50 +0200
X-Gm-Features: AcwNN1UXW0GHI7VlHiZv422mZOWzTkl7pcwphIX2rF2RlL5p8DQ9JNZqMFJaNIM
Message-ID: <CAG_fn=VcbA73TTxP83kgid2VUj1atf+6ZBU-NaKUHe=3vPzfYQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] kcov: Add a kcov_pause guard
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Marco Elver <elver@google.com>, 
	Bradley Morgan <include@grrlz.net>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	linux-rt-devel@lists.linux.dev, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 5:41=E2=80=AFPM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> Interrupt-return work can run after HARDIRQ_OFFSET is dropped, when
> in_task() is true. KCOV then attributes instrumented callees to the
> interrupted task.
>
> Add a KCOV_PAUSED bit next to KCOV_IN_CTXSW and mask both in
> kcov_mode_enabled(). The coverage callbacks need no new check because
> check_kcov_mode()'s exact comparison rejects modes with KCOV_PAUSED set.
>
> The context switch suppression keeps its own bit: kcov_prepare_switch()
> runs on the previous task and kcov_finish_switch() on the one switched
> in, so its lifetime is not a pause section.
>
> Provide a kcov_pause guard backed by internal helpers that operate on
> current. The guard saves the previous pause state and restores it at
> scope exit, so sections nest. When KCOV is enabled for current, remote
> softirq sections save and restore the complete mode, preserving the pause
> state.
>
> The helpers are __always_inline, and guard users must be uninstrumented:
> inlining does not remove the caller's own coverage callbacks.
>
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Notes:
>     v2:
>      - add guard(kcov_pause)() backed by private current-only helpers
>
>  include/linux/kcov.h | 40 +++++++++++++++++++++++++++++++++++++++-
>  kernel/kcov.c        |  2 +-
>  2 files changed, 40 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/kcov.h b/include/linux/kcov.h
> index 895b761b2db15..1b4806dab62fb 100644
> --- a/include/linux/kcov.h
> +++ b/include/linux/kcov.h
> @@ -2,6 +2,8 @@
>  #ifndef _LINUX_KCOV_H
>  #define _LINUX_KCOV_H
>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
>  #include <linux/sched.h>
>  #include <uapi/linux/kcov.h>
>
> @@ -23,7 +25,8 @@ enum kcov_mode {
>         KCOV_MODE_TRACE_CMP =3D 3,
>  };
>
> -#define KCOV_IN_CTXSW  (1 << 30)
> +#define KCOV_IN_CTXSW  BIT(30)
> +#define KCOV_PAUSED    BIT(29)
>
>  void kcov_task_init(struct task_struct *t);
>  void kcov_task_exit(struct task_struct *t);
> @@ -38,6 +41,25 @@ do {                                         \
>         (t)->kcov_mode &=3D ~KCOV_IN_CTXSW;       \
>  } while (0)
>
> +/*
> + * Pause coverage for current. Callers must be uninstrumented.
> + * Pass the returned state to __kcov_resume().
> + */
> +static __always_inline unsigned int __kcov_pause(void)
> +{
> +       unsigned int paused;
> +
> +       paused =3D current->kcov_mode & KCOV_PAUSED;
> +       current->kcov_mode |=3D KCOV_PAUSED;
> +       return paused;

I think these two function can be consolidated with
kcov_prepare_switch()/kcov_finish_switch():

static __always_inline unsigned int __kcov_set_flag(struct task_struct
*t, unsigned int flag)
{
    unsigned int mode =3D READ_ONCE(t->kcov_mode);
    unsigned int prev_flag =3D mode & flag;
    if (!prev_flag && kcov_mode_enabled(mode)) {
        WRITE_ONCE(t->kcov_mode, mode | flag);
        barrier();
    }
    return prev_flag;
}

#define kcov_prepare_switch(t) __kcov_set_flag((t), KCOV_IN_CTXSW)

static __always_inline unsigned int __kcov_pause(void)
{
    return __kcov_set_flag(current, KCOV_PAUSED);
}

(note the READ_ONCE()/WRITE_ONCE() around kcov_mode, plus the compiler barr=
ier).
