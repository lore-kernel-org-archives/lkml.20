Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36CB409129
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246518; cv=none; b=QnZh4szGNZeMEx1nSD2cjfkQcBfYmt8NuLC6yS8ZRuB/eeVef+g2G5cZno5IjXPdWxnm+NCvAdLyQ3bwt6sW4JxdqKh2GcSt6oSd+UWkALb9UY7LJAj85nu0jtQeZqpOZmBAg6TqQWdOOmntOCH51uaUGL6rjdooKvx1EZFZNRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246518; c=relaxed/simple;
	bh=WWiZETqtERmFbujUpcdTmbmOg/Oos2rIugNyk5YbX6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dwpjupasyoTm1FCC4bpW/xsD41H5Yp/BD/PzexJzsKR994RmVLmQkft1XeGZDaT4nJH3slaQxKd3RuDTzn4mNC3qeuPovnNlrjrjAmWVLFpugv5475gAC+n0rNIRJTqBaO9KJ6QYd2Hn84R8/QdwGLGvC3fAf5DwoBKrYjqjjOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHMoYt/y; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHMoYt/y"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398a5aad413so584159a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246513; x=1788851313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oQFudH3aykdSu1uFZBUbXQTkxTQGqISY8X7sgzXiGDU=;
        b=RHMoYt/yQfOAZAACcIh/xNQmcA9kB5nQ8CDT6GyVORQudBAB59xn4BCNd4yOkrStQn
         85RVXZ/oK6VJj6Owmd/uEzKO7wbyvkYvIuq2ljUC7d/RycVUMvRxqzhC9W4QGG/eiDAo
         tdcOxJl0u7BQGJWAuhTI6ASdPEW6Kol2U+gX2m8i7Ed/YYK5GkbBkiqgiivlhVoR0ROr
         vDV48sKQTsnN9j/TqJYA35LzCQs5VdQ7gI0f6eYLIeNOsIb081//FKLOB2E0EMvkkAig
         OcchqTz23NOswq7jV+/go4K0w+0L12zC89230xTI7LesXGOhXh22yMWk36Dolo2h7oX8
         +O7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246513; x=1788851313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oQFudH3aykdSu1uFZBUbXQTkxTQGqISY8X7sgzXiGDU=;
        b=mhwh2uL0ZP8oLxgHL83HFk31qnZZK+a3dFjEDqtNRihCF2zD+iKTlZ8PnNx1mSOnHY
         Tb+Vd5btmBbPPqPeAh5QRGI4fvlqEu1MVq8CrphKg+UHCu1/OE5uf5sX+D/2l2DEbM8J
         yWmB5cp4QDfsuQb8V6ja6e9XJlJi7Kh/X6Pa/41Pb0RbC3gFBoP9HM2n4PWYkxHCPisy
         1g0UQ3n0oxt9DPVur/3Peu9dbQsWFYMLAy5wMHa5AsyaY3KhEejXHzB1/DG1gFrk2KoA
         w4eAW67lZfeQizBaIfoFQVqhSuqvSUmhr2xtLLbW9jr/4iAkcf5lOUaaL5AfS+kUTOJ4
         A0Cg==
X-Forwarded-Encrypted: i=1; AKwUvBwOlBQV1rA3DAvOjOg48NDaRcBt9/4x4BLp/Ptz2R3+G5gQvCo+YxCdS9K9pZAC8FnDn4IXh9jq2hIYsJg=@vger.kernel.org
X-Gm-Message-State: AFuF++n+ns5MV1z3I/ZYFi7eJAGqg/yw4QqzuUqF1GhUuRl9wvRKrPsI
	ql0KNgSOT5WQ5t3QJY8tIzjdsyroWVFnEuEPMqSuM3CqWF+MSPniif/x
X-Gm-Gg: AYBFou0oRhLlx3uCONvrprWe1tiNQPQU3CEIo9SJDOKpUvYX0Dmie5VE/tdOpxJkvMc
	lPEsHEU3JttsegouPVCiUgip38ic1ushffONWCLqosxCsqJmmrkOElGwlBYByUalo4Eb3bR/yJT
	+peo8CDyaAMpe+RzWNcNoZkGKiA1lH4YV0eEad2NcZpLlwMAlHQIYaPKk5QGkJta9Ov27H9UPir
	Ux+/ePyfhc1ZRRNeTb/BNeZVcgLb3kUmdSSOYiXabCrvYK5dRJvMLyvdPMf0C1o/GxAZLfB3Wpq
	Lcxztjo5hvUdxlOSX1MRO/Wcgd8fKMl8hFruz+pFZYftJmGQ/cWvuq9yBwOot0fWOLgPFzhrk9l
	m7qQaA4M7nuXYvh59A61VUJkS1KYR1Xm3/af1Z0Mlav4RohuJNyltLfF+5QyS4mM7O+yfHICbPj
	niksRuRHoqkgBcdtmgm04fUK+OnlNMpLGAOcwmw7ZgW28zGEYJuZl3XgYr4ByR/TnzQwDz0fAcg
	HRZADe1NX594q6fr89MCJk=
X-Received: by 2002:a17:90a:d2c7:b0:398:9bd1:3210 with SMTP id 98e67ed59e1d1-3989bd135c0mr35732687a91.17.1788246512913;
        Tue, 01 Sep 2026 00:08:32 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:08:32 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v8 06/12] clk: qcom: rpmh: Add SM7250 rpmh clocks
Date: Tue,  1 Sep 2026 07:07:11 +0000
Message-ID: <20260901070717.20513-7-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901070717.20513-1-sreeshankar0910@gmail.com>
References: <20260901070717.20513-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the RPMH clocks present in SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index a224a94ae..5799fa296 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -1005,6 +1005,29 @@ static const struct clk_rpmh_desc clk_rpmh_hawi = {
 	.num_clks = ARRAY_SIZE(hawi_rpmh_clocks),
 };
 
+static struct clk_hw *sm7250_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_d.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_d_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_d.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_d_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_d.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_d_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4_d.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_rf_clk4_d_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_sm7250 = {
+	.clks = sm7250_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(sm7250_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1114,6 +1137,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sdx75-rpmh-clk",  .data = &clk_rpmh_sdx75},
 	{ .compatible = "qcom,sm4450-rpmh-clk", .data = &clk_rpmh_sm4450},
 	{ .compatible = "qcom,sm6350-rpmh-clk", .data = &clk_rpmh_sm6350},
+	{ .compatible = "qcom,sm7250-rpmh-clk", .data = &clk_rpmh_sm7250},
 	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
 	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
 	{ .compatible = "qcom,sm8350-rpmh-clk", .data = &clk_rpmh_sm8350},
-- 
2.43.0

