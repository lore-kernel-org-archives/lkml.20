Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FF539A07C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140556; cv=pass; b=W9yKyqU3o6wVIWiaoYgSzyH/bFZf3AfT7kcMaffw6x3hpD1bs2WQj6S4pVdjwHp8ehA31whvhU+6gHzpSSN6AJL0uIeax3uisvKH9zGudu5b1QybqAAl5fwDXcEVqhUXa0aiUIryFMnFFsXAwbw4LamVS5egVG3tC9SuG/bwkMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140556; c=relaxed/simple;
	bh=jfx2y0iC3ZtsTGMmvAf+6QOeOCxrZ9wNE/78rTaEAJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXmnQxSXXfT6GMTHYUQYQncOfVZOfN6V90CQaCs+/b+hECtMZoQ95YJlrev45TNqmvutaQFWGhddinRCPzBBs2TiSFmIovYxZJhztVvxfc1I7Y1qekJN1bznF36NmXvWVSOi5us30GrefyuHhdhGblwNDKCW4yOe5p7U31il2+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aFHaUJxN; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aFHaUJxN"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db425c9050so7655ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789140555; cv=none;
        d=google.com; s=arc-20260327;
        b=i3IJLu4BiGprXqNBLPzAyyeEBtjQDcyou3EF2wLTT+Toj/9Wu/obHgfMe2tQSFIETH
         jWXoGBtT6AFWTyDYFMUYrdQenVLv31UJgn33gbEnXQLl9+K0TQq152tqnVazerT0iWC1
         cnDQayIuZHjiFZuSm0u78uTLq42jDft4Or9XiAjTkWIq6LmDOlEA6n6UonGIpkq2evpg
         u0uXq408WZZ7rQhyDc4a3XiXkoP5UHQPEmA4WAdrXnKEPZCCC2jwdwhXh3p8BeBwUll+
         kgntLmGCCT1gVrc6UIF+9eX3dVt8iJXj9EIxD2t4HBedT3ll+IREvqTjqUqfhnYJxwH6
         a71g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ieZSr1jewI5FWfd0j2yvVPw+/irsVxhxkoljeQXYX58=;
        fh=XQ0bVM0ulC8w1FAXTPBeGxUodqtUDXX6JBLZa/zeWAs=;
        b=jtfPWsKOi6j4kM/ksMLkTbC2mKmBa+phyXYbeToFVoDmMQDjsDW5w96eL5mCYf8Slf
         ARJ0UxuYXXUOa2V80ZjMaykLs3IUNMd6Pc9GlLWZnmu1gLlbEm1P4da34Xz3HKrhkVLa
         b7+B6MVZKBvVe4BxtaomAlfWkbPAs2vAm3sFGEOrOailwBR/6Zka8k7f53GTk2KiJpUB
         Vgr7HBssnBklQN1lxAG98CLLRqx2Dz2B+6SpxNwJ8AS38dqRkNg438k4Nes+dSyUkw+p
         gSc537SCDFuBL8B3SiuY6mNNz1xoKYl5X9p/bBhzu4m3NQKNoKiuYN1wIL8GEJ1fAfi+
         FFSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789140555; x=1789745355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ieZSr1jewI5FWfd0j2yvVPw+/irsVxhxkoljeQXYX58=;
        b=aFHaUJxNRuy/IIlcVPe4d24CfwZ0LHLNcIlfR2N7kYoRh+5x5KEkxTQtPo2DmTAiH5
         2G2pqYOy/zKTP2JqRBdUiahCez06C79sx5RRoKBxFcREAOE+wOMlFPzodAsxrqXtTZHc
         HUD231AQ02JS0gFvy6CmuXm11q65I4h2fuB1eMAhj59gPPbZPOGMy8bWS8Z1emaVYhHn
         IRgYk1u0vIf0G/h650/c6LTldIRigBCatAm00nkBdpc9dCVTvrnJ3Z5XI0Qah0BTmMck
         clreL5ec6KZDv9AD+/AfE0/BXaI3iikkcOCME5JQ3UZla0s/RlUl+zhUnwTrOequu1X6
         VS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140555; x=1789745355;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieZSr1jewI5FWfd0j2yvVPw+/irsVxhxkoljeQXYX58=;
        b=JNuCeZIIzH0tc7bYS/ZVdieO8BmA+2yFaI0SNP00g2IorKEv5BZthmtXwmQiS2yYTQ
         08n74BYtroGO3yw8Q8IvJ+WLUw9SbBNSk1PnglblVtmYMYHwVcvUA+6cotYLlnZw/J/H
         gRjQpHLr78guCL4Oi0KLXpWPPNYwpQ6lmx0LGAbUV3GEbK1QjUGW2bOzg5C6WQRTDEye
         RfG+Y4BsFZgt9CTc7q6lO+jwieU4kDkibqLusaQVIJUdVFRMwsTfp7rpH2GFQDIrXQ+7
         3LFg2s89yTz+hMGz3I9rnBzPysrjlV9e5XYlm/QAOzes6fSjUqNyIiEbgr6aTMApqP6y
         te6g==
