Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF51B4A1DED;
	Tue, 15 Sep 2026 13:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480209; cv=none; b=niKYcVVcANuoYPuQBZHqd7FxudpU9c8/E9Wd/tfArQTtl0SugYYXwz6ETZC9Pk6G/E6ubLT/mkteiy1an6e36CqynailxcY1i8M9r0S7U4mnNr6MWG8kBZGoWD4nzZrC0UnTDSeKmazuctuwGRJop4ZQAmrWYtWt+WaH0+lRiMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480209; c=relaxed/simple;
	bh=9VMQh39CWRjHT3gfwr1EesYUI9gwspmu8UF0atDN+3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GFfP8rq6ul87ZCm+xigswow9ks7di5IKkign1rmjqLrNXNLyPxuCFReKF9LjYkeZf0VL7N+nGiYrTTobxYdjN/jTKl1CvCLc7S8dwXbA7vgaltnVFZos3GCExJSdBYrqnQeA6YH23Yx2dpVHkkRkTj0e2IqLCaNsDFwvxZUd6go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=atbBGLW1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="atbBGLW1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480199;
	bh=9VMQh39CWRjHT3gfwr1EesYUI9gwspmu8UF0atDN+3c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=atbBGLW1t4S36gylapB2P2U6aILW7hv77CwOVYl0htHMy5aAfwAmQLCj4Uk1lDrqc
	 6fEkzW8adbfMdtRsKZ1ix4daOeynfAxtFNXZzRFfztqVstPNUtTL7AuqbRsFjsXi1r
	 dRkP0gWtfpOod0XsirxdAofhlTgl+IGlMK5y+7Wc0CfXHqImOzrhL5XSrZLWfBjIO3
	 RFElF4crcVM7hJYIt8+oI0zCR1GpgnMSaHFyz4llxumIbmhqhFSHkpJKJF2dh9hD4H
	 r74oMp1vL19pgqmfuDy+6Jwz1+k6hWlur7t4Ac0HjheMi12FXXGF1cpMMzhZXlRxbC
	 ApdljWPSaAu8w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0650817E0E71;
	Tue, 15 Sep 2026 15:49:59 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3FC2B480055; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:50:01 +0200
Subject: [PATCH v15 14/16] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-14-80e2c11d1ce8@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1614;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=9VMQh39CWRjHT3gfwr1EesYUI9gwspmu8UF0atDN+3c=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpTQYznBMDL+f0+xGlt5Gypk8LaeHM/t2WF
 Uf9FQw1hlZ4TokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0GAAoJENju1/PI
 O/qaQUAP/2+pgTDfnaN04Meq97fi3/xKN78cLmIA7pRVhe50d1hY5kxyy2i12qVfAA4NUv2/F/E
 XDYBIDv2/IfYxxqDUh0SUkwYJLMKo9X9pA/rLEzDFX9GoslqYC+QuLb/VBN6AJahH9/D+9YhFon
 xyt5bQZNGyMy3yjUwu9esnAn2PkjQmf8xLTQlWndQy/eY2XS6rj5CE6x0gu7i7mECe6NkZMz8dP
 /feKWnEFa6VH6ArNCFROAg+PPKfqex6x1B6AIlF5nl2djmk3953f6aZe5FgUU4E/ebZqgcm7baV
 2nrGLCJOxuBBXQYtTbxsNPfrOgLGVU5TKwYpVVHS9wgaMqdDHfJiEFuOuXra6PgFiNQV8EnHi1Z
 SIKeWknkrQXFmLrDIjUBGNHEnX2jaDNOXIIeLKFj7oVTlRMKNm+foPxktZWtcWMTic4OFpxfnxQ
 H02Li3Q/Pb+c3RNjzaTQHWknhAB/jSt4GDTRuFhFNt/lycGScIITI7O92Y3c+2DGMaGp7hQcKu2
 i5O7VCkjwd+E/kf5WnfxbYUMKQfFJNjgItbT9986wENyxXdql/9evSnoAd9qR/lKCfs4XOmEnTR
 FERlxnk9OemE3WLVDS+6p3lJYJi8Xyicp0PIqAP5MQEbAVT1gbRhsrN4G4uOLNTZEVO5qMnM4bz
 56ARRD+BSHebhHrrOtlwrYg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Cleanup code by replacing open-coded version of FIELD_PREP_WM16_CONST
with the existing helper macro.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 9dae41239e48..d95a44835caf 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
+#include <linux/hw_bitfield.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -74,7 +75,6 @@
 #define TRSV_LN2_MON_RX_CDR_DONE_OFFSET		0x1b84	/* trsv_reg06E1 */
 #define TRSV_LN2_MON_RX_CDR_LOCK_DONE		BIT(0)
 
-#define BIT_WRITEABLE_SHIFT			16
 #define PHY_AUX_DP_DATA_POL_NORMAL		0
 #define PHY_AUX_DP_DATA_POL_INVERT		1
 #define PHY_LANE_MUX_USB			0
@@ -103,8 +103,8 @@ struct rk_udphy_grf_reg {
 #define _RK_UDPHY_GEN_GRF_REG(offset, mask, disable, enable) \
 {\
 	offset, \
-	FIELD_PREP_CONST(mask, disable) | (mask << BIT_WRITEABLE_SHIFT), \
-	FIELD_PREP_CONST(mask, enable) | (mask << BIT_WRITEABLE_SHIFT), \
+	FIELD_PREP_WM16_CONST(mask, disable), \
+	FIELD_PREP_WM16_CONST(mask, enable), \
 }
 
 #define RK_UDPHY_GEN_GRF_REG(offset, bitend, bitstart, disable, enable) \

-- 
2.53.0

