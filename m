Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCE74E80D6
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554631; cv=none; b=USZeOnfXBcs97VNzTanR4YPjbrt+tu/27dj3W9bber7NBlu5clGK1dI4c611g15mKzrzlOi1AbDQiiqA1UyJSHVZHvbDxGI4Gr8kN0Cny85qnJXWJZGCUmiyThSBFWbCgKjx7MIq73toKBLQqBPcT0TORwpTquPP2B0XH4kREKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554631; c=relaxed/simple;
	bh=H40n+mvt5HXpOzvWMVvPPk12LQpk/ikH2qup6sMR2FM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iPByXebYB7oGDyOFvzTsu1y0+TNdcvaNH4Pe2S0HnFymNo0Q/+Wf2l8ESLNAikxLGOyjmIN/K2pHNVUqb6SkjaPoIvHOHxhwqinzzpQW1QBEEYNDe/Hr5cnHfuWKvrCd+pIAKNU93IesUTSgu52oQTYFUQxNfwZrRxicq7ah0dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LEZuK4s3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=je/5A0NV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LEZuK4s3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="je/5A0NV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92gn63169121
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+k67sqJegtHeFtOHr+Fy8Ofd7nepynOHVRQFUJdphc=; b=LEZuK4s35QyEzcoK
	7EPbH3XY/cmCHhQh807eytXpSgazZWKHGIDHECBqzmNq338zCBzHBCCprK1uz0of
	VKPjQjl9vazz9Te312RRVPCtqhvtBYlaydAdEj+PdHI6v2sPlivfWy2llNbkg7gL
	y7iMXKyiQSitumbsPJRM94NnZ62LG4HygZOxLjQYY28mqKecv0BOc7LdmDUCmIEh
	nnfS+g9FlhAt/mwX5UszfX+FTzKIVTOrrZxxcsbb/2RuZ3IwLdgBPAxemVfNQbAO
	xm3rywRiRzbZ5+9WukKCoEkbf27FMI2ISSi7Zslo0iWCesCUkg9DaJctXObPcXd7
	DPSoSg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqpu2rq0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ae8e7e546so193970385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554605; x=1790159405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S+k67sqJegtHeFtOHr+Fy8Ofd7nepynOHVRQFUJdphc=;
        b=je/5A0NVNugiML0WRRUDhJ07T2sS5EJhJ18pDwXGJ3e6NVM/F3JvaiygWZMGHYf9Ve
         zVC78GJtUyYxSv3BRz7wpyOyrI22NI/hJFZrFu8hHKknsp5QV3jD7736SasJGY7I56WT
         WUz3OP4cJv+F/uS/mSelllMeZK2vJHqt5XQIjKrIqz5OYaqMOPM7w3ofSC41FLEGc2V4
         /hwooi8g9l9ue76U+W+JjGW07pVakV9UU+19OHlCB9jTMj9e+cyJk8HUKeTsr0ESVByG
         qVRqxu4doTGG5pC9tvngASbg4Tios8VDateKHBPDAWiYffCZVpwJVMGJnh2Q7A+gwUpz
         Z0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554605; x=1790159405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+k67sqJegtHeFtOHr+Fy8Ofd7nepynOHVRQFUJdphc=;
        b=E2oroRXulkbVHij+YbqpQUS9vYMZb8lpVuVL49QvsIHMmoR1A2aEJFh3J29Ih60kh8
         qAA0Fm3H16HymV3y4z4j9v/4Xh+9L/FN7QeA9sr6lhMml5jgmpOSilLcSqiIYalVmQSF
         Q1bvb358TTG2gzEcstSRzyk2ZqzbOeAYUTCf6eCS0iFq+/t2aHOARm3bP3HqEa0nKfd/
         9yYslf8FkUwx1rylj5bwS12+zzHFyKiUthiqT+kjI0Lyd8nlLJkCKTYHKuhRLdicHJDG
         Mhp0ibFsy2F3eKAL3Mu1OJakdSEb+2hLNrxP3zSdoi0hUSLjHZ48Y71huzsyNVvwQwOB
         PA1A==
X-Forwarded-Encrypted: i=1; AKwUvByCN8Y23nkr/zMMZFNndt8czs5b1HaIJCa9Mf5gfKHAjxWYzf/GCgni+u7YatUN145LhRp6rBcDth20UIw=@vger.kernel.org
X-Gm-Message-State: AFuF++knPA+kjK/pLIRpWXCVGpJw42JvO5ueK7nqn+C/9EiAg7hO8//h
	hu/Af7uGhyfxlKKI+fPoYmR3YVJIfhuIC8xZ1gDjeMBWzuOGbII0J3m+d3qCBYeuCtjnznrXpti
	QJe9r3H3JVo45IXTYkAafunFuwdOmc3ccmVwwGgg+3VDXae+liw3rzoCgaiXa7tAEhqQ=
