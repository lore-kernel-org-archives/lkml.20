Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912869;
	b=OWP/kYrUENPsLYVdfYWiInfLfIKJtKukjMsNk/H+gj50riVtfssla50mge/YRqw9bg+F
	 GfFJa1gGH2NR+jc2+2bn9CB4pvS/UD0PbJczIFu0zlWdoCeekHL0TfJStwp7Ue3E7nJmy
	 jgPoIE3X4eCORRqLLfNig41KTmmc6jxUwxpEiu9B1cz7D95Dn380r1Oo0lEDhIGw83KqH
	 bVNth8BCYsbxIKd5aDF8EcLcCfM3qJYuaD5mrs0lUXW6hqvz25+T2AuCmOLaI6DMqxQUu
	 GBzznG7A42YBPqGdDI3YfJATg1htJU0StHHAk5BNaonF2CdGhRPyvBtb2/1NUwcJNkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F+2LoF4byTV9cHv2bO2DvByyuIaiEa2hM25/syzMkH8=;
	b=e5nKxtRGEhFQt17M/HUZqEh/2PAaEZide061Pc7W47V6dZfaRUVTufBhvn8KWuRwDMcW
	 Xhxm67otQLbTUYd1/xK/crjGkwvaaMSdz72aoRj5ChxgpRWbkCfZBQojUWJhTBUD3rBdD
	 rfSShV8njdQOmVzpzPu+7a5S2ES84brp4f/JPRo60PEAgMe3sQQ2MojoZ7hsKgVjZm+7W
	 DqTiRAnX0NCe8AkxyttHH98lzfztonhOF6OeCWO5Ga5XhYVkjzXiNh7mcTNr7rbyaUvi3
	 +FaLYkPO4BvImlucSiJey3QJGP3Ag10xJzaI/FHpqzWBly2P79tg2LQvyDPLR1LR3ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ysvqhDLr;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97508606A335
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97508606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ysvqhDLr
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso3371284a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912868; x=1794517668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+2LoF4byTV9cHv2bO2DvByyuIaiEa2hM25/syzMkH8=;
        b=ysvqhDLrpkEyuw0OlwSn4TL0W+BJk2ZHzigMD7BauSI+EEs8SFETsqqNoRxCpG5Ms4
         QAeQI7boVB73A6wYqhRToXRPH7ckny82xmHt/e5+gEGUKz3aPY3bOUc4v7GwldiI/j8n
         QgSvqQYGC8KgAX7eyI1yl9iVrtDFX6CA2mJ5GKcz0YcHsSC7hLJUAqNAdTBGlPZdjr9l
         3cIjxCNQR7I6KPhck6H5J95NehRx9Qlz4XOm1+7v+/FQCL5WA0xGMwtVJFucBTX9eA63
         8WfQaa7wEcElmUtNMMZZY/Ic90sTVjIFct0Ii6oQjk/fVZ8FlimU0N9uL4x+4HXg09Ne
         m/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912868; x=1794517668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F+2LoF4byTV9cHv2bO2DvByyuIaiEa2hM25/syzMkH8=;
        b=jAeZmsuGU+rizBAuoyWUkdp6rf5SOG7CXN7u6JdeoBeXcrcifmxj0Ei+RdSRcrdTa7
         gf9E1l9zGzrKpXI2y18lpBjQ2lkdqKl5vYqncxgr3lBPtfdeXqfPAdbroCgA8OeuES6Y
         l+S8A6YKndBc/teM1NY2MZsL24RTzsBrFM9SD8cvvD9XAKnSEeiU7zFq66ffr8lCVy8r
         uvFxGYh7v4zWxsoHM/xRWGLsKoIqog+R8EE8LUJ75z+qXUXD7irr7DkNIodsutCPu11D
         QKh8bKefH3XHX0YSu+xM4mO413ddLkIVOe1z8ZXBN8cfbcxPHymW9N64YB0Ev5huSvkL
         bpFg==
