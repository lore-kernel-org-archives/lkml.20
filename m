Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793123182;
	b=edZZZB5VBtmK/JgCTJ9BeDY6vukf+pnXUX+5O1PEOdaA5q0C4C/D2F0+qm5jZgNA3Rp5
	 6J2Eu7bxSnZSOiNRfqBmjRlJ2h8f2Lrw1Id4+0kSgf/k8H8TSa90HyILy5xA7FiUQg6eC
	 HcFEcvZfn3+jMqwlv9fNMkaAQl2aW9KMh0G6AQ9nqjKYNTaRuNzn9VgQOXOkK5w4Xdvg9
	 1Vy5xFxGhYGOzOxDzv3bgr9jdmv0hxzcX9Gnci3u/aVgEMFs6sfY5N8IpO5vqwTjGHM+L
	 qVEyQrU/h6wD6Iqxvz5MdUt1bWGCE5N2gdzZA4UuraFPGL5KgPDNoTB32KYHW9eKDvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zJVDlsrsrfYz550OKB/3hdZdazvfDU9t83gGSE4oBec=;
	b=pwMysG8Go9e6qunxRABnbi4Buh4ywSkuJepi4bynIO8l7c6+CNLPeg2SYlhtwhEcVjzD
	 nK2HShcBGrKOvHxBL/YxcQN54mBfHbKHYMKtZHegPFdPe9v/kxS5F+awcnV7uRm2oNHxK
	 LCrtRvibc3Rdo/wqDb1neLgfqLzHVYlJ5sGLzhQb9G3gVMI6CkWQhiZxgiNkIyCsrYSaX
	 /rJrB0JKSdRhxIYAXzOzlwwkEk39gDt4NjVvPdj72h/hQ5uCyu0KIwGMqyU9jwsnvqMk1
	 efgDwJQotIegAskrtJukfM8LqN0I+pGfMgbsAWkYxrRNB57PjXcvhEyTSkD17PuZeOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dJZrWgbc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB9E606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EB9E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dJZrWgbc
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c423b145922so9772566b.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793123181; cv=none;
        d=google.com; s=arc-20260327;
        b=JkWj+zwCl0Ux+QmB3BhcroRvKj61Q9ydVSdJeqIBQl5WQACvpn/NVCD8iBiGKYRR6X
         aUmzy1KxqFhZ+6K6aRBXn8SZ3c8B1et76B6R6DSn2+dT8ATdAfdBfQjs+p9B7XRZhtsg
         NTdj+C8e20iGhOX1YE1CQFpg5wRMd/sxCS/x+IfVxa0HU9tAN9BpMMKCNN+m4kXLuEaM
         Ft2BKV1QCNhOjhrYqCBHoC1s5+OHBn3PEX6hWHKglSQ1txUGjPO5Mrsdv/ZSYVcgEscT
         Mjqr4oypmWBpjpd3Ih1wToiiSJfwX17qosSzp3RgZ5YOJ7TShv/Q3vQBU3ddYQAadoWl
         /v0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zJVDlsrsrfYz550OKB/3hdZdazvfDU9t83gGSE4oBec=;
        fh=oKZlfgl8Imf7tcKAwt4i5Iwh3dOE4OK7TW21c0GnR0o=;
        b=N6Td3ObxK15W4j/lDEWUZdYJjY5Zoy7Piyxecc+nEaoAXDJLAbjR2XvVe+fG7WuYg/
         HZKC4huU/v+zECF1Wh6PbVvo3xzFTKzpCsEd8amRya4VExVIGnk4+aTeUZs1078bOwrK
         EGPZk7WL/aFkMv5XwMgOIDpiDk5nW+N2wsWYeF80xgvq6m3Ye9ZMKq5+Ztl2GBAclxPa
         LK4oLTuvxPZDblKrlBn+LvrRkQ5Ec6VBDJwcAPlo882o7y9APnTnQ43wTXfk1xWVrWI1
         cBL6MzM9WmGAsOCOciRfbvi4soZP4Q4UF6qUPC5phfSmKpUgwaRUQJu9US6e83jZAT4v
         6cUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793123181; x=1793727981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zJVDlsrsrfYz550OKB/3hdZdazvfDU9t83gGSE4oBec=;
        b=dJZrWgbceCcvybGI6S+yBWHGKTnRTkeoo+QAXarbXhuJJrcuUxjX6DL3VJxyeJguO7
         EIXUQuToxD9Oj2ADRK5huhz3YAPfLd6CErpWQOPm8uk8bar6rE79bi3bMLs3pZe51bGu
         X4MzPetzpkt4sIfnqO30iZNgo0TbdVmPtmqopEkvLhUnsg2bhmTSLgRVVzhYHy701dNf
         Q0OtvKJRnZ80/E3NbSjyx0npRgDvtmNSPb01SZjgkwzglNyd+xHEbqih3MUFsYvHWiHM
         BQc/ZWywC5lvAnEYkPeZz4JTWFyCYlKLP3X73YxsX8/hg+Ad4REwmoFnONsNmbYY7MNG
         Lt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123181; x=1793727981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zJVDlsrsrfYz550OKB/3hdZdazvfDU9t83gGSE4oBec=;
        b=Zcn5T8mTGHK0ERBSu8ZBpm0HqKJgbB6BO5hY3ln/XZF6owjvnqoWwwGIePk5Z7KXXf
         PNj1/nNZZrcHkxg+dXnD/k1t8aTZ6UKWqGrOzhVAM8lRFRA7pOqw3J/VH1Sn+28Ajz0b
         kCrD7MBb2bxjRnxt02SJZJwYJtKQQ3mpkXou5RNRHV3ZOCUGvQkndG+dbzDU9ZBGXquh
         ucujLqTImvkeDeMIXuatqlwt6fxFaUqZby50nbyNRzxER8LNbx5hBHyJxfaKM/Y8Mn92
         r3eiTxye+xYPDfZx4m1vVA2U9BtmLSqZMpnz8hBzxOubgzHrBjL3sGtlqwIbHmakjlUa
         3Wyg==
