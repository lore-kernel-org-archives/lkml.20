Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAD9288C96
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 21:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787951887; cv=pass; b=C6VPzKO1v9atftzOx9VPP7bAVzlq4soz2ExL4JFkXSALiX5NDtHI1Lleh/G6bISV7V2/qnyBxz+Zys1zV8EutpfOnR+539DA6ui0CfRy5PLioOndemmkeH0WxwHvK1kSlh6lp829h3GmReNDeACskinVjKIWOX8r2zn+ebNMTVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787951887; c=relaxed/simple;
	bh=OFShOOL1jw7qJlGJEKJyhIQfr46/SV34zO6TPF0C7C4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bzDvCvvr8nBrWwAKkl/KZUOUWkJyY990DgwXswBGsr09lECCDb48jVJrQDhytGEpJ8PVzItN9vKsp/x01O6y6hond4LeNYz/PyZ8tGA8VHCUrmDcQKxeXD/gkHGnkkX9gvo8vfJuHdJSSMIdJSZBvuCGAnr9k3IPK2RgfSRVTqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dykkibQE; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dykkibQE"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeb688ae83so589e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:18:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787951884; cv=none;
        d=google.com; s=arc-20260327;
        b=esyfP+DTvTzdU1WuQ/D814aXXYQUXRBOu1KkFNmVGZTFmtdNqAJqY7iWW+n/KMRzYh
         8rT3pRYgvNteS9CSaAYL5Cf2IO+rkAo/gZDDlZb+/da3C3r8f1GO8EFuDIGquuJ83kxz
         57aEHc+lOR7Prd1his8U13DY6sCyem2DmcToL/LpuN2asuHCpDLhZDygW/WphE05+yOO
         ytGI0jdSXNBvaDEf1Lk315TBBhEXXbbixm+B2BwYlA4E/7J3nV47dKO7B2tzIjYsTfjS
         nmblJ3Dj29VJIEIN3sHsPvOaraxYal1savkOspbmMcGYvVgRWAJHta331FZDExv1Io66
         phqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ox47LSGNLn4iYQakTpAdrm+z1IZQvt0QyHLEVX+5st8=;
        fh=346N40b7fqQtcJFexTBAm7QMlH+T7/DPvi492gO1r40=;
        b=FRMNLIzfmyWjRTD4eHL7CubWyFu62yrasVQpZaS7jtTPtg5c+JBB0S8tDZtP/nQ1ya
         iJq6iwmVAQ5BlzFQTrtZ8/zaL/Q64ayn2GxTlusbCG/88n80F66GM72A1IaWKee+2Ear
         WfJwhCaHZHG6LqBch+XVhye1jsCHfgp8ucAz8Pr5QZ85WZ9WtA3UvyM3yJlZS2vBo3US
         /dbHt1xRFnfM2C+QPkA6g+VXsd3ZGom+8vIY7yazYjW06zWiL6WJvcIXRVldUDY+gp85
         tHtila4RXb5rnJcx0qB0WbX6mwJiKqaj7ErC5TRygwY/Rsfo069zEQagqBucAv5AzfAR
         FGyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787951884; x=1788556684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ox47LSGNLn4iYQakTpAdrm+z1IZQvt0QyHLEVX+5st8=;
        b=dykkibQEWMdhx5EIGUW0sb2VT+y7YV6Lg3LA+wusdYSfDKIEcrjNImukLK37NXkWAM
         U2qNHHnbayWG6B5C1aXsc+QuKXvp7imP15M5ot6KZhG9UwZGkvGk18CQbgTdqYGGw8sa
         zsp2vImMPL959SNuXelb0hUKe9viK7JF6Ey1ro7sIjvc8AUMcwAXAW62oSwCNx4Z2lBO
         LN4rqc7l/k4aRL0iz28gImAjGEUe+FJFPrCpHMOqiDgcFLmW3uad4tWuH5wuLn98n0T2
         Z33GnGyPNs0Zp3VDpNseZFES3G1jkamp98hfjoY4bGqXiyoP4T9Ol2b8PZsNFe+cJhqD
         ytGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787951884; x=1788556684;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ox47LSGNLn4iYQakTpAdrm+z1IZQvt0QyHLEVX+5st8=;
        b=pvmlDLxinZDn8wQekCpwXjS7p3JjaOqmPUmSLDKSIhHreqAF/dbBv/e1wdNFDZSR50
         mE4G3y4rbhHhuw/+RKPkz2QITfru1NMtUSGMOYeUBkxplxPo7IfcmAcG5sSdKJotlDba
         mhca9or/clboBGeEvJwWXxZx6pdhYB/bk4cueRMoE0VDkGytBZSDhiXHcCpuhK8/6bUw
         QsC8gTey/DauQqyktGBk3QAL+FjmghqIWa3Rt9/tW9aw8DEwGcu1MUbMpOI+5dLLQQCh
         Ws+kUHFh+cdCJNlZrCrhmPwEDPOgR8ti5/KFpUckA+FIytffwyoDRvXxJbyDLucf1fYH
         gmzQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxskMVUbLiBwR1tXiV4FM+DY8uFnHlwCgRPpbvrvx8gnkeVHKr0vQKDb4hRtk7lFOwxYmOE/P5m0a6x5k=@vger.kernel.org
X-Gm-Message-State: AFuF++no0izwLnlTnSiOl6sjsRkdHj5hXRGr1veNQDXrv2k1vGNfMJV8
	+RfZmD1ZAKeBm7No91P2QcFD98DZ6CDEuEvhK/d18X7mlXxS959+Jw0iJQsaTv/6jffLrxhEa3p
	OUuRfceNglvRM4kkXIwpZXBpic2jDR6n9NW4VzUjY
