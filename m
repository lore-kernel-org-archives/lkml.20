Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F233F2109
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 05:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792215914; cv=none; b=mEf3RT10DjNhrpC2k2TQ+N3jnAZ2Ib86aY+I4Ea9QPMTa2bbiWqO9bfLMYJnF2yPjZeloj+Qtpn/V4IAmpwMa7VLZCBJCGlOg72GJWiSiPwBbosDf8dCuTi0O5q8nHRlkSU1P3dd+D/1wdbl0lfmXG6d0qQvzQF+s1lCMiw4o+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792215914; c=relaxed/simple;
	bh=3JZb0ui9185DkLL+vQqRLAgo4SmmslSADMqlHD752Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QhYq+/8vrmvLp2VShZUzWAu6+Av0D40gZSYoOjW2mwg1LNN3ampjrbhUB/BIXJM6FmUxSPhGCI/G9QFFczmW1is8J3dvfMSQrSEMR8szpwz/vZq0z8l7aBqdcQFIo3exIVTJqhlqmAm9/NnU4PuSZr5uIQlZU7XD8kEM9qYhlrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IoNanWus; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IoNanWus"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-881269371acso776942b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792215912; x=1792820712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxuxc5T1ripM4n0F4O5vkglU3x7CEQrB8YPn1E2u+7Y=;
        b=IoNanWusElzMrf069Ziw0qe9+O90UKWs78KQKo232aYYMesF+q1O9QWcrrNKubBege
         uZGGgNcn6RQdhYvNf5xiKWroSg7P8QUpOxUf3rJY6W/0Mhb6VjsBCAf69sYm1urZMdgT
         iTpq7XXiPPni+W/fcdHnheGZ4WjCTFBnWYmIq2VkyA7F1zBvDSX2XQHwypQQxoPH7Dq2
         HU702Om9pNEInn0AHJfLcIsZWFibaE29ZF7dlId2HyyOX1gypXOGITpXRidU1jIbzd8p
         rqNdDNotVQy38G1wG8WChESSYcl5ElEpBnOEuBqH4lC+mZP57RAOOAqDr1kddohFsYpD
         aqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792215912; x=1792820712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vxuxc5T1ripM4n0F4O5vkglU3x7CEQrB8YPn1E2u+7Y=;
        b=PGh5hKPuzgLS3lsb8aZK2lvPbMby1GeMmQnPinM8obPf0uWEIcvnHnW3Jq0dh38ubZ
         /Vm3fQaUw5Hqc8Lm0fMA8cFjGZKyRo+Rn1bRjh+gQe+ZhGRF5aC/nuUYGedVCN/cHDbW
         7vzpuK4G2nzysExm7lEZcDAsd7mgksnLB+W5ebkD+yg7hxOE9YqAyKt/TtTbqxEBkGqq
         02l2qKJ0mtutARhzNXE64jy+6wWBI+XybOboLIxUbpUEuCI6vwPoAeEdCvD/exv4665e
         uAC7pkTtED0wPjzOHvFoZNjF3y4lBUgiz++/2eQngfb0Q0jTQB4+Ml4ZASrMXLEYxXAk
         YQig==
X-Forwarded-Encrypted: i=1; AKwUvBzHw9s5reVMzus91C9x9Oqg0t/PbCFFfCwfjEbRppYjVcxnk/0bUFRGc8SNrchyFXlCQL5LUewzknYPT4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7OU40GgGPP1p9LVrMboRmfPXuCpZbWAbBMx9+nnx7bzmH4ZRn
	ZZSUfAIXf9Ur1AXyJujGW4NX6jREsmy6Kl8MCGsK46qsDZ0H/RUJ2e8w
X-Gm-Gg: AYBFou2d3lbLH3cTKNIthcnrcIfRVM7ZlihnzdxAbnV66qxKjZliWBRkLw2SHsDvrbX
	sXaN4suOl2Y9qMW+0sFABD+0nE9ebsDrl7LfvdPxaJN5gamySUOiEnGuLppm0+62TzK4xllVoke
	Skzb46Wyd5UDNbZ9a/3m/f5Y91ymBLTZQyHSJOpEA5XH9lgySJNRMWHZCXg4IwdzUjwMtjj0CqC
	u22yawu2OojB+drxH3R1ddDa6TsCGcA7kM1zgtLlAzDC/f7XIKo0RD+ZBn8iMPwGqfh57AE4GSQ
	zfwJRlZKgefZeHEjFFeQcssbfuhhb/4IKRNkWGhyM2uu1QcO+2qLiz9NNn8l6XQd6z/lSktWIzJ
	+UlrWFDq90vz4KC0EcTO2RsUf8usgoPUnRMeJkhzYLQb/VAzS49a6Th53iA5PJjMGKxut7uW1Dh
	X5yphr8MzTT6KqWXFsLRBIT1CHUFd+xZy87HiBDVomIBAUXTj1G80q4V/XQbn6VMxWY+Gg
X-Received: by 2002:a05:6a00:1389:b0:89e:7b15:d934 with SMTP id d2e1a72fcca58-89f2214f36dmr3388109b3a.45.1792215911894;
        Fri, 16 Oct 2026 22:45:11 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57269315sm1958225b3a.23.2026.10.16.22.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:45:11 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v12 4/6] dt-bindings: net: rockchip-dwmac: document pcs-handle
Date: Sat, 17 Oct 2026 13:44:02 +0800
Message-ID: <20261017054406.1828061-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261017054406.1828061-1-coiaprant@gmail.com>
References: <20261017054406.1828061-1-coiaprant@gmail.com>
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/net/rockchip-dwmac.yaml          | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845349c..c434450fd07ff 100644
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
 
@@ -159,6 +165,27 @@ allOf:
         clocks:
           minItems: 5
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-gmac
+    then:
+      required:
+        - phy-mode
+
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

