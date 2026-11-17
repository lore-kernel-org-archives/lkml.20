Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794875962;
	b=EMSK3xUw5U0xrb3QCjrvs+gbA9H6vDQzm9yiPGNLVI0wLacoZXADgyevaIAGn33oAdep
	 bOvkR7xdlkxVh/nMBafxXFPNjzVVEMgMEkCHlio6pkvu6rV+PuhkTFGdIwm8nwzouIyZm
	 K7V8X8xH79W5M0BadWvfQtsOg8a6iWj6wTPwWBQL9bbnd9vPfQwPlYC8AtEIx05RNBCrJ
	 t3Ix6/wcNXKnC5QDi+3EjNoozVyfPYhCZWNerv0swp8wZYTqFaBxkCVd3zAIsIcf7/9OC
	 9r9142M8qPAYfPzW3+6EKVfexNIVpi+IRPuv7kAZRuBwl9L/5DiEe4VTeAqie4td9MQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794875962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yvgrNno9d5FQQl29xM4deIUmhIQOCFM5isagb92yiBg=;
	b=D6+ngohYzQZs4RzEg0kLs4xFdrg9b/Vg5MRPAYzPod64k3abn2R6DjpsjEq1UR0Da/AU
	 gphFh07Mly1RSas0vSA0e4q9OK+IDS7gVekWTGS8pZRWggLSUPE2bT86NPszPcqp1BodU
	 A4R4WZM7bh6SqHr67M3l3gqg4SLipCNhYN1tyHLU5h0UFqcO5+ooKTtEctN4EtNZl4KVr
	 W5JVMlrGqA7f6QmnriPC7oPRZfVMNpks/ZSXYRyGLPJAUq697xVGon9kaLAqt+Kbi+kFO
	 r0B7NwCw5ejWd49b+qd7ffy9Bp5BqKrjyaD1wjTDK0ertRwnBs3i9J4IRffNlXLCm+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UxjOoZWP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D9C606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3D9C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UxjOoZWP
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso2996465e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:39:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794875960; cv=none;
        d=google.com; s=arc-20260327;
        b=OVSj93dCY3pBVhj+y41TEPJNba2Yk0qon5RNMkM+0QQT5XmQDmFcgtymlLGxl0p2pd
         QoIReLe5XriXgsObvg+PLL5z3rSbfZHlA4GdVhvwAYV9BhWsRKkbZTIYOSl9BFk7uQBd
         pg4FB4zM02q7lk1v+Y/kRkYxeawPHjTlaSddn50nOaaF+RKvhQYUD0zmIuQqlTVKf3w/
         H0P4U4KMKUUVUrDpvLbxA6/ZUqxJeM3Jjsp/bKlRt12efAnyhZvRDOIbKIWDKzopnHh3
         paSgxjq1pGeqs3/+Sabh6/R+LUqsWSO0Y7v9VKw+bhhc9it90/y/qWTdi/0LdrPM0aXs
         nU8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yvgrNno9d5FQQl29xM4deIUmhIQOCFM5isagb92yiBg=;
        fh=rf+kILwkF/QYdckBpVo6QxsI5yboe5fz3d8k5jmcjRs=;
        b=jDUNjwViPR0q/TWj5PUME/6FAXLC0VO8kp6MtEifdqHzGHpYQZx6eMMnqxXAarnIFC
         h4GT9RUeVGTbr52Tn8SCeOHFnscD0/8gcFSbg61xG23X2ZNqM6jTv2WB24Xuh8wZux1h
         0502+R4dqVKjN5Qd1sZvOZnLV34dbHelBtMkTy87aRrUOrXw2FE9ehtR9bkNrPzvs+Xq
         ywVNiEVvKGCnuw11e4GEMND3/7qGiYKkPeXOBLzai/VvxvXpDjl44XlSDjgsb3CHlT8n
         sG4TualunqLgPrcqSQhhS3VTVL72LTBm4k3AxaToAKV+o8u8HA12qAmyiGU9YPJ71jZ0
         jlrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794875960; x=1795480760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yvgrNno9d5FQQl29xM4deIUmhIQOCFM5isagb92yiBg=;
        b=UxjOoZWPK3gElO2xI8h3eyeToRm3WQAYI2yCvgWBfAC3i18Y2DixhLZCbw2DYBXwmd
         KxvEaeuqC/pVb2O0hjaRK2b8NNzr73CGoAWXoKScfn2eGxJpvGlNp6AeG43JIcPUgQz/
         YxyS3rh4/od0j8osjXeuKW/23khVHst4qkvv7SZ80Y+xGLWZuYfh2MOjj8NP7rqMnrny
         O5LdpZm7z2V3nOXrd5L+x4QoXIE4WzyA1VGF9BcMMNKc+qbZinE9LBEx0TOk77x9z7tS
         ojmjiqOOKFvyFlaiayZuCsg1wIr0QGDurAtWMNwbOJMatgUAIsNtkvn6hgj0qIEEdaAl
         OyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794875960; x=1795480760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yvgrNno9d5FQQl29xM4deIUmhIQOCFM5isagb92yiBg=;
        b=2S8XV8E3610fwACl8lzUEhamChb9QLMu4EqY/HWEpWnEmb5+VPn35Bbj37DQJwPQ2E
         ql4+XXm/xUio4IukLkR5CM6Ps7oQ0zpDU5jfBApGL87P2rpGzU/fPsmGOB9MS3ORDrDp
         mheQzI8q0939TSLcda/jtYb8+uNRYtBqDDxiRB9iSt4A9dcDhzO2d1uU205FORCGN9ZC
         6u2EgFivphoyGnpWtI/7lFramAZBVVgybAyFQ/w3UVwDhpv94iiSkgytX5cBQZiPRIzq
         SSJiuqa/jWKPd8Zp65X32rp0ylZBq8wZL8ErkOEQRgaI5fl4ON5Rp+VLBRd2wng14Zuj
         DwAg==
