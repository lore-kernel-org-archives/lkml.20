Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F5C4E80BD
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611125; cv=pass; b=jmPPZoALTXi7FoSjp/5T/L0N67sRxt5hx249PWEgN0PubycPcMTV93nBt6xXhSnSG/yaU6ERlJ5MH06PfpY11j4JEWQRp0BVEt0HJnN78p6p4srjvXSxH5vVIxpEX9ZFzP10lQrRnveE0i0iVebWdLVdBCFy3agNvX08tt9oqBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611125; c=relaxed/simple;
	bh=RdJqioSCXAx+Y+b19ETks14A33wmF1LPgoEw9WF6cZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mighyQJblZ/x1QX2tLOG4HT/E+L9jooYF94PJ/UMii/geLr8cI2BgPRPz0eVk10gEacOhrwWwsl8nao/DHISW3FvpCn2w9Hr9tV8jnX8btdYGkCPw20M/xWMy4OhGjI7Io7Hsf7oZwVM/F47m50xIfbxfux6XGL/id8VatpgfNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npJbl+0D; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npJbl+0D"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c264788fd58so465396866b.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:58:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790611121; cv=none;
        d=google.com; s=arc-20260327;
        b=b7mEAq7YrD26PFnc/+Sm7mrda1AK4cmvoA+LAESvHPQAYjIP8TS8zoJZIAd4TuRx/7
         4woXIcNEGVpQWfOa5EvZ1bvpC5VFmxpj6oy9RWKfA5sfd9WzranrjcX96zlvlSG8Q/jl
         ab7KR22yL6uTK3xiasHFkJTae9ajMMB/QMzg5pX6TOI2Z1fU/HOVqNLjWmbgE5pfGgHz
         Y69x44unpbCWks0kkOUzzxOcNWP2SiToIO7SPSut5ROWXwDK6FFlMHRUtljLFPGVi6Fz
         7M2x5Cm0f267fYol+1XGTpqzRwl1N90ZZ0ke6qjYH2tow70d/EC2BChsxqIf/itU/HzS
         K6zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RdJqioSCXAx+Y+b19ETks14A33wmF1LPgoEw9WF6cZw=;
        fh=dmovygkLyubIAyUS3dpBm5mMLykCuy7Gvkjls9a9gj0=;
        b=DY0y6KZJKYW+XXteSIrQkn9tZqWGCUuaKErLTjrZlwuX0/mRgdMS3T4R+T+ggRxldE
         VUI8FIZkJ5q42GLBKkZ5o8Mn7n0xQR2SfRjG8xWjriXSgQP/sgFoamR0nCP5lVmsE3Lk
         9vbj6tkmBRUCp5tfVL/DCQ6p9V3RBIxMbO0Zd/7Bts9RDeysFWe4YB4lfe7sdvqf/RsP
         XyEfUpKJR7b/aHoSnSmpYgmlm8DL9u41ln5tJfw0f2dQpCAOEXgyG1AfprBdXPfkXbuL
         /0lDDScnqMJtejeLM3y9KpB5z3Fg3hwKoxrBLvW3svDTEXhEksFr2yG/eivEcrc+eV8l
         c++Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790611121; x=1791215921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RdJqioSCXAx+Y+b19ETks14A33wmF1LPgoEw9WF6cZw=;
        b=npJbl+0DtGQolO3URSvafdY9yEV1RBqN5+NrZVZwrYFplstKglL1ITtLMpqrfsH8Z4
         NJ1aD9eHwkks25QtvRftrlkAnz5xVHwlU2nsAKpqMTMQkOatgYJPMsLQYp8mLtOIaNzm
         Rl8Ao2N5JEfxNkwhjJ7quUMH+TKDgqW03dGaLkBKgWwSlZ+gxBX1Kep0ceOa4ruDop1v
         uJqqe0lm56x13w+y6NoMnYt9F34wnqdiN0CZd0661YhW7b8wZUuDEqk5w1AKVVu1mtlC
         nGHFncOYXiCRPonCxlVqTuYFes+55DKrtWwBbkHeLr2zHIvdUjTw2TtEcWDaPxGbzW2m
         8+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790611121; x=1791215921;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RdJqioSCXAx+Y+b19ETks14A33wmF1LPgoEw9WF6cZw=;
        b=FodJK0Lxf5XLsEe22IQsWeKWOa7uvIX2qwCJAvxQuhu5pz2pScs3puqIDnNJ8yd4wl
         ex0orkED1LotkBPXU3frIe1o6ktRBBMsvA7Ka2A/cYIQ62rpL++Hwi5JFRas+1aEoAlc
         oYYYyTD9MyuzoRK++s9dlk9ndk58OvvIQRwY4LzC6riDThwT2F1nS6Z4A1w3lh4i1t96
         Z6QGBUCMgl8lMChufuO7Ugtw+PrkaC59u4LxjlnVfmw7+deTu2x83duW8Lm+oY/e2Npq
         kSOnr9rfUlKUUpbSywVialwbxvsKsxzm5iioxYXJa5mwkEZFb0rHdlnUfBR87aF1PJJ/
         TTAw==
