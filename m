Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793360861;
	b=htXi2K8WQKxwgRIju6plWByx+aUZZzfbW3g8O/UiCO8hdxOZr/Z9oHEa3eej7wtFiHoX
	 boZzimMR2h08iI5PFF2BxbjOIXE/klRqazOjYVzDFvVbHecCSH8G8FHTtQ57A3Qj+T87h
	 aCizeBUO9lcr7YmLGXxGatf6xJh5+VW3Brv4nRgEJfw3ekjxdaCCQGmrfkhs/JOkyK+xG
	 ZF0wC/aUoWxsFNF5lrW9QegLZDo6XsG2ALw1xZmTFZjb+r+N7GK0Jzj8/lUrSjpJvOYid
	 2Moyo/++0lb82lVFGd8Ce9iaEibz1H4fgE1jGW9g0l1j3c6aI8rjLen+rnc8hTpwJ2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jhQMGcD15ceeh2wLMh9Atxq0/hg3i7fdihgYRv3Ypv8=;
	b=Mb+9Ihe3dZVlpO64c3JWpFb6sgL9rKvKb3RI76CV0qmA47dWI9SkdHqHNRiqgmtTkJ5S
	 PNY5tmvsA1zBZ5TDvQGz6V+7UORQcRNnIN7P4rY49x29NWuvTiYJvdVm8pzMccR8UD4ZK
	 /b8esGWte7q0Dash5wSo3gDpHm57Mlrnq/Bo2x8yJwlU7OmEs76HQ9EXP0PYBhfOWBkWN
	 Y2CMVy2u1FzUmTwVTnP+neWzfhsuf117G8prdIa6yCVC+DY3llWZ8wT7P8s15YjG/f/RK
	 ZoPzcO7v60CaThqB1SSsM2xUfymS5fo0CAPyCvLWzTeZNkvKgks1V/qehuG1m/EYu4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Phf9rpGL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17428606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17428606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Phf9rpGL
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae486f8a27so364370a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:47:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360860; cv=none;
        d=google.com; s=arc-20260327;
        b=MUhsjlSJKe2rh0aMXcuCu80h9DjtvpT33IujEjF+FZtj4eHe4SLm6ejL1PYvm6gNyI
         PyygL18ahYywlYbSf15F22uOE8kDJXwclu61/BnUfFqJIWNmQUcbLCWY6WWhPUkHNJnB
         vWkcVNPdZEQZaJFpeMAdqGen1Y9a6eGIVUZI4BsvkvXbTC3KcgI7UNWL5tuehAk0aZhH
         mE2kF7IOALAZPIwpZflwtwIa67E7MajDGVoWGkN4fMDmTaN0YrsBkXt7M4r4w0n4VOE0
         1a34V2OH9DluWOZL7kMR68Dni66r7M3PiQpPuMA+OiqB39WdrCVGwR2uFDv8cRNxeJif
         UPOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jhQMGcD15ceeh2wLMh9Atxq0/hg3i7fdihgYRv3Ypv8=;
        fh=etP5WEFlS33Cm8BU2S0ra4fTnCXbFIPSsuRWEjFxaZQ=;
        b=Hm3HPIU2gagY1mjbvdZQYNUPYECRXpt/KtS8yG3FUJNX9u6RXmr8v59gRxYiDHhk1O
         PMPMPewSDzdUkBt7tncx7DsNMwfSKNpPjxMgYaM4FtFAaLlmfDQB0WbhhMFVzqHtlFgq
         8/+Y+/NXGJTGdWEBfu+WByF2S/qaN8aNz4URXJdWEblaoQNRje1Z2aSsXhxOBmJFSDxx
         YB5CoCmLgC/xw0f6jQIjeZ/ftxS7qCT8WalA8dNi7u9YHYhAfttlu94TMQe0K6ABWw48
         hDM8YIivcmSZ+a5QrLyWbawkK852sAtfUAXuctbBC9LiNke98v+JZOVXxN2iWTpNxFwe
         4z5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793360860; x=1793965660; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhQMGcD15ceeh2wLMh9Atxq0/hg3i7fdihgYRv3Ypv8=;
        b=Phf9rpGLm8KgmY5bsirUc5ox8sd3Pdui+luz8kOrJUleJxxhY0B01dSXqOd7+GUzAo
         ffa6zX/6DY7VQ7q+U95osZmsgSM3O/JHVSZnYzJRf5/zgFSqnR0oEqP3KzYBrgVstXV9
         2Qo26uryh8386gvPJlo5b25EveQu5QR6Cb2T7a7Z6A/dlOK0ijNExE7mDMcCxxHqYGqr
         uqhfCqLSCQB0vuzNpD4+SZUMvi5HAHYvUu9dJxAI21x8OmFX98tb3qU8WLDxcSiJPqtk
         cp+RzH8P5vqcCvBUEfsBUkofvd9id5lUkwWaFY2Eyu8/oTLC7E8FaPaPs0/xXcUR9VYe
         IXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360860; x=1793965660;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jhQMGcD15ceeh2wLMh9Atxq0/hg3i7fdihgYRv3Ypv8=;
        b=E+yv/p01UUuUsT1Pb7pl1bc2ojqmplt2VSvwvpb85kqQG3bIc03Sz0+EjjScCIg9+X
         4/Y8R2XHyIgrqr1xliO0azBnaqOwLPL+vm66q4VRt/1yZVFxm0jBRpu1F632WLq0WQuG
         QnBT4qnY45lc3u/krmd/XIsViIL3M+Ety7K3CH/xxm7Odi2RVoJIKz5gRK9C2IT8oD21
         XDkHfqxwO+h2gkyr50Tq1N2x0eTm4hM5kVSh8JZa4/CeOc1pKm5ff29163xtXHBl7SHv
         /0J+bfoJmjprnK9ouLIKE69mv5YsRF7EFcNwTuMXhe0SNrOOFT6PaagmiujgH7RD3rfQ
         ITpA==
