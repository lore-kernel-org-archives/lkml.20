Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426677;
	b=Suf+36i5ZpyNTBVcbXL9hHvZHY0CTAe3/kjW3UE1F58rOnUH6tJYy8Is/fc1fmrnRbs8
	 GvRUwCRDVUXaWOjLycfICa0nbEpVsRA8hB3YimkrlN51Kzv6UvrFfPJBx7s3pJJ78A85X
	 Dl0TDr4cbMgWJ190xWyXafiq6iA/dN/ZkRqZtpKeRkGUs+mPucYVZIN4MAckmPTsLidXk
	 66savxQaz+uo+O7OOQmB15lbqDe40gAcpRMTybXHqp+rwzAFLaD9FoZAVthyiN2qon8LQ
	 W1I1H+6Haintpw9/BYy4UoF/1aY4v5sPp1vP9YADOc6ZrMXahDqbWamCHnMoOXhA3Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j9/YY5ZYigZ1aqT0I55Hlkm3+bQMNT99YHPRJIImTVQ=;
	b=FtuIWfWOEHICPFv/Cn1U+DipX2bTcKtuofvLqdtYkw9ECV+39o30hbRvqfNaHeSA1zGJ
	 ZHVLtuT/eJVm4FxRdN/NbT1wOo4sIzcuM3IJhv9XG+pEleJHXRq4l48YwN3WqPjWWrGWJ
	 8hh7rbD3MAzKDIFeN9bxYkv1LhkChkAMR4i2nlFaH7h6F3tmLqmfpOGmzje9QLiallDL6
	 LjFQIxe0oysx2Nfik9A2sn4HooHERWfDv24M1K8Pw9ZFp9OXFXgYnNiY4zaWQijjetDP4
	 bvYJK3mnTaBIHYdzld2au0/gVRV1zJTUHeJZHzajRC6dPueQ7NAy0+vNHkgzA5vfSuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="qDF/voXd";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23A660A263C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E23A660A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qDF/voXd
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-354ba08cfd1so4169797eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426676; x=1793031476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j9/YY5ZYigZ1aqT0I55Hlkm3+bQMNT99YHPRJIImTVQ=;
        b=qDF/voXdFABxdK5aqc6szv0m6DU68u4FnQLKltgfFFS9FTwVcQUs5mpmv1ar6qArnv
         EBAcMNZLwr7QOzfMGz0obGeBaSWYonpdRy10XrrpBY0DDamcAQfFKjtJHYfwDpfUzHVM
         JkGbBeEjtS0MwWX6GhHuZVqQTWpb1a7HwJhP3WqZGzT9gH6+zphy3AujM3rdT3SvqIAA
         9ZrtZjvxtQSAkbKFQSdJlguPJZdG7NR0tW/ppWdUaauv5s81lcVehkNTjn0Hb3Zd3c29
         j3ZesgtL1gOVmOrqVXSP/mWCbWh2aWyTL2unyetNjHOL3oSBwmHPGyRAXuZYLBDJuLWv
         WrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426676; x=1793031476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j9/YY5ZYigZ1aqT0I55Hlkm3+bQMNT99YHPRJIImTVQ=;
        b=ovI44kqLXFMKoPDOPrtEC+4i6D0s7WkNCNL3pFiQvs6SEhzeR/curqO9KH00gx3+h5
         oIdQ0uZLOM1LElT6XJDsvVKp+lCuSge12/gCL1+awDPmdwSndJ3Z6pUe5rdDOvqP10Rt
         u45H/x4DdVskexaew0TCiLDUiEM/fF94F6qRErvAGCKBEnHbT4gf4CsHf8/Xji9whIBr
         xCbMLRYqg3xQIMmHVEltDJnISmcyJn28gBuJxBJfyxBVKJW56Cbq81zIRh5vElSDvm3m
         Y1OB5B4JQgM5HCOz1zB2UNDlFwHO2JX5sG0h0fzD4utsGz8q1AvAAlKElQrL2pqeZoxM
         9SCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxokwd+jFcwxlfYjAkqKfE4yYqPygTYMQhn+jHtf+5SRz97YIyzX/yHGRtPjSp9waXTbfhv4nfuRFxbhZE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZEojqjIeAo99U2iduWzEmfP/qbiRVxTRL/pfzOV1sWUUfLJ+K
	IJOGG5uCgqBe0LWTzE3Jv4BF2JHmaT6uMds1nekR4dd5EOUpI1ZD2ygH
