Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650484;
	b=XaY4eAdYpa7UWZDklefCK2+ioK9ueCVcL4xhKT19j1tW4mL0+/9Likywge3NEnK3jLUK
	 tHl4SvLIk+2hvJhM6LdhKgEAfdkW1GJUumo40XSMobHVx+xiz5znU1rIsSwIa84pTgD7G
	 JlT6o8hYwdz0Xl3RyPzzLqWdIaohm5kMM9D9cZx67uTJv8s6r2IZaa8GPgv+BBtCW4bNi
	 LWeesEa5cnXHd78LeO4K6sVDvqiVH9iPOzoeEB2AmzEG9e+mypme4/vmGZfZpEz/BVVQk
	 B2d5w2xySu5LBwffn1nS4E7YE/+tX9UxgJ5WWUpFtAIyNiVHwwKxC+JCy/J7h3Wty4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VJpG0KekBa/NY2yha/o6EWqyLiVRn3sfx78mJkKNt7k=;
	b=LGb7MQmDOXk2d+eHQPzpqcKUjqafW3CyCw8JDBNEADsc7/akieX8whTzSX0mrVlUBZzl
	 RJSqTtX72fJwmcV8d5WrdIMo07nhvRUdG5xaNqI2+cv1CjFPTnvT4SR6pGmvZwnDC6HGK
	 viqEOrc7nqDVBulZQBDlSak3Clff5E6MePQ97gQDadoGh5v6VgRqQA+pBiPRJC/Mj0N75
	 /7iiKrnZ40ZUAvDwSVcmw8lrRFsA3Yb/NQZPHydvRexbrVGnDQ1vaD1+OWSn0QOlIJ3me
	 SO6Lz9SLheoqQlo9yMDx1I9oC9B6KT096BWvbHSyh5hD/PkrtkYp+RqzH36Hwqo5iRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JdfJlGfz;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B7D606A332
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97B7D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JdfJlGfz
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso22788675e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793650482; x=1794255282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJpG0KekBa/NY2yha/o6EWqyLiVRn3sfx78mJkKNt7k=;
        b=JdfJlGfze7wgCvUiIjxkJp5J7LkEQXr9SCfaD7lCrcEwTnSqiV6V/Fgu59HmJ7yPs0
         LmHn1MKW+31ahNi6cQvICo99kKjjHD7tkTlbGtAyiuIRxhYyghB4bco7AjcWD4lg5O7F
         OEos0sTuRA9Xpe0Qu8B31IXVmPg4mV7SsZYGNQyZxGk7zDu7zffAcSkfy45wpJSypm+x
         mi62d4hyhN5nL6F2byc36z2JH6KJuEnBFmSvppDy/Eg9D3X1SwFQHjLfrlaXAQpQ+Uii
         RlF0Lj+LsDJc6WiBAH4tKGn340mb1qs3j8ZYC3QqGO7htcb2oUhdbtjwqUuZmSC/AsXK
         9beA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650482; x=1794255282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VJpG0KekBa/NY2yha/o6EWqyLiVRn3sfx78mJkKNt7k=;
        b=gVIhJpKJVpW834CtxutBCExekMzatz+hz5x3p+KEJ7fgwgK9qXE2hj5eoXbz22CkPv
         1XAc+IbW7m+/gCeJy1bFshGU+2PA6NMqO4zZqJ6cOIreL2uPRq1f8NWYQNwGw91qeJRz
         3oN4gBJziWEz82X837NEpDz55Co6cq1usVTuOWuSYKxYvhTNfCjKnJxWVE/MdVsk9xG2
         z9Yv0fJClRLjcrFwt7G5UHfDZbSfhQvG0c98mW6iB2cBDKamg1T2dajr2EDF7D5fDvaQ
         PETRluHbzZ0G67lcoVbL+PR+tfCQePWSN4+mY0laCn0cmuW1vF68MarajvO+u8Wui/sb
         URMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxedH2UoSEVy1rbyJRTILGe2w6+er4RwiXUNrYrdesk4Op8cNvjCj2fqNRbf3ucnomKiXYzxabbVxVHuwk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzI4vTDV8BDbR8xmWgj/M26A6HdUtFqwkHjrqVkAxfibKPmfqb
	EX4ZB8yCu632xLnSV109qacz4f8VZNAQKSQViu26EZFaApPmCKGz1nVIK73d5EQAJbE=
