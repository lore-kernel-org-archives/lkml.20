Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793879763;
	b=vPmySAQbXEq144GPXx3jz7+91lg3g0lsMIHqF3ZBpUpmssxIdSVySrgEe8uCUBm0veqT
	 YRHgsShl2nO29HUTASz1ZkxEDFKh0DQCWU4XXGXTUFDlJp4sLEOF2f8wG2M5zKfpT6It8
	 dKAv9RzoWpbxdUpFM8HfznBXw87H+/D1lMY2muFltKrrjhUtpWNNQ3oirftSFATF+H4A8
	 l+5jEULVT2dSVpB0NykrkbDNMKYFUQLc1XEmi2E83IjG4MkpyhBhKykVImTm8a0ZkHwmb
	 l/EzyQM4QdjOp0EVjnKSDfySNB9tfocRlFzYRbqQVMjU0ePNLf7qhhs7e8L676d+GRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=PaO3mUrvyrlxLx6T6FMLOlGYCy2w7sWQHAyzdDwn7S0=;
	b=Ybra/BhfFycPsqtljO8JAO05/nAj5fMGJV1ue3YZk3S+3QTKEhoCcDnqA0jVIvJKVA8D
	 jI3ay73ZPNFRcKahWsvOphMVrec4m0/h2hSgeTf5qSUdvTqzk0hRaSWpmdjPYQjBhdrwP
	 5ldOEfiriJqvdRuddHz/3dii4h7dOpbTQrVsIlzVhMK5w58nzikAeZVBpcY8T/g2g2/k6
	 jj1f+5M4YQ9gMhnV9xEzrbD7oLlCzWqR5A9fgNIK15nUykgd92K5kHDMwrDeiWHyXoq7U
	 3t4IMDEuwjJQ5g710Ph0FVbB1MaM25eABkHxIHBVmqKuJI8j1Jk1or1v1SD6gbh82LA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ZWNvpwl8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457B8606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 457B8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ZWNvpwl8
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdaefe02d5dso1078400a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:56:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793879763; cv=none;
        d=google.com; s=arc-20260327;
        b=LWFc0irtcM8Pt6ipmoyjMyMeMJpVLz2lsffCrzMumZH4lwshsfJz7iMQS2PZpm1M5b
         sW89dRkmcwpdpkGZ+KZaVf2E2JQhmKoa1lLpW/t2sTaklauv8Gwm29wr9eg8BlgJx2f2
         ae795SJyXf2NV3MefEzmMK/aihh+eWiRckP+cmRVLKCA/0AjDLguhhoFsZBxG3Wv2JK2
         BPha68dSVy0Vm9hvqoFJJHDudPPsyFgswCaUS9+nuJQhNGp7n5eOwosCfvybeL6kbGz2
         hjaXUu72GHjukPj+epdLUwcfhDSRl6yOHr+XuL6YNNKui0Gc83S2JT5st+o/8dwL97Tj
         6ZyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PaO3mUrvyrlxLx6T6FMLOlGYCy2w7sWQHAyzdDwn7S0=;
        fh=i8xAlaKOAHGMyDJnqg99XuTheGgs3zgvgRR7FvzfB7U=;
        b=Ass9BQK+T8F8BC24fVPw/zHXQ08MmRhDNjWYk5n7oykD1B1z+cIzZ9JV6ACxrUsOeU
         DPSvLkSFrkKaoy57NyXAYpuUVZVoaLXqgnVJGcq1PW9NkbWiCLen9Biy8yKGmwHuUz5g
         evMWBCgn0EE9YDjGMGxgG30kuq7cNsciZdxursfPMb65A4g3HLzUXh9jqMQ1jeKcl7w2
         ZmRZE4D6uOqd/u4rKhj+kV8OJogQS2aUq1I+ynVzKTPfj/BUxUB/UaJfo/mu7PI9QUIo
         8Z01SZjDAW9oZoLGmyxAo64H12+2PaZmd61fplXIacWLeT6c/eTea1q1D/wKNGkn1uyV
         JGbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793879763; x=1794484563; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PaO3mUrvyrlxLx6T6FMLOlGYCy2w7sWQHAyzdDwn7S0=;
        b=ZWNvpwl8JhILyTVSbTkRTaBTLVZ7JjOfhCR2xdaoogR5HQKIXSEFWL/ay0ob5rHOnQ
         bbAS2bOh2TibflBHMrpCUztkxHaOB8TTeHumBu57vauYSY6tFgzb/Q8bKhHb71Ys/FJR
         vd0s1LsZWJcl2zpxO62xN/r/Xww/z/D4zBh01Ob2rzHx4TnqmyGcaudlKg5DYmlHi8F4
         MB7dPe6YX9aN/f+0uZKhvZa1+fFYQKDS+oIx3ZZEWjrCn4tEgSU7EC8ncuA1rFBEcXD6
         zcrhHxCvR+tRxuUMQG6+basHl/gvPyoJgySuKOngpo0XRUP8rj1A1QbkU/y9U1BrLWpY
         RL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879763; x=1794484563;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PaO3mUrvyrlxLx6T6FMLOlGYCy2w7sWQHAyzdDwn7S0=;
        b=VYYw0+Q1WiajdxzArH6MEskxMDEfQToQ/lg/85HF4bnkM2cbM7P5meU161iFeb4ais
         mUigLuAf0LiYxk6hhU3JljJCQzJA9G2UeaHBPe8uF+HI+/+Wb/2toAD11kEv4pnouTM0
         QMkLyGJ30hrZSi03OW6bVQx/bKyzqmfHZKwQDq7NWsHAXPmK8Gapo19Ap70kIDOu9dPc
         U7TmdKr4sDAW+rl+aLlpq3BiVX58aJ0324acVhdyTQbyk9gdXPx76b+Hon4HmoJ/y3pJ
         h7bOpslLny2zJs0Jw3bCuU8U4lpxqn46Rpb6vmOeaaxJKQvy9r0FYb46nwu0rEpm2vXa
         Hz/Q==
