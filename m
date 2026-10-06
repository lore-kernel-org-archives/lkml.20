Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A9137C930;
	Tue,  6 Oct 2026 04:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791262141; cv=none; b=Q6M9h10YZi1FLYMhx6A0QX+ScUd1VLhw8uXR2XQ+7qqYONV+kb07IQqTur1vzoxKOE0hTV10mp4ES3oy3CUgat+vgQKv6dK4xz97PQU/wp/sf4Q62DxzjBjkQOubxEE7cNpZPS2vZklgn2ataUI1sz4ivyWhqvuZLpAU+/oN2AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791262141; c=relaxed/simple;
	bh=k10XiJLWnHpFsNMiWX4Pai7y/jGhozADPMYq2+PHjNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eA/pe7ElFgf1zfjBB9o6Q8yW4hel07DJGyqQvkhjDSL+Gezhetl4/HePG7VCx9QPoeKy0+yVBlX6oHXRX8VBozCYAdcHz8GPj5SSztikX5ai1+D4yJwrOvb6CpkC8oRp/H83XUzd16A7kCXyVaLkPL/qQuY3WvNxeU2FrnTSdPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AI5uQ8Rs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AI5uQ8Rs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 001D4C4AF0B;
	Tue,  6 Oct 2026 04:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791262141;
	bh=k10XiJLWnHpFsNMiWX4Pai7y/jGhozADPMYq2+PHjNM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=AI5uQ8RsFf4OYn9th+afVr2VW9OQiPkAVNI5WDVvq8j5SWkXSeGhwNaiflinUv3Tw
	 Wv5uFdUBg8kdzLuTn+Gm9VuXFc6hndrDhcnU+8Q0NFUraX5GT6HPJw/BoqGyMA0jQ5
	 v1LW79+LAFZvzR9yrWyYwrYpSeEnwAOpp3vsPR33DENIGiDpM4DQu1ZzC9fJUBoYe0
	 p3VnzKd8tENcJ/NgCxdMsjG09cq6OuVJFijtiAOtRE0++FzeakiJsUR8T4InIqoWIz
	 OnYv6Ziy4WkLZYF2jBGjqI/8vfEQ2VQnXFQlj11O68bfa0z0Qgffs/FfDiE1QvyQAI
	 vh5BIbFcQVjYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEF9CA5FFE;
	Tue,  6 Oct 2026 04:49:00 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Tue, 06 Oct 2026 07:48:58 +0300
Subject: [PATCH] arm64: dts: rockchip: Add the fan tachometers to Kobol
 Helios64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-helios64-fan-tach-v1-1-1c87e72d42b2@iav.lv>
X-B4-Tracking: v=1; b=H4sIALl9xGoC/x3MQQqAIBBA0avErBvQyVx0lWihNeZAWGhEEN09a
 fkW/z9QOAsXGJoHMl9SZE8Vum1gji6tjLJUAymyWimLkTfZizUYXMLTzRFp8WS87kirHmp3ZA5
 y/89xet8PxiNwOmMAAAA=
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2185; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=UqldmxTMEF3J34R8VW6EVq9SH4TMYUR5K/t8pdza0BQ=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFlHanenbA14+VvTLSX709oLufKqi4QL2zzLT2+9INujO
 XPmyZezO0pZGMS4GGTFFFkmHNK4lbHk6l9/D/MHMHNYmUCGMHBxCsBEuMQY/oqYdqsrn5zZyfWU
 +afFrQKxgtd/fevNxdIzeGrWMihqqDH8Zo9YYGChJHJtnVGn6ozQxDmVIQ8PLrH99l9nwtK5Jy0
 jWQE=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv

From: Igor Velkov <iav@iav.lv>

The tachometer outputs of both fan connectors reach the SoC through
open-drain buffers, on GPIO4_C5 for P7 and GPIO4_C7 for P6, but the fan
nodes do not describe them. pwm-fan therefore registers no fan1_input.

Describe each line as the fan's interrupt. The board pulls both lines
up, so configure the pins without internal bias.

Tested on 7.3-rc6: fan1_input reads 0 with the fans stopped and rises
with the duty cycle, to about 3500 rpm at full speed on both fans.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Schematic, sheets 30 and 36:
https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf
---
 arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index d146e5075b4f..63ad79b4c8ac 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -74,6 +74,10 @@ fan1 {
 		compatible = "pwm-fan";
 		pwms = <&pwm0 0 40000 0>;
 		cooling-levels = <0 80 170 255>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <RK_PC5 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&fan1_sense>;
 	};
 
 	fan2 {
@@ -81,6 +85,10 @@ fan2 {
 		compatible = "pwm-fan";
 		pwms = <&pwm1 0 40000 0>;
 		cooling-levels = <0 80 170 255>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <RK_PC7 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&fan2_sense>;
 	};
 
 	gpio-keys {
@@ -493,6 +501,16 @@ user1_btn: user1-btn {
 		};
 	};
 
+	fan {
+		fan1_sense: fan1-sense {
+			rockchip,pins = <4 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		fan2_sense: fan2-sense {
+			rockchip,pins = <4 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	gmac {
 		gphy_reset: gphy-reset {
 			rockchip,pins = <3 RK_PB7 RK_FUNC_GPIO &pcfg_output_low>;

---
base-commit: 1892b1ccccb9d546903ad6a61ffb9e388acdec80
change-id: 20261006-helios64-fan-tach-2db24b132105

Best regards,
-- 
Igor Velkov <iav@iav.lv>


