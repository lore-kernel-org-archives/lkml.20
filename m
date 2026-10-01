Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1C23CB2E5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790838773; cv=none; b=OLYoEflSRBYAVKQ6xFN57MIuThHamTYuhLwmn/lWeGVokAz29OR+yGCMiDRE9Y/LYH7WiUmjFrGdwr+hoA8dxvlRBIjthALD7joNhhI5iwY3uWON3PCP/MGcDwpsEzj4cnrlHs0C5jsfyVoUN7zQJ2wsfFTg6dD9jAU6/RiPszA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790838773; c=relaxed/simple;
	bh=pYWtNKCEIADez2nraxJLiPh9vUf2EF3j8+4MBsskwq4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SipMO9figvQqSwK3Tmr+8xggiEWyxoxNohgAjhc6D5e3L7K7MdByTarZayhMcuSO2yAc7xMm9jnZAmoDWw1E9Peh/yzUS9MUwvCq+IrvNYjwe7wiBEAEFvA1VqUhvUkS5z2GEkc2Qi2M9mTucgA3NoMnl5hy+DrHb3YU9xmouqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nvvAq98H; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nvvAq98H"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a00713639cso31381915e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790838766; x=1791443566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LZp7N3gR+8r2ILusI/guKJp40S5QXhy02pTeE4zBRNk=;
        b=nvvAq98HcLZsbqovBW4daMhJdmQa3RzDT0whKjQiddAA4z1VnxjQMqcWI92CrY7TRo
         VRVeQ6+BG036B3s0+wB9wSewSUGAyBMTyvxPIBFiuNiAGy1ZNrbND1GLPkou2j2BjooR
         pchEo7khLRu8jBheDM/TYzqUpoTFaCCAoIwUerCaU4whECPPWrLIMaiO1rNkGmUdq2m5
         W+oS1DUU9G9uP2wtS3HCwrh4qGmAH3VN3hu2NvWwFPCIRTYrV3ZxYUVY/rRQA9R8ExUj
         0flh6CE6WKqIf610PiFcqXECZ8WjpkMI5PSRVWAMNbxwEnYX6SUGBQmNojB102wFpZkK
         6i6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790838766; x=1791443566;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZp7N3gR+8r2ILusI/guKJp40S5QXhy02pTeE4zBRNk=;
        b=Q8Ellk4cl9VqieWEEHfBhKLPD7q4f+hhf4hIemiejVpxgbrlko5BPt4FkMERo6HYc4
         10DsG88bQJAkotqylWT546OqmGcQutCoFe3Id0L+4FmCDqNCP3+i54m1ssc7eagSglQ1
         PozScS+hYwlR2IhiW9U1l4s2r9oJuDb7JCAH6s4YxQaScdFYNmx0ndk6+P7Ab/SWn7ic
         XPJrJoJ8nmLHEUUiTDr5CSUJF4TGXRvbU4DUrNzj4p3mU2XC7X3VYbnNA34qxRveT2iC
         TI4Z8+xiX+flqWcYFgFe0HJbQF7II5RZbQXDeJ8KWir+TFZuBx4S4fWUNUo7Plhp4EID
         M60w==
X-Forwarded-Encrypted: i=1; AKwUvBz3wAOHtKSfoe2i+E51rz6cOewijMttQwOeW84OUcZ56fSxmet61GGtMF+9SbmmSZnHCubxljhH4FPFue8=@vger.kernel.org
X-Gm-Message-State: AFuF++kh0Ku6uMCwne2FLpajZuIb5IZL0KRpgQBaQNoFsh/QYOjzwtZs
	diBf1prBoWLtzZ2jZ/lhoRswMJCZilul4Zt6OJ8JgADzmRD6oKQWKDd7
