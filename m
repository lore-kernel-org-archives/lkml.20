Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222309;
	b=GFaXiED/2sRQjrZ73G6jhz/gWsXDi75eDBLWkr1VY2zupEabkHxDBfaVVLmtPOXDleRd
	 neK1Lsf15tauings59Jlb4YjWQSpBD1ECyJwc0oVMBaMKDOUyNy70BRQBWcgcb9uQmXWl
	 5HEknpqKH1UX/v82lG+UpIBM7zby+liKhexqcHNxcwwLAzyga2mJPuyPZwAhHKj77mpNB
	 B/9rFieCLm2xANfxtEVeWqgkAbN1ZEc7Trq1O7uhltRqexxMtTPf5ygZe7XlUSlS+sVVr
	 eFmlG7HL2AEu4Sn6HKZT1NokrFeAtXe6IeNnzv4Cq1UGEv0e3b3oSAW7K6b263MhYIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=gruXRLrwC50Q+01zYBAKobujyZnt2WH+acLyGLcBGqA=;
	b=vVWSUMQd+ouBpJ2JAnI511R+B77z+E8MYvkvZgXc92GD3wovGiBcYIWYUFG5ZmqYsvQj
	 KHLdyQG6Y8OruskEwfq3F6MUmgZCtyRV9pQGoEt/61B0i1RDK/+7HWG1iFhHObCbeUAaV
	 dEfhIj0Xf0wI5Gka/VV7oo0y3/qtlAhnGBkltzrfiaDRfdEMpmemwiP4F+V59YjME/D2e
	 tZXlqm373Tm+RkHxfbOIdAYAV977ONbYG/LeTJIMjdW4hGJZdx8KUak/vJk0VKqOPhXDg
	 iwzeQEMz9WldBYYoDKTcKf8f5DiMrJPeaWEQgSvJ4OGaDHPdHtIFD3qDeUdjKSYhGDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NSykZstp;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A255606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A255606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NSykZstp
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e46e449e8so469164f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794222308; x=1794827108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gruXRLrwC50Q+01zYBAKobujyZnt2WH+acLyGLcBGqA=;
        b=NSykZstp9oTiKUgFJ3UzxLehU62aPWxwFq90PnmqrOYywES4i4AcOzHYZySAY1pVwq
         vwmj6DHH3dVkrhVibCHxQeVt+OxzQ5uX7hZAH05pO/IwWLrsGoc9ifYl79A1NCVf6A17
         IoynvVz/C3YGak6RNV2fLBOpdZMypVS2K47ZFJrlTWQ990UhOgQWQ3c1ir05/s+hZJS3
         HRJISrQT5YoW7RzT89EFMH7RBi6fKBzrKxwQ+L19Ps9oopbaBFlubCxu8MnCwlhIeiLj
         RJjHDHMDIim/9IDvZQ4j4IwWOOMgf0O00+xYtIM6x+s2hBymV3bGjwWA1h8Kw2d4rg5B
         TqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222308; x=1794827108;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gruXRLrwC50Q+01zYBAKobujyZnt2WH+acLyGLcBGqA=;
        b=BILy1McxQJLLnQH6aNMCZkO7mW/TAp1xDcSfps34esL/zY0MpRmacKd2lPTGuyf7cY
         L4xfEitN3VQgQWEhJVmX4uH693IZNcOWagi5AAL6L0xKguRnxtjHVmZiE0MS5n0QKn6y
         JnLQnIKyG2juhlBWMtX+SDBFqBLiiz+fVFMBFJi0U4i/IZVU5yxeWbkLoFenct3ykt3b
         NRfu/PhNry0EaGt2RBAUuroBk1ESNg3Re1w6ZybvlQcYiUNcIEaFnlv1eUu2izThHqCP
         sQMZ9AQkjZTTfaWXgpUrK4o80zD4/IcAv3diGcO5OqfbXxA96C0PfsPIq6cbYtrqmpqB
         SIrQ==