X-Forwarded-Encrypted: i=1; AL+hErFyZmkWKTHDOZLvBXeUL+CrzcrkKa/eNVezcq45CClcyUROkxhuh0KEXwCWRvnlnb3k4npVn3Rb+Va/Zs4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FzOj1La9CWYd301ct4GYz7rQn4qCUZQ6Sdx7pvOWXlA2oVM4z
	ABpc79oHvIQO3jnRrNo33GDUkrW3YWHTdG6SlvABIWHUEs5kIk7S8590YwZXQcdXp2PVTiEn278
	B5xhDR70ml5aYbdK4zw4goKrEOUa8HZJUiD7ymGX0
X-Gm-Gg: AYBFou0EHgOXCGR6aOkleEMssfWdH7hLGYyxP4cB/Tg3DMZCAfyEO31dxph11+VuSLr
	UDrZzG8QnNRUc5KHCAtaqcrSgFvNZcnk59r69sbxW8x2BPzvIeNiCIlT0WklOeiAXb7yy5FZ97F
	mG5cZ0HVOVArafOlyapMtzO4tgOZOtYAwcRsSEvCxSME2eJWjfitXsig79UB6KBi4TLWxR5JZmU
	Ay7PIxSfUMwxGcrNiiDU//bZOAC1kC6C/34KZuEikwIkHxHrXG11FNQ8OGRc0rgKm5lMoOImdN8
	vx/Z+lgm95AoHcb6ZgErZIgn46gUN/5/L+dkEi66vHxZgxZGAxfX2VHtGX+AVHxqh/lX9aJGePm
	zEQLuUqtQINXx1INghLaguN3E3Py25DKTLQKlyxVt9wKpq3wwKUTvE99Ioorqgkv08zDlEj5l44
	juwbqdPk1wK7TdKvbP/Ya1GcJFHeYvUXiNhSmZOE+Nx/V0z4Ey9FONUsBxPOi4++my5B9NqAfas
	qWlRRMYIg5C4XHxZtYGBmQ8mOwRZQ7tepCnM9w=
X-Received: by 2002:a05:600c:4f4f:b0:4a0:20b4:ba93 with SMTP id
 5b1f17b1804b1-4bb7839996emr21077405e9.16.1794875959604; Mon, 16 Nov 2026
 16:39:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-topology-wunsequenced-v2-1-54611119172b@kernel.org>
In-Reply-To: <20261116-topology-wunsequenced-v2-1-54611119172b@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 16 Nov 2026 16:39:08 -0800
X-Gm-Features: Aa3M54rJVfSiPNSBUbY2jPJp90xuwKIoyFDAlZrLrZLvvd_WyhIWPKbXZui3s68
Message-ID: <CAKwvOdkJzq8V1hO9SCDcANha5Tofk7EKao=c7pMv_LUji9vTJw@mail.gmail.com>
Subject: Re: [PATCH v2] sched/topology: Avoid unsequenced accesses to jiffies
 in sd_init()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:55=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> After a recent improvement in clang to warn on unsequenced accesses to
