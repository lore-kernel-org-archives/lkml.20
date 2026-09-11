Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F22B45C719;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115332; cv=none; b=lOI5rsuHPxS6XMvy/Mq0vS6NKwwnbuNmUxrbXiIAyq9+hde5mfkwYMTHdpso77Cpe5ckyvgrKM7L4QIERY2APw3nMkdrTUcOQu5ZMw+bQ239YQTiY7DC6Vph3Lpya1HRgMxRX71UwZPE65C9FJaUobmrAPLtbV8kL1cbyQn5PJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115332; c=relaxed/simple;
	bh=mLj7YUC9Fm6rKKu4LSYfjTh/ywFy6caKOyKBr+t9m/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r4u2t4mO+DQmdby2KjTC9lfGG2NYmHSj0RroJjqXafmL5wh6m6t+izUXLhEN2Kmt889QfEI0pxdS/HJudqtJcSiJF+jaLEckuUBJgpwV9cf2yl4VeThu5PrMdVQKmDzYQnUdnIZK96VGFyFY7lRZS/AM5m2EkaqCe/XVJERtgvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQCf8WHC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQCf8WHC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21584C32782;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789115332;
	bh=mLj7YUC9Fm6rKKu4LSYfjTh/ywFy6caKOyKBr+t9m/g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BQCf8WHCLPPG2RGkrT1lBlKbJOpvqAYedFdAgc1xKUH2ztTvCKCmZZCOqPVNVTSW3
	 2LejBiw7vel4xHLJOpKPoP5aNb479HNjhkRRg5ShArEftFCntVOc03QDsztDEQavO4
	 51m+efxdju84tX2mRaleEKUrf5wCk2hboFH1k5526AUMqz/ScoC1b+1Z5f8r/l7fO7
	 lNft58WH/fpqlUlBzZJX/ivHelCynsPKAUkf5j0c1+1RucOhXdJviGvXxTjj+8Niui
	 ZYNbTeyN/C3Ph23ABHS76yb9SJrmfb/fZ0TG4FxxtO5UY1WD495xVan8KJJ9ciosqZ
	 m1/S5IcLx+Lcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1BDC88E4D;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Sep 2026 16:28:33 +0800
Subject: [PATCH 06/10] arm64: dts: amlogic: a4: Add clk-measure controller
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-more-socs-to-support-clk_measure-v1-6-940e269aa52f@amlogic.com>
References: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
In-Reply-To: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789115329; l=797;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=wRifO0cIF3hQCIdhhi4prrj9RKNwhA6uX1mJAaHO3Ik=;
 b=dxkN7FUuyreM7FYjTV0v/C+Gvt+Bo4jl3ToXJg5NNEAaHVCFaZ1oG9La/uhAq8aCP8Jr5SfbG
 G1xgkY7azqEByX3TbJY5Kbmxe8BTAjKk1LMj+073q1HmHAIZ6EvLK/v
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Add the clk-measure controller node for A4 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index fce45933fa28..762754b33f23 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -207,6 +207,11 @@ gpio_intc: interrupt-controller@4080 {
 			<10 11 12 13 14 15 16 17 18 19 20 21>;
 	};
 
+	clk_msr: clock-measure@48000 {
+		compatible = "amlogic,a4-clk-measure";
+		reg = <0x0 0x48000 0x0 0x1c>;
+	};
+
 	ao_pinctrl: pinctrl@8e700 {
 		compatible = "amlogic,pinctrl-a4";
 		#address-cells = <2>;

-- 
2.42.0


