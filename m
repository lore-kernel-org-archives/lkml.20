Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496142;
	b=l/U8r5p4nTro87hBoMmy1OIBBfnNPzSUUsiqHMSvZXf1bBd8q/jsyNG7K5rBsKc2C9WX
	 gAio2uzdxXvWkJJ+p91VR8r1m5Bk7Jr/uVIloObwtVqP9a1X6KyIadb7nzYi/Ul8Gp10u
	 U6kK+aBheIz+pkMFwhyhN2Bh0aBeKCSTEJLOcd5m7x3p1UCGga+gcp0IeLVgmdS9eezAs
	 Bz7Iw9dqoWLiUEKKoqAnnL3ILM66AcvWsN9FvyBD1Lygvxnn5Uo/Ko1L4hYKrZZeK16Po
	 uSnc1vw81HRJx6iEf4MI1h/kQp+eGOHaJkz9E+MXUEPSZvEe/ShSvveBINyj7sKTVCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496142;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r1ul4jZ7Bbm65R+bezx2ySnoUE7BxylsA+WdAUXidRw=;
	b=Lxw+l0y3MoN6OgCgBKh2oQde1ilzgeZKd9lDiMf3ikqjfTedv8zZdNqk0B+Xj/3TeU28
	 qkA/DjjSdWJOdrxaUSTR81p/g6GuOIlSqmKmdbYOnhzE+GgovclJivy0b/iaCUOKxMElw
	 LZaovuPCswHEjT3BVJV+m4GneEfksZK23DggXgARwED1loSAsy7zQCEkYfDceneEKSrkr
	 tzWZHOPSQUWQXkpEzwjsEJkCY0AvenfoBQPyAc+Wbk2eIjNuFHN2/hTj6llUzL+z4qNfN
	 nO6zSkR7/9tkw8syhVb6fRQIY+dMtI05BCFQLCXPQ2ZGzwbVPE4J4pQNwUl7DoE9N5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=ABNK9CUs;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE376606A885;
	Thu, 12 Nov 2026 15:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE376606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=ABNK9CUs
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id C3236231CF;
	Thu, 12 Nov 2026 16:08:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794496140;
	bh=r1ul4jZ7Bbm65R+bezx2ySnoUE7BxylsA+WdAUXidRw=; h=From:To:Subject;
	b=ABNK9CUs6TSHXA3A+bjNHHCmtmZOgheZnqdFSPSlkCZmRBOL0li2ZoOytuFLlkECK
	 JbcVOHYwasj4/2UxPvkkMuvioGCdUKu7rO4eE6fP6ZTun6v4/z6Fpqr/pllAyjqG8n
	 oCyeMMnL8KmECw5OjMZwc9EDv1wqRb44OtYk7XO79Gc+ukk9a2991aTAgursdPITYj
	 XUiFkM3IuXUWZMST1AE6DpqkD5R6fpBn+W7Xznk5yGKnRVSyk/YN15nIEpr8nUBz7e
	 k3U39tz0tOJ5Rfp5JgNpgD0KI8MQNgESqGm1jc/4Z655AbSelo9L6eW9aEI5MqI4vH
	 h0nMSnXsxIShQ==
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
Subject: [PATCH v1 4/4] ARM: dts: imx7-colibri: Add SPI alias
Date: Thu, 12 Nov 2026 16:08:48 +0100
Message-ID: <20261112150849.177133-5-francesco@dolcini.it>
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
single SPI bus available to the carrier board, implemented by ecspi3
on Colibri iMX7.

imx7s.dtsi numbers ecspi3 as spi2, so the Linux bus number in sysfs
and the spidev name do not match the Colibri interface. Add a spi0
alias in the SoM dtsi and delete the inherited spi2, so ecspi3 is
bus 0 and carries a single alias. This replaces the spi0 alias
imx7s.dtsi gives to ecspi1, which is not used on Colibri iMX7.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
index c4088d3c5ab1..bd66745312a0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
@@ -9,6 +9,8 @@ / {
 	aliases {
 		rtc0 = &rtc;
 		rtc1 = &snvs_rtc;
+		spi0 = &ecspi3;
+		/delete-property/ spi2;
 	};
 
 	backlight: backlight {
-- 
2.47.3

