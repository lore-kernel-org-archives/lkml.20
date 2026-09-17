Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC8838E121
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669709; cv=pass; b=p9lbYo+JchVR4D0GzzZrgtlZ6WvVG2iE1Iic0WEtFzd8CoiJDPAxOtzggFxF10obcFf3gPWa8gS9QOYA7LOk98nZeGC+TGNUExyKvKlPjD72m2ERvETjUCu+EvqYqT6VnlP0ZbdBYfO/40ON6dzKrN94aTNIyrbWEwnV5DN7GXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669709; c=relaxed/simple;
	bh=gbG9VIZ5l8GhkgsEXdx8QecWG9sDjmGHKbYfhOPZZrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UA7c0OTLCLTKp4LltnvlyX2A5ojm839PR3a7Kqq9zJJaDC4SdvB1xj0V8LnTEOiOFAIDOaH8S7+xbJMGPXktYtMYLETZihrxo/WJJgTHhRpOps87V4zYWABdJriWt+7FqXfz9NaTopmQDXGqZYr7OtcWDMQwAhZxuY7DEeyoAbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbgxT7tp; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbgxT7tp"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c264788fd58so198944766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:28:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789669706; cv=none;
        d=google.com; s=arc-20260327;
        b=NHsSx4JqfN6cCdMwGBsKVanRw6AYbDjjfTmwI7WKqfEsHcsxbWvy1us2gdTXrrg9IS
         eF0j1l9TonUlh1M4u//nXb7z7ccOXG9R17gmEO+a6tinfDa4BExvSWAgc98yXM9lvIDE
         bjcJ8ZARl88znUDY7aTATeeZEE6nLaCBQpoCjeIjgM0DTIw7eYNse/tbWxEJmzzw3FCp
         N8bpsGmxuPFpp/8+7/+cW0a25GkYNniazynt7xQmEwoxpfX5hH8YyflhVLWQQoxMKlYo
         xwaltYh8zwubPx+hcTGxxC8e8ABDtr4a/ZD9WQuEqQodXMCxD6IGAqaRONCD8EUg3UyP
         NSqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gbG9VIZ5l8GhkgsEXdx8QecWG9sDjmGHKbYfhOPZZrc=;
        fh=x8R7XToO5EhjBtoKCq2wEaIdNH/Y360VVoJl+ms5/BA=;
        b=OrwcSEswKunLwuoewFUupmuKPsY0ATO+aO6XjzMAl0u2Z8650n3K9BxILHAuvvm7oS
         PQXzHpANqNBFrqq+eaBmTcOqKyMAr/t5GScUzFv5SmFdZ22WbpM+Ph2YcGrdsZEzzhTC
         fQjgQNIA/khCFXYbpkifxUSEQCwy6ldlSN6wZ5xPtAmk4t/w/Al844SLMW0z6y5CQ4fe
         eo9xS900crEU3hSO6vN7y9dNXvunzgqXyzNc+0sc3mYsJXIgZR+dSUZMEaZAreeBbwYV
         dWyxiBqXGHfUIBFyOxGrANSgNvlRgsyCtyh7YXwP9OACpJTWEJOqa8BOf9Px0QH37GGN
         WALw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789669706; x=1790274506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gbG9VIZ5l8GhkgsEXdx8QecWG9sDjmGHKbYfhOPZZrc=;
        b=ZbgxT7tpsgiPMgMfqUVhs/d+kHTbBG5y7Enb8HvwvvkfCutkoasGXdg9aq0OVEFUdT
         mPOkfUzMhfs0K+/rE7oVBZ3TqEAr3xnDEkSsqUXIMtQKzKlCaAi2N5uYAUBVfsE+TTzO
         aV4R2ibxJy66du2mrdBGrKuhyQORjvouEi1nSj/hJPvjdN93817NMRGCK9VyW1Rfjrd6
         o2yB2SL07f/9vAvxDDoohxopb7LvQx6yD9yQtxbXDjmmmdLbdxG3TVOVn4MJjMaoIBi9
         AvGK2Aiih7mr+Bs+EQaA5+g52IG2JLojiRtOU1z1DmbiR6ysMDG8segahR0bIPphiiNI
         vgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669706; x=1790274506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gbG9VIZ5l8GhkgsEXdx8QecWG9sDjmGHKbYfhOPZZrc=;
        b=PMUdqjx5IP10tTze/SpOT9RoI+BZdBno6JZVIOYlCApUIDZ9H97Rgg1/A/ek7yo+/b
         KubPUjACAam/n8HTe9OknZrCoFe4p8A2eKZXTuLeK0XM6lWXN8ZYMbHapc3bTP80cxQD
         KQM8xxf3Mi6jlJ4veHEthHIv17vvKLaFx0ZU+BtlB1+rGHLhgJG2EigY+4yVJJovYjM7
         ZtLzdKtGRz4QIfaRb33l5bu4Equ2XGHiJvoJ+Ghe/7gA7bWR2QI4ikQ2kBc8XQzVHmFM
         BzToEDYt+cbVncwzMkjaou3zzdkm+SOVKdB19ttA3BMezPgztbfCmFYLqO/mCWg4gtTC
         Xkbg==
