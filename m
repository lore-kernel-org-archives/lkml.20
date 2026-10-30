Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793360110;
	b=eeNoGlyM0Phxy3m61YayLCnhJyJPwFCpHqEeGw95orwqlOin4WKlFH/Pqrd3iTknbtSR
	 3JBJL5Xh5xPkeO4TJIDr7SH/DwiI8gH8rmtANXvnPAh6DmcPAR0dy6WjSc4kTT9jEPjMz
	 DP1Kzrh67A3XnBSVxiK91fPZElCOdaePRxhHCcuNcPgJyhVVTO0wj2CsxaE1YJ5K8fgnY
	 e/adg1mdJydUuTdz4KIV4cjxiZHy0SKs63oBTGocCfciPTOQ4UkN1Wq5JLIvW2GoEDy/x
	 RkTo/WTFWFcu/gK20AGivPOWzjcWqHcJ8vBGGYOylGSUw0BcGDz7iHwqBBUY/gIe7Tw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1/uyCfgrexYOU1XKSxjmyAIj5YjfxeLRY3LwALyGTk8=;
	b=2I2VMEX4MVcNsKiuxlEukPW9yBBMlYRG4WQ0dl+eV1F6pKkUPulIDW1ssFpw3C2CSx78
	 HNW8d7goIBPnJ5Zz1u+gbMBPximAPmRV/VV4IzmymKr53Bp/E1htbqmj/g6iGl1ZeeQSy
	 OnZ71rbVWUWiDARns79x/ACnemhKZPnspjvjrmrXMdpvyCdl11H6C81vujXCxsO/bdzWV
	 kPBCZ2pxe+0HskkmKps9PZ80wk0dDVnxDhb5SC3BMB0waJi67rlnhCRcIU1BStEEQ+bqA
	 E/i2VTEINSqBCxlPsTOm9G2hf1ISI8YKdQFsbAiB9BuabUouiZilGtusblodH0nEmhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ldolOl9A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C41606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0C41606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ldolOl9A
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e987b4a710so9379495ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360109; cv=none;
        d=google.com; s=arc-20260327;
        b=aJcJiXpmWEjIHfRZZRdWbfxu57RgHGsMfQvJnX0UZSu9KbmxaurOR2HuQ4cVGLNuqq
         qDtSxmEhBD6jkuFyNgFeXuc3nbYGMGOjdaP+Ky4W5w31ph7KOjs5+RnpIqfKaI+M6waU
         vcLxJ5VClw484Fz6KTyi6eeoXx+huilwHPohKG825yLe0P4C1fLCk3zdMd9IdoLyoB3O
         8KN7uPByvg2kxzxDXfyHyQZXUcAYUmSq5Qps2QTQaetjd3Zw9jUOmbEFSbykqoPMUvSf
         2Xsf/ZjGMcvZguefjFm8O2Zsox0K+a62Nnei3CkTgHZmhL+oNdtEl4yNRXOy4cdR2F8b
         XPkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1/uyCfgrexYOU1XKSxjmyAIj5YjfxeLRY3LwALyGTk8=;
        fh=7F3Aa871ldJ9ZC4Lc6D8LcfqOzhJv2TsMsB7zlPR/iU=;
        b=JiV27PaLjQspFmEltN6bdzXpNu6WrdnH5I47adGwA2wYVrfqEi4yWCAPPUcTEKP5kp
         QQ+SXnNmnjitBTTEkXeKxrHZmFEBfFB4vuh47ehFH7y/vi2vxtwSOM+F/5SJxYdpMlxT
         dfviEe8pM7/aw7N4wbBFhsPEz35MVBrkQZM0MFHoVhpXwZkj4nZAJHiiLCfOruR0Z3nO
         6cGsCEGpwHLGl5cveCojMroyz2js18Mx/pad8hs3ab2QRNtLrVcbObyyhPSTnWxZH2cU
         32MkM5s21Fny/L4hvlGGlDEswgAhAJTR2drGVnuDuuViNX/cwLaAMx9A8uNwsuLFy7WN
         X4Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793360109; x=1793964909; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/uyCfgrexYOU1XKSxjmyAIj5YjfxeLRY3LwALyGTk8=;
        b=ldolOl9AOPnMjboUHQyiHZHX+dN9q//I5UUP5LiPJ2MYzVNk+85iKZSZiye6YuWhwe
         ChkYwk9p2+y7HBrXs0SJookBPFIVxtgeze379O7P3RdB3I+tkq/n9WKdykB1DNCjgXna
         eGTudvDN/wUeqRspPJ4yRu8SfGHgid0A4Ahqq6fx/P9mk9N7rQcrlzvGaHoWaBVRYFqf
         NXGvouzrHARjsFCu5U/s4OjiM0ssINYb0GcAC7IjrUUQ9+oGLgG54YRoKWmXiqmqk08Z
         WBplTw2avfGzBfpfXoC2s6dNxQuJW3VFU7KOTeXfmwffuPPB4taU5XBM1MSrloGsGGtg
         xfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360109; x=1793964909;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1/uyCfgrexYOU1XKSxjmyAIj5YjfxeLRY3LwALyGTk8=;
        b=oo001Et8kIBSsLFnqRdNQAZ/bppSRfbxRQCm/RKhzW9Z3idfMg28CTDaI5ycHl7onY
         e8R3MsaFGIyZxKFkJ3DCWhdlZqWFZHp4AgUdmqyuiLAz99N4fvgcQv6Ftmxrn78O9Ja5
         ejfFYCU00ZNVBuQqFIadj1iOkRkJnbmG8qORNXAIc9Z+bU3K38/QXzQWk6ajk++2mf2B
         E2rXsDRUewMAa9lNZVtm3B5CQSRMv7uKOEbLZ8J8f1Qb4UIx86GJXPXG2TPpD6drI5SM
         SiP/Thaq8UcL7E7VVdw+bf9G7x8LTj8Yzfw3hsv3p5eiXSUawcTUv4xkzF8pgJZvTkhJ
         Ufyg==
