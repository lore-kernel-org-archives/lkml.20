Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC9039E6FC
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 13:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788096114; cv=pass; b=Xy4orA6JXkB6AjG4ZP/xjSNBh1Lj6ROROQVwH92B9QWm8XoqoJoZtqPYYIWSBFlct0rrMV6g2DltXMmvR8xv9KNdg4EWOTzz3xQMjovCFPxTUBoCG0ZNTx6KDlXuwHuCX2k3/f9vCz2dg9bHyFBYQrRANoEn0Qh9RGdfPf6YRi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788096114; c=relaxed/simple;
	bh=haDrEQBXtfEJ9vf9T47dmO/EO6kiwNuFMCqiWp38q6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jqgC9eEP9hytmf2tmogACwzxixMAHwDLA2ZenB/rbc7qg04JASBMb2Fj9URa6y9290P/qHoBVQVmmisAfATwubpORLQK+yJ3hm5gSKukcGNCtwnabW2S9doDzSoJiMGmC/RDbs0H6TJHaRobUEC+8/LoZP0NB2Z9oNubJgX/pi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3R1Pg/f; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3R1Pg/f"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso27864995ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:21:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788096113; cv=none;
        d=google.com; s=arc-20260327;
        b=ehUZEDnMRD2TukteJsB4S5J4RLKqWMtvRBCWLYg+xV74hsVf6/6dMg53AkrWh5XbXQ
         tDiwcJ137gQCPneKWS8JYOOMHsTob31cRhVdyayh7xyPzya73sVTrfz4XbE0TAHN4Mgw
         rw0S26ooT2ruB3txkIdh+vDuO8WjRDZhzyjVD55wlzDkp6PZcAxKiyXtlUZiRouu1C2c
         KGo5zCISQpyZAEIpTi8ZakRaE4W1bb2pJb92FPyIArvdyjzOQpQH0EAa5rN6UW/As2z/
         6+a3PL33C/J0pNkIglicVmvDpyewa2XnXxFOmWfalTUJy5ZQ8OT4wVL32Von7X9ilVgr
         0DlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+K2z9Ta+4TdMmha79eI5i9q8koewd9m0IZModZ8QSYM=;
        fh=ZuPo+kZTFJzdTgBKPmyabEkcvKnuEjXJI4eikVSCBN0=;
        b=gumCBFf2LUlU3+yAWeFpqeC2cYPKjSJ9eMnXyYH7VOPn6Y81+X7+tBTl5Xob7meoD9
         M37k/KM9RbnwgLmvq1mT78/vU6d/iubOxOUBKd8Xw6TXUliUYl5faaoszeDHliww+Y1S
         pra4e2VAvIWqzy9rnEMxDEDqQDo84tTG2B+IeJnoPf5Ev8gXVAla1AxNvSJdBbmEOYDG
         bp1X5LCZw0UU67kxrqlypjnvt+aFD8PWveoEIXg4FqCmKJW4Ij68c4R63xEh4fgn2jbB
         npYwYQL5xadkg/a3TpgatkwvFmVvC8tKKWZ3kSmo3ZKoLhBDKCvSZsBAWtWuelTeopFu
         hZtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788096113; x=1788700913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+K2z9Ta+4TdMmha79eI5i9q8koewd9m0IZModZ8QSYM=;
        b=C3R1Pg/f6aOGWETjnhjjJfSZZtM8EoT/MYCeKbuJz8wrEfZzayuTQ7ysPccmSWWd1F
         nnjZEj/dwsIO8g5SQmyJstEDk2kC3RyT7pSovU11yU0r5oSX2kZjRG2IxuQAuOGcS2+T
         WMW3UVKDa3rXmAlkROEaCL3llAxuDxKO2NhSC02srVk3TolUUsgITh7nsMfXOCD2y3U0
         xMjj1pdi/+T80JZjnWHZdUSkRh3tZoeTgAa5XcuyjuZfdzXPLVOK/iqnXSAaEOWXP6tb
         S+JXdbAE9ISbwgzEQLIeE53PylJjzdmW8sN4Ui4Mt2tABk7iBJ/+paNnq3z8pZR+8O7Q
         9Y9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788096113; x=1788700913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+K2z9Ta+4TdMmha79eI5i9q8koewd9m0IZModZ8QSYM=;
        b=nIEe88VLPvy0wISxj6PlVRC3zeIPwUxZ7l2q4TGsd6NWMJk31k+ekiTZ8iRpN9bp2A
         CjGUQyq0KFcXzhoYDr7l4d6TglQ3ErJ0ArsIcEv8C+mOkcyWQ6tt/gHleElwx8Pk4/KI
         r1yrTraGKaPfxuQFkzXJ2eTyV4Ccd7L1b+0JkuLzzkpDaqX4U/7ikfWuaVyymPGFVpOl
         nxMt69xoR8eWVbEnNp4e4Mr0lSeMO0yMt01RevNk/PGLIA8J5zQCEwiPCs3Mc3ys4+jj
         T4OG2gmIthgZBfR9ky12e9WSSrSJWOp3vvGleaemCWNVy5mZZbWkvTir4BM2ndM27ZQs
         y+Cw==
