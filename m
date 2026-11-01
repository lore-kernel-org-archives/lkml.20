Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793543891;
	b=xkwa7RVU2bqVf15thb2y/a0fwQI5o0ENXx/yMVislVQx0tmz3LWj1rVc5pq/Y78p72PM
	 PPAOK1okC/nPXXoNAiDd2MdP1tjTn5vryuiyAh39tNoFJzMx39sQ2vUDrMc0BPXXgQET0
	 t19+/NjIg0lNwW58NJuyPT0ijucwZ+yqP6xfvlUE9HwVv3ugHeN7uNSRffz3DEbOZ1eVp
	 c5GeXvyiqwVVaV5z7GoGBdhDc1GJ7OwkT5rBvKA6LRQ50HgyreahFL8f3EzG4U+3AMtCu
	 xszMB0f/fkFDRNe9plN6rVgrI4UkbiCSkFlig3YYNln6/4NZKMLq0zfZ3v12wzQ27qA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793543891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=NMdhT4hlTV/rKmxwzyqkWVNTSddnJe/Vw5NSYLVw4C8=;
	b=bOlmwEJVhHhG2FKa6OXHc8dyl+ipe1MWS9sChlYwkOAr8E+g+G0a4gI+621mBVGv3tjY
	 /Pgbr50X89WOViINyfTV0df2l3jxm2nspAInsGxMywsUD7LWHPFR+DIQcnXXdvESdePWj
	 qul6/n4aR/3C2HYSLq/A0QyMHvuO954UxVueH10Jwl84AQUMP1x+SU1alF/yQiqSYHFFG
	 AkiU0CT6fQiC2hSmbDNSgz9QZJj+3eys7jhejvGhSP2MPrpmj5Yr2UDTOR7GW0cKOJ3xQ
	 4nGUF6LObaSxXPS7ZIkjr+Y4FR6IIofkfTpRmBDGW1O1jNiXwLTqRviyfWZ1WMy6vKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vpsacf++;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF489606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF489606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vpsacf++
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bfc346401aso1584850e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:38:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793543889; cv=none;
        d=google.com; s=arc-20260327;
        b=fqVPtRL7wYJeTv1HR2cPHgjkBJQholbixyJEk19YyBLFBCTULzvxo5JA6YWU9zHcBM
         WnynzbZ4pUbEO+2EI11ehIeSROemkxl5eRwmz8StHRfBzEz0WPDYlsz03A9tpXRRRQNC
         av2bZRX3IQ61gKIOmxwiqpTlLWGmPTpjUdzWO8k4N4EjPCUqOX6/d2zzbGFurxxCUChX
         Ue4uOyiOJeH965Z95Fn2aSofyVJ3ZcRv8Ib6N1fiLlhJV8hsA7GqhgqMMnKL08PRGdU7
         RIuqZzFvWXuXWG03rX0Td+9HQOIZEJ05PvjWZsbNrBa4qbNdgN7whiHBPDG4k5WHB2HX
         b9Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NMdhT4hlTV/rKmxwzyqkWVNTSddnJe/Vw5NSYLVw4C8=;
        fh=mbA51nlFLRyxx1X4JpVSmb27LLoAxA8U7iSrVq0PLCU=;
        b=sUix5PuiKDlrkARuivmuaYU8wy2pjoYcsIdiv+iCC+WveqiOt+G16Fo/uhxZLiHsJP
         0zXdcHSNkn6KlbIxpgLC6wrjBPoIAVf/J/OAw9IIkax4n4eQr4LHADm8b2dUQ74crXtF
         EDwCcFssoWPoQvxC+4WDC0b+RUmxsxJ1VAdHTnOPjEg6mM4PgyO4kxeNgdAfFOiBotYq
         rdfVRWxB8xc1apFBrj0ll3z9X5vq/Uuya3Irq53y3cTrDnggRKAt8hTwWLrhWQnAArr0
         /VzQegh3AngPqS2VtJbJsgO3T+ym+d6xK2uDQUiYC2PaL4HfFgYM217P+IdwQEZFnvFl
         ASig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793543889; x=1794148689; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NMdhT4hlTV/rKmxwzyqkWVNTSddnJe/Vw5NSYLVw4C8=;
        b=vpsacf++BsPXPx6uh0975eFc0tTAbZcWLyVVYdCPY6kV2spQ3wGBAYbPelrbpXzNA8
         ivJ/q5VfLikuHhtEusuvBYW9AM0WUcMBN5qy0U8aDo95a9eukhGIoN5P8PendvfZQGNY
         IzgBzqSElJbM+wxQyda+pr4FH9JqLUqQSQ9q6yhQ+L3s1K+SR/lMolY/Nk0wMZAu4Fox
         09gVrqvE/WlMtv4UI2rlTi2xqjSqFe4nBQMySGSr8AKWEfm89gdlO9r+ccA1gTtvkyPI
         +IaH8cvkjacaIv5EZu0DV6mnXdHx5EhwsLRmXmXlfgFfuHAKxnaPdv6zW1SIrUbz/Yyt
         v1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793543889; x=1794148689;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NMdhT4hlTV/rKmxwzyqkWVNTSddnJe/Vw5NSYLVw4C8=;
        b=1rCShQIPfoL3HeKgVwddncAC65JNOsfC/AS22CXaB1qyRiEULMiaWMd5JCuikl4qXF
         dEvL98hkB9VyGzKa7OHgNWjJARUIkuHKozZ5T2Ie137EO2IN+F+Yib7+5jCuszLx6Fhx
         pvNRQhYl99OhJLOqiAp1ie2h3IGeS1ihy1QUZhgrRMz+eVYCFP+7cZDw82Ki4wYj/6B0
         jbgrAd0e/UWENHmoelJnFnstHF45UVcKybsIBO1RI10mK1ndpga09L6U3Ukw3Ekexlg9
         gayZYFn5CKyoyrOavawEpjweyC/nF62Zf6/pr1KOV1xDJ3XveWbexSX5APh/DJptDgA/
         i0fA==
