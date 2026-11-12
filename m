Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495767;
	b=GaDkKL3LSYbiK1Buo0isF6vqh+ogxDqlVjOTa6T7BevKg1T896ztE/SazZGVJEcvhcTO
	 rirkkcMPF6LrFdZ3KbUxIBme1sfArHuzSFGK1GkYOJ27GPD4QkXJCOZKQBPxZObxVsdsQ
	 kt57pGiIQDJvtLWWqXTm2npb49+6mLMuih0tPC/nP9zAvv0v/5G0iaXWKRLED8st+8v1L
	 Ba0GxXgo+w4rK+TSRjL+qiqQROEJwzt3uWFB8/R0t+MPYgxze9AoHaeDvQsS/KY4bycZf
	 6KHlOvTbkB93w0pH48kjmwcjo8WD52NTIty5RTkZiEI5En5avq0dEgaZ4J46bUlW6QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495767;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KXzbwVgeJe386h0gFNBUQkQpzvuQHCSy5uyOrGQ03aI=;
	b=MUI2LN+D0U84ZehZGQukXdXLJh85Y1PitL+dsRmGTEO5muwCPKJvWaciLIajll62dPuv
	 zPeBfUNv6fSe8X99Elygk4RkPtQeGW3s+K1OlpSJ1yabw8G4eg+Qy+kpZbIyEtNDLIaJK
	 UYRNNkMSKER9xwqOdF+4se/Z4ZQQNgA09H3BGDO5Fb2NtrdotiTILgwCoxEM1XrSymrEv
	 5eNH3IuLDE2ixe8+iHxv0lezJSeCl0RqW+Rjivg0eop1TZ/PZ97gAbvEvxZF6ycragxhy
	 siMFUFd2GtSSwn8TTE+iqk199cqeRgrV7riU3MxV+4/fIKOydzJhH/Do/sBM0Y+6OHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=Xa5vaz5o;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA30C606A32D;
	Thu, 12 Nov 2026 15:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA30C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=Xa5vaz5o
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id BF86623187;
	Thu, 12 Nov 2026 16:02:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495764;
	bh=KXzbwVgeJe386h0gFNBUQkQpzvuQHCSy5uyOrGQ03aI=; h=From:To:Subject;
	b=Xa5vaz5o4BnRfPenmT3vg+cJX1NLnQzUelZqiGXuzAa0mDOhpl486CO/jn5ACJm36
	 ckh9Xwu2wkXfb4rXNhUAuFxvUoCjMbPANjJE9BzMw9ow64BJ2TVf/F2e8EUvnDdU4d
	 G0csLUWbTECM6asdYReLoBnFCj3jZyh7Iy75xEvmtbEav/8R6x3AoXZGO5mr5FkMaV
	 j/1s7itwLghR9+AbDi30yIHzY7Qyo20MQOPuHDpEs4lgQCArKZmuX5HE1S7x5U7a5f
	 djNNBwwC9UtaNtDDsQ/nN1E1XQu2hvlOBx9He1fLkSmxwxr+uM+DzoNmhRBrHGXjOR
	 3FG/ozHiBUHAQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 02/11] arm64: dts: freescale: imx8mp-verdin: Add SPI alias
Date: Thu, 12 Nov 2026 16:02:24 +0100
Message-ID: <20261112150236.164850-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150236.164850-1-francesco@dolcini.it>
References: <20261112150236.164850-1-francesco@dolcini.it>
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

The Verdin family pinout defines the SoM interfaces and their
numbering, SPI_1 being the SPI bus available to the carrier board,
implemented by ecspi1 on Verdin iMX8MP.

Without an alias the Linux SPI bus number is assigned dynamically and
can change with the carrier board or probe order. Add a spi0 alias so
the bus number in sysfs and the spidev name follow the Verdin interface
numbering, zero-based with SPI_1 being spi0. This replaces the spi0
alias imx8mp.dtsi gives to flexspi, Verdin QSPI_1, which gets a
dynamic bus number instead.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index 6887d5555d30..ae8aba856240 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -18,6 +18,7 @@ aliases {
 		ethernet1 = &fec;
 		rtc0 = &rtc_i2c;
 		rtc1 = &snvs_rtc;
+		spi0 = &ecspi1;
 	};
 
 	backlight: backlight {
-- 
2.47.3

