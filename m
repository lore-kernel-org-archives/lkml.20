Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249753AAF70
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554630; cv=none; b=VljPTjXv3ww3qhHjhUjzfXyYU3Qc3J/iKC+uvZT5tJIk9Qvb0AzzrMXW9HO6Szyj1uW4Z8XrhDI3HLbp9IRAXggJEkecaiHyKXuLLSxDGGKgP3aRWA4oNnu5g8sfYpzPPZ8hk0ms4f7UPBQuH8v7s/Q4Y5WXvM9m0jcmIC2z/uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554630; c=relaxed/simple;
	bh=b9VHnUQlJBlralyapGmuvtRphCZuwYIIiU7q4+OGFvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WvPnwIJJ/pibtyzBZvWc3Ss708ePrZ80UrMXWuRAJqb6GfSFERLQNwv+S+JMhXPd7cXiGa7ipKVcBiIkYTK5MX0Bj3adrD03DeqB1fZHboo+ALenwah9mliLHsp6JjAPCwSzgGxDpL3qgYrfKEtaAAnAilJz527tMnHi9DBQL9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LKVCswzx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E6a21dWr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LKVCswzx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E6a21dWr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92eQ42348092
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XWVszUTdZADolc6oje0is2V3B8QC7Z0zk7QtBbC6fjw=; b=LKVCswzxuIiYDyFv
	wIw5HDQZy9O8YTNszyQkbRKiaR/qfawZuCKrVUuRI+XNEShDvJop7ohijYGoaisD
	cjln+OecttY/k/OlMDFZUEE6iX3xCH7khlXZWJBIcyjWnx4oLrbHLO/W53GSgLMF
	mJM0fy7ZX5ISW0gNXuJOeTIEJLuzQsMWOFw8PnvqzAJH4+zZbEFcjspSjn1VVVzB
	vgrjHIu7hIbU1kT6JKidBlK5yB5CnHMISsRhl0ZG+phhPYdjgxCgJ//mGg5leNl1
	xMNjLzFSIpWOX3N+F2+OGHHa6nokEyCs0LDx31hvopOsBYcvyt7S3d4XdIyu8xHQ
	onBY1w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywas6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936e393061dso868143485a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554603; x=1790159403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWVszUTdZADolc6oje0is2V3B8QC7Z0zk7QtBbC6fjw=;
        b=E6a21dWru9T2oIkCdtevdv2f5c3ZKuHyMCEEV2Q16r4KqrbO/z0E1CZOv+xeHf2Ak7
         QpQXrdDwTlBSuWTCeRw98y26EW8PdZw2sQqLWfGRz4TWAUkyQ5cJvQM4VvxfNR73ceBO
         8Q7qKHVoFbQri35gWprA9Tcuhe+Oh14Ai9yKDiMyAHn6sGIX8OUPCTprEkypKGF5ycIQ
         Zapzs4WU2CtpZXI0HyIrGSzoaqtPzNAV0shbMenv4OREv46Lmh3vMDvslovVi8jnRk+/
         Jux/3mOTe59OA2cu25j/qqJ/emAh9mE1Z1YLkxAhTU+rHZuniG6Dpx7qvXPtrcbX0P7R
         KUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554603; x=1790159403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XWVszUTdZADolc6oje0is2V3B8QC7Z0zk7QtBbC6fjw=;
        b=abI5vr6Y/Dp0l/XzrmaJb5PYRqRZQbLUOcvbBGAx4PbZEg7WEsN6XtRud8ue9lFe+Y
         Zd2ilehXBiAvX57ywFyy8/Re3yEpcw6U/vbI0JiUpF+aHbfWkXdNK71FwerlXYuL6i8Y
         wVqpREBbGKYC183Q4XxATl4sfK6hDfqypZVpvj0p90RPpoa7IdqzhSeAMq9WyHO8hQBM
         iSkGFgtvO8qkpC6pbIrfoRNPfsCOrbau6tM6palmzen+xpeLr8xOLBULB6HKy4Q1JtUu
         otodCQaSuttdWjvYjEcLNrUmJkMzXHdiHIj85+LKblolURG/tN83ne5DOgX6XJjctNqb
         W5QA==
