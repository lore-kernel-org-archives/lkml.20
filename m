Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB47617B50A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071345; cv=none; b=NyVLTYNIBv/b3ANQhWRBURmMxn8fMRgKJjPhek1ZvyMkn5jc+bdF0Wiwdrob4qCjjziQBpeXuq0W4rvJtkJDAhdF6B35XCv2ZMyc3ELlaqWJOrql/sgIOrv29uRsX8JOrcVhjSbSflRB+T0KbqDjdB9ggXJAtYYU+e4bvhgEreI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071345; c=relaxed/simple;
	bh=hCO4Jz2WmavWtt++4VGHYxabDTrf/xVNhLgsFbDLW48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hxpMdZZENR/k8fpdsUJWlzBenQ5u7BJsMkqi9emO5pbY9hgcTvrjevIQYt26iIqyHWCouK5L7y1ookY94MkYhU34kW7CZeXHwmrtJ/7AvkbtNF5zLruamIwoKxlwzFMRYKTDdGjofWlhcB0J3oPqI3HBvUbr/Tv+99qHhGvincY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y+DZxHhb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZiooOUnO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y+DZxHhb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZiooOUnO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jNuP2114130
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i690FW/98Pummk3TX1MdQR5TM1eRlPMuM4D/m9Oj9pU=; b=Y+DZxHhb1QbpshB9
	dqQiWTjFWbRFdw0s/qlcqC7a5arIJG6DQmFP0Os/2lhdwZbA7LrVS76DctD96LZG
	lk+S3H5CtiRM8nlSYNnnBrXGQ8q43IgNLKfv75rV8VKsmAGlsXBP2AggeEqdNio7
	AzI9R+NWylw6aFsZmuOh5lzUMFX/SItjQfsjoTY9/b1223L7kYe7Qt6kEowVA1Cj
	w1gx5V7tLLHZ+cssa5bVGThfdvbWeTRJo76zipqjJN8AoL7zS+BD9Bt8O+2N5mxu
	VFgxK3cTsix8o23YJt+U+dsNW6kaiD0JmBiRtPSqFu2RdsAfPJG34lKMktmgMyza
	m8sQqg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmyb9qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:35:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd60a365440so2954728a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792071342; x=1792676142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i690FW/98Pummk3TX1MdQR5TM1eRlPMuM4D/m9Oj9pU=;
        b=ZiooOUnO98Dt+EoXZMlUcnkeusSGh3AqWn/o5dnJ9lydl4fwSmN87ZQU9zgd/40H5r
         hKg53HWXWaLJ53AA3bd/Wx1dotGfAaRPk6gRlXP1h0lluvCHqGLsZOI1R2EoCqHSsr1U
         TeRHtFXV35QCGGxXNYFjYqC5tyM9NvCSZqZDLHnFee78ZD6+VlCc38dQg33ZkZepzDQe
         UIvo1vZVpE7y56VcFJEvYV/SIbti53+YH4cmynqqrh1xo+cB9tLzeBxxZtAWAjtxir2O
         zese233nfjtCywdkmbb0Xvq6wfgfnFgJGF+xN2KRCEmcO94HgXiDj9AVR8im3vKx4wBN
         270Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071342; x=1792676142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i690FW/98Pummk3TX1MdQR5TM1eRlPMuM4D/m9Oj9pU=;
        b=DHCBBYeYvwXTL5yuUJRZE0c3c2OAvhKAK9XRv93ir4+X2YrrnMnSqOLru7KsS7wk5U
         ymnU/n1mGWHwZg8Iy46Bug+1+iIRc5Pty7cwhjbsL9bYz8+0PaMUh6QS2W47lI9OTHlR
         kliNXGAzb3DlwlKd8GF9Ip3u76TdLEHK7KUf4Ce2z6E2FpB1CqW80B0c7P1wAlb2xK+Q
         BYX0xu0ogia3iux/dH5hm01FnfOXu5EcvX6ylJ/HHMZI3BzVrvUPOzb3k4UDPQWZf/uP
         Lha5pphABRaohfwyXzh9/xEMRS8sGxug/onyQMAICFWrY/2O1KrkzQx3xJ+3cb2Y7xHU
         jGPg==
X-Forwarded-Encrypted: i=1; AKwUvBx/6yjUbqItwzHLSTDpZHCHCgcp/6Fi06t6ZY5FvM00SlgrIuagDWn9C2pkxBxAllzfT2ZDV9G8PO+w/70=@vger.kernel.org
X-Gm-Message-State: AFq9FYLr2vgv2NscD2i/49SIiOuayj10GAyl5CUH2FBMeM2oNXMwvqV/
	IgSL9ERYtJ8ZHZiaKGrKK8d0c6SjOtRXTWj9HbZ6E1lbEp7lG4FqERDSpk1eYQvA74xsY0PSu2F
	l6qsznedtd1hkxSqEujfXM2BZHqvxZBwceHaIhLmjNAM9pHoWHKPOI4nRkVt0Uurkkwc=
X-Gm-Gg: AYBFou1e/jmE8GlUEcYjeESYxx1OmcwPyv3ne5wV3mFHvo4y82x/DnxAtsRKKrFkAKb
	nurMEWLs3RbwiLExSHnbB7iDWwmZArUX0jBxNxebERWmgF4GQOKvM/IX+Z6ZTwkyAXRCbmT03Mq
	i1FBBUIUo93zVrK63c0g3HPzGCnI1b7XEqO7hEPAAxXe8KU+bLE6Ls2ZabHze41+fCuS2Ecmero
	xFRLy7K8PDEAPMfHcUFlA6Re96jxJWbYIenwBhxjQoUMwau1v81TQBzk1j6IgRzTBL5GkIH1gS3
	MEvOUFp0K9UfZhIrqNWjnKLQlvOKluzXHXafQSwYVKPQsv4jezvCpTJUlNYDGfVv0YXp01ktxDr
	T56rUY43BLQ720PmW2Y/D+mAqmWwCkA==
