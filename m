Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250440;
	b=QAh128T2NwFpP+uvg7L5vcx4rY1rGQE/jlrp82ziwpW5V9+s8ae/RLHh7Mz8xosmtHGf
	 kEUBVWt1+HcRURAXzTbCq3z43ZYLXBTtBfuqoogyW6TYY7hwZ08EO2JvhzVAGsnTMd9hq
	 MfXQn3uFaEs8v9gjVRuL+jyH78rrzxwGjKd3b2vXCIMbRoUBj+s6lzTiKixEjXVX9YNDd
	 u2g+5mzQ8/pvMq/WtugiUEnqTPSg2HFP4VCfKwc7lJE8Rx8iJeBXdL1GKwv9ipg5Z02n0
	 vZ7hsWQ9dwDsMEUuTQKDvpR8XGaOSQl4LCA9bM/swnvcr3uzykcI2d+pF7iTMTJauSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zGV4hq0i8RZtAPVqoljw/C8+Ety28xxbkClqaDK3k9U=;
	b=PM5gR16H2Ns6kqtm1mjiwIRNDOuxL/lakQ2qjH6/ScJl+q+OabfdWEB1b4b7WRstEzqQ
	 x81j3CiOO9IYv2r1YCw8S4/bZNRO3/HgvWRaJoPpxd9nwRlJvE0vDxNL2OT04wZrRbIcQ
	 jfqJp/BKrragjnFx5jBBmkoDK1HB5kLcqcsmtSTcsBW004//SrobgASuMLq9D/ps33tMh
	 l5SogoLyjPXfMSr2lzmpVodUP9fe8qXfANA4awZGzxS2ol/98remF9eTd/lhjRiaxWpyB
	 uGJ/7inI3wKkTlYQVXmu7EXu3o77wo+PMe5xAX/8/+mBEnhlVflk6vSjThmo27jfHnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhB6xBKV;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287CA606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 287CA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhB6xBKV
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ea7987517aso10492065ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250439; x=1793855239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zGV4hq0i8RZtAPVqoljw/C8+Ety28xxbkClqaDK3k9U=;
        b=EhB6xBKVd8era6ux3/LVclIs7SKXgBN68W0ZZxrCBjQ0dGTX2HkS91euvItz1VGzt0
         MpXWwxp00nvVOBAMLdVa+1d5fRvYIL3B5/2yQBd4YZYyICj2XuplDz7sFlMs+Sa8sfND
         phbZETaoYJtpXb9Z3nGC50NJsGfOLSLZBuojKXxhIOO1UJ64wHfAbXBRCXOX+Y5gh4/M
         uxMyZV+k/gpy8xevIGYJpgTXtNRLlavO1+A7ipbV1tfoFjhTE7WBOKI/qKcCM5SJymko
         m43lpO8xVMInTm/nrIMZIkkbd0v0YdizalBby4Gc0xAFQgEOWBLw3qP5dao/stPJsClA
         SSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250439; x=1793855239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zGV4hq0i8RZtAPVqoljw/C8+Ety28xxbkClqaDK3k9U=;
        b=Hqmt0/uuk/Vr7X/Cw2bRwqikqqCxHc1f2i2ZSuqHO3DPZBnCerNqbiEAPrtHB+ykLs
         k+UVQ2qP1SwMcE9PwQEhJR5weyqrCnUCUiKHUOA4BiB2dvs4GwOKWGWpTKx7yGx4nIpu
         YRpp3e4dls4mFJeiEMxbITfGTfZ1UeRI/fOBvdkFa6qSwFyKpWtWxGpkjwV0DvRJvx0q
         EV+RRx1jqz4EiArbnGLQfXt1gxW9OiXtLRsCYaUkXigTB7CtLKy5KCKJ7BkAdy1atKE3
         AAsp4jWvBpPaenXKg7ucbDNPpG90QWbCLdgBSOTAHJsgLQtZ2R6lYAUTJqvwF4kD8Jq0
         Jtjw==
X-Forwarded-Encrypted: i=1; AKwUvByaW5yoWUHFOrG6HJALB4gOUtcbCZgx1rIJZ1aiFOm585+jcU4C1NWQEhCdMrs9yNvLu2B/h8vcih9sXyQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3CJOD9l9KBM8gIohNpdIauG0o+lBXDe3GevrcoiItDu71guUI
	slon38rMWaQOnvor4ZQMpmNuDXrcMv5gj/ngSRsuQIN9LEgiGExY6Ywf
