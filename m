Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5890375F88
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791773536; cv=pass; b=p/S4QskwLnh9MS1nKJkqmStxvO2gz9ibH/J9XbB05OQoYmkmV8f1iCiRQ0G7GHkVYPaMNyrHxtcwiZ9U8+rSon3A9bGp2FGOp1GgWMJl6c4lyUwyNz5fZXijHksC80wxslCUw/Uqm5Sl8rsfq0xmNvQyNNp6+Uop6IGfr0+OjHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791773536; c=relaxed/simple;
	bh=LzWchX4KsEIH4caQu/AQaehulhvxSRbR4oh0X/6NURc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mj59uocMRO2Et1b3ZtgehEfe/7enLwqOduBE21Gt4aDZf4DruYdUu7afhocQiL29XzjhiQFFHDIP/mtC85MVBHql9vuKspDt/fDgaKE2LY+mRp4s0a7oACDTldYHSSR1UNjf6i/5nrpf4VvElNVrHdSyYIvDCj+mSFn8qgbQ2+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2RD32nv; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2RD32nv"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-89a595332c7so415280b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:52:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791773535; cv=none;
        d=google.com; s=arc-20260327;
        b=IIa++gBHqLAxMqufgrq6upnhlCouw8tUvfInfC1AM+/zvrSdY2wQM4cb0UPVh9PWu9
         McjpZHTjYRy4kZ3jt5/BCR5+eaEKrjtiNCMo+343Gv48TrE5x/uYyq10gtZRlFzPsHv6
         LDi5YrK93pea/l4/PBktnPIBqx9pwsn+ty5+0Puqakwbd/wm80TPr4b1nilIono0lRaG
         JNw9VR8SiFzhSHP5tKc9+f9zAR3gifQeiybnxIrwvLY8xL+wJ22VFjT3V8nX3G/dYVeV
         NqBGwKvZwuxzWRkARHSx95nAFtcZPBOiTDDBeAs19niePE0m1uBSWc3yHFN0xiZlx8cg
         jh8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LzWchX4KsEIH4caQu/AQaehulhvxSRbR4oh0X/6NURc=;
        fh=tNhqkk8vAlxl8HN46sg441veFeiaqP1Pc9PD3iQObVg=;
        b=r7BMaBqyYeaumX4vBo2ceiEMHSyKt5fgX4EIR61a0vbgBDpT78ZtfRYENa+jlPz0t4
         +Y3mBZofj5kCLwLqcwc/hv7auq28TNg2sv12XlNZn8jbQXrYAEGOrG71SUvNSSiMUHTL
         4CB0/IOtNhKV84qdZqAEZOBHpb4u8Qjfrrm9MhjQWp3QhmfM2675ZXgYyOrkaypT1fS9
         M0AcIWaH02Hg2NKI1g6rXtSKGRE95JWKlSNT7F87HYK7pefkiajIW/MZfbQHK9aEj8rc
         bynL+N7gCdJ24TSuRH3XKt3uhxkEt4R1H6d0yYJPZNnQ82y68aoMZ8AUwvH1Ewbvzyty
         jrFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791773535; x=1792378335; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LzWchX4KsEIH4caQu/AQaehulhvxSRbR4oh0X/6NURc=;
        b=O2RD32nvFSCACmAB2a2ahKZAuBt3SqkBwGRNjYB5DgSzo3xzGtazuXg3eFVH0HGG7f
         e4qs5kqwTLdIuca8nWoLpZZ5/InNOUsWgracb1Nuj2mO/cvEGj1geNNt0BlcO2SPKOm2
         v3eDRf9mE7mWTYDU5bP0jCTLIrDoOwS6jPlfEdDYQIkIJubAY6ti2dt/ncnbMget7FoM
         11+dXA1vx7LXpFy9SLWL4VgsqpbCSn7FLYfvuNK4YDDvDCy3UuOKF7XRpRGUt2f1/eVx
         bnHDjrP0G8p2gurg3JobpR6UoBT1HpPsaYQlbkiv81D0ZtZP5AyOlvgJtT2WKsXgF515
         CoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791773535; x=1792378335;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LzWchX4KsEIH4caQu/AQaehulhvxSRbR4oh0X/6NURc=;
        b=mflEOlnYQJI6MwLs53Do7QC4ytHzkWGquq5Br0XFyB+Ry8BmAf4L1/1hIzX2LU+Wul
         3RTyWt6XqLAy0HuolETPfjzhyXNDDxPBij5PyxQP1BUZITj7KmjEyMz7aDqK9jnhZ8R2
         UP4iwguellR/O1Z/uvVJ/YAc4xxZ7Jo0J88TCRDWC7i7EkH4OguMa7iG5MiKY6a4EP6v
         6DCO3Owt58rQ8Vz1SwPTgn5lejfggAcSmN+TO5Wb87JKwocpcyG+TFqCRE5luZICzK+V
         H/G9sGxqttPFwF/ZG5YYFTX6nAzbpiqJg7tlqNq++JzKlHTcgCaU3u8PVu0CDgNoIEuj
         xRaA==
