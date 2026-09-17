Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA7537EFFB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669670; cv=pass; b=chRSemsyx5kqWPzOo179ZXWd4R4+PGGX2p11JXEy2/hPcy89MAdLelmrBPy6RmtHlNcwNqIqcXaSbGd+amueakG/7L49f6IU8XWW4t4B8QSnjxEY5O39aXwrP5OTlwo/VCl3GuM0TJSVJnJ7kWSKXGAKesG1mz2FnvElmq5VCLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669670; c=relaxed/simple;
	bh=rYE58RTx04dPphYH1qsvIJA08dXH52av8eKhBOXbJXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=st27LDZEeP2l26KotHBKCqOK6eG7AAbaX4Sg5EehYgRpILbjAtP70KoBdsYVOqcNk5j+tUM2uxQu68fhJsyfsCXVEtefp1YoH8EsUSctEM828KrMxvz5SmokR16NZaArUS60EYSSmqXF/aBvNiqAXmgwWQwBXPlheHYxL3F8i7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3n7K5d5; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3n7K5d5"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f5603a0so189531966b.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:27:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789669667; cv=none;
        d=google.com; s=arc-20260327;
        b=EAMTV4EArxGC8smtU0F8Xow8eZm6vCgrENdSVy04u2r3ukoaganDT8WMPpvxOYe5TT
         iG9O0yKcsDSqTok1T22c7t1IfLXHVgQ6akqfIV1d6FT9U4Rjkq/7Jn/T4hV8zEEretDY
         dJiI7m0fPCKryFHgBFaW7rP95J4eMAc13wRRi5ie+VXUm7bAPUwdxy1VQqzl12QDppCa
         PwK0mClRylOTfJzLjGdCVpwF5Ocof73U0B9Tzsf/spzQ1QOKWPZQI6H25GPVTvbQycFu
         82z+AsUWKALHxT7sfUQ7JCo3pP5FhvfmMnqCUiq1GTptnkGStPAm10YoWwVlyMZumwAJ
         ajLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tRt72PUf/XZ8nyXh0XsE8V2EqRfTqojcjnaq5ie03gg=;
        fh=Hi3gKNCkA++CCfV8eO8Tl8HOLCdzI6ifaFr2ROMu9rA=;
        b=jgiArj6kEqsyG23vFa06HTN3Ja/mXsQXBeavSdVKzlj0xqfl48RrZkOC2qxNc8Ov+e
         Q4xeEHNU3krmCK8STFH9FNrbplXdQHBgcP9jbxFR7r6SbWbvrYOM4lK7QhgZjwVxV8yp
         6POoV6xbSKWF86HSGTpRDDW67Ktn3MRdfjO2+YwClgYBeeYy9NDQkSRzdAtUPXVJ9QDk
         OwtTta9EhxhKTqSyWEq2/ST+cwwmyCPy9dAfisTxzkefnb+I8xggVXopDdVbtLwBYh2F
         kkOl0s2MxGlzFCkSDXVukK1xU5+JW/h/UCFpoONfZYsTttKNKqUBwzdjq0Eg5NkyvCZ9
         IwLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789669667; x=1790274467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tRt72PUf/XZ8nyXh0XsE8V2EqRfTqojcjnaq5ie03gg=;
        b=S3n7K5d5T7S6fpPM1REt59qtJjaiX4TqKX/kt1yLpxU9XM5dj+OrhUy+LOcfbxOK7g
         ppl4KuFzeTz0MInfb2o7RrvEDBYhE4ZmM1wc47gowMJDqimodS/bJtIx8VFa3VjTjEs+
         ofW1y0RjM1LQ3AVs3VskP7mj0aVSUMptGx4YUei4Q7PR0n4R0JBWkOs/+TWqEaTwMPKE
         YmTt3dyxh0uoQy8R2ZWoDW5jCXGLQhlpAuk3ELFSPnHvlA5/4fFlS4IE2b2M+VPehD3B
         7rJkjqA4Mg+gE9laW85QIO+PDiF7QOhO7PicqwwuoUKb1i6jYTp//Nhq87ybsghCU2s8
         SmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669667; x=1790274467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tRt72PUf/XZ8nyXh0XsE8V2EqRfTqojcjnaq5ie03gg=;
        b=lBc9jPs75ajidna/GZtGnTZGeKgdwTLwPBERlF5NaNgKx97gq8n03YTStU9GCszsbR
         xgU96q6EZmnSulZ5aCqaxuufqruiUfKPtSmz+Z21JIccwuqJ3Wp0aM7Y2HtNrhiy9sQf
         uko0nxkNy0O3Byi0jWxykm/RhgEVpyvkz3E5J2KiVwqsPsTwj9OKRdsY3Yqmvc9Ms/CB
         n08og5k0fKoiH5XgxjPsw4LVp25XvdufUkpB71e1eN7AJqX1RpaWFTZTE0xhmzw9Pttb
         Et3V8As/qDntiwo2/KiZHgC+gXnJFpoVGSmyjB/yYiIxhQMAGuiHVABpKHvjhKSTT6Cq
         KI4w==
