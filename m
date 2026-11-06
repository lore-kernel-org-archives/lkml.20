Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962013;
	b=QwKg28699WYJTTVGuv/f4y6M1SHgdSgOPMmcxWwzuRDP84WYzRavn6gg16fEgZi7dYvg
	 351WsoY5TTKKaAGYNdG/Gdeqs0zjMzID+eC7CTqKt23mQT0Km1fRRD5at23FxAejOSrBc
	 TrnqYzoj6xruOpynbiovo4FezWYpErvpmaKm+slU6VZclqS0uySTvfLH1G1jVCtm5PI6v
	 wBbEsvl/yx2w/XFLuAawxzwfeMOBxl5tJFgYJyinbKGDaqbzYTVGBc8LvXDZcBnprcann
	 5fdxPsTXy2iLzU9pRBHwaFKaXUo6MAfsKx5mZgD5EVgxdOZaQweHs8GKzhuhxrJaMWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962013;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=vLIUtL4Xr1f0AzzVPwVtBtZX/qzPi+fLoa0ubdM8I/0=;
	b=dXQdT43z7jPp2jpUVdzd5lwP+hkDfZgupVp+sE/TyAfNdOu0oeq1d0VCQ48AyqCy/Nme
	 lzhM7p2fGaoYLIprc1e6C3TVnycGBnqgdjhj/x3jf2cCA4Zosr8ZJsGuW8WS2RRoEhmE2
	 q+bpPBe7F0tBHq5+SuVcJeTdMmYMswlAwVFkc6vthgXUxLHHSngZzmNFkolsDcYPeMWrV
	 MSNKnvEQzPt0I4CEiqAMABtYErGmc0vrLjM3kLbd8SyTM6oOsv0tlBYuftpp2ALiyHVq5
	 tFyygRb7SI/hnaIxbU+zInOZDN6yceq/YzVdL8cizKXMFNdfmdRZbttYAQXUvT9x2cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=lEdvJLsu;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56F8606D80D;
	Fri,  6 Nov 2026 10:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D56F8606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=lEdvJLsu
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AkYPC1953082
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:46:36 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AkYPC1953082
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793961996;
	bh=vLIUtL4Xr1f0AzzVPwVtBtZX/qzPi+fLoa0ubdM8I/0=;
	h=From:To:Cc:Subject:Date;
	b=lEdvJLsuhqp1rYBqP/fHpIoWbBWw6vFYe1sKWY/sz09eVlro/MRtqV4ww1f0OWI01
	 9W2Y4EEE5siqjvN63cc664O2oxyubc9W9RC22AgENL6kYRzcWvmt76/Le2qtscJL63
	 vulL84EStzMnFE51xJLGxowN5AgBp4d6yw5gfvLQ=
From: christian.koever-draxl@student.uibk.ac.at
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add S4 support
Date: Fri,  6 Nov 2026 11:46:32 +0100
Message-ID: <20261106104632.54161-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The S4 USB glue is the G12A one, but it fronts an xHCI host controller
instead of a DWC3 core, with two USB2 PHYs and no USB3 PHY. Add an S4
compatible with the G12A one as fallback, and allow a generic xHCI
child node.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
Tool use (Documentation/process/generated-content.rst):
This work was done with the help of an AI coding assistant, Claude
(Anthropic), used through Claude Code over many sessions. It did a large
part of the hands-on work: it read the vendor kernel and the firmware
interfaces, probed registers on the board, drafted the code and the
changelogs, and ran the builds, checkpatch, dt_binding_check and the
tests on the hardware. I directed the work, reviewed every change and
the final patches, and take responsibility for them. There is no single
prompt to quote; the sessions were of the form "find out why X fails on
this board, fix it, test it on the box".

Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.

 .../usb/amlogic,meson-g12a-usb-ctrl.yaml      | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
index da757c1155d4..186390f930f8 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
+++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
@@ -27,14 +27,21 @@ description: |
 
   The Amlogic GXL, GXM & AXG SoCs doesn't embed an USB3 PHY.
 
+  The Amlogic S4 uses the G12A glue in front of an xHCI host controller
+  instead of a DWC3 core, with two USB2 PHYs and no USB3 PHY.
+
 properties:
   compatible:
-    enum:
-      - amlogic,meson-gxl-usb-ctrl
-      - amlogic,meson-gxm-usb-ctrl
-      - amlogic,meson-axg-usb-ctrl
-      - amlogic,meson-g12a-usb-ctrl
-      - amlogic,meson-a1-usb-ctrl
+    oneOf:
+      - enum:
+          - amlogic,meson-gxl-usb-ctrl
+          - amlogic,meson-gxm-usb-ctrl
+          - amlogic,meson-axg-usb-ctrl
+          - amlogic,meson-g12a-usb-ctrl
+          - amlogic,meson-a1-usb-ctrl
+      - items:
+          - const: amlogic,meson-s4-usb-ctrl
+          - const: amlogic,meson-g12a-usb-ctrl
 
   ranges: true
 
@@ -82,6 +89,7 @@ patternProperties:
     oneOf:
       - $ref: dwc2.yaml#
       - $ref: snps,dwc3.yaml#
+      - $ref: generic-xhci.yaml#
 
 additionalProperties: false
 
@@ -102,8 +110,8 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - amlogic,meson-g12a-usb-ctrl
+          contains:
+            const: amlogic,meson-g12a-usb-ctrl
 
     then:
       properties:

base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0

