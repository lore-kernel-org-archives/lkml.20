Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09343F822A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883989; cv=none; b=F81C/MHtNOOILkrVEiISPbEnAIyvQJd4ljnw+YeHQs5S4wE1OlO226rDFaDItgO30uCyIpiVaY53HoTBlBrRkvA98dRM0jNxHftmh6nqTu+wg70Q1vSZIJUZdR3WcKwH4nLZinyMyFCTmEqunZ5iEY2B13st2YgaWCVHQNysRAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883989; c=relaxed/simple;
	bh=XXCAheqEwWEeNXTk2daG4fV+KXtS4FyM/T+IAPa7GmE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RGNnwqA6PxKFc1mh1sLo+i985JsyeaIjA2T5rA4H4TBmmuuYZx1wMuB5CQDLMfAOG3tfFdjibOm7HH6lV9kSME/vrut38ZxTIJavjQnae5troapuSi0KIYOB1X2kIf+n+9k99PHHz7KjD1Rs7i53w9RPD1IlIzrWKCfTFQ2A7aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CcZd1h3l; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CcZd1h3l"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1563873f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791883983; x=1792488783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SnEkf+SshAJve0553z+hLZ8mY5sSHw5Ad0IiJvmX3q0=;
        b=CcZd1h3lVFQd+meUKFFn4V679jpUAQeDvPsMEZVdOdJLPK4kIj8g9iLAseVaVK4qgp
         zbqRxxApNTUfZIYLxESROJf8GQ5/OiucAy6cvtHIkD6xcVfnWDVPVaNEC63dh+iJxkMC
         gz3vYWqBT6AI3yEVCeuFkA2avZ5AqfuyHSDrt8kOmrcFFAQ2UtGy72RbAHy1EA4mFvFC
         OTKSNuooX6pzw8hExVIO1ZSR6gMHGIjSRoO2+SmFS1HXPqmdXuJlZp/53VFSaxs+tqnE
         6JSgVG1LDFUurAWnYL9KH1P7yEFeZyzc0LMTiJEyigEaJ04uCNOFrwrs13SFUzuPkDJg
         51rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883983; x=1792488783;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SnEkf+SshAJve0553z+hLZ8mY5sSHw5Ad0IiJvmX3q0=;
        b=Ec23j7smWs1SwyWIuVccuGcuGhn1lsEoMpf/BveJXrfwSLtTS539KYehtVQohZoU2l
         A4WPge9S/eylzj2ErnJVGh0JyFtxF7yRcduzlg1AVAIYQbCEgT6eBMMiYvfYk66n6Tab
         Q01IdHCS4GVAXJnelZUlZt+gpGTGQPXuInif8hJ2NshKiFe6Pv9cYBKYIBjchglnpRtg
         3lisTQpmC4fS0J9rENbrLMgpUXIEH7NFzI1jGLc84+RmUB0NsqJNLRk9C6JYwv+MITK1
         j0qiYs8ixPK+jYQ27ZcyyJAhQ3JpUCLg7b2KvZ5ScqAI3JaWbkpo29Ooal/EQORod7AM
         hzWw==
X-Forwarded-Encrypted: i=1; AKwUvBwDk19uJ9yemN01BZp+KmvMa2N5a3Biiqs/vF9da2f9ALP0JA7bXQ7ZKHru3a6FHTYACCh/4liFP1sZgdg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJe4byl0GkFhfiPoK2q4uGX3nZxG2th4GQCh4h+tKiPHl3urqdE
	MVSKGk5Jc4erUF/7yn5obMNFMu/YsJ3rZV7Xt/VYHGgT836cqp3lsPGu
