Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793077854;
	b=AKBKq1jl7YRMj/RUd0HVc07rgDJKniThr/1kWmVKcUKK9yO4zyvRvB4nle2AcpnCkejL
	 221aJGeZFpxr1HpcaVglbW3c8i1tjmXHCLjvcnY7XZzoks7RPsX+ldxpR8SgRiOkWuctp
	 nce5jNxmbq5PqTP2ap39k6l4abjbvYU/vPLrkKccU/Op8GPDEPzdNVoKnIw5784U0r+Kp
	 X1dUbGyCuNMu1LOAlIUp+fzkGtt+BUUuFMvw4UYIUKRJ8oWhkTib2r6SRpC6SHWsmZwoR
	 POKPHth/kk/nhrfndU6dyUZlRjInaPoGj/91gzz1DjwfENXYhzK2QWTlUsaexdJMiSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793077854;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=E06s/cYl/MF+dF1juoGfGqRiNSBz0/IyMNMQSo10dNw=;
	b=zcNsBsYtCYBbzsCG+jiqGufvaxLrUC97fjSmrXfgQe0jmyCog/A4JOHGWP8uhYu/UdZc
	 mpxWfCNSyUdY8PxGEotCXaYnLHqgYWpmJZ1AYYT3RpQJml/OB1J2Q+2YIOdIqfdTDHQxR
	 PT10JIqZnU2IvaK4UbyY2N90c69o1zKjP8IIDuRxH+O4jULwQGbjciV2H0AIonCALD7cU
	 4AfVzQcSgMBhE9nvOCQ1M1/uia9R78XWxj38FoOvwzTTM2N0sc38M/ASSKUYccDdjJAd1
	 r5slpT2TAzp7AKUC5TDjrBwaj6baIbw+rKo6NNPcrsXg7FZCw05qKz5IvJdsgzecoow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=qP0yYSWH;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FFD606A31D;
	Tue, 27 Oct 2026 05:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4FFD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=qP0yYSWH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=E06s/cYl/MF+dF1juoGfGqRiNSBz0/IyMN
	MQSo10dNw=; b=qP0yYSWHhbSCBYHrIxRzKmhHo2V79unQnm1UFF90J4vQ6ftBNf
	d3pA1n7oo0A8tLXYS58IHGm/HturAbXkttccOhPag3QCzc5+5N+72PFJdZr+WYkY
	Aujhb9aH1lGCeO7M+cNhb69w+zTl2lIzGTxeIDfgjpkLXNqjowbUupres=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.11])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgA3szdYMuBqJIhOAA--.1146S3;
	Tue, 27 Oct 2026 13:10:49 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: media: i2c: add Giantec GT9764 camera lens actuator
Date: Tue, 27 Oct 2026 13:10:47 +0800
Message-ID: <20261027051048.213177-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027051048.213177-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261027051048.213177-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgA3szdYMuBqJIhOAA--.1146S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZFWrGw4DJFWruF1ftr17GFg_yoW5ur45pa
	ykGrn8Jr92gF17Wws3tw1IgF1rW3Z7AryrGasxX340yFWFqFWftw4akwn0ka4xAr1UC347
	Xa9IgrW7KF48AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBIb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY
	1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4
	xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCa
	FVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8t3kJUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARENB2rfqlYHDgA2ss

Add DT binding for the Giantec GT9764 I2C lens actuator. It provides a
10-bit position DAC and module-dependent advanced actuator control (AAC)
parameters.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
 MAINTAINERS                                        |    6 ++
 .../bindings/media/i2c/giantec,gt9764.yaml         |   71 ++++++++++++++++++++
 2 files changed, 77 insertions(+)
---
 .../bindings/media/i2c/giantec,gt9764.yaml    | 71 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/giantec,gt9764.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/giantec,gt9764.yaml b/Documentation/devicetree/bindings/media/i2c/giantec,gt9764.yaml
new file mode 100644
index 000000000..febffa359
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/giantec,gt9764.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/giantec,gt9764.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Giantec GT9764 camera lens actuator
+
+maintainers:
+  - Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
+
+description:
+  I2C-controlled lens actuator with a 10-bit position DAC and advanced actuator
+  control (AAC). AAC parameters depend on the lens module's mechanical response.
+
+properties:
+  compatible:
+    const: giantec,gt9764
+
+  reg:
+    maxItems: 1
+
+  vddio-supply:
+    description: Digital I/O supply.
+
+  vdd-supply:
+    description: Actuator supply, independently switched for the lens.
+
+  giantec,aac-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 255
+    description: Module-specified AAC mode configuration (register 0x06).
+
+  giantec,aac-timing:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 255
+    description: Module-specified AAC timing configuration (register 0x07).
+
+  settling-time-us:
+    minimum: 1
+    description:
+      Minimum interval after programming a lens position before issuing
+      another position command, based on the lens module's damping response.
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - vdd-supply
+  - giantec,aac-mode
+  - giantec,aac-timing
+  - settling-time-us
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        lens@c {
+            compatible = "giantec,gt9764";
+            reg = <0x0c>;
+            vddio-supply = <&camera_io>;
+            vdd-supply = <&camera_af>;
+            giantec,aac-mode = <0x40>;
+            giantec,aac-timing = <0x7c>;
+            settling-time-us = <7000>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8..6872ad5fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10866,6 +10866,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
 F:	drivers/media/i2c/gc08a3.c
 
+GIANTEC GT9764 LENS VOICE COIL DRIVER
+M:	Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/giantec,gt9764.yaml
+
 GALAXYCORE GC2145 SENSOR DRIVER
 M:	Alain Volmat <alain.volmat@foss.st.com>
 L:	linux-media@vger.kernel.org
-- 
2.53.0

