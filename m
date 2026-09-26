Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220CB345EB4
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790421421; cv=none; b=e8vOUJIdRZW4UYMaO+J7sYmCXq6kU5DO4AkN9WFOtW+D+zU8rYGgR3miSZKj/oyRZIn6H/eIh9qSIyvJywl0Xor/DUK6nXnHJsH7Z1q7LaTTKuf37L01Kuo2K0pGeOjLeVFmO1GeynEwbS9GLGXZPJ3NwWP4idT0q1DXjWS7HmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790421421; c=relaxed/simple;
	bh=RYWcdMPyaucuTpFZOpchd7l+KuDXoMtZcGyaeZ/gVMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hWnFXxR9tASC9G9yCSNFf7Lppa1YvjLCzCrnEfjN32ivne9SSgcYg3txViMxRCCTkyBamiLW8Fw75X2X6usTD3H1mYuXpcI9Bp1asL5d1Jrg+GWIittbZVi5vku57g6xrYENmC1x5nDPflvLEpKFlnl32hEJgFKW/9aHbNqZZu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGhCBXze; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JlGUHSJq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGhCBXze";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JlGUHSJq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QAnhcT3954317
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XDcNxN9c0eeKWZFiQYdAwu
	1N1o1cWNwQfBmTN0sDEBY=; b=GGhCBXzejk3n2k/5j/1lQEkD4iRCaR4XvZ7oSm
	BxbeyDA7ugT2FAHAKm6uox3bi01XZyBw5whGogYD3nHHvmoNPyiCP9uROL0ucVAN
	t5bYjgFcC8YGWFJOqNvDW1dwoHg4wWxr6Qwf09f8TDFwl+4anqkdWK8yv8Bgs1jW
	LivQqyRXaku+aktm+HvUFuj2VcHuysPUiwZ8l1AxPDjPprizrNWwIxMGwUiDFvHx
	JSxknE46u8yc8i9/S5kR4cNMq9IH/FvQSnJac8fe1QAkIvKVbi2K/ACh6+xzyWjE
	870EnLT8EAlvZxfceCNzmGcI1Rex0gfsS5kOO/Y4j8cfeKog==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx6938qjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:16:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c5d7c4c26so81885585a.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790421418; x=1791026218; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XDcNxN9c0eeKWZFiQYdAwu1N1o1cWNwQfBmTN0sDEBY=;
        b=JlGUHSJqiPQt07KYjpIip3InLNVERR3zipwjqbsO+rnWsnTL7lYhJgz5mUKcfQ0oxd
         mhnqQe654g6jCYi/BdAiOnpFxTu6NylOmFOtE3fEgqv2hz655qAIMxkdS4f/Q/ggriro
         uJH343Mb+15OphD46qKoVUHckrUg8KwfOnHHhjnwxzUdrGYCp6onZOe8LqjxpQP/EbIL
         bfAmL1uLjUt3HdzC/qcxdtpneBu0hz1oa1XoEM1f0L5dNIp6hIVMGmbC3KqtE7TzeH8q
         8ecfs/KT/LuqyzTK/H8vl3plZh2QNcaJZko/nLDBBAYHyIDwcHwdgbTU5b+Whfkya2mH
         4egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790421418; x=1791026218;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XDcNxN9c0eeKWZFiQYdAwu1N1o1cWNwQfBmTN0sDEBY=;
        b=xKZlPiEckSe/7CfaYwL02ZcxH9lheSfPZp746dnrVy1q9XfMq6UWBfjhubTok/WUtl
         JHq0Y2HmJtBAgco4uJlG3JXe9RiEjtnUZfUbNZAZAn+TnW8lv8sJk/gMpNsRaPJOEKzW
         HWBDStjSuqurPuJV4YeMVHHaRDfNW1jL9maEBBK7+Oq8odjzpQNe2qZPxcSiaUaRUTVA
         4foQJ0zVqK8I1mRKgO9bm9pBBO80NJQljsTASOI5TeirsOm3BAtdESXKlOOCw9U61fku
         RfS8lqP7Vbc/5FACUq7THs6gcAPzB/0m5NlGYwl4kbfFgEVzoIKBJbiMKm5uFOXtJAe1
         9ERA==
X-Forwarded-Encrypted: i=1; AKwUvBxO3tLiDtBfN8CN85DF9Xq0UCzVomppjQAX1j/NbhNx+6Yy6UrUzgl9uFMu7WivyElgvC7OiOBhTkAWOO4=@vger.kernel.org
X-Gm-Message-State: AFuF++l3un4amwmrcU4mEKwM1nxhECB+M79CarbE3aACEHDsOMoWlvdl
	zBrW2OIt11c71FisZcXtaX6bjNcSp9ATNkF96lQBwrwnq8dUgudurWFIntdcYJi2/0B2QUCw4y/
	hhKIgPnpfLcZ5LeoZgxRJ3PNwv4VEj/eG08VpPXwsGco9gKYQNgBjZ1UkfKAzT7qcTUA=
