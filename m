Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56C840BCA1
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648087; cv=none; b=N0/m7EwgUDt3gSsKeCOaJZTA4PRKYqMqY60UokZBsyGlDohUv8rekb8kTp2dZQqq59NosJAxfPyOkh8iccjm8+648zxk+Az82Mf6y5MFIbzineKCFCwewX8JDhOcd6QzY/c8IGfMxPh2uayNTqM4F3x86ZMTlFwhcef0aW5WgXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648087; c=relaxed/simple;
	bh=zsqdQtklwpvdbiVBw+YVSyi6bmJpPl6N7PlUwRG4pvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V7ItNUHLNTdFMh6HjwzdjW8hrtm3Ua7Q2AU3Gq65ly2wqvbOPM/h8SUy4jW3FkikPmUm1YsW9yKRj7CMEtfmNB2I71MPWytmx6vIZfpLJtzpgAaOypNlKUDeSwkb/Rj+xvdXr1YEVhawb0iUApe8QfLZ5ow63SEApUDLPR4+OdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iv/HU4WJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLINXOKG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iv/HU4WJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLINXOKG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFPv45957993
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=; b=Iv/HU4WJYup20Aow
	9fPv25J0ElIW3hxKoM98EjBVaFalTAepIgZEqinJnH8a51PKoNC1CqRDMouXJrc9
	jr75dKgAvnjWddj3OnCGK53w1vGvcD5uwHjSPJWqstTSAabjwaghwIKRVm0H9Y8c
	Fw03dGOzzCwT+/TD0I8rWWtZy7ASDRUuSNVhZxKRw4z2Mzck8G5mv+xO0iCiCWFG
	2XOq2DZui3Tb6jksubP6/fWPaJSDv00FQhRuxg+lQgV24iGSiEgqJ9APaNMHmbxh
	vqB5I4dPeVnlbq0qF0SLMAc7VNijCRtVrGOqrqB+CT+KtAl2ipjyZrdeMbB3SLcz
	BjYwTg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7deuhb3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:01:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so1960120eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791648084; x=1792252884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=gLINXOKGIxBhJY7kSEz4O3A0/87dEiOoin0k7Vt8Mds5HJUIQmyctK9qw/owBnT3rH
         8ICstQITd3dRXSp6cxDEGwhFEZOrd9AuOmcc2Su7V0EjR9PMNvykAzUW/PVfvMDC8T8F
         5vmJxPT6LJEnE7XV/OpCj5L4sOWj1XiAjVYU6KmBFO43FRNdijtYTYlNo+5SiAzHOy0t
         uklbwV+KfRVfs5k6M14X2cdIks//JfutYQ8jM9OBjfi1wDR+Vp+ZjXsnxDgfdpYObE30
         g1DXSWGfdzeLi+61YoPpnE5KjGiy9RMK+FZ5PM3fh6GqVyWsjD7Ehq4dE3g5GJJrtTSD
         l92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648084; x=1792252884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=nTYPl4S+h2fVupCnysfgZLphobS7mahcLsPl2h/dnsdWuFuUkYY24wqLlc4s2nAEPy
         Mwy08XwmboWNGrjZesQ14wJz6FOdn9nsEGSj5rfua5skKprrH13zlasJ+leMEjO37Dsj
         uVZluzo/FLqY2Kj+dZF2aVQemK+a5RRzUILMUxulKa5xubhvn9kO/kZM8BDHydMF9yN3
         jE3N+2e5eFoxYub9QzS2lhQhDBqwZzrdtXDCeppH835zcpVNGuwI0dWWHAD7k9o7Cffo
         Ds+Y3BW3BNIeSGpwtRBlSM8ah+uMz4BVQEMlgeY1cm0J2PXHzOC7O9tsbFUvWVPTsDBI
         zfog==
X-Forwarded-Encrypted: i=1; AKwUvBwozlaDGvLD2h2rWu7nnPfhdoIxDQwPw8kgd0OnPBhZFxcEGp9dMZPHsKDg+YvDSRp93NPUHvSTiih/8Fw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVmpYmNO8fSo+hjOZITPXxS6pHYHFFUq/XKMy7bF64SuGVNhFU
	0CFcgCNaFN6xHtqhAwYI8P1kH0Taa7Zq8vt3OxqFdy+2us+KHAKC+4xoFafamRGSmRLOdLFbr+I
	tHmwICVcwsxZ4AxTyge6DAFXIBMP1H4V80EHPQ9K44aS9v/IFoXnLY7Ggbtu1F+r2lEg=
