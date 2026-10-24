Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792838054;
	b=JSrX4qnuwe+fytx/x3B98tCVSxI3qr73oK1hveXjN78uJ7/G/CtigaRsf1NgDoHGPVEU
	 tzxOSQDGzZyDERbpJ1gHQMm+qiMf8IX2irwFdvtSuSs4Juvgov9cVmZ7zPwVjkHAQUHD3
	 qMwvzwdWvMt5IR90vLZ2KDMPRm0Sox71wXlzPMD3vKlqypZiGI7L3gN3TrzyGZCITcqm+
	 UBPVKCMyiL7qtLLBQYHEtkp/iQosdeZYVFOODbjg9CbfB01H7ivy4y7c9NMPldvVnFhea
	 Gcbk41vLOJi1eFbdNtd2kY+US7x7tCH16CuJZokprSIeLeUaHB7sHwNtMakEuVMIflw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792838054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A5n4SrWvMlC2EiMhPFY7DM1ChkFypUIMEv8fI4m9dNU=;
	b=kpruBAzJA3Q7ohUk6eBMX9yd5OCnh45MIR+Wscu4pSo5/ZtF6sssEXjJViDAgIXyWeZD
	 sQJK2XNH+rTFz/sf/MBfu1ijZkRKRH5Ux1Xa3DsfwYWaEDI5eAnwvu8DHIRlr1PCng5l5
	 HG/YmgNWqZLjo9BDD7Cw6B1HtsgDGjA5L6GCyWz3i3Td9MVNAH+fqktofxci4/Ob14x/d
	 mwDVohEtOkQw/Gvbu6CldJMP6rT1MrcG73kyk7pkFdg1QxGhotbXK13x2dEKqag0wYMXO
	 syAcp1iSTYhjJBePOcwYtVmMgUBx1FU6VaUmmeZgzOLRvhsgMZ+GILMrdFWfH1e9KHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YdKX24K5;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F04E606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F04E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YdKX24K5
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so1434945e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792838052; x=1793442852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5n4SrWvMlC2EiMhPFY7DM1ChkFypUIMEv8fI4m9dNU=;
        b=YdKX24K5TOlpcFJ0JFIKaPqeZd4jYWqUjIEwLJZQlXOYeeUNYiMecPrIjGLx4Z4fnx
         m7HvkLbn/xgQWV/9JK9FzWU81MbsnAt89fyh5SOPZcPW7LTgeEEex2KX6oFkYxrL87Gr
         5Fh6FS/GSOTMoj4WtGxvocaACDei6U2u6mXZaoqJ+zP9ZwJyg1YPYl2l/Xx8QAZMbIWc
         eafGUH0BG9+0f4o77CCKZS0eTQYVuIuC3270RWyV+W86puo4d2xYSl8OQe2QWUJ4ffom
         tkNmTSe6kHB09Dm23ZQmSm4Unn66KFGafc7CF93cE8MMb3By5rX8S+0REEDh0s95Uqyp
         bfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792838052; x=1793442852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A5n4SrWvMlC2EiMhPFY7DM1ChkFypUIMEv8fI4m9dNU=;
        b=s7XavpuFnMJSKdCpJ/bNZcj87NrHrASYfiu6hxUzuIE7ke5gOe71+5uL0AJrtre0eC
         C1WDbIsKlW7eUGmjbneQ9tcw403B9d8Pw2YGGLMiF7Lf+wiVaXc5seTSqrfOFHvKykVc
         kQXpl7GU3WBlS61WP5meSxAjYUez3SZPRGMU+2U1DUxFB2l/H8apCo5RONSATsNkBuyK
         P23uEq7Tf8x1ZtdIvQI1Fy8IxBHIKwhUq+KihBJwBTvHDlK05Jel9skiAcBJVgjat8vf
         UOI1EAbkfI0MQIwS+VapZIrgmwrLihMlD+ztssiOdyZFWmg/Vzn8QeUfsUanDq7KI3vj
         5GiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmGf/4lrsPoreVfrZKQ0haJU/KV/wI3w/LglDxkRU0B8bUPGL7BsPtjdud7OWy1exkG72oPsEXfs30t4Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqsamhnym8sj5T2D7Dt5PgO62UCNT6OUqFd5XOpIpw6xKRaurC
	zd2+EBQ+GGwcg9aAI4I0knLYgkMst4ns+7bg8rplxveP5DfI0PwTxwEj
