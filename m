Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061524F96CB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664837; cv=none; b=o1EZkF2n2LSjLdwapBHDX2CiDCug8L0vLhMxK3G/bJxXJGz+0qDsK2ycH0bAChK8kLYrVBGIzvIChk6Ub4bKLmJLB3hIKloEPiH6xno6DiKMFHhjQpxITgD1g2Rcyw0rOcAXh19+GlP8XH1YG/V29Ft1zvbBbyGvdtuC9TzwhX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664837; c=relaxed/simple;
	bh=KGHGLsMsJX36TQXiVXKufj4XBG89qFl7ziEqUw3fXFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pPDHj874yjcb//M+z+32pyUIgA9icVK6Q2fcVZCB1YYsQDFYpWttLe9s6m28xDh6y8IT7AFcgHIuLj4CBOdkBzFdCjgyX4W9zi+sZsxh/cn1QWuFjy8JppuM0fVz5ZQGCO6WWUtrGUrv4/DXk2wpC4eS7f0bPhMdQSpllS2YByI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pXmrlDr4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SjJSrVH9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXmrlDr4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SjJSrVH9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH63XH1640538
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1mtDDoOH9Y6ZZdQqCFdDMG
	QgG0C+VN6aIHNOTsPFKaI=; b=pXmrlDr45SkcnKzF1pQeHoigZsE6cF3EEnQ/HJ
	c7LMnIk/zvAmMdPrErEESGZliqCxHA2Pke0kEQ9yGjwbFmcmIOsIH0VShQqQZ48o
	OxyUe7xlVEfA+8zsoO+bs8I8zgBXLLv3Sg9VK1FgRV6B0svS01wSyHb4Z22PGBQG
	XhKdKkQLD0GOgYLMPBIgMHX3v1Uwpz52j6cEf63Jimk3CNxjp/jMx+xdbFsD0XXJ
	ZgGzeeWMUXCheABdwveRFyYmhofS/iL86orMrHR5l0BnuTifgcMg3BzITRfS5YSG
	oIqIQSoKo/Gk3BEO5Q9rF4mAtddqZEsOeBgGV3ghyqIUO5+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0tfhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:07:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a01d1d1b6so153867385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789664834; x=1790269634; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1mtDDoOH9Y6ZZdQqCFdDMGQgG0C+VN6aIHNOTsPFKaI=;
        b=SjJSrVH9a8uyDTWWNvYWa5/OrGRnxmzyTB8aEnME8v9dXCk8M9DKp9h6UQ4m0RWC5D
         yCVDgX4mSvxY7CvPUsMaf6xqghLoGmscJCyK+/edA4z8DIKBsS+TsfxJyL1NGbW32xMi
         3aREKqeD9SAacyVQFwCJnu7hdx/wwT9gG2lETWhsuvrlxvC3jFRp11OVEoXYBx+GwP92
         M6iFBYZDsRpGhny7VvUKI0MqoTFjOYTg2Nu8Gq/aHac0fDiQfFHGKNmFbw8IZHPYJGcZ
         ZZY60/vN98CcSCo15adoUKz6FYrjwV1vA3whFqpqXIGHtiAAyynHGn6pbX5q7WmdrCox
         v50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664834; x=1790269634;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1mtDDoOH9Y6ZZdQqCFdDMGQgG0C+VN6aIHNOTsPFKaI=;
        b=Yd1gO+GyNbxCXLm701cjkIg88sRHDa2PJZovNrIcwyaZ1ztneXhXK5X9R9YuK9/dKT
         nMGJ6VO5C8Qs6jxuIJjDRGnpGhO2EQkx4wMynnUBMmMpeSeOe62XvMrCTJIdW8Ygh4vo
         JHRLM1J6SnHLmCEHeYYz7BTABqdWYUNb1mrDhyshsrwgRoAj54+gYehMNFEYtmjozhaC
         4J8XJuHV9hKYkenSu0kDHUeIPRcj+51uPJaZwdmKpCalv9ewdzVcmAbbY4M5dJKGZrbf
         xYcOfc+203ZfSQx2UqCn9ATmcH+mCHgEFA6r/52kFHFoogshoCFkHrBbS3NbqNVs9V7A
         +gNQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6jgSp6g6dw5qluJOWeH0ZxhGacrn7AXmxTB02qCGff+3GLzgGNRF0FLhsP0k8fHqIdR/3k+9AU9P5k38=@vger.kernel.org
