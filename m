Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AE1471263
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925951; cv=none; b=MyPagk9B8BLNKFlc5SOQOf8//XQI3S4//1sZxfABFurykAcV21hJAhNcf6U9TkRI/zWAtkL84Q4uYueO9VtjbcKMDTZKFNI2fVArgGB6s1fiDOJzjKXKy4LutsOpC/0X6+Wk/BbTrWpcbluRWNn/X4jLPumWSiyHy3TaM7RJm70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925951; c=relaxed/simple;
	bh=2ZoWKXh14IFtzY+jQ6vF0Zhx1BAkHO8mYs9EuOJq9ck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VzegRCxQmYD5bFC38fb5VmE/Yj6aEGZ/KYllnGxp+5hMUiDoCCphGdW9FUoNdJ/2MvG8BS6HLIcU91YzdVkYemrLUmuJ/sEqKOTQfKD/W3LGNYzjNoQDwbuV9yn0JgoCmQBBR/52FkDRxRQDSdFlsh+eHhu5B4mDji/lF012+bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8nkxqiZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gAnESSoB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8nkxqiZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gAnESSoB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDkciB3075349
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hMggueJrEfi9Ea0CXs0IW5lUopvMP6HZ3I3Pa5LDYY4=; b=Y8nkxqiZpP6cd/Zr
	D9evTg+nu14ILTepQu3MQa4ruXrjJUDhPeHJCg0zkK1FOgFv0Qgp1zr5nzvDt+iU
	3/9/JjcEZmq75vtQ2wuzVWhZ1AqS62b6p7t3Slql0K0pHBSnG6PruHDuw+ypmBuO
	I22wGZvElXpzB2wtKdlAWKwTP2xOY/L8fkkVtGbWmaRNTEIx3VizOam/cbIy9glj
	dM4OFkqzd5TlR5i8BE1G1Wp25jCE9CMRtWA+eo6IklF6LSLbulEtRrfkCO5/JNx+
	U48FB3As1OwhJ7roJzuSMGfMVuqzNiTyRoYjnFhSWm5z+HvJZBJMLov8ExTYtp6I
	Rf2Skw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb1v3ahgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:05:44 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-784eaf6cdb7so260426137.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787925944; x=1788530744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hMggueJrEfi9Ea0CXs0IW5lUopvMP6HZ3I3Pa5LDYY4=;
        b=gAnESSoB9JWJuTJefn6bxWm7zhPbJQk33SlxZk84yqTWuHoSatH6hVU0s9VgY2V1I0
         XPdSHnA8PA1ZcdX4PbKJCk0jSbzai1xCuBBjvm/ECYIjhWtnnH4EWxll6b2kC37GpZYo
         gSiOBIbLaJ9S1J5fQeLUxargvtYGrC9Opwmx7Ge8zHwwe0vGsLI/M/SDnrDFfpnW2p51
         UZns4/o8oD5SQCj/p6HBmAoo/C1wPPEFSbKjKkEL5B6s1l6RchZ1a49B9PpjX76eJnaC
         0Pun3dytWn5XhDJHWxBu4nz1vgH7kBEOO3Adr5faHchbvEYApaPV56nXXHvWJYL8Hetb
         Mnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925944; x=1788530744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMggueJrEfi9Ea0CXs0IW5lUopvMP6HZ3I3Pa5LDYY4=;
        b=A5LFiqSb6Og8jxXuakwy+GU8zNo8fEueb9qmeBC7wd2z8DxrwMP+DmOjB9eqNUdsku
         baYFln9N1VJf8x1j0zfOQbhCt1LFXmw+dm2oF9bEr0RWo2/DDOEW/SiHChX4Z/usZSja
         wS4uoLmOjrZ9CfuEx9e/LfcvtLsKarcI9vuwZ18Z06csZQ+VzJTk8RiA3RBI07sAyfnU
         hF4UDZltUjn+RA7pK7Yuyd+OzpIcMYKoKCuz+h9xtL4ctiDzMRSjbXGXQHahBbCWHkT/
         gFTGnPv2GyI7PIy3aL5AfkyoH+tuw7vfXLzrTCWQT7MoGZ5Cho9pNDRfVB+XNWUTh32M
         dG+A==
