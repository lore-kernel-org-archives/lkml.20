Received: from mta0.migadu.com (out-35.mta0.migadu.com [91.218.175.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F9543E9C4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917557; cv=none; b=s+/1u0UtNoB6PdyT5RYK8mRq3iJneoqubRbP0UlQsiOMJq9V8dwrjFctvx9pqsm/u2zuu0SCm53Pj6DMF5Ni6ed3MSvRLyeg65GUfFJ2Q5BNttUVl0eB7s6ZDqTesRprhMBFVd/MJTv3pUdxXEts9KV0WXb14ykgxKdrVPx31Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917557; c=relaxed/simple;
	bh=hKt0OBC9Ziec3JNJiQiTOs4ZiRMVpV+jL5aTojBkpS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=om2THn+6w7pTBYukZvHbmsPXomewAuI9UI1CQw33iSPL330azjVTNsve2NV96vH5JxvF7fXxwMRlOW7EuJvDJKq1C7maWQul0ACJV8fnmvKlawkmKDc/L2mrKLW3NEE7PsqxQVheMgUqKnjhgQO+IcT6V2fwb2QMHvFmdMjJ8po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=YASbBN6f; arc=none smtp.client-ip=91.218.175.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="YASbBN6f"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hKt0OBC9Ziec3JNJiQiTOs4ZiRMVpV+jL5aTojBkpS0=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787917545; v=1; x=1788522345;
 b=YASbBN6ffCYeHsbLBb1EFd0w22zEj7Ri0P0PlL8/ptGrs/weZNb5TxH2mzXlyYQWsNYRDY+2
 XWTiIdEtFVPX3MqCP9L38hiRouV75PcBkPnXE3W80sBLLNsQQOQBEwLksSi1ks2pciG2XBQ7fxo
 8fcrjcnl9IN5xNvigJvrRvLno0yvdg8gZhhpLGvF4I0+Am8sOCOsPKkUwFzhsNvxvTByGr99WI9
 DHMenQN1XdIkY0HNuC3FNFFglRxRF8MQB8P7SUR4n1G7APTAwhU3INSSD8xpvH8xOiK7wmHpGYV
 OoAjTLNmMxZd1t0st5065rLoME8jWYAgy7/hb+aG/NqiQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 269a0ce062d2b6cf;
	Fri, 28 Aug 2026 11:45:45 +0000
X-Mizu-Trace-ID: 269a0ce062d2b6cf
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Ricardo Pardini <ricardo@pardini.net>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Daniele Briguglio <hello@superkali.me>,
	Hugh Cole-Baker <sigmaris@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 1/7] arm64: dts: rockchip: Remove unneeded vcc_3v3_pcie20 on NanoPC-T6
Date: Fri, 28 Aug 2026 13:43:01 +0200
Message-ID: <20260828114530.1315798-2-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828114530.1315798-1-diederik@cknow-tech.com>
References: <20260828114530.1315798-1-diederik@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ``vcc_3v3_pcie20`` regulator, identified in the schematic with
``VDD3V3_25GLAN[_B]`` is only separated from ``VCC_3V3_S3`` with a ferrite
bead. So there's no need to define a separate regulator for that.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index cfdb5c13f860..fc49b927ef73 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -167,16 +167,6 @@ vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
 		vin-supply = <&vcc4v0_sys>;
 	};
 
-	vcc_3v3_pcie20: regulator-vcc3v3-pcie20 {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc_3v3_pcie20";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vcc_3v3_s3>;
-	};
-
 	vbus5v0_typec: regulator-vbus5v0-typec {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -640,7 +630,7 @@ map1 {
 
 &pcie2x1l0 {
 	reset-gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
-	vpcie3v3-supply = <&vcc_3v3_pcie20>;
+	vpcie3v3-supply = <&vcc_3v3_s3>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_0_rst>;
 	status = "okay";
@@ -656,7 +646,7 @@ &pcie2x1l1 {
 
 &pcie2x1l2 {
 	reset-gpios = <&gpio4 RK_PA4 GPIO_ACTIVE_HIGH>;
-	vpcie3v3-supply = <&vcc_3v3_pcie20>;
+	vpcie3v3-supply = <&vcc_3v3_s3>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_2_rst>;
 	status = "okay";
-- 
2.55.0

