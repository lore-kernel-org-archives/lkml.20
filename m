Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7FC33374F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790125744; cv=none; b=SDZzgPjeaGkXaskH8Oxxy9HoRWtE/J+NdT0ZCWbumfb6io6C+D4vO2why1Ef30kvPcR7mdqUgNFLDj8WblLYPvrtfAU1Kmisgo9ejLRsn3/91+5tO79cx4lUXArXfynln+TgYQuecj6sbk1vyGWekZhF6W3gVl2uxgYoug+NTdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790125744; c=relaxed/simple;
	bh=JmfcMUWRFg7uwuqJn/I+vT/M2s5OTkmkeDXfFHwZyUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ojxqc8xs7uXG1oosIsAUPFUEg/EDuYUMJwUIDuPBc7M6qwabvX95ROfrZa0Ecrt21KdgsHsQDz4eYxRYEuluMXUbXA0TBGLBEfwV1NUI1lGXwWeEK0jnui65Zn6F2Y6xKtT5KoVI5iMzG4WjNfCz2OaUkpDOoAGZdSID6vGPIxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=haQFuzi1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pe145NiV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="haQFuzi1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pe145NiV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI74BL1509189
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iBSU4sUpmq2QSmL7tgG7Il54FE/ySnXmTXvsaA9MtE8=; b=haQFuzi1LBo6BuIa
	i9W3LQrr51X0ZbuVK2pQk/sqKknfeHMyzuVikBv+eFVJWmBGRXKeLXbAhs2Rebws
	F0Qxl9IzlCnRK5NxYphKagjkfhMwD814FfMRjJSCB+Pkk2yyxLUmjEjVnN65OZQO
	HvK01Kec7jBsfaLgedL9hk4pvmnbO1Gp/o+g73KmBuI/KF6J/B8SV3/a0qm7PJZN
	HtdiSo/GEC4msLvBhqk7l+ltnlTHVcQ3x9e7JSWScimDgVrUeoOL+1MwFT0T0pMx
	eWJxtNyR67IlnwxypnepC8/4Xg3HWhoovcSeFl8Rr6DoXgjw5H+BUSC/CH2khAAx
	Y2rT3A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xsu7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:09:00 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-142f4306744so986019c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790125740; x=1790730540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBSU4sUpmq2QSmL7tgG7Il54FE/ySnXmTXvsaA9MtE8=;
        b=Pe145NiVewrMq0/JXFuc/q5Z9Ra9zIumsfds0eaQaOW3B3qESVoY+lUtNhYpBmNwsn
         bHsaMHNyJ4xfh8sATJyGk68c+OaMpQNy8+4ameNfm61tMO0IGuG3LuFlwpDLtI4DzFBc
         Yv96yCcxMIrXYZkikG92KjPr8aA1sO2btTIv5DdH8rMrWjINy11mXYVMEHUQeXwaiEz2
         2S66f6hW0xRuBCbRpFZuq/rcI1qh/I7nR6JQpQM6PEEMGESUldiO2Lmw4d3Qq1mx00lF
         HRsoNq4iYgu1i6Jl5VkIfP54ZBXaILBgzS9Sn2VBL0F+sA2wn/Ub5xA2Ho++PSPg1eMb
         dXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790125740; x=1790730540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBSU4sUpmq2QSmL7tgG7Il54FE/ySnXmTXvsaA9MtE8=;
        b=WQTGP2bMM6bNc+xups3EIV237skEVErAiceMnxLU21Rh+8NswYhyi9+IErGpxdxo4Z
         VBjvJ0eTiRGGpNmbR05t183CTr0SR0Fiy9QscBwxmyJaVP/y0Ih4uS3/ZwEk4umhNLmV
         qEqDsG/MRn7KEAnsMBM80hGjC9XnY2+fbNL72wJTE1lq3OMsiKjB8LDtokt2Qd5V8BwH
         irOt8ffiLg1+60VJS4gjjiv4zEJUut8yq0Vv4jx3z26mh1+ZgM8k7GBrph+u49LZ9R2a
         VeSkmSMKuhERi15v2b4RDPaXWwnQ8tRDclfEiUp1MDpPhRQEhl0NeCtWE9kBMdFVUHEi
         w9Aw==
