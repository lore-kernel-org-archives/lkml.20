Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209F22D1F44
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 23:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476592; cv=pass; b=Vxx++b7god2sApi5wxL7toyWQhWRrZve+vPvdul72KMgeVgd8Pj5Rfv5lRKVkqaqTJEGDgw/2rXSqU+hHT8TmAuy0W2cnoYMEZVzFmz8XMWQ3aH9ZbaJyvXDZOZy2ziTP7VAt+a7qzJAIL4qHhMUMF9NMROUM3VOaq4EDXuVyEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476592; c=relaxed/simple;
	bh=QRcTrIRkPc76nKMQGJfJCZpkwayoe5Ftov1SJXwspyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nIWMTdVq1umlAFL8p714XJlcVrgfuu72EPumRF7ZiQGfoD8TENx5MSfBLySYRXD7io4oQzfyzpmRYXlHbW35XSJJ8hrQ40DRObMhynyRZ5O2AL1bVg1ACPFq7EDQojfx6O2NGbra/FTnyKBkDv0oiqVHm6tEifu8nPYxph7C2Jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYiDiGiy; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYiDiGiy"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38f57e312ecso56723a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 16:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788476590; cv=none;
        d=google.com; s=arc-20260327;
        b=I/diYXV0U4H/DmgCM965EV3qB+2S5mvdEMq9wY5drKYExX+Do0JoAFu6KOaPM4WIL0
         FsmZ8iH77hr6KvxBjlKqc5UqoKPWKfiZZNKyIxfcSrb08elGOHpXrsNuxJ4wlVW0lxrw
         Kc8gbRYegxcUju1JoNN2HS7uOIaO/+pe6uUg2dSRyYDcKzACJPaknGdyB1lwHv16y+70
         Lvzf77zEz0B2pFzjtZAch2Ukciv8ISNgOficB2mkf/GBs9jjepNbJifXJhVvZZ0bcNbZ
         +manJ4Tp7r9H9gFnxjlEqCquutAtyePfsUnyHPNxZJaX17YpVjvYwlC/NgPlGz2F1u3+
         iuDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+VvOmoUY3pOG0oRbxMRVklnBA829yBpdV3DpPX62UcY=;
        fh=FyFDZSCj+mz2/bMXwbWBWipape1eLLJeMw3ssLXRoMg=;
        b=sC7pG97JhyYTqaLULnsCtSpBks4MjNPTVng405mA6P5Lvs5yZO8gW3+TcfKISMbMxT
         AyJm9tSZm9LZhIhmRd9B2RA+0zVBtnBaMeUUuSUYxAY3Z8ZVgxU5Ee/mQzZAFWHdRgRq
         uJBZ0kAZlwveIIyRs8PSYSrRQkpd6pNUBoqu469MRNx8zoTddsBMxkwUm7+Ol8OSKztF
         0zWQe7MZD7GrxOQx1r/uTKSrA/P7FpZyl4xo692Zl0Tpqv9ntgkwzeenq4Bp2SA42qm9
         T3GsAV7yO+3GkRRxCRQ6175VtA8s1qO2mKzE/TdeUuC3KFdSaGtC2gawVJj9/YojHSiQ
         rtqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788476590; x=1789081390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+VvOmoUY3pOG0oRbxMRVklnBA829yBpdV3DpPX62UcY=;
        b=TYiDiGiyOOVwJi0yRmvmfVWax+2NZuimFVsXmds3CYj6JbwYCD5SsXRQeVHscGoYR9
         //DtL6C3+5VOpAqYOiwQjYqNk25aZhOPGEJSXQfUPpEkhjd2mZWhRxjgQJ21S/a/VJz4
         lH2R8/04DGJ7BWfGvj2WLH9y6rHJFtCFyL0PkaE4E0RqNf+w6jdfm9uH+BKmeb+Gcwkv
         COVudCoom4nhg9w/lHdZR/5RuHoWutHNN4FJ4lDB6uv8OgIXVgKcalwoncl+T3fovEOa
         3mURvhqJK4nQ/M+b/qTrjjFUvqNQ+aXMdai6J/M5TG3WxxfiuPDbmeTD710lvEe7Oerg
         1FAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476590; x=1789081390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+VvOmoUY3pOG0oRbxMRVklnBA829yBpdV3DpPX62UcY=;
        b=T7lApl7aMv6wN9TcxIwA3Ek/G8ghpT2Mqt8Y13E2xHKuQN48QXRFIu/w703eQZKsgm
         sFjTbGKJzFxnKSkIV+KiyzoiQ7sRRHR2WiGfxbIfZh9E0elFJ90vH1cWPgEhQhzJGlJ4
         2x1iwR4cg/cudj2P7NjRVV6ho8FR49Z//1LlVJsiBEGgdnWGUC4R70SXJCaeqERPgDjx
         jSgjOOd0SgFrRqX5WhOOrgxW206ciNYDUVJXUxqANcK6DsAySJNTHMFe/EvakMR+CPeV
         UmvgD1lo0nPnLqxvutV5BNiLHyjDYnBgynD5o0V/TMs3WftEpmNO4ybk8C+K+G5p2yNl
         eddA==
