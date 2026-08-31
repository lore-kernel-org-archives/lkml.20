Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B870147D44F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198287; cv=pass; b=V1r9zsxLodUdnf59bWwF1K8OryrnWuX12vMXazvCmZse82CURgdf/u3fmsi19ukUmvB2JNsA4biejErfcmHM9pvZPAEdV1ibr6hqqdnzcdE16aWDSnRh5xdNU0xaGX8vnVkYhXJ47/2MFFZUH9m4TcX9AbIQVkY8cMlzd2aOvRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198287; c=relaxed/simple;
	bh=I9kfafs/1Bu43ruu/5AtQZH16QoOsZS1EWru04KJq6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dCMSwQS7gBNzmQpbLTdFQyxJr2wnGo7LFxA5nGy5dp+PzG+iuI/CRQcIePLGLoi6YTY+pFviJXfNXmkl7nbBDqW+We/FxlVAFEiz8qii9RsV/amr9gnkEHXtIxV+tdG1pvAEco8tLXqv+wl/Du/hRK/109vYpYjI4kfbly0k/54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b73K+aUb; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b73K+aUb"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-498012a61f6so3175e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788198282; cv=none;
        d=google.com; s=arc-20260327;
        b=MqO1BGhJ2uGTkqXjbzTIpBI9ZFVSULLst89VVBRboN3VhHnR7fYWKqvbt7Ynb5ZY7j
         58Ev/6X5XZfXCbY29xIzhTolsNbGA8bSLh7inIrOKXEJtrQJ4BP2fgf6CRKikMMXQPcS
         iY9okw/dmvwEipMbGDoCJpMRhzQVeSLk9+2l3iX0oXU7KA+Z6WgDHXZEwj6sukeewrlx
         p4zLr2Eh1jEkn1GMxTEbpwzH88qSIG72t7OKVcQssabbK/t3dan9F7KdBx6TbkQn2k6j
         GaXIMacmdwoCrLSwBx+nysiuWrjEfhAzvYuT7dwbbk40Y8VazJb2hExCHc9gO0I2VZR9
         g8cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ISAzL6GuJopoRMWQpQWk2e7HTJAN8rWZ7VQ5HvwdBSw=;
        fh=EfSx+xa4+F0Rr81yzYx5sWw7wp4ZYh997CHJtVA1xxk=;
        b=outQRkIB6w3Zqq6d0pcpSRMhuRETy5AOTJc/Gl1lxPTw4/UM/75PrzL6V6b0BaERU8
         lwVHuoIroRPtbu1CcZt4beIXMGWgG7CBaM7+KthkVX1xZx2fjIuKVyI4gcpF39E7aXu3
         x9p+nhisy0hFjeliTnPpPxwfeJXq3djeuht3zYVC6rXV98mLj+c1tkNeb0L9MXOPyPtG
         5B7JuPxMD6XxPdgEDYQlbmBlU81xupbsvHp338hCQMKNBf2frzGcGwjsQzCqkUBGwW/S
         EwBeItzDb+GP/08ebsJvfIqbdSkm8Jc8Ef+SlIQ64nyYSQToXrzMxBnYLUGN59pQ6KxX
         gu0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788198282; x=1788803082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ISAzL6GuJopoRMWQpQWk2e7HTJAN8rWZ7VQ5HvwdBSw=;
        b=b73K+aUbYVeMfxdaGDdPjPEgZuhfIL/L+sVNvsyinG/07xF1x6Zn2gUCY5q2Bsy5Mp
         eViXFelO/r7uNHsG5M6UwUq5jDqx++NAW/jUQz6b5X0tycjBvfFvw9vUCk70xfIB6vb/
         k/uHFbLmt3JvrxV8pBHmqbrc+cZ9D7Arpce072SvoRe4uMj9hImF8e0AkM+X2jyHy6bT
         DGj7OToo/d9tAhNesSkCQV/lyEUdtMeLAd8Ou775w819s8CCo28ZDYi5vdTAYTT3L5sH
         OIkirGPgmwFHuJEOT6gT1DmwKK9CDjlq9UfkzIFJSq9s7ETj36zGMVwGqn69xpLqxqQx
         xSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788198282; x=1788803082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ISAzL6GuJopoRMWQpQWk2e7HTJAN8rWZ7VQ5HvwdBSw=;
        b=aS73P2ak9Y2wyqstpCqI5zmw5PNPQ9oYbMWlUiyPyK5cggss4ktnYS7hhYKaeXORB1
         fSReLC/A4XOq7ht+O2Ii508JwBPBjfZYROGRr0HbaqimnQTutVVhgIe4+++OxzafBdug
         6igZt1sBugu67N99CxipwMu0DxK6wLtn1tuvXhz+tZ7RLiIkvtseKbuaRbW+Zo3su5iE
         zPstkfVWg7g/YvF+ekiklbs4ML3WoTEoEebivMBdFbHh+Sxv9g11hKCBKl3gFdjDoF4Q
         J2vdJXSHGdlMNQZrU9pdTZijJpIwu/a2FmwtcCgIhwlj+gzlpRyzqZfhGz6n7+IsAnUF
         pvmA==
X-Forwarded-Encrypted: i=1; AHgh+Rq1OJ0xahD7S2JzNb03Myqf90CXrRXAsZNsnBCogM9ofpIt0VDyGascgjE1OSc1XYpGHLGZ9J8bcm6OpTE=@vger.kernel.org
X-Gm-Message-State: AFuF++nmZV4Ka7XeFGHcjYQOrft6kpKTWguihdcRn7DeHypHBc43brj1
	C24JGYHT10D/UX1VQlMkadUgIVIAUcICNFMbtqZSFIGBFuYhUahrnv7N5x2ZD02jnI3CqdvzbOG
	mw+Wdokj+xu990qiPkp+VGFKFqsLR45g0Wq2Y4hqv
