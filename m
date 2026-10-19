Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792427590;
	b=faVXgQoCTSC/ec7RsFsjpSuQ1PDDu84zubk3uhEnu7uhNTM/e9CDR7mFLNdSq5PSPFWh
	 Ve+lwwBmpU+nopfVn76souFzfbhC1Dh32qLEnMYkGvROBV+OddwVYqe07BleIlIGyNAtK
	 ZzWO3WxIXkxFIawbXAOOrD5qf7GvQAOwVFx7EaqQpl2lV3m/vAXRukgNc8acRoJFCgdZu
	 dcxhC3yIKLQFv4icCBnx8W87RcwZnbSqzLjI1agYCOx+OY17jMLaqF+dLNmQ2VI4g+Ciu
	 ycUD6TvxP/PReiGy4jWd9Xcj1qlhDm0cIkbyg5jatjMmAQLGD4p7lMldBRm7jBZ2BLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PVyw06abLNr7loVcICaX07VDm6KPz5wxyY1cmqpMoX4=;
	b=eQrjJyLFoWErwBTknRTJICBxIbaF4Iu8DnTbyJ+6/0IlaJLctAJf69+HG7N32bbGr3GZ
	 +185RudNV9L7aIX3Ulabn8qSfnBcIHjmwuB0KEksLEFThWyuuuFRUka0ZHX2+bEh6FAXx
	 pNvu/PMuux3WRuKTtEjK24ZpFZQWpEL9G6xyclFNN2IPMbS1+XscZqRR+fMjSELxOQXdn
	 OAbqM4FGjgrKZIXaaWq103WIc3DXF4gMGwHWBm/5LrciNWjJGZfk7kdtRpVh/PO0jvoG7
	 uBG77Qrqp5XI3UJiAqDDtRa+bWiwcFtjfNcP3QOj4jFGbddhxHWzTudqF6KKA+oeCUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nuro.ai;
	spf=pass smtp.mailfrom=nuro.ai;
	dkim=pass header.d=nuro.ai header.i=@nuro.ai header.a=rsa-sha256 header.s=google header.b=OlhatWBI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B13606A324
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59B13606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuro.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuro.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nuro.ai header.i=@nuro.ai header.a=rsa-sha256 header.s=google header.b=OlhatWBI
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35943f55c06so3461657eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792427588; cv=none;
        d=google.com; s=arc-20260327;
        b=B4fbTLb2SRlSiNjWDPhKKqcY7ZX1ZOBw3BUBeJHXf4MnM+pS2F/AwMMdEAsy1IQnK1
         MI7Ewf1gtr4WYN1pUs462A9E7yiASSBnVbg1x5zG/ApjXjlkX4TS/Y/eaBvG9v8l2/Ty
         ksUmRZQxGY1yoF8o3/jddoRVuzJwHhSCHa1bOLSy3DMSqlSslvfivF8u2gnveDteBGm2
         O4u7UZR6/3MbzQOK/Ha1cIpNlPgRlY8p/wkettPkCTZ6LIPBrLMQFYSXqqPoxq9oMXgB
         IOoYGCFQS6hyZMJS4kkyWelWr0kIh6GStrxdaVWW4B8dYstTKrz1COuxye90h7aRuiS4
         GuEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PVyw06abLNr7loVcICaX07VDm6KPz5wxyY1cmqpMoX4=;
        fh=jTaQOIgxUtre9QuuuX3Gf8wF+Q3ItEkcxwkmgD+YW2U=;
        b=Uxg5gJqyRBm4NBsc+7folUQo4Cg25y22aJIDNzcSuWTN9Ruq8Y0CHpwu2yboMgbe7V
         JL6BkwOTTG3KzwYf59l7UNhygRcqih90QTrBJDJyy9CWPAGL0YKx3FVjxmXk35aTOJ0o
         o86ersW507h4vWpuA7X/+hbsVrIG5bqRPX+3B26SBEgWBRt+8BaSc7+eNtQcpWCkiEQu
         m1ZNu50nL1F4mUFla9HxZzXfFlttGlh3qnky/6LrRQlQMM9CPgvXyR1ZjSnyWvCSYB/P
         g/4OSi3stkheSlO2jyBAmBVBNqzarD7cAx0pJZ7T3E7MDuqd8gWWb4WjsZWvrWkE4QGf
         axIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nuro.ai; s=google; t=1792427588; x=1793032388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PVyw06abLNr7loVcICaX07VDm6KPz5wxyY1cmqpMoX4=;
        b=OlhatWBIrlneazpJe45AUJK8fRSXaijrg68jsh14HgKGtKFrLuMyNokLH8Zq6MDaxU
         BWB5uMByukI2gjofWK57wO2uCs+5My8D8Be5fwqIO47oJvbg8yKQDPTDFr3ax41u1fA9
         dg+OVBjuhmQIkXr7KLM4zUz+qP1TWICkljX23mqSd1lHESV5slmacMQp+4Kxl+K2FYHr
         6upqUtRDcXuKK5xivwOkak3/e/w8W2dP7vynkAk+3RIraEi2dan6QsBHbSv/uQSbe+XY
         SsfB7XgSAkWR1kOXfqxzz/Aa0UFb0d0FsSVOoAEQv5RbblIeQiD8V8PpTABLxFNXwkbS
         4rDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427588; x=1793032388;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVyw06abLNr7loVcICaX07VDm6KPz5wxyY1cmqpMoX4=;
        b=E0jQkZQ4p8hMz61ursdSqYM84Lv2bdOBWU3za9LTM/7/7d3H0N5H4iUBY44kFuTepZ
         qA1SBr30qVMkQEkkSh+6TaUA5t/hJBA8zQctKZQeEk86oNEJrjsxV33XjZhvQqyIU5N9
         S7xNNxSuRRU00zUoIgEu/9qIxPNRxeyJ5LrqdkGwmD4Ecegm9e1zfuz/RGif8gDqJHzf
         nExQytxxnvIBj0EQVFMduQAMihsOBkgjMLBfApzN8KBBGw2ePfAqbE9NgOqjRgSP+J65
         gyVRoL/ZC+t68YiHC93+iZMTWgdHZWvmUCcMQSpS0RxvXFbLset9tmlXcs+9SlHvvqvE
         8rig==
