Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793360540;
	b=LPlkR4H3RrmqYslQNT7GCeIcd1quPabAmxfT3WMg4kDWJuX5HCg8qFyo7MnnMmBxv8JA
	 FLGAOYTj2zzfGYdOw2uaWMAe3w724R6eNUTPRtDqI/GvnqqfXAs2pQDPvJ9d0aPkWHTBI
	 skPW9oDCLgykVrM8M+zMpUGVBxqdf3W6n0e4hp7WPO85iihGRo1o0AEq0O6F9J3Bg0aPU
	 1f2IRQHGVmrsbneada9p0CgcujMTPgx1PhS2BBFh+vQMpaKaqb3RaXLoAxg3+t9XWTGMY
	 TfJ01HsubApKvMmM3Hpqa/cigsQyGQ4sNkKHLDDeN7nQlaitWSVVnXywTgruyowmT6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4lcETnvcA1FO4VShSmFGhX4tA8WQyd2jA8DOJ8G3k5s=;
	b=Szhs34LY7AVsdFjyeuKDh6yVIKO8NYqNw0+1OaJzI+3hVgb0BlpJVDsvHYQdQAs3QUrj
	 3NZKABc6NqxoOqaDrHe50vp+JlaCDmllizrnxi7H9U3I0xUlIruVhGorz0SfbbW9VfEKs
	 F9CAj7Jb4GH8I4QgCqzUdH2WpOQqIIHptwGhpawITUDD5hkkHPAJ0t0nxjJbaIT1I5Zv7
	 aOGdWZte0PYVDp6e741/KhAEb0HMCixx6tD0uiwRA8I0IHoScqNTKu/bgGLvM3/ZFtOG3
	 Rlchp2Z5GwlTRFapDOyMrtU4LgQ0Qd/NqkGtbuRUyybkE+QtncsJMJ/mpPwT1MUcMuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b="jPlC/G+U";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A68B606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A68B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=jPlC/G+U
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso402631a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360540; cv=none;
        d=google.com; s=arc-20260327;
        b=QjrL4puoVDQiLOnRY7LFVuyQf6Zya0UroxKZ5fhw+anokypgPJrAb2BSv983CPJDXk
         OJCSkVNLLuKUEAfEHzQ9Uju7454RRa8pmQWlU8yt8typ5+5wkWo+Evxbn3JChUXAHJ3V
         KAS3TOgUcHSiFHyKPjVNSwJpjSzDzdxd9lUBHwdH9/Ym9+ax4JmmVIzV5xPIbLqwmGEH
         4xhYkRc5Bj1bCAmQ5vbG98sk5bP5Wmd/dhpkRFgTnwQcw+FB19s6ZMj4X2/Y6kYaxu+9
         qxG/ny39aApMETA7MNQyX1LzD8Qea5gb6jRbMmPrUe0k64cvgq4UoL8MGBW1E8DALm1k
         bOQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4lcETnvcA1FO4VShSmFGhX4tA8WQyd2jA8DOJ8G3k5s=;
        fh=hpjPklia8jdXmN/3+6Q1KskWoY8aZtHdVEf7YB3Mp4Y=;
        b=IBUL3n7uq/Lg/Ehm6Pzz9MjCI1V0rTdIW+lPsryzVr6RFv4DhEiLiofvhLarQUh/kj
         SMLr791oU7tdjBl5K9/vqeV9IcnkBWVU+Z+/uuRX44SgKQY9vrQbQO1bAYMXdlKMJmKI
         46M4GJVXYFE3b2WteYkRCBQi1RibWSdG+9cWNy4n2lZ7vy15jK+gKhQ5vSjmAzZSOqVk
         /kD6BhDBYYfvGvEJ+2hUFe9ES0i0bkiK55Zp4rMsQ72G6OLTcFBqJPNghVmNqUKmA33h
         beFnQt7fs+6BWBIweqD9GUEpJI/1GIYsGg22jbUic8UNkWU3prXU6HNaD0oDDZMZQHlk
         rWYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793360540; x=1793965340; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lcETnvcA1FO4VShSmFGhX4tA8WQyd2jA8DOJ8G3k5s=;
        b=jPlC/G+UIiRplCL2fa1q3u0FLYjvWCUNnw7VEerXiu/Fq/DXer7IYPgZsgWK8b83ha
         syvTK6jnc+GsCtAEeWSB6cAI6NZ0ly1HAbxPogjfBeJttiCeHGrib4ojDaaDDSLIZpys
         I4RiW3Qih/kJL5q+L7Xp4VqfYqG/37iowYQ0XJGv+ZM7RVQy9WOIRIad1ZHe/85ek14q
         il3bo63wQKriM1/asAskIu7Z8qWArH6B+bXvhCTojziJc6/J2hkN30htQiaPT//g8Ydp
         j9jzxiothIrHcsTDKykhUB83rf5avigcxED6c+572x+8fYxq+I4G0hconBxphgr8nVYC
         CIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360540; x=1793965340;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4lcETnvcA1FO4VShSmFGhX4tA8WQyd2jA8DOJ8G3k5s=;
        b=yQ8taygvMatSlRb6GcT6DWWUYGNfyKWA+LeTs6i8qwWkLVr8CyrVGOQUAqmjuke/ij
         pF0chmDLGN8Hz+sYxsgD2nfB476ItFV3HxKxzJn63mxRvQ1DPEOgsoIJphLApF/TRsvJ
         x/8DZKCd4VLO3MJKndxkgCaSJvRMhls0ZYstynhlXfRO+VbwnY6glBx2LxyBSS0Gi9We
         FYo2kGK/2BS3oJoPS/xP7tyDrMoEJn669qXxQTIDk+xVuyrvDywz8Z+BAvg8sVgWupyN
         Tuq+ktPzIkROlE0sD0RTgLbiuSGFWOivYW6MwQdAAv6m1b2uMDEFm0HD1unCL/jcsgP7
         m7rw==