X-Forwarded-Encrypted: i=1; AHgh+RpOhAk4DSUNbR6f9CQjNCT4TLL3xyh9/KUfK1bA4kFU3QKP+xOsOnlQSQbNyW9h4P4CxLNCNJCXbQsdQXA=@vger.kernel.org
X-Gm-Message-State: AFuF++mw3HEesFX3nJMD4OxfDQUafw0XQUGyeXw4DiIBqKjVl8a5CB+5
	ag45TLc5cqIaVsO1BMTeGKESciyd6J0NH/fW8iu/6FoH/quu+bij3V7RFRKYrgO/BIP6QeHd3La
	62gMYvsIb8XC3JX+TMfcn2wYuk/tDmrlZ0Ss24h6ftBI8QF3qCqa+TogqqkTpF/5TTmU=
X-Gm-Gg: AR+sD13kYi55W4kDLVaSkNmyD2pUhSKLwbLb9ZYSIn9tCNjCc8cBwUHnnj/EE8Nx3lP
	kIPqvv8hRx/cazrOHMFgwqDzRRbs3joGnZd4nYAtsMhlp2zLjcOQs8HcrpF/ENW7d/mAgzWn9lg
	QdsP67LTVNKhI6XZmNnEaVwihOCZ9w0qzMsvINz6vOmxm4tQ/kUiMAmI281IReYLGE7Ka6xUiZ4
	AXDdrfVIp8rPb9TC8GQrTiLsaXKUcrsY8/6PfBCd9FT9MTV4kpwSffU/tfwD+Hkb0MkwKVCpXqf
	H4KnOfgDoi18/SCUV0Tyk5/cHTZEKwKIRTTLXbjR/fkgerTYQKNY1+NCfHBZ2F8Zz2bulNb3qan
	9OOKQ0ityM3YDur9VqGIi+JU=
X-Received: by 2002:a05:6102:441b:b0:785:3211:f5e4 with SMTP id ada2fe7eead31-78596acadafmr1836567137.4.1787925943422;
        Fri, 28 Aug 2026 07:05:43 -0700 (PDT)
X-Received: by 2002:a05:6102:441b:b0:785:3211:f5e4 with SMTP id ada2fe7eead31-78596acadafmr1836517137.4.1787925942860;
        Fri, 28 Aug 2026 07:05:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm3908633f8f.20.2026.08.28.07.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:05:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 16:05:04 +0200
