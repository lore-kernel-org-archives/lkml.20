Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B211397
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 23:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787959996; cv=pass; b=KmmbOlg11Rd6JOy80yonrtIhPVskvCLH2AoKbzvUoS5+jhAleQZo15UJwDHmpMA6+Nc6tjQmssDUx9F6j3v9SLVag5KwFJ1IVX5vsc7upbMmFcztYn2hXukevH3Dk1nncnZeb82ZmKrZVdSp5p3N1HV4w9OQtWqeRwtRawsf2F8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787959996; c=relaxed/simple;
	bh=y2LNCyBpMU/lcaKVn6KCGli+f8PCYoXHDNxznrsxfH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=grI2MAZlCJlKkGUJkOfax/MdkvhpMyoHM39iIsVPw9+RotqveW/Ho9NOWsxel9PXO8htmEGUQU4mwcPvX4JCf4hcWS2+/IRzk4QpBYliVKS7mqOpJw+QaooFcN08/jlP4Ic4JIpOvBihOz4wCQmf7RF0gB6CsfeJtTVMJ7bbFQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fS5i0x/z; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fS5i0x/z"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-499add6348fso8125e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:33:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787959993; cv=none;
        d=google.com; s=arc-20260327;
        b=hRIP5dQB53Cryj0rIlR0nhOsmRlqElmz/KiGK7pp8zYz8Y59ebu8jKpBMeB4hKtAj6
         riQidr+Bzx+p+gJpZ9ynBtszQwVYAR1UHgk1Y7wT9iWZhXMZ76PfAKTHgewVofRTi8+l
         /WnZ25XJRibzToec9lWgW1igkG1n0PVFRbHjrTQThtv9/Q8yGKhEuU88YMXh3ZxB4f41
         8WlbDT04jZxCtIoHz+EIFd8k20eNZTymzykNvRy0FkS0qERSp24thYrHRYc8LO6OJayY
         nziHgJ/WdAJnLVL1AL1FG+7alTD0fQ0jvPSEXFYXOTMGhv8SDTPn42cMAXuwmEyfkqWz
         Gg4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vPbHw3SXRt8c1h9FzmacGhPD5cdWkOAwAK9dhsy7doU=;
        fh=W8YDti6KznwB8wbwhl3B82jrzjvlU72qLeB1vJuA+Lg=;
        b=NJrYHcQcM762BJNhyOtUyR2KWx0lhcknf2UP34J75WNATwIwetoaWNk69omfTUZSyw
         v/WsgnW2UBFVn/3R/0FcDSTzTQLclr1DnyJh6fPha7blyEdm0QLmZbNocvyK3HxfPCgp
         qVFXMbIxyxlM9w0ukkwdyAxJOr6BKSwH63+ueBjBSqHNOluPXFZsBMyNkNKNPNIBA/99
         jg9nCM5EC3u+FXvd64JpqEb+CddmuLNcPCQFfU/0RzeXU5E5zZ1/lnbEkO8IJFwy1+74
         cxRYlnua/lboYgTrZ7qTKdRr3eQ34TrQTA5OHAYdbSXgjYf4YY2/fRvj3t8neQIznp0u
         L9yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787959993; x=1788564793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vPbHw3SXRt8c1h9FzmacGhPD5cdWkOAwAK9dhsy7doU=;
        b=fS5i0x/zt4ZmdW+TVEnVBl61EbI56vWF14xCpztg/dc8/GOZCMzaJ19D6PWrSghBDd
         VeMSKP2q081LSjm61MNjJwltYq1S8uABk/lFWYYKbEjBLnQzWkkQFdxN/ePnhJqL6UYn
         Uta1D0An8OhQRwsZUpP11G6FfXdZwMx5LH+a34nBoKJCjNoQnhlnvfCSDczqZuPFiiTp
         /qOINEquAVrhybGWg/nS5EjLomBFFoAEm8sg2hW7eJ6BP9oFml2XXGTEpJWRJv38T4PJ
         7KkSm/qtol6GBx22PBJyCcLgY2+HkhPjHgXE0W1YBEZl3kxiNqLbebp4wF9qcmU2IgFl
         7LxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787959993; x=1788564793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vPbHw3SXRt8c1h9FzmacGhPD5cdWkOAwAK9dhsy7doU=;
        b=MujkKeWUIquCk1rJb4D+rj/pLkc06oIKbKXdMS+4R2Y9wkotFt0s3YygklhGnBH8OA
         I8nlOOwA6t1kt2OAL1ksvtF08NoUYIyQGuLxVRbtN5N6Wn8LChtlnXQV6+6/EDdCXVbj
         IZr2MSjMGpl3uTuM4JlfM7ON3OQlaCATv7pBUpwr2h/0plkLUFm/h+MiINX18g+2EnL1
         /6jotOvlsMUrxIXRUktV96TqyR13TRetxKt6SYOWZaCuhue9th0TPA7awRUoOv7S1S/+
         OH4aQlVSU8VEpF8A0ox54dHvyP1xIZzCe+grtYYwxdeYtWzu+0Pjpr+CLa0CWzsUjTF7
         GxEw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0p2ctuwzVj97S4vDlbP6gs10sgzJZv06biz6qae6CUCQ8vlFZCcd+p5mG5t/0LbrKEVM4v7JmB5gCSos=@vger.kernel.org
