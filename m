Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0610418348
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342533; cv=pass; b=qe7IgV5MaXMWW90eiPtDECdeszcoAI7y+QZsfmFQktnnUtmtU3GZViyxvXdPO8JEjmaiu63t2xSOz3/PRcUcwhnIQhCyefg0VWu5kOJ44OdYtQwGM56+BONr9C3Jg06S7Ny8/u2Q8jlpxzebnAsHB6/EEQr+xH/ZLVpBRWUHj+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342533; c=relaxed/simple;
	bh=DAYHtINMjyhnTJWyt2w2Ud93jjGFrdXSb4FUKYQtEYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qLc93rphHFRMG/YMuRyvOhJ+mXV2vONGNV6IU6o5FYfIVu4q/gyXBLp2QsxM1z8BCgB0zwmned80UbJgA6t05b0Cda7NRoNJr2vOF0LHaoJdD7AK5I/BtSrtTOY2fPZ1MJKioVzEtBg9iSACzis1ml9XOfUxTxdLiqyDXdWv6DM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ErgPe1yW; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ErgPe1yW"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398b3d66515so1067084a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:48:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788342531; cv=none;
        d=google.com; s=arc-20260327;
        b=J8hCWueiz1cGj93j/Ywfdetz7r9wcEbpyehP5hXIhNxEQ/SJ2lP2FRSpLH+TcB8Eqp
         G0IyT4NYF3zI5ySF8gXQFYmmjwDCwJmjRLQ4tf9uLLHin26k5MtwcUbjtZPACKuulRPe
         1vcHO3dS5I8FaKq7qGirYAygEZFoG87JNWFGlJ8CclAbb0b2B1xJyhPI7h7t9UAmsXu+
         Ov5b5pbjH4fBTh7MFrFjrBgJpK8cJlFc4qPJCcn2M55BJ83rGOnZwGv0VW+7uQntq/UM
         V8YBM+73xwlTugUWc+0vVDnnoPEMDn54xOnokDXzAVmiL632myvR0TYZVX14WNS0hKC7
         w4bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DAYHtINMjyhnTJWyt2w2Ud93jjGFrdXSb4FUKYQtEYY=;
        fh=4ngXZCE+G+Edlp4pHQPY0OcKKayYIR4+ZaoPeA/AUvE=;
        b=hr9UAr5gyr2qqLVp4/fvNb0reECXsEaNOIfm5CFGTgvUgAhdUNTcZmNwxN67RIZJpW
         0ouKvUwns0uPgWycKzl1c9F3dvOcnoU1Irar7vQbxHpBfYJqw6vy8GxEthIQFXRNNDdm
         jc8mZ6oAsDusUNJoWNhYf4AmSU8dUWj8ArHCELPLUwH/nmoMWM09AdAMchVGovIAX4+/
         7EmQHfUtUDXX2PR9T80aB2vZX9nlpb/JOEl0Pq+bMWQnzg6x5VwgnwS8dLVKoo7Ql8qc
         YkJ1EJfZXr+M9fHhRKVi0khQBEosCaKsipi7WvG73RJYHxeEL/7jeUXIDSgiTL51u86G
         mvPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788342531; x=1788947331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DAYHtINMjyhnTJWyt2w2Ud93jjGFrdXSb4FUKYQtEYY=;
        b=ErgPe1yWw8C4PiZgJmddM8IMN31oHKlz0qAlnNoOCFN+HSsFas0DuLffsIMFcFd3K7
         CRxf2YlDaXjxq9NBemJA4GTfZ0ht4+SHhfhohfXDBn6QicLgHTiZsFbcF/K+xPNh6Nxe
         4G07NI+zt58RtIQvkyx8wCG+DYSL5iRO0sQ+6Oq/uckhdMiVScZy0yekpPIJGd0bGWx1
         XyUoHXHvL2I7T06py/R2/isNw0c8P+K0FVHtvHcfuiid4lVUfYfXY8mgTJW2c+fxzf9T
         yM43lTrqrjz+/eclBDWZPKqGBhfMQuDpwN38wkvZICnrd97Ls87YLGeop207AAzUr0bb
         tmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788342531; x=1788947331;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DAYHtINMjyhnTJWyt2w2Ud93jjGFrdXSb4FUKYQtEYY=;
        b=hXH1z5G7d7j8/SO6S1enhyFAym/BG14rLY8C2+RQWjSZEtjcLG1Ktnj81JyDZR+MJl
         lDeKT1L5JOXa7J7pZom8DbAtzqTWWHigAwbXPxGkp+079W7pcdCP4hdLLvprlCOzvJQP
         4sn3Vdyx0FxMMu0B0LQFImqg6c3huEz3A2QdIfpAqYpUBEbLraE9ZmpwDmGLyPhazJ4B
         /TNMJFfSSQAKAZJfNBXO32RXaP+o83w+1tdk0upO5qu+nLbPI/jO1X9leSYOkO2iJany
         evVzuxAa1TESZRYvtV4LHDvOOXN813+8+YcXpal6jDJuFxAQZl1GU0UbPWF9lul7/i4K
         /NhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsD7vQLxqdK5ArbJdNSfPBfhQ3nGdkqtLXABU0WCZBtL0vspiQL99Mfs8bJxBS15heWeeecRnboXViNik=@vger.kernel.org
