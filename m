Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496410;
	b=MyMs5SMvYtH7QuZF7R8lxP5DRYS5zHQgw+hDpgbNfraCsoPlIzCWLn3EvcXaBKDO2WDy
	 sRzexrtBaPM7nhd6CRSn87lr3hDvLtc5juWUdSY79lp8f8YTri/Pe7t8qVlVxTwKWXlvr
	 Pe5N/iUnNCNhdXck9VcVeQ+dyZAG0F+APmqvUJIgZUFuMFVsr25XmpXgnrKkjJnGNxqzS
	 XgO2CRhyRiYWcW3hs/j9/f9IY/mjxQ6HK/GjeCWdhLazQr0NaqYfR28b0eHwlS2glJuH3
	 waWFfDxr+UkrzLbkEoRI9uPBGuROseXHmpjbRwiK/+/0raPaqnwHhrVcalKm49CkzxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496410;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LSomUVkxeVujxD12mjdTM3jadQF6RoOLSVeuHilCoqA=;
	b=g2w1lIQCu1HKm1ejCuUW82RP6kfc1ICMYTugjtpTq8RN9srtQmQIucjGE7oEVhPcawNg
	 Y1muNbwdTwmThzRy1RYiEF2GC9xXSP1dj/uMigb+dWvlzp7i0RYOvuhvpwLGwMxdkg1k3
	 jlTQ3aikhlLCwLv0s24j4smCQdsaN1F6eOkol4slJEBPs0288aTH3ZdgOynzKcN4nlY4K
	 7ri0A/pGPQkJvRA8JFm19GpNzJndv0y1hPmx6+2OPHedEtAmzKVMgg8n6lNSOeTDfEd4o
	 aSDqcoT5x5Yh3tANJoJ/Dobn9kr1oTXMO03eim+tCYEKfe+MVN4OtPCZ9Xx1QSHbPbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=YTxFkgxX;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8E1606A33B;
	Thu, 12 Nov 2026 15:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C8E1606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=YTxFkgxX
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 8B1A0231B8;
	Thu, 12 Nov 2026 16:13:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794496407;
	bh=LSomUVkxeVujxD12mjdTM3jadQF6RoOLSVeuHilCoqA=; h=From:To:Subject;
	b=YTxFkgxXLJYTzVmoaE3Y8ZdRNwhcE+0bnXUhxmE7ugGEgr9NNCZU08aMVJYKWVPTI
	 EpcdEnyz92CyFjNORUosjzxmQ2LnHSEjdp8zPlgFHgmAiGY0or5hU8qHN/rhwNK8Q7
	 YDQu00wRhrJN1CEZo9oeTjhkSWsMl9AGqrXgw5tm3B+o/t8umK2PSw9VadTS6WmJbN
	 8aOCdagxv58zBVvlKYPR0bdEc9k+W3WNldWF/b6yIaPO5IFir9TRnorSbcCinXr1ey
	 iBSryktVJl1m0flXfq+KqrWa7Jbk/RozOBjaxZSer0a7jkHVqo0VByVMTFXtFum9fs
	 4RyNgREX6brxw==
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
Subject: [PATCH v1 3/3] arm64: dts: ti: k3-am69-aquila: Add SPI aliases
Date: Thu, 12 Nov 2026 16:13:16 +0100
Message-ID: <20261112151317.178959-4-francesco@dolcini.it>
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

The Aquila family pinout defines the SoM interfaces and their
numbering, SPI_1 and SPI_2 being the SPI buses on the connector,
implemented by main_spi2 and main_spi0 on Aquila AM69.

Without aliases the Linux SPI bus numbers are assigned dynamically and
do not match the connector names. Add spi0 and spi1 aliases so the bus
numbers in sysfs and the spidev names follow the Aquila interface
numbering, zero-based with SPI_1 being spi0. mcu_spi0 is internal to
the SoM with the TPM as its only device, and gets no alias.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
index b6854acee8fe..caedff90365d 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
@@ -39,6 +39,8 @@ aliases {
 		serial1 = &wkup_uart0;
 		serial2 = &main_uart8;
 		serial3 = &mcu_uart0;
+		spi0 = &main_spi2;
+		spi1 = &main_spi0;
 		usb0 = &usb0;
 	};
 
-- 
2.47.3

