Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=144.76.98.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792800005;
	b=SU5GSMWmbWsSJDCjDZxYK/JUU2QcqKTej7P8bV5AUOfwi32OKbXrNA4c3bCE1jf8jE6b
	 znIb4BIEJacgLSOiaHb3Sip1LOr3RQDrGIBI8gg/WijIumjM9zmEBiV+N8DNjH+fX8VM5
	 YJTZRRN+KRA8/8URGWx4SesubASRoygOBLDKDTs1yhN7Zd61JfYqduVXAJMs/UxBog4or
	 aPD6q7IY3qXW9gtNBmNZ1Uwgc58gdAaYKlmaaNsDJugZGnzBDmTdqOYOMBKZlJZAV8c9q
	 kyk1HRG0Vfvd2GOXAG8e2dZg0527Xwp1lkZJMdTI3nZCyI2eQYAF0LAo6wx8kVgPpRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792800005;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RVoXlCSb6jIMaGtRjcozIyYGAhMCZqne31Hnbkv4d2I=;
	b=t3QbjK7yQSfebetokd8R/I5FmA6XnNoQfFXsMqTdmu5k8Ac2qHSpa6ZTeGxxoML3Q839
	 l+1YvyjN+Z4Jbu0sBgRmgYUIK3BqKAvyWocFm9sLSbJsxuDdznuqR1kH0urX5J4roP/vh
	 qwpAq0tsu86oVRZKXW6Pb5U/IqNNpsjdIkgnr6u2LbwF4+eaywuNt468OfYvGn4YUOIhb
	 ikcgPa64irYsOqHY4a2Qu5i+qpX0I8vfAdXtLudigx0OOOCeplWSjB9ST9g8DXXu1V5Dv
	 qsTZxb72/pSI+6fQmK5J+n4YPPa6nrp68r7DlGRIqL99xus+CEf44qEDqcnkzMJxeyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rojer.me;
	spf=pass smtp.mailfrom=rojer.me;
	dkim=pass header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=j0bVKA1e;
	arc=none smtp.remote-ip=144.76.98.110
Received: from mail1.rojer.cloud (mail1.rojer.cloud [144.76.98.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED5B606A31F;
	Sat, 24 Oct 2026 00:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DED5B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rojer.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rojer.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=j0bVKA1e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rojer.me; s=main;
	t=1792800001; bh=qvU369dgJvWvyI9h764kYcAsK2/h8+Rf6mBdDUM83RU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j0bVKA1em2H2nHaOheBGsJ77Q7+5+oW6aioIXy1KOwEcUyGeiJehGAvbJX8GUdW1e
	 cl8RKykMcsQrYvTKTSqAZMaK98Tx+qtBjiYhGjULLO4ToEjPV/r0kYL3+vZokTDk/0
	 QFTU2crl7GDNR/LB62sYUolkYsEY8LqjI39TK0N2lEQB1uvmDoGL12Ajci2nQri20y
	 pr4DXKLRlJluTRQ/dTE0GG1geUaK602Y9WfwyRAWH2RwGPXXnaYQ4FsEh6r4UJ48dt
	 b4EtJ4dX6mNUsokpfqfz2LdbmOt87x4NkAVW/dPOJdf4MHHoOBd9F93xuGLGWigPLx
	 9Z44rmqI/wWyQ==
Received: from nbf.lan (212-5-142-134.ip.btc-net.bg [212.5.142.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail1.rojer.cloud (Postfix) with ESMTPSA id 7B9BE1271E1;
	Sat, 24 Oct 2026 00:00:01 +0000 (UTC)
From: Deomid rojer Ryabkov <rojer@rojer.me>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sergey Bostandzhyan <jin@mediatomb.cc>,
	Jensen Huang <jensenhuang@friendlyarm.com>,
	Deomid rojer Ryabkov <rojer@rojer.me>
Subject: [PATCH 1/2] arm64: dts: rockchip: Fix VCCIO4/VCCIO6 supplies on NanoPi R2S Plus
Date: Sat, 24 Oct 2026 02:59:58 +0300
Message-ID: <20261023235959.2988087-2-rojer@rojer.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023235959.2988087-1-rojer@rojer.me>
References: <20261023235959.2988087-1-rojer@rojer.me>
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

The NanoPi R2S Plus inherits its io-domain supplies from the NanoPi R2S,
but the two boards are wired differently. From sheet 6 of the schematics:

NanoPi R2S (NanoPi-R2S-V1.1-2009-Schematic.pdf):
  VCCIO4 (U12) = VDD_PHY_IO
  VCCIO6 (H6)  = VCC_IO_33

NanoPi R2S Plus (NanoPi_R2S_Plus_2309_SCH.PDF):
  VCCIO4 (U12) = VCC_IO_33
  VCCIO6 (H6)  = VCC_18

rk3328-nanopi-r2.dtsi describes the R2S. On the R2S Plus this leaves the
VCCIO4 domain configured for 1.8V while supplied with 3.3V, and the
VCCIO6 domain, which carries the M.2 E-key SDIO signals, configured for
3.3V while supplied with 1.8V; the latter prevents the optional RTL8822CS
Wi-Fi module from initialising at all.

Describe the actual supplies. The vendor's own kernel uses the same
values [1], although there they come from a .dtsi shared by the whole
NanoPi R2 family, so the schematics above are the reference. Tested on
an R2S Plus: Ethernet still links at 1Gbps and the SDIO Wi-Fi module
enumerates.

[1] https://github.com/friendlyarm/kernel-rockchip/blob/9238df9d21e835bba35c8ba5248784387936cb2e/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2-common.dtsi#L425-L435
Fixes: b8c028782922 ("arm64: dts: rockchip: Add DTS for FriendlyARM NanoPi R2S Plus")
Signed-off-by: Deomid rojer Ryabkov <rojer@rojer.me>
---
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
index 4eff0503928..6ba4a74cb1f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
@@ -29,3 +29,8 @@ &emmc {
 	pinctrl-0 = <&emmc_clk &emmc_cmd &emmc_bus8>;
 	status = "okay";
 };
+
+&io_domains {
+	vccio4-supply = <&vcc_io_33>;
+	vccio6-supply = <&vcc_18>;
+};
-- 
2.53.0

