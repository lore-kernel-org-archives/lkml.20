Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAB13EFFDB
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789822371; cv=none; b=qlKXr5qNvcoV29iid3g/Gvh2CYwNv8eqgLuW9WTfiUm5EtYv+si2BpislHti/fm0raW7yTcTjyqWfbCwo2e/sqD76frXFCT3WxLRYtDs1YZR8AjrDfbLS84qFpbQ1DAy3Y3mWW3L0zdko2jF7+sMnBA9SVh22JA2zBvmmEY5akI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789822371; c=relaxed/simple;
	bh=Vpg12s5aCfYhqiZT0MliutjEHvX20bbyVe8NFEbpumw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U9Bq8BmXfG09922qUHQvNQVmdko7wV3hRxBICn0/NiWyzs1zh9brFV+XGGdv2T+MQV12KYbjfxD+oMNcqMt2fJraDDX15zhFN8gieUwpIvdfKFTLcaFo1ZvVkyr8ihRLMb9vTj2YtBHV9r3302IQqncsMDEilonpPRKtzAVkWPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVVXWk06; arc=none smtp.client-ip=74.125.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVVXWk06"
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cc1631a57d2so1062715a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789822369; x=1790427169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=YVVXWk06leO9wt4anGPX3PP3rdKwm8wO6H32qzeMRv1RLuJt4aRTIwZHx5dRSo5n47
         d6fkwSAL9Tsd1es09WuYwLl4JAnwRZLN1vhu4UWnCmh4Jl6qcYMcSV/yWgg/VwMSu5v9
         7FfZ+yojzRH+wCS0hQxZ22q8podyal0ZYHiNpxHo2foCfp8b+Tz4FNrbMciDabkxo2Tl
         ey8BjChT8lTEPoXLnbe0uji6Pn7L83dlW16zOHPMW/jTfRkYouDFxck22yvQit+Gsoc4
         ZvWCIklcb0+c3fe6QbZTGQqaFjqNjUSaYa31gEM0Bi+kYJr6cmYY9YeDudsASiDgtfT0
         hzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789822369; x=1790427169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=yEIwMNbZMTJ1tFhNawn8EvV267+BuXP4JPIg2k2hzi0/+cMeHFzj7uxuUUysaRrjGj
         sZspZcNDuWKYjjFgfVHBxLtCjyG3SZEjOOd7EtCuoFN3Mh70m446To0iBpgKPpmd/5ab
         81ol9ZU+QfG+HGCzUc0myzZmB10af8+OUNBXIiLSmPtmwZwPAp92LWpJiYxPgwUTUOVF
         gD6gMhxdAXpYq8Jg1+nmShEw/iStErkMk66cNWpKRYgTv2/k0rQOlW+OSCEV5uGCbm75
         VbOlz032//wW2J/4Jzz+DRpDYQjEDpqyjLhefcgnvAChr+fl1SCvFJWDRvkZ2Mupeeq3
         i3rQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBQ9x5XxoNv5N+XRit106VITOHybZc2R9jiFZ9Sgqob9K0J24aAbs0iL+Ob6REmUUYvHw2mTc80ZJTOmM=@vger.kernel.org
X-Gm-Message-State: AFuF++lUjjm5FMTU0ez9EXzxRxv5h0ye6rBxgNPAHN1pVlzGaWzeBpkm
	oJqQF6AZGevO0+krIQjSLic8AOxDVtjzDua8IaAUcxbln7lGskyjbmHb
X-Gm-Gg: AYBFou0LT+a5vNEkhZhAm/kjcgtukBfpSLp6sv7cpAL38m8GkuqcmXckkaZY9qPYDw6
	4N6M77qkS/qybGhtkY26ofWKA9StbFj4GiZPs4E/Gr14lCvauSKh55qJpt0nnzBCsjxgFPeYZnz
	mLCMmSXvk0NJwChOBuJ64ZjU4YLeLTOw41d1uopybKKZ7X9Kmoy3RpCVJiHsFnZlWRVXMxgJHeo
	331QdqT71kkwoc9Cc8aeGG0rzOaGgS+xvjDJkncXWy5Eao8AaKcbTSA2g1iz/mS4m4tyraEw5Aw
	1kyPQDkVp8e785ES3Z01nsfFtyJwZ+YkB5cFZFHSNbsTvq55/ZS54JNLQ32pxXnbjBEs/ZbnP2t
	BuLaJYDzz41H4vP5Ko1rnHGUGJl6Book5LtpKyGcS2CXcVD9XYtK9/Qhwj92IERmK+JtVUYr1tC
	/jEwPefUbSizXM0JfdPKzHa6XY4C7cZIIzxzXLAxftVccxVpsamGRL3VQQQ0S/lcH2797jDQ/0O
	AzwVMDR
X-Received: by 2002:a05:6a00:2990:b0:869:9298:ba59 with SMTP id d2e1a72fcca58-874d84a6257mr9842225b3a.0.1789822368852;
        Sat, 19 Sep 2026 05:52:48 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa0026b2sm991805b3a.44.2026.09.19.05.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:52:48 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v8 08/11] dt-bindings: net: rockchip-dwmac: document pcs-handle
Date: Sat, 19 Sep 2026 20:51:15 +0800
Message-ID: <20260919125119.2107089-9-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919125119.2107089-1-coiaprant@gmail.com>
References: <20260919125119.2107089-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rockchip GMAC binding needs to describe the PCS reference used by
the SGMII support added later in this series. The property will be
parsed by rk_pcs_init(), and a missing phandle fails the probe. Add it
and require it when phy-mode is "sgmii" on rockchip,rk3568-gmac, the
only SoC in this binding that has SGMII support.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/net/rockchip-dwmac.yaml           | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845349c..bb7540e838033 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -120,6 +120,12 @@ properties:
     maximum: 0x7F
     default: 0x10
 
+  pcs-handle:
+    description:
+      Specifies a reference to a node representing the PCS device
+      connected to this GMAC. Required when phy-mode is "sgmii".
+    maxItems: 1
+
   phy-supply:
     description: PHY regulator
 
@@ -159,6 +165,18 @@ allOf:
         clocks:
           minItems: 5
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-gmac
+        phy-mode:
+          contains:
+            const: sgmii
+    then:
+      required:
+        - pcs-handle
+
 unevaluatedProperties: false
 
 examples:
-- 
2.47.3

