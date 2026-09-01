Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC24476CC4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254776; cv=none; b=YGaVPZ7OYm8apXU8TfeflOoogI8HUPJpsssagWhiVGonul4i+KwLSSaeZW7x+ebPKQ/GyV4u2ZZNO3Bg9ElupWCA2LNT8Hg3jR5NOPofmPDCLAgFDl4QpLPM9y8R+DRxB+osIOGkKS3NYhKYSgR7PivlcNVUXs8MdINSIs/R1KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254776; c=relaxed/simple;
	bh=WWiZETqtERmFbujUpcdTmbmOg/Oos2rIugNyk5YbX6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I4/9kDDifs+EpGOd00vQQ2OU2/IJY3yAnL/W1vFUOSPghlRujxrOci2IL28rMpjKybNKFOQye9PP9Ds4N5Kem91w95p1oxloRNpdCkVszg0vy0LbnDey/8qRoz+eiSrlxtgMQMgbilrKhe8QEIxPzA+yHrB+t36fxS5yIcWRB0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfvwQwzX; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfvwQwzX"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so734332a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254773; x=1788859573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oQFudH3aykdSu1uFZBUbXQTkxTQGqISY8X7sgzXiGDU=;
        b=bfvwQwzXQUsRXYC5orsAc17HHlNxcFSteeqrEUkmKUwv+OUV9Bx/eX3HzIk7tPO/Lo
         0vWA/TbrEGT7Z0Cm1ytWp5nH9yKSqjaICLWNPFJNsNEBfvfGWksSahxKe/j2+DsX1mWj
         SzdsYAKD1FbSMvQhOFmOYz3fOqs3FKHwCxh49pzcfZ7pvRGTbaAV8hGnDvoV1pIxMhuM
         EnMyeVhx0MkccFJI4v+bpzh4AxxRCbZPoPmCmiZMJ3MSumCDY2k/GXDwQzal3MZzT5Fx
         5qH9KJwYeCVDKCsT8psMr+WKUF6B3n3cFI/tXRyvQ6fqU5NFyYGUd6kQmD1qTZvpK8Ct
         t7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254773; x=1788859573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oQFudH3aykdSu1uFZBUbXQTkxTQGqISY8X7sgzXiGDU=;
        b=T2D9XmNOIN4Ea26opj5fgewMa04/ddDPqDwoZEbSSKttbk7zbmeaxjgzOlX7DrzmWX
         0O3W79YIIb7EmeL6Ypvx+QxLl4Z6GtI7rEh6cUk+RYcYVlIhY+pG28c5kKEmswgK7zYu
         ji1MgWsV2K5ICMq9TF4RaTJZ62QuS5+Bk2JQiME3HqOydSaITE7I23v8k/exwhYhUvYr
         FXAu/+xnmq3MVYSVc7ZRp6iQPidzUlrS6cKBNbGAA/W+ZS6QpWYZOcxpFvhCCU7ypWTO
         dRV9YPgW5EzAotKUyXoL8bHSCKfVlM3huiEHizGbtTFsZBEmwi9SGaArLeXipderyosb
         iRdw==
X-Forwarded-Encrypted: i=1; AKwUvByOpXrwdf88owawHBlorCPvObKX+HfS3RnnzTz8oHvVmYAS0ugFCYTXGaFJv0fUtMOd51yQ9Wt4iZ5oWGo=@vger.kernel.org
X-Gm-Message-State: AFuF++mkNsbneMD3tlKCsV0lYlMnXsueRWuzVY3rSRl/pBWZCfKKwE4J
	G1qHkaGpaEQWLIMn980LhPpiNOLTh3vNul6N02XyoJ7zCJpk9aHZ6Vy4
X-Gm-Gg: AYBFou0sHagUHhLTUomVpZJuMHD+6yGXUDDhomUYrJOCtr06MurSe6n22c9lXz+yDjV
	DbjhUJRMHmVvxMk8v1XJYZQPXvUPE4YBfT6NmKE++hiBKmj4v8IT1Vn5bOncdgv531U9IrpOJNn
	3J7mqULx8MCU3PwB3voX9W+/7Gn5C0nNkl2D5XYnKGjIDkO3XqB141E1RTekPCPjOfRnHv5NYtR
	RYDC4/BcPZyTkLPLs1O8eqhVFtrK7RHbsAya/SFB8rarVndXHrzJTf78DuTwccP04/jE+rIrWiD
	fMVYxzCusFVquzGLNrknBO74OjmTB0YIDy7PDF6gJsPxzUqPiyMfV6f4AlcAW1kqBGEFL2/c6uu
	uMIdHCkVS+0ApSsosndwySqprOnL5WtELOWjm32AV8AMOgl8TqbIIv3oquqa7fZSntdNfmLcUAe
	PpyOFds0axSDb2M+FcDuO4rXqiPhhJWVqJRUzDjmg2Fw8gKKKKSKuwnkU1ekZBvwI9duA99rnkq
	TU68D6K2Zp9
X-Received: by 2002:a17:90b:2fcc:b0:398:9be9:ab8f with SMTP id 98e67ed59e1d1-3989be9aca2mr37784325a91.20.1788254773212;
        Tue, 01 Sep 2026 02:26:13 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:26:12 -0700 (PDT)
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
Subject: [PATCH v9 06/12] clk: qcom: rpmh: Add SM7250 rpmh clocks
Date: Tue,  1 Sep 2026 09:24:41 +0000
Message-ID: <20260901092447.3028-7-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
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

