Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732734E8E02
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554589; cv=none; b=fziC5pH+kjQz5HFv6NY5JAQZT8LYna1AWElxn44NsY+pIPxM2kKGwKTW/CVvczY13fUTru6x3I9cfDzzCEVfGuV3jsHaDZWrmtNkJT5/N71HV8Pf+BlyGrANEc+JsuzFBZb4lM9Brm1Iul7kzZTcgzO1YVds6LX2vx8R8O648Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554589; c=relaxed/simple;
	bh=st9xlZKmZ48UF3uJ2bUZA6moRjATrWOgM/yr01YuaB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MKd1DstFIm/EPZryqRchCNE4oEdKS2eHYQkNrJ6U6YPZFZPSAurB7NPLB4MFUZ4wmZjlSpCOd69H8xb0f002KYkvEe7r9pCMrvKOk5rkGWZrFuMqAbPa6Wc+cC7aJQhQX8qRVNghzzCjlyXzWvF7JqIlM6nigAJKl6CzhtIObr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nE7pQlAo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqrJSS79; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nE7pQlAo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqrJSS79"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G934p02478420
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r2hXn33m4Qsw1kMDFpBlgq53rSQ/1SMHI+fdKa/pWaQ=; b=nE7pQlAoDNcFo8Pb
	bY9lTddhcWX5gao+NvS3TimhTsmdWfS46wFPsqmB5BpbH2oo40CAJ4jmNKgDl6Yb
	GAv0zW4ZlkuDUoDGtzybtiLZ5vL35useQJYFUZ2FbnR6AAO9OyjgWahlqaEgp8de
	hjQc3O14+9PJTXCuaVqVv0/4Ea7VwbJcr+pnDBOTHQbVse3OJUlwL0CELUXYmCu0
	8QYsB4NZaVlNd/pd69p6cWgWdFMrY3q/d0jK548pgWIlDPxWctDUWtNjztvaeYtU
	jMQA33ZRXTTWsBYHmdtk8zSC0VL4SrtgUN1EoYnehAI6v5wtfOPJG3kHKdxu3Pl1
	SK55Tg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjcksvdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390a2c895bso1292224085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554580; x=1790159380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r2hXn33m4Qsw1kMDFpBlgq53rSQ/1SMHI+fdKa/pWaQ=;
        b=HqrJSS798VIG/xl5WjsCTy99NWWumzU65E0Q2+x+N8iCEq+CQ1dyichuy7TDG1Baej
         LP80pGeLRrPCz6a2MntJo7iQDmqdzkbVoSGkktjdvqr59w1hrOnea4SozLmopjCGwu14
         NSqnl8yYYxsYrRkENOsWqUmGtAvuExmITul/o7U5VFzWJO82Jemc+fFHKZ76eueRiAvU
         16L23e/0mhrc4GOqs9PGnu35EVvDB1aJf8Nx/q7guJdLUu0BAfSiNtLsT6odtt88fhVs
         Wv+GKCCaUTJZo38AFd7VutYyeY03mYk15nDJUf2xMpmpt8QdeyXctGNw7hWEYavMRk2S
         +F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554580; x=1790159380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r2hXn33m4Qsw1kMDFpBlgq53rSQ/1SMHI+fdKa/pWaQ=;
        b=duOpyHVi73EHADTpXa3benRQbjKi0bEZqGfl8dLgxeM8tbR7K5sud37ct6jM3Njoy9
         y5QWGMD7pVZFe4N0F3HMQ9zHw0AZSdFu1a7XRXQbKE4B9tqEXivLhW8l7nYL9lAZuk9t
         /xXotpnlmdXF7mXax9H5LGU689tQaG9sdBlK87EGPM1CoSx/q+8krcykdrKiv6Hl8XU1
         XZpzKv6VjmpJsvzgxVnMtaX/5tPxMuhga5PPgg8uKelBYB2VNTuxOq6It1TnhJ2TalEC
         LS5zOw9gvANXZ9eOnag8FSCHqGLmbq+8W4LaotVelsehdTeAD2yrpNJpArMRK/oUDJWz
         2EAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcDa5RlszBRePOsM/8GvLh4q73YU+13PgrnTGXI5/LknkUglnTJN1VaaL+oKvHG3D8bFSngtRzBkKKzGI=@vger.kernel.org
X-Gm-Message-State: AFuF++l1e6KKwQrz4LzfXLSdvvzgBF6qP1iAHV1px3p/L3UnsgckvGWp
	YWmOv329GDFsYfW7aPHjbaY9UAkkkmohCR0enu4Dz+ExNQrgiTbwO6jbUSIStEPVbO+pSmle6eQ
	rpOSkX7hqSHkYVzXimYfAZwDj5OYQKoCACNc8jp9I8t6wkyADm7KvrMBMG2IayZLmXZg=
X-Gm-Gg: AYBFou3BTFp7s2uMvzsiMT8UehLDf++hZEP/6oRIO6Nj+KIUPVJZ72J27G6oZA4Fgyp
	73IXFe5U6skUMq3C8/8+zx/9tfnLjSSnTqLUUEAiYLOXkGR9HwyQloOnJdANtO0/XeePuaas0D5
	eCDiEbZyINACiHZmnYNSPSup7IS8wCHI+HvkVypk153kd4jiIowOcsA/1MGI29VFUAK9KFXvH02
	WrbuZz6Z18wS11Xkd5QNHpKrmqUju8KtIeuDRjpEjUOaooxcKfDjtFST7LXF2biLd+S6r4XmcGr
	fhkf0gTrCUECmpLzLVDo8fvuKv/NmiR0A/ELU4sJ6iRY7byf+Vpf8J2g0G+8C48Yof7sjp4t9Cr
	WVtF2vek=
