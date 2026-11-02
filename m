Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628254;
	b=zDQyRl5C6lmMLmVaNjxecMEJzhWlfBWlO+WMSDgM5QGZxv/UBbaFV1sHVfYrV0dh9chu
	 Xfz82PGKsZ6W/cweBHDQEIwWHdK+9uhhgU0YGgckhswsqOECvHmWOcTAZFEImLhksilYu
	 u3ZSkbSsdroI/HoXxkURAgD6yAMBJQU4r0++kG4OmamMIrkaux3vayIZrhtSqDoM69hY6
	 sJKGb5uiRzEdfcRFXcktVAFI1ptxD8DhNQw+cnFlANOq20L+R6fRNdjOr4+NQuiTOyaEE
	 Bd8s79vAO0mO5dcyjOha2qebprDD62QEPWCljgw6qHIHEuvD2msngsx0J7GD9jWaCEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628254;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Dag14m3h5gt5hwrihR8wyiBARY23IaTWQ9lhSc65Xxg=;
	b=axhmL4XQVTmvmw0gwzHxfCYueDBIcsNrIhID3M8dRIYtXBb5CIR73jcDOVJHGSAMxmwZ
	 H7poOtcSEcc1JPwRshs5II/ZJbLG8Enevxx4pTVhPX6knJnWuJqzoYkLJpIwcY39HPj3w
	 XLbPh/v6Sw2Zd+Hiw1GDz//tNDo9WBJTkMYCPnq6myfviQcuC8PUwwD+xZzkkQMmWE/ps
	 LMnCt4Axbw3yWZRCK9cqIRcQ3usKLD6Lxh/k754dSiPW91xyzgNi8au2r3iOa6Ac10Mez
	 ejTVvtEvejNjqKh6cvTFcMwm2cHqhPZQfbLkkTSCzdRmu/f5Zb+Khb0uNG3tFsoMQcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AmGnfcRi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PCu3lvAc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DB1606A337
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88DB1606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AmGnfcRi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PCu3lvAc
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpLri3512650
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 14:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dag14m3h5gt5hwrihR8wyiBARY23IaTWQ9lhSc65Xxg=; b=AmGnfcRidw1WtTb2
	/QPiyYNMjZPVGchsRWQhON4B9Pv3fhbtVlN7nwekiFs5KCThHj8jidECAxqnQjnT
	rV/ttEOryTo4DSdlAnDPHqyk726P9FAYQShHoqpKV8w+zn1geS/zUCi0w8APOG0G
	EyapIi8V9k+WrPCSl3vvZjQe0qVL3oo1EQUsd6084zPRsiG/QJtBPj0Z8Tr6E1Tv
	nfyAcJpwV289YSFhWrxB6a9rYLLGIfW9YEC8TVmj7iacdc6IsZF8TlnfTggPEZXA
	trcPOQb9qn9gRRc7ma6ImIYjUHyeRpICYf6F6eA8BcZnod7jPwdkHwjnN2x3gwHS
	aJ2aLw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrh55p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:04:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd60a365440so1986614a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793628252; x=1794233052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dag14m3h5gt5hwrihR8wyiBARY23IaTWQ9lhSc65Xxg=;
        b=PCu3lvAcU+YdJuK4r/F+Ab7Dt8yEM8k/WzlSEBXFoQNNHAcDXWgYJImJarjsnGfx30
         cNJu/BeOex5Osl5YQA8twYGTQKoDG/Ljxoh2dSnBdZ6bEEHjJHHL++ebwWUX4VcA8GHi
         oBhl7JkzCqjOr3W8LnfD4xk26f0UFDs+e7zkOFV1pId1fI9I23ZEUFcCf6opq7mNIANZ
         arI4VufbHE0n7pqfXr2hXdlKHgb0adzBFxVxz8ytQfJSM8JaY/hjWYDUpmU57PJY6i/T
         jZZacXYLrFnlf58eeHSQfqfLngDhjrnURr9tNOz0KTjzAk+oUFwEvWVQDyQI6y5K2rkN
         qrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628252; x=1794233052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dag14m3h5gt5hwrihR8wyiBARY23IaTWQ9lhSc65Xxg=;
        b=MiUjJtg0GxBv1FXVQPx8DAx+JyKTKIMe+E2Tnglfrfw8hVPaNMqYPuwEhYoakwKU/o
         M0BnSJ/hAzDcoyU68NjjXOskxJyLMZ5nmdnYUPje+ppSo9mZP6HomE0TviMegUZBnvRZ
         5DNhoXoJ8axn0T/TkMcLxIPI5Y95Ocr1WU0zpxg+/0m922Nb2WgkChnt7ZXZdYbp14/H
         ZtNZe8cXVm5k0fGfkZ67Wv08shOSBNS/fKWIjzFLzKjkMHH02k0Uala0hGAFaMNzPLAu
         /7CFL0+SwQQZ1V8M1f194o+UFkthz070O/qQYOM2BYAqQgrQE4kdTeA1P5Td7GzDHwwM
         hh7w==
