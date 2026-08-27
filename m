Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CDB4908C6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848750; cv=none; b=ZS0Rm/rq05v6IsxP7P0Sgd0PMeIG4HNUX+NffbVZUDqruuzaVMpZrumNqemyZoN/nxeM6NuJ8XSwguItOlW2tg3bt50w37DnjqPZnWnsfSKRyYYa376FKTJUC94oIZ1tuPWCx1+ByFJOy54+kS/J6RU4PYJCRPb++CumJwmt8mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848750; c=relaxed/simple;
	bh=HmmI194gyOrC38jn1kOmQP92tC7eCM4pFbLwZh2jkps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mr0v+tgChxwjOQ4ZvQp2HwIEMdITgOcGv1iTld97RrnZQpzJS1XqVkLfH47dR526G4S+2mIgYr9udhXMhfxN1pxKXpwp1TnEZX3h3lTjy4EUuUGqHBFIRN2wz9c8SxeA5q8klniRfG6gL2aublyZJ2aNzX+bOBHhhLBK5Y0rL2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o83TyDGb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQkGRman; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o83TyDGb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQkGRman"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFc2kf866777
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=; b=o83TyDGb6xN8gMsb
	k1u4uhRg6AVRaGyBZly3yJylYQopQlfd8SX+Wo9UEXt+L+GJZ9qzDIbeNzbsVomG
	UqPe3SWefrPwtG/p0etjLFCYFeh1vdT0IaRnjRwe1fkPJUkd3S5G/zEYlXySjspu
	UNBc6r3NGpu1lQOjcFG7Xws2VEaqbuEvWXJAs+dGHKuAlGiGoMseyFRUer8gqEq6
	NcQ7yGhg9gK99UrEc7qwrwJKnXXrRjm3JeNL/Vxieg/aKPau7p6xy4pJ2oerTcAy
	5dg9PdsAxNgY6/v+xMzZmaZ6DI+HP97NfRJ0nf6gUsRn1Op4hwxV4BLfiFQnSMXj
	otmmow==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gapgv8rd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:39:05 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f4eb9e05a8so153840a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848745; x=1788453545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=;
        b=GQkGRmankbkBW2HwadWNp0FD436ZWUQ6cr60A/dWNPTE05L4UGg5ndE3NThAfIp2cO
         LopTCCiVx0+UgkEifu/0r5lPrcJZUOkaATIsmNULV3T5rIiZ1XsPMISjdaNNGXn2eiAN
         OCAvhdH7hrCczzpwFcrpkFmeomXCZR3iKD6XcUpARhLkh4+BHKilGKWDbiI4URINkbk/
         +k576lv7BlkjCJ9FzFpzSAuc+q2UYcZ/qVOfgqPh5yCE8fg4NsuNYhE0clOt2ZURTqEO
         We8lWiiZfckdVLFzqAT/4YHpHYouCZDKNYnYMNVkDiyq+WLpLPZhncaUJyLyF4Y9A5eU
         twrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848745; x=1788453545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=;
        b=LA5Anp8sZU3iu4crG61GAh2v+bepaJcPU8CMd7zFpz7ypV+sY6eu8vgzsXqJXbklsu
         FwX+ZKFrgQ5vEfAFGHWZ6qPHyrWN3onFQ2Y/+9fnN1MYvD83IftsyulFcGKqAb9HkV0g
         ZGbmflmZlXZ+UT5lreYZTOKaaUHF/Ezo8AEcSfG/A7dxRM0QLxoSDmyuiu+zoLL3Cwz/
         nWIwE5Sf0vEhvM0EROrtqokyWtKRR51GJxob+SzT3Y5k7FOygZbCDmFoyIP3BbhgGPS7
         T/MR6WgvdI7YfznqG6zfZoQJwA3HwLdXf1noyTjsaaM9E2AD0Dp8xhjxwYT3BcBRWF4T
         QEfQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJef5BzsL7cBQsuFL4P/8bqV6rOMPTJQ2FtyqOUYy8P62JUfwSINhrzFGQZPeBdnhYrYSz4sSP7QdXGEw=@vger.kernel.org
X-Gm-Message-State: AFuF++k1cwcdBLAsHzVCRqeUWCL1Fztk28TFQ+RBUgfNSXRJrE7rZOoK
	uCNi1x7pKQIsAN9nRylZ9Z6gZ1CTz3j8lcvkiOkIessTwvLwflCJZ+mq/3SZpZut/rRxKrgE86N
	FCcAi1EEVOq7jimtRwo6HzHTrd0vkSKk/R2c72IkOVc1irOodABQBhj1JA97md67V4QU=
