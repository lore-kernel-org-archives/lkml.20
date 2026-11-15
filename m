Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794702731;
	b=ar8BDc0dZhSGceR87zcqC0im+Vi2FGPXz/kW7R97VKG/gQXnaoc/kr15jLH8SqmU69IB
	 ee2/VQsqJPxUdVtN9JibIPrsdkWzGKORDXbbPJ40KaZ5D/gBhi5+mkhyRI+7+5Wg9g6xw
	 xVnSwm2DAmNF/JZtq7r73ZLJ0hA2p6ZaW4nzbJmiDik2G2UHkbvaKaH1FpB77j/ob792/
	 2i4CPUZgCHHTjbSakpICWtZ/xdamltBn1ErLoVKqjS7MFLu63ngsJXcIxYcbdl+0j0vrg
	 LbdTSsdhItXO7n6rWcm5y4AO0e/cbVQxZN38cc4JW5HN4CDMunvd57lkeW23x+HhGiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794702731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/V2Llsn9Ob6GsqoLU7bUjN5jzG8A9WYSdTy8aKE0Szk=;
	b=A0Zmy2bHS6TE12KeLUP7hVpX2H9vAUwyaMrT+bXLrvbCYmT9N2wN5whd+EVHdLYnEGWx
	 DJq3lGPZp9Y4VGxsRsdMJRupEdcF33lFCCZuUk9j3neZawYIlAme7rpoQksZnesUE3LCP
	 mtz/0njNPch501kRcMCBkpxC2kumn2G1fFitZWVcEOnrS5sb+HWJ1PkydYXt0ZqAKBw4S
	 NvofhFVtN57/dLGwWmn55W46UXoh7YmrhB29cSzg4zUBz0p2IzHNRbgAJn/PM2KAyeeqX
	 RK+lg44aaoFFZs/MinQRy0gZs/ML78TloudtZxmPGOrXJYKcdoreDjthgZXxuSt7c+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+MAAQqn;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B149E606A898
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:32:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B149E606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+MAAQqn
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d21051042so408212066b.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794702729; x=1795307529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/V2Llsn9Ob6GsqoLU7bUjN5jzG8A9WYSdTy8aKE0Szk=;
        b=I+MAAQqnmdX816Yuya9hYCTG1HjEcrD96aKoQbrYdMjff5KADXulZWqJpg66oJy1zG
         yuagg7rqaGsybkAKhlX15mmm1bEMZFz2D2rNI0rZcYaaPSbRV5cz4taVJ4waTfHc44/3
         XmGc+XX5lLLPBL8jt6DQSVVzK+JqC8njNusX0d29uCM5HJlMtUH5ZIDlubk0x53fqX7D
         aR5ExrfbHMlrTa1s6EIsR54gkUzfSWyX73bZIYnd10l6OERnBkF4GjT64T/DOr5pDCgZ
         p671Mw+++D30ttsUaxYspVeYxl3NbwXYNlveZePNB9EG1ste+MRqEj6qds+Exo9Qh1tO
         mEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794702729; x=1795307529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/V2Llsn9Ob6GsqoLU7bUjN5jzG8A9WYSdTy8aKE0Szk=;
        b=aL5XKXPXQguCFVdA35hkQ4TBBooXNKGTm9zTyxzO0ggblsD0kAuxyHgNCeUI1aKhBA
         ySbTTAkI/v7o8Sp9GmyRsQL8/fvCZI3TwWxUKzI+7XXauDJKpWD2wCvKpPy8QDZILmhD
         u3VpznX5UxRDofQI/zCvbe7OOUXVmTYZFp4wRRq13VBJ+W9uND2zl3AN1QpGIEd1UyZt
         /cBe2N6QeD/RVy4/hLPiRYGWjiDirWZidv1/n45LiZc3YoIo8s/Mt+vuc8cPtI9TwI6P
         UuUW/chSOKlbkoQIIY7Mqv9n8Wpk+RdTbRjyLPHfJU1mO3HbU4t77nn7CBu9UwtATLy4
         PKQw==
X-Forwarded-Encrypted: i=1; AL+hErFnUz4UJ0+cxI0gJY4lIbZfEuK9HCEP4kSy75BX7odANfn1psGCQc8ZPpnfqujnANLKqdfXbLyk6awnbEM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FJ0EwY8t6VLdJTSN/ldJq3b4/jQEZdliJHtceiY7gi7f/UpT3
	0NwsnDRxQ3OwXGfeR2FpWQlFhyGRQ6uqvyy8zgK7K5U05rD8MQcj5Gg=
