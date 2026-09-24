Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB39D4734DD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246445; cv=none; b=EWxPdAXaR/tSpYHehsetgbh4zTD7LD4u3850PrHzhoWqu3rglBMiw1XkCITAGlVK8WyM3PssHcgXmuVLyNBUpH5tX8K0sA5qBo8UrwPAUbgwsVX9B5dtUT7IdgLov8WZ4zCSpq0tYUKbubEnRjLqMi3UpVLGhOUWSCyWnI1fhaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246445; c=relaxed/simple;
	bh=QqYq4mS2cTiVpxepHjUJZ0e9Z6UKHqHNtGLDWuTNcQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HjbGAO3GnaHWxnx2bqMYxp+3o9KKgHUPzAmoKTp3XQGIE6NtjZlbw4OeHj0rRJESHpHhZKqho6UGxXE3VfYQ2nz2bwu11mwoobUPW2Ign1IVzSOAr9ggLL3uvNqZucP42DjGRXA8zJ6E5QYS9KAJ7g9G7z+lZcjVDrHr1nvJjB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkPMMyJ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EHbsXa8Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkPMMyJ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EHbsXa8Z"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PBjv1923912
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3dNqrZ5j1aJdpahIP13rxuzMwfw2FTeNK+1X0Bclz2k=; b=KkPMMyJ98qvzSNZ+
	ObmEDuSY07TqFezmkGPnep0uk5f3z6YddUTPG8+tLezjDobAVanOkXTwObBlKmqA
	Q9E0/VBLoRx36H6sQ4ct4JRn5wbvZzqNl2l3C6b3pqNdPP/HPYOqcEFZykT7F6Kj
	LwqTst2kr4ljl6C9JxeCpksWb8E7a6VXnDBaxgvEDWfLNiqqXbEgNn7S+HJeHTAv
	4byuVdcB+JjLJMwHIhNViu4ufW9c2KSX+Ka9PZr8/BhUeeU56P9DehdhYoClJuQj
	d/F/nTIivuo1Z0GD2kkjZBCHtGapr3s9KTcRPMFy8tvRDrnuh9aTC6I7FS8X2jvk
	5YxoeA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ah5k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e8135d7eeso30607336d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246437; x=1790851237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3dNqrZ5j1aJdpahIP13rxuzMwfw2FTeNK+1X0Bclz2k=;
        b=EHbsXa8ZnrMuSX2LT0UGNWqR73zxrobyHvp5Xp7t6HD7fSB2LEK/Nyjw0P8u5pTVQR
         jRE956ETD5LZY+8OJDhUmF4Q4y6Qq7ocnv8eoaY1a3qn75exrLJLorbbPr5lR0ksg522
         qPwekSGseOHWiskm3MIUpMGhszIV1lElIiiAKUF0ZUptjKS9D1N7YXW43fA5xU2VnHGz
         0hFBkZWgykRUGsIJeFuu2+LSA4P2HUw+R1SbLr+tCb73/pBnNnGajAaCROUH+o5XeW+A
         VNqzh1X+h7p8ox2Jv1orKDVNfC1wjVKg08BeaP9PTBUQdrpeDEi6yYy5vuQyODqY/yOy
         +uAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246437; x=1790851237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3dNqrZ5j1aJdpahIP13rxuzMwfw2FTeNK+1X0Bclz2k=;
        b=GzFgX78fa4FwTj8zxFlo6vcBZdnhBS1/icRXmGThUmrkTp8A7Z8Sw9ea/AE3JQt+ix
         9WxCXZUaT4LTKKqpiXs0JAKJDPayVS2a4jkq8LXMKspT+6GSkaP4qacst1R/3xgOdqeR
         AK/OProOMUw274K8i5tWDidFCxXPsW3J154wub96ymVanDQ7uUgNa3AREadZPNd9azRz
         8PVJLnrjyteMiMz+boX69/ZOnyiXCj54X5Y/nNQA9R8gae0hp+FAcVws37QA/yL+g3NQ
         RRt/dDgn+ZIAxzuyEKMXyoTZy8wfhCrfVIW8t+EtcyX4UKQuXKFccB9AnshxSE6c8nmW
         1mfw==
X-Forwarded-Encrypted: i=1; AKwUvByq9Ae50Sy78HAsGqPLmyf3RzS24o1xYDx6jWLPj8zBl9qDWCrsTiw4psoYVq1cjJW+BM97MdLjG81uoA0=@vger.kernel.org
X-Gm-Message-State: AFuF++kY3jbJLYvKf+mQjhqYYbe6wrlfzHuiWNkdb0jNWJIwoxxKxkG4
	gnnd71sZDze5nlrRu/mzBrg2vMP88OgHp5O19E0+NUPDp9rb80c8FPEWrbHgbxZ8TPP3jwC2f0Q
	1Yz8+iGP4wr/bZ6KJIxmaWd1ENSLEbF7xIWNBVFcvInbWX2MugxeNBvQvZdGW4Nex6QM=