X-Forwarded-Encrypted: i=1; AKwUvBySh5cVOdXFAm6bJctwJ5Rk8luLh1UbSmIj7fTC7CqWQj79EkxwWw4iDL3g6HB1Ib+UdzcE4zcISrgGdbs=@vger.kernel.org
X-Gm-Message-State: AFuF++mZFli0Xx90mH/Pj+o8sQfOS2r25N0sVIj6xmx9jt/8560E0d08
	9bYW936qq/E7tKxIdfyifzSYHOSYhCtRH17uuN2cbJKqneqbswAEBNlRKun9R0JCWRdJzzr2oDb
	gxzGfKB9yQAvkvzzkNsQ6IIFEqBnm/kQ=
X-Gm-Gg: AYBFou1BqbgwaL+vkpWRZj7bKv/EkeLaAXSlT7+m95giPhVK8zUEL6J0QHLYzbZV1Nd
	uR1P3815LdZE+IskDA658/k6sGgoDpqww9yTfKIfIJ02IHfGlyF7Tbws/Po9UN1DnkNI1r1BPVA
	LngVm2NlfDzpyPFcUwZz/IpWnlKkmbfe2abXTFg/3t10o8LutoEpuGyikmFnlCu/lA1DZF0VxLy
	xyQLRADmbvKPK744UmuwjGBTLG+pW29SgtzrN8eRx0S8QjZQFWE0a+aN3z663r9s4CUIZXXjM4K
	8fOi5oO0s3NL/ySqQNCDy4lWZqVsVKMv6VbuiZWTdAg0XoU4ZL891H9tBhVBCZEkgY5NGqcZBAW
	fnf15X0hLK5czhKSdWlIOmhrEe6km
X-Received: by 2002:a17:902:ce88:b0:2c9:c952:6e9 with SMTP id
 d9443c01a7336-2d74dca2281mr301125665ad.2.1788096112529; Sun, 30 Aug 2026
 06:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819122252.1782790-1-florent.revest@linux.dev> <DL27QZ6SEZKT.1CV2HAX4A3WI4@gmail.com>
