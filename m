Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760487;
	b=U8uuifPO0ks26x3fjCt24O0pabp2QszPJ/c7IX05LnDJFth2qMHSX1H+LSDvJ3j3Dp6t
	 i22Y9R768gYnRyjoEoW3nKOhfXOvDdMCLdRyogmi/rnQikDDbGYras8mLWEyE/pnxhSo3
	 NGyjbDu2ccU2ydOr9QmY9GADQhAqBg7jpt3Y/OX/xGbS+gTFN9WjWRwBl2pEiMXGBQ+Wa
	 9BUHVrNqYkGgNVt3UW1U4pLLdhR/Y+eTxZiNeojfnCQsYaKI7Juu+GcNSyN4nv+8m7Gv6
	 41xdMCC3tCUr3TU95qyqxQKH+tC790z+lJFjFEvvU1iMCW+NxtRYJvjP5ozN7FaJv7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3RllXL5eEjI8zgnLPn1T6vdPy/s5DlXXha36u6N6604=;
	b=GHVqendI3cdEaTuP/a0biCcDt7EELx4QxXhCS+Rgz0fmSpFMSE9Qdczsa7i2QXwzzvP4
	 d6gdej/mc1TGR/XLZieWbC1srqNTrt5MXGjB4G1nLIFzSlB/JVGUOKiPsbZ8+3TDcBMVn
	 awV066USzZv/gMi92s9DcRrKMIafX3dGgPq6rzas/+fGQbJK2Zrh/KmlaoZyC2wI80Lwd
	 Bwoh5DeVoxQZYQjKLPeupNArXQSRN4yxSP0hasnDjFcgdOlHHE4BhhBiiNkOuYVXIXs1k
	 HhawoKnuYdLagzhOLmJIhfK3vc5V4GFdSVuR7rfeRvgT0JT0EJgtXHVT7/BrvNzNnpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=lMwEertE;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC243606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC243606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=lMwEertE
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1314477f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794760485; x=1795365285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3RllXL5eEjI8zgnLPn1T6vdPy/s5DlXXha36u6N6604=;
        b=lMwEertExcUBkuV7o2/MIXIbhOSF66gyDZwnNNtInfoh6wp701xYBZswepCIeKU3ku
         lYz2KD1p4n6HdUS36u/I4nqerfHRfT4WPpRcT8xK+HSZ/dC2VVGiijT0+6Bv15CTMpQ/
         1wDPF9k+E1LaxrFpbpI4OD0/rYqogxQ7oVQ0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760485; x=1795365285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3RllXL5eEjI8zgnLPn1T6vdPy/s5DlXXha36u6N6604=;
        b=g5HhXT+aZK7cCWTVMH/nsfgYJ3kiV8WW0U10ZoYz+V9U8U7m2kX2YNKKt2pkBFIZVX
         l3fVKh6p4sg17KFGcj5AUsdl390VBtM4SLBcK4DySEgJjIzTwhZoCdZ3w1hGjKsUOsSD
         0BsVP4P683wR4ohuXC9TIhrdZokttUTSlREmTJD1fOGi5zqKYYZjk1FhN60hz/MzMMM8
         qeloHZJ2jNQRxsT/Q6VkUJwnyugs26ibpB8OrcSCy/8hQZee6fGEeygI21tV0vLRgcuS
         jeZjbdq0SclSMz5lZ1mUUKmBQ2fT2RgchIaz7UNXW/ZssRLCkvpohe85aCWtMhl0dTvI
         zuoA==
X-Gm-Message-State: APuU4Z+g7AVxm2P9TLss63W8cj7VWKlzbY2eSlEyiJX+6HGskRkp1S1W
	lIPov/lG9IyU8CHt5r3fG/mtaNQzIYM5yzofwo7ya9IDZH3y/zckkaTnt+4VkFrbcfeQE/cNoVl
	7cOoK
X-Gm-Gg: AYBFou2cSyOPynv8XXrGrvQLNrrwVIUhFCCDB3iXjdqMMvWWWGLDqhbsj1CRi+wmTAK
	BGLb0qtUR6yZwIWYc8+ME5ZteP1GZ7mv2hLLQzivirTT0NcTT+2ru80ypFT4M5Q4pAv120Ack/H
	p89Swd34KIZq/SaogtjGdEFubWyehdJiM77C2UKVnY0yykuE8jEV7GhRBIckpx9cBBABvCOFcCh
	wpqIXO5A8X4ler5zlFxnvR8hEfbMwDxGzpFCXzgcV4xVzsnjOqUsStyjR/UndXFfXclv0jgvt9z
	s3gHM+njFr1OlP1gF1T4xfK2LIdD2Do3wsWDaHY/ZgyJ2l1EhWzNweridw6l+3Bw8LUs/AdeUDe
	CRYym8oUxLH8EL0DG4VdIFxwr6yAsMqO4YEi29/+G8+ac1wJDzLhd9di71pAzvCRTLZWUoPV7Cu
	FyhgDKJhD18uiR7T7LAl1xcalnih6mW2kRH/PZCBkh1jB/ZyMQL4fivlVu80bEMx6Lck6OzVJig
	0WX3uwXZQ1HQqrwzAlOH9i7RumBfi+1csV7Ty1t2vtPi91D0H6/Nx3L73fS1VR1BQ/Yr1+pCMuv
	eBBhyBJWcSTSMI1cZQv6lcZ3e/AfeAOi1D6V7b5lk6Znt3PNc9Ppeqo06kgUNgWgH7RuoEIFeWn
	h2CjcupYsBkXi8fJoFvXh45KHmpdMhRYh87A6Lvwu7zyAreXiGhe0G/MenKnN7DDIj6A9ItUNvT
	Le/EOhWARRUsOPE7XhT3Ws4lwhLTE=
X-Received: by 2002:a05:6000:4a07:b0:48e:10a7:438 with SMTP id ffacd0b85a97d-49c725e5f59mr17435801f8f.36.1794760484976;
        Sun, 15 Nov 2026 08:34:44 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f782396sm17500021f8f.24.2026.11.15.08.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:34:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 1/2] arm64: dts: st: enable eMMC on stm32mp257f-ev1
Date: Sun, 15 Nov 2026 17:34:29 +0100
Message-ID: <20261115163432.2601947-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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

Enable the eMMC connected to SDMMC2 with an 8-bit bus on the
STM32MP257F-EV1. VDDIO2 is tied to the 1.8 V rail on this board, so
the DDR52 and HS200 modes are enabled. Tested in HS200 mode at 100 MHz.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 782b4bb843ee..9c38c4fe0c1f 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -431,6 +431,23 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	st,neg-edge;
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	vmmc-supply = <&scmi_vdd_emmc>;
+	vqmmc-supply = <&scmi_vddio2>;
+	status = "okay";
+};
+
 &spi3 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&spi3_pins_a>;
---
base-commit: 23c62304dde29abe92013d85910d03a77dada35d
branch: stm32mp257f-ev1-emmc-aliases

-- 
2.43.0