X-Received: by 2002:a05:6a20:734b:b0:3e1:9071:acdd with SMTP id adf61e73a8af0-3e19071d800mr12312735637.35.1792071342332;
        Thu, 15 Oct 2026 06:35:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:734b:b0:3e1:9071:acdd with SMTP id adf61e73a8af0-3e19071d800mr12312714637.35.1792071341808;
        Thu, 15 Oct 2026 06:35:41 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89ec1705f5dsm476617b3a.53.2026.10.15.06.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:35:41 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 19:05:02 +0530
Subject: [PATCH 2/4] dt-bindings: clock: qcom: Add AV1E clock controller on
 Glymur SoC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-glymur-av1ecc-v1-2-448a476d54af@oss.qualcomm.com>
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
In-Reply-To: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: uj3HAj4jcRgwQoYv2VqMiDe41DqEcSB1
X-Proofpoint-ORIG-GUID: uj3HAj4jcRgwQoYv2VqMiDe41DqEcSB1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX4h6wy7sszUdY
 g52qeHcZt41mHasu3rkqYMKJM4W4nzuEjWIRBJt0azJVGTVzMlCtv+15gatCd6EQNoFo/czoRbu
 7eNXwjiVxNOJfLtUOf9+OsggRAb14rQ=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0d6af cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7l5iJHG2dVGL7M6DokUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfXyUVBjSjN8Uc/
 GIqBxpDCUbERK80CQO28+QC4WQagekUkx1dWRShjw78hNMYbUtwl1+23rYVfKNjPn12adTC5tbz
 GUr/2jvIQVNeLAhiLqebqUVsQxFbDpy64zUwnghka07xuUByWdJ3w4y5xg1ej++GLbb/p3Wy8k0
 Eiq3gVR0bR0GoUUY5dtDYNPNEHKAJcN7BOu1S41pAAYRHapMjcwzTUlRSbq9nA01fZczhkxMzos
 MaQ5lsyYCk/Do9ya4YkKZOMFMF1ZzTEzQinft9Ay9uJHtBsM2iaWHMZ0pAnfGB2NDdbZQLbrHvA
 Ql+0A5pv/IdC1gTJX2NZf3NSl0ib5fNIO4lZ++5gQ3d5b6Yv8d4DK07+0OLD/URiZ+ZBMOQVtVX
 6I0khb9ui0AiR5smOEsXndPXH0vAmC0DpF4C78aGHjeayxCmit+M7swTsiuJN5CBkQfT5JBkhXg
 f1lVgjqm1xqtEdtSY5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150054

Add compatible string for video AV1 encoder clock controller (AV1ECC)
and the corresponding bindings for Qualcomm Glymur SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  2 ++
 include/dt-bindings/clock/qcom,glymur-av1ecc.h     | 35 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index e985a450451d5e3429cf4630fb59268d9d894eb1..9f460fc4d10eb9245b6b9e55d0099bb1df2045ad 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on SM8450.
 
   See also:
+    include/dt-bindings/clock/qcom,glymur-av1ecc.h
     include/dt-bindings/clock/qcom,glymur-videocc.h
     include/dt-bindings/clock/qcom,hawi-videocc.h
     include/dt-bindings/clock/qcom,kaanapali-videocc.h
@@ -28,6 +29,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,glymur-av1ecc
       - qcom,glymur-videocc
       - qcom,hawi-videocc
       - qcom,kaanapali-videocc
diff --git a/include/dt-bindings/clock/qcom,glymur-av1ecc.h b/include/dt-bindings/clock/qcom,glymur-av1ecc.h
new file mode 100644
index 0000000000000000000000000000000000000000..02b5f3d91a63432bc74996153ef1e2f6b7c786fb
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-av1ecc.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_AV1E_CC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_AV1E_CC_GLYMUR_H
+
+/* AV1E_CC clocks */
+#define AV1E_CC_AHB_CLK						0
+#define AV1E_CC_AV1E_CORE_APB_CLK				1
+#define AV1E_CC_AV1E_CORE_AXI_CLK				2
+#define AV1E_CC_AV1E_CORE_CLK					3
+#define AV1E_CC_AV1E_CORE_CLK_SRC				4
+#define AV1E_CC_AV1E_GDSC_NOC_AHB_CLK				5
+#define AV1E_CC_AV1E_NOC_AHB_CLK				6
+#define AV1E_CC_AV1E_NOC_AHB_DIV_CLK_SRC			7
+#define AV1E_CC_AV1E_NOC_CORE_AXI_CLK				8
+#define AV1E_CC_AV1E_NOC_XO_CLK					9
+#define AV1E_CC_AV1E_XO_CLK_SRC					10
+#define AV1E_CC_PLL0						11
+
+/* AV1E_CC power domains */
+#define AV1E_CC_CORE_GDSC					0
+
+/* AV1E_CC resets */
+#define AV1E_CC_AV1E_CORE_AXI_CLK_ARES				0
+#define AV1E_CC_AV1E_CORE_CLK_ARES				1
+#define AV1E_CC_AV1E_GDSC_NOC_AHB_CLK_ARES			2
+#define AV1E_CC_AV1E_NOC_CORE_AXI_CLK_ARES			3
+#define AV1E_CC_AV1E_NOC_XO_CLK_ARES				4
+#define AV1E_CC_CORE_BCR					5
+#define AV1E_CC_NOC_BCR						6
+
+#endif

-- 
2.34.1

