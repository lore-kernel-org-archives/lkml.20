Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4235A4F0533
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554611; cv=none; b=H9zGW+pvbC0gmhzCBNinTNqXMPVi3usLMnwcBfDz8Qo2O8d3HuACTkNqtuAJfveemTzJjlXsAbf2o0l4yA1YSQgqtxOw2SnnmBvOq8uSTzlOPQqnhXMKwxyPx2lvnD69Y5xs6zapKSG08NDLa+LKYte0yLk65Z7KS6ZjoAfh5l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554611; c=relaxed/simple;
	bh=q6WsPo4Sb7dMV3C/p7zOVruxQdz3njTR2SW+b+HeblE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ggOJPLPhC8+3XdoXqLQakeeDeLPh13NoUSqc5sy2hsTgPiSTSdc+D9FDPMJQynbvvEfPG237cxUdilWqiXW1SmoE1p86cM/45gFZtjXRp9jA2kgRpUt0UmqNtGIT4GJjtTqdk+4h38u2qHqUTLJOgbrZrNOZddM89UXZ1B7NRJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oNXqg58a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hLuEhz+P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oNXqg58a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hLuEhz+P"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92ue81721210
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pY8CUDObNwxHwovpcARsp1Pjr3/ZYxUlvUYEuzUE33g=; b=oNXqg58a/EOyAOuB
	rvx0QHK3rusC8/8LbkpceZ/5mNVKXRV7cP8gqIgpT8Dvw5uKgzypf8d6fonQA8JJ
	bU9Bd0UGBRYEu+Rr/ojKUniGBRcG4D89G32RM0CYAlBSq1iwtUvyzXX16jNjMCMY
	hkO8O5/ksU7alU7HLnWo9MSuOgYEwupR+6oC7dZd30pU1o5du+mQb7BCpWMOeHVD
	96SPCCOTb6Kv9SoxUc98BNtELVnCAmKXGxhmi9HQsJ2F7jEvZDAxIdYgHQ6IZhjM
	lGxaTNWyPi6D7WUEvhy6XimUxj1WP7d99YWXLU8RC46tCpuYs0+gRelLSg/F7Yca
	yLPi0g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmnkbxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9394ad7f64aso885948885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554601; x=1790159401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pY8CUDObNwxHwovpcARsp1Pjr3/ZYxUlvUYEuzUE33g=;
        b=hLuEhz+PIhKQPAO+PNeoemtemk1LkPmBNtmbUVZHe20cNSRKWVYiS8VJQQtbx0jbq5
         KO2Rg4MZ03VAkEHZMt1b9PvvXu5ni9cNT2E5InsSXs+WdTzVgg2aYU8mlorMvqpZ2Q5d
         j2hDe9abe+JpAJKbElFP4DVL7PBciY4tKzAwqDnIVJFoADzjMzuTGwzJ/dhS0jSU2DJs
         qeRF33GfNV965+O6adXpbtOLAdJxqhjTDNCyLLsxoov9/FxxuT7mp6d7VizjFkGYjeMG
         RhXs3flldZUhzboIe0VaozPvNF2mm4oY4VqUQoXSRBBQO3emo6A0srnmPprPBfvppu5H
         vogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554601; x=1790159401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pY8CUDObNwxHwovpcARsp1Pjr3/ZYxUlvUYEuzUE33g=;
        b=LjuST0brOhS/7guuCVEFHn+nZeaWL2rRmqMxf6LIJK970hTtJh/G85SmXWHDZDP6by
         PyLhUrgxuIX5lh27b21m47VL7e6pusIrebuuiBtsA/1S5ZHOUd/ZaAfX80+FTQC7FZG8
         b6Cmd/Kuj2HtsoGpkpD3+cViFGtW5bTwurgd1a1m8f4P2dJjv0TArjT5PFz35Uzht9aJ
         8S2baowknJlpJWhu8+XBddhmJ88mZa9JdDK8DYDzhbTJoHQ7hfNNWRC3HuyPJCfG5K1s
         lQEXEhOnRceWHhrqwGL8+QZwJ+uZXBuk2XnVaLgvUkOZxmingZ7h57MsYrpN6fHj4wkG
         gQ/g==
