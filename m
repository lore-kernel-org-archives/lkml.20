Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCEA36606A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376427; cv=none; b=QHev5sW15tuybD0lGG5CzjmCh1n6lueilbSU6pDGTn8Q9u/qtbrd/LdYF9tvLMrVPhBYPeui8t6XmC/yhg2yjeklNDWUUkjdP8BW/Ymcy+fzxN154x7QlZK167fumewhn1PHMn1T5e2NsKTD+PrMEgmo8O7YSQ2USJvwgTkJ3q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376427; c=relaxed/simple;
	bh=ZThK6w33sNeSJm6i+TcvTGH7nC9nR7E1kVeNR9qy2n8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rwXzwVw3sn8XfCbb7ESqoFfzc3mZP9QCy4nAa/RypRqkARsEkV8av7JUp0eI/WHHzUMHOcxfK4e9DHQQyJZdmdCW+Xw7zHI3Rzm31mi+gQkgqMKw7jIlx/UhhxjeJs6d4GtShAHUqNMAc8VpjheK5A52Nb9mmlzE/FqFxiX5GxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHQ+GRaj; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHQ+GRaj"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so901674f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376419; x=1789981219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JkGTDT04pW78/8HwUzjAbakPSC/5O9ox51K5klLa3hc=;
        b=tHQ+GRajkKYQKWHFzXoLVGcbAldVtcqZIpfQxBR2MmUS6RB3fAJZjs5taHciQCFDTO
         iaxndw+jbbJh8ukbOHaFF5+hAiM8UgeZo7eN9Oio/weWefkrTAQhTEpUd8xR6yZeCgIZ
         iKpuf7sBRNCj8eL+WVBONpAbGajyk5v//yo3xDToe4w0xndBtRnZH21yM5KM69YYOR8Z
         J8suBSTkjWF/j+S3F7pVOaVAbJteu5bm4bigWswsT6AHea3J2ngctX22ccFFpQkYUCw3
         ZHHU/hAuCr45GtGcaUiopMFou3g5d2YqEngGBqVJbDcu75F5annlbp5io3Nsam6/a+nT
         jgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376419; x=1789981219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JkGTDT04pW78/8HwUzjAbakPSC/5O9ox51K5klLa3hc=;
        b=G0nonFtaYgHBJr3PNt3z4oG2gnCZlkXMIk6QgG1TF7re+q6ItV2fEL54Dr81iMcEoH
         yhkG0VD6s55UzOoM/Aq0D68NiAIOeC4CaOR4eXWv+Lvla0tx6Dt+IZwNLkfJk1LEXJ+q
         yL4T9K9qnr/LwY7GvFf/POivtv8Tt3C+TRMk1xY0lpyVm4n6LL3/01e/RSROs0FwmEuC
         6TOROGbt+SyoL489+18Fm1dHRShtg6D16f+V0jc5HtHEYiwV+iFdXbgQev5/c+dgRmJd
         BOjJxDGh0mRdUaZpO+7w9YPRJb6eGAt3f3Y4bFKPAR+dQYfwwhJaFA9nYoHICYMnnN6z
         85zA==
X-Forwarded-Encrypted: i=1; AKwUvBxGTDYba1KN0aUKhpdWUlIazS7O3UyO7y07emMNgwM9XQ5Ne7m9Kqbh0Da6aEFpPx7hIzlYNeyNGUYQWk0=@vger.kernel.org
X-Gm-Message-State: AFuF++mRFjzOTCM0MgeVCPAcHkRj430HPR7mNmWE6n3gS3gdO9e4wyn6
	h2ETIWIGlvugZwThjmfJ9KuIXi857gCrKKs9tBrNFGmwUlhZ0C7TRCny
X-Gm-Gg: AYBFou00qkrExnKugfrL5aJLGEOQkUIZ4m1p5oZQG4X8YxE4jxZP8rmRz3KXg325Shs
	utO3r5QumlLPe+rDyvBiog9V9ZBry1B6o6Svt4rl0OjlunJRkUpoZFFAWpjy8OJ5+rLa8nITdu4
	rup+x5xV7aZq1i7529pFGFn9/FFu0We2JcVQYfeL5NEW6mpJ2ILIXsgYmLAZGVSqoFmBHP7ik+L
	lo4GUXlOw7AQu7k5g64IXbxTqFT4AsJ3d7wbN+nAFZjk8sxJmqxxPdfqwyzDR2tyd92JonqfD/J
	2Uex17XPP8AwYSevM7A8zlG4bOkGzLMAEdEl0P11DB1HIL5MtcVkX6G78vTXOq/qtecF9SzD+Z0
	G2ekrJZL48Aq0662YGAlCAScbKhVoXG76b9vnn8sXC7N5sFtAKlBYltoOZfYR50lp7tlrDWueow
	i4XRygr3O+n/8Uhpuo5ohsFvVsEPisSy/gFcc5L46P5ILuWLL2cLY9XRunej18Tr7HqRyLoA==
X-Received: by 2002:a05:6000:491e:b0:485:b1db:5a58 with SMTP id ffacd0b85a97d-48702b18bcdmr3736086f8f.14.1789376418642;
        Mon, 14 Sep 2026 02:00:18 -0700 (PDT)
Received: from anthony.local ([2a06:c701:9cc4:c200:33d8:8ea2:e077:ebe1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm25245851f8f.9.2026.09.14.02.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:00:18 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: javierm@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andriy.shevchenko@intel.com,
	holofermes@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	amit.barzilai22@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/6] dt-bindings: display: Add Solomon SSD1351 OLED controller
Date: Mon, 14 Sep 2026 11:59:26 +0300
Message-ID: <20260914085931.66857-2-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914085931.66857-1-amit.barzilai22@gmail.com>
References: <20260914085931.66857-1-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device tree binding for the Solomon SSD1351, a 128x128 65k-color
RGB OLED display controller driven over a 4-wire SPI bus. The binding
builds on the shared solomon,ssd-common.yaml properties already used by
the other Solomon display controllers.

Assisted-by: LLM
Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/display/solomon,ssd1351.yaml     | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd1351.yaml

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
new file mode 100644
index 000000000000..80850c2ab5b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/solomon,ssd1351.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Solomon SSD1351 OLED Display Controller
+
+maintainers:
+  - Amit Barzilai <amit.barzilai22@gmail.com>
+  - Javier Martinez Canillas <javierm@redhat.com>
+
+allOf:
+  - $ref: solomon,ssd-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - solomon,ssd1351
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        oled@0 {
+            compatible = "solomon,ssd1351";
+            reg = <0x0>;
+            reset-gpios = <&gpio2 7 GPIO_ACTIVE_LOW>;
+            dc-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+            spi-max-frequency = <10000000>;
+        };
+    };
-- 
2.55.0

