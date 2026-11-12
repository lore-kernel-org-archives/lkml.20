Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496409;
	b=iatLqZnprkyBcmzV37D5x/APuTTM3P9QQXc0yiw8mBtd4N+XAxa2tDv7ghbudvRjXORc
	 qfaBxE5y0br79liyo35rNvOGBpQHUL4B8KEGfIU2yfN/3FiFI14NcnoYa3CMCdTF2zIQ1
	 5RGirqsipRNzZQp1q9tscst+mc47xRTiSXJfrhWivjD18+PaMnE2EwSn4HXTbIWPvVaMA
	 mdKfRBRLwru9jtZqpGNRkj9pfYARK1HCZ/38Z/GVT2IHVdgI0xzQqhjFJIoc5gYJxcCtj
	 p/MNUuYaXrsFzTdhtmJY50H9N8mu1PBuSJjCqxjooNS/slSg9D8EanqS9V4guSUoPjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496409;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jlU5/5neDI2ROEOJFaNZJZxxYu3+Y8IWX3cY6QrT4RA=;
	b=0v5VHNLYN1w1IY6IMSUYzo1ds3gk+4Q5ujoKErhrFL0CRqL0uSvthJS70zEqhEWy5aqV
	 tUgZDnAP3zTy9JUPWbVQDu1ZyGYPRku6HyGrzmxAq9Th0/ByYZBtL5wvXf42SmFGgz41F
	 qamNxrs6N2xJwUacXLPpFTu/ZEKJEt+SyDnsqpMNkxm9+ezhw+uJN7V46kbIGxtllAywe
	 MQaRcA+62yxVAeqDbsaj3F6DNWwF86s9Tz1O3cjH3uvRw3GnS7gbmIBbmBUQJpn9sRlpt
	 EVZXkYZausIusQ1gDmJkqByH4nH8s3m9vrrUv0buKo6gebAocWZMUY/5tb0bnteXs3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=CCvRtxCk;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDA9606A321;
	Thu, 12 Nov 2026 15:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BDA9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=CCvRtxCk
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 86A9C23185;
	Thu, 12 Nov 2026 16:13:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794496406;
	bh=jlU5/5neDI2ROEOJFaNZJZxxYu3+Y8IWX3cY6QrT4RA=; h=From:To:Subject;
	b=CCvRtxCkOc1xkVU7VUIor9yaHtzWfy7wLAVj6+MoX8YQecmN2jWkLnsjggK3UfHl9
	 wscTdB4n+nnU6auHE1nNv2zqUoIlklACGUOJiPcuaiGAj5om43niH7gGCMjJJ2CCAS
	 GOc8M3nEn35NH7LNkxqHoplvYmHOFrobaVBzkoNtDVtWDoibHSiBJFsttMFazd4DXN
	 Ka7+rN+L47x8oksFv0vfCNrjjpSj6OaTowQKrRBTc1BFEZzOvdZYbhQYkqcrugDKrb
	 GYso2hwEzthcHNNNroAr5x9Q1hvKvhWpg3SNLL7KJwI2Ew0mDDf5rDqCAAdlrg3fbs
	 pIx+LwJvVjgVg==
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
Subject: [PATCH v1 1/3] arm64: dts: ti: k3-am62-verdin: Add SPI alias
Date: Thu, 12 Nov 2026 16:13:14 +0100
Message-ID: <20261112151317.178959-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112151317.178959-1-francesco@dolcini.it>
References: <20261112151317.178959-1-francesco@dolcini.it>
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
numbering, SPI_1 being the SPI bus on the SODIMM connector, implemented
by main_spi1 on Verdin AM62.

Without an alias the Linux SPI bus number is assigned dynamically and
can change with the carrier board or probe order. Add a spi0 alias so
the bus number in sysfs and the spidev name follow the Verdin interface
numbering, zero-based with SPI_1 being spi0.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
index 77e6885555fb..3317da6c8457 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
@@ -38,6 +38,7 @@ aliases {
 		serial2 = &main_uart0;
 		serial3 = &mcu_uart0;
 		serial4 = &main_uart5;
+		spi0 = &main_spi1;
 		usb0 = &usb0;
 		usb1 = &usb1;
 	};
-- 
2.47.3

