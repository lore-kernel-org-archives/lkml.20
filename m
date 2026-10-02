Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7020C547071
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947940; cv=none; b=W6x5vs2/4gXSlni0l2rZzrokgjZap2/+G9U2TxofJ4l0AlsEr45665uvXIKFydNGAN++KbmgA2AT84pjU4MeRmKnceXpd0iEAs7rM0G/IFSMph4l9RJE/6QVK+rz+uhHdEqEJU0D7akXDwBMgT7FFC2czk0zvO+txMF+j46p7No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947940; c=relaxed/simple;
	bh=yI1sJ8u7HcWbY3EwhSNFIbq0rewYn6Kj2tCz78IACdw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mP0V1ugoot5gUO/ZoIXj+Xl74JtaHXUKaqr+f08SsHr5jvICe77aFtU/qXI+G3x/IiRo5/84MCdm8Zg27GcougozuUDJuWVKZsTE8QeboUdPb2hnfouIA0Devgg/vIIx05SIbaPeiqV7tS4zYS2exNDZts+79Ipp9mPwsFwpsqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3ef5zNc; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3ef5zNc"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b017a3be3so2529309f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790947937; x=1791552737; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hiRYKmHSzO5SlWk5Pf1admdJHvzaYFkX+u45NJi6WK0=;
        b=P3ef5zNcyI2VaRuZOFC1B+8ABT+u9XeIwtZlqHV+MpBdiBSo5mwKdIR4lm5FqFOj3T
         oPTTf4+BLl5xi3DC9ctP1mxDTqTMz81evjwiorF4kbphyhIOTLBOKERqob3j7+iWHQZg
         cxOJFmc7epzU5yQxCc+I69otPMotJGebxGKyp12t5au9rQETojQoeLAZg47FcbPWJ++y
         X1CmQO/5mAU+DewZcTaUkSuQX6nEn2NZEMrSOy5PFkDCE4AD1Wo+ezqvRTYQMYVfTAg5
         cmdTuoSTbZqiuYyVzUGCiGRjuFwkykj4J/WVIPSSqu4kERvQ63jf4E8m3vtUE+ySyKcv
         0Mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947937; x=1791552737;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hiRYKmHSzO5SlWk5Pf1admdJHvzaYFkX+u45NJi6WK0=;
        b=i553DhezvhSyAiTOcrBq8aIvPOcH/6HgRResqmwOTFZ+X9Fg3MLiXYmvZJaWY0IiN7
         mSDoOFx7t9V2NfPVMVsVmn+xR8CkhA90smtT1HhdeMHOjBUFOeGBeyj1UNQBJl3+TaWf
         3rdvXBZyt5KTLbEvWCrqAN8zwHl+PK7WDq49ZN7+NDTmeiHy2LwYuCRHuwfYjtkz41mJ
         M0anPhORoiH82N/ek9ylonUZP31yzs70xYI1gutAa3sWWui3E4/VB//4nTFOhcoIvZXj
         RU3t0CSolQIfRxHc9LyLi3G0dAnsUWeSd9qff9i5Cu2B7FyyuoVxxMavV3yfz0/mY6p6
         OsJw==
X-Forwarded-Encrypted: i=1; AKwUvByGPdPiPlWsl7YoByTeKm4OI5v6zMCj6IBDkuEJr887hzwSq6tmLYnD6/iAohUFp3VHNC/QhcYpEasBc0E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5Vf6d2HddJmDYKa92x3r/ojfz/sR9pc8mfw0XfnGO9uVT4YGi
	KNbCUufyP3d6Ho/jwxnLtcHT/MNrUI0A/RXz5Eb++gr48LCUfLa2q/8C2lRtLzWfASg=
X-Gm-Gg: AYBFou2kTFDmbNXraR53ms+kPJjAJu94Ry69ueY6AUF8hkxRHFjse0Ik4WgQpEjnnoq
	UpNBhHpr4srni4/kEA3dEUKAexCkh2uy1m3lFV6QOAPXM5hqNl5cYzr02A5vJT+qN236Ryvjqt6
	c3JALFeSY0a12YCwquiXKzpYx8rJRRrZWfpNnkJUNx59UZWZs0zoDrAJ1m6aszAY2eOgtbs3AXY
	TOAzjjqs24j9TTu6NDvzLcwJ5tHX5G3xw0T5UOCMuqnHDLSWhgXRurDQGFR6HTe93v46B8s6Tag
	epAJ9K1n+Om2rqaQWJ3z4SwhwCgMzP1WlPC7SOpm+Ad41U591qskjJlDFZuGkEFzEntLZNC/nz/
	xNb2ZJK1Mc9gxPJtnsNx3SYHj1uPSh6eOn48n1y1daMKG/xWbUp7RgAaa2ZyBzvCJNqtztHwzaI
	es+eN15ciycdRpCtOoBr63M1Y55pMGyD5A6S5PCr6e8iZeVuZPoaBF/BFNJJ0Bj2zzZSspWrDcK
	8PyGBwU2VGF8yfbdFJGxAEgrirtHY7QgM+uxBIZe8yKZFG4W2cadZOvc8txZggfIwO4hiVel7Yc
	4pJb/0dh
X-Received: by 2002:a05:6000:4308:b0:48a:fdde:5241 with SMTP id ffacd0b85a97d-48b12749eaamr5834965f8f.31.1790947936568;
        Fri, 02 Oct 2026 06:32:16 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9bc0sm5809855f8f.41.2026.10.02.06.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:32:16 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/2] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 OV5640 overlays
Date: Fri, 02 Oct 2026 15:31:29 +0200
Message-Id: <20261002-v1-smarc-imx8mp-cameras-v1-0-a0e89182c625@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADGyv2oC/x3MMQqAMAxA0atIZgNtkSJeRRxiGzVDVRIQQby7x
 fEN/z9grMIGQ/OA8iUmx17h2wbSRvvKKLkaggvROxfw8miFNKGUuy8nJiqsZNjPMXaZgsvUQa1
 P5UXu/zxO7/sBEtjHR2kAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

Add OV5640 camera overlays for the Toradex SMARC iMX8MP SoM and its
development carrier board.

This series requires support for the toradex,camera-connector binding:
https://lore.kernel.org/imx/20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com/#t

It also requires the following patch because it relies on the on-carrier
3v3 regulator:
https://lore.kernel.org/all/20261002-smarc-imx8mp-display-submit-v1-3-f578c63fb676@toradex.com/

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Ernest Van Hoecke (2):
      arm64: dts: freescale: imx8mp-toradex-smarc: Add camera connector nexus
      arm64: dts: freescale: imx8mp-toradex-smarc: Add OV5640 overlays

 arch/arm64/boot/dts/freescale/Makefile             | 16 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640.dtso          | 75 ++++++++++++++++++++++
 .../imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi1-ov5640.dtso          | 75 ++++++++++++++++++++++
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     | 26 ++++++++
 .../boot/dts/freescale/imx8mp-toradex-smarc.dtsi   | 10 ++-
 7 files changed, 230 insertions(+), 2 deletions(-)
---
base-commit: a1f0ec0d615b3287faa88cf9b8b8a125e2b6e470
change-id: 20261002-v1-smarc-imx8mp-cameras-8b664da20da4

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

