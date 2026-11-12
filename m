Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496409;
	b=oF8gx4mVZVMBMFBTmJHELEFDbxUtc1BaIKyDVhaHYnuC7zx2lZX371s7oXadqgvvirJI
	 EHtde8kiRuxkADEQIpOYGObUQfgfcPjFvxlib1anlJxbNANQyh9Av6mB4vvbraT/O8vUH
	 6DLLtKGVNkl3VkBPU/tc3ngZBXe2Y6CblJKB8DA4DUajA+AgpDc0HUHbCfy9DecGwUTkd
	 ieohqX4cHu9NmR7mrp1SYiWzUtEACQv+HuuKw2lc2EFw1R9SlRVq5m8vWS15JoPr/SZCf
	 d9YBBclt06PV/CAoTE7p61lOQVLiBU2k8MnOmcaas+rkIWOy02gwk0iNmFlw4EmohjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496409;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f8+dSseHhoPX/bP+2/X6S0+i8I13j41/PXk/j7+n3GQ=;
	b=xFMvkG6Ikd9bRvWnDZ4eXQdIONk0q+Sl1conwSGqo8Rb0VVu4bXlr+XvgKdwFHlsqsmI
	 sPCVT4HshkODdiCjk1tmMsnUqSEWXI2vXoH4spQphuABMaBwOalTx3Pmpt0zmd5bNaVBO
	 S0aFjob5+Fm6n+lWRHLmxTfDUhHDvdxCFH9ivTqH4SaGZNJMkfMwekFm/KjOHjxaz9ypk
	 AM/Nx/2mmbu6dbewxWhgHKZX+uf9t7zGcXBAgglYceoItFrdCeX07PZhN/ZvDntscI67y
	 +s+s/P0dSQ9ZNlymWSgvkbDAo0G/hPBQx+/IX4MmN0+oTORigWWSE0w0UBFu6gyzd5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=QQRL9BXP;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF22606A32E;
	Thu, 12 Nov 2026 15:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AF22606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=QQRL9BXP
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 0C54723187;
	Thu, 12 Nov 2026 16:13:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794496407;
	bh=f8+dSseHhoPX/bP+2/X6S0+i8I13j41/PXk/j7+n3GQ=; h=From:To:Subject;
	b=QQRL9BXPjC8dEVEybWiGwkGTYVXqGhK+2S/9e59Ikq/3iWRDX5PE1DL6t520tyGY0
	 s59qOgwiIGE6N/NKM4YBlIdtTg15GiYqFXz/Ivzz5VM/XpBHaa6bH3lGwmO2J6X8t7
	 zhiGehjMLyjbyXF6ueyXFTNAeI/8nUpQUJTAQYvAZcWVt9ds9ay8YRHSmSENFKaNYv
	 toaGym/vOemtablrQ/dy27gsmE4V1jOW6jpOExYJQIkYOMFIVSVbAXGsmex6s40lcI
	 Jk3OwqOZ8ZDRmzBdwFi00loDfn/MrLqTUH/a3x/uLWgiLcBfd45TTRVintCbfvMu01
	 rlmvJGBzpmJyg==
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
Subject: [PATCH v1 2/3] arm64: dts: ti: k3-am62p-verdin: Add SPI alias
Date: Thu, 12 Nov 2026 16:13:15 +0100
Message-ID: <20261112151317.178959-3-francesco@dolcini.it>
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
by main_spi1 on Verdin AM62P.

Without an alias the Linux SPI bus number is assigned dynamically and
depends on probe order against main_spi0. Add a spi0 alias so the bus
number in sysfs and the spidev name follow the Verdin interface
numbering, zero-based with SPI_1 being spi0. main_spi0 is a
module-specific SPI on reserved SODIMM pins with the TPM as its only
device. It is not part of the Verdin pinout and gets no alias.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 62a518dbbdbe..ebf16ef121e4 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -35,6 +35,7 @@ aliases {
 		serial2 = &main_uart0;
 		serial3 = &mcu_uart0;
 		serial4 = &main_uart6;
+		spi0 = &main_spi1;
 		usb0 = &usb0;
 		usb1 = &usb1;
 	};
-- 
2.47.3

