Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F0F4EC65C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554681; cv=none; b=X2/bcw29qIQgDOu2JsjMK6/PdmYulTXBYn3vywewp5ETm7vW+rkfstjvjTMErAhXn9sXiqjFYDUTZtNIDGWteoOFuhKXFYV0Jc+KE2ki88EMHE8zTCmK07FALJb+ar938ZX5s89j3sljjX66gdMsk0/wwxuRlaVPluXktEUzl3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554681; c=relaxed/simple;
	bh=3rAc86SAe8f9DGEWeZ9p92FJCjKy05IFaeUgSXFCFIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mFKzP8mT+pC8mRPtHgHlCgqCO/phjBSQyOHX2TV+IS99SMH1ojtrXILsvU68qvwfQhXHDml//RRZKe2JFTMV1vMUVSvNxDrYK/qk3PR69pS4NkNebTOXFAj/LfKihmhucilMsNmdDy+o85jRyFk8+OkzFXJohdTDDiqA6uuLLUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RfBl7szR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bLmUxz/Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RfBl7szR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bLmUxz/Q"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92g3H2348128
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vBBrVQhaf70Wipe9bGWZ3gZ34yPtOrrQmP9XE++j+uY=; b=RfBl7szRIl2WBAWO
	XSqK9DfrKCmFbPNRbwiCIARxc09zRCJFtnqwP46X0NmvIsQo77BAawLuVsuLg8KF
	U9r+61rNXybk8nYsdvu7PahedPriDcKSTqN1BxLHG3Z1HbxBeWVmvcE31lhCuO4Z
	dw3q+9kwaTlMz2kngDiQccDqChrPcPn+ihTOPBA2vs9gAixzlwlgTZ3M5OnyRfAt
	yBAw5MqSOx06MwNvOLZm3RiKxzreA+51fp2l+XW6XKPqUz0//pKq/U3oxkZhEF9X
	6GYa9e6cXCk+fqwQ+9hWYMk7TXDIhYR6KhcBLMdrsx8gp6HSWd12megpEMkkJg41
	NfKGWw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywas9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a08ff8451so657912885a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554656; x=1790159456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vBBrVQhaf70Wipe9bGWZ3gZ34yPtOrrQmP9XE++j+uY=;
        b=bLmUxz/QrsVCvCBnuZhZTdC66F8wLaVvLtn/1MjwDaV65r2y9M4hm3k1Vic8fbgq7m
         fInwCLRFWrDc/1k0K5F8gKqW5qUoBtiqcPSef6b5s2xhgf/BmW8jHwbTGCr4ZhQ8yyxY
         DyJiCrWFniuFwIr11if4EgjT8br/sl1lcvQQCT4E8+W6lbbcBwXG28NRgxQd2X/7iQ1J
         1PXBfLk3CL8QfhOIZ2A7vBZQ9hfniQQkb2ysFTxGBbem+FOwyAhLfN9C4bn2k9aQh3pJ
         XtFnLRJYguTuMayKRSqpaPqGhGQpN5COEO6+gid+KY/q2CPTHM6Uy+8m+veuPKWgtrY9
         Ho9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554656; x=1790159456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vBBrVQhaf70Wipe9bGWZ3gZ34yPtOrrQmP9XE++j+uY=;
        b=eN/EwOaX+wr3ORw4YjOjpvbe8h2JYaH4NpzCr9w/q55mlcGn9SK4diQjnOVHutOo9j
         AMVdlHdqnzgSImFwiazbmOFidgBYUyG+y4a2LQn/vbVkMnklXlIi186aOEXxsRmPwrtS
         9nxOOx0/Mejx0DY/5MeTS3i+jDHI8DeqXc+xvMeTallwgAwyz4hqtbzJFCvn2Efg9a7f
         GTvlwYCISuI2JXHiKpi9gdpOr6xxHCGbk0v0OfBXrlJubboApdlbZ3vJttUKPDuxJi0Q
         q4utd9LOh1GpjI5IwRyWGBSf92NJccfoB17DgfmeAEunqP7k/FwloRRRZu6sKfi3pbkn
         JJLw==
X-Forwarded-Encrypted: i=1; AKwUvByKK31Z0WXbdAIZsdvzMLPc1fmWyfQMiSJy4E3yYQ+b13hy1HbP0RUSRVmEWgbqoS3MxRSic8hI+j5DM+w=@vger.kernel.org
X-Gm-Message-State: AFuF++k5f7eRnvp++K0pjcHXB3ANWwy/ugKRkGOgU97XHXky2oyIwBME
	BMAqFRWLUGIcVOi+ebJnjB69U0j4sUvQR6+LdrUleXcTLdc7yu2tw694RhKkcU09KhsBxAh8Stt
	+1ttiIJObbDZZH+rERMnog1fVEsD2/606zkOJnVxGnwlASBDEUDjKtCYIoNedGEq5Ubw=
X-Gm-Gg: AYBFou3sQ6RbjWIgsXG9pOHd2pO3t0hy9a9/xTVx8dBaLWwaWd73V7aOm4CpENw2H2H
	zuOns63zeEAhH7AEc+wRNgDA7xUWhd9RiQuXKOp7HtVGJGQuwdDpeh6OFSNJYz0FQF1v5o6F206
	W284vACnOwNBm9yCgChZVSPSLcKzZqDunQri3/PZHk4BzNW5/TUhv0g0vG/aCvKhu88PJbs5+HT
	mD1FdZyYFsZLjSkGBeKWwcBbuEcEY65k8+OLkH21QHo2FiNHidQ0Yi0WbJPgsR3FG0RN3tebMeZ
	yG6mAtebKMmsMigeDrXqweFF/p7ourz3ykW3insWQXKiQVuLxJ9nPpM+H1Gm+XjaETtuHOlorWY
	BwgJqDYM=