X-Gm-Message-State: AFuF++lwx63qSZZ7OchW9v0AQNvVnOEtgBTR58XlBk8QWViyYlkBnHVR
	1ApC5Jkj1mT5OJNLjawpPJFRG/s4yXzu9PEmjvkansMACEvo7XEV/Y1d//MojkNlXKDXZfDaL7+
	gJz9oJP2E7svIu4XTJtU+eXcrFMfb4JeLbHsanKHCS5jdyhtCCLcwGn+rTNCO4vzXnx8=
X-Gm-Gg: AYBFou1iQtcXB9dOB1fbJ1D++hT910UDRJjo35WSWA9iz2VeVgDzrl9orDrOlKOEXQs
	I8bwxmPQnmWgCgwkMYfZzBdEwVneXFEwuvw/0UeVIOgC2W5GE8N/EyyYRhkiM78Rv/iWGL5nipq
	j+94D4GI9bmBdfj5kkmt65+YLQ4NdQ5InGIyFqxsOLm9A5a3+C2POtXN/FjTE8uBRu+NBWIlEJp
	A3NT4HNk/y2S/sYuxKO1sFltA/n+5Si6aS+teyfryToLXO4kW96WkapfvkqYumbEMIrGQEnX1c+
	59awkBtFk0pw28CufTZwLy/L6vyIyvycDJ5/USegTHJhPxAIxUOCwJsrbFKhFvAHKq9z5PeJPgH
	zluqQv/AmI/TacfBorhCf0MguznE=
X-Received: by 2002:a05:620a:2701:b0:93a:3c8a:2025 with SMTP id af79cd13be357-93bda609762mr27858285a.34.1789664833449;
        Thu, 17 Sep 2026 10:07:13 -0700 (PDT)
X-Received: by 2002:a05:620a:2701:b0:93a:3c8a:2025 with SMTP id af79cd13be357-93bda609762mr27851885a.34.1789664832968;
        Thu, 17 Sep 2026 10:07:12 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd232d5bsm88504615e9.12.2026.09.17.10.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:07:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 19:07:00 +0200
Subject: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Document the Nord
 DWC3 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-nord-usb-dwc3-dt-v2-1-8f88aa30c434@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADMerGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDS0Nz3bz8ohTd0uIk3ZTyZGPdlBLdRHNLc0PTNGMT88REJaC2gqLUtMw
 KsJHRsbW1ADdIA0diAAAA
X-Change-ID: 20260917-nord-usb-dwc3-dt-a79715f347aa
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2010;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KGHGLsMsJX36TQXiVXKufj4XBG89qFl7ziEqUw3fXFk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqrB43gyMjNy/fhKy22+xk4mS9dmiLMF8lds1sn
 U5Dg4iuXBSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqweNwAKCRAFnS7L/zaE
 w2kSD/0WmjeK11lDWVP/isRQFbdEaQ0ZfZFEqrrj/Q2NVIyBnpVXr1+83r09KvxqIfcC3iAVoyd
 KOeYI3iWOl6iNKDnjkfF1MHentUdAAkhbWpduQAg2X1TgYyzCdeugBGK6oeoSuwPV7ohqh9m4d8
 Id6yOhYYvfcUTqELD/UtLL41dgJ3RscufoLQ36b44erjGKYukIPZMgD+afaP3tWEJmygDo/mjZO
 mhLA9adfSxEZCdHUxIGRDyICv/7LxoZN+kYgbn3StWhyv6QSkJ2J8QPwvQCzWkcIlHW0rnmUGlf
 RAm5zq8CBVwYxjGabVjy5QU33lqoziCSvuLtmdpRQ3aBPMhejoItJzMSOkhiviJbz0Imf7S/UjM
 M2t6HfR/x71G0DJrvBj3+kbtaj6KprE8bwAIxm3jau2o8U2gZCplloIX3Mwl4KdJKQTUYf+WoIt
 CpFIP/9AyoXYXd81tqFf9DKiIb5yQehqH+/YD7JT3fDAzxY6v7z/u1fXNIZosB19UCAvyqGzccn
 N0CB931hOpzkT5ZzBlhae+QThqjeZElw/phbnYitR/I9bTTaP4ipUtNjX4l7uYbyMX48DLMH0s3
 5iwDVw9h9IdiaIjzM0iu3v4iRds3KBUHE0CN06DyNaeNqNLVOm5F55Hlo5fUbLKs8VF9yzbfypm
 A/gWnbLHGNXsSPA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: wUg2khnalWfCrEw8DXGUeBT_JtLX4m8Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI0MyBTYWx0ZWRfX3JMO0gymGRzI
 S9wx1kI4imt0BVz4DAMZ8HwAJXacrP21pOZ7afTtXpxZCOPA5PFuwQZj4QWbQJf65/hw0Wub2x8
 WQRIv9+SAMp04HOJkS6oCOhCc6Ud74I=
