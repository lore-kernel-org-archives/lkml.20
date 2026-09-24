Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF9048C8C7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251704; cv=none; b=Su3qs4gBdnbNUI/5o8YLIVnFZ2cPf6jgv505Ob6gNhLAQ7KHFuN/Uy9ibPsHr93Rk/S+trAVv79i9EGDPNMYIhkMilIFu3PtGB9QsfTYG6H+s+lKF9Mz7swqCg1vNHntXRa3j5OQWPzEjeUOyBk1ZFTwSQOsoDWOqmwRn01qpu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251704; c=relaxed/simple;
	bh=gZuwQv57oVG4zm82RhDWq/IE6v1+U8lJ/nOT3ANiXpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pzYl7zteRgaz8Qd/IK8YGucFb72oIhEdSkqcWCcE5LTSBHcW7zIFNQyzMjONLoVVcm4djFT4b4j1uA5JBbw7MDwtB8vlsCllzeeZ/aSE3JbOgdmJ0kHI24KuWBnQOLYt0hgl+VqazwCd+95IiEYZzgnh/1U4/5Q9iXHxoWKgHn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T61Ui7DC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFSAlsfl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T61Ui7DC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFSAlsfl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC57hp1631198
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UaftVDjcgY5nBrJKvWUch/I8XKYUUaVNJfD6awIqQEw=; b=T61Ui7DCGtToa8/Q
	D7Zqqpu9FNqGgQ/PbM2338pxzO4w9DRHGnJ0AOvKlI6mir1chVjdPU5L0L6dm5Kz
	ViCAR4MM8iOMw8tqmxjG4FJnlNhkWM3K9swCDMAyoDmV7x47dqOfXrAZkTIzXF7V
	l70oy34C47JkCce4FJs0ZpWk9yMiws63wg+cT4aGbyw9fiDz3z61hsew2fMENNOO
	SrwTwXmOS8e6zWfDIMTMAr9lTyhVj3l6qezFOsgVup3dSAPbg2Oq9TafZu3yCiJ+
	vy9YwXtFoWKyhWI+NPpkWmwyDP4sDRms8fstt3r6/H7yTRGobdp5GBHZsAOThiH3
	BnRQHQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90axdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:22 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78830f4bebaso533936137.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251701; x=1790856501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UaftVDjcgY5nBrJKvWUch/I8XKYUUaVNJfD6awIqQEw=;
        b=WFSAlsfl5pZIYNwhpJAYJ4jWxz48CJPngbsXojDtw9NfaM3vQYbnbjm90Z7B2MuoJ2
         IujDYpAKJMAYE60V6ZPYL02oLwC8DGZTooMpE6jj9o1u3QpejKtjvTUrFpbXwdtcFhex
         r+n6ayByYw90CUM444dBRc/roFsRF6NH2t7aNLGWbHa+k9P9QLYxFYD+/EZWB7XlwgBQ
         Bvj8fvvvztCDOhyg+5TcF91jIYnYvnGZe54fyg512Xcv6fufk1sWGY4LSGGBPs3AjZT6
         QGfuCxNZDzfzdk+61PhxLuKKI9NUP5vM7kklwzz1mr+UTZS9CZ9JiH1EONj7MsYZBzUU
         qqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251701; x=1790856501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UaftVDjcgY5nBrJKvWUch/I8XKYUUaVNJfD6awIqQEw=;
        b=KH9f+seuiSZinYup1fWu7s9UywZLHe4u8k1OA3NL/2y52t4R5hgZzYrUPtY/X4osQ5
         0/DG+zXoh8uvmhsb1C9ilI5MQVeO3iNYreFqyOAo9VepH5B7yBa2mU4SwPqe3r4L0blY
         Rxk/e/e2xQNBMYoQTW3ZwWO5p64b9iIBW5AEmuMzr5EsmGwkr4C91fDwjvpjvm6zbQHF
         pXFn1voDEKn41xj5/9yvoR3DoaKnovHY1ptVo8/z0UBoZPKU8zcUqPqn752Ce0v2jmn8
         aoHPtOmGTdjJtCenHn48NYOmOoj/IUxTd2ykyjv53OZ8J+8F5OZrXRvlIyesZJ1x0Hwj
         /gmg==
