Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957B93B4EB3
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791272930; cv=none; b=MyLExeBR1zgz2Sb067EQelzJbW9F66U7KqRwrrvltLYNHliwU6uIwIeIG1T6LdF9si9RAW7newBLPN1gTPO4UXAzFTMh0fqdGCSWiDbzUn4A7ReW4GahDxeJb3zGa2QJxXNRpaaZNN4Kw6pbz3WUzQWLKTYiEjK/1EGAWH+7g0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791272930; c=relaxed/simple;
	bh=RQ8/bIf5S9U/FiX3uQoU1u6/FV6K7LLD2uqZys3J7EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TnLGH1NqZqzwXURnwAOBpAyMQQ2a7KJN47lAbj9hLigFS/LUs5gErJhI+RGQHJgwhO7bIvQlwbJG9RQKkIjhIZeeV4O69LksqExNIoaITGQ9nnCE6BiaKVe0FLQIuLFz2wcGg1grH49i7BohZGZN3fmxH9Vx6nTaJxcxPH8er04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2IH+AMs; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2IH+AMs"
Received: by mail-pj2-f0.google.com with SMTP id d9443c01a7336-2e13013f1ceso5399915ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791272929; x=1791877729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=b2IH+AMsw19eZFaM6fD8gX2FEse8knHqogP2lSXHE9tuqBL2Va2I1YFh8BY4BTQvbX
         HjivTQpTANv71Ks/RlaulzJORLe2IMe6y/Vj3BwRSHsUr1TtIoCL8kL4sGEwi38B7NtQ
         85et5COVNSL8CY06jhvs3v+Qv8758bhteFODvaEB1rIhJuMRza4zruAw4TyrhTyqIXra
         lctQTQRwyJa3cqr7aU/1Lcf/yZrMpJjs6eX8oq/xznOoMjhl9dCOMzoFY20uQT4NDC1x
         ZZkMT2FWBk8PM4+Z39vG01D7clekDXcpDngsAQ1Y5H725V/SgOUsdZzrT7M7Jj0Beo81
         BKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791272929; x=1791877729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=BbxkKHSq8TZqVPsd512stor1SUyYW3ztuSkBg6d3Awz/HNwF0qiBpQXcnk/g8GCk5l
         lL/F8lFMexG86fw5DKIMoDvjEltt/MhuihpjdouC7ztBiKRQAJ+yqcr16TldMVcpDrQs
         jTdZ4C/W/fMZxb/xC+Wp3i8IkNYtvw0ASJYr0pMIMvvfaf6n3sK41akAsUtVWyEJgSQU
         S0VKjJwhgAbl3G7T7uVH3kkgDBPvfl9ah+5uy0OZ9FUWZDtLyvktDz5Ego5XK9Nbel4T
         NPtisLanQsBVJ/TYjXWEMFqphYUKxAVXhNAtyP0iJPa4bYTD0DqhfKn1Go2E0wf7j73x
         VEcw==
X-Forwarded-Encrypted: i=1; AKwUvBybaqVfTu4WKmmovWf9XXqZs79VT+9eaigh2XCMJ7T+oZaC6ae2mNCaqLDE3T2H2fWmRQYex4wog8B5eRw=@vger.kernel.org
X-Gm-Message-State: AFuF++mYMw04D9JfYiUVSprWdxE4BxrLvl3SvBR8B1mVxJxVIBqjcWKI
	UYynnATBFu9ZkorNvoU/Ej1SQwXwvmEfvv38OOjilELzoovwnf5QOKbS
X-Gm-Gg: AYBFou0MYgeBrUTlPe8tOKr+b7cQFQS4BpARTAjkkEc6J4sUHc874M1j6KVcUk4nM/v
	xx5EkA3fCgp3+bK0WNxL9QU+R9ie3W639FtQbo15J6Ub7Bp62KbKQGntdDtUY+XC0vFGezXOC6n
	6VRh9oSKjaWztuwwepdor5awgr3ncbIcfvwDeHigI39FlyyafrbvG8kWEn9p0xLpmqBKHrKmoF8
	Kke47lL+qq+kK0eaWX0c2zpctuBE4mkYJ2pxu4wDXxvjxjNfmsS8Qmzx1043oT56zKGidFCWJdl
	Vv1SUyGYySqRtSyubDAonBxqBnwV/hrE0PnZANcerrce9HqnCVi4vqq5roSWXyCSXF7l2NMH/YP
	BeHGEurskMZpyWcExywwNzXBfFzEwAeF8do0AamrXIy4D1QjdlIShQiH6hpk9U+2kFlygX0Ws40
	VHUv5Jn5jpOAi4qY/wQCO5wUp4U/fLqdIzMAJEaWsN1GSkYtHsQFBCbfwsJ/lV5rC00+G1
X-Received: by 2002:a05:6a21:6b01:b0:3e1:1689:1ebd with SMTP id adf61e73a8af0-3e12485fceamr550520637.49.1791272928795;
        Tue, 06 Oct 2026 00:48:48 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d2406b1sm1998173a12.8.2026.10.06.00.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:48:48 -0700 (PDT)
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
Subject: [PATCH v12 1/2] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Tue,  6 Oct 2026 15:47:48 +0800
Message-ID: <20261006074749.2010233-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006074749.2010233-1-coiaprant@gmail.com>
References: <20261006074749.2010233-1-coiaprant@gmail.com>
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

This is necessary for boards such as the Ariaboard Photonicat, where
the SGMII interface is connected to GMAC0 and needs to be explicitly
configured.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/phy/phy-rockchip-naneng-combphy.yaml   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 379b08bd9e97a..8e898bce9af73 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -80,6 +80,15 @@ properties:
     description:
       Some additional pipe settings are accessed through GRF regs.
 
+  rockchip,sgmii-mac-sel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 1
+    description:
+      Select gmac0 or gmac1 to be used as SGMII controller.
+      The hardware reset value is GMAC1 (1). Set this to 0 to route
+      SGMII to GMAC0.
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

