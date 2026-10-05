Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F191730C632
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 08:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791187407; cv=none; b=dgtiB+3veyZPl3juL12ZB6OziJg3MaEmWvq+CXHvO5KUj5p8CA5LcmKm51bvn1bcs5droXpyt+EzoY3wt9hr0lgHIrn7I9dEgvHbV1Xbj3XBLdFYpbsUUUTby0eWFZS3GkMBioKfa1XJ2gJwF1RJ66aOJWh7xzu3HurGgKsC0Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791187407; c=relaxed/simple;
	bh=cDK7eaO9TIqc7eENuFf4Hja36hKlXoeZzxw2D5zgDH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNzc3k/zqkluUQb0AHL3EVGMDp41xYGDxylkio15aHl9BQ48wjBryUMX006xZj/m+AKLznfYpQOpr6g5Le3QhogzPaou4zbXeRjXAIhb4V2UmPaKm93CsqnuUq2QoNpfQMOYDqPJhF7hOcSLzZ6yNxuekgAgGmjgWRgS4YDbF+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QcNUl4KX; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QcNUl4KX"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1462418f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 01:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791187404; x=1791792204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zf8a4U/eZRmPAL9EPlXZ+IeLso4MWrV1ScfZ6D1RB+E=;
        b=QcNUl4KXWUMWOPlX2JdPbW7vrjg8HEt6moTmN+Abn/lb28UhxO7wWMx4vSPCSmLuYz
         MflAQCZ/LM8U/92fL/eUqfMMH5+riskkvsbWrXXupvUTiQ+UrCf51jHLZIaxDmCeku6Y
         /mFT0GC7CakRRASWuEtYe+PcYE2w/rnECInNg/QajKVWyjKsPVCw2JzeyjztyzDGhdhH
         tGeXeSWoOkVw/P6gVeqym6g2brjQsGOp7xc/hw+jdPogwzw++VQcNreNPxVrZalEHtSC
         MBKQNOf/b0AEEjVvDFdkDRktXkyCMG/dzCgHs9SNFOOfWJTa1akQdjG/Id5wgJn8eS3B
         ZMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791187404; x=1791792204;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zf8a4U/eZRmPAL9EPlXZ+IeLso4MWrV1ScfZ6D1RB+E=;
        b=nGTz5vWyiOmURFMEMa5ewVzx3ucw7WnBmqRKZjPmjfPfcqknfcx3oi8slW94P/TrVW
         A5FipgYRtW5qX/f7gBPcHLVs/anj8hfsFPMmWyGvSjX5U9jOn4EQbftLJI/WBL6haq81
         opNOvegcuuShwcrf1fh0BgjXxnq1iRmHKLAfz1ZQO+x5Zg8llNi0bTShEx6mEWtr6Bio
         HT27NXGYSxVH1Pb37zJM8KjV01NIFxRbL9RBVW4YeVRkgbB7Jf3lYdLx2HWcVUG14dDz
         3g27VbkcokG4zHJmc8581Aa5KDexq4Yq7A1DC3yhKLbE5Ya6AEgaIg6uKyP5U/oQHVTI
         g0YA==
X-Forwarded-Encrypted: i=1; AKwUvBy4SsvAvE4sRxLTjc9QGncvceixtKefHSGrxu/w1aO2rslYDwTHtVAVQaMTIAQuPI5JAB5Y8IHDNd6f4wo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ718IXbtJG60Am+gKcf4uV7Uv8L2A8KvVc5MvhFM8ASzd2LQkh
	UbdKaCBnR1gZjOL+ICF338oeUb0Rl5J57EDaYWl7vWKFiGcBvFsth/se8yvsBn6z5K8=
X-Gm-Gg: AYBFou2LlPDPxCGOOm9+TcSzvrOXlkkpa/B64x79CXz9VluFt7EG9La42nwnsyi7B/T
	KL/boXNwrpIB6k0cDld6bg96WKhl13LZqccbBTL3y2mRrCq9/oqbaA6eD7YXYEtRTFftOIVYZeZ
	akROj4OkDmw1s0u9VhJU+AqA7cGy5F6NsdPsfBGU4/Fm1kER1De9dyUgAIE9iCWqUiKoLyw6lWT
	o1RFJeDmviZcUHj5dSso2CYk2JRE1X65edyFGMGplERkQYPhsO1xSWb5TAYzIWvnaOphL4QEk2Z
	x8kHDAWRDHnb4Hcrr/s6kjO/NfkGubl2YcceX6JObbHOTAMxHPQw+3ssSmmH0HF1mfVVBtF8ecX
	q6XYKlkUO8GpKIiCRFreIYjY+Hl3fMHGpRCKA0IP9yFcuqCff7yT6SszCm3W63XsWyCcZFe6vo3
	v9CphxdqR/6FhgP+p4UQvgALNY6xCoOdWxd3+wJkbfABeBIj516GYbl+95RJfVofsPzNIKxAHrH
	7c5YG4qBDc=
