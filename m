Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7234A49AB;
	Sun,  4 Oct 2026 22:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791153601; cv=none; b=JeuR/x/WSeOdNGthF03rw+DcdCN64i5wD7f8yuoIlNRkStJ779Xct//8N13I1W8v1haMU+LYsiUJpExdae2cGKIZg/ZV09WyrDGqmgor/fnuf8YPlg/+uY+Z5nrDSckZXPSvRuCaUIzicZUk64g+b0vZ32uWWBsDr7zdQ7aj2SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791153601; c=relaxed/simple;
	bh=u1lLC1WSbIv1AIKWpV3FLRj7881n0ba0sc0bTNDIolA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cm/qnsf3rlL8zWqLfrMgu37Fl+uW9aRkj+euThE+dQ5J0BIW8bXDpCJs+aI2ggCwWl9dYt8rzhLH9Dve4FWNnMUKd9iQtN42jzspH7S7q9vwfenvz2vEZL8iw3djTjWLNwkUbwHzvm/1QoZMt1k0Q9lHZ8Y4CaA1kFCu1olKNE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ea8WjSwb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ea8WjSwb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 235EFC2BCB9;
	Sun,  4 Oct 2026 22:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791153600;
	bh=u1lLC1WSbIv1AIKWpV3FLRj7881n0ba0sc0bTNDIolA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ea8WjSwbKtae6TmcoxiznkZwKEZcoR7xm5yfx2rK37Ycln38B9eDIPLSAOP9aTxby
	 SJcV+ppApv7QbmOzi2azBynpR17T5mE6f8h2viokik6I74aD+fTRjHcvUEVBTwqVcV
	 IQcsBbTYPN7EKmNN9srJCkTbNwGbAWzg3EaG0gw7lzUCTQbd97ojT/ssLsNXXZhvy2
	 qYvTKlizqtDekJfNhQlOurDf792KsoV1Q1mGtd3A5FZ7nn3tHm4qiIGj3zWZ0Fb8GS
	 EYcTEX9uNntha3U7VsgJSjmQUkGza3YobBNie8OIWgGfDNn9UTiayCDBoRnByDAMdF
	 dUfC6l1ky+93g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1BCCA5FCE;
	Sun,  4 Oct 2026 22:40:00 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sun, 04 Oct 2026 22:39:58 +0000
Subject: [PATCH] arm64: dts: rockchip: Add the battery charger to Kobol
 Helios64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-helios64-dc-charger-v1-1-0eabf0274d47@iav.lv>
X-B4-Tracking: v=1; b=H4sIAL3VwmoC/x2MQQqAMAwEv1JyNtAWrehXxIO0sQZEJQURpH83C
 HMZmN0XCglTgdG8IHRz4fNQcY2BuC1HJuSkDt764KztcKOdzxJaTBG1kEyClGI7KEO0PejyElr
 5+V+nudYPz9yeUGUAAAA=
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2197; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=DAhlfIUWqvGqD77K4GZRu5rOeDoaIBCJ6zw/SQS3zzI=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFmHru7Lig//2vTZPf/F63ncxZ1qTC/Md11Zp3Lm0+k0w
 w++ArWWHaUsDGJcDLJiiiwTDmncylhy9a+/h/kDmDmsTCBDGLg4BWAiLsoM/7OWJcyrnVq08Nm1
 lR9ZUift6rt/PSTI0cU++PmWY/8r36xiZNjWXfb2yb+pVWrX365/6X253ThbzUxTYn1y6QbRO7c
 fcbACAA==
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv

From: Igor Velkov <iav@iav.lv>

Helios64 has a battery backup built around a BQ24133 charger. The
charger works on its own; the SoC only sees two status lines:

- VCC12V_DCIN_GOOD on GPIO0_A2, a divider from the 12 V input, high
  while the mains adapter powers the board;
- CHARGER_STATUS# on GPIO2_D3, the inverted STAT output of the charger,
  high while the battery is charging.

Describe them as a gpio-charger. Both lines have external resistors, so
the pins get no pull.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Tested on 7.3-rc5: online follows the mains adapter, status reads
Charging while the battery recharges and Not charging once it is full.

Schematic, sheets 9, 15 and 29:
https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf
---
 .../arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index d146e5075b4f..813a39964357 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -62,6 +62,15 @@ chosen {
 		stdout-path = "serial2:1500000n8";
 	};
 
+	dc-charger {
+		compatible = "gpio-charger";
+		charger-type = "mains";
+		gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_HIGH>;
+		charge-status-gpios = <&gpio2 RK_PD3 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dcin_good>, <&charger_status>;
+	};
+
 	clkin_gmac: external-gmac-clock {
 		compatible = "fixed-clock";
 		clock-frequency = <125000000>;
@@ -493,6 +502,16 @@ user1_btn: user1-btn {
 		};
 	};
 
+	charger {
+		charger_status: charger-status {
+			rockchip,pins = <2 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		dcin_good: dcin-good {
+			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	gmac {
 		gphy_reset: gphy-reset {
 			rockchip,pins = <3 RK_PB7 RK_FUNC_GPIO &pcfg_output_low>;

---
base-commit: 36bd12104f6e9462f6e97989fd8ef9eb1609623f
change-id: 20261005-helios64-dc-charger-edc49c499c07

Best regards,
-- 
Igor Velkov <iav@iav.lv>