X-Received: by 2002:a05:620a:890b:b0:93a:2ea6:4c6e with SMTP id af79cd13be357-93bb794cb7cmr318028985a.45.1789554656174;
        Wed, 16 Sep 2026 03:30:56 -0700 (PDT)
X-Received: by 2002:a05:620a:890b:b0:93a:2ea6:4c6e with SMTP id af79cd13be357-93bb794cb7cmr318021385a.45.1789554655592;
        Wed, 16 Sep 2026 03:30:55 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:54 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:29:03 +0300
Subject: [PATCH 47/48] clk: qcom: videocc-sm8250: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-47-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=3rAc86SAe8f9DGEWeZ9p92FJCjKy05IFaeUgSXFCFIY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm94EnovDHGLJ+03v7fpgm7QWClslVzwmA8YC
 PP9Y5HgrnuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpveAAKCRAbX0TJAJUV
 VouMEACpemPheWxRgLy+jnzYQ7F6u5LFo16dAtXnX5HsxySTE4u2PW93e/tqm2JqW+zFDQJ7Pp0
 VWgT/gquNis63hZ//Swk8lMDGxMjv3uzzJvixCELbZxmwF7QLZee74QKMpalc9zLWKnHdH1+L02
 T18a8aTdk82vEuBlbEaBD4m/oWD+bnbJzo9nEqF1gqL8j9xiykFLOa+x1CVehC1o2NIG3z6DMqK
 efXe/QPBnJ5Iyo3uua4bcSw193RfWdauxBXv84Fgecc5OpOWDcvNVKpqn9tNfczCR2VDkpcqJqM
 xYY19dJj5d3c+JwC6XCX+zOmlGEhKNQCUtgxEIllbfUIm1tKTuRQiVM2ooK15291ahBhwh96HxB
 7Nmg1jcqRRUvPKQVkHO4Gu/USyGqJ0SdOUSQyYB6TSbf76BkzaPIetEe8xRLyjMF3caoldL5seY
 pl/EhjSLQE2wpYYkkgKk4udTK21n5QeptZI4iN2gt0DnEVUxUxrWSBuBB0qdIgBaHdMVFYEMe+E
 ETRnlXeuXUXsWSVuN8GVlaq2yIF6E9Ca3S7txMC0IrayxVkW4G1IqE7V8I1fCvtgXGl/VIBgIzQ
 3vnnOFyl9X3dEEbYMHQ1AePQVNRl7SGnQhud/IfCvtxBKTJhYMJEUlP+XXMFpzqyhQt1kRsx3B4
 k9Gmhtkm4ysislQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: bViq_8mCfYrA86DNwpC-FMfAgbPk6mRV
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaa6fe1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=w5mbRZx1dI4nJrn9fZAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX4vMCGhXneLBS
 rF2oqtK3EJXz7MAbUfUPXH8+Enk0RBZ4ILuR5POgeu26MwU2I/PmShu9g+0FynY3GiclUNRVhTY
 UDJ19SIObLO6UnHHfTJkeSmbxclEzmmCFKCKR5rZmX1lq35VVZksJWxMufbfdyN2e/pdwyDQjRB
 c4OvOJ1vQBHH0zNomgdMOcyoPHQj1lyZssA1XiKR2GcZKTXagvYHcs8GlX6XeEMGE3i+0jLzdwc
 D6mUFKJKmNdBzXQzG8Ee5DrvVhQF6hQmnM0JsauFNKuUPF/nLICV5P05/P2chELstd6vxhOn4/L
 GGj9vnhjX6R3spROmHFn0qX18eTYaLb/sSX/dW709yCBHWlJ4wmj4OZn3PDOsjfw62sCYE8zvf5
 cvuUh1vACQAO3FBEMrr8XtUI4OaD/gJhTKvfapA+xYPrkCeFLDIrTr41SQ8jddaEUiKuYluPOAn
 MRG/vjOFYBYaYo5cvxQ==
X-Proofpoint-ORIG-GUID: bViq_8mCfYrA86DNwpC-FMfAgbPk6mRV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX/5ElYmaNkJDc
 FrpEZPV3EzsCD8l/ouZmZT/iMBr2TrTiK6oSu7vcgmTLmKWBmLjjcsScaYqnX8Jq/kDA+QPUbp8
 d7LSpp+hLMswWDyoTtcMz6anNdhaLfw=
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
 drivers/clk/qcom/videocc-sm8250.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index df479a69cddd..d29d64138508 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -345,7 +345,18 @@ static const struct regmap_config video_cc_sm8250_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 video_cc_sm8250_critical_cbcrs[] = {
+	0xe58, /* VIDEO_CC_AHB_CLK */
+	0xeec, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data video_cc_sm8250_driver_data = {
+	.clk_cbcrs = video_cc_sm8250_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_sm8250_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc video_cc_sm8250_desc = {
+	.driver_data = &video_cc_sm8250_driver_data,
 	.config = &video_cc_sm8250_regmap_config,
 	.clks = video_cc_sm8250_clocks,
 	.num_clks = ARRAY_SIZE(video_cc_sm8250_clocks),
@@ -383,10 +394,6 @@ static int video_cc_sm8250_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(&video_pll0, regmap, &video_pll0_config);
 	clk_lucid_pll_configure(&video_pll1, regmap, &video_pll1_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xe58); /* VIDEO_CC_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0xeec); /* VIDEO_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &video_cc_sm8250_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0

