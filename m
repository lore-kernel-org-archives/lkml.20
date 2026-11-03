Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703117;
	b=f2dmfTRZB/BvQNRndkf9O+g6z/fzKIMslFaix9bFlk8ikpd3mubCyELQJXrQodNL1sNK
	 ou4gb+4zAodBMyii4DJ32x86jGnxV6OYsGPEVN1LWKPpggDanstVnMnPtANzVQXvjg0ru
	 la1aS9ZfbjdadrBMjSFeVWAJFlZH7xxUK8nAu4CMh563Nd/EyMCi2Nl+d4jeEUuahFmiz
	 RbGvlbzaCFVHVUMABIzsxkJIkce9AObtsj8Md7PiSJ2xmAAMiuNMjCHMrwJcxOAG4Hkvy
	 fr6SNSMBZ0Na9CtgRUjTX4qN82wbY2sjSbv9/b+SW+XXqoUpc79TNVN36OTDW++EIrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703117;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lSYxGlKMkILq2NR4SXar7B/zYY/ERjmDJOLLXYuvtu8=;
	b=z/ah/BDdRZOkmMWTNPACARnOzeywks3iKuFQhpavjgYIGHsvjefp8cgHPM1Et3UmTYu7
	 76x3G/v5/rR5LSxxXIaBEMPYvzhtZsrdp3rdhxO565OJikEQw+i5o6hmffJRtYW+1u+fL
	 72+bj24tKUd6dADFv/H3au7GAcZJ9/WHQd8yXxvLl2IEpqc556NeHQllRmPohxy0UID08
	 iZUMyE44+SHaYb9wrAfdimi/HZ0Ky4L8UtSF2nlRjXoHaLSvM5agHpGdL+FNXjAhyC99c
	 Lg37I1XoPZSVGFvKb5MgWxa25Qqj/EiDvzWoLZarKTgNw/8MoVYbPR20pAvHR5nBEBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=WDrYc66A;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664D46074A21;
	Tue,  3 Nov 2026 10:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 664D46074A21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=WDrYc66A
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id B25491FA74;
	Tue,  3 Nov 2026 11:51:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1793703108;
	bh=lSYxGlKMkILq2NR4SXar7B/zYY/ERjmDJOLLXYuvtu8=; h=From:To:Subject;
	b=WDrYc66APuiKiP4SutL3XR/T+oJdoVzh0VX9T/e60G6gKbyv9iiNZeguSD2hcI3PV
	 Bxx0zVj+qRrTglV3oaaBd9+rULGrm+zgd3TNGZw5jRedN1sbI9XPbag5UX5m/RyTy+
	 /T70GYh4dNRSfQUxk9BP3UmMbvB1FGcdAiH1Bg+R0tkPk6LQZ9f4C4FV5SCmhfl68A
	 PJz8mepuwp1vHCX2c7Q1sNuJKI424LZN5gi6q0AsvVxLPEo6ddIgOOGj9r/CZZg5Ki
	 vdJzsPaTZIj5kKfuddMMJXC2Pt7aXwtvh7Zp7DkbQy4fIM9V4lVzViVbzk1orveVJS
	 zJFop8Tv2NEBQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: ti: k3-am69-aquila-clover: Keep DP_PWR always enabled
Date: Tue,  3 Nov 2026 11:51:36 +0100
Message-ID: <20261103105137.2393416-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103105137.2393416-1-francesco@dolcini.it>
References: <20261103105137.2393416-1-francesco@dolcini.it>
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

DP_PWR on the DisplayPort connector powers active DP cables and
adapters, which do not work without it. Keep it always enabled, and mark
it boot-on so that the firmware, e.g. U-Boot, enables it at boot,
whether or not a display driver is available.

Fixes: 9f748a6177e1 ("arm64: dts: ti: am69-aquila: Add Clover")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts b/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
index 3e2377160d82..552a1a792342 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
@@ -28,6 +28,8 @@ reg_3v3_dp: regulator-3v3-dp {
 		/* Aquila GPIO_21_DP (AQUILA B57) */
 		gpio = <&main_gpio0 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
 		regulator-max-microvolt = <3300000>;
 		regulator-min-microvolt = <3300000>;
 		regulator-name = "DP_3V3";
-- 
2.47.3

