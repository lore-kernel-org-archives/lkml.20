Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840779;
	b=WdW/jQZf28Gik6szJ78ogld6oIwzf0QgaG4hPh3OF0jHWHzaOjs/g9ZHiWrHKhloc817
	 4TDEdmrA/UehXEYsO9XWeU4jRHPqi1kwsqoL2qAqA5qgJorvzd5FwPOyIyuhVptMTJjeb
	 CpmimMzEfWz+QAssT1Grip4dKmPefVG6sgrcKj5BwRBSw2Ww6X8H+Pab04ezgtrZ89fCw
	 tnogDpEaXNQvZ6/r5/F9GwpAB7uNsp3Zzq1BcpGhnkrkjY4VgDwmLmkJPgYPP00wYdE53
	 r6J0XLIMFme8HZ+xtTtfqGgaE3fLgaVkJX3GJvknyJw5MszaCqZUO/UTOKQGEVq2E5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=LpDGC5XLLNexjcRsXw7aGhGRuoPnfF4Y14SFEd8MIcQ=;
	b=z27WjLLqGGzGOqbwKKs/kO+g/WNJevFEw8yBbBbu5DveoqTemHpnLP4I7Ye3T5Yy087G
	 ABWB6NTSGKeh8+Ipn6L256LqPeAfqubuJPKyhEjNIQV1AAw595gm3HpPZsy20LpbxtMxo
	 ZeLYYDOKfYvzcRI5zlzauadCJY8kQqxE7SsrYlxtu+EVMk66KdYlXiv5G8xiguGU4tWTV
	 orZ+WRf/qUGuZ7H8nUmF5yzaNuDA4HJfihCnvWdiqynVUEImW8s0l2n3HhtUu+p05HQRO
	 6gCdIvWTD94EcU1BY12bJolwqNvbiAKoD1xkozBRqZmChF7qWMvJvRAwDcK5lhiy/hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GgICqM3z;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AC4606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94AC4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GgICqM3z
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso4316978eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794840778; x=1795445578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpDGC5XLLNexjcRsXw7aGhGRuoPnfF4Y14SFEd8MIcQ=;
        b=GgICqM3zpOwSqeSz+Z7PxXBD1J3e63hQJNl3ZbGEQzT//qDhpZHuTtJguRwuOblBKO
         Gwin0JW/jnl/5gYiGK9uLkNCpHN+j6vMl8Tnxr0wkdPjagufvjpw/5bcFVSnQT92TkSG
         864HNUAnz21nIiEE3Brcf00K1YKwLnzecqbPEQM/ylG0wKc4YGuVXzYKEEQyfS014F+F
         l91/uTEVSTIdWGwBdprk1FNugGIjJATj3fJmtmNdKn0ANhlCPtC1f0rT700GjcIyVvls
         +ECARK+smJECFPksiSMS6HL3roKfnNO2ilZZ0tKjoJMXwmybDgXCNLTlRyDsZbYlPyjD
         4vAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840778; x=1795445578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LpDGC5XLLNexjcRsXw7aGhGRuoPnfF4Y14SFEd8MIcQ=;
        b=0ZvHpJPkSCgk3y9x+vGw6oBw1dmUAEOUEjvQn3uxLx3YR4AAgBdaqAWS/ZPW2UwECI
         aECBfpTZkJJHWERiZRP6noqadYaF3S1xOYd0WwCvIGgQGFsYB5GAGP4wo7XyYG5qjauG
         taFaPrN2ca9eNE7fH7+QLi5VV8wVBIA5Fip6zuXnuxb/KPVGI1hzit5aP3GpzXIeiaLV
         RFr+t9O6IVrGqAApfqJnmkHtVNZIH2HQmzPydjzmVePj/GS9kpwKYnAL9y073HrYc15c
         aHP8yAdEo0IVQWx9SCrG0yBqsij+vLg7PKL388Z9scXxpJly6/zh/JVU8zPiuphW56Ua
         daow==
X-Forwarded-Encrypted: i=1; AL+hErHyQl5SQiCUDBzQHiySGvvbTpibE2DRKquz3TFYgp+IU3nwYTfRRZZjbgJ+aGtpu9M/bBLUbhaRXuyTits=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rKJg/u47Ts+N8lWyWwwpOSNld87gQGVS4XMRO22IpWlQAbAUP
	kqqAtsV1lz01wByecqgnXngREyrXOLi6mscJokxIBfR+1MergHwzo65l