X-Forwarded-Encrypted: i=1; AKwUvBzD5RteCKIjP1nCt6Fy6ehJMQYxnK7bSgpQHSAbLrEFEPWuuC7dcij5W3VYbltTPGUMeiCFtYFkjjF7zTQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLX5+opdH2n1kYfT/ETZ5mbg3Do4/k2QIKbT3HJ1HrKdSULWspB
	Caw/IWjRzy0N7YiZXS2MU+3EEEwxlSknKmQJCEKrJC34pvSnfvJO8Ttobf1pC1PKk300MX0SwrA
	edqJlCdIq8PmtH/aTzn4PkIJ7pXRcC2nMlV+d+pGwpPCD8ubzwqYug5m8XnmaCF/daR0=
X-Gm-Gg: AYBFou3ihX3vDHdtTgFXVm7wwZKp/UOwe2UxEo4HKJw9WclHQrlMV8/BPAHFpwi1eGe
	AyOhfIAvXmj1f1u4vXV8qz/hKb9TsgxkwqlGoLT7fL/scHZyzWHoIoWC8fx+Pg3A4l0+B3dNskx
	4xIEMROltYrjpijCFe9wCVS/CuO3pX5MKXVm4Rzx29LXyrW0eMl1Y9abvHhoS2ComvblTfC/3nR
	Y7OqurgaNI9fnOLvhII2+IFKkZ8gLA4B0fiztJ4t5p0fjyTld8y1xT4HXrrRgP7njc6YBlVM4zQ
	ZLKofLVya4hCQamGlpJR/X6+gJy5P/cIzu4q8GBRtry/sUvEbBICmO9SpDmw3IJqKCfcfSYuqhj
	ERY8SgDsz5gcjunNAnubrOilKmHouooO83zmDC055s8DicuYBkj+G9omlLw/6DvEFX9p8mwL8T+
	M=
X-Received: by 2002:a05:6a21:496:b0:3e1:7249:e265 with SMTP id adf61e73a8af0-3e928d46829mr7631065637.27.1793628251919;
        Mon, 02 Nov 2026 06:04:11 -0800 (PST)
X-Received: by 2002:a05:6a21:496:b0:3e1:7249:e265 with SMTP id adf61e73a8af0-3e928d46829mr7631011637.27.1793628251158;
        Mon, 02 Nov 2026 06:04:11 -0800 (PST)
Received: from hu-ahari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad77fd956sm2286942b3a.3.2026.11.02.06.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:04:10 -0800 (PST)
From: Anjana Hari <anjana.hari@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 19:33:41 +0530
Subject: [PATCH 1/2] dt-bindings: mmc: sdhci-msm: Document bindings for
 Nord SDCC
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
Message-Id: <20261102-sdcc_scmi-v1-1-244dbd893051@oss.qualcomm.com>
References: <20261102-sdcc_scmi-v1-0-244dbd893051@oss.qualcomm.com>
In-Reply-To: <20261102-sdcc_scmi-v1-0-244dbd893051@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Anjana Hari <anjana.hari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Ram Gupta <ram.gupta@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae8985c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=o3jdfBYt8dMtDUvNEAUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: uDyjgfSEyrotL-R9jkohuEQuEKCITC_g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NSBTYWx0ZWRfX7EI8NjWMHSrd
 1RTdvqLlYuIclmxSuwqYitxRZsOOhBkYx7cU3EarA0KdS1ybVW7vb/Nv5Arh+d0aYi0tpqi8ueb
 MxOLL0UidK1LDUpU4szgrXnf7XbBK30=