> volatile variables [1], an instance appears in sd_init(), which can
> break the build with CONFIG_WERROR=3Dy / W=3De:
>
>   In file included from kernel/sched/build_utility.c:86:
>   kernel/sched/topology.c:2008:29: error: unsequenced accesses to volatil=
e qualified 'jiffies' [-Werror,-Wunsequenced]
>    1998 |                 .last_balance           =3D jiffies,
>         |                                           ~~~~~~~
>    1999 |                 .balance_interval       =3D sd_weight,
>    2000 |
>    2001 |                 /* 50% success rate */
>    2002 |                 .newidle_call           =3D 512,
>    2003 |                 .newidle_success        =3D 256,
>    2004 |                 .newidle_ratio          =3D 512,
>    2005 |                 .newidle_stamp          =3D now,
>    2006 |
>    2007 |                 .max_newidle_lb_cost    =3D 0,
>    2008 |                 .last_decay_max_lb_cost =3D jiffies,
>         |                                           ^
>
> Per C11 5.1.2.3.2, accessing a volatile object is a side effect. Per C11
> 6.5.2, unsequenced side effects on the same scalar object are undefined
> behavior. Per C11 6.7.9.23, the evaluation of the initialization list
> expressions in a designated initializer is indeterminately sequenced
> relative to each other, meaning any side effects in the initialization
> list are unsequenced.
>
> Add a local variable to hold the value of jiffies before the designated
> initializer so that there are no unsequenced side effects while using a
> consistent value, clearing up the warning.
>
> Cc: stable@vger.kernel.org
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2190
> Fixes: 2b4cfe64dee0 ("sched/numa: Initialize newidle balance stats in sd_=
numa_init()")
> Link: https://github.com/llvm/llvm-project/commit/955715460eaf9188c241c74=
750637fc82dfcc423 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> Changes in v2:
> - Use a local variable with one access to jiffies before designated
>   initializer (Nick)
> - Link to v1: https://patch.msgid.link/20261114-topology-wunsequenced-v1-=
1-686a36fe61f5@kernel.org
> ---
>  kernel/sched/topology.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 99878da03bce..60fad1690894 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -1956,6 +1956,7 @@ sd_init(struct sched_domain_topology_level *tl,
>         int sd_id, sd_weight, sd_flags =3D 0;
>         struct cpumask *sd_span;
>         u64 now =3D sched_clock();
> +       unsigned long j;
>
>         sd_span =3D sched_domain_span(sd);
>         cpumask_and(sd_span, cpu_map, tl->mask(tl, cpu));
> @@ -1973,6 +1974,7 @@ sd_init(struct sched_domain_topology_level *tl,
>  #endif
>         sd_flags |=3D asym_cpu_capacity_classify(sd_span, cpu_map);
>
> +       j =3D jiffies;
>         *sd =3D (struct sched_domain){
>                 .min_interval           =3D sd_weight,
>                 .max_interval           =3D 2*sd_weight,
> @@ -1994,7 +1996,7 @@ sd_init(struct sched_domain_topology_level *tl,
>                                         | sd_flags
>                                         ,
>
> -               .last_balance           =3D jiffies,
> +               .last_balance           =3D j,
>                 .balance_interval       =3D sd_weight,
>
>                 /* 50% success rate */
> @@ -2004,7 +2006,7 @@ sd_init(struct sched_domain_topology_level *tl,
>                 .newidle_stamp          =3D now,
>
>                 .max_newidle_lb_cost    =3D 0,
> -               .last_decay_max_lb_cost =3D jiffies,
> +               .last_decay_max_lb_cost =3D j,
>                 .child                  =3D child,
>                 .name                   =3D tl->name,
>         };
>
> ---
> base-commit: d7e670601af6c564ccf6d3b2ddf70ee4f41a6d1c
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.=
git master
> change-id: 20261114-topology-wunsequenced-18f1d3b9167c
>
> Best regards,
> --
> Cheers,
> Nathan
>


--=20
Thanks,
~Nick Desaulniers
