Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE23351DAED
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194271; cv=none; b=I4XEmgwQfzvio8BULvI1Evx9IAtXeQH2u/K6RGLFrCDM6x7HFA5I6vqAMcIYm5VR15X2cDQ+9eXWnj1KVEJL3C7mxDYpoT0gKvCGEUAs5T2PvYCQQwN1RUHXeWerpJeRMpzuWN0zUeX+cgur5cDsxLH5TCKXP3Hl8f48d3lDPtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194271; c=relaxed/simple;
	bh=0bOxnq+Qjeh+sxAlHlASgbdrTP5Xke/gEBsr1dGPWwc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E+9PnDTCY++4/5/Li9OMrfcan2r5hiScCadTHCmliOiuRZzLhf9641gy+Y6myRddMkbC5eJz/Eozve55Z/1McDeP9TuCC1+JVO6HzxTZnXnxtcvFjOHzGj6mcqxzfH1cw8eUPux/3ZgHPTtsCh4n51oz2f+0WnXjWNvgqHC5hBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxa86pxk; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxa86pxk"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so7773005e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194259; x=1790799059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OHFYvczNQQ8zbB57FCazhQfFZ5fguvDLVHqTQCN5Cj0=;
        b=cxa86pxks2OvJmhjl2gKHFKGCbvSm269fshF+eV+GcZMI7KpHBFDJqDjXJpFxqxXGa
         AtowXnFpYspunZOSHqIrDcTnVkncgQsyXm25ODPh3MFB548CuLtZOxxijFcZFwy778/T
         7xdDnWLp0eaITiv6wF/REXpQYtmKjcXdybIOBhbTo3a7vmon/LGMB6LT2bzbFVgi8YDk
         vi5FidlCoXEKwW4saaViCVIMpeafWRVrWDgdQj1WxhcE1lezbF355e46YbtLHHEUYqTn
         vo0fzCYx/RD5kFZ6C8FvZ12iDNFibFBU2zfDgovkD9pUBOm/zu9+LKvI6WmDiFLfzaYv
         DyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194259; x=1790799059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OHFYvczNQQ8zbB57FCazhQfFZ5fguvDLVHqTQCN5Cj0=;
        b=pEHSpnAKeLxoGre9yRXlLqwhXJvqCsBK4IEpECHg7nHTDEFUIZi/DUO8aGRtM9F9O0
         vDzztupeajjEdNNxbfZJR8BoA+WGtZ+dkqf09Z6+oyw1vHIhaOYTKf5XArr7tR7tPcUF
         /d9qbjCa0heUvZxPsnPWwC0pkcOr2sqG5KIfzGKmnJs+o2v5pI1MIZUaMALYFLdeRLQw
         35fKgcHBKmGCpN3ek5rot6p2fcelymIjTWKwd7Mxrnye99LsiuULupFiDpn1MPzPwVY3
         5EXZXaZqLoheyp8V4BtGDkyEyZggWiQh81IyuvTDNSCpSOyCgbgpcqTVFGIUpshSgmJr
         g3GQ==
X-Forwarded-Encrypted: i=1; AKwUvByWPhLW2f4NTUEIGz2eWO9PDyErlKvRBxbx9h+ocn+3EIhxutepn/HtQzBlXBiS7e9tT7yGp6eX2Ndhu3E=@vger.kernel.org
X-Gm-Message-State: AFuF++lHvzQ618Upgud9BCPfv4v2P++1Rc1p1VOqBiFIFasfMmiaXPMj
	MmXcKbG0nnUlT1VNAmsyysqPqjMG/1Xqhzk3JNbuOY/Mb9usSx1IKRli
X-Gm-Gg: AYBFou1FYpyq6xxChtgXx7I7OO+/aBpmP1aWrkQc1VoRVBX6Y6jugp59+yuNkpqVzMt
	Riqq4LlK0YnGzbglC4AuNBqT3McEiur5wdSc/igvxREM9+dH6qosGTR28bo87j3vM0w11Ln1PVP
	p6d4QNU7OVpkoRIH+Onely1pvBbqgELZxIpIxHz7inVGCzwGJoOQMb6djEVChcEuaUUkeXyUo7V
	Xprkbt/XP70fiRs7tbNOwio9FxokjzO7rNFHB6uAgSs40a3REoJYdCWiaNQAUExET5CiY/C9NoO
	majGytj+QjuZYmSilGWWzY6UlZ47cdHnqmwzmkKfDs8MZk7yCDilnT7NRv9vBeG53MZTLUxmEcz
	dXrSTjW7FI/2VCBVFotmobJY2wKAowCAVdOMJClLpVc4DhjuXyeMFNy6I2PifMaXNoUJOkR2H2s
	CTfAnZQggxB3vH4bhIVndZot3/q0VRVaHa8J2SQivSGdlOmAOZqYZMU7yjGmtKyd/SN5tX3WLkb
	PRaDovbWyts5TJMg4jFMC04