X-Gm-Gg: AYBFou3Y5P5l4RAoYCa4YA7F9o1y0mnLzDm81k5brn+8Yo+AeW3JGQCUkPw+vIv7G+X
	3YMqThZt1KgKTVaCZGNdQMKBZ/qjutcj/XczvgO2BI22CEL0gt4mzQl+1ntIbJLqWUFRWfM/fbo
	NF3uMBxjZA9Fu1hqSRF8pJA7TN6zIInPQeGxkOslTsvXgAoqRivp/YQ8A9uo6AugaFbYqVYwCaX
	AW6AnvLLwZ7185+8AN+38W3uG31sUGbmX4MU8UQSK5LYzmZL0kbsSVB6d6cMF+oz0CP1WTqeTeV
	YJtGXIsrFC1HhACzb4kInl6B9mBrs73rv+0YH6zfFkFsKEOs/pFy6Kt1qvLNAQCqHFxp6LKJhOY
	b+9UTTliiYd756bYFezLIJq09LvcQJ4nBhf28spf9lnbqqr8+faEq1XXYr95R7DX2tr4knfqqRr
	RBGcDK10E0RLcMUJTihQBpzO35Pe+ltpLgwEAmVC1kxwsS3WIDMNNbcv3WWUCyAYQv4vOhoSQrA
	x/jfqTQ2RmsQ1mmfdJg923t
X-Received: by 2002:a5d:5f84:0:b0:48b:86:5563 with SMTP id ffacd0b85a97d-48dbaae6f0bmr22382083f8f.27.1791883982560;
        Tue, 13 Oct 2026 02:33:02 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm3986774f8f.48.2026.10.13.02.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:33:02 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 06/13] dt-bindings: display: add a boot logo node under /chosen
Date: Tue, 13 Oct 2026 11:32:36 +0200
Message-Id: <20261013093243.505776-7-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261013093243.505776-1-maximpedraza@gmail.com>
References: <20261013093243.505776-1-maximpedraza@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Products built on the same board often differ only in branding. On UEFI
systems the firmware hands the operating system its boot logo through
the ACPI BGRT; a device tree system has no such table, so today the logo
is built into the kernel, and each product needs its own kernel image.
With U-Boot's Falcon mode the device tree is the only thing that reaches
the kernel, so it is also the only place the logo can come from.

Add a "boot-logo" node under /chosen. The node lives there because a
logo is configuration handed over by firmware rather than a description
of the hardware, as simple-framebuffer nodes already are.

The image is a BMP with 24 bits per pixel and no compression, the
format of the BGRT image, so that one file serves the firmware splash,
a BMP loaded as firmware and this node alike. It is carried either in
an "image" property, which dtc fills in from the file with /incbin/, or
in a reserved memory region the bootloader loaded it into, named by
"memory-region". Exactly one of the two must be present.

"logo-position" takes -1 on an axis to mean centre on that axis, which
is the only way to say it when the device tree does not know the image
size, and "logo-offset" is added afterwards. "rotation" counts degrees
counter clockwise, as for panels, and turns the image rather than the
screen, so position and offset stay in screen pixels. The optional
"background-color" goes with the image, since a logo designed for one
background looks wrong on another.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 .../bindings/display/boot-logo.yaml           | 151 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/boot-logo.yaml

