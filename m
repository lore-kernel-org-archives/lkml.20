Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794394952;
	b=YW+xGTVUjkafvGCV4lQnV3Q6bsXCe+8wNTC5xy3RKhrE0J/Z5X0Fy9ugzClQbFxou4Ye
	 Xh6dLMymEgkrwGOT7qpt3JetXtjPcCHybzeVtihjxFTjI4CShikTFh32mIAS9QkWFE1rm
	 MtMQTGXtva8UfBWEv7SuyYb6bc4/yR5YI2ZzMfTtAO0sDHWVxeG468JwJuW1+aftc5QcR
	 cPrSnsIfAR1oCJbVGiSbTy67IkKnxWL7LLA4knXUV5Z5IEYfGeGcS84f3sqQjfpW8KlJn
	 d3PzJHbSy1JLTcahzz8o7Ylba0e0/Oykart9rfh1RoecpCSA0RKKEyYWJurQtOSzrdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1STb6tedEUQJpSIkkQJO5PB0s+q8W00IXEljfx+xvjA=;
	b=p2NkIhszQZaMCqfd36j9cPgqygTlCksY5AUxHHj8ODncdL3UlkRmFcrIlUzE1XpOoD2M
	 nz84w/yuACzm8IIhQkUnITIwMNxsG539+58S3IUcvv1dovQWGp0/vnIn6A20ZayebFgAg
	 9thS2BTal6KGFROkD9S4KfPpozKyY+HT+1FMEtiyADN6GunIHe5QYhceRwNMJdm1aJXJM
	 ERdsNGD/XrG4M22qYzMoycJ5dE1+5CfGWYuYwpbrdFp0467uuBg7VZH+/GuUMMry8DgqE
	 A/1bXlUGBekdwaeCnfZAc1JqY5WlYrhnfbOkM6WpYOKBjTEdkN19L30guNwpwxqs2Rw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CUMKh0Rf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433DC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 433DC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CUMKh0Rf
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14394530ec6so3898526c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:02:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794394951; cv=none;
        d=google.com; s=arc-20260327;
        b=smBwI8FaUa2EJM5uNS/cJEC77tb7OvBFoExNRP2VrYv7fHy4Z9t1ZKNeBnaEq6iNv+
         A/I3CdtZaR/mAcDRTKZXh9JvFKIeoQ4HPaJ9h6UKVxhEQA5VybJLqDZJUU/cH1gIj8hG
         kC/IWXq3shAV92QLiG4oO1AM/E84C3xZGLXH8KJRLaBgt3iQB67DtDkKriiEoqpBwUkD
         gLU8BU1yd7GbHDCuKu9gt4kCDWD2mae6sFxfn95zEK8W83ziY7X8/MgERs+Gleue9RVA
         Qrfw6qEzpb7GK1K4DRu+Jcd3PI07luw29pmlT7xIju9LgTOiCAE6XBrC8k0qU2YaUJw2
         dgpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1STb6tedEUQJpSIkkQJO5PB0s+q8W00IXEljfx+xvjA=;
        fh=b5y1owsADb5jZiHMQrZmfawjm+pT0MW6X/JHaP6W+8E=;
        b=PWZWtNwZaFlbaswNxUYxAx+NdbDoWZNnJbuWTUYsTFFryCWKkVKBbJ1VaHGVRy68OY
         8poN7S3xPedXarNhnmklwMWHtReEtS07JcCZdcuyQQabSPvs8g7T22uXAwCWwqf/SN0E
         3NZsUHIhcOucpmaJkoK9brP3E7hLwRirZhmXXGWsP7pRH7FQZj/sU7XHpR3xRtQFwD6o
         2gBCeuY3NK5y3D26cv+79ks9GZRvhTdYbyap/nuUWBWYZcZqPgnHMhLx7fD9B5aWP+Vs
         r1jMwkNlmamB9sTAVIyXbQy22M7dQmO/P7O4FdZUsOxlZOAVl3Xo8BhCI/nZaHrn0Iip
         k01A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794394951; x=1794999751; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1STb6tedEUQJpSIkkQJO5PB0s+q8W00IXEljfx+xvjA=;
        b=CUMKh0RftPeuzHj+KvvPf1C0n8vXRdvwR9/YRL4jrD3Z3xiafjJpArL9aO1HwPhaWm
         Dl/ebGJ6FGB5o/hM2WIMg1evNoDEtAJ5+YRtxSWYmA3HAyDZZVxawqh3uhJoNLDU+5I5
         f0S2NQSQ0nyMZgH7vnaJV/6QTjhAwUzhj3dyPxJRf/xq65r7ZBNpGkMwwCOzptkM1Nkv
         NFmnb8eLcMQ1aPVZlTAy7LT7bQsT2Ja2GFuqeuTjFxN7FwNY+iAT3B76YWl9evmJtmL5
         l0R0xgBDZJAXMXyqs1nWKKrLwMGrOukO1RKMFovmhZFgsk2O9IvgSVT3gWK9h4JDpv9V
         gdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794394951; x=1794999751;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1STb6tedEUQJpSIkkQJO5PB0s+q8W00IXEljfx+xvjA=;
        b=CM8XPOQZvhSfFxFPwJVF8935/l1bG9kP2CyCsgTHzhYuuTbFSYUqrKQXKZeQRqtWkJ
         kisozHrX2OinHTvb0zhTYtLKKBWyhjmXQuzZ4MVSckPvZ00l7utrswofABolTSZldnXy
         5Col+UXD6hStATpTPxefBSlbTpUxd7dr1y7AEVcGdIyVdbe0EIfCH+mdE83037zfsgma
         FDjAPcpmq4FJhe3t5qYb471yxEuaSsmWRIXmfHseJ4EVLWJT0YO5Ps0S79jlOMkTLYXj
         JrbQwh/7SDn8K9eCNMP2izpm3wFpiS0AF6CNFA4F7nbMt9TmbBsAzifV6D/+BIC2glL/
         4/RQ==