X-Forwarded-Encrypted: i=1; AKwUvBzFs98fkQ1SE/dbjEzE0yBbdeyKV1jAvHPug1byrx9p/b0fNoAEBgdhN2DjqaeMZRipyU2VMupuz3hz6Tg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+cJvZsJ6JKwSoag9mc9jRuoJ+UF9ccI/hGKlAv/Hrn7aTH72U
	Nm+fxp9KCWLMc0WVDfRPVw/173llXngkrxegQpVKZdwtg+9oWBiHDiW7ue5wFC3oKFxgcFx0FP7
	QyTZchbVWaVpjlaiaRWRn/MsDMmFBtnwEjcv9qzjxLA==
X-Gm-Gg: AYBFou1j7fiXy7woC19VZ/vtoig8T0hr7y49mPgzRUg1M8iXQAvZxLWlvLxsZNKHN1n
	Hd2Y/8MPsFrejRY0eoBFf7uMUHDeoES+7Zd0RmwM47Sn+Jp1RjjoZDXThN9iRZDY00pqG/x0k91
	1m/HUgxcIEEH50YBh1YQhyHqcDNjU5YFiDvsP17r1d58H6X9hZ+KRdclABbvV2rhVeMq9+1cm1g
	t3Wl7XeTsViu947RwQKOFOSCxZuUp+kYDEh6mZVKzvQ4SaDCkgg+oOiuIqXhpnshlGr4SjqCZas
	PJgfihiMRFqafyREhC6WtHyNxLLsYg188oKmnYdYVeMoII0pw4LpydU=
X-Received: by 2002:a05:7300:f78d:b0:353:ba38:789d with SMTP id
 5a478bee46e88-3619b4101c6mr10300680eec.0.1792427587934; Mon, 19 Oct 2026
 09:33:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015162209.485940-1-jkain@nuro.ai> <atMVsAmXKl7D-Fxh@google.com>
