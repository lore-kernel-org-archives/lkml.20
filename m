Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B251946EC73
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862118; cv=none; b=qNCTalL4eT6Q4Ytm7+F2ffno/206pzwRCcfRD+zWcYotSfhUEOjWW1zAbXU2zTSGjNY8tPwUb2Y7T6pmBc0vGRHHnG9Vnj0EYyBQCVuFsfV1YQliv/m8/0TsJg4jelngB3a7Bc4Q39RKZEDimJAYvPGYBXN/pKu5DFQVzXhwPi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862118; c=relaxed/simple;
	bh=1596ZXtdhvZVs+Tdnu6Ajw7/QmvSTVTcByw56Brktwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JmiA09vXpHeNYN9/J45DhKrdBdK0Nh0rCepL9G/5QUWcMpXAzwQlyvDoUtSjNX0tieREnJhj0WmNz3mTwoNKuoIxRFfuD8IQ/2TmnFBDrEwK7QaHNcJZMyfJlVreYlg1vu+JAlUxbxLZ3Qs29R3dzxsUTHL7zBP8OGSBgnsDQTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W91FFlHc; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W91FFlHc"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3535a54bed9so3469119eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791862116; x=1792466916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8wCm2Nfy1YlIAb2uRfBFA3ucdNuFD+nuit8STLj3RM=;
        b=W91FFlHcUkJSt2HrR9od60ZMxoiq4czabMLAHTBvIZKvZXtJ2k87DyVzvWa52Thp+N
         yEIdIFeiR7iGGqj+dyoFxQu7P2SHxSfg9cAvr8i5vEFx/XeXr8CmmHy9keFdUzEVOlH5
         ZmFRsml7GRBmCobiUiOW6wCVv9/0+xCjrWXPsfDvoq5HAgjkb/Z4Gyhsbn2QODvuBY8k
         7yNHYPCtKLtC5SuibL0GpECx3nrn+Ny9IIPI1gKhzxxybM6aHlTcyoyJbfyUrcwIdLJ+
         Z8lf6sEglefQO7jumuItchredFVLyOrbkQ43ZsxCNN3qySIUtojrgM1m6kSj2Vl7UaWW
         rgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791862116; x=1792466916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8wCm2Nfy1YlIAb2uRfBFA3ucdNuFD+nuit8STLj3RM=;
        b=OwOYIZ7/yvFrtbTA+6e0OTdmBvZOBZqtT654SkMiMwjMeG6Jso4ipgIFtYoFR5KwKX
         zBdbbQPb/r6vOgxhllEPTHNnkc0/t9gEOvB82Pblk7eWeXDBfznpMNCd87ETRuL62ldf
         Rh6Bsjsm2MEQJkyOAtNvgVbELzUwUzv/G9EHFEtwUJTectd8OkkBFUa8UAunm1cM/bpc
         APcLyxiZ6Bqbc0J2fJamjq5GAoV58b5t4dnt3DQYyu/XkN3IQsxISPUp/fLwqBeC4zfh
         Q8cwtNFma/oKzZPaA8FliSwAAC4t8NyD+qL+MGY7Fx1FfmXQotFt/AGpNOkFrpFNmpF0
         nYUA==
X-Forwarded-Encrypted: i=1; AKwUvBy3lQuWUPf2qXo62m1iD94dcYhsQtEG2CM8PIKYdLgUHQ5seHONZbAVZP/T/TxG3cVyt2akfuMz44dkZ3M=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6Y0YSrSPXZ9R1bQJnVzcJqpOCUJ5VR76GiDub87TmjYk3ZglC
	+woTwPB7xacQuAMTOuqC/E7VlYMDOYH6zLbPB3ZBVmtAys/nrw64j09u
