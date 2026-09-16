Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB1222157B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537547; cv=none; b=CzX/h+dEZ6jl4zPk0QTiGM8xadvYAncMbv3R4zQ2CCO1TLPdNdNos5AGS6jyQ8bfH45Zol1hjHXDNjOlnoaV4U4QVV+5BfMux9WbrkKDMGDML1klYMFP65A7Issfhn3TO6o+yZp2yc0Eh5w+VZkZewUgriuXATcffnVe0c2+jFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537547; c=relaxed/simple;
	bh=rmypXG8PkZQdVlXsiCTpd3+Q/qn4BKM993nWuXndS3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r89IyZFhvIYUvOvzIaAEiD5xwuakPNLqNNTvU4sU66R26mWg0PAGVrFkHZIXYDaKmNgAKvvhcNg+pDtIeNCCU9vPOjB/M79KwQ+O2REqOTtGQV25HdUMKHmVwaJDjTScdVOxP4oxMEJ95LGrWolndoaQeM0PjWE2BoW8AY7pzto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dO81Th85; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C5+gsQwU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dO81Th85";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C5+gsQwU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FM39lb1932211
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NcY3STC/C/9sw5F0QDYnAfTg988+vE1o8LJr3uPSwE=; b=dO81Th85udY0UF0W
	jAdxBUyhQhWQPsmCaDHTThpkAesvVQyb4YQamTLzX+EXL5b0qZFXGAh8y8hgcfa6
	+xso9/S0qJRGvCHGd3w2LjMEc0wTmrUtVwt98FUN8Dpy30N0QyLT6NfGO95w63ua
	iUxB/q5gCISSENm9PdmEK2F5XSwL3MrZe2rdcHKnbSzWwMzQiagxP+NJG9TpeT4M
	9ktEs2ZFgT/DPSLeoRtkEdJ5v9355WncrO/KXJlzAp4T/ZHoAMW9mWEm+hNR7r+q
	C8SSgxgigkuFgqA7P5F9MuMSW8WQrpn0LFaOvk5/WQpCOrySQBy3KdStI52q8GIT
	oY15rw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefp9fa0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:45:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39e087a17dfso2225696a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789537544; x=1790142344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NcY3STC/C/9sw5F0QDYnAfTg988+vE1o8LJr3uPSwE=;
        b=C5+gsQwUo9aDzkSb1/y91vivPoxlMgESHDZIPzPwrV+YFp7/8r9YNyeMX+BiEDucI8
         6VRGF4Yj9iPe6jipoF9BJ72bWMk8qfzedeC4nLmU6Z8dvHysQd/j6HGKigAb9f69WzHg
         EVxx9cXRYzy4nS1wFTdJkC1X6Kr3Jfe3kuxOSHH0t81jvDE6AKjBRkxbVmn2cUa1qMRT
         kIXBy/hK7NdyKyR7WSx6s1Uqx3u7n/ecwyY0JkcIgj6eNeTQEz2wUU4jypkPVNb/BFUo
         1lcwW3q8hM9hmINuSxd9R0PWifhsfda42u90HYq4bC64WxRIyAyQAhlBNhD1vl5cbysK
         gohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789537544; x=1790142344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NcY3STC/C/9sw5F0QDYnAfTg988+vE1o8LJr3uPSwE=;
        b=jSXoeCk4LppE/NP6Tpd6YMe4A/VD9jRo+cgqY9wBFFBfbHX0BQjKkhcxGZxvOlYitd
         4rtKcQ0y42R8i6E+Vjf8pBVYijG+mAQ4EVjgElbLktOSmjNVdwTdgKK4CM3D05n4iiBs
         g+8UnUdDQADT37vq+1Z3Ed7NkU2eAPmt2LTpgq91tz9wYBzk0SDhFancNlqlVaGYR3iv
         ViFaKG7PfwptdMDfUqZcBGibXhrKEFygXbxE0shA25Ev8OM0fqAVt7ykPmP0FgMrVfvZ
         WQYd8kI2KacNsq9XnlMlUE1yg6rFWKvUI6aHrsg5gDHhJTFR1St5eo88WHkXld1L3xFn
         hDmA==