X-Forwarded-Encrypted: i=1; AKwUvBz9TPfxXJuORxjfI8B9dJe0TReemot6PUQaLD/bRIr+6dUL0ngO/xaQ/nB7htWdm091UVRYDylDtI30MUQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l4/Eg9a/WwiCfm7+q8hgXwlXkqWqz8pmANeZFdYi8vGi45Lorx
	RjKori3XIX6m1UW/fhf4S4RbB2YOlMS5SMD3AynwJSWycZhgqGf3+8yegiEAQRgZOGRJU5DwfKA
	AJjsAJkQZnkJuAEZEA0XMO1RdefgEODbLXqwVIFKNFMDSa1PVzIQUBbB+wgt7Jn+BbPU=
X-Gm-Gg: AYBFou0LIyVwR69Zd6i4Bc+hSwPXlz+wSjYBv8KV7UNtaJLw4rax38PcJj4Jl1JU/Fj
	6FGefm7GdsSHcHABQB64Xg1JClK8Btycypi0CbCa3pHu//oIxe9ghLhbsWl0udu/Il7E4Ku7fVb
	RNLW+DEKKBPsX3ORki05cqM0PGobo/0WsGQZFvhFu4PnD4xL8g4s7QgCkog7HPfBnSGOAHxQouD
	2rdj4H9V1gbvWrfsbccugBdbayZEZhUXjYLH3kiXfXgxNlL4xXhAPJNiic8TxkpU7cNh+Sa5X4e
	R3i2qR6pW647JE26FqS8SGx4P8Ul/F0BkezA3mOwG3L+U24dPGG2jIpBz2MSbqua7E1m0yms2PW
	iven9JrXpVk4K1IrDL2Ex/4y2BjSn
X-Received: by 2002:a05:7022:628c:b0:143:2e98:6755 with SMTP id a92af1059eb24-144f92e1d83mr1598697c88.30.1790125739828;
        Tue, 22 Sep 2026 18:08:59 -0700 (PDT)
X-Received: by 2002:a05:7022:628c:b0:143:2e98:6755 with SMTP id a92af1059eb24-144f92e1d83mr1598654c88.30.1790125739150;
        Tue, 22 Sep 2026 18:08:59 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98ca0edsm1651831c88.15.2026.09.22.18.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:08:58 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 06:37:32 +0530
Subject: [PATCH RFC net-next 6/9] dt-bindings: net: qcom,ethqos: add
 Qualcomm Nord
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom_xpcs_nord_emac-v1-6-4b1c682af70f@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790125674; l=3918;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=JmfcMUWRFg7uwuqJn/I+vT/M2s5OTkmkeDXfFHwZyUM=;
 b=bHura8egutoriSJuZ584QkRcA9ab9QGIBdhgfJq8hSxei7Foudo4HEg6ZMe0mWyWdyuhzGtRe
 dVv+cdsngD8ApJyNaSLnVTriGNN6AQ+gT2wP7jQZPVl9h38S2pmFW70
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: idV_aZVUlSGmjgV2_A-6b2K9sQQKRFIQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX+3DzMaezokmF
 A0AT3khEFU6kRvci6tSWoVi51tRzcVc+chX8bVWdBv+WuS7yL+1lsuKcDGY7opVKWmU526km/ri
 +e5mvEZuGxwSvEx3iUSnTR4MOFtX2FnNs80Nzcr3FXLF5o0hX4zOoAcpASGPinIiqmmK8UfzLq9
 G1AC8/+Bc9bGBJychIccPkKLzfkIHJs9sNoDdXpyPhLduFhavpJAiBzqRYBl/OZUtlDXpV6vIla
 O7HaFbZo5L61rdB1HbVcx3toM7YA9C9m9SfLs+Jmg+Kwij/NJ1fAfB7c6f28W1gOHJFgOhqP8ee
 cEOHri5CmK4Yq6u0osa+2RgG6BmmNuyKGvSROvZYFY154NEEe3nTcA8qwXg+uvSoIB8VZeDAIgB
 ucoha8V0iyAd9DvLafcc/0WbGrFO2bqovx6fOmiIOJBnX2+XcXeeXlw8ap6tRnUwAcE6wKW3hwy
 pYbZ4MJDForZftOqBqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX7DKV7JOXl9wf
 CTP8BzFeCOA+8l2gRa3HUMIEX+ZoK70X1afMvdp4b/PGjKJtzkn4k8qkLvZ9vpWZGMP7Hti7B/Q
 FjgyaUGMal5MRvyniSVsRbU732w6FJ8=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab326ad cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=S-kI9GOj7qxpsU4BLvsA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: idV_aZVUlSGmjgV2_A-6b2K9sQQKRFIQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230004