X-Forwarded-Encrypted: i=1; AKwUvBxkfRQX/uvYD3NdAGIPg6jQO3MT7vUQX6NsasI4g6WqV3GpqJ1DvRwQLM5lT9o+yaDuGjSfhBHjC+yWHvI=@vger.kernel.org
X-Gm-Message-State: AFuF++lDD5IB1cv4Lgw2SpZeJeytAIMcUKXwyT/pVAQm3j6EQ1Smu0Ef
	8a/2o8lDdlp51vZOSvqN9RUs3eCg4m5/dXS7QFUajMbPkgQlvoB+O+p+LizzkMzAVdh27I52u0c
	hc+l5ar17F3+HnanDX0ZxoIT3USpvQdNdd0fPHT+T6+wPQE3LNKnjFovGi6LMBuXteBE=
X-Gm-Gg: AYBFou21GRZaP949g4q6QQmim6cMhJt+1Up+bxHx7fDuJ4WpJDmH59zjY3mf4qHk+dn
	ZPiVv82YImDDiz1b3k4H/J+UTFpCDxT7WEEklVqizLqKFmxX9I3GWjBSFcUvxCmBH0p0/cPEEAX
	dKYrDTm4+e2Y/EIj9aUiwdr0l6Um2uDR+sUhlN/4HiMv2lEgbZeraX6vB4KBd9u3t1GpF0wQBUR
	lAkFjcVCBwP0EoZF7+EDZYaxoaYnvNGMfvAi0wy460z5u3E4sD/VWBaL6oo69syLv/yIAVYszNU
	dywdTNCDLNIA5jrxcgydbrSnjYZinTcokbPBith+T3X49s3dCXsQSv5qQDcLNzT7bemZdWgvubN
	cRL6BjBuk
X-Received: by 2002:a05:6102:3306:b0:79f:5d5e:11cf with SMTP id ada2fe7eead31-7af1d09c695mr921546137.11.1790251701174;
        Thu, 24 Sep 2026 05:08:21 -0700 (PDT)
X-Received: by 2002:a05:6102:3306:b0:79f:5d5e:11cf with SMTP id ada2fe7eead31-7af1d09c695mr921536137.11.1790251700560;
        Thu, 24 Sep 2026 05:08:20 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:18 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:34 +0300
Subject: [PATCH v2 22/48] clk: qcom: gcc-sc8280xp: Use common clock
 controller probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-22-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2734;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=gZuwQv57oVG4zm82RhDWq/IE6v1+U8lJ/nOT3ANiXpo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJWJy0eZWFtGWisVX1jRj4cPhIxGNh0OuWVD
 nsTE24zCHWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSVgAKCRAbX0TJAJUV
 VttrD/4zYIDMFCF0BfQkeWY8DHLPgQhziRpkMHo6ozXlYv99tI827oKChVjRIE2n4qLMgIh++iW
 OO2ebqK9TPglo9MuDZWjI/Mi7rltMtX8RTV7NFd1t466L1d2L6lNvk9SjA+z6Zv0nWfSEGRRHMD
 gaKv25AG38La97CG57Rp0DHTGfXciJKlu1NjK/+yX0l41+Iyw5db+tR0+PVEbhiHWCy43iQ5Nwq
 ligC4OqnXXXTVrV/I9eATWIF8l80i2bM4EePpd+o//i9X2VymUhPU4Aau51yvu24Sid3xmBpxHf
 u7sA6ek4nPN/7SkYWJnSluxdW5VxjbRrtSRLf7yrirIA7EFtUwqRkIf4dwspW8VmSikb3j9KEGj
 5yomZO6oE5KEXxl+lunHaAUe0XDc7lg6LLAnZYML0MssbNAviydsp3Smom2SIO4Bbhtu7+1szWN
 9blHTJ8N7DXSBUe88Trob2mtWYlyVoQiF8Prl5cY+/MOrSy1i1dLELFHxKHXSPnZKyzFBTdl4sH
 r1AzXUjGPLSXqGBzygWFMNEnuqMsNVy5BxQVgLyjPnJL92Rpqs4RHt1NozncTlh+F8YFA6VxAYx
 wO6DuQtAnAquNVgPnoOzvgsliskQbYJDfIO7D+shCwIti68x+c2NPlP8r0nGxcUJ4VxVqtX7CIm
 H/oA5NW1raAbfEQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX5W6jZiCIbpwD
 P42xZRM1tInRmZqWLXvigIl0FRI9mCZk44vZzpk9nJ+r5e8ZVZFH2JYve2fqgm4VqIdzC0ftBSP
 Df7Psi8Pj5xOqllhcZoHJg56N/JBZj4=
