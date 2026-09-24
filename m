Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC6F4749D4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246419; cv=none; b=DPb3SP11/OediF2wR/mN3ULawB0TDnZNA8Jpr4TGqLIyRV9VeWMHllTr0GhESk3jrd+zUD8A8q3AkboFn/QvhNS7ehypfVEwo9kkrqbTUK86lyIUoCS9CHVXuyUt6jnJIyOAOP/UhmEqdIo1bt3YLb54mC7mLWBZdK88K8NwTU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246419; c=relaxed/simple;
	bh=nMD6xMrn6lL5iJ8IxikWl8h53ZFdj13HahcbJwWFnFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BBSyS/GHGyCg0b0Xpm/XvHQRi1nbHmeiMmI7Cnm2cJ6U9UBx72H+8W/fOfcIex98ANfFpsCYLYrX3qQuusGJee2ct4xf+o0CaONv2ZYkeo1B7kCjsWqsgvN4APBBz515pDwYksU1m9KfsPR1EYwq7/VqdmY/N/C1UHhJelzmW0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VIgTYuOI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gj9zxYC8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VIgTYuOI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gj9zxYC8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA1Ohr2857939
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	blnAvdyz/oCP8BFz0wT9Q0/FqHtwsyu3g2gkST9t3vY=; b=VIgTYuOInlVmn0v5
	vWolzsXHUFJcM8DIsM3mHsWebas2M91suV5pqqp2d4wskUbqKjTKvzvWMHkI/6OY
	fJ/JHFIzAUtWVShfkg9lEDaycTDswi96RwBlXur/e1eTOO/Ji0e+xfXkVafG9l+g
	Cc9BcfNRnhTa0AI4xxFgWC6kaHJnYLq+4fyRiC+6VxuWwgfqqV9Cn5lJ8wcdL849
	JWt1A48I0pGjGA/HRmEzHhC8wuY8dJTpmMnGg1onovrN8N7frnqcr/RIMBEzTyWx
	Ia8m+kRh6ZBgGTQOLPysxTAoyj6RCnmg7jJzvzANy+28Ax0uTSvIfrQycV7bo5H3
	AOuT9g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1rag555-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939062ecda9so293220585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246412; x=1790851212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blnAvdyz/oCP8BFz0wT9Q0/FqHtwsyu3g2gkST9t3vY=;
        b=gj9zxYC8fToRU1Z9W5VKKve2npkJZP6jpkzTTUViUkbA59FmlyTfzL998/xROHc3zL
         Z6Ft8A8sm47LS0erPprnyw8zISVfOr5X7+5gt3xwqIkD25PJlM5hjfPztiNqsGBQpPJg
         7cD4sIcpje1aJxoAnzKlb0sx/49YDKDEg7bOS60YvsJv2SE1TFSXX6sXdnKhANdDP+fO
         qE/zLkgJb5Z93KwDlUAYYKDgIbd79U3KV71alixV0QCKj715rStFh1j5VAwE2KZM3hjt
         5uARLnFB7uWPFxvjziRlTYpVSlP1okmmGghvAaeCwma/qmlTp6KhpqGhV0jSJt3kxGuq
         3bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246412; x=1790851212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blnAvdyz/oCP8BFz0wT9Q0/FqHtwsyu3g2gkST9t3vY=;
        b=Z0AHk8+IfQd1+gGBl7V4445Pb7Wg2Ag4j9ROQ/7aBZ9a67a7E589zZ4WkoiCwC3j3F
         HtIP0hbHNltOjYDx3ssj2bBZvPAf8qYvdnyIeP1mq3Fu+K37g6MQIdHXYYiWqqkkY4XG
         PhBIFQQzFJyX/+m74+IXwMElJAuqldcu4YBb4Mx3Fs6ECs4Bsm7ExeyRq5YfRtgT4yMv
         s64LHvOrnseuHHoiX1NvRPsMHuzoGXV1eIyoFMvGGGwSiekS2e1OH63IJi6SoX1f2uMl
         BJMk4yp1AiNf89/2qv/J+/tUQJk1c3zxeUo14s5lCeNRvzSmgbPz++C5Zkk1ILgvIUi8
         IKdw==
X-Forwarded-Encrypted: i=1; AKwUvBx5+JfAD4YmK3oWM1JbNSFQbXNMtZUI4XXkhSYORhAHSStPE4rdI8sZ/+yr5bj+7GP+wO2NtTCYu+8gC8U=@vger.kernel.org
X-Gm-Message-State: AFuF++nCbe1V4jet6IaB3XAZaSwcklG2855jfcBfCMyVcACCB+V+MqUj
	RpQinVY7nAB4iA8ZwQq/PFN04jx4rsHi2lDbCatqcNb7SM3InIXDOg6yj6FsPq7oPtmJ+x0IraQ
	xPyXORFsmoRMj+kT7DhLO/YF7rfYcWHVEk2n+zirtaFsakdVqvgykTQfCT+f2bISx99c=
X-Gm-Gg: AYBFou2sgmtZ3aqahPBS+qLrUR5ves968zw2hABrvN2gr/dr1nttQf+pvcbq8fp1TFb
	v5vCK+J+zFQm2Ba36S7XxUTB+e5NuSzFTjvitw8+newwqw+2UNmK6H23Pp8prEzJFDxfV3i2CLB
	qw0KdKr4tLFjUBSjnteLtZjZFsYLeDpAmb1wpjXFYqW2oNtTNKjFP8zPaOaKpENBGUAPxszwkAT
	fjVW3t+lS0DW1emo1n80zAomE3X/fqafR4vXLxW+MY1kdbKvMCFgSeA9wE0VGyhKdOCfTKPmETg
	b7bitlI2RLnBSasuZLD2YMDnEKFjEnWe599xZPgds/TAnreHAY5rCXHHpdXbg6/nj/dG37mOwzY
	1f6zx7lc9