X-Proofpoint-ORIG-GUID: uDyjgfSEyrotL-R9jkohuEQuEKCITC_g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NSBTYWx0ZWRfX3WissCq7B76N
 BUPS+TqDq3Ox7ux/RM14L0PBaaxBRrukxqw0ZCVWUnK1nrEWXJyEWTvn0Zrg2p3KSnijFOQGYDT
 YRTXzDtRcVO1e5U/W2OnvdpOMiVl0isVqscaTDAp9vrTMThk+6NxjYXozw/hav8SC9oi/j6giFs
 mrsKRhgCDhBbIfelLVDubqq4SjQkFE/rcgT1G+9XcWIjXA3K0t8Hx96UUjECntSXjkMUS06pqqL
 ttfKVs+FLbVC+on6ns8Z4xUMvNGIfQ85z6Z445MVNMfZ2dDb5uCkkzSDMcGiAIoKiPbdcQTDYBV
 zZG1dDJnv7+v1vsBTCBwyyriyoncRz67yqYV//GpIK4D2tNM1yq1akTCM9gzglo6DFsy9AOBo1z
 gDsxnuryYpcrDoQBY+Tc6lOl4Pv8AEq5rnKPNLfogocWjBsJkDgYLg/RR7dnHDGP5W7RGY5tpy/
 ZaFSTgKlRRgif425poQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1011
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020055

Add Device Tree binding for the Nord SDHCI variant of the Qualcomm
sdhci-msm controller, where platform resources are managed by firmware
through the SCMI power protocol rather than being directly accessible
to Linux.

Unlike existing sdhci-msm variants, this binding does not require
clock, interconnect, reset, or regulator properties. Instead, platform
resource control is abstracted behind two logical power domains:

  - "power": controls the SDCC rail power state. The kernel requests
    power-on and power-off transitions via the runtime PM framework;
    these are forwarded to firmware as SCMI power-state messages.

  - "perf": exposes the supported clock frequencies as OPPs populated
    dynamically by the SCMI perf domain driver at probe time via the
    SCMI performance protocol. The driver selects operating points via
    dev_pm_opp_find_freq_floor() and dev_pm_opp_set_opp().

Both domains must be listed under power-domains with their names
declared in power-domain-names.

The compatible string "qcom,nord-sdhci" selects this variant at probe
time and causes the driver to attach the two power domains via
dev_pm_domain_attach_list() with PD_FLAG_DEV_LINK_ON, ensuring correct
suspend/resume ordering between the SDCC controller and the firmware
power domain devices.

Signed-off-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/qcom,nord-sdhci.yaml   | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/qcom,nord-sdhci.yaml b/Documentation/devicetree/bindings/mmc/qcom,nord-sdhci.yaml
new file mode 100644
index 000000000000..c512628617b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/qcom,nord-sdhci.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/qcom,nord-sdhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Nord SDHCI Controller
+
+maintainers:
+  - Anjana Hari <anjana.hari@oss.qualcomm.com>
+
+description:
+  SDHCI (SD Host Controller Interface) present on Qualcomm Nord SoC.
+  Clock and power resources are managed by firmware through an SCMI
+  server, so no clock entries are required in the device tree node.
+
+properties:
+  compatible:
+    const: qcom,nord-sdhci
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - const: hc
+
+  interrupts:
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: hc_irq
+      - const: pwr_irq
+
+  iommus:
+    maxItems: 1
+    description: phandle to the apps SMMU node with SID mask.
+
+  dma-coherent: true
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: power
+      - const: perf
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - iommus
+  - dma-coherent
+  - power-domains
+  - power-domain-names
+
+allOf:
+  - $ref: sdhci-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mmc@b84000 {
+        compatible = "qcom,nord-sdhci";
+        reg = <0x000b84000 0x1000>;
+        reg-names = "hc";
+
+        interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "hc_irq", "pwr_irq";
+
+        bus-width = <4>;
+        no-sd;
+        no-mmc;
+        non-removable;
+
+        iommus = <&apps_smmu 0x1580 0x0>;
+        dma-coherent;
+
+        power-domains = <&scmi34_pd 0>, <&scmi34_dvfs 0>;
+        power-domain-names = "power", "perf";
+    };

-- 
2.34.1

