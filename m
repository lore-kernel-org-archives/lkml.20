Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626848;
	b=NTmM3UpmITrXQWNMsW4sipQx8vsLFhGz11dUCHLJ/q0yC+1FeneuwAv+e9aTt9Z8dXGU
	 W4ejS3Pf+rVL7iS3RdH+UR7n9Smku2rlbqsaUlRp3UedETt3rQvg1GaO8zIlXQI2E7DaW
	 vZX+S//e320lGQV+IsMIIsj9C1g0RPDlUeIzatEJ1Z1tH1zlcTCwbQiZ7f7ogdSeXAPSm
	 rgoarKXEC396R2cnDdBpdUaVohnXsM/ZhUZgAx5wuxf0JKexRxHxcWsJycBr6KitmAp9i
	 zKdzb81ksa9oWYJsPSpyf27lBts2A1iTnqI9XjliqvtMwZ6eYXtcQK+3uRW1u12x22A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=cQaT9BYgRFn+zEYUt83O8GM2Oamgt2XfYK8NkH+VikI=;
	b=yClKf5lz1gAiGQJAXPpm+aaCUYc+t/waHvNFiZI5rRQZZ8mjLF6U8Kt+jwtMTs28vroP
	 9SVXIlcnhHWYy4HKdjPPIajqUvgACRQVwG9cG8btiH73rz4GIrbg7osKc8lcHB6X9O1YO
	 5MCefcEfDNF1kV5VBQWej5+seCJgBiUV3KMbiV2fGibD/NCSkVg1zbrzZmqBBRfSzmwRH
	 7oqJsWv5cKMu5pt2vMTLVQkEZu9MTEgphly3603Xiirt2omm+ni8rhZlEr8SFgjB2VKno
	 dM0RrfJFkNBA9+OUJYuk4jXiUM1hOjqlvuVtCI8aUK9gA/0N7DRMF9ZMJa0Z+HCVN2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wwnwl3VI;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C70E606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C70E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wwnwl3VI
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so34649765e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626847; x=1794231647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQaT9BYgRFn+zEYUt83O8GM2Oamgt2XfYK8NkH+VikI=;
        b=wwnwl3VIHIKqYxybAo0PJUGsxUMaTIWRjrnNuKQhh6l9P0tcxnxCepwxgMDxUFKLSg
         ElcWQYzbUF9cGkO3FueRCNxjPNm+Ww74W6gm5lyhssrCUGZQc+jl+o1bgnxb7zTSICI+
         7HlPF76yiJHEHAq2lTrsQqDKrdRH2wDMPMb/JHctjqJ13BN4fnOTEsCKWA3k5b3H9vi1
         3dXoHWOAZe6K6lVFcTLRq6KmwuZXsdWxpso+cXiJwscER7W7ALgGF2StX6SSfFKLml68
         Sxu2WsRdAABj78UD1yVFJb+T85G3sHlL873+ejNza3cwirNqNwM6FvfeUWkZUdj1RFzl
         pM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626847; x=1794231647;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQaT9BYgRFn+zEYUt83O8GM2Oamgt2XfYK8NkH+VikI=;
        b=y75EdOBbjlNk3ecc4aMcu1pFizXCx2/8CcvxHzAKvWrJc97HujXig2RqhasfBp6lGD
         hB/NDK8oLKubkEe+bpnxjN0QRB2cYKHOYu59pARk9x+8UAZZelyUKfoSqoQcNLD0MsMq
         TRfw/g8cc0WltV37aUeiAnCY0W3Pl9ewEjZV/ggp6s14y7zwmbHDvD46IjGAMowEbaEi
         1vbU79W37YNqgIYRqN3MVFc/bdS4nCIyGKVoIYPiAzdZ9XdvIoUWKUbYY7TJsNQmHABp
         5wpDcnLUcm7DV4iqh526vxaVVh5rfG2mvHw0iMzFRfwk/o75agVc7GK9Evy0h8if2/c2
         qsSw==
X-Forwarded-Encrypted: i=1; AKwUvBxzDn/EvX6YSixkJIzEbFfhibLjNpMErpImsvvqMisS29FKfTyUsP0cDULRdeLT2zHOjaHKVq3IQ4gol0I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIu2ZcSFRzMtE8MqVMOr6bCoKvGeqGgL2kZEPMJz12WYI65q2T3
	HBEDFVReM87+EFnKe+Me2ILrPWnqXnihdi6BbE/Xo0jo3pAi5DRVfryw7W9UZfvy80s=
X-Gm-Gg: AYBFou3YPwvRhWdaq2pgkPenbXKNQeCM8teYFXSYcEprhv3NiWVpJ6KrL4yJ1frlFPT
	bH6a0i6AgVko/jyLCFOLCRzYEWF9IGfS0MCJ2qWk8j/KwREAtmmPtoGE2e4Q/DWh7p1kd7DaJ5h
	q9Cjo20PdLdOPcNFOxZvi/wGGEA9Sik+6ZQo0Fn14/jyf1UEXGFtOcsRplw4pyETMp1Jc81sB+D
	/LHvBtLaTUNQ1Y2xbjcbkUXR80KqMN5/5YHb5zCx4P+MkwRKHr2+wT0s/BWX15rKb8m7EeO997o
	6uyMx3olQ9a9tf7dRr9/4GwWLZhdHoo4Da9y0CTsHxexP1V0h7YYEBGKoaDVJDCIJ5AMtrtMMkb
	0+GEKKTsofg65dWYTqh7he87IoZV5rK0TO+hYp4xtUdFQfZy0SVpP/smu2RCR6aogT+2fPi7I1/
	jjszBXLNMr8+gpA6uPDQT59ja4T60h03s4/S4NFpDbqAosffhbMXONrrgSNBS8Mc5bpoLQndQAM
	FzaprevmNzTaXtHzEjHRQjoWNp/rWfY91jeLmlTv8by1rgxLWeNGWeTEz57a359tt6xVXonbo+h
	SZbwJawwBQcDU7sUKHvteLqAtV9FVN0ZNS4yJPQxuxGh4U0nCQPvcUw3mRwuAZKyeiZ89uQ=
X-Received: by 2002:a05:600c:470d:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4ac17471285mr229234705e9.7.1793626846731;
        Mon, 02 Nov 2026 05:40:46 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:45 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
In-Reply-To: <20261022132259.240717-1-clamor95@gmail.com>
References: <20261022132259.240717-1-clamor95@gmail.com>
Subject: Re: (subset) [PATCH v4 0/7] drm/tegra: Add support for
 Tegra20/Tegra30 8-bit CPU interface
Message-Id: <179362684510.3310106.12424997423646231725.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:45 +0100
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

On Thu, 22 Oct 2026 16:22:52 +0300, Svyatoslav Ryhel wrote:
> The display controller in Tegra20/30 SoCs features an 8-bit SPI interface
> that closely resembles the MIPI DBI Type B protocol and is referred to as
> '8-bit CPU'.
> 
> Add DC parametrization options needed for fine tuning by bridges.
> Add 8-bit CPU interface in form of a bridge linking to RGB port.
> Add 2 DBI Type B panels used in LG Optimus 2X which work with
> the 8-bit CPU interface.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/7] dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG LH400WV3 panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/46011a636fd729c99781533e265297748b5a0b0f
[2/7] drm/panel: Add Hitachi TX10D07VM0BAA MIPI DBI Type B panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9fe804e2a3001fd024c0809678d09c5e0ed359ee
[3/7] drm/panel: Add LG LH400WV3-SD04 MIPI DBI Type B panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d87ca1becbb095b6204cf657508c91e5e995d9b5

-- 
Neil

