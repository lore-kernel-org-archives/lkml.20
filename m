Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5A150AC14
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954523; cv=none; b=A+CImqOI8AJ61L+LlTtl8v5Ekrmk80cX9Igo57lZgqHA2DTdWUvwG1K8MelIKNpYjs8Jzz5DLT2r8aFbAClEHt+VWtGWodtDzatM4HHZb2+frPzpSkzX3DvwTrAGvtp0JD1VI3VcppIGyzoHndMUqUImsp8sG//1VbODGlG9eSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954523; c=relaxed/simple;
	bh=tq6kqbkpCdidmkaLsFLYxnNBeo6MYS4dPofmRONO/Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mjc1p13kaK82HiniYGpbpVBte99DmoY5b/j4U2yCHqVSh2Fp04fXUjLdV+Q1MvYDLowou+//MejKsocjDPxqkbwYctpmr77XLtsPeUGFtAqW/VpIrKE0228tvDapiuc+4l/rwFvo210bPjyQ1b7pir2+UeDli15bfk3Gfh8vmhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=StMl/WT0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YC/WcxVY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="StMl/WT0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YC/WcxVY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUBMJ1843032
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 11:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vMa7ORjXWjlP9/Hfh2XD0CxuSOOnt4VZkP/bquOsk34=; b=StMl/WT0SP7m9Vt0
	g0oHBvfGc2OPKhiufcJzhuycLZtBPePW5be43RN8BbrTeLJwJMxRmS8tWaHR0X2x
	AyNc8/jXjDBp/2HtYJzhEDMcNzjwcd+8pSxFI1qOUyDJh8OaLF/jeGjMhg0Fv1is
	ny0LwInW54rHM1tCGRnyOjtPakLw5Bxo7ovgTQC9FpfKnN7srwpEr2M5UWNqYzip
	L0GRrjfadbcH5dR/dKjuk9qcd2lC6vkGwrnb+jGUz+m3pgkzHENje4FCnAjTagCl
	hK/jg18VOwAk6fQTB3dJCUcJdveMRkL+q5jK1RmWE3BsjAm6/FRHSA1GJNgf5rVg
	xqBiFw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjxqja2uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:48:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6fed0652bso70329285ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954520; x=1789559320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vMa7ORjXWjlP9/Hfh2XD0CxuSOOnt4VZkP/bquOsk34=;
        b=YC/WcxVY0wkVNX0nEMyit/qcvGZMh7iA3ezKC32OVDmJeZXme6CLc45t/YqkSh91mz
         owkLDL/wbBubfHk1XYwyLJQ3wPDGw3azk8bZuTqd7EzubeQECvvPN4+QW5DPFuPqaxxT
         NuvpLF1WyMtntdzSPU9RAKJumYnNwED/Ecxll3o2wJuc0Tnp4dhsBmdds9ztVRk00kcn
         x2ub7aVlOpjUp22cWcOl2CWZJiWJJ/KU8R68c3nfdWbzJdpzSeQq2FobUFpcqNSCgFgN
         5Ox3T75JtHSqlLGu9ys14LSMZgOeGFHkygDzTmhTXlaQ/UCi4VIFTtdGASKRn3lRw9cT
         tbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954520; x=1789559320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vMa7ORjXWjlP9/Hfh2XD0CxuSOOnt4VZkP/bquOsk34=;
        b=ekrYQ50ycAOYyDNVCu6GbRib/pY+OYOheoFjTS6l/VvdimhfvYBTmXJ5PZ2BnD+mmq
         n+tRYCxqP8A5Fmyo+yOpoq3xjuLnSw+KEq/Ifp6Ty165XbDikhbQWhWnCHGs93fRw2Uy
         1BijcvUAJn/d5uRF1Gjh6ck4biqgfgao2gA3vl118k+XfJQLfWLL8TQb9d/GojoFIaUf
         2KzpmXhAejVfMvH3r07hPykRAb6b8h4kPR9McJsIGf9pVVdnmHeIxetimV4ge9NNiCoh
         k4JFZKBk/jQ0gS/nK/ynogC7g53TLKPHWrD+/YHyIFZsIL0FNSGuoSdB9buyIRzkmyXs
         5prA==
