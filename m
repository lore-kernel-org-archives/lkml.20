Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6854E3BB115
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461668; cv=none; b=Hog61ktFhvTMc4yRLppfDq4xOIII3E01qUzv1iuLlIu5vT5aIEiI8CEXn7A/8TGcaOWZSuydDtQc1W+FYMRRe1b/kv7yYIq1d+rlTmjRXtKu3eEo4E1yEpBzxc3wQc+sIODL3BrEohubyMnLurD7ik9P0ZeCeMnA71B/5YvjnxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461668; c=relaxed/simple;
	bh=1tqS6Dvk6HqdQruGW7WjMOOIlEWgJQuXPAL9e/OSA7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mPnDrtFXK6ao7pC7MfVQh8ba2msvL9nTm14g29iy01ZYNmdWIpYTkRmKSafCrCbI6fFCZYs527HAKB9IBfYNN8vn53RoEYRvssIY5Jm7qnn4hADHkcK8x33mACZCOzL/MZqAtgilOiJzAQ5wHZrkpWz33c3ow4Y72upwxisgU/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E313RZY4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JGkADowe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E313RZY4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JGkADowe"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3ctp1430962
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 18:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kIQdmFx4PDOd5O9ixmJ7nfhs+TOQEPZyJ9aGwi2TRlY=; b=E313RZY4M8xF9E10
	U6BrPtcvoIRnxtIOC+OX7G777UqJ1Y7bC/ZxTmQppLcTY0htJDiXZXhOyT8x+j5e
	/QE8/msIOVGDOq61VQ53RbZCzg6QaUFkwyGYwh9Q+5k6SP78UtbSxQU2FJj1bDMN
	SDM7OXjcrqyaxs2xFICbreLzaoFg0Qlwb4B4AJDkr4FXSKx02vMUqwIBXHmu1bcy
	wcSvnNHLvmavQn6VtFFthmarBQktRaygiQDW2BDhlfBXmOlj5NyfR8FUFQ0MY5hF
	LEP25+e1gbz/aCygEgEF/Wa/93yZsFvHX8Yj6nPYBhCX1DYhV3laHEVN+Y1UkxR3
	BSICgA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4kkh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:54:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso183620a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461660; x=1789066460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIQdmFx4PDOd5O9ixmJ7nfhs+TOQEPZyJ9aGwi2TRlY=;
        b=JGkADowejH6NCJxS1cjTbE2TZj7Mjyu4iyDrEJ7KcDfGx7X26dMp3T3eDmHRyo03q2
         5mNV8bn3gpTWtlziFReoMTXolkPwHKcH6nWRCzqQM3g9Jn645Y5lacZFoCR3TgDgKi9R
         XhGC36kNKrM+mtzZLvpfwI+NO3RAcsVp+3OhJQLwt/7NPhNmshUGtSRjRusQjBIFbjfQ
         xq9PpMfcIhB0KQvNmrKZODetCZl9QzvaSDiHsE/f7fkyfxYEenN3J2PdaHybWO9clgfA
         eQ5Gn3EjQQYfIEBad3rCRB25y+is+jVt2rx71N7t7vSy4bNVbyHDAZ+ZTg163o9NEz5P
         NcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461660; x=1789066460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIQdmFx4PDOd5O9ixmJ7nfhs+TOQEPZyJ9aGwi2TRlY=;
        b=n3qVxPB5qY8JR1V6hc8Zz5Rdd0yvyM2mJqSx2R0mRiqi2c1HSyqhUKMM80sshfIR3/
         QBhv3gcwy9SdCBZJn+0Hppi3V955EoL5WArtvfz+AosbCWilQITqBt7PFWf8UG4y7Jpm
         Z6/Mu8oTQR/3xlAxJF2NT+M17CY8TKe7Vekqw2ChgBFtY9jNV0csGe1poBYha0+Lkv8G
         AWY9zP6NVsB6x9OfUuaMhhEwP38it7PFRbhQrhSL9aTd2/zhr9Kx77L1dXAJrptyNj/w
         eOZ6eY9YqzhC9cQHqgb0D6vV3dP5FTRVnEDBa1snTmVrI/Q89MxlAqEvfzWU48IMcDiL
         J8Jw==
X-Forwarded-Encrypted: i=1; AKwUvBzj4VaTFWUdtlDfwurOTumNKCevIIir2BAS/jzM6Uo1l/DPa93nTa62dFCZxoRrIwQAFppmdjLpO5EMc/M=@vger.kernel.org
X-Gm-Message-State: AFuF++m1kadTqicyDhP7eMHHjAnz7PGfdP5cZN94ho9/idrSJlO6txa4
	TVGJHlIKgYHEzB2rlrTb+19eYsE+x7N644XrE5iPR2AHIy8Lwt75oSmAT24iFQojU1mNDzsQxgr
	ewDzpdR4j7e8DzNXFjhsc0K0x00cJp8tXvNo7UMrUEWuznakA94n6sbzvftbAGQogIK8=
