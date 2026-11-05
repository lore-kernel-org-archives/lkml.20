Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793880590;
	b=4a9NbuP0FIJ7XvDcfLg28ZVlXHIAkizo1cQqpTXJgpq02M9nbQE5WAB8053XVQ2jxlQA
	 tXqOueV1t56RHiY/LkYhslZtln47aEoF9GvYZniZbaaD4ml3wDySpCxINTV+FLxdageHx
	 NsxwukbvNmRv9uaDqvENuZ0rVUcNvi85CwGs6KLCCsIAbm/y5kYYSlqtpVcRWttqNbzrq
	 vyzn7RCyY+Gxxj21p/X3P8JTuemJc8XoVb/Q3swyPMQGOGt810wV+XetY9AK61k4dq5Ea
	 ndjGEl/ga5EUYu08VFiTuPidJPVHQD2I8rJ/cWVuogT7+5iiDsKm6Ufaa32t7lY8sQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4fvBY9zhAaIiPkSg9Hq87qAnpt7MuwN0ORLvoKho5YI=;
	b=zsBQedL3EPvwRcdnjwS3g+ARkYjf5wJIs+ugEekl9K+O3EGz4V15/f9VIGdOGoEeIVVd
	 CIFgYAw5b1Hg+RVgDVlBETCxfy1d/eV2FEPedGiTlBAJowdH6B0R76JsOy+LC4u2dyJpz
	 XYV3ligRCWV5Bi1FXLW7z3/LgQG0bkeLNFxMmeUuwrKpxAyR3Mzy3Cpw+y8zvuCU1ps9h
	 YQ4ezuWeaPQ5CFFz0vcuLmcNMrNGqZ0JZqifrqFKiLFAFwhdDPztx2RTZAlTspjlxIdd8
	 /mqj1M1TSNKesEtv/fNNe5VNTbva8ZYjrr+i97FAchIZLmXc38m3VqkFmMXkf3XNRPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Q+WxMlJf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491B6606D829
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 491B6606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Q+WxMlJf
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so3515a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:09:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793880588; cv=none;
        d=google.com; s=arc-20260327;
        b=kMtc9NGXrORglFElPnIdIzM1EpdCKlbt0TKdzs0VpVinlvZJCjLPjFTmvFxALjdC0D
         MwJtarBHj79Ll2mNdPneNgP6u4b3j2G6wxkqfB8XS+yXB5aPGVx5BK5mkcY7xlywtw6r
         ts/nt7JioRs4vnyu/8NlNwa9wgzbdEtI+brWJdpGFWnHFmcWP7ko9aFziQksgZ9i+a4a
         tywqNtAblAKNab5jmupK4mLQqWlO6hkX4se3ruxQxq6ihSEyaESV9epdJGLLf+F0rV1E
         t9QJZGgMFIHLmCgb3ssvNs69jaD0VgjkWupwf9w+58Ix2SShq5jClvx4oXdQiBMiO/56
         3fBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4fvBY9zhAaIiPkSg9Hq87qAnpt7MuwN0ORLvoKho5YI=;
        fh=2fh4qaJL/Q3hi/Ta5pyMA+eE7sCwMZVOAhZDKeIdvPQ=;
        b=KUq7XrQF8hqc+ed6HttHjUD/T5wO/Lhy3ENcyQEW3b1CtfrxwcTMdppEdsFg9NuPeM
         MZga/1UmdWeg9cqkg651X0buJ74CmxBRGCk7L7Wp3hRwy5FA0qdVSPAqt4jadsu8SYAA
         ihlhofGKEcB3YwKf9Yi0i05+nwlxMs13TddRX12YsLqkcigU0znCaqUwdZYKzyaxDYWh
         ib36fDKD4vZ9L/PBshs2h8ldLAXbpeRswJUY3qiBkGijm+VjFEqbLxo3rlbs98+yaD3L
         Oj5OicLSc3fsD9jR4xip0+u0WrupHUh+Bv9HUgUG+Wwa9KOqEem/NrUff8WnV+9Nr3K5
         Dd3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793880588; x=1794485388; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4fvBY9zhAaIiPkSg9Hq87qAnpt7MuwN0ORLvoKho5YI=;
        b=Q+WxMlJfY7MViaU6RLvN7dpZUozphjLESBEG2broJDvOwYJAvRWCePoSVYZS0ayrT2
         yDPeKobp0ymw6o0GmblbfC4Q4XpXjHwETjYN8qOZ+7LIAGdXwRxgFNxx2R/jU99w9CRx
         C4E9xFsAmOh9/8YZaYPyDChinvKxfAxj/aDcldSCDR3UUP6JPc4RgEbL3iQry7cHWlyK
         a+rj6L0fgiNySzT0SzMHdI9iA7jrUdVxbhaDTTtCk7GpvoSXfTTKuY3Nv5/4+2TI4Qkh
         OcGPtSb+I5CxNAg75wEatcEV6sQphoKgiOn3L7Cb3SpJ5uHIAvghzWrl6bJx0E45NSny
         FnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880588; x=1794485388;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4fvBY9zhAaIiPkSg9Hq87qAnpt7MuwN0ORLvoKho5YI=;
        b=wts/xZ1X2V8nK9VtsImSXQI+v3oVYVbsSnMRJYAQ2ahiKyPAD/v7fzCJ5oSgx+b/8q
         vDH3n0ggXeVZCDEAIHnqu4bISVHb2XG/GR5DkE1IJGguHfvvPkNIcMVTYitXAjuYIy3V
         3LYNRYZOlI3sOW/xKyfX4exEOv+xJt9NR29AxYC1kQrb1bOLK6+C6YowK7enTdO7gKGW
         mLqr/vOS6FcJGbwk/FrAUZBh+x62DTjLOB65SMWW+uhqIvPnnx328j+2tCfPaWC0uFbZ
         7JN080I7W0grMr2S2h7lMOCztSrM4TH5UcGjyer/XlX4L+CmT+h4MxtYVex8AKbm4Cr0
         loBg==
