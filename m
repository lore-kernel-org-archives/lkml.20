Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832D01A681E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791770182; cv=pass; b=HHvMP9ebFwLe0rq92+Pm+nKX84WfChPAb4hwcBnrdBEtb6p0YXMg98yJiwRBqnpwhqLAwc3yo4BgMJVCG+3mdt12xRlef/iwhffCSets28luDwxD7F3L6Ma/4XF8PAL2Za/svy/mukQQFh8Ht2Lh96JMVGdE9G85ohz5miMXFCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791770182; c=relaxed/simple;
	bh=ItBCubvI6RrUGFR+jychln1nrX1byTfSLBkItkPeKgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jsBCyhQKtwlHNp/hTz9HeT3/8bgEWqbiLifBbn3zePOGThIa+tB/5ZaEerIjp1EC879FXIWZlCd44rXRjoCPu6dVc8CDR8KUNFx+GERi50OCwQTnn7kLIsDbvVioBSLr8mSI0AJPi0tqiSFmj9tBn+NGmwpPwAdfBjP8thheYTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+EJpkeh; arc=pass smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+EJpkeh"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4b1fcd3b1a9so487741b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791770179; cv=none;
        d=google.com; s=arc-20260327;
        b=e6fLfzWmpQ0lwJjNnX/v0WKOYzEAjggUTSSnrUDGhLEihd8vXmGbZ87ytX938X1NOS
         L8SY8c25ys4yzSNIrTJFNi8CvmHSrZS8WdUXGBpctI2p2Fct5VOF4DE7zWKV/D5I6Y1Q
         qbC2+/G41HDxGRyVL0BWlHQrvcJJitlcmHCx1EcM/vL5ULk3lPO81A2KOqY+nGrk8Jol
         +69wJcmfSywYnI+mL+jvrJDkJKukoJNAdzPhlbOOs571Lc6Tg+PlmshseHH0wsRmP3yg
         AyawGNdjvILc+sA/M5o4Y15UKsbVndTom2dtsqj/3gbEqUFUXfJ0uDQ3wo4RltzBM6qD
         AWgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VVDLMccIAgoQGAe8a9PiHLfmc8KenWgKbO4m7BVbc5w=;
        fh=oYHv8RlYV93CaXUSYVayhsA8pt67cZqRav9NcM6D8NI=;
        b=X3PTaCbaROvLjYr0ytvrZDyN3ak5infWdSwhEH6LTMrmYMI5UZtSdvUbkL7SOKyVUK
         lJI2MlUBy5b12Lc/TGf7Bpco99s9qpP0sFstbGsBqlrcl3C61/qvXNUXFnemlObndNLT
         HyOF7FEHuyyLezerzgm0gxcz/6tw68xlhaOCJFVArHaaCNGRAmvtqu8xWJeRn57enAjF
         s0RZuAvd1lEna7kEoj0pQ+QoYTz895PCiMhrzHkceW0g02DGQCE+h649Gpv3a+cZ5ILD
         DDGZZZqFERNo1Mr7TTZBw8vVoIwtIDr0UfRTkQVwHsOU7UD+WHoxwTqGvSZAjuUy+o52
         NuhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791770179; x=1792374979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VVDLMccIAgoQGAe8a9PiHLfmc8KenWgKbO4m7BVbc5w=;
        b=Q+EJpkeh4PUr02R/B969/LmQEtKTNZggJUld4ol8shbzvOMiFOApEn9BsLNJ59JBsU
         ZC3Z9k1+QLhTTwqMqry+eC+D+j4HiDviG7OC3b+M8flV+nMY3l4LDoFaCV8g+RL1P591
         d3wIVClDgky8LlZoVmgSEKHVn/fjhZCqXJ3esijU8WUUlVyzz9yxhGRLceXExjSlJXtL
         Is+Cvzuqr3vG6n+T5pYAR0zGALv+ruT4jVbDFetaQeFiOM0dT0gufD0uri3XuKdV+cDZ
         3eV2qdBbe0PoSth0DKJ73NdkoZSgt7xSnzF/GCTNo0lEJIvrTvDRP/jiVB6Kin6GhfSc
         tS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791770179; x=1792374979;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVDLMccIAgoQGAe8a9PiHLfmc8KenWgKbO4m7BVbc5w=;
        b=DZxNpQ+uYaZqrd1r7TrLREPc19YBv5FG7YdwxwPXw1SDXggfuTqaLg3J1uDSikf0VY
         y0VenXr6qqZtHoyHBdOC1/fZhBkb4B2dedCFG18nFK0GzHgFZ2biA0I+RULlkbPi/Fmg
         7Xw+GRDbzvAxzqmlE+ENDzipBUEZXNw675QRecQ8aY/GGD2jadjcy2RMOTKiGHoZsUNu
         aTpbtkQ5usIjAMNKauL8O0MajsoS7ujjV9eQ6FwG7j2w3nWa/IOCyf4E5DY7mtoaZpiY
         kV6tOBJYgr662RbJVaBE2LZHRQx3BcZbANNnLhNu0pz65Plq62eAEbGAUE2kw/NBMff2
         wyzg==
X-Forwarded-Encrypted: i=1; AKwUvBzErLhKOD9VcWb+A21uf486aP/Y74L5cYY3f/dcy5KzjVgG26DRosHxAy/hjjb7PT4muxIUZjksy4SovaE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlC2FyQ+7O025+sOJkznbLoHXQIbpvuBzIHlX/dcJvNmaoFQfL
	GC1NvAEB3Rv8jVxA6YMWjzeUy60TzKlea+JeZLSmZ3iVgQLhwdxtirhv8L0k3kqSYAaeAJicuqA
	lLixWxLeqUMU+mTQQgaioqxROAJ0sbD7SMfSWxaI=