X-Forwarded-Encrypted: i=1; AKwUvBwUa/r5TE4+O2qn/25BCLT5TZldpSzQznrOg4ZJgjafh34kjGp+gUi492QJojgwIsLE8MLrpJahL3PBrs8=@vger.kernel.org
X-Gm-Message-State: AFuF++njfN18KMLVHR+SlMyU4r6D5kiWXx+fZDsLHstmPGzykDNmXTaO
	U88EaLlYseOHM+B7BAPpjUKJCsl4VvrHkF7RDKVLTJH2f+T/OvZ6MpsMbCN7CkzppjJfGZI6yCo
	6/9y6oIs8UUCp7d0m1zb4reYYpJVkuLL6DUh8Vviabprapcw/6gcVLMVf6ZCzf7v2+GQ=
X-Gm-Gg: AYBFou0PobH4jwCjA4LVvnWPvrE4eqybvnvWgOOI+xE7JjVvXiqruCG5vbTsuiOdKjO
	EjOq1e2rZUjBgbpnBAq70RtGXk+G75/XPY7oGgLiPh/ruesRDPrtJ0rF0d6MriQkjZRXDPuG9Bt
	yFWj1kJhW1IC07A2R4560ggkj1VYwKfcPp/NHgVAckgkHvK3gbkwTcOnZ/Kn/W9fpO808ex/AhD
	VaNZc3U+9Q4E0XMq4a8ZEMuI9t2lC7HXHTJHYiHg3E9Ie36/BSmkdZJKWFOjPCNjbqbML3QTDVU
	PANVArtVvvvhCHvXEfcCBIw5+tauXVo2FO+uryDSbvN2tQglciqKIw9n1C8tS4yV6KMUS1nPY0Q
	z7Ikyh4E=
X-Received: by 2002:a05:620a:6008:b0:923:7821:dc0d with SMTP id af79cd13be357-93bb787cce2mr310412985a.33.1789554601088;
        Wed, 16 Sep 2026 03:30:01 -0700 (PDT)
X-Received: by 2002:a05:620a:6008:b0:923:7821:dc0d with SMTP id af79cd13be357-93bb787cce2mr310408985a.33.1789554600585;
        Wed, 16 Sep 2026 03:30:00 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:39 +0300
Subject: [PATCH 23/48] clk: qcom: gcc-sdx55: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-23-25a24e50f82a@oss.qualcomm.com>
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
 bh=q6WsPo4Sb7dMV3C/p7zOVruxQdz3njTR2SW+b+HeblE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9h3El7ODq+vNnP0tl/+8g+kXxkCs6h3spem
 7aV51gpoyeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvYQAKCRAbX0TJAJUV
 VldwD/4m0Hwwxs8iai4qsYgB6V/DjyJTqFopMxAOJynBtlcbwL2wiElQG3ZCkQjou4uxgA1E0n2
 3cIOZw9qJeBGwdlJOg8DzJ2RY6MkV678lxmv72HRTFSNy4+hthAqoL7GbmoGeMfOS2qhldoB4R2
 CXqkgZ/VVZk3QPED+TiPBy+yjP7157Ft75ejcktgNhGnXTCwnEj3aj1IQ+qXdCOsw1m9ar6/Jhv
 ER1hgal1zrNGoXcFYtlXk0ZkRgpmKnHC099ECdhC2rw+Pm9v2R1tpFJ7ElhmzH9b59h+2+nE680
 S8bF6g7JHgH3Zh+XUzd850jQ7D3etEm9QW1zcScuLa/pB/vDHV9lxBDZgTCM95+F4fvfQ/eh6OT
 4cM55wBDjk6E5BFmm+IEVmUjvZAFxI7HlM7jYuNEk57oOApPaOr6tObh8zI3sI75FnbRAa7qvnm
 1YOkrVlUL/lmMbXfffYWh83kDlRIe98K+UaO+tMzByVbHP4v+6/NCTE0Wb+K3jR9CeOfITdvfRk
 3juu8vajoDiFNBROweIaD2GWTHMUuPADo6Cu6rDlFrypdodBB4kbsL4xJ8S5GoMUEgguXjpdCHM
 A0F19oyx8T74CkIcsNW2EE4UvoFFbu/+TmNgtERT4YgZzC0tOwP0D8aMqqO6z99CQ1ttdsWzYeC
 UD6mjgc63ArWQHw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aaa6faa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XazbkJH4cJJKrr3KiP8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX6LtZf5uzglD7
 f75sWyfcRfM0JrlaDOhqspKS3H9YnqR+cHn5QZbOjIWNyDWGfEj6SIMnfLl1hntfkMnRHf6Ow8E
 b4i/rvZw3M3yovfAgI3GuIZ3ird/EvXX08Z5nVChHz1SoFCCb+er/XAjStEidarIQXcczD7AZK4
 F2pAv3Aj4Qy8LWmBdeg9GwoSMGd1xgdNpdv6OsmXDNqQJ5gbyAKi+p4pSV8bq9yB8vZuiDD52op
 38+ViS8wyS+lvuEVLPJNNuzbZwEoNUkS+wg9DL5P6D/7ZP+bcYS3hDf1qlIjB2+Vf0eWeExKsEo
 06PiKZ0+e60RWyewBNGoNzt5gLEgPZIb3qHieYrAmBe7KEsM0uwWq/2MEOu/IUVbqQN3OHiP3y0
 bbXTGwHmFLYcP9UYqP1wAtCrLPsnHLgn2XVCvav5aGPKay3fBd/kqezCBCOf/WrOYR5fO6uFokO
 /OcpsrlGRMApVikh+6g==
