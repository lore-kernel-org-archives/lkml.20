Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793055393;
	b=LeBSCOFT+wsZII4jjm/TjFP7S5v62AuRF+1eI8Th9FypehSKwkRn//3M6X9PKAe8CEDt
	 EyTtAMRM6IrE4ogc4itC4oEW4VYl2ZG0s18gpg56h4cOGtAMbUNX2r4uXAY05bHsYs9ne
	 t3IjYbc1in/oHpfvuXMf0/ZMZUFInJKEbkV+HgIDc0OzcXVy2Atu8u2MtzS0v4Yx0L0RU
	 TOTUYW0fLetcwPDTknY4s7+PgpxrH3lW2XGaocQ3UsU83/49G37/tQLaJws2BuNYfF2tN
	 yQ9ZHbMthXsocQH4dPlTL/w112DxA6/Pq+hDyEdfQxyEVFvTPduoIK5+aPQucc3N2Rw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793055393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qh7+bL2tt7/pVu5eSjikO++61ieI9Cj5ZNr8SJkHxX4=;
	b=JNkGPkz1hYZblu5l2SY7XdoWwp3doGSUe+XOB+W7RtWgeMMVeT9YHYOzclPuPKEjQd+8
	 GHdwg1gPvsIGMOkZWlJVCN0BqCFmuwIzlFYD0X3/E4F3BP+1ETYX60H4WXRVXExH7YFO+
	 SzwrPg/LR9WW1dx1r9UgTbVL2TRUhQn3P4PeU7cvjWcv2wU4Hv+LGd5xqCfiFjtpN9IC+
	 ACoLIf7pWCFr/A0SGffs/5GPidmy5xr+oBfifY6z/SZo6arUiXZJ/rCZkkEEzhGsJt77/
	 MOY4AKa+aB9t7v1hlitOSyp/W34GAhgKiEnn5o6jKdTPmY7IYukiVPL5ZK/3wA7V42w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=s8grGiR3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECE5606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ECE5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=s8grGiR3
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c418e215671so458895266b.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:56:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793055391; cv=none;
        d=google.com; s=arc-20260327;
        b=V8arKUiwHTnv3vIluYNC50b4PnFIfo44+7umQjxw8OZqPJ+SQFgaAI1pJ9rKTegzaF
         74pXA8fSBK0JKVQ2M8lIJzIgiyXKDVeP9nWuOIATMZWWJAR0i8BMK0Gpg5nz2BW72j1a
         zXjZJfPnfF3bxTuWy4hiDD6DVZnpqhI+EIunfOByHIBEoO12pag+UqKZU9UiWNUqlRIy
         Sh8OMpUZiygoHVMlqkBKReRTN4Q2fIjaQgv66Q+Z7xDh2kU6LKbfEfGvx7SPY1c1TIst
         niyXSNvDce24Um0Kjm2BCqQ11qZZ+TIBVkzmennwyz9rK1bHHpZoVfgIWqr4Gv4Na+nU
         N/Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qh7+bL2tt7/pVu5eSjikO++61ieI9Cj5ZNr8SJkHxX4=;
        fh=oD6xDJTIv0Gmt/LO55rDjg3quarwpqRHb775bn24iMA=;
        b=nQt/qNSEiz3fYR0cCgU9pIUHKNPZwnWaC8N6AYnGDyal93/l33HJ2d3A5oxI4FMzzi
         dkDLEperwjtNyJpO7eBw05J2T3XglgAgIn03CQ+06C7M/uv9ucT2L23XRy/Nicsfxx0J
         V288GK15Gwn5C1aVrVHRy3OrL9HmM64q7OOd2ZAkvcYMsiHwNFT+LSkX9MVjXXq6o0qD
         40wcY+6SkAlyKnXztQrTvL3Ufx5hL7yuPmwRxy7JlDS8jhfBOufR84kacOOGJE5f6F2n
         6zYdWszxnjkOISDWXYd0f/4umbiHB/Tfkg4crAiosNN4ZnOvWAhdOyDW8bhum9Os30nu
         CGwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793055391; x=1793660191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qh7+bL2tt7/pVu5eSjikO++61ieI9Cj5ZNr8SJkHxX4=;
        b=s8grGiR3jmOk9ry50/nEnZjaxWjWOPyppi2m4MHQTMfb5el8k0obk5/UMSWfPsQmIM
         HPtLzsEa12OcSsVXiRmiCNw+UUDDo1UYyS6DiU9bwXoKmoGF82ns9DjJzrfs9pJWdjkT
         dIxIeAf/R+LNQl/XTj1bdocyLOLlTkNfh75pW2KuZcZpn6JGMaXwZms8i83nnm2msMhG
         qxuIapSALuC5I4z0EKwNizZvGG6PaVYwrsYFc03clQ+zaffY9Yi7+Rd9DeVq8TqQMsPo
         mOa9KjkQgAnBHYiQJzjduIMO8ab1In9zxpTDESz20wql691IHa3z4eYMgIiR+VfFmdpS
         4rSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793055391; x=1793660191;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qh7+bL2tt7/pVu5eSjikO++61ieI9Cj5ZNr8SJkHxX4=;
        b=T0kf1wfyYJECpHqN4ffsAfsi+GiGtEXFug8vj+afWYD1OKUwZrgbn1tLXDmViSyDPg
         2oovkhkFYqocM+w/js0XYRG+EIqC5uJRKtNLJO3CeuED+ZPK2unGiUIcC5Quvx0MkgN4
         ek4dxwrdoVBRhFD9zbRk8elRbxsFkZnx5tPWu2AfBg1bgjDOho50FPytF8C7VLz9wF4w
         deWxxjZ6qtjWf9jBE19zbfNTNg+IkelbfisbSRLKMP5BpXbgdhQRVQRuPjoPLlUIANj8
         4RkZZUadX5VaPjGmN4K4uub8dxd4NTjDzAGixztOuT3gpWKym8PbYBqOENJ1ekZ4Z7WU
         yTpg==