X-Received: by 2002:a05:620a:17a1:b0:937:7836:1501 with SMTP id af79cd13be357-93bb7627d7emr315606585a.10.1789554579890;
        Wed, 16 Sep 2026 03:29:39 -0700 (PDT)
X-Received: by 2002:a05:620a:17a1:b0:937:7836:1501 with SMTP id af79cd13be357-93bb7627d7emr315601785a.10.1789554579318;
        Wed, 16 Sep 2026 03:29:39 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:28 +0300
Subject: [PATCH 12/48] clk: qcom: dispcc-sm8750: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-12-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=st9xlZKmZ48UF3uJ2bUZA6moRjATrWOgM/yr01YuaB0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9Wp1X0Jvy65lQ9uifZJ0T66saqV23rYsgoC
 gppy8CnIL2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvVgAKCRAbX0TJAJUV
 VggYEACNd8bypCiSUkibCiYeozrb1TpQOX09x5i6q6zQhjoiqCXH90XPCJM/r52p6yJ8e7usPVf
 0GMuuVv43nmnAiGkdyt77gYdMbl+5PQSVkky0wk1xLDXXItoPyDYCVv/XsgNCAZ5jVIwMImJ2Zw
 USnHsow2FrmEbV1BiLn42X+phez35y918T3O2xFWov/cat9FwJfVJyExqO7k6rXF2FUKLEtYdWd
 H1BqFletVz1WXViAymYwg/UQ1kH4b3eBFU496zKgThlzKRsY6XZo9pgCBiIERbp3aKV3po4VDJq
 lVwl4V5gK5t38/fKt4YIStRjEePXjtk5hw/jRiBV7bDQE/1d8Qoh+o23/uXVjflNi4MP1bTaklY
 71QeXoytA1SuQibJUNG4Mk5FB9UxqjnQllZSQja35TR8DQMjq2Ze+uQM4QrxWLT/WhtgJsU/ZLl
 CKcEpZXXI7TiyxK1cFCOmR2txoJ/3e4/O5bb6+KWREp1EJdbKI6C9lSb3qS6czPhdE5RGBnNJo6
 k0hxQTfpqhC6owi6LOxLIHBFQYatuOr5UqDAxZLPRMzjmAsMmr5B9xEEarY37z1+zz+d9TqRU0D
 byZqB5+qV20O7WJIf0iIv/EKDQ81VNxHUuRqv5ihRmHgBTuf4Kfh/l7FTQ0mDtL73912ytIoRgQ
 JXIZnV4PU2npgRg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX5w/P/pT+7RYG
 l44SdLOws+3r2JhOLJsnSFYb673C8uQRU6Y2/Tyof2dKCqGDQvCnHFgHU18P4PFjPjWRfRtyyaN
 0bZswZ2oCWen/Q+YmeWeJNLpxHGK424=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaa6f94 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FGioixOYZu2XGbO-fNgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: vG2pXsYp0tfI1K5GuxuV-fvCs9r2hPeg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX7cw/DR/WI92S
 1WofXow7rjOWrXlWtyx9UAoa3JQSo3K3lcHmZ1s/UN3p3hB3p/yaGgD74aPVPA5Opc+RZ35z8rH
 eQjtQriI1B6iE/4qEA4nm50tkujPwlUtcKVTgR11+7dwhKX7UwoiupVb1r+uVplKRd0tGudbC24
 mDm32m6xtorL3g5gnSsny3s/dm+o2E6wPGGuKSUtm2td/Tz86jWiANeVbgO5HScpUJB7z370Ri4
 y0jiXneqwLwK9S6eMGXZLDPLfpN/ImO5VEN/uMEGw7zs/6aC+7+TU0JfQK4WPqhK7BVjbo8qNJL
 zLtFeYy+f7oiswx8PujLsPnc7EwfEH1HbcSz53TE8KdQ6T59d41R7FPKSpRokEzHOvyMeX4rW4X
 zzvnkYVzfZbdao1D1/Jy3tvOosXmDZZMwde+rtc+fjIccXi2q2jC+qOQI6rcJkh3Y7DX1BMGkzM
 lPFGT31mG+5+zXTe4Tg==
X-Proofpoint-GUID: vG2pXsYp0tfI1K5GuxuV-fvCs9r2hPeg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm8750.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
index 18e86b80e581..3205ce5c1ad9 100644
--- a/drivers/clk/qcom/dispcc-sm8750.c
+++ b/drivers/clk/qcom/dispcc-sm8750.c
@@ -1884,7 +1884,20 @@ static const struct regmap_config disp_cc_sm8750_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_sm8750_critical_cbcrs[] = {
+	0xe07c, /* DISP_CC_SLEEP_CLK */
+	0xe05c, /* DISP_CC_XO_CLK */
+	0xc00c, /* DISP_CC_MDSS_RSCC_AHB_CLK */
+	0xc008, /* DISP_CC_MDSS_RSCC_VSYNC_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sm8750_driver_data = {
+	.clk_cbcrs = disp_cc_sm8750_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sm8750_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_sm8750_desc = {
+	.driver_data = &disp_cc_sm8750_driver_data,
 	.config = &disp_cc_sm8750_regmap_config,
 	.clks = disp_cc_sm8750_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sm8750_clocks),
@@ -1926,12 +1939,6 @@ static int disp_cc_sm8750_probe(struct platform_device *pdev)
 	/* Enable clock gating for MDP clocks */
 	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xe07c); /* DISP_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0xe05c); /* DISP_CC_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0xc00c); /* DISP_CC_MDSS_RSCC_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0xc008); /* DISP_CC_MDSS_RSCC_VSYNC_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_sm8750_desc, regmap);
 	if (ret)
 		goto err_put_rpm;

-- 
2.54.0