X-Forwarded-Encrypted: i=1; AKwUvBwdr6dSm6VxQsIlxpD46HqaydiZBKy6fX39v3ZCWLePAMGEnzM1m6CROjb0EQZ56tKGct8N3hY0LbgXzeg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpFUy65ues9rqAoaot0P1JfMCEYm8+6Ir0njjhb6WeCTFr8Pkm
	M+AfA+0KqpZ1eV6CbsIizbH0WpguI3Ss/ovsicwoLm//Tw9q8UBIXKCivr9dseRH6XmwwsmPkqD
	EokuMhSeEL4kcvkMR68NB3Wa3Q68ghdw=
X-Gm-Gg: AYBFou1nY+0dKnPUp0EYRNS7300e+ZC9Xzh0ijzWIs/CfET4U1os0Cob517evxPx7Ll
	eHMGJsSu9LwK0AP2Cwn7TBe/p8VOikumRkl/nnR/MOFoFP49msZe0YEHrL7PSB7Hb80L/46xvYS
	OcMVfufhSAaR+LVnZxUP7TONkAClLN2lrkFmGg8l4efLb/0DXBHa9Sdma9etVmyvbczi9Foff0H
	yvAUCRBa7ZDikMD1qtWhzg0BM/8pw15uqCvn5oWkgR1qRHHuQnbwqGlwYHqYxTswijnZhpTHCg9
	fXzj7quab28e1nsYEQsVp9eD2jTHfbRRZyxexIShFG0obAIEdf2cqrIeK81lgChHH9h2mBiZ2Ya
	+bM7GNiHU4zkbi4q24HrBYJnTwfzGPLRfyRKVj8MtL1vDibUaFz8qLAngUii1ETmutTsUg4jXu3
	aGmKyLM9TMOvKnVpEPZZ5UAvmhhamz3ZJcNLUhnyv4KQ==
X-Received: by 2002:a17:906:c102:b0:c25:64ea:4d70 with SMTP id
 a640c23a62f3a-c2ae97a023bmr784804966b.1.1790611121053; Mon, 28 Sep 2026
 08:58:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927220559.24169-1-jwuerz@gmail.com> <20260927220559.24169-3-jwuerz@gmail.com>
 <arovrVYSgU64DM5o@ashevche-desk.local> <20260928152901.69000-1-jwuerz@gmail.com>
In-Reply-To: <20260928152901.69000-1-jwuerz@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Sep 2026 18:58:03 +0300
X-Gm-Features: AclHuK9Y-mQrpqdnPfxDKMs0buPBbsakfcCbWxtZfim6Ik9ewJ3k4lJ6Az-T-QY
Message-ID: <CAHp75Vc3M+57123mya20i9LNCkcveVbMFj2m=H-BB2c3YD0ZLg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] iio: imu: st_lsm6dsx: Add ACPI ID SMOCF05 for LSM6DS3TR-C
To: Jared Wuerzburger <jwuerz@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Jonathan Cameron <jic23@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Samuel Dionne-Riel <samuel@dionne-riel.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 6:29=E2=80=AFPM Jared Wuerzburger <jwuerz@gmail.com=
> wrote:
>
> On Mon, Sep 28, 2026 at 12:13:17PM +0300, Andy Shevchenko wrote:
> > On Sun, Sep 27, 2026 at 05:05:59PM -0500, Jared Wuerzburger wrote:

...

> > > Both I2C resources describe the same address, and the driver uses the
> > > first one. The vendor-specific SLA0/SLG0 mount matrices are not parse=
d
> > > here; the accelerometer orientation is handled in userspace through
> > > the systemd hwdb, as for SMOCF00.
> >
> > Hmm... But is that wrong? I mean does ACPI provide the correct data in =
mount
> > matrix?
>
> Good question, and it made me check more carefully: X and Y are right,
> Z isn't. SLA0 (-1 0 0; 0 -1 0; 0 0 -1) matches the Windows sensor
> convention, which reports the gravity vector (Z =3D -1g with the screen
> facing up). SLG0 being identity fits that: SLA0's negation is a sign
> convention, not a mounting rotation. With it applied via hwdb,
> auto-rotation on my V3 is correct (that only depends on the X and Y
> signs), but iio-sensor-proxy reports the tilt inverted: "tilted-down"
> with the screen leaning back. With -1 0 0; 0 -1 0; 0 0 1, a plain
> 180 degree rotation about Z, orientation and tilt are both right. That
> means the systemd hwdb entry that went in today [1] has the wrong Z
> sign; the fix is here [2].
>
> So the firmware values can't be used as a mount matrix as they are;
> reading SLA0 like ROTM, as v2 did, would have exported the same wrong
> Z. That's one more reason I'd keep this series to the ID and leave the
> orientation to hwdb, as was done for SMOCF00. If you'd still like the
> firmware data used in the driver, I'm happy to look at it as a
> follow-up, but it would need translating from the Windows convention
> rather than usingit as a mount matrix.

For the starter just summarize above in the commit message in v4. This
will justify usage of hwdb (IIUC the case).

> [1] https://github.com/systemd/systemd/pull/43935
> [2] https://github.com/systemd/systemd/pull/43941

--=20
With Best Regards,
Andy Shevchenko