X-Forwarded-Encrypted: i=1; AKwUvByZvwyh/GKjMOE+XQbZIC8HnQ73IQ20OwGHcZ9E9W+94wVg+xAEVkCeW3wcpnddRcgZoLoipzQTKgsuIGc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLys6BCvNppM5k4b06gUxg64E+CRtxgYrpLymuOzDwHvd29x6cR
	X4p5k4C3TjmMOgloslITB2YpN+e1o5IuWDLHQytda89ZlyOLtA7bnBNeum/UygjX/TjmSR8j5ei
	5n0HM0JayGUOZPNHy/E8zI4TlSopXRUcuY8p0/8YL
X-Gm-Gg: AYBFou2GO4ERjwNKrWCJZ03UbIccLG2TKvivphSryUCyYeXHfle8RS4UOiz3McF2Oot
	0mekfG0oWIXCJAcon4+t58meCpY5rvehocB3V4QHx3rRUmgKaFhAYImqupmFSqzyn/dXqjvbQ6x
	aS/VsEOYQp6izgXPk1pPhAxW+i2ReFTZPjvurjFHZiDH1pIi7giFRYAsDP9IlQsU4w625E9ITBK
	2r+WP1ItjabfGXSidAWaLMVfdvjiX7zbGKdpSd16+OhIDVWZTMjDShTTq9tyHwQLpVYzgDTwt8J
	GWZR7G4SeE9GT3rKC7Az0wmtcqrOUwzfj3vDrDPPIMzVCg6bUtlCKHKT9LmitVIxJUUZsoaON+w
	+ImfRI246QBJGg0/6Tzx6QZJGMd1yhvxqKUO0iB1gclXTBDtTKIuml5MQZCjRHnAm+MGe1Dp0OO
	sh+PRTQSc+kx0kuFcOeUzS5eKWeRK481QwkP5KMeMnsQLNuqpmwRtuzTSRX8tNnvyeUU8LPXm2p
	aDxtcrT
X-Received: by 2002:a17:906:9c8a:b0:c2e:7da8:f54f with SMTP id
 a640c23a62f3a-c46bde874d7mr911731866b.38.1793055390933; Mon, 26 Oct 2026
 15:56:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026215226.3713941-5-jthoughton@google.com> <bce97570ea9665a2f83216d4dfd7ab7ce17d54aa777f761c3d12db430ba21bb9@mail.kernel.org>
