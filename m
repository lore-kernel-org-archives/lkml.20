Received: from mail-pz2-f7.google.com (mail-pz2-f7.google.com [74.125.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BB43D4125
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789822322; cv=none; b=fD7TN7SrKA9ufVTsJCodyAv/mAC9mI9ECKBD0Lkc8/fb7W3Lww1CtRxpKsghZ+P4IvQBnxQNmo7lQVIe4+GtDjJ1oBEOkVE8xSaJPaYCwYz5/0/KVVaAcapjDpAug6rG4/uYZeWTN4efRuJlW5v93HOL1FAWDi6mAN/veJ8snCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789822322; c=relaxed/simple;
	bh=RQ8/bIf5S9U/FiX3uQoU1u6/FV6K7LLD2uqZys3J7EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i812/XRQe9uRbV2yZS/VitAczcC1Ds6ma0JVEJjJ9oW0f159CGOTrKBjNT6z0TofqlqiQMM9jdcZyRmbjKwuwiQ9SrCPGrQrf3BzSDMBiYGt9JOAEv0r5xXz6Ogwf6KFvqGlRr3tgVGEqy+ovr2f7n7eI3DrNDED7KqU6mkEZK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuWINVYZ; arc=none smtp.client-ip=74.125.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuWINVYZ"
Received: by mail-pz2-f7.google.com with SMTP id 41be03b00d2f7-cc53988d9f3so807373a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789822321; x=1790427121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=iuWINVYZQOlRIsm5MQpniniXdaMMKlIDbcdiL2joT++n2t0GU//Ojqx4KQoIp1Y4eu
         9vyYPxwDHT9ASrHGCZFi7EbCfORmR7gUBwsr238FIBhRGk2PjL5OZQJ9idBmLfuhw538
         oYclFqhOlmE/8JtxKzog9GeCP/xlapJlRMmJTgrhzdvmSFCo3JygnG3IaBQtJ9SRDGkW
         7NLX3oSECRgndTyKgduwk+gj11qXuQ+SZNcYZRpNMUB7uBVKXOlAXzB2C787B6gZek7b
         x8Swonb/HdXDVtk4eWqKHYv+9e1sIk5gDuQ6NKsE91D4yu3WR3Nonw1nrwvxCi4pxrN9
         Kg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789822321; x=1790427121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=nUf78JqLYL/d94rSu4F8Zw4+4LidtNGkncevos7D8F2CB9jjfOqJoZ8tR04fZes8wL
         sCnbBPtBkZuGl7HOxHt1T/S/OJ8xqUz8MvXNaKcXMJTrgfbiCvxONc1c+RIVGVXHlbfT
         wjMsqqO1aAYSIY54jeKthHjtwxpAqZLdePbT2hG56WDXrqLjfmTuhzxx+nzBqBWQXgof
         wakDH2yo+vc99nExauX/H5edQFk357ThTS/27rUYcn0j1EPB4n8EoZFfmCsznC5IbUzk
         OpUlckaRzj0UnehVmhAM3/d7EUsNyOFl76PBlX6YHePxIbDE/yzrq4TtFoOVjVTtMeKC
         8/fQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFEoiVDwgrODaWL+vIYlasr0ZMM4p4C5RUfk6fqaFSrNuujLJ+1DBe2WpIvRVscxQQZ/fq/zqqFP+zWnk=@vger.kernel.org
X-Gm-Message-State: AFuF++m4rCIQDloxfujlwdtw5QrP5Xb9b5VEuwve7WPJMRqkZk5y5FPw
	RhxUPh9T19yGAARPB+CIrYeqgKx3veUpGR3k3i1AzQtaZo7Uu0tGr5uN
X-Gm-Gg: AYBFou2UOguLUImHQ+TSjlOiQdC2cK4OWDkwBIieI74n0lPvdIqGeeDQDDWoxMe8MVG
	I1+ggGCcSl7qkwFUWXSL849FtJ6W0Z6CYIsQ6mjTMxyWzwjUVxfGa/i/re0vc1OfNHmqeTqGUPd
	OKeQrev6N9QTtmEjTszwgOj2vAxdz303D1/2gafgBtciliTyR6zeBLSF0199wqa0frnMbFMHOq4
	QMYQ55p4iRs5uHl1rraNBWX5qE1+MQ+TU3pzQchmGHn323Xh4/0BtjM5aPsb3BAT1ZTU8ZCh3jm
	pMBanBMCTKteiX/+5PWBkMVCgodsTE0in232IGuAZzCtJHF4aDHJI90wTxiMfP6ozzKYqeGUX64
	YOvp/RtadDOr/i72UC++NZquVWFbQkK4CtrveyUwFEEJq2jIgvHZrnLBC4f29qOUbrPFqOOAT8u
	BytUtUq1GkuFIc5m2WsjBLY6D0fimj9wWgN0aaEghKGYHUx0XysdRHKD8Kmodxpu+NMCb6eA==
X-Received: by 2002:a05:6a00:9086:b0:878:3783:8a82 with SMTP id d2e1a72fcca58-8783783932bmr1483263b3a.52.1789822320744;
        Sat, 19 Sep 2026 05:52:00 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa0026b2sm991805b3a.44.2026.09.19.05.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:51:59 -0700 (PDT)
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
Subject: [PATCH net-next v8 02/11] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Sat, 19 Sep 2026 20:51:09 +0800
Message-ID: <20260919125119.2107089-3-coiaprant@gmail.com>
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

