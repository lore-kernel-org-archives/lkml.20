Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498FA47FB0E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251648; cv=none; b=Ye8NzLa3Ntkb7f80tXVGoVBqsOd5WLIqbS+2Zxp0jrxEVME05UewdRRKqyQdErK6BQxyrppGLJYcBVwL9yXXJLU4f+GE9/TLCHI4F3nj8MNSXCtc5hN5BHXIGoN1lJwB9xR+i8MG8C1f/aX/T24lp6tyz1o5dqKqJEuRDdAeKos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251648; c=relaxed/simple;
	bh=1aJTQR0dA/sog7qGkyQAgO7NJrtOYUMQUHZCG6mJu70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uNmt5bT6lbERP02PCJio8WOeYnGz62moOk519ka/J7S6zMUvmc3B6yGML/RQh51rBosltVXA88cTUvcNFMk44GS0g5zP+9uEQFxmlalP5ZGnBdg7yvVsuMDzOdeLjFC60tGWD64/rZKfsdB1oKHJ3V7fm5ZECNOfnlI6TgKG2uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bcWt3mEM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WNdchNGm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bcWt3mEM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WNdchNGm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4kjq2385712
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gyh5akvvyyTi7Yve0fYdrjayBHbVCsrQbVTODnYGB5o=; b=bcWt3mEM36QoZyH4
	h2WTHRQlBDaiDWbRAUpngPfZl8MsoOnfQgKft1WTHQYfaJwSTOW6o6H8Qst7mwAm
	e3VbFoBqQsnm/yY4hl6oXdGMkseqyGol+0dj0yz2R3bYq5RShu5ITxRMK4nKDZ6x
	b9vtikJHwuZxaQkO9Fil/Gtsai81bOW10GpTlMCMfSSbI7Q3Y59EpHBmdGqfz2N/
	3akWvrMWnao5ofrYLacjspOOwc1ugGdJRr0V6KfVKha6FLYvYtIgJBhx9w8WNkGB
	qFrsybytfXUErJw5Jjh5nE1mExRBkw76hDLRada2DprKMVLneOJHsHWqMLSkER5t
	vyVkyg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfgtcjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:24 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97c7e1d8bbeso338932241.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251643; x=1790856443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyh5akvvyyTi7Yve0fYdrjayBHbVCsrQbVTODnYGB5o=;
        b=WNdchNGmZWTaEI1wSK6dzaajBM0JgPxdrZC0sU5hoPsLYc2pAEnjKk/d/xK9kebj7n
         suyMCVdApE5WGVFEcxPROlDwq9oHWfwkxKyRQhsRJ/5LjFOAWRcpbr2A744rYQ4KX/y7
         q5/5diVb6M9Y/G7XWtL94My6kogiKiOSozmgyDJi27SniWKnlQZaNS36lKemKdMvPT1B
         jbuwe/N8gJ3w+j37JnXlWfTV8dnSqGHxFgMKo1FvVFT8MLEdWumTovlRYDz2E115CBuq
         OJQ0FQpzUDwVzL+Vz9ACh5WmcDaMQQKFMzvSwFWIHPoFyWPo8cREgacmKhwEbcGOG9on
         kugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251643; x=1790856443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyh5akvvyyTi7Yve0fYdrjayBHbVCsrQbVTODnYGB5o=;
        b=V7odgP926ob1ox3lFcwIgxENQx5+7kkUOdOydzSBXksVIoKloWbIOCcwIJv4sMS4yt
         isqDupN8YyKyljoQ+MjCaNKGLxUPqxeqhg97WjvjzVEqanA5zL7APAxjnrWlJZOQmOU8
         x8q5o9Hikio8td192bbKdpIc09pU8uaMtv0MY0LLlQkuZeKceljrIcM22zQBdGyIkfQI
         PL3si4qcYOC4MhdZyLhqwOGgo8HXJKOPOJr5MkUzIeFU+sXYb3rULcIyikcCVz6vCube
         3BzDUH5KHqi/wTYyhZ4O5sKNjSr3akJqMpcBE4vNTvXubI/Zf0gC8C/C2nOQ6YTDManr
         mBFg==
X-Forwarded-Encrypted: i=1; AKwUvByybJj5SnQY5CF+kmKAV+HCreS4Z2m4x0f9DSxYFv8PpNNzsatzBKx0Nw5QsnYtmFBa0O4p3z8n2xOX9vM=@vger.kernel.org
X-Gm-Message-State: AFuF++mkcY4FfphZhwmbWbNZUJ+0mm4DwuO9yJw+NKA+nMElN4gsQ49R
	iGuGTc5h4uIRzLtHy7gA3eMr06sBLhSbRkjp3hjukZNz4RcRfGXpNKTbmiK3w1ge6U+Ma2+XUkj
	H2wcvqmrchBgPLdVqCKZpfShPV5a3TFG7kV6PiscOD18ewIGCNYMYl9naVn3t3kiNKrQ=
X-Gm-Gg: AYBFou2G4zfep2PDKB1eHhbZulSAvJD7AC/6K1xIsUegMqPausY/qs1y3EQLNHiOVTk
	xw8bXZ5ngW3tZvpQJO3dkHqQB7WZr7v9AVB1GVdPOU5mf64yW7tgVESq7EbZodseN+wge/3jJoV
	gIpHAEKYPRSjZcpUIZ0sPtp8TjsLbvl6PtdK4RU0rk2l4tvKqsc+h0+nUQXgnWeLznV4U5lSUOd
	xV9alOcRnO8294sK0tTXexzph8/Nd7Zabpp9s9t25t9Kk18KcCeCQheZsArATCcjfnSEb2BpPIU
	S/KXywsP8+/u80l37LpLzahoAOv7wkTxdrXQVYxaJEoxtPc9WXurTShH/oXdXRtmv1Wi6tEq8TF
	4J5MqsdRE
