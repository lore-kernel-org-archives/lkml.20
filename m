Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E03C41DDF0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792151424; cv=none; b=BmspPUCJUaCUnNBGagW61rnApdv2buq11GkJKejv1EqOCFb812ij9lo71IIXfZBjhgOBueTqjjAJFsbJyiRptLqRaTL8aceqdu9/GvCl6Owdi6D6BgKJAJr8TLuxF/AUS/wWQzmMcsVcphhGxCrUF2cYz45xu5g2Uw1t+NV4VYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792151424; c=relaxed/simple;
	bh=1a9MCT8Cm/A1hVksA6LjcTFs8zA/cgY41rAIEPY2FME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rabit+PdS4yCq7EeYP3lq8r42qbFGRrWbSiouPFQyvbD3Svp4XZhtBDqTNzD9bXycbuyKEMqKDIHalLFH6amxjaqpTGCKlbZfix111iSO9W83VgS1buBIbwoP3arcKjmIsoM9gTMYdbZBQOrpLRbnhXm/7S+/bisKKLiIbHPWaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QzMDMbGZ; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QzMDMbGZ"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4ca696de6so3575218a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792151422; x=1792756222; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wVeL1rPVZJdsXQDna6VLNmnPhET76Llh1vUPBWe1Z9s=;
        b=QzMDMbGZzNQBwIroZ9kYSi/8q4oxSO/jpglNnkat/gE1clOSQ6xhjuUHo3J8tDOmYZ
         WpbM2h3mwEtthXh4ugaiexAtyPUenj7q9QW6CbM09jIzJyUvfxcJvAgmPelYN1q6Sl98
         OH6463EuFy9p1u7ZRYfngP/TjvyjUsbKaLzas70KRmY1XMQKd2VgUxascld/Ylu94OsM
         wUQlyg9KlYSE0bIHqr7P1ztV3rFEMUBfQ31VSowFkiXz4kcjNAyQEpL27Z4jdp3nkv8y
         YyHOJqsUIONEaQcGyCf7JpZSYB0knfdR6PN1X6T+DXmvcVv+8jecvVN//Q6PEycylefX
         V1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792151422; x=1792756222;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wVeL1rPVZJdsXQDna6VLNmnPhET76Llh1vUPBWe1Z9s=;
        b=DIfNPshbCGrp0T/EbNE9edAUiNlYuOKy00uAaMQYeupDfefab4Kv2IjBeu3+qtKRjy
         Rx0hQtfHQ+MOZhGg/e44ln4KtWewXjHmdcDDPrQtIuJrcNkDr+KezvYbDKPiyx+HpYW2
         FGOKdo75bZ1xHKUKBcdOQiN28Z+E+RjKOXRQ9fj9hGqFvmQVtZI2+njzN+MuaCOOAyfF
         3cQ+/Z4OGTzd3txcDJ5Mc9t+DPHn/QgnplW8tq95YvTvBIuBC6P+tpjd3gBWqTxwkcQg
         wSZ9XOe791pCa3wj7HbHgbysMxa61a9q9TmT1FuB3DfwEq5TnhfBWZYUaOD3wdMdqTwa
         ddGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJURj9LjkZ75tdAftnkXy6PPUym232HWOppfaazNjTVOg4aoUdkzufmr+L5vXuGPE6nnyZrfRv7ucoRZ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1RZzLprSEqSgVNNylNMsqPP8/JMpXA6ygMqSo2uN3WJqTSvQz
	MpDWG1yh9nxuEZrdxyxjTqsEQFR4abl0Y2dGnJzFDH6GfxlQjYJbJ2ru
X-Gm-Gg: AYBFou0AyEDi8gRBuENpdNeqXlWF8tbEUeV7+7l6RAWRqBLoeKRcTTDox9LEUWbeU44
	Gxtuq+gkMXxzpubnlmNGjN2YTk1m4qXPyX3ySrgBz//SqezJ0aW4ibokDAW706WFiDQ0DHUcY5g
	RjqWL4j8aMVHED1v3xL+ZrjJ4kFiizR1xs+BGjNQYWtxmM42gRTyNBEYuYUcsqwXb8RcSuUIoAb
	e91H2VkGMKFsLZSxhUrE1a2uPW1R1yc1vwZq41L1A2f6/ce/5QyX13ydduvfi56sCc8uws/dL3o
	N8VN3vy2B6kZo2MeCgxIWak83ykL+3YF9lkE7cBcgOFP5Z52E6HEwGCcpXiMGUiFjGaiqwCzNdI
	8MwyzqalFqp2hQi/iNtdpXRYn58zlrYrXVZN8AiOoTjzlj47YH5PfwKxK6ULISA9drPkqvKycAb
	E4upPt4oGO3OSKcD4rrzXsuMAc1iDJmYEtRKws4EldXDU5aKq5pP7PAQ222VaB+4obQOExrffTt
	BgI9vI+VOj6Qjws4w==
X-Received: by 2002:a05:6a21:9192:b0:3e0:e60f:2e5b with SMTP id adf61e73a8af0-3e16bde9731mr22875105637.30.1792151422443;
        Fri, 16 Oct 2026 04:50:22 -0700 (PDT)
