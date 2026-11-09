Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225214;
	b=ufGVQ8kPSIxABxy0APHr0hIbs6Hp6kJmk7pjUdRljXxOjC6clLJY8HnIE37Ayxm4Cs/P
	 Mf3Iies4TXmEif8RoUrgoXZ6yoxyXeTYus04gUflO30XVs0YRz8TwySY40QetZS5S/ZfB
	 iCs/K0kS5qgEQngTeGvYSO506nsB4678Z4Q5/ADbAoziCK5cXGspHDQH3/HKEcOBVAUVu
	 fAZC1mEBAtXQiax4MfdbdjGBS9BHcFbB7yIGSIDIEsb20GshKodYt7MUEd3Xx1jG1nqMm
	 h9BicHaOjQIB+HE7QeCeeM95J9Nf7yCuqQDvR72DNYpx7/ZTyILNFnbxGSRd1inotKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=zLTgbg+UpD4d4gieUiuEMrVcZ8oV4X6SKoeOC1j2dCA=;
	b=DlWiggL4cDI1RLyi3uuWlYiYCrFhd1laJRElbDk+goxlwj7lqdUJUu0oM3tlII2fwcqb
	 fiDYH/y2J5ycueb/Il5jOTf0K6gAFSBaxZmXtikjQTJobrLAADry3PHP4nsHAqkK8mwkh
	 a8XIAyqXOBHVQgMLcj4loyytcGwv7vAkjeGjtLZNG9uHGqY4dERFgTrc34GBsPjbISbWf
	 vPafhp0NwydE1pzLUowbQPzn419QVDpvcVuF1/FIQWjH4PLZ7yV4XkDdShZYeNrRb16S6
	 j1aB+JRo6GkvAHTcBpm2Xtnww1D998BrZt71yWGPZ4xRQUw2mGFF8Vq5tzyWiaIUMgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SQ8gMmx6;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969BC606A33A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 969BC606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SQ8gMmx6
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so6183005e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794225212; x=1794830012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zLTgbg+UpD4d4gieUiuEMrVcZ8oV4X6SKoeOC1j2dCA=;
        b=SQ8gMmx6GDTUjjcle5A7ZCK7b9sjup6aVf+PiGDp+HsY8sYrTX1rNFtcbPXkoynzJt
         r2NbHAxrKOD+klERHMvd9MHlwcVcu/kCeN+MDZcqWVujuXSgkTD63xN7o4+7nna719af
         AFMmCVJXF+VsssXrgt8Y6c0LxGNqgKYLiZ2WSSehldtO5G0b8+wMYVS1NtwrVBVeYMcc
         /hrTXOUOXAiYej4NXw+0Laur4RPci7VhcBxB/hbhDhAdnyuXErmlg+L01tEvkH/p56Oy
         jTboMbLD3zhBJ7AgByQaN5qzBMGuZkrlYLXmQYJ6E8f5/mPo0rl3vqBm9GlnuQScUG/3
         1DvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794225212; x=1794830012;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zLTgbg+UpD4d4gieUiuEMrVcZ8oV4X6SKoeOC1j2dCA=;
        b=df/nmHz99fB/wyf3+YfU/19TfsOduphGL2YevVHYFLj9M4E4Vo7q/YdO+6rzznJtsc
         BeqNfRyP23j5OBlu97pMuiTBzAeEakXJwj4RnagpuOekjCb0nAOplii21XyuDvV7c2XD
         bDEeerQU7VQV5d5ytFf8hjXj/GdGpxYZJWcmkZilGqvpZC+GrrAPzmu91pZuwP/eevQT
         PZeeBbcPvYZLkED31fXDvT6piJC0cqbIRjg0RyaSp9hurXiQvJvYFNu9TmL+9tX6RTOV
         Wh8USJPTnfOdtwhG9VYHkUsCxiXv3W0lkWvanNq3NlK5X5/Oj8pHF4H8ZsutbrjmGxzD
         Yh+w==
X-Forwarded-Encrypted: i=1; AL+hErEA50jQN90zLlzn5fS4q0v95yUKfDmRQxh521hZrFYzDzMsEQTp1YjfIGp9GC40YxNFQZegg1YiUn3Cx+4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c24dczY82k6qqo/W2ZuMkgcu8oI4pc7hiq7l+e+EkICKu+5xE
	RNYRxqvN03aBPaqnYQq3Rvi17Xwp+dl8mCk286XVEXYY/DYIRjaQwJrr7p9v0nbaewE=
X-Gm-Gg: AYBFou3hItqtCPMP/GhINe/MRa6ZZ1N4K4NUih9sxvTlfHCMEi46UDhNZCatMGewKFn
	5uVFyrNZpG0CT+kj6PAlqZr+l8AtGprqN6BP1yd8diuFnyr8A41SNq0mTTBMCW6u2qG+Y1oteXv
	ElkFVoFrwHa5m971B1HRad9kuMAYAXABGA79sq8FQIsUy5N/KCVVTFtuJ+DqWBsPFFZud7Az42d
	v+ehYSXaTBpBz2TQ5A/GT+MTKG0d5aGlSMT8yDzPHNwbYbEE4heB7IIU8gW26cgzjB4ihWlyw7I
	RtE0LiH9LeEwwcEc5tg1E6rSFbLOneEP1XoT5e0GuCEwAO8Z+VF8lb/j9TxCRPGbjdkVW0AUCcb
	rlL9jsKW/ILP1+yLAdmnbFjhPIGWqwaMdbLZsj3h2cL2wOwuea15gMsXaUO1XNUoBAusvzebja9
	3iHVLCcA0xv16FfZFEzOojHhu3ZwQJ3wubsFdrY3lizKFQ4FCwe/7q8rikDKWRMg+voDSs2SaEP
	e7TYjo1MApd6q1Qv7qqmhVXyCUw0Lm1b/8CWPvd94cQg6bUaZjfONVzi9cIo4ZB/POO/dDvP7S6
	cVPqEyN8iuRvkibyVMlZW0Gs7tVGRKKpACDTWXoZxYw=
X-Received: by 2002:a05:600c:4f42:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4b963c7ceccmr86905045e9.25.1794225211847;
        Mon, 09 Nov 2026 03:53:31 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596ea5008sm9527362f8f.26.2026.11.09.03.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:53:31 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, Jose Nieto <jnieto.alaber@gmail.com>
Cc: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261104155119.284708-1-jnieto.alaber@gmail.com>
References: <20261104155119.284708-1-jnieto.alaber@gmail.com>
Subject: Re: [PATCH] drm/meson: plane: add pixel blend mode property
Message-Id: <179422521075.1645559.4574757378913663782.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:53:30 +0100
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

On Wed, 04 Nov 2026 16:51:19 +0100, Jose Nieto wrote:
> The primary plane exposes ARGB8888, a format with alpha, but never set up
> the pixel blend mode property. This makes the DRM core warn at boot:
> 
>   [PLANE:...:meson_primary_plane] pixel format with alpha exposed but
>   blend mode not setup. Please fix.
> 
> Advertise PIXEL_NONE and COVERAGE and derive OSD_REPLACE_EN from the
> requested blend mode. Formats without alpha (e.g. XRGB8888) keep the
> previous opaque behaviour.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/meson: plane: add pixel blend mode property
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f001f3ff2e0a81b934e7b14cf7a695ea668494a6

-- 
Neil