X-Forwarded-Encrypted: i=1; AKwUvBx/M5STfMCP5AGMNWVx3/CdgiEZVMvwGom7TQXMYOB/EFs+2PsbzTzz29zhmkPZ3YNnu5rpbgZGYNbQW94=@vger.kernel.org
X-Gm-Message-State: APuU4Z89j7+tGjGGOokL6tpq3bIICbktgFZ2RxM52AHWP8FIYhV2Zf+E
	mAoMbCyGMSajqqBT514pE3Z0A46JQLZrEdHB8rcPsJIvUyZbW9TGEU7bDuQtE2Luz/oUk3Tq4eC
	5LJGuHoPRTim9s7hwM9jD500f90R1xcbFz/RHdhY7Aw==
X-Gm-Gg: AYBFou2D4TQJlRa2riST4VIbqf1FJy7Z0q8z+I60UolwOGM7Eiw1XpzVrMeTXtjxIbR
	Wc3KfYvDmviKOlxBVgr36i/cf7xtz59U8wGnP3BlWlavcpXzsUE1Cvd82pUVacY1oSeBuakMdRv
	XKEXOF92IeKcSbZx3m+bjIRAxJqUh18ddNejPRXB++9N7aYpF2bS2z70RVkgYw6fz8we/gUEPby
	MBAFl7TdavLRCPcQl/mvxxjO9OFFoWCp5Ka+HoJ9HSMMXGAKOWz3liISHOYj6e1TUeTzpEicLQJ
	GgYXSxoW8aTcnWCYTXmU9Y5LzREqczglf1kOt0x9yOTjTa5CpmeIRg+mfGTSvxDYOEOSMC2gce/
	Nub6ycXoSuFk36D8SST6QDE+g6/wFhwMyuygWdLNeYu8Mph47zIYZuBEPLPo=
X-Received: by 2002:a17:90a:e7cc:b0:3ab:2737:3395 with SMTP id
 98e67ed59e1d1-3ae8979d3c7mr16512224a91.42.1793880588558; Thu, 05 Nov 2026
 04:09:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-14-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-14-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 12:09:36 +0000
X-Gm-Features: AclHuK_MHMThyHgJMV5RxoSYYJYLTJBQMatbDWcZrO2pg9eAtUGM46fm6kw3Mdw
Message-ID: <CAPj87rNp=Qen3CpxdBWHrKqmpDq=w=3fhbuJFM2uVLrwizWQRQ@mail.gmail.com>
Subject: Re: [PATCH v6 14/15] drm/rockchip: dw_hdmi_qp: Enable YUV420 output format
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> Both RK3576 and RK3588 SoCs are capable of driving the YUV420 output
> color format, and the required bus-format handling and VOP2 support are
> already in place.  Advertise it via the platform supported formats so
> the HDMI core can select it.
>
> YUV420 halves the TMDS bandwidth compared to RGB/YUV444, which enables
> high-resolution modes such as 4K@60Hz on links that cannot otherwise
> carry the full-bandwidth signal.

Reviewed-by: Daniel Stone <daniels@collabora.com>