In-Reply-To: <atMVsAmXKl7D-Fxh@google.com>
From: Joseph Kain <jkain@nuro.ai>
Date: Mon, 19 Oct 2026 09:32:56 -0700
X-Gm-Features: AclHuK96ao3-gcFPCTsoNVUIQop3QovF9TTmqCGWlYJyX7oEZUJ0dp91AGzMnc0
Message-ID: <CA+Y90Pgk3Yd_+dQrTj42+c_cmi9D__Nfg=Xq4OZXRxpm9Eq68g@mail.gmail.com>
Subject: Re: [PATCH net v4] net: do not let defer_count outlive an empty defer_list
To: kuniyu@google.com
Cc: netdev@vger.kernel.org, edumazet@kernel.org, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	kerneljasonxing@gmail.com, bigeasy@linutronix.de, clrkwllms@kernel.org, 
	rostedt@goodmis.org, linux-rt-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 11:51=E2=80=AFPM <kuniyu@google.com> wrote:
>
> On Thu, 15 Oct 2026 09:22:09 -0700, Joseph Kain wrote:
> > __skb_defer_free_flush() can leave defer_count at or above skb_defer_ma=
x
> > with an empty defer_list. That state is absorbing: every producer then
> > takes the nodefer path without queueing, so the list never refills.
> > Deferred freeing stays off for that (cpu, node) until reboot, and
> > cross-CPU frees fall back to the page allocator, which is the contentio=
n
> > deferral exists to avoid.
> >
> > skb_attempt_defer_free() increments before testing the limit and does n=
ot
> > undo the increment when it rejects, so a rejected free leaves the count=
er
> > raised with nothing queued.
> >
> > Nothing brings it back down. The reject path returns before
> > kick_defer_list_purge(), so once the counter is stuck no producer
> > schedules a flush on the owner CPU. A CPU that never raises NET_RX itse=
lf
> > -- an application CPU doing TX while NIC IRQs are pinned elsewhere and
> > RPS is off -- then never runs the flush at all, so clearing the counter
> > inside the flush cannot help it either. proc_do_skb_defer_max() neither
> > resets the counters nor schedules a flush when the limit changes.
> >
> > It is reachable with no race at all:
> >
> >   sysctl -w net.core.skb_defer_max=3D1    # frees increment, then rejec=
t
> >   sysctl -w net.core.skb_defer_max=3D128  # does not recover
> >
> > skb_defer_max has .extra1 =3D SYSCTL_ZERO and no .extra2, so 1 is setta=
ble.
> > From v7.1 on, 0 is safe because proc_do_skb_defer_max() flips
> > skb_defer_disable_key and the producer returns before incrementing. On
> > 6.18 through 7.0, which carry the llist conversion but not commit
> > 08dc30de1a40 ("net: add skb_defer_disable_key static key"), setting 0 a=
nd
> > restoring the previous value strands the counter the same way -- and 0 =
is
> > the documented way to turn the feature off.
> >
> > Test the limit before incrementing, so the counter is only ever raised =
by
> > a producer that goes on to queue. It then cannot outlive the skbs it
> > counts, and the absorbing state is unreachable without depending on a
> > flush ever running on the owner CPU.
>
> I think the state is still reachable when reducing the knob
> if the new value >> 1 is smaller than the current defer_count
> due to the kick condition (=3D=3D).  This can be fixed by bumping
> the knob to defer_count * 2 though.
>
>
> >
> > This makes the limit advisory. The test no longer reserves the slot it
> > checks, and the recvmsg callers run in preemptible context, so the
> > overshoot is bounded by the number of producers in flight rather than b=
y
> > skb_defer_max; the post-increment test reserved the slot and bounded th=
e
> > queue exactly. The counter is already approximate -- the flush zeroes i=
t
> > without regard for producers in flight -- and the next flush erases the
> > overshoot, where the latch it replaces never recovered at all.
> >
> > Undoing the increment on the reject path instead would be wrong: a flus=
h
> > that zeroes the counter between a producer's increment and its undo
> > leaves the counter negative, and the producer's local is an unsigned
> > long, so every later test reads it as enormous and rejects. That is the
> > same dead end, reached more easily.
> >
> > While here, drain before clearing in the flush. A producer that queues
> > between the clear and the drain currently has its skb drained but its
> > increment kept, which over-counts and costs deferral until the next
> > flush. Draining first matches the ordering __dev_xmit_skb() already use=
s
> > for the qdisc defer_list.
> >
> > Found by manual code inspection, LLM-assisted, while backporting the
> > llist conversion to 6.1 after hitting the sd->defer_lock contention it
> > removes. The latch itself was not hit in production; it was reproduced =
by
> > lowering net.core.skb_defer_max.
> >
> > Fixes: 844c9db7f7f5 ("net: use llist for sd->defer_list")
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Joseph Kain <jkain@nuro.ai>
> > ---
> > v4:
> >  - v3's "undo the increment on reject" was wrong: a flush that zeroes t=
he
> >    counter between a producer's increment and its undo leaves the count=
er
> >    negative, and the producer's local is an unsigned long, so every lat=
er
> >    test reads it as enormous and rejects forever. Test the limit before
> >    incrementing instead, so there is no decrement to underflow
> >    (netdev-bot sashiko).
> >
> > Note this changes the effective limit from skb_defer_max - 1 to
> > skb_defer_max, because the test now runs before the increment rather th=
an
> > after it. That matches what Documentation/admin-guide/sysctl/net.rst
> > describes. It also means the half-capacity kick can now fire at
> > skb_defer_max =3D 1, which commit c09b0cd2cc6c ("net: avoid strange
> > behavior with skb_defer_max =3D=3D 1") set out to make possible.
> >
> > Built for x86_64 and arm64, with and without CONFIG_PREEMPT_RT. On
> > v7.3-rc6 with skb_defer_max=3D1 and a cross-CPU TCP load, defer_count
> > reached 1918118 unpatched and did not recover when the default was
> > restored; with this patch it stays within the limit.
> >
> > v3: https://lore.kernel.org/all/20261013205416.3417296-1-jkain@nuro.ai/
> > v2: https://lore.kernel.org/all/20261008220256.1844072-1-jkain@nuro.ai/
> > v1: https://lore.kernel.org/all/20261007180056.1394868-1-jkain@nuro.ai/
> >  net/core/dev.c    | 5 ++++-
> >  net/core/skbuff.c | 9 ++++++---
> >  2 files changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/net/core/dev.c b/net/core/dev.c
> > index 18dc88990510..60d86bc21632 100644
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
> > @@ -6940,8 +6940,11 @@ static void __skb_defer_free_flush(struct skb_de=
fer_node *sdn, int budget)
> >
> >       if (llist_empty(&sdn->defer_list))
> >               return;
> > -     atomic_long_set(&sdn->defer_count, 0);
> >       free_list =3D llist_del_all(&sdn->defer_list);
> > +     /* Racy on purpose, as in __dev_xmit_skb(): a producer landing be=
tween
> > +      * the del_all and this store stays queued but uncounted.
> > +      */
> > +     atomic_long_set(&sdn->defer_count, 0);
> >
> >       llist_for_each_entry_safe(skb, next, free_list, ll_node) {
> >               prefetch(next);
> > diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> > index 4aea06d5167d..25f82b7dcf01 100644
> > --- a/net/core/skbuff.c
> > +++ b/net/core/skbuff.c
> > @@ -7386,11 +7386,14 @@ nodefer:      kfree_skb_napi_cache(skb);
> >       sdn =3D per_cpu_ptr(net_hotdata.skb_defer_nodes, cpu) + cpu_to_no=
de(my_cpu);
> >
> >       defer_max =3D READ_ONCE(net_hotdata.sysctl_skb_defer_max);
> > -     defer_count =3D atomic_long_inc_return(&sdn->defer_count);
> > -
> > -     if (defer_count >=3D defer_max)
> > +     /* Test before incrementing: the reject path returns below withou=
t
> > +      * reaching kick_defer_list_purge(), so a kept increment never fl=
ushes.
> > +      */
> > +     if (atomic_long_read(&sdn->defer_count) >=3D defer_max)
> >               goto nodefer;
> >
> > +     defer_count =3D atomic_long_inc_return(&sdn->defer_count);
> > +
>
> IIUC, atomic_long_read() before atomic_long_inc_return() needs
> two-step coherency transaction, and we could avoid that and
> the corner case above by fixing the off-by-one and calling
> kick_defer_list_purge() in the slow path:
>
> if (unlikely(defer_count > defer_max)) {
>     if (!llist_empty(&sdn->defer_list))
>         kick_defer_list_purge(cpu);
>     goto nodefer;
> }
>
>
> >       llist_add(&skb->ll_node, &sdn->defer_list);
> >
> >       if (unlikely(!cpu_online(cpu) || my_cpu !=3D raw_smp_processor_id=
())) {
> > --
> > 2.55.0
> >

Thanks kuniyu, I'll follow up on these in v6.
