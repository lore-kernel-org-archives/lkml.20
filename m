Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637945;
	b=ZErrC7Wh+q3pdrFRf0d/nN7M3SK+sSAr/FEaOJ6AIP0OHbLEX+IgsL4nXqe2Thvjq3OM
	 rSB19A+XKMA92Bl9jHjKv0ioo1wKKhPZHfEze/PRMAtkWmDwM4H4pa6yTI+FJWPJIYFg4
	 JY8lKxDLkeqzyCxgpUNUb4YkTBF11Qcrd7mucKNqtBzZH0nJPHPIMZO/4+tRpbJHblae1
	 YHl7gcGGea4tmZ8qpsyouIg0nverQzNpEEpaSace+0xK2pJXEzK/rlx49eJxAAuFb4331
	 iOsAnzMgCzx8ftfjapP7lEleBDNwMJSaiMsQPN2N2ZDoURVEk0EFf8ln7tE/RJl76rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XWEwn6v/542iwfySD79nms5PIwynC+fVLbCD6LA4gYs=;
	b=ml4EUkYnlu1MsQ03k74xIKCEMpR2HN7304TGNUudQzkAwC37UV3YVZrPRN71pojlbetj
	 gXDi7dbDj1AFzrvBRcg9p2I/sqQBJlkhdjR4ugSNiPiAqC18Kr2kGMmvbL5P+wxa5cPx+
	 PFluULH3mLhbsoxdnfybDlNNot6I0IFgZTomoV3o2X2pvvtElVOS8hc9gzg48Ashf4r0w
	 fYI9nFqrKNOfai2VnFsL/+wK9wy1xem5EI6DIDpl/4s5wN27hXPsjGAn45KnzPD+se6DO
	 WDS7yi07mkU9jACLzs5dSBgacwFwvLVZfAACGntBBQJkOsL8/Z4W9Oo0Uqid0WVrrHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BRijOCqW;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2111E606A320
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2111E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BRijOCqW
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-35c95a3a303so167374eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792637944; x=1793242744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWEwn6v/542iwfySD79nms5PIwynC+fVLbCD6LA4gYs=;
        b=BRijOCqWNTAQhCurFBM+4UdZQ3pn7848eM7rNcVr2mlVVSEQOwC2dciFrFG7S/RTja
         z1i8J/nd3ZhSAe/ZWHVy7hOKWtVl0KMcI1oBEeNV4dW+6iuecKJD00luv8EnLP7PGl+w
         rbiw4+07ZuXf7btIAcTQg0SXaLuS1qvkRzZX7Huxtu82Uzafl3HswnJCAulsyqkJ8F0/
         +yDopz73Xdvhf7lBaa5h3M+HFiXWiCmjO+WTPVY0BYXM74gYEe8Tz4d0OWdkKkxeBrBT
         N9NV8EpaWMbbZB/Sg/E0tZBOUr36DuAmgh7sJ7MdBFVkofkgI/HB+HFz7PucP8bF2i4K
         FtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637944; x=1793242744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XWEwn6v/542iwfySD79nms5PIwynC+fVLbCD6LA4gYs=;
        b=AlGi2azvQOCVf9MeEku8NKoaVgbX5fzXRYEx6hIAzaVYfpYfXIhgA7Au1AEeIPohdq
         fygZrksjXo3Ym15fNE15KcBOKnc/eyIrIgQtG0MWAR4q0a70u4Kub7uuGHXMqd/IxX+S
         Dn60TjaKA4cdvsWfSDf8myTPTEA+mwLJRRBXl6JhDzriWewZUxgl70kHl2cHkrHc/IhT
         8ZpWiVliF8amfsXzd9mk9EaRH+Jb9yiLxAmwxLd7vtjtDZh0tHxKZb5+gScvNPV5TtXi
         OIK/M4hDfWeJu85ICgEgCOJw/lqP86OXTOB4gja9z6MCWLf1HY+XeM8NmxdVWGDmL+Vh
         ig4g==
X-Forwarded-Encrypted: i=1; AKwUvBxF8baPK76yoHv8mTqmBZPngzJwCoSgsaakyR2yhX4wUPZTm+cc3xzNRdxZ60trGEJLuQYr38L3jD2PEs8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4ULJNU6VdZg/HuWceKD2FIdCUbbAPli/o9aAGau611vZN/fyT
	dc+KHNuCmsJtWiLL1cjo8FiOWqoFGsYdUt5fu4NUq1aNhjykzeH6yWAK
X-Gm-Gg: AYBFou38XtXxgOde8xEaDeOnMvK4ZJo3SvZFK1LtxkO9QO/5mI6R3K75g4xlSk8APtB
	COvK+dREEUKWCMcr/v0LhH0XF4Rxj7Gx2QZx5nCHm9OuImzwISGqCe7JFW2jkXqaLlLnZGZ8Ymu
	re9RLgLurLh8VcmNdJYislWdh8WsK4mzr++6j3M1LlVwFVgpl21FVbcnL1mlSODwxH+iegjqs3T
	ONdHupkw07Ka9JbsgHn4LR/htArD1eK/JaCqFv1yRb8qar4fKIXT+5lastj3UK5B1wz+ZwgwzwW
	7gl0woKEkADzDWC6woyapjXD66EU39tlGVpda0uOOV0Emvgo+WQ1zVDmRwTZqXqrLuVlz89cwdC
	/MHAOZEk3dTM2fh4MiB/C/By+TOr5H3f6NpfiaHiD9HSVh07rwbywHumnqlCs3ccgmAErNFF02y
	pdC5zU2bJ4wagf5bze4xcZgLJFXc/xNbeGnFu3jAEcaZQU2vSkjBy/IifCedTu6KKDsinw6gKMJ
	yoEw9d9pe13XSH5uCJmGUUYsgSAPM5qRrLXipssstNaeQUYKlj8lg==
X-Received: by 2002:a05:7301:2b5:b0:358:c5c9:2661 with SMTP id 5a478bee46e88-368af4a36bcmr1633520eec.10.1792637944031;
        Wed, 21 Oct 2026 19:59:04 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm13029572eec.12.2026.10.21.19.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:59:03 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v11 2/3] arm64: dts: rockchip: rk3568-photonicat: add RGMII PHY LEDs
Date: Thu, 22 Oct 2026 10:58:43 +0800
Message-ID: <20261022025844.150320-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022025844.150320-1-coiaprant@gmail.com>
References: <20261022025844.150320-1-coiaprant@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Motorcomm YT8521SC RGMII PHY on the Ariaboard Photonicat has two
front-panel LEDs wired to it. Describe them in the device tree so that
userspace can control and monitor them through the LED class.

Both LEDs use the "keep" default state, so the PHY's built-in LED
behaviour is preserved until userspace overrides the trigger.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 58c1052ba8ef3..12ae9159bea87 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3568.dtsi"
@@ -350,6 +351,25 @@ rgmii_phy: ethernet-phy@3 {
 		reset-gpios = <&gpio4 RK_PC0 GPIO_ACTIVE_LOW>;
 		rx-internal-delay-ps = <1500>;
 		tx-internal-delay-ps = <1500>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+		};
 	};
 };
 
-- 
2.47.3