Received: from rigel (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f579479f8sm980090b3a.38.2026.10.16.04.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:50:21 -0700 (PDT)
Date: Fri, 16 Oct 2026 19:50:09 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: cdev: don't set GPIOD_FLAG_IS_OUT
Message-ID: <20261016115009.GA111978@rigel>
References: <20261016-gpiolib-cdev-direction-v2-1-aambrozewicz@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-gpiolib-cdev-direction-v2-1-aambrozewicz@nvidia.com>

On Fri, Oct 16, 2026 at 12:22:58PM +0300, Adrian Ambrozewicz wrote:
> When a line is requested or reconfigured through the v2 uAPI,
> gpio_v2_line_config_flags_to_desc_flags() copies the requested
> configuration into the descriptor flags, GPIOD_FLAG_IS_OUT included,
> before gpiod_direction_input_nonotify() or
> gpiod_direction_output_nonotify() asks the driver for the direction.
> If the driver refuses, for instance with -EOPNOTSUPP from
> .direction_input() for a line that can only be an output, the ioctl
> fails but the flag keeps the refused direction. gpiod_free_commit()
> does not touch GPIOD_FLAG_IS_OUT, so this outlives the failed request,
> and GPIO_V2_GET_LINEINFO_IOCTL reports the line as an input while the
> hardware still drives it, until a request without direction flags
> makes gpiod_request_commit() read the direction back from the driver:
> 
>   GPIO_V2_GET_LINE_IOCTL, line 0, input:         -EOPNOTSUPP
>   GPIO_V2_GET_LINEINFO_IOCTL, line 0:            input
>   GPIO_V2_GET_LINE_IOCTL, line 0, no direction:  ok
>   GPIO_V2_GET_LINEINFO_IOCTL, line 0:            output
> 
> GPIO_V2_LINE_SET_CONFIG_IOCTL updates the flags in the same order.
> There the line stays requested, and since commit 92ac7de3175e
> ("gpiolib: don't allow setting values on input lines")
> GPIO_V2_LINE_SET_VALUES_IOCTL on it then fails with -EPERM, though the
> line is still an output. A line whose driver refuses to make it an
> output is likewise reported as one.
> 
> gpiod_direction_input_nonotify() and gpiod_direction_output_nonotify()
> set or clear GPIOD_FLAG_IS_OUT themselves once the driver has accepted
> the direction, emulated open drain and open source included, and
> nothing between the copy and those calls reads the flag. Leave it to
> them, as the v1 uAPI already does.
> 
> The other flags that the helper copies stay as they are. Active low,
> drive and bias are what gpiod_direction_*() applies, drive and bias
> possibly before the driver refuses the direction; edges and event
> clock are the character device's own. None of them is read back from
> the driver, so there is no earlier state that is more accurate to go
> back to. A failed request releases the line, which clears them, and a
> failed reconfiguration leaves the line, like the lines before it, with
> what was applied up to the failure.
> 
> Reproduced under QEMU with a test GPIO chip whose line 0 refuses input
> and line 1 refuses output: both refused requests and both refused
> reconfigurations leave the line info with the refused direction, and
> setting the value of the reconfigured output fails with -EPERM. With
> this change the line info shows the direction of the hardware in all
> four cases and setting the value works. First seen on real hardware
> with v6.12.
> 
> Fixes: 3c0d9c635ae2 ("gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and GPIO_V2_LINE_GET_VALUES_IOCTL")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>

That is an incredibly verbose commit comment, particularly the
discussion of error rollback behaviour, or lack thereof.
This probably isn't the place for it, but I'll leave that for others to judge.

I'm definitely ok with the code change.

Reviewed-by: Kent Gibson <warthog618@gmail.com>


> ---
> Changes in v2:
> - Subject says what the patch does: cdev no longer sets
>   GPIOD_FLAG_IS_OUT (Kent).
> - Comment dropped (Kent).
> - Assisted-by tag.
> - Link to v1: https://lore.kernel.org/r/20261012-gpiolib-cdev-direction-v1-1-aambrozewicz@nvidia.com
> 
>  drivers/gpio/gpiolib-cdev.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 5d53bfcdf726..f4d78113ade2 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -1229,11 +1229,6 @@ static void gpio_v2_line_config_flags_to_desc_flags(u64 lflags,
>  	assign_bit(GPIOD_FLAG_ACTIVE_LOW, &flags,
>  		   lflags & GPIO_V2_LINE_FLAG_ACTIVE_LOW);
>  
> -	if (lflags & GPIO_V2_LINE_FLAG_OUTPUT)
> -		set_bit(GPIOD_FLAG_IS_OUT, &flags);
> -	else if (lflags & GPIO_V2_LINE_FLAG_INPUT)
> -		clear_bit(GPIOD_FLAG_IS_OUT, &flags);
> -
>  	assign_bit(GPIOD_FLAG_EDGE_RISING, &flags,
>  		   lflags & GPIO_V2_LINE_FLAG_EDGE_RISING);
>  	assign_bit(GPIOD_FLAG_EDGE_FALLING, &flags,
> 
> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> -- 
> 2.43.0
> 