X-Gm-Message-State: AFuF++l8edtLIQ16N/1c5yeiidnjT0Q6THzOStopTGPEPQitg1YeXviQ
	EarUE/TDhzM5DYU/vhGNZ1HshbfH1OSTT0EUCcAI8uoUIHz6YC3HE1yy98/V8U3Hbf8UZyLTx8Z
	0XtTrmGgUoJCQV67KQqtTnFn6pLMINsAIxyqqdb+K
X-Gm-Gg: AR+sD11UYiTswnP4YF3C5RCbikQTOw0nPFR0hloMEcdJdRMOo6AAjUZU373rLC113i/
	+3VVJKLVMv/mB4cRBEdygR7c5jr2PiSovc5wBjPqQ/Ct7pBdS0rZrc0Y5IBVFzHgXn7KRV4F8Oe
	cytqF+aUfFPGMo0Lvogs1OOWOKKOG+cixxG/9zyvfQI8YinS6v3CriwHAgAwLDmsY/rbtwUxsxt
	p8KQZyIrxpQcLDXNAUBzMW3Bs2uiaYvVDB8e34JG8686OPzt3Lhxov53d7jw0XXOh1LkZMBwADM
	QR4lasvYtaw9qyxoGyX5cy6uQm7IdT8P/5fyuKXto4etHLyeqemfOkr5VdwrzvcOmrRX9KjQNk8
	=
X-Received: by 2002:a05:600c:3794:b0:499:cb15:4511 with SMTP id
 5b1f17b1804b1-49ccbb61af8mr349255e9.8.1787959992396; Fri, 28 Aug 2026
 16:33:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com> <20260827232948.2520558-7-stevensd@google.com>
 <20260828125706.GQ687043@noisy.programming.kicks-ass.net>
In-Reply-To: <20260828125706.GQ687043@noisy.programming.kicks-ass.net>
From: David Stevens <stevensd@google.com>
Date: Fri, 28 Aug 2026 16:33:00 -0700
X-Gm-Features: AcwNN1X4mjRfDUQTmdB2Q8G8afN4YKn_2mHhFiMGwyOfarmpU5bToKMeymOANtE
Message-ID: <CAOiLmNG8XUKzy7uyodfDyuSBKJa4LujqSRKhgmOiRUSFEAEjFQ@mail.gmail.com>
Subject: Re: [RFC 06/10] Reclaim memory from blocked kernel stacks
To: Peter Zijlstra <peterz@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Uladzislau Rezki <urezki@gmail.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, suleiman@google.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 5:57=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Aug 27, 2026 at 04:29:44PM -0700, David Stevens wrote:
> > +DEFINE_CLASS(allow_stack_reclaim, bool,
> > +          ({
> > +             if (!_T)
> > +                     current->flags &=3D ~PF_RECLAIMABLE_STACK;
> > +           }),
> > +          ({
> > +             bool was_set =3D current->flags & PF_RECLAIMABLE_STACK;
> > +
> > +             current->flags |=3D PF_RECLAIMABLE_STACK;
> > +             was_set;
> > +           }),
> > +          void)
>
> > +     allow_stack_reclaim(prev);
>
> > +void __allow_stack_reclaim(struct task_struct *tsk)
> > +{
> > +     union stack_reclaim_state prev_state, target_state;
> > +
> > +     if (WARN_ON_ONCE(tsk->__state =3D=3D TASK_DEAD))
> > +             return;
> > +
> > +     prev_state.val =3D READ_ONCE(tsk->stack_reclaim_state.val);
> > +     do {
> > +             target_state.val =3D prev_state.val;
> > +
> > +             if (prev_state.stack_state !=3D STACK_PREPARE_RECLAIM) {
> > +                     WARN(prev_state.stack_state !=3D STACK_IN_USE,
> > +                          "Reclaimable state %x for previously running=
 task", prev_state.val);
> > +                     return;
> > +             }
> > +             target_state.stack_state =3D STACK_RECLAIMABLE;
> > +     } while (!try_cmpxchg(&tsk->stack_reclaim_state.val, &prev_state.=
val, target_state.val));
> > +
> > +     if (irq_work_queue(&tsk->stack_reclaim_work->irq_work)) {
> > +             /*
> > +              * Take a ref that gets released by do_reclaim_stack() so=
 we don't
> > +              * have to worry about races with remove_from_stack_shrin=
ker().
> > +              */
> > +             get_task_struct(tsk);
> > +     }
> > +}
>
> > +static inline void allow_stack_reclaim(struct task_struct *tsk)
> > +{
> > +     if (unlikely(tsk->flags & PF_RECLAIMABLE_STACK))
> > +             __allow_stack_reclaim(tsk);
> > +}
>
> So you have a guard with the same name as a function, but the function
> only functions when inside the guard of the same name. WTF ?!
>
> Anyway, it looks like you're sprinkling this guard around a few specific
> block sites. Which seems to suggest your PF_ flag *should* have been a
> TASK_ flag, no?

A TASK_ flag is definitely better. I was thinking in terms of defining
safe scopes, but that just complicates things for no real benefit.

-David