X-Forwarded-Encrypted: i=1; AKwUvBwR9KXENVgR0PLFdPVVgJ/0VKQLdOSX/3TQ7VTg6itdgVb4BzgNcTYHC3HxaY3pZ26BU4bklZ2Q+sNrmag=@vger.kernel.org
X-Gm-Message-State: AFuF++nyBtsAxxMDdPie7R5ogl0/rYSgO4HonnjpTYmdd+4XFEAEH099
	6Aez1LKOIa+M5by+VDVdV821cylBe/p45PyCEsh7+0aXwCxKlewvGYHvhfiWai7gXgkFJI7++bn
	EKSn1dlpWq7b72MBIE2pPCK8j8pzCcQxvVvfP2FmBFKQe6KE7LTaXs2MUYrUlFAecbz0=
X-Gm-Gg: AYBFou0/pf9KFCO8V79/tky2OwQqyl2N9iEW8g1/OZc/e/oNPOlZca/oWmdGTm6tHZ6
	XvouTHAXB0KeP1//bZ3K54wGjgBHQfMVpahgzHI/gdFuPNK8Ngd1n27KKE7UJm66lPOgsPBAiaL
	PQnpWW9fK6usqiv+bpasVYnlJUmDN5e6XA0UKLaxOabT81FYBWgwPaDSOHhrmDaDeuIkcIH5N+r
	VMNRCuvxtBpOcZ7RhpDGfE9K5Jj47tFZdXom5YTM1Qeu7jr7jReWCm2ymL29j8nnl5s+S5c6HwW
	q7ss4hOctW5b4oDk1aOQGkawJiW4vu5lS3/S1hsatt3dVWeon+lukWd7e9wnfvsTmYv47GvB6lM
	HUxcCnV0=
X-Received: by 2002:a05:620a:7010:b0:939:b43f:341e with SMTP id af79cd13be357-93bb773b3d3mr286290685a.22.1789554603228;
        Wed, 16 Sep 2026 03:30:03 -0700 (PDT)
X-Received: by 2002:a05:620a:7010:b0:939:b43f:341e with SMTP id af79cd13be357-93bb773b3d3mr286284385a.22.1789554602626;
        Wed, 16 Sep 2026 03:30:02 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:40 +0300
Subject: [PATCH 24/48] clk: qcom: gcc-sdx65: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-24-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=b9VHnUQlJBlralyapGmuvtRphCZuwYIIiU7q4+OGFvU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9iZJozDeAT8qxLrIprCcsIcOt7wxVqFvfIl
 41fwemsCviJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvYgAKCRAbX0TJAJUV
 Vo/LD/9aBnGc2gFGgl8AUWJxuP3L2SEHrmrT4V29PHFF9cgB/B66nsYTsNSLxqRMKPnjmTvs5vy
 E9mFSmGSDmzK29XpkZONYdgkE4OM4Z4Bep9VumJgWXuHf8Oogf3fRguRQdPK5pICyUIKjJn8TUs
 jQbaZ9RGBk3aReaCyHsYDROOdPkBr/r8PboMF4HPub95k+XXh7Ew4yQuGYUu0d2hCLOOj8WjJ02
 blM9k4NsU0t0CS+T/tl09OehI4+TQqzPafUUB5kw42SNlmhzTB+Jy0gIbn0iWsSZWlVj4ovb8+4
 5Fm8/n7Seh8KWHEIdexyjaPGLRae5hc73dYoxQS8TrRQZD1xLyfqBa3P2jmnFlXoRctCDjGtLKC
 LvqGYt7Tj+DS7mNKRWu4Vd2+wcykb+nHoFbpv7HUu3Xqf3bcVL6OBpqWRsixqiaYdK8e9z+uCL9
 CDa5s1vYyP8qJaCdcJBc4lJ7vQ2BUOiMSrz/1x02xp2wE01iaGNEU6AE3DzEfgjDxPmS3i+Z80/
 5koHwDRc1jiWFC7S7oWCUeHpG8i8+k+zOfIglFiE/Kn5cPtuQ2LhzOVP3sHloqUk748IjQxE3OL
 sd7VQDVssXlYh+FBCTyjmCpIC0UpMPXIXFczZ8W/gKLFLmP/DeQwE5A0IlSoU8SCXZ5Y7rAa48x
 auOxa90A8SGPRdA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: HyWuXOARXdCv_kCgxWqAomMjdBOEqCwi
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaa6fac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XazbkJH4cJJKrr3KiP8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX33bDgkjl0ePf
 7iC6T2aBZJGZP4xs6On6lgBg+TAUQh2k+C6zIV6EAc0qf+7KASyliayP1YuiLnHQgheHSL7GoWr
 j6zAWLM2QkbBZh5QmQfRjQvADp+/Gqbg4Nc3tpLLsBtoT8ngKw6PE3+itMUyQ8K1UgI1UP5dccR
 o6VtUFQ9mBu+c7SFHvcvRYZyvHjXRM8KLNm4gZEg9GiS98JgpWY9hNqLkIcMKIIMS0D2/gKk0dX
 j3RS/hE9o1hvumTJdUbnvtSu74hvZywSZlwVHMp0Z9V9frPiqKL4t0VLljC5G+01dJ7KfFW4Rm6
 /5Z5GKArakcLM9Lb1Qv9c9k0VLSzjj7xWFfnAFhszASQVrz6aAAapzuzFeu+HSVrTujV2fym/q7
 1/qLfx2STuWVmBDS4qHkK+dwCVaKiho8HRgzEh0duXud26bIS0oMqpLFTt9fPzaMKNurYahkGkG
 8Cs0GIZaitCb9PBa1dw==
