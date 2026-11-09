Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794197116;
	b=AqUGsPj/wGuGoSzTwGMm3p430+0BEqfSlRL3Vyxd2XOunu7gq9jAh2Eok7AEzwpIkMMW
	 ODBVxL4QtjdMJGSgYjt+PtUTDOewvV38bjNAnQgxQjW51eubr2qSFr4tgGDZnacRM/fxH
	 blYi1Nl9Vga9XMbdKTg3wU2SG1Pi2ICTTCl2juOYKemvSdvEUwCAsLZiQKpndg8z67Bp1
	 vPcQBJc7vgpkXHfh6CZhDiBfv+iJDM//iAM3wqetid52rlVlJY4AU1JWYH66J0wpzAwi1
	 sDZSGBa34AqAHUvJt0Kop7WSEI35r6xZTZzR+tTHicrro88Z0qctuu2Dgd9adOWV9ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hIU62W0BUNZPKYkLAW26gZ6Vi24pHjTqobWZNWpG/Ak=;
	b=XYzMxorKS8S3/D22TcM9hAi0kLwGoiCLxw9vtvZfJQ0qqsIHYpWqr1WGSDQ7ueX9kkuQ
	 BMs+/UJK8WHPEgO106QCVBQFVU5kV1HaWcNG/P981FyEaGEXe9lAHbarIQLiE2gH5sGi7
	 dVpqd9XVzUarnzjWlVr1NUSeGaY3VfNdntETvop0OgysDdfokwOCp8z1Ay9V4XAW/0cLx
	 OwMo717AM0gwIL//y+uYfbcnsZ0wD82l01eR0uJ7mhtMNo8OSveBg4WS/qAFc+X9TD3iq
	 GHsvpwYKuWWv7azWbHpNNjr5gGW2Sp8wghbRAIxw/kl5tDgVpqunk/ujCXNXrdANNxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XZGiixoj;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160DB606A335
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 160DB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XZGiixoj
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso247589a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197115; x=1794801915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hIU62W0BUNZPKYkLAW26gZ6Vi24pHjTqobWZNWpG/Ak=;
        b=XZGiixojxhGrpL7RX9KoIGDpUPBaSpf7vBiwjdTA4Cn3bM2A6vNq2xreToPAGaS2d1
         bhaubbweVY59R++EyiT0IRAOpq0cxGu8N9OgEEiONV1ZOxRZSl6dgm2bZNWuXxDIC36U
         cHgrwewj5ZaOJ2zfyVsiCHFlhAwq4TXXILSZc6SAacNpDAkKAfb8wLCGt8b9EAeG+tkC
         lJ/UVBD6CB9mAYm7QTFHvWHMMoImKql7STXMS3zvoRxmZfbFh588IfyBK9g/0Lium7L6
         LZNXrUCzo8EGC3VHgOc6ppqp+Aw5Rdh2P7d4kvdmNFLtaYOROciBVThqCnWRVDGPWOyn
         6sRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197115; x=1794801915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hIU62W0BUNZPKYkLAW26gZ6Vi24pHjTqobWZNWpG/Ak=;
        b=Psu0X+zetPZesjfQyUFGp+fyW+e+06SGy8Y7Q9uvLbzGVU3GrSJTw16DAcio9ZzT7L
         s60G8cQ/tCnAJoWAafFVbq1mmM8PKP6/wY1EwCphg79yQoWStXQLQ2fHpZbwwQtqmgm5
         48FXMPFiAbYWV41vpXYKzkPoj5rF8p0iZkWMYb/tlBCbXFl57h2nB0ivsboM4RM2uYG1
         gXXY4Hx7GCaCtjIs2Q297OL25eOmkPV0LKNqTV8DXyqYvPgIBF8bdYDZ9c3IO3XtnDcD
         B/PzweldToJ0cyUUtkKER6NqDDbst/+J4fJgdBKIOHQCA8zi1m3r6pf6ud9HtPnmvawv
         v5WA==
X-Forwarded-Encrypted: i=1; AL+hErH8Qndh08jKBKB/YtBGPqeP5yvy6zk1lRzkYMWTaVUC2NEHK7KF0KyrJPKnjsJAGzIZw1goWzuY+jv4ymQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wrrXIy02vm1iR1MxhAxg6xg1q/MSUOafuup096fHnB0YNX4Vy
	Yg7/DTIc8Vtjzhs+13n+G/d2FzFE6+k9SjmL6YnMBuvrAmFHRVChWXTzQKwCpA==
