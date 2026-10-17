Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410321F936
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230356; cv=none; b=iDtMgO/cxKrT8wVezTJdO3/CySVPxAna75E15tUPxARyvlDlO3dnHW/Xurf+WZIkCglAUoQG8ZQhhPOKbO5i/+ky/LN07srj1/JED1JleSOh3eEZ5qnrPLhKX3StxF+P+bov1GLcIC5X0EcW/znGlWuHgq8BgF7CQlIGDpaNPPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230356; c=relaxed/simple;
	bh=7H1dQan4dtYXbkBmTtDxfLj4GbZbSaGELvYCjH5tXhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=InzfcREZYOjA0vF1Ed8Y1lCjjUnx03m/K+t8MrTbVnxfrk47XcqTDiUuMJLtSDxXN0Fg3yXpNHh1aD8y5GrkUcx8ePSLL+arnYOX2E+VL1iGPRr5vc7NovDn+YYUzA3h7Vv+CbwDP+Q5E2OeOzr+jaSOSK14tFyHafBSZbQlkF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XJhtJmtc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XmEJVTO9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XJhtJmtc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XmEJVTO9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6oCXP3085358
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N5JsDfOM/FZljuyIYonxoFSWj6Bl/lINX9Srt6X9Eks=; b=XJhtJmtcW9wyS2D8
	wluey3x0dO8JuICXbqhbYG4oCdepQjsu6hB4XndxdZzr9uj18X56jb/hi1xs3rM3
	0ypTyLj0083+4OJNwU/MX37RBzmNZV4sFgfLN21VU6kPqc8Vr4fm3WqNuvjV7NQv
	NZyTtPXjzNktZdjhP1xV+DdUNW5uFY4ow8KfvPfBQcxn/mClzLgbTlirtK52Ih7V
	K4XPNPmUhXGe4u0/htP1PtCApsqrLCEMJna8OZ/U6Kx4QkSX5qgMFTVLad3W5FlN
	l1Rwv5hpu9TntGMVbgQV35zxL8r8p72ENtTZZ4J+5bHc/cU7zLms43insmq0b2hu
	YUocbw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc26k0gca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:45:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1299372eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230353; x=1792835153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N5JsDfOM/FZljuyIYonxoFSWj6Bl/lINX9Srt6X9Eks=;
        b=XmEJVTO95FFUEPM5MWt9m+sHaSmxhygS1joREuPsaWbt9RBD6yrTxHU63d93YaKap3
         FkW3OLPqHS+FmLfG5Yb8xw/hXXqHksTmumrjb0uvyPXvAElzOOLQS5SpsQU7anb7oc2q
         8EI6TiTK/CUtPV2o73wP4+ZAidCUaVOaRPwX3nTOZQZYgbuQ5X0f/ivoBamDuG2aBpcb
         BokHONQjjpdPwyn8F9W6IPdeKIDBRAjH8jDsWwpFRKrTuPVqsQ51z1mmGvdqR5W/9xN8
         6YzS9vd3XThSrv9uzfrTYSnr4y63eHOFo08Eim71xb59PmyPkGSy/QSH8pQrs1zxXXPX
         FxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230353; x=1792835153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5JsDfOM/FZljuyIYonxoFSWj6Bl/lINX9Srt6X9Eks=;
        b=dBw5zMMzA1ktpp1WIgBBi05kLsBNMo/lYCkXGCYD16vHhAtSsE2EWx521wLOk2MaQY
         RBwvKAubCqV5T2CCXMxM5I3zK9ScrXpTqWV2THJeN4s2pcsICZvnu2c0NUIsyDl3Z1t+
         B2HQiL7hdOvX2330bsOKwRJdrMsaf+7vY+qdDiHgBaKnvvr2Ox6Hh2MyTbOnCgT6dlfF
         5V+J9zalXKFyHl+Iatf7HSLi5bs1F0ooFnU2HxncpdLR7+VhIQ9n86cyX7S6vfwcblHs
         ThFAOmadCiSf9cUpw3tPscer7dsUp41YNGoiygATLqSfrX+bOLn8moZ1kL758BvuUGix
         JTaA==
