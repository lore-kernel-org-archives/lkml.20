Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793042548;
	b=SzM7EwynN8SDtC0Xr28rKIbQgIjSYQZl3qaUP1aeyDs1WEU3Rw458bWO9BsFKZ+kJCDJ
	 qA8Qzdv/EkWp8ECLU4PNbk4Ds8FzgT7Yk6Lkakki0ijmUYY0SSZP4eNb5xuGUcGDFGZ61
	 t9vZVLONFOJHtijlnt1qk1XnCsM/EbJkpEmy3LVAhA4kc59cIU6FEUZIMZcx8IsVVg76t
	 OAWJekyw68cUA+nhHxYSVU+M9IeGfRwgBHj8sjLM2St4ZrxM39s5TDdpdS/kn0hnOeVJe
	 wlXntNWDnmiAYKpLMW7sjevfySfrzB9zTZ3KcVTFiFDctcmc49P8D/j2+eLjIpY7hiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xwTAuUAToCB+PtpxcqmiSYPvP1xLCOZOzG4SnyhT+Oc=;
	b=TCcgHV+Z+wbkttcNHF1hP4WS2dLrM9NI+EBE31GdFZQf6S2O+kA9hNzeHutN4FJGfGlA
	 so6HVd9wqL3kkAH6nb0Lpy6UrybziLc5/i4+EhgGZrqKC6Nd9L2lAplZv4mQenkETLK97
	 5wArDV6p/bOtMkaanJld7rxLgDYfPLWoNENvygsM5CAO2QMr2rI0FLQLNt1QeqRIvpA6h
	 pDCY1oWZjtkmibd5BMdcEEFFnTUD3ZumRlhwdQM5oE09XVkh7+wFF9rnSNdI7y12rNvJx
	 hVswX5GJxos+0csvaxbQDg0pCDz/YhWleBbJTmESRzBT8chKnh70V6tUVFVb0mPQKdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bdo9L8xn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3E2606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC3E2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bdo9L8xn
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9d7791b00so21498965ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:22:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793042547; cv=none;
        d=google.com; s=arc-20260327;
        b=GLWlR1kUj/WgkA4lA7HaZyq8qWadVDTwGS1ecR/YbNZBQtA5t5gQzQTFFKQ5RQUuPR
         kp6o3i69epx0K9nOrEqFEOJxON0H5oaAjfZ6LZOVoXrWlZI7J1aNQVzm9/gQ5b8cmWvy
         6hfMfo15H9XahckIUj/i6ck16SjCc87OwbVoNTfKbmph/pn2ajgm4ezwb4vWlGwjztgb
         g6UP4FuASCzzPMeytHb8fl0pztY8qLVb6Yz4ouVUlIIseYjfvbjD3xJNVQOx8PsDa1fU
         L3J/21GuxGwhdZAVOJy97SYB7YNooTOoNTO0PquagpLMgcTjMfEoeZNDeKL0pqLbEDrY
         tc2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xwTAuUAToCB+PtpxcqmiSYPvP1xLCOZOzG4SnyhT+Oc=;
        fh=eprBeVGOuCmAeQARpcpt2XJvcJmT4t8fij/Z+Ct1Xgc=;
        b=BT1i32OBnPzaD3+Oq3tL3/GsWpagPJfwkHdKmmQ60+YWSB+0FtcSuz6n1D+OSi8AQT
         z5GgTtTxsyzBcZYjA38pr1IBWoHpP299RaDu6+KvIETKnTUFnWxSD+4pG3Wc6K2bcqb0
         i2wEElTXwOSa2mVjk43mu8sf69ISVjHz9tHCVUjsCIL9sFEAsnu567WT3jwWtETaQsso
         ai4rRkB+fh3uCUrcRIvv7s/ab8vh7AyDvHT0EHQH7J3Ed2EM4/IcyMZKVJiwIOXX7wak
         IMwnD8+iM9teWBTkdQ0NhAIq33yAlNylX8rG5okfUIlQ/ln8j6lSBZGaV+dMJo9QfCvG
         rn0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793042547; x=1793647347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xwTAuUAToCB+PtpxcqmiSYPvP1xLCOZOzG4SnyhT+Oc=;
        b=bdo9L8xnCaTnoVnTYyRwdU0hXn1FeG4472V1eMuVO30LmRUV+eGIvfvVYZD1gXCOO9
         BhJVg0rsk4JDnMq9USWnbNMs1x0vf0WnQOyTIpmXY5eMVzr3EgD5jfViggqNu6zXOb67
         LRUg13+1Fpqtoyo8ww04m2Cc2IMXAslAh67fzPKcM+fcSO0OrIhlQt0FYgTajnPYD6E3
         1HaAW3R8fB+zyC9wyJdsbWpfUwBBcfJ91J5uJjhpaYAOvmKxfkwrgkunwbgUMDuC6b96
         XohzLstHtzgb5AuUqBmcsDGcMmPcwVQDf/ZHnVf3NAtZmsjKU+QQysF9EFy8eIxK7E0X
         YrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042547; x=1793647347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xwTAuUAToCB+PtpxcqmiSYPvP1xLCOZOzG4SnyhT+Oc=;
        b=TeTfOn1+IlO0zVKlyyxadxOODQ+Hi7FKkIwcKdonRpfJ4ndy2nl5AJKZyV+o2VAA1E
         g/46LsTd+0Y990cKdL1JTcCgOskGfELKyuS1Tlly9XRfTXpoun5CfDEx7FfwxTaTgBax
         bq5YGwfleUrfJA9oDzLH+HJRpCVlpwBajkYqUF1oHa58HpZ4WqDCUn8XGczp4iV+7Tvy
         1KU8hLVo/48OTywwQQXGyzkLeCgLGTiQ6/hRXnS1O3Yl5vTrA1QKWTlMBBkRnjXYq7ga
         hs0NYiTSwl510n1I7Qv4TZQyqbEI39weK2Aa+sJXJcXHPkQB9+CL7Y4FRnVZNLsZSbj+
         Ovew==