X-Gm-Gg: AZFdTZeO6jxUED/ZC5cgp25BmMY2RFpFeISPY1obJ8acsXpNTEeAR8YA8Ef4tJrNxbl
	ueB2xjg2BFOTZT0FaSGKQOJZj2eX7IKfh3fwNBd3issiazs14c1m5v4v69lDn6pyHUgfUJ3Iypb
	GBwsL1V21v0wPL3Do8Xn99eXQMabkAPTZB5i+q/rl4t7njf7YFTRO/+eCgRdZv8YUZ1oEIFgpgl
	qLoGdWhcZ2WGMw12CxfnLZAmJiyuJy5GlT35bfzE/1Oq40Is+UwjJaju/UYyrhcogvghcP/9ObC
	vD+uX5mAw+XhaAiyh2RW20fozyxwINU3vp1vrpeM2YF5+k8BncsgV2FKb97DDSPrhnIgBFtqyQy
	pGpWVowSsstSA3I6G947iht5f/neppFLXsAjFcXyRg3XQfGNol+RGiiczJ/FPONFMFJ+dpFL+BE
	IPbnAMHn/aDbnOmB32GzVZbDSr6nmJT6qMHVIIUc+4z3D7D3qIU3BUQOxK2IBGJH90oEBkAlASZ
	H48FK3JVacUM/bKwO7ho7SW9HSZiyllO+f+FLhW2X7KUZEiilTQiPz16v/EfjHrcCW7gtkvgkSs
	3dWLcpvyh8/QOJXhanWNGrqS
X-Received: by 2002:a05:7301:5401:b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-37966f31fddmr9331278eec.19.1794840777579;
        Mon, 16 Nov 2026 06:52:57 -0800 (PST)
Received: from [0.0.0.1] ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm69003540eec.20.2026.11.16.06.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:52:56 -0800 (PST)
From: nhansp <nhan.094.vn@gmail.com>
Date: Mon, 16 Nov 2026 21:50:34 +0700
Subject: [PATCH 2/2] arm64: dts: exynos: Add initial support for Samsung
 Galaxy Note8
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
Message-Id: <20261116-upstream-greatlte-dts-v1-2-768d49fb7d85@gmail.com>
References: <20261116-upstream-greatlte-dts-v1-0-768d49fb7d85@gmail.com>
In-Reply-To: <20261116-upstream-greatlte-dts-v1-0-768d49fb7d85@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 nhansp <nhan.094.vn@gmail.com>
X-Mailer: b4 0.16.0

Samsung Galaxy Note8 (SM-N950N), codenamed greatlte, is a mobile phone
from 2017. It features 6GB RAM, 64GB, 128GB or 256GB UFS 2.1, Exynos
8895 SoC and a 1440x2960 Super AMOLED display.

This initial device tree enables SimpleFB, PSTORE and GPIO keys.

Signed-off-by: nhansp <nhan.094.vn@gmail.com>
---
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 arch/arm64/boot/dts/exynos/exynos8895-greatlte.dts | 124 +++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index f1946a95cb42..1faf01dab180 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos850-e850-96.dtb		\
 	exynos8855-smdk.dtb		\
 	exynos8895-dreamlte.dtb		\
+	exynos8895-greatlte.dtb		\
 	exynos9810-starlte.dtb		\
 	exynos990-c1s.dtb		\
 	exynos990-r8s.dtb               \
diff --git a/arch/arm64/boot/dts/exynos/exynos8895-greatlte.dts b/arch/arm64/boot/dts/exynos/exynos8895-greatlte.dts
new file mode 100644
index 000000000000..a7cfccd59bf7
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos8895-greatlte.dts
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy Note8 (greatlte/SM-N950N) device tree source
+ */
+
+/dts-v1/;
+#include "exynos8895.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Samsung Galaxy Note8 (SM-N950N)";
+	compatible = "samsung,greatlte", "samsung,exynos8895";
+	chassis-type = "handset";
+
+	chosen {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		framebuffer@cc000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0xcc000000 (1440 * 2960 * 4)>;
+			width = <1440>;
+			height = <2960>;
+			stride = <(1440 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_power &key_voldown &key_volup &key_wink>;
+		pinctrl-names = "default";
+
+		power-key {
+			gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
+			label = "Power";
+			wakeup-source;
+			linux,code = <KEY_POWER>;
+		};
+
+		voldown-key {
+			gpios = <&gpa0 4 GPIO_ACTIVE_LOW>;
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		volup-key {
+			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		/* Bixby key, mapped as a camera button for now */
+		wink-key {
+			gpios = <&gpa0 6 GPIO_ACTIVE_LOW>;
+			label = "Camera";
+			wakeup-source;
+			linux,code = <KEY_CAMERA>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x3c800000>,
+		      <0x0 0xc0000000 0x40000000>,
+		      <0x8 0x80000000 0x80000000>,
+		      <0x9 0x00000000 0x80000000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		ramoops@92000000 {
+			compatible = "ramoops";
+			reg = <0 0x92000000 0x8000>;
+			record-size = <0x4000>;
+			console-size = <0x4000>;
+		};
+
+		framebuffer@cc000000 {
+			reg = <0 0xcc000000 (1440 * 2960 * 4)>;
+			no-map;
+		};
+	};
+};
+
+&oscclk {
+	clock-frequency = <26000000>;
+};
+
+&pinctrl_alive {
+	key_power: key-power-pins {
+		samsung,pins = "gpa2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	key_wink: key-wink-pins {
+		samsung,pins = "gpa0-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+};

-- 
2.43.0