X-Gm-Gg: AYBFou1CcotBLxPCzMOp+nIR8tK9krxeYHPjpkbXQxv5uIy+7b2v293iUV+I9T5M/zj
	pHlg/16wFb1nWmwxOSXG1FBmp2rfMK1e+ACZ1nB6sGBx2h2z+uPDVxLmQLGSwN8ZatOaJFeIc+T
	XFJl8XVZLCdDZGcE5xozS65/ennvrTmCkw/pbc+YDQVpmiSh1s2M3b6c82fClCORh7/jkDGIsTe
	EXepNMmu3qUUM9h6EKhwXLnfvfOKT5WTD7ubwJUglZcWmyOhbFZxYpdL0+Tjt+3Zia1Ui3j7Gz/
	2sFzsiF7gV50iRqaaujJVqFTxF5AFWmMyh2EC1tkFb7DGs96obsBEomnIj5Lw1caf6F8MJunm7A
	vywggWt0pUm4zQuGFSRiCm86eKZYGoQ4Tlvt9Al4ejp20VZRS0m7vQoYkS/kjoOv47VtENd9up2
	t190TACtWPiw==
X-Received: by 2002:a05:701b:454b:20b0:144:fa79:174 with SMTP id a92af1059eb24-16a61f45109mr6363899c88.44.1791648083547;
        Sat, 10 Oct 2026 09:01:23 -0700 (PDT)
X-Received: by 2002:a05:701b:454b:20b0:144:fa79:174 with SMTP id a92af1059eb24-16a61f45109mr6363742c88.44.1791648081353;
        Sat, 10 Oct 2026 09:01:21 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm30786022c88.13.2026.10.10.09.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:21 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 09:01:06 -0700
Subject: [PATCH v20 01/13] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-kaanapali-camss-v20-1-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
In-Reply-To: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-GUID: fpDt3FpHPhuyF7LY4TFRVlAabYXw8t_b
X-Authority-Analysis: v=2.4 cv=Aud7T+9P c=1 sm=1 tr=0 ts=6aca6154 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mZPZtqNPFm0sPOGUM0AA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX5lMuH054lMZu
 3DaWoYAkWIyDWtB88OA4yrw6sa/SmMC5vGl3Byw5WBx9rJwQ2+POA4TWvDspwEWwaI5wiKDM8DV
 7CSs1z860t0sdOjLzb7bXtm3DLFId5M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX1lke2WdjOAvb
 2dfePnjIRtZXaVKJLwB1dLnjk+UY8/dkTnHEWZWH09gyp+4ZKVHg+qvoG36zwMrjg3eEqduOw4e
 4sHcACEl+6byDyhELsqQHa/4OgafAQQlpiQtRVyya8twmS25hDphzMJA0pNbdXL2/8e4QU9CXiL
 FFWcjaZ7YDh9cpPzN0gl64C4o10yFU6/x+4p5Ma15PQtoAXdD4x9FEpQi6+9z4AUgEdzRChvEMo
 P8AzlW6pLJuP2AaVO8Gpi5Q9qnF1pzPwd+djHuUMjnpV6hpCr4BBSh/lpW8cMtLOlHuIqixjs68
 ROKvysveVnk6fIJesf/3jDgrpyFFKNX0GTqls4AlF9uAQFpfP2EDGQI/KD8eZ45MXUXJaO1mqrg
 hqg8N5bNS4OzxuphrSqWx/uVza4k9/Clil/WzVG5iL5XZCAJzWDjnN/M5OF0FdbXz8q4MTt66kE
 nIoVP00JCs4/steH7Rw==
X-Proofpoint-ORIG-GUID: fpDt3FpHPhuyF7LY4TFRVlAabYXw8t_b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100063

The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 1f1e2a4993b2..6e9eb8e265df 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -17,7 +17,9 @@ description:
 properties:
   compatible:
     oneOf:
-      - const: qcom,x1e80100-csi2-phy
+      - enum:
+          - qcom,kaanapali-csi2-phy
+          - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy

-- 
2.34.1