X-Proofpoint-ORIG-GUID: HyWuXOARXdCv_kCgxWqAomMjdBOEqCwi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX2oveZPM2Y4Iv
 AkTTvdH5Lfbb2mpciHYcBWHC/2nKFPnXw1mq9948aLyiMPblfK/hsGcF9QSUPnmhVN2umpIfw11
 8Iz1QhTEn8WDbB4FHSAU0HhWWAgtFps=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160137

Move the always-on branch register offsets into a critical_cbcrs array
and move the register programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdx65.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdx65.c b/drivers/clk/qcom/gcc-sdx65.c
index fe297c606f97..ee054e6f029c 100644
--- a/drivers/clk/qcom/gcc-sdx65.c
+++ b/drivers/clk/qcom/gcc-sdx65.c
@@ -1551,7 +1551,25 @@ static const struct regmap_config gcc_sdx65_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sdx65_critical_cbcrs[] = {
+	0x6d008, /* GCC_SYS_NOC_CPUSS_AHB_CLK */
+};
+
+static void gcc_sdx65_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Keep some clocks always-on */
+	regmap_update_bits(regmap, 0x6d008, BIT(21), BIT(21)); /* GCC_CPUSS_AHB_CLK */
+	regmap_update_bits(regmap, 0x6d008, BIT(22), BIT(22)); /* GCC_CPUSS_GNOC_CLK */
+}
+
+static const struct qcom_cc_driver_data gcc_sdx65_driver_data = {
+	.clk_cbcrs = gcc_sdx65_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sdx65_critical_cbcrs),
+	.clk_regs_configure = gcc_sdx65_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sdx65_desc = {
+	.driver_data = &gcc_sdx65_driver_data,
 	.config = &gcc_sdx65_regmap_config,
 	.clks = gcc_sdx65_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sdx65_clocks),
@@ -1569,18 +1587,7 @@ MODULE_DEVICE_TABLE(of, gcc_sdx65_match_table);
 
 static int gcc_sdx65_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-
-	regmap = qcom_cc_map(pdev, &gcc_sdx65_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x6d008); /* GCC_SYS_NOC_CPUSS_AHB_CLK */
-	regmap_update_bits(regmap, 0x6d008, BIT(21), BIT(21)); /* GCC_CPUSS_AHB_CLK */
-	regmap_update_bits(regmap, 0x6d008, BIT(22), BIT(22)); /* GCC_CPUSS_GNOC_CLK */
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sdx65_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sdx65_desc);
 }
 
 static struct platform_driver gcc_sdx65_driver = {

-- 
2.54.0