X-Gm-Gg: AYBFou1+QpvCjGmY2FEKwXV8ql9OOXEgI7ogmZfJSFRBQ/oblQUbMDvl+qQAVozF5q0
	cmTWQfDNIGOts33VM1+ScgZgewwTTxbYdxxJb5Tj64JB0jzOLcQWUZlIdVK47HIV2Vt5lt+v46W
	sqx9lBp2Yv7zCr1acDxXxB8MnEBz6KoKyazwdMRqcL6H14RoBwant64Zza7JHbHEpMPtPgypBW9
	Upi2w8FJKG9wc2Jmp7XIWr2pK7IFtTMCfLu9vIwRtlYP2FC3wGzMNEsLfKqCE5I5oY97OhoXk6M
	5tSX0ka3bJ7kNm1E2SS+rXX+YOYEnbbFVeFJRjjY3YGF9qsZiZ3kINf/IECA+UxhJxbTDxQChqN
	zaQmzkzt8C5aM+iDGYmZH6eUrOXVtApn3NFL/b2m8r6g6aCVNu4IplCI=
X-Received: by 2002:a05:6808:318f:b0:4d6:92b3:5c86 with SMTP id
 5614622812f47-50c58710420mr6758060b6e.67.1791770179315; Sun, 11 Oct 2026
 18:56:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012012905.267920-1-atomlin@atomlin.com>
In-Reply-To: <20261012012905.267920-1-atomlin@atomlin.com>
From: Ming Lei <tom.leiming@gmail.com>
Date: Sun, 11 Oct 2026 20:56:07 -0500
X-Gm-Features: AclHuK-0IDhvx-vXBL80m0PiQwaU3cgV-Y37jAMo4r-4F6vwZ3d7JdKF22seZMM
Message-ID: <CACVXFVMTr8mORGSVM4JWHrLYgk+9O0J20bjaL_08uYmRCbzC3A@mail.gmail.com>
Subject: Re: [PATCH] blk-mq: dispatch kworker to housekeeping CPU when hctx
 cpumask is empty
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: axboe@kernel.dk, hare@suse.de, sean@ashe.io, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 8:29=E2=80=AFPM Aaron Tomlin <atomlin@atomlin.com> =
wrote:
>
> Commit a46c27026da1 ("blk-mq: don't schedule block kworker on isolated
> CPUs") excluded isolated CPUs from hctx->cpumask to prevent worker
> threads from executing block work on isolated CPUs. When all CPUs mapped
> to a hardware queue are isolated (i.e. blk_mq_hctx_empty_cpumask(hctx)
> evaluates to true), blk_mq_hctx_next_cpu() returns WORK_CPU_UNBOUND with
> the intention of offloading execution.
>
> However, kblockd_workqueue is allocated as a per-CPU workqueue
> (WQ_PERCPU). When WORK_CPU_UNBOUND is queued on a per-CPU workqueue, the
> workqueue core resolves the target CPU via raw_smp_processor_id().

Then it looks like you need to fix WORK_CPU_UNBOUND, which has more wide us=
es,
if you think it is one problem.

> Consequently, if a task executing on an isolated CPU submits I/O and
> triggers an asynchronous queue dispatch with zero delay, &hctx->run_work
> is queued directly onto the local isolated CPU's worker pool. This

If your theory is correct, why do botter to change to
housekeeping_any_cpu(HK_TYPE_TIMER)
if the user is submitting IO from an isolated CPU?

> causes the local per-CPU high-priority kworker
> (e.g. "kworker/6:1H-kblockd") to be scheduled on the isolated CPU,
> introducing unwanted latency jitter and execution delays, thereby
> defeating the original objective of commit a46c27026da1.
>
> Rectify this by selecting an online housekeeping CPU via
> housekeeping_any_cpu(HK_TYPE_TIMER) when blk_mq_hctx_empty_cpumask(hctx)
> is true. This ensures that:
>     1.  The delayed work is cleanly offloaded to a housekeeping CPU.
>
>     2.  The per-CPU high-priority kworker on the isolated CPU is not
>         scheduled.
>
>     3.  Hardware queues with valid mapped CPUs preserve their per-CPU
>         locality and batch round-robin behaviour.
>
> Fixes: a46c27026da1 ("blk-mq: don't schedule block kworker on isolated CP=
Us")
> Cc: Ming Lei <ming.lei@redhat.com>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: stable@vger.kernel.org
> Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
> ---
>  block/blk-mq.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/block/blk-mq.c b/block/blk-mq.c
> index 025a799f35b9..9480c3aac898 100644
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -2252,8 +2252,11 @@ static int blk_mq_hctx_next_cpu(struct blk_mq_hw_c=
tx *hctx)
>         bool tried =3D false;
>         int next_cpu =3D hctx->next_cpu;
>
> -       /* Switch to unbound if no allowable CPUs in this hctx */
> -       if (hctx->queue->nr_hw_queues =3D=3D 1 || blk_mq_hctx_empty_cpuma=
sk(hctx))
> +       /* Switch to housekeeping CPU if no allowable CPUs in this hctx *=
/
> +       if (blk_mq_hctx_empty_cpumask(hctx))
> +               return housekeeping_any_cpu(HK_TYPE_TIMER);
> +
> +       if (hctx->queue->nr_hw_queues =3D=3D 1)
>                 return WORK_CPU_UNBOUND;

Why is SQ so special here to keep WORK_CPU_UNBOUND?


Thanks,
Ming Lei
