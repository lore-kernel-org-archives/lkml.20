Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CFA4BB299
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403857; cv=none; b=BvMZRSp+C/1p3NReHLajhbs0KdQmF7yoGYp1wFKQGB0xBE3Pm5D0tvUbv+TOqMy+yLg/HzCcBi85LkZvZW4XMXLX9Owm002MGfPsuJmMMIAsrdXeNlF/hJipZVGCpSUujAoI7Kl6a/nOklBwGBVZNm6xhgU8QKbXCitEb+/9z+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403857; c=relaxed/simple;
	bh=Ms3kQzZFSAV0sF2Y4NJYiyIxnkk9I6e6pJVoEQlBmMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WmZyIiLD5cheYInJVUGN/UOu8OCKcuAHVm98LdbxI40ZZfEHbFfWs3N61mXyrm72za6Q59a38W1NYk8IkEsgl2oRqzicSUdj/IhdtNKK7i6BpuvwAD9K8PGnoakvKqzwpfVZC1llNfLvyQV9QDgOenTgwdH65AGFceTQUEep2xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5Eu5KOc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5Eu5KOc"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso18426415e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792403854; x=1793008654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrA01rti7Ay/Y5eHy2dsofO3a17OwFZMN974VKrytcs=;
        b=Q5Eu5KOcYmeFGHl+bPNGsdaOhrsfI7V3uiJnzXWUHQ4h9YAi4ZlfLnGRasJEy1vutp
         AeQfcAmoqrBCnSuezuJRNBwASdK8828f/pvQ0eFiMvzHHx5A6KH565mrTSv2BVNCRoyS
         gUTKpFpev1v4fl03+djZ38NZDEKfsy/9EjxVzXWXPGep74YsLPJrx++N+lcL5Hkm8zi4
         mI9Bjw/nzlo6msVcwiQvyZ0NsHamTyM5koZbqRmMbfDlxxpu6yc+S2wB45gWoAz2OT1m
         wlEW6o3qnzOvcGz6+kw46zXIEeHlvV0XkRT59JiIi5vba0pE/znHdYtSTn2yGyfmijn0
         w/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403854; x=1793008654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CrA01rti7Ay/Y5eHy2dsofO3a17OwFZMN974VKrytcs=;
        b=XMrxq+8731zsauodbCQsNRt9IYvyCmH7rlGQJtgCBVKkxxLGVKoER0bujf7aEfeaty
         OSlQAS9FwQZaJ1qzv2WMAnHHYFB2PseuADWStL719O27BPKkgxaNb6jWoXpTejr3wZC2
         GuSr2j1ruv4meI2s1MBlO10tBgzoQ7kX65I8PrgvWtFohl4La561kRFMsv+byr6wILDL
         3g8LcZ5vXey0yBWTx4C6V5OAvjqREGxAFSKfHKnX3hPvkfS/AXbyzrmrbbke7G44fZkk
         pxAbpkkuSRUgCWe9HLfXc3ysS1MmLGkg8vgBqsieVsTX50/ECWPphoLN4piZiReovUbF
         bjYg==
X-Forwarded-Encrypted: i=1; AKwUvBzWTDoG8wE9UQNkiKxLhe2Fd4F2HysvlkR0J0SMVTgxQ6VS4CHX3PNNjoPtBtoJNtOZcX2TFkF8xzvMHq8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaNLZLUqXHoasxxqu+hIv6r/WcubOsLHdLxE2lEPhEWb/ZXUNR
	lUSjIYbAtVymM0wRvo9nnCrfVUO3KH2fYyaQqVycwnv/fU43wTiRikiy
X-Gm-Gg: AYBFou2Bi0GVFtB9PkfyhTtNgoocGuIHUeB0Cdhh8khKV43BOvxtQgbyKeDK4SNXvbQ
	TQf+uFIgVMYJ/bPy+iS+L1AlKliDjkVv3MESkr/TTKfi1uQhxL2ywiN4GPBEI0Z4CxyQ91PvoWq
	leD0jz9APcKlZ2Pa9T6hkPQFHkZjvb3Bn+jYK4hLGjAdNM1DMW+B+2Jj+lZcumiMIuSQR16V4I5
	tsu/lsPPDH/EGnsio7Id3TM4LuxhSibpZDAhIn2Pi90hXRMcwYJe7gO9G1IZESco1Ghs51HU6Gk
	vU5ORFUlm8kKZd3Qyr4Gl+X4gU0pWFmVEgu9GZ6p01hAvIs0nNomLisC0FL9FncYVHLHoLgTOxG
	sw1P5cG3DEfIG6kXwlQhdfG1VpJjCnrXZ1fRerk71rxSnR+ZCrxRafFf8rX6hq6OKtRxhGanVvs
	VLwuUTjv1Cp6aoKznYe2+EN6Njht0njWgE5swpWtGLH54MkEPS3fepZHK4R7Gpl2mZlQKyBegdl
	8/xonsdroCxkj4xQKHdITlap+mndA==
X-Received: by 2002:a05:600c:a48:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4a1d7612bf4mr152397805e9.17.1792403854260;
        Mon, 19 Oct 2026 02:57:34 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm21740089f8f.42.2026.10.19.02.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:57:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 5/7] dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG LH400WV3 panels
Date: Mon, 19 Oct 2026 12:57:03 +0300
Message-ID: <20261019095705.91062-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019095705.91062-1-clamor95@gmail.com>
References: <20261019095705.91062-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Hitachi TX10D07VM0BAA and LG LH400WV3 MIPI DBI 4" WVGA panels
found in LG Optimus 2X P990.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/panel/hit,tx10d07vm0baa.yaml      | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml b/Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
new file mode 100644
index 0000000000000..4642dc14c42eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/hit,tx10d07vm0baa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hitachi/LG 4" WVGA TFT LCD panel
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - hit,tx10d07vm0baa
+          - lg,lh400wv3-sd04
+
+  avci-supply:
+    description: Panel power supply
+
+  iovcc-supply:
+    description: I/O voltage supply
+
+  reset-gpios: true
+
+  backlight: true
+  port: true
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    panel {
+        compatible = "lg,lh400wv3-sd04";
+
+        reset-gpios = <&gpio 175 GPIO_ACTIVE_LOW>;
+
+        avci-supply = <&vcc_2v8_lcd>;
+        iovcc-supply = <&iovcc_1v8_lcd>;
+
+        backlight = <&backlight>;
+
+        port {
+            endpoint {
+                remote-endpoint = <&dbi_out>;
+            };
+        };
+    };
+...
-- 
2.53.0

