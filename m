Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A517B48EC7D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251711; cv=none; b=m0M3oCMP1S7zCrI7mkf2/tpctW1Od8O2Q4m2aJ2UeFsrLjf+2Xjie9EG88L82fkmSDTaBObgOSywgfij+/gqLbv9X5L9rpjIqz8Ay+qWl2mrvREsayg9tzuutAhc4ek+/jkSkhx+tXRKmCNa+RD6x79jNd9uUp3XMGNFALiS4Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251711; c=relaxed/simple;
	bh=wVicLqiZaHQpK4cKVmkBC7c152NCcZk0J3UuKxOSObc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bsiA3lC6AF2BG25t0n/FBoBcf72bmcyq2omvynp5Xzz6AD+lVJhfubSIYalRUAs29+5OMcIt/BFR2abl6JCENw8FaFFI7HwFlIv5bq5QqT6MKuOjgJZiWKNZcUy12Hdlxdp3QrgceOLe2vBicZdoB2ppwBmXNQ1XizuJ1AEjPOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQLw1D5Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IbdbnMH8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQLw1D5Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IbdbnMH8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC57hr1631198
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wINPiwHQP2iJKtxxSgOnW9V9KgSkxNNXYHVR48986qQ=; b=nQLw1D5Qi8F5IWAf
	HoPMrVh4HJ80lMMytF6QNKhOFZrckwc3c/8mn6u78Wcr5gj0a7fxTJYZ1P+IASN1
	p1G90RYq6WwDkLLe2ZkXtJr7L/uoeV+Ml5WwawyzgNRISjTvqCPF+5Nn3RZrdUNh
	3huOwTrscAOUyC+hUo+M9lrC4y1lmUFZlLCVxjaTAJChBVxJUoFN8+En49rjZvVC
	rMEx8ipj3jB1vxHFzVT0sPD5RRSNTkRXrJuQit4yOZ20tjIMxEBzLCvbTegl7zRV
	N096AHXnMegHkjaCXOKW743spbo+NcNQA4RzTBG15EZSTWQj+QxsfKjUWDWhUKTX
	zAWm5g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90axee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:28 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78a5a291af3so1819566137.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251708; x=1790856508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wINPiwHQP2iJKtxxSgOnW9V9KgSkxNNXYHVR48986qQ=;
        b=IbdbnMH8zB432dVFPoNrwXxGhNZtvRayZGu6E3sPhTRkxCHmpx2fp8xpS8C8HDZNXj
         H+/lv4hVqVF0JA81ApZ7ejj0WxTi/hprOAV6374djPC/g9AN18mofnLQRUPEN50/Ym1c
         JTnlOc3GChAZi55uH7fxzSBMdrP9jz7wSBHoGD60y5JUVxpAopR6HuXA8HS513EpkOfC
         rH/oHP+E0EsLAyXrMlEkp5iIKGvbigjcecPd9TK5qgd0SNTl0NNS1ymyuy/GDVDvUNyX
         VPpSrFfPTffy/3UkaGCSWEY0RXaRkyPZKLW/J9JYSu/pAALY//+Ol8hmdGqyd7cbFTgj
         7rIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251708; x=1790856508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wINPiwHQP2iJKtxxSgOnW9V9KgSkxNNXYHVR48986qQ=;
        b=fH3SJevNjPSSqVRYBuwqJJfqLog+laJ6IRBxf/1Ms3ttRkmjfWaFqV6et1xVNArpf4
         i5hnKOB+QTSN4C1aLfDmbF67swtnyS4CbOr7bvClkfAQE2UPmBZrLveaTB65D20uKJ/3
         dgJ5PjCaQGDKfONmuouQPFWNYdkhGBI1s5OTmgmgWlTFcbHt9fgiWWXWR48tZqauhfMh
         6qOXRf8Kvi3R9qIiVHhTbynyVPGg1LZP9dgwur4M7KyA3s4RtrveX2PyMl/egpF4iAPv
         ezI4ymGLt+uoZjPueITFWVpdJ2qgdzIUH638gQ5rCa5aEIRxKQ9+XuLNprrwIWchkw3A
         Q34w==