X-Forwarded-Encrypted: i=1; AL+hErH2OjrUZC/1on7f0Pbv1x88Rdv0ME9hJU7b/pmVQChkLKg89+xgwy9zegm23RyGgRZ/jQzfEXkhhO6+y8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ANaDhtFm/eksApsPjjpWPWoHG4v4+OU+sgg7FYRQL8uZCBpXb
	Jj/PSswT6+NtR8nPSXCNSe6AAb0vqYkFztIYaPXtUPHduQjMP1giSCbq7SraKS5UAMra/r/7i+g
	PP/ir
X-Gm-Gg: AYBFou1mKJ/LI3Y32fpCDEFtqtSiedFY57Yuu6HTnNdfFf5Qq50+8sBhwHI5Y32K8Hm
	RvRz81y6WNatmvkCiLrwo3Nuq0BxaSbfXvUmEN1qXMti2DaUX4nn4SQzFg2U65mPy203X4E+hHH
	CfZlTg6t7IlFwmOvEfcQBuJCfz2lbrkqnDCGqp87Fzf59LP7InX5HDb+yWxv2xJLlH8pdKAqPEs
	EaUEZg3xFBJ/aPmkoaRbYkozIHyvgs46+B+xyovTc9VCtY5AEBObXF9gnuNHKi+gxnxkhvLwJW/
	ws524+AIZWldpWk512DydzC2WGkPn98N6IkqEyKtm8wgy9y+uAvKOgjqpYim1s+G6uw+RSwSTTw
	fXl6JXKBJdGLzCkQv+Ma7WhMYhhUv2sKn6QdpuML70zbspmgXNxrQj587jnJxvRZgv+WrNVQKxz
	MDdKsODBGs9yjRQyhE8Ny3Kgz0Qt1/dIwczKj2kh10usPeRHPlMVSBRVkThkqsQwUqKOJjsvXtl
	9EpJQrGTNrBj6/gzueBNl/mdzKqOsupTuz4cKyR2tFLSVI8nvS8G+SnncT0OozKJbcdEi5dfY6Y
	AIdEf5HejI1Nbq7q8g83XbB345teEHnuyAMsrMWoE1E=
X-Received: by 2002:a05:6000:2501:b0:48d:f460:2c62 with SMTP id ffacd0b85a97d-4958c0beec1mr7604586f8f.33.1794222307486;
        Mon, 09 Nov 2026 03:05:07 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596f9ab09sm8970489f8f.28.2026.11.09.03.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:05:04 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Shigeaki Asai <y-asai.0816@docomonet.jp>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, John Williams <porschemad911@gmail.com>
In-Reply-To: <20261004-meson-gamma-v1-1-6347558e2bb3@docomonet.jp>
References: <20261004-meson-gamma-v1-1-6347558e2bb3@docomonet.jp>
Subject: Re: [PATCH] drm/meson: encoder_dsi: load ENCL gamma table while
 ENCL is disabled
Message-Id: <179422230388.1497673.3746542387809770384.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:05:03 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Sun, 04 Oct 2026 23:50:17 +0900, Shigeaki Asai wrote:
> meson_encoder_dsi_atomic_enable() programmed the ENCL gamma LUT right
> after meson_venc_mipi_dsi_mode_set(), i.e. while the ENCL timing
> generator was already running (ENCL_VIDEO_EN=1). Writing the LUT
> during active video stalls the hardware: L_GAMMA_CNTL_PORT
> WR_RDY/ADR_RDY deassert and the ENCL line counter (ENCL_INFO_READ)
> freezes, so every remaining write times out (~8s total at boot) and
> the panel ends up with a corrupted gamma table (wrong colors).
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/meson: encoder_dsi: load ENCL gamma table while ENCL is disabled
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cb7f6d9e4b1d0a411b628ccf78695ad41c66570

-- 
Neil