X-Forwarded-Encrypted: i=1; AKwUvBzsSsHF7o/Z8otKGM2YmrQ3o7d6jVZgYKB+PZ/QlXtMc8mnn0NEVgvYjVSlEvOnxmD9i52EenkP2Rq8uTo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJT/l8cwAwmdQHmnCuxTP5oFLDmMjhdbPtLSdxY+dGkdoVJu4vZ
	0qIuY+tElOl4R5pCsil/lZrmCFsnERGoDZ3JoQObAd0zE9+PY227ig6U2drpihT5+mTTtAMHOJT
	hd6oqfMHZaipuIuSZdqz3yJ4S0xLVNTcrYW56lU6IO/meCyTZM7U0d4Zw18B22uQU7nA=
X-Gm-Gg: AYBFou1vrrEK1OZ84Km6rIA9+HehEMr/tc9Y9OyndlPqb3RrFszUKI+MXCWkvTiUKF7
	LtpVwOQq3RBS0UAYnguVGnRv4ZBekUZDZivEPCQ0ng3eGmrl8QGvio1Gt1W7lZvnGcxo5anK8Ph
	y6wLO9BZ9MdJvDkEL8UsSqrCs/W74ZOhosPYJ8Q1u0DIZcZr28uS6La7E6TetyHW00vld2ShnwJ
	IJblIqzxuYL/BuslJfPPJxsHYa19nkK2S0HrgBxxLQD9FBfxxfavkxoGuQwWOJTGP6ywpDssjX4
	cgKqEbwT90LnsWkV2L+1jrybtrawOXYgJQeFYn2y+2O37T3cOjob6t+H2Kgte6/gutxthDOx2Ta
	reDMI8fgDcD9OEG49/RjuK+r5e/0LSA==
X-Received: by 2002:a05:7022:ea47:20b0:143:2719:566e with SMTP id a92af1059eb24-18515a66a98mr3299719c88.42.1792230352668;
        Sat, 17 Oct 2026 02:45:52 -0700 (PDT)
X-Received: by 2002:a05:7022:ea47:20b0:143:2719:566e with SMTP id a92af1059eb24-18515a66a98mr3299673c88.42.1792230352015;
        Sat, 17 Oct 2026 02:45:52 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm19450327c88.11.2026.10.17.02.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:45:51 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 15:15:13 +0530
Subject: [PATCH net-next v3 2/9] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-shikra_ethernet-v3-2-26a8beb44b8f@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
In-Reply-To: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792230324; l=4186;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=7H1dQan4dtYXbkBmTtDxfLj4GbZbSaGELvYCjH5tXhs=;
 b=Nl8ymVl6J93gLBLMvJKMojOsdAWgSXv8yLIYcYzfWJuRm11xD4pZL9pkdLz2/iYRlOwWCptYV
 MA4l3Neu2TABWN7m0CtopijlW4CzxsG32zYUmwWQPHuy19ER29nM39W
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfXx3h5PG64VeEa
 oGcBa7LTv9XwSLYaWNuFlh1pdME8CTO7X8ECa/JC61+b8JcQNw416U4ovLesc7vkJ28xLenWcpC
 eAnBozpgW8NIj1cNXB/6pRXcwFl6M81bBFV8TYGLo0kIwfdMZEIOhDJBXIcxOvg/ykiyP6WKyTL
 7IU44ZhwpdUM8+1Rwzqd7ldKZGx1+BYyPflw7fdT5nOLUM9FJqvdR0mrAe/sVclM/xmWwBm1jSe
 lzbyGexbSWRU0gudChFMNWDS64BqshYsoXDRXgJ9/oVh2UGE27dd/q8PSwd9ihOxwiKYdXT8OKo
 CLsqk2c7g4f+xY3mgdaD/ubgOpU/Cs5w/QFQwH088c8CTVGhhvpv/9M+RymU7W7phH1Zu3KQBvo
 g/2ZIMh2aGhqKlY0IALh7KaZyhwFrJE1tKZuhK650t1MUU82IE1VfqipevwZsKikyeF6KXHs6vK
 aHrNmzpB4gNiHxbSzvQ==
