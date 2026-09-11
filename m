Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0F745C70F;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115332; cv=none; b=i1AU/ApiGfgDrT4mEoAjvfZqZv8E/uaVRbHTwS4BkQr8u7lVsHG6F+YDVIPjbRTQu/hfja8tbisJlJV5a4vpjG7PQi2Y1zfG/ZH04moM5wQSKsPBBdtyNQnxuUblRe/BY1f5J4psZ1OzUpZZPDphkLXR5CkIwJJqNVvCkh87a4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115332; c=relaxed/simple;
	bh=ASdPmlELWfdb/Y/YJ4rVHsEqniNVnoU71S6yuvMaeDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gcEpps/qgnxUKJuFr3CNh4/61vG1Q2tvIRiEdQuJffNSV17jMiHcLLFEbr5X+uG8MrDVCWx1d1Osp9jSWncJ9ds1yuCglJQy7cOzTKFcZYZumFBeBcrWYE0jTHLQUA/tNWKuEHUU10x3xaf2Qoe+6kbnt79xlfTCyvICFwRCZmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KppIjkc3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KppIjkc3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30936C4AF0D;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789115332;
	bh=ASdPmlELWfdb/Y/YJ4rVHsEqniNVnoU71S6yuvMaeDA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KppIjkc3Ey3qNP05A5ATH37K53I3DnEZ5DU+4A+G07s18UXuk780jHcDYgHixxe09
	 AumAq9BYru8fpRU1AS6JIVu4DN+TnTQqu6zGbBVNErCErZVI7K5+eBB+4y8Um5qgYu
	 AUODr1UJo7jM1d1ibOKJOCagsu0RLVecTSPo9ErhDxuDXHBKV9zpb5FjDtjk/Kd0Oi
	 xG32pQiitQMoePxOOzKs5rJDNXpXMcV638bBJKrVniTKCua6nWuwR6Or+GJyszGOQ2
	 JteDSpECQChX4f1rNnlGSduAWg4JnUpJ9WdFn/Iuq+pA/s7r+2xnba3JHqDMnH7O2V
	 gDUhZOmpJQiYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9AFC88E53;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Sep 2026 16:28:34 +0800
Subject: [PATCH 07/10] arm64: dts: amlogic: s7: Add clk-measure controller
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-more-socs-to-support-clk_measure-v1-7-940e269aa52f@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789115329; l=725;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=g+jOIpaICoW8GinTHQ5X1UmJpEi/mHf2rXG4N1xQzYo=;
 b=jBoQhEkWh+cODoW1/QU+/Cii70cHo4qDdgNTjWFcVZNRN8DquG2R3AjAfd3k2RUObSja2setn
 q3V83Y//pNQB9YOkf87zm3ICaORQYI5UsiSQtmaWTadt5pqCMJM4Tpo
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


