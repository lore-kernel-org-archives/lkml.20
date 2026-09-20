Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DFB3F412B;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789899907; cv=none; b=Rb4nTl1naarlrne1HdNrfwRxsWn0sHIaMhVsdpKn98+SYiMB8IdT2KEA/KkgKaj0D312E7mKTyRD4To276Ccb8ZLIIqSiJ09IGlNETfA/lTjs8SCPWjKWQ0qsWS9SaUH3jMwWybPJ+Xr8BHiiH2bUcdUb/7C5RrtroIySlHQtdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789899907; c=relaxed/simple;
	bh=ASdPmlELWfdb/Y/YJ4rVHsEqniNVnoU71S6yuvMaeDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oPinHMfJLByYG5YF+Ub6jsJfjBnDx0v8Ka0euBCsxGMVdSojV+FjMF6lFtnosuNVsolwX2Q6PiCwWpCVbsnfj7J1DLIUSeoTF/Q9Ty619cy8yEGq4GeS0JEWY6kzWr9/uTNSFV1rHPvRIXp3V/z9qnVivwJEv3KaBqCLi8GMuLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RYwHfMwS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RYwHfMwS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 878F4C2BCB3;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789899907;
	bh=ASdPmlELWfdb/Y/YJ4rVHsEqniNVnoU71S6yuvMaeDA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RYwHfMwSAF5nDdiV+YTSP4L3xFRFa/7RQhOPKZuGeuoaq2Ci5WmX/7tPx3ZU9Kp/T
	 ITFPoB65zRVfge6y4vdwmDMV9HTnYTA0+3VAg/dQAaq3RkL0RIwgg5wdPO3iDtqlil
	 bsCz3EmzkmwecM9NGRd44zNBAx/gc35ILFFqbDoW3itOH+TT/oKwO5qRWrwtMoh8Yr
	 JMekqBK7qWgsLYPJKW8Q/BPU/r7ChimVFBuiIinTIatHuk3uFeOWzLbfQ6cx6b6arj
	 2lrEIFu/oFdwMOmnhGVkpCLFlrznDxmvfnM01CT20Yx16U9fm2YWOi8vyp4IkYeK04
	 ojq1Awj0voCfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76229C982EA;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Sun, 20 Sep 2026 18:25:11 +0800
Subject: [PATCH v2 09/12] arm64: dts: amlogic: s7: Add clk-measure
 controller node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-more-socs-to-support-clk_measure-v2-9-224382a429e8@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789899904; l=725;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=g+jOIpaICoW8GinTHQ5X1UmJpEi/mHf2rXG4N1xQzYo=;
 b=WNuNl46dvYNUPSbmkvaNeDmv+5aas7rex8F4AsX7uFDvgprNI/t8BbpGAVRl/Xt8eYGago6Kq
 I5wgHOkMvPkBI/Vm3syFBtkEKBjLRf/YRkf74RaGD+OPTVT5at+ST6m
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Add the clk-measure controller node for S7 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index a3faf4d188e1..64440df4f542 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -239,6 +239,11 @@ ao-secure@10220 {
 				reg = <0x0 0x10220 0x0 0x140>;
 				amlogic,has-chip-id;
 			};
+
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,s7-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
 		};
 	};
 };

-- 
2.42.0


