Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783292;
	b=Pj9c/uT33byrKFnlNFx+Em/ck167UU7eHHmqkjNVFaHdO7+efPybpJK26C89hzG7F1BI
	 FrXznXVbNIvM80gijBuyqRG4BihU4WknyrExOs1FkK9VQu0DT8tqX1XTv8dQAuHgHN641
	 SA0XGXIQcChUiIS/IvjeSVwIz8wKC2IejRQaO5BI3sFgVRh3WD+nGdN2n5R64/ABNcKC8
	 LkH7JLg8myD4yTOVFzldjqWBYXXXkIXLSSdufeZ5YByN+WGyMDdP9dUlybKijyeuPDmuZ
	 SjNxR/uaJ6vaLNNSZ9HgKJ+4FR9EiuWw6z2bQPfQCI0rF3eipzBqgavCNTkWnbPNiLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783292;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lLNvy67hh/zUuo17cSVaBEwBaP+1fyl5N0OjhghBW3c=;
	b=3pgfi6m7Hdl2cOrnNVQGySAQ12CGk1hsNpDPzVBj5NX+jK6uAt+lTFDk+UxVAIsMvRew
	 zjJuiYvZf7NLiEWb1rWBva2nmZLbOE3xpJ2vI/2CPDd21dzxQ3z7Xmqf2JHSte7BLUUlO
	 B/+nXL97lPMUbEx2dK8VcWvSMOneXO9Epk6nRPvOzlAkx1ziF3tZl732WQul42xrQzn0V
	 8Mn7A/1jti7FCxqRvkjLLxhFeWnbCP9cuRUOumMjsMKsx6G9LyiWwlAQ+ZZlIV4RxdIeJ
	 hYDtvNvjt+xq40j4BqjNAv+lCYZ7xTI2+cxQ20zHP8g4YN2uueYP6V1G0ghxIBuWd6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pDhZGywj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OdnmxYvz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7647B606A33E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7647B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pDhZGywj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OdnmxYvz
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KK1C918403
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 09:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lLNvy67hh/zUuo17cSVaBEwBaP+1fyl5N0OjhghBW3c=; b=pDhZGywjgW3e1zOK
	J/lyr6z0qNgXUy395nv/t9Xt8E+cHb+ABeGYOkSGVdt2vSOAiOq2xcq5+rZ5ZaT6
	UHNnUeF0B3EKawm3aGNUfW5Q11t3YxIbGJ2N+uDRZT9r7yRL49Ixc+lA0GymSkC7
	jTx8gbczrl9ZtQvTZAPUENVwKMiPdO1cHOV5PAya2sMJ3iP/iaAhCcJOCxKPXG51
	8HdA7VKT3anjLQSuCDskXkl0QxQVaM+UQZskIsunqwPJ2qVjB1BX+Rog4EjkEiOg
	7ImssSZMdEbnNMNFNS0+/00NY/mw1XJxiYDeOIQSkGKXQhDM9gU6GQ3F1vaAwcjR
	gJMW5A==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsg99vx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:08:10 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6faad68ce5bso208777eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793783290; x=1794388090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lLNvy67hh/zUuo17cSVaBEwBaP+1fyl5N0OjhghBW3c=;
        b=OdnmxYvzpEH7RKSpXx46xMBxc8hmMayzUiuhINcg2t1/gTcjxo6sIjitLBEvSGOPHj
         a2UmL95PEecZkrhY3UYsfMBKnI+macbjwZ8rDNFL2XYtOvjiPqnzcnnGELXvGlTgc8/2
         cyLnimShNGXCrE2x10tsqIdWnq5fYPCTGMWr38lswHUoN5IkNe+JU4j5ilugqdNJSCl9
         tNGbQNr+VS7U8+dk46+g1auZVpQUA16dVMyklFvDFVpS+m2DDp/GUYXzizhhx4rhMqbI
         bmRr1ZBSJ0zZVHf9orp+c1MP8Y1Ze8SAM0ARt17OmWprwtCDFeWVIulntj0tkHaGX5Dw
         06pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783290; x=1794388090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lLNvy67hh/zUuo17cSVaBEwBaP+1fyl5N0OjhghBW3c=;
        b=AvCLS3f1yVT7XnPbLJg5KpZMDkII/DWkdyuPE1TMgavEfBAzeD8vj2pKRFDyF1jNSC
         ckerWYy+86QbQX1CW5LDt5F1blZV//fTeTRG8objsRVM4+iwHcwxFc8P5if0eh695Be8
         0kcYHS1YNU0KRjiUESrqaqtrt4EzEtHkw3FE8wWPz8aBXgQqwaY49ltv/l0XFE5ZtM+s
         ZGFY5AZni8aDZhyXgnSvgXOobdMT7VueXbLu7v8TfE51lewMuDH0BaEHLV4+5xj2nZIo
         EIPJdDk1uj0iEPa1tbQ2PtpMWgQHprOKNsCQRasCjPK00exXXXq9g/tyyVaXI6fdusaU
         S64g==
X-Forwarded-Encrypted: i=1; AKwUvBxMYBacl8QdK6I9BrzSXjqByvHezdiYf+1m+MCU1LLITD088hMuMeD5Au1xkxNOb4ccmp98x2bMoBrDOSc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CJ9ncjsCo5Nv0jRtU+CPxEZm2MLYvmQL7YOVQTAC4Zt9iz7eL
	7bGvmYFSu5kCJpN9p7zOTxFcY9P7LWb+s6a5n5XDFfq/S6cVa2NbaP/JTxjH424qk7u2+w4yKye
	SmOkphfF56xL+NcjJYGvNFr5/T9TOjOi5bpbUQm+hBg4qMUouDhd5b1BXACWnLErRU0k=
