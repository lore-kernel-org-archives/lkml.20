Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257449;
	b=b3NGEKFmPHmkKgHoM2WiPlXPUXetWh/nbBPwljsvg3BADX6bRy9Yd4nvBNrZ6UD36Ef9
	 o8QJ3pjtgjAwZ6dGt9In3vb+wXr+L1pAByJvcQkCWSa2cVafNc1MaLNPPrB2QII5lw1C/
	 BE4MXciBhiiQVklJaqiiDcH2lNaWn85OX0/PInuJbqzvy8g03LFD+4aqQeo03Rb6CHncn
	 PiIRcJF4HlHYPaOEJDm3NVajFrpIAGqa78J4Hshmx2rtd9JEK0pNepOh1OcVTpRXUlyiE
	 Gj+JvjLI3fkgLWho81GhaLRN74dy6FYD1pbEh/kNgisCCmCTOVcHptLzfdn0qKNouoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zpxeKcgAkSskTVZweNt0xZHjCU42lK3BnpOhE7W/fFo=;
	b=kcJDhU+Zri2NV16KmdM68MZH6LcOAjnWTW4XePgW5XVuiqSnQ9YsC9DE5Fn7q0OC2SJg
	 S52UEMGz1P9wUDVJiZWCCMFazwGn9YI/i/HMV2W+huWAzl5z/3PFzq6B15S1bbW4+jXW9
	 3fTyB33NmW2wCbJ/NAA0tzlFIyLTo32LjXh1C/ERst0etCIluZdsiyhyRIbEFEg1aHEw3
	 Fyepec8WxdLaOhfZRgKSWCDXpI/in2EFEkFQbXx+3/jhIWdHX7e4Qr6LhkuQ/H5R/Yavk
	 aKJaPZQM0gSoEDKDSnECBt6NltEWOAOem9zR6z93kV8VraUEtj3sxEXP+vCri6fooyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jN4KuBp1;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84684606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84684606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jN4KuBp1
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a315ed211so574217eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793257448; x=1793862248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zpxeKcgAkSskTVZweNt0xZHjCU42lK3BnpOhE7W/fFo=;
        b=jN4KuBp1GDISBgP/k25jPkHj7NRX9HNEN7QAbQ+iRi3D9SmntOGmmt2Ixb+8cMDmqy
         CPcWxgUmblHVJoQrEd7KlufeyugopZ7TMuHW9XUf87BbcASTt7BIpAdd6jXkt6MW7czz
         k4iY+xgxb0P53R78HPC0U0pUzv2SzyKZGycGK81p56clP7gv3LJmncpA92+EznrBDIQz
         92hBGqM21GTGay7j6IqsPPfXt18HJc4op1qQWbqic1FdeOQMTJHJn15SuKzmda/vM6a6
         I1LuXj/VVR7aiyL2+RrAVjS81toO6UEcDFQWmW60V/+7/tQrnNvQCjuPeemeRNBana0k
         zoqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257448; x=1793862248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zpxeKcgAkSskTVZweNt0xZHjCU42lK3BnpOhE7W/fFo=;
        b=AtGSIIGI0qej+tK03LLEGB7fDvQDRs7UoWQNPT8QrAHVSep06sC7jka8sj4PoG/lsS
         lt2cyDnNi2WJJV3t+GI9YgOSfryUJ1cEA6czCtz5a6ysc6NamqYb+4H/raBVUrIsb8K/
         ol1YSV+/hBSmAEtl+oRNSQ3nxkpK/Klh0c28YzhSVBiWVLh9HvLcl8TaGYxDlMT38/Jh
         tPW9clCADY9RMxYlJGxGF2Cjg/Nthsxl5pZqkWDTjTX4rM0mqZ4W157KvuWvcWPGmgu7
         J+Flef6igxn9Y08UDeLOm6NRJay9gRDYvlvHX6QUumabVNTWV24Jv+08pu5G/tlZ+Xeu
         FM+A==
X-Forwarded-Encrypted: i=1; AKwUvBzn+pYmDTNo90MRBUuEwdjMPikVN9IwWs+P18TKFlxBOmVtqZeRTGI3WiBoaNgZ/EOFwB5MCxDcpd86cz8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLGasTBGJC88X0Z/ReRq15HWCeCSaM2tzG5O4hnrJmYauIZhFp
	Ptq6FDQkqC4Vm0QZYvumLEvEf+Ta8I9+b9Nfnno6RPxmV4O9h/YRHuR0
