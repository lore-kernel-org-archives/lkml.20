Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EF5580383
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963499; cv=none; b=tgPSThxYm3QM27nkhsjYzz4wat9Z9ncYZovyHP0vkzEU1eKu30XAF0/T7pJmMJFhWPek3g84xDdDtYGzx4eX/sLHD6eAawVysHgndmn+xaW1i4App8deVG/iMBdWMGUUT+SFlKb7CvsefIanRA6Fe1ut7IZqBBSCLMWHT130X1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963499; c=relaxed/simple;
	bh=Y71eIQDDyUhXRKh/NkOaLzyOm5IcbP6RGlZeelTea5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cqqTtgUB7EQQoVMwq79Hke9jP57S0B+tNRzpfjHHlJcDOIUl2h71FgvwhvVwIS2iUzIvHqq+B4nPjQPfxnslP0JBIki0i6ffSRazQoK5Bk25hN5dEn2v0F10cRqoGyMxxcgnp5TiI6lBOlUx5uk+G1OsHdwkXIJC6lRUuWCvZb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XfxnY0wl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZ5cY9dz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XfxnY0wl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HZ5cY9dz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUAJg1183763
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 14:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vXE6XobC3ury7rZX6jNG08P1KoDrVHt7n7WgxsPOMyw=; b=XfxnY0wlMWDMpBbA
	eAte+CIrumiTiT1u0UkoBUw/qihlJapQsw8j2gX+q0U40PfRZ1RDEsJAneNbU2Ix
	1CXFqV9GZ2ndP1sJA0HVvtUXbZ1SAUbQXGYGfadLypJiMxPquzh0/pXnWqKxj/PU
	8QAxXuR5d7BO1PnMUpjiy3nkX5/9XnAXIYtf52RyrajRC5x4RbRgYhIQiZ1b+FDo
	SI3M9Lm5Qxt/01NZpuWlb/HwWeDI/j8JmyEi3SGNUgZbJ33S4HIiwOFpo01rvXuc
	yw46+WgNT4WWooKAV+MgBvxrhib0+tWD26s1VOg7CUtR8+e8zk4oLK+bR8TEjzRc
	8349ow==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk559s2hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:18:16 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e98448895so481886241.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963496; x=1789568296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXE6XobC3ury7rZX6jNG08P1KoDrVHt7n7WgxsPOMyw=;
        b=HZ5cY9dzxgN6oFJkV5pXKi/Tpk6REwx7tRg/U8Iq+dnE7dCZCbfzLQ9iNxnPngBm5O
         vtcBo6KukVNdDrRcxfCSLW8ZD8QRtyO+8xFP+i103APkIHZi/I+mFGI+a2GIttQCMPkY
         K1mw1W2Vm+ipP4P7mVdRhFNKnCA3QyVkXmtHV9GgUtxHLZuWzAYiCS+k6H6wep5INunC
         Gwy+t7mgBxM44P8l2c+Ttk9w/rBZA6xSFIxiIG5hix8T/S3dGfugVCfrnznNyZPJKIkZ
         KG7JK1wQkIz9FySTQbcRuv6Q95vXL6z3+SzwOL/oCwZf1EjheIW++Jjr3u0IbzrY3Kfm
         0cEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963496; x=1789568296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXE6XobC3ury7rZX6jNG08P1KoDrVHt7n7WgxsPOMyw=;
        b=LFkU58R4QuspqnM3MX7ibJtFvp553GpErWaP0rFHPI+u6flnFmmbMOX+j0/19F9UHc
         hKucPkqQv7uNPNkoaaYSXzCAuRneDLhrhjfZrOtITA5tg6rYGZj+abNCOK9ZPzJZiJbj
         rTsV9U+MzaMmSQqiTZSz+HGMu59k7cCFKVAp30KW2MUXAltGJADZK5/T0r9BXbFdLR+3
         /ZiY3lvKEtvzXH/9n+xfj1C9p1lYx2vCdv98ccnUA1osSqlsVO8R1ug/4mLNNDkZt4sb
         GF72J2Ml4K2PRR13ehLawlWpErdRRzPKnKuDB5vvEDL5UaEgAo+5EdaiTe6nnMvbIteW
         4sVg==