X-Forwarded-Encrypted: i=1; AKwUvBxxd7pm9g3CkvOrzrWSh9uh3H6gqKp9bs0wgzu4OMJwgNZXtfK05807XhVRCJPwjF/kjIYxbqBari4ObjE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYiwJqc86wAeulm5SvZALBV9ugXlOSIKRjv8HwwShoqj45GWkJ
	CZH381BiQkuewgLKk0eyiacMxLD7e8CAfc6MX1sKBQyZcdNQDvc1sQCJkU/HnfH+otQxLmANsa3
	xUh78kZhJNKbebLwquWVWILBi7bG6Hp7GMg==
X-Gm-Gg: AYBFou1JLOR5THy2tqsKt78QMMgPxv4z/Bg4bhHxea4PvywoWnXwpjZCnwan790B+HT
	jYJ0ST5wZLDwWvZuBKs6gh1cKD2ttHifdWac53+opL55HqDKphk2rCHvaSliEmLBVayiMBxsI++
	N4v8Vqlz7svdDEVQ+rMWZ1fcL3wslnuHJAhqd8o5/+e6hapcBZnXu6tOrsszvJPnArdRTL2ZwLx
	vNal+4h+MT0SiG90A93Ll9+gDJRY69xOTq39Nqb7MpPm6R1L5uXczxRBjRa88b29SPyYoJlmT4a
	vTNe+6JpiFFVwgKOACmyKrA41l0I/xg/lSXarqAIznv2o3SHo57uFLgXlvccTcAOw2aqUlJGxCZ
	XwcOtdgQe8rTm5djUfWm6LWNq94w2QmzfKmLq8oMix9iiIQOR+LiMGqPFKRjN4KjxOlNBFVP6Qz
	aEAO5EkEUvzFIJLI87BAPK3UwwIwc=
