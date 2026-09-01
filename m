Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBCF47DD7A;
	Tue,  1 Sep 2026 12:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788264943; cv=none; b=d17/reAdwuJKiJWUsHasAdUOMqqI65RnzxI2Tw28xOnH5DnHnnCb25w6gwtfapsdEnqC1vCEiPrmto+ZvLG0DOUqEUBTrgC6aqsSrDWQkRGrD9dY49CJP02BFsxI0gr+u2LYwNBOkiUPfcVqgO366ggq4xxf1jwTn6/8SdQWhjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788264943; c=relaxed/simple;
	bh=mPXqrM8TVSfYFliy2MzwJrn53vceZBxZHt9eoeKdWpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gLtRtNimN2dag+ENCQzZsr6CP6eT3bxyigfkyzOQJLswpqYlHT81WYZGSSydti9FAexkY54yenZpoSo61nDdwZVbIQv78fIapfXcKPBEaOHk6BfOmM5J3ET/7OT2UramawvnCi8LGxufdbdYZ3fLq0SltAedK9+Qp8gN4rlw6qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fc4lO/Iq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fc4lO/Iq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 549EBC4DDEE;
	Tue,  1 Sep 2026 12:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788264943;
	bh=mPXqrM8TVSfYFliy2MzwJrn53vceZBxZHt9eoeKdWpI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fc4lO/IqQ6e9uGzZgQG4gT2DyiX4qUdvvu/HhVTnvE1045+51kkOka731hajdu2tb
	 RoiJRS02pVXI8ykGqhBAyQgE7jdQ3dsruQy29WzfspcYaipD9skeZQHkhmUZ/UwDcn
	 DWhZJpbbSOm8eGPhsPS4Lm6taXQ1lP+iBt0kcF+/JZ+/HTw22Dpiiz8aGD6JTOK1C6
	 XKFSNlrKCGdz+RdU0jB+yfQVnHivsMUlbX+CNxEu8XIjFwDIbssjw/Sjc0ctrrZgZx
	 oVrD1coI+MKXgq+p9ZrmdDcVd9gyc14GDOTQpiw5D5ifILiLy/yDjxZLmoo4p19pNs
	 TcROpTNX/g7Sw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E75C61DD3;
	Tue,  1 Sep 2026 12:15:43 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 01 Sep 2026 20:15:26 +0800
Subject: [PATCH v7 11/11] ARM: dts: aspeed: anacapa: Add SPI flash VCC
 supply
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-anacapa-devlop-phase-devicetree-v7-11-0bd71d2e0105@gmail.com>
References: <20260901-anacapa-devlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com>
In-Reply-To: <20260901-anacapa-devlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Rex Fu <rex.fu.amd@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788264931; l=1484;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=9gpVJ0rxiqE7qYFlpOIPmDWgZMRiE3A5HNXFZcYVMUg=;
 b=9J1LOfBjMbAp1VTrYffihABG/+4EhiCI8+ST60Oi8ipR58ZfyzTs6ZaAziKyHeLAAwoT1YTn1
 UcHwD9AU4dNACKtRWQT8IgNwWPVr10WI5FCM0SUlGkjkX2nQ0QoU43a
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Rex Fu <rex.fu.amd@gmail.com>

Specify the 3.3 V auxiliary rail as the SPI flash VCC supply to
avoid using the dummy regulator during device initialization.

Signed-off-by: Rex Fu <rex.fu.amd@gmail.com>
Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
index 017700920cb1..03dbc9cfbb06 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
@@ -93,7 +93,7 @@ memory@80000000 {
 		device_type = "memory";
 	};
 
-	regulator-p3v3-bmc-aux {
+	p3v3_bmc_aux: regulator-p3v3-bmc-aux {
 		compatible = "regulator-fixed";
 		regulator-always-on;
 		regulator-max-microvolt = <3300000>;
@@ -171,6 +171,7 @@ &fmc {
 	flash@0 {
 		label = "bmc";
 		spi-max-frequency = <50000000>;
+		vcc-supply = <&p3v3_bmc_aux>;
 		m25p,fast-read;
 
 		status = "okay";
@@ -180,6 +181,7 @@ flash@0 {
 	flash@1 {
 		label = "alt-bmc";
 		spi-max-frequency = <50000000>;
+		vcc-supply = <&p3v3_bmc_aux>;
 		m25p,fast-read;
 
 		status = "okay";
@@ -1074,6 +1076,7 @@ flash@0 {
 		spi-max-frequency = <12000000>;
 		spi-rx-bus-width = <2>;
 		spi-tx-bus-width = <2>;
+		vcc-supply = <&p3v3_bmc_aux>;
 
 		status = "okay";
 	};

-- 
2.34.1


