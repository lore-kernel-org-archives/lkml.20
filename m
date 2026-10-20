Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502320;
	b=tzoJ9WnEgwUvlb1myfZvptjnbCyNb3nXoYrgFlrs4fEidS+zx2cKrOYwZoTIML3OOILb
	 7wWMyXaEfP+MFjbpwDwc9krEtOIYNDia3v5IBhoqLyiPjeQgQndkK/ciPADjUocWzrLHy
	 p/6fWvw0LBhBOVlptzCIYm7C/eE4Tf5nbFrUgb4O+CUYkg6rrADYoh+g8sjdhVPeZjKzo
	 MvqYrlqkJeq0h6vO2fhj/CpbeYD+E/yxZ+t+iSmrCzbQgn18N3lbdisj6UmnENlbswQp1
	 c5ipLtASaXKECOZ4L88b8BncCJuL9Vc1Khk10Ab9a5U1AnXgUeojg64t45t7vQYD1ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502320;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=8yEkH3hB9R1dBNWdijOLIHT3zqHN8svxAFnRjevNIlg=;
	b=YKQTGRta6/JeCY751wq76cobPADpeWfwatd/dB+QxygeGSqyVO0hFWsm44thbQggSO3v
	 epuyq/vHBxM4PzYszsKHOeKM15754QyVpyQfCWUeoO538dKwSFcB3OoePfVnTBBbTm9B5
	 W9/JTru0ybS5N0S79Ayu6VxlLitUWI6aQaJTlPKSM3hevN20VK98ztfBRjQSFG+LHTyJW
	 t7g6auJaTn1Vmu5S2+cUz2vvNvXcf8/dGFB/usaNdE8zouHM2PYTWLL/vcxM49h7PUWsm
	 kXYtcqvuo13WWVoaTxXhc9cd0NV+yRIgnxURd3VrDRICJkmuaKqOCBByvR+kEcaVSxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZVNnUkQx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2C2606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZVNnUkQx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010A51F000C6
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792502320;
	bh=8yEkH3hB9R1dBNWdijOLIHT3zqHN8svxAFnRjevNIlg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ZVNnUkQxFclnD9qpymacUm7MAyi6ibAlokdmFOWIkkvtR+J0xK+v67hECJnIu8LlW
	 cAOkTomIIxQUqwE0OnU/x0Dc1H5A0XVb624CPfh4vRtMg0T6WoTh9F+/aix7RF6ctW
	 1tTQKaNSvB4820FARZQTfvijtojC85hkdhy+Gh72jgkkiUyggigpUfvEm51wRFgWJi
	 vQv8p454RGIq0PfhVsIvdWvb26o1JWP7nwOCXpLCEe2WEf8PVGGjeq0nqArRphTyQP
	 I9fbTHDMXZiqrKXnV0+SbykXiu9l/YfELFt9lnfOfRY5cyMQrqNzRodMaRadyzvOZ/
	 HMlUu0PueNEgQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bc18f54abbso2630473e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:18:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw8+9WuQdS4iwJcNn2XXc8ucDFhKbzjuLc5lfm1+Xq/VYd1HeL0qZ0Cvv6rOw8/L4O70PZhVXuHelr3OmM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhIbuk0AChfeWhLVP+2cZB7B7BeY2z1V8EiimJG0TxLS1Juv9d
	ahC5uCQBt8fdM7Pe3is6BZIIGc4EfO2RuKXdRELKeiNZhX+TQ9O35dr0LIO7s/N6OhrwQd8z1Ks
	r66mlrTqGiz5zniUe07TIHW7LfoT+MA4fTkqWRJKsQA==
X-Received: by 2002:a05:6512:32ce:b0:5bf:9eec:c9a3 with SMTP id
 2adb3069b0e04-5bf9eeccd1emr72788e87.18.1792502318705; Tue, 20 Oct 2026
 06:18:38 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 13:18:37 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 13:18:37 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 13:18:37 +0000
X-Gmail-Original-Message-ID: <CAMRc=MfRpCs4pz8Jcy=XAtZLiLZjRfmPYYXxA8ARZLCzb_5bAQ@mail.gmail.com>
X-Gm-Features: AclHuK_NgcINKH_hBHt8udpzoQ3v7z8merjc37ePbnHL4pTaIvcwR5b3Uu5Ipn4
Message-ID: <CAMRc=MfRpCs4pz8Jcy=XAtZLiLZjRfmPYYXxA8ARZLCzb_5bAQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] gpio: shared-proxy: Fix line accounting
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Oct 2026 06:36:01 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> Four fixes for how the shared GPIO proxy accounts for users and
> votes.
>
> Patch 1 fixes a race between consumers that request a shared line
> concurrently. Each of them sees usecnt > 1, assumes another user has
> already configured the line, and fails with -EPERM. On Nord RRD this
> intermittently leaves both DAC supply regulators without their enable
> GPIO.
>
> Patch 2 fixes a stale vote left behind when a proxy releases the line
> and restoring the default value fails. The line stays at the
> non-default value for the remaining users, and votecnt can underflow
> when the line is requested again.
>
> Patch 3 fixes gpiod_set_value() to the default value doing nothing on
> a line that was requested with GPIOD_ASIS and left at the opposite
> value, e.g. by the bootloader.
>
> Patch 4 drops a proxy's vote when it switches the line to input, so
> releasing the line no longer fails trying to write the default value
> to an input
>

Thanks! Looks good but I have a comment on one patch and a question on
another.

Bart
