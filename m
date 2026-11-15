Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794778029;
	b=UqA08HIyflQEykLS5kIX71A95K+06UxdUuR01Vs44xssggEHMgq9U0fW88D64qI8yiIg
	 MSOje2sIsRwL587c7tORrQOcUJGtDgV+rEMnsEOsrAwFiJZPiHhQTmZEZPpsqTQ6d38ix
	 JH/fcGRqoNCqf98u4RMWGzn1aIyTl4E2Z/UXm1h7qrtsxLERK1jVDmzGIZ7nPtK+XamU/
	 vh63iGCxIEmB4Qsk32sLw7gzBZvqEPfSzFeFVS2KcufFZey/m28H+oXF5dGULG/Zj1FUH
	 8M3B9feuyvz85G+miFZ02PSKrQtdMUFk6RHEeAkANsmMroH7IDQgJ6s6FWu2ZKPrReA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794778029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xOfqkFPGSOelYxZ9WwfJkudZeQDw/mHaOk7izfGVzlk=;
	b=Hfyly0Crn0nXK98okUvvL6W2a3jdq5PmCQNf696XDJBQAMYkXWrENBHpSgX7Hkjn9kjf
	 hvRWa36nGrhI0ToOK5BAm/PKMgDmKFVPj4m3kGiTYVqeK69wr4q1ekNwdfCtU2PrxyEbn
	 IBoY3epYXhJtZucIhHEB9csiWQLVt+NzZVC2xVGtI1NIV84UrAWLBmbT3P2NMWZOfK+KV
	 YdPkX6hLw+MY+6iDcGRP8E8WAcCC9MBxMpTcouzYHff3aK/okgpuNfFV+ohFR2lpOgDIX
	 QNORoXMFvh3PVqeEZU+cPUfd9dri5TYbyc4ipi50pir2ZWRrxnqoEpXTzWuAYFqIHPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=mwSj3gru;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5275C606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5275C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=mwSj3gru
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b31448caccso20239037b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:27:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794778028; cv=none;
        d=google.com; s=arc-20260327;
        b=o8ErIOmvc0NEkWrmQowZNS4fRlJdADYDtMeeHja3xx/F18duiW0cOiGqfGA2eUUPuR
         cq9Gh6oR73Zgq2eCvWp53DzlOz31Bb3kkM+AOIIp/gVfl3wyfgnbXNiwox6MqZUCkwgH
         DWklUVLaORr/tvlBzH9QwVOTfNxIUI18ZS0VlX1uc0DAJeQc1pso48Vb8eLbrXwVtUdn
         rDRMUCFV7woyY35UWV09NC8NCAbLFPCGLccgznlVglbG8Blauj+MF8y6P5Mvfg/kum3B
         Js73txn1EsJc23iWKfNLEe80P3gHkDpeynOko6kS0ycZ5IKeEHLysVY9Aj+XkVjijIIG
         1qCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xOfqkFPGSOelYxZ9WwfJkudZeQDw/mHaOk7izfGVzlk=;
        fh=0hp8e6HXGYNRv/MTDrtvJoPJ6QDKdpbfSX29qqoeIoM=;
        b=M2mI+FJOZPf0yl7o41MOJDt+e9qep4wuQ2s3qIcXPPnjjkB5s3jkxFBMloWQxZRt5a
         xbDAAwowC+aK1pl/btJs39H1u3Y6K7H1EiuTGBx/NdHmoa3fK4qEeiu+nuqjwAVV1TXP
         OcThohbLpUDSoBfrESsCAKIrAOAbLK4cGbghvzLr5Ogb0BU+PNNOOPwWb7UGxLFT2/Y4
         UR8f/dfzBmwcnzwToOdt6yd888r3W3nC3VHPdaztZI+P5aLCf0KWRKl8Knkl70ZG9fzV
         T7sDB1j2Vt2XN9r6HOu2wmvZPSaI2sWVK7fYEURNnuUSQg6EuvzZ33OdRk1KdHoyq6YI
         RmIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794778028; x=1795382828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xOfqkFPGSOelYxZ9WwfJkudZeQDw/mHaOk7izfGVzlk=;
        b=mwSj3gru6GVQtVK1B72XWkcBo6dlJyZWzdgxG91om6bDIjcOITIyDOSFQ+/zd5koD3
         2rStRnpCvYiSlxPqntKz/pJ5aMuZwpctbmiw5FavSk8jWq3yHM6+JGyrT9TfGFMPdJf/
         V4Neo+Q1X7wRZeSYG/sfy555gUgQrmyqSj3V9HFPYMeF78JD06cLamLjImg/upse27uw
         MVZpA5wfkowHSpJMxKiUYnWLt1H1IV55G6zbdispT0pcsUPmikc4mZTH/k3svCydvnc6
         wPeNTu/joJVKOLhSLFqShwsg22Y3E9sqXzZQneDZHqFpjvcsRlkGy2XX8jNKIWz47Tmw
         Amwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794778028; x=1795382828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOfqkFPGSOelYxZ9WwfJkudZeQDw/mHaOk7izfGVzlk=;
        b=TpEQCWfHZ2a6uHD17LyPnhkzZUWK7pNjr8V36w84aXfy7OPRQn4Yr3A9IluCzi45GI
         LwmjAkh6/ryy/SsgUsKJojFue9K0q6tL85T05o3AxURLKq3EG6acUAliy7c9diNCeRy4
         rJv/7L4zY4n0jYQwvhIQ0xKH/S7FyQGXvyhZQo3iM5dkQiQ5Q64+2CA5ihr7LwtH+Ake
         7WiuUIbz2IHZZkW/14vUO4D5yobJM1E4U9bJx17uIeWeH5QOB5F/cUrVhbclBqcPPHPb
         dsZ2/Z9T1B/xrk72xzCZkoesJ/ijJsAVbfCAFl3AfDY6ZglKPwqs7TW0LmTYrMASCOky
         ofcw==