X-Forwarded-Encrypted: i=1; AL+hErEw/2jyuDaVbwEJKZY58CMHQAn4IQP7sMwdSQvmDcScDW8zPmMMHdlit8WruWHTDTwJXvpOL4QsdI+3sFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kJfMxwdq3O8xLxbcQHuDpNl2u3b19dh2sg1HtETl5ATUO2UM8
	W/zLqRBZJVjDtV5+aHRfHae2bUx5RtzVXI/8kG0XDjTQa4OJQ/QzxKtLmHyJpeUEmLguELVr4kZ
	2xvnzQwDlEx9VadkW7x0uIcHrpjO1Bj2JxHauAmuv
X-Gm-Gg: AYBFou3Pf+PpsfVfWb5qDYkZNFI1OW8AFO5mW9n+GMvwJP6ef5MyuZSUJayw6Ilhq7O
	FXUmHiY85hE/t7U29CMaIi9smjoZjwBrVj8ZtyLGK2uPyTVTsezwWIEluJ2Wk4A5PmD/b57NdqD
	FqNyoaCaz8suwn2+JXI7vdqz0yCpfvNifLtpa8FpAB9QuyKnL1ovF17vyqpZfoPQEICNdy5lyl2
	OMwYI0YInStf9rideTJLkZXGZC5wHpHoz485V2p9XbSN9pSQf4vv3eOwxDlpphRYztKZLa8KGPN
	Y4IQ9IygcZmv7jHXYWERgwQ++/BYQQoRqAReL0SgVOQV/qd53c8NE/owD8wOz70fuFKKFDZ0tpA
	YTKGULgL/dyBpVgUNodJYDyR9UV0nNtGiDCLPrSa5GqBAcg3phfyxKnoto7/9qAHzcROERhczIO
	b93ltXlRcywHErtg==
X-Received: by 2002:a05:7022:38b:b0:144:fb31:a597 with SMTP id
 a92af1059eb24-1b3c03b2be6mr2274447c88.47.1794394949975; Wed, 11 Nov 2026
 03:02:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794250850.git.bvanassche@acm.org> <21b696a77eb6a926b0b7e3dc0519b927f4177a6b.1794250850.git.bvanassche@acm.org>
In-Reply-To: <21b696a77eb6a926b0b7e3dc0519b927f4177a6b.1794250850.git.bvanassche@acm.org>
From: Marco Elver <elver@google.com>
Date: Wed, 11 Nov 2026 12:01:52 +0100
X-Gm-Features: AclHuK_mR7wEKaxK8e8R-dN_G_Vh7nRaMLr6N5Lw24WU0IB74qK6vfd5mBOYcX4
Message-ID: <CANpmjNP4sCyOsXX3_yND_hXq9SEAyfC5LTOt1W+kgKRXofCN=g@mail.gmail.com>
Subject: Re: [PATCH v2 11/14] futex: Verify exit_mutex ownership in futex_exit_recursive()
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Thomas Gleixner <tglx@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 20:14, Bart Van Assche <bvanassche@acm.org> wrote:
>
> futex_exit_recursive() unlocks tsk->futex.exit_mutex if the futex state
> is FUTEX_STATE_EXITING. It uses __assume_ctx_lock() to inform Clang's
> context analysis that this mutex is held. However, __assume_ctx_lock()
> does not verify that assumption. Convert the __assume_ctx_lock() call
> into a lockdep_assume_ctx_held() call such that the lock ownership
> assumption is also verified at runtime by lockdep.
>
> Cc: Marco Elver <elver@google.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>  kernel/futex/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/futex/core.c b/kernel/futex/core.c
> index a240638f69e5..4e5aa0160dd2 100644
> --- a/kernel/futex/core.c
> +++ b/kernel/futex/core.c
> @@ -1503,7 +1503,7 @@ void futex_exit_recursive(struct task_struct *tsk)
>  {
>         /* If the state is FUTEX_STATE_EXITING then futex_exit_mutex is held */
>         if (tsk->futex.state == FUTEX_STATE_EXITING) {
> -               __assume_ctx_lock(&tsk->futex.exit_mutex);
> +               lockdep_assume_ctx_held(&tsk->futex.exit_mutex);
>                 mutex_unlock(&tsk->futex.exit_mutex);

mutex_unlock() on the next line already (dynamically) checks
ownership. If it's broken, it'll splat with lockdep (or crash in other
spectacular ways without lockdep).

Drop this.