X-Forwarded-Encrypted: i=1; AKwUvBwRSk9iHsT6IVLgYOqadmktrXCixyzfdYi4m8tU6DV6GM0Q+vRpmmD2xCY6XWiNS+UBsFRcHtuAydqEzG8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJE0obYJBygHcFi+3e5OwP8i/osAZmnz49TPtMdmorgP5PN5pXD
	xhUwk3nu9Xc6XR063PG3pwZu1ujxcFHeRjutWvQumKywqTqoh661BsyXPxy/baU5iXheMMsN8YW
	ZHHnWPnekLkerQPd0V8V+igAAKvHDettcoGhn+KLP
X-Gm-Gg: AYBFou1bpERoVJDx43d2vx9iunoUk9dRJn9f6nJ2/Z5PjD5aq+KJX4bBJN6vKLfONfM
	ayZ3EOH0zhaps0oop1oIHgx/jclOlN8Wiwo+uOOEhD5VA26iqScj51b0F8NjgXWxxJJNzkzYZvY
	guRIfpMBAFHgAL0iEBDpJ6NIpf60f6xCLT3K/4hDXMjmp3zX7Slx348VtIIo8z6t9CVfanjUqCA
	7dKgBY0M+j99vcGRSzX+DGd92n71rOz3KhA2tyrjCK9Av1eW11f066OMrtUozg7+JGeggNUnQ8g
	tjBUs4KEdqvPTab1uZ0c7ls/rxfD9GyUMlxonW/040ZWN0Rp2ooLEd3FmiMfWD9i6LeuBNz0t63
	+sxgLs/yTsUJOL4aJUCV6cLJw054CUwQdyRamwGket4uGTNWfJkDm7svYX1EUluu+sh5NKO3InF
	FuUZM+jgtUJ043DG8XtIgRNuJPa2fxC1g+jUv8wzUPutraA5g9zqHEg4m0A1iuLNOja7exuYocs
	xv9Cdo2owbSo2qkIqkofpdC73I9JMO9hg==
X-Received: by 2002:a17:907:7b9e:b0:c41:b94c:4538 with SMTP id
 a640c23a62f3a-c46bdec03f8mr1197886866b.47.1793123179946; Tue, 27 Oct 2026
 10:46:19 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026215226.3713941-1-jthoughton@google.com>
 <20261026215226.3713941-6-jthoughton@google.com> <20261027110948.GI2668564@noisy.programming.kicks-ass.net>
