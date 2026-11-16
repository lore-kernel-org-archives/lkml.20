Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812539;
	b=XcSgHDCy9doFpDuKZ7THubd5Niag34W1l5rPT+vis1KKsSzJ6EpF3JW6SWFvikq5Aqyh
	 JzG3ueAFxqtvCA2WEa2lkbX6F0StYILGzmCfLNNahji6NSKCLwo0rY0MP/9D6BK2poPO/
	 /MT8wza2MQwdTn1ImpLqBxikn7v0cu8R2/9WEVUUMSwoea/JeOQSKRgnINaJiFlXs6FQ1
	 gQ6ISw1hofBHbu8MEFtONhxISNN2IkEqNbUqV5dSp5Q8rxF5pamJ+TcL84MW9OqcDewZX
	 DhQcZ7rB/6v8ycUHv3bnMvsxrDylWvkbyY1AkqPqQAKjRlov+yLBzT4G7CINefgZIBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2WwhmAqxPEFlsm5zE6uH7fU7EMvllXc0ISVSjbfBGoc=;
	b=iUJoLXXdqR2fcqkKCRRwmghNalRqjhixn2ufuYhQbEcI64Q6FYqUu9m7J+TYvQX+/ZhO
	 uLDh8jqTla3sBO2GbpmEILSYJatbCj7xXWmBWchSrMCo5WCrHvpLx2BzCRGSRGQoxOTmf
	 +YMcFjR/V7FtXTBc8rTW/SOzoyUK3s0PqNLnPcHCXFxVDJc++7ZgSd+fWITFJr9wAzg9l
	 ePoP78UM0cexvypArFOAiR7NR/5T8H7fsoxlb2ZJUuK/Cyj6seDxKS651wiBtKV+5uMCJ
	 6QFymPiVChbLRasZkq+Wx46r4qz4ZPvqRvrBF95VIzCtxYsUq1OWt+yZnea3sNL0WKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sAlBWA1J;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48C3606A8AF
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C48C3606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sAlBWA1J
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a210470b49so24252185e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794812537; x=1795417337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2WwhmAqxPEFlsm5zE6uH7fU7EMvllXc0ISVSjbfBGoc=;
        b=sAlBWA1JUDz15Lj0eiQF8oO+/bEklWxeQiMJuyQfxf4XndWTlboQwImwBWyKh6q4RZ
         0QSY6JZkqCwv+BYGX/wyy+WydRcRgjRXXXC/nKPYivx5RGI8sap+Ab4sJr/RpvfqKLAC
         LXMDCvDyyB3Id+VM2BpQp1XwbwTiD8+7MPVJFUpn7TQRaemWrQbX+4YvKrm5s9lWzXuF
         GRZtjwHoUmWSjwb3i3W59HnNe4xNrNHY12jAjqqgN+m0EzpVBa2aLiz3BSmr2lfeJ5W5
         SJU/a0c5a8c/SOVWr+ksuy3Ed1gBufcob7zbbjnDk77C1+WJYjgwJG1+zf8wW2bIJkjz
         iLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812537; x=1795417337;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2WwhmAqxPEFlsm5zE6uH7fU7EMvllXc0ISVSjbfBGoc=;
        b=yJvsIHd2x1i3OHIYMFxKjzw+ZT21C0hyNrnGC9KymrWjXGjTKE8y4h5RVVsnLFuUwm
         xjt2eDOLS97xI3luVUw6dHRPBx1BwMiwcNVVfq0lBL3eJM0Ck5UJrIYk/aSfiUd6zq8W
         NKatWN6upvhCx2owCNCWcHIX76UswNKO10PvPMOTe0Po1zncCWH6AAA+OQnT2VcxhbGN
         QkukjYw4eZJDTiw8uF6gSwvmadYs7V9OCoUwYW6Srn9rcY5p4gnoKzu4ow5QbrTUX15e
         DzW/JXrSitpT6TugNYciQLrntIyP/JNuHSBvl9lLW3k9un/kAF6jbCAdAUQFQwCC7XrF
         4phA==
