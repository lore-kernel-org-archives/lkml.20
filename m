Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0734EA37B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554692; cv=none; b=T/+5I9mXTqSOuuqJdxC+JsNlk4C9V2TJbwhXkZIPRX3nimpJ7IptjgHkm6A0aRT9OQaGGzhAK2JuCe4VX/Y5/6UzaPXYbDbfBC/cJN6BHvI0FtTkHOdz8Sj3kwtNYhsuqsHNkgIspBrV1nlDDk6zU6L3UTn48ZaEGzuoQavNz7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554692; c=relaxed/simple;
	bh=16EboWEhK2pj2Pfnz97zp9Iu11Al0FAmwMXJMbuvGJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V37C6i8JlaufH5PcYah/rz0X7w3dhNxTQvcUaNwJGY+GYkOLBCOMkNnw0Qz3rCOnP68d4zgJ4mFt5Upi1r79CZcu6x+//QgK1cERfVbve55dy8j+4+6GGZwoINfuEsMhjm2aGluRDOZ5shXr8TuqAREF/VZMCVSvX0JWHQq+IEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KF7dYozR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B1JVuY5m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KF7dYozR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B1JVuY5m"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92p2L2348415
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CIExri27Fu3tkFXyJAX6gm5zvhx2iZpPShmz2r5/eT0=; b=KF7dYozRMFsgIeho
	QUf54NfX15HtQ4V5BiEoNEew9EyqtnzQErr4dWc+htSpQdrhBC7VlVTaTWXBHHP4
	uMQKMM3DDAtEqmYR/FAEm9z1qaLxN51exk85u0S4I+DCTg4BHCSUygcsVkiwQiie
	SOxCF9DO4EyxLIMzC8UIjs5DV34MY90en5bFKOM1LPxzUd1IIDvaqvyR3FadvhKX
	5k1amrp3wDY+7y4UUsH6j3FjpAn5HBG6eFaVwP2TfBOgyNvFbBodxCEcGuX8lnNO
	byj8gvK2sFfaBakgq2k0RneyNuXLgXtFyRJ8Ux/97BbMl8eFLITBMiWVRjlyvBSz
	qEFXrw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywas8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so1034084285a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554651; x=1790159451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CIExri27Fu3tkFXyJAX6gm5zvhx2iZpPShmz2r5/eT0=;
        b=B1JVuY5mRk6JNW9PNvt0+9ETggQu4WVJ+Q+W9d3IO+7vGu5c9Bc40hXS597hT0lN23
         2lMjv3nPJr3BLdwOdpqvuPI6/fQCUSv+udK+0q2yHgdJaSuDH8DHA1emUDYjaaF883Nq
         RyRXhhPXn52zMuhEQLDggUOV7L0V5Iu+2eqy+puNpQzvYXmfA4xpXL0RyZWZ3Ll5Jh1n
         6YzFL7Z9BDYp46HVp7OzbCqm1seK2vb8+tOnQFlpUXcK3bSZce7Rm1On7Po/kRhsbtAA
         dmKTCZWjUqo+guIgTd4yFnQSG3e9jf3clpiAv5Y4LDyU+7oTdiRlk6CFqj2G0fapvMk4
         apSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554651; x=1790159451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CIExri27Fu3tkFXyJAX6gm5zvhx2iZpPShmz2r5/eT0=;
        b=k2NdNa7aNu1ldMOFKIjxsbawwrXrdZD9zvEltFJlNAwzbUwDhYKmUZvxckyFcW0lI3
         +dgfPx9EWspyVrcIJSrzx7MPng4TG9WfeTUR5sj69cRB4TH0Ior1B8qN9BMaZvkZiWMW
         PqG+3oC0ksYHjc8XAtlskxEKfYCz1GWMzhi3p0e0v59UL/N1WVVR7iQiUXBvWWqKlqBo
         XNyWLdfdj4NRnQsah7SMk5kC7ry8734Vl0mNVTKRffFiReaF1/+7/sbC6o2gjB4pchUs
         xDcT+39G65F0LhrdfAGln3ikziZh0NOC2oA58++XCyDGuWjEcQS9GN/IeQ0/nWNd5AS0
         ZJng==