X-Gm-Gg: AYBFou12wxRDx3ZTo2n7ARkYJqqjJPB4AGB8IpMcYnk07Q57bLNUr3cORPxB11IZU4+
	TrvkZH6ae61kw8YGJFdGDhGTY2SzGWq9kmGZDzCTiXeUw0Jhdhvg4/NM6Rj1qhMh0vcyiYS7x3j
	H/fdp89w++P/9ZXv/1VH1z2AHT5Mev0MsCspVYAJ+XKpPE8Q3go1ah4XoTXPsDI+zjLtcJ0VSZa
	zBCTelGSCxFFAJfnRiur5t6isNuUlPEN0OmuJZj+r+JZswsx6zFTUc8XBf5kXswVLhXcswd/b2R
	ZPP3lfJbE+SvXSqv40T1alKsOuiglkZvhc7hDhTpiQt9m+Axh/PQAlALBQ200/G4AqHutT0712B
	8ra0BxGy0uIeKGdZ/5INpjdkNJ7NY6c6zWDFDIkPLdp9sUXvktz4dMPIsJKxGLthaOYe0NL07l1
	rUje8OUtkHIaPmIBfaTljIkm5Tvr7TrEeKsKQi4v6JkwsVKneswffxDQmjwpQiV7CMFx9JJlFt4
	b/HEOBnBiTk/w9/T1mhhAJY89gIx1Go5Kmv9VCZTGYdmw==
X-Received: by 2002:a05:7300:d205:b0:35a:22a4:133 with SMTP id 5a478bee46e88-35a22a421b2mr7256994eec.20.1791862115599;
        Mon, 12 Oct 2026 20:28:35 -0700 (PDT)
Received: from [127.0.0.2] ([2401:4900:8900:441a:ba51:e5f4:3ca4:4b87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm43617106eec.18.2026.10.12.20.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:28:35 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Tue, 13 Oct 2026 08:58:23 +0530
Subject: [PATCH v7 1/3] media: dt-bindings: Add Himax HM1092 NIR sensor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-hm1092-driver-v7-1-d81a9b152ffd@gmail.com>
References: <20261013-hm1092-driver-v7-0-d81a9b152ffd@gmail.com>
In-Reply-To: <20261013-hm1092-driver-v7-0-d81a9b152ffd@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jake Steinman <j@metarealtyinc.ca>, 
 Eduard Kulyk <kulikeduard89@gmail.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

Add a dt-binding schema for the Himax HM1092, a 1 megapixel monochrome
near-infrared CMOS image sensor used as the face-authentication IR
camera on laptops. The sensor streams 10-bit RAW over a single MIPI
CSI-2 data lane.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
---
 .../bindings/media/i2c/himax,hm1092.yaml           | 101 +++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
new file mode 100644
index 000000000000..e0a8bee62afc
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/himax,hm1092.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HM1092 Monochrome NIR Sensor
+
+maintainers:
+  - Ramshouriesh R <rshouriesh@gmail.com>
+
+description:
+  The Himax HM1092 is a 1 megapixel monochrome near-infrared CMOS image
+  sensor with a MIPI CSI-2 interface, commonly used as the IR camera for
+  face authentication on laptops. It outputs 10-bit RAW over a single
+  MIPI CSI-2 data lane.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: himax,hm1092
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analogue circuit voltage supply.
+
+  dovdd-supply:
+    description: I/O circuit voltage supply.
+
+  dvdd-supply:
+    description: Digital circuit voltage supply.
+
+  reset-gpios:
+    maxItems: 1
+    description: Active low GPIO connected to the XSHUTDOWN pad.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        required:
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@24 {
+            compatible = "himax,hm1092";
+            reg = <0x24>;
+
+            reset-gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&cam_ir_default>;
+
+            clocks = <&camcc 1>;
+            assigned-clocks = <&camcc 1>;
+            assigned-clock-rates = <24000000>;
+
+            orientation = <0>;
+
+            avdd-supply = <&vreg_l7m_2p9>;
+            dvdd-supply = <&vreg_l7m_2p9>;
+            dovdd-supply = <&vreg_l4m_1p8>;
+
+            port {
+                hm1092_ep: endpoint {
+                    link-frequencies = /bits/ 64 <180000000>;
+                    remote-endpoint = <&camss_csiphy0_inep>;
+                };
+            };
+        };
+    };
+...

-- 
2.55.0

