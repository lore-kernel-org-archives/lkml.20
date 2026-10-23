Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792788132;
	b=2DPD0et8tpakk/X8oSt+qI3kmFnl4yBBJO8TYEIkjivE+XdMfguGsFs2fjWYltmkO7GU
	 Lx1s3gN+Si95vrKBzIvkvg+gdbMXb1rCU+41XIIvxXeR5Mu+cgOeiR7uV8AfMKtAlk40s
	 k/YnuXPpWqW46WNY7byGLfB1QQ+9HdMc/o4XlMMIakunR9CMd6ZCpaspyYaX+kPr7t0i+
	 7BmCiz6cVtpp7AKVNKlQjCHDyaTBUiaMP9VDogqYpYuDgydjwqiU2fXGgIcDGEO0CTUyK
	 oi+hRpqwAPLBokYT8zvbv9DGYx4Cc+XKNe75J5MT6GZd2R8CQAcqcOC7dJbl+qNHGBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792788132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CltLoSVZI1vl9e5Xk8AH5ABIellf5efpdTrcem8ydxA=;
	b=MXtUHlVAIxwB9aZBoO2+pQp1VjlgHSTSveIm4QP/G+myE5zhwwzJ+tc/WCbml46zcVT4
	 iPAQGzpm4eL9x3DWID0mwfIfNmh+cOH5RLbidmHNP7tdbNNmNixj6iGCb3ZkyUpR3YPF6
	 173gUQ14pyGvUR6IRTCGgIHaZebOCEw3oUvx+OImD2Z2CZakguSBrakc8TuKR1sOjijzf
	 y3RfkiOe2cFKmDYm0eXLAgG6VxwxWLgGpgj43iAYbBMh1oqWcZoYCvTDx20q8bK+0+C9G
	 2ncJ3zMi/HBQLGjCOvAN0+A0dGCgtZb9bDz0nGgTRqNl0iN0qhyimzdYKgGokQCuwBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=oBwgfwHm;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D770606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D770606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=oBwgfwHm
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1625383f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792788130; x=1793392930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CltLoSVZI1vl9e5Xk8AH5ABIellf5efpdTrcem8ydxA=;
        b=oBwgfwHmsmBxfTS5JX5faiudumKHXgvyGSxkRfoSfRdtoBdDGifQhNkwXDGZFrdbLM
         8cFvt7/panM+aqJVOdfJZE6KWSVNcByOIC/JoCTQZYTPP4uWqSRBG4PBQz75NV0Ipe9F
         wHUFc7co3li5NzRlwqZY6l3sXhtOW5hRYK3uT8jlE1HAFYYaOjOhoIum+LErH+ls1efd
         GmmpSqooWmac6Lpyas+yN0e+D5maG6px4YdIK/DL6dqJvU31vbeJwit18gc06ZkwjCk+
         GDffnYK0+S7/4E8YjhLF8buPz+z8XeTCz54JP+vYhxw/74iPIcDJKZXJP5PTVXYyitTZ
         wQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792788130; x=1793392930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CltLoSVZI1vl9e5Xk8AH5ABIellf5efpdTrcem8ydxA=;
        b=dw/oX1KwjcvFqyW8ZTZoju66/FkDZEGuyfiSApKnQ8KmBsO6Eyf8nVs1oTlTx0D42S
         leSIrPcGm9169lWCQd83Uf/Vj5FukVIqn6bOeFKp2HAObItJ8ALtUzK87JTF8/pwJClb
         3s/YgZuCAxqChZNk0FQHq2nWA7pvzSliY3xkF6BnT11wlKkcmyFSrx/Ib9PM2/9Bg5Mg
         4yCvUsGyWxubhh3diO/ccovMRzLrkFnE8eLBOvmztMTvsrh0PGf4E6hEIBTsIkFKtXTq
         544EhtweuDFmV/gXY/t52PSW/13HS/tW47gxBNDnAD3nyKuMBZzuJZZyV8NSaIASQj3P
         BMmQ==
X-Forwarded-Encrypted: i=1; AKwUvBylmhacKE0LwowyeeDMP6rJ5FA7rejD55oaJrHLT2bFvXQ/t8yza35TXcsKSw71LLx4d6xlHdW+wG0CMCk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhr+NyTKtkpOCBqhwCT06bxZhb6qE2LlyFMpx0Nma6jez7vnYo
	MtWSrwGtTDZu4+ImQIfrfed/9kvGlTN9NlUUcjYRG0OSPVBlrqpuJrXTM/g5E1m5T9M=
X-Gm-Gg: AYBFou0CBtIXdoFFe4nGqCtQdAawLJmq8rf2Qe/btuKVg6qM9H+F7hz/HNpxUKh8eyF
	QG/w1BDG9h2msnxzQQh1iz3seiy/ZqAqKCmmmPA2V7h9LXG1Qf68jlH/8Nv3q+3WOCxVP9qRnHT
	UfvJ5VDIn13QtbWD6A90nc5zzsbnOKj+MpEVnuZCUyqm/VBQskZwSE8WYgbdKiV4Wl5C+fyRTtg
	2Myniqv4mpOP9RTdiclfmd78ISQLbGDDKKvChv+EiBe0LOtTZ6cJIYq9LmfrWWyIaB4m2LWfGXL
	lb8iLzFbMyGNfBPu6R0wj70jSja/Qfxne/jld3OU3TYhwcYKoZZbId8bMscZLdXhMo3MMV7eFv9
	Qm17P1x6SSfaEYB/EoHFZQ35CGV9+1oVCVc9a5qKfBKSGZcnbEvMtPWniTgw3Vz+YE2kIIhxTeq
	Y3omX7LTqaERqdi7g6ro4UkE2vcfICqV2NSKHuqwQcMdfgNKD9ZD/HCD5Ql+JPX5mA10fAyQ3Gv
	Ox6LW7IYITUf0no/4Jrr9uz1tQetLRHKAWs3O2z1SFRLl4iCsFFQy9xHtEF6VawsUtA4okgyskq
	kfh80gPZ3Xs=
X-Received: by 2002:a05:6000:470a:b0:48a:f4d4:e1f3 with SMTP id ffacd0b85a97d-48e3ed1ef39mr167225f8f.13.1792788130622;
        Fri, 23 Oct 2026 13:42:10 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4ba7sm200998f8f.33.2026.10.23.13.42.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 13:42:10 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Date: Fri, 23 Oct 2026 22:42:08 +0200
Message-ID: <20261023204209.48556-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The X1600's SAR ADC has four auxiliary channels and none of the
touchscreen or battery engines of the JZ47xx ADCs in
ingenic,adc.yaml, so it gets a binding of its own.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 .../bindings/iio/adc/ingenic,x1600-adc.yaml   | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
new file mode 100644
index 000000000000..7886836b10c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/ingenic,x1600-adc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic X1600 ADC
+
+maintainers:
+  - Olivier Louvignes <olivier@mgcrea.io>
+
+description:
+  The SAR ADC of the Ingenic X1600 SoC, with four auxiliary input channels
+  measured against a 3.3 V reference. Its clients select a channel by index
+  through "io-channels".
+
+properties:
+  compatible:
+    const: ingenic,x1600-adc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: adc
+
+  interrupts:
+    maxItems: 1
+
+  '#io-channel-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - '#io-channel-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    adc@10070000 {
+        compatible = "ingenic,x1600-adc";
+        reg = <0x10070000 0x30>;
+
+        clocks = <&cgu 28>;
+        clock-names = "adc";
+
+        interrupt-parent = <&intc>;
+        interrupts = <11>;
+
+        #io-channel-cells = <1>;
+    };

base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.39.5

