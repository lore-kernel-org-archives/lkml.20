Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBD547987A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246438; cv=none; b=QWuOGe5W5xg0/6BX7bZZMiGNvBYjBzocU4LYCOBuAlHZUmuOn9+wY/6ex1umJb+CrhXm9ZH7gw2U1krKavYRWhr6kwu8ZB9kDF144Bb4VPYEc05khZFas3g/KNG54uolJa+Y+N890fHiW9u0a6eEtn6VW722UJpY8hG2Jz4uCyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246438; c=relaxed/simple;
	bh=w+F/L0RFFh+ECgFNEgo5q1yxXBxP0Ei+IXHNkEnJ1wg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ezlXpj18TAxu8E9AB54dklpceavJb8AuMpXyrCVHEEBpUVPj3vQgyZkMw6Nt+IS/7ouHpxsBLTMpofgUD+m4puaZVUqdHahfYe0EzE3W2JKIZMEEHWyeRwAJlhx2Zic5wFRgOHcZ+/aft7gsNuaD2T4hv/X9mmWUE1Js1LNfbAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwkJZf62; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMNAXAZh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwkJZf62";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMNAXAZh"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9P90h1923773
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LG8qC4gs19FaEQbblWXYyFPfott8oSgzgeEW7h6zd8I=; b=dwkJZf62E3+hkDUN
	PO39fyd27VYTu0VVH/vFOtt/YJsyIvPjTYZVwtzwSEWtI0kcxP+ltujOZx8diGDx
	0v5na8gAI4fXztLChJjgE4KqS3bPa/L8t6mFnLBO4zF9lMy+2Z8YV7t8hmuVPAIQ
	IqBVlp02ou0eXETc3/cVW6/L446AQcVLqd2ti5leQW8D6y7Cpu0LXRn8Hk2ZAnwh
	S2PdNsZ0cVtm4qyruoTKqaesJFcQrvNnh1ksE6q5NwEGEmZyWfPJf9RyEgoAI/m5
	WYKFJikVpLVyF3bB2jiE+iKyVcp4irn77UCVin10w1aN1PtkgNhPaits1zzJ/9QX
	8eScRw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ah5jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso324243985a.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246431; x=1790851231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LG8qC4gs19FaEQbblWXYyFPfott8oSgzgeEW7h6zd8I=;
        b=AMNAXAZhx3mxu/PNN6UGxRePUbYvbyBBq/wRr7q2SaNLGTS1erzvaX5WR20mhWnPan
         OQIm5aaue/VAy2FvUBWCAJgrHPg8gWgl/a6AzC1lTM5E5JY4xIdISvW+siPp570abn3b
         dUq/0/QVv9Hk0mdqEr/Qy29ag0v7e8/tHkqxCaVbFjmpbQST9xNX7ZzTUQooQq5Ay8Eo
         jhsMrqVhpQsM8PvZQJC3+FGzILoOc3SE1vfr4V9Xszv6TnUiaIHl9bhmkGCZzLTxCF5o
         B8yWA2Xd0auw8DBR8SGgItXVNdg6RTTT/snlgMTgx64q9Sw9jFbRdifZX4dT/m3SHX7t
         l60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246431; x=1790851231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LG8qC4gs19FaEQbblWXYyFPfott8oSgzgeEW7h6zd8I=;
        b=SI267FhBHH1QCI4l5TAkXGpBIAEYCenIaQAZNyuCOBNgGxpoT0SudEu86xcFzNeTn/
         PVcpnWGU5jgV7MLFAiDoTmvSnvQfoymomNsxYhgtcM2Bw2+Tm1WshNkw/zJKxI0hqQ1G
         N72LsyWjIS7p+gjjx1/gkPo+1EtzBjOWYUI/SZBH0Ce54qB9aARsnP3gnXMTG3ZlG0WC
         0Ed1ifeuA5FTXyhc3qLYuqW/1zKooBhIWqD+FXw12/Wg7MuiqkLtMZP4fJPpfbYl5bnX
         IdBl0TA9E7wOvYrW5kY+kc86pK3S1/lXcExUqQjAKZ/WJ+q5vAzqKJKLpYNmvVxfICH2
         NtIg==
X-Forwarded-Encrypted: i=1; AKwUvBxXrc8uKXoOZJ+ZVcMcYDSUoTdpmAacJ+j8JitDcCxid6bNo9W/kRmatxR11s/Mfc+4EDWez6jp8mEdbn0=@vger.kernel.org
X-Gm-Message-State: AFuF++l5CQyZw83yOY/XE/s2O7D11fsqdPjMouvXGfX5gypgRVs/151o
	NTAsgsK+6wJU8kpRepBBoN+5DI5BZpp10vqSixQkze7FBAfyb4qPLuk6MyKIsdwY0zbnTeP6Yj8
	Up0U2V3N+GgnPRpYCeYSIq4Tddit9UzuVGypshwq/8R19J2rBmisViZsXSQqfHLXWc1E=
