Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794453511;
	b=BvuxZ/W/pKMawdDW8bMTn8XAh+GqeU88KkwYiSfr1UEOkdt+9rN70ZO0KW7u3hecYeEn
	 edf4er1Sdehelt1Q/ySGVoN2ZnbbLWiYtE1QAQv0iGcSAQpXeM6NB11D7YNZBYyKsUF5H
	 WZEKJ2xcrFpprXEgWmCFwCps19SBzW5jHi5GtNZMvEpB0JqK4R+JEwu1IQ83uErUVxLCa
	 pGBRPC0iHN9FBZk/Qg/V8kYgIFXylapYqQZA+PDnZkJfBoudQdn2fybEu8diZ4KThiLw8
	 tYNX2qHprXEKrlTSmrpm9G7NJDRlSgeLjcZYsuagkLjTGToK94ozze0LFi8Cx0tGSXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=e11ulRIZTd7AnqEMnZCDfVZRKHml1W7lUrz+Qj7x20Y=;
	b=KHv/kQs+//vT7G/8QELpGVMaxvV4kcrcq5jX3e6sHpGE8U+/+CDY4IJo9+jmfHVVJThq
	 iTz9VHaZvbvCf8JOOLDqs8iEiUt9Yo9f+ZhHfu3cGxC+zNkWx2ntoJ8T5ZeBIl4FeDFyU
	 OVXGp8kSUnv8P48+pDIBKQWY+7zWNZdoSaG6fqY0Kwj7MgU1ORBzEZfh0fpKuU3o3J1XV
	 QE/9lN6sithf3r/YwLxAmMTerWgpouyZxoEW7yKd46pgfS4ow6CMPzm+uIqczobu8C39C
	 2X3VcCOcrpH60uTmeCXl+FqszgYvY/IPgAnJxxN+NFh/39b13ko2o9NrRiHRjPXsCPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4ZUKfXL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFA5606A882
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DFA5606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4ZUKfXL
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so37719115e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:18:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794453508; cv=none;
        d=google.com; s=arc-20260327;
        b=h+l8lmEDYSRnj17ZOm2PrNxCKN50GlTvOMaZucqeX+cpcQSigs6VEWyXE0Q6hR5xx8
         TbU2npz5q1oKMDLASR6f7Sljh2iuwTY/ZOBHcqcmS1j6twhvvlGR+b+NKu2NBkiNpYQC
         wNDdJeuodVybvodxRSSq135eYBThY3/tMJwRoz/gHxfqHfkOzll824yiUGI74B9uch2K
         aWoTPOBImUv/MqBPabyciQgb9Li6SxtuAlbftqiywS0gP6XjmWZ/nCKCZDNO4kYFdvmT
         SXCLxLhd88A2x9WJGM+rk2tts2pIj/FLGzQrDjEL42cg911bIoe93syH/dno2C2doZ2/
         WXhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e11ulRIZTd7AnqEMnZCDfVZRKHml1W7lUrz+Qj7x20Y=;
        fh=Uj9emhiopq6fNxpjWi91U7GUodty94Y9tZyN1TgITNQ=;
        b=RRjAGnA0EeNnLA01qjWdiGrth/KonKGAzojzveIhH3f2+wRU55EjQrbzb9XCgKhBMr
         Exd+9y4J5ZPET1U5368aAErUlbqD4uKuLhZuwZUxZeIuObE8OQFC5NHDhbxjuCkeepju
         JEFRrjpGtrWFhQw2TzUKTH1pRxIpB0uRdTVjgRzsDcpNWheqPtJI3jYR0duT3PiaYHbt
         blUSd/QXouF6HAQgTcQ1ETiYr1bEbNeNcJMKbzBUyvAuK1h8WbrNKCKmfg4OjYSLGnJi
         G0g0/3lguNlMz15FEhPDzBoCOym7dSxVaJftmEidl2zIz6XmcA68Euduxw5ntRT7ZH8Y
         VRHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794453508; x=1795058308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e11ulRIZTd7AnqEMnZCDfVZRKHml1W7lUrz+Qj7x20Y=;
        b=W4ZUKfXLiVZIP2ANHPab7imstX2KgvDOh1kFOzCNr1Zo86jzYm6QH3ANN9q3moOhMh
         fm8eBWItodHd/zmYi0WhGv4OIh3XWtF3HzlY87fPEdWUvH2W7R8vDcKE5bI0Ro9X9tmQ
         Vx1xj20+KYeIXLy263U5yRDkMHzLK3mAVA3l40ygujtSi855ExxdLKr5og+Eyae8NHvM
         gxQCkNfZqS2YYftPBLPM+NGEIKuy6DHRytdIe5piwgCTkRjxs88we6+5DXUiI/vFchF1
         lqdWP5iTJIqPC9oElOPWZaGqM7uDF4OGJu1snPEYyNyl/o3z3n4ttDFu/MwAH8HpAvlQ
         RXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794453508; x=1795058308;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e11ulRIZTd7AnqEMnZCDfVZRKHml1W7lUrz+Qj7x20Y=;
        b=qq6aHKgFHU8liND0KSM+GmAbUk/Lz31m6zipgsiVplecMYAoEEknXWvYz/wYYGeO2u
         9laKS+iLTEUOn/76Xg1nuauy0t1qfWpLj3Ry4zig+lbVeo3mbqGWqHdNW8wDT6pOPUYH
         WfVAhQP64WrLq8nbyqWgJzHcPtMqPJunR3n5hC4QHomu5Hfc0AVI2wfdaNu/eqVxnnfF
         iy+VGssC90bwBeq7u3wGzT6WUNCuStelTu7x+LCUhb99OZ8s2OOTPThQhM3Pyoibm9am
         7r+QXKIykSv1tvIe7Adiyd80NILjJF9U0+kR23r7UigAVc4tzK1jPNliNiAcyIQgKuDq
         H/ng==
