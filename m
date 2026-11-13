Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601559;
	b=ARqrpLPZ4aZqF7KpISE7V07f37x5DrFmZfnpeTWOx3385OeAjFsvnzTUo39FMm3Bk+Ve
	 jG5pK4UEWFlKF3ifbF8Acw0H6z4wPeLmxWsCJMr5JPmzIm7+/cyvQKmBebJ/nwLjK2PRf
	 usQC/Zk3BzLOcI/qMg8+OqTsHriLCekRMtOHOXe6XU0M84jZMMZP+FdJ5cY/AZJF9n7vy
	 GDp/9CcbZFErtdaWNH2RlIRv2rK1tSt7ZOyEUrsXEXnZyLB/BrIouO8G4Lee7nj0k6+ik
	 J5lWFezw3X4ZK30skAkWOi3vchlnUBZSGM3d1pamvfzVK898bcNwQP634b9e+AzNN0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=YavfHroeJbmr+VHcPmcN/QbM0vDy2kwirUjQA6La55g=;
	b=LXGyy6RPbbx4bkMOk0xwMFMkBeqVRsatUKz1KFFFjzLpko13k1pNf0iv6IRrKyOI+ofg
	 t0AiMVRafj2LCLKHNX1FzjF/6nPPehNsnj7+c7l5/9MjTVEn0yaapdp7NcrW5+ROReZG1
	 /rax7Nrw96yT0jSeU9vtfz4GkckewFUQR9BJriNA4R42OqBqWItFHwCpLMENlljeZy5lG
	 enMgmarluIvxuGpliPxiCAWWcAhqL44Zy+01ucTX64r+dEAf4qwohcsPpTaDIaWpIGNPk
	 zLxCX+32J2mPPojho4UlF/O3vzc1bDl1heC9NCmXKwCiiDUisnENNHAF6IPkibS3X3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I8s2V8pM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD67606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDD67606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I8s2V8pM
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c00c727a21so158047e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:25:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794601557; cv=none;
        d=google.com; s=arc-20260327;
        b=bF5ypcb+qqQiXtnuGs05eOFsHBZFNUw0+94MP+nBUdVJ5likqkJzO013ikkbcj69/R
         BumyTsA9xIMRWOtEUDe84JH4RktJP4tukR2yVxzcRxM4pFQJNto0H4wLTtNMX2Jy0DtN
         KF6PIxiwu3FV+6JkDy5dp8hbsQLu1/Mff1e0exmwBfBRq2itFxbJzuu/SSt8ypMhpHfn
         bkjl/UeVOJwaSU6RatyeP7BHu5DXQDqRM9x2tnCgo14T6DCr8yEVLqrBvqaiR7VCT3ZJ
         /+Ppqs2/0QjD0F2StbZ/gxq1dHs93xdL6woya9X9a1luRjmdM5f3qOgumEAkTM8Q+7qQ
         rfQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YavfHroeJbmr+VHcPmcN/QbM0vDy2kwirUjQA6La55g=;
        fh=NHDWjrH+9Q5ORyufeioWrkgccMnV2HCQlwJxp9PUzKI=;
        b=E5wmL6XkLtbqwoCOl6qvUr4fsOCKE5qYMpIgj3z37bfeuv8Lp6vPCLv2PmtDEzwHFM
         f9QzmAQ84BCO+bB2g2GM3T9j2E2mNRCXHOOgsIvavmCQNh7PGNjuuk4whec2ojp6SK9g
         WSFcdMddeU2/+eqIPuCBdrlecXx04Wv45MwV/boJMF2q2jUBuCGPerZQbrzbQdzYfHWu
         r8ial05QAwaS+oxjIJWW3bgKPNqyhzqLeA7e7rcFet07uDWEnWGVT6ZSq9jjgiNeedRB
         6y/LLvfS6UN9r1FTCYy68hXZTPSbiM7ihWdZpTiYTl+hQLtV/LSwhkgFe1+KnfKcdJW5
         oWGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601557; x=1795206357; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YavfHroeJbmr+VHcPmcN/QbM0vDy2kwirUjQA6La55g=;
        b=I8s2V8pMDHuZFGy9ejBa8vnSRv8P7xTbX2l9CePnnfFQwPBzZvLTCg4VhSktt2oMek
         GPtGbSEfRTTs2j3jo5mP58Ch1Ed4mjwffEfE2SO3cMjJXQQoArUgnQQ2elkeow0O0Jb4
         dD+ejZlpqGxiv9D4s9q/acSzFDm5v0Mi43+QuZ7T4QZsy+HwUr9ZeppwElSkJdar9gyk
         t+YA+4YvLewtJBgtS+tffL+UWaoBMa95pc/U3XRU+EEjVKq/3W1chCWqrsjgIvIN+CWk
         8bPy1hvMb+7LO6LjYPwWxReuHVgqF6oBvMhYKy38DZnq6nHdkgJzLIsAnAi3iE6xEy45
         KXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601557; x=1795206357;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YavfHroeJbmr+VHcPmcN/QbM0vDy2kwirUjQA6La55g=;
        b=K1dryTFUvJ/+L8gzUQnfUiw5OwdEJ/G50yAT7u/+YUSSUcrWEHZ2ZNOsI0TdaXCxxy
         bjLD4RPLr1lT3Ier9vu8TZeqxwoB/ukIRHQCpt7UUE3wU8vYBPpYk8A9fEYENrtSm4rY
         lX7wSXcaXmv1taOWMW8TSDpOSBPYmbc3qcHJHlU9dbFrwKWCDoQrc8q/EDfDVIx2xbjs
         ftrZOcyBD6nswMzOSNSnbxppYGYRyBF9S+Ep4K1KCCSuHAIftHzH1Hs5wzbigBgYTTGD
         BngU8EfYOj/LZRIOm3rgHGWSo79PZJoz5GHssc36DvknJQCod6gCKF2X/Kq4HuX/23lM
         L6sA==