X-Gm-Gg: AR+sD10jHCiCX65sPOzk2fY1wU7A/pcO+yktMHMS1/F17cpN14+9mHHGPh+hStz88c+
	4KFJ6pmSnW/8Kk4eSjDmMqc+3ACxl+tXmaTj+wzMxdO6TpzSBllnCch6vn/rVcVGiqWffUT+xqq
	fdBItKFAnHL8t3/QI7MeOfP/WtUMMzyhhlMjFsm5AGD8WqAZiqPJ0AjMhWctAXytsUtgkWCNQW0
	bgXbpj9OUa/2BQWPHF43Ic6w0jc4IyttP71z2T+u0dEh3cw0GXmgiAUOnBVR+05PvfUK5Nx1BYA
	5ia4Ja6sTfXxpoxH6plpryRy1StxTYR4p/rcNm15pZccv0i4PQIPMO6rALUzsjZItHJeKhYURdr
	j
X-Received: by 2002:a05:6512:1594:b0:5b2:a967:c0c9 with SMTP id
 2adb3069b0e04-5b5ef2283a7mr31129e87.7.1787951883225; Fri, 28 Aug 2026
 14:18:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com> <20260827232948.2520558-7-stevensd@google.com>
 <20260828133620._x2XfJR_@linutronix.de>
In-Reply-To: <20260828133620._x2XfJR_@linutronix.de>
From: David Stevens <stevensd@google.com>
Date: Fri, 28 Aug 2026 14:17:49 -0700
X-Gm-Features: AcwNN1XPwhnUNeipFck3Fo-JT824naG0Joeg5blGOWBTdqacwVpK3ww48maahZk
Message-ID: <CAOiLmNHK5Hw55omycg_EAHzi=g1iqJn1NTap1Mt98im3xTXcvA@mail.gmail.com>
Subject: Re: [RFC 06/10] Reclaim memory from blocked kernel stacks
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Uladzislau Rezki <urezki@gmail.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Clark Williams <clrkwllms@kernel.org>, suleiman@google.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 6:36=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-08-27 16:29:44 [-0700], David Stevens wrote:
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index fa7507ac8e13..adb4a5957996 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -1534,6 +1534,24 @@ config VMAP_STACK
> >         backing virtual mappings with real shadow memory, and KASAN_VMA=
LLOC
> >         must be enabled.
> >
> > +config HAVE_ARCH_RECLAIMABLE_STACK
> > +     def_bool n
> > +
> > +config RECLAIMABLE_STACK
> > +     default !PREEMPT_RT && !PROC_KCORE
>
> This shouldn't default like this for RT. It either is useable or it is
> not.
>
> > +     bool "Allow stacks of some blocked threads to be reclaimed"
> > +     depends on VMAP_STACK && !STACK_GROWSUP
> > +     depends on HAVE_ARCH_RECLAIMABLE_STACK
> > +     depends on !DEBUG_STACK_USAGE
> > +     depends on !KASAN_VMALLOC # TODO: add support for this
> > +     depends on !DEBUG_KMEMLEAK # TODO: add support for this
> > +     help
> > +       Enable this to allow the unused portion of kernel stacks of mos=
t
> > +       blocked tasks to be reclaimed.
> > +
> > +       The wakeup latency of tasks with reclaimed stacks may increase,
> > +       especially while the system is under memory pressure.
>
> It says *may* increase and on RT it _definitely_ will increase since
> there is a kworker involved not to mention the memory allocation itself.

You're correct that this phrasing is wrong. A more accurate way to say
it might be: "Under memory pressure, tasks that are not scheduled for
extended periods may have their stacks reclaimed. Such tasks will
experience increased wakeup latency."

> Anyway. This either needs to stay away from PREEMPT_RT or find a way to
> exclude at the very least mlock()ed tasks.

Disabling kernel stack reclaim for mlockall() tasks definitely makes sense.

> Did lockdep see this?

What are you referring to by "this"? I did stress testing with lockdep
enabled and didn't see any errors, although I will admit the bulk of
that stress testing was !PREEMPT_RT.

> If I understood the whole exercise correct then you have a kernel stack
> of two pages and in best case you can unmap and release the second page
> while the task is napping.
>
> What might be a tad simpler is to memset(,0,) the remaining part of the
> stack. Since the stack is vmap-ed it should be swapped out on its own
> without additional tricks. That memset() would help zram to compress
> better so it uses less memory. ta-da.
>
> What also should be simpler (and I am not saying just to move you away
> from the scheduler) is to have a shrinker which iterates over all tasks
> which are marked for reclaim and then similar to swap just unmap both
> stack pages and release the second page which is not used.
> Upon wake up the task should create a page_fault which would be used to
> allocate the second stack page and map the whole stack again.
>
> This sounds simpler.

There is no swap for kernel memory, only user memory. I did contribute
to some previous work that aimed to only only prepopulate one page of
each kernel stack and then to dynamically fault in further pages as
needed [1], but handling that architecturally and guaranteeing that
memory is available when needed is difficult. Full-on swap to zram
within the kernel would complicate pre-allocating pages for kernel
stack faults further, since you could start getting inter-thread
kernel stack faults due to blocked tasks putting pointers to their
stacks into waitqueues and similar structures.

[1] https://lore.kernel.org/linux-mm/20260424191456.2679717-1-stevensd@goog=
le.com/#r