X-Received: by 2002:a05:6512:31c7:b0:5bc:b728:31b with SMTP id
 2adb3069b0e04-5bfd957987emr2459527e87.21.1793543888426; Sun, 01 Nov 2026
 06:38:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CANGjgd=yr4Zy+SMUsDnBSw05hhn9086NVc9g9SaG0y804=WWrg@mail.gmail.com>
 <5ab06e4740bb0fd177a96e0a31f933a27d081012.camel@gmx.de>
In-Reply-To: <5ab06e4740bb0fd177a96e0a31f933a27d081012.camel@gmx.de>
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Sun, 1 Nov 2026 22:37:54 +0800
X-Gm-Features: AclHuK8AY_3ZTlhRssGylF7hfG6-lTU7JxEvMmPEw-D1UPJtv-9r52BMyNc9t60
Message-ID: <CANGjgd=DvO72NiB8SC3hNEadmxgzy1niN-mnWyY-LGMJ4H=J0g@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] sched/eevdf: Move to a single runqueue
To: Mike Galbraith <efault@gmx.de>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mike,

Thanks for digging into this. Your point about accounting changing
DELAY_DEQUEUE's behavior fits the change in requeue frequency we reported.
I tried skipping one redundant update on v7.3 (c03c1a14507d), but it did
not improve the 15-worker case.

The change skips the leading update_curr_eevdf() in __dequeue_task()
only when pick_task_fair() has already updated the current entity and
the intervening selection has changed neither current nor the rq clock.
I passed an already-updated flag through pick_next_entity(). Ordinary
dequeue and wakeup-preemption calls still perform the update; lag,
eligibility and hierarchy accounting are unchanged.

With the same native CORE placement and 15-second post-warmup window,
15-worker throughput was 9.171 -> 9.158 -> 9.186 million handoffs/s in
baseline -> modified -> baseline runs: -0.22% against the average of
the two baselines. The 2-worker control improved by 1.27%. Each step
had nine measured runs per worker count.

Separate probes showed that the leading update on this pick path was
rare: about 1.4 calls per million handoffs at 15 workers on the baseline.
This is distinct from the frequent delayed-requeue path in our report.

Is this the path you had in mind, or were you referring to a different
update? I'd be happy to test another candidate change.

Thanks,
Chengfeng



On Fri, 30 Oct 2026 18:01:12 +0100, Mike Galbraith <efault@gmx.de> wrote:
> On Fri, 2026-10-30 at 21:03 +0800, Chengfeng Lin wrote:
> > Hi Vincent, Mike, Peter,
> >
> > I have additional pipe-handoff throughput results for 333238da9a19
> > ("sched: Update time before requeueing delayed entities"), which Mike
> > identified in his wakeup-jitter test [1]. With 15 workers, will-it-scale
> > throughput on v7.3 is 15.69% lower than v7.1.3 in thread mode and 14.82%
> > lower in process mode. Reverting this commit on v7.2 in a separate controlled
> > comparison improves 15-worker thread throughput by 13.65%; the 2-worker
> > control changes by -0.48%.
>
> After much crawling over trees etc, and way more yacking than intended
> for a datapoint, I think I know what's up, and it's simple: there's a
> good reason those "now" updates are event driven.  That one was added
> in the DELAY_DEQUEUE machinery, where it expends and *banks* precious
> fastpath cycles, shifting bean counting enough to make DELAY_DEQUEUE
> measurably less effective.  It looks completely broken with a 20% util
> probe, but more measurement shows that it's not dead, just a bit sad.
>
> Test probe sent another signal in virgin flat in __dequeue_task(), and
> I think it's valid for that update_curr() too. It seems to be in
> keeping with placement strategy, but with flat changes, we just updated
> the cfs_rq where all the action is, and hierarchy update is right below
> it.. looks like redundant overhead.
>
>       -Mike
