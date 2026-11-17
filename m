Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912259;
	b=PKmJDCD9Nv8hRvpuyi4Mpkanafe9KTQcvsYM/tlz1BgM9BAd/W7RSUmBaQobPrJJlRDB
	 IBVM7qfhZdabq7zbUtteVDXsKmpJa1eGfSpORVLsDrWr3MDlNIIbtNjUnodzo2PhNPRiM
	 w94XFYsrrzBax7TqIL5romryV9i+R5DfTPTsjSQQx1z65cuGlwiYTTQwE45yrxYE/+iKk
	 kT0/hwLrXzthamsDEZFhjcqWfUOqoivJcBVcUuioAlKdcdBGHh4Z7NU77lWXzii7Twob/
	 VJLVxf+23o8pf2HwCf4Z5eT4v43cJv3bL8sB5RY6Zm/ZpNT475ivRV6+ogDrFDkbWsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4P0NB3VMBLnpdAs1DFprR1jE/RwnP4MqbaYmn8aT4e4=;
	b=hdgwN74LqR4vIVHAVp9vYIgexdM2KBE0Rrxhf0bjA2MrCKbZxmVOViwAeoPaYKYP3oFK
	 ZiydVtzDG+oJerkL1FSoWZ5/Qxd3FD7NZDPmrgLKGiJn/CwOkIe5mXK0VWUaIjNdEgPFd
	 cJeKBC9MpDDqbUk0rsJTy7bDG60FplUg5lxLmvL/2qtkVDthCoNgO1w44lPOE+mNakaOe
	 ARHxi61E5baLv0hq69uUZK4x5KYW8KzacP6YaMw8hgwkK7IgLwY6N9lTfDe/Rtl4ynMfm
	 wagqsiA71gf8LAhhMx3Wr0soWDZ5OI+gAFP0cMXU0zMk1GUlcFBOuHTSyZGALgVdU9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OHZMc88f;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF228606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF228606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OHZMc88f
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a32576da88so545313f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794912257; x=1795517057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4P0NB3VMBLnpdAs1DFprR1jE/RwnP4MqbaYmn8aT4e4=;
        b=OHZMc88fL0Y3ZOM7HvBq6PnkbDMfe2WWSDzt9S6xySiq1ZMexL5Cki0nMDoLFTh7+/
         zkaoirwpf1n/fh/f+V8+B/g+QOInR5uI/ueS/emwC5xFWWbO+syNYp9A0CetBSXEdiWy
         qbwuLzPUTNZn9AOD+gUavFgKhlMm5YPJS2Yq7DKsGAuclBE8Y2ydtoZCmPsG+iuLpCUk
         fzs3fe4utARTlNuWFnXLZQ1+G0S4j4y37nsva/FwpRke5mvaD+Vjl4mk5Q5MWG+jQUXU
         rc6HtIN5fASzP2LGxFSdj7s4bir6sRq0E5AK+NulruDhYw77Za9sZ2d982Ibt+vCkdg5
         H/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912257; x=1795517057;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4P0NB3VMBLnpdAs1DFprR1jE/RwnP4MqbaYmn8aT4e4=;
        b=thZcUGhWu12PFsP1SFINb6HXFhSM0d2xbtLL6h+bHmk31tCCUqdMzXqzFyT2WUzKMi
         9RaK8D8ahvc3Re19oKAHCT6+dGSmsgmmZ2Jce3VjxyLsSIPxywqV7zMxqzOxGWYyXQpD
         WIwGRGY9m3zaAGstV0uzCP7HDQ5JWGWvcbgZibfkqU3BeRr4fOLYYypfsJecIlNFEOXt
         xhh7CdjZ1qvUUrlSTxW/NUTp6jlTegcvpLupP5VblFTU9kzrkvn5GkHllhFqvCggTu5F
         gVKgyxg52t/RNH2NZwElwMHicg1soR7O4DsGQppc+iKesDT5KDo7hDpxV6KCetiIdnBE
         +2BA==
X-Forwarded-Encrypted: i=1; AL+hErFDtj8m44aG2rEcfja4sR3oycTmYvcLKB66XHw69LWSlzG2+BjTPTm/En85ik6DF7y/Q6KjlNrfJpqmnJo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uuzErNTRnIe78K8R+vbiWqz3CXPjaNgpjjz4BLaGNK1at8+kI
	2wMkcTERypE09HbINLLkjg4kfySGrMXhTFLIU+nal0wn6dqO3xIJpXC8
