Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918008;
	b=oEx9Cc9HkghBIEnAhTZdPyqXv6UTIvqh1dQEwu4NNkKpd2K90TXE6tfCuy6iIIY24SlM
	 eos3UldoT/k5Zt7Zl0VS//EXXGHhgd4hBdAs1sjx8KtP298hPSH3SzhPppELB2L99ypla
	 HWNV2RRjYlWXooa/6Ed6Kh+pVj61HWYReaT1mZ9xd6McZ/kmsCiuPjGetQn3R8TpD4iDT
	 MOmSHUUHjz/yUDDd7ontt9uLU5RKQHbMzNMumJ/2rWJ+VKDpeZ0DIorZRTAaf1MpGxtfD
	 qxp4lxIipUs6LMQDrT32NqP/qUiI/QLiJyYf7BPblHd4SNNx0idFPeGxMohlcLg4dfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pSPsp8WYgTyYIXd11T+owTDZiioNpZlULQUYbYv9uh8=;
	b=F4Yds2lJEi8GE/ySvSM00eqj3W5F1eKtPqEAJHe4AHRyKsRwn9XY0BAe5duYHqVknUV8
	 b1T5GNLGSUH4Sz4nHEk7R4KsZrT9cUQjE/VHXdibGD88p38MqtgXfXXv+okgkJfQ1Nssy
	 rtv6pQy2DVbyIb5p+jbVsdF7aLMmr2NA5R17hlSkmiLXa9FbaEljeY6pB3iVDpa0QeoAC
	 59E9KklxOqbmJlLI8NyAYp3ZGjFQ5qkWIA2rm1TemKp/4OtyKgRmQsKmISP62yD0BG74j
	 opbaqPzccoS64Gqnt1YmnpsgDZGsjawDTxgpMp39YMcQsi+pBwvvXHapCk0RgU82FVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=GglVcgwI;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948E4606A325
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 948E4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=GglVcgwI
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e4831c028so424721f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792918006; x=1793522806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSPsp8WYgTyYIXd11T+owTDZiioNpZlULQUYbYv9uh8=;
        b=GglVcgwIKfAuJzhKvif1QWUuF1DmaBjTPt73jnHhBWyFQGu9HtWWP6M2Tz+X96NCD5
         T54adqHu+0zbxD/MI23x4hZTgKLQ/89mWBumVhcq3Bq7KBtQo8hsBKF72Tol3A1Fo49s
         MnPnsbVy5gmajXbl8wvpi9uUcTJpvb9Am1YQrIskxtNpz1XmWUMWvWi4sG6+h01t8jKu
         mW5Q9EHUpw4MeWGCe3bWziK4S7W/GF3BvX8PYIeTrctEE8cKFQ+GEIYT3dJ0r8bnSm/a
         YeNhHaZAVgRYEPVANK9zwMcPLZexrkAz5cRXuEgqjYU1fbxPN/hmC3+Noy8aTJktNeF1
         +3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918006; x=1793522806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pSPsp8WYgTyYIXd11T+owTDZiioNpZlULQUYbYv9uh8=;
        b=Dhm2UjXZ7vqCgUEckj2936d5eOhwMDTAr0tPaQJlnVMAD9GJxm6LAF6xjM4J/EgcdJ
         ewa9ECXKV1200oJC8o4fzAhW7ZDyHavWoTzYXPWjX2PuER62iCkMf/BPAenpV0kuBy/D
         h2B/3rwOLHE1+QrONkc2eqLLcuGtlZlGB7Mt4mitTpq5mi5Bbdi1YD82XRqJFAiZa6cQ
         MiSNntwnZsmOl6ZHZFLmFatjA1JZSHU8qA8Yjr2RRX1T7Mob/2GC4Qi7A4wk51ox5ed7
         PSzLpKesV6xuGerCIsbIBW9xYVk3IG7UOrwHX1bzXOO2YpH2BtnRBwgsveKuxw7QWgat
         B52A==
X-Forwarded-Encrypted: i=1; AKwUvByCMV3qfSkLQo6XInPEr4xAQ2l/t3xRMCOVqs2vVJLoV1R8gDz5Vogxk6Vn4UYTMUzX3AcfiL20RduvANw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2gvYOjpM/y1EOriyDzXGmuQC9oH3haMhkUjKe2vD/nD9tsgb0
	gi1MoDxwsiiMMqZwP/ZHzlPFUG+6X07kGub+4GwZbH30HyuPzSuWRPwMwmwbGfDIG3M=
X-Gm-Gg: AYBFou0P0AWuX8+EiA7SyIagLAx15R3/k4xjetPxsT0GrNnuFkVKEr+IUfbqj/Ocveg
	8Xgfw7d6EisiIG1LUy2Q9qoIUYParIBDdR+yzkthtzw32Oj526GAoJSHac5/1zI8Ww9RdiemB2j
	4/3U8sdNPw95il9wv8uNz7W27dYXahRQFqad4g3BnYsH5GPJrKmXw/znicvnZsgrT1carBh3Hp1
	u/A9tWr9q2zR+ZqX6QaXYS9aUoZxSF9aMjuktv/j1K/1f0TZVx4pCFzpy8BcHcpdafEv/0jHESf
	VZLyFx6mzVwJX1yVKKLQCKFfy6scKxk18dPBXggV6d2IPmFlc5tTmMczh3yazcHCZThmlpC7x1W
	t+sbVbnE6V+Ye5pWmP0w8bbFC1Uf5ZYS1LjMc6B4FxxWhm0ps3KCTwBJDh0hlG4tFq7guJw8V7R
	D8LHhg+9tRngrSyacEkndodsgjTYcjrnBb4jGMvU1YMSVevyHeMkjp/N7AKj9XbOUXZ9zmKl/bG
	a3N150H2eylBNUF2tRaVhFsnyOmweTKqb27XBo1hPsQsNXgjdiYSap9rTLD0IQ9qSP/83EHLxGq
	uWn6Itl1cdJsXGqOUo+4FEsjAibWTvVB5vtxcinUbnIgSVuv7IqH7sxbFCj934v/HsfNJOankA=
	=
X-Received: by 2002:a5d:6f0b:0:b0:48d:f488:f32a with SMTP id ffacd0b85a97d-48e3eb8e5f6mr6646358f8f.56.1792918005553;
        Sun, 25 Oct 2026 01:46:45 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb99esm8616707f8f.23.2026.10.25.01.46.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 01:46:45 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: pwm: Add the Ingenic X1600 PWM controller
Date: Sun, 25 Oct 2026 09:46:42 +0100
Message-ID: <20261025084643.93167-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025084643.93167-1-olivier@mgcrea.io>
References: <20261025084643.93167-1-olivier@mgcrea.io>
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
2.54.0

