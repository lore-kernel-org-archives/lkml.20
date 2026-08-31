Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F2C3D890B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218703; cv=none; b=Ly/ZCIxrLkPro5ZnIjgZ5c3yUC/l4Hgok0i8TLXnkZXlqTRtVrwA0WNQDF2oqr6zhy794t1nEQzSdzVQ/Ch665zsGQbjYS5TeuKwPpUFltuPIK4m4WtB30mTN8zt7RsAsvBfpN+QmgWbgv8HlbazCclCS1G8ndK+5B+X1FqfRxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218703; c=relaxed/simple;
	bh=WBrVAh2dl8UJKYGy/bCn2gBe1W2WzeDKN1Fq4A99l8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y2Pq7B9u+HCEbLvBACrFoXCqZ/nYHHxfQNl1ues/7MU4s84tbW2JeIc+AZD3JkbY+wDK6mi8bKlva0HsMZ2BED5KBytBgacp7rodeXLxynhOC0bHlIKJJ/PGWJN/5XVenynYneDjU2DYIBQlN+qta+dSEVyCGhI5yQPQxvhaGpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIOEVkSt; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIOEVkSt"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38f57e312ecso935491a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788218700; x=1788823500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2f1MFzQHcHK1Gr7vYedM+Hgn+oOUGoRn3RcTHV7nos=;
        b=PIOEVkStyOHty1skV9UY043stR/L9hqx/c/UDiyldT201xdJR5ZXpHY5WvLvW4uZw4
         jRcHtZ1vC2AB2Fr1h6nRKsNhZ2YAEncRPyfzAzTPG3w5aLS5voYu5/BE0cWaSVkDQ1Xe
         /2h/0MOGlLT5Gd1BWTGkOeU4uQOpW4VV13q/TlFNoJQnqQKv3V2xpBiSXF4gaWz1Zzll
         zZn28SKEp7s0KDyGQHgE9zHS9x3kmfgOlIAX+ZJen/StJjZc0eIrgvcjIMcUmZTl9SHX
         WTIkqSQ/jiXK3g0aDEcFao42WIo2ZgHffPBEYi98r5GFLhPWWHrGJs99iABDnFfYBOYN
         pgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788218700; x=1788823500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I2f1MFzQHcHK1Gr7vYedM+Hgn+oOUGoRn3RcTHV7nos=;
        b=mJsd/FpyKVeRgKeCQTuzaJybtCS+pzZWyDJBxSkb4vj81qrts0v1xLNdhqovseK238
         O7yYS8HGcWrybcqKDyDNucZvbZ61WVuw9X/2KKXNEMZDI6azcid55up93D7/pcAk8qkB
         AuiisFax1TiE816tbdnKsy6dMIpTc/JilAIZQKGcLC8N8BijMWekHoXLdtQPNauItD4h
         Q/hdfSe/xW4kZCbeufSCuUrjp3AquK2qCvj/Ve+zE8GOigU7fEjxqVBfpx1OzUAKV5t9
         nn1pWyrU4h+Q/U/f8tfD/nBjdJcM5NJL//of43hBwS73jJM1413Q8Ebfn3nwunLy4shD
         wwGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQixdqg0osFsC2Qxm1CgszzBRiKpW5FSM2uVmjukY/k34T6B7YhRt9gAMxX1tXChteu6ua7xbtDUfj0SA=@vger.kernel.org
X-Gm-Message-State: AFuF++lV4kq0DHT119OlAOlvSI+G5s0GGR5v/uhMPKe1IJX/7FZRj1pT
	cwwqrwmmMNNEvSwvSQFQlnGWB4Uwxu9D6n/jkC5mQXNvlAydmbU/WS9OJvEXUA==
