Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3144E47F791
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251683; cv=none; b=qLwGn3OajTEMu0r6sxUO0h0pvmip/WGTbw4RLg3O6jg3uXR1zMOdoKFJ8LR0sItwxb1UUZMFuHG6F+PpOGPb++ijK+dMZqAvq+0CAaoJiHND75zpyS/RllFbXVDcF4Sbtz8Siq/FeaLreRB0uXj/8ztXsXUFu512yJDW1zEm7wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251683; c=relaxed/simple;
	bh=sYgFXxszLBRbKlfiFi/HT1HPgfh2QMci3itJ4u3zWFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UX65tveeoGDI6pKcssruEKg2M9NZJK1UKQwFltLtgckzZyoVbABOKZQXpMwAcnXz9GsXCZyyT3pWR2YOaEmZ5By/ncZEHNemHtuW8kOArJxFLJXaUpB1bqpzdkpXSG4x6erdFPxdDKJfoDjhLC2nv0yDLoYHqYGIK8N3yIAgAGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQVkZpFW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TQPA8/94; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQVkZpFW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TQPA8/94"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4fG41437111
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kPvqUT++vhjHwdSn9HIEn4vwQRXJH23+AllpPzU28k0=; b=PQVkZpFWyykFop1o
	7aAI+wA3MiNHhHeyoTZRRcA02qagf8LhKu9Rt54+ru4TC7fKBUaZrSa/6IUvyXGO
	l2zD8sm2wWNzLhRb8dANKwvQzgaVH1vWbNVxQBkdTDy5Zsw7M9EIp/kvWAOMgIWw
	cC82uQyQnfv2LZzX/jzqc0u4CL4anA7V2wjVflR+cspqR5lf86DeKO/FzXFj68rK
	C5/mKa/4np824g+GYY62uj7w7S9gaHNThZOP4me8iOVG8msyl7TQZv1hvP/Bz0j8
	Os6UKs6coORbbDr78iIxEgD426YrSMtdTSD++CpnNpcKWVpJwOW2IVDMC22Ah+TN
	ul0xig==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7renx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:56 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7915a83539fso1832643137.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251676; x=1790856476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kPvqUT++vhjHwdSn9HIEn4vwQRXJH23+AllpPzU28k0=;
        b=TQPA8/94258mqF8PJzwhPTVqFWi4bUl6ploFxfJoNx97yt5R5rR1rhuyCYQ0tuecEC
         qnkzlprxHELo4RcJPYEho8yLVfkOTLdO6XKz11fCtVntOOb+IVCe326pVY5k45dRyCra
         TqPAXDSYijH/i8kuH7P+9KtoEUtIXIjz5vxeuC0bMBN4npVOh5mieBgNbVtmwzogC1Ah
         v+U2bw+emfl91izVL8nEuyik9udfmoyysOjuX7960oRFtv5WAWxOXZ1dLaQUJ5Ki/abN
         k1q4SAbOsvot1iRz52ku5v1SHhFBsMMYOOo13Sl+T7X4LBHtnYkK3b0uoUjrQ3ctWfnM
         qBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251676; x=1790856476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPvqUT++vhjHwdSn9HIEn4vwQRXJH23+AllpPzU28k0=;
        b=0z5ipfssyNvBwMe1SeOdWn32aQp0/ioLIS7xmZMern/kb30hExvOmnL3NIyQwzmLP3
         YDn4GgFA/9TmmfxTcjcSRbvbKzlHo3WqWAQelHT0ylIBYu9SokfrI6JALRrIhGWXcBJd
         mCIP0r7rl0MjKoe05E8TBpZutz533fFCWhCHoZYG5DmY5oPtC03gGE33JXieQbu3vN0O
         vMltY8mXsA4C8F4wY1VqpuasTr0bFcN92U4/sZqvmORgBGMnurDZXWjZM1/3Ec9eCEs8
         1FKDrkpEHeny0mDPLaGu8uOf4O2tQsku+t+un17eHjWM/aXvGsmUCSrq9AOBFpW8j/dx
         HYpQ==
X-Forwarded-Encrypted: i=1; AKwUvByRUuWuD5YeAjvl/T//kxTI/ANqHlhX7C5SDgi+5puQt/n/0Tm7Pyfrj07MpLd6ONDo0gzGMUroAZ9z4EE=@vger.kernel.org
X-Gm-Message-State: AFuF++mcU9xXY8ZZLxqtFJlN8zERWD67yyYZALDieoHvfV+MXgt1WrSX
	+8AftmZploNTOgWgfHw5Nl4Zne2wHIz3KgS7IHj4FYN77H1NLM/Ew954PLzTwxTkN+SxYeuHqOR
	07ryUFKe3NHkDQ437pm46/BSAIbfQ3OO98p6rkrUbzj36upMbawqNzzmMXHXrms2pXks=
X-Gm-Gg: AYBFou09SXNdMtM8xQKoY6gWn8EWOEMOSHuvqWYCE8bfocu6cICuKF0zXW+nBtEfZeh
	pGtD+C9IuBPv3ZD1yrNg/B49FzwmqK/ugzpvk88YTqwByCSQtD7t9Tg411xbLJyx4CvBuVEgusE
	gsOBGMQ5fiJsWyw4YTpuz1vAVgcBNb9lXNbeV0kJcqIl5VsY5/pBFL3BE/4BA+32Z3a1XJeAHRR
	W5oPgOVzfKuA+blN4ohwa5X3uwWgahi+HMi3RxcvBZDqkepuXjbQYKh9VlSM209jI4tcpVLyDlJ
	8siQnjvgKl5fQD/UPFha3zorAnQgPH9PcstMlX9xoFhjLtaxqRZ5+neqdmMrOFz2oRYA5owUNO3
	9mMNzYH9G