X-Forwarded-Encrypted: i=1; AL+hErHilZt6lp6wDil0U+FdtJ8v+uYeZHO/q56ev4Rjefr//PfojMLQ9mLeiXcgjOPRZOlOk1uecF1pO7BlQHo=@vger.kernel.org
X-Gm-Message-State: APuU4Z99i8e8KtZ2h0hHch+ZQxfplJIYXPNIvGeI/rBSbn+oeP0fRw80
	ME9pJb6j4EdgNSV5ngeT0Q8kXCKsyrhHRLXR6nuSeBmWYe4rb2RxCsvy
X-Gm-Gg: AYBFou1B2xameCMo5blbGUwGchX8ThmIbgMuVaIPCSJd8JgxUES9sR4mgjfIOs52bLZ
	nsR2YTlWzxriReN7BheoU0z6y5b6pzmrvyeY8/1nXPJ7U613TsCwOYHSSUt9onzfCnMVQbhX4F8
	ixfMmWJb5K43CxdlXvB3M/2YPrZ2O2OoyCFvyE88amftU9mcdTpHGLIheT4LoeLhx+e779y1Udz
	ULRbwf29uCSVSiigQ275+skVEDL1pDA/SlFE/UgAhfxH+ipmclfgzHuSZjESh+sKliO3Z62dcmT
	SdQ8dSllbNV++lGuuYISRbvCCiUvfTqb+hCgbOgCfmBE13mLuYL3/0p4h2d5vGDPu9C0h0Rgcp2
	mWezNNFTzSqsorKa+pFgnpMAgVz0luPBMzm3ZM8Q32F5rcnkooyuPS4ZS0DdRVw4QHyJOlYIA2s
	DbZ2/EHrSlSTdD8aAo1i0fUWBKBvCgswbwUmjQU6hjNBSpW9FnXN5xZqTzsNXziJILM5nTSYP9W
	+aeDDdQ6hSza8DuzUTu10/uMt7e0tZ5HprCFefBvx25zax+7hEnDvUrR7Fq5jZYHx9tkqEVrFVW
	uQ9O99jeVC7qMvCjFmqdpLjw9hw9mfim
X-Received: by 2002:a05:600c:8708:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb55a7ece6mr210888835e9.12.1794812536974;
        Sun, 15 Nov 2026 23:02:16 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm558777625e9.1.2026.11.15.23.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:02:16 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: display: panel: add Novatek NT36525
Date: Mon, 16 Nov 2026 10:02:11 +0300
Message-ID: <20261116070212.314228-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116070212.314228-1-tadilhusrev@gmail.com>
References: <20261116070212.314228-1-tadilhusrev@gmail.com>
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

Add a binding for MIPI-DSI video-mode panels based on the Novatek
NT36525 controller. The first compatible names the specific panel as
fitted in a device; the second is the NT36525 controller it is based
on. The initial user is the panel in the Samsung Galaxy XCover5
(SM-G525F).

The binding was drafted during XCover5 mainline bring-up with the help
of an AI coding assistant (Claude Code, Anthropic), from a description
of the panel and the stock device tree, and reviewed and validated
(dt_binding_check, yamllint) by me.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
 .../display/panel/novatek,nt36525.yaml        | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml
new file mode 100644
index 000000000..5c6e7cce0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt36525.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT36525 MIPI-DSI panel
+
+maintainers:
+  - Adil Hüsrev Tepe <tadilhusrev@gmail.com>
+
+description:
+  A MIPI-DSI video-mode panel driven by a Novatek NT36525 controller,
+  720x1480. The first compatible string names the specific panel as fitted
+  in a device; the second is the NT36525 controller it is based on. The
+  panel reset (RESX) is active high in the Samsung Galaxy XCover5 bring-up
+  sequence.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - samsung,xcover5-nt36525
+      - const: novatek,nt36525
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  reset-gpios:
+    maxItems: 1
+
+  vdd-supply:
+    description: panel power supply
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "samsung,xcover5-nt36525", "novatek,nt36525";
+            reg = <0>;
+            reset-gpios = <&gpa0 0 GPIO_ACTIVE_HIGH>;
+            vdd-supply = <&panel_vdd>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+...
-- 
2.53.0

