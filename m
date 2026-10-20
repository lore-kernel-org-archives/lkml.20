Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792529768;
	b=SOoK+YeZWgTMTPlj+//fo0q+OfOVyh9fmiGqEol5snrvmUCDbkSFwKunh2x9NFBl/wPn
	 IgX3El68CxjMT8Iok8YdW0Okh6YWSBfFnS1F23Xinb/J1S/lBnAt8OPJIhkAzciIz+k4u
	 27i2OxyUyEd8CcxK0SSScnst9210HF7xH0SOGGgsOUpFZFKdx7k8l3Cp7OJeiKRkq/bCN
	 taS7mqTiPFb1kruGyWys2vqADO62Z+LG4YxcQ8o6JvNPCU7wF0XOE3Xu8QWGnufBKxtyt
	 YAJi5fBvorVpZ6TKwjP6AaiwRLdDtb2Gt9pgXbAhjNkZUZRuTx4EDKfS5x55VVG7dXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sl+ao6jj/EJqVd8mitMcxYql8KlVrUDpfsHnTJtiC1U=;
	b=OzlL3sN4NOVpucdc3Zn9MX02Iou3+kpw/7d5DyfRk+l4Jsio8AcpNbTC6bpYvcTvA4a9
	 VYzvSHk/xy46KACVvgjnGXZ42GYLPpJBS/lM7/YHxJjx+oPJ1/Z+i8ciys7Nu9kqG+ZaA
	 ikgdmoAO4ZKlSXZ8zU8Wcy9vlZpvuohdvk7qAyKmov+yu4yOD0eB9GJbru5A+XSu7jNk+
	 lpWZs11tT9TeUUJwQQkSi9jYXpT2qFdWNC8jXQv299owsauDKTP2HkFnQiiCsF8E/8eM/
	 tmV67FOvBF82583iefr3o3bGVgwIyZGFx3XGZDZ6jkitco3s5+1pFvN/6/Ss4f6pDRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nuro.ai;
	spf=pass smtp.mailfrom=nuro.ai;
	dkim=pass header.d=nuro.ai header.i=@nuro.ai header.a=rsa-sha256 header.s=google header.b=QBRGJsiF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B165B606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B165B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuro.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuro.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nuro.ai header.i=@nuro.ai header.a=rsa-sha256 header.s=google header.b=QBRGJsiF
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36681e85e87so1658489eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:56:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792529766; cv=none;
        d=google.com; s=arc-20260327;
        b=GKIpP4WJxo23PWd9DDI02kFTfFTD9KO7Ry0B4aZpyIlRext2g6C+585zd0ZbQ/V9jX
         IEdmIdL1X4TMdh+GPJnSRZuwlxYFlldorpksGr2j/05941h3MLlC/+EBjAtPUwkPB7MI
         AlWoIT0MOWaKX7K+IXpDvBycXj2meD8246t1HI+BRoeLA7lQkF3Mc8HmxQ/x7A5gs4IX
         xLoLB22v64vgQHcNZRq5YWQ8930d0Bor+/Gbc5G0BX7bzNffjuZyYvAsHadizrE5A9f8
         skQPGxQgZ/dCHPnPYikVyPDvskhIswxwzF+08OtakgBzeD+dH8m6TwTP7s/4gbv3U8Cd
         evvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sl+ao6jj/EJqVd8mitMcxYql8KlVrUDpfsHnTJtiC1U=;
        fh=vbmbS88UVbYFRtrsBcqNy5UygxtMO4enEHMQN1rmpSo=;
        b=b1RSJ2jRQBH6oc65u8AHpNrIBt0PXnSbfrPUg/EQT6l3gViaqpC33T5hll7cjy2YYw
         6bBn80Kb7pUpUICQWljNB/v1VbE9CCLEMYSlyisQ701Mtf8yhAX60NtrTQfuVSfgcQNe
         30ktEvV7S7c2s9vt9aj+pVdmFkeVsJ8Wl4RtWpVWteM0BtxRwehTQ64WSnJUUmjA8tqW
         sfLEhwas2FcLM4VysmUVI2+7zWDTu68xIEmbwEcVxnD2KRNo9lE4NRa8XPgzVD3vUAn4
         jTE9vhdxvUp5Go+Nv4PYGIWp74EG0p2PkqdJI1lbd7UswVPN21/uZfMsjJKC0GSf3oqC
         h8wQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nuro.ai; s=google; t=1792529766; x=1793134566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sl+ao6jj/EJqVd8mitMcxYql8KlVrUDpfsHnTJtiC1U=;
        b=QBRGJsiFVCrhjLHQvzC8rKPKju2tMSUEZizd5uil8TnWzE5VZgOBqrQt1ryDvFovu+
         mRLoS0MODyFyVb1MCqwomuFE/+I146dY0fGUEP3Qh9HjZMMZLN4Y5WoUdoW+7F0znGRq
         +R+hmZxocYsWRXq7Ai5lg6Kb/FEo1MYKz4C//WSLH+ueMcJzpVCeH6PHuWrzWxkPBRP5
         SxXMfXPaZOMPD+YTfZM8jyxMJPtNdF5T9eH+IbjBZMr7NDog22z9XBDWQSNcCpaFslMd
         0VQAVBS82DXGsbrjq72mkgfNk7Jmk54xrksIEPzKb8PpJSAvUcO1OSIkCpPlGleWA3o+
         p6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529766; x=1793134566;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sl+ao6jj/EJqVd8mitMcxYql8KlVrUDpfsHnTJtiC1U=;
        b=wg02AtURtQgG/mkPNpJRjLK4OBvOCwGHuH+J9xze2r/2ehWqe9tFgKxqWqPTH89cyb
         zb9E4rFlOpW+PZgfTwmJ6f/8mfjbHSnyUstlzBGjCkI+zT+Y2EPGPHhqKqS+ZNlgIr9Q
         wCO9sEhSW3S5hLFn7Ym7eCc+IH1BhMoi/1QKxDae45LEgKwdSQFjCCIkNxtXb/TtFUjv
         v//1XwUYTJiUrps9GbSf04XyMiO4MVqIiG9lTufeeV1QK9jRyLHLYguuFevxxTQ8Qi2S
         g33FFKvr9rkgC/3fUplSsR0TgG1l05zUi2gTDRpKwFL5TglJNjnUvgZaFixZmLmuXcq6
         JTcw==