X-Gm-Gg: AZFdTZeFAwvM+cHwiNwJWQdtw+rnKnG7f3lacpIjiKAa/F9zdLEFY+F42kBn02y7Wyr
	09ggjdBMEl61tN7RDJT36rmARvZXSpZmWnEDeffBZbUewWXdc2AQY3L6uFtVm0DGa18OoGMfyJl
	6MbEkVCdlrHeZYH4bupGgVc3R0iaeb0j7xOrxYX3xlP+BXA+U9YKoGAj2ykPHI79QskmzE5gckH
	orZKPkSF5kDwYFQ1G5xUYHmU6eTJRIGbFB6A//M6D5L4wwT5AdTMetxFXak4WG7xOyTdButURVP
	ZM7/fnmaVI38vk39lpxUyMjVN7knlBTkLTot5g6T4W0DAaStCVtAYCqXxb8nMjcPoALi7lhV3Yx
	kHqGNotudYH5rXYzMbwShLXLPWWxfQQSezhwR6Gd2vL32V56C20QQXZLHGxL3f8jrVYKFy2kog9
	0M13awh/wkW9wIjzK4Z8vcGM2ni0kE0phl/lsmS56A2P3yXXxQvHPBvKoiZ2SpR/VHzxRGOxXDg
	BYzFEnQ7OWe1KKj9/Zlijmemjw4LFdLixeya/f20dehRP1qHh8g+s5uWeT4sDlA5AOz5A4yuWUv
	wcZGb0E6mhc=
X-Received: by 2002:a05:6000:310a:b0:48d:ef7a:e59f with SMTP id ffacd0b85a97d-49c712ac8d6mr29895302f8f.17.1794912256903;
        Tue, 17 Nov 2026 02:44:16 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a2e6c765dfsm6167711f8f.33.2026.11.17.02.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:44:16 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: iio: proximity: add Imagis ISG5320A
Date: Tue, 17 Nov 2026 13:44:13 +0300
Message-ID: <20261117104414.1182364-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116074013.355363-1-tadilhusrev@gmail.com>
References: <20261116074013.355363-1-tadilhusrev@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a binding for the Imagis ISG5320A capacitive SAR/grip proximity
sensor (I2C), as fitted on the Samsung Galaxy XCover5.

v1 -> v2 (addressing Sashiko AI's review of v1,
https://sashiko.dev/#/patchset/20261116074013.355363-1-tadilhusrev@gmail.com?part=1):
- Document int-gpios: the driver optionally reads it during the reset
  sequence; it was undocumented in v1.
- Reword the description to the chip's own characteristics instead of
  how the Linux IIO channel is exposed.
- Simplify vdd-supply to "vdd-supply: true" (left optional: the
  XCover5's own grip sensor has no vdd-supply node at all, an
  always-on LDO not modeled in DT, which the driver's
  devm_regulator_get_enable_optional() already tolerates).
- Rename the example node to "proximity@28", drop the unused gpio.h
  include, and add the blank line dt-check-style wants before the
  child node.

The binding was drafted during XCover5 mainline bring-up with the help
of an AI coding assistant (Claude Code, Anthropic) and reviewed and
validated (dt_binding_check, yamllint) by me.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
 .../iio/proximity/imagis,isg5320a.yaml        | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml

diff --git a/Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml b/Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml
new file mode 100644
index 000000000..ccb84b29f
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/proximity/imagis,isg5320a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagis ISG5320A SAR proximity (grip) sensor
+
+maintainers:
+  - Adil Hüsrev Tepe <tadilhusrev@gmail.com>
+
+description:
+  Imagis ISG5320A capacitive SAR/grip proximity sensor, connected over I2C.
+  As fitted on the Samsung Galaxy XCover5.
+
+properties:
+  compatible:
+    const: imagis,isg5320a
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: active-low data-ready / proximity interrupt
+
+  int-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the same INT line as the "interrupts" property. When
+      present it is polled during the reset sequence to observe the INT level,
+      as the vendor driver does; otherwise the reset falls back to fixed delays.
+
+  vdd-supply: true
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        proximity@28 {
+            compatible = "imagis,isg5320a";
+            reg = <0x28>;
+            interrupt-parent = <&gpa2>;
+            interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+            vdd-supply = <&grip_vdd>;
+            wakeup-source;
+        };
+    };
+...
-- 
2.53.0