X-Forwarded-Encrypted: i=1; AKwUvByaWVGg/AWC9ACC6IpgQBei8eWsogr7jwRqiYl4PHRr2gSWxUe12WhvpAZiYit6vIIQIWHiZqz7o+cydbU=@vger.kernel.org
X-Gm-Message-State: AFuF++k2T49R6zZtToIcbGaty2ZDPsNa20Mo0zJc5xHX4U4K4Bfl8opC
	J20x9I3/pTs1EehhpxkXN3NBa8SdD3WJtme3uj/IiIor7OILg6RQ7I9kruADwXWx/BLuNAaHd7H
	u8ZvZ7tmu9A7j14VTHYwJ2KOHJW5dZLWVHLJMlTDbpzds/rSPCAN7cWuytyn3RyeGs0DybqH413
	Y=
X-Gm-Gg: AYBFou0lL7jo3D2tnuRM6PCLV23kXSV5V67sDdrV4yY/W2+aP7q0AHF2BnXqsfz4uf1
	8iCHIPgzBn56vaT7QUIsh5nQT75mrAQuOSXg7J2INO0o1VQ+UX3MSVntxaLRnJItauM7pg0ooJZ
	WoOL4YDLgxIiUQke7Ujh1zidmGwzjWBVQpz5PFXlP0v3jp/77jRtbEF1w0YcJH1ragakKFiPdUK
	FMTx46G6L4ImMPAhpKymfHGXloNUrtV4tvzR+ft7hQ1N75a3ZETNTHV9FuNP05ie4zeQnMro62N
	iNxfr+L22SzADwffGMidFjWqCW+pJomr9vurT6TviL2PXl2+bn61pO9qFc21NiOf1PExXIzPC/9
	kkRXhHmBQo0DiGgVe11gKWLCmdAAhI+M=
X-Received: by 2002:a17:90b:1a8f:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39e1e42497cmr3125718a91.16.1789537544139;
        Tue, 15 Sep 2026 22:45:44 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8f:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39e1e42497cmr3125662a91.16.1789537543598;
        Tue, 15 Sep 2026 22:45:43 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b030aesm4357492eec.26.2026.09.15.22.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:45:43 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 11:15:24 +0530
Subject: [PATCH v2 2/2] clk: qcom: Add support for camera clock controller
 on Maili
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-maili_camcc-v2-2-f30b394bfd50@oss.qualcomm.com>
References: <20260916-maili_camcc-v2-0-f30b394bfd50@oss.qualcomm.com>
In-Reply-To: <20260916-maili_camcc-v2-0-f30b394bfd50@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA3MiBTYWx0ZWRfX5wn2EukRwuC3
 zGqsC4dAMrAM6GUE1zDlENu7H8fkfHIR4A24yb93uoHilGF/6Y8JLH7PwjTIJH6Ty/I/WTUKdBI
 SeRnuRwk9FDPjpqq4OmC1LJeLNJDJWI=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aaa2d08 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=x7oLaaGiLmRgSqN1hWIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Y4EZl8Ker85VScSdJrir8lGNAEk7EPG6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA3MiBTYWx0ZWRfX+azjLFMWe0OY
 1fVnfL4+GDycYHW7lGvgJNhDRR3Bxov2C3SqdY4FhLKRmOX3OdNgUdTKwh5p+Ayb+FfbbqLVtVI
 F/LOaxrorB8AwUtKR0kZ6pDh45tYBBxM+sUXhEonGNEUd9hlVU8m0q7qG8aN02zCr+HavfJO5DO
 zihkuDj8KnGQ3T7zVcQYffFJlHu7hqFPToh3QPOdYNNk53DqTnwoLWX1Z3/u/z41YGQkSvZh5Cb
 D0+EJaCfFrKm3fOzIDLwJ5FGAFLMUte3AjGu9TH1BPJEXz24UGymbz66RI4JCloKPT8FKtw9hGE
 mLVjOLyaueFvuTDKBIgBNY6iYCoZVdgtVmYsL8YXJrljh+YC5s9XGR3/b5zPvPLDtcuk6tYaTUi
 W2d7AJx/kLRh7vWHmsKu8GDYkFfHF2d6rmlsALEZ1RlbZK1ZmVAbIf4x1bF1NSUEnL/6iSQjzTv
 esXD4a9D5N+Px1uJOsg==