X-Gm-Gg: AYBFou0WgntFBpy0CclEscwybp3ptYExkh2lzWFqQwF8TT70/3+OhjwDEfxx3YM25QN
	xl7jEkmNRQgFwzyG0rbuP38ZiJNu+Q0sjlEXGBPv7PuetufjHPqX+WmbVW1xKE2AvpkL2lXuJMe
	m7qohtXrBfYtnAyl3m1FDUDy5HArz1P8IEok0XNxV4WKddOBRqfliwfLp29PuBGd6UvjRMNWVMk
	gWtl9DCis5NBfOBYDd4fHh4XQY5ATgDukCV9KyO4Ayiv0dCbB6rWpIdcb85fzCQv656MgSYvKxB
	2Ig67nbCoctsaOPyfhNJ3UgoezwKnfaopQio99EDCL/cHEwDJqxIfDQOpUUCy90kxfoKPVMwVD8
	dW16mXQ5LZmyxSGTy6Ug=
X-Received: by 2002:a05:620a:4543:b0:93b:d7a2:83cb with SMTP id af79cd13be357-93c36411a3emr221617385a.58.1790246431396;
        Thu, 24 Sep 2026 03:40:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4543:b0:93b:d7a2:83cb with SMTP id af79cd13be357-93c36411a3emr221613385a.58.1790246430805;
        Thu, 24 Sep 2026 03:40:30 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:24 +0300
Subject: [PATCH v5 08/42] dt-bindings: clock: qcom: sm8650-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-8-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1797;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=w+F/L0RFFh+ECgFNEgo5q1yxXBxP0Ei+IXHNkEnJ1wg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3hI/hqnXkcEGcYY08shENSfDTfjt4PMQMeE
 zH96i5RZ3CJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT94QAKCRAbX0TJAJUV
 VvISEACeiFPdEHQeGPhk5Hm3zzxleBRHKSG7ZXJvMsoYrkkGwtKOofDIc5CFQCHxhzaDI2mgT6V
 Th8GV3RXUC8LaGJxysMTP7KQd5W/gJO3qhyjPyDxwfcNdzGvKM30n865+vZ8dCMjdTBmed6wVt6
 4w7HnjTCmbNpBGK3nT5ylOBjgJYJ/Z1AL0Wu7LqdeBuEdOaXYHPDipa3OA3LvujYWwjszi8I3Tb
 mmxjexTTFjVaMjkVj7nnK5UdsrQAAzIuL0SQcHd2oLTKjtT7geXwL3Q7bSfThG/Jz9+D6Ip0P6+
 mvvZsN8HLH1vUnFv+dVKEwY6JfmmR9DN6Wd+9q0di8pFWpowJgkmFeYoceaKpBKUl0fTpG/tx4D
 qNnsDouE/kCeC8pSEgtsLRmvICYUgoX/WP7QPnnhsi0F9J2uhCLymh+qbQhkaqMWVJgrcikhpzS
 N3OSjqZCsw8qaIb62LFW7RuXmrj8l6F9/XnFRjJsCCNRVq7E5gf+Ed+iFy7ZzDOuZ1Q+zgSOkdZ
 sI6z0ovk597np7f4vEzFTgXxJ6IEDtLZ0K81Emz2iM0GGhQoeSs74Sj3yywMR0fjYO1inxxHkdW
 ljrMMWRs0CcY00g8YCWFFuG/QVcB0gq1h89qzCiCY7ffICQknTaORTmu3O88uFqjNV3Awz8lHbk
 mkDPn/AGmx4fHKA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX14aVJQoNMFlr
 ETJW67+x47xxbxWVsrDLxIGkmOu2C1a3HdypUQDzFahJHfjVJy8bqplDn3HPdTr6YPXwK8J3CLf
 ZYHRX8xhMatW0E0opO+54gJhTHcCKeQ=
X-Proofpoint-ORIG-GUID: n39vy7Oh_cU-q4osbqCr8ETChBlRK1Sk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX2E7BgGaWNI27
 0woBCUrg17V6Tq5n7sEOrLiJ+2u6RlTqPTCogHsNMTmMiOYEqiRnH5PflbJKX8PngQWJkB1mg8b
 6X3TYOaNdY1y1K8yPrCGSJJobwGOCFYQ9x0cadmJPYzM72PyXfwyubKlpawph5rwNcWKtLlqqDs
 MBqrYJkXJVcWIP5XMHtZTjmxJX0FUmxDQAM8guDbRQM7kjIT/paob0Ho93J4moVkUSPDJSE7imZ
 5zXhT4mkMmGkM8MIcpqALpIoIAD13oVsicKV5VD96IJ1DLQGbzqm93ErLPa9bRyff0ql97bOTD2
 psZJT7HLzt1QiGsWJ7Vcq+GV+OD7PLxEf6X/TUvBztOnlopZyb4PF9sEq0dBkgD5lzgjrm3A2wW
 4fxdcM2RpIz9guaBo0T+RF8yMkZc8Hq1G3jT0FqYHmIESXNxTGUVeKNTth+JBkjKwOsk8CZTk7s
 0ohnWIiNjrKfApFZSxA==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab4fe20 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: n39vy7Oh_cU-q4osbqCr8ETChBlRK1Sk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GDSCs provided by the SM8650 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
index c7143e2abc80..543105b277d5 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
@@ -32,9 +32,14 @@ properties:
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
@@ -45,6 +50,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm8650-gcc";
       reg = <0x00100000 0x001f4200>;
@@ -58,6 +64,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

