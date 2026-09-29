Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8142E3E4C99
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651468; cv=none; b=XHbVf6VMUN0XRHS4rcKgOQsaMLnLLlRPCigjuLuE9vu3uE130l70LpRgTOsgaFcrdY0oTngGnE6BeFPftitXrWQQs8Cjw74j7P0KRr1nK+qo2+k7Y18guXbNekobUDUvOKxHE1r+h3lbdlJUicRVHRsmMadQTYO5V5ONwIEVuAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651468; c=relaxed/simple;
	bh=729smfe97nsHknEcCh4ID0nCAOBB5sKdrUWiJe5+/KE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HcqEOnIvAV3ptRNSsbq+fQeRnHP9wvrcczneoFOEOCpvNz7NEhAhLTntEQV813gDNkPakKBMkJfBZUil6Sok474uWCmSsmhKjWw3r2sBmdcJAQGY+ejUnQfFIXGMjt0QoygrWj4xywM0J7c7EhQVY25NroxrZSFf9XTjkL0UeDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aL9Kpj+0; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aL9Kpj+0"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so20686745e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790651461; x=1791256261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9MH65Y4Qlv5+yAPCv0rUtck+DoTMzMhWmQp7zLk8Sxo=;
        b=aL9Kpj+0PgQ0+CABDlxXDuWposTyRVkkE7+N+x+2Z2mh5xAoCxo+ohN9twlc29l2eK
         dp0pWYM5PbWJV9dumtnIYQ0/RiH/F3/pdtjmVcLIIjbCEGlFQnbw00Ei9KkiAemcMPfd
         1p0QctPIGuzf3uXhcdrm0n84KmHyvGUkiNimvYnaRhf/IzO9up9QUfe7Oqw/Ei75egvq
         UD00NP9600PqWZGc05BI8N6xcONVy2QJ4XEklQxQ32kZearcG2dnkRXSDGWHtVxKv/Xr
         1geTNSc205vj0Y/QOjHo+wmk0Vpbv2FedmWgPHK65Z9i18YRUzPyEqTk+/edvTapPzkx
         Glvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651461; x=1791256261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9MH65Y4Qlv5+yAPCv0rUtck+DoTMzMhWmQp7zLk8Sxo=;
        b=PovM5GDAhRQ5g93HR9EizGx9/Wn4khVmS+FTE2GlF/I9ULKVQiTKkoKo+KnDybLjdt
         O+1MSSztellZmlDsF2/MbWdB+IhY2e1rwrzuekrfx1XmTyQLXDEprX1BMIBe1BCqtFRi
         8KPxU7lnbhuowInuxZO2P1UagvujVFVMg8/ZIK0npAy7pVyaUX3E+/zWKEfHhw+8uk9T
         f4XpWJ5w32dqvlWJpOW1Es1mbWScA47TTUD5LwQ30JB16W2iGJ5x6i2OLsFCvyAawVu5
         GJLG2w+rZiHeRAgSdelBPmdlEZOnz2bRzdPhzdi0OiDnCiW0qmzVFIthq/7ZydNNzJ1E
         9OKw==
X-Forwarded-Encrypted: i=1; AKwUvByYbC3xbq0AW5/2LRmcdn8C/X+u68DL20sRr3mbm1YtRTgOZ/ImxyUGAFpuw0zu73xu43SWvjsGt1cABeY=@vger.kernel.org
X-Gm-Message-State: AFuF++l79hQxNGTp9wzNJFYCBWms/EfEg9hBIVSxpbgN2HaWZcJ/kj9K
	PCKn2ZRgwFx1vLbNymZQv1wLhofM0///0sHZgr4TfXMh7mq8k8v+F4gT1MoQ7TjrObk=