X-Forwarded-Encrypted: i=1; AKwUvBwmO2ypP/V9g1ElyiNEL16wErqexg6UeaGBkce5VUcc2X1iTDyUD+WYdmddk31iaSque9++zS5fBRiiMT8=@vger.kernel.org
X-Gm-Message-State: AFuF++mQyF1EBMZsp25G7rl1tG7l3zAP47mFhgyc8MSAJvcwOa8+bSyb
	CAa259XOxXBPy5b9+tQhwY7g/X/5qxl8ObnGvYOWBVs30pR0nTmPdDPot6Kfc5sI/bpCTybiNM+
	2ys77Jcz4+JltbVjSz5fNvIuhhFvKRS22ovqSoSyv
X-Gm-Gg: AYBFou2PgIG9QlB374s0X8i0Z7jy0dxsLZbW2/M2VH60oZyKK4dwNFPDNqGByW6mPyu
	BFso1t6EU/rPcpN/pFI1pSeY60SBI+OJS5d4TXR3Zb4b9T7TTk39+/AJOCwSV2lUNtzrA8RwV8Q
	MbOypTU9lmbCgqClrND5WvoggkSFarF8m+qOKOqv0UT+q9KjWP9fpzLst4zR0xZkjE2mSJSfSBG
	n8yLeLwX2YWVo70401PGaIo09LkHKWVjDtc/sGtf9sjFOYT48S9gBRkRCpzC1M4+sYrx6TK2sW8
	Y+GFIkUfZnGSrU4Sbb/KmUUwZxRLgEuaC8T7dg4V6RPyEIoeEpmhYvE+M5hNunolbE4x5CSf+3m
	AKe/kcObEj00Jgsw3YVGlb1vKtH1EQtgyVnntlN/fzBK5QGkdjzE7
X-Received: by 2002:a17:902:ce02:b0:2c9:bd54:cf with SMTP id
 d9443c01a7336-2dd2c93436amr8173365ad.4.1789140554293; Fri, 11 Sep 2026
 08:29:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG48ez26PrUOb8er9TP1gWLsqVLU8TEDr+1Zs25fgH0++=zhUQ@mail.gmail.com>
 <20260911083639.GX776954@noisy.programming.kicks-ass.net> <20260911090447.GT788244@noisy.programming.kicks-ass.net>
 <87cxukypiz.ffs@fw13>
In-Reply-To: <87cxukypiz.ffs@fw13>
From: Jann Horn <jannh@google.com>
Date: Fri, 11 Sep 2026 17:28:37 +0200
X-Gm-Features: AcwNN1VHXbW7trva82dKAEcHEXylniAuUorhr40GL6tqj_-RU5_k7l1vZicd1ao
Message-ID: <CAG48ez3Rsgzva+45hNrBjxwEONvNrDdq8W7vyzuhkXfehBHc4w@mail.gmail.com>
Subject: Re: [BUG] futex: scheduling-while-atomic because nested vfork can
 break guard(private_hash)
To: Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>
Cc: Hyunwoo Kim <imv4bel@gmail.com>, Ingo Molnar <mingo@redhat.com>, 
	Darren Hart <dvhart@infradead.org>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	kernel list <linux-kernel@vger.kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 1:51=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
> On Fri, Sep 11 2026 at 11:04, Peter Zijlstra wrote:
> > Per commit: ee9dce44362b ("futex: Drop CLONE_THREAD requirement for pri=
vate default hash alloc")
> > the reason for excluding vfork() was performance and thinking this
> > would/could not matter, which you've proven to be clearly false.
> >
> > Thomas?
>
> I don't remember why we excluded VFORK in the first place. Sebastian?

That was introduced in commit ee9dce44362b ("futex: Drop CLONE_THREAD
requirement for private default hash alloc"), and the commit message
says:

| Loosen the check to cover any CLONE_VM clone, except vfork().  Excluding
| vfork keeps the existing paths untouched (no overhead), and we can't
| race in the first place: either the parent is suspended and the child
| runs alone, or mm->futex_ref is already allocated from an earlier
| CLONE_VM.

So I think that was purely supposed to be a performance optimization
for single-threaded processes that do vfork()+exec()?
