Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4AB47607C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246423; cv=none; b=iFia5HE3kE7ZHE1QEA/Z59ZT4c772wCL6rA6/NCfCwue59WgODZiBeBHJ0GmjyDbgZyxyGU1VuXP4qHdz56PQSg/KaYUU3CVI2aULaGwD5LQqcgk12/agKPb2gmmVJFIdfCitvhySU6S0WoZOSgU1/iaVFVO0WrCGhoUwHEIBXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246423; c=relaxed/simple;
	bh=AIEXAacqyi97GA2j6N+EcGrJcdQhhv3NZwqXVRI/NxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cwUy3MTC7baOpHJgzcb1D5S9vRK9tddtc5CTepvBQUUXxj+Qhv7uTDhXGfpzK8lhIaC82mQu9NCu3MYLtOwKKf8aldKeV7O9IXMtis0jfZDdJmAggxPu7yZI0ol7VtNU/RL1Fg2LX3CGP9/7nFb/CkWQl8oabaS++8eagNrtmhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0D8pC8P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OUSG2ZcI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P0D8pC8P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OUSG2ZcI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA1ODu2857950
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	op+i49uaIACzxUErEOBE1uvPQAYj4fTZpwGEYxYcQQY=; b=P0D8pC8PB/jdsjkZ
	3fcBkdDybu5kTZ19br9kQB+zev2vbEqM+JPdiwXlLQU5xeeOcZdkW807M21eR3QS
	2VypzCeQHoVyj2fJXrvcT7rDDK1mxKbYbA81I+gSerAd10GNzress1prJuzNGxb5
	u2zkXotEtqVN2FXXsJRZD4ffig7NKrqnm8DrjFjw8lYWobqy7hA0FIQK7laGOmws
	FQbsL41tlAZ3gVbWtyy2GNtQLyQfXquByVQBAp+iz+MSVSgd2OAeohjVp1MXCogY
	N8zYBMlHfNX5hk+va6vBOjq33E/46F9YQstOT1Z81tDUB1ji9Z1wMcxe6W08zpPl
	eTtd+w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1rag55m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so388343585a.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246418; x=1790851218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=op+i49uaIACzxUErEOBE1uvPQAYj4fTZpwGEYxYcQQY=;
        b=OUSG2ZcIC90jmPndmzPUD22QdL9RFHm/L3o70TFapJneUoGuBpugqg7ecNfzB35BXU
         vsUBpCePLFXyi2Qg90rpEhjE07BJDkWJteMw/K9npO+RSBZOIqllQVA3wsIYADTxfqGK
         SReU+SEJ87TDp3ZYCQjjdn+N904N7y8dKZlLzb+0dKU8oEnhkvqSsG6AavUVBN297AIt
         R3iyE4agl4Eyo93636f5Ar/oA4NPdDy0E4EpfOZMrjCBohatU0377PYMezFx8SrJ2Qhc
         RL4/2uer2WUWD3Mcco6uPm4CgXzhQ/tz25BYvG3fc0blHVuAyv8H5Loqg20g/VF5N/XF
         IQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246418; x=1790851218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=op+i49uaIACzxUErEOBE1uvPQAYj4fTZpwGEYxYcQQY=;
        b=heM9DqEtbnNbX8i4ydMlouir63O+al21w+TMVXCTv/kbdiLK7ZSaTYkURPbY8i7y4M
         56dunLlx89mjA1bmFSKDSlGZko/59pfIyxLdNtPuas+yHZQzVODXQEuP5Lkquzw1vcHe
         3BTTD2U5P9bMSnt0piG8+CRkSEOapPouGiVvlQNuQpRVfFGAmUEMqrv2PKzj3PFkyk0Z
         1XO7V2LTFaamLPc/F05Vgb6LQ5IaCFJmgTJcPMNVyQAvQWNBfcmKqE+x5Y2R4HSxizSa
         jCtfOhiV1dWHuSPXEQKgrVQhRfuXjmTsogw4732XxxN//WvHXvJ9xv9S7U+rsZLMwyFl
         fh/w==
X-Forwarded-Encrypted: i=1; AKwUvBz/eEdNdoenqVakoiTme0yki0eu149LyafojoYeIPlcg0tnSnPl+soprF0liNHR3G9+WcIau2fxUI+crCU=@vger.kernel.org
X-Gm-Message-State: AFuF++msltiUmlkKC2K6eNpiuwKEi8kSEySJ3aVeqVoJr3f7WfGZQ8HH
	8ZtwLz39a4aSh1MgU/epS8p9aBXjPswZ7ys4t3XsqPzrU8nBz7jf5dkzRDN/+AsKr6IYBheydJT
	QtCJYyl9LWdCEadBkwhE6oxxXtj6PFhzEKmGERXKr+ki8CeNNRcxCDTaE6PMKSCDda0M=