X-Forwarded-Encrypted: i=1; AL+hErHan0KPNm0sTvPldw/IwnivwDqvbm9uK25hZmntTKYUMDqiIsQ4ng0VT7nQkIhTgRORhZCacp+CLPCJrnQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z946V0DIKxBhZkqEI7P/Sv2pdkhyQVM2EuIyNbDnDOsZqLy5fR1
	LgC3eED5Te6NaPB3n9QsJ9/w+ARznXMiTYKqkS2BqSWQMGzl1zkNxiX4f1eqBFZFnWTj+um3b5+
	NIjR6BaY+cuSB8hFdFygVT3ksZ0cBRm0=
X-Gm-Gg: AYBFou24ymYf19mDQqipgR3NjdwsE7Tgml56aJfw8Imo8P6ytxR38ARpsSMab0vKh5s
	2vgPxYBUGQ6wPvKP18Pk/P4Afi41Jo/41da6M3SyZR7+nJcNEHMIh+UggyOGVp3kxnRyqyMKVzx
	4iB4xz1US8HsJkLvGWzSItl7xjTcHsA20yfkSiB/HD9BLyzxoAhTcqlKwCOyNGI6TSlNtFl5a0r
	RCiwIs4MYX2zrHtGSLY4huPgx2YDfOtQK8VlMlw0BPg+IwBiZHEE1V7GQpD5ah4gavcoxWfpWVT
	AQom/of2IH45gHFsVDFOv5qgfgWESAWFuMrW8y0Gmm3tW4iHpiy1aKDacQgDOVfKq/y/9xCNiK6
	sXEpmPSgBFelycH/Jr/87EuXaOU3GYWsj9jvSEw==
X-Received: by 2002:a05:600c:6214:b0:4a2:729:f7ce with SMTP id
 5b1f17b1804b1-4ba0939d249mr70056595e9.8.1794453507969; Wed, 11 Nov 2026
 19:18:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111145949.70845-1-mathieu.desnoyers@efficios.com> <20261111145949.70845-3-mathieu.desnoyers@efficios.com>
In-Reply-To: <20261111145949.70845-3-mathieu.desnoyers@efficios.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 12 Nov 2026 11:18:16 +0800
X-Gm-Features: AclHuK8kRUbb0XfDsi-OcC6bHXCHjf7ur8t09H78RcYqBXtt4_ZcpJT_BYnC6ds
Message-ID: <CAN_Opa-se6qK2R1CvYeWVY=+js9O0u_rc_WAR34hfYDkR8vVEg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] srcu: Rule for using synchronize_srcu_atomic()
 from interrupt handlers
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Davidlohr Bueso <dave@stgolabs.net>, Puranjay Mohan <puranjay@kernel.org>, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Mathieu.

