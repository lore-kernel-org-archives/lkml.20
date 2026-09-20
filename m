Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BCD3F58DC;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789899908; cv=none; b=kuoNg0vceogyI7rWd6tvlRwOUYMc3vZ/7V9WZeITf7mPVR8hBlJE3CuLUi8gnLLaB6P7LMHDQ9yOutU9oxb5w3SdFyxFO9HAR6HVf5PoNxIauYfANGfFjJDlSE8xt4J/1VRxw57qjvDyEcu1pQWGcFHqcGM+VlunjQNwXYappcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789899908; c=relaxed/simple;
	bh=CVrPnrs8qwQFVuAK2JblKtBbOLQAR+miyXJpO2WE03c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FDckJwT7eqKr3UxosgNhVvp/U1diWX/z+Vva1YobweKV1WUaYq7R+w6bqvZwLlMXEjmEkg8DgbQMGbR2ct6M5D/tSkJs0tGkI+zGz3nigI55ooW8ARfg0wPUzkWKWM3UK2U2RV3ED05z+micxs5JwJTHfjKeOk5VHY5L5c2yzyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6WcSrnK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R6WcSrnK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD206C4AF09;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789899907;
	bh=CVrPnrs8qwQFVuAK2JblKtBbOLQAR+miyXJpO2WE03c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=R6WcSrnK1bR1+ArQF7QdCJVEZ4KE2hGgym5ADS0fwT2XK+RUR6X1xBam8+cdflhEq
	 ZgbCGB9LANCw1aymz5R2VObSUKVO6dsgAdsN+vrc6QNtPkNCiJsSTum+YNYDNW66i5
	 PSL8S+ATJ8LxDs5jtaTd19ZZDKbEmviVmz+dWGdH8lksWgGyc8D4LsHyo7FgPnhy1K
	 99cZxomXkXrkOdecFgzsq0XDEydWSOyEKuHf68zbB6MBBaON5gL0gPPzn1ZIuD2AIl
	 updHd6/1aRD5jCcDUcyct/E7IGZpbPUvwvoM8/vN98RgKh8xOJMsYw6uiZxVWP4ogS
	 lQWHnu2KN88ag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1DEC982DA;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Sun, 20 Sep 2026 18:25:14 +0800
Subject: [PATCH v2 12/12] arm64: dts: amlogic: a9: Add clk-measure
 controller node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-more-socs-to-support-clk_measure-v2-12-224382a429e8@amlogic.com>
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789899904; l=796;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=4DgrEoOMoCExjYXex82UD7PxEvK6o2H5kIyRyw8MyZw=;
 b=LH5sb4t5IBJ5szFqCCnGHBi6Bi9K23ols2Lss7BhhYVthrPh4WCUqLF+KqihHHF+XFO3j5Q72
 lzZKwoZzJiHB4rAs+2DPnS7Bu/PNMX34qrQWqwwmZ4qO6uaPcepLXTM
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Add the clk-measure controller node for A9 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
index b0e0fadeed82..91f4cf319b0d 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
@@ -185,6 +185,11 @@ gpio_intc: interrupt-controller@4080 {
 				amlogic,channel-interrupts =
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
+
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,a9-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
 		};
 
 		gic: interrupt-controller@ff800000 {

-- 
2.42.0