X-Gm-Gg: AYBFou3F6ljMcNvHrOFev5YfzzyPJKUgcYjKdkDutR3+K/Tq8TulbZTtAPi8pP5Pe1m
	uPkLW1DhafNWRlc3W1jPzSAk44wxN4Or+UCCKl/CxlyYo92Tar+7akpfokkoFsUvGk8jc3vQlEU
	mMG7bbBrxz23aTafxuQVaNUdDkOCpJXBHr0XZZUdkB8kHqYP13tOqPhiE/KSEqQUPIq3mfcc0Od
	MQp2obVSEaIilYGbdl9fczRwaZJ5Y5LG5FFF16hBDaIjFa5YNx6Evy0Mjv0vDkJOJEKhroRID53
	Kz5PaWBHgq9cu14fJ1TWdkeu9WETnRKHgqvYAtcb2mBCIjF1/RRBuC+s2Wcm0K2t6AsIMqgKv2S
	ysC0ZqSko9OtL0ZHjlhrPkFTnGFuuyVTot4AMYDxBc/7mjZI6dxrv85y95IsODAl9vBCpjnfJd7
	k7ZaPR1syQF7v5Bbzl9xooCFmTxDP0mnF+YdqeCMOUIpIlzetVrXpRQGXgwGGEb3OALTI5xS4I8
	fjoiijWkF/QZPslCVMUY/qA26GF7t2wshNckHswKdFWfYDRqI6/h7IBPmOD8emlAsOjwbJ9ktYB
	ASZfXuHbgblItOS+iOWOjAzCKCuMsXSeNDumi7KEMWiHIyczNuT/BEU1UaY1GzToo3jmo71BcWy
	r5ZK2uCuv+p1KLvPB9WNMkZUj0Ooa8nmLGidHUIea+/Z7ZLK8zXjnvTVU1UhFLyU5fRvSsDWoLW
	SsR6Ze
X-Received: by 2002:a05:600c:4f8e:b0:49e:745d:c317 with SMTP id 5b1f17b1804b1-4a01b0087a5mr56943735e9.12.1790838765815;
        Thu, 01 Oct 2026 00:12:45 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f97a0aesm43532655e9.3.2026.10.01.00.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:12:45 -0700 (PDT)
Date: Thu, 1 Oct 2026 09:12:46 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Archit Anant <architanant5@gmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, andy@kernel.org,
 nuno.sa@analog.com, u.kleine-koenig@baylibre.com,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/10] iio: adc: ti-ads1015: modernize resource
 management and bitfield logic
Message-ID: <20261001091246.000068a8@gmail.com>
In-Reply-To: <20260930171204.12863-1-architanant5@gmail.com>
References: <20260930171204.12863-1-architanant5@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 30 Sep 2026 22:41:54 +0530
Archit Anant <architanant5@gmail.com> wrote:

> This series modernizes the ti-ads1015 driver by updating its runtime PM
> handling, error handling, resource management, and register bitfield
> operations.
> 
> This series builds on top of Stepan Ionichev's devm error path fix [1] and:
> - Replaces SET_RUNTIME_PM_OPS() with DEFINE_RUNTIME_DEV_PM_OPS().
> - Sorts the driver headers alphabetically.
> - Returns -ENODATA when match data is missing.
> - Uses a local device pointer in probe.
> - Converts suitable error paths to dev_err_probe().
> - Drops unneeded '< 0' error checks for functions returning 0 or error.
> - Converts mutex initialization to devm_mutex_init().
> - Transitions runtime PM setup to devm_pm_runtime_set_active_enabled().
> - Inlines the redundant ads1015_set_conv_mode() helper.
> - Replaces custom shift macros with FIELD_PREP()/FIELD_GET().
> 
> [1] https://lore.kernel.org/all/20260529183708.17819-1-sozdayvek@gmail.com/
> 
> ---
> v5:
> - Reordered patches: inlined ads1015_set_conv_mode() before applying
>   FIELD_PREP() to completely eliminate code churn.
> - Extracted FIELD_PREP() evaluations into local variables for
>   regmap_update_bits() calls to ensure clean line lengths and readability.
> - Added a patch to return -ENODATA when i2c_get_match_data() fails, as
>   requested by Andy Shevchenko.
> - Split devm_mutex_init() into its own patch to decouple it from the
>   runtime PM modernization, as requested by Andy Shevchenko.
> 
> v4: https://lore.kernel.org/linux-iio/20260827172100.39176-1-architanant5@gmail.com/
> 
> Archit Anant (10):
>   iio: adc: ti-ads1015: use DEFINE_RUNTIME_DEV_PM_OPS()
>   iio: adc: ti-ads1015: sort headers alphabetically
>   iio: adc: ti-ads1015: return -ENODATA when match data is missing
>   iio: adc: ti-ads1015: use local device pointer in probe
>   iio: adc: ti-ads1015: use dev_err_probe() for error handling
>   iio: adc: ti-ads1015: drop unneeded < 0 error checks
>   iio: adc: ti-ads1015: use devm_mutex_init()
>   iio: adc: ti-ads1015: use managed runtime PM setup
>   iio: adc: ti-ads1015: inline ads1015_set_conv_mode()
>   iio: adc: ti-ads1015: replace custom shift macros with FIELD_PREP/GET
> 
>  drivers/iio/adc/ti-ads1015.c | 160 +++++++++++++++++------------------
>  1 file changed, 76 insertions(+), 84 deletions(-)
> 

I have two *very* tiny nits that can be tweaked when applying. Otherwise
LGTM.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
