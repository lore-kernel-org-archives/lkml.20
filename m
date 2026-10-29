Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250398;
	b=LartrBf0fvzHBfQjMCv8qsSJvpd7to+S0WCwvRadqVO0QRls98BvQrzI0EKds/8YxgA5
	 Qv4NWVpshidP0ykNqinAS4X8mYhZSfqzGTzRTL9EbV+1Nk2IlFltAzgf8t6TUt4SmoYqP
	 /AjjFJUVQ504BZgwHnZggtV9IZbHw/ydN4tNzU3RATBmYGUesAHrctKzSwGDEf+Y1no71
	 OQ01NxjfCQcMavcfpQFeI1j3A+/p+dwNv5bUY8GmVJLlj0KGLCPLvbRmiM+NufpWueEfP
	 TMunSjMRQjLH31gRocuA5iH4hyziVfII1vba2tKvBt/d70f5dqBiEwH1B3MASABnrbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CrjcbC2vvSsIhs0KIikEko6Gkv8aDugjcrbnMMA8X9U=;
	b=kBKQYeLIUmxKYhTpYBv+Jq3thN2hunQQJOUe+Tday7jGIEYSWtC3RTskagQp59YpD0hO
	 T1O5a1makkAZftvoBqMefktsyf6QsuYbTAlRgB0KoKWyOAPTXE5/L9509JxM9Ue0Lgp64
	 52uWdNcJS2HF42+4yPKpbRHD0N1tzTIUscvHu5z/lbQbtX40EgQyzS9HtZ8QEp17TvWM+
	 Nl9MiheDpvPD87QbshzgxbWQz/SFXHSoVdYmQf/QyKq5G4R/c/m32jOzZjUSwhkI9WTfS
	 UOkKXZhXc1Raa25aRW6BnkyLkrS09y3sd2p9yj2p8JvyBqhhG55ndHpZXP5WFdPozMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UyvQrkiJ;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507AA606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 507AA606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UyvQrkiJ
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2e96b8bfb43so5551125ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250397; x=1793855197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrjcbC2vvSsIhs0KIikEko6Gkv8aDugjcrbnMMA8X9U=;
        b=UyvQrkiJwzXJc8eMaaaK0LEUM9ppujErOpcxkDs/qShRsUCj1CjjOu6r/RFkbgvpkw
         QctJjzbyQLUI8ZXwCQxMglGw4gtkQVeMNh9hY3f+RUCopw4KstBuNDYMr1l5wioScD1j
         y0MZb6EMJnGwHVtU/36GzFx1fsHUwFz4yWo5Ftfl/zyFrigUwFAn0ACxAjmF9c7848EO
         wC1Mw9jYPSgzUBApr8acU3ELgKEDVQap3NcnC74E+LuZo9/EElYA6bTPeG5puNbohGnp
         GuVeOOs307BbGvPyriIRh/nr2EjkiRrSJYceMkkaj8qu0nV/BpY0ZTtPUk8ef67g68cS
         4xWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250397; x=1793855197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CrjcbC2vvSsIhs0KIikEko6Gkv8aDugjcrbnMMA8X9U=;
        b=e+SOI39sify80e4EaPCi653lTopIpQqzsCucs556NSErT4JZGMgUy8CT3aKJk9C9ob
         gkea6e1vAfp0IaSOzPtXltE8ZmWf/l2ScdeyghbCyYChQm4bM/emgCUB9PDdNwuZNAq0
         EmJvEKVUmBDZvfZ5KvkLpTeyGEIF/+3KozRi8MtAOW4fk4fk3vnRcKfe5VB6QbTDkF46
         IOUeB7jPpdwIcUEjs8YlGZsqJwyiSXOCa3e9OnemIAkTk0nsVhNHjVezvFwFNfD78jkt
         6ieDq06ZhWonsGHbjbAWkfL8EwdgmDgs0qlXFNM9wXbYHub3bLSJs+WXBVOtMVDhkhOk
         8nmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxb0Vebb8CrgDAqu7cxmncSiGqzYaaodiCareN85ahwvEx9ggH2E3jFhj2nxCfFCGWwHP9WFOmI9ZXekxM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvRb7/6tCNECiS9A1+Qy9fYYuSNjismDAaDJ+G9OGCSDGmVqTn
	NubN0Djgz+OgQLJdbzPq590ruUgkjpjVE2EjGyFnWhZWqV9tL0kgWSg4
