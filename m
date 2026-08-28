Received: from mta1.migadu.com (out-40.mta1.migadu.com [95.215.58.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A72B447806
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917561; cv=none; b=GmS4MjG9NEbOeN8mni1S23erXUAPqRoF0t1FccGPjvEc5myKfu2UhUksDdcZrG5sQDw6zmLYFQZDh2KY5Yzqz5cbjZTRaUGyV4VfCVe9Tom/r/frLk/SSY/VbKMyiFWh2zEukeCrwa+72wOR8MtANeiLGZfgcG4KpkufUG2ryak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917561; c=relaxed/simple;
	bh=bVACo8v5FEqx+4/0ojCAbrd58C/+n+Gtjw1O0FYevc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b5ZlTrbupXPER4U9T8khmFmOLPDqSZPs87+gZ3x40CJOsZQD5dy5usp4i6yoidSMUmO058VyrvoxuP0TGK1vszq08a3DORSZxbSyOYrDLOLWDtL7DuSxxE10tV6pxtke5nNOWPSd+maME9ApkQHefFbCHatLsM8StoSh0rrVBsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=cihW0Gc+; arc=none smtp.client-ip=95.215.58.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="cihW0Gc+"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bVACo8v5FEqx+4/0ojCAbrd58C/+n+Gtjw1O0FYevc8=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787917551; v=1; x=1788522351;
 b=cihW0Gc+3f3bgK24aeajsH2tVR6faDKSCqHTJQimjA8KO7WMo4B67RMhs/4msb0uIptkXCf7
 qM6cebNW56cHouyAtq1LgCH+To/HH9PbC94A1byX3o9otcRfLYQRFJbxXba51cQ1I9AaOWaF03K
 f2lH5CJrjSCYOEZWSTUtC6oTbbTUwuJHdVdbd/3GWHRHpHNUgDatMUxKQpnuDdsdYd69gX6EVpt
 Lf1bDMvfnERny+WNZJQ2OYaCoHTgwZC+zyoNhRyZ0ZfYFq+805Mhg0RRFYT/YRP/G1W9trT7F4G
 NP/KwjvzDEeH7BOOTY0qdWOUKtXm9upODa2zLcYTQP/1g==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id aac531fba34cc0c3;
	Fri, 28 Aug 2026 11:45:50 +0000
X-Mizu-Trace-ID: aac531fba34cc0c3
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
Subject: [PATCH 3/7] arm64: dts: rockchip: Fix hym8563 pinctrl name and sorting on NanoPC-T6
Date: Fri, 28 Aug 2026 13:43:03 +0200
Message-ID: <20260828114530.1315798-4-diederik@cknow-tech.com>
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

Use the pinctrl names as used in the schematics and use natural sort order
by property names for the hym8563 RTC node.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index 16c35250bacf..84bfb33a4774 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -536,10 +536,10 @@ hym8563: rtc@51 {
 		reg = <0x51>;
 		#clock-cells = <0>;
 		clock-output-names = "hym8563";
-		pinctrl-names = "default";
-		pinctrl-0 = <&hym8563_int>;
 		interrupt-parent = <&gpio0>;
 		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&rtc_int_l_pin>;
+		pinctrl-names = "default";
 		wakeup-source;
 	};
 };
@@ -704,7 +704,7 @@ hp_det: hp-det {
 	};
 
 	hym8563 {
-		hym8563_int: hym8563-int {
+		rtc_int_l_pin: rtc-int-l-pin {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
-- 
2.55.0