X-Forwarded-Encrypted: i=1; AKwUvBzAZxbnLzuimSxb2kJXNXj9w26k2Evg1rIwknwg3R7tgL1hDfUvgD90ZVF2vWnZpli10o19VmtnWKEzl5w=@vger.kernel.org
X-Gm-Message-State: AFuF++lmwwvGrTQijpj7KZCbuCp9dwbaaNDKbdmL+QB7mbZGNKI1ypiL
	cd/6JXMIj42SuxBiFxBxGchMdjQYFnTrQktBhVZBqohmaREakF107FflVA7dFTvYEfvviLsjYYY
	kINMXS0JuQ00tXzl87JGmyAg6EGY6rxXuTtYensRZjhaWHAt89IeEG+gNKMoUF1xMWe5O/4E5kr
	w=
X-Gm-Gg: AYBFou2XGnF225DlCqsg3ldGLXGC1KXOpzYUul26kLZFp4TaKs5f6RKht5qaJVDuwOc
	TseJo8N7xwiYTHEQftNFWMuwawEjT/SE6qUpbkNRdHGRqbU5O/M+xffzeixnrgDRkUoDwbYmFEP
	892l7a9xFBXaUbz0TPwtl3a+utHqJe4RbX2KzqPPE28cciYaJf8glnKRexviCIdEAcvx4rMdF1a
	+uNR0MsUXiFtHRNV2sUWfpqMhB2Ui56HKMPC86/I4YUl9NcmHDYuwWWRWSfPB2D9bzRB2YrLTHf
	VGqI60BDU0uWmrGYjr1pThgip5D4xqBe0VZMYHM3MOD+v+OcfOc0XHYufqZtgXBZRwjNRPw2+PM
	3FbGSPXE=
X-Received: by 2002:a05:620a:4481:b0:937:3a1d:175a with SMTP id af79cd13be357-93bb76e6cb6mr315684085a.3.1789554650353;
        Wed, 16 Sep 2026 03:30:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4481:b0:937:3a1d:175a with SMTP id af79cd13be357-93bb76e6cb6mr315669785a.3.1789554649117;
        Wed, 16 Sep 2026 03:30:49 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:29:00 +0300
