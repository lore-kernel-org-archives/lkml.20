Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794524373;
	b=aKpCWBqorNztk+EEetc7BG4R3+/AO1aJkKCXS92TUUbfT5PiQcBi+ZSEXsp7uPDsiHHG
	 IovknSMfIxtKFbAwILAeR/Jfjg0HCpKTkr9dW2GtoP+JHfPFqaMidqGgffbe7TPqbxUAH
	 VNPEH6XkDqkEc4v5g1InbpLFTkISI2vdrTyBg5T+5RxE3lqEtZdxKtc7wUMZEpoOBx07Q
	 bt8p4mQ69qv4ZpplCoRJvhxFvUOQsV3Bb0MVUyoQo9iPmubCZ1PMonxw8TDn6EhhYAA55
	 AnG+s9l8bKZkhJhHcM5WnE1GSbPdn3vKZAxrBIGdscGQEVkRbjND6HV/EkPtMaJi+Ww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EopehRq5ikgbdAiXlBfLUoKgyr9SSArgqvetpz1gLic=;
	b=Hcw0r7cGAhNcAWellMiJirWeTceQajS/7GA314i6gG0ZhT3R7AfFafw/WlZX0Ny2tiyz
	 TLc+1xLJSmXlfaRvOQPTJpEj6BqA7+YcIgptuG0tLFPD20ZOBpXGeJdT64lZ8sd2mQucn
	 w4w/Fal7hVIjFTb9+Z/809UTqI61tCeFHck/Lj1PB0fZ8+RqZWU8p8jID2FxcYib5TI6r
	 6J8F+IrPP3Vf3K1ghlOx0VAO+v4yT707tmXUGBrelCN7oNqILFPgMt+62WPEVA9KwsIU2
	 7NSTysubdml0AZA7jL4z6Ivx6YfxxODqcIylu3B7mAs9RMcd073JT72U7atszBNSzbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=DTd3rU4s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9C3606D593
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D9C3606D593
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=DTd3rU4s
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6798af41644so249394d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:59:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794524371; cv=none;
        d=google.com; s=arc-20260327;
        b=Yg7X/Ny+9mUe2obReyMtT4I5PgH4oP9yqhwJU3q5Boppcq/sNkZjs7+M/64G+JUvMM
         9UO/jKcNx21bq5bGcT+CyLs0gBHBG2DmPtMMI3j1HRbaI+vw6nPIyO8NZPCksuehaJy1
         l8GB0qFd2E3HX2kljPK6nyo2TEeCHAvglxbetR8eOBmd1qoiI2icPWMhEo+7IRxvtMyr
         n3iugMcZuLM7QMT4JhX1zfPx0tcSyloOXOvhvmme/em7OuB3yld9oJmkidaFLX3qLD6r
         l/mxpOZJJih59t/+BtP7XbQg8B2fWU9nI8KLLu1Vmo5ZRto11tNqjohwcYDdpGj7Qlsf
         zF3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EopehRq5ikgbdAiXlBfLUoKgyr9SSArgqvetpz1gLic=;
        fh=bq1HedjQlGdBV4WvS4cfr1/5h0kp3/5dl49YL/4UBrc=;
        b=YrSWFca7dTjjfmhEzEwoScKgPf2F9kGEchf37ThQroQsO09L2G/V33FP3zKxsBqkaM
         cDTD0cMTlpP9sFyEttS3KFfVXvFJb3OO6qyLBqdywlwTc5BB+FvRwaWapZ0/k9ypOApf
         rVr553B0Ni2QDu3X933Zv9CeHFsCf/wwD2xqZouJy8jf9FXj4JqwEMgGwEALniPbU+wd
         meQ9J4eRpd4AuHJJgv60s1MvHkbvvCVZn9Bzil2g0J5fCsiWfBaSbfU1DtDixlTCW140
         npUeakTGBJ23+kkBzTlqggsUV06ktJ8+wmTrp87YyNvgIovX7pMGmRuupt3hFDDE58Dd
         uLpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794524371; x=1795129171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EopehRq5ikgbdAiXlBfLUoKgyr9SSArgqvetpz1gLic=;
        b=DTd3rU4s5R6vEnmm1kWd4icC5YWmEubPkPw6tcqK5VA+6jF/jAlmtSdVBgXx5VeMlp
         Uwng6NAltw4+Tb1pWu/POb6MPpQq3YfzQJ54AS89PNJ6I7PSOJkANgiHlY/I78UxCspn
         vasN//cHgbqd2u7GLqjePJlMcefE5X7YLTw4W219h62l9Kj+TCqUXvuFCLv5DPk7yMuB
         HtDMpLGpO2qFk2WmAL+y6K0SqSoX6MopEO8ttJjMHDfbYLCJv8oRgNuCgnA10HvAn8K4
         Bu1B2/2AEmGzmKJVBiozBjhB9kea0JMGPn82g2jrponWHdaziIopGdd20AKYJTqt3BVZ
         kV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524371; x=1795129171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EopehRq5ikgbdAiXlBfLUoKgyr9SSArgqvetpz1gLic=;
        b=Px/sQ3AmIOPpnXvL9KsVbJ3m0GHdlQYu36sl+e9r37xMOawfi6IKs432UAXj+yZHiC
         aP3d5H/DSenSbVN9o/c4zarLMt93MTyxnsf3X5oqrz7QSvNzDiZNjRb4z6hJ6KWO7wol
         mJRsMXhoM8OLuY9G7nkP7vefNToxV0wpbI0OzI+ZKurN2d6EFT6KF2oc96o92XzjxJ4G
         AWEjt+/E6bTWfiB5mzeBKWiCSaB5RG+UhCa9GTEQC+pyEp2E46lCBSf08FZY2d2gSQTM
         wzyB4eeQGyr2eFZtUwjpyflR4MYW8y62gfdVWPd5dsETfyoI9gyA3Zf6ABx/SBGt0ctT
         XXIw==