X-Forwarded-Encrypted: i=1; AKwUvBy90D6VKAmB59hGNv6r2bx5lwJyd6I+jKdBvN8dXiWTm2RX6WvoGEPlp9Rq+hMAYzQYLFt6vuk7ikITVy4=@vger.kernel.org
X-Gm-Message-State: AFuF++nt1MbFA192W3N1Ct3ktPHiYRn3LN56uh5OxG6WRmPBgnLNz2xj
	Og38J+b63UJ3hMIYpW938J2XKNPAi9sroH6gGbjuSIXw7eBWqJ90xTxNL67vrbIRX3IYMpTuRNB
	1vvhFt67DSgjIJCyjMnM/SEZpfvwypX4=
X-Gm-Gg: AYBFou2vfd+YWBWk1hnB8LSTAAw4BFyQh/022RKLiwdPuZ9iLp6ZAGTCT+SAwkw2cDt
	cd2LFmTYFqT40QRQKh107lvMHfPRiUjX9+TERaooE7UD0ifjeDDQzbswIUI1Vwp9lDhqMe4vott
	E+N/uhFNTAhIEq+Y7iTs+K5rUr8LYBjZZTRQgWR5vt1Zkv8fUkHVnSBGSkbnOs0DRikes4Ehjiu
	FAQO/aPbUlkVK923068eRcJUy/jpD/UmRmfG5VQBtwgrCTYIYeIOXBq5qL0QgGnqMRJ5HUG59m7
	P7lKJF8BuqrnBqhuhJyNrieR2CnLV8sq6tnvykkSNEDQrNtvpaUQUEeF/q1Mgnr/TmWysgGAgoF
	DPmNPOZHpgMGczNVGIGiTYJPBFKKPkA5cQU2J3KhLIO/gF1/K6L+7K5B5qXwxHouJXsujXmj11c
	84u6fxzWnrDvAcVOIqmcK93CCRbU/WurBiNeu/oUafNsKO7ZzFOy9nqjCvuQAXfggiIA==
X-Received: by 2002:a17:907:3ea1:b0:c29:60c1:7e55 with SMTP id
 a640c23a62f3a-c2a157f77c3mr4807066b.12.1789669667374; Thu, 17 Sep 2026
 11:27:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916220453.260472-1-rosenp@gmail.com> <d76de06c-9cae-42c6-95a8-91c9ed7e8f6b@sirena.org.uk>
In-Reply-To: <d76de06c-9cae-42c6-95a8-91c9ed7e8f6b@sirena.org.uk>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 17 Sep 2026 11:27:36 -0700
X-Gm-Features: AcwNN1X3stN8dmVkRdFt39pftKBfSqreD5Q4cCV84jdTqZ1Ue-KVCVd7OglK40A
Message-ID: <CAKxU2N_JqRtBckSr+CFyOLP3vVk=ndE4UE5ihYtBUoK5sd-F7Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: mpc5200: gate AC97 driver on PPC_MPC52xx
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:24=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, Sep 16, 2026 at 03:04:53PM -0700, Rosen Penev wrote:
> > The MPC5200 PSC AC97 driver only applies to the MPC52xx family of
> > SoCs, but only depended on PPC_BESTCOMM. Restrict the driver to
> > MPC52xx platforms so it is not offered (and does not fail to build)
> > on other bestcomm-based machines.
>
> >  config SND_SOC_MPC5200_AC97
> >       tristate "Freescale MPC5200 PSC in AC97 mode driver"
> > -     depends on PPC_BESTCOMM
> > +     depends on PPC_BESTCOMM && PPC_MPC52xx
>
> The DMA controller has:
>
> config PPC_BESTCOMM
>         tristate "Bestcomm DMA engine support"
>         depends on PPC_MPC52xx
>
> so there's something else going on here I think.
It was requested that I split up from
https://lore.kernel.org/dmaengine/aqrxFTWEsJmFIrel@SMW015318/