In-Reply-To: <20261027110948.GI2668564@noisy.programming.kicks-ass.net>
From: James Houghton <jthoughton@google.com>
Date: Tue, 27 Oct 2026 10:45:43 -0700
X-Gm-Features: AclHuK-GDZyG6m8BFpUMWxfSIBXFJlvlZbCjTm5c1oLpEFzow0OEe9cdwDWWw7s
Message-ID: <CADrL8HXtBxf=qixBZV5-iz1sqfZAqSrMR4ZsJTFXS0N84G+nkw@mail.gmail.com>
Subject: Re: [RFC PATCH 05/10] perf/core: Don't unwind the user stack without
 an mm
To: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Thomas Gleixner <tglx@kernel.org>, Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jim Mattson <jmattson@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-btrfs@vger.kernel.org, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 4:09=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Oct 26, 2026 at 09:52:21PM +0000, James Houghton wrote:
> > get_perf_callchain() only checks is_user_task(current) when the regs it
> > is given aren't user mode regs. However, BPF's bpf_get_task_stack() (an=
d
> > bpf_get_task_stack_sleepable()) pass task_pt_regs(current) when called =
on
> > the current task, which are user mode regs for a user task, even if tha=
t
> > task has already gone through exit_mm(), e.g. when called from a progra=
m
> > attached to exit_files() or to the dying task's final sched_switch.
> >
> > perf_callchain_user() then unwinds the user stack without an mm. That
> > access does not reliably fail: the user half of the address space
> > belongs to whatever mm happens to be lazily loaded, if any, so the
> > unwinder may read another task's memory. This affects e.g. arm64,
> > riscv, loongarch and csky, whose perf_callchain_user() doesn't check
> > current->mm itself. perf events themselves are not affected, as
> > perf_callchain() already clears the user callchain request when
> > current is not a user task with an mm.
> >
> > Check is_user_task(current) regardless of the regs' mode.
> >
> > Fixes: fa28dcb82a38 ("bpf: Introduce helper bpf_get_task_stack()")
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> >  kernel/events/callchain.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/kernel/events/callchain.c b/kernel/events/callchain.c
> > index 9d24b6e0c91f..a451ca2a5573 100644
> > --- a/kernel/events/callchain.c
> > +++ b/kernel/events/callchain.c
> > @@ -245,11 +245,15 @@ get_perf_callchain(struct pt_regs *regs, bool ker=
nel, bool user,
> >       }
> >
> >       if (user && !crosstask) {
> > -             if (!user_mode(regs)) {
> > -                     if (!is_user_task(current))
> > -                             goto exit_put;
> > +             /*
> > +              * Even if @regs are user mode regs, e.g. task_pt_regs(cu=
rrent)
> > +              * passed in by bpf_get_task_stack(), current may already=
 have
> > +              * gone through exit_mm().
> > +              */
> > +             if (!is_user_task(current))
> > +                     goto exit_put;
> > +             if (!user_mode(regs))
> >                       regs =3D task_pt_regs(current);
> > -             }
> >
> >               if (defer_cookie) {
> >                       /*
>
> We have perf_event_exit_task() before exit_mm().
>
> Still, it doesn't hurt to be cautious. So no real objection, but perhaps
> adjust the Changelog?

Right, perf events can't get here, since perf_event_exit_task() runs
before exit_mm() (and CPU-wide events go through perf_callchain()'s
is_user_task() check).

The case this fixes is BPF: bpf_get_task_stack() calls
get_perf_callchain() directly with task_pt_regs(current), so a program
attached to e.g. exit_files() or the task's final sched_switch would
unwind the user stack without an mm.

I've added this paragraph to the start of the changelog to make it a
little clearer that the perf event case isn't the interesting one:

  get_perf_callchain() only checks is_user_task(current) when the regs it
  is given aren't user mode regs. That's fine for perf events: a task's
  own events are torn down by perf_event_exit_task() before exit_mm(), and
  samples from CPU-wide events go through perf_callchain(), which already
  skips the user callchain if current isn't a user task with an mm.

Are you happy with that?

Thanks for the feedback. :)