X-Proofpoint-GUID: yA3w1bFOtFg_M9blM1eLYId5St4rANuX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX4eE3ciNLY27s
 fcBBPkKMGUqX/U5QpxKLvLo6eiDPCD3ihCATBCFfmwGTBZ19EPrWhRoXD6MXPGFZSmypcSU5Or9
 kLH2oiDyTdDSEJ9j6idIBCU1aqmHLGLFOaFvwK3jcGCyiZtYHb5Tyg4Iz/+YZ1si5e55Fv4C43Z
 lM4ljFZEDWke/H051oq4DhT2DwoxKfWugbuLp/5L3nUvpDZZNJs9pUIsGGyB1J4h1sWBn0cgWRv
 qWF6KtbkyvN3VuMzCYX3xAxHBXo6ZJY632+LXBvfd9Qlrbp3gzmSs6OHNVdoIjUzd4Nnl1J83Dw
 5WudRwXNdO1T4gt1tHjaMqnJrqmDdhF9fV/XOvVaWXHBQYx0fH1PXi3Y48MhrExiPiFxqd5iHj4
 ZSt4r4pVxQV9i6W5WK9//4RtULBRdsjrQdCeWh7dLA6+/BKpppeJFofY+KlNtLpyc/1R7/pgxhj
 +dF43Wv2hKLdfxqq+1Q==
X-Proofpoint-ORIG-GUID: yA3w1bFOtFg_M9blM1eLYId5St4rANuX
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab512b6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jsp9moliOvjHjNtoyGEA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Move the always-on branch register offsets into a critical_cbcrs array
and describe the DFS RCGs through qcom_cc_driver_data.

Delegate always-on branch and DFS initialization to the common probe
path while retaining the device-specific setup in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sc8280xp.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
index 81533e71e7ef..918c70648d57 100644
--- a/drivers/clk/qcom/gcc-sc8280xp.c
+++ b/drivers/clk/qcom/gcc-sc8280xp.c
@@ -7509,7 +7509,27 @@ static const struct regmap_config gcc_sc8280xp_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sc8280xp_critical_cbcrs[] = {
+	0x26004, /* GCC_CAMERA_AHB_CLK */
+	0x26020, /* GCC_CAMERA_XO_CLK */
+	0x27004, /* GCC_DISP_AHB_CLK */
+	0x27028, /* GCC_DISP_XO_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+	0x28004, /* GCC_VIDEO_AHB_CLK */
+	0x28028, /* GCC_VIDEO_XO_CLK */
+	0xbb004, /* GCC_DISP1_AHB_CLK */
+	0xbb028, /* GCC_DISP1_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data gcc_sc8280xp_driver_data = {
+	.clk_cbcrs = gcc_sc8280xp_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sc8280xp_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+};
+
 static const struct qcom_cc_desc gcc_sc8280xp_desc = {
+	.driver_data = &gcc_sc8280xp_driver_data,
 	.config = &gcc_sc8280xp_regmap_config,
 	.clks = gcc_sc8280xp_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sc8280xp_clocks),
@@ -7538,21 +7558,6 @@ static int gcc_sc8280xp_probe(struct platform_device *pdev)
 		goto err_put_rpm;
 	}
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x26004); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x26020); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x27004); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x27028); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x28004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x28028); /* GCC_VIDEO_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0xbb004); /* GCC_DISP1_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0xbb028); /* GCC_DISP1_XO_CLK */
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks, ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		goto err_put_rpm;
-
 	ret = qcom_cc_really_probe(&pdev->dev, &gcc_sc8280xp_desc, regmap);
 	if (ret)
 		goto err_put_rpm;

-- 
2.54.0

