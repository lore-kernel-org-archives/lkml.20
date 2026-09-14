Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB024448CEA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390115; cv=none; b=Iqf+rh7EXXOCen0NGW5Ydhw1lodBqktd+MRAQjNFkp0yntKQvw//mkB4p3xb2C552ciqeYehm3d0NI3JkFpPjMecwiP/hq6hHbRASA6EzcJRkwE8Y8FOmy94CNs3ZFqXbkwWB9C2ZHV0OtK+alcfY9sMQqj34mPkYV/gwfRfObQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390115; c=relaxed/simple;
	bh=cCljZSqJv1A83Fv6szFpAkL1t54SP0MkpLJrDu+mmuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tM4NJNPwtWHw0ONSGWPZuL//OwVvuu7T6d/bNrs+EAN808Q6mZsqx37MzU7zVmaex32rvaNNZQMj2POjcmY89aEjA4LTiVak6ZGVqn3WAFSgCDBY5u4/99xgACHbhYpgtEft2Zw4SW+lYu5MmzWs+wwLAOfr9LCQ/Ew9oYpnQwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hisFSkTh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ap3PLcNE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hisFSkTh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ap3PLcNE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmAHh3291626
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DfTRQLRQckPNfNVwEPDgQHOo6su7rg2rWpbow3Tx6Co=; b=hisFSkThXRaShEda
	ClxHJYdo1kqPQ0bpLg1NWRR8m/0uLU6auIXUOXAP/tz2/86RhfVnZ4Kj5ul9Nnvh
	tOA9bxogDc7fhjYBYbcaooLs+pnSKOreoF3kPZRkxNIxt1JVzQqfntUzoYN0nYyZ
	0D5J3b5/JehOwDHs67UoXRbZDLJqJBlYs3uPok2jtaiBlNnRYKtaMfV39Xb5T9Rt
	lQ2UPx3PgiDdWiJIxVydTOJOPIrYzCaz6E/SlghYbczWbCQv/m8EaDMueKJxn2Kl
	liX6rMBgLhh7nW+pUYxwfXICT6EHxNYdAOPUJnNETWP/30elTOV5oAR7sBxU+C9F
	/TPAzQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8ne4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e869793d3so68532416d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390112; x=1789994912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfTRQLRQckPNfNVwEPDgQHOo6su7rg2rWpbow3Tx6Co=;
        b=Ap3PLcNEu0fmAlJ9ODEI25LMjBu+R9LGKPN2qt3+HXVv/awwfdOsU+oBr7YvKhO30I
         B4BnCQ9vb+7YfhFX8V0zlFaqlw5fs/L+a/X6FNrOG5CnC1jNN/MGm6N3ohReuAN2zFLE
         +PcXr1+2h92oZaV3V9OMFmOpg4OHeHlmL/HvOv7Awb83e95xzW4XMJuVIHc+JVvjNCgx
         V1KCfgtkYjiXBtHj/QFthWQ172vkYT/aeDklRPVHDudCnzgXfGdSyWskgsqfe3a67YWq
         I/JlHfktImgum9i1JrKQWB5BxTg7xQT1KXb+R63B9KHYSYpALcG17e71tI523qc3NEWI
         AsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390112; x=1789994912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DfTRQLRQckPNfNVwEPDgQHOo6su7rg2rWpbow3Tx6Co=;
        b=qOBwWDcKbX8CYCv43p1v3WOKuXQk67LRBobwAWvYSfb9WEFSKGSrB8YKPbK2RD6o+6
         0sp9IVDU4i9ZGN+pjSlEqRsTZhWWXqAw19wEBLgpFSXZX5bxPTsAdEBGL+T24RyvHwER
         acnfG48N+SgvO/ZTcA4RhOqGU2AWWjKZD795tNWa5XSih/Ti8zTw/m3G33sGgXr6zYEI
         Ou6M4o2Rs2G00AhOZGwI9DvIxWbcFHzZNxLZJISCilz6ZeFclnNmy7QLI5zF25tGvZVI
         FeCt+icruyphoQQqF2EPDe5MMBoYlUs3hg2RrpNRZ5yx3uZMd72D7cGrvJWWnZv8gj0E
         XcEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLpmmhUlOymt0yA1Z9tj/dZa4r3ZWMyKRp6h/kSt+Au94z0Cz+aRhEshmPzljdEphQY9UbiWr0O+VvxKE=@vger.kernel.org
X-Gm-Message-State: AFuF++lsUQHqtHUNd3KyUdMSSQYf2EqWjiBQRYDgbobdw4MKgM1mKMAe
	VCHZCyE7t9/Alqho9FMsutDa7eG5T1LkLRhMA+IcQvJaP1hZ5FTkRyLCp0ra9kkGr71/5PoEA0n
	ipFUs/5USfrBV5GA7RYG9kP/8+c/gvFVz9OImoB2jjdV5Y+onoP23azkxX7R+BnLg2Go=
