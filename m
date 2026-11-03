Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699649;
	b=iOLp5ycoa2O4N+3RnVL+kY13bMy1+qJiok175COiNVpNPJrgfgk5LlESjLouzYp5J5bm
	 e1nK4ZxtljsrRVr1qW65EJMxDpu5DdXZfQAjYDTtM+v/HqV6AbXtOVsJLAfdAfxXw8nsB
	 hMkdOz04QDdHAByQD+MK74fKcoQVeRmRgajbHAoCzYcXG8HX9g6UhU4Eke7ezF6EbhEmT
	 tIYjmu7hiswd3DKm08B8ykFjy1n4ofE5kTRcDjb4uxPqy2hJWZrpPw7D1XGCMcDf+4Qag
	 zunD5SBtAqnsPy1ovT3Qsn7E3/8fItOHQZGh5whNX0+EvDkwZSjrh0j6knNIKrG0Zkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=Wy4OVqINXkwCakS/yGHU8W8MCAAF/D/083jT8dDHKck=;
	b=3CmqVSb13QNnSPwLUHwYRylSysrvYD+jlSbfj12G4tqqRxZ+BKqDs2zam8Wbn+NfEnik
	 gqZtgcPCdLuIBccz43+2JqqkQ7AepUEk2PB2wSDglwHf+knmHVSbvNPRIHn0OSYCXFLwZ
	 HRGdp55g5Mzvw3sWTvosLn8zcS5PXH3ZyRWhRTqVP94MSKsPE2n7cqku81mUeSLNU0Ni3
	 sbDYYCm7CXUdbBD6rwUloUHDy1iaH/kxZj9E+zZ2ne/53hDxB+E5fI6+SbMtK+LTNiYui
	 IS4nvlWpQCNFza9zUGMwN35c5dSKjszZDinH82K+TfjKYAlW7UTK4Z+WW7MoFJMegkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KMlQObsf;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FC06082BF1
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1FC06082BF1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KMlQObsf
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso26153175e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699647; x=1794304447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wy4OVqINXkwCakS/yGHU8W8MCAAF/D/083jT8dDHKck=;
        b=KMlQObsfiwkd1ZbJuxRjv4Hwvrsqf/d2jrRY+Q+/lqyK9wVP04+j6xmzJipO2Jb/uF
         tzGzoDT13jAbLYsUi7QiwzzbSwTNQPqvPnP87zURnCMvH08cWDEVvYoiqeTF/T7Yb7vH
         odAZSvBz8Vc8p+oeeQdi+zMUlakYiOZ9Fjx2sEmlC+d3oZmn8Tb84Oxaewv7vHTbGXvY
         jgVz4pDG8ihctxTZ8oZ9rKokj1IOD+7wkA2Twm+p9UnrJcVxvsV8DtIfc/FFQq/lg8e8
         UEUexhAKw9YMMojDJg4TI+yFjTyd1HFuK6ok3mk+EI82DpGIovMHk5dCkSyo/95qcwK2
         SyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699647; x=1794304447;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wy4OVqINXkwCakS/yGHU8W8MCAAF/D/083jT8dDHKck=;
        b=NrnIEk7Zv/uPmBq+y6Ml3T9AThErWwZBkptTRpaxuHqj0QlGYURziGbFkVshdjvxdL
         k0vX2wHBq6rItxjBy6yLp0jkeZ5MFXNXlOgpDCeg8T3wifHbFUuQ/Gd5vy5CJrrG8hyX
         JrSTbiz73U9P29WQU34CzkxF10qrxM8VJYQUaD6rLBDcUPegdbme75HECBBy59Ak1Nvl
         oWedHe2WbPxEWmJEp90hTgVANhSxwI6dfn9dMwkGj/94HvBjJuSae1GSO/2Bd2mwtWw3
         3AHuSYc8K9Ho6nQFUpIiQloB5nneYHIHsi7PHpeaQTZTJL6dkA+b2NV6rEyct4MVuth+
         XBrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyZgddFnU1+fbIFVtUKQxTk1Pno5PCx6E3izojg/Zg+XwPIBAxizVbBq82blGokVC6KKnGV0NHfL67ty4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xO5EuYVDbIeo/jIQQS4WfdpoLp9oKIpVT4yPX+WRVFAthw9yB
	wFIyHOM1nBMfMzlYEFyKOYtYB2yWHgKqtloV/FE5t6OqjJAr+BeoFchhUWszBGCQliM=