X-Gm-Gg: AR+sD115ajmECfoEjv436UTa36kDtn2f/xM5fhLKJinU7OfCCp/IwJFXCEsmVud+iDk
	U65dR4/MlukBKg347q+OBNfExefjkOIMC+wFrrX1CWUyYncr3FSPYlgV2rnNoC8k2T/F0EgwlIz
	zPCF+2+w7PD1IhZxI4a7fwYvf2Chs2GNZiBaySaypoWa3IBn8D0CAKIPvF/Z+aS/co/AGB2tgId
	vnJIqdkRf7hz/o7o6fzQeL267ZOEGH+t3MTIebH98Zkw8TOBcwa6XkOrOjJZmB34fSoXIbI8YG+
	TSDpqezdyDhjdIpzyO00kMSVJ8TUHyF+r9UOHoBFFW1zjPSPl+OpaoMGv0NWdCEmCiHlw/3iVU2
	9iMp9HnZ3fNKwQfB2cCENRBQtabsBhDzRBP61zEMRf7g=
X-Received: by 2002:a05:600c:6d8a:b0:49b:8eb7:4a7d with SMTP id
 5b1f17b1804b1-49cdd243062mr28165e9.4.1788198281222; Mon, 31 Aug 2026 10:44:41
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com> <20260827232948.2520558-7-stevensd@google.com>
 <20260828120408.GN687043@noisy.programming.kicks-ass.net> <CAOiLmNHWGSwAqH815X3JWMrQCc2nh-fRNsNZ0hjQGv8JvFndag@mail.gmail.com>
 <20260829083929.GZ776954@noisy.programming.kicks-ass.net>
In-Reply-To: <20260829083929.GZ776954@noisy.programming.kicks-ass.net>
From: David Stevens <stevensd@google.com>
Date: Mon, 31 Aug 2026 10:44:29 -0700
X-Gm-Features: AcwNN1WpmAgjgQmF9GpDiXzg08-hj-z0i4rUlR_td_jtRLd8aXHDJ1pfdit0KWY
Message-ID: <CAOiLmNFsuaBf4C9=d5xrdi8SXYgFbjjD7ZnK1+G1=RaHquVinw@mail.gmail.com>
Subject: Re: [RFC 06/10] Reclaim memory from blocked kernel stacks
To: Peter Zijlstra <peterz@infradead.org>, shakeel.butt@linux.dev
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

On Sat, Aug 29, 2026 at 1:39=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Fri, Aug 28, 2026 at 05:18:05PM -0700, David Stevens wrote:
> > On Fri, Aug 28, 2026 at 5:04=E2=80=AFAM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> > >
> > > On Thu, Aug 27, 2026 at 04:29:44PM -0700, David Stevens wrote:
> > > > @@ -4320,8 +4319,18 @@ int try_to_wake_up(struct task_struct *p, un=
signed int state, int wake_flags)
> > > >                * A similar smp_rmb() lives in __task_needs_rq_lock(=
).
> > > >                */
> > > >               smp_rmb();
> > > > -             if (READ_ONCE(p->on_rq) && ttwu_runnable(p, wake_flag=
s))
> > > > +             if (READ_ONCE(p->on_rq) && ttwu_runnable(p, wake_flag=
s)) {
> > > > +                     trace_sched_waking(p);
> > > > +                     break;
> > > > +             }
> > > > +
> > > > +             if (!ensure_stack_is_present(p, &need_deferred_repopu=
late)) {
> > > > +                     WRITE_ONCE(p->__state, TASK_STACK_RECLAIM);
> > > > +                     do_deferred_repopulate_wake =3D need_deferred=
_repopulate;
> > > >                       break;
> > > > +             }
> > > > +
> > > > +             trace_sched_waking(p);
> > >
> > > Absolutely not; ensure_stack_is_present() must not call
> > > repopulate_stack() while holding ->pi_lock. Not happening.
> >
> > The optimistic fast path for repopulate_stack() could be modified to
> > try pulling from a pre-allocated pool of zero'ed pages. That would
> > reduce the function to a couple of memcg_kmem_charge_page() calls and
>
> Afaict memcg_kmem_charge_page() ends up in a local_lock, which is a
> spinlock, so that cannot be.
>
> Most, if not everything, in mm/ is build around being preemptible and
> thus not suitable for use under raw_spinlock_t.

With the recent work to make memcg charging NMI safe, I had thought
that charging from within the scheduler would be safe. However, you're
right that the fast path does call local_trylock(). I didn't realize
that only works because of an in_nmi() check inside local_trylock().

Given that NMI safe charging requires only using trylock and handling
the !trylock case, it's not infeasible to have an implementation that
always skips the trylocks.

The alternatives to that would be either not uncharging on unmap, as
suggested further down the thread, or using deferred charging.
However, both of those approaches would make memcg charging less
accurate, which is not desirable.

> > then vmap_pages_range() to repopulate the stack's page tables. That
>
> vmap_page_range() can end up in the allocator, which I suppose is ruled
> out by the vmap having been populated before, but it still has a
> might_sleep() that will scream AFAICT.

It looks like when we go through vmap_small_pages_range_noflush(), the
might_sleep() check is missing. That would explain why I haven't been
seeing errors.

We wouldn't want to remove that might_sleep(), so I guess this would
require either a new function or flag to support mapping into existing
page tables.


-David
