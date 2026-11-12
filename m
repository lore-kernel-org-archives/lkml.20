Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496141;
	b=njzw9l1sHNt3gZ+V84MPK3VOp2GBSAfhfPhnKvR7nZ8lHof3W87XZUquS73GPFmf3Csz
	 RuSXCb4vbDh1szq9/+r5Pn0xk0Ab83E8Xg+ykYNLIbUsrumGsJkO4NWdcabk1EGPLj/Vz
	 0Hkh7CBdaG/6oN409FVL4imK1AeE+fwWoxs1sv5E1gTADRxKxyyD4GG77vlVM6SKhp6vR
	 DNNXtuk85ro7lnt18R2DoKL2L05oBqWlEW+lRHJAa6HPhffmWn3ztoein6pgoiUL4E8Sq
	 fkmI7fzaGwCdcpzJhsXTXBOnraIwZhILSDrsM6E0Vjxa1SmLuhVn9eyvBQtn1zhVvmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496141;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WXzyXPsawQzAas62KuytGi1NmXYvupw3UlaDFU2Owg4=;
	b=nyWb4C/Qi7+0iTFwX2sAf8xV3o5eFsyGhNUDULJCIy0wx6PXIokPlnWXwJ4Ren+WhQxx
	 mzB8MLRXzNAx6prbX3MY+gphOJVD6IoBunfItTwWiXpNiqD+rP69hfVGgPz4Q9EYHqFNF
	 2Gm1OkCLXeF6LzMaF2I08QZSfdnj6lBqFL4O5BH6W62OfGf+cJtwgqY7kH8EwkjJi1bzz
	 W34F8SM8zXwvXf+HCilmz/R+Ll5myGoN7L6aWpgPb5ZvRcejFCgOt/I3wLo6fAIjl/mzC
	 zZz7XPcyA8UDF73vpUs3xw5AdVbmkgBcpfIhJ1wHAsNuYcdTilZNaufHZSbsSKDbQeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=e+xOaV2Y;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECCE606A330;
	Thu, 12 Nov 2026 15:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ECCE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=e+xOaV2Y
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 88E6B231B8;
	Thu, 12 Nov 2026 16:08:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794496139;
	bh=WXzyXPsawQzAas62KuytGi1NmXYvupw3UlaDFU2Owg4=; h=From:To:Subject;
	b=e+xOaV2Yn3fSU1ElQlbhub4LN2nOW/WuOUHPn4JLGSCYZKTEEYKOfTzm15DXD/XOo
	 9PvI8pfuxxxTQwJKox6EbKRls2EvYzg6MprHwrEWkVmSbUYrXXGAQNUfk3GAH8atkr
	 aDnMeWHBShRDnL+AUzVWL0P1jGppKoVlYhS1UJDZ8u+d8ovI7POq+6ixOPNwOf6tzk
	 uBayUXetUES9dX3rpa2V1vvgUvo+iaJLKxJgGQzP2hT0QGTvnv1beFqgsKr1E4Sgh9
	 08Inq2yM7v1VR1L6oyb12n+iv7NUISLaZeHA0Inqq39W4o/1bMgIDi6v1WUDHmtX4s
	 BR/zMkMyID+pA==
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
Subject: [PATCH v1 2/4] ARM: dts: imx6qdl-colibri: Add SPI alias
Date: Thu, 12 Nov 2026 16:08:46 +0100
Message-ID: <20261112150849.177133-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150849.177133-1-francesco@dolcini.it>
References: <20261112150849.177133-1-francesco@dolcini.it>
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

The Colibri family pinout defines the SoM interfaces, SPI being the
single SPI bus available to the carrier board, implemented by ecspi4
on Colibri iMX6.

imx6qdl.dtsi numbers ecspi4 as spi3, so the Linux bus number in sysfs
and the spidev name do not match the Colibri interface. Add a spi0
alias in the SoM dtsi and delete the inherited spi3, so ecspi4 is
bus 0 and carries a single alias. This replaces the spi0 alias
imx6qdl.dtsi gives to ecspi1, which is not used on Colibri iMX6.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
index c9e539f83f80..0c5158e6be25 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
@@ -16,6 +16,8 @@ aliases {
 		mmc1 = &usdhc1; /* MMC/SD Slot */
 		/delete-property/ mmc2;
 		/delete-property/ mmc3;
+		spi0 = &ecspi4;
+		/delete-property/ spi3;
 	};
 
 	backlight: backlight {
-- 
2.47.3