X-Gm-Gg: AYBFou1FQ1y4gZkRNY+1kAD51Knx1h+x6jQfCyiYt8I99Z0O3Lf7yWKHZPJLdc04M2s
	DB/zi49fazwFZkrT1Y7H4x0HUm5hOHua3ufZSUmHw2+UC77SksE4ZeumFdBFZLvUvooQ8H1Lms4
	Ay6sE5vr1PdF5I8RYv0O4YSIX06z5bq5fG9watAyDimplRz736z73BoN/WCeBBQt/Q38outQusd
	Zn3lzAMlQQ0wZagC2oZx0vAg15HXw/m2Q281d9FcPKb1zZH84E2lu4H+oxMH4xxYYoxB9s+4v9x
	sk1+QdTrWkwNaFi/gDNBlbs89cP/+nJeBGOjuOKuXC+zG18M77CROxaWhMXaKhXpZxeR8byfBGm
	lS/YbDe2G
X-Received: by 2002:a05:620a:31a4:b0:930:9585:e08e with SMTP id af79cd13be357-93c362b2742mr229042785a.10.1790246418046;
        Thu, 24 Sep 2026 03:40:18 -0700 (PDT)
X-Received: by 2002:a05:620a:31a4:b0:930:9585:e08e with SMTP id af79cd13be357-93c362b2742mr229037385a.10.1790246417381;
        Thu, 24 Sep 2026 03:40:17 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:16 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:19 +0300
Subject: [PATCH v5 03/42] dt-bindings: clock: qcom: gcc-sm8250: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-3-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1785;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=AIEXAacqyi97GA2j6N+EcGrJcdQhhv3NZwqXVRI/NxU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3clsCNiIvFJg185U7JJHK5tk1sUx9CgEy5P
 4KDodOB4kuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT93AAKCRAbX0TJAJUV
 Vq7RD/9sJOUTon55JjkZ/j7DgzMtIgV1/oHM455+t0dGpgzXE83NIjGI/vaJlB0y/Y05PF7YyaC
 wgWto1tRRWn2goHGyvQmjAsPwKA32+qEu0U5ksP6nbO1rrvnfWw2PdsrjJ3Ye2a6iRgKQZvq0/f
 Qr638b0hLPGNbGjXmfTo1cpg+htJmCK90GUttMiNHGTQ4IdWPDSOjdG2XhA6c8J7qe2toWAS6Ce
 snR69yzvFCVi8a3vNY6xSRKIyB0o1BH/IQIoWQtP+xWnuIcoD78riQjcXZCJ/zbq2qiUVCJOMm6
 ET25okdzr2lj6eybwW8N6kGme+wUgDs6hNV6yXDCAblsMx3kRXm20oqR9qW+T6C8KGZx3jiiMxX
 x+cFh26lEI12Nrg5Mfc/mXkLWsxHIphRsc1LTSXq/SBz+A+74QfVD6W9uvTHZ0gZ+x8JdyUq+T5
 CSG3/b0+DRoLBZxDeziqmNHVxwt9X6c3fLn5wfcTrLeb/TEGEdI1mFIb9EkgtfWzjgwizm6qzkB
 YIwYkbtWXTOth/780hjpPJ/IkYRwk0sQ/I5gCwjc/kZ3k3nubsI7tQa1BN1RUav3ulH7TryWyId
 RPegPbIrIzNltlDVXdH0s6QcHukbOTHOSndVRCIhqhn1Wfg/hdMaumSXU2oVzwF9cI2iggNkYo2
 vvobIiVLcdxOeUA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX0fbhZNlZLPQb
 QTr5y9kIHI+7tRm4z8vhzL/E51EEMY5BQhfkKdqd3S62plMyGTJPzBnavDFKvjo7kR4nBUF3ajG
 /lLFNOCNxJR0WRyWJFkbGKsa2AJkZwGfK5cKObydFTTXQQIvHumU/PYe278OXg2GvFdkc7+QH0y
 s/9JBSnA+SHHifu4Au7qpNNCfCJuy99zo2PVyRRS7fg/kYDYCPGnLTAr8r8Ehww5jFBYJTIr6Js
 BeUwhaB7zsPulyJlumsQ0lNC3ND/FzuJITYG6M9c00zzpSvr2flr91XEKRrFOMSKKak1HdQjQSr
 5TsA59AsFbmg8fdL+l0sHwdw9ekWWnCUMM2VuJ1sq4Y02ftC2tKtG9QwrQcb++plPQsJAThidFG
 w/Kri97ptax7k2zjNgV3xdTNrh82W1Lr3PhOnt7IcYP4MYEZqX6RepR+GlOC5CyuaH+jACR4/qc
 j7FK/Ij1xJos1vyzTqQ==
X-Proofpoint-ORIG-GUID: NQg--6o3-pGKmQt-9EO8cAFWXcoeoQmn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX+SmRkj8bjhVH
 /fgzaVISblFtNDM43NBzRB+NwFq4yVw0WOBXMdFJ/yfmQy0WDWDpn62kIfQOo70h7dF3bsSlLm1
 YS8EYTfz25jZUXFp0n90nyxb/khTfwk=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab4fe13 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: NQg--6o3-pGKmQt-9EO8cAFWXcoeoQmn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GDSCs provided by the SM8250 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
index f4cd5a509c60..5f9aae728245 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
@@ -32,10 +32,15 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -46,6 +51,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sm8250";
       reg = <0x00100000 0x1f0000>;
@@ -53,6 +59,7 @@ examples:
                <&rpmhcc RPMH_CXO_CLK_A>,
                <&sleep_clk>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