X-Forwarded-Encrypted: i=1; AKwUvBwvjPpcyjVzOJ9ff1DMlvRr+Kzg5Zl94hB+Jn2LQIbffMBfcBIgK4089dXWi+0aF56YpvzAY9rt38a2dE8=@vger.kernel.org
X-Gm-Message-State: AFuF++lIbh6yIIjeEllX+fCDhq879+YMKw8/hDWZ3TmiAagB9b4fVN+R
	8ZodRHlLDxFyuPURnEtMZ4sMNTrAY5YTrKjuCArPuUdG9IrqP5lcELGcEnk30rMiOz9DivsCR/7
	kZPbtz7AGN4Q2UysDHqI4MtdKgfezOptwB7Wq6cw=
X-Gm-Gg: AYBFou1OC+pgY0+yeMu1NxNvmQzaAwVnSGHR3LBM4hM1OXsaSSNVZix3QruS5DkTox6
	KHXb4cLP/AMoJjn6S+14wr8sgN5k7OTcwLGfvoF+suagfL9GULf8OoIW2qAXN5Z7DozjB2zwcXS
	7tNHFO+Dh3SEHr8HLd68PP+s1vTPkEpGmnW8bAbbq8L9h0tJpZ0IuaJWZac1sxhY3S7HtfNkhyM
	kNTkdV2SLkp967zuazLNAbUUBsKxWgXU4duxN2one2/j0bSlnfWXSIrHMqAIxzl0+YwUg9sPZ/G
	Su7Cb2TySADUQHU8szKI3XhOi5QozTPC1s12cKD+IkNJ4QWL6pEpqHzb5lRY5YuYo6n9xBqGsWJ
	/1xarZoefOeFPP297lS7c624c7QVEvgzPHLn9N6haNEUJQ3mGD7ItDE+UGC2L
X-Received: by 2002:a17:90b:1dc8:b0:38f:aa76:88b with SMTP id
 98e67ed59e1d1-39b2666a909mr1453360a91.4.1788476589998; Thu, 03 Sep 2026
 16:03:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202609020931.48FF902461@keescook> <CAHk-=whZQzNuBZdV1b1TBxRf+asBGtvnC=Ggu755GaOg_TYXgw@mail.gmail.com>
 <202609021647.3F67F66B@keescook>
In-Reply-To: <202609021647.3F67F66B@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Sep 2026 01:02:57 +0200
X-Gm-Features: AcwNN1W1xg_jx16NEQaty4kKHbwyYF4WaC8_c8QIeLnJNCxuQZ7TvF0iqofbTcI
Message-ID: <CANiq72=7msFj95ZYf5u5MfODci3J__KRxYEjZRL5Jj4gVyssLQ@mail.gmail.com>
Subject: Re: [GIT PULL] hardening fix for v7.3-rc2
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 1:49=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> I have a fix for it with Rust, and it'll be in -next after -rc2 is out.
> We still have real-world users that depend on randstruct, so I'd like to
> continue to make breakage visible via all*config builds, etc.

Do you mean the ones we discussed in the past like e.g. my

  https://lore.kernel.org/rust-for-linux/20260323130224.165738-1-ojeda@kern=
el.org/

or your

  https://lore.kernel.org/rust-for-linux/202512092319.ECBB8613@keescook/

or something else?

Cheers,
Miguel
