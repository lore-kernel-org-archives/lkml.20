Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160A5476680
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932589; cv=none; b=ifwUIKlkXR753gbpU3GIAGQ31PgbX1bJAiJBKeSoOjTrehtiYN9rX8M1upB9UgD1Pa4bVfYNhCC9xcDYFu0yO72v5wTxfbqs6+qxD3Xro3evfoGmAxbWJocka0351CGCSCdW6FG/hohLNvxxdLa/ksvn1d5YZSoIEVvwCRoVd3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932589; c=relaxed/simple;
	bh=EFIxTrGIKdq/qFkxBC6zc23RI5jzNrCAhz/xxGasyhM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jLpqsyTsYSet2HYZmwa4mvkpz0DFtJRLq256Pv5jrSYsFpbu4cqMXOEVXDxQkKj8gVcJzrQpom9K7RVGh3NmQb2qVsF1CR+xh+DGhVG6sLVlCj0M+JXxABtEtt6TQTqmhDhMhhFtu5i1mb2BwyseNrDHX54uns7UFhk/zz7LyQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rkWnD4sm; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rkWnD4sm"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48afe3b2383so2206054f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790932585; x=1791537385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iG1cG8IPx/QY/i9xckK9bOVlJmPgmj7TzAkhOyUJ5z0=;
        b=rkWnD4smH+6mf3cNxC7Bo2YWn/QSVRewf5scpnDY+x3AB1q7LSv62pRF3653AXG+/h
         rH1YIeAs/vrYUwb1abdpLUbQr1IsC4EN4vvIKR0JRmky5p3krnDURjbd4o4GugvJf6uT
         dILW+iuwjZP5r26QHDjkrbmF9m6VGXeU2yMhIXHayDf/opoKZ7jY+YYyjX7srViB0we+
         WSDt7mHxeAoz5HoELiql0Bwr19+F3b2tXZ1eGf4oMF6HMdPmsoJ6u/naaAMY9TFHVP6q
         0Fac3KweMBH/2gry3eEUDNIwqDnp9t+IUXTcJMWZnpUEq0CRF59EPFj4/DsudkqghHS9
         XeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932585; x=1791537385;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iG1cG8IPx/QY/i9xckK9bOVlJmPgmj7TzAkhOyUJ5z0=;
        b=biE0gRNEMhllPBuQQO+MXLXFO2SCHylLEiMx3Hb9PSFsNZD7EdfQ8SaBZuN7zjnUvu
         0uRWwSp5hRC+7Py25rvGXdgjrfV9DZaYyZaB/WMAvU7kn1q3Zrj6vYg6uTzfIjsedsLj
         u/Cba5D9xkOQY643Mh2FVQRa31lOru9Xeqp3STJy/G4EeAYn4ouLpQbBixCZYZfo4Fqb
         FT+ioFk1nnvX3/703dI/sigthiWcqY54POUaezdXU6ZaakPYYVUVy0j6LOjAxlIZdm5L
         1YWJosx3USt/LRhflSLH7pxahnHans4eoMrnbB6ypdsAmzYqKDxPNmacdwKxYPVXXole
         gjkg==
X-Forwarded-Encrypted: i=1; AKwUvBwB71QZlrr8OtJj7Qs0ho781/jH9E4WUm72ls6DKh91a4TtCPrBbS36IuuOXcs2oQeTLoNUdCYN7cjMmO8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwAgv3gLS3HeXtmQFtrTB6THyJaYvOXO9UZ00veulp/8b/Y0jZ
	ZuYIcjssjjSt3xI0eHvzbEVBBeBOZUYhRJJZWtOUURnxFjCCoCkssnaKl7nfnMWh7Iw=
X-Gm-Gg: AYBFou3xh7OX9uRFsqFZ9E/D0s+rYghZRH709ma5kjb8s3RPEHPg5J4NL6RyZVXPOzZ
	zUZu83V9KkRkyUTzP1Zszbf3I3ygMaORwe/0mUWYr5wvxrUNW4kG6msDAUNpbvmqJu0y78FKYeo
	xr0JCFjmhn14aYhoZ8vfijsZ5yFLrcW3WIJeGu3qr6ft/sDkqPAQ3QsaIqH9OxGgR6qBAawaijs
	rZgScGj3X28T5vjdjrjh6QJeyUtMkU1Lml8rzTDqeWjedn6eSFSxEulg1z0ZWBnZJPaSCQMyxCJ
	JKDZHu3EnrdQd7zF7RkRfb87f32WJLNY33O0HY3A5FUeA8fwRHftGVot8z8gVqrjmqrNHEk8/Nx
	h+aHtoMZefDRkS0te0FP4YQPGPtRf+wu2YpITIHdwu/DW5xlwkWncPfItakbyBHex7lYRrsNJWO
	YJjfcCkc2VTQNq1bKVtkvq5on6UzLfxWuAoRpUPeie8bIzU5ZPOId4Bi0+EJ3qnsivRjHb1wpTV
	atiKv4986hTRMfR9XY=
X-Received: by 2002:a05:6000:310a:b0:487:1ac0:32af with SMTP id ffacd0b85a97d-48b1275b416mr3767187f8f.51.1790932585085;
        Fri, 02 Oct 2026 02:16:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9ad6sm4461292f8f.40.2026.10.02.02.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:16:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaron Kling <webgeek1234@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260925-rp6-panel-v2-0-19c425e523de@gmail.com>
References: <20260925-rp6-panel-v2-0-19c425e523de@gmail.com>
Subject: Re: [PATCH v2 0/4] drm/panel: Support Retroid Pocket 6 panel
Message-Id: <179093258419.2282096.16342679843740464292.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:16:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Fri, 25 Sep 2026 02:08:18 -0500, Aaron Kling wrote:
> This panel uses a Visionox VTDR6130 DDIC. There is an existing driver
> for this ddic, however it is currently hardcoded for a panel used on
> several Qualcomm devkits. This series sets up the driver to support
> multiple panels, then adds the RP6 panel. It also adds support for
> rotation as the RP6 panel is mounted sideways.
> 
> This depends on the Retroid Pocket dt series [0] for the vendor prefix
> patch. That series depends on the AYN dt series [1] to apply cleanly.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: display: visionox,vtdr6130: Add Retroid Pocket 6 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4cfc23733f15d75a787bcb370c6739cd954e74d5
[2/4] drm/panel: visionox-vtdr6130: Add panel orientation support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0de9104a85cb6efb624e6afacfc252855fdde8b0
[3/4] drm/panel: visionox-vtdr6130: Modularize panel config
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/628e7bff43c7ee3234a309fc58741eeecf2477eb
[4/4] drm/panel: visionox-vtdr6130: Add Retroid Pocket 6 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/74b7c75f7d442cc00fa759c22f746abaa70f264f

-- 
Neil

