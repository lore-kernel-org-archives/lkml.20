Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9BE386424
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789245918; cv=none; b=prm2s6Fwwy5U6lEVLU9dCaFr4SsUuC8zj6NGRwduiraiRZceyFeDyAtFbpjVAXEYyhCXZGVlIkX44IljBMtvmKeQN9ap+i4XrhKc7h8jTBoGAsyN9qZBxPhzYNkCml1TTuKXDA/pUMzwkNvE/5P7jv1YA/D6dqQJLeSEB+akihg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789245918; c=relaxed/simple;
	bh=mdLhA5ufzgFyJdjNbB3mIf3qPlihGQXIZmLrkRF/DdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h8wn54SwTej+Bg7QAYA206QfXiWE70P9nEskGpGu3icBi4a9q9pUGMdvu65vZXMYqFWV2NG+BAasrU55VRpoUFQ1bvN4cx803pGFk2R3PSnUj2tygyfIYMfsJSh2OhyvUWfDgObUuX626f8yiTB8G03vdK5QUG5M5GINj8IPdWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=G0+WTvy+; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="G0+WTvy+"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id A2D9D240028
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:45:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1789245906;
	bh=IZpVwh8CIc0ifvK7yjvQ1M5nK/aIW/l8aBs8zK338c4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=G0+WTvy+2rf/ljuurTIEcsXgbldAH3629kcjx2bPHXO3vNqm3Gm/SDuG7YqslS3ON
	 T7s7dH9t/Yvw8U1VSmb3RB9ED5WmmA9lT7Ig2v/mc7j1uHikp2f5xkhplKyezsNPC0
	 xK5DrsRh2V7c37nIo5jf44dtWTDp/FGkKJ2DHUVzjSSPB0hQClYCeMItxFnAPUF4Cw
	 unfk+D98yNRb8+crDPq7PJHvM83ZItoYmDMRPmkUhpDbHdx4yQbepV3TH3jWgz9ah+
	 CajndEa1Svwc978ktskeNXDfkRSYHGAKbk1vkrRxhcIq/rFTowIiRunYb6MBP/gf+y
	 eg8IhxqV6s1yw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hj3M534q8z9rxB;
	Sat, 12 Sep 2026 22:45:05 +0200 (CEST)
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
Subject: [PATCH 3/3] arm64: dts: st: enable eMMC on stm32mp257f-dk
Date: Sat, 12 Sep 2026 20:45:06 +0000
Message-ID: <20260912204454.219606-4-mateusz.nowicki@posteo.net>
In-Reply-To: <20260912204454.219606-1-mateusz.nowicki@posteo.net>
References: <20260912204454.219606-1-mateusz.nowicki@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the 8-Gbyte eMMC v5.1 connected to SDMMC2 with an 8-bit bus.
Faster 1.8V modes are not enabled as they could not be tested yet.

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index 8daf3dfd5133..8c6aabac367e 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -21,6 +21,8 @@ / {
 	aliases {
 		ethernet0 = &ethernet1;
 		serial0 = &usart2;
+		mmc0 = &sdmmc1;
+		mmc1 = &sdmmc2;
 	};
 
 	chosen {
@@ -231,6 +233,10 @@ scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
 	};
+	scmi_vddio2: regulator@1 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+	};
 	scmi_vddcore: regulator@11 {
 		reg = <VOLTD_SCMI_STPMIC2_BUCK2>;
 		regulator-name = "vddcore";
@@ -279,6 +285,21 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b8_pins_a>;
+	pinctrl-1 = <&sdmmc2_b8_od_pins_a>;
+	pinctrl-2 = <&sdmmc2_b8_sleep_pins_a>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	st,neg-edge;
+	bus-width = <8>;
+	status = "okay";
+	vmmc-supply = <&scmi_vdd_emmc>;
+	vqmmc-supply = <&scmi_vddio2>;
+};
+
 &usart2 {
 	pinctrl-names = "default", "idle", "sleep";
 	pinctrl-0 = <&usart2_pins_a>;
-- 
2.55.0