X-Forwarded-Encrypted: i=1; AKwUvBwUNcZCs6amhnCDfLm+//16LTTUYcE7yd69CaYGT31hvC7r+tTIYbw5X9xwm+h8Vwxp/6PtWqSTS2KUrsc=@vger.kernel.org
X-Gm-Message-State: AFuF++l3PXOwZSwhBJCNBYQ6399Byy5SGxqwbLvNFcX8MQnFt17XL6px
	CLok13O11hLsE25kmiiWnLKi7azYVB+NomY05m71j/cx0Z13z+0lzj+Fqj8qC8E6uH9cb9i4Cpg
	MtdewcewABz2Oc/w4Xe3Q9jqi4/nNND49bpYdHDTDwzNRgeiisHoTHioqM7ziBMIWAOIQFCryvS
	Y=
X-Gm-Gg: AYBFou0Ve6IqU20/cflJg5rkU8qKi0usuc558D0UAailz02YEUWsRYiiYg3Z8cpMrm4
	8QkZHKye2BNqHn/HnCjyhobb8F944KcBUXaZwB0wKD4fsni/ASnnItQzlnmcKsbAdI91vQ/z+YZ
	czcS0Xjt5N5OzNavaL4W2E4MCxyfpiE1UwWHnNpiJep/0PNjV3ql5C2r/YGygtgWNhuI2D5VKP5
	CUg1wXxk/Zz0RsVCqRw9deqy2nhjhnjeE0mPsfwrg9BKzpbufYizla6rZ3O1pMODQk0SfBmR30F
	oazrGxw0BH409BMoNXrv3yDj4KyJG2COFoIRijDsSLhvT29yKnr/IIY8k5We+al2UWiq9HFmn9P
	WBLlaZjM/hkvOR4e981Y=
X-Received: by 2002:a05:6102:41a9:b0:7ae:c2ca:8dd with SMTP id ada2fe7eead31-7af1e6ef68fmr1224255137.18.1790251707602;
        Thu, 24 Sep 2026 05:08:27 -0700 (PDT)
X-Received: by 2002:a05:6102:41a9:b0:7ae:c2ca:8dd with SMTP id ada2fe7eead31-7af1e6ef68fmr1224228137.18.1790251706758;
        Thu, 24 Sep 2026 05:08:26 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:25 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:37 +0300
Subject: [PATCH v2 25/48] clk: qcom: gcc-sdx75: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-25-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2188;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wVicLqiZaHQpK4cKVmkBC7c152NCcZk0J3UuKxOSObc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJZ6iWqAkUXQbMJbRt1TGihJgwVSz1IphPjQ
 61ItvgGD5mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSWQAKCRAbX0TJAJUV
 VpT9EACIJ9g7XWxUokYjlrQaNwLp0isvM5oj3cVSJTMlG794pYt5M3/640ayDzZHqQtug9amfob
 sZbNzRMVx8vI5mruED04PDsOnlvbCzBh20CpRcEyxbe6mkBxJVK5/tmG/LmcnD9lOVM2bENwBZ+
 nPTQ90sBKq2sfhV4NUVYEGmWawhfbFdlYK8QmNwNO2dghtiSKlDzNNPxe6lvIZMH3PPOy888WIP
 0nyqyMUKi/NBuAICRDXDRAZ4HaGbbtP5oIcPOHUmhoJCvbqb4LTrvSxHhBDnepZdXkMmeOzBxzM
 DI5SwAHIwOk/+2ndzF+8uFKDf6pdd6OPQeXuh/0w0uG7lqzIe7amD9d7Fuob76oJOmcaJAHj5Zn
 dLoxiwfdxyZORUWH4w6XDeDJd7pHQqdZvTb+3gfAc+iJIIfVbxp4uF52puuKW0kg0i6uI6DaZyS
 S5Z3qbK2OYx7lPBQE9BXjDMyUBDc7DKYF06SNhyESJb8SKj0jh3ChjhTG6M4SiyJGB1VpE5X5+y
 ASDlq5WZiriT1JMpLZlAdCQO63Ef4YwPHqnGFNeyZjHsE7BiFuUGpu8KLv7OVN8RQLEMyyziZ7X
 hdYGfVgf9TNEBOwmQQusKlOgUVyVDy1qHj5/vgkBcbGszXdwLlQaasAh6N8+0Po4MMPz+7k8I0D
 SHYOvdVcf1XCWGQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX2M3LWAR85rid
 zPqrbhYsh1LnT6kQ6/YEmo2lwwGN+t/9fiCtriyy3xxqDPc0DRXLCRrKAY2MnSvsXoJkCdULf3Y
 wwFVnP2D4ti/SPYj70QgLdQZWGKO2lA=