X-Forwarded-Encrypted: i=1; AKwUvBwvOdE5ivbxns8Gp/2qkl30jDkbLzBnf1hBcLzrj/1yWurr5cN5NLagAEAeruf6ig/R4Zbcwy1183WmVSw=@vger.kernel.org
X-Gm-Message-State: AFuF++muZN8bw1Cg2G4qydFQz6r3VBij84D7tFO65QwrkEB1OgAQ6vhV
	DMNH6amrIkLrBw5KWzuu0nc75/68oXm1jIwtpGFUvC8h2XfddsPkJjSG2ttM57r5bTMrp6fjE9v
	JswK46WfKfLNb6IIcL+VRxAMWmXsiuCwt9YPJ0Q0PsHgxCQBHg5qGnUrcCQtudRuItuc=
X-Gm-Gg: AYBFou0KVp6lsoHEGkaL9WCFW23KbSFQ9K95LHhxDRoaDyJcOQUfJ56sLH2F37+Af1j
	63UBjoqCy9CxKW5c2Xwv3wo/K8aWnBLa+iuYMEe91XWg4GPg9roGfkta/zQBb5n5p6H9Vo3gzAh
	N1WjiATTiftpzl8XjYYbyinMqvcnTpuIwuoOBqfV4+cvDVA21BbXXTexz3faa/bo/1E9jArl+/6
	a3sI2mK4IUnZPmxZ+D2iDQvVyT/bGlpyQqEUJ9cMTFqdRNvNREzLxt1ld3gT+8IMEaah5zSM9bZ
	hdMFN3NzYaJolQT9MwS2hzMFe/tkSjeBQRBZjqzFUKO2+PTanV0Vj+e3xSW6z8vWGckIddFV0PT
	qCjdWWzq02NdRlZArrPkIBBk=
X-Received: by 2002:a05:6102:5346:b0:777:ab3c:b88c with SMTP id ada2fe7eead31-78a4aa9948fmr14313382137.8.1788963495894;
        Wed, 09 Sep 2026 07:18:15 -0700 (PDT)
X-Received: by 2002:a05:6102:5346:b0:777:ab3c:b88c with SMTP id ada2fe7eead31-78a4aa9948fmr14313301137.8.1788963495366;
        Wed, 09 Sep 2026 07:18:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293b6246c4sm77581766b.20.2026.09.09.07.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:18:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:17:56 +0200
Subject: [PATCH 5/5] arm64: dts: fsd: Re-order properties to match coding
 style
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-dts-samsung-cleanup-strict-v1-5-1b755a446b22@oss.qualcomm.com>
References: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
In-Reply-To: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7158;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y71eIQDDyUhXRKh/NkOaLzyOm5IcbP6RGlZeelTea5s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoWqV8WS50E8rmNpdpzicxS5MY0zirtCNvsHQ/
 jdWVWc3MIOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFqlQAKCRDBN2bmhouD
 13xoEACJGB+0HRDiw88mhMzjyFCiAhyUIPJyjQVG/AFypFan7lv0/bmSdwhOmvXOSKAq2L/MmvQ
 uLoJ5IEPOSGjgIXeEyi5Xqb/Z/leiVKUK/QiQ1EHmJpZ9rnW29jrUNlxvZE9UBWviXBnluA1RFD
 8foQW4iLuoS2K6tLu2KQk3WylJyLFJZrhh6VXRFriX0599STF0Mn8SpgrwokdeAQ37hCc38/WKQ
 aCiCR3ZULLIbJkLl6QZRRgmA/M1TYRLCghx4XMlMScRrvWopR6/orZR1ssTETbMMD5urZCitWCU
 xftcRsmrGmRaPdzoUmyQZvnrmL5wvpFb4JZ+X3NkBeeWxPni0XgeXOtXU/u8gKcodl78yiQUc3m
 qVlpr06+Qy5jQTxts+rqtN1kjE46kZFi0kCSCAzcdebV1N4yfoGK6A+FPVKJtflEYP42mM+GTx1
 CDSo0HqzHjCnJFiXMSP/jhPtGmhrt9cXaSK8h4VA6xrBroy3fgFu/njkAfNWc/5O6z/KpwS6kDc
 DU/0nvMXv/Q/ow7BXagzUSzWcVCWG3qXBf93SjKJmpXlQ6cCmD2pYTYA7fsQC/f3wicIWN5EPBO
 S94L4/uMQmxkm2e0/AafRYWyE8FqPWdaqnQmjdHS31hJ2ngFvdQ3hfRNf+o5W9ozBQq4345afFE
 lsY1rceJFnudd8A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=KP1qylFo c=1 sm=1 tr=0 ts=6aa16aa8 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pFgJNHYOF-_vrOvKCzcA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: wziq_Ww2hr4dUjcxtyvT6JHAlgfz-Joz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfXzixGN21E3xD1
 UUtb37rEYMPdfIfwxenH1MyeQ/3Z5SVCpI/CN4wVsepQkEioD66LymDOX/zZooieZ0ktCxNE9wa
 SSU3dBh6+68PjI5KwnJX7+q8BBs5IU8=
