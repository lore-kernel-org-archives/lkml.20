Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A58934027B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251655; cv=none; b=McOwSSFWhMVo+S1DzIV3MM6MWC/W1xf5iCb7bIDT2mhKNSD0n8xcwmOtpGyszhbhKcfVm61wCYXmJzYOQWuPZLFau0yVrmc9pSWYvDDxy3oz3gr+I7yPajfAaE6aVSBaSzEm5JJJuTpce0cdh+gaZAU7VJ6RjFt1mTJdN27yosc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251655; c=relaxed/simple;
	bh=V8qHf+A6jAVexqEBPB/LCPSO1r5T/Alk9AJu7MgXWrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OzVsgmY/jGOIr7q81AI3UJq3mCwNz+ZdjNmpKVQOceeEte/NaIpMqSbXKpbcx7zOZI/y7OnApgLYwx2PPnaDbNFbXse7EH37Rb0cIbnFQonL7hA9ilEm+cFtEMNMGZ5nq0jpFgUBqBtrGSvySqyV7v4ZPajEDGa8+KqSLw6X2oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=clSWSh2t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RGnX/YIU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="clSWSh2t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RGnX/YIU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4eAM1437096
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5NxUdiXrzLkzQ8+8Nc4BBkViGk+ztBOR5ekhjyNIZl8=; b=clSWSh2tNJp/Kgyw
	FCN5QC5mMAISPoS9nnxXgdOlO0cDy8x+ckPlf4rHXXSvYjRHLP1kMiv/lTKDI67M
	AXqOrKFQxwl8gXb4XaK4raEdCTl2xq2Xm/sFiMYYOCFZEhCDKZKDOB9TI/pxbw3r
	Hw0fvE9hK72prEvPNjksYQFSiXgT1Dz5WGeqPUQjJ62DQNGfsjBk9wBxs5dcJPBJ
	B2N+fRyCAnXCJt/a/tFiKpZeym6t3M9fDdI4XKE6Dphm2qgGda2Q3ZzAyzWNGeP8
	Yr8cOGY3w1bVKgRJLvfGKCOmiL6yrrTItjwd8599qs23ktppsymA21bj9LHuI/dv
	P5PZSQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7rena-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78fbc5a4cf8so868905137.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251649; x=1790856449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5NxUdiXrzLkzQ8+8Nc4BBkViGk+ztBOR5ekhjyNIZl8=;
        b=RGnX/YIUjjHMJyBJPE7borpJs6gCHFcxrTURB4LDPbsbuBAaXDnO/64uxWIu15/KLA
         oVMN8xii8arTlaLr8lSTBI0qfQzxTgsRofSPZRNOfO+2meA61G7RFafIes87sAEmAO6B
         XkcsZMbc5kIxVoLYfLXeGnTlNq10Sim+YfEbpQfUYF+XjcODMn41osKxJhNr2Y0O62xo
         cI7OxPcvqpsmIEaR2EF2EXbNpl6lWFgOiHStll/ux4pgF4QmZNXjWWWdm3bboII2q6JD
         cWhdb8Dl5f+r8boZ2cXdRUOCWalljITlnjTI7MdHY0+eGLuv/g3GW3xMj7qcqAW26t7m
         IPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251649; x=1790856449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5NxUdiXrzLkzQ8+8Nc4BBkViGk+ztBOR5ekhjyNIZl8=;
        b=tgx5rof6VVx5Ut/twX+b9bptexlOY4YludzuxE5qCFzbIatxu0WkUEzyBF0HUETzjG
         zF1hEUDOjhpldx9esmWOlo1Oc0TQP4/AGASVS9yPHyWGh2fweUL0z/wH5GQxtlSlcTxZ
         B1bZ6mtV5lLQFMSGxG3TFb8fsdb9BnwXSLIPqa3Y1UODBftsdxEzg0Bq7HIe9P1KdHhA
         AoCXc1j2SREJSpo5IbYpiPAOx5eHnDypNvcuz/EzS1GRzvsVgqNS9HGlUuwfcwxAld3p
         q4IUpxNCMi3iif+TzDdHB+whLmfUV6MF6AXHE8UTXBO32NpILFeFrcZ0OpiKrPtkaQoi
         /xMQ==
X-Forwarded-Encrypted: i=1; AKwUvBykZ5s7ULd2ozcT9eqtA4R3+IVrhg8hcCUWo39fmi0Bht0pRa7hURgrBVRK/Pifng0EZ8il4/gFTUDEtyk=@vger.kernel.org
X-Gm-Message-State: AFuF++lVtMiGZdH9oblHxk+u2HKFz+oI5HqeyPvxpJN5F7z4NHjc6xMg
	ta7YrDZ0I+nnIcmRyArfRolRBcWaGPDE0s039Nhh9DYp18UbcoTu8QCnsl7QC8OmDzM7CHD3q6s
	y5/lNLYYKgb7Qse8sy6vfGurpqm5XBbIWrkIo8zSUhDktknFZVpSccOlGT6mPLDX+soQ=
X-Gm-Gg: AYBFou2Sc4IXqftbHS+h+6G2FH75/LFG+wAk4p0EgxJSPlVqfiwkbyHBS82vgIaiGdg
	CtazUVkYbEEe2CFSWm6ETAghkq59Mq9EV9Np8YLKKpEuqcQQrn5m8Wm+kFCh3xKIjGAxv8FZKRk
	gCf3DklTF/gMqq+wuI1QmYE+YhX3LRGzNWcXcWbokqpEmZUhPyauL0ep3Sdw3IYIG5BIx/S8kLx
	KiI/6RJf7wpHRG97i6bPCa73HHL5TjtDUMvqw1VwXbwQd1uGpj5dNKRF3TeHlxKSlDYO5GWfciu
	k9tah1sECfy/qgDYbWScSAjJ+csW5zceDJW80/r6Lr+vazgNQERyLQNhCFUa04AxdpII57HFwDD
	sN1IuHTwk