X-Forwarded-Encrypted: i=1; AKwUvBwCcMSut+4hRmDAbgkmFBxtYLcQVnHJusGBJ+V/Fxsdzra1t71/Ii1Y8PeJFmeFE24kOdUxy3Kn3CuVoOc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+2t2l/rLaomXSNfHSQRcJely7b/NTXuthecSdORbPLILETA+Q
	mEtt+c2qMzzuVt+l+4alGCbq61HkVyPnvcutiaa7vLLKofCrFPM9Bp+ZNPdOb0nGgieoSFS5CtA
	bDphK7hZK9pdqbjW3b4B+4gZA5oppEvK6PmtK0+saKQ==
X-Gm-Gg: AYBFou0QfnWu8MvBJd9SkzVItAXae9sMITJwtw1vGBwsu0z5GRILcEvdXMW9IWuuf15
	Pz226J0IHBTmLUT76aNe9KgIlNF62iOKSc6M0Ky2cOGMWH1+DINN4uPulToNswqJBGjO2T6nUh2
	VraMBMGxJuarOIab0ilSOhwUSwkrfnmYAitm6pASXfXv1sKDXRFjkjm8s64RsGPxf/ctJwJQFBy
	1+c7sON6Sn70HG1bIsiXBZ/CIuDj27ePXNIDp40sEemfzdQT55J8V2VY0NtiRqwi5LMV2riolTp
	S6K8LspnRODghMUKnffOQkMMa3dsGpittHvT46AXeBFmxOKdqePO6xq1M00m3telt0LhE0zze9e
	k72hMPYmPLj/TKQ/o9t0Z5p2GxzewN2CztKak
X-Received: by 2002:a17:90b:570c:b0:3ac:8897:7ba9 with SMTP id
 98e67ed59e1d1-3ae8985d52dmr1762888a91.56.1793360539713; Fri, 30 Oct 2026
 04:42:19 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-8-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-8-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:42:08 +0000
X-Gm-Features: AclHuK-tK26BAq3qSwy7dk58hnLMShmnME05ES1MHznr_rkGJBFi7nJKvVCEwy4
Message-ID: <CAPj87rPsh_cVQWtGEisDrXWiT+Zj6D6n5wXpmbuoFvMKtOi7TA@mail.gmail.com>
Subject: Re: [PATCH v5 08/15] drm/rockchip: vop2: Avoid DCLK source switch for
 10-bit YUV422 output
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 13 Oct 2026 at 23:51, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>         if (vop2->pll_hdmiphy0 || vop2->pll_hdmiphy1) {
> -               unsigned int bpc = vcstate->output_bpc ?: 8;
> +               /*
> +                * YUV422 always transmits two 12-bit components per clock
> +                * cycle, regardless of the color depth, which from a rate
> +                * perspective is equivalent to three 8-bit RGB components.
> +                * Force 8 bpc here so the bandwidth check reflects the actual
> +                * TMDS rate and avoids an unnecessary DCLK source switch.
> +                */
> +               unsigned int bpc = vcstate->output_mode == ROCKCHIP_OUT_MODE_YUV422 ?
> +                                       8 : (vcstate->output_bpc ?: 8);

The nested ternary is pretty violent; please write it out explicitly.
Either way, the equivalent clock adjustment for YUV420 is handled in
the setup_intf_mux() handler, so would it be better for YUV422 to also
live there, rather than mashed in with bpc here?

Cheers,
Daniel
