Received: from mail-pz2-f6.google.com (mail-pz2-f6.google.com [74.125.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723B04A0EF7
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791304106; cv=none; b=AiA1NxoKz1Gj14TfnLeF0wJJx8FnTzlvoNOOQw4cRoesWmWc4XaFI4+ihIzyNQGReIpIWXPRFzq/MfPm0AQBjmLUhv3sBekg4M0rdUnOO5WA0pY0HXG8aStjUsS/ju4Hgzp3OpKn+xftgnGY0AqZMloFgBsRdayW5sJkgUgiilc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791304106; c=relaxed/simple;
	bh=sDHHRO7gl8RoIlz2pzAIq0tYPtlBsoMIZAAmczwB9VE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bvRidfvftG3SbpnY94dQZheN7530lwU2xwywFtT15QTG0o9xSkLOwwk5dDy3mAdDMh7Q9FIpQuhUHc5o2pP8XpcQtpinc3RtB4yIzo9ryRf1jw2xvwN9Eo4pmPLPk5MwkNkKyx3wf2nndPXyH67GHYc27buXVcTMhE7QVreCT40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVTev3jY; arc=none smtp.client-ip=74.125.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVTev3jY"
Received: by mail-pz2-f6.google.com with SMTP id 41be03b00d2f7-cc76339233eso99845a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791304103; x=1791908903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q02YVAiwMG2tOYv3d1XG68tLbO2rAHXBUJNR5QhKuw0=;
        b=DVTev3jYPm+IGGwyg73Y7cMFwn8Lv1iJrGZEFLa/mSRloTWVdBw18FVvd96NF0r1tt
         1g89wqgO340g6T/xQGBbQ/xP9b9FpbzVZhZ+puIlmLlCBDtsoItXg6l6bSu/YF6vAcq5
         bibH3oApYdoWzIbNz8hyffU8WgdwZzoF+n2ic7ALR3+cKTUp1SWMy9NDZ0Ft7D81wnPd
         vv3lMlqt25Ryx+lxjK1auiYU/fDB/EmMKWZRPTyM7lDaZ3UIS7bO8ACuZBD2UvWMl92Y
         smtDMBtVOEqRr2PjkRNwa8ttmxH26063agYYi+1MNPSQ27dHn+hmAJ9PifpO+Gf0kk+T
         QoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304104; x=1791908904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q02YVAiwMG2tOYv3d1XG68tLbO2rAHXBUJNR5QhKuw0=;
        b=swrzYwK4+g61E8quN9F2ziUJJT1R2i12sBha5VLdyBaJaGgfjQ7Bz2/PjY2fiRcGHS
         kTsh4WyunPGVoCpY8awSLnIkRWcEzmEwNHP5bX0Auf8ubAatMc8nM5cZ9poLZ1zE/ey7
         6NGxADBW7262wceEjxVOjEO1SyhAyZorcxmRkE2n44CBlxIy5Sub2BzHJb6z4RmaTeig
         K/Uv5cgUoeTC+Wwz5+tyo3kYw/r2AJfDeSo15fauiwc6gkWOlrLc4kAfLaqi/HWg4c2c
         KAEDqNwvrgEVjkDsGDZWHMZWA+xexx5xOOje4zHngk17MWQ1x39tn/hoh9l1FukL4bfT
         8aaA==
X-Forwarded-Encrypted: i=1; AKwUvBzimXju5XSGuYulM4EohgaKctr7T6KfNQ5Kzwcrgus2/+BSgGNoRqjnnhjJ2Lcqf9B4GXw+pgxbCILG/U4=@vger.kernel.org
X-Gm-Message-State: AFuF++lV531cm/T7rAqC3e77k14/J4wHNGhDKDE5TscWxmB2hamQ7psA
	vk1rrHSfsHlAPxqmXh76ZHlFgx/ZeVOKzFjWzI+Ac2dw2qNy1B0Yg5Cz
X-Gm-Gg: AYBFou16B9ba/fj71hp3RMmMIrcD+7vKv0yLf/LhHg6QAWEY15PfgrGq5uPH5N+PcvJ
	sQi+SaPrExzPCebYsJ2G8JNaHXqdNv6FyX5938GnKTcYkWG5CenTlAe4cuy4jxxzPf2qsRT5zro
	sOlvEPGU3urnetUKdv5P3Zv/jCKefZKu+Udeu7/1dvFotKLgc4ow6MkgBGT5S/OdPBEgrMMBtJA
	y+c6277CtzISxf5ft75aelMvB2siYgaQtVY5mJNuapZhKs4/hGe4/wbWXtOQvtqxEiatdCiQVlt
	K9pmhDAavYjgJd/EJVLRrnZq2Gc/qvScArnGLINc8SOJezHgVf5JNRKE8pLs1WVUDk1BmfBGBNU
	3rnQlgXNA/eJ+b6qo3Z4L5kx93ucYz6QgfflDOQWUza7TFGQap2lVP2Le+QJgXmlH2mRsH9Arve
	lYxspcHtdRxLXiEyDniLXU67yUJB9e/OxohWJYGG/WfYeUQ9ajaWpiXRzaiVaFISzBTVhw
X-Received: by 2002:aa7:88c1:0:b0:88d:8074:1a8f with SMTP id d2e1a72fcca58-890ddd021d9mr1195882b3a.7.1791304103604;
        Tue, 06 Oct 2026 09:28:23 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89188a0d603sm259898b3a.19.2026.10.06.09.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:28:22 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v13 1/2] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Wed,  7 Oct 2026 00:28:05 +0800
Message-ID: <20261006162807.2843858-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162807.2843858-1-coiaprant@gmail.com>
References: <20261006162807.2843858-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On RK3568, the SGMII interface can be routed to either GMAC0 or
GMAC1 via the pipe_sgmii_mac_sel bit in the pipe GRF registers.

Add the optional "rockchip,sgmii-mac-sel" property to allow the
device tree to select which GMAC controller is used for SGMII.

The property takes a value of 0 (GMAC0) or 1 (GMAC1). The hardware
reset value is 1 (GMAC1), but this can be overridden by setting the
property to 0 for boards where SGMII is connected to GMAC0.

If this property is absent, the driver leaves the routing unchanged.

This is necessary for boards such as the Ariaboard Photonicat, where
the SGMII interface is connected to GMAC0 and needs to be explicitly
configured.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/phy/phy-rockchip-naneng-combphy.yaml   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 379b08bd9e97a..442a1df193ad2 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -80,6 +80,15 @@ properties:
     description:
       Some additional pipe settings are accessed through GRF regs.
 
+  rockchip,sgmii-mac-sel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description:
+      Select gmac0 or gmac1 to be used as SGMII controller.
+      Set this to 0 to route SGMII to GMAC0.
+      Set this to 1 to route SGMII to GMAC1.
+      If this property is absent, the driver leaves the routing unchanged.
+
   "#phy-cells":
     const: 1
 
@@ -105,6 +114,10 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+        rockchip,sgmii-mac-sel: true
+    else:
+      properties:
+        rockchip,sgmii-mac-sel: false
   - if:
       properties:
         compatible:
-- 
2.47.3