X-Gm-Gg: AYBFou2l0KVX1V4s2Pu9Fb8rIIY4Q2z5rkqkB8VhnnO/3wfa+mgzxwb93x6fXLwW/1E
	rK9jc53gHQd3UFOELRYD6yLYzJMiad8OkdMX9Nr/8jkglkyZI0cUiNSVC+kkqAXlGmLRMsJqltg
	QELHR0g+P0N9TtPtw70aKgXhOw6v6z6C2ccwnlqA8Xe6JMl2edjlP3scF4E34l1B0/LxniSPd7D
	Lc6b37e1Y4Y9gVJDIkvpxaA3rcgAZbawUzyiTS/vuWarSauWNMVKDuCRQ/vb4BvqDqwLyT9jcR4
	BIePve0KAYLOyl+UxBuCZky+Ad8SybidpmEHMJdqlhSdgicJb5S/KaC3U0vwy6KUvx93C3a7FO8
	h7dDwuWkjxezK2EK+rgfPLIoezM6nSXNncrtcR9TPT4V4/aQ+iZ445cqeDLSm3P7yYHzVusaa/L
	O2/ij2vssw7Gt8SmiZIvFBpjZKGGiCZisANIsWnlv0a+IZ+CnV8lWBbkfOlFpRjaQoAEoLo42yU
	tbZfATqx1BQKVi5mNvq/tOgJQ54sbfsUCw1pFM9WJDneWBnM3sh4ElOKVX8UW5bX65Hc5hxbted
	sT780Kne7OlPMMLQv1/OSCApo0ttlsHj1mN+DguEUYf1VIqwBXyIhLhND1Mn0e7jErD1ovCNtyj
	Rs5rJQS4=
X-Received: by 2002:a05:7301:1a08:b0:341:c383:9afb with SMTP id 5a478bee46e88-36a300531e0mr2258357eec.20.1793257447409;
        Thu, 29 Oct 2026 00:04:07 -0700 (PDT)
Received: from Sobhana.localdomain ([152.58.200.233])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2398fa4csm16955443eec.24.2026.10.29.00.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:04:06 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 29 Oct 2026 07:03:02 +0000
Subject: [PATCH RESEND v11 5/5] arm64: dts: qcom: Add SM7250 devicetree
 file
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
Message-Id: <20261029-master-v11-5-2c29e382162c@gmail.com>
References: <20261029-master-v11-0-2c29e382162c@gmail.com>
In-Reply-To: <20261029-master-v11-0-2c29e382162c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Danila Tikhonov <danila@mainlining.org>, 
 David Wronek <davidwronek@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793257394; l=19661;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=60DMfWjd+2/s71BtnsJiKaTgs+OVMSVQ/SX6L8j5o14=;
 b=4sFdRW0IsUr20O3M4/3+Q8qNkywdEm5hC9yGB6dHwUpoiRP92CXzdMBLLfqnlNGaPhtN7HiN8
 z7pKIILgEwzBAefVtojMh7anxChd0xPCe0fxwdiwcpurGiGDE4fS7Lk
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Add base devicetree file for SM7250 SoC.
This file adds the basic nodes like cpu, psci and other required
configuration for booting up to the serial console.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm7250.dtsi | 771 +++++++++++++++++++++++++++++++++++
 1 file changed, 771 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7250.dtsi b/arch/arm64/boot/dts/qcom/sm7250.dtsi
