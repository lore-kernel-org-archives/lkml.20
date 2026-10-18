Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3547C486645
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326768; cv=none; b=hk3jfEcHgRoxjmtYtXGCKLtKa+sxOSM15ttGXXdB8FGrHC8e2bVBfQdjG3qDUVp6OzjBIvqaBFvJ7Qp6j1NFMYuAYULw6fknAV7eVbK8wBYBafjXRRLoFoBaWNbnWiU8B3evSm0XZigslYueHxKsRj2V2uASZDncOocm4ml+uww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326768; c=relaxed/simple;
	bh=jK42QSJLlFCZiNAkrZ4uWt8pBppxkc2bz1zJLNGahFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NXEstSY8PL+iJmmQrFrk+bn2eMDR1uV4MFEIcMEU+ge49g/9Noc0+SNZ8lu8SqJIgsGlG32sCexBHAD37pZnbaj2U0DeV/Bsi8GAZ+DqJIWrrQlojF0qys46NOVa0cLeYiAwkXOjz7qxzW8N+JGmGdv+C82oT87mEEMj1kLTtQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/+CjGDQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/+CjGDQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso13334495e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792326765; x=1792931565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GpPqZvPlIP3fXy4tW9d7V+mx955z5cVsFSY/eblWfwA=;
        b=h/+CjGDQ/y2NFYO2Aij72eXlfWMe9D9aufSjskF3XRqm01WCnH1rBmpbC5m4PVt9Zc
         88u2/27jOc2w7k2+LP4oWwoqe4Ov3ydAshEX4Krw7Bn359146sTgQC5c0nexlyTCXUPW
         qAAX8Ol05owQQ6B+1t89XDb+pnSds7/mhM0x1nJUQN8EwNDijixN5ENC9U8wnR7OKbXU
         yt7TNUp9WneQlJzibpPC3Nk5UbhYqH0nc2fEpSIqZkXPx0PSuLf4iEWKdgrZ74pBLdXD
         8RpRJ1rFDZDCaJkuZMVF46PJ53nlQ38Zp/YkJIpVb64zzYJ2jWzbta2bRFnKDqyl2tQv
         3q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792326765; x=1792931565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GpPqZvPlIP3fXy4tW9d7V+mx955z5cVsFSY/eblWfwA=;
        b=Dp1nSwfCFVdm1zf8dOooGgA4+wsyvjHu0+PLgQTa2t/tdIcLfyrXnFI4HMWIj424Iy
         sIdYhUShhqW6Bdlp5ZygFvTxbpFcPEFFzvJrX7fnBUuqEMg5xxSQnaMlQfl6ONqVeR7K
         ojsgKTnncqr2sRCVK1iY4HS9Xeh5cC7eGWmIZ2a8zhegn3rVAM9W+j1+T+4BJlHUrrAx
         u8wCRGj8OaVqIVxbZsjdA2ffkKsNazA1L3cELaXoqnEGGIJCZZJUbakP6KjNnTY3azv5
         Re+NkHslgjCRUAZs5qtfWlkX2YqXYQpw7BWLMQQ0gMHqgMocBhwLu1d0pwnGLfmuaQKD
         5t5Q==
X-Forwarded-Encrypted: i=1; AKwUvBx64OYI6XQSuoqLvGtVp308C8gBVfUnm9zs8Oi0VsVQW+loTJKQ9DTDSgR+EKx0Gi8WLtM3rB0hO9ls31s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKA7K+TVRQh+9Vi6BDtcxFH9yal8sCcJi1HCFtUgbrf/buRFydZ
	DPxzOHXP+cq/VoGotOTHIlxcQ1XFNXyELfgBExzRjfVazuJWVAwOlZ/f
X-Gm-Gg: AYBFou20e6d9QGr7d9LLqL4YJZ8S1WQrnAfUJXsDtY0+ROawQYfGOagPyK1HrROZgLY
	PVKT3qZ4Z0zraX1CJ236VA12oa+KLcNWkLYkDEmI4oAV8b9/OF59dE9Rkoa2bnuxUvy2UfqDhWr
	iYJe3IuiuBY+trlP4JOqEAN8fNBzHzk3PjBfU53YYmUUdd8b1RNWhI124ntvTerimxbySv2ogm6
	inXdzYOF7vROalWi1yriMwch1upvSBycBVuXvIGFjXxNRmIFu4wZsvF63ehNyha3XYg65k5M8XG
	b0/hVLg/+sch4PzGK7MImQjWJns7KgznRbxnNqWHZJkVjsBbKV8qxhOfoeVa2PJ9PWykz+tsGA6
	8XqACgagkKkPHj/z7fwTsNyN4FbWoDrddTas0zWTZ+++nL0pX6isfegLUPY3QwsLt0ygESANeCP
	xdQ9rEDFDX2SKpwrFA3fbgjH9Bgdpzcb6wAHDLveuIKSdCdVZSz9rme/lCCLBt/Ryf4jpzy2l0A
	+qikXZfdaAZSBmtYuncDN/F1AnKyecYRfhgh5SzpVYTTjSSiecJMjMFbraJ7Z/hwOn8nSmVwbTO
	KLCAXs8qANCMBT6mLy4u6g==
X-Received: by 2002:a05:600c:6992:b0:4a1:d7c3:d3d with SMTP id 5b1f17b1804b1-4a1d7c30dd2mr96288465e9.10.1792326765173;
        Sun, 18 Oct 2026 05:32:45 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm245012535e9.12.2026.10.18.05.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:32:44 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 0/4] arm64: dts: Mark Variscite i.MX9 I2C recovery GPIOs as open drain
Date: Sun, 18 Oct 2026 14:32:23 +0200
Message-ID: <cover.1792326585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C recovery GPIOs on VAR-SOM-MX91 and VAR-SOM-MX93, including their
Symphony carrier boards, are missing the open-drain flag.

This series adds GPIO_OPEN_DRAIN to the SCL and SDA GPIO specifiers to
match the I2C bus requirements and avoid the warning emitted when the
I2C core enforces open-drain operation on SCL.

Stefano Radaelli (4):
  arm64: dts: imx91-var-som: Mark I2C recovery GPIOs as open drain
  arm64: dts: imx91-var-som-symphony: Mark I2C recovery GPIOs as open
    drain
  arm64: dts: imx93-var-som: Mark I2C recovery GPIOs as open drain
  arm64: dts: imx93-var-som-symphony: Mark I2C recovery GPIOs as open
    drain

 arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts | 4 ++--
 arch/arm64/boot/dts/freescale/imx91-var-som.dtsi         | 4 ++--
 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 8 ++++----
 arch/arm64/boot/dts/freescale/imx93-var-som.dtsi         | 4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)


base-commit: 31f9ec9f38735f42e1f0ba57347c420e56b99824
-- 
2.47.3