X-Forwarded-Encrypted: i=1; AKwUvBxBMk9j+/rMEQFOy9eLUGGq3ELxCjtjyw0jN4glBANgrh9Ged/7hkwMOdCbFfOVbuTQpE68iVdo1zYmjic=@vger.kernel.org
X-Gm-Message-State: AFuF++nyeuVIRGVmg6EBVAmldtVK99p+e3r+Qd6gLVfd96pQzfKmgAML
	IrVnrt0kJNYHlSrOnGzPj9fZx8GkjcPf2/+zWThssfDwdzZ/g5/481coGXTmPk9wC3ESCOcSVmb
	6WLHhNxLekJ2Ou/xwNMoombIElDBP/zAlYXXPePf9sBp299xh7EQ42gLoARTl+s65xRAUzQSKq2
	g=
X-Gm-Gg: AYBFou2CfmDQDyXVJ5UyVyE54EbZ/0/m0H6eqmCkwwpJzZMbWUO1M9YzNuB+g/UMGJC
	878K2fSWe+vE2PgFFqtFugxewxFFXaYZ6D2WNMj+5piIAcgsDrr+3yXT4rxh8fIeYp+7k9Idrm7
	Ce8zsPWFViLlQHym46T6cYiDFztYBNbyPnWI5JnAjkgSnMz5SPeZamynFuGaIETvqXYzwmQsKEI
	ZQMndJLbL0NL/F9CsmPCFZtGalrOz18XroMzB8+1Rud9pVwCbhMqj78vF4wVTvn+Q/ALoImc55M
	WYr21e+JyUsuNz+fIUkOGddrJO8uzP2fKuYbFmwIkz7TYMZezAvin/i6ts8QG5IREMr1pRI3yM6
	JXuLcqeL8WfDFInLZD/0rCYB19yMdVOrNf7A=
X-Received: by 2002:a17:903:2383:b0:2d8:d4ce:9f35 with SMTP id d9443c01a7336-2db12757af4mr475006415ad.19.1788954520235;
        Wed, 09 Sep 2026 04:48:40 -0700 (PDT)
X-Received: by 2002:a17:903:2383:b0:2d8:d4ce:9f35 with SMTP id d9443c01a7336-2db12757af4mr475005575ad.19.1788954519698;
        Wed, 09 Sep 2026 04:48:39 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm50156857eec.21.2026.09.09.04.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:48:39 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 17:18:16 +0530
Subject: [PATCH v3 1/5] dt-bindings: phy: qcom: add Nord QMP PCIe PHY
 binding
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-nord-v3-1-b0a82721c547@oss.qualcomm.com>
References: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
In-Reply-To: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, shengchao.guo@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788954507; l=10022;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=tq6kqbkpCdidmkaLsFLYxnNBeo6MYS4dPofmRONO/Ts=;
 b=2tJ5vO1vJxKToeNA+nvNwqheAVYptY9/Vf/RWam4ZGj7rfgn8a5Rc/TaQRjr4FKNataPcoI3z
 liZIzRsQzQ6Dxruettah3BSIkiKGkKaO8wJ+f4XskH754CU83dSPY66
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 2jspPQKQEqcQ3W6VfOLrAWBGETJa_yu-
X-Proofpoint-GUID: 2jspPQKQEqcQ3W6VfOLrAWBGETJa_yu-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX75IOH3s0rCzg
 qh5pnlizMIu/uDtUgk1DPxCdNIogXbIy6pmg/cjE8Q5P6OZ/M4c4yfKuM7Gy7QqJLuDTOgaqCd2
 jsqJaqAdrOqLCVckWJMWsrpNvOsODUO2bzlXv53W1hVtcHmr8jgTPIUpkd2wymDnXLyALWyNWMi
 f4b8bwO9CaYsXg1EATbfBWvJtPt8OLsW+AB17XYG05qt7Ok1eK/XFolXxZUs3AxA5cF9LnrE9p5
 uIa8voFTJ3/rcZL7VubZ5SX9pND4LEgsynQduOJGEKg48+Csp0i5gj2bm5i62Blo4m1Q0b9HbiC
 egJjxjdnoKcFJtOOpbVhxXCni8hFZZNn9nh+aqtEj3iqMcBPy5mJxDTkQKvYr/2CY0u515ulICK
 akHs5FjZs/X0iBlSuFujtV6Xn6rOGYLE2zVfls9XgmIlACCV5ATloK31EqJeWVMBEM+4T5GJHI2
 b1+ZlSo9df0C2xJreyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX5XuNyZEU+6FH
 HI8QTXiatTozRe95bBQ0Zq3wX3gJrlZs954rWRdTzI6fHMpoReAbHuVuO7/Copx9Gxl61mWZLOb
 prAHBOnXp2Zn6j0WDyzpE1x5tQ8+6cM=