X-Gm-Message-State: AFuF++lGNdTedlIf9GXXaXFrNmgkrM7hS5M/kM+BAgJDzm5p80kssDyH
	CEjDfoH2WimRnSAQowrjRxef2TCt9zghYC685kRpOFqGFu87zVQDahdEslebB0QKrZ3mgLoivJQ
	9e7ekDFCgOqUzH/TFx0dg6j31vs1+rizUnsvBIy/Z
X-Gm-Gg: AYBFou2yzo03gXL7u1EfGAK14QOOn2lqv/2ZtrbshfKFJAD9z/iD2JLqnajpLIRQu8G
	60WTkSKBDW7yZBoRUa+QJNyPaKreMBqIJaLsK0XpwtDu4MChvM+aV3m5zahhHK+qvqD0RtGdqwe
	UEho0d3AJSewcQt2sFqBfBBdCdGt6qE7w+W56Fs9/pg14zbptlY/JRQA0fpQ4f1oNLJhwqd4I+j
	GRXBsg4gwgxhAfjOjBAb0tsoEL8SNa+h2vYbIm8gOIQOOqfdhFs7DEUoRWMp67dGo4xXRhg9GdU
	7LqMxDukN/erX9ji0NC5WUL3Qf7chnVti18eT6eHmDKisadIZNHrckoA+/TV8TBwjq+tsSMkNg=
	=
X-Received: by 2002:a17:90b:5384:b0:398:ceef:edbd with SMTP id
 98e67ed59e1d1-39aee1bbae0mr5657467a91.18.1788342530162; Wed, 02 Sep 2026
 02:48:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811154111.64669-1-kmehltretter@gmail.com> <apZlkC1lCUFFMKsl@gmail.com>
In-Reply-To: <apZlkC1lCUFFMKsl@gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 2 Sep 2026 11:48:09 +0200
X-Gm-Features: AcwNN1Wrf69jjm1OyBEhDEDLxC8921rklaSkn1qBn2gou8dtPIrMWnmBuSExKH4
Message-ID: <CAG_fn=VR_mfRpbtzgXU=pO2hV9dzgqdrfSPEG_no+vZmC066QA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] kcov: Suppress timer and scheduler coverage leaks
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

On Tue, Sep 1, 2026 at 7:50=E2=80=AFAM Karl Mehltretter <kmehltretter@gmail=
.com> wrote:
>
> On Tue, Aug 11, 2026 at 05:41:05PM +0100, Karl Mehltretter wrote:
> >
> > Add a nestable KCOV_PAUSED bit and a kcov_pause guard. Use the guard fo=
r
> > deferred hrtimer rearm, __schedule(), the try_to_wake_up() wakeup body
> > and wake_up_new_task(). This suppresses their instrumented callees
> > without excluding those callees from task-context coverage.
> >
>
> Andrey, Alexander, Dmitry,
>
> Could you please take a look at this series from the KCOV side?

Hi Karl,

>
> It fixes the CONFIG_KCOV_SELFTEST failures covered by this series. Some
> architectures still need further architecture-specific KCOV
> instrumentation exclusions.
>
> The three syzkaller A/B pairs from the cover letter also suggest
> better coverage: at matched execution counts, the patched kernels had
> 14-19% more coverage and 42-54% larger corpora.
>
> Do you think the pause mechanism and the places where it is used make
> sense? Do you want me to continue with a v3?

I think it makes sense, although it would be nice to try to minimize
the number of points where we insert kcov_pause()/kcov_resume()
Perhaps we could piggyback on some common scheduler action (e.g.
locking) to do that?

If Peter is fine with these annotations being open-coded in
kernel/sched/core.c, then I'm also fine.

> I also looked at the Sashiko dashboard report:
>
> https://sashiko.dev/#/patchset/20260811154111.64669-1-kmehltretter@gmail.=
com
>
> I don't think the remaining warning about reordering or removing the
> kcov_mode stores is real for these call sites.

I think consistently using READ_ONCE/WRITE_ONCE here is better.
See my suggestion of converging the flag functions in "kcov: Add a
kcov_pause guard".

> One small change opportunity for v3: In try_to_wake_up(), I would take
> the kcov_pause guard before the preempt guard. Cleanup then runs
> preempt_enable() while KCOV is still paused and resumes KCOV afterwards.

Agreed.

> I would also replace "uninstrumented" with "built without KCOV
> instrumentation" to avoid the ambiguity Peter pointed out.

Ack, this is indeed clearer.

> Separately, I will look at turning Peter's IRQ-exit preempt-count
> proposal into a standalone patch for instrumentation in general,
> especially KCSAN. It does not replace this KCOV series, since it only
> covers work run directly from IRQ exit.

Fixing the IRQ exit should also help with some KMSAN false positives,
so I am all for it.