X-Received: by 2002:a05:6102:83ce:10b0:7a1:f2b5:6465 with SMTP id ada2fe7eead31-7af1f40bbddmr770451137.34.1790251649178;
        Thu, 24 Sep 2026 05:07:29 -0700 (PDT)
X-Received: by 2002:a05:6102:83ce:10b0:7a1:f2b5:6465 with SMTP id ada2fe7eead31-7af1f40bbddmr770427137.34.1790251648550;
        Thu, 24 Sep 2026 05:07:28 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:27 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:19 +0300
Subject: [PATCH v2 07/48] clk: qcom: dispcc-sm4450: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-7-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1853;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=V8qHf+A6jAVexqEBPB/LCPSO1r5T/Alk9AJu7MgXWrY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJIkSYSO84FCpTJp+KZw2eg5gIWdCDYX1U8I
 drbqYi+vWiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSSAAKCRAbX0TJAJUV
 VvQvEACWsnJ5sKFIrJqFPVOci5oKKfk6gwF2M52OQlagnvIRVtfFtWn+tqnsM7JfHpkbIxfLMPi
 F7gh/SRxzI4QPGz970RJQZTZjgq63M8hAnQrfNLOcZWsxfiaIofOV57MxEjVhlMH0KBu4iFHvyc
 l6F3wg5y5A/PTRhFc28jPPrWQ5k+1fSOYjKXvs3tBtNHvCm94O/XChF+S5AhCWfW1sNdlD/OcFu
 vdwzZl02pgSYezd294zskC70zuyTTQ5ejel/IA0iqrd1YGELRPOEteElEh8MqfFUuyl+oD8JVC6
 tnM24DjE1K8T8vduOfHyJXE/PEPz8JEHzuMi735EbzbTxiwBA367z/zK5yjD64eMl7tYhkxOznW
 dwsuopmiDz3Nxo8GOm11PcMuvvwDlAQFSEXPyKOFa/cKSZP/S3+TWjBy/MaIvgjX120nKv1wEk5
 puifuJkOraTavhy1uob5L+sC0v2sgWqc+EE+CPszFqId+s9Qb8bzkNdYfnpnwwCTgagw9HLmwS4
 uixOoovYA/IBcFPSo6F960SUNswK1aIMAsSM8h0rrCc5XCRW/Lr5dOODTFYrz+hkn3xCLKLfToN
 HX9nZm58HcfwemMGFdgv+oNa5N3P9f4VSYF0qectLF8Q6wTj79wmVsCA3an+M6j4CW22zOMcAHK
 TuguDwcn22fPe0g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: ujGdOO4ayZpsZEjd-eiT167iSvpeZZlv
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab51282 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Mkos_PfpLiWYs3bmBbQA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX8RjRY0nMd0Qe
 0rCGOdBafBAQK6cKvzrYP1gDsJsGhneSaqoJvWZSxy201TFE8f2+bq58qaKb1HEbsA1cc2/HSX7
 M6EGGgXFetQK9ZliCATWdR13GxOdBYo2S+KtFPagAvMAL4ZIfq+85zLGYRC4fv+MQU+5aoTb6/Q
 lopQJAwN1Bqv/0Sbr2OohK78NXi8PNM+YLB7JXKb7hVj1Tzk0LQ1XxmYZEDEJYijZQmHf25putH
 alp8Euh93JHW91bU7TBQYUlvD2IMfbfgltuUwYvcmoKNcrUgH7ZGLZoXtR0lauEtzCrlHCmw7tz
 vu/2ZL4X2JZ0Ve1Cyqm/5QJtH6JJeWmJzMT2Kr9IkbUeAKMVHK2cuMJfZbSNANUwToVXhIyoWCO
 VFF4U6rhEk2Hp2dw5XagBHwwwB66U5UXVC3fD2XgpCHefP5kyOffdbSKxuQ73HAAMEpXwvXsOxL
 bQTJit1Eq3aDeQ8rV9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX/xj/9OgIgR1C
 Ga3JxzG2kdrl4AnaiDJGuXLC/F9hualrUNs+vZOcJfDLSL93Yeu9ZduOdbo4SNais4/gb22xO/0
 coJbRHDFj8Oh8xvEOY2sVsolQggqx5w=
X-Proofpoint-ORIG-GUID: ujGdOO4ayZpsZEjd-eiT167iSvpeZZlv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm4450.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm4450.c b/drivers/clk/qcom/dispcc-sm4450.c
index 4a4811db55dd..f39afa067cc6 100644
--- a/drivers/clk/qcom/dispcc-sm4450.c
+++ b/drivers/clk/qcom/dispcc-sm4450.c
@@ -719,7 +719,18 @@ static const struct regmap_config disp_cc_sm4450_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_sm4450_critical_cbcrs[] = {
+	0xe070, /* DISP_CC_SLEEP_CLK */
+	0xe054, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sm4450_driver_data = {
+	.clk_cbcrs = disp_cc_sm4450_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sm4450_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_sm4450_desc = {
+	.driver_data = &disp_cc_sm4450_driver_data,
 	.config = &disp_cc_sm4450_regmap_config,
 	.clks = disp_cc_sm4450_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sm4450_clocks),
@@ -746,10 +757,6 @@ static int disp_cc_sm4450_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll0_config);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0xe070); /* DISP_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0xe054); /* DISP_CC_XO_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &disp_cc_sm4450_desc, regmap);
 }
 

-- 
2.54.0

