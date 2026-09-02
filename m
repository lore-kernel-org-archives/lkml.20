Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88288359A99
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358793; cv=pass; b=Hf1oD3BqlhkzU6e4me1Ds5bCSdscpvIlpgzYIjHyX6xxETKY9Og1ymjPEey7fSwQWAT+1snIvwixAb8ICZeupxixVZtc9glQGJDch0qkR2YZD63vY+nBqp72m5PyNz4C2bbfx5Q/yPTh1VITzA9LhlIRiWcRZ2maDw0Ga53R8Wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358793; c=relaxed/simple;
	bh=7WVcDCeNoNJVJ62VGmwppvZiYM7vvnUPgQp7fjZ7D6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GzySTpAyalTXDgXwmk+V0a0NC5/d8j7r6VSPZ+hVaixqIURqdqVzTU7WXO8XFG/GWW4gtZfVnH2jgq/XASqM53GngxfJHA4kbMwcFf6EhC+FkNyNYRwjqUfVMYiGrYFy9ert0MYfHWnJ38GaHlAED9pTDe39My2ybBPP9nZ0F2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=COeQ1iYH; arc=pass smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="COeQ1iYH"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-852c481415fso1354697b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788358791; cv=none;
        d=google.com; s=arc-20260327;
        b=sSKX58+2aqOUo7wC9KmFIQCpBLBjNhonkTEJTW9fdbxHEP+dgLRh42BLOybKBtpj7g
         9tmKcPVK6fJNj/69PWkMv0WKZdtH9dUCZKsC8XafOIT4mWnIPs8lFjA+4fbzrjsP467J
         9EA0kAVSKOE6Q4d4rDyW7sN9xDcFdsE5pwb4lu/n2muV9/OJXipb7H642+fAj+O0VOJ6
         fBdqQiq9/3Z6J7ysci+O/nur7K3t5a5uBVaI69tHxmp1MXJzhW/x8PcJKX3E8YWl53LA
         RFmE4Q6BNNQho0DYsw96Fqu2ZZrLT6t8ac/QYvOB3k2lznlN8WDmn2x83Rugj+p2qwoS
         wEmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hvqo7YFW1dqU5IF1koaoFEnQPCsWNf4SP2mwIABHbpg=;
        fh=yXlVQ4UL6iy+U7yl95oVccqRJPjgwre36w/NR+HGxHc=;
        b=B/3unbZX1s3zCq265zTF6JEd65M0fByaxZHCXFPa/IzmxkxKYJdtTo/O2BHaVgsmBq
         2EVq30ozfRBIRDXhKLIbW2ZpQYtnL8IjnB5spu+tyEcmjGrSCFvJdT9//tl8mubqgG3C
         eYHWBuzoBj0ETr9ZhAKkNozrz0ciO+0f1e+kp+5ghEXtas+9OAs/Ss5CHFF1gpj+xbos
         cEWbDR+QaQq9n+Cek9Y4X9UMCiEsHa9CRH0CSaya6egF55BGarP8D/JZUuRl1rzfy1Ii
         40nvkEbazXSBPAK4XjWVmkLZ5/GIIdwJalDxISDB9/uUb7ddLOC3/5ZiAtku7ruxu1RN
         mHwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1788358791; x=1788963591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hvqo7YFW1dqU5IF1koaoFEnQPCsWNf4SP2mwIABHbpg=;
        b=COeQ1iYH8q7opTb4W8XHhS7W9wHBDXm3BIZl6oy7/DiHVZB9dDla9T//zGHeJMEjD2
         CZ/GGpy7Xp5rDd8vcSA9wQoPicOxEOa6rMqN1aCc5yHQceJOJ/pEnYIMXJexDkrmWd/5
         Od9Ql9diFhkysjpD4YZiiHUCJqbM+OT/3ZWvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788358791; x=1788963591;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hvqo7YFW1dqU5IF1koaoFEnQPCsWNf4SP2mwIABHbpg=;
        b=Ur/M7hqgIZBzuodLy4dPiB0bPixN5t+XFGiH06Gf7S2jF22V85TUAg3yzGG03ZwfIJ
         KET3yoaeFcc4+tbDB+Lwkp1lxiqR2L0chjyo7veS+oci1YRh3rWTBkHaUu5LZdcR48X5
         eSqTcfyMXUxSXfuhpeKBPrm2OeQ9Q79VnprqEvPa29Lu6dib8jO2balvH0cASwaMpDTK
         amc9sF1Lshr9jJf0px2m2NxjXygnvRZ5WfSyImpIcPA8xmXjmile/it/wke8KCZKkWFN
         tnRyh7klwIBneS7BtQGcrOLXboCYCMK91Ji31C+KlO0LiVM4mp1X+Hge0TvGxuW8Mx3v
         92VQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHANQKTpSg65CnjT0CDxzm/DvumR8ibTQ73XwzcSWu7j4ZA06NYKg0SdVuB/Z3kVJN0quJpcXUCb1/Qlw=@vger.kernel.org
X-Gm-Message-State: AFuF++km62eyHC9gTDyigRAd6MSdZbfm+AG6KTzv9rzi8pJyCjSTQu3P
	waUcB2T9ZaBC0k9QYtM7CPco3/WSRQDeidnA+VeQdcZWekPnE3VuRc6nX0wylgLauKUaHdU7kwr
	MRYGRRVy5xd6b0fo44Tv7Mj45vZ3dX4rjaz8oyFXx
