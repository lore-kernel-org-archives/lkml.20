Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21DD47DD7F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246450; cv=none; b=LkqMo4TvldWccibrYu6V+65EgxdqZNh3VuCWJgNjuf0xrdigxMs1qbBYsGQGpN9hQULtyGdRVSkvK80l3dfjIBOhyUZZQfASji1YO9UNUfIQtU8PuWsPrPt3TkAZRcfV+SZztC1XWXpmD3BiWjkWQjwNBGJbRSEhsmG62aUqNHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246450; c=relaxed/simple;
	bh=NWMd+DqbZOzQAKNtE/2aEsfe301Dt8pJ7SgbBO02K3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BFuL4j+5AQpI8KyGHz8aaCb2KUk0xA++n019G71qppOSS8j+jghuEAwwgVnxdvgkC65rGMN1HqoMCJWRJJ0WSnuOjU/LrfIdowP6GvMZgNAQ1OrPDNNV7mvRKZdRHlJsmP0iIn9YtuoO8Hd3zLwcbBGUJyoWOhnE5g5ZPVdLmK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uu4NEgXh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQbVDgjO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uu4NEgXh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQbVDgjO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PDT51923949
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KWCB9Qky8dWdJ7gszJJaDezqu3VIyPrxhUCDshmp3G4=; b=Uu4NEgXhke8dLWsQ
	9v27GRmHnWK1rWov8wLDig5+IFPFdb3gxEGwnDnjhRTnMT9Wj5mfRS21aHNzCxlV
	wKtkLoP7cDyWfzzC1GHkpawX4Ke8osr/uOIRasQro+bYbT3DB+9apVYyvG1nvgVt
	VxCLh70WcU0y3Y/qUdCAJWztkNw5TXOOO17YW0fJUZBBWqkP3Zpw0TpNp+nEdJ4E
	6nSwr39C9K9UioOx8/sVpOvmck0WdCOhkTUTzTaQtqJBzLqURmiW+qSMV+3cIfHm
	IYR8L2OBWXUkvmZM7bydgP97DVG0Z73AjFoPRgraE8Kw7kmQ9RvcymJzMjDLkjQ2
	2Rx84Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ah5m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so433289885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246446; x=1790851246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWCB9Qky8dWdJ7gszJJaDezqu3VIyPrxhUCDshmp3G4=;
        b=eQbVDgjOTFNvX1GthJg1qDj+yOgO+H3hhVnAecSoIPFjXVCumntgR3o15jWlKGld3t
         +rytTxXi2IcMQYit7cSX+Alp1UKuzPqNtQcMoU+LJGIrqqzZCn2HLosNAT3E19xQfKLB
         mnyklP6hGFPPz8jxsMHHATzcOm8M2A0TtLnLq/Qgp3uuEidqxOVg8tmQGheueyRFpC+4
         I4r6ItySKw9mLgfRLu0h7q2OIP4Z6G5Aiu5sk3NQTIOECQwqJdm5ssL0Vwj6FGDCdIpL
         kAUj9rqPSPAS6MWm0x+yloFms7s+mHGjq+Bwg4L/8FDChQcO6lTbl+AZ+J+O+SxuQPqz
         ANAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246446; x=1790851246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KWCB9Qky8dWdJ7gszJJaDezqu3VIyPrxhUCDshmp3G4=;
        b=QgD1B6XkQryy8IJqTSjOXboYpeTWZ1WAsOQCpp2goHCwlzsxhaJg2No9parAFEyfa/
         u8ZByT6FF7hN5m2NkkLliLRGyT5i3Dx6qN8L/tYKBFftBDlSd3pyLTpyhSELf8Ej5ny2
         Sn0UWuN/veCbwW+R6pc7/rdq/YffmosnZEXE9b3iSJda8oVvfQ2cKPixl891J1CNVsIX
         vdodCwiehh3HFFBhiY0cyVVcpU+Gokvg+5QyTmaga2p/GRjHlBfNTjBu2a4ATtu9BHDl
         WQOBHgkeiR2iZGdjqPy0l9s/HAwaOwVkRPs/jujvO9eqfulSds+fYiSMzeRT57c30Bli
         UZEA==
X-Forwarded-Encrypted: i=1; AKwUvBzD9oV8TzJP6DA5c0pR5DvqS/VupnnEETIpi5yfLO2s/a0D+LSy4aPEuX/vsCy79W9XJ0I8w6s5T2FLjeA=@vger.kernel.org
X-Gm-Message-State: AFuF++l+DCUVkPiyPtI9LBmWLNN0Gmb8kPBLtFybTIPATZak9nboQKgP
	SOj9X4KywhA0gPh72yO8u/pTeYo90Vm1K8o0edcN6gFqYIHocEBO88SYwQRfN44ppnx0JGLxWax
	ANsje3M4OepLBnGLf4kti5XZEj0Rl+VuFJSSeCIOAxEvE+tsxdKQ4NcpN1WepNkgPTI0=
X-Gm-Gg: AYBFou3TZ+ZmsteUwxnORdcr4QmSNjj7OXhKn/7SAUnP/CRupSNIYayqaP6cvSj5aBo
	S2aOmyt/ZHn4g5CL9LTpd63sDRC4L6mi9mthkZct36h1Nh0kYF6gESfKsdUW9IyCJbb3Jmjh+Ik
	Mdd9xUNFnoqlOsx98D85v9NWqKuln3+misEQK7BGLsykRLcBria5qEmjKqR+Xc35tHNy3pr4Sb7
	T3t8w8kNm/pNAPQOBVTcK51g35lKMEp+UXRJUFQNg41ne+27ajaI9E53fSuJGFAUD7AgBf795mX
	T2+Ow/7kjeU5S5XPwTHhrL+khDadysoe2AJ9jWIR+32rwYYZ7FoubxU+mvOuhpst1/pI0ceCUiZ
	uYWv7gbh1