X-Proofpoint-GUID: wziq_Ww2hr4dUjcxtyvT6JHAlgfz-Joz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX33ECxpmzWlsj
 rOZdrs6smCAmodJ9ALhrE7zLtSHF+vdUmTEmscPBwUUF0fT5Lj13zIPcmvczp+k5VYPAhJmaIcA
 7mjMflJfyR6uSRbKCy5OmCDcoOgt6iKohmeRE2lgKVhoD9rtyXbRp4G1spMbCuisSQBEtbOYhWs
 NI7NGBElNLM059nXxuTzvpU+wyIkhpqcNVi/o9RxW2as/837U/Jm2PHhIXgQnb6lrgvthH63AZl
 gusi4ozzRqD3Rj2mCL7qxf9CL0lAjVqHf6h9LrJ81zvoIAFR15fpPvY51lz/2Djyur92HU6IcNh
 9V0mgB2Tlq3dQbJBMf94aByFEkP82GFB2JnQxlvSlSlzOUY/x5RsGsJrhq4VsNSIUOCCnOq9q0T
 7Se9thLnU05O4mtX/8qU/64Gxz0jAkzu6+TlTfKUhVUEL0viWddSZLloXyIsYk735Hd80siJD4e
 zSY42ew2qPEKdzSK/Gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090160