The IRQ-context rule and owner-CPU check LGTM.

Reviewed-by: Kunwu Chan <chentao@kylinos.cn>

On Wed, Nov 11, 2026 at 10:59=E2=80=AFPM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> This is about the update side.  A user that calls
> synchronize_srcu_atomic() from an interrupt handler must disable
> interrupts around all its calls on that srcu_struct, task context
> included.  Document this rule, and warn when it is broken.  The rules
> for readers are unchanged.
>
> synchronize_srcu_atomic() spins rather than sleeps, so it may be called
> from atomic context, interrupt handlers included.  Its callers on one
> srcu_struct exclude each other with ->srcu_atomic_gp_flag.  One of them
> drives the grace period.  The others spin until a grace period ends.
>
> The flag owner disables only preemption.  So an interrupt can arrive on
> its CPU while it holds the flag.  If that interrupt handler calls
> synchronize_srcu_atomic() on the same srcu_struct, it spins forever:
>
>   CPU 0, task                        CPU 0, hardirq
>   synchronize_srcu_atomic()
>     takes ->srcu_atomic_gp_flag
>                                      synchronize_srcu_atomic()
>                                        spins until a grace period ends
>                                        it never ends: its driver is the
>                                        task this interrupt interrupted
>
> Nothing reports it.  lockdep cannot, because lock_sync() records no
> interrupt state.
>
> synchronize_srcu_atomic() cannot disable interrupts itself.  A reader
> that disables only preemption may wait for an IPI to the waiter's CPU.
> That IPI never runs while the waiter spins with interrupts disabled.
> The kernel-doc already lets the caller choose the waiter's context.
> It then asks the readers to run in that context, or a stricter one.
>
> So the caller disables interrupts.  The existing reader rule then
> requires the readers of that srcu_struct to disable interrupts too.
>
> Also store the owner's CPU number plus one in the flag, instead of 1.
> A waiter that finds its own CPU as the owner warns once, rather than
> hanging silently.
>
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---
>  kernel/rcu/srcutree.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> index 2b0e2b2d2c18..8075da4b1bb5 100644
> --- a/kernel/rcu/srcutree.c
> +++ b/kernel/rcu/srcutree.c
> @@ -2108,6 +2108,13 @@ static void srcu_advance_state(struct srcu_struct =
*ssp, bool is_atomic)
>   * and srcu_read_unlock_atomic() must be invoked from that same context,
>   * or one that is even more strict.
>   *
> + * If synchronize_srcu_atomic() is invoked from an interrupt handler for
> + * a given srcu_struct structure, then for that structure, all calls to
> + * synchronize_srcu_atomic() must be invoked with interrupts disabled,
> + * including those from task context.  Its callers take turns to drive a
> + * grace period, and the others spin until it ends.  An interrupt handle=
r
> + * that calls it on the CPU of an interrupted caller would spin forever.
> + *
>   * If synchronize_srcu_atomic() is invoked on a given srcu_struct
>   * structure, then none of call_srcu(), synchronize_srcu(),
>   * synchronize_srcu_expedited(), start_poll_synchronize_srcu(),
> @@ -2144,7 +2151,13 @@ void synchronize_srcu_atomic(struct srcu_struct *s=
sp)
>         srcu_state =3D get_state_synchronize_srcu(ssp);
>         preempt_disable();
>         while (atomic_read(&sup->srcu_atomic_gp_flag) ||
> -              atomic_xchg(&sup->srcu_atomic_gp_flag, 1)) {
> +              atomic_cmpxchg(&sup->srcu_atomic_gp_flag, 0,
> +                             smp_processor_id() + 1)) {
> +               // The flag holds its owner's CPU number plus one.  An ow=
ner on
> +               // this CPU is a caller that this one interrupted.  It ca=
nnot
> +               // release the flag, so this caller would spin forever.
> +               WARN_ON_ONCE(atomic_read(&sup->srcu_atomic_gp_flag) =3D=
=3D
> +                            smp_processor_id() + 1);
>                 preempt_enable();
>                 if (poll_state_synchronize_srcu(ssp, srcu_state))
>                         return;
> --
> 2.47.3
>
