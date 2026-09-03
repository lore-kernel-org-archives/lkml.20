Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA945385D79
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422384; cv=none; b=DYH45ax+a2WF7L7ZFvmXNyVMG0U0hQK8ymWeHWYzpM9ZthFg8IQkXOvCjR6q7A+O5jDSGQWXVcmhUuAWrOW6XK7/enlbAiKASI/CqzyJEmoKAkG6xHsl8gIJQ93MpZ79dOBbw1GHzJ5aDYrOQMDi1T/5b4/sO6kcXgKDD7l2F7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422384; c=relaxed/simple;
	bh=0f7Emp76RF4wDRv+c9hXs+xIqJJvCmxjiKd++hQJZ1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=goRw/g7Qz/B5w3Knfg5wOAyp51NNxXcaoSqFZKzbTy15eHcpnbdO69mOxuCl8bI2e1nblS84AXwmg+6xK9EOm9kf1ix/+jf+Xayjcox2q49FoHVTkg9RWUxXHPwmeN25ps+UmyuddojhelnOtAFH9urw8TPPuj6W/fcXmH4gUNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljfD+dpd; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljfD+dpd"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4858303de5dso243911f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422381; x=1789027181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0f7Emp76RF4wDRv+c9hXs+xIqJJvCmxjiKd++hQJZ1M=;
        b=ljfD+dpd3qCxyz8FOWdlENVs6jjhBpYfHOrwrtNKZE7/MQUJQJRhA/enQx/2lOnl59
         VCkpwXyHKu7mQ/g72hGYy8vgMoeyBciwUvwZV5aPIfzhcgNtW06h17+ruHxt8cWgl729
         x7Mpu0tsOX+fXL5qewvTjH90EmmesrsaOQ5FBze4svybFfVO99GifGdsL5zzDkMRhmMG
         eNxHDGDPsbhCRW7Krn68DKxqpIET0zeCd37tta2gUBzjGGh9TFIc/LdBxBM1mOBX5nik
         YXNaAAtXg7xQ9/boMo/wC3fpO2s6Xi7lz2q3fw2JO1XUEjlNbPABYbnT9slfnSFcFMyH
         1A9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422381; x=1789027181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0f7Emp76RF4wDRv+c9hXs+xIqJJvCmxjiKd++hQJZ1M=;
        b=d88VnQFL8sPVNqHQywnBGkOaHnlHNqgVHdS3OdRV/B5iIvMn74mcC3ZJo7GThqZ8qm
         oFYC6eSflqnN9MFR/u9ls6coXKClg41Oli381TnfGvAzODqTrX7OEX05hozYfrk2lsY5
         pLdJpyLorcQtEyThTs4tqjYjq1Q2XK0hBqgcjroApLWvDGKpzyXMzGlXl8+8tp2M5Cw5
         CBaq99E/tkAzqaTclsX17mniTUk3R730I2uXHfcUtqEb8tUwXlVCjPDm7XAJtNZ45cS2
         wREn0RIi/gPSsdQWehQPkjLiQ/Ce84HxdNzih1wAu9BLPWReNO4MhVdq2RNOaIjE4DBW
         sLnA==
X-Forwarded-Encrypted: i=1; AKwUvBwz3d5md8bGxfKfVjciRzYHV7BQWEASyGG1Cbj4Olxl0gaJZuESCxUWAL7IM3grBduHy7q39nHctCT9qbE=@vger.kernel.org
X-Gm-Message-State: AFuF++m1sDmr0635S1hexfdvvI/Ti6Qj7EFtrjtas1brMKfAy6x5zuvV
	hreFcAsnFD1w+vhLQLD8EVs1R0haKTBzLiG+9aCfMT/4t0bND2pVglWG
X-Gm-Gg: AYBFou0jtA48o6CPMZNd6NvY7ODrcxC3BpRuVfxKOnhaHLYhf7bJDXnIGMr4Mr2WYzs
	329uswMYe1F8Z/OFTy5xbwckqSazDuYRvS13gtbe/ELFUFYic0J8bkNxSDSwIYMj4KUappoapMb
	q4O+6pHIG9vK8nPKTEfzDMppaK1kboo+EOVka4UZ3+eYxbL7cZqWEsA1E3ksLpzxZp0EuFCKWLT
	Uwvwrf0O/wY75qfPYP/YzmdGJSNbWrCkpwHPHd8/K83PVe0A4mPc8DMllvlpqCy8/ndXwCVsLd8
	Xckf9VoUQPx7XUq9w8LFAu55oj2qJYrOt3Ao1APxDi3gfXeN4Oz9l8HYQ38USCQKhBVCIqlwxDT
	eBp1jIwAzBk4bo6tZGSflDauroPuuXH+X47FuSbHidh4oVU5yUWmtiXg3TsFDwS5THu+cDZTJYH
	JYED84hoIXxJtJiK+KbO5b4isl1C1ACvUj0HtFJeASLkXEduascK3MPPGdGu6SnxedrA==
X-Received: by 2002:a5d:5d8a:0:b0:484:41cb:d5f0 with SMTP id ffacd0b85a97d-48488f103d7mr17847999f8f.17.1788422380714;
        Thu, 03 Sep 2026 00:59:40 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72c28sm12914843f8f.6.2026.09.03.00.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:59:40 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] gpio: mmio: track the direction of chips without direction registers
Date: Thu,  3 Sep 2026 09:59:36 +0200
Message-ID: <20260903075936.2089280-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903075021.7AF3F1F000E9@smtp.kernel.org>
References: <20260903073143.2068494-4-mehmet.fide@gmail.com> <20260903075021.7AF3F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: Medium]
> Are we correctly parsing the packed pin configuration value here?

Yes: gpiochip_generic_get_config() hands back what
pinctrl_gpio_get_config() returns, the bare argument, so config is 0 or
1 here. The problem is the get_config() documentation in patch 2, which
says "packed" where the implementation says "argument"; a driver written
to that text would indeed break this check. Patch 2 gets the wording
fixed in v5, this patch stays as it is.

Mehmet
