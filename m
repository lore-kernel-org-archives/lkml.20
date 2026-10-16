Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E2A3C2BA4
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141044; cv=none; b=MmZEqGodyQyyD7BAwPhWBlvzG9WB4AHLz/XdbMF8j0MsNZGWix+rclfoB5S4gyCA306FrUUfcrWqiaSDwN3kPGzhB+Lmz2FXCpBIAAiTVUr/b8m3e3stCii46NYOSAqr0xetujqlAF0VoH+ry7/pd+gOWG/SBA8DJup7CEnkZKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141044; c=relaxed/simple;
	bh=4OavUBeyGqaDIQHOgA/IhtahRkKYw5WBMKHlgGZGkLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ogIbTfWRfavwWkkj/mzEpVXc/8NOQ/3MKoW+QppmX5Uq/ASx/LSvON0XZRw2EjVvM/grl+SUzQSz2EJt/ZwCTTGjSzwoQ7Wx5CCWoYf9oUnGfWMhaEapKMCzVAtfzNNQYPvbBxcjDzYUeOdYczQldnhk7HSa1DnXBwfi2wko4Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjoNAwOB; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjoNAwOB"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e93e0d86a0so1470475ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141037; x=1792745837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soC3oS7a5a03KgF4DpWOLsJcd+T0181emvr4pS+/rCo=;
        b=FjoNAwOB7lPUcHG6vLkHgkswEQawzgQ5YdIjnPfDFSud8SqMtUuyhboxFmR5m6AWd1
         DV0mYvt9Rk/Ym0DvfhU/k7sVN4V0LIYTctRjh5Z2MoIyY9nCMsIxwo1IXcpStcZDkceQ
         eVLznCKc1RMWtIrKAryyMqew4tO6YNCEWPVBEqwF3R8jqMIMbcgJtNSdIXX/wc3ksPeV
         OjbKQhDk6zZdkUhCC+RsXMZnXFZnFdBn9K0r6ZtShQqXaNkSDLBi0Wxji6mKVU7FX26y
         XUzNRxPvex7TOky/ZV3IKRbUf1HKgDudsIxhv9Ak2WQyeO7UqWYXVtjSEWyV5oJmncjg
         7R2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141037; x=1792745837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=soC3oS7a5a03KgF4DpWOLsJcd+T0181emvr4pS+/rCo=;
        b=D7sBsWWycUYbFEdUz9rKh5m8JFn92YlGECY/MqP01e0nMsaaXbEHKaFGhHeI6/ruZ/
         wxQV/sPJSorz1TChQ46x+3IsLhJ+oez7yi3LbN7FBTJ7ukWpGB5rN0fxWe0uMCzVN5Ju
         mYrdvaAsAq8ma2qy2vGFL4laM1lvqDx3kon0vS5raZiwNd/1wxdxCAXeAc/GMbPiiOOE
         GGwI2Qu0JFyXZkf+j+bSmbSR8zX1Oab6fjBEE5OnW6aOuW0VibnnSss+GCX/fgnfZrZM
         AE2XCKwc9o1+H1yy75hVrfMI5POL7eH+FcBGeEWjGAa1meWfsGCkYCGkGOPgkWRSffHK
         bCYw==
X-Forwarded-Encrypted: i=1; AKwUvBxNucBy8X4g1zQmj7ix3Xnn/s8rJB0hMS/mF0ypSR02fuRkLOpEy3zo5aPZmOUff1PbdCokvmA1nFJ1o/s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjE08TtcalxcZ1nELYBcKtkmliBrJEWcSlV8Vk6e7XvKYV9JZn
	2BlIVkhgEx2qpKnpIsfNk9Iuhoy2XQ0qPWSUMMa4HGflo3o9qHvJY9xx