X-Forwarded-Encrypted: i=1; AKwUvBxyys1Q8kKC6vWb72beHeLbED2uviqEWdTdO1oNSOOhGq1rJQH3FG3XdK3jJSx6D9f+M97T/snjESb6+vg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yALlBOF5kXl2Xt2D4W6uPVN3Km+FnaN2o2Y68IhyAed7HFF5K
	Ift4yIaEna/ZIjrcdR8em65WRwDGlzzbrfMRFB9pZt339PBbO8oULOCA
X-Gm-Gg: AYBFou0b9j50cQPr1oFUoaJkIj5j928YoWzaX2hJ/0Jkway/kb68+Xm3xtxc/uOwtjW
	Iv7u+tYgpvYfWB8qA64kLjRmDiM2iJ6ta50X3V4Qm8MfvTKcK8HSfWBwq1WJolOIzIelzhWIomx
	XSCFMcW/W259MyvCUgzvervbxncT7HlD5KUhN0XGVkgdwAK2VtO1b5LzKaOEVVFjGGyzofa8Wtb
	Hzt3Notrx/oaVMke6mk0s+hxlv+C/2l76APlcyTVXUNrY3W8LYXC05W0Xpta0uZNcWmADWl2rRR
	+ywMXKqs5QbXdDoiOiPQDQKV4rcuIE2XdXEIzvYN/+S+vlgjCE49Qhp0VkveHNa+SflaaNq90n7
	5G9wQj3CqXBs+H+tbi77azu55Udzn1HGCuSMJRkJe3POqM8ICjaUZiIBH9TR5HgfCS93BG0Wq4c
	ERHaopyZxiBN3TCRwqt3R9NKjTgr/8s4CnNgBYcBkagHQP09nOem0PoZugD4douxonB/TX2mz1q
	Flvn5uLB81QXiE2z3Y3Pp4r88wnkZuZhenaxwRzz9fC/TYKZPQcgWq4DJtODKgpEdkGInJOeNog
	/NgHCKvOmKIuxKtu9SFS9z4OF4WsGvAqwp5ugZbLF67TNoHjjg==
X-Received: by 2002:a05:6402:3808:b0:6b5:8758:c1ad with SMTP id 4fb4d7f45d1cf-6b5975341b5mr367900a12.3.1793912867890;
        Thu, 05 Nov 2026 13:07:47 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d032sm1966949a12.25.2026.11.05.13.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:07:46 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Letuchiy <asalde.le1@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: mediatek: Add Xiaomi Poco X4 GT
Date: Fri,  6 Nov 2026 00:06:03 +0300
Message-ID: <20261105210622.523747-6-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105210622.523747-1-asalde.le1@gmail.com>
References: <20261105210622.523747-1-asalde.le1@gmail.com>
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

Add a device tree for the Xiaomi xaga board, which is sold as Xiaomi
Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i. It enables a serial
console on UART0.

The DT only describes the memory that Linux itself uses, which is the
ramoops region. The bootloader updates the /memory node and adds the
firmware carveouts to /reserved-memory, so their addresses are not
hardcoded here. This DT must not be booted with a bootloader that does
not do this, as Linux would then use memory owned by the firmware.

The ramoops zone sizes place the console zone at the offset where the
bootloader expects to find it.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../boot/dts/mediatek/mt6895-xiaomi-xaga.dts  | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index a86fb313b1a9..d73489149ab5 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-sony-xperia-m5.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt6895-xiaomi-xaga.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-cudy-wr3000-v1.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts b/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
new file mode 100644
index 000000000000..f53425c536c3
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+#include "mt6895.dtsi"
+
+/ {
+	model = "Xiaomi Poco X4 GT";
+	compatible = "xiaomi,xaga", "mediatek,mt6895";
+	chassis-type = "handset";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		/* The size is updated by the bootloader. */
+		reg = <0x0 0x40000000 0x2 0x0>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* The firmware carveouts are added by the bootloader. */
+
+		ramoops@48090000 {
+			compatible = "ramoops";
+			reg = <0 0x48090000 0 0xe0000>;
+			no-map;
+			record-size = <0x10000>;
+			console-size = <0x40000>;
+			ftrace-size = <0x10000>;
+			pmsg-size = <0x10000>;
+		};
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.56.0