X-Gm-Gg: AYBFou3Q0Z5uqdBOPfbWIZxGcurJzF93cQrXA18Zvx4LAKdnoBFzqJ0Cp3/6BCt14xK
	uPu6kiXgz9Nn/ybwh7ADDmZ0S8o6Lt3ZUGrgFU8KLZMFzf+Y3hlHz1jrMOOo/5S7hwnrW1xJWPc
	J+eMuz9Au9xdaj0LjNNKNF3Xfu1eQ/lD7AvcIU8bP97sN1avkS1hl4E/r43W/VfKGOmJqJKkQay
	2e1+pPo98pkFevCx9EVKbDXKcTr1Gu+TDSsdEc28PflfyCiDjgCXAvLnNkPEFu/epw4BIhxmoyu
	cwdVO8Ne6Aj8QE/Ni/klj8qqlS9d6BZR/kaNCCfKGRK2yT9ilL8so1bFs43gkKMeA6j9ue8ewvA
	RmdMwgW8=
X-Received: by 2002:a05:620a:3713:b0:939:3626:558b with SMTP id af79cd13be357-93bb76a62f6mr299435385a.5.1789554605113;
        Wed, 16 Sep 2026 03:30:05 -0700 (PDT)
X-Received: by 2002:a05:620a:3713:b0:939:3626:558b with SMTP id af79cd13be357-93bb76a62f6mr299430185a.5.1789554604627;
        Wed, 16 Sep 2026 03:30:04 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:41 +0300
Subject: [PATCH 25/48] clk: qcom: gcc-sdx75: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-25-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2127;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=H40n+mvt5HXpOzvWMVvPPk12LQpk/ikH2qup6sMR2FM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9jhMSt/VB5IalTTXQibEni93TF2viJxxd5K
 wBUOaQ/1Y6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvYwAKCRAbX0TJAJUV
 VquqD/wI/T5UfJT4bVsMPWUos4cpPaNpVrY6/WzH6Qx51KCWlzNoCCNoJIQbevt8Viho37aTcLi
 9NHj1aRxW5EXYuuPpXR/E2LwIgsCoQyeXF4YxYJjjBWdvVvugQFcm+oidp3y7ipioW4S9KOSb5R
 +G5YwcytxWnWNB28QkRLKG5x4DIU+aAYdeET3QCjqf4QG0edIQ/0V0Oer4ySXIKCtoa7NEh4yxg
 cXRE/3ZxMpat1mL7/YMbpzzn/6hGPARqALSUa5cTwRqxOpfdeZHB8ZNvdZkVda+k/5Bdiqn01Cr
 bT7uG4unqA5dHBaLuJIiXyBmyg6fPSxADiW9JcYmVh265ZkBY+ZxZWOvLFCpGqrq4/FiN04diB9
 fMDUtPB+cDqPzv5ci6t6frfUesn2uUKK4cV6kgxRWy+1mf0qs8kHNvxyqMYgbTtdYTjIWVho5bX
 5wrwTbLFQW+QsVCwIwrFFvCIhFFY8GJpT7OFdAQxFeQ3FlN6Sekmo44Zr+mhliGAzAKzmU6jlXy
 +HPY/6ab0MwdE5HUVwJOyO0YkDVD32X9OhWV/b7/2yHyrNBl3tCWK5xe5kvIXFKZPu7XGu/L58b
 NyaLRmStMoXNq2slGnKFOIHx2v4jErv5ELSYkNKWyUruYUgL+VZncjQsTAJEZt1iue9uOHZVw2+
 XPSlHjNF2dKQWDA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 8OJHKlgxLvQ1v-XAAdUrnH_RBcr1Euez
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aaa6fae cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XazbkJH4cJJKrr3KiP8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 8OJHKlgxLvQ1v-XAAdUrnH_RBcr1Euez
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXxmXKbbKP7cLV
 4y1tEPiEBJjar2Qr5r2PgdaXy1IpdMaPWaHTbVUP6637+voQHrcbca52r1WtbhO0m5P2v+Bogu4
 +4DMu+NqGPjIdiBUI1O7uWvLYjIC5o0Fwvu2GLHrPoe16koy2lrmy/xaH4pzu6Zgc92B8w4t2rF
 SNFee7mERNs89WgJFYj+05uS2NT2IDa5WsAj/tui2Ht7dgkYFRyIH6TakBr5Lz2W/hGcfaFthv3
 slqTBMF9xw2Hmueqa4TYO2kboO6qtp7lxvynTuROVUYI/CXTMiNFVbaTO5VEuo3ZMrhG2ixiH22
 pXYHG7tcL6Dlk8yqQtbTNddsFiPPKRYQaL9cpWNI9uhTrkb6VAKvjQGmXk6+XQ9aX22+ursraJx
 cpDG/mjx0K8eyxzM9Wd36pjAn7UjS/sAa/GDRLlQxlHXw9SSbUxXOVoWHINg883/F3xKxZX+jRf
 bPw5fv89qWQi7UFdoxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX55NyckdzI+Fn
 LJvMZVx//Cm5KfQYE35UoswEZPDXqjp9S4qlePCWnETfbbV9Ohz6ykhImrvHchzJp2gDzresVBw
 uqXyFex1cAaG8bi3oMp5ZvHYbKbzf28=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Move the always-on branch register offsets into a critical_cbcrs array
and describe the DFS RCGs through qcom_cc_driver_data.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdx75.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdx75.c b/drivers/clk/qcom/gcc-sdx75.c
index 6712e76f875c..ddc368a9db39 100644
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