X-Gm-Gg: AYBFou1EolmhlQIKvfCNO83zb+wlAjVswwF8QLXuzULczjAZqPsl5/597BqL8vV5WVs
	bRjlGGKT8Bd90gBGFGhBC/LtKRizhrJXQ8ABrejnC/kv9Hz72aXF3lGNHj3boTVwCsz6rgO7UXt
	AZ/cmI2DH9rxUazKeeLW5uK4jJnrRh0BDQ9C1fIZEFZ2l7omyux10WJo6S+5pNE6xGwFRRx1nlU
	fLvKvX+dl9TsrE4BLlASs/lqrU/vpgVAJ1864f4W0yAgBq/viuXNUUP5z4m34dBsuDrsEZBAPI3
	20HDF12FT8smgVnx6VhV6B/bbPRu/H+oniJw7qykFExBjgLRsatu/Mozc2rHt9u4zDgctCqVYnG
	PugNCp3HDQT5RyOTxGJ0sfalZHLcmDlzjNR4OVgnvVK599JNgEsNHri5MKW1ocOjjTOhZtODSLT
	0CjeZnXn5CzvWvavp3ROQVT9oWdMkgNLkX/tE3Q2zpE5YTm6TZIKMKcUbo1xc3cl8KyAakW9r+H
	OK5ewA1dg2hipXT64FA4Aa+SFKWuQwhF98WoPSmlm0FMDF7NtjfnH19JjXs0jEC1LQpPWixqOyP
	q9DXWpaZZtpmQ02MRiSd5N0snqr7Z3QLxmJLKRLc0pcJMJzTlg==
X-Received: by 2002:a05:600c:8b64:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4ac16fa21dcmr308685225e9.6.1793699646995;
        Tue, 03 Nov 2026 01:54:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aaa4b85fsm43219155e9.10.2026.11.03.01.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:06 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
References: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
Subject: Re: [PATCH v7 0/4] arm64: amlogic: T7 thermal support
Message-Id: <179369964613.2330120.9766633798877372121.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:54:06 +0100
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

On Fri, 16 Oct 2026 19:16:06 +0200, Ronald Claveau wrote:
> This series adds thermal monitoring support for the Amlogic T7 SoC,
> used on the Khadas VIM4 board.
> 
> The T7 exposes six thermal sensors (a53, a73, gpu, nna, vpu, hevc),
> each accessible through the secure monitor firmware interface rather
> than a directly mapped eFuse register as on older SoCs.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm64-dt)

[1/4] arm64: dts: amlogic: t7: Add cooling cells to all CPUs
      https://git.kernel.org/amlogic/c/79279ee341b99634f3c106e5970e13d073e8b064
[2/4] arm64: dts: amlogic: t7: Add thermal sensor nodes
      https://git.kernel.org/amlogic/c/c3644a9b59fa49ef88bd312dcdf47cc6e155dbeb
[3/4] arm64: dts: amlogic: t7: Add thermal zones
      https://git.kernel.org/amlogic/c/e41608d8792d8de0369a0e90f7e0d2b45db27541
[4/4] arm64: dts: amlogic: t7: khadas-vim4: Add fan cooling to thermal zones
      https://git.kernel.org/amlogic/c/e90086cb0f608c55e0b2d17e8db8207e789fdaf5

These changes has been applied on the intermediate git tree [1].

The v7.5/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

