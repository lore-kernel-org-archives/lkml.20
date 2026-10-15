Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291FC51C341
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058126; cv=none; b=q1ySVikZ1rsbHh8MrWIPxNe6WPNMsIF5lnw0cc+VQ887zbzhwpIAMkrIqVhUBivB7byaO4nE8aC0y0TzEn65XgdBnMe3ebbtWqPq40GGBmDqpeQYpVlIUHLyUKLERtSisBVrAxkT6ZsPqS+g3+lgW3UHwb/5nUL6LAmhydaBuEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058126; c=relaxed/simple;
	bh=KUEHUBPe/fn8mPYYNLva7h/Xl1fyUiFTYnaelqktlMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M41yYUaHCiyDjilKQ/SEh7gisLw4jdnqaqYVo1GI+0vw7VPdh2H+VURTicI3r7+d16ez1lsIGitQWxj2Rm39xVxjdFXXSgWEvbIHfVohzFRN6KZdJn3rNrOFxm9YpDvcISaEDBTFuguJSTSHmxn1xToLD71BGd6tmmt8z4je64I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cbog5p3N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HWuez7Pt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cbog5p3N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HWuez7Pt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kIml1507308
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gvh+Pd3D3uvOpYm33562JNzfr/Hgc20K0knnG1EMfRc=; b=cbog5p3NFk6uvDvW
	RCQxAiR7P4oDuwK22erMzrpGhvtgAC/0kEK7esX3pjgny8LJDieORWgTGyW4/bAQ
	vPN6ysB1ZaelBGPIjXrqHlKw6fc4iAPhyBkGIr71yn+EqMK1+oTbrCl4DHeVFEYQ
	uSAZWoz7FsaMUXkWCAH6Y0x8M+BfqCMCfUdmZINFHbUsA9s79cQkXinqDkQbTNgm
	1ncqS/lyi5VIlftYc+c2bBYUkUvyAHbFhn+59fhrUeLGwQW8n7LygMKuqO1VrwM2
	IdndfGqIcAwn4GmYZUo/ixYcfbAKQbbKFXtcm4RHE6WVSehm2ffc8YYrBLZXgYoV
	A4QUIw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd7bpbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so2787027a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058116; x=1792662916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gvh+Pd3D3uvOpYm33562JNzfr/Hgc20K0knnG1EMfRc=;
        b=HWuez7PtPeVE9JcVVvTT4ZJmGcom67osgSeALobc5JGg1FhKUINgvDTBx70MHsnGXe
         uz337MbP+w5b3k554qat+BgHOPrFrrHu0FvT8z7SfPyZ4iuDfrdaz/AraSTkzcjlc81n
         YUuFLi58gEVzY6I+w4CEeqxrlqcxnC5Iex9Ad9I1ed7oQzJt3heFyieAig4dqDObq7Ds
         KOSHBuR3+1b1/YRDqJ40bYq0uW8piGeq/He/Wxwe8gRrO4OZuoqwgiRwv0pzkvEaIY9F
         xflCLUAwE7vgTO0zm79BK9rm8HzpiVfXC/iKu9D9KtHxp9mIFBbfpDiUY6GwBdgBIs5y
         0OFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058116; x=1792662916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gvh+Pd3D3uvOpYm33562JNzfr/Hgc20K0knnG1EMfRc=;
        b=agWu9TfHKFYuEjvb4MhbD2oMFUFOgGpe8tcVGrtvI0vOx/C1Ys4z3mbUPguzUorwPo
         ZhbgCOImswiDWSmnqvvrK1eVi8c1tgTVFA9Zswp1qJwl9dB4kJ4/mGLvnLb9B9T8n+3i
         RNsff3QLrCHD/ZJWWDyatR8tEfraaJhDAyB2wKbVU5E5SeLUEGxbwmbsbZSqwhYaoYFb
         isBS4lo99wsmnOntBEF6ui3U4vUunFKMej1EwPPfvKxzowob/b+E2LNf0OrzuoEd2msc
         jfROlDQLELn7HxY6jv9Od5NWBIcYsycV/jbh69xNaZr4hbhusQ2XgGG3rki8HWQwBpgP
         kS4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxYeIQkMkhJBE2f5dz1QqDbm9Q9yHbOq6W4a5Po1CkTy0bBaCvYSYbHsorNh2kTvmhsVkIhAIVkPls1Jt4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI30GUwpAKddVBXAuBxNwhXR/J8JkXxUzeyfDPIcaozHy4En3ow
	DWK0PZbeRTygt3kJWhZOJ71+4iI7NliYdLqEPseDz5fQF580Q8gMieZelB9xnDsKtthwPzUTm+U
	ielsAsgX10lSe2jVDMbKMYxlcS9VitdCDWGDrcDsCS31DwVCV+X5/rZiBG6wDoD5LA9A=
