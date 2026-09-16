Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07814746AB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545584; cv=none; b=fyqoYusmiT/o9Da1KI+DXZqPIf/uaiWMAtVNm4TYgu+8I5PR02ELnUcOFOi/LO5SXbyAv6g10YjZBnR2pAoNYGKUpugE8+o5BY5X7nesD5JXSM4MDEwNhD/F1Ms4YEt3fsrCDC7QdhFZXc5ECJ7RX/GxBspzU66/5hw8zxOMzwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545584; c=relaxed/simple;
	bh=n5OM2/VFYsx7oj5lWPwm1kxpni3dSJJQk03UQEkKIio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bh8RpG8WLrLH+U7J2ZhAvSHLqK9eybzYra5j2pkL6CjceCkz3kCyyQ4NDQSL5tz0s6UBX40eLFS0VBVr2yu8RP7X/VahaqD6WVePV+4x4xRp0wejA+DnJBPP3c214ShRuaUoqLIWjGOF3E0cyI9o3BhZkKH9xAgA6pKLrn0pkPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ohYqnxUt; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ohYqnxUt"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4c79fso330966a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545556; x=1790150356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnPIF04bEgfqnB06sJJ+n/4J6DJ5aXluvuxFl2QwIxQ=;
        b=ohYqnxUtCPXeFU+yDLfm/g1jv2GU38BjR70gPaXT6fZBcN1akUi9BoI/csovFlpLeS
         X8cZbpOkdAT7PpAIHjYLJsNJXHKv2pVqHHFVhp77Ze8Mz8Pjou+T1OuotuigsqHGgzKo
         GTUvC3aWZ47Z7rkhK+0MjnFLYucVqepA4e0UI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545556; x=1790150356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UnPIF04bEgfqnB06sJJ+n/4J6DJ5aXluvuxFl2QwIxQ=;
        b=GAPtYY1W1wZDwWwv4ue02B9Z1bP4ht6I7Ji4Qt8m/vOR5OFFtIe/GCGh9CNpT/MuAe
         bC53pWLMm8Hg1+bzvgOLlb6+UlQ4X8cP7sIdIkUc+oUIaP0MmEB66iPF2LYhAggnwKkm
         jVdcvVMf2U2hNRWYV0I3OIn14wlJsFmya2Efo1yPEmkw9DjXWcV+AV6j1OzvpIuDIwfs
         6TNsWVU0wF2rtACaFJTQX+MEN1mfnBJVjCw8DGf2C+9WHRt0GHLUZgne20Qr1gl0C64d
         YSFQ938RyJA/F3YU5fRn/RVAKexZbJSLTq+EMQzn7mLiBXwCtSpS7CcchW7DQPkEgA5K
         4j6g==
X-Forwarded-Encrypted: i=1; AKwUvBz7qxb4NlnC6IwymrYoB13YkNMYMxnhQGdCv7yjp2WelEXq3qLThqYh73BaODw57VdXSsVma8c06CjauEY=@vger.kernel.org
X-Gm-Message-State: AFuF++n3fcC46XLzsjHNObNUq4EYG7hsdN7rx/yUax9ed9fsTwUwPALf
	gxUxibov+CyruBSba3BNUy8xkwZTX4nxf59mw6Qe3kM1YBqcFIC6kr1CwMuyhFcjlQ==
X-Gm-Gg: AYBFou2+hXH+3Qr+1LPTovmVVvcJN/jJgbiMyJt/YBJGhnpkSVpFnZAiIjxHAnNdXBr
	0eNhyw1/n2Vcs0MlY6KrFy10nvmM/MGSHDSzMUiYC/Z00repc97cdk93ZCDuf/Og4kdsPuF88Nm
	6fVWrXvWHiv6TTgZJZfRx5elsnNnN/iThpv0jokJxUJkoCDSAF0n17FKU0r/Dbjpza6/xmDKfRF
	iDTrzTkKk/wSiUUyC7ltnICSa9/cU4f+6MilJ/1O35VvhDgGsS9KJb1GAoz5MBEUe28pwtsX4OH
	W2p36nGbHhbh2n5LU+9Gq8xrbP0ydKCniFSP2/quGBuo+oZym44rY0YgaJkZfl0Vxz7pAxMhD/0
	63aNvInUOLMp043Ya6QtTc993uDKJLFhI4Jl+RkaqI+TR3kqoNL1MB0cZmI8ccS87dJfvV2so8R
	NL3a4A+G3WSqf9jxliGfDUwMvNjd/6Q4mn8E9UmoUJaah5BXgapZNt4tL3xST4ztgyi6T6a4Ywm
	n27vrNsJUEwXTGZ3PtwuS7cO//H/ke+VESzeXsC8c9/91Z7cuwbN2aGAQ==
X-Received: by 2002:a17:90b:4cc8:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39e1e330a2dmr4372580a91.10.1789545556050;
        Wed, 16 Sep 2026 00:59:16 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:15 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v9 10/15] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Wed, 16 Sep 2026 15:57:36 +0800
Message-ID: <20260916075745.3549953-11-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.

MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
and USB 3.x Super Speed (SS). The block can also be synthesized with
either HS-only capability or HS+SS capability. The SSUSB controller
handles the device or gadget mode. Saying that SSUSB handles the HS
portion is wrong.

For example, on the MT8195, the first two instances support both HS and
SS, while the latter two instances support only HS.

Switch to a "ports" sub-node for describing USB connections. Port 1 is
Super Speed if the controller is SS-capable, otherwise it is High Speed.
Port 2 is High Speed if SS-capable. This port mapping scheme directly
matches what the hardware returns in its capability registers.

Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Squashed DT binding revert and addition together
- Dropped reviewed-by from Bartosz
---
 .../bindings/usb/mediatek,mtk-xhci.yaml         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 231e6f35a986..d6c75bd20b78 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -107,10 +107,6 @@ properties:
       - description: USB3/SS(P) PHY
       - description: USB2/HS PHY
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description: Super Speed (SS) Output endpoint to a Type-C connector
-
   vusb33-supply:
     description: Regulator of USB AVDD3.3v
 
@@ -188,6 +184,19 @@ properties:
   "#size-cells":
     const: 0
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) data bus if SS-capable;
+          otherwise High Speed (HS) data bus.
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: High Speed (HS) data bus if controller is SS-capable.
+
 patternProperties:
   "@[0-9a-f]{1}$":
     type: object
-- 
2.55.0.1032.g73a4cd73de-goog