X-Gm-Gg: AYBFou1apDaL53O9qtQdBH3riwBwVJ0sHZYKMVvJELRZeTdU6mY4NzHw1dv0q5lbOYn
	filuYS6Ifv4Gb8faPmLNc4FS7+XMQtRObMh6LFYDs9leWQm00NKCqi0oxxNmNqra1xtGDSrHbBv
	S+OQDdHWCNc0wPsWRPcqgLei5Cm707gzGwgFOjF3DKbFdUIRfkpFoXtQYUQr3wnHhwF08I1Eppj
	9KxGxVN1OiSJuaLGNF3XmbUbZV9fOa6aValBYWH6GjWdRZsqr//yg3NTCZnv22ifyPhOA4szQWr
	Xi3lrzc1/FZTmtOq6dwfa3aIYqIUN0pmBIvEDl7El1Iix9olvGn+L+8J57mQiCibjnWvyURXeDX
	oj23arB/3xvaAGO0gGLVy/Wju4QSK1eTwrV9zjkrlJBB/wpGyqMN/T2OQ00JDyCX6Pib6D6PnqI
	7pHtsf32vMknlFJqNzUEKtGkP86LXTLl1Su3Lf8dlz1HsrBKUGmdufZK3UuWKG78lS/XO72LahM
	84zV9Y6VBA=
X-Received: by 2002:a05:7301:4614:b0:35b:3181:80e9 with SMTP id 5a478bee46e88-361a185eba9mr9880037eec.20.1792426675354;
        Mon, 19 Oct 2026 09:17:55 -0700 (PDT)
Received: from redducc.localdomain ([183.83.156.125])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm33410985eec.13.2026.10.19.09.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:17:54 -0700 (PDT)
From: redducc <sushmit718@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] clk: qcom: camcc-sm8450: Retain flops across camera GDSC collapse
Date: Mon, 19 Oct 2026 16:17:39 +0000
Message-ID: <20261019161740.2384-3-sushmit718@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019161740.2384-1-sushmit718@gmail.com>
References: <20261019161740.2384-1-sushmit718@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera GDSCs are collapsed between camera sessions. Without flop
retention and with the default clock-disable wait, the IFE GDSC can
stay stuck off when it is powered up for the next session.

Program the same wait values and set RETAIN_FF_ENABLE as camcc-sm8550
and the downstream camera clock controller driver do for these GDSCs.

Tested on the Nothing Phone (2) (SM8475) by running repeated camera
sessions.

Fixes: 6082037fe62e ("clk: qcom: add camera clock controller driver for SM8450 SoC")
Assisted-by: LLM
Signed-off-by: redducc <sushmit718@gmail.com>
---
 drivers/clk/qcom/camcc-sm8450.c | 45 ++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index 4025db23d1a9..9f1dd51db0d5 100644
--- a/drivers/clk/qcom/camcc-sm8450.c
+++ b/drivers/clk/qcom/camcc-sm8450.c
@@ -2930,90 +2930,117 @@ static struct gdsc titan_top_gdsc;
 
 static struct gdsc bps_gdsc = {
 	.gdscr = 0x10004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "bps_gdsc",
 	},
-	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.flags = HW_CTRL | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc ipe_0_gdsc = {
 	.gdscr = 0x10078,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ipe_0_gdsc",
 	},
-	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.flags = HW_CTRL | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc sbi_gdsc = {
 	.gdscr = 0x100d0,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "sbi_gdsc",
 	},
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc ife_0_gdsc = {
 	.gdscr = 0x11004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ife_0_gdsc",
 	},
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc ife_1_gdsc = {
 	.gdscr = 0x12004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ife_1_gdsc",
 	},
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc ife_2_gdsc = {
 	.gdscr = 0x12050,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ife_2_gdsc",
 	},
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc sfe_0_gdsc = {
 	.gdscr = 0x13050,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "sfe_0_gdsc",
 	},
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc sfe_1_gdsc = {
 	.gdscr = 0x13098,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "sfe_1_gdsc",
 	},
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc titan_top_gdsc = {
 	.gdscr = 0x131dc,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "titan_top_gdsc",
 	},
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-- 
2.43.0

