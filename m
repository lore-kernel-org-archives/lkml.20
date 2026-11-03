Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703215;
	b=wtEOFZZHq2y8uDyrP/ZCAyOkTEPGALV5ky7G6j1Wli6RwISgpu79uUtjYgS4Iw/2k6VP
	 VcsuJEzfPdrAwjC00ZrunAyhtQZWF1yyQ8F8NyHOdKfddmFDjQKCUAPdlU+eaDzxlCGyk
	 yjrqP+vFMGOcnGXdjN2Ngytd/um9rT/JHwdcXNQiKaEearrQXCgNXkEXZLKrgjAbABmM7
	 Ur0UbK2tqh3qiCbbgpfZa3bFoGzpI1/DdVz9dsk7erixKb9mvcb7etAlAv1wA4NmKYzko
	 H9DBcVpoVBU7kc9ROMmS9ubffTDBAFS/Wd2ImcEp5oNjk/nCHyGKHxSxLfypj5CMAJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703215;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GCIbW4AET6O9pHrHj88pZoYl+AaYbhYxFMRR7dhKfCA=;
	b=pfVYXQVD/+bAGnQtUV5HATsV7j2g9o2ue+Zebh6HAidTNjKtu2qtScDsn6bZb7KFkkT1
	 xPFGq7qxpBa+C9Raw2LuAcM72Xi4adQPwRHAlki7spqT2e+I8uga0eeOoLtJD7QQV9OVc
	 8iHMIObAyvFBq9QHdqv55/iDRGhxDbU03HVqEWvnY3ETpvwp49YOWClJpx1gU/HmcFAd/
	 pkpFoXjhy63PKRoX8nH1OcWAHK6czd3w1O0H5uEQRrmR6fhyy3ph83mvzNSSP3TYlOTPJ
	 7oMMDoWxkkWiqsWNPY9oaLx/WuMVZcW/o04ukodCig3G+w5Q9Zb4XSuR2fD99evjlSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=TnJyo6wH;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1501606BFB9;
	Tue,  3 Nov 2026 10:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1501606BFB9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=TnJyo6wH
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id EDAB31FAA9;
	Tue,  3 Nov 2026 11:53:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1793703212;
	bh=GCIbW4AET6O9pHrHj88pZoYl+AaYbhYxFMRR7dhKfCA=; h=From:To:Subject;
	b=TnJyo6wHB+76RU5WT4Gr7kcG1+PoR2E9GbCb2YV9yvq3IXpZPmkII2NmckgIMqP4z
	 h2qU2Z2SGJcYyPLR6If69zyf5yrt6VTzZbQ7WQIzwy6rJdXTQ46YDuqKQiBdubEg7/
	 /c4oia7XCFLK9wasbrRe37PRNCeAPn2+pzirg0Ix22NrHuxgE6zKsm0J/oVP6E/a14
	 sWnGHSSB+hZPPw1BDvv5NYjNp12c4xjVZNlQvFovU7emhcoeDM8dMuQg+8owilYyhB
	 E83BqO9ov3zPk6GWGjifjzpn6CZwfrJ0OC1/TPADcp2N0OyyfWJlHAU6IgH5BL7Xth
	 D0ZqzG3bzrb8w==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: dts: freescale: imx95-aquila-dev: Keep DP_PWR always enabled
Date: Tue,  3 Nov 2026 11:53:15 +0100
Message-ID: <20261103105323.2394012-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103105323.2394012-1-francesco@dolcini.it>
References: <20261103105323.2394012-1-francesco@dolcini.it>
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

Fixes: d5c082ba23db ("arm64: dts: freescale: add Aquila iMX95 support")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
index 7698ef44095c..cfe90831447a 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
@@ -48,6 +48,8 @@ reg_dp_3p3v: regulator-dp-3p3v {
 		/* Aquila GPIO_21_DP */
 		gpios = <&gpio3 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
 		regulator-max-microvolt = <3300000>;
 		regulator-min-microvolt = <3300000>;
 		regulator-name = "DP_3V3";
-- 
2.47.3