X-Proofpoint-GUID: d0OOve0CcBGObBSxbRnwZek0n28dJdMo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXzVDAiVocZvQL
 2QYD0W4jtGzcfjcM95pC2Ye1zpx6CoC9zLGyocqDfBCwsYhRiGknVGjuTDH+P9NxmwKcBFRc5u3
 hBtR3kPdNmt5Y/FqDb//syDPpupdb9fB/sjY1DsSPywPOOO+F29VA+9dSjEjNnN2QJN+e46qKlv
 fEkUjRU2gkT/MI+PK/gW5VVG6C+UDJD5ZPp6XqcYTOE4MmihtLM02Pz0Z2qusUDA73eKVM3xlmZ
 gLtAs19zCil2T3jMaaBMCwMCbIfNKuy/JGVzGgypvwx6QdoXAW341fgzRvt7M+ZHyDMNjJqbX9s
 NRnApxVfI/rqwxm61u/ASA1rqw4JcuATDupWQI1IqsTu+2o6MtvPfxck1tz57B9pI2fRBM3qf3U
 6NgvKTv5QWdIzmtH/EfWA2feFyZJTfSAIeVb98mHIDQTTfu22+kroehkTUyI6rwSke2ZFJtayDd
 BqcQfSXKgAixbvZvukQ==
X-Proofpoint-ORIG-GUID: d0OOve0CcBGObBSxbRnwZek0n28dJdMo
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab512bc cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8L-1-Gifo5kdOXCWqOUA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
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

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdx75.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdx75.c b/drivers/clk/qcom/gcc-sdx75.c
index ce9f19655d6d..035647627f91 100644
--- a/drivers/clk/qcom/gcc-sdx75.c
+++ b/drivers/clk/qcom/gcc-sdx75.c
@@ -2905,7 +2905,20 @@ static const struct regmap_config gcc_sdx75_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sdx75_critical_cbcrs[] = {
+	0x3e004, /* GCC_AHB_PCIE_LINK_CLK */
+	0x3e008, /* GCC_XO_PCIE_LINK_CLK */
+};
+
+static const struct qcom_cc_driver_data gcc_sdx75_driver_data = {
+	.clk_cbcrs = gcc_sdx75_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sdx75_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+};
+
 static const struct qcom_cc_desc gcc_sdx75_desc = {
+	.driver_data = &gcc_sdx75_driver_data,
 	.config = &gcc_sdx75_regmap_config,
 	.clks = gcc_sdx75_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sdx75_clocks),
@@ -2923,23 +2936,7 @@ MODULE_DEVICE_TABLE(of, gcc_sdx75_match_table);
 
 static int gcc_sdx75_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sdx75_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x3e004); /* GCC_AHB_PCIE_LINK_CLK */
-	qcom_branch_set_clk_en(regmap, 0x3e008); /* GCC_XO_PCIE_LINK_CLK */
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sdx75_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sdx75_desc);
 }
 
 static struct platform_driver gcc_sdx75_driver = {

-- 
2.54.0