X-Gm-Gg: AYBFou2QQxJC/zT51XDh4gRFbmM560X6ObwmqG561+UjfrXxgEmB7eIYwWgUK0jWMHV
	H0tdrwmnNR+V3edjvZkiU4m0PoncjXHkMbVBTYp9pOzV3oxZLw7kOff7r5iG268SSRd3rGIu8x5
	7CWZsh8HiKERX5PEbx2YLL6+Fodz0YcQMpCYFK3B/s/3Oc20ctra/7Y7NzGWmU39lO0befC+mDs
	Qom83mxmYz8gFPaoXnEV2wxw8+Wbwa+g95Uv+yd3sXI3SU7Nlp1uF8uApKe9LZqmi10+sx80yaR
	Wk54NpwSzUUTh7uVVRbdpx8dOSweEqn1mn3gFBjYbY0lNz+gWlUUt4fyqQwN1L0qPnvkw4McgBZ
	pnoWiVKMt794Hp7JQrld3GnZZ0uOO
X-Received: by 2002:a05:6a00:1d06:b0:84f:b01d:3693 with SMTP id
 d2e1a72fcca58-85ed92cba5fmr8148322b3a.15.1788358790569; Wed, 02 Sep 2026
 07:19:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902071659.395509-1-ruanjinjie@huawei.com>
In-Reply-To: <20260902071659.395509-1-ruanjinjie@huawei.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Wed, 2 Sep 2026 10:19:38 -0400
X-Gm-Features: AcwNN1UvCsBsrszWjzjo6WrPU1fBJsPuCIdttqUJvXgZUZvTNhdH0Wjh-Ea6nbY
Message-ID: <CAM0EoMnZMUxc+gq_3xt9jT=Nb8x9NjXXXhp6JRjgOo0Dx530YQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3] net: sched: act_gact: use acquire/release for tcfg_ptype
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: jiri@resnulli.us, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 3:16=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com> =
wrote:
>
> Replace the smp_wmb()/smp_rmb() barrier pair with
> smp_store_release()/smp_load_acquire() on gact->tcfg_ptype.
> tcf_gact_init() publishes tcfg_ptype via release after writing
> tcfg_pval/tcfg_paction; tcf_gact_act() acquires it before
> dispatching to gact_net_rand()/gact_determ(), ensuring the probability
> parameters are visible.
>
> No functional change intended.
>
> Cc: Jamal Hadi Salim <jhs@mojatatu.com>
> Cc: Jiri Pirko <jiri@resnulli.us>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Simon Horman <horms@kernel.org>
> Assisted-by: DeepSeek:DeepSeek-V3
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Jamal Hadi Salim <jhs@mojatatu.com>

cheers,
jamal

> ---
> v3:
> - Split out from following patch set as Kuniyuki suggested.
> Link: https://lore.kernel.org/all/20260901024234.135119-1-ruanjinjie@huaw=
ei.com/
> ---
>  net/sched/act_gact.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/net/sched/act_gact.c b/net/sched/act_gact.c
> index 565860cccba6..d4f39f98e2cf 100644
> --- a/net/sched/act_gact.c
> +++ b/net/sched/act_gact.c
> @@ -25,7 +25,6 @@ static struct tc_action_ops act_gact_ops;
>  #ifdef CONFIG_GACT_PROB
>  static int gact_net_rand(struct tcf_gact *gact)
>  {
> -       smp_rmb(); /* coupled with smp_wmb() in tcf_gact_init() */
>         if (get_random_u32_below(gact->tcfg_pval))
>                 return gact->tcf_action;
>         return gact->tcfg_paction;
> @@ -35,7 +34,6 @@ static int gact_determ(struct tcf_gact *gact)
>  {
>         u32 pack =3D atomic_inc_return(&gact->packets);
>
> -       smp_rmb(); /* coupled with smp_wmb() in tcf_gact_init() */
>         if (pack % gact->tcfg_pval)
>                 return gact->tcf_action;
>         return gact->tcfg_paction;
> @@ -133,11 +131,8 @@ static int tcf_gact_init(struct net *net, struct nla=
ttr *nla,
>         if (p_parm) {
>                 gact->tcfg_paction =3D p_parm->paction;
>                 gact->tcfg_pval    =3D max_t(u16, 1, p_parm->pval);
> -               /* Make sure tcfg_pval is written before tcfg_ptype
> -                * coupled with smp_rmb() in gact_net_rand() & gact_deter=
m()
> -                */
> -               smp_wmb();
> -               gact->tcfg_ptype   =3D p_parm->ptype;
> +               /* Pairs with smp_load_acquire() in tcf_gact_act(). */
> +               smp_store_release(&gact->tcfg_ptype, p_parm->ptype);
>         }
>  #endif
>         spin_unlock_bh(&gact->tcf_lock);
> @@ -160,7 +155,8 @@ TC_INDIRECT_SCOPE int tcf_gact_act(struct sk_buff *sk=
b,
>
>  #ifdef CONFIG_GACT_PROB
>         {
> -       u32 ptype =3D READ_ONCE(gact->tcfg_ptype);
> +       /* Pairs with smp_store_release() in tcf_gact_init() */
> +       u32 ptype =3D smp_load_acquire(&gact->tcfg_ptype);
>
>         if (ptype)
>                 action =3D gact_rand[ptype](gact);
> --
> 2.34.1
>