X-Forwarded-Encrypted: i=1; AL+hErGoDYJS6/5C8U7BtH3fWyJOP6IhR/29j3GEiKi3NSG75OYZgrieYTPnXspZkyvoveLEOQXLtT5bmhyQz2E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OIJGvVXtqgKoBYkE6ZHqmbKQyPMkcWIKPiaib00RhynIFhUHy
	x2MCa+EwEDNV/pwkOqVNtKmjR4Ugkfcdx+cwvqHPkXyimjuP+/wqZsME/nHkWwJzPR10ZEV9wXP
	/M6psWITrF1jntKlRDAthZzc70D/bWmXTWRLF
X-Gm-Gg: AYBFou1ATdmOJHYqtzheJKr1XC9LoGwvNqc2OB1tIGkaj24LuQRYm2KK0oDxLFcxuUI
	cQ3fYDHWmPrY9sA8x3PlYGQPCB3yFeN/QW8j2HzVuRfK1A1AswjvKN+fZVvpP4DomFF/zZR/yod
	QU903xLLrMUrDYPCPN9hE/oposJh5ovEnUuZUKH4/SnDb73R/KKBpdmLQc5Bl7Ky1EYLEdnsOe/
	v0l4bMISc65yOqDqfswDIspN/XRIZ9CUg1V/k2F2mX/ILoD+Ke/6fsY4E/bIY/PiQMzcNeVrK2Y
	yAW61HObUpisNKOEG/K4yLXIzhlCriw/s16c5Gw9EJF5vlkB2Qhkbh5LRipO5hMJfPH7ZbxsP2U
	q0WdYW1gULTD8XVczwc0OopRFZor06jl40mFbs7NnKTKZymwZA71rO9XW//maxVNQ3NANVJ2eAt
	/RyTX6/IEZAmuHywA=
X-Received: by 2002:a05:690e:d83:b0:67b:f64e:b323 with SMTP id
 956f58d0204a3-67d897f316emr491608d50.87.1794524371234; Thu, 12 Nov 2026
 14:59:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
 <20261111-gx-formatter-use-spinlock-v2-1-763241aeca52@baylibre.com>
In-Reply-To: <20261111-gx-formatter-use-spinlock-v2-1-763241aeca52@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 12 Nov 2026 23:59:20 +0100
X-Gm-Features: AclHuK86E7RwyUwDuKN1XBLuFvJlmfcg53qNUpHMBnQ5zRn_8wYfmQuNj2Yj5C0
Message-ID: <CAFBinCCdqpb-d4wEThYCLLEa89eqUNycxn7BYHMq9a6nTVPL=g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: meson: gx-formatter: change stream lock from
 mutex to spinlock
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:12=E2=80=AFAM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> Currently a mutex is being used in 'struct gx_stream' to serialize
> access to structure data. This was inherited from the AXG design. An
> important difference though is that in axg-card dai_links are nonatomic
> so callback functions like 'trigger' are allowed to sleep. In GX instead
> dai_links are atomic.
>
> For example, starting playback from userspace with
> 'CONFIG_DEBUG_ATOMIC_SLEEP=3Dy' results in a warning message like:
>
> [ ] BUG: sleeping function called from invalid context at kernel/locking/=
mutex.c:316
> [ ] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 272, name: spe=
aker-test
> [ ] preempt_count: 1, expected: 0
>
> due to the following call stack:
>
> snd_pcm_do_start (called with spinlock taken)
>   dpcm_fe_dai_trigger
>     dpcm_fe_dai_do_trigger
>       dpcm_dai_trigger_fe_be
>         dpcm_be_dai_trigger
>           soc_pcm_trigger
>             snd_soc_pcm_dai_trigger
>               soc_dai_trigger
>                 aiu_encoder_i2s_trigger
>                   gx_stream_start (takes 'ts->lock')
>
> Fix this by changing the lock type from mutex to spinlock. This is safe
> on GX platform because all formatters' functions only perform MMIO regmap
> calls that do not sleep.
>
> 'spin_lock_irqsave' is used in 'gx_stream_start'/'gx_stream_stop' because
> trigger runs with IRQs already disabled and stop can also run in IRQ
> context (e.g. in case of XRUN while executing 'aiu_fifo_isr').
> 'spin_lock_irq' is instead used in 'gx_formatter_attach'/
> 'gx_formatter_detach' in order to prevent IRQs on the same CPU that might
> end up calling 'gx_stream_stop' and therefore deadlock.
>
> While at this also improve 'gx_formatter_detach()' by moving
> 'gx_formatter_disable()' under the spinlock guard. This makes it symmetri=
c
> to 'gx_formatter_attach()' and ensures that the prepare/enable/disable
> formatter callbacks are called with spinlock held.
>
> Fixes: a295be8d6210 ("ASoC: meson: gx: add gx-formatter and gx-interface"=
)
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