X-Authority-Analysis: v=2.4 cv=f/p4wuyM c=1 sm=1 tr=0 ts=6aa14799 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=m1JAq1APDOtiVc4_LWMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

Document the PCIe PHY found on the Qualcomm Nord platform.

Nord has a Gen5-capable QMP PCIe PHY that can operate in multiple
lane configurations using four PHY segments (A/B/C/D). The active
topology is selected by firmware through a TCSR configuration
register and may be configured as x16, x8+x8, x8+x4+x4, or
x8+x4+x2+x2.

The binding describes the register regions, clocks, resets, power
domains, regulators, PHY provider interface, clock provider interface,
and the qcom,link-mode property used by the driver to discover the
active lane configuration programmed by firmware.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml        | 272 +++++++++++++++++++++
 1 file changed, 272 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml
new file mode 100644
index 000000000000..624ad7e7d13e
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml
@@ -0,0 +1,272 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Nord QMP Quadfurcated PCIe multiple link-mode PHY
+
+maintainers:
+  - Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
+
+description: |
+  The Qualcomm Nord PCIe PHY is a Gen5-capable QMP PCIe PHY composed
+  of four PHY ports (A/B/C/D). The ports can be combined to support
+  multiple lane topologies, including x16, x8+x8, x8+x4+x4 and
+  x8+x4+x2+x2 configurations.
+
+  The selected topology is determined by the PCIe link configuration mode
+  programmed in TCSR registers. Depending on the selected mode, PHY ports
+  may operate independently or be grouped together to form wider PCIe links.
+
+  Each port provides dedicated register space, clocks, resets and power
+  resources required for PHY operation.
+
+properties:
+  compatible:
+    enum:
+      - qcom,nord-qmp-gen5x16-pcie-phy
+
+  reg:
+    maxItems: 4
+
+  reg-names:
+    items:
+      - const: port_a
+      - const: port_b
+      - const: port_c
+      - const: port_d
+
+  clocks:
+    maxItems: 17
+
+  clock-names:
+    items:
+      - const: aux_a
+      - const: cfg_ahb_a
+      - const: ref
+      - const: rchng_a
+      - const: pipe_a
+      - const: aux_b
+      - const: cfg_ahb_b
+      - const: rchng_b
+      - const: pipe_b
+      - const: aux_c
+      - const: cfg_ahb_c
+      - const: rchng_c
+      - const: pipe_c
+      - const: aux_d
+      - const: cfg_ahb_d
+      - const: rchng_d
+      - const: pipe_d
+
+  power-domains:
+    maxItems: 4
+
+  power-domain-names:
+    items:
+      - const: port_a
+      - const: port_b
+      - const: port_c
+      - const: port_d
+
+  resets:
+    maxItems: 8
+
+  reset-names:
+    items:
+      - const: port_a
+      - const: port_a_nocsr
+      - const: port_b
+      - const: port_b_nocsr
+      - const: port_c
+      - const: port_c_nocsr
+      - const: port_d
+      - const: port_d_nocsr
+
+  vdda-phy-a-supply: true
+
+  vdda-phy-b-supply: true
+
+  vdda-phy-c-supply: true
+
+  vdda-phy-d-supply: true
+
+  vdda-pll-a-supply: true
+
+  vdda-pll-b-supply: true
+
+  vdda-pll-c-supply: true
+
+  vdda-pll-d-supply: true
+
+  qcom,link-mode:
+    description: |
+      Reference to the TCSR syscon and the offset of the
+      TCSR_PCIE_LINK_CONFIG_MODE register.
+        0 (QMP_PCIE_NORD_MODE_X16)        — all ports ganged as x16
+        1 (QMP_PCIE_NORD_MODE_X8_X8)      — x8 (port A) + x8 (port B+C+D)
+        2 (QMP_PCIE_NORD_MODE_X8_X4_X4)   — x8 (A) + x4 (B) + x4 (C+D)
+        3 (QMP_PCIE_NORD_MODE_X8_X4_X2_X2)— x8 (A) + x4 (B) + x2 (C) + x2 (D)
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: Phandle of the TCSR syscon
+          - description: Offset of TCSR_PCIE_LINK_CONFIG_MODE register
+
+  "#clock-cells":
+    const: 1
+    description:
+      Selects the pipe clock output by port index (0=A, 1=B, 2=C, 3=D).
+      GCC pipe-clock mux parents reference this provider.
+
+  clock-output-names:
+    items:
+      - description: Name of the PHY A pipe clock output.
+      - description: Name of the PHY B pipe clock output.
+      - description: Name of the PHY C pipe clock output.
+      - description: Name of the PHY D pipe clock output.
+
+  "#phy-cells":
+    const: 1
+    description: |
+      Selects the PHY instance by index:
+        0 — port A (up to Gen5 x8; anchor in x16 mode)
+        1 — port B (up to Gen5 x4)
+        2 — port C (up to Gen5 x2)
+        3 — port D (up to Gen5 x2)
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+  - resets
+  - reset-names
+  - vdda-phy-a-supply
+  - vdda-phy-b-supply
+  - vdda-phy-c-supply
+  - vdda-phy-d-supply
+  - vdda-pll-a-supply
+  - vdda-pll-b-supply
+  - vdda-pll-c-supply
+  - vdda-pll-d-supply
+  - qcom,link-mode
+  - "#clock-cells"
+  - clock-output-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,nord-gcc.h>
+    #include <dt-bindings/clock/qcom,nord-tcsrcc.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        phy@1b00000 {
+            compatible = "qcom,nord-qmp-gen5x16-pcie-phy";
+
+            reg = <0x0 0x01b00000 0x0 0x10000>,
+                  <0x0 0x01b10000 0x0 0x10000>,
+                  <0x0 0x01b20000 0x0 0x10000>,
+                  <0x0 0x01b30000 0x0 0x10000>;
+            reg-names = "port_a",
+                        "port_b",
+                        "port_c",
+                        "port_d";
+
+            clocks = <&gcc GCC_PCIE_A_PHY_AUX_CLK>,
+                     <&gcc GCC_PCIE_A_CFG_AHB_CLK>,
+                     <&tcsrcc TCSR_PCIE_CLKREF_EN>,
+                     <&gcc GCC_PCIE_A_PHY_RCHNG_CLK>,
+                     <&gcc GCC_PCIE_A_PIPE_CLK>,
+                     <&gcc GCC_PCIE_B_PHY_AUX_CLK>,
+                     <&gcc GCC_PCIE_B_CFG_AHB_CLK>,
+                     <&gcc GCC_PCIE_B_PHY_RCHNG_CLK>,
+                     <&gcc GCC_PCIE_B_PIPE_CLK>,
+                     <&gcc GCC_PCIE_C_PHY_AUX_CLK>,
+                     <&gcc GCC_PCIE_C_CFG_AHB_CLK>,
+                     <&gcc GCC_PCIE_C_PHY_RCHNG_CLK>,
+                     <&gcc GCC_PCIE_C_PIPE_CLK>,
+                     <&gcc GCC_PCIE_D_PHY_AUX_CLK>,
+                     <&gcc GCC_PCIE_D_CFG_AHB_CLK>,
+                     <&gcc GCC_PCIE_D_PHY_RCHNG_CLK>,
+                     <&gcc GCC_PCIE_D_PIPE_CLK>;
+            clock-names = "aux_a",
+                          "cfg_ahb_a",
+                          "ref",
+                          "rchng_a",
+                          "pipe_a",
+                          "aux_b",
+                          "cfg_ahb_b",
+                          "rchng_b",
+                          "pipe_b",
+                          "aux_c",
+                          "cfg_ahb_c",
+                          "rchng_c",
+                          "pipe_c",
+                          "aux_d",
+                          "cfg_ahb_d",
+                          "rchng_d",
+                          "pipe_d";
+
+            assigned-clocks = <&gcc GCC_PCIE_A_PHY_RCHNG_CLK>,
+                              <&gcc GCC_PCIE_B_PHY_RCHNG_CLK>,
+                              <&gcc GCC_PCIE_C_PHY_RCHNG_CLK>,
+                              <&gcc GCC_PCIE_D_PHY_RCHNG_CLK>;
+            assigned-clock-rates = <100000000>, <100000000>,
+                                   <100000000>, <100000000>;
+
+            power-domains = <&gcc GCC_PCIE_A_PHY_GDSC>,
+                            <&gcc GCC_PCIE_B_PHY_GDSC>,
+                            <&gcc GCC_PCIE_C_PHY_GDSC>,
+                            <&gcc GCC_PCIE_D_PHY_GDSC>;
+            power-domain-names = "port_a",
+                                 "port_b",
+                                 "port_c",
+                                 "port_d";
+
+            resets = <&gcc GCC_PCIE_A_PHY_COM_BCR>,
+                     <&gcc GCC_PCIE_A_NOCSR_COM_PHY_BCR>,
+                     <&gcc GCC_PCIE_B_PHY_COM_BCR>,
+                     <&gcc GCC_PCIE_B_NOCSR_COM_PHY_BCR>,
+                     <&gcc GCC_PCIE_C_PHY_COM_BCR>,
+                     <&gcc GCC_PCIE_C_NOCSR_COM_PHY_BCR>,
+                     <&gcc GCC_PCIE_D_PHY_COM_BCR>,
+                     <&gcc GCC_PCIE_D_NOCSR_COM_PHY_BCR>;
+            reset-names = "port_a",
+                          "port_a_nocsr",
+                          "port_b",
+                          "port_b_nocsr",
+                          "port_c",
+                          "port_c_nocsr",
+                          "port_d",
+                          "port_d_nocsr";
+
+            vdda-phy-a-supply = <&vreg_l6a_1p2>;
+            vdda-phy-b-supply = <&vreg_l4a_1p2>;
+            vdda-phy-c-supply = <&vreg_l4a_1p2>;
+            vdda-phy-d-supply = <&vreg_l4a_1p2>;
+            vdda-pll-a-supply = <&vreg_l1e_0p9>;
+            vdda-pll-b-supply = <&vreg_l1e_0p9>;
+            vdda-pll-c-supply = <&vreg_l1e_0p9>;
+            vdda-pll-d-supply = <&vreg_l1e_0p9>;
+
+            qcom,link-mode = <&tcsr 0x71050>;
+
+            #clock-cells = <1>;
+            clock-output-names = "pcie_a_pipe_clk",
+                                 "pcie_b_pipe_clk",
+                                 "pcie_c_pipe_clk",
+                                 "pcie_d_pipe_clk";
+
+            #phy-cells = <1>;
+        };
+    };

-- 
2.34.1