Subject: [PATCH RFC/DO NOT MERGE 06/12] dt-bindings: display/msm:
 eliza-hdmi-phy: Add Eliza HDMI PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-drm-msm-hdmi-eliza-v1-6-67843277de17@oss.qualcomm.com>
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2303;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2ZoWKXh14IFtzY+jQ6vF0Zhx1BAkHO8mYs9EuOJq9ck=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkZWdh7HfytneGYVObjElDzO1HVTUQvEj7tn3D
 XQg6/WJeMmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapGVnQAKCRDBN2bmhouD
 1wt+D/9VrlG2+yThOGo4fnvqiAFSf7vxedxD15XsiCrnglQiiclrvXuBJ3VNN8TrQJtLNGagih5
 dlXwCMTqnHie8c+pydAR5ohQsNXDyardZTgaAjUirpa+wZxFF76rfVBGKcu0/e2IjdltiQVr6yj
 i0XvsNaS4q0w50TEkK3dOJP5fDmBVBk6DDwMA8NiHU6jsxTuK+LQTnKCsR15L2BsGrosX/BrRd5
 zlzVIxnvLOZaqWeuL+Ky+gDjlHyidxGbz6JCzs5e/Z3g95iBRFC3B7UVcJCK9sR1TCjLdxHefnq
 kVqh+FgzvcbKHsZeSha0B4TwlDbbTZPmdbmGCnZuLNfCHlF/wpYauRTJ5uHTEHIATHixlEXerA5
 MWx3Br9x3dvPUIuFzKpKXmkaQlPH0zGkRQ/FdHxjk4NeSLjX4DGWCzbP+eKmzfA8e5WflT1sph+
 8+51rU4aTvygnPrSOZ9PwIrtNNmojcZZlHvAhGftM+81G9umoXMirbdZeXvorC3n+5UbADeFamF
 vft7Mdm584q+tmdVV8rc0qNKI1RGdgvB6swbSbCZByK8n74Vzo10dbCcZGE7e+JlZJdoSlZF7fQ
 CxtCIGKfM/IxK93srEX8Hn6ENL5br4AbNBG1dWR71NCSsjO3jMECbDGN6NscLiszcsQgElAMMNM
 R3/NufZ/7h4Pn+g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX0D49KvryaO8X
 yhrhphoMJsBaP94XTqtMpSQIo+SS2DDIwZwPux+cTEK3mCVdAFAcAFIT/qo1ug5fNhobsR2EVnR
 utldb4pQejvTGb4TL3+xs52Vx2ltdvXoorkCq8d9HZqLsWqZdEBD/E2gR55xCAPT3I/VW+kB1Ok
 7CW6SF5pvAHDHiwB1KUvCOsungxp26sjoxg2fLycsTxOCSE/3R/BDQAkG+sz5R8hLTZohFrenff
 pIlyZ4dBj+HsebxcOBDoNGK7Hl24eYfHVSCSUrpccsSUVu8emNGUzX6mlkXnSQJenes8ZWBF+uU
 phmysrQPf9RfDs3KzbJQweVvswbDM2CL7/uTpywGV4o4VXAgFftTqEojBCAxfoynlymKuwijH7Z
 HHBAxQyc7L3tO8kpbHYKJ4Xswfodwfw/BcxwHiou7511cdOYl4/+EzHmHPPDGGANwsr/XSxCVKa
 X3eGA2EqG9B5SdRXBeg==
X-Proofpoint-ORIG-GUID: VoR-JMQUOpqBmlDwqbiEEMzZ7hG6_SZ2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX8xCdcjY7Lc+0
 aOhPTYw8xNeHWO1TlXMp9MSGsikQl8LlnFkS+smcJ+WmA67ZT+KSPqiEJUrTaBkVE9H4NaISvEv
 7tm4d3zjVegGHEFKGwwcleJS+5Kvqe0=
X-Authority-Analysis: v=2.4 cv=faedDUQF c=1 sm=1 tr=0 ts=6a9195b8 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=m4uPUOG36isBoBWOdqQA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: VoR-JMQUOpqBmlDwqbiEEMzZ7hG6_SZ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280122

Qualcomm Eliza SoC comes with an Synopsys HDMI phy, unlike previous
variants with HDMI support, thus no compatibility is expressed.  There
is no documentation, except register list and register programming
sequence, and downstream sources do not point to any supplies.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/phy/qcom,eliza-hdmi-phy.yaml          | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,eliza-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,eliza-hdmi-phy.yaml
new file mode 100644
index 000000000000..764fec0ef29b
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,eliza-hdmi-phy.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/phy/qcom,eliza-hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Eliza SoC HDMI phy (Synopsys)
+
+maintainers:
+  - Rob Clark <robdclark@gmail.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
+
+properties:
+  compatible:
+    enum:
+      - qcom,eliza-hdmi-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: iface
+      - const: ref
+      - const: xo
+
+  power-domains:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 0
+
+  '#phy-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,eliza-dispcc.h>
+    #include <dt-bindings/clock/qcom,eliza-tcsr.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    hdmi-phy@9a0600 {
+        compatible = "qcom,eliza-hdmi-phy";
+        reg = <0x0aea1000 0x1000>;
+
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&tcsr TCSR_HDMI_CLKREF_EN>,
+                 <&bi_tcxo_div2>;
+        clock-names = "iface",
+                      "ref",
+                      "xo";
+
+        #clock-cells = <0>;
+        #phy-cells = <0>;
+
+        power-domains = <&rpmhpd RPMHPD_CX>;
+    };

-- 
2.53.0

