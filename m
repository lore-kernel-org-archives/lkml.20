Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8522C3F1ABB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886634; cv=none; b=bk+ptJfWJNCmRtGgUKBy0QWaDZ3AOC6pJ18G08GjYN2+rnqiuhJ9YjoL9JczggztQYHtbEbHrZdyqoIxMMuxfdO5JlRx0llvfcgFjaQYiLXvW/h96YmD6tP5bIpDSXsufNlGBZ2seuucf6RMQrZQ/jnks31LfgMHPdPCeaEPHgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886634; c=relaxed/simple;
	bh=HS/qHG1ys4GAFjcZw/lOrmC9aaejOkm0n6MjuWUf29o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JgCYG0rJ6vVXsiM4lirJkLloQQsgBNnFfNwg6zjaTLf6FbXDyDJ4xnqbyGeG15lbhMGIQRCchm0grPq3zPaoZd5LjVycNO/5iegQZkxNeOLiakXmdyE0UeNDYyaMFlUpv4wUoe5Aesq7M8s2SQPCgIOlFWdL54jai9JMfw0PrTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QdNU+glv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJrFzNZ8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QdNU+glv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJrFzNZ8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8Q5FH988763
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y0VtVTcJUFOCOxMQYqvfCfN50bwMzVe/VZPBcATXvjo=; b=QdNU+glvOPWrDDKx
	+HBbn2L6k8rhNlLZ0fDLzBJm/fa7i442UXidbGoa4KU1NY0pge15mGAJREC/XpYD
	KcdeNPtVYdqtsNjx4ff5OenbITDLqSj9EJSy4EaQl9S3XO/iiKhXv/hT6CBr0SqI
	8FLM5asPh6dDewCE8Kv8SNDUrWTxWHy/AXljjyhl61rWklemn8SzfDFk0Q2q1JxR
	LiZbWr4COXaWu77dJl8oswCT1eRQJn7Mdfcum/iVspd19SbspP73G7Y2Ig06HYg6
	/ARVNozs5eLefKzV7yWC4wzZoxb6lW2Fp/GxfaVWpbLSuN6mX3L0YmDNm+W2by7P
	JM1Nyw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hcacug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:17:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd5c91bbc36so2574355a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886632; x=1792491432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y0VtVTcJUFOCOxMQYqvfCfN50bwMzVe/VZPBcATXvjo=;
        b=jJrFzNZ8jcSmi1DQTV86X2Vof6CZGjMus2ga8fSAyojBqc1InOBEgtvaIAh6IrquIo
         kBMoFluvk4EhY9xX/IYLuIskn4RIiWNI/bS4dWFYpy27P7VFGvruFa0xUAll8Vy5HBsy
         1TpGEZg+zRbqiLXCibs6s6QT3hOnW1AmI8niPvNqKc/q6QVPLBKpQQiFR8KFpv/PMjf3
         Uy8LL/Kyn60wlqhzWliG5Ekh2YRJOGWBSjiEcK/xiIwwdan5C4vKIZydbb5FRE/mQfvO
         tLkgeszktPWWXKV3+f1KR7aLMfCETyx0sW1E5aflVPYCyWNC+UhcCxdUHtT19gabe6zN
         12bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886632; x=1792491432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y0VtVTcJUFOCOxMQYqvfCfN50bwMzVe/VZPBcATXvjo=;
        b=1BtSGuVwidjw65KhFh2AljEv4EuiY0gXFNbs1m9T4VYNJVU2fR6pbMPrEgekCTrZID
         v+PS6vm7D6I+x4X0cFvGxSIS9Nmaq5Us0eJpE0A4RBWg/7Fam/fNB/YVowP8AvKJ2KtH
         BkT0OPwIxYWCTs1eu1RxqAC+0ev/mT/+/pkkzXgLi/vSDHnP748VS7gP742o3gYb+pH1
         UJ4WE9QsvazuNI57sHlnve+NDYNsKEzjA/UT+mhMaCGxlyciZdfn+IfW2R3sGyenjDuF
         lAkSUxTKMOwVx1AEsiFqh+27esfUq7yaMeXo4TbJekELJQb10CmyoQy9CIq4+xqjwipP
         oLtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJzjaLd9qxIjbzeaA6nHuuEOQxl3Cfff/W40BOP16kYnHy3K90MHkezFJyDGqSyaR2zCIKXumVMwAX7C0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLE48qKHWl7h1YvAdTGAqdB9TEqFqg3akMrTZThphe0Nx71Kb9I
	t9lM/lJbgtw5Yx/LCptZwM4N+VpE8oz4Xd+1kW/SqoeRYJou10O58HOkbNs06aIKJ5Ng1Xs0O0x
	QLmoRHJio+13TpwGC+TodxwnaYBrlR6Pm6y1SKZA8YwPKezbd4jJH4/9MfDnGQAh2Xo0=
