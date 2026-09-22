Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A6F4AB1D5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107457; cv=none; b=SAgy2xGpTaJG31D67/CVD1f03Cu3mBGXCdAkWo2saPN1DHz5QzcJO/8UTnrX8J4WWrKg5U1xQSL6HxoU7xyhKa6hoA/6d/3WD45uCCaQQGEr2Vy9uX/S7MF985wl2vtXCg5g0O3haygAOFkB9CyzfkZoreZ8RIKikqHu+w7NVXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107457; c=relaxed/simple;
	bh=RQ8/bIf5S9U/FiX3uQoU1u6/FV6K7LLD2uqZys3J7EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOMO250Yi22RJwqJdd4+3A82sl9sl6EOc8yFJhn1qjpnzgat35tgQuaAN6EPoGDQV+RQmTUePTD0iOuGfWwpU9nc8VwpO4rDlpK69ApaDq/Vu+y8e8Ym+IhP35IppCjGK6vEwxubjfjGLCRPbmpkKufziOrQYc06IuyETlzaYNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7aTeVc/; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7aTeVc/"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d952ac253dso1213315ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790107443; x=1790712243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=d7aTeVc/rk4js/lhi6D2RU1PbGqx6YqBvY1FyIV+qBrBrNci13RLNSCH6AAxKUfcYu
         eYlZSXIjycIoUCL9bVE6qk235DIIXtBYJbkbVXKQS/60OX5eeUbHhI6OZTs/MCxEMAcy
         plpBCqvGEmu9Aq8IzAG4RW1eJVxAUvfdoF74lfQvvSFZ8oSz8VeQ5RLGqub75CJ0dnDr
         Z8RkzeRFwgiuxVwSWhnadv2HGkzyI7c2x1bHWRWfiFlT/osiGJLOrCyhKxlyv1w8E3FT
         vguKvMyZrVMnBVDOk6UoW95lgEN8v9eRkLffkrzVt033KdumaYvTD2YgdJ7xvYqAPYT8
         p7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107443; x=1790712243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=lRBwRlYMRCHhQ67bUtqQwAl7GEwmitpD8jv4c686BCtvVf8Xpm3ASx7VR29AKtSBgy
         SPHvwiUV4sJBKRsGCwJRhZpGV5VWyIIXQ8bH2PYNuNGlIDtV0rrxObcdSEVw3tr7NZHZ
         HFNfj1HcW6sDQYCzPG6yad655TcoUH6cZmKvXx8aMWUx4DCQzJqyIxXrQFGkdobvbUKQ
         ywcFwRaWr69mYSS/WIzTJBVFtsjjoPVUgPgzy8LAcqAViWqbCIQYCbSPJmp42/M5pFFz
         bEV+FMeVNW0OKRVelVLBzPz9bq6PmPpngGP95bvl7x7CAnZyWuxRhTiYdjQ3U0MtBLSN
         1o9w==
X-Forwarded-Encrypted: i=1; AKwUvBx34UeecqsPdmPgsv8mG646FgLzj8K4GRWf8vg3X8bYlStDu7F3mXqcmgSA0HDxnmtDztDJCeeseIGUSI8=@vger.kernel.org
X-Gm-Message-State: AFuF++lphthBFXpN/pmr7SW6oLVlMxEtWGIWw8IYSb7flsv33YDIF2Ul
	Eaa7jMaCTtTIVekzDpGbHMnsFJIG/tEOFCEkDL3U0QHMncfNdVGB/hFQ
X-Gm-Gg: AYBFou2H0+WwXnuzhfy0ON2PkPQBt3zk8AJ8UEJDWSBL26InVSUwCEZ62Y2HK0LvO5w
	gHr6+1Juq/O67Ke42nG2pl9tEJ02fWEdtW15LrPsyIvhKUgyzlJhVuUB/Dnj+sGf4DYzops9CoE
	O0AZI/FO0e9w+trlPDJ9Hb6xUK2/ZsgEC+EIFVerb7TXKAqSebrtnhhrlhSnbkU5I9ZesgZih9P
	eNyLES7Pu7f0CH4WQXXvHLkvm4kxQdd06Xg6Dyfim65N2OfRq6tQYqwGrKWuAR1tP++PZIEq6I9
	8Iriychgy/NStp+TUfVZ5Spg8d9TCxqs1XLIWvpmF8MoHz/r9bx6G74agngueNNkYU+OJk610AD
	MCGFCsV4DJyiZFTcRoeLRoHiv9tteJojI6Em05/nJNXKFLU8j5RwUfftGKWQN6JHUvvMaxfd7fh
	RccS+rmH9ggX1X7KxOzcS1yejpquXMnXMDhTx5tDKj/rJ8HfpEtX2kX090kSSMdIAVjKQCRg==
X-Received: by 2002:a17:902:d4c5:b0:2d9:68b7:c324 with SMTP id d9443c01a7336-2df69d368e1mr4567765ad.3.1790107443277;
        Tue, 22 Sep 2026 13:04:03 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5eea15sm654515ad.64.2026.09.22.13.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:04:02 -0700 (PDT)
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
Subject: [PATCH net-next v10 02/11] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Wed, 23 Sep 2026 04:03:26 +0800
Message-ID: <20260922200336.2201212-3-coiaprant@gmail.com>
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