diff --git a/Documentation/devicetree/bindings/display/boot-logo.yaml b/Documentation/devicetree/bindings/display/boot-logo.yaml
new file mode 100644
index 000000000000..bf4121f24f1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/boot-logo.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/boot-logo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Boot logo supplied by the device tree
+
+maintainers:
+  - Francesco Valla <francesco@valla.it>
+  - Màxim Pedraza Padilla <maximpedraza@gmail.com>
+
+description: |
+  An image for the operating system to show on the display while it boots,
+  handed over by the firmware together with where and how to show it.
+
+  Products built on the same board often differ only in branding. Carrying
+  the logo in the device tree lets a single kernel image serve all of them,
+  each booting with its own device tree, and it works where the device tree
+  is the only thing that reaches the kernel, as with U-Boot's Falcon mode.
+  It plays the part the ACPI BGRT plays on UEFI systems.
+
+  Since a logo is configuration rather than a description of the hardware,
+  the node lives under /chosen, next to the other things firmware hands to
+  the operating system.
+
+  The image is a BMP file with a 40 byte BITMAPINFOHEADER, 24 bits per pixel
+  and no compression, the format of the BGRT image. It is carried either in
+  the node itself or in a reserved memory region the bootloader loaded it
+  into, never both.
+
+properties:
+  $nodename:
+    const: logo
+
+  compatible:
+    const: boot-logo
+
+  image:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      The BMP file itself, byte for byte, which dtc can fill in from the file
+      with /incbin/. The device tree stays in memory for as long as the
+      system runs, so this is meant for small images; larger ones belong in
+      a reserved memory region.
+
+  memory-region:
+    maxItems: 1
+    description: |
+      Reserved memory region the bootloader loaded the BMP file into, starting
+      at the beginning of the region. The BMP header says how much of the
+      region is image.
+
+      This keeps the image out of the device tree, so that it can be changed
+      without rebuilding the device tree, for instance by loading it from a
+      partition of its own that userspace can update.
+
+      Memory keeps its contents across a reset, and may even across a short
+      power cycle, and the operating system cannot tell a stale image from a
+      fresh one. A bootloader that loads no image into the region therefore
+      disables the node (status = "disabled") or removes it.
+
+  logo-position:
+    $ref: /schemas/types.yaml#/definitions/int32-array
+    description:
+      X and Y coordinates, in screen pixels, of the top left corner of the
+      image once it has been rotated. A value of -1 on an axis centres the
+      image on that axis instead, which is the only way to say it when the
+      device tree does not know the image size, as with a memory region.
+      Defaults to centring on both axes.
+    items:
+      - description: X coordinate, or -1 to centre horizontally
+        minimum: -1
+        maximum: 65535
+      - description: Y coordinate, or -1 to centre vertically
+        minimum: -1
+        maximum: 65535
+
+  logo-offset:
+    $ref: /schemas/types.yaml#/definitions/int32-array
+    description:
+      X and Y displacement, in screen pixels, applied after the image has been
+      placed. Mostly useful together with a centred axis, to land the image
+      somewhere other than the middle of a panel whose visible area is not
+      the middle of the mode.
+    items:
+      - description: X displacement
+        minimum: -65535
+        maximum: 65535
+      - description: Y displacement
+        minimum: -65535
+        maximum: 65535
+
+  rotation:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Rotation applied to the image before it is shown, in degrees counter
+      clockwise, as for the rotation property of panels. It turns the image
+      and not the screen, so a quarter turn swaps how much room the image
+      takes up, but logo-position and logo-offset stay in screen pixels
+      either way.
+    enum: [0, 90, 180, 270]
+    default: 0
+
+  background-color:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Colour of the rest of the screen, as 0xRRGGBB. When absent, the
+      operating system uses its own default.
+    maximum: 0xffffff
+
+required:
+  - compatible
+
+# The image lives either in the node or in a reserved memory region,
+# never both and never neither.
+oneOf:
+  - required:
+      - image
+  - required:
+      - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    // A 2x1 image, red and blue, centred and 120 pixels below the middle
+    / {
+        compatible = "foo";
+        model = "foo";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        chosen {
+            logo {
+                compatible = "boot-logo";
+                /* Normally: image = /incbin/("logo.bmp"); */
+                image = /bits/ 8 <0x42 0x4d 0x3e 0x00 0x00 0x00 0x00 0x00
+                                  0x00 0x00 0x36 0x00 0x00 0x00 0x28 0x00
+                                  0x00 0x00 0x02 0x00 0x00 0x00 0x01 0x00
+                                  0x00 0x00 0x01 0x00 0x18 0x00 0x00 0x00
+                                  0x00 0x00 0x08 0x00 0x00 0x00 0x13 0x0b
+                                  0x00 0x00 0x13 0x0b 0x00 0x00 0x00 0x00
+                                  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+                                  0xff 0xff 0x00 0x00 0x00 0x00>;
+                logo-position = <(-1) (-1)>;
+                logo-offset = <0 120>;
+                background-color = <0x1e1e28>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 321ecb9f5b5b..0d1decaedde0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9174,6 +9174,7 @@ M:	Màxim Pedraza Padilla <maximpedraza@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/boot-logo.yaml
 F:	drivers/gpu/drm/clients/drm_splash.c
 
 DRM TTM SUBSYSTEM
-- 
2.39.5