In-Reply-To: <DL27QZ6SEZKT.1CV2HAX4A3WI4@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 30 Aug 2026 06:21:40 -0700
X-Gm-Features: AcwNN1V77NpzupfrZRTf-r7nZ8aENXPYboXW_s1oiE-74fHmSTulmHRLnx4rpiA
Message-ID: <CAADnVQLxi-R1KDUXJJjpq69SpV8UcNJVqBi7uicO=V0WhAvyQA@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: Keep progs alive until the trampoline image
 calling them is freed
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: "Florent Revest (Anthropic)" <florent.revest@linux.dev>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	John Fastabend <john.fastabend@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Jose Fernandez <jose.fernandez@linux.dev>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 3:41=E2=80=AFAM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
>
> On Wed Aug 19, 2026 at 2:22 PM CEST, Florent Revest (Anthropic) wrote:
> > bpf_tramp_image_put() makes sure a trampoline image is not freed while
> > a task may still be running in it (call_rcu_tasks() + im->pcref), but
> > nothing similar is done for the progs called by that image. Since
> > commit e21aa341785c ("bpf: Fix fexit trampoline."), detach patches the
> > return path so that a task still in the original function skips the
> > fexit progs when it comes back, and counts on the prog's own RCU flavor
> > to cover a task that is inside a prog. On that basis the last prog
> > reference is dropped right away and the prog is freed after a single
> > RCU / RCU tasks trace grace period.
> >
> > That leaves out a task in the trampoline glue itself: between two
> > progs, or already past the patched jump but not yet in the first fexit
> > prog's enter helper. On !PREEMPT kernels this is a few instructions
> > that cannot be preempted, so it did not matter. With CONFIG_PREEMPTION
>
> I guess it would make sense to highlight why it may not have mattered. I =
think
> the real reason was that on !PREEMPT kernels, the execution in the trampo=
line
> image counted as (implicit) RCU read section which caused program free pa=
th to
> wait for someone executing the trampoline image? For non-sleepable progs,=
 they
> wait for RCU grace period already, for sleepable, RCU tasks trace has imp=
licit
> RCU grace period wait as well, hence this never showed up on !PREEMPT.
>
> > a task can sit there, in no RCU read section of any flavor and holding
> > only im->pcref, for longer than it takes to free the prog it is about
> > to call:
> >
> >   CPU 0                               CPU 1
> >   in image I, orig_call() returned
> >   [preempted before lsm.s prog A]
> >                                       bpf_tracing_link_release()
> >                                        -> bpf_tramp_image_put(I)
> >                                       bpf_link_dealloc()
> >                                        bpf_prog_put(A), last ref
> >                                       tasks trace GP, A's text freed
> >   __bpf_prog_enter_sleepable(A)
> >   call A->bpf_func
> >
> > On x86 this is an int3 in poisoned bpf_prog_pack memory:
> >
> >   Oops: int3: 0000 [#1] SMP NOPTI
> >   CPU: 18 UID: 0 PID: 94573 Comm: x169 Not tainted 6.18.44 #1 PREEMPT(l=
azy)
> >   RIP: 0010:0xffffffffc0601d8d
> >   Call Trace:
> >    <TASK>
> >    ? bpf_trampoline_6442515411+0x1a4/0x21b
> >    bpf_lsm_bprm_committed_creds+0x5/0x10
> >    security_bprm_committed_creds+0x5f/0x70
> >    begin_new_exec+0x2d6/0x410
> >    ...
> >
> > We hit this in production on preemptible kernels when progs attached
> > through trampolines got detached while their hooks were busy. Adding
> > grace periods before the prog free would not help with sleepable progs:
> > neither RCU tasks nor RCU tasks trace waits for a task that slept in a
> > prog and then got preempted in the gap after it.
> >
> > Fix it by having the image take a reference on every prog it calls, in
> > bpf_tramp_image_alloc(), and drop them in bpf_tramp_image_free(). A
> > detached prog now stays loaded until the old image is gone, which
> > reverts a deliberate choice of commit e21aa341785c ("bpf: Fix fexit
> > trampoline."). Detached fexit progs still stop being called right away
> > since the return path is patched.
> >
> > Fixes: e21aa341785c ("bpf: Fix fexit trampoline.")
> > Assisted-by: Claude:unspecified
> > Signed-off-by: Florent Revest (Anthropic) <florent.revest@linux.dev>
> > ---
>
> Overall, looks good to me. Thanks for the fix!
>
> Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> Note for whoever applies this: please add Reported-by: tag for Sechang as=
 well.
> Optionally, wordsmith the commit log with the suggestion above.

Hold on. I don't think we can proceed with this fix.
It defeats the point of fexit jmp patching and keeps progs
pinned until a sleepable kernel function that were attached to
will return. Which means that the tracing prog attached to "unlucky" kernel
function that sleeps for an hour will stay pinned for an hour.
Let's think of a different way of fixing the race.

pw-bot: cr