X-Gm-Gg: AYBFou2Z5vTXEBaEwemSXqPFkYMPgjZz2qcGoNZ3auPHe+3dvxCc9MydtgxQGCIaA7o
	+BvOtgUkftZTfjU4pa9VYsUExyIpNiOWPAHY7nbJBeKdRvaKnsc2wGH5Vz+u1eS2jQu72SU2GwY
	8Z4p5I1vXuuFlAmMMdkqczRrlKR8xOPXLsc3GYJ6blonQjh+K65bGljfriphOA+dBFPlgJMWafv
	2bxHeiK9vjooDRzF3h5iM2Rk7MFVq6vU+BuMKOXIip8AB30M/Z9ZMbI7lFj7MvHPvf2R8q8pLfr
	vmuKji0rKCNIqyYwWPkTwfSV7QamJSMXdqB3kgljSKlQrATgBRJ4igLPC0NBtnp/YQbL1enW2x2
	rBYQA5ov7U3Q5B5gnmGt0N2/S+6cYBwD5hhALCx7gZkmFBx4Lg7qeNWnV3M7FEV0GFAcOQ5hans
	PxYL0IfH7oY3OCHuaRBw4HZAkwJFkTERydWZnwIwzqFZr+q3i+n3+gBG1s9zNQuSRqgF0N4Wl3J
	PvkVdy+2N31LBMiVCZo+84pFb1V7bh68DixuXRBGrB4xQPOXumH6L3Ugye6Jx8bSuVUsaaQmXcY
	OG/bKusswBK7DtRKWTbVaxrHqc6QG5dFuCiKL+hZ6gLmHmZ0Vsy+B1TO7ZNd
X-Received: by 2002:a05:600c:8b46:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4ac18c73238mr261757445e9.33.1793650481932;
        Mon, 02 Nov 2026 12:14:41 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6412:7406:ded:3229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a8d60bc5sm9559305e9.8.2026.11.02.12.14.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 12:14:41 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: pwm: Add the Ingenic X1600 PWM controller
Date: Mon,  2 Nov 2026 21:13:24 +0100
Message-ID: <20261102201325.29507-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102201325.29507-1-olivier@mgcrea.io>
References: <20261102201325.29507-1-olivier@mgcrea.io>
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

The X1600 has an eight-channel PWM controller of its own, separate from
the TCU timers that drive the PWMs of earlier Ingenic SoCs
(ingenic,tcu.yaml), so it gets a binding of its own.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/pwm/ingenic,x1600-pwm.yaml       | 47 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml b/Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml
new file mode 100644
index 000000000000..3ecaa92a5ca2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/ingenic,x1600-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic X1600 PWM controller
+
+maintainers:
+  - Olivier Louvignes <olivier@mgcrea.io>
+
+description:
+  The eight-channel PWM controller of the Ingenic X1600 SoC, separate from
+  the TCU timers that drive the PWMs of earlier Ingenic SoCs.
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: ingenic,x1600-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#pwm-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@134c0000 {
+        compatible = "ingenic,x1600-pwm";
+        reg = <0x134c0000 0x200>;
+        clocks = <&cgu 21>;
+        #pwm-cells = <3>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..c905aa13bcbc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12878,6 +12878,11 @@ F:	include/linux/mfd/ingenic-tcu.h
 F:	sound/soc/codecs/jz47*
 F:	sound/soc/jz4740/
 
+INGENIC X1600 PWM DRIVER
+M:	Olivier Louvignes <olivier@mgcrea.io>
+S:	Maintained
+F:	Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml
+
 INJOINIC IP5xxx POWER BANK IC DRIVER
 M:	Samuel Holland <samuel@sholland.org>
 S:	Maintained
-- 
2.54.0