In-Reply-To: <bce97570ea9665a2f83216d4dfd7ab7ce17d54aa777f761c3d12db430ba21bb9@mail.kernel.org>
From: James Houghton <jthoughton@google.com>
Date: Mon, 26 Oct 2026 15:55:53 -0700
X-Gm-Features: AclHuK_4pEIR4EnpfJkK690R4CHqdS4wt-7zneGKcf5MW03i114xuH5q5kcZiJk
Message-ID: <CADrL8HXeYRC8w7F7e_6ZXK6MHd6FRepN_zD632j0JPjNUDrLZw@mail.gmail.com>
Subject: Re: [RFC PATCH 04/10] stacktrace: Don't unwind the user stack without
 an mm
To: bot+bpf-ci@kernel.org
Cc: akpm@linux-foundation.org, viro@zeniv.linux.org.uk, tglx@kernel.org, 
	peterz@infradead.org, kees@kernel.org, arnd@arndb.de, david@kernel.org, 
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, seanjc@google.com, pbonzini@redhat.com, 
	jmattson@google.com, axboe@kernel.dk, asml.silence@gmail.com, 
	James.Bottomley@hansenpartnership.com, mkp@kernel.org, dsterba@suse.com, 
	mason@kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	john.fastabend@gmail.com, jpoimboe@kernel.org, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-btrfs@vger.kernel.org, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andrii@kernel.org, martin.lau@kernel.org, 
	eddyz87@gmail.com, yonghong.song@linux.dev, ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 3:30=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> > stacktrace: Don't unwind the user stack without an mm
>
> TL;DR: Commit message only: the Fixes: tag may point at the wrong commit;
> 7e8e6816c649, which dropped the !current->mm check, looks like the real
> culprit rather than 214d8ca6ee85.
>
> > stacktrace: Don't unwind the user stack without an mm
> >
> > stack_trace_save_user() only refuses to unwind the user stack of tasks
> > with PF_KTHREAD set. That doesn't cover all tasks without an mm:
> >  - A user task that has already gone through exit_mm(), e.g. when an
> >    event fires from exit_files(), exit_task_work() or the final context
> >    switch in do_exit().
> >  - PID 1 before it execs init, and usermode helper children before they
> >    exec, which are created with user_mode_thread() and don't have
> >    PF_KTHREAD set. E.g. booting with trace_options=3Duserstacktrace and
> >    an event enabled with trace_event=3D unwinds PID 1's "user stack"
> >    during initcalls.
> > With the ftrace userstacktrace option enabled, the architecture
> > unwinders then read the user stack without an mm. That access does not
> > reliably fail: the user half of the address space belongs to whatever
> > mm happens to be lazily loaded, if any, so the unwinder may read
> > another task's memory.
> > Use is_user_task() instead, which also checks current->mm, as perf
> > already does for the same reason since commit 76ed27608f7d ("perf:
> > sched: Fix perf crash with new is_user_task() helper"). This also stops
> > unwinding the user stack of PF_USER_WORKER threads, which never run in
> > user space, matching perf.
> > Fixes: 214d8ca6ee85 ("stacktrace: Provide common infrastructure")
> > Signed-off-by: James Houghton <jthoughton@google.com>
>
> Is the Fixes: tag pointing at the right commit?
>
> When 214d8ca6ee85 added the ARCH_STACKWALK version of
> stack_trace_save_user(), it guarded the unwind with:
>
>         /* Trace user stack if not a kernel thread */
>         if (!current->mm)
>                 return 0;
>
> That check already covers both cases described above (a task past exit_mm=
(),
> and PID 1 or usermode helpers before exec, which have mm =3D=3D NULL).
>
> The check was replaced by commit 7e8e6816c649 ("stacktrace: Use PF_KTHREA=
D to
> check for kernel threads"), which switched it to:
>
>         if (current->flags & PF_KTHREAD)
>                 return 0;
>
> That dropped the no-mm protection, which looks like what this patch resto=
res
> via is_user_task().
>
> Should this be:
>
>   Fixes: 7e8e6816c649 ("stacktrace: Use PF_KTHREAD to check for kernel th=
reads")

Thank you, yes that appears to be correct. Updated in v2.