X-Gm-Gg: AYBFou0ZzJNBShsdsoQhIIRg0EFvTJtcjwP08NLlc2yhdD79bRdqk9tBPKMR1SeKZwr
	Rtnu2dEhO8k/2PbAWNjl1NltrFKLqJryqwpnjsLCMJ1yxhl32jXUZ2b0Wsa+VlszM3ruCaJdDz8
	siawPL8BiTPteTLzZkJQZSYyo6p/tG8ls/lCc0z4CL7JPxkH0DY0fiLfjLfDp/ZbbcvIAgHwaZx
	FGanu1gVgNtT9N3VdPe3yJegEIzYkBJz34vl1xH2EWzCoN1wWnR4Xbe3+kpBaNEVzDPg37dlNqP
	9CSelgDJSlyrOCzLS0dgLEOyDkzrIws++JmfYJT9zwyVzLmeh+BcqHie3SzRwehYBMuH1dCC/ov
	kOB5fEyF/
X-Received: by 2002:a05:620a:26a1:b0:92e:cf8e:67b9 with SMTP id af79cd13be357-93c362cc649mr211533985a.21.1790246437002;
        Thu, 24 Sep 2026 03:40:37 -0700 (PDT)
X-Received: by 2002:a05:620a:26a1:b0:92e:cf8e:67b9 with SMTP id af79cd13be357-93c362cc649mr211528385a.21.1790246436334;
        Thu, 24 Sep 2026 03:40:36 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:26 +0300
Subject: [PATCH v5 10/42] dt-bindings: clock: qcom: sm4450-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-10-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1826;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=QqYq4mS2cTiVpxepHjUJZ0e9Z6UKHqHNtGLDWuTNcQ8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3jD3Fy/Ina7D3XBf5LVuV0mmm4CrMILji9R
 C5Oyvseqc6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT94wAKCRAbX0TJAJUV
 Vum4EADMOSTrQQ21FNCKfcVAzmhYRyUtOXOAB0BdABPK+sRSf6+Hm6X30lzo6F5K+Ctpu1sRoIs
 J8ORU8aB2I+DcKkHD4HG2gD6FbWAXCWbu++WLqpdCN4GtsrZiiMpRkHYRgswzKGba9fyMQpmrLa
 ognGl8p6+Q+nScqQMIqYMtX5oklVRVLMm98YfxL/3d93wacgX1S/rZbRyxP7finIYyMckLEH0Th
 Emv03L4f3b0qtQu6Bv4ifbSncDqjzBldOH/rGePwCO9lcI4mqERpXcoM0x93O3LJt5REXPCdgew
 my1v7KPHQjceWFiZUYs8IXaAFH3a3LDMTN5c4sfm67hMGI6ZArhsq2fK7lnjFM+KL1+MLBH6Rf5
 UGdiqMGF+GVF0zmPLkDH0FSmZOhXZnJRqx/O/DutgP3cJSUYFWaqVL7GpJnJi+OB4bExKLe5ZF4
 Orv+ZsDMivjUQQ3GDg9LTDLZxPJdkNsoCusKHn6Owl3W9fgYb+8IobeOkoH7kG8yFizFlmnNB7V
 lrQOFkI5dIg1xOiHQxQ73kwca7WYxm+X3qN4JnTg+4ymqwsyNP1MKUtoy71lFoXyHtnqXwnAdQy
 hvu7uOkMfUnVnoZ/bF3cjhTQdro9w9NeLYAEo1HfnXGS/HEbstbjLX6sr+TYhcIB9Nnf9D+6Ftq
 bHxtNwqnZPvoDvQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXymiXrUFXGrts
 IQhMxxZu/VznEgdVGRbGFCFjayTmFV6R8vAnULpFccWgWjE89I17lRu8jxkPCcq+MthQaAw+pIk
 8xM1ubiqCfsQWODVXGo8SQT09QAokyo=
X-Proofpoint-ORIG-GUID: N8VNRQSvCc7iobPE22zaQBNGVwQy8HyB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXzQMZqMtD486J
 oj76uvDNG836oRpqa6XxBW1VsxLj2H2b8cJetnAZP6IVXKVoA1gayYA/+G/1zhHjrvfhbbFuskJ
 Cu0RzF3OBpg6JSsOY87z+euG8plgQliNTJ8WYkaFg2ndm/dCdvAPdaZdvFKzJLLtLT8gzRqXj9k
 KzkErTwDo9RGpoiDhPKOorpW+fEzlPsxWwJrqU05SyG4JPNDnM7EVGFyVIVzQgrgLGYXiZ6XrZT
 IL6PoRoovHLCM8RgQmAUwhQfW47P4WBn+EH92AVUpzKkTKtJQxXn6geWqcYDzlQuMq+xdYP7DxZ
 nVPHUMqdY9h6k29UotEIOMvTjSU2sabe8QHsx88DEjqy2/FvIiJk2Q8ST5E6rHhQYFN6PGcFzM0
 BDgBAlqRB+e635Ea8amwJd33tfDbfQMmADUah8bRlHFZ7GVNF2l8vwtX55+1sDbpzCXHYeDoPA0
 FTaEXtuUoXISuazM/0Q==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab4fe26 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=8nTHk6HmgCSZk9Niz5oA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: N8VNRQSvCc7iobPE22zaQBNGVwQy8HyB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GDSCs provided by the SM4450 GCC are supplied by the RPMh CX
power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh
may undervolt it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml
index 9cfe859bacc9..e143300e7be9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml
@@ -29,9 +29,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
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
@@ -42,12 +47,14 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm4450-gcc";
       reg = <0x00100000 0x001f4200>;
       clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>,
                <&ufs_mem_phy 0>, <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>, <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