X-Proofpoint-GUID: wUg2khnalWfCrEw8DXGUeBT_JtLX4m8Q
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aac1e42 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_K4BdmWTd12dlxu9SSYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI0MyBTYWx0ZWRfXyvu+iwPN9jhU
 M5ySKtuZJ/UG28i8d2+ZJbpBJ9VlvQW67X7JgHk+l6l2Vt57EU/Sl+IslVPg2Yd9P/ndvn4qyf3
 +0pQOa/uzbE1haWqBj0h7DLeVsLV5MA2H/zhSvxI0skV2DrAHM4nAw8RU7MMhmfEZAeezT22mIJ
 /Rc95dHoDv0zbAyf5xX9FoB/Ckdy8rqD8WLNQDzg7y8hATwjuE4np4eujoWPDZTVvS8pp8+LZOB
 9JGjmn92c44xhTttxV8vFMTdimWZS1rMn3Rd1R0xcMvlu5dJD5A0IXV0MR/NNNc43zDTdOsLJ46
 TPDjK001jPCZxy3kw8RogCaLZUE0VH5fPIQumvlDvNJvD5Mf/SB+qrD3HLq7+89dSaiSOYidkMm
 CATavrJUsL3I/WjG+viIRlP3VSyjv5lrwcBh4Lw1I7PpVWHX+by+p9AZS1Tue9QsAjypmer1FRj
 El4fVln+E2tRIicpcrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170243

Add a compatible for the DWC3 USB controller found on the Qualcomm Nord
SoC.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260901103300.60803-1-shengchao.guo@oss.qualcomm.com
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
- Fix the interrupt constraints for Nord: we also require hs_phy_irq
- Link to v1: https://lore.kernel.org/all/20260901103300.60803-1-shengchao.guo@oss.qualcomm.com/
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 9f91c8711e022907d7367a762d3d556e90b50fd4..c1b5f87149f7ca0873bb0d715c30ab999ad21d2f 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -44,6 +44,7 @@ properties:
           - qcom,msm8994-dwc3
           - qcom,msm8996-dwc3
           - qcom,msm8998-dwc3
+          - qcom,nord-dwc3
           - qcom,qcm2290-dwc3
           - qcom,qcs404-dwc3
           - qcom,qcs615-dwc3
@@ -361,6 +362,7 @@ allOf:
             enum:
               - qcom,eliza-dwc3
               - qcom,milos-dwc3
+              - qcom,nord-dwc3
               - qcom,qcm2290-dwc3
               - qcom,qcs615-dwc3
               - qcom,sar2130p-dwc3
@@ -570,6 +572,7 @@ allOf:
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3
               - qcom,maili-dwc3
+              - qcom,nord-dwc3
               - qcom,qcs615-dwc3
               - qcom,qcs8300-dwc3
               - qcom,qdu1000-dwc3

---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260917-nord-usb-dwc3-dt-a79715f347aa

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