X-Received: by 2002:a67:e703:0:b0:7a7:36ac:b17a with SMTP id ada2fe7eead31-7af1e4f6353mr974825137.20.1790251676037;
        Thu, 24 Sep 2026 05:07:56 -0700 (PDT)
X-Received: by 2002:a67:e703:0:b0:7a7:36ac:b17a with SMTP id ada2fe7eead31-7af1e4f6353mr974806137.20.1790251675447;
        Thu, 24 Sep 2026 05:07:55 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:26 +0300
Subject: [PATCH v2 14/48] clk: qcom: dispcc0-sa8775p: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-14-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=sYgFXxszLBRbKlfiFi/HT1HPgfh2QMci3itJ4u3zWFU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJPkj25FwpqZbnNY6hSj8Xv1cH9Q0zPmh57V
 gwj++laVg+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSTwAKCRAbX0TJAJUV
 VnOSEACGlQTJUmKe4tZ3zKmQMUWT0kaw/u2sfoWHSccBovhTjD+syzJ4oknF+j1Y9OhRrLvMQ0h
 b67DgAAN6FmcCUUt5V8S5Hjaf4IMrOsi074IxQ4KMldtqqjy5PgFffngAsQ4WSVEU0YwsHLRG6F
 zc5skSnIgkzftRhBIVaAjc2R6YuhZHTd/UlIO4JWqgEUUV0AldFK1P2VgPMm8VHXnDQuTWXdg4d
 wc0Ef/Q1Gp9xcFjPaDKWU9KB0el17GaHJgadEE4bBIe6QJvHzLkXI2AN5nG3i3Wg5BbeWnhsrD4
 Gnx6zACwU+XF+/cRJZDJ7Lur0T+CiOfzu8ODzBhnXHCVOvB+OAFnfE//WD5SUuWxPRZ9n8BolO6
 wDguNPCr5NWzNbelMYN1BurbY+Yb6UsWs9WRkb99DqtS3rOc3LbdhjfTnLCqVw4CqWyXciRXssR
 42Qhh/jtX/wSjZRFKBcc3V7WewYm71kxSri57/Atsm8SslnFvWWqSPPHDBqAiQY0f4CsPJCNShd
 qCJ8jLxMIrmiNiAX0H4S1ktF0ZUV94zp+5GmKckbxlnp6RLcUDgC8GZpG/FAeLH4ZdW/hl6Ljub
 txohIiqFMSJnmcRDy6IECo0Cr5a6qha7869gmQXAC2GNYwsBj1c2M8n1VauyCiV56ggFWtDEufh
 anGzNVxncQmIU1w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 9xc8-NgwYBYRA1484G3-C20MHR0IGohs
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab5129c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=15gMRk_Tn8l8Lfg2mfgA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX9n0QxDaG0OHd
 LCt33uFld+lD6gFnuQXHUmOgzvbraddvxfwTdgFvmdSpfgzCcKv7W5NiSc7PvzxcPSR891ART+/
 zYf8dd8Gwaa4+FmS+ZhgqusLO7jvs5imO01Ef6SvCju3gdveyURxJQvW5QEWB1hVQsk0YN9ybJR
 g/If8+rvjb51njXeH8EGIMVCXgFwzG+AeTRzD1d5r0UnYw1bRT4sIrE3LN9AZfD143Izpvde3+t
 aaxnHB7sTIY/Lpccwuk+Wy57+w2Gg4wt6AF0FVKzkXGiX6RFdTHM2LXSYxFB3GHD7M5sekj7jZN
 jDDRud9Q/NFj7CnsLXznVPRogkahrgW2AaObXPiYJusK5nlYMLq67kaLL1R72rwW39QxRrf8iyu
 trNd7fzQooMhKsXO63evV2QLlyhy3giy2qLgvYFHZS+rIyuPJJclmdn6BdjMlCjEl8lJZ2zLNiw
 qdK2a8Zkcjt0IlE9o8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX3tgdayEA3Ze0
 MZT6MQ0iTsKQFoGjNxQljiadPO245WIBUEmkuogStXl/d/1dZdBO7XV4/fiStvs2zRmglXWgub6
 ncAJLikDS2RXmQ2EI403sn8e1vDhfsg=
X-Proofpoint-ORIG-GUID: 9xc8-NgwYBYRA1484G3-C20MHR0IGohs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc0-sa8775p.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/dispcc0-sa8775p.c b/drivers/clk/qcom/dispcc0-sa8775p.c
index 0e976442834a..a1861cc8343e 100644
--- a/drivers/clk/qcom/dispcc0-sa8775p.c
+++ b/drivers/clk/qcom/dispcc0-sa8775p.c
@@ -1414,7 +1414,18 @@ static const struct regmap_config disp_cc_0_sa8775p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_0_sa8775p_critical_cbcrs[] = {
+	0xc070, /* MDSS_0_DISP_CC_SLEEP_CLK */
+	0xc054, /* MDSS_0_DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_0_sa8775p_driver_data = {
+	.clk_cbcrs = disp_cc_0_sa8775p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_0_sa8775p_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_0_sa8775p_desc = {
+	.driver_data = &disp_cc_0_sa8775p_driver_data,
 	.config = &disp_cc_0_sa8775p_regmap_config,
 	.clks = disp_cc_0_sa8775p_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_0_sa8775p_clocks),
@@ -1452,10 +1463,6 @@ static int disp_cc_0_sa8775p_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&mdss_0_disp_cc_pll0, regmap, &mdss_0_disp_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&mdss_0_disp_cc_pll1, regmap, &mdss_0_disp_cc_pll1_config);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0xc070); /* MDSS_0_DISP_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0xc054); /* MDSS_0_DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_0_sa8775p_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0