X-Gm-Gg: AYBFou2QTZhTuWrSI/B6MG76wc2r0Glepi2u8kd+5frs5EkFinGYPO4PY8GH6Ks4Z+a
	0fgX+qLFFH9S0kS9ftpfcxG+jpbtMKe6bbjv8o7tmzbW+T6B5kYB23bHTYWbMomrjjw9H2lHbBv
	E3DmKmG3YwPkWloOlqVx9RlT8ipbdq2qORu4qVkk+FumawYdzH0vHYuKsugV3um0lHIi/HEJ38O
	HitMmn/tctTBZUjw+u7szElCK4+VjXY5u/AGqGGU5c8VrkF3GgiZ1f+u/b6G18clGe5TvyEQsmG
	b3loCumge0CrqquZ7ysKOpW+jwQxZSbQJQtHYELP5CWL1CS0VwafcA0udNQbkzLygAUCt6sotM4
	mxZziHpyB
X-Received: by 2002:a05:620a:468c:b0:92e:5d44:73fc with SMTP id af79cd13be357-93c43cc5819mr1010517785a.12.1790421417924;
        Sat, 26 Sep 2026 04:16:57 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:92e:5d44:73fc with SMTP id af79cd13be357-93c43cc5819mr1010515285a.12.1790421417406;
        Sat, 26 Sep 2026 04:16:57 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fffa334e6sm9265495e9.10.2026.09.26.04.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:16:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 14:16:50 +0300
Subject: [PATCH] clk: qcom: gcc-sm6375: Use common clock controller probe
 data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-clk-qcom-gcc-sm6375-rework-always-on-clocks-v1-1-28f581ab0289@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKGpt2oC/yXNQQ7CIBCF4as0s3aSSgNEr2JcwDhWpAXLqNU0v
 buoyy95ef8CwiWwwL5ZoPAzSMipYrtpgC4u9YzhVA2qVabdKYM0RJwoj9gToYymsxoLz7lEdMP
 s3oI51VGmKOi1JWc7ttp7qI+3wufw+tUOx7/l4a9M928C1vUDOdpbZ48AAAA=
X-Change-ID: 20260926-clk-qcom-gcc-sm6375-rework-always-on-clocks-b57ca73e75bb
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3892;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=RYWcdMPyaucuTpFZOpchd7l+KuDXoMtZcGyaeZ/gVMc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqt6mmAiJliowsJz9XnZod73d/hDWmrVYvNVcUX
 CMnML65JLSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCareppgAKCRAbX0TJAJUV
 VjOiD/9vStriMrtUhlBZLA71hkmTalK4F/wYVty8PKYQL+aY9a5ZcSF6YUYXEoWD0D+wz6IqRMA
 SQNTgHIRa8dfEDgwxgXYxhXrMA0ALCcFvHK3mMagEhOGR3DQwFuUo1Ls32fSs0zOUsBIumCFS+c
 IWT0/rMk6RUZERvm2PySC9dg0RvPzdJ3r3iM3NaRI7EppVE4imsluqwTmSPOMQNpxiD8Rzp7fuT
 teHygdnuo7J8MMil7GqhQBgb4nr8Au9nsefK+fo12vQ0dYorTj8P0re+K2Fr3yfUbmJ8zMbeFfF
 WsMe8DA8N4oEsD4F8WWtHuWk7fTlP6ZyFIuxeDmmHhb3BWoSuC+A1/MFgIBMFVN9e6iTZ6oI1w0
 rjc/FHFVnFoWHuq7PIKlkuOiJcHnEBSU3a/VC6NbBbU8VNFEATAxghqJgLGQM0yhXUOsP9SyYWI
 k2pMCHZugEGl5lMaj73s2X7q3nuNN4TjKzyVsY10+i3jW0rhw/oSfPhb1H3AGs3HexyotUGpC51
 P6o4JMX+kw94UznZlln2T7NTNAcasL2Uad7SudB+oQVUVQBALM7Cx27cHauHWRzW1uQMxLyxJAv
 c4FaeMWEIgvE/KbrdSF7ClqECCblb2+sBCuJfLLh1WALtztz7OWv/tfBVD+2v6w/xYP8Ds/BjmO
 TxTI/IN8cOGCu9A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA0NCBTYWx0ZWRfX1eOOaOjLv0N1
 SM0MJJxTFmkjKqML2yjnkp7SdyhG6SoRIbMVd5EHpUh01n2yCqtkvcJyXgYi+ibXUDZpYhM1evG
 Txs5RUS2kNd1oKfK7GtRZN3QIw2uEBc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA0NCBTYWx0ZWRfXymmDpVSO715o
 wiLP9+mfOaxUkkqjFu81CRqcV5V60yBmtrMhQNkaga5mCZP5SGR44U/XSgsRdoJJCWBlBosFXUj
 W4I6CBM66w5xckk5nernBySgZoy+1MbtuZ5VvkIUBsjamIqio2p8zvlv62LOZ3D/XywyvoKttfZ
 vpTOMqNxcwuX/xtKkAutVzr+rBanp7X1PWol2pT2mwIPq01kKK76crhi/IM6df+PD6xGm1o8pWU
 H//loVDNPXnveU8A8VUX+xjsZIzI0pa6A8rZag/9W5wrTXM27GZqyJGdOe/5+PLJ3TzwkME6M51
 9wdglyzff2m7RDecPfPACLUlFpl1WbyuGrbc1jzkWe3f+ffqJs2qqOSDWriFFn4DfO/Uq+T49IU
 JkOXj4JGxrWbq/SIhniBcyaizmI3FklwGUTMS8bk0ZrCOQPLAybOrXnPE9VsCIk1JUkZjMtYKUW
 hlylVOGzT3R3eXoRb3Q==