X-Gm-Gg: AR+sD13+gXRzA852BZslZb+R9te6wAbh4muXUt9KqFi1tZDHIodmHavCNBlDZe1gA0g
	YncVcEGX9O6fdk7fwIah3Zd9WFNqQEuaUnLjEbAZLcQLgTFbxLOSPOTpl0iHwM7L2Z0/9ZvbUM2
	2osqdj4vxqZJ0u6Zfc4uPwlz+lKiDiL+/1RHope2FbeuokKbqFCxtdMjUCCZODF+ZXt7MsnRy6u
	b28mbM86HEn8JhTi6rcwCMNXa3iCAzIP0VUHIqppmVTyju0aNCMyGqsxO+Ulef8WyLXunACkgqs
	lsDSQRWdEOOxukrLzDW+MonmwNys7ZdoiBTYQOv11HkqVWsWVzoMvHTgnU5U4ULCjdLiem9HFOG
	NquLZNVTB33PwE84+RPSKPPZbKP/e1GQ/dz4Tblil23CGGo/YiDxXO8uqvKJ4G2SReFATxbdOKQ
	uqgXJmY9DRU3bi5T0nIgCuqSk=
X-Received: by 2002:a05:6820:c319:b0:6aa:d97f:453b with SMTP id 006d021491bc7-6b1a04e4f2cmr13126307eaf.28.1787848744965;
        Thu, 27 Aug 2026 09:39:04 -0700 (PDT)
X-Received: by 2002:a05:6820:c319:b0:6aa:d97f:453b with SMTP id 006d021491bc7-6b1a04e4f2cmr13126243eaf.28.1787848744519;
        Thu, 27 Aug 2026 09:39:04 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:39:04 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:06 +0530
Subject: [PATCH v4 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-5-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=2134;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=HmmI194gyOrC38jn1kOmQP92tC7eCM4pFbLwZh2jkps=;
 b=O3qlxz7x08CxfPx7NLFQOLsmocO6gj9/OPvgz5ckr+LYjwS8kVRwv1nhMSuHzk1SITQ2RAlQZ
 oh0cx0wx1jqDxuqlif9h+RqOAy1CpyG+tAYF0Bac5NKmhO9lTdGgQOA
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: zdwQVGWz1ocGGSdf5_Jw_psGO3xgKfKQ
X-Proofpoint-GUID: zdwQVGWz1ocGGSdf5_Jw_psGO3xgKfKQ
X-Authority-Analysis: v=2.4 cv=FpU1OWrq c=1 sm=1 tr=0 ts=6a906829 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=cbMe9IPPLhjBV4UIYdkA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX21HFLhFqb2+i
 v6cxjgUvB09BBR9WMK7yerQQMPtXux8sLLel9ZtjldMru6VtDqFXUzB4ZrfyjnXZzmJbh9MvQXn
 NXvGtQwhqa7aNGqhKBK6vdRSMZpO49JKefdBHLK0yEwmsTc/jfrXoMzFPidSm4dNTR38FcEOiZC
 V3aW/o/S2Rp+2BvKCGuLG2w8Plno9HELNRBD9zf3W1Zdt7qXjDUaqMr4jmvFMR+OmarglAdxVws
 Wci1152J46U9yrXNr00dcuZbqVPgPfMtkSFHEDYBF+LWQEFU1VK+yYglyFXQm8cnvhGLGOemoS+
 IhXcRY9DlDOJKe7Eo8Znnt/OmuDgZ/oF6nhE1X3zwWExZOmz9a42CV2Z83TGq/k6etQKsJUzfjm
 BQzruMOeCEcQfD7mz8io0xP9Bq1zHji4uLvDK+rvpdsvLA2TdShL8BNqTGIW4pvRgSa/AE+8dkc
 38uur+RmiM3SLA6ZkgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX6AmI9a44kZvw
 w19zUXr94N/3sSOQWGIHmCSCrY5IttmGk7eS6AVb6Z/6lqmuv/uyRBZ7vHPun3yzb+MNZIoV2X2
 1VziyTKC+IXfPepXTJSeVIq8Pt84hU0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140

Add the RPMh clock description for the Qualcomm Kuno SoC so the
qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
always-on variant), the QPIC BCM clock and the IPA clock.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index a224a94ae273..ec8700b6186d 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -937,6 +937,20 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
 	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
 };
 
+static struct clk_hw *kuno_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_QPIC_CLK]		= &clk_rpmh_qpic_clk.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_kuno = {
+	.clks = kuno_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(kuno_rpmh_clocks),
+};
+
 static struct clk_hw *eliza_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
@@ -1097,6 +1111,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
+	{ .compatible = "qcom,kuno-rpmh-clk", .data = &clk_rpmh_kuno},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,nord-rpmh-clk", .data = &clk_rpmh_nord},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},

-- 
2.43.0