X-Gm-Gg: AYBFou30xpSBIO2F9ac/vNTUbb91vtgF7F2mQQsAzVgxGbM75aOZ7vAcGmHW5Q3xtin
	jbt7AjpLiZxAow+0/jgA9dtA8Fp+EwSbVWWxglh6a8pGwjtG6Gn7mYt75gg/Z/JqkO7iweRdl7w
	TLB95Lw4RMPyDq3+BOMqzoqKe6kMpt5U0KnHpJwWZH/nYkz8krGEmxEf85DOelOtBNSqTOcgUKK
	m8eiUUEHNPcUnlT7kOFuz61E94Z70rLahUEZBK6yEhGj57Ij/LMwc3ci0iYSw2zCevE70nvaSC1
	lT2GjU1M005wlGv+mI2dRVR4U3JnYVr2l7Z4nhTLXlT9EIGlrxzYOUQ8ISUzuL/qwXbZrYE3SRF
	orXUYqOAInA3H7EJ3fBpTXh9dHVllAQ==
X-Received: by 2002:a17:90b:3d89:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-39b260d2ea8mr821301a91.4.1788461659992;
        Thu, 03 Sep 2026 11:54:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3d89:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-39b260d2ea8mr821208a91.4.1788461659491;
        Thu, 03 Sep 2026 11:54:19 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:19 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:45 +0530
Subject: [PATCH net-next 3/9] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-3-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
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
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=3972;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=1tqS6Dvk6HqdQruGW7WjMOOIlEWgJQuXPAL9e/OSA7c=;
 b=uzzl30Innk14VtQSk9wQipDRrLbmYFSpW0vMYpn4cBqiZtNV4lHQqwUJ3zYEt9gFMIbtiq2Xc
 WtYNlxhoAu3Dui4ZaxT1Cs/tTxLtdD+4EBW3mDPTd6R8AqCrTDYCtsG
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a99c25d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DJPLBmofjJW9p3Fp6mMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Pqp6oUt1cUNnHDGKBw1rE5roPFcv6XH2
X-Proofpoint-ORIG-GUID: Pqp6oUt1cUNnHDGKBw1rE5roPFcv6XH2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX3NQaM9O6uSBF
 v17UG1FFAYW0Uf9MUc5g06hC/7ivWBabkCXRTT4Xc+mFHJtepO1siEoYXBLGaEIVRjJ4PFeuJvX
 5IinIrpKzI4WNoynKHs8YQqPKHGt/uY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX0qziUi9NWO2B
 Ader+9cyDQM9IqKTHbYoLfsdxTheQKp7bKYqnm0xAWBBMnZrAAQASJaadD4P7rZgA1fi3khkm48
 OtUIaUDWl8SAkBbG+ZRVA/ngfGvutnFpzlcEG/JH8NP5ZGmRMF/RdubFJq6UWZkhFVq6nZdZ6EK
 etlZmzni/wvwSKDxJiP/rxAX5P3MqNufC78IBRnS5JzsAGguj1YYkcQMGTkv7EKp9BwIGd6NmUR
 GEcFWXkoZNfe7M/Bm7pSuK5G46M42UZLqvefyUeJwcUsSkKCyqbysZrvVqet4LH61gtV5M6k4Ul
 NvvMp9Sg+uvHopOP/oRG1mcOCgvIu5Es5PZJIIlYJZYL2IgUB5UhMSbMt5+RufQ8Dj76RCsVMiX
 TnVQFDy2MENYoG+Fs9zO54Iojo+8WEaJvSdXdtxOwK21T+zHGHP+FZyQdFx3Jw4WMunnxkFuTVy
 PMx6a/RAy/6QzDLVcZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165

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
 .../devicetree/bindings/net/qcom,ethqos.yaml       | 50 ++++++++++++++++++++--
 .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
 2 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 423959cb928d945aa3e758a3c803d12bd61ec42b..ad2cc706fa74041486cd90c3d0eb1dde0acaa27c 100644
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
@@ -92,6 +99,41 @@ required:
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
index 2449311c6d28ed3fbf8c92526ce8b872900653f4..6a1aea371c0b42ef71f90d89276e15159c3b3277 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -74,6 +74,7 @@ properties:
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
+        - qcom,shikra-ethqos
         - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
         - renesas,r9a08g046-gbeth
@@ -632,6 +633,7 @@ allOf:
                 - qcom,qcs404-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
+                - qcom,shikra-ethqos
                 - qcom,sm8150-ethqos
                 - snps,dwmac-4.00
                 - snps,dwmac-4.10a

-- 
2.34.1