X-Forwarded-Encrypted: i=1; AKwUvByBZwhw1567gensE8aLmTvNwChmWdRA3JckYG7D1sDzy+VQPWGSq5uj4Z2Y3ZNA9rCOdGukkKlZ5XtbVxI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhPImaPl8X49YC/XU/s0U9+3qNuTmV5i5Wy9li+A38ib5HT6y+
	uNahgiOIB5zFnjfFfS1LgiqV8CfHS2AbwPh1BTAx5q2s72CuNe9EOQIJcpyvRp2/ckZXz0j41ME
	nClrOkLIDVxqVOhTX/c+HiNI55gIRDIn5ZdRS6PjgxA==
X-Gm-Gg: AYBFou14JSk6j7agojZ0Uh/amu1U+/OnYFCDd60+sRYwplQf2jxCwgXW0CPE3R3xw8C
	0orT6GX80GI23Rwn/QdyhCXvCJ6+QG1x+ghorClYBjXm+/89cbP6Z63ZZ1CAi/glpg4lAqKLF96
	ZPBNysZ9prKaV04XmpkrC8PH5yMFAkBMElHEhvr5WzdZBFQ347K/LL7h2f2ql3sXHejnxgopFMA
	SF2GxuzJtrUzdNC87yANfCzwZT44IHZ8ztR/JFjTDhc8pgL0GqjmV0gBkOMaX8Svkbln+QR4Lnx
	23c+lSwWXijpv09OHaa10UT0Hg512yhl6Fi6Mz+WTf1IVkUZVAAxc5z21v9LVhMEau0Isc8yTB7
	/OBd5XsA+kxsp6/Uca2p1/N0M3D6vYOLVyRaD
X-Received: by 2002:a17:90b:4a46:b0:3aa:f2c4:12e9 with SMTP id
 98e67ed59e1d1-3ae8953617fmr1788397a91.3.1793360860430; Fri, 30 Oct 2026
 04:47:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-10-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-10-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:47:29 +0000
X-Gm-Features: AclHuK94pfXkqJW650Ejw1KMr2XP085nv_elOXQBTTnf3Z6vJhDk_9RcSiJIx78
Message-ID: <CAPj87rMMHpeE3WnPQp-M8KvAH9yZjT7goWU8dGtw+ykzvY1TGQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/15] drm/rockchip: vop2: Switch to enum vop_csc_format
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

On Tue, 13 Oct 2026 at 23:51, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> Improve code readability in vop2_setup_csc_mode() by using enum
> vop_csc_format for the csc_mode variable, as well as for the return type
> of the vop2_convert_csc_mode() helper, which already returns CSC_*
> enumerators.
>
> While at it, replace the nonsensical 'csc_mode = false' assignment in
> the no-conversion branch with the equivalent CSC_BT601L, which carries
> the same value (0) but is type-correct.

Reviewed-by: Daniel Stone <daniels@collabora.com>