X-Gm-Gg: AYBFou3p9Mpw/rdXuPscB2vjZf4X1MRTQqpOj4g8KfBia0B81YChMB65e3p8lT9ePuq
	XPPaTAVy4Y983c9gDRDLMDAMDUuBVhrZWTe0H96CXB03MeFWzd/21QDjVtoTnPw2YXbTq1Q8SPr
	wlSVbthThi3cMrmw+gYjpbtW8o7eW/6MIDy1+sdf0BvnMbW+SfY6qJ0n35zYSLWd2f01HdJkOvG
	BugX92S9ZnGQVGo0LYaNJMZTCmvMozJZA3I3wKE4hIsLgj4Gyv1JzBfnqT+OfMAsABWl62yp5MM
	y/WRVPuN9Vd4Gg7kaWKa23izISKfC1GMjZ+PvgQxlL2lxkMN5xlR5tnPSeNigMqcjhgW366stSb
	DNzUVsf9AjajnIbY9x1v3lAWcqWDRLiQjwHAAy4wUC6TIsOgQEZQ2oskPeGlIqabiVxPuwviV5t
	Rxpb+fuA8kbo+f1Acgl4CWULCcqsaoXf4DSpzHvX9xGIjSfyN9SCoVMfmjnpNuu8Forw8MWt1ou
	PAeX9TEgZY3ylNcuTGr7G9S7bg+lXT4wFVtS3MT5cebM0dGwsEJ2eSQZLuKxA==
X-Received: by 2002:a05:600c:1907:b0:4a0:f8b:e871 with SMTP id 5b1f17b1804b1-4a010221dfdmr4502565e9.35.1790651461535;
        Mon, 28 Sep 2026 20:11:01 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfa66e5sm46706265e9.11.2026.09.28.20.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:11:01 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 29 Sep 2026 04:10:48 +0100
Subject: [PATCH 2/2] arm64: dts: exynos850: Add operating points for CPUs
 and enable cpufreq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-exynos850-acpm-node-cpufreq-v1-2-5a86c1d404b8@linaro.org>
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Thomas Turner <tturner@lineageos.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Exynos850 has two clusters with four Cortex-A55 cores each. The OPPs are
identical for both clusters.
Add OPPs for both clusters and replace cpu clocks with ACPM
EXYNOS850_CLK_ACPM_DVFS_CPUCL{0,1} clocks.

The maximum nominal frequency should be 2.002 Ghz but at this point the
following OPP is not added here:

	opp-2002000000 {
		opp-hz = /bits/ 64 <2002000000>;
		opp-microvolt = <1050000>;
		clock-latency-ns = <500000>;
	};

due to stability issues. Testing on a fully loaded system with CPU-bound
tasks triggers data aborts and illegal instruction errors at 2.002 GHz
after 1-2 hours of such stress testing.
Running the same workload overnight on a CPUs fixed at previous OPP didn't
lead to any issues so opp-1846000000 is currentlly the highest one as it is
considered safe.

Higher OPPs can be re-evaluated once thermal support is implemented.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 224 +++++++++++++++++++++++++++++-
 1 file changed, 220 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 91c6cee8f483..36501e5903f8 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -100,8 +100,9 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0>;
 			enable-method = "psci";