X-Forwarded-Encrypted: i=1; AKwUvBzbTXY0suruxqm/dTfrPUt+y0EfBCQpEeVDfSWWjW5nPVMFILNBXSFokvevoXcxwWEjobMILvAF59wdB9s=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9+gsYp3E+iqIlDOzsQ321bDKyMewuom6hBDqnbhmd7NGCJGu1
	aKvS0imw4gySosEdTpEdPR5vChp2FVog8eaNjJ4EpzP/FpkoR9G1s310UD5v4BXbL9AvAQrhoVz
	hhCtJ0sgHbBHrZuzeX3uP8gnJ12AXSX7ZEmvIl3167g==
X-Gm-Gg: AYBFou09d7445yxLXflYZ82bmfYpte3U2YRQzdPA7n/7Y7G9QxAAiLAyThkNIJJDgst
	iFf3oG2nLsPcPC2cjKLzbVR8zc/imlVsPM4Jr98VWUD3GNFnklIcWSWkxTlFcKzjXgr1Y8VDaVG
	nyaiTHolV1p699UM8X5phWftyYfJAh8QPuJWS4c4c7dt/uOZCnvW6Me/5Z1DpAD8TP2kRm4Ma90
	H9o4brBTaboQMJvJfk5VAMdhF79A1ZUB6IsmwtlNvc7pptVtkSthpOQ1KxxwXV8S8GS+gbBT++o
	Mt0nNgMHaueT9I8hoVsXoXmd3U5ofdLlNyua/GAQXyRdx+TJPQZtJs3FoolzlJGXW9cyrbFoVl6
	8iKINsi0YwL+nmlnbtqCK69RKhXWUZaWBjHGH
X-Received: by 2002:a17:902:e549:b0:2e5:41d6:178c with SMTP id
 d9443c01a7336-2eb364f8d9bmr16400675ad.33.1793360109306; Fri, 30 Oct 2026
 04:35:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-5-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-5-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:34:57 +0000
X-Gm-Features: AclHuK9zIGd0T_kGXOKSuNwCM4dWmBNTN1uB9T4b5-OFaEClVCp9NkMOArmh8_E
Message-ID: <CAPj87rMh7_Efefe3D7DyOFmMiFUtBYdC8e6EXfJYzhEu3DXDyg@mail.gmail.com>
Subject: Re: [PATCH v5 05/15] drm/rockchip: vop2: Avoid division by zero when
 computing max_dclk
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
	Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 23:51, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> Default bpc to 8 when it would otherwise be 0.  The resulting max_dclk
> value is a don't-care on the non-HDMI paths that trigger this, since the
> encoder loop will not select the PHY PLL as the DCLK source there.

Reviewed-by: Daniel Stone <daniels@collabora.com>