X-Received: by 2002:a05:620a:4890:b0:939:6a:a71e with SMTP id af79cd13be357-93c362a6e78mr229985185a.21.1790246445803;
        Thu, 24 Sep 2026 03:40:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4890:b0:939:6a:a71e with SMTP id af79cd13be357-93c362a6e78mr229979185a.21.1790246445099;
        Thu, 24 Sep 2026 03:40:45 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:29 +0300
Subject: [PATCH v5 13/42] dt-bindings: clock: qcom: sdx75-gcc: Add CX power
 domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-13-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1946;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=NWMd+DqbZOzQAKNtE/2aEsfe301Dt8pJ7SgbBO02K3Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3mFdn7fjyByZ8E9iR3trdYh6+oFwBSKF1Bt
 qty+6t+P0+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT95gAKCRAbX0TJAJUV
 VuDCEACWmhRZoCCU/4TN0tUAi23VL13th2JnS3gIGdPvnMjLuZqcZdjDinx8I0pDsPy0oBHv5YP
 WsxeMCJlQFBn0Uxg/aZ0OzX5RoSY4UYmBsr1pygy3RmE/NU4S8EHVHT9y7y3XP8nZ1ZIWATBWHY
 aaQievPn+mh1LG8CaD7NZ1V0MSQaWM9AY7TXRLV6o7VJKwfGD6hP5Ro2yA2yAJm0G598jIQPvvB
 iTywxxKMTPcvz5gT7eYJsqKE+52nPwjg7zHfmvE0EDjMBS2Ky4IwjiJcQUom82UyT9jj087VnHx
 07FK/gfmrS4vOXHhQetnYrmoSrQZMnFR6UEZGa80JCIeIcGpyiw8uyYXhGvURJ785L155Y6BhLQ
 GKeCZZd9uAdz0c1iYXzcn5/Vciy/2EvWDdJW9Rmpt4TVBux8HRV9+nrSJrFgRpjPpWHlLs/+mXQ
 y0Vu3jwwfwpLrsvTlky2dkL8axt1IrElJSyAaSy4pNel/xuzaiOeCgugxJNIAs80VODd52Fz1Ss
 Q4qQNwAwxvpaCm4jPKaBSrGqRvYzy0kDsiA5FNAIiCJS7dwo+Vpt0zcJI8GtZbz28JQ/Kxq9FZk
 0An1D44tPhy31+8wLOylaEBwLYQ1KQnnxMYum0qK78GWsPXB/ukmz/NHfJOOBoCOTt5vdSoenA2
 R0TalCGiRWAdvqg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX+ca7+/+9jilP
 zSF9rh3MlerKXZFqzdLX7MbWBZTydgfxitfEBfc9AdHAq7bsJeGpgFpa+B1nOl8zu7AhrVw5nwn
 P6FQEEvCMONLf6bA3pLffE0zF3QuzvU=
X-Proofpoint-ORIG-GUID: 5AtJcqvnL4IOAurn5X-WqGhRHMirdFfY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX4NmKBxI7gFFW
 Ft13RleFG3HjBVf4x/ikoE806ECVE0A/iJ8/RIfu332yx4ViXwBi8XZbKIftaFotr5epAwVnQkc
 Ua1B3EbIcKWwzG2yr8htDmJ8cmQCght3v9MXxvsNuqFIqXxGtHILKJgufzJyPVfyb50pcC/Nhbs
 W+3n6oTDzeqQYM9qI4wbG3EQEJ1iM3x0zNguBfignFM4pnzjX2N1DW8Jq5oAWh9htC/G1su61Ta
 u82k4D8136EtOwCtZZAWIHyw4yt/gZi/Dm9WNsf4dWldrvZVk2Bp4QOvR/JrJtfFkxl47TxSss5
 isTtNBWPrJ1+RX5vfCgDAHMp4hyBHRHs1ugVV0nSCoP2adJ2Z9jnKWM8bFzTB0CAu4SKUA7U64k
 YORUB5C7FW4/6rteaDwW/2Aj/h24spA7N3foFIae6twOYrmpRf3dU2d3JQ3htqBRTgbUjNM61qd
 nJKV0Gly//F5utCKT4Q==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab4fe2e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 5AtJcqvnL4IOAurn5X-WqGhRHMirdFfY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GDSCs provided by the SDX75 GCC are supplied by the RPMh CX
power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh
may undervolt it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml
index 29a0b29bcb81..75a38e9f3248 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml
@@ -38,9 +38,14 @@ properties:
       - description: PCIE Pipe clock source
       - description: USB3 phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -51,6 +56,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@80000 {
       compatible = "qcom,sdx75-gcc";
       reg = <0x80000 0x1f7400>;
@@ -59,6 +65,7 @@ examples:
                <&emac1_sgmiiphy_mac_rclk>, <&emac1_sgmiiphy_mac_tclk>, <&emac1_sgmiiphy_rclk>,
                <&emac1_sgmiiphy_tclk>, <&pcie20_phy_aux_clk>, <&pcie_1_pipe_clk>,
                <&pcie_2_pipe_clk>, <&pcie_pipe_clk>, <&usb3_phy_wrapper_gcc_usb30_pipe_clk>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