X-Forwarded-Encrypted: i=1; AL+hErHvgcGhHl7zG9L7UQGpYlelbfJ0bjvI8KAQlEb6ZOAjks6lTaoB2bJDO9Us3+/wnRzm+cXvssz1elKnYRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8J5QPb+xzSbPP+w8VvZi/e1BNvH+MJlyhkd9VP/XU6dNjwONBJ
	mq4T1CIbOjBQalKowa4Iq0mE56KlZfpqojeKvBz4rEQzsVSO0kEokwYHGz+26nbd1D2KqmpCYUu
	biXB2ahMjBKOmTmvzrwZCl9jCSTLJhxc=
X-Gm-Gg: AYBFou2GWKSVaNoAPQsbry+EqKc8tb8CwAu0XjR+wxbkjws0fYXwKJPcOJ5E4bGbsDU
	/UR158ufOxC+/QumUwGERjBxjlxMsI8pmcgwil92cMaNjqNuo38vM8FbC64u3hVoaVYIzVwrdQ0
	l9E8W7WYdMGOwN0uf74YAAb/yDPKDf4rsrndMvGYz039hWsDT8WQwPM8/XEYZmCvagBuDG3j4GM
	igZe3NAu2DwgNwjON2Vw8A2bhpfyqYnG1ab1Gx+WkW13GezZcsdqiofdv3jbCxc/SZLhDIX7Jyl
	k3SEOY0Zug3G+1T1+nYbmakNDj7DzFi1u0sDGkPG6e/TJHWf9nm/ydd6Z+WBBDX9MVJblFn3chE
	aO0ogkrI28dAEhXwBai2Kc0az/3HzC04E7o+dlm4R5HbsKNafAPM0MosfIyH+rxIKibCOCc2v
X-Received: by 2002:a05:6512:1326:b0:5bf:d00a:b6c0 with SMTP id
 2adb3069b0e04-5c17076e20cmr1778621e87.3.1794601556720; Fri, 13 Nov 2026
 12:25:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-vop2-fixes-v2-0-8218c1cf8ac8@gmail.com>
 <20261112-vop2-fixes-v2-4-8218c1cf8ac8@gmail.com> <380996af-b987-4854-8b52-a3a214b19e79@rock-chips.com>
In-Reply-To: <380996af-b987-4854-8b52-a3a214b19e79@rock-chips.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 12:25:44 -0800
X-Gm-Features: AclHuK9Z0XxZveIpcBwbR-1StXFvWIPfHqJtynCF1BYTTbRYTOBUF4wn1ddT13s
Message-ID: <CAEy9hNUnZkqyg95DsShdr7UF6CiQvKhpvJxrx0TSoq3do2nyEw@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] drm/rockchip: vop2: Don't accept AFBC YTR for
 RGB565 on RK3588
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Piotr Zalewski <pZ010001011111@proton.me>, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Chaoyi,

> That' true. The TRM says RK3588 only support XRGB888/RGB888 AFBC YTR format.

v3 follows the TRM: YTR is only accepted for the 8 bit RGB formats, and
the comment is gone.

That also refuses XRGB2101010 with YTR, which displays correctly on my
board (AFBC 16x16 | SPARSE | YTR from the Mali-G610, HDMI and DP). May
the 10 bit formats keep YTR?

v3 5/8: https://lore.kernel.org/r/20261113-vop2-fixes-v3-5-08ae37e83b5c@gmail.com

Best regards,
Arun