Subject: [PATCH 44/48] clk: qcom: videocc-sa8775p: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-44-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=16EboWEhK2pj2Pfnz97zp9Iu11Al0FAmwMXJMbuvGJ4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9127Djy28rq2CimIujWCBAE7XQ+ihK2ln6p
 aDDUoHrB/mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvdQAKCRAbX0TJAJUV
 Vp3qEACPGKh2o0SFQaZLB0gTdar+Ye3Z2dau+IeQUwbmdlBR628TD+SwIJa2OaEap0wpdjC7TKF
 wWKaTFHL2kR8772zs7AZm7Own3QlRRP1uSOVwsT+MmKRRO5nTioOEHLkkCZCsGxWBP/gsUDeu3I
 waT/nqQgxYPoc2emCO5NDgLvtDHB/HdhWNFfVLN7S+UIAu7rXbOXwLU5/2Hhby387hQFhfC5jt/
 XWFyDzb2Nf7a5JxINbF+Boul3JJOuziooGnMb/fDhzfvk3LNVWCMQLBWm8q9AJGfraZm3/VFcBz
 4A9tqs+rQyI+o2JoIjl9yINoKjlOPLU7Xt8bUzEzK4K1CabjoFKSDQFh3K/nAJ3CvINpp92nEiK
 sPbQMDIZY0AJiKzwVB13fbTOUhiTeUMhd/Mp6KZdotqrSscpUT8wc5dSfVe2gTBQjMhxC/0O2Wa
 xAf2mOU6RtellVKtOzwxesQdz6Gvuw0dEB6TLAOsGVMrGnNsAnHWUlGPJoxWZy3wI7Sx/5a87Hn
 nyRjEiUIkTq/D+CcwCbYYceBIfdtolpBHNlDXFLlJXQMnZYcrxRH4imS4iHOC69A7kuRo/fz1gO
 zA6IREMC9qG/dzn7oysogOtuUqZIYqNusRxFd46H5e9Bto5++l875cd2ThRCfOcFWNS4SrfzMI2
 M7DTIipvO78fpxg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: V4WysGXp84GgnMgXLknK_aLV8sjCOPtg
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaa6fdb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=i-6CURGfGzB18q9V7KIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX3hx/9qhiAlVh
 26B/Z9DyBvQl2UdK+O0PEeWrz4mD4VijTZT47TjDcICUO4xccs/n4CIxfWuzYKO1KhH2ZTPQ9A5
 0mZvp8r/nsvW9qqCdGMNN5AWkTLY5UtK5h+yt3DGxuccoz6hqFm5Pja8aBdPj8KN6zFQ8Mf/9MD
 cRbSperzLigEMF68WauLG2nFDfXvbkVSnY7SXfeP0vjJwGD8Ty8qSx03tjbm0b5z/UAiabU72dG
 5zvDtfOg2b5i5h0EgeysmCJ5/6QCDxMrPg65c2ynnYFDUiXnWUxQBAPl66wjR9eyoXiFmGETpg4
 ZXxxIjYD7ARzAIAw0qI6O5pQYv53+JuAq5KHDvvIdgSvlDCPJlZDrVtr2Jcb5b/LqweGIusnQP0
 QKLppDDrK0v5LFj1dhhA9LuqtEVXa4nqIZ6tlOhlQJYfJXP4gTHnHIjjFCY2wqJGiPCGiLvLTRj
 +HgXv22aV29VeskMtEA==
X-Proofpoint-ORIG-GUID: V4WysGXp84GgnMgXLknK_aLV8sjCOPtg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX7f25ymtAjGWn
 lLYpz8545Sx79kiYL0uSb+eB2z8OeFk67X9o/vK41GfRL7iYzcOdk1IOgDf7D2zfL7sFy8CyUN1
 iumlNlSDq3sge5vbo2biHFmyoMBHcEA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/videocc-sa8775p.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sa8775p.c b/drivers/clk/qcom/videocc-sa8775p.c
index 65a2d5bafea6..2ca78af8c20c 100644
--- a/drivers/clk/qcom/videocc-sa8775p.c
+++ b/drivers/clk/qcom/videocc-sa8775p.c
@@ -511,7 +511,19 @@ static const struct regmap_config video_cc_sa8775p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 video_cc_sa8775p_critical_cbcrs[] = {
+	0x80ec, /* VIDEO_CC_AHB_CLK */
+	0x8144, /* VIDEO_CC_SLEEP_CLK */
+	0x8128, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data video_cc_sa8775p_driver_data = {
+	.clk_cbcrs = video_cc_sa8775p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_sa8775p_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc video_cc_sa8775p_desc = {
+	.driver_data = &video_cc_sa8775p_driver_data,
 	.config = &video_cc_sa8775p_regmap_config,
 	.clks = video_cc_sa8775p_clocks,
 	.num_clks = ARRAY_SIZE(video_cc_sa8775p_clocks),
@@ -557,11 +569,6 @@ static int video_cc_sa8775p_probe(struct platform_device *pdev)
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcs8300-videocc"))
 		regmap_write(regmap, video_cc_mvs0c_div2_div_clk_src.reg, 2);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0x80ec); /* VIDEO_CC_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x8144); /* VIDEO_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0x8128); /* VIDEO_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &video_cc_sa8775p_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0