X-Gm-Gg: AYBFou1UMJNKhIt5o8jjBNG60293oyKeNMBNZzj7OSPbuUINoasNouyze+IJ7dQBeMV
	gLqcqX76w2dMgZRy9nVC+psHIzMog++BFvTV33HbqWDwrvLIxgKUqv+2hEM5yY5pImja3oqGhXz
	05Is3slivgkniJKC8vSt9hnq7/T/ZzfkOZ1S0RPgX2QNspcBGGTgz4/QRpClrCTQbM59PO15jXa
	NBz6irGwOLc6pDtF0hXiQ/l77cBct4rg6FvKSPF/tjSAosQcoZKBXr36MLchUuIkpVSrsZr6AWT
	1ddwlW5U5lTUV2h19GEs2/6NpgJDgDqjMOrKOWQEKZFvTWIe9GaPoD7RW5O+QJU1dovoFC8Ofbx
	3PqUjq/9v1RP8bpERLMNf+z1kiF1Tj1m3Qn5Ie3noC0KM/evscujfDcLtyqI0rezBfUtg7soJsb
	JTYwQnk8C/99H6LbA1lKc=
X-Received: by 2002:a05:6820:83d8:10b0:6d8:1b5b:3a74 with SMTP id 006d021491bc7-714f24fa260mr6089194eaf.8.1793783289641;
        Wed, 04 Nov 2026 01:08:09 -0800 (PST)
X-Received: by 2002:a05:6820:83d8:10b0:6d8:1b5b:3a74 with SMTP id 006d021491bc7-714f24fa260mr6089177eaf.8.1793783289178;
        Wed, 04 Nov 2026 01:08:09 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3d768c8sm1519846a34.8.2026.11.04.01.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:08:08 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 01:08:00 -0800
Subject: [PATCH v4 1/3] dt-bindings: phy: sc8280xp-qmp-pcie: Add
 vdda-refgen supply for Glymur
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
Message-Id: <20261104-phyrefgen_1104-v4-1-ba508fc6ab40@oss.qualcomm.com>
References: <20261104-phyrefgen_1104-v4-0-ba508fc6ab40@oss.qualcomm.com>
In-Reply-To: <20261104-phyrefgen_1104-v4-0-ba508fc6ab40@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793783286; l=1801;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=b92G5NczVP+u6lrMXts0b8MbJ4fUEmJ5769gnZJqg/U=;
 b=Gxv+gaan867+UwoYMh4j8LOZPhDAiDGdwJjc0Nl7Ek5ojWemHz7/FbNeO0KGJ5PqK66Twnqsy
 lE0fE8ukzNaAYc3ggC2LyVdt8uxWo3WL/2KDX7TMWIutzuQT7HxAGLl
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeaf5fa cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=neprlRFrkYi1VxbfstQA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: w5IWQOVyT3FlKTUWHBh0uObt87yd9o9O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX4UI8XqHSx7BS
 pLHfkFJBZb+g5cX+JBye1CfK+YhJnwS2zwPL5JmGJc4bm6LHzGaZ6TVwHg2c9OXR7hlRKubJtak
 tRWerIfwE/Yuk/aBaHqejYCYOVy3n+9k2bzFvbxujy6zL4f57N15e/tcr/TTVCKcXYWd5OG7m2a
 BkJTi/y5PXBWYNJDA1cFzu8E374b6yLrA/L1vyrHjWCx3DZvfnPEPUlw49aX6wvFVpGimlWVkLf
 Vj1HdX91krQhVkn6X5gGJIMDMWpJGPzqPtFx5ZoR584KplamgN8+KZYFUxdoYC+yICKFSpmWw40
 77bB1qbZzsN0ZOU6P9tGpYkr41F0zyxVKeuYMxHZnmHnMiG6d1fXr6UdxrhXpjobt7BSkpFWaVb
 1oZQ2+wc2cIc9hUim/YYuWTQdF2SVcJX8pHTIGmIXlH8Rzy8KzPiXkGj2KaWLfQ0hU2rbUUoIYu
 wpGtSjxXfsPugIrI8nA==
X-Proofpoint-GUID: w5IWQOVyT3FlKTUWHBh0uObt87yd9o9O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX5HgqHFQVilyC
 uhQB1obMBQmaq20R/2sOYA7PYozybNxMfckZ3zewkOvRkNiKecIefpN2IhYSbpU5BU76UoDd8up
 u+Y8wn+P3VX3yWyoGH1tCkzAAmM2UyA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040036

The PCIe QMP PHYs require a stable reference voltage provided by REFGEN,
which in turn requires two separate LDOs to operate. Without these
supplies, the PCIe PHY cannot work properly.

Add vdda-refgen0p9-supply and vdda-refgen1p2-supply properties. Mark them
as required for the Glymur PCIe QMP PHYs for now, even though it breaks
ABI; other platforms having the same requirement can be added later.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index c0a3e1f160ad..f827abaf22ef 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -104,6 +104,10 @@ properties:
 
   vdda-qref-supply: true
 
+  vdda-refgen0p9-supply: true
+
+  vdda-refgen1p2-supply: true
+
   qcom,4ln-config-sel:
     description: PCIe 4-lane configuration
     $ref: /schemas/types.yaml#/definitions/phandle-array
@@ -280,6 +284,18 @@ allOf:
         "#clock-cells":
           const: 0
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-qmp-gen4x2-pcie-phy
+              - qcom,glymur-qmp-gen5x4-pcie-phy
+    then:
+      required:
+        - vdda-refgen0p9-supply
+        - vdda-refgen1p2-supply
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>

-- 
2.34.1

