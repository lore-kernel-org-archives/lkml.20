Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C844825BB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962585; cv=none; b=LLiyAMvF6JB7NmluBGWRZM49I2xKQjSbVIci5ysIt5QiuOtCJJ8Yp6OE6We2hnAM1qBfPuQ+T1E3grhlEdxgr7+oLPGsluTMkA2a54ORWpiok9RsJ4o4OTgX1l55al2WOvgkdLJ/cO5fA3jId3RIm+ppO+ZZ/OKzagAbYreO28Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962585; c=relaxed/simple;
	bh=KDfB6WzKCxNKnAQO0MMr3WCuaPApE4DDdJllKHW9deE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NuQtp+3HZDdLvj+ajbczBe1v7/ifEJ9IQbL0VDX2mjDp5xujw/yOTvir+LPuWN4gkRGJMVfR27Qig6mAKdRrQDp0lCamRkuta8DSohQBsB/G5zwXjzCwGViEvn2FZr2W8LaMiEjC/eYnLPYekF8H5lyZTFwxjxXHoSRXY7KOIjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r7/S/dau; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7/S/dau"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48deeadb3fdso75390f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962578; x=1792567378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xDxjmt0bS4RhBRZPFlTXI4Mvp3X2uTTGOkn+NXVrE0c=;
        b=r7/S/dau52+u2udQx8CeSLih1/F6GxvtoHyatVts/S5W1Ezlm6U8CgoKfpdAN8yvdM
         A/26hjvUMvFQZJlipaQJCpiAQybtWAVKRBvha0R+9CXd8O6bFJEnNlYF0ualuhTdUSWh
         P/dBKYbulax6y6XVZHFRa/pZhRze8WecAHHyKHkfidAxidw+7Kw57hXA+XML6IbbKcaH
         8IhvS/g0hjXX6ngpOrGbKW/8jYMGQgPqKFEq0DFrtuHlUscbJfD1tUU9HagLfXeHhwqZ
         RY2/+muOdJVeIJbCJREIMZVh3SFnviWB2Ur228EyCTxEekXRBdzhLv+SaVr2dW1vZWRI
         aUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962578; x=1792567378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xDxjmt0bS4RhBRZPFlTXI4Mvp3X2uTTGOkn+NXVrE0c=;
        b=DqdfPYgBrJ0kQJyISCjqZioWc1wzLp13WbtgRbDm9qJoCHVx4BX2q1ABx/TSlbi7gK
         BKoGo3+zzdRdLaESe16wjbf1+gnHE3Xh8N3DBu43cORGGbIejLDgNI3xmlw2YWsrx8rt
         VoP/FXtazKVDsPyxqjx6CRaIds2gboO/Fvc4jO2h4IRxD0WJIGNcSqm7enMsbyvUuFvi
         SW8I6PYzwCmOty+P8S1kGnXJ+Oi9JXeFus/EX3yLYuC5H0A9pB10rYra8oOtjCoEto5/
         hwO/flSs7FpncpAabqgJzZ5Ku5AHodSkXUQCRjDF+4vr7AaWCNcygymjJ5DaEnhHoWhg
         BaJA==
X-Forwarded-Encrypted: i=1; AKwUvBz7ziyJ/gdi33LONNyBd8ZoLc0yksU31BS7GmFjV65Rl1FGPuGRsQffA+D5JpeQqLiXIO4fEVe6KzI43k4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIx0mZEavkLNTWSfzpjhtCttGVSEK+Fr4VoZXu6vpL7tjqZuR5F
	z/IB4QD47Z+hc9pH25aYvYLIBFuQHD5ZubOXLv5dZ1EIzoOQc4+D11wR
X-Gm-Gg: AYBFou01fD75GHYYaZOU6mF0bw4PUJw0LFOt465AYyVWo8zUfAI5NwvFNjZVInmVuA8
	0WPC5odPjxTIv1bOdpHjowwVPbAm0XcdeMEzCzfcu8qvC03ovcmvdC//8d0Zc4dTP8atitEUYKg
	gL6b/y3UBQZhwHydcoBwWkf61yazs72Xlu1VdtFCSmbcgKzPMbVaIUmOLwrgRDl6ONW/sapQo7O
	DWsHE0zgdGRITldBU4bZ/1144FsUqwdixIZuxSS/6D/VyPEbHuM5BP1sJIoSwZB8/MoGNE5OOit
	nOQz/7VK8kbj95fnodT87hnAI0eOF6nhqaSJV+Xxf7PKTinYRK4eTxH7zsQjA81R4X7kq73fAYL
	bEJtRzwx/mJEHLxTIGTr/UR7+3f82KS2KCsf82IV0F2fgzOuAHnMwW2EzLRtAPv9xstbzzKXuU/
	IN8jnIGvDgNRL9NNdS2bB/m3aNUPVak8Pym55pIDl6efly2u7U1QxRnFd5X2h9CFQkzoEONlmGC
	WRLb0xFalwyThsntSSuyI9B4iaJT0IbhnXhwWra6Oy9VQiiZIlnYeoYEYYcGJRFZt8Y/LLFr3Ih
	IItiSyBrN+HvbYiy+YBP7Opfjvypdcq+ggq8nKBO9mkqNbdeg6LhVh8g2xi4Og==
X-Received: by 2002:a05:6000:29c3:b0:48d:7579:1cdf with SMTP id ffacd0b85a97d-48dba9e633bmr15389523f8f.8.1791962578267;
        Wed, 14 Oct 2026 00:22:58 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:22:56 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/24] dt-bindings: gpio: Add ZTE ZX279128S GPIO controller
Date: Wed, 14 Oct 2026 08:20:47 +0100
Message-ID: <20261014072109.1759502-8-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the register-clock consumer and GPIO banks.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/gpio/zte,zx279128s-gpio.yaml     | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml b/Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml
new file mode 100644
index 0000000000..132c7126fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/zte,zx279128s-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s GPIO controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The ZTE zx279128s has several identical GPIO banks. Each bank has 16
+  lines and is described by its own node.
+
+properties:
+  compatible:
+    const: zte,zx279128s-gpio
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-line-names:
+    maxItems: 16
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+
+    gpio@94407000 {
+        compatible = "zte,zx279128s-gpio";
+        reg = <0x94407000 0x40>;
+        clocks = <&lsp0crpm ZX279128S_LSP0_GPIO_PCLK>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
-- 
2.55.0

