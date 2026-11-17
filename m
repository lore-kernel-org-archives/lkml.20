Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905188;
	b=Co05BFhIMpsaGK6it9x70nQBOOTkfEZfQqxx3+KZ5iY7zL8yk1dB6mpa0BPdfYojjmMh
	 OKvjlkrJNQI+csOMQm4oEjoNJr64wplYV9IxGZ59QduiFqRjnV2ic1pbBusLxmxLd+MUg
	 dPH99cBDxus0NJi8s1GqPh9Hfs9DnAj7TtXLsMM+vwrMhsZxxBcVbFPyGpVQjltB0W6pt
	 x0QKva5befLqyBZHnXiUfdhepwtiIisndXouFmS/3f34okLe4d7s+vQmuvonZfPr7DlQz
	 d+/Vrq/LqrcuNLjq2lD3hJxjbUAFromNe8WiwkABbaWHpfkx6EE2l7DC4wZEzL8U1Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905188;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/CONjcZjTX55AH41Bp0bQLrb1YEIFyeZD5sSZFFOtU4=;
	b=lXIMmOI0tK4/rLoWUo/fj+RsBywKRHBtzgjipk3c7TkhEdqgVuW8PI08MvC8TLfz6MsS
	 wzoUvHN9tbouEDuaJjLtDh/w9yh9DlJSaCZ5i1q3jSvfsmMT/kHvqiai0dB9MkC6IgZNl
	 W7X7COjEglgK6of8D/yAg5/9v0z9xOxOEfGKzdTDo03kx8b9XP3JRqTZyeXaA7dj5qBN7
	 Twva2g+S1pPL+9Dbw71HENmINmSCe8uPn6S4+Hzq8ctAQeilDTX5PqPmoha1dcsSLEkPG
	 QN/t7XIcFc4GhaV0BuMAfqY4UoHoCT4YT0DpuxKUuVRjDoJVLQ9gUZxPZs1ozC8Wiug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IyplU1dA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jed2xX2c;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B91606A8A4
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56B91606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IyplU1dA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jed2xX2c
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8jfqe2934218
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/CONjcZjTX55AH41Bp0bQLrb1YEIFyeZD5sSZFFOtU4=; b=IyplU1dAU8whWxwY
	15GN8SqxkDSjAlPmXp2m+6+oGJ1jjHOdBBEypHzq+BySvPA9zN9YAYNVH+8hvrZw
	iyrkn4SIXCqMTCKLX2Dsiq+J6oFlDt7SFxNl9432m8DTRHMdsO23O6eFgOTyaFd+
	ndP51GqFQD0g1xkUgHrvpHjlu0uG5jJ34gBS4GohoACtcOSHdwMKquKTtN9QkoCy
	HiIy7/9VmUwm2mSL09SeIB9GqKIFHjB49EXGWzkPmDdd2javXqY5zA1g+IgFzkJ8
	feHpcFax8BRKxbkvIKnyoP3CoOqDJ/LZkXZnZpiM104qSOvxGSHHvs2BDWOZ1WjB
	p6qLGg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m0a6xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:46:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so4605094a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905180; x=1795509980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/CONjcZjTX55AH41Bp0bQLrb1YEIFyeZD5sSZFFOtU4=;
        b=Jed2xX2cQ7crAuNxLV07iZOjmovpn/Iy/v9GT7nsSYP8ZykKmaohiOFHI5JuNs67ZC
         zdCGOaQVaDRZZ3+aMBB1nmlyLECoTsTX6pg0n8xBA9Irtus12rWh1s7aHdmSKZySTaS9
         mD9jKvB/klJX3EdC3GVwZS/anYAFAWD0wrbYz8VJPYtMz69ss2Xrr1qx7WTvExXfRfUy
         GKE2HGtU7ULlYWcdMFW/M8UKjZ7JhN7YHtyRyWbWx8RqSIgRXuqI6NLRdQBNBiDJQ6QU
         BO5520+uI75k17MbEM9oe/1CzEve7SEMOX7E1K2+qhLA+3HQ0o5yzlNVsaAEPtoFgmlE
         16sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905180; x=1795509980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CONjcZjTX55AH41Bp0bQLrb1YEIFyeZD5sSZFFOtU4=;
        b=uKSbvRQvAXMxoEVrhQFLgNo1baHmF5GJcnPbKI6XahTxvfANC8FyK+ARIVqvP7IlOz
         uVC2qe3z+MoRgKUenMD23mcud7qcbiGB39O5kBc5cwz1iRi0KFN6GVo/SpsTU5GuujtV
         JVnVtEsrkdTNoUcFvzktOrgY3KPcJ4IqQU/A3ZwPEfvYRUVOFSmUWEZ6J1CmMKvGeNdt
         U8V7jZIBmgDo/vbuCZMg5se1gsHc/cCH25GHHLViZh7fNqAANoXlsZSYTo4VVyYIPzhp
         LzFooDtcfeMzacjPnrAUHacKb3CWh2IUCN29P8ElwdPDzaDFbYvd3Khnxz4l03S/U6q5
         SaoA==