new file mode 100644
index 000000000..48480e685
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm7250.dtsi
@@ -0,0 +1,771 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
+ */
+
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sm7250-gcc.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/qcom,rpmhpd.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,rpmh-rsc.h>
+
+/ {
+	interrupt-parent = <&intc>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x0>;
+			clocks = <&cpufreq_hw 0>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+			next-level-cache = <&l2_0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			power-domains = <&cpu_pd0>;
+			power-domain-names = "psci";
+			#cooling-cells = <2>;
+
+			l2_0: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x20000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+
+				l3_0: l3-cache {
+					compatible = "cache";
+					cache-level = <3>;
+					cache-size = <0x200000>;
+					cache-unified;
+				};
+			};
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x100>;
+			clocks = <&cpufreq_hw 0>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+			next-level-cache = <&l2_100>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			power-domains = <&cpu_pd1>;
+			power-domain-names = "psci";
+			#cooling-cells = <2>;
+
+			l2_100: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x20000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x200>;
+			clocks = <&cpufreq_hw 0>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+			next-level-cache = <&l2_200>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			power-domains = <&cpu_pd2>;
+			power-domain-names = "psci";
+			#cooling-cells = <2>;
+
+			l2_200: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x20000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x300>;
+			clocks = <&cpufreq_hw 0>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+			next-level-cache = <&l2_300>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			power-domains = <&cpu_pd3>;
+			power-domain-names = "psci";
+			#cooling-cells = <2>;
+
+			l2_300: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x20000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x400>;
+			clocks = <&cpufreq_hw 0>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+			next-level-cache = <&l2_400>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			power-domains = <&cpu_pd4>;
+			power-domain-names = "psci";
+			#cooling-cells = <2>;
+
+			l2_400: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x20000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu5: cpu@500 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x500>;
+			clocks = <&cpufreq_hw 0>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+			next-level-cache = <&l2_500>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			power-domains = <&cpu_pd5>;
+			power-domain-names = "psci";
+			#cooling-cells = <2>;
+
+			l2_500: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x20000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu6: cpu@600 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x600>;
+			clocks = <&cpufreq_hw 1>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1740>;
+			dynamic-power-coefficient = <341>;
+			next-level-cache = <&l2_600>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
+			power-domains = <&cpu_pd6>;
+			power-domain-names = "psci";
+			#cooling-cells = <2>;
+
+			l2_600: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x40000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu7: cpu@700 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x700>;
+			clocks = <&cpufreq_hw 2>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1740>;
+			dynamic-power-coefficient = <375>;
+			next-level-cache = <&l2_700>;
+			qcom,freq-domain = <&cpufreq_hw 2>;
+			power-domains = <&cpu_pd7>;
+			power-domain-names = "psci";
+			#cooling-cells = <2>;
+
+			l2_700: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x80000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+
+				core4 {
+					cpu = <&cpu4>;
+				};
+
+				core5 {
+					cpu = <&cpu5>;
+				};
+			};
+
+			cluster1 {
+				core6 {
+					cpu = <&cpu6>;
+				};
+			};
+
+			cluster2 {
+				core7 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		domain-idle-states {
+			cluster_sleep_pc: cluster-sleep-0 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x41000044>;
+				entry-latency-us = <2752>;
+				exit-latency-us = <3048>;
+				min-residency-us = <6118>;
+			};
+
+			cluster_sleep_cx: cluster-sleep-1 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x41001244>;
+				entry-latency-us = <3638>;
+				exit-latency-us = <4562>;
+				min-residency-us = <8467>;
+			};
+
+			cluster_sleep_aoss: cluster-sleep-2 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x4100b244>;
+				entry-latency-us = <3263>;
+				exit-latency-us = <6562>;
+				min-residency-us = <9826>;
+			};
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			little_cpu_sleep_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <549>;
+				exit-latency-us = <901>;
+				min-residency-us = <1774>;
+				local-timer-stop;
+			};
+
+			little_cpu_sleep_1: cpu-sleep-0-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <702>;
+				exit-latency-us = <915>;
+				min-residency-us = <4001>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <523>;
+				exit-latency-us = <1244>;
+				min-residency-us = <2207>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_1: cpu-sleep-1-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <526>;
+				exit-latency-us = <1854>;
+				min-residency-us = <5555>;
+				local-timer-stop;
+			};
+		};
+	};
+
+	firmware {
+		scm: scm {
+			compatible = "qcom,scm-sm7250", "qcom,scm";
+			#reset-cells = <1>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the size */
+		reg = <0x0 0x80000000 0x0 0x0>;
+	};
+
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+
+		cpu_pd0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>,
+					     <&little_cpu_sleep_1>;
+		};
+
+		cpu_pd1: power-domain-cpu1 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>,
+					     <&little_cpu_sleep_1>;
+		};
+
+		cpu_pd2: power-domain-cpu2 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>,
+					     <&little_cpu_sleep_1>;
+		};
+
+		cpu_pd3: power-domain-cpu3 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>,
+					     <&little_cpu_sleep_1>;
+		};
+
+		cpu_pd4: power-domain-cpu4 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>,
+					     <&little_cpu_sleep_1>;
+		};
+
+		cpu_pd5: power-domain-cpu5 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>,
+					     <&little_cpu_sleep_1>;
+		};
+
+		cpu_pd6: power-domain-cpu6 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&big_cpu_sleep_0>,
+					     <&big_cpu_sleep_1>;
+		};
+
+		cpu_pd7: power-domain-cpu7 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&big_cpu_sleep_0>,
+					     <&big_cpu_sleep_1>;
+		};
+
+		cluster_pd: power-domain-cpu-cluster0 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_sleep_pc>,
+					     <&cluster_sleep_cx>,
+					     <&cluster_sleep_aoss>;
+		};
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		hyp_mem: hyp@80000000 {
+			reg = <0x0 0x80000000 0x0 0x600000>;
+			no-map;
+		};
+
+		xbl_aop_mem: xbl-aop@80700000 {
+			reg = <0x0 0x80700000 0x0 0x160000>;
+			no-map;
+		};
+
+		cmd_db: cmd-db@80860000 {
+			compatible = "qcom,cmd-db";
+			reg = <0x0 0x80860000 0x0 0x20000>;
+			no-map;
+		};
+
+		xbl_uefi_mem: xbl-uefi@80880000 {
+			reg = <0 0x80880000 0 0x14000>;
+			no-map;
+		};
+
+		smem_mem: smem@80900000 {
+			compatible = "qcom,smem";
+			reg = <0x0 0x80900000 0x0 0x200000>;
+			no-map;
+			hwlocks = <&tcsr_mutex 3>;
+		};
+
+		removed_mem: removed@80b00000 {
+			reg = <0x0 0x80b00000 0x0 0x1300000>;
+			no-map;
+		};
+
+		camera_mem: camera@86000000 {
+			reg = <0x0 0x86000000 0x0 0x500000>;
+			no-map;
+		};
+
+		npu_mem: npu@86500000 {
+			reg = <0x0 0x86500000 0x0 0x500000>;
+			no-map;
+		};
+
+		video_mem: video@86a00000 {
+			reg = <0x0 0x86a00000 0x0 0x500000>;
+			no-map;
+		};
+
+		cdsp_mem: cdsp@87400000 {
+			reg = <0x0 0x87400000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		adsp_mem: adsp@89200000 {
+			reg = <0x0 0x89200000 0x0 0x2800000>;
+			no-map;
+		};
+
+		wlan_fw_mem: wlan-fw@8ba00000 {
+			reg = <0x0 0x8ba00000 0x0 0x200000>;
+			no-map;
+		};
+
+		ipa_fw_mem: ipa-fw@8bc00000 {
+			reg = <0x0 0x8bc00000 0x0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: ipa-gsi@8bc10000 {
+			reg = <0x0 0x8bc10000 0x0 0x5400>;
+			no-map;
+		};
+
+		gpu_mem: gpu@8bc15400 {
+			reg = <0x0 0x8bc15400 0x0 0x2000>;
+			no-map;
+		};
+
+		modem_wlan_mem: modem-wlan@8c000000 {
+			reg = <0x0 0x8c000000 0x0 0xf800000>;
+			no-map;
+		};
+
+		cdsp_sec_mem: cdsp-sec@9f400000 {
+			reg = <0x0 0x9f400000 0x0 0xc00000>;
+			no-map;
+		};
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0 0 0 0 0x10 0>;
+		dma-ranges = <0 0 0 0 0x10 0>;
+
+		gcc: clock-controller@100000 {
+			compatible = "qcom,sm7250-gcc";
+			reg = <0x0 0x00100000 0x0 0x1f0000>;
+			clock-names = "bi_tcxo",
+				      "bi_tcxo_ao",
+				      "sleep_clk";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		qupv3_id_1: geniqup@9c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x009c0000 0x0 0x6000>;
+			clock-names = "m-ahb", "s-ahb";
+			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			uart2: serial@988000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0 0x00988000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+		};
+
+		intc: interrupt-controller@17a00000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
+			      <0x0 0x17a60000 0x0 0x100000>;    /* GICR * 8 */
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 8 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,sm7250-pdc", "qcom,pdc";
+			reg = <0 0xb220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
+			qcom,pdc-ranges = <0 480 42>,
+					  <42 612 28>,
+					  <70 63 1>,
+					  <71 640 15>,
+					  <86 522 52>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
+		spmi_bus: spmi@c440000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c440000 0x0 0x0001100>,
+			      <0x0 0x0c600000 0x0 0x2000000>,
+			      <0x0 0x0e600000 0x0 0x0100000>,
+			      <0x0 0x0e700000 0x0 0x00a0000>,
+			      <0x0 0x0c40a000 0x0 0x0026000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+		};
+
+		apps_rsc: rsc@18200000 {
+			compatible = "qcom,rpmh-rsc";
+			reg = <0x0 0x18200000 0x0 0x10000>,
+			      <0x0 0x18210000 0x0 0x10000>,
+			      <0x0 0x18220000 0x0 0x10000>;
+			reg-names = "drv-0",
+				    "drv-1",
+				    "drv-2";
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			label = "apps_rsc";
+			qcom,tcs-offset = <0xd00>;
+			qcom,drv-id = <2>;
+			qcom,tcs-config = <ACTIVE_TCS  2>, <SLEEP_TCS   3>,
+					  <WAKE_TCS    3>, <CONTROL_TCS 1>;
+			power-domains = <&cluster_pd>;
+
+			rpmhcc: clock-controller {
+				compatible = "qcom,sm7250-rpmh-clk";
+				#clock-cells = <1>;
+				clock-names = "xo";
+				clocks = <&xo_board>;
+			};
+
+			rpmhpd: power-controller {
+				compatible = "qcom,sm7250-rpmhpd";
+				#power-domain-cells = <1>;
+				operating-points-v2 = <&rpmhpd_opp_table>;
+
+				rpmhpd_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					rpmhpd_opp_ret: opp1 {
+						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
+					};
+
+					rpmhpd_opp_min_svs: opp2 {
+						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+					};
+
+					rpmhpd_opp_low_svs: opp3 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					};
+
+					rpmhpd_opp_svs: opp4 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					};
+
+					rpmhpd_opp_svs_l1: opp5 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					};
+
+					rpmhpd_opp_nom: opp6 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					};
+
+					rpmhpd_opp_nom_l1: opp7 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					};
+
+					rpmhpd_opp_nom_l2: opp8 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
+					};
+
+					rpmhpd_opp_turbo: opp9 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					};
+
+					rpmhpd_opp_turbo_l1: opp10 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					};
+				};
+			};
+
+			apps_bcm_voter: bcm-voter {
+				compatible = "qcom,bcm-voter";
+			};
+		};
+
+		cpufreq_hw: cpufreq@18323000 {
+			compatible = "qcom,sm7250-cpufreq-hw", "qcom,cpufreq-hw";
+			reg = <0 0x18323000 0 0x1000>,
+			      <0 0x18325800 0 0x1000>,
+			      <0 0x18327800 0 0x1000>;
+			reg-names = "freq-domain0",
+				    "freq-domain1",
+				    "freq-domain2";
+			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
+			clock-names = "xo", "alternate";
+			#freq-domain-cells = <1>;
+			#clock-cells = <1>;
+		};
+
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x0 0x01f40000 0x0 0x40000>;
+			#hwlock-cells = <1>;
+		};
+
+		timer@17c20000 {
+			compatible = "arm,armv7-timer-mem";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			reg = <0x0 0x17c20000 0x0 0x1000>;
+
+			frame@17c21000 {
+				frame-number = <0>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c21000 0x1000>,
+				      <0x17c22000 0x1000>;
+			};
+
+			frame@17c23000 {
+				frame-number = <1>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c23000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c25000 {
+				frame-number = <2>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c25000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c27000 {
+				frame-number = <3>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c27000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c29000 {
+				frame-number = <4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c29000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c2b000 {
+				frame-number = <5>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c2b000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c2d000 {
+				frame-number = <6>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c2d000 0x1000>;
+				status = "disabled";
+			};
+		};
+
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+	};
+};

-- 
2.43.0

