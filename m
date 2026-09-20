Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9E33F326D;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789899907; cv=none; b=TfgVj1X5U2j1HntwbOiyi9ejWuYByTMTUev6/6OCeAlS8ab8HCeDsmZ+Wiqg0/EVb4xYpzGmoQAeqJH1a9sXDMiPy/REIG2rb3cufx7isYPxhwtPOLrMGhP5KC5casdRfBcmwlzhaFBeiwuqSCgDAYjMOPlpxSVVCdr1/NlkvgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789899907; c=relaxed/simple;
	bh=mLj7YUC9Fm6rKKu4LSYfjTh/ywFy6caKOyKBr+t9m/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OmrOQadWr4O94GX+zOEGtN4uvUy2BY/BLr9/irMNjhldJQJ7UKcXffNYz7Xm/tbv+rn1v9nx/GCrIdWU25vQu9cnN+J+68T0caTk/huqD7QsIoJwZNkf8q1lq+deHMwUntTkR+a14YvytsrpeC5P0ccxz3JUzwTWbzFNtpXjsoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4SRpdN7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4SRpdN7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7643BC2BCFA;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789899907;
	bh=mLj7YUC9Fm6rKKu4LSYfjTh/ywFy6caKOyKBr+t9m/g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=F4SRpdN7Zvpi0iY1lQDmu2AEV2ShUTMe1K9hnRqunOE6CZq/fA4tl0qzFrGAZxvga
	 9//zhbf4wuT38pDm7s871lci603W3v0S6ENWmKsg0mXvyH8ZGcerS3Xlv6TTceivEE
	 VaizsvWJuj7y/DWyoa7lLKAlYW2oEJX616Y4jJWsr4PbyXn7egymeBwA2uoeQ4KowZ
	 g3GAY4GrbaG0agKwAFU5icNiTW0TIi3bhOOcQDBSCQL5/bE5pUF0WrtPIu72phuREm
	 oFQFjNC+IY3TC4v7Y8TzIRlXm9rgcBVJV9saC1duRfubplkSano3/A9Icvd1MPESkI
	 5Ex42z+otLGww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64086C982DA;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Sun, 20 Sep 2026 18:25:10 +0800
Subject: [PATCH v2 08/12] arm64: dts: amlogic: a4: Add clk-measure
 controller node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-more-socs-to-support-clk_measure-v2-8-224382a429e8@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789899904; l=797;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=wRifO0cIF3hQCIdhhi4prrj9RKNwhA6uX1mJAaHO3Ik=;
 b=34vRqi/pd6UVz90Vtvp45zfx1ThvzN4OBgfrH5k//2lnQcFQqK4v7JpBTKDLtlCsxAJdtSs9T
 0lMipt4YCPJBntVi34HwlATmjeYXIi2ykCkQLS3eBOicDn/+ZG/4e98
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