X-Received: by 2002:a05:620a:7003:b0:93a:1264:7f46 with SMTP id af79cd13be357-93c36442915mr235561985a.46.1790246411642;
        Thu, 24 Sep 2026 03:40:11 -0700 (PDT)
X-Received: by 2002:a05:620a:7003:b0:93a:1264:7f46 with SMTP id af79cd13be357-93c36442915mr235557585a.46.1790246411058;
        Thu, 24 Sep 2026 03:40:11 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:17 +0300
Subject: [PATCH v5 01/42] dt-bindings: clock: qcom: gcc-sdm845: Require CX
 power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-1-38732033e5b5@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=nMD6xMrn6lL5iJ8IxikWl8h53ZFdj13HahcbJwWFnFg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3b/+b7gJiKtrDdjdFve5kosHdjQ+34O3bxT
 AdYnfc3QSuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT92wAKCRAbX0TJAJUV
 Vq64D/0dSCCMNOo7QYQhn1N7bo1qPxyeX8nsejB0rbRoNBN3uo5tb+ma4SL7EhatXCvbMl4Jzs6
 BK48ttMnL1f8DnEwCJuZlQPofw+daMtRnR9GVIVo+6xlQ4Ya/kYTmq+8+Wzsrq/+CI/80h0ySRO
 N7hGyyM34lvh/QkMXGEEzxBH/v9IBKlzMz1Sj67aM6xl35NMYYYFfD6NezKgzw8h9GdCrHMA95J
 S5TBQ+JDGWtcfqwdvGqWuZBtfd+/vZWV1NaQuvymdBSIOsQ1IvARKpXvMVWzUMPoy+orBuImIeb
 oKo0+fesxKQ1HWoOi83SrMgGditQO1/RhAx1/SOcSxziwNfgONkurd86HhXmT6fv/SzbxpW6vri
 O1NEGW1IiELBKTinxKIiPWmupxopbpIOkljWRNdkTPiXHBMrPfCuNG6IRlprkT8Xkdqoyr8GKfD
 uLCCVCLtySpAkGOtQtVUMVuwTNCDT1RsHi7JsVH3ZZkB9RUpp1DNt26Zdyoah+qJ4pX8uTf6YXc
 a4bLi4/6/i8V9w56fdBAdED93DC6ZcWFqFfYTP48TdthJEYPnyF24JP257iNOTVikT4CB+FO2Te
 zCbLD7QGJNTj+lL+pMrkjMwG3EVXgpCuuJRP4C/a64uOYw1C07Q2VfatCYGRZFXTnnYoKJGAqWY
 f46ChGcOidCSW4g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX3cDDt2kSOXRM
 iS6dPqz9twgYx3mYqbLkoyn3+cJ0zsJaWVPEpgqIDYx4Eojgcr7EmN4gEkYPMNGCzeUiH1GML4+
 AY+EjsasX/hYkSQzu/5e7y02l5urMLfjPvIwF1ZR3u6NG+ZgZThg7zRc4phTD0fgulw2N8uptO+
 J++ewzBDvpfALIQMty+oTB2I0t87NrzCA4Tansf1RGFRMmgtuCZZL0yu5J7XSygmVuzbtFBNDdU
 K9SZiVEMYmJPWHoV1NAdWHlI71YflbL05nYKFGxsbeMEauDqisYSr4XpdvRIw+PF0xNOfpcazeh
 cuyZKKAzyrjlY9UXCb6rQUXfUmLQ6LLQatrCvwk8eN0glrt774kn/Bo52uPQnmj0LHtrCrlgXQx
 /GAMHw5ME9nPEmSP2FCq2Wozr4AfxLkDnjDynfAM26Off1TWsj3GJkOebkB3Y0EhwXzNzmn+s5R
 wbioJt689bf8h/veHrA==
X-Proofpoint-ORIG-GUID: NXYYvWtdtgrzTQJZetYSywgTdFQshvqv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX8r5S73wCv1+1
 n9UAXakfqun46s2TDd++Gn5w4DtWhiYLvkASO2cveK9ccNyxzVEca48TlNSgpdJcm7gaTjaWUGP
 kBBNyTjtwIH5BOfHTf5lSknQGHkh72M=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab4fe0c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ic6PIZLzPb63q0Q4sZMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: NXYYvWtdtgrzTQJZetYSywgTdFQshvqv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

Require the CX power-domain dependency for SDM845 and SDM670 GCCs.

Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
index a7523a414341..41767eb11651 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
@@ -31,11 +31,13 @@ properties:
     maxItems: 5
 
   power-domains:
-    maxItems: 1
+    items:
+      - description: CX power domain
 
 required:
   - compatible
   - '#power-domain-cells'
+  - power-domains
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -85,6 +87,7 @@ examples:
   # Example for GCC for SDM845:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sdm845";
       reg = <0x100000 0x1f0000>;
@@ -94,6 +97,7 @@ examples:
                <&pcie0_lane>,
                <&pcie1_lane>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk", "pcie_0_pipe_clk", "pcie_1_pipe_clk";
+      power-domains = <&rpmhpd SDM845_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