Re-order a few properties to match coding style, as pointed out by
dt-check-style, e.g.:

  fsd.dtsi:357: [property-order] property 'ranges' out of canonical order (should sort before '#size-cells')
  fsd.dtsi:362: [property-order] property 'reg' out of canonical order (should sort before 'no-map')

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/tesla/fsd.dtsi | 40 +++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index 22b997880d65..36925b2749b5 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -344,23 +344,23 @@ psci {
 	};
 
 	reserved-memory {
+		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges;
 
 		mfc_left: region@84000000 {
 			compatible = "shared-dma-pool";
-			no-map;
 			reg = <0 0x84000000 0 0x8000000>;
+			no-map;
 		};
 	};
 
 	soc: soc@0 {
 		compatible = "simple-bus";
-		#address-cells = <2>;
-		#size-cells = <2>;
 		ranges = <0x0 0x0 0x0 0x0 0x0 0x18000000>;
 		dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
+		#address-cells = <2>;
+		#size-cells = <2>;
 
 		clock_imem: clock-controller@10010000 {
 			compatible = "tesla,fsd-clock-imem";
@@ -468,11 +468,11 @@ smmu_imem: iommu@10200000 {
 
 		gic: interrupt-controller@10400000 {
 			compatible = "arm,gic-v3";
+			reg = <0x0 0x10400000 0x0 0x10000>, /* GICD */
+			      <0x0 0x10600000 0x0 0x200000>; /* GICR_RD+GICR_SGI */
 			#address-cells = <0>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
-			reg = <0x0 0x10400000 0x0 0x10000>, /* GICD */
-			      <0x0 0x10600000 0x0 0x200000>; /* GICR_RD+GICR_SGI */
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
@@ -686,10 +686,10 @@ i2s_1: i2s@140f0000 {
 		pwm_0: pwm@14100000 {
 			compatible = "tesla,fsd-pwm", "samsung,exynos4210-pwm";
 			reg = <0x0 0x14100000 0x0 0x100>;
-			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
 			#pwm-cells = <3>;
 			clocks = <&clock_peric PERIC_PWM0_IPCLKPORT_I_PCLK_S0>;
 			clock-names = "timers";
+			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
 
 			status = "disabled";
 		};
@@ -697,10 +697,10 @@ pwm_0: pwm@14100000 {
 		pwm_1: pwm@14110000 {
 			compatible = "tesla,fsd-pwm", "samsung,exynos4210-pwm";
 			reg = <0x0 0x14110000 0x0 0x100>;
-			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
 			#pwm-cells = <3>;
 			clocks = <&clock_peric PERIC_PWM1_IPCLKPORT_I_PCLK_S0>;
 			clock-names = "timers";
+			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
 
 			status = "disabled";
 		};
@@ -802,8 +802,8 @@ hsi2c_0: i2c@14200000 {
 			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c0_bus>;
+			pinctrl-names = "default";
 			clocks = <&clock_peric PERIC_PCLK_HSI2C0>;
 			clock-names = "hsi2c";
 
@@ -816,8 +816,8 @@ hsi2c_1: i2c@14210000 {
 			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c1_bus>;
+			pinctrl-names = "default";
 			clocks = <&clock_peric PERIC_PCLK_HSI2C1>;
 			clock-names = "hsi2c";
 
@@ -830,8 +830,8 @@ hsi2c_2: i2c@14220000 {
 			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c2_bus>;
+			pinctrl-names = "default";
 			clocks = <&clock_peric PERIC_PCLK_HSI2C2>;
 			clock-names = "hsi2c";
 
@@ -844,8 +844,8 @@ hsi2c_3: i2c@14230000 {
 			interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c3_bus>;
+			pinctrl-names = "default";
 			clocks = <&clock_peric PERIC_PCLK_HSI2C3>;
 			clock-names = "hsi2c";
 
@@ -858,8 +858,8 @@ hsi2c_4: i2c@14240000 {
 			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c4_bus>;
+			pinctrl-names = "default";
 			clocks = <&clock_peric PERIC_PCLK_HSI2C4>;
 			clock-names = "hsi2c";
 
@@ -872,8 +872,8 @@ hsi2c_5: i2c@14250000 {
 			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c5_bus>;
+			pinctrl-names = "default";
 			clocks = <&clock_peric PERIC_PCLK_HSI2C5>;
 			clock-names = "hsi2c";
 
@@ -886,8 +886,8 @@ hsi2c_6: i2c@14260000 {
 			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c6_bus>;
+			pinctrl-names = "default";
 			clocks = <&clock_peric PERIC_PCLK_HSI2C6>;
 			clock-names = "hsi2c";
 
@@ -900,8 +900,8 @@ hsi2c_7: i2c@14270000 {
 			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c7_bus>;
+			pinctrl-names = "default";
 			clocks = <&clock_peric PERIC_PCLK_HSI2C7>;
 			clock-names = "hsi2c";
 
@@ -949,10 +949,10 @@ ethernet1: ethernet@14300000 {
 			assigned-clocks = <&clock_peric PERIC_EQOS_PHYRXCLK_MUX>,
 					  <&clock_peric PERIC_EQOS_PHYRXCLK>;
 			assigned-clock-parents = <&clock_peric PERIC_EQOS_PHYRXCLK>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&eth1_tx_clk>, <&eth1_tx_data>, <&eth1_tx_ctrl>,
 				    <&eth1_phy_intr>, <&eth1_rx_clk>, <&eth1_rx_data>,
 				    <&eth1_rx_ctrl>, <&eth1_mdio>;
+			pinctrl-names = "default";
 			local-mac-address = [00 00 00 00 00 00];
 			iommus = <&smmu_peric 0x0 0x1>;
 
@@ -1012,8 +1012,8 @@ ufs: ufs@15120000 {
 				 <&clock_fsys0 UFS0_TOP0_CLK_UNIPRO>;
 			clock-names = "core_clk", "sclk_unipro_main";
 			freq-table-hz = <0 0>, <0 0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
+			pinctrl-names = "default";
 			phys = <&ufs_phy>;
 			phy-names = "ufs-phy";
 
@@ -1024,10 +1024,10 @@ ufs_phy: ufs-phy@15124000 {
 			compatible = "tesla,fsd-ufs-phy";
 			reg = <0x0 0x15124000 0x0 0x800>;
 			reg-names = "phy-pma";
-			samsung,pmu-syscon = <&pmu_system_controller>;
 			#phy-cells = <0>;
 			clocks = <&clock_fsys0 UFS0_MPHY_REFCLK_IXTAL26>;
 			clock-names = "ref_clk";
+			samsung,pmu-syscon = <&pmu_system_controller>;
 		};
 
 		ethernet0: ethernet@15300000 {
@@ -1041,10 +1041,10 @@ ethernet0: ethernet@15300000 {
 				 <&clock_fsys0 FSYS0_EQOS_TOP0_IPCLKPORT_RGMII_CLK_I>,
 				 <&clock_fsys0 FSYS0_EQOS_TOP0_IPCLKPORT_CLK_RX_I>;
 			clock-names = "ptp_ref", "master_bus", "slave_bus", "tx", "rx";
-			pinctrl-names = "default";
 			pinctrl-0 = <&eth0_tx_clk>, <&eth0_tx_data>, <&eth0_tx_ctrl>,
 				    <&eth0_phy_intr>, <&eth0_rx_clk>, <&eth0_rx_data>,
 				    <&eth0_rx_ctrl>, <&eth0_mdio>;
+			pinctrl-names = "default";
 			local-mac-address = [00 00 00 00 00 00];
 			iommus = <&smmu_fsys0 0x0 0x1>;
 

-- 
2.53.0