X-Forwarded-Encrypted: i=1; AL+hErGYKeu+g7Wmh2hgevzCNFq4GQFp7jCQ9t9OO1zcfDZal8n1aBfqPfepd6cQr4Oqmvt5V1JSEMiRS8s8AJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z81twSUH7te1rc9NhZ5r2h5WSxWimqXTP/KJhrN5QS/yqNJkVIQ
	qQTuaTQ00BaF3bX6CnuuHfDmSp2JNxtQaJtEZuVzRw1SSgpX2v1RXqC7xXwyC8v8v1MsMrig5Z0
	7eQ8iVzO9/19Fog8egGU3Du6ZstAaahk=
X-Gm-Gg: AZFdTZdvB0EnI8MrBuax+F6ZOwS5KE9mgVlN2wX7Al08APqrbkvQPQNiYwquds4uXfl
	fr6Q+vUh/pBqnEEWGxPd7cNLOO6TTbAAX0/F7c1AR6ACRZFYZMgE/s9Cj0Zd6AIE5LvHfZsVdhv
	4hG5OXT9Q8Lf0aXnefVIta2xPOOSM4WHfNvjmIP/fyvBz3dT7ZSKWs846oXH1bx6dtJ/MaWT6VP
	98AmX8NnZqt72jeeDOYqnoe07tMwuRjM6KW3Z+OwwyuijTjqAo/mSA7WxculBsly3hd7A27bzOA
	5pYaRirr4w2I/M4nmdBGnfBJkQk4o7bsIlF9goQHDwCYKacJIhlIjgzKqPdmC/A9wbklHKvvKQV
	R9rJSTQDnUVUixV83ou59rPLFXzYGvBdtr9ZMwMJI6QtDnR7Ha4mUmRYjvNYDFITdr0hAvg==
X-Received: by 2002:a05:690c:6e85:b0:8b4:c2c4:bda1 with SMTP id
 00721157ae682-8b4c2c4c026mr25492897b3.67.1794778028118; Sun, 15 Nov 2026
 13:27:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-4-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-4-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:26:57 +0100
X-Gm-Features: AclHuK-_NZa3qMznm_nhucaqssqDCKZOwFULWjo8j1EdkFI26I-pZrQxJB4Pk5w
Message-ID: <CAFBinCC6C7QD2-eYhOR6FjQ+1a1sH6E0ioUMapFkTWe6626hfQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] ASoC: meson: add AUDIN driver
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
[...]
> +static int audin_fifo_dai_prepare(struct snd_pcm_substream *substream,
> +                                 struct snd_soc_dai *dai)
> +{
> +       struct audin_fifo_dai_data *data =3D snd_soc_dai_dma_data_get_cap=
ture(dai);
> +       struct snd_soc_component *component =3D dai->component;
> +       struct snd_pcm_runtime *runtime =3D substream->runtime;
> +       dma_addr_t dma_end =3D runtime->dma_addr + runtime->dma_bytes - A=
UDIN_FIFO_LANE_SIZE;
> +       unsigned int val;
> +
> +       data->last_pos =3D 0;
> +
> +       /*
> +        * Setup memory boundaries.
> +        * Note: DMA has a 32-bit mask, so it's OK to take lower 32 bits.
> +        */
> +       snd_soc_component_write(component, dai->driver->base + AUDIN_FIFO=
_START,
> +                               lower_32_bits(runtime->dma_addr));
> +       snd_soc_component_write(component, dai->driver->base + AUDIN_FIFO=
_PTR,
> +                               lower_32_bits(runtime->dma_addr));
> +       snd_soc_component_write(component, dai->driver->base + AUDIN_FIFO=
_END,
> +                               lower_32_bits(dma_end));
> +
> +       /* Load new addresses (both LOAD and UG are self-clearing). */
> +       val =3D AUDIN_FIFO_CTRL_LOAD | AUDIN_FIFO_CTRL_UG;
> +       snd_soc_component_update_bits(component, dai->driver->base + AUDI=
N_FIFO_CTRL, val, val);
> +
> +       /* Reset (RST is self-clearing). */
> +       snd_soc_component_update_bits(component, dai->driver->base + AUDI=
N_FIFO_CTRL,
> +                                     AUDIN_FIFO_CTRL_RST,
> +                                     AUDIN_FIFO_CTRL_RST);
not a problem but a hint in case you experienced some weirdness during test=
ing:
older vendor kernels have a different register write order and also do
a retry-reset dance when _PTR and _START don't match: [0]


[0] https://github.com/endlessm/linux-meson/blob/d6e13c220931110fe676ede6da=
69fc61a7cb04b6/sound/soc/aml/m8/aml_audio_hw.c#L348-L357