X-Proofpoint-GUID: tRwhO3IpuVnh7Ym-ZOJ08nl7A2DHwqUr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfXy9NAogwCmKJM
 vxUMRFNF3ex2tG+dO+mQO08I2mSdgfYYpP9CFSwOISJRzdCfb1QNHD/wPwCrC2Y3292JHVtgqdm
 hGoIbMn7eSf8BuSziQEUdZHJvRKbX/Y=
X-Proofpoint-ORIG-GUID: tRwhO3IpuVnh7Ym-ZOJ08nl7A2DHwqUr
X-Authority-Analysis: v=2.4 cv=Cowq4X4D c=1 sm=1 tr=0 ts=6ad343d1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=iZY8vWlYZPOy4iMPn4IA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170038

Shikra's EMAC requires two additional clocks for NOC interconnect
access (axi-noc, pcie-tile-axi-noc) beyond the standard four, and an
OPP table with required-opps to vote VDD_CX to SVS when the NOC clocks
are enabled.

Add qcom,shikra-ethqos to the compatible enum and use an if/else
block to constrain Shikra to exactly six clocks and require
operating-points-v2, while leaving existing compatibles unchanged.

Add the relevant compatible to the binding document for snps,dwmac as
well.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,ethqos.yaml       | 55 ++++++++++++++++++++--
 .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
 2 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 423959cb928d945aa3e758a3c803d12bd61ec42b..1167f11adbf30c234186a415004a75a774aa4492 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -14,9 +14,6 @@ description:
   dwmmac based Qualcomm ethernet devices which support Gigabit
   ethernet (version v2.3.0 and onwards).
 
-allOf:
-  - $ref: snps,dwmac.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -32,6 +29,7 @@ properties:
           - qcom,qcs404-ethqos
           - qcom,sa8775p-ethqos
           - qcom,sc8280xp-ethqos
+          - qcom,shikra-ethqos
           - qcom,sm8150-ethqos
 
   reg:
@@ -57,9 +55,11 @@ properties:
       - const: sfty
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 6
 
   clock-names:
+    minItems: 4
     items:
       - const: stmmaceth
       - const: pclk
@@ -67,6 +67,8 @@ properties:
       - enum:
           - rgmii
           - phyaux
+      - const: axi-noc
+      - const: pcie-tile-axi-noc
 
   iommus:
     maxItems: 1
@@ -81,6 +83,11 @@ properties:
       - const: cpu-mac
       - const: mac-mem
 
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
   phys: true
 
   phy-names:
@@ -92,6 +99,46 @@ required:
   - clock-names
   - reg-names
 
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-ethqos
+    then:
+      properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: pclk
+            - const: ptp_ref
+            - const: rgmii
+            - const: axi-noc
+            - const: pcie-tile-axi-noc
+        operating-points-v2:
+          description: |
+            The OPP table specifies the rates for the NOC access
+            clocks in "stmmaceth", "axi-noc", "pcie-tile-axi-noc"
+            order.
+      required:
+        - operating-points-v2
+    else:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: pclk
+            - const: ptp_ref
+            - enum:
+                - rgmii
+                - phyaux
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 2218a492817fd3d864e0bc529b83fdcbb4ed023b..20b1da2f1096c94215902834a1ea014fb4ae44b2 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -75,6 +75,7 @@ properties:
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
+        - qcom,shikra-ethqos
         - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
         - renesas,r9a08g046-gbeth
@@ -585,6 +586,7 @@ allOf:
                 - qcom,qcs404-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
+                - qcom,shikra-ethqos
                 - qcom,sm8150-ethqos
                 - snps,dwmac-4.00
                 - snps,dwmac-4.10a

-- 
2.34.1