X-Received: by 2002:a05:600c:c16d:b0:49f:cac3:c68a with SMTP id 5b1f17b1804b1-49fe66f9ff1mr4161775e9.31.1790194258869;
        Wed, 23 Sep 2026 13:10:58 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4c8dsm13559295e9.3.2026.09.23.13.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:10:58 -0700 (PDT)
From: Max Pedraza <maximpedraza@gmail.com>
To: Helge Deller <deller@gmx.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-fbdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Max Pedraza <maximpedraza@gmail.com>
Subject: [PATCH v3 5/7] dt-bindings: display: allow the boot logo in a reserved memory region
Date: Wed, 23 Sep 2026 22:10:33 +0200
Message-Id: <20260923201035.51007-6-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260923201035.51007-1-maximpedraza@gmail.com>
References: <20260923201035.51007-1-maximpedraza@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Carrying the image in the device tree ties it to the device tree, but the
image and where it goes on screen are independent axes of variation. One
board sold to several customers wants several device trees that differ in
the logo; one customer with several products built on that board wants the
same logo placed differently on each panel. The second case would otherwise
mean duplicating the same image into every device tree.

Let the node point at a reserved memory region filled in by the bootloader
instead, so one image can be shared by device trees that differ only in
placement. The region starts with a small header carrying a magic number
and the geometry, so the kernel can tell a logo from an empty or stale
region and bounds check everything against the reservation.

A phandle to a declared region is used rather than a bare address: the
reservation is what makes the memory safe to read and what gives the kernel
a size to validate against.

The two ways of supplying the image are mutually exclusive, which is what
the oneOf introduced here says. Until now the image properties were simply
required, since they were the only way to supply one.

Signed-off-by: Max Pedraza <maximpedraza@gmail.com>
---
 .../bindings/display/boot-logo-clut224.yaml   | 40 +++++++++++++++----
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/boot-logo-clut224.yaml b/Documentation/devicetree/bindings/display/boot-logo-clut224.yaml
index 9dc3471763..a71fc09a7c 100644
--- a/Documentation/devicetree/bindings/display/boot-logo-clut224.yaml
+++ b/Documentation/devicetree/bindings/display/boot-logo-clut224.yaml
@@ -62,12 +62,31 @@ properties:
       index into the colour lookup table. The property length must be equal to
       width multiplied by height.
 
+  memory-region:
+    maxItems: 1
+    description: |
+      Reserved memory region holding the logo, as an alternative to carrying
+      it in the width, height, clut and data properties. The bootloader is
+      expected to have placed the image there before starting the kernel.
+
+      This lets one image be shared by several device trees that differ only
+      in where the logo goes, which is what a family of products built on the
+      same board but with different panels needs.
+
+      The region starts with a header of four little endian 32 bit words:
+      the magic number 0x4f474f4c ("LOGO"), the width, the height and the
+      number of palette entries. The palette follows, as consecutive red,
+      green and blue bytes per entry, and then one byte per pixel, each an
+      index into that palette.
+
   logo-position:
     $ref: /schemas/types.yaml#/definitions/int32-array
     description:
-      X and Y coordinates, in pixels, of the top left corner of the logo.
-      A value of -1 on an axis centres the logo on that axis instead.
-      Defaults to the top left corner of the screen.
+      X and Y coordinates, in screen pixels, of the top left corner of the
+      logo once it has been rotated. A value of -1 on an axis centres the
+      logo on that axis instead, which is the only way to say it when the
+      logo size is not known to the device tree, as is the case for the
+      memory-region form. Defaults to the top left corner of the screen.
     items:
       - description: X coordinate, or -1 to centre horizontally
         minimum: -1
@@ -103,10 +122,17 @@ properties:
 
 required:
   - compatible
-  - width
-  - height
-  - clut
-  - data
+
+# The image either lives in the device tree or in a reserved memory region,
+# never both.
+oneOf:
+  - required:
+      - width
+      - height
+      - clut
+      - data
+  - required:
+      - memory-region
 
 additionalProperties: false
 
-- 
2.39.5