X-Proofpoint-GUID: Y4EZl8Ker85VScSdJrir8lGNAEk7EPG6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160072

Maili camcc is mostly identical to Hawi camcc, with a few clocks
removed, frequency table updates for a few other clocks, and PLL
configuration changes. Hence, reuse the Hawi camera clock controller
driver and extend it for the Qualcomm Maili SoC.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-hawi.c | 158 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/drivers/clk/qcom/camcc-hawi.c b/drivers/clk/qcom/camcc-hawi.c
index aa52b99aec003f7b9224bb89a15783dcf3889044..dc5c108ce608c2c1131d8e7edd236becc9fbe909 100644
--- a/drivers/clk/qcom/camcc-hawi.c
+++ b/drivers/clk/qcom/camcc-hawi.c
@@ -66,6 +66,18 @@ static const struct alpha_pll_config cam_cc_pll0_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 1200.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll0_config_maili = {
+	.l = 0x3e,
+	.cal_l = 0x42,
+	.alpha = 0x8000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00008400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll0 = {
 	.offset = 0x0,
 	.config = &cam_cc_pll0_config,
@@ -141,6 +153,18 @@ static const struct alpha_pll_config cam_cc_pll1_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 493.2 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll1_config_maili = {
+	.l = 0x19,
+	.cal_l = 0x42,
+	.alpha = 0xb000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll1 = {
 	.offset = 0x1000,
 	.config = &cam_cc_pll1_config,
@@ -193,6 +217,18 @@ static const struct alpha_pll_config cam_cc_pll2_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 600.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll2_config_maili = {
+	.l = 0x1f,
+	.cal_l = 0x42,
+	.alpha = 0x4000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll2 = {
 	.offset = 0x2000,
 	.config = &cam_cc_pll2_config,
@@ -245,6 +281,18 @@ static const struct alpha_pll_config cam_cc_pll3_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 476.4 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll3_config_maili = {
+	.l = 0x18,
+	.cal_l = 0x42,
+	.alpha = 0xd000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll3 = {
 	.offset = 0x3000,
 	.config = &cam_cc_pll3_config,
@@ -297,6 +345,18 @@ static const struct alpha_pll_config cam_cc_pll4_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 476.4 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll4_config_maili = {
+	.l = 0x18,
+	.cal_l = 0x42,
+	.alpha = 0xd000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll4 = {
 	.offset = 0x4000,
 	.config = &cam_cc_pll4_config,
@@ -349,6 +409,18 @@ static const struct alpha_pll_config cam_cc_pll5_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 476.4 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll5_config_maili = {
+	.l = 0x18,
+	.cal_l = 0x42,
+	.alpha = 0xd000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll5 = {
 	.offset = 0x5000,
 	.config = &cam_cc_pll5_config,
@@ -401,6 +473,18 @@ static const struct alpha_pll_config cam_cc_pll6_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 960.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll6_config_maili = {
+	.l = 0x32,
+	.cal_l = 0x42,
+	.alpha = 0x0,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00008400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll6 = {
 	.offset = 0x6000,
 	.config = &cam_cc_pll6_config,
@@ -476,6 +560,18 @@ static const struct alpha_pll_config cam_cc_pll7_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 345.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll7_config_maili = {
+	.l = 0x11,
+	.cal_l = 0x42,
+	.alpha = 0xf800,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll7 = {
 	.offset = 0x7000,
 	.config = &cam_cc_pll7_config,
@@ -505,6 +601,18 @@ static const struct alpha_pll_config cam_cc_pll8_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 493.2 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll8_config_maili = {
+	.l = 0x19,
+	.cal_l = 0x42,
+	.alpha = 0xb000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll8 = {
 	.offset = 0x8000,
 	.config = &cam_cc_pll8_config,
@@ -682,6 +790,17 @@ static const struct freq_tbl ftbl_cam_cc_camnoc_rt_axi_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_cam_cc_camnoc_rt_axi_clk_src_maili[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(200000000, P_CAM_CC_PLL0_OUT_MAIN, 6, 0, 0),
+	F(240000000, P_CAM_CC_PLL0_OUT_MAIN, 5, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_MAIN, 4, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(600000000, P_CAM_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 cam_cc_camnoc_rt_axi_clk_src = {
 	.cmd_rcgr = 0x212cc,
 	.mnd_width = 0,
@@ -703,6 +822,11 @@ static const struct freq_tbl ftbl_cam_cc_cci_0_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_cam_cc_cci_0_clk_src_maili[] = {
+	F(37500000, P_CAM_CC_PLL0_OUT_EVEN, 16, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 cam_cc_cci_0_clk_src = {
 	.cmd_rcgr = 0x21250,
 	.mnd_width = 8,
@@ -1076,6 +1200,17 @@ static const struct freq_tbl ftbl_cam_cc_ofe_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_cam_cc_ofe_clk_src_maili[] = {
+	F(300000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(376000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(445000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(500000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(609000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(688000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(841000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 cam_cc_ofe_clk_src = {
 	.cmd_rcgr = 0x20120,
 	.mnd_width = 0,
@@ -2970,12 +3105,35 @@ static const struct qcom_cc_desc cam_cc_hawi_desc = {
 
 static const struct of_device_id cam_cc_hawi_match_table[] = {
 	{ .compatible = "qcom,hawi-camcc" },
+	{ .compatible = "qcom,maili-camcc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, cam_cc_hawi_match_table);
 
 static int cam_cc_hawi_probe(struct platform_device *pdev)
 {
+	if (device_is_compatible(&pdev->dev, "qcom,maili-camcc")) {
+		cam_cc_pll0.config = &cam_cc_pll0_config_maili;
+		cam_cc_pll1.config = &cam_cc_pll1_config_maili;
+		cam_cc_pll2.config = &cam_cc_pll2_config_maili;
+		cam_cc_pll3.config = &cam_cc_pll3_config_maili;
+		cam_cc_pll4.config = &cam_cc_pll4_config_maili;
+		cam_cc_pll5.config = &cam_cc_pll5_config_maili;
+		cam_cc_pll6.config = &cam_cc_pll6_config_maili;
+		cam_cc_pll7.config = &cam_cc_pll7_config_maili;
+		cam_cc_pll8.config = &cam_cc_pll8_config_maili;
+
+		cam_cc_camnoc_rt_axi_clk_src.freq_tbl = ftbl_cam_cc_camnoc_rt_axi_clk_src_maili;
+		cam_cc_cci_0_clk_src.freq_tbl = ftbl_cam_cc_cci_0_clk_src_maili;
+		cam_cc_ofe_clk_src.freq_tbl = ftbl_cam_cc_ofe_clk_src_maili;
+
+		cam_cc_hawi_clocks[CAM_CC_CCI_2_CLK_SRC] = NULL;
+		cam_cc_hawi_clocks[CAM_CC_CCI_2_CLK] = NULL;
+		cam_cc_hawi_clocks[CAM_CC_CSI5PHYTIMER_CLK_SRC] = NULL;
+		cam_cc_hawi_clocks[CAM_CC_CSI5PHYTIMER_CLK] = NULL;
+		cam_cc_hawi_clocks[CAM_CC_CSIPHY5_CLK] = NULL;
+	}
+
 	return qcom_cc_probe(pdev, &cam_cc_hawi_desc);
 }
 

-- 
2.34.1

