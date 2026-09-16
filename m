Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F6F4EBAF4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554663; cv=none; b=mYSV5l8c3aAR6NJ7KpAKn8WuLO94QbsJt/JI+B24733Bd0gLFZxbLoo0/5erw5Bae5tuUOal623JA74w967zBQx6B3pPE7VXSLvtfiOMeqa0lb1n6n/pVn3CggAp/IQfUDurJHPwnEmStRpwVYTADZeMPQOvo5T/12mSkcRxgD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554663; c=relaxed/simple;
	bh=YjM7ZKJiyjuCW7sDpZ8xDtZxtp1hd2L+vcbDmTf29FE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M61p9rSvtoiLpYuJTaGlcSrBxWViMbjEeyaLpqh0QtXdZklDOJ9vhDUcF2BhKrUX0ErYjVXW4OO33GHC0EdiJhFpID4oaXWHgE+apuNlZI9mr/SGpEceKq2kTlCYdRwUC5jstw+YCd7+R0K7jamMclMfQhyn3zEKtTHgSfhqjRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z94fFudr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KVb3xYyi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z94fFudr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KVb3xYyi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92njw978261
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6qBjpCKiA2EPrjgUsDuc3+hQCoJfL0LBOHGblx+hp5A=; b=Z94fFudrWKyXpDaZ
	D9dhDBRv5uWLaahlGrLxrg5C36val7iXyaDAv/BDf30lkzgiM2G2enuF5yQK/q9X
	wH8jftJO5kf63uIcX3UJNtgyi04r8XA+BWLJ/GGDEHLjOjOMbCW5XFYnlWIBptn2
	RmkLqs9x6FZ7kG8d0wl1Q4pZxrZ8uC5KH2UZQkVhrL2MwZPMxTVPaEPgC4+1mf0W
	WYL+E66Le+0fKRdoHa+CkYWVezE824vqAbcmuvKUHcckGpJYj9UleVcSt/rK8y1g
	eBCMpI4XzeNTJN13sHXDpBG3HXFMTFUPY5iJXuxJ0/m2mKs9nJfgx4KBrRvwzI9P
	oC4IIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3rfwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1b824e84so686207885a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554639; x=1790159439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6qBjpCKiA2EPrjgUsDuc3+hQCoJfL0LBOHGblx+hp5A=;
        b=KVb3xYyiOKTgvcV0kNPUFHFuwH2CSduMtuxTshe+inUx5o/QfCsxuruUjLtn1KLLtQ
         5q4FA8rFJoZNi1ch+S0SnnxFavWDQbiQrdHPOx18v2P3miHvz1L9hEQCfuOo2rdC/C4I
         VNZoT1cyWFHKyx+FIxCeVA9/mQ7uK4SOI+nXEGhXNp+9ViX01WWbgfgOlJR0PMDbkaYj
         HA1r5XMKGScEIB/FIwittY4uHlrbvFzC53oz6rLY1LY9f9TlVpsrVq9MbmrhHAq2dK3y
         EoOSae0Rln3p08U9xWbcs6RMi5s2xq44No8QPY1Ngh+BtmCOYTHTnARtnCClrbuv67KQ
         HmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554639; x=1790159439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6qBjpCKiA2EPrjgUsDuc3+hQCoJfL0LBOHGblx+hp5A=;
        b=EJb8OoBVqE76dVmhMh9PBtLwKhi4iW7Mw7w6ppNw3sLjeYYNtSWXHmDLQwERZEkBDo
         G7q7YcgPxXH5At9xXbAHC1hEsmqHkEXq/ZXUAiOhRtUEzf1mZ8/lMM4ssKXzM/M8tan1
         PwxT1eqNMBfGry8so71GMJSnrtlkcjTKyYQ/VCLA2Cq40aCNgFr/6qdue1zcE4OrnIQA
         +BcPeUFuDmDTH/O2CfU1/PElgGjHfSZeSXqBCMYajW4gy4S9/ft9pTxqUcZ12mQhHQj1
         E4/vx6KfrNwqMw691ORs/Xjbg8J6b/X7AexI10kPOaYcgxaqpy+9xgGjWDBGyN6MPs5H
         UeiA==
