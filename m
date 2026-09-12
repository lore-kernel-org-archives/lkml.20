Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910D436EAA4
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789245915; cv=none; b=DsPIFBte46kKEtLnkdFAuqZxXHM7w64mvvyc6+HhAt8v26tQyWUot5ESNyG6aZC3uDguaOmV9OBHkIa1j1vR0t65vHFttqByUUThDpGt+1n1QGFxkxyuknxq1nsO7HIFNP1m0eSPSDVCAe29b9ToKvivtvEOvpAYvPRLUFwMHQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789245915; c=relaxed/simple;
	bh=Arr4R7yuKObofd2Tor2p4y08xrfyOMfz0qsf5aQA7LU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eY0dGXNz0t2GmUMRhOVtCVx/nkE5NyagTLkTC1uEDIFHn65CUzazvdYBhCypN4YTuEtn5Iwc6z4bFPk9p+dot+b6hB5G0ig2IzmLALS9LluLwaNg/pup8pxsGxva26/k38OriZ1iwvd922RCK6j9ztsmkIyhun99xMh7lLTxpfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=ahGVWikQ; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="ahGVWikQ"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id AB81F240104
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:45:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1789245904;
	bh=Myy3smEvql/qodoHPfYgXGKdcJUKumaY+uFvrhTMU5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=ahGVWikQWzElFIqOcmtCZv6GyrHrNdCT13y08LejH4cvzx87/fX/9QqXntFKyrNpk
	 QVBVvLbmhdVx06AFRD04peCv1B8VEtU7XeMtF74uBj4nCGyKv3cN1ax6NkU39CyMTT
	 IrNeqZTvhAAqlKf3XKheadISthEvgKq2KyCyTX5mct+iBD+S8fW+XBXg7xHnCTRpJ0
	 Zl9BaBCywdudLwNCiirOakAFDk5uanx/aG4QO6azDnN8HUIKF9RIJPbMY0ah+7hXRG
	 yA7MUd8FLW4pHZDtiHdPhCdXyIWr9eMIbu/qwkqwTH+Bk8AavvstpHBZPykjVdj9DJ
	 93rszw+rOoxLQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hj3M32998z9rxG;
	Sat, 12 Sep 2026 22:45:03 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: alexandre.torgue@foss.st.com,
	mcoquelin.stm32@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: st: add sdmmc2 node on stm32mp251
Date: Sat, 12 Sep 2026 20:45:04 +0000
Message-ID: <20260912204454.219606-2-mateusz.nowicki@posteo.net>
In-Reply-To: <20260912204454.219606-1-mateusz.nowicki@posteo.net>
References: <20260912204454.219606-1-mateusz.nowicki@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the SDMMC2 controller, the same PL18x/SDMMC2 block as SDMMC1 with
its own delay block in SYSCFG (DLYBSD2). It is used for the eMMC on
the STM32MP257F-DK and STM32MP257F-EV1 boards.

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9c63fdb5a885..0d10023ec1e3 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1667,6 +1667,21 @@ sdmmc1: mmc@48220000 {
 				status = "disabled";
 			};
 
+			sdmmc2: mmc@48230000 {
+				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x00353180>;
+				reg = <0x48230000 0x400>, <0x44230800 0x8>;
+				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_SDMMC2>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC2_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <120000000>;
+				access-controllers = <&rifsc 77>;
+				status = "disabled";
+			};
+
 			ethernet1: ethernet@482c0000 {
 				compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 				reg = <0x482c0000 0x4000>;
-- 
2.55.0

