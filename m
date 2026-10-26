Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008661;
	b=tlemVYzP0+S/68/BwMnz4vNw7AnUPRJp0bXLR1owOUt5dV7rFOwNW5mkulFX1CM4BTGV
	 DDxgjbAPvTbvQaEBjLy/tjiP3ocLVld9BgtATA2Frsn+TWEzx9uRmAxCfIceJD5GGO/z3
	 9Yg28KwhQuZQOdOtiQH8GabWeFqCvrMMlv67zLGbZSx2MPNXCK7VSREpSnRFPeVXiec8F
	 /Oc9qHHoLJiyYxZzaMLaSwYgwvEy5S70VcgGltMy3QNq6ERzW3OKPn03efiTz4YnPDhUY
	 F+RiItH3FAXzqbjdw4UiYwYRFPvsapjtFt5B03uR/S+drdr/rs5XjiPt4y9BXD86NRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ru9WJD/77wcdb27Qp7kbTXOCJ++kNaqReohvkAqpaW8=;
	b=Fbfo2Az91ucbN9OEBZSVIaxxVmG4GQ8FkV1HeL3+vyL3mLrZru5DWA4+5m3u8CHB+Lll
	 CV0VCjGvnCSwWzHuVFa7MTqXjJP0NrpK1+lvNlWYq05jzXn7I17FkS+XdFCqYji01BHb5
	 ACLbrRtasI1Nzu/dF1EyExdDtwY14nhBszY7H4PJ7o79NbT/ZLQ90VRT4FvTAZR9FTSk0
	 VLo5CxbsS/zseHknfZ0b3ObS+1QSWsgBQUnZkPZ2RBM8PsKmc6JSVL7DTYmdLNNZBB/7+
	 pW4mepUF9aUiMZ199V2xsnPIMKV+Da093gq6cyNrGPmiToWn8LfJ1ese/NlCipgv3QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=smgC9F7n;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F6D60A5BC8
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72F6D60A5BC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=smgC9F7n
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso28502135e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008660; x=1793613460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ru9WJD/77wcdb27Qp7kbTXOCJ++kNaqReohvkAqpaW8=;
        b=smgC9F7nTkXaaPUocsT+v+reAxp3hs8j5JZu5+RSkgmW2dWHf1fgCwGnZhW6DDs6zE
         wczVWDSHjJE9yOSPEu2W+wYDXy+OaJR+uxuSBOjZ3GTbCBgzIvzZJtzuGDjJRsWWqjT6
         DVOMKURdJo6v/lSeUX1X47C1YSLovqlUciBK684RaRI4KrRXo61RSWVLYPjbt8y0WgQg
         LV168PQLMfUxCfj6ZJqhunnQSnkaqjHxNKjLzSABI28Jz0uD+XQLv7RbPAal9YCDpcxp
         K9thwBZvYjusLjiHElWsAvlm1adqGemGr+bbmDy0chdxJvSrw5pf6FF44W8tPvcigjCt
         iSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008660; x=1793613460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ru9WJD/77wcdb27Qp7kbTXOCJ++kNaqReohvkAqpaW8=;
        b=zPBa6Zl/HEqPGSgJltZCyfQ+tfj4UJR0Xz8p8OvCqueArgG84TVuDu2vCPCTbAvnkY
         yeM+QS3jHTpCrUg6Dl/9D201kJGZWyS2Qr8hnIBLflkVCSEIlfyDslZpkD1OTI/GNEgY
         g9uSxe7D4xRDuw8+QaJv5MsyJ8ydrgjvZ3QG2Ee4pU+3VhGecp6334u6Zganvh/O2vbW
         SrzxCEy4Rts60kOvE0FwrCui5emxY9RtmObWmwBlIhhYkjAjArFdp6l3pXeeE+BKpeE3
         7Xvu9iExOzsN9JxYWQIpbQMiqg20K5kpOBipFwV9ihpmNDgJM106Z+VcF858pOxSFLJp
         NdLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkE+UwZYXw6ZTfw/sCPttNv9sV+g7kXaj9FMuxc9vUHC3gZxznJjNYsx7YbWnsA1RMp25iPn2NUM47e4Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKke4RagCAKUdAt1/Av58Q+F5Z3JSg2T5mN82TQEz5I7AKLd9GV
	RrG7V5WTAN3godYMtpQxpltbs+k5Y5u1Q/++Spm4NOlxeYBGeXGkoR2z