X-Gm-Gg: AYBFou0iUI63BGpHU+/qwH7uVtvLodD8yWoR09PVLhcIF9023xd4pfixw8fYJnRF70U
	2RgBddeUdJIvziptyKlT074WXFI12G3Cig8FEx7WBehed7KiOyLPqT2FF09WOm8xZ0W5tSEEiHT
	LAwTO9gJ6eKhOIL8KNAiqT+0HIQJU3/Suj4ZSSCksqi493cldRHuRw9Bk2Riuo9SRgy4A5/rAaf
	VR7zlXoFTyHWL8aC0qGZG90T6TJpI5sqzQfjHqozIndnenPrx4zLK8T1g5ll3Jopz/yucMczVXD
	zLOajBq1gR9NEdB9jaRMLNALmB/ggoo+qlTpTnDrun0hO1QEFp7ugqR7bOLMPU4ryodmxXcGHbb
	62cJiVE9KEj7VLY/KuP35BCWQL74hOelNRaDN1IRXx1TUFq8x6JcYo0742ShVHL23zmEwu4ksL/
	y9UmYgPTneuzbGmUKNccIrBfhfmVv4DS9tiNFkS6bAVrsR6FN2+MwqDm1/aa34NOsKY695koo=
X-Received: by 2002:a17:90a:d403:b0:38f:aa76:88b with SMTP id 98e67ed59e1d1-398babbb56fmr15866363a91.4.1788218699965;
        Mon, 31 Aug 2026 16:24:59 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75fc49sm1963213a91.12.2026.08.31.16.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:24:58 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 01 Sep 2026 04:53:08 +0530
Subject: [PATCH v3 4/6] dt-bindings: usb: ti,am335x-usb-ctrl-module:
 Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ti-am33-usb-v3-4-5e15c617d2e9@gmail.com>
References: <20260901-ti-am33-usb-v3-0-5e15c617d2e9@gmail.com>
In-Reply-To: <20260901-ti-am33-usb-v3-0-5e15c617d2e9@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrzej Siewior <bigeasy@linutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Ravi B <ravibabu@ti.com>, Kumar Gupta <ajay.gupta@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Bin Liu <b-liu@ti.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-omap@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788218595; l=2531;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=WBrVAh2dl8UJKYGy/bCn2gBe1W2WzeDKN1Fq4A99l8c=;
 b=PrUWAD8e1Wj6MZVJOd+5GcYQfmkOigONZ2BF6CqeZ9Pp250pErMagc4593CxI0anBHddpK9QH
 T1/skBp4CYHDpOn59vKaQxDkb6rTvMVOCMbZh1kfidhWsIs83gr1u2B
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI AM335x USB Control Module text bindings to DT schema. No
functional changes.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/usb/am33xx-usb.txt         |  9 -----
 .../bindings/usb/ti,am335x-usb-ctrl-module.yaml    | 38 ++++++++++++++++++++++
 2 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/am33xx-usb.txt b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
index 5973f88bcc65..94312ad8ec8c 100644
--- a/Documentation/devicetree/bindings/usb/am33xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
@@ -8,15 +8,6 @@ The glue layer contains multiple child nodes. It is required to have
 at least a control module node, USB node and a PHY node. The second USB
 node and its PHY node are optional. The DMA node is also optional.
 
-Reset module
-~~~~~~~~~~~~
-- compatible: ti,am335x-usb-ctrl-module
-- reg: offset and length of the "USB control registers" in the "Control
-  Module" block. A second offset and length for the USB wake up control
-  in the same memory block.
-- reg-names: "phy_ctrl" for the "USB control registers" and "wakeup" for
-  the USB wake up control register.
-
 Example:
 ~~~~~~~~
 The following example contains all the nodes as used on am335x-evm:
diff --git a/Documentation/devicetree/bindings/usb/ti,am335x-usb-ctrl-module.yaml b/Documentation/devicetree/bindings/usb/ti,am335x-usb-ctrl-module.yaml
new file mode 100644
index 000000000000..f8ac0af745c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,am335x-usb-ctrl-module.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ti,am335x-usb-ctrl-module.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI AM335x USB Control Module
+
+maintainers:
+  - Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+
+properties:
+  compatible:
+    const: ti,am335x-usb-ctrl-module
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: phy_ctrl
+      - const: wakeup
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    control@44e10000 {
+        compatible = "ti,am335x-usb-ctrl-module";
+        reg = <0x44e10620 0x10>,
+              <0x44e10648 0x4>;
+        reg-names = "phy_ctrl", "wakeup";
+    };

-- 
2.55.0