X-Gm-Gg: AYBFou1RE2qR3D91LrsKl0eGfVDw+BkF+f9gAXRCWmPa6s5gzVCIGecvkWX2T7eku8+
	96E3iOqblQBVtrdQCWMQ+WklIiQorkaed8FxyVrL21XYddHesKKukr+eIQQlMtn2jq3LudD2Sn4
	pYoLXOFWihgnTLxpAbo4i/iTl3jopFHjkKC4oiDtPQxXCZhYM01bTIMW/cJJiRr8y0WWE4637CL
	I1rLOn86/Aj1dDz8xRPVvPrHBWN3KUaWvYuGmQmMUSJWVW3jlqcDKX+b1XWA0iNXvrN4+8kyeFN
	HSyUBAXnuWK3VEzAH8CmuiW8MvlCB9eoKxqTIMxAkbIig5/M4moiRr+YO0t67t6yLM4HcW8LhOj
	rfA/NhBu6Kgl9TkunqjTpT5zv+NazrsfNjjBwcmQ1f1/+K/rjOvW02fHBzFuiFz1xAhiv8ov4Jl
	EPtW+pmwscsPnpe5HEidfiH/mm154N2XbXKDm2xYAqI4Fz2L5PHQksP1hkuZ4OwztF2vrSbzGMY
	d5d+sJDj9Frdjt8tOz8GQF//iWnVe/QMB5YUijqEpOzEOdyQ2DexsHoGHHGuadMM4TGC9MXh3Fm
	JD7blhCdjsxfbdjIsqnjT8F3BNgopQ==
X-Received: by 2002:a17:902:da8d:b0:2e9:69b1:1b9b with SMTP id d9443c01a7336-2eb0012c7f1mr38007225ad.8.1793250439420;
        Wed, 28 Oct 2026 22:07:19 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:07:18 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:51 -0400
Subject: [PATCH RFC 10/12] riscv: dts: bouffalolab: Add Sipeed M1s Dock
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
Message-Id: <20261029-rust-bl808-console-v1-10-b736ee920078@gmail.com>
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

Add the M1s SoM memory and 40 MHz crystal, and enable UART3 on the Dock
with a direct stdout path and 115200 8N1 settings.

Boot firmware initializes PSRAM, UART pads and shared PLLs. The tested
firmware configures D0 TIME at 320 MHz / 380, represented as 842105 Hz.
Firmware using another timer configuration must fix up timebase-
frequency. The declared 64 MiB PSRAM range must retain firmware
reservations or be narrowed by firmware when memory is assigned to
another core.

The stdout path selects the native polling printk console; userspace TTY
I/O is deferred.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 arch/riscv/boot/dts/Makefile                          |  1 +
 arch/riscv/boot/dts/bouffalolab/Makefile              |  2 ++
 .../boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts    | 18 ++++++++++++++++++
 arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi | 19 +++++++++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 69d8751fb17c803f0efb8003e111ee24144c222b..294f9c119f8f1d608c878ca1f95891843301f07e 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -2,6 +2,7 @@
 subdir-y += allwinner
 subdir-y += andes
 subdir-y += anlogic
+subdir-y += bouffalolab
 subdir-y += canaan
 subdir-y += eswin
 subdir-y += microchip
diff --git a/arch/riscv/boot/dts/bouffalolab/Makefile b/arch/riscv/boot/dts/bouffalolab/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..4d63365edc095fbe9df31c4b12e29c4b624cbd1f
--- /dev/null
+++ b/arch/riscv/boot/dts/bouffalolab/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_BOUFFALOLAB) += bl808-sipeed-m1s-dock.dtb
diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
new file mode 100644
index 0000000000000000000000000000000000000000..c719a53c6e2de45f3718b48ba2116e99c70e559b
--- /dev/null
+++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "bl808-sipeed-m1s.dtsi"
+
+/ {
+	model = "Sipeed M1s Dock";
+	compatible = "sipeed,m1s-dock", "sipeed,m1s", "bflb,bl808";
+
+	chosen {
+		stdout-path = "/soc/serial@30002000:115200n8";
+	};
+};
+
+&uart3 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..ae54e6e301ed2c5a1448d52c530c5074515ee38c
--- /dev/null
+++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+#include "bl808.dtsi"
+
+/ {
+	compatible = "sipeed,m1s", "bflb,bl808";
+	memory@50000000 {
+		device_type = "memory";
+		reg = <0x50000000 0x04000000>;
+	};
+
+	cpus {
+		timebase-frequency = <842105>;
+	};
+};
+
+&xtal {
+	clock-frequency = <40000000>;
+};

-- 
2.47.3