X-Gm-Gg: AYBFou1IFUKaDO7MZSmjHx0Z2t8QsbeB7cqjJdIDi4zdNFcPXon3epEWZAZB/xyEjN8
	RRlY5yuc4CCQy1VvWefKQolJANA0Ka4eU6bqKK8/guGmaZtS4g1sMlFv7dl56O18XDpjB/eML74
	L71jC5OQAvSww3qaugN8JX5R7FdCvYE7OU8EakMtthyj4qfHWCw/oNEZE5cZNpxdvPu+cixT2wI
	uAgwdbpUsuiUJ/RmtQKPs/+39NmA3ojaMVptsKt8aR+cGPq6lYrogz9WvP4MiBsT5Wj609GtNlA
	u3mZ+6y9tQq/fpPcnB6kWnxVvD3jRczcX3H6LZFHmsRLLAEetHsMVaoH0DHDWQ0J3CQpCqc3JEF
	Bdp4Jv9TRecQ7FwFy+p78myIKYAjR/nVyROpnVEURfg3sZp14CfJp6/D+QN5swuEnmP545sMxOi
	IwqvNwKhIN/k9I2D16R63X7wKL/C7IXrqQQgzUk7NmWsN9y8VU47RLbK/lObhm4FU337EFXHpu5
	+ska54O1OeyDgMxRcA2du6zlwDvLB4f/tEFgri1BoXieh5SMgaH7bncwqFTDnDLl1gD+RRC+a7A
	a7aO/3T+1jFSKBawW2mACcK2/qkAdlMt4z6zZLQauejMKps6wKILaVTyg6c88B3R3k9ILPyK0Vj
	JgdgY+U4DRrZkMA4dLql+oQ4nxOxwArsMxbQ=
X-Received: by 2002:a17:906:9f8f:b0:c49:a539:aa45 with SMTP id a640c23a62f3a-c50963cf771mr521124166b.42.1794702729152;
        Sat, 14 Nov 2026 16:32:09 -0800 (PST)
Received: from sohrab-omarchy.taila18b31.ts.net (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm260695166b.1.2026.11.14.16.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:32:07 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: rafael@kernel.org,
	viresh.kumar@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abelvesa@kernel.org,
	mani@kernel.org,
	admin@mswin.me,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: sm6125: Add cpufreq-hw node
Date: Sun, 15 Nov 2026 01:31:57 +0100
Message-ID: <20261115003158.391171-3-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115003158.391171-1-majidhhdri@gmail.com>
References: <20261115003158.391171-1-majidhhdri@gmail.com>
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

SM6125 has the same cpufreq-hw (OSM) blocks as SM6115, at 0xf521000
(silver cluster) and 0xf523000 (gold cluster), per the downstream
"trinket" device tree. Describe them and hook up the CPUs so the
frequency can scale instead of staying at the bootloader setting.

GCC on SM6125 has no plain GPLL0 output; GPLL0_OUT_EARLY is the PLL
itself and is used as the alternate source.

Tested on a Xiaomi Mi A3: policy0 300 MHz - 1.80 GHz, policy4
300 MHz - 2.02 GHz, scaling with schedutil; a single gold core holds
1998 MHz under 7-Zip.

Signed-off-by: Majid Hajiheidari <majidhhdri@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 5f558b548..1b148e453 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -43,6 +43,8 @@ cpu0: cpu@0 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
 			l2_0: l2-cache {
@@ -57,6 +59,8 @@ cpu1: cpu@1 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
 		};
@@ -66,6 +70,8 @@ cpu2: cpu@2 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
 		};
@@ -75,6 +81,8 @@ cpu3: cpu@3 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
 		};
@@ -84,6 +92,8 @@ cpu4: cpu@100 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
 			l2_1: l2-cache {
@@ -98,6 +108,8 @@ cpu5: cpu@101 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
 		};
@@ -107,6 +119,8 @@ cpu6: cpu@102 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
 		};
@@ -116,6 +130,8 @@ cpu7: cpu@103 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
 		};
@@ -1633,6 +1649,19 @@ intc: interrupt-controller@f200000 {
 			interrupt-controller;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		cpufreq_hw: cpufreq@f521000 {
+			compatible = "qcom,sm6125-cpufreq-hw", "qcom,cpufreq-hw";
+			reg = <0x0 0x0f521000 0x0 0x1000>,
+			      <0x0 0x0f523000 0x0 0x1000>;
+			reg-names = "freq-domain0", "freq-domain1";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gcc GPLL0_OUT_EARLY>;
+			clock-names = "xo", "alternate";
+
+			#freq-domain-cells = <1>;
+			#clock-cells = <1>;
+		};
 	};
 
 	timer {
-- 
2.56.1

