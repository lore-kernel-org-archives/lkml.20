Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF674D489A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657752; cv=none; b=dIz9eOuQ0YufyXnnxmeXiZ/fD7TpBo/Tzfl0GkSxshYa72KAKYhxqIVcXt5MKZofC7hcT/J7EuQiJldiYhoe4jXyzslABoxtd2k+QQMG3lfMWoCuRJe0YwyNRnle/byKlwp7tSrtjkGWEoTBImhOMddg8bI4vhrMS2e08Bi89Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657752; c=relaxed/simple;
	bh=ZNQ+cRgP+nXk8+UUGlAkoMqikfrO1wJLVlFUQk1/0iY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UoCw9VK1OircUsbzZBUyzBPjA1VLrjNmTRfs3tbDDfOKsR8+1xjRMj1Y4fj3OOagtiU3Z+e+DhbNYEoD+SnEo7TSRbKmbBHhJw30HSBgPvCPIjR0PNJF8Xiw99j52gyFE7BRGb6Yx0Xq3ImR2OV0MJWEBUiGDfHf4M53vCpP0Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ofvGyRIF; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ofvGyRIF"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so5922555e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789657742; x=1790262542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9b/fhEwmBPxpFcptPOeQ0kZ30PMWIDMPcXHfa9JyTQU=;
        b=ofvGyRIFwtBj6ax81jRlJtum+MjOvT/mTUE2seOY29TvDLvyuFcBHYXYJPFtnPLevB
         aNV0Qq1p8fm8RvelJ6ZOltzi1kaXTdZqcYNzH7oUs5OI6hgWCq3MUyvcfCgERpm4MQMf
         1Ec5HcyJL8MuhrSTLin+0AKsniCStA9s5i7JmVWLJ+Qx2n5PvSjQdlzzj22dtaYVA4+M
         o8jgYVmh+hyfTY1Js7EuDPF4GRG3pbzyCKgpA374ysPdvMcjMmh0J+deHuhO5UotjGWL
         EGJWBaYulYoHEBzSFrBsW8Osg09XKGlkewxSnRsvIphi6ICLOaPlb8rarB/WnLYtuqjO
         h+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657742; x=1790262542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9b/fhEwmBPxpFcptPOeQ0kZ30PMWIDMPcXHfa9JyTQU=;
        b=LsuXxsvXQTKuvoE73xnDMPRqsP4wmepUpTWgToYxJm4zVRJqws9F/wvWz9nvugXPpA
         GKeWmkYwRIvG8K/UrJViAdcesQUx01Kbk/tW9hUZq4uItXtvPjPYe/uotnpqeWcMdCJU
         iBm/jwIdKGPgEUXO51XihzT7lP6BGJqhthpYUk94YMorU9ZlYdbTPozZAWpV8F1bEf3c
         cG3PREX+WTvCeOxaElsXzTXUUCIaQh6eh5bpfg03V5i3nYDzMfxirG+AMAug0As7I2Vj
         aMayeqMTFswtrmAVr7LleJdIkHS13bAfQLsoZyXdluinwrGkmvy79twmT+K2u5vqqe1S
         Lf8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxDJQErlJeXc+kuqDeSfFnDcqpSAZl23XCk4ox4/XnVXYnzF+Cr0Vo8JKviUUxb9P3KbTBJ9/L/sKJ24J0=@vger.kernel.org
X-Gm-Message-State: AFuF++kWYbWKf2DJH/5xp4az/z4VYsBnmEHCIDEwb6tqemuFsrv2JZgv
	IlTYyqdnVgofrbLYHrWkd6IbBkLYhH4hAKRUZ9AwO1TEhOBE+x6jJhnc
X-Gm-Gg: AYBFou2AYLPieJ5ZLKHW1kjl5Rr/nRCi7fbe0+ra0YU44/qkSDEYToFgARgidam1ZFf
	T0wxrEHu0W3jzWnMbgHGQgfqsXhH3LN9iB+u5wibn2EHUP37cRxFd8PVRIXv6CwvcERplnMDPAp
	6ZyqcPTd/Y/EtNJ7InhAAw/KRDzm9WL8R4X9qa3qb1wL55NzBejYkQv+OQtSlHNOHaO79FFRKsV
	1mlVwzjHnMjDhTOLSlYzcEsNeF9mE5MLEdHPdYhKHFu1rtpUcLR5/cOJBD1acR8iG59qeJBfCFU
	76DqnRUcc4XkWo1+xPbVrp8G4I5cew+we017F/Jh/hkKf6XL7rTTE9hVoqxhXir2U3j3KSDBRI5
	o9SV2IFBenRU1zzcL3L8gDGVucNdt0lGv6ImCM8jZRv/WsMrbtmfSTr5jRnXGYsu3P8e0/2iYvN
	GaA3cA4lNr1RGzE2imNLplBKO9Jq5uHiNw04c0gveP/3yx9EdLZdTyKzxi0rJWxOJQ04uspB5cV
	FMfk4nndn80wmHY+w9F1pCOroIHsS9Aavv+mCUnr0nD4i6H+x9hb6/FcfK4NEvtkdxCz9EVHSto
	NzMy9H+AEfBdRXVGp7CcPA==
X-Received: by 2002:a05:600c:314a:b0:49d:16f1:94a5 with SMTP id 5b1f17b1804b1-49eb732b59emr86524435e9.25.1789657742060;
        Thu, 17 Sep 2026 08:09:02 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd226ef3sm82531345e9.1.2026.09.17.08.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:09:01 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>,
	Nate Drude <nate.d@variscite.com>
Subject: [PATCH v1 3/3] arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay
Date: Thu, 17 Sep 2026 17:08:45 +0200
Message-ID: <197308a77fb4310a3615bbef084b25fb1874c753.1789657399.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789657399.git.stefano.r@variscite.com>
References: <cover.1789657399.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The Ethernet PHY reset signal also controls the regulators supplying
VDDA2P5 and VDD1P0, so releasing reset restores the PHY's 2.5 V and
1.0 V analog supplies.

The existing 100 ms reset deassertion delay is not sufficient for
reliable PHY detection. The TI DP83867 requires 200 ms of stabilization
after power-up before MDIO register access.

Increase the reset deassertion delay to 200 ms to ensure reliable PHY
detection across repeated boots.

Co-developed-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index 9fc0f7e551ca..fcd937d8d29a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -123,7 +123,7 @@ ethphy0: ethernet-phy@0 {
 			reg = <0>;
 			reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-			reset-deassert-us = <100000>;
+			reset-deassert-us = <200000>;
 			vddio-supply = <&reg_phy_vddio>;
 		};
 	};
-- 
2.47.3