X-Gm-Gg: AYBFou2qlGMqB4L5McCK0CX//5NUqi7vamWhkkk51jbkCFpl3UdEwBy8cvV54V6nvy/
	9zDkHeMpyj5JhqhuQKAuo2+TCwQ2B3JtHYQQBRX1D1K2qWsnuaIM6xZ8JoWSXibpqe5g9Xe34Yw
	A/LDeTCwMU5e9YfzX5oEjx6HQ4MlrqCv+GFd2ij2R2LQEgvvrr4y+O7Tn/HE7wJ9kp8LhvUubt6
	HsgYyHCHuQnetl5eAJxU4bWaXg6EXFnwiCIBAO/2jmC23bsdUmn0bGwl8M4OlMFlvtSZyArefr5
	1lhZcus3qx9sOkY3kjMiT2Ot3otxnTB3wm+asYUhG0v6yIaQtzLei04JI8tnu24efDZzmJjoaXp
	Rd1mLHFAWLayfboW/W1Oq3yn2GKZ7cuhXhEa9CsUAoElQx6UyJJmngK5Y509tWxj6t73/HiTJYr
	T4hXTz2V9T+kzYAQxIUhXddfiv4BGBeoEqcHB2rn7l77cDEUoqsyN/csamSGO6VGAmJ1wNY5+jw
	F2KphRETviHVZPvcNZdCBUxvcCBUUehJ34LNg+txrUnfcQAX+G/rDVvZsYvclPolbUgWqTtJU2C
	XAc8WOkUf7fUc7UBi/P6rj+gHzqKXYmnxzdXvRv30Bmc1qEgJvrO+EqQkYcknCDzaLYMYU1MQth
	f4NWyapA=
X-Received: by 2002:a05:600c:83c7:b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4a35ac3f293mr26033995e9.1.1792838052522;
        Sat, 24 Oct 2026 03:34:12 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-024.globalnet.hr. [213.149.37.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd35c2sm3544825f8f.39.2026.10.24.03.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:34:12 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH 2/2] arm64: dts: qcom: ipq8074: Add CMN PLL
Date: Sat, 24 Oct 2026 12:33:10 +0200
Message-ID: <20261024103401.761125-2-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261024103401.761125-1-robimarko@gmail.com>
References: <20261024103401.761125-1-robimarko@gmail.com>
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

Add the CMN PLL node, it will be used to feed the required fixed clocks
to networking subsystem.

CMN PLL provides bias_pll_cc_clk and bias_pll_nss_noc_clk to GCC.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 75a5ae30d966..8afc63a72144 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-ipq8074.h>
+#include <dt-bindings/clock/qcom,ipq8074-cmn-pll.h>
 
 / {
 	#address-cells = <2>;
@@ -15,6 +16,12 @@ / {
 	interrupt-parent = <&intc>;
 
 	clocks {
+		ref_48mhz_clk: ref-48mhz-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <48000000>;
+			#clock-cells = <0>;
+		};
+
 		sleep_clk: sleep_clk {
 			compatible = "fixed-clock";
 			clock-frequency = <32768>;
@@ -257,6 +264,18 @@ mdio: mdio@90000 {
 			status = "disabled";
 		};
 
+		cmn_pll: clock-controller@9b000 {
+			compatible = "qcom,ipq8074-cmn-pll";
+			reg = <0x0009b000 0x800>;
+			clocks = <&ref_48mhz_clk>,
+				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
+				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
+			clock-names = "ref", "ahb", "sys";
+			#clock-cells = <1>;
+			assigned-clocks = <&cmn_pll IPQ8074_CMN_PLL_CLK>;
+			assigned-clock-rates-u64 = /bits/ 64 <12000000000>;
+		};
+
 		qfprom: efuse@a4000 {
 			compatible = "qcom,ipq8074-qfprom", "qcom,qfprom";
 			reg = <0x000a4000 0x2000>;
@@ -369,11 +388,15 @@ gcc: clock-controller@1800000 {
 			clocks = <&xo>,
 				 <&sleep_clk>,
 				 <&pcie_qmp0>,
-				 <&pcie_qmp1>;
+				 <&pcie_qmp1>,
+				 <&cmn_pll IPQ8074_BIAS_PLL_CC_CLK>,
+				 <&cmn_pll IPQ8074_BIAS_PLL_NSS_NOC_CLK>;
 			clock-names = "xo",
 				      "sleep_clk",
 				      "pcie0_pipe",
-				      "pcie1_pipe";
+				      "pcie1_pipe",
+				      "bias_pll_cc_clk",
+				      "bias_pll_nss_noc_clk";
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
-- 
2.56.0