X-Gm-Gg: AYBFou1nOsmzVq7fBBapxf1razA/38nKfoZfgEA89HZGWZGmhtUeMgZpRAwuc/Z2B8o
	e3+uCm45LqID5Z7GbhSJulBj8kbDFUc/GchXMghOQFHnrFsjlXYciOUnLSguOSzp15tUh3j2C28
	xF8Ne31liDSGFgbJmudIcN1wfMr1QSTGgrBL2Bd1bpReCwjJJt0qY7zqw464NPVIzUff4/2LJmr
	neJaC7TZodpYTq/AC+vzwCGLhQ0lpYaBbVB5WGD/9MM840Sh7LGwI1Dwth5gZPREbQi/eDedrOg
	TgIKFt0i7g897X2ZVJtlsSpV94YPTwLcDKqtZ5PUs9w8Z3n7iw2SDV7uzHKNwtcPH40xvih5l+h
	hHj3VF99d
X-Received: by 2002:a05:620a:4620:b0:93a:1101:a21c with SMTP id af79cd13be357-93a299f084bmr326051285a.25.1789390111932;
        Mon, 14 Sep 2026 05:48:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4620:b0:93a:1101:a21c with SMTP id af79cd13be357-93a299f084bmr326044385a.25.1789390111270;
        Mon, 14 Sep 2026 05:48:31 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:30 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:10 +0300
Subject: [PATCH v4 11/52] dt-bindings: clock: qcom: gcc-sm6350: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-11-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1691;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=cCljZSqJv1A83Fv6szFpAkL1t54SP0MkpLJrDu+mmuI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zWrMvA87ZExe/HNo+lke6CFqVCgje/TtVuq
 6cz39h2+TqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs1gAKCRAbX0TJAJUV
 Vs/eEACBe3Loc/76bXBuUrnjcXfFR3LJZDLpi2bxjyqy2mebuM12DwPLn1PpkO5uI27zJEBhsM8
 7u3dsACuLJzsNqUsVGK7OXvqmeuhR51Nq3QZQTWBavTzFrWPH2I6TlLPnWNHmgdSKLXk4R80U07
 7/9T6VFpLX6TTB1IsxBaYHL8OSx/3m1lD/a9/j1Se065tocYM+lBIR/14LE4kFuymCkGJZXAxE0
 ANZALbRBhnWSGQUEGlFt+VDANsQp8XcAKnR8gx1D/8dE/iwM3xzaPz4TUTPGXluySsEEhyP9PLk
 rDySLK1F81NyK6GRQcADlCpOm3QR/8fnWi0E0enxs9yv6Af/LWcasauEyzMWgJ76umOY6rUd3+1
 jYaSpZPQqvsLoZMmd8yuehsISjUg6Nt0lFHMxHwfzIiJagevGiLNj9E9MpWQbd7xpYbOMVyr72g
 7G9K7B8M/n3gfpKAqReDp/5fvsYhSUFCeHn7LPk0UVuaGbkMgKCms8s2CQAGKnrpXO6MaA5d0BM
 4/3H4aExQ5jUwXXxYavJtcy5YxvJXCgexAUssOLNYvMUeOSKwjHI9zZ222uXcF06yeHh6aIdkXV
 ODVDmw/28f7snpamUaeV9MaB/RQaPm/CCqWzhAKeYiLQHh18GxYAF2/iP6Hs+m7NaAjnIynFgGj
 lNmIbl+OjuZtVTA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7ed21 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: TzV4PtJPXFKvmkRW4jIQDmnC1v3ohBvZ
X-Proofpoint-ORIG-GUID: TzV4PtJPXFKvmkRW4jIQDmnC1v3ohBvZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX2ZH1iAkpu6N1
 t0qjp/+DHSDlHoVXTmTOWXjMKiJYykI5GOYZbnwX/jiHqu2EmFCZZzrGBnYJwT5ZUO2/iiio0br
 YU8o02xDk5ttAm1VuIObOzs3wSvsbvaCD270LE25YnMT9vhhgpOIAWauam88xCFiNJCgXyBmc+z
 Ag7vbNu4SUPbPO1wUM+nxN9zmZT6iAeiruUciRrg/2nnBtAG2g2quQdwYRUDue2Akw8bkBrZLUq
 ZchysFEI0RzzkuaHKBI8UlX7wKgras5fWlDgwqSW5xcdn+2qjdj6wf2dQqaznNE4LPjbwdWFonG
 zPh9cvWWQo5sIeqpFgR1a1d0GbBuQnNLadArPkhZ6pCIoAhZeH3X1foWBXwtnvhRKjPMMgR679w
 PzN2VUeyUqBdQIiAlWFrfkgMPjfnngRIyu1CPp1FSQvPcKKocsXknLrUO9vpy0bQd6DiL+kCHNN
 l25KUfdiRJ8dECWhEsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXxBKJdIJrtYgR
 ano9C34Zf2y1EppV0ORUouB8pLcC3im+nmhri1lBPzQd5hc3yfiuHV5cPPQhFF5MixF5pOs+WZq
 ZCTmttg4qSvCrL/MYrNpbRB8lDg47Vs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140182

The GDSCs provided by the SM6350 GCC are supplied by the RPMh CX
power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh
may undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
index 819e855eaf9a..098a108b8123 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
@@ -31,10 +31,15 @@ properties:
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
@@ -45,12 +50,14 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sm6350";
       reg = <0x00100000 0x1f0000>;
       clocks = <&rpmhcc RPMH_CXO_CLK>,
                <&rpmhcc RPMH_CXO_CLK_A>,
                <&sleep_clk>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
       #clock-cells = <1>;
       #reset-cells = <1>;

-- 
2.54.0

