Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243336;
	b=u+uiYXFmVubQKnrvMgtumVCTi9nj2BLCiZqr2I8TtLfs3OgtWGF6hLfpWJbJ4e6LtwGd
	 T77BtaSj4zp8ASEJUZsn4YPgVNpOhA4GMswO9c8xkV+6KjXrlj08a/pToUk0vcninQRFQ
	 ZZ0/FXTzuawNi8o0lLwgMJC9t84hz/clcbgH4xmMCkBes/P//8Dko9oaveNIcI5wxTUQM
	 AskitGSZxuVyLQmpNrRQtQ2Kwxm4+QeTmsB7ZE5QCmi/ZTiC+sXTxPkyfQyN08OOh8yDG
	 KnaRuduYnBS4IfOTyWe6+kGjRg2o36QmGVhCcEGdAUA8ZGxOZyvLVvVotE6HcWPRKIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E+/Qu4BG62Yv3y9M2zB+9eKFlQqUCr0CqLxpIIRMTlc=;
	b=5EHb9DL1tEIKb+9o2qp5/cD1xb6gsHwUl5B/uVm/MRQK7MCSkY23s8O6zL4fLYkvrdBS
	 QxNkxMT6gNhxDAd1zrchPC3Eax9NCDmqMQjBA4wBlY5cotglk6G4npreKhoaExFwfSDfv
	 0iYgQCifb/HJx6VGvtKuln58vbuzng0BPl05UrlyUXVYehdkwebXoCwjn+t9An/Ma0/pm
	 l90hI6I166AtMD5LNgiOup600uqNWtEwo1uHA1MfR/TBVhMvj3giFPh8nsBOMKeAN56yR
	 zjlC+Us77zTxwbtTNobXd5XlAOiV7Bvz1PCCuOC1T5J7MsFXvexh9GPyj9z9YH6zhwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOrfwyWE;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CC6606EE92
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5CC6606EE92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOrfwyWE
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491aaed7565so698455f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243334; x=1794848134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+/Qu4BG62Yv3y9M2zB+9eKFlQqUCr0CqLxpIIRMTlc=;
        b=JOrfwyWEu5DGKVu2Z+gm6dYF7VYMJiVUjHqNcpHtdO8J2Bmk1rRkyS7bJCL7lKZxiq
         kKWJ2Y0dOHi9hkTY3KptK5DxDpOosKjfwtc7sIA2CgP9g2/w4CJHDHMkVuVkO6HidWxo
         snX9gLVAowCKgxeotSrD3DwuTJ2153gsKhC9x8+nYWrR0oO0tsEwoFgwzqU7pKOOQAwT
         1JUM2AmU5FEMGftwvolqCZbdEte17vMkgqxBW+QpXe0Zbjj12YCv4bZTxalBIVLrICcL
         iGwQS0AHXoTcT3ge6QlIzJsntavOA4lMUXJPaCAuTMvXufp+J9FZ6FNawH6vJWPMnsf5
         2KZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243334; x=1794848134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+/Qu4BG62Yv3y9M2zB+9eKFlQqUCr0CqLxpIIRMTlc=;
        b=go58AaaQjE2cwgCLlyF5mgI88FLkofdOmyQTATcKzk3T+B4ihWe5Crj9JA7PwVEQMZ
         LVBndU+6v7rhNNoYUp1EsAwMrPywCXHWg980DJub0x5ZN9B+df1vHH1+zAfSZgUCILQh
         nf/VDl5wHZLVtyJ/DtlYKIiue79a4FYy1VsN5FcoLsycn/3vcpmboGCyS9sHDDbirJpe
         nnRmavIPrG7NDQidHt8PHyoNB0zwMFVc6ZLy4TqjFVgAR/DwBnYJjfTmtEVwyuvMzg4g
         4BS6TH/GeeT8nsRXHZYpFvMKiELFnul2Un7w0r7gIKrq31gSkYhCYIYeVJOLteKp9tZs
         8AxA==
X-Forwarded-Encrypted: i=1; AL+hErFYvypWun+40ojroyP7yL6qdgZ/jxwaSRIKNS9Ez3mt9z8g0MCO5EkPuZww25BEAxIH01cfNT4OM+oSzXc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fYBbk3KiYgCtEw/NnVT6gmSkZGGMSU2+A6tw1LJFXCUuDm9lR
	A0UlEDeM0ZeQlrFOUNOnOU2vy9CO9JW/x73OxGn79ZoohBD8z8Z5K36G
