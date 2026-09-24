Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7683F439F73
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280043; cv=none; b=W2csXsvIMeH0/cdLwSxhEodSoX5hxGBKqSzi5ZfDuEYJ9WOac4701l8OG2fvW18c1q0763TRfptip8nSQrDWSl66KuZVZCPgUHnvmyrKlo0QR//wsaP1J8ykcn4F72T1m+vesjZN1p58X/RXlncARBdySmD+85MmYv/9z30+ZuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280043; c=relaxed/simple;
	bh=800XYnUFGFmLVgaPHONWcqohdi4VWbF2CAwETY0CmUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzh0ogBcaOXnKuvrAFrQUZ+jPghhRw3ZIz97OLntSBtGMvox/iupI8zDlGcNNw0f88DvQllbaaZT92HQQWYqbXnTTZUvMrwWedNIz0vI5O/Wpc+DRXltqcKHl0oi62PEDuz4eoWXwoK1RzD3DGf3+skdFtTDM2gQeQaMp94qXyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ow6egLXd; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ow6egLXd"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso1362605e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280040; x=1790884840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Waq+q+bs9tZHLy6mj9/0dS73pghCJzNJ2Bb0y33c6Wk=;
        b=Ow6egLXdUfKSeLXNcN8inGMHH3j/Nv1eS8h+/efytKaVamRQ6LVbRzuFW7soKKy3Ob
         mrqn0EFF9pmnf0epea4MS0EuJHFitUwlwgFN4VnkHG6VCEyW9h9BkfLdpPIcmNgXk+Ph
         GRzHJN6GAgwoV397ugVtvyZuIm1sEX2dWCKER5AzJ7PZrOJ4fjz1ABPUG3k1HVbF3EGC
         U78OOQc46HLOLbHoAU7+CGYKUNRxbegg83yCO3/K42ufzixIhwwb9yacysP0W8Gf8M8g
         eajEAlBZN6RN3lvbKiAEgkkNii9A99u20tuIjfBtoVYMUPsSAi4in0VRvJK46Sm72eRK
         LzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280040; x=1790884840;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Waq+q+bs9tZHLy6mj9/0dS73pghCJzNJ2Bb0y33c6Wk=;
        b=HKaTEPVukY+tZ8z8YgN3Kg7+QhzXutwnqauy7fK9Ug/2dPMluvffsSh8V520/4ga3k
         AdbTwXsFyhwAFw8y8daGFdAhDvHOWLHVO9K/K4vyC5/a6uKXoNijqmIVtU00R1V9ji18
         o6ZXH1P2odqXyNCXJcaHuAfMGC8XA2a/6Xju5n2RMssOJpxzsFitFGZCMN4reS8lv7Vq
         fo46XckIj/Hkmy/Go+pW6Yep5dMEWt45iDDt1rSLgQeGYyBkkPAnp+yfwXik41ha+zhK
         Nu3Zm9w1XXYGS6Psva4xj3t5VqpYbB8DzhLRHwWfaV9yqVH8bItIVXFBEGeHFXmuyumM
         xBaw==
X-Forwarded-Encrypted: i=1; AKwUvBz5pnv8m/eipfXr/ovYL0YKnwOi9sMGTt4iI1Bc6EeZpuqazOJhfpP9aEYosIbDkb81uuPR9sL897/lbv4=@vger.kernel.org
X-Gm-Message-State: AFuF++lnnrGWTM3ePD5aTlYVbN88bgzuZW/0Ub76uH6z/9W4zCIhVnkT
	AG6xf24U7xEkLmkrW7TT3mUTby4GgC+XCm68wKa3jzXNDxDL3eOCMmTS
X-Gm-Gg: AYBFou0AlW3Za2PYIeKOzLizYJwcOjdkk8zBKOsR++0777kaJRbh3uc6hJVMnDhNDg0
	vSjKiyr0+5diWoC2fWKiEf1CA6S96w6PGgbNBruZEcdpF/Q89vRGRhSSbKqMwUtgIBmbZLxSlNJ
	r5dAUiTK+DwX1rCj+TWdpseJk1xTbqQDYsPSC0LRLfXZ1zWnqN/MBadXfwFlIBsu+W21jw2uwzB
	UAfYC164SqwCfMadFi70569mxrwvHOJk6UrlAjQ1n++pKXb0JeoJEyIZMys4P3xtQg/dmI7Zh7d
	kDQUZmtIp29lgsFcCTsSvKHnMTOZZqzj7B94yHN5g6PaORDe0D0ar+gUXtWDLZpvFj8W0bqkD5w
	QgxYOtLgmzAAZfcT5du/Upy3Fmoc5vAr8vgAv4YhsJvPV/yw/TLKgdY01NPzyZbYYNh4SThNYxy
	b3o8iRUQ2OeNVVlJhhiNQz8tbwzw5BZDZ/sU2WGwen4lCpcXX1QdY3q7TOMHdSF9q9mLjUtYpxu
	V/OZj0K/zUHwYlHst9mOaNmY29krQR7uHo=
X-Received: by 2002:a05:600c:6207:b0:49f:bd3c:bc20 with SMTP id 5b1f17b1804b1-49fe66ff476mr67110105e9.27.1790280039460;
        Thu, 24 Sep 2026 13:00:39 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff069ceebsm1872715e9.3.2026.09.24.13.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:00:38 -0700 (PDT)
Date: Thu, 24 Sep 2026 22:00:35 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: david@ixit.cz
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 03/11] drm/panel: s6e3ha8: Really assert reset on the
 failure
Message-ID: <20260924200035.GA194087@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20260924-crosshatch-panel-v2-0-08d5c7bf72fc@ixit.cz>
 <20260924-crosshatch-panel-v2-3-08d5c7bf72fc@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-crosshatch-panel-v2-3-08d5c7bf72fc@ixit.cz>

Hi all,

LGTM.
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr

> Due to incorrect implementation 0 == asserted, thus when driver fails it
> needs to assert reset.

> Minimal fix for stable; the polarity convention is corrected properly
> later in this series.

> Fixes: 779679d3c1640 ("drm/panel: Add support for S6E3HA8 panel driver")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> index 078523df48860..835121b322f4a 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> @@ -179,17 +179,17 @@ static int s6e3ha8_amb577px01_wqhd_prepare(struct drm_panel *panel)
>  	ret = regulator_bulk_enable(ARRAY_SIZE(s6e3ha8_supplies), priv->supplies);
>  	if (ret < 0)
>  		return ret;
>  	mipi_dsi_msleep(&ctx, 120);
>  	s6e3ha8_amb577px01_wqhd_reset(priv);

>  	ret = s6e3ha8_amb577px01_wqhd_on(priv);
>  	if (ret < 0) {
> -		gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +		gpiod_set_value_cansleep(priv->reset_gpio, 0);
>  		goto err;
>  	}

>  	drm_dsc_pps_payload_pack(&pps, &priv->dsc);

>  	samsung_dsi_test_key_on_lvl1(&ctx);
>  	mipi_dsi_picture_parameter_set_multi(&ctx, &pps);
>  	samsung_dsi_test_key_off_lvl1(&ctx);
