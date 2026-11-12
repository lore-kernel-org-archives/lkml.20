Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496141;
	b=HmJp6SgPNJpQ5I2OnTY01qOVSsh5BNUsHL252GYTe+ByQBDvQjFPoeSNpj76oPQATtuR
	 os59d3yOnGSMBx/UivlVfoVKRf/0MA2r/6rwX9gEmR+Raolu9tcaZZBSY5ocgRuEUK2mB
	 Iu1meqN6MwECPFPBFmc6TGKJCc6fo0rwmK+P2ZGPHYQAgr/BcFpbWGQbnHy4/J15rE/NG
	 Ln+98kJeVMA/s9IOrrg8sHkYh7vjsYYt4Ra7+eO0SrgJ9z+I6awLHtIE9uM47p2i88lK/
	 UqM4I4nvA7btuvHnEz6cOB1HhMPIMuk4dNSmdlbtZ8Uf8ltZU8RUSerhLe+m1a+mlOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496141;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i4f7s/gJ5Ffrl4sG1/yeEUc9OuyhJicCd4di9iHIx/s=;
	b=xP971WmXRT9Y0CV9ZAjAZiRNvIWGGS0JiZimi876ept2XQ7b/6Zc2lR6tvmOAjcvpEpx
	 pW0U0inq475bbIcqaGHG/4oTJtn1nkMYUobJiGLID2OdLluR/RpSpXnvEzeeHEArJb1H1
	 llF5M+LHewpc/K8L8gyKZZhhS+Aqb6JHMnHK8Gel1v6kIunGMeqHoSwjmW+qqBl5wwqCz
	 nRKwqY3Zfbwr66f8MTKNvZOIKfKmsCNa7zByOY/CBa1YXyne9QyFYfSLDnEq04xEVUfG9
	 XVVFCKRGWzWPp2tkelCpQ8vSNCC8hvjMMZz3YeYnLwtbW025ComSeEbcOfcVC1kCx7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b="uZ8m/1C8";
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C72C606A327;
	Thu, 12 Nov 2026 15:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C72C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=uZ8m/1C8
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id E8E0A23187;
	Thu, 12 Nov 2026 16:08:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794496138;
	bh=i4f7s/gJ5Ffrl4sG1/yeEUc9OuyhJicCd4di9iHIx/s=; h=From:To:Subject;
	b=uZ8m/1C8yhezyDDHS+q1HhAKbsnFpNfRs7rEnHmN7B+SPTFNFziMxArOX9EVoPR+X
	 aC/qLdLzXcXVVgG6pg9gLtsH0GMLl3fqV8xr0agQ50eOOmx7fahECPLV3Lb931zQ9r
	 /nAzRitE/Q1LUxhL9us2PEl35kG9IOgQDur4Jcfv3+VpxcQsvPp3JkQwSOJm4uhFhg
	 HjukOn7zGrCKI1QAmJQrc/C/02UBMeP9q6jVu0NCRI6x2onI4+DgEorDLYT8VXFu8D
	 Lrlg7bFj9WUjh60OfB5YYkEZ2QV/MJCExRp6km4aWi0OCfhs1hmZ8Ggo2LBvNrZAYd
	 4QQ5WJGdhzJmg==
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
Subject: [PATCH v1 1/4] ARM: dts: imx6qdl-apalis: Add SPI aliases
Date: Thu, 12 Nov 2026 16:08:45 +0100
Message-ID: <20261112150849.177133-2-francesco@dolcini.it>
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

The Apalis family pinout defines the SoM interfaces and their
numbering, SPI1 and SPI2 being the SPI buses available to the carrier
board, implemented by ecspi1 and ecspi2 on Apalis iMX6.

imx6qdl.dtsi already numbers them spi0 and spi1, matching the Apalis
numbering. Add the aliases to the SoM dtsi anyway so the mapping from
the Apalis interfaces to the Linux bus numbers in sysfs and the spidev
names is explicit at the SoM level, zero-based with SPI1 being spi0,
and does not depend on the SoC defaults.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index af038ac47226..e880cf876da4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -16,6 +16,8 @@ aliases {
 		mmc1 = &usdhc1; /* MMC1 slot */
 		mmc2 = &usdhc2; /* SD1 slot */
 		/delete-property/ mmc3;
+		spi0 = &ecspi1;
+		spi1 = &ecspi2;
 	};
 
 	/* Will be filled by the bootloader */
-- 
2.47.3