X-Gm-Gg: AYBFou1b0qE8Tgx9wG+ojJfN7btsJ96WemIYlYEKPrQ9qUmuUelZILln03+uMR6JRAx
	1aDIYka9YZOtO5uhGZgVLZW5tB5VBSUmHyMLsAW6N6z0rltVpDukngDAvYMeJSmPRMst4RhByAt
	pxe1yauAaPfkmWcFCf30ZoqaNc4gYRMZTDqP2O+dXeUBeewixGtlZu7jdYdNIUuq7JJ5zZD53Tx
	/p4adg4Ud4q1Daye3NPft5TXKKJRk+6f9TSTRQXxkgQJ0eO6BlZGCjJ0J/iUPjxTynf6K8MZyYr
	ryWd5OCnEkCqGkdVoMt97A6JQF2c/2i+pN6IiHQDza3bfXfwXO9E6zKW3XiAb5EfDYwp/ur5IAr
	sxUtNo26GU1n/y5+qZMMsoivHYEH9A2F65STXSOXofEJFi4wdvdni0g/tWEwVDER790J3gHEuDs
	s1iF9lyRgVjgJlP6CZ7tKY+/I2R7rUj5pmudm13JgYyxkVuPoE+E5BrguXSD42LH+crKt/67QeT
	CFe1GUxD8HV6lTeqLj3wFhAX5Ul3MkVKJ7Iz5nfe1wIH7wzLu1MynwoI4qw9j4JyyXqXK+hRU11
	upSLbCdWv4tMYk7RWLLP3S+Eyw1RtmpVmeIpkOy0SXLkqPsnDg==
X-Received: by 2002:a05:6000:41dc:b0:491:d3b4:4e42 with SMTP id ffacd0b85a97d-498319f20camr30918f8f.52.1794243333939;
        Mon, 09 Nov 2026 08:55:33 -0800 (PST)
Received: from salem.wifi-guest.upb.ro ([141.85.150.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495974660cfsm11492234f8f.38.2026.11.09.08.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:55:33 -0800 (PST)
From: Lorena Tanase <tanaselorena3@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lorena Tanase <tanaselorena3@gmail.com>
Subject: [PATCH v2] ASoC: dt-bindings: wm8741: Convert to DT schema
Date: Mon,  9 Nov 2026 18:55:22 +0200
Message-ID: <20261109165522.6663-1-tanaselorena3@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Convert the WM8741 audio CODEC bindings to DT schema.

Signed-off-by: Lorena Tanase <tanaselorena3@gmail.com>
---
 .../devicetree/bindings/sound/wlf,wm8741.yaml | 40 +++++++++++++++++++
 .../devicetree/bindings/sound/wm8741.txt      | 29 --------------
 2 files changed, 40 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8741.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8741.txt

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8741.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8741.yaml
new file mode 100644
index 000000000000..a9a7fc2414bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8741.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/wlf,wm8741.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WM8741 audio codec
+
+description: |
+  Wolfson Microelectronics WM8741 audio CODEC
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+properties:
+  compatible:
+    const: wlf,wm8741
+
+  reg:
+    maxItems: 1
+
+diff-mode:
+  description: diferential output mode
+  $ref: /schemas/types.yaml#/definitions/uint32
+  enum: [0, 1, 2, 3]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    wm8903: codec@1a {
+      compatible = "wlf,wm8741";
+      reg = <0x1a>;
+
+      diff-mode = <3>;    
+    };
diff --git a/Documentation/devicetree/bindings/sound/wm8741.txt b/Documentation/devicetree/bindings/sound/wm8741.txt
deleted file mode 100644
index b69e196c741c..000000000000
--- a/Documentation/devicetree/bindings/sound/wm8741.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-WM8741 audio CODEC
-
-This device supports both I2C and SPI (configured with pin strapping
-on the board).
-
-Required properties:
-
-  - compatible : "wlf,wm8741"
-
-  - reg : the I2C address of the device for I2C, the chip select
-          number for SPI.
-
-Optional properties:
-
-  - diff-mode: Differential output mode configuration. Default value for field
-    DIFF in register R8 (MODE_CONTROL_2). If absent, the default is 0, shall be:
-    0 = stereo
-    1 = mono left
-    2 = stereo reversed
-    3 = mono right
-
-Example:
-
-wm8741: codec@1a {
-	compatible = "wlf,wm8741";
-	reg = <0x1a>;
-
-	diff-mode = <3>;
-};
-- 
2.43.0

