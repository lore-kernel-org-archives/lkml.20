Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE564D7D24
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107496; cv=none; b=FmmTnr57KncnLcB0SXBOYaIzTXzqFLYDVFDKKxRpHZjdy9OcA9gPf9t2emcAlGo/HaNkKEWSQYolidwvay4bWc0HuFzOs4Isd+/igBHkqBa/Op88bQr0VkzeYpKry7W5GHkEUKXXdYybXJwstdlwPpVx4LrBKWuuS46ud7OdH/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107496; c=relaxed/simple;
	bh=Vpg12s5aCfYhqiZT0MliutjEHvX20bbyVe8NFEbpumw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k/K48z8l5p+ORI8/fHvSbz2yvweXDuksUy33UCdXhIifqRd8cxFbe1nR/wtsWjjw2kpmFj06eGYXJ28zI/YnnktneT2HYNImdF+A9qqp+thfXIw/fZsL8ThJA2t1ujZZPMde01O9c7WKkKVgJmSphH+1Ih9TErI95LPd1D5AWI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W1xiJ9KJ; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1xiJ9KJ"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d942de6574so990815ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790107489; x=1790712289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=W1xiJ9KJ4RWZ1iletsqCG6k9ZncFdwx37U+P0w1fFrMrWnw/4I9t/bQPpxy9gcQkWU
         G85wNCVv2ly5C5vc+utUv9IXzmdKs0XhDlbNPQ2U4MgclAkxsAq2cyBVTjIxg4B9cOpL
         mLtY8MNfe9iSl5Z5hL5lyW6cuK4o3Wwu6t/3cFmBS30UxQE/c//RIfwl9dNqlND60Yec
         eu+sj8j1tnWalosiHA5kjcaYNOGmYmYnkm2D2M0ebelE7z9uYuu/59jwCQjnt+sGUONH
         nQ9ZOT7mAprdAq/O9uRfwjUTyTzvXcYqxLoX0tjeUHHV4gE6X2/qgT71NGichSH6SbkH
         Bd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107489; x=1790712289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=NIV2pbBs8nBmM9AjYwmoOD+6V+1srZ2kiVgPnMTwTEGO5AF4bi1Iw4so4Enwd1H4zD
         vFjQSZ0vIAI0RlDfKLAvQQDxvmFxjDKHczZB7GuQIhjvR780XVZEOu9bRrIjbA/c1uAW
         BW0z7pZAYsX/wPFW+V8kLIkqpF7shxlRm14gw5C3CF+P2JSNL2M9s/jyPJch0p9AyWs+
         cN+EmPgS+h+lFYyTkqtPVHpldxfZKRixuJaWcxv42bWLgXNUtz1OdpXlG/adImg4pZ7M
         wDTqSxGDHoV8J64oNRxKGM2ZQ/iddQhsZTC3N/vrjehOH1CDB/p8/ujXqFfrEXCrLmYI
         Rr2A==
X-Forwarded-Encrypted: i=1; AKwUvBxGyhRBQFgcm7kV3pTMmIju9gUdsRhmn+WREio5BIdoKR7wRMUNNMXC7Elhx14W/C6TSdbnOhC5cXWPYIo=@vger.kernel.org
X-Gm-Message-State: AFuF++lJBfAKNNbwKQAlyqBQRMiB+n2L07OymBWCc18Qy9RQSSs3CRnt
	gwol2mZQjDYOQVioppT6haetlaDcniINRWOVQ+vnjmhCv0jQ3B0P+1Rk
X-Gm-Gg: AYBFou3Ft4aJdF3dwvLIJJ9IaHSaklZOFV6rVp+4ErroktRCIkV4+qWiQNP0oJFJjmo
	Ek3lG3ozU4tj580xxvNeosg/snGRmpLzk89UUj3VqpycBqz1QXvS+xJkr9TguZGgiwXAIffJA6l
	Dgz6PEfECyj2jlVnpiKjd76wyIkLPc35oPQRr7VislQa/0KLRFI3mBaTJWhxiwJnAV2JCa3fYnb
	wwAtyQu4ByEgqeaBXAR4nhQOtcuqHIDc2Q6OsQNHI2lTX7clYfH8FNRBGVxAe73lIG05Hz+LdOH
	1AuL/IIihscuAoO8K8I6dXyDJRBoFJ/t6uWOdhfVSZpgyAclO0PIZsqWZQRAZgb+F207jt4JBNd
	oDOiClRwWVo4mPtZXpN0KsC39O3v1Q+Hox5+N2Dqa8EfGEFz3SBdJKiAmIBdW3jbOoAcBZu7mLa
	ihUMtdztvt+FHYrnDuH9qDFeBIZ9bmTjV4nwPKvholALmKUsLFuizfh0ngFLdkCGKNcCOG
X-Received: by 2002:a17:903:1a86:b0:2d9:520c:38e7 with SMTP id d9443c01a7336-2df69d1b106mr4415425ad.1.1790107488984;
        Tue, 22 Sep 2026 13:04:48 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5eea15sm654515ad.64.2026.09.22.13.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:04:48 -0700 (PDT)
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
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v10 08/11] dt-bindings: net: rockchip-dwmac: document pcs-handle
Date: Wed, 23 Sep 2026 04:03:32 +0800
Message-ID: <20260922200336.2201212-9-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922200336.2201212-1-coiaprant@gmail.com>
References: <20260922200336.2201212-1-coiaprant@gmail.com>
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