X-Gm-Gg: AYBFou3a5mX/P10ELEnVcfS3jiME2q1T3/eHkGpZA9LJenhDxUBfq8MxQKanR7PpgK3
	khjDxeObnhRL1BHTsh5pwA8sbD5VtU84mIGp9C8Tbek92ThD0Omr8i8+aW/IHcrXfTn3CttNx3Q
	KiXByvhZ+/xoWTYlCf19cAg3MPkCXHLK//yzWKM5wZKUp5Uhf/LMPAL4o2bzl03bMhZUaFuv83c
	V0de2gl4b+VY1a9w7evSr5Nsl7nO53Qcmwq0B638YhACMbA9qcE0SynqEaGuO2jYRWjE/NkDwbJ
	+6z0pyDNyf7MqLkqUsQbW10c6rVkkUUNLBu2J+vcWw5rz97rn9A3l6/3OXHMj/D6WGWz5doTOwT
	pxIEZP0uydH/xfYurEI7RirQE45MjrGTmS3oO
X-Received: by 2002:a17:90b:1c04:b0:3ac:9176:e83c with SMTP id 98e67ed59e1d1-3ac9176f205mr2470068a91.12.1792058116333;
        Thu, 15 Oct 2026 02:55:16 -0700 (PDT)
X-Received: by 2002:a17:90b:1c04:b0:3ac:9176:e83c with SMTP id 98e67ed59e1d1-3ac9176f205mr2470023a91.12.1792058115786;
        Thu, 15 Oct 2026 02:55:15 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e1a11sm3612322a91.7.2026.10.15.02.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:15 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:24:32 +0530
Subject: [PATCH v2 1/5] dt-bindings: display/msm: dp-controller: Document
 Kaanapali
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-kaanapali_dp-v2-1-c15cb83d9140@oss.qualcomm.com>
References: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
In-Reply-To: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058098; l=2211;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=KUEHUBPe/fn8mPYYNLva7h/Xl1fyUiFTYnaelqktlMM=;
 b=jJjbWunLHnUWwxQDX4nnUy9L6muiboocim1vSEKrd2ADhoYhYivBvJirbOOzAj3UJQEb4qzvH
 wsiPzxH2MpGCoIjxMpZYx8VBep83kESwIa/R5dq4B7cgvfcSiT9tzjT
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad0a305 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=V3dFujuFVO17DJ7hoKIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: WHFWWQMKG8BUdKmQ96E61dHvjPGAoZDf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXzFobTwZ+0240
 jtXRkjqHwwjgQY62WzpJhylALxpqG6CtrfJHE0nlMvyF1zca3o5s1YnmxreLxRENaTu2Gv5IWQJ
 gH46hbqnqH3HbXWnwFtpfOI7LI54Ogi9Z7V89+rcD/myjozazr0wc5BCqDkFrEnHjlaNcGUYkpv
 AoTlYoRdLbiVXBnRa1jW3W2tIh2gl3NPq5rD9VDhwtEocJUpJDDs6VEuqX2TolCRUR+0E6QKZQ+
 0kmlLSyJP3ZGrGW+38P/a89LIjG6U6JMGjK1qVBo2saTCLB26HZArlDr13rRBRC9tpDseUrzu8V
 1/Y9C85rIYWA15OJIfZgV00L10SarVBUYhmakCuxb5OdJa4PT7gLxd8UbqEz+dIZwnn9bG5B3O8
 N5x1Tdnwf9/FRiw976HxTC3ZPd2axOAy2rLtQn6IIVY5SWktOfMxavM0R4Uu6xPuHdLhk1eG2xn
 N++iJX3Pr34QCjlxWzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX4OteDBUTr9fL
 SjJEocOBa05LloSPEJlgopK5HjxJG9DzKAruEOQqfl69c5z7s1X9eJoG3uJ9xyB0OFFEaf1lN8G
 WRyZRkkXY0ZAw1oU5Snjs1Tq0rjPeS8=
X-Proofpoint-ORIG-GUID: WHFWWQMKG8BUdKmQ96E61dHvjPGAoZDf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150039

Document the DisplayPort controller on Qualcomm Kaanapali.

Kaanapali uses its own DP compatible string and has a resource
layout with five register ranges and six clocks. Add SoC-specific
constraints for those resource counts.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml           | 19 +++++++++++++++++++
 .../bindings/display/msm/qcom,kaanapali-mdss.yaml     |  6 ++++++
 2 files changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 094a6383bb77..0240e3c1a6d9 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -19,6 +19,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dp
+          - qcom,kaanapali-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp
@@ -290,6 +291,24 @@ allOf:
           minItems: 6
           maxItems: 6
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,kaanapali-dp
+    then:
+      properties:
+        reg:
+          minItems: 5
+          maxItems: 5
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clock-names:
+          minItems: 6
+          maxItems: 6
+
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
index 9f935defd6b1..83e3596ba0ed 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
@@ -48,6 +48,12 @@ patternProperties:
       compatible:
         const: qcom,kaanapali-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,kaanapali-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     additionalProperties: true

-- 
2.34.1