X-Forwarded-Encrypted: i=1; AKwUvBx6imRtW0/cybIySbElkhLOROS7/JomlJEr//rjYVk0d7oykSwdg9O1HCPM1wyTUyZyfQY8FXemcnOfkF4=@vger.kernel.org
X-Gm-Message-State: AFuF++nwS36wq3YD8DfJqz5E7XI6NT1CjxXkMZ5agFJuEhZiAbGIbSWO
	L+ajAUBhfGYCMXDZ0ZJ52mkX+Gx0X5VHW3TIWt1l1bsfh9X2jt0eVEZt4MgGKkzhN3dT5GyWPi8
	0ucr4+PnxEcUaCr2jL8FAYzVCRynr4kI=
X-Gm-Gg: AYBFou3ShG3JcPLc+LoTZ7K1W4Up3x9mYX/g7bd1W2ThU4fBqtacP40fGrxk6wfKrH+
	AuuudJTMWRmA3jYfARp+JB1U1epTA/cXRLn7fFTB80mLGruk2ftly0knrWv0F0JfgheHmFPDyyW
	62KDwYqxFyc131BY/rp0da9gqGojQp/50DJlDtYF8oXzxd0ydAU4aS93AeXxKNnpjfdMYmr7FPl
	OUD/vTRZxA/3OdDqaiiYIHgDhzkZo2L9cZ8SL8uKs7xRu2HE5iID17MCFd7NybDHBKrS3Abs5Bc
	sTn12Yhn5uzEER9VIQ7ImCfXhI2y9KvLY/I7HjY139HkG+MtWdFVajfudWRmuXBpNVOZB0WpxHr
	xx8vYZvhOaTcjwsNvJlzHJs/tbebpTQbWwmP6NrlAVOQxL4qTwvWWJvZ7FKjqbfy5/coQ/eJ6CJ
	WSTB+HhcDNKMN5OcCLSXEKgZ6eftqai1WWv9oD6U1mWHBR/x84pFO1yht6ZC/BJZN4GsI=
X-Received: by 2002:a17:906:c155:b0:c29:4187:613d with SMTP id
 a640c23a62f3a-c2a15e0ff91mr2202666b.35.1789669706346; Thu, 17 Sep 2026
 11:28:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915031225.191639-1-rosenp@gmail.com> <CAMRc=Md+HpS6LDLAvfH_=7DrfUq+cFmRqFq=cW-RqBCfQPs6fw@mail.gmail.com>
In-Reply-To: <CAMRc=Md+HpS6LDLAvfH_=7DrfUq+cFmRqFq=cW-RqBCfQPs6fw@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 17 Sep 2026 11:28:14 -0700
X-Gm-Features: AcwNN1WkfccXUHAoMGLySCP-Ju7sz9Z1lJWkoChUCP3m5x6uQIxZxYoqPuGCghM
Message-ID: <CAKxU2N_iS+z5dPv9OLpCarCKj0sVH58N2ND-bOUqJrbV=yPXew@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: fix Armada XP per-CPU mask register save/restore
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, 
	open list <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 2:53=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Tue, 15 Sep 2026 05:12:25 +0200, Rosen Penev <rosenp@gmail.com> said:
> > The Armada XP variant keeps the per-CPU edge/level mask registers in a
> > second I/O window (percpu_regs) rather than in the main GPIO window.
> > The suspend and resume paths however read and wrote them through
> > mvchip->regs with the per-CPU offsets, which hits the global
> > GPIO_EDGE_MASK / GPIO_LEVEL_MASK registers instead. Per-CPU mask state
> > was therefore lost across suspend/resume, so a level line could end up
> > unmasked behind genirq's back and trigger an interrupt storm once
> > interrupts are re-enabled.
> >
> > Use mvchip->percpu_regs for the Armada XP per-CPU mask registers in
> > both the suspend save and the resume restore paths, matching the
> > mask/unmask handlers and the probe-time masking.
> >
> > Fixes: b5b7b487431b ("gpio: mvebu: add suspend/resume support")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
>
> This doesn't apply on top of the earlier mvebu patch, can you rebase on t=
op of
> gpio/for-current and resend, please?
This should have gone in first. I'll rebase.
>
> Bart