Qualcomm Nord integrates two ETHQOS controllers based on the Synopsys
DesignWare 25GMAC IP. Each controller has five clocks, one power domain
and ten SMMU stream mappings.

Due to a hardware quirk, PCS link-up depends on the EEE clock being
enabled.

Add the Nord compatible and describe its platform-specific resource
requirements. Also add Nord to the common DWMAC schema exceptions used
by Qualcomm ETHQOS platforms.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,ethqos.yaml       | 57 +++++++++++++++++-----
 .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
 2 files changed, 48 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 423959cb928d945aa3e758a3c803d12bd61ec42b..41de2ccd56458ed20620905d5d3716b3d2568531 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -11,11 +11,33 @@ maintainers:
   - Konrad Dybcio <konradybcio@kernel.org>
 
 description:
-  dwmmac based Qualcomm ethernet devices which support Gigabit
-  ethernet (version v2.3.0 and onwards).
+  DWMAC and XGMAC based Qualcomm Ethernet devices supporting Gigabit and
+  multi-gigabit Ethernet.
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,nord-ethqos
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+        clock-names:
+          minItems: 5
+          maxItems: 5
+        iommus:
+          minItems: 10
+          maxItems: 10
+      required:
+        - power-domains
+    else:
+      properties:
+        iommus:
+          maxItems: 1
 
 properties:
   compatible:
@@ -30,6 +52,7 @@ properties:
           - const: qcom,sa8775p-ethqos
       - enum:
           - qcom,qcs404-ethqos
+          - qcom,nord-ethqos
           - qcom,sa8775p-ethqos
           - qcom,sc8280xp-ethqos
           - qcom,sm8150-ethqos
@@ -57,19 +80,31 @@ properties:
       - const: sfty
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 5
 
   clock-names:
-    items:
-      - const: stmmaceth
-      - const: pclk
-      - const: ptp_ref
-      - enum:
-          - rgmii
-          - phyaux
+    oneOf:
+      - items:
+          - const: stmmaceth
+          - const: pclk
+          - const: ptp_ref
+          - const: phyaux
+          - const: eee
+            description: |
+              Due to a hardware quirk, PCS link-up depends on the EEE clock
+              being enabled.
+      - items:
+          - const: stmmaceth
+          - const: pclk
+          - const: ptp_ref
+          - enum:
+              - rgmii
+              - phyaux
 
   iommus:
-    maxItems: 1
+    minItems: 1
+    maxItems: 10
 
   dma-coherent: true
 
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 0ff9e3284a06124cb0a3ee62e2ea6d0b1f7f646d..e8c2911d9817cdf64e426a5a02d5f335a0fb8241 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -72,6 +72,7 @@ properties:
         - nuvoton,ma35d1-dwmac
         - nxp,s32g2-dwmac
         - qcom,qcs404-ethqos
+        - qcom,nord-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
         - qcom,sm8150-ethqos
@@ -631,6 +632,7 @@ allOf:
                 - ingenic,x1830-mac
                 - ingenic,x2000-mac
                 - qcom,qcs404-ethqos
+                - qcom,nord-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
                 - qcom,sm8150-ethqos

-- 
2.34.1

