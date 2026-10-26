Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016577;
	b=Pw4RYoE86YgccZfWH9oBdSsGFmK6aM1N7PoJ+66WY2aP0TVWD7GMx/YRRZuxmre4VK+f
	 gxMcb4mwSLgS/3vh9Au3YgJ5nAfaOAHPg+s5Vm5YrEL2fSX8BeYGi+R0Q1H9a8D8qpjWr
	 hdGywRBDndQuMcMx/Dlol5f/TVB+z/oFz4Md7MbrTm3PF0XfFuPodzk6RCmZYwUsY3kKh
	 TpC+93J7myJ/BbL9Kstw57YYkRufpcm51lB+rDLyuHsAFIPH6/YLBzHjMUtrj80EsTuXM
	 EQBXKkfwk9GiibDyaqf+EmSO9SoQlKMGh4Qaa+0vyUG+xMCaixHwIihhFvgYpfxRgbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eRu2LVCDgubTg9L+en5PQ0GMG00gbHZnnd7yh4N4PMs=;
	b=diYyjJV+9wn35QRFiz3qo9ewk6gnxyMgcnt4V6rJKKqQJCevqFfFYDyOza6Xa6umxxC/
	 zv8Qvv9zO5ycKCXQcxLH6yDOfrKzycP2a9L44Sx2zGxpQkaVnKa+m0OvPjn/5PEx8BS+3
	 tP51i+e95DFX8EJZ9xxkDlPyelFgdfYaPGzgiBQuZgi//nm2lt3h9N/UKBVNNGQybakhq
	 tLTMHlgT5i5qHvfRBB1JTD71IrTW5m/hhnAN8lAtf/bZSFA531dgTf/GZGCdEfHci4qRU
	 Hx4f0WxxsnWMjQhRDa07NNmEaIqRfE1zNoO7hVn5iAnB+dCzNL0SWDQEU/BKqMU6HzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="IQs2v/0j";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29016606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29016606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IQs2v/0j
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4956869750eso19188885e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016576; x=1793621376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eRu2LVCDgubTg9L+en5PQ0GMG00gbHZnnd7yh4N4PMs=;
        b=IQs2v/0jC8aDeoR5P+VbANJ7GL91aY0Nfs2pVHNy3kzjK3e0LNrpttJ2VkKaCz60JU
         SJJu2wEmAqxG8I2srwK7U6Cvg2noGm2Yax8ylVX/AcOsQHasnUVzieRYN2P7l8ToyrgJ
         zxLZN9DcYU7hQ6muYRJ4VTvNwJACEormO7ZV+tzApPKQ20xuYiEaqTudSHuxDqcktWN8
         mCohN/TFVUZ0+c89kiIn6RgTL60cZ4EmzX4WMoDyBVVscwyrpkaTUYBf1BpwG5PtlNyZ
         l4D0/bVzD1TNFNuOvmDNPE23gdPz58SGq6iMr3/hE1lYTiqX2URfk1wkIC+QNh9IcvtL
         r76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016576; x=1793621376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRu2LVCDgubTg9L+en5PQ0GMG00gbHZnnd7yh4N4PMs=;
        b=O+VgaxHEGAzUpxdDPvwBcwHC4Zl2tiymP8jngbZaLKRCFhCthnvufN562hV4RIHnCK
         UtheEJqx48MyUDnv5rEMh4f2lraAeyYfaD4CjWSmf9U/ABfoEo2rT0OUpb7jvM/DZhT3
         FRS8lcrTRcNcT/kBQ6//3PkXED75CbK6PENW2e5Nd+9aeJHbdnc2g3FWkcEYbMtj+gib
         jWkXSUYBw5hXOUn9a6HSKTREYp6D2TrrX/BwDT2NgqB6sWn5GId82atBSXvO/0SJGihC
         vMF1fjZ/CsTXt1QhMXLeWSINQIo4td188vK7s/3tH9sgY6ybbd3ZYovh4o2+zGyHNYZ1
         Gw/w==
X-Forwarded-Encrypted: i=1; AKwUvBwb1H7GkOaVHsVx9N3n1CJNF4ERA4vU7F8K8MIeh2xY0v6/nZQLk3UlHac+e08DEtf/+YtKZ4fF49V0+ek=@vger.kernel.org
X-Gm-Message-State: AFq9FYKT0UIA02O2F2nG+H49+ptc0IB9auaXqHs6n+ADYPcMxKeR3jEo
	cSyWh5C0W/mRCPDNrpRL3dFW4tT/plAUrRkeqSqhxfgt2drLk+qjJ/IW
X-Gm-Gg: AYBFou0zTSTqQ69gJXkzuSC5KeX/otivu7WDfizpefjXGIZZmLCBkhtnrbWbTM+r5I5
	m4XsCNZG8tXyCj6jrQKt3jjkiC/PD2v9f2nVCv9xmpUJBTZNcKf20Ed47FflT7tugmry/mGn+3E
	UusIp5dUrQ5vwYdio37NEgTGuhQLS3XaPxbZW5yniZryoLjOqi5GWucpqP/re4Ew2Q6CGE24dYM
	Q8+IpIx58qeVsL5VZdQbP29/VyUAowgk7USGoP8ch4An8+z6TCfjsk3uMmLIDyW8AlzDLVM+tg1
	9Ylpypm3jcqC/uXWGEUGgndAsGSzmbcZTKHT3HOSykK2i3OQSfBH+4SporP52ZLiPiSYkg0aAq3
	XVp6li9ALQCOjscGqAxmqXZRg2/7MLhk4wPmvAWjjHNhzlfjH6dBsjBxiKRuALT+rjnq5dxmJra
	4oaiM+Tywgjcc2s9B8hAlD01XPSLORk5h/KB5HvBNQSs7P7DivKSf1gIZiA6FHTHzym+0KyWMiz
	5ADN+L8j29ayr9PwflT8EI/T/c3cIk5TtAnFrdwqgK6LojRoa8fZa33hKBnNVXkUPAQ5Lmzdf6C
	iZ8WI/PnCTCTyxMXXi4vVACx69SLO078ENOsH580J2HJ5g7QyUhHbHNqTcJ8Taz6DnmY9F+LcQx
	VG8ik
X-Received: by 2002:a05:600c:a012:b0:4a2:1398:dd05 with SMTP id 5b1f17b1804b1-4a35ac95b2dmr110048655e9.16.1793016575542;
        Mon, 26 Oct 2026 05:09:35 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-14-234.xnet.hr. [88.207.14.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a00e1b0sm152200695e9.3.2026.10.26.05.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:09:35 -0700 (PDT)
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
	ansuelsmth@gmail.com,
	john@phrozen.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH v2 4/4] arm64: dts: qcom: ipq8074: Add CMN PLL
Date: Mon, 26 Oct 2026 13:08:15 +0100
Message-ID: <20261026120920.1667982-4-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com>
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

CMN PLL provides bias_pll_cc and bias_pll_nss_noc to GCC.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
Changes in v2:
- Drop the _clk suffix from the GCC CMN PLL input names.

 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 75a5ae30d966..b08efc959379 100644
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
+				      "bias_pll_cc",
+				      "bias_pll_nss_noc";
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
-- 
2.56.0