X-Forwarded-Encrypted: i=1; AKwUvByEO16tSGtQoAUeyDUyDTb9p3hL78kNdY43OBrgxvBAkEmeRBXdOEBjYEHCtoN64CF65ZIjhZzK1tYcQZo=@vger.kernel.org
X-Gm-Message-State: AFuF++niY2KSmKfPK+l2MhwYhrBIeEhulGPBhDBQDKH/JxXYUxIx2M16
	jHoLf/T+5lrgmGzrpVn+8SQUAc1CiE3Rd8O7sLkayshPcouZnow6qzW6QMT9sQQ4NVOzWV3nXcM
	CHlIO2xQLNLTlo/XVUQTpr8PN2lU/pYfwLD4j37OXdrkA7G7SctVSce1rSptazep51mI=
X-Gm-Gg: AYBFou2odcq0DFcVC5UXX9eWDR2aPtuEEyqx+OCHq+sxV/X8x48D8NGmZhacE6bgtm9
	uKfPmm6R1S3OSTDAYDENwg9ytSgydTPe9VHJiyFdMmvF/5O1DcKY0zA+jj5I2SFwUgqsmheIi+t
	y80z719dlUC4SvtXkx0dJPAk3BSMVGc3THwBXQWxQAGm5X4PjVnllWzL4V2gGuvNuNNTBay8Do0
	FjYSWuF06iIe5MCBzh5RPj8IC+BA2ohk4zG4euDfwhNUqtl6zzg/So7r0q0m5xJIuxCZbBZzfuI
	a1KYBhCrp1K14LczFyIUMAgUXZVvdy6nXKYj9v9rvuqFVrSv0rNelxRh5e1s8WJKFFxqlq9i1qv
	q9cJ0msg=
X-Received: by 2002:a05:620a:1707:b0:939:d78c:eb0c with SMTP id af79cd13be357-93bb770858emr308915285a.11.1789554639226;
        Wed, 16 Sep 2026 03:30:39 -0700 (PDT)
X-Received: by 2002:a05:620a:1707:b0:939:d78c:eb0c with SMTP id af79cd13be357-93bb770858emr308906885a.11.1789554638677;
        Wed, 16 Sep 2026 03:30:38 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:37 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:55 +0300
