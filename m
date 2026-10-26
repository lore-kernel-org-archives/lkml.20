Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792982199;
	b=2SwVYhtk7hOftH2LTqOrvVOfTWVQTQuYW6jnt/mwV7BSOYxsPbyp22cTAN+G7cc+xEpg
	 shUD1F7K+gDujvmBD7YHvUwDrM9S6Vghvp1Qx0EZI+2kQpaqsd0izcxD1mMEteEaIPq4w
	 cK31emGxDJDe2Ub7L7v+RmmesRGWcrvJEQ8KrVPmcnZ+eY9u9Y8kpHjpkZ4Iw5FRkIOmT
	 hp8+lY0DFdTS1nMFsTcXo1jzu5DEVJzlC+fPVz/OvLCRuNEFe6wmHgJ2BLqQCBJ8Gzhxp
	 iniYDohJXFTwZt7tC+RcEK5duQh+emC4s+MXW9LitgEdcSw+bzhWBlRN9/lshYVvhFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792982199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=m7bdFtJP67PmJcIrwn/29KIkZ+QLRrIFYKFNL3qAIvE=;
	b=DvA/cV93YWh6b5fnfDmElOnfEzyom+eoqi+7MMvW8V+JQx6t8NHcE7wITdSHapmEkj3w
	 1Er/REFGER6H1JOFXYTmhxSNoGZLfU7lHeb8ZbvxtUYPrTqQHyT1BjSGeb/3zXqfNjBAt
	 O/PEDGWk0Hxpf+wHk/D+o6ZjKiDmoakdcCK9rpRfo6O18Bi7V2Is84c2PP1dwu2EFQbx0
	 84jLB6e74eKO6e+HQvNjhZopUuI8vEA9MN55jFB4xbJCVXc8M1PxMcDKZknQIakVNRvNE
	 CQQ0HPRJOlehGLD4K/Edk8MT+xwOHlzanqROH0OTaZ8zjm54ZjZImbYTP7LbR5g+JCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H56zD1lj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97995606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97995606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H56zD1lj
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso25599905e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:36:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792982197; cv=none;
        d=google.com; s=arc-20260327;
        b=War8++wxy18AwbrJ58eI0CSfhpcFbXFA7RSP5iC11av5eEbuhTrJrqohkuriJNUjwS
         Hvwb6LQv7mP8kzbMldAIio172ZYWMFUA5+tTBQaHWk+iXDzgynQ9vlXAHpUZc/PCTXBK
         6FQT0HC1/cITXYN7C4niVIXVKng5mS7lc+q+m1kJq9oCpqIhS2eHJvdJOwCnnl3zkzVT
         mNzlRtNvOe38UZhkvrrLaYZlfCUhdSuQGBgjLVweINQWjbWaK94OssLglTDsZnY9h5xg
         XYd6PWUPDayWCD7UJOQp2QNTa1IokXjxdGLVbyD54nbMHHPMIJ8jHOg5cGLy6kUhxxsR
         y/cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m7bdFtJP67PmJcIrwn/29KIkZ+QLRrIFYKFNL3qAIvE=;
        fh=W5QgjyBT9AIWfJjR6UlSoVxcQkxpRxPnSY6a1MNPd0Q=;
        b=KoK9hT4QVzkqEbBSCaNbH8GBwcOumH8+ynY1QVkgleZkqRKw5KZuc1ZCWQJrYuqt9W
         TR69ygGsI0PvIaUFo3Kyq01mTLxN1hKaKepGo91iaFrP99P321lJYbUp2kp8shk7tQjV
         mnTr80F2jlvmmzURt1QnsU63EBtNl8qtyxpWOrZIihAGQ61MxqV9u5FGZxBoJrpCXLjp
         xiZzE3ld/oun5mcFQW3ru7nspNpMOA/4ySsriNs4RerDR2qubi39eKnbGkvW9qK7SCHy
         cHxVs16XW9nEBC9quCNPDoPSeS+g6ZOJm76SA5cwI6OdZ87ooBPoP91lYdKT/GsvLx/Z
         P2nA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792982197; x=1793586997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m7bdFtJP67PmJcIrwn/29KIkZ+QLRrIFYKFNL3qAIvE=;
        b=H56zD1ljg6nalLm7c2rQvN4GUx6rNYneRDaac6bfGoSP8dBCWXlw48E3Nly2rV6rmF
         vsQtI0+XLURwSFo4lU8vbgD+gk6D3t1eOoGxjYxQ2l5qxoFIU317HH/FZxNn17CjFTc5
         FOY9iYajY4oM9hXIutL6GUF9tsBw02MP7y81XCLr3xuEGYcq9wY7rG/hEhMW7jjmiOIK
         0wTBESEgOCp7DPNR1x8YfEioQTlPYMhjsJks/zyUCEsxpxacGdYNjdBSqd82fa1aKwf1
         LiV1ADnh2RN8f21CSNoaqrYPHXNOuUrT3CuXdcKnDjiQC76Wpx0Pj+kUR6Sw6rytAucP
         DS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792982197; x=1793586997;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7bdFtJP67PmJcIrwn/29KIkZ+QLRrIFYKFNL3qAIvE=;
        b=TP0YXFQKhUi/MbqH6V7mACj/nTWLnvC/vVLiBX3zQ+j6t9y4tUQYVefsgCYUbmjBlX
         c60nfCvli+xyUcvkXwgyM6O7aA4MSFKHl+ol1uDkKynEUxcoK5v8CSXQNe8elMVQNySM
         7hx/HVfxEpiwmwNC8bWAlpx7Lm8fkYP1z2veAepZWkHrCEnApRLVSmf8PfUgBymHWRyP
         Ya38U8BuN/8fa0ZlQRxIiRmkFujyImTfBOHTbzwYzKMMmaIvIz7SICj8jiyGg3qbjD57
         wx1l0PWJ+FZK8e9c1pu+w6U9OxRuGs19mCoG7oBNwOREcrdcu7NFdovaEwuUPFxOVop0
         bwaA==
