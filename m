Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559476;
	b=T/SJ6Ga1rHWpdcSPHHXGUG4oX34I2wjfg6Hb2zVUqFYqzMYGo0zOK8tuM7mHR/uy9RQO
	 IOMR2xAJfzZAx3/vqEAuj+X/mD3rd3Ub8cLQdYGU4oPThQgVHS8d6giwCD5cYEYaSZRS4
	 Yj+BhWDGZjrw7wYsc05qbTEGh52ErzezQRtifW4yHXwciqGVvm1C/M5//T4Z5oi9EaF1+
	 ZsENAXNLqpu0A68Gbttb8KxtSbFG4wn1WhcrcqjlJdeiju14i2iWcakFzTxuCbojTtC3Z
	 Sdev4Be/RDbeWuxQf9xzHoiF7PNUSi1S4ske8o3VGK3MjPLT64g/slpnosQu4dccpvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RMZ3p8klhNcSbnVfVK6IB8YKNvjqcF62RjoXmPpSb6g=;
	b=y3sgjPMSUUxgDH/xEKxDFbj/vAxpTvogXpwJPcoeMgsiezgISaIyDBv+j1rOVuh0r3eX
	 /6/S6PaemKWp43oIEWDcdOypWe3+mtlHjYZ5wGafa64eDCFltVxYXQoZg8cMR5GLeJVJ9
	 wTXftTsS4u7l9QfZzpTFguMtrJUzBHXKUPvenG2vw6cFhQzvZmEaCPBewdZ56cImEKkRV
	 wVBHKZjNXaqb3auTGXM/pkuaejJaFUTfyaXSKPz9vP11yUlQ2+HkdW7h9lAKoa2qBM+Su
	 ooFNbiy+84XfIIxZH/yu9OPy1+G27WrJJC7iWxONDeJf3GXiYXgNgNXt0sGLaZncV2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tNJjLIim;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6F160A2631
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 18:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D6F160A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tNJjLIim
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0a28a720aso21048857b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 10:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793559475; x=1794164275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RMZ3p8klhNcSbnVfVK6IB8YKNvjqcF62RjoXmPpSb6g=;
        b=tNJjLIimv8wm7BuHs9s98fHWfd1IWCG/jbL677FOjvS8ts+D+tHUYpli7nfChRtowP
         3s9jbQDyWZBOYMsGXU7Kx44dS2j9QS9xCx2lS/ietnJCv0AsuU6hsAx7uBRPLPwBki5p
         9pQ9oNvfj6mk373axzydN6pPZn7f6Hrrgx08ODC2GpRK0kpD274ICfBw8WvIfvc3sfIu
         dZWdwITRSNZWceEzlehtVPs4tnLb/7NaM8lgxuBFXxwEtjUYrgscOycL6nPsZumuUWXY
         zhDqGyVncstuxq8HUJpFK/qJJNOCjzQXtun6C5DVhE01V+x5zjwIkItm/SsfApOgis0F
         osPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559475; x=1794164275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RMZ3p8klhNcSbnVfVK6IB8YKNvjqcF62RjoXmPpSb6g=;
        b=mYUjqpu843EyR5JjbV1OSLAiFW/1eqpphe6ajaruJUb+Kf7uI5zRWN9PjahQozNJKX
         hXN/YNmIDtZYMqtMsOBpaoCvaJ0bin4gdNxh9NP6XLGjqe5k3d6qxEXj3/pQEK3N3l1U
         tMkjwSHZloMPPaxZCPyWjlaWpNx1czxCnw6Jm4si/s+JVz6O9VqqQT6COM28huVJw+0f
         sMWOV352dCNjSP0B/uCNJ9YE1Vsjw36ltlbTkZC2OaBPLXeGEn/f9OE5mqJ/mjd9l6j6
         9L5DpuUwowV1bm4s0MC+ZOO1CXya/vEKqngg6eEI5S23ccZ7R0ksJf9r5pLLcWBq6eec
         Ow5A==
X-Forwarded-Encrypted: i=1; AKwUvBwawjpky0XvS/OOpPfRQH85RW3f805Dtsyqejseul3xo8/cFmUZnBI3Gvhaw09cQI6QOfsbrQz4kc8xY2A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jmneShhBHjDCNVSrWg5G/bxg+gv+am4DVvaYg6vhv1CNmXKpy
	Auy6FZUZ2Y2x8Mufc18xV+wpXO4KGz4SO62/qoVkWJz3+jHfRW8IF14H