X-Forwarded-Encrypted: i=1; AL+hErHIL5d/QZXfHR8+Seb/j8YdDCyPiI+6d07SIKIVqXBCZ9XV8gopZtKbkQ4vjGLSWKQQZ9m2NU0oK/EAF2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fKFcNTsKbwKWO+KFl959+GyRfOB2cApl0oFAfiN3d12eTh6xL
	9NkILoF7o8nr/RxQeW2yWgepsjJ41CORbuTU0UMaSc2Q8GNzMCmsfIYUUDraYvBWz128gAwTf/2
	4y8GzAKnUlOUKQ8NBLhuRp/bS+e+43hkOS07TbNU63HayCk6RoHAWEPZO32VZzdc0PRA=
X-Gm-Gg: AZFdTZe/eXHedH1KvnD5zoipzQGeV1y1EG45SVrEuqIudAnC0e4lDV/bICAmEvnT6mV
	tZNg4zvMgUvVZWwgtXOPYmjl9XH1L54LLpXVV4vNMRAEDN7E36++iQcU0GPkAGjNjERA7LnIFNe
	vwkt9CrPrbHKkW+xdB9jtJ7QXezfF9P/7J/W0YxUBPEcrkUjCFkxqX9YVSKstMt4uFm1dPB0GO9
	kLMqAfyqxm5YtCVqMzoQbm+wVwq+dwQTolVXC6Iz5t9JFHjVHDO9/TA70Q7p8I2ruyW6eCnGWGO
	JXVq4TrSxbcuOy/eJKMkc6sJoIXCxT1z3qkz1hdQBx4Tbuy8NyqWMSIX2bAwxs5URDLralhee7W
	MnWWmPbdAuJZP3yROzi/ICJyAfdLMMUpZobC3zOBlSH9E7/0LoVcOvH7Zau2qj2l1drOL08OLc+
	J+2A==
X-Received: by 2002:a17:90b:17ca:b0:3b1:fad:b1bc with SMTP id 98e67ed59e1d1-3b1b0d77ad2mr13585187a91.63.1794905179728;
        Tue, 17 Nov 2026 00:46:19 -0800 (PST)
X-Received: by 2002:a17:90b:17ca:b0:3b1:fad:b1bc with SMTP id 98e67ed59e1d1-3b1b0d77ad2mr13585149a91.63.1794905179060;
        Tue, 17 Nov 2026 00:46:19 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:18 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:23 +0530