X-Forwarded-Encrypted: i=1; AKwUvByAVuPTngpiyYFpdIdaIlNXfYDlIWwlJBOEANxH2/DNlc7JdpvSAPXLTiwYKjbq9H3X6wFaeoUFy6I2DJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z++FvphLmPJjZhFLs2A4kEwWEAZpbaeINWxqbFr6thn6UZMGWpg
	8JfKcRHqlacwzF1HjRRT4Gz7B8t+C05N6jlz1VjxvwyciGn2+PnEVUOuPZE6ibuZoT3X5MXOb+i
	+PCZUX1FSR+4JUgBF9YOlL7SVK51D5cOtrJdHiubWckB7slqAFZjhXcFwMA==
X-Gm-Gg: AYBFou0+ke9GblM6vNXIz2rSHSnlaYrupC26Mmjb7OzjrKlgB7aGK2fBMltsQP168Ce
	6bHC1FYYlVGfVJXBlQWpzfiUtkT9Rc8wMmDPu5d4HeDvtB2lkIcLtX4Zk6AKvmahaop22UpN2JV
	xoTJ9imi0+zZSJtEFyRtNLVSYPGd+WapjISykTeyWYOjqoin1OAOCaFj2B/2l2IsVVubg29djAi
	AjOG/tXu9vhqAvIv8tq4QJvEcuhK0J6yAVM9nCq4qZSurMD+Uh8d5XzrP7rdvFstGO+2E6poh9F
	LhRk0KAQvWRr6dUF4v4omoYX3dykNtvguMUHS5eoG0YRR+olGTeaTZnqwD0YpXm4CmUzXaHhZI4
	s+aF4+Ec1mfm+Cr2kHj5/E4IXg9UhbCNS6vDn
X-Received: by 2002:a17:90b:3b83:b0:3a8:5d1f:59ad with SMTP id
 98e67ed59e1d1-3ae89819ff5mr17083778a91.43.1793879762611; Thu, 05 Nov 2026
 03:56:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-12-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-12-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 11:55:50 +0000
X-Gm-Features: AclHuK8Jj7G6el-i8_82b6TJ0oa9AUPdN0owTnb0JTIANqcEHa0Ic8C9cFJ1sYI
Message-ID: <CAPj87rOAjcLZeKsKCMr84NoN89VzRDLV7Z8LySHK-DVyRW=u2Q@mail.gmail.com>
Subject: Re: [PATCH v6 12/15] drm/rockchip: dw_hdmi_qp: Do not mask error code
 in atomic_check()
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
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> dw_hdmi_qp_rockchip_get_vop_format() calls
> drm_atomic_get_bridge_state(), which takes the bridge private object
> lock through the atomic state's ww acquire context and may therefore
> fail with -EDEADLK when the lock is contended.
>
> The DRM core expects -EDEADLK to be propagated up from atomic_check()
> so it can drop all held locks and restart the commit.  Replacing it
> with a hardcoded -EINVAL defeats this backoff mechanism, making
> otherwise valid commits fail spuriously when multiple threads perform
> atomic commits concurrently.
>
> Propagate the error code returned by the helper instead of
> unnecessarily overriding it.

Reviewed-by: Daniel Stone <daniels@collabora.com>