X-Gm-Gg: AYBFou0D+skfgcGgSNCPz+DmOSr25onEtVvWWlaAbXiJ9KqhEucW/zFRbp4ptujmqYm
	z0zzeyBk0oZkFDtgnp3PEBMyqw42zkerA7LY6Cw4MtXWc1BVTLehChfz5E2vGP8ErWLCdnr1mvO
	0QOXjmiNa/0kaPa2JJchSn3gFSkRpDetfcHN/47libIJxsJe31EtVj0lAxrfpaK2ktBMT0yd6LT
	y4lqo3AF3X6k17//2kFnh02IMbNvdok+1jKwXCj0qoIqg1tUHojfQDkRS7bWCL7nvKMtDnL5rOL
	m79pNaCDyNTmWlew8OGup8utoJ7smT0zGVEUaDNcSfAT+dd1dwEMWI7h7iQvApx3zr+f7crMJdx
	bsbjQavlRvHmH8f9uOq16KPExteDQkI+yhkxn0wpMZn/wRd2jTJ4VJ0cSY/Hk5o36A2MDDj62sb
	HMXfsideD8u/qIsVrYhF2shdoE4EkyEPlROE6Tvy4zCVMi/eYgAnap4TvwtMSWeCyNneX34wC7y
	vGzky8uJQsMIWGqK+fVlGUorbDCr8uElCUQTtgXDfyKPx5RcYrA4bD13Vz0YJHaQd/cubiAw9O/
	TxRxPLChKb0J10k5Z3wgX13Vw2f3W8mlqIM1gieCzUPamCVfzS8IaWc44AyQoqQtOdM=
X-Received: by 2002:a05:690c:1b:b0:8b0:dc77:6b29 with SMTP id 00721157ae682-8b2b6790179mr69509227b3.55.1793559475269;
        Sun, 01 Nov 2026 10:57:55 -0800 (PST)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716d420sm40869397b3.33.2026.11.01.10.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:57:54 -0800 (PST)
From: Tim Michals <tcmichals@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH v3 5/7] arm64: dts: allwinner: a523: Add message box and remoteproc nodes
Date: Sun,  1 Nov 2026 12:57:33 -0600
Message-ID: <20261101185735.762559-6-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101185735.762559-1-tcmichals@gmail.com>
References: <20261101185735.762559-1-tcmichals@gmail.com>
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

Add the message box node, with its four register banks, bank clocks
and resets, bank interrupts, and the XuanTie E906 remoteproc node,
with the MCU CCU clocks and resets, the RISC-V and SRAM power domains
and message box channel 9.

The remoteproc node is disabled; a board enables it together with its
firmware name and reserved memory regions.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
Changes in v3:
- Message box: all four banks with their clocks and resets; the DSP and
  CPUS bank addresses were swapped in v2; remote bank interrupts
  corrected to SPI 181/174/205
- Message box: interrupt-names
- Remoteproc: debug reset, RISC-V and SRAM power domains, one message
  box channel; the message box clock and reset moved to the message box
  node; reg-names sram-a3-0 and sram-a3-1
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..316698b999c6 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -605,6 +605,31 @@ dma: dma-controller@3002000 {
 			#dma-cells = <1>;
 		};
 
+		msgbox: mailbox@3003000 {
+			compatible = "allwinner,sun55i-a523-msgbox";
+			reg = <0x03003000 0x1000>,
+			      <0x07120000 0x1000>,
+			      <0x07094000 0x1000>,
+			      <0x07136000 0x1000>;
+			reg-names = "arm", "dsp", "cpus", "rv";
+			clocks = <&ccu CLK_BUS_MSGBOX>,
+				 <&mcu_ccu CLK_BUS_MCU_DSP_MSGBOX>,
+				 <&r_ccu CLK_BUS_R_MSGBOX>,
+				 <&mcu_ccu CLK_BUS_MCU_RISCV_MSGBOX>;
+			clock-names = "arm", "dsp", "cpus", "rv";
+			resets = <&ccu RST_BUS_MSGBOX>,
+				 <&mcu_ccu RST_BUS_MCU_DSP_MSGBOX>,
+				 <&r_ccu RST_BUS_R_MSGBOX>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_MSGBOX>;
+			reset-names = "arm", "dsp", "cpus", "rv";
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "arm", "dsp", "cpus", "rv";
+			#mbox-cells = <1>;
+		};
+
 		sid: efuse@3006000 {
 			compatible = "allwinner,sun55i-a523-sid",
 				     "allwinner,sun50i-a64-sid";
@@ -1144,5 +1169,27 @@ npu: npu@7122000 {
 			resets = <&mcu_ccu RST_BUS_MCU_NPU>;
 			power-domains = <&ppu PD_NPU>;
 		};
+
+		rproc: remoteproc@7130000 {
+			compatible = "allwinner,sun55i-a523-rproc";
+			reg = <0x07130000 0x1000>,
+			      <0x07280000 0x40000>,
+			      <0x072c0000 0x40000>,
+			      <0x07010364 0x4>;
+			reg-names = "cfg", "sram-a3-0", "sram-a3-1", "remap";
+			clocks = <&mcu_ccu CLK_BUS_MCU_RISCV_CFG>,
+				 <&mcu_ccu CLK_MCU_RISCV>,
+				 <&mcu_ccu CLK_BUS_MCU_PUBSRAM>;
+			clock-names = "bus", "core", "sram";
+			resets = <&mcu_ccu RST_BUS_MCU_RISCV_CFG>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_CORE>,
+				 <&mcu_ccu RST_BUS_MCU_PUBSRAM>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_DEBUG>;
+			reset-names = "cfg", "core", "sram", "debug";
+			power-domains = <&ppu PD_RISCV>, <&ppu PD_SRAM>;
+			power-domain-names = "riscv", "sram";
+			mboxes = <&msgbox 9>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.53.0

