Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955789;
	b=UqoYFKe0Hq+41iu7YwWFOPtywgdWOxbFVe3cBChJFUMpkGbZWOcMnqXosHyYZ/VR415Z
	 c5ZyNeR3Vmz6msjUMMDiODoSoYBK2X5OWRlgx6AZnsqh8MQgm3e/HP3caTKmuIB3OpNb2
	 0jC7DkVyenDloGfH/YgS0ETjPaeQQOALG4dPAGMezvXcChAs4kAGuc1+ubseX7/iRENB3
	 Yd9Kydso9SSKS/eiegmx/ouvoi/Ut2maXDCPW0FTTkb1nop7PCL4EKqD2E4ZZ6ER0LmzX
	 apa/KlROqFCcfWrqpHhcTTGDbGLdrFIp3Kuuz3F71WpUU/Q4GONq1ebR5yxp5EQCBbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7DeFc9otasxZEGZwFUzRH8RX2baoMN1ocp4U5Fzi2nY=;
	b=UTg44XsCodzh+lJpsN4uHj+8kUXt9KopIMTZcBfgW9QLaWkgFpLWHHOmo/WdFfUaBECS
	 noXYPCvR9PZ5h6/V0xg36hY7zjQCezQ1qlMcJH3+1ruLC2hwqff57uyUlcBOKXG1nCPYT
	 WIyN3gO/Fp527EU5zqAfo1/QXqh6Pgip58UKfB9yt0kpsdzmBHWBEbgLZ9eGI+4B1qqBU
	 exM9MulykBIaiJU6VKRisuTdjfV96l3d4vWFEbCIpIg2yAOtvxPFjpBVbF/4SMDNvJmma
	 fruCgYlC9BzodCDao42Nl3w+rURRhLzEqmxAsGE929bfteaXOLGKTLgG86EFgWY0z7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=oh7valtr;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA8D606A324
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AA8D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=oh7valtr
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1134438f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792955787; x=1793560587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7DeFc9otasxZEGZwFUzRH8RX2baoMN1ocp4U5Fzi2nY=;
        b=oh7valtrkmKMdQvevEIpsbvmUYS2B86kxe5EKnfOszdH2bZ5JD/mQJdXd09w1JLvB1
         Qt1vbg3Ag8vO2VyqUOg8spaLE9Nqrc+6dCGWuHUVb4MXjPWuoAJRqu25eCTysrd0lbdA
         0NMw6g6MsvCMwt3BnY8Uua8CgnqlLA8TlLqL5jiY0Vk+Z94uq0caKIoBaVdRsfHK/xo/
         E64RojtF55nfs9sE+8L7z3dxtzKnjbMkinWa9wtWlJ+r2gvs+NVqTmQ7mrozV5b/3cZ6
         xIjZwiYjoAs4ZgGnwDpSG1hhuXxplXaeMIimJHEVDVT2tp1G71EcmMTTLBU1NF1GlkWW
         ecCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955787; x=1793560587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7DeFc9otasxZEGZwFUzRH8RX2baoMN1ocp4U5Fzi2nY=;
        b=luad7PvaQbT9Fr1zEjDUN2PquSlMALZ25CjfmXQzfB2YWAZkK9NI38j9Z50utXa4Mz
         fxJqa35ETQjw9L1Svp00stOs1W2L5FUWA9NEYcNLXiDS33XELGZW2z7NDXGFfg8QiwDT
         fHB6SyVgTfpaUaW/TUJm1IC/XvflAaNE/s5iE4T/2VO4jZlbn8ZCrUll4n/n7u64zoLC
         OG9HpX0PN0R+CnOJgoBLt51dZ+kBeZ48k94QBGsj25K4t4Bc3BfSnGAEwJjzKBZGkQHb
         E7gtqc99gWfXVk1kIi17UChVtXIj81kj4tTR5BAUJAQ77CaTTI1NhcZRQv7s4liNqc2V
         ib8A==
X-Forwarded-Encrypted: i=1; AKwUvBy9sxGhI7zH0qiSIiPVBIa+EdP3r/tTdOw0z/FH0wTvgKJKsz8g3hnkgsPJIzVKoRNlMgDmKyDUeldtlgM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQowlX9wJ776MwlqBjD9WszrhGqE8rnK1Tf8c9D2FAVtUFjOv+
	JvqkN1P+ncHQvCFTKvpmKzH6HBdUXWcBC6jyRLniBR6O7digPHfLMuhH//a/WAVS2XY=
X-Gm-Gg: AYBFou1p8miFNJpbcfPgsa0vRMV2cHkZWiHcApjHz1r+7KtOk7xblzEyicWTfXEiNF8
	QVi+Y41XYxgdcyzeF7ecQEWYjwJbP+OnooGRkLe2TcQVCaapkV+PFb0lFaGqq3g3VUuNE7FWH6g
	Fo988TyFXKSE01jy+3x8mXH9vksJtoCjE4a8FepWsKna95JylqqJd6lNMeXMKGpS828QWjcqcWT
	5rD/dLHG7H07wvpN0bzX8mMfOybV+CMbBfxX0cjPM0WzeqwOghavzMS/8nzj9lOcib9mzNE98fS
	pX/jQIPYlb5QUOGbc6ZEvai0y2dfFCqANSOtVZ1ue6GVyWSQ2VmQ4brUHBknNTn9kPOzfHKyOOd
	FtRExZeal1Cga8tEWteroEvlgZuWc/OL9UQbkvmwQ8Zh2ZjgyZ5rx1v12n405x7C9kEw/VaJIpz
	ricxQfusdWlQs8NzDjmzKIC3Se3vSGmYxWCpmSwcFrvEi4AjlxHehsdVM3r0saPtR4dD6otXYe1
	aX3pa6sdAaFlhPP8HHBx8y7UgPEPA5izpDNn10StQvHwWAfuMcviSd+vtWIQlNgegj/CGN+kVwX
	/9Uqy7Nmlri+fHTE2+qxSobECGx5y6zvZQA=
X-Received: by 2002:adf:ff81:0:b0:48d:f58f:c98 with SMTP id ffacd0b85a97d-48e3eb9e34amr6121463f8f.40.1792955786568;
        Sun, 25 Oct 2026 12:16:26 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm10082051f8f.13.2026.10.25.12.16.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 12:16:26 -0700 (PDT)
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
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 1/2] dt-bindings: pwm: Add the Ingenic X1600 PWM controller
Date: Sun, 25 Oct 2026 20:16:23 +0100
Message-ID: <20261025191624.9219-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025191624.9219-1-olivier@mgcrea.io>
References: <20261025191624.9219-1-olivier@mgcrea.io>
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
2.39.5

