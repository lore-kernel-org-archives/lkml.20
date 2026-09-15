Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6095A4A5EA6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475924; cv=none; b=j8OZdTN/SqnocW1p83Y7rD7OxAWX/6Bmusml6LeqVDeFbnOxZZTPtq8evpIf9QsxPKQ63l9EOa54O56/EwAHf84kzsOEHVLNxnw5vHxSFHDu0EMMh2YPzfNPGZs9mk15aqsBlWvbMsMPIMF8jTE+wGpuLx9Pt0nImTTbHPKUvWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475924; c=relaxed/simple;
	bh=RQ8/bIf5S9U/FiX3uQoU1u6/FV6K7LLD2uqZys3J7EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=moERxPLrZ8E7p3SUnLDHYWzhRmFav+TqHdmbOiXR7IvBsKjjIBW84WDcGQRLurNiukj1u0f/a5aPKdR4CcTzJMUF6SKuEDOGAxLp+3yGqEZW9UcVRZ7+uTSJjbtDVg28aW+AJYdslGf2Nr9vNI2wv+Toet/jiQaXyGTYvCAmlds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4ePi6Ei; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4ePi6Ei"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-398a384b5f7so2726482a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475922; x=1790080722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=i4ePi6EiZuKQIKno6E8Jy0usm57JUwIpAqrAkdK5SWf6wvvcvtAeusOc0VU93rpfmW
         jHgyG5bgqlgYPfjLDrzpODNzPorX/r4A+RiBNaMR+JprP+ortEEhCnrnkvtt0Lbf5FcR
         pbKGpX7XeGiiPwGsuu+3+vLhNaYy/pKzgF0JG79FSKuKwRRGZixtJ4A3x/8kZiXbKLCf
         GADU5b9YOdKhQC9xpahqDjIrTdRQNBsGYedp1r4w9I0gcjaje1Nywu03mYJLEOGAjqHy
         WGoLBwy6O3nn8/7gHPDwnW9i1VnUERfQkao7FZEDlvY4jN1Le2HNwmcMUGfXorMmSxf/
         hZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475922; x=1790080722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=tURgSMuS6m4zyMLeeAcNzt6PCDP1G5jn6NmXas7ObB38RprHtrsAU/3g1KAhW+WBVg
         FSie4bguPnQVZ1z9dtER08i/eyEH5df56bgZ4A5WxR7dJrHXezOO2Qlj8MExTYlUAosG
         rtex38LNk5QSQX++OyhMWuWYEWRUq+rxAKoNcclcvqZng+JOz4gW46B4YRPK8xd/R5ss
         77CUBPSEVIfhP0miSlcHYbOr6XFXKeq/Dx4EMb75b01gXXGDNdd47QZetyyj2wlugICZ
         nMwx1HSG6Mf7Toeq5v0gnqzY3w/QFYPF8fpQLabazzGmmU0Sb4q6u5VSVKKNLtEE/AL8
         OWgQ==
X-Forwarded-Encrypted: i=1; AKwUvByHVaJI5MZ0Czq1CpG+I+0hJ94ScAha0IDj3Yp0+BOvse7f8WzPhp6kuTQB3Uv5FV1XBjBJovBJwxcyfbc=@vger.kernel.org
X-Gm-Message-State: AFuF++ncqRWlJ7I6ZJEnvmqEbaLeQdMn/HDSzByKAEN7ZI6E9HanxfOp
	+eLm8B1KHYif9aSOiJunf+Cvnpm9YCTvq7K5mfKlNOBxQ6UvvM6ESTkd
X-Gm-Gg: AYBFou0/NqmF0KM4sRAq99dJC4EuLc6b33GuVeHOTaxAM+FyeR5bTqJmuHrD0rLA6VK
	5FY0dK7pLWocZ4byla4vrybSE8KaDJj4N+OuqhpwVSfOMHW29Nq/ubLH0tB0SNMOkWMteBjzitU
	6ex0k6Bb5lp/gcZZaPuSIgHNa2xaSvTmCJra+xAbMNuiowc/DJRa6UcjjMjhoc7e4rEp9+vNQnJ
	0PuRGq31eWGFuVzJpzIuYFp7M/hwm4QijISow6k7GWOOVCsL8I+hVkUyCt7cH3AuAsXW4VJS9SI
	u9yoeTijo5yX3E3+9LcdJtmPmdPnbnyBlhis4LbFZYMMMwqgxd3sRdzAc3mojQ3cdTixpCL7Gqx
	c1uYRQQfRRBQ6sreTdupG2dkiCg2+NjpXKyavwdHBVXcNyOW0WkRiSl0aKFIB2SSXRoFhMaUpj/
	1EfKDrWwE8HNl4HR9L0a54WQaEQbAOerF5Zj3mVuIUN/RsPMaCP/pWwiG6ivretZw1JDGPRt9pB
	nOOtR1H
X-Received: by 2002:a17:90b:39cc:b0:39d:e54c:8658 with SMTP id 98e67ed59e1d1-39debf547abmr16493286a91.5.1789475921598;
        Tue, 15 Sep 2026 05:38:41 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm5307259a91.10.2026.09.15.05.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:40 -0700 (PDT)
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
Subject: [PATCH net-next v6 02/11] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Tue, 15 Sep 2026 20:37:51 +0800
Message-ID: <20260915123802.1561724-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915123802.1561724-1-coiaprant@gmail.com>
References: <20260915123802.1561724-1-coiaprant@gmail.com>
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

