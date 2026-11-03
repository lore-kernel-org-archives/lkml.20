Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709052;
	b=2o1y53+Z8NoTRTfKHPq8cfFwWua4twzHV+7dgMFdtxgvtvMoKZIaBLtJPmrFWP9buRTe
	 zEjIED4ZfnoYaqeAOtGMb/wyrBeWQiULpIKICqr67Qc7fkHm3fLDgkeHuINr/tP2HOf+R
	 R67/RzFU1R5dvG9xDD6LC+42Ck9aAtFEit73YIbX+nKzC3u8nYoErrMVepXOt5tmScNwv
	 Xn3MFCS4v8FVjw2T8pCKNrLAEAzmJ4dMs12Da9mhyJbQG2ZD600ZJ1fbriFpKAcbGZkDp
	 JRfqeONmWBAq26EvvA44i0DwHQq1063PMQrfhRvs/Wp8YhAu5CYFw/M5KbmKtVtqK2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709052;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KB2g/xhwGWDv2zbPWHyRIQfvXK4UTK0C8NZGFOTUQZs=;
	b=WY1bC2//hCa//NUtI9GrrwAI/IBCgdNNykzz5wq34Ox4hq2EtozhWLHQLbAqkdEP2qCA
	 sibNeOPeNWSzBIkta87VCxEbAkSqTbxakdtn7fybIopzH9J+DjQMA8qRMYhx2ZBNhJuOW
	 u58PrVRwPd3z61SmbbyA9x8jqJc7f4+wDP3R4pQt3e+W+hPpAAVTHMO3Hug7OxFBMxwJa
	 mVXUiAxJSLvGn0yl/CGN2vnt8vCNUcKN0lyAdi0W+6Niz1R85G6nqLL+ko+l2Q0/1SXoC
	 HmUHpRA/mO5FEd7aTlMLFgvk0/l5WDucT2lr7+2JfdA4rHep5EzcGn8i/1wLeCfA3Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJ0WNbZv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id BE865606D801;
	Tue,  3 Nov 2026 12:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJ0WNbZv
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 786751F000C1;
	Tue,  3 Nov 2026 12:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793709051;
	bh=KB2g/xhwGWDv2zbPWHyRIQfvXK4UTK0C8NZGFOTUQZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FJ0WNbZvadjMoIc+cFB8C1gjRazjqMY/G0DqLMbgTXTR78kZ63fWV3d/bfRYeh+7h
	 SOMibd4zXU1bbsscRCSGnYK2eWceBrwMZFTVoxXMmFmRlMDkfZgNlLfxdisryL1xF1
	 5wZvBBLbHtVDEXZ3hiZDsGlWpxfkwFaiVOjd2ZX1FDcVths4e+xB0fvla1mcEkngpm
	 wIizZPRI/wVyIAyQ2XT5DHgdwaIDChhjH172TG5b0OscEhmMsB1HWLSUH0F9U4y6kF
	 ivAgRYAok23Q77PQVRxGNLb1Xy1ClQ0yK9LlA44eP9DeggLrYdzUcR4x+0C/Dhdd4/
	 Bs3/asfT87xGw==
Date: Tue, 3 Nov 2026 13:30:48 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codec: pcm1681: Acquire sck when bound to a card
Message-ID: <jxowmyizeityjiokldbu4wbnodnhhaleedmnsiytp4n5hex27t@tj4l7jtdg2l6>
References: <20261021031228.2074402-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021031228.2074402-1-shengchao.guo@oss.qualcomm.com>

On Wed, Oct 21, 2026 at 11:12:28AM +0800, Shawn Guo wrote:
> The sck clock is taken once at i2c probe and held for the lifetime of
> the device. On Qualcomm boards it is an LPASS clock exported by the
> q6prm clock controller, which lives on the DSP and is unregistered and
> registered anew whenever the ADSP is stopped and restarted. fw_devlink
> cannot tie pcm1681 to that provider, since the provider node only gets
> a device once the DSP is up, so it falls back to the remoteproc device,
> which stays bound across a DSP restart. pcm1681 is therefore never
> unbound and keeps a clk handle to the dead provider.
> 
> After an ADSP restart the first runtime resume fails with:
> 
>   pcm1681 0-004c: Failed to enable sck: -6
> 
> and there is no playback through the DAC. Even with a fresh handle the
> DAC stays silent: the new provider registers its clocks at their
> default rate (19.2 MHz), while assigned-clock-rates (12.288 MHz) was
> only applied by the i2c core at probe time.
> 
> The sound card, however, is torn down and re-created on a DSP restart.
> Move sck handling into the component probe/remove callbacks: get the
> clock, re-apply the assigned clock rates and enable it each time the
> component is bound, and release it on removal. The i2c probe now only
> sets up supplies and the regmap, keeping the cache in cache-only mode
> until the clock is running, and the cache is synced once sck is up.
> Runtime PM is enabled and disabled together with the clock.
> 
> Fixes: 8987e9a24f45 ("ASoC: codec: pcm1681: Add optional SCK clock and runtime PM support")
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
 
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