X-Received: by 2002:a05:6102:6448:b0:7a1:fa0f:1106 with SMTP id ada2fe7eead31-7af1e1e6986mr864929137.36.1790251643316;
        Thu, 24 Sep 2026 05:07:23 -0700 (PDT)
X-Received: by 2002:a05:6102:6448:b0:7a1:fa0f:1106 with SMTP id ada2fe7eead31-7af1e1e6986mr864913137.36.1790251642656;
        Thu, 24 Sep 2026 05:07:22 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:16 +0300
Subject: [PATCH v2 04/48] clk: qcom: camcc-sm8150: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-4-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1753;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=1aJTQR0dA/sog7qGkyQAgO7NJrtOYUMQUHZCG6mJu70=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJFb4HQenFLnJxdJ/q7QI4+Y4zfD7JGYTQRe
 62F+epUN2eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSRQAKCRAbX0TJAJUV
 VqnwD/0etOKnxCGD+us360qFyiorQNjy5DIMBJvWAEKyTKVYIy3hnY/dQI5FJ/OsoMozZXywoOq
 lLoJSH141B4xE1B6YaqCW49KE0zp2EQuTxBfmGChABfQwnsYMJUrbnXq2QhrxjIcmtp2izM24qo
 aJPyPf7pjzhEMPadbxQvoiJ8rDMjqnk4F+5jSONEvyySpkn4bTyONJCe4RCvtu4nNBosyJUsI13
 6dnIBN+bclS4BSTuxSjf2Gvnfnc7v3K2vAN8DvC4f7lWlbqJAO+xYqXJQX+lv9jJdA1fG7Cp7Qc
 tk6JyXzLu+YN/Z2QGyy+SXoxBmrf+dX7YNzTNh9fDL3vLbjj0vw1HQ2hE2zrENwbyKZ34nJXpzr
 5Z8B7/rhi85tNufBojyftt5u8eQLRpYXChHfthwyhCdUe5dMG4otiHACs6CvIWJob/REbJ9iWYP
 HbEPHi8IlnZIjQEY5+9YRwIWmezEi1DntEKNeaaHVSBbxUQ8P7z+h1bMtEpMkHjN3B2MY/yTdZ4
 +kFTH7ovunHS42aecASCHKC+EV9buCDfAFvrT7FhfTsqTlNY14tVcbe/blHxL+4gxujCA64MbP9
 u1ClBPADqZEJfz6a+G+H/pSgnzZrGUz1G34rIIEfX6W8MlOnfdc96O5DBhyH1S3K+xbuGyhjfuE
 KGYi5CXQuxz3Kdw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab5127c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HACHd5sh_oZ471OAbCoA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: Wf2fk_VpoAg7ZPXlkeLMoJE4Lj526iyj
X-Proofpoint-GUID: Wf2fk_VpoAg7ZPXlkeLMoJE4Lj526iyj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX5sGhY7dynz3P
 dSjKepCc2KkQmbnxUBgoebGidTyjg6V7TvH34sFWkUr+BLX++Val6gOn9yVWL0q/oYGgNe5alMW
 ULWLAjQbZDLQ5NOmk3uztesguSoA9fo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX6UYJ1468SbPW
 wvfAwnfa0rI+w0PXIZSR2jXNNx9ykZbVtyhAC1wABXDgSe29d4x0mR9wk2IUxXlV9WLsojp52Dz
 rc3QO2ZeOcxxkQyByM/jwMv7H8cCL/P13vZGJH/oLuiG8l9OTITUtUFRJDDc6d/UmeXFRXypUCF
 Nfq49YZYS6Ok27mf/OcFJnqPLEgwK4SLzZMZZcGuIoLyXmytF/ZKXiOZvU3gPO3iCa9Z0SU84+3
 EH0eKeKVwMMmqjKspjKueaSaJu+LW2NGZQmORGZMQSW/xc+yl2Zffk81ganQrmTvIm+VSeHCx/E
 HTKwEags5SowB47SL4fHUywOf0qw4/C1g+aT64z0JalPg5DvazauMS5gjfq17XyfR+OBNox+p7i
 yaJkk63NuTwvRo1r2Ln0gI8+wt0TdLmQ7kVedOSv+Fby91utCt/9Gc0w5FM6C5qJWtMkG0A+1zt
 YzL6tExWSm3M1nZfb3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-sm8150.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm8150.c b/drivers/clk/qcom/camcc-sm8150.c
index fcbaff55fc27..27a51abddce2 100644
--- a/drivers/clk/qcom/camcc-sm8150.c
+++ b/drivers/clk/qcom/camcc-sm8150.c
@@ -2093,7 +2093,17 @@ static const struct regmap_config cam_cc_sm8150_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 cam_cc_sm8150_critical_cbcrs[] = {
+	0xc1e4, /* CAM_CC_GDSC_CLK */
+};
+
+static const struct qcom_cc_driver_data cam_cc_sm8150_driver_data = {
+	.clk_cbcrs = cam_cc_sm8150_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_sm8150_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc cam_cc_sm8150_desc = {
+	.driver_data = &cam_cc_sm8150_driver_data,
 	.config = &cam_cc_sm8150_regmap_config,
 	.clks = cam_cc_sm8150_clocks,
 	.num_clks = ARRAY_SIZE(cam_cc_sm8150_clocks),
@@ -2134,9 +2144,6 @@ static int cam_cc_sm8150_probe(struct platform_device *pdev)
 	clk_trion_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
 	clk_trion_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
 
-	/* Keep the critical clock always-on */
-	qcom_branch_set_clk_en(regmap, 0xc1e4); /* cam_cc_gdsc_clk */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sm8150_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0