Subject: [PATCH 39/48] clk: qcom: gpucc-sm4450: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-39-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=YjM7ZKJiyjuCW7sDpZ8xDtZxtp1hd2L+vcbDmTf29FE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9wkVAKoVHYZmpq3t/wGp5aKjqOSziJlLtgW
 7zIG2nwlqiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvcAAKCRAbX0TJAJUV
 VuTkD/9qaxtejPTXFpC/YJPjkmfUczzLIcU7eSMMB5DfqAYafaGqIxjlZOVvykYhYEqhGuVVcn3
 IpFd2IqgL+AJ1F1SdYTDgiCJVWzDNksPnmH9E0tl8wqsmy3Vk0p1tcfm9zsd5EoHYgtXs5QYxAf
 d0HkyvVh68tBNZGqR7kj+f+Wcw1ZFfc4wQg88BfBk9Wai1gEs6P6SMp0lpeW/tz6DGcaBC76Ngp
 XpjMtB90afbUG1cgPpCXD7nlmtSDMGsMKpdf02XuAQ9YPapgOTHCEE8rwL4BAIxehtNWu4+hveq
 Q4ePhp2E/QMd7kj6dP+T/mV9YScz7Pq5EGGt/OmOug3xpVcuB1VSQLcK0niX/TD7/n+3WcIztdB
 Gy4O6MR/IbduJq3RC6eGenz68svI/oPqMNcpKKZ/AC86qglaQmNh3rW9w69vH0nHPL7A0En83Sx
 t562oSv1FN0QJm3TM8DEHeJ10LJXhnMOXMCfVf6owTpUrfTOXM2tsiRU/Cz5vUAajZbBE/MWGOW
 2LJUR+C5wwZjuIIRzlHdF8mcBkR6lOcbtriLnD65L/TgK1WkM+fp4GfYvqd3vESHA9LyiylOFBC
 dxLhCNOYYbcklRkcjRhuq0KG9/d1ohAZMfzHEjw2z1XYadpx5Wbsp9dmDZ49LDBgu5vqLZnhTll
 tMkG16A51X64Zcw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX+OVBG6IPc1X5
 Rgyd3FKpLanV49OL25moR65jbmQD13C12xUga6vHAd2Q7bkpDMQ4F8VvMpADK/luICXP1TqjYN/
 HVOGWf1k3v+5jNXPwym1PCB+y9o6/NgbCu0E0X0t7qOtnROp5LlqBlkW92Zwi4NIhB8CRAqOLcM
 jIfDZgFfCfHxxszrdSrOox/GLQiUABgDIRdJyT8qNwx+LQ6Dzo8sBXDgYOpRvjLwvk4uvwuTcd/
 fV+smmk7X1s2C1BVraFT3iTG0D47vynjFh0qIHfk0kDfZITsu14w+9N3wjHIR1CgAnFuPsJV+91
 DLIBMjiwph0tWt9gbI+ckf8fhFBZQeepURHsgoooigmdq4IB8T3xJV/DAmaKP3m87L6JOZazyRb
 Jd9OIyn0YhsCU86lvKgYc+WInB1dvZDH0i9txjBAve29npCshXcYrGQxsTk0mhcsDoQ4dgKoAq3
 vCpwPElsF9tuBYo6amA==
X-Proofpoint-GUID: lMWdeHRNt6AQqdC-XIdtGiLi5p9x7RNV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX5wJw+oCRq+N6
 ASpMVKpEFndMtObH/VlXuWdqSuAker1lXRit8R/US4LFrTNwooimu2ATDPrNlRhL9zb7HYsnHOU
 3O3gGMmQAoc5Puw+3U+COqsbM2azszE=
X-Proofpoint-ORIG-GUID: lMWdeHRNt6AQqdC-XIdtGiLi5p9x7RNV
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaa6fd0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ED4nYY0oUM9iKWp7kXQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-sm4450.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm4450.c b/drivers/clk/qcom/gpucc-sm4450.c
index 808b1eaa59d1..bd0f3fc2b726 100644
--- a/drivers/clk/qcom/gpucc-sm4450.c
+++ b/drivers/clk/qcom/gpucc-sm4450.c
@@ -754,7 +754,19 @@ static const struct regmap_config gpu_cc_sm4450_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_sm4450_critical_cbcrs[] = {
+	0x93a4, /* GPU_CC_CB_CLK */
+	0x9004, /* GPU_CC_CXO_AON_CLK */
+	0x900c, /* GPU_CC_DEMET_CLK */
+};
+
+static const struct qcom_cc_driver_data gpu_cc_sm4450_driver_data = {
+	.clk_cbcrs = gpu_cc_sm4450_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_sm4450_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc gpu_cc_sm4450_desc = {
+	.driver_data = &gpu_cc_sm4450_driver_data,
 	.config = &gpu_cc_sm4450_regmap_config,
 	.clks = gpu_cc_sm4450_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_sm4450_clocks),
@@ -781,11 +793,6 @@ static int gpu_cc_sm4450_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0x93a4); /* GPU_CC_CB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x9004); /* GPU_CC_CXO_AON_CLK */
-	qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sm4450_desc, regmap);
 }
 

-- 
2.54.0