X-Gm-Gg: AYBFou3VRLheutme12SKipChehjh6hvpS5iuGPsa3Y0RUQ85cHc3TNBTFQDR6vZw11+
	2zeAeIIeRGLX0zTy4zkQ6stYJj1DCaLEzojIci0x9anM3aeTiEDFsj5P2WtPoerG7suQsFDGpQQ
	953OZFyqaeQ0CTLsgK0JTV0IpxVD91+3o0gkH9fxXOi+P/S/9aEBnHQV1AyIB4J0MZ0Qw9TpseD
	ZUhT4FnDO6dyGfycZwBb/THlH2pTL/XJojtkNDh2s1DtDYa+VUgCyHf3484uckbrH75QLjmKvF0
	ooP8XITztlIBx/FsTnTg8K8zYGII5FnsIVvldcLtE566cGBLlOsCwRwcharbfyXUF41FUPbAPrs
	VxJucpF1+ZTDUNwG2lZT8dIi2WE3rq17+AlaXB3OsWWP33qrLOhJ6cKN3oJlBcmmX1P55rvUuDB
	4LJ0t6tpbCQle0z7VimeAdwcodgnjw/I7F+bOk0QzNCEudFr1e/lcdhFvYSGUghV+3SwK0lTGo2
	B1gpP3vP/ppTydflI/H01W0eFwZl8JA5qISVO1QhHvSSOeZBAzkR4DDI+BZigupy7WFMHUuHFk9
	tPT+YP/AaRdUzcKD+rsQk+hUx1CgeZUM9Vjj9SaTbaSybwj6IH+nfKcXSfnhfPsV/zBVaEMhGHk
	avcRsq4IK1/E3tKpUAKJt4lxon3/2pnECLqgdIoRuR94H5vYhV8Ewobd3Uxb4EMJm2eTQK3bPca
	LNwC8=
X-Received: by 2002:a17:90b:442d:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3b12d4b6839mr3064156a91.41.1794197115134;
        Sun, 08 Nov 2026 20:05:15 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127891fa4sm5116170a91.4.2026.11.08.20.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:05:14 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Alban Bedel <albeu@free.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: phy: qca,ar7100-usb-phy: add AR9340, QCA9550 and the analog reset
Date: Sun,  8 Nov 2026 20:04:50 -0800
Message-ID: <20261109040451.114135-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109040451.114135-1-rosenp@gmail.com>
References: <20261109040451.114135-1-rosenp@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From AR934x on, the analog part of the USB PHY has its own reset,
which has to be released along with the PHY one. Add it as a third,
optional reset, and add compatibles for AR934x and QCA955x, which need
it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../bindings/phy/qca,ar7100-usb-phy.yaml      | 38 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qca,ar7100-usb-phy.yaml b/Documentation/devicetree/bindings/phy/qca,ar7100-usb-phy.yaml
index 029665530829..358b3f345c12 100644
--- a/Documentation/devicetree/bindings/phy/qca,ar7100-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qca,ar7100-usb-phy.yaml
@@ -11,8 +11,13 @@ maintainers:
 
 properties:
   compatible:
-    items:
+    oneOf:
       - const: qca,ar7100-usb-phy
+      - items:
+          - enum:
+              - qca,ar9340-usb-phy
+              - qca,qca9550-usb-phy
+          - const: qca,ar7100-usb-phy
 
   reset-names:
     description: Names of reset lines in order.
@@ -20,6 +25,7 @@ properties:
     items:
       - const: phy
       - const: suspend-override
+      - const: phy-analog
 
   resets:
     description: References to the reset controllers.
@@ -27,6 +33,7 @@ properties:
     items:
       - description: Reset controller for phy
       - description: Reset controller for suspend-override
+      - description: Reset controller for the analog part of the phy
 
   '#phy-cells':
     const: 0
@@ -37,6 +44,27 @@ required:
   - resets
   - '#phy-cells'
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qca,ar9340-usb-phy
+              - qca,qca9550-usb-phy
+    then:
+      properties:
+        resets:
+          minItems: 3
+        reset-names:
+          minItems: 3
+    else:
+      properties:
+        resets:
+          maxItems: 2
+        reset-names:
+          maxItems: 2
+
 additionalProperties: false
 
 examples:
@@ -47,3 +75,11 @@ examples:
         resets = <&rst 4>, <&rst 3>;
         #phy-cells = <0>;
     };
+
+  - |
+    usb-phy {
+        compatible = "qca,qca9550-usb-phy", "qca,ar7100-usb-phy";
+        reset-names = "phy", "suspend-override", "phy-analog";
+        resets = <&rst 4>, <&rst 3>, <&rst 11>;
+        #phy-cells = <0>;
+    };
-- 
2.56.0