Subject: [PATCH net-next v4 03/10] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
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
Message-Id: <20261117-shikra_ethernet-v4-3-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
In-Reply-To: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=4189;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=GRQtM/wcadv7R+zn5eLlwrFMFCKwmZZnZ+Dq1EyLMP0=;
 b=vXb7kOSstG43o/q3shWkjmBlZAzBQVH15p6eBFVgAtPSKoZkFBlueCr7u5Z34ABx7iod2hFj5
 ZEVlUNAb9IpCpN3w6nDQ5+dEskZeeF5E3loNHtTG+i15xoo7wywUdzB
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX+dbUwGd+TJ09
 pEwIzZWGZgvEFFKpIalzCkg65KT17/c5o3yMwZluVksmm2CQBsT30efOBbOp0KqaBYcGL3mi+ia
 orwdAZSJ9N5FFhKX2t1KotJki+JWD6E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfXw3ds7u1g7h0T
 6IszcKYL4PA6GvNb62BQJHukMQ83upWCbZYXPubHGFgE6cl7ZwugFpFTcSWViP2xnqgQnRtP3AH
 bb8iaFQiRR7koALAd9T6m540JmCTlQ0QdUybNVHBq8d/rAGmmjUhCipl7o5sVYCmuT7VGCf72/s
 7cqPNLdY9eZbleXYyESFT+xf8TJLvVnafKt3kwD/Gq5O7gNF2d5zRdui2L+j+AcaJBuz7NvZRN6
 y0mpTjGx+dgP8GBfm/1bA9kL/OvvbSz4erEboPFASNKA3ynfyMZ8KsPGZW2XJyZlMZQiSZDARLF
 Es4P3zuKwBKG5SDx5v35d2Yt/FVthOFcxC8aGNZCRXEfPzHWZGgsQyY6i/Ch3lNlIjWg93/DOcW
 3NrvsB1UWU6x7IM8Nj5bRvpBkP6TrlqI+SPnF3HguDRmCCpkqb/EBaiA67rQ66zXt3vrp8KZF7P
 7MBWhEFQyD9eVb7iP+A==
X-Proofpoint-GUID: FbKGKEkuoR8Q-7-WQ0L84uHAwiwHjh_x
X-Proofpoint-ORIG-GUID: FbKGKEkuoR8Q-7-WQ0L84uHAwiwHjh_x
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc145c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=iZY8vWlYZPOy4iMPn4IA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034

Shikra's EMAC requires two additional clocks for NOC interconnect
access (axi-noc, pcie-tile-axi-noc) beyond the standard four, and an
OPP table with required-opps to vote VDD_CX to SVS when the NOC clocks
are enabled.

Add qcom,shikra-ethqos to the compatible enum and use an if/else
block to constrain Shikra to exactly six clocks and require
operating-points-v2 and power-domains, while leaving existing
compatibles unchanged.

Add the relevant compatible to the binding document for snps,dwmac as
well.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: moved operating-points description to the top-level, and added
power-domains as a required property for Shikra.
---
 .../devicetree/bindings/net/qcom,ethqos.yaml       | 54 ++++++++++++++++++++--
 .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
 2 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index ef520f810577..6bd4bded650a 100644
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
@@ -81,6 +83,14 @@ properties:
       - const: cpu-mac
       - const: mac-mem
 
+  operating-points-v2:
+    description: |
+      For Shikra, the OPP table specifies the rates for the NOC access
+      clocks in "stmmaceth", "axi-noc", "pcie-tile-axi-noc" order.
+
+  opp-table:
+    type: object
+
   phys: true
 
   phy-names:
@@ -95,6 +105,42 @@ required:
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
+        - power-domains
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
index ddfc32ba29cb..b6555ada21da 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -76,6 +76,7 @@ properties:
         - qcom,sa8255p-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
+        - qcom,shikra-ethqos
         - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
         - renesas,r9a08g046-gbeth
@@ -568,6 +569,7 @@ allOf:
                 - qcom,sa8255p-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
+                - qcom,shikra-ethqos
                 - qcom,sm8150-ethqos
                 - snps,dwmac-4.00
                 - snps,dwmac-4.10a

-- 
2.34.1