X-Received: by 2002:a5d:5f51:0:b0:48b:f92:1f67 with SMTP id ffacd0b85a97d-48c47fd0cf8mr11000087f8f.21.1791187402499;
        Mon, 05 Oct 2026 01:03:22 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:ec49:36a8:7075:6d05])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622ab326sm1821127f8f.35.2026.10.05.01.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 01:03:22 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:03:15 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Alex Robinson <alex@ironrobin.net>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Steev Klimaszewski <threeway@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] platform: arm64: Add Lenovo ThinkPad X13s EC
 driver
Message-ID: <asNZw4mFy_xOmCVD@linaro.org>
References: <20261002154231.31376-1-alex@ironrobin.net>
 <20261002154231.31376-3-alex@ironrobin.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002154231.31376-3-alex@ironrobin.net>

On Fri, Oct 02, 2026 at 03:43:07PM +0000, Alex Robinson wrote:
> Add support for the ThinkPad X13s embedded controller to expose keyboard
> backlight control and firmware-driven brightness changes when booting
> with Device Tree. Its backlight, event and power-management interfaces
> differ from the T14s EC and require separate handling.
> 
> Preserve brightness across lid and system-sleep transitions using the
> sequences described by the X13s ACPI firmware. Keep temporary suspend
> blanking from overwriting the EC's saved lid-restore brightness.
> 
> Report firmware-driven brightness changes such as Fn+Space, but do not
> report lid-open restoration as a new brightness change, avoiding a
> spurious keyboard-backlight on-screen display.
> 
> Leave EC wakeup disabled by default because the shared interrupt can
> wake the system on lid closure and no selective event mask is known.
> 
> This follows earlier X13s EC work by Konrad Dybcio and Steev Klimaszewski.
> 
> Assisted-by: LLM
> Signed-off-by: Alex Robinson <alex@ironrobin.net>
> 

I'm mostly just curious, is the input/hotkey functionality in the T14s
EC driver not relevant for the X13s or did you omit it because you don't
need it and/or to keep the initial driver more simple? It seems to be
present in the X13s ACPI similar to the T14s.

> [...]
> diff --git a/drivers/platform/arm64/lenovo-thinkpad-x13s.c b/drivers/platform/arm64/lenovo-thinkpad-x13s.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..f1ae4c8e67159ebe04ec7aa6521b0ac9ad07a97c
> --- /dev/null
> +++ b/drivers/platform/arm64/lenovo-thinkpad-x13s.c
> @@ -0,0 +1,408 @@
> [...]
> +static int x13s_power_gpio(struct x13s_ec *ec, int value)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&ec->lock);
> +	ret = gpiod_set_value_cansleep(ec->power_state, value);
> +	if (ret) {
> +		dev_err(&ec->client->dev, "Failed to set power-state GPIO to %d: %d\n",
> +			value, ret);
> +	}
> +	return ret;
> +}
> +
> +static void x13s_exit_low_power(struct x13s_ec *ec)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&ec->lock);
> +	x13s_power_gpio(ec, 1);
> +	/* DSDT: GPIO176 high, Sleep(10), then register 0x80 <- 0xaa. */
> +	fsleep(10000);
> +	ret = x13s_write(ec, X13S_EC_REG_POWER_STATE, X13S_EC_POWER_STATE_EXIT);
> +	if (ret)
> +		dev_err(&ec->client->dev, "Failed to exit low power: %d\n", ret);

AFAICT the ACPI implementation has a retry loop here with 3 retries,
similar to t14s_ec_write_sequence() in the T14s EC driver
(\_SB.I2C9.ECWS). Did you omit that on purpose?

> +}
> +
> +static int x13s_suspend(struct device *dev)
> +{
> +	struct x13s_ec *ec = dev_get_drvdata(dev);
> +	int ret;
> +
> +	/* The IRQ handler takes lock, so disable it before taking the mutex. */
> +	disable_irq(ec->client->irq);
> +
> +	/* Capture hardware brightness after completing queued LED updates. */
> +	flush_work(&ec->led.set_brightness_work);
> +	ret = led_update_brightness(&ec->led);
> +	if (ret)
> +		dev_err(dev, "Failed to save backlight brightness: %d\n", ret);
> +
> +	mutex_lock(&ec->lock);
> +	ec->preserve_saved_brightness = true;
> +	mutex_unlock(&ec->lock);
> +
> +	/* This flushes brightness work, which also takes lock. */
> +	led_classdev_suspend(&ec->led);
> +
> +	guard(mutex)(&ec->lock);
> +	/* DSDT: register 0x80 <- 0x55, then GPIO176 low. */
> +	ret = x13s_write(ec, X13S_EC_REG_POWER_STATE, X13S_EC_POWER_STATE_ENTER);

Same here.

Thanks,
Stephan