X-Forwarded-Encrypted: i=1; AKwUvBwO7yX1osWeQVdmdztHdqkZj55FBgJcZZkpwFaCzhg5TNi/RLO8kCOtzo+fllWeCUkEhauCPpEVfx4QlLM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbmLTzCBIx+IJGYtMgt1ZQP/f0U/zE9tN3Bm/HtaX/jkGtTFm8
	gq8BtsrMXylaIeQh+c/Itkdb9RfFU2tG+/H2A47oOxd5OpDe3LihFgTWnNMsRZTCP0XxWyg1emP
	OBNF+XJ3k5+aHi5j9bS/CRx7OG69iJas=
X-Gm-Gg: AYBFou3s7I96LpPnLNzBsbj3k4EalS5x+Otz8g1xRwLA+XR5FVZ651e3DsQUa4i5kAU
	ZxhucZD/TzUfHYZWtseVJ4fle6eiyR+05rV2XYYdDMsdKBCTPH9eCAFEh/xt4VblR4VA8RlGcDs
	9d5/0WWw7G29hthLBgqztp6ZgV1EYMc+e65oMoGQU0SRK4WFgGySTUI5hDoRYkDi8vy4z1hXB5J
	scuSOopP2UZ7MkZOxbdJ4qnZ1FMzjtAfKetzr7h2vaKLNIVD0saJtnrRzO9VXWb1Kk5rwaGSO29
	q/mlNDpe1ZFxhTmsC89rSfN8xW5d6jipo2ZbQE9pr/SplE04ZM8uM6xtalegQQsPk3SfZe3xn6r
	42eGKU0MnK89A2zkcfwLahmBqhv3P909ydfRbhRoHeBYLMoS0wySgz7vjL8qYHDxNWcaQApkhOI
	5dXhOD8Y2393HyFKUA
X-Received: by 2002:a05:600c:c16f:b0:4a1:9663:7633 with SMTP id
 5b1f17b1804b1-4a35ac8c226mr89777325e9.11.1792982196838; Sun, 25 Oct 2026
 19:36:36 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023101841.2910719-1-kunwu.chan@gmail.com>
 <20261023101841.2910719-9-kunwu.chan@gmail.com> <384fa5e2-1cac-4ff4-bea9-173188d4128f@paulmck-laptop>
In-Reply-To: <384fa5e2-1cac-4ff4-bea9-173188d4128f@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Mon, 26 Oct 2026 10:36:25 +0800
X-Gm-Features: AclHuK8B25k5dqPJzw8ONzyOTgQYH4Q7lrxiBt9o0JQQPFEOY1Tg2UTbjen-WaA
Message-ID: <CAN_Opa_UiE9W3s1Y_NngjZKdy2vFm0=kk3oG2B9mdBX+L6EOoA@mail.gmail.com>
Subject: Re: [PATCH 8/9] srcutiny: Detect duplicate callback enqueue
To: paulmck@kernel.org
Cc: jiangshanlai@gmail.com, josh@joshtriplett.org, work@onurozkan.dev, 
	frederic@kernel.org, neeraj.upadhyay@kernel.org, joelagnelf@nvidia.com, 
	boqun@kernel.org, urezki@gmail.com, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com, qiang.zhang@linux.dev, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kunwu Chan <chentao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 3:31=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Fri, Oct 23, 2026 at 06:18:40PM +0800, Kunwu Chan wrote:
> > Detect duplicate callback enqueue attempts at call_srcu()
> > entry, before the deferred list can be corrupted.
> >
> > Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
>
> Same questions as for the previous patch.  ;-)

Same changes applied: pr_err_ratelimited() and dump_stack.

Thanks,
Kunwu

>
>                                                         Thanx, Paul
>
> > ---
> >  kernel/rcu/srcutiny.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/kernel/rcu/srcutiny.c b/kernel/rcu/srcutiny.c
> > index 98864977bed2..4400fd2b41b7 100644
> > --- a/kernel/rcu/srcutiny.c
> > +++ b/kernel/rcu/srcutiny.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/irq_work.h>
> >  #include <linux/kasan.h>
> >  #include <linux/llist.h>
> > +#include <linux/mm.h>
> >  #include <linux/mutex.h>
> >  #include <linux/preempt.h>
> >  #include <linux/rcupdate_wait.h>
> > @@ -178,6 +179,7 @@ void srcu_drive_gp(struct work_struct *wp)
> >       while (lh) {
> >               rhp =3D lh;
> >               lh =3D lh->next;
> > +             debug_rcu_head_unqueue(rhp);
> >               debug_rcu_head_callback(rhp);
> >               local_bh_disable();
> >               rhp->func(rhp);
> > @@ -235,6 +237,8 @@ static void srcu_gp_start_if_needed(struct srcu_str=
uct *ssp)
> >   * Also called by __srcu_defer_drain() to re-issue a deferred callback=
, so it
> >   * must not re-check the deferral condition.
> >   */
> > +static void srcu_leak_callback(struct rcu_head *rhp) { }
> > +
> >  static void srcu_do_enqueue(struct srcu_struct *ssp, struct rcu_head *=
rhp,
> >                           rcu_callback_t func)
> >  {
> > @@ -272,6 +276,8 @@ static void __srcu_defer_drain(struct srcu_struct *=
ssp)
> >       llist_for_each_safe(node, next, llist_del_all(&ssp->defer_cbs)) {
> >               struct rcu_head *rhp =3D (struct rcu_head *)node;
> >
> > +             /* Bounds a node self-linked by a double call_srcu(). */
> > +             rhp->next =3D NULL;
> >               srcu_do_enqueue(ssp, rhp, rhp->func);
> >       }
> >       local_irq_restore(flags);
> > @@ -291,6 +297,8 @@ EXPORT_SYMBOL_GPL(srcu_defer_drain);
> >  void call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
> >              rcu_callback_t func)
> >  {
> > +     static atomic_t doublefrees;
> > +
> >       /* Misaligned rcu_head! */
> >       WARN_ON_ONCE((unsigned long)rhp & (sizeof(void *) - 1));
> >
> > @@ -298,6 +306,16 @@ void call_srcu(struct srcu_struct *ssp, struct rcu=
_head *rhp,
> >       if (WARN_ON_ONCE(!func))
> >               return;
> >
> > +     if (debug_rcu_head_queue(rhp)) {
> > +             if (atomic_inc_return(&doublefrees) < 4) {
> > +                     pr_err("%s(): Duplicate call_srcu() CB %p->%pS()\=
n",
> > +                            __func__, rhp, rhp->func);
> > +                     mem_dump_obj(rhp);
> > +             }
> > +             WRITE_ONCE(rhp->func, srcu_leak_callback);
> > +             return;
> > +     }
> > +
> >       /* Record the caller: the irq_work's stack says nothing about it.=
 */
> >       kasan_record_aux_stack(rhp);
> >
> > @@ -306,6 +324,7 @@ void call_srcu(struct srcu_struct *ssp, struct rcu_=
head *rhp,
> >               if (READ_ONCE(srcu_defer_draining) && !in_nmi()) {
> >                       WARN_ONCE(IS_ENABLED(CONFIG_PROVE_RCU),
> >                                 "call_srcu() re-entered during callback=
 drain; leaking callback\n");
> > +                     debug_rcu_head_unqueue(rhp);
> >                       return;
> >               }
> >               rhp->func =3D func;
> > --
> > 2.43.0
> >