X-Gm-Gg: AYBFou3FKYAzf+tfWTdMFIvgIe1uWUIWcmSFJ0DBGYbhkTwVxv79dHyvbQefQ6aAIBT
	jTSaTUZod+hkXZO061ohWeoi6EX16ZxpGnRHS/PGppdtfVSkqvDbmlIxmaDSrhTHUrKllrv5Koo
	lp7MoNlGkfJqf11StfdRj4W+Wi9m9Os1FjaZXLZPKmnVwQbv0A8/6DJ2bYCCVLUZOcebqcxJdJH
	MChTh2rbWnvYwIfV5Xm34Wq+deXKG2VtnxvTG3p2VDMFF5RhMe8Wu2YezFl/MOMfvxihtuYAgb4
	QdbAnsmx/yPmN/RgXv+DxCExEaAI4QNlcT659gAU4lMYVX9V6ll4kLjiWTWyNoo4CegTNg2bjqa
	3eJof5wVO0YoTaJftZDR36aYWYbQ4lWXlCjtZ6f7lnvMwuJaAHSuy7cWuPa+Zwbf6xgsHxkuELI
	vxI/J6DL/7iMfpXomGsA4fGlb5qxVGR2ngFE9NgWkVvFncBKFs7Pi4UMJS67ropDXub6scyYCeY
	I609B3H7TmO1YWeHVayAGV+17NuxA==
X-Received: by 2002:a17:903:2407:b0:2e9:53b1:a3c8 with SMTP id d9443c01a7336-2e953b1a559mr91141175ad.0.1792141036442;
        Fri, 16 Oct 2026 01:57:16 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e882a20sm6971025ad.62.2026.10.16.01.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:57:15 -0700 (PDT)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 16 Oct 2026 16:56:41 +0800
Subject: [PATCH v5 7/8] arm64: dts: rockchip: use two phy cells for the
 rk3588 mipi dcphys
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dcphy-rx-v1-v5-7-e63b49eabe2d@gmail.com>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
In-Reply-To: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141002; l=1777;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=4OavUBeyGqaDIQHOgA/IhtahRkKYw5WBMKHlgGZGkLg=;
 b=v4sInDUQ/7XkIMzK26fj1mNhWedwz2y1jAeJhVW/owd/Y+g6H8l/hQlvpgno7POd/zFYYL10J
 lVky0MG/7a6BXkIlwekLASsH7MOoF5G3njxjIvRURKOz+XEH0L9NH+L
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The MIPI DC-PHY binding takes a second cell that selects the transmitter
or the receiver. Switch mipidcphy0 and mipidcphy1 to two cells and let
dsi0 and dsi1 select the transmitter.

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 376ad04e0786..94d68fd89753 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1788,7 +1788,7 @@ dsi0: dsi@fde20000 {
 		resets = <&cru SRST_P_DSIHOST0>;
 		reset-names = "apb";
 		power-domains = <&power RK3588_PD_VOP>;
-		phys = <&mipidcphy0 PHY_TYPE_DPHY>;
+		phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_TX>;
 		phy-names = "dcphy";
 		rockchip,grf = <&vop_grf>;
 		status = "disabled";
@@ -1816,7 +1816,7 @@ dsi1: dsi@fde30000 {
 		resets = <&cru SRST_P_DSIHOST1>;
 		reset-names = "apb";
 		power-domains = <&power RK3588_PD_VOP>;
-		phys = <&mipidcphy1 PHY_TYPE_DPHY>;
+		phys = <&mipidcphy1 PHY_TYPE_DPHY PHY_DIRECTION_TX>;
 		phy-names = "dcphy";
 		rockchip,grf = <&vop_grf>;
 		status = "disabled";
@@ -3429,7 +3429,7 @@ mipidcphy0: phy@feda0000 {
 			 <&cru SRST_P_MIPI_DCPHY0_GRF>,
 			 <&cru SRST_S_MIPI_DCPHY0>;
 		reset-names = "m_phy", "apb", "grf", "s_phy";
-		#phy-cells = <1>;
+		#phy-cells = <2>;
 		status = "disabled";
 	};
 
@@ -3445,7 +3445,7 @@ mipidcphy1: phy@fedb0000 {
 			 <&cru SRST_P_MIPI_DCPHY1_GRF>,
 			 <&cru SRST_S_MIPI_DCPHY1>;
 		reset-names = "m_phy", "apb", "grf", "s_phy";
-		#phy-cells = <1>;
+		#phy-cells = <2>;
 		status = "disabled";
 	};
 

-- 
2.43.0