X-Proofpoint-GUID: 2MwiHmaWiiF5NQnJaLauzyZNhzaSJcdI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX7VcuHAGQIFNn
 IzDxNM5N+4Z5vAbrgS7fmj7KoPfCfKA0tkybS6tZjoT+WFcy/FjSQYx8FnK7x65xeYPhhp1+UmK
 3nPUnM1ss/OBLGJ3QbdTx/Cf0rjAzUM=
X-Proofpoint-ORIG-GUID: 2MwiHmaWiiF5NQnJaLauzyZNhzaSJcdI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Move the always-on branch register offsets into a critical_cbcrs array
and move the register programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdx55.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdx55.c b/drivers/clk/qcom/gcc-sdx55.c
index 84c507656e8f..7cede6d38747 100644
--- a/drivers/clk/qcom/gcc-sdx55.c
+++ b/drivers/clk/qcom/gcc-sdx55.c
@@ -1587,7 +1587,25 @@ static const struct regmap_config gcc_sdx55_regmap_config = {
 	.fast_io	= true,
 };
 
+static const u32 gcc_sdx55_critical_cbcrs[] = {
+	0x6d008, /* GCC_SYS_NOC_CPUSS_AHB_CLK */
+};
+
+static void gcc_sdx55_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Keep some clocks always-on */
+	regmap_update_bits(regmap, 0x6d008, BIT(21), BIT(21)); /* GCC_CPUSS_AHB_CLK */
+	regmap_update_bits(regmap, 0x6d008, BIT(22), BIT(22)); /* GCC_CPUSS_GNOC_CLK */
+}
+
+static const struct qcom_cc_driver_data gcc_sdx55_driver_data = {
+	.clk_cbcrs = gcc_sdx55_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sdx55_critical_cbcrs),
+	.clk_regs_configure = gcc_sdx55_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sdx55_desc = {
+	.driver_data = &gcc_sdx55_driver_data,
 	.config = &gcc_sdx55_regmap_config,
 	.clks = gcc_sdx55_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sdx55_clocks),
@@ -1605,18 +1623,7 @@ MODULE_DEVICE_TABLE(of, gcc_sdx55_match_table);
 
 static int gcc_sdx55_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-
-	regmap = qcom_cc_map(pdev, &gcc_sdx55_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x6d008); /* GCC_SYS_NOC_CPUSS_AHB_CLK */
-	regmap_update_bits(regmap, 0x6d008, BIT(21), BIT(21)); /* GCC_CPUSS_AHB_CLK */
-	regmap_update_bits(regmap, 0x6d008, BIT(22), BIT(22)); /* GCC_CPUSS_GNOC_CLK */
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sdx55_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sdx55_desc);
 }
 
 static struct platform_driver gcc_sdx55_driver = {

-- 
2.54.0