X-Forwarded-Encrypted: i=1; AKwUvBwvVu8z1peJGsZdyqceyL8v5AkZAi2oqeg3ZcO42jPViqHQHMBSl9b3YSfUkYMnzp0hPC4qy2E7uah3rKM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJd/BjZvskxeUOIszl77GfI3EN4nmEqLT+cOwb7Hn12pclrUQTu
	XAq39mxHpFXwhlK53I6MQdLW4t1zAGsF/JchZd+09vn9V8GQMDT77I40uOXgaOAT5ohL04ZTxaH
	UgTUxZpCmnKHPWLBFeLehkvJTz0R0OOQXKGFb
X-Gm-Gg: AYBFou0alsYIsaR1/iTp074BKO9zawqKTLaKENvckuSwvkLXXP8S+033/2A+avgjOHQ
	byrfjv02/T3vLf0+q1l1XT+NO+l3xOrCYIDbdZwmmpET0oMsz0+4JcnReH1DCMwpmzHOBIRryYx
	qkmYb7RTB75DsABtXDNmRdIxZU5mimRQvsV5ODh73yMyAktaFbAH0Cm0NrIS2MDajnUTVZrXEUz
	b9zoq4b4Amh3hFP6+qHHB3ghPTWXvJHN0CqdY7dMUb6uzLvve8wtE1U6950wuTvglBEorrw4dae
	oWwXbhMMzrPI3pxXjyHgsMtyJ0SeKoY3HS2RKQvOFNKgQ2qGccgykMKJjIKIikrcSBwFXrVUv+e
	OWhc1Wm0vMdVX+4e6Aiid+cVoniNuNaEvuwg0B6WjUPXhf/uHuDfp8T6JapvqDPkyYsVScPuiHv
	zxpA==
X-Received: by 2002:a05:6a00:709a:b0:899:f6e7:b6c6 with SMTP id
 d2e1a72fcca58-899f6e7bac4mr1931950b3a.40.1791773535113; Sun, 11 Oct 2026
 19:52:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011051924.60456-1-jain.sm@gmail.com> <20261011051924.60456-3-jain.sm@gmail.com>
In-Reply-To: <20261011051924.60456-3-jain.sm@gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 12 Oct 2026 09:52:04 +0700
X-Gm-Features: AclHuK-BPvUlZy6fKGO0CDqbainrKzygQvr87oFj_CMEFCIi9XC7UM8Pf7ZICr4
Message-ID: <CAABR9nE2AEee6dtw_J45qmMUxfT+TJah-E7pk2Q2A27xcZVcaA@mail.gmail.com>
Subject: Re: [PATCH 2/2] iio: magnetometer: mmc5633: leave cache-only mode
 before the cache sync
To: Shashank Mohan Jain <jain.sm@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Shashank,

Thanks for the fix.

>
> Fixes: afc8e3ee8307 ("regcache: Validate cache_only state in regcache_sync_region()")
> Assisted-by: LLM
> Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
> ---
> Prepared with Claude Code (Anthropic), model Claude Opus 5.5
> (claude-opus-5-5).

Note that the wrong ordering in mmc5633_resume() predates afc8e3ee8307;
the sync in cache-only mode just happened to work before,
and afc8e3ee8307 only exposed it.
So the Fixes tag might better point to the commit that introduced the
resume handler:

6e5f6bf2e3f0 ("iio: magnetometer: Add mmc5633 sensor")

Best regards,
Phuc