X-Gm-Gg: AYBFou3MtHVTeax6UdWJRBCZ8DWqa2luj24lGM6+S7GAbWekEHj/vioGhw+PmeimkUf
	I4w4UBJOUZR0vf5LL6cSCxVFyW6uWkIqIzCGeF1r59tYDUtf9qrauem6ywGzpd3AL5jdtTCfBWZ
	n0lcpbK3/kljBkvsfwTU5pV+yVD85eyGlGC/BKRuD1BausOJQVR2PYOj2NYX59yk7DQyjal/yWr
	B3zOOMhRHWy9aHcHr7NiPBYQTnlavT7ARnt/1ZNZG7/G2eqYjnko5xTTsUaFAalh0OF+46k9Vcj
	MJ1bI29hrTD5zZNqhXP+EjkPHq5Ths/x9Dlv9t4f9KM6KJXnHkEIAFmxnenoLMKwPrPbkys5WHy
	T8Q1UoppWPpM2K4CEXovGD6OHuU76GvrcZfnvpvw3eqcnMNUXCBy5aYbR1LAFaP+SHg1vNmq4cQ
	WGy9ZsKKV0eqyMEbcpmPbyjEiQuqCu1T4UNT7VFGIBxhyiEz/luFYIVUEiTBcsxzyW5XdZGgNTH
	U3plARIKlRg9n20tky+1GwHqQxS3iXscPhCdpSjlX7Va1N5P1ezOxF1686q2LL8YE1TkB9sWzFd
	KSpxSCqG89ihRm2o52lblApKxTCP
X-Received: by 2002:a17:903:3bc3:b0:2e9:5ec6:bfc9 with SMTP id d9443c01a7336-2eb00338d1emr39201665ad.9.1793250396614;
        Wed, 28 Oct 2026 22:06:36 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:06:36 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:46 -0400
Subject: [PATCH RFC 05/12] dt-bindings: serial: Add BL808 UART
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-rust-bl808-console-v1-5-b736ee920078@gmail.com>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
In-Reply-To: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Kwanghoon Son <asdfkwang@gmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2

Describe the UART register range, interrupt and baud clock input.
Initial Linux support targets the BL808 32-byte FIFO and reuses
Zephyr's bflb,uart compatible. UART3 is D0 PLIC source 20.

Link: https://docs.zephyrproject.org/latest/build/dts/api/bindings/serial/bflb,uart.html

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 .../devicetree/bindings/serial/bflb,uart.yaml      | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/bflb,uart.yaml b/Documentation/devicetree/bindings/serial/bflb,uart.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..df29d258f0a1c6d7bb283cf19c4157436991b64b
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/bflb,uart.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/bflb,uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bouffalo Lab UART Controller
+
+description: |
+  UART IP used by Bouffalo Lab SoCs. Initial Linux support covers the
+  BL808 controller with a 32-byte FIFO. The compatible follows Zephyr.
+
+maintainers:
+  - Kwanghoon Son <asdfkwang@gmail.com>
+
+allOf:
+  - $ref: serial.yaml#
+
+properties:
+  compatible:
+    const: bflb,uart
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Baud rate generator clock
+
+  clock-names:
+    items:
+      - const: baud
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    uart3: serial@30002000 {
+        compatible = "bflb,uart";
+        reg = <0x30002000 0x1000>;
+        interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&uart_baud>;
+        clock-names = "baud";
+    };
+...

-- 
2.47.3