X-Gm-Gg: AYBFou03U8+yw2HTO5gyoTyYnyNAv9X1/jxdKtG02XXh5RACSVm8NIKf2c2Ra1U4C+5
	4aCuZvUC5EYOKSst3Gs9VSM/ZGoMF2TPKnH7jRqriwbRsMGMcQ54zGgdrbdtPqNHa3E+wexl5Pa
	mBddeyTGNM06bTdAm143HJxIwGEvAoDcFaYisWw+IkAl+h0mu4wFWDEscMD1/EeY9kLNd9bGyHi
	4gc1vJIVMdR4mrvIouqNgX1s3RQMGbkX6X1e9QqbxbAI1w49qbwovjt1UwVxgWaZhtY33I5cMHF
	9sMVDI8MHNtiMp1XYVC8xhV2ZHFc/iB468zfsXo4vp9+m/7MDR697eIi7S7MIySGz1KECU6YIfD
	pClGAs9LyU13DRBEm9xUDgvTKthhK+wHB7q8ZndJoG+uL/9U=
X-Received: by 2002:a05:6300:6bc8:10b0:3e1:9071:acb1 with SMTP id adf61e73a8af0-3e19071d79emr3697971637.89.1791886632280;
        Tue, 13 Oct 2026 03:17:12 -0700 (PDT)
X-Received: by 2002:a05:6300:6bc8:10b0:3e1:9071:acb1 with SMTP id adf61e73a8af0-3e19071d79emr3697953637.89.1791886631811;
        Tue, 13 Oct 2026 03:17:11 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd5dadd0986sm4186777a12.18.2026.10.13.03.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:17:11 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 03:16:45 -0700
Subject: [PATCH v3 1/3] dt-bindings: phy: sc8280xp-qmp-pcie: Add
 vdda-refgen supply for Glymur
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-phy_refgen_1012-v3-1-f28305289499@oss.qualcomm.com>
References: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
In-Reply-To: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886628; l=1740;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=HS/qHG1ys4GAFjcZw/lOrmC9aaejOkm0n6MjuWUf29o=;
 b=cE/+x1bGz78TWOTImO0Py5TvqJyvE5p3icxE1EKEELmdUHGE26npzg5tBX7iGwXP3/k+o+0ub
 Y2in/SCUkknAQ/TurPuaKYyNcHWmMWRvFtaPaSPcnf0QYxrp9RXQStE
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX2GxDWzwvJYZ5
 9NOsKTdnZdSjLWeVou75mq7wY41Jhm/zHMmhRawuEpw6mc7dAt238Vu9/bCQV+PLY4Piv39yLu+
 e1yKt71oBbNGYTDehMsPftykmp7mBF1pP8ttjouz4KEOL8jzUzKttaClcFNqV+aPcdWbKoaLvfc
 /a5omQoJyLUGxSWXjG0eBwNqm9V5wwFVlMSaX3DDJbhh7fEse3ji19iQpEIydXrrUad9l3Nkmm/
 j4BwEg4hCyb4GCjPI+FGDlqOxN4KM0C7qNvXfgD6GnYOvf+t0OSbuGgR0Hi3LnvE2/WSdE7qSkP
 oG0qzoAT1lQyn87FJe36lqeDsIqB57hCZnbuu2xBZbCibyrUsE3TU+qt2EZbnZH3Gv4i+7S5UOv
 5bvgoYe1k1mVnsTAm6Po/z+fOSXB5T2iJ8Fl+0GZuhkdM3LQXzrb1XH9egLbRDillxOyJA/nqvO
 x0VLHJ6FC8GpKYeZ5fQ==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6ace0528 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=neprlRFrkYi1VxbfstQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: CjEBq0UHnyJAMYHX795ZFQIhqT6oZG2T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfXzZE30ow4ofFU
 1fPo21fVIHYM2DKOgTIKaY34vWcvUXCeZOJLkmaezXqr28yLL9GPng+yyxL/eHdcPRW07YFS2/g
 /CNk5GleSDHXz8dfd6IW6zNnW3P+moU=
X-Proofpoint-GUID: CjEBq0UHnyJAMYHX795ZFQIhqT6oZG2T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130040

The PCIe QMP PHYs require a stable reference voltage provided by REFGEN,
which in turn requires two separate LDOs to operate. Without these
supplies, the PCIe PHY cannot work properly.

Add vdda-refgen0p9-supply and vdda-refgen1p2-supply properties. Mark them
as required for the Glymur PCIe QMP PHYs for now, even though it breaks
ABI; other platforms having the same requirement can be added later.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