X-Proofpoint-GUID: OQdZV530AC4DrWU4HKkOZhY-s2vl1tRx
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6ab7a9ab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bcXV_ydKzrTp0QHOfuAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: OQdZV530AC4DrWU4HKkOZhY-s2vl1tRx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260044

Move the always-on branch register offsets into a critical_cbcrs array
and describe the DFS RCGs through qcom_cc_driver_data.

Move the configuration of GPLL10, GPLL11, GPLL8 and GPLL9 into the
clk_regs_configure callback. This preserves the existing ordering of
enabling the always-on branches before configuring these four PLLs.
Using the alpha_plls array instead would configure the PLLs before the
CBCR enables in the common probe path.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
The original patch [1] was not applied because it left the GPLL10, GPLL11,
GPLL8 and GPLL9 configuration data unused.

Configure these PLLs from clk_regs_configure(), after the common code
enables the always-on CBCRs. This preserves the original probe ordering;
using alpha_plls would configure the PLLs before the CBCRs.

Dropped Konrad's R-b tag because this is a functional change.

[1] https://lore.kernel.org/all/20260924-clk-qcom-rework-legacy-always-on-clocks-v2-27-1479443ee016@oss.qualcomm.com/
---
 drivers/clk/qcom/gcc-sm6375.c | 46 ++++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm6375.c b/drivers/clk/qcom/gcc-sm6375.c
index 9c2acf8dc4b7..f9b4a395af99 100644
--- a/drivers/clk/qcom/gcc-sm6375.c
+++ b/drivers/clk/qcom/gcc-sm6375.c
@@ -3853,7 +3853,30 @@ static const struct regmap_config gcc_sm6375_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sm6375_critical_cbcrs[] = {
+	0x17028, /* GCC_CAMERA_XO_CLK */
+	0x2b004, /* GCC_CPUSS_GNOC_CLK */
+	0x1702c, /* GCC_DISP_XO_CLK */
+};
+
+static void gcc_sm6375_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	clk_lucid_pll_configure(&gpll10, regmap, &gpll10_config);
+	clk_lucid_pll_configure(&gpll11, regmap, &gpll11_config);
+	clk_lucid_pll_configure(&gpll8, regmap, &gpll8_config);
+	clk_zonda_pll_configure(&gpll9, regmap, &gpll9_config);
+}
+
+static const struct qcom_cc_driver_data gcc_sm6375_driver_data = {
+	.clk_cbcrs = gcc_sm6375_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm6375_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sm6375_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm6375_desc = {
+	.driver_data = &gcc_sm6375_driver_data,
 	.config = &gcc_sm6375_regmap_config,
 	.clks = gcc_sm6375_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sm6375_clocks),
@@ -3871,28 +3894,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm6375_match_table);
 
 static int gcc_sm6375_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm6375_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks, ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x17028); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x2b004); /* GCC_CPUSS_GNOC_CLK */
-	qcom_branch_set_clk_en(regmap, 0x1702c); /* GCC_DISP_XO_CLK */
-
-	clk_lucid_pll_configure(&gpll10, regmap, &gpll10_config);
-	clk_lucid_pll_configure(&gpll11, regmap, &gpll11_config);
-	clk_lucid_pll_configure(&gpll8, regmap, &gpll8_config);
-	clk_zonda_pll_configure(&gpll9, regmap, &gpll9_config);
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm6375_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm6375_desc);
 }
 
 static struct platform_driver gcc_sm6375_driver = {

---
base-commit: 3b651d946ebb756f922bed8a213919af17f58f43
change-id: 20260926-clk-qcom-gcc-sm6375-rework-always-on-clocks-b57ca73e75bb

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