X-Forwarded-Encrypted: i=1; AKwUvBwxJnBPDKtDeClas81wz3CRyzsEohESx+ZcVPTJfgIBHIruZuw2J9tNQNcN4aBGpOySrUOKwFDhTINRooI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfMWwb+5rw2i3S3W4MCXqCSRGMFori9vOl6jfRP62sM8MEXgXG
	MsNjNSkYGwuYxOzqfuegFGQJiwCDwYwRF+uOfDTPxk8cfyr+z++HdPkkNtmePS+WjbEaZG5UkwT
	u31tGEnbdIkkpfJzBNSv38wqHgMZkOxT3S6iq5VStiQ==
X-Gm-Gg: AYBFou3Qn5okpXTELmpI22wckKoJl5wj3o2B7avSTwNUFFBkxCaafGedNNADsof+8nj
	TBNW3C1qoTmgsk14ZYUIROUI57d7CWx8qLkqp6GQiUTcmgcu8eP0N/Wuzbtu6WLJAYCe1EKBFpM
	hif5R3ib9DSblhSwU23uqzqih2Zvd0HkKscA6p8LTHzHDaXNmzZUo+M7xPmSTBl2+/evmOVvXI4
	7qvomnriDHDiXZb1VaHGzDwYYzyXxSkq3GCJA3Xlyu5QU8H3yr4lDOhpfmbLY49MGcscBMKKQ+s
	HeFn55IaUuQLgXbz3Fqbe1Th3e6+fUcJKz3l7kMAkhY3foShlRIOlzLh1+oP6Ul6DTrqEb4k/2S
	IUpmtAAWlMuuCwg7RF+zj45DfPdAIZ4Y1ze8K
X-Received: by 2002:a05:693c:60cf:b0:353:8205:8558 with SMTP id
 5a478bee46e88-3674b82ad86mr744900eec.5.1792529765608; Tue, 20 Oct 2026
 13:56:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019174258.1375583-1-jkain@nuro.ai> <CAL4WiipkRkOnc_QJ51g6_9uB=pTeCSp6U8L-YVD2ytuZn4g5Qg@mail.gmail.com>
In-Reply-To: <CAL4WiipkRkOnc_QJ51g6_9uB=pTeCSp6U8L-YVD2ytuZn4g5Qg@mail.gmail.com>
From: Joseph Kain <jkain@nuro.ai>
Date: Tue, 20 Oct 2026 13:55:47 -0700
X-Gm-Features: AclHuK-crS7z_XIcQyguixXXCUEme6bZ9BWpgUYG6WSh9lO_ed8dYy8vP4sPrPk
Message-ID: <CA+Y90Pg5UaL9WkaGghc3PZadrsN+ud-vY89aE3xuZ3UjUxz9Ww@mail.gmail.com>
Subject: Re: [PATCH net v6] net: schedule a purge when the defer queue rejects
 a free
To: Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, kuniyu@google.com, 
	kerneljasonxing@gmail.com, bigeasy@linutronix.de, clrkwllms@kernel.org, 
	rostedt@goodmis.org, linux-rt-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 10:58=E2=80=AFAM Eric Dumazet <edumazet@kernel.org>=
 wrote:
>
> Say not to very verbose changelog, that nobody will read.
>
> Since commit 844c9db7f7f5 ("net: use llist for sd->defer_list"),
> skb_attempt_defer_free() increments sdn->defer_count before testing
> it against skb_defer_max, and keeps the increment when it rejects.
> __skb_defer_free_flush() returns early on an empty list without
> clearing the counter.
>

Review bots found that:

1. skb_defer_max=3D0 still latches.

proc_do_skb_defer_max() publishes the new value before it calls
static_branch_enable(), so a producer can read skb_defer_max=3D0,
increment, and reject with an empty list, which skips the kick.
__skb_defer_free_flush() then returns early without clearing. Restoring
any limit at or below the count that accumulated leaves every later
producer rejecting on an empty list. On 6.18 through 7.0, which the
Fixes: tag targets, there is no skb_defer_disable_key at all, so there it
is deterministic rather than a race.

2. The kick does not coalesce the way I said it did.

trigger_rx_softirq() clears sd->defer_ipi_scheduled as soon as the IPI
runs, before the list is drained, so if the owner has BHs disabled the
next rejection sends another IPI. With use_backlog_threads(),
kick_defer_list_purge() also takes sd->input_pkt_queue.lock before it
tests NAPI_STATE_SCHED, and on PREEMPT_RT that is a remote
spin_lock_irqsave() per rejected free. This series started from
sd->defer_lock contention on this same path, so I would rather not ship
that.


For v7 I plan to restore the empty-list clear in the flush which covers 1
(but was dropped in v3).  I=E2=80=99ll keep a kick for the case where the
owner never raises NET_RX on its own, but bound it.

The bound is what I am unsure of. Kicking only on the first rejection
after the limit is crossed costs one IPI per overflow, but nothing
retries if that one does not land. Would you prefer that, or something
that keeps retrying?