-			clocks = <&cmu_cpucl0 CLK_CLUSTER0_SCLK>;
-			clock-names = "cluster0_clk";
+			clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
+			clock-names = "cpucl0";
+			operating-points-v2 = <&cpucl0_opp_table>;
 		};
 
 		cpu1: cpu@1 {
@@ -109,6 +110,8 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a55";
 			reg = <0x1>;
 			enable-method = "psci";
+			clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
+			operating-points-v2 = <&cpucl0_opp_table>;
 		};
 
 		cpu2: cpu@2 {
@@ -116,6 +119,8 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a55";
 			reg = <0x2>;
 			enable-method = "psci";
+			clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
+			operating-points-v2 = <&cpucl0_opp_table>;
 		};
 
 		cpu3: cpu@3 {
@@ -123,6 +128,8 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a55";
 			reg = <0x3>;
 			enable-method = "psci";
+			clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
+			operating-points-v2 = <&cpucl0_opp_table>;
 		};
 
 		cpu4: cpu@100 {
@@ -130,8 +137,9 @@ cpu4: cpu@100 {
 			compatible = "arm,cortex-a55";
 			reg = <0x100>;
 			enable-method = "psci";
-			clocks = <&cmu_cpucl1 CLK_CLUSTER1_SCLK>;
-			clock-names = "cluster1_clk";
+			clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
+			clock-names = "cpucl1";
+			operating-points-v2 = <&cpucl1_opp_table>;
 		};
 
 		cpu5: cpu@101 {
@@ -139,6 +147,8 @@ cpu5: cpu@101 {
 			compatible = "arm,cortex-a55";
 			reg = <0x101>;
 			enable-method = "psci";
+			clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
+			operating-points-v2 = <&cpucl1_opp_table>;
 		};
 
 		cpu6: cpu@102 {
@@ -146,6 +156,8 @@ cpu6: cpu@102 {
 			compatible = "arm,cortex-a55";
 			reg = <0x102>;
 			enable-method = "psci";
+			clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
+			operating-points-v2 = <&cpucl1_opp_table>;
 		};
 
 		cpu7: cpu@103 {
@@ -153,6 +165,210 @@ cpu7: cpu@103 {
 			compatible = "arm,cortex-a55";
 			reg = <0x103>;
 			enable-method = "psci";
+			clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
+			operating-points-v2 = <&cpucl1_opp_table>;
+		};
+	};
+
+	cpucl0_opp_table: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-130000000 {
+			opp-hz = /bits/ 64 <130000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-182000000 {
+			opp-hz = /bits/ 64 <182000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-247000000 {
+			opp-hz = /bits/ 64 <247000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-351000000 {
+			opp-hz = /bits/ 64 <351000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-442000000 {
+			opp-hz = /bits/ 64 <442000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-546000000 {
+			opp-hz = /bits/ 64 <546000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-650000000 {
+			opp-hz = /bits/ 64 <650000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-806000000 {
+			opp-hz = /bits/ 64 <806000000>;
+			opp-microvolt = <656250>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-949000000 {
+			opp-hz = /bits/ 64 <949000000>;
+			opp-microvolt = <681250>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1053000000 {
+			opp-hz = /bits/ 64 <1053000000>;
+			opp-microvolt = <706250>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1157000000 {
+			opp-hz = /bits/ 64 <1157000000>;
+			opp-microvolt = <737500>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1300000000 {
+			opp-hz = /bits/ 64 <1300000000>;
+			opp-microvolt = <781250>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1456000000 {
+			opp-hz = /bits/ 64 <1456000000>;
+			opp-microvolt = <825000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1586000000 {
+			opp-hz = /bits/ 64 <1586000000>;
+			opp-microvolt = <875000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1742000000 {
+			opp-hz = /bits/ 64 <1742000000>;
+			opp-microvolt = <937500>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1846000000 {
+			opp-hz = /bits/ 64 <1846000000>;
+			opp-microvolt = <981250>;
+			clock-latency-ns = <500000>;
+		};
+	};
+
+	cpucl1_opp_table: opp-table-1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-130000000 {
+			opp-hz = /bits/ 64 <130000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-182000000 {
+			opp-hz = /bits/ 64 <182000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-247000000 {
+			opp-hz = /bits/ 64 <247000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-351000000 {
+			opp-hz = /bits/ 64 <351000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-442000000 {
+			opp-hz = /bits/ 64 <442000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-546000000 {
+			opp-hz = /bits/ 64 <546000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-650000000 {
+			opp-hz = /bits/ 64 <650000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-806000000 {
+			opp-hz = /bits/ 64 <806000000>;
+			opp-microvolt = <656250>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-949000000 {
+			opp-hz = /bits/ 64 <949000000>;
+			opp-microvolt = <681250>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1053000000 {
+			opp-hz = /bits/ 64 <1053000000>;
+			opp-microvolt = <706250>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1157000000 {
+			opp-hz = /bits/ 64 <1157000000>;
+			opp-microvolt = <737500>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1300000000 {
+			opp-hz = /bits/ 64 <1300000000>;
+			opp-microvolt = <781250>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1456000000 {
+			opp-hz = /bits/ 64 <1456000000>;
+			opp-microvolt = <825000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1586000000 {
+			opp-hz = /bits/ 64 <1586000000>;
+			opp-microvolt = <875000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1742000000 {
+			opp-hz = /bits/ 64 <1742000000>;
+			opp-microvolt = <937500>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1846000000 {
+			opp-hz = /bits/ 64 <1846000000>;
+			opp-microvolt = <981250>;
+			clock-latency-ns = <500000>;
 		};
 	};
 

-- 
2.51.0