X-Gm-Gg: AYBFou0YacAu5U0Cur9A92Ji4iJQBY8pe4zbx0JyvARh83h+dD9zh42Z7hbJXK+U0n1
	0o2h9G6WBL4yP2326lDsD18dtvOXdi6pKccdYHuVgdK2THuJC/i3PFYPPHvOhEkopbZ6npdxVv5
	fS8TkOhx0I9uV6TzF6lm1Jjs7XjC5f/NvH8Iima8fXBGMgStMxUPApC5A35TB1HULDLpe7ksEqf
	dk7GVivBv+i1WsmlsXW+MrLQv2pyuRonJQUpr7qealXQVxcq4LNqKbmEUNlIRGONFL4NNkNryrl
	eeNfEPSjqnlFQh28LFP7xs4GT1bPTgvYEicHssSABRPWW+So+l6F6Pt6h4CpPjRQieIR1awDpH5
	68K3rYkODwTLGy4MqWVMOVJnoM/XG5OwVggwG+QXegcyZYrcYS8UH1JfHRf81Qr97/q+fwp/zhw
	H2kfRcxC3R6/o1mxEpllm4DVYlIQ20WgqSvpZPLIl/GqIXPRILZ0o4QeFkrqh9XGi+u9HJyooFg
	IOGCFHD1GfKlq4OcjGatSrqAl28UBy8ZtAtChIA/rbRZj+KyoC4ypgtTj5T+5rcYM+5l1pcDvrc
	YSq6S7O+tkeEkxCfijIfIDDxW102oijxsrRwL5sZ12udIHKmx2/K6bBc8h+1
X-Received: by 2002:a05:600c:3b93:b0:4a2:397:73fd with SMTP id 5b1f17b1804b1-4a35ac96004mr129196455e9.12.1793008659520;
        Mon, 26 Oct 2026 02:57:39 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:39 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] arm64: dts: airoha: en7581: add thermal sensor nodes
Date: Mon, 26 Oct 2026 10:57:10 +0100
Message-ID: <20261026095727.31708-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
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

Add thermal sensor nodes and attach them to the CPU node to control passive
throttle and define critical temperature of the SoC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 47 ++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index fbc5ee47523c..58bd8b318910 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/en7523-clk.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -81,6 +82,7 @@ cpu0: cpu@0 {
 			power-domains = <&cpufreq>;
 			power-domain-names = "perf";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -94,6 +96,7 @@ cpu1: cpu@1 {
 			power-domains = <&cpufreq>;
 			power-domain-names = "perf";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
@@ -107,6 +110,7 @@ cpu2: cpu@2 {
 			power-domains = <&cpufreq>;
 			power-domain-names = "perf";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
@@ -120,6 +124,7 @@ cpu3: cpu@3 {
 			power-domains = <&cpufreq>;
 			power-domain-names = "perf";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		l2: l2-cache {
@@ -293,6 +298,39 @@ timer {
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
 
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&thermal 0>;
+
+			trips {
+				cpu_hot: cpu-hot {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				cpu-critical {
+					temperature = <120000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_hot>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
 	clk20m: clock-20000000 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -319,6 +357,15 @@ gic: interrupt-controller@9000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
+		thermal: thermal-sensor@1efbd000 {
+			compatible = "airoha,en7581-thermal";
+			reg = <0x0 0x1efbd000 0x0 0xd5c>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			airoha,chip-scu = <&chip_scu>;
+
+			#thermal-sensor-cells = <0>;
+		};
+
 		spi@1fa10000 {
 			compatible = "airoha,en7581-snand";
 			reg = <0x0 0x1fa10000 0x0 0x140>,
-- 
2.55.0

