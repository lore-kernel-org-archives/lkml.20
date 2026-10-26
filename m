Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006951;
	b=PwQxn9VslxGdLav6GL8mfWN9FksU2Q0RJoqorZRaCmHJ63L1Gev5pHZJN+NaQl5ALq8W
	 KR3BbwnA7n4uGIt9dNVvCoFVUGXuwkLPUF6/ziE0iEKzHdXTCMwLe1lxVZrOIahhvvgsU
	 7zVYNkAXa7cZnZOzMt3Cvp8/C8oqMQGoxCA/lX4SL4HyWYA3v6zpscRmOjpJTD3JX5YaM
	 QANNOqZwprObI4GE33TaGbY2eqlkgxikMD79UAfpfkFwF6dt5qP79Jo6bclIaP9zagRa7
	 RQ8Lo7UwpIAJw3ivJk/ZEq8YHsiOqVBgwSSqZcNxOpwsw6y5FAW//VZPEIa+Ti6TobA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iHJl2Qh8Tnlk572C5kNHQyc3XqOREsPzi1FpNma4L3I=;
	b=zlI3DzyvqJBItDK3HzbSWryfxnfduK78DcWZVozPfvDjCwovNoN0XfAKzktUGQF3S501
	 Uim9yJQZ+tjsiMaVddMXCLpuxT0PHukfZ+juSjK8kCzwRrolIQYWNDUMTB1Yo536H4S7q
	 vcyNa1vhBAb+qbMpF5HROc5gpFnu6xWSIlPWOBygABxR81cAPmfE+dTZ0td85IAGDJ19u
	 DwaI1ugQkmqMYYgbOF4It56wWjwwVLkeExRKk+0Bcu9wey1b05jNRnBg6RzQiPxWbNa+J
	 ckUZDw3J8AD4OukmQrjgz8CIjVsScqwu6WEutX2aqhylH32cTUubFl08BhNxnz4iMjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fTCqnJmZ;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A1D606A331
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99A1D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fTCqnJmZ
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso11853935e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793006949; x=1793611749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iHJl2Qh8Tnlk572C5kNHQyc3XqOREsPzi1FpNma4L3I=;
        b=fTCqnJmZsRBXplhYxFAOrUar5/9FwpEu+rdiQIigRVB4eQQKie4OHxu5TCFViIK4iz
         ue6D5JQThOG585rYCKrUQVMR5qHWIptSC+SYYJuQ+pPMTOwyGLWkC1d0Jp5arloi2hTw
         wcC209kO5rlY3dNSgI6lFVjvJxR/Gzj58rQo3ddtI3g/DBcfyjKrqckNPOMesd0VgJBv
         X9CGPij/vQAgye8IP6aDhAG0TPkz37vjYJ2I/mtuasGA7hjNEomOXEX9tDcpoL65e9sF
         fnGG5eAZ99kbgYRS10swnHx8QTEXG6xe8D5GuHwWi3weR4sgSF8dwYbnY/86hmhbaDRn
         fbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006949; x=1793611749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHJl2Qh8Tnlk572C5kNHQyc3XqOREsPzi1FpNma4L3I=;
        b=dQq1l8aJPAcvMFlkXdB+w6PqG8IAjwM2v1o5pJyl+qvwnlq3eKXvpELvV7EsnKQmOA
         7HbF2KAj5ATBDalIh2mCNg4O+pS3dVgAVexJ/m5qxreynGhViluYKoptNv4VQsy/GcaE
         V1VMHNtImYgcTHcAuhEEv6SlbemmfjgTFXgA3aOasl09HJ/p7ojvjuGWJpCFQdE/9s0l
         4uykPUYLkEoi0xjshAB+QjvImQWxH7lYVEfUmtA+PvnXHlOPodRnszQZlaKaTDLHoRk9
         x0xpi/uooPdBi9ctX+XKM8jT58zyPjQYTMx1mI1D1p/D/kSvcuKwpvCj5UB3rUvekizL
         PLAg==
X-Forwarded-Encrypted: i=1; AKwUvBxk8c2l5de8zK1zIoHnhbHp+JKHCk5hvQGtxDyEN64tMQotvwQcP5GgU32rRz57BLu9ZrXS/N3f6It4nFg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtqRqtU/uox/pXIzyOslc5R6Ovya/5gEOw2ibKNgEVQ628zzmg
	veW6gtHcm8ic2vBuHA8GGhQZMRA9UXE308/iyIdTW02kH31eup34CprH
X-Gm-Gg: AYBFou1D/CbaI2DNQnYeNl0fkbLUowxB/NBgSpbbD+zIAKVVTFNjxeOHyBqF20GqjAK
	Z+gMW2Hck2pFcIWSwkJ27oq3/OL8oSS7IMmR/ATe5PDBqbs0+aCoWMkuNw5E6NtcNOvA0iF/uNA
	+3KCCZMSH/nQsffbo8CH7iiUdM404klCOJCo+SgZTxHBjEEbRQFRb0zf74egoIHRzh0GuNpEJux
	TooXPkzTth4s2OoO76rZ5rMJQsVmSw0DicxjB2XCBA910kwS4Tv5pjgDRf3zxEcS/TFsw+vKOoo
	HZvWdBJeh4xKgbIZMZIpklTh8eux3insUHmS5NRJP3cf/tFJZF0qW2PsQrdDkV20eV56k3lzb4Y
	ZyN1IyjeIIX7OZa6vzNKiJ/xS68jLsMmdhZiOq1wtLWRt4AlC3CeFHyDz5xMBQkFnfyldZ75VtZ
	BfEmOSIeuN8wmSCrtNdt+vPgniwg+DztAqrFtFjF3OhAm8CAQH+Jn4hQhYdKJO28FdkblKhEeLS
	i1Agpb4vkpHMM6rpPUdsT/fkQYIE/mTUrCOisZbplRP3hp9KkYhRXhrcpAbT7JHaeXfTpcSatsh
	rzQzId9MrjOgzTB5MbyL9QrxyvLgSoewIOWZV3xpm6w7pDLYPqxHY3Yi+YzmLJhz1H3Z2yRj4dE
	=
X-Received: by 2002:a05:600c:a04:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a7555d89c5mr4396695e9.12.1793006948732;
        Mon, 26 Oct 2026 02:29:08 -0700 (PDT)
Received: from GLaDOS.station ([187.13.216.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm187356525e9.11.2026.10.26.02.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:29:08 -0700 (PDT)
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
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: freescale: imx8mm-var-dart-sonata: Fix PCIe PHY init
Date: Mon, 26 Oct 2026 10:28:58 +0100
Message-ID: <20261026092858.10591-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The PCIe PHY times out during initialization on the DART-MX8M Mini
with the Sonata carrier, preventing PCIe device enumeration.

Add fsl,clkreq-unsupported to configure the PHY for operation without
CLKREQ# support. This makes the PHY driver clear AUX_EN_OVERRIDE,
allowing PHY initialization to complete.

Fixes: 770aba46ea0f ("arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board")
Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
index 57d29a5c3821..ccc81e5b3d36 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
@@ -267,6 +267,7 @@ &pcie_phy {
 	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
 	fsl,tx-deemph-gen1 = <0x2d>;
 	fsl,tx-deemph-gen2 = <0xf>;
+	fsl,clkreq-unsupported;
 	clocks = <&pcie0_refclk>;
 	status = "okay";
 };
-- 
2.47.3