X-Forwarded-Encrypted: i=1; AKwUvBw6rVvus9iJfgdRGAIOfVOBp1RG5DVTpUR6yV6t6QHHLUbgV/GhFGy9E4VPZlPlR9dAWO6cAQZ8UZupvxg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYXVhkEoxQI5QB3nETDoDsxrRtrzK/N9dAC+xr2sEB9/u2MmKk
	eMbETGjZ3I8FZL6zsBoUOoNbHh1Cc6wHMuPsv1r42Y9fcgsV0D62aAM3njlGqCmhvAQAZaXvphK
	Kz7HCZyVynqPK9DNTtheq2Ubqqf9cwRc=
X-Gm-Gg: AYBFou1Hv5+oYSp6GkvPM12/FdNriPotaWeB8qn8iN2b/a9gSj/16pVap56k6503MB0
	mtZyBzW44yZJX/77hParO+wZy9gFOeQRNzH1cbWL2pblbflOm+zguhmhZsekCo6XrKsxD8B4++7
	hkwSsrZj725oQM7e2C5IrOOjbLeJTkgvrSkVYMed+SWIsrTK3hBic50NAHby55j35R+9VC7BG09
	qYcdDD+0lMs4JMZOnJYzO8nqX/oyD/N32HRB6ePz5bUuyb/oweyWsWKN5uXgnV0nY9+MSzTwYkK
	lJgPXVmg9JPuf/cOagqlwht6XBQnIgV1ygkVxFlH5j0lFwbPCk8Wo/JUCUmcs3ighNWOIm3F3Uv
	lHHqsiw4F1GAfyNBs854cCAWOtPnpTpHWnzI9tg2p+f4bE05zRBXm
X-Received: by 2002:a17:902:ce8d:b0:2e5:a355:56e4 with SMTP id
 d9443c01a7336-2ea9c5e30a0mr60160345ad.11.1793042547045; Mon, 26 Oct 2026
 12:22:27 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025142412.112216-1-pmazzini@gmail.com> <474d4ed0-b011-49dd-853e-697448382a0e@arm.com>
In-Reply-To: <474d4ed0-b011-49dd-853e-697448382a0e@arm.com>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 26 Oct 2026 19:22:17 +0000
X-Gm-Features: AclHuK8V-ReT1uOg9VTcgyQYzBbm5tikcDUgJYabpKKgd9T74yNLPiBsMiogtYQ
Message-ID: <CAAxh=jupBYZsadg09ig1v+3OkfjLAf+Hd9NwoR_D=te9XKxkTw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pinctrl: sunxi: number the IRQ banks from the
 first one that has IRQs
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

Thanks, understood. I will wait for proper reviews and for -rc1 before
posting again.

Pablo

On Mon, Oct 26, 2026 at 4:42=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi Pablo,
>
> just some heads up about process:
> - Please do not repost that quickly! The kernel doc says to wait at
> least a day, but that's only the lower limit, in case the series is
> almost ready and there were only minor comments from real(!) reviewers.
> I would wait for a couple of days, after you got some proper reviews.
> The reason is that reviews (by humans) take time, and it's not like
> people are bored waiting for some patches to look at. So they might be
> interrupted by something or need to do some checks and research. It's
> pretty bad if their effort is ambushed by a new revision, which now
> means they need to start over.
> - Please do not repost just because Sashiko said something. Wait for a
> proper review. It's probably a good idea to acknowledge the comment, but
> don't just re-post then.
> - Try to avoid posting inside the merge window. Depending on the
> subsystem and maintainer, your posts might just be ignored, because they
> might be busy fixing up conflicts. But more importantly: you are missing
> the correct base: you should always base your patches on an -rc1, unless
> being told otherwise explicitly. And since -rc1 won't be out till
> Sunday, this is not a good timing.
>
> I will comment on the patch set separately.
>
> Cheers,
> Andre
>
>
> On 10/25/26 15:24, Pablo Mazzini wrote:
> > The DT pinctrl helper numbers the IRQ banks from PA, even when PA has
> > none. The A523 got a DT interrupt for its unimplemented PA bank to work
> > around that, the A733 would need the same, and on both PK is written
> > past the end of irq_array.
> >
> > Number the IRQ banks like the static drivers do, with irq_bank_map for
> > the A523 and A733, and drop the PA interrupt from the binding and the
> > A523 DT. The B288 (IRQ banks on PB, PD, PF and PG) then needs no
> > made-up interrupt.
> >
> > v3:
> > - apply irq_bank_map to the A733 register layout too (Sashiko)
> >
> > v2:
> > - give the A523 and A733 an irq_bank_map, and drop the PA interrupt
> >    from the binding and the A523 DT
> >
> > Pablo Mazzini (3):
> >    pinctrl: sunxi: dt: number the IRQ banks from the first one that has
> >      IRQs
> >    dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented ban=
k
> >    arm64: dts: allwinner: a523: drop the PA GPIO interrupt
> >
> >   .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++---=
-
> >   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 3 +--
> >   drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c               | 2 +-
> >   drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c               | 5 ++++-
> >   drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c                  | 8 +++----=
-
> >   drivers/pinctrl/sunxi/pinctrl-sunxi.h                     | 7 ++++---
> >   6 files changed, 17 insertions(+), 16 deletions(-)
> >
> >
> > base-commit: 4f0dbdbdb3ad122e8bbfb1d722fd584bac7124db
>
