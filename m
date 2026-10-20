Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506188;
	b=KL7v206SPOgk3Ghg5jg0tGxH28n/tL5WnISvQZyAs7aG/4mhkzI4v738unoMMWAKUdQa
	 ERK/xfDM+7s9hhzBX0VlPtcStOZE5ZGN0qdxZxvpsPkJzOMGMUfe6zfX50k4sAzwiNjv3
	 H1+S1312gdERynjvTzVxh2B/wLEs3mhYSxBQDc4t2aLWjiWoS70gL32gYgrcF1r3GPluR
	 ACCpqd1Iw3Ct5QCU8vT2Ge7ZIRx72qT9VC+p0cLeoRg/gylw49E52S8bjukWbmcxeoD+N
	 NjLpFTBQoVrshvoNLJnV4OtWxR0cb3s+rn/VuqSjJEVDC+5GbZx2OSOy4YLjUfh5h3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ED97X6gakA8ucbmLBV/4CVg3kHHt8K/gnR4HvyQCs74=;
	b=BaVPD3qV8nKmkWXTX4m5OguPzOtiBqBWG/BN2bBGwE9oaI0r2TErnz7o1SwIRCSMRKPJ
	 f9vWJk96VJg3R+qRB8p861JSLJGbgRNwC9tiAGYjpFU8xgf3qaUBNp3ZXbbhWGOt7TTNz
	 WKsd1oexTxcdiE/ca7XOEpXJukPZxPsaCro30R3giPwUtvRkSYGXJ6N8WOp2FryEXV5HC
	 CENLxvXmdkSlIQUb67O/obTbOfUQy2aTXDDyqhiiEQyJ+RvAI1fQTlmeXEWI7PbmfDtMh
	 iI1SMZ+noTrChDqohmGNUvvOWy6FI3YaJJR4Y2vby2tpxNwAWYBPVZ+tL0CyUrxCOZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U82LcTqw;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1242160A2610
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1242160A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U82LcTqw
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-353804b591eso6218547eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506187; x=1793110987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ED97X6gakA8ucbmLBV/4CVg3kHHt8K/gnR4HvyQCs74=;
        b=U82LcTqwBDiVQAWDSiRG5S30IP+Reiqhx29QK7YfsYpkz4tdaHHoYNX1Diov2X266N
         P7v/K8Tqlri+wY/dmEBMY6NSZmY8C6Sg2hyuyQJrOPY2TWozntWYUGJzAmvKxdO07hD+
         Wwfh7j/Th7s/jp4z4j9X6zWtEDLPhQ01XoF9AyEB5oXaHlpnaOTzXwcrD9OcCi9g7RJ6
         RW1G1aPhKg3e3FK1i94sOlvksiJrLcd6u7880os5/3CXQf63XGHHEzlqwmy6gnKJMmil
         XiIBmIq5EBGxzRe8P1vhdSD6+JMyTrR/FbCLYNp3YLB+DFXWQWrmJnglSYVMulPqZp2v
         CoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506187; x=1793110987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ED97X6gakA8ucbmLBV/4CVg3kHHt8K/gnR4HvyQCs74=;
        b=QnB02mq4fF4yyMK7EZrnxXmWTBK8wJqISrrmP5LOjLMojGe46/bGHeXwMoepISm455
         3qvQ60Eh/1I0mbHRuMLccSEnsPOeM6fvYG5yfPCRXlPmoXy3NH1HZWUTD/vF1x9iE/qv
         EWkizoQldPK1bRtqPj7ELtq5PfKRM29cpw/LWhGISwcyN1OGW5xVkEEFxh2cvgqOIbyR
         SMBv3X/oWQBZkpDzLanStAt3s5JPPseCf06UyDe/Wm+MTJaBTwBCy93j4jqMFoJAO2vd
         HyFhsHhrVJjiGNkjz+958g0W4o1I2CG16ktLq08YwS+kW94/bVUkJb9PSaLljUhTjXm3
         eBBA==
X-Forwarded-Encrypted: i=1; AKwUvBzliHhk/ZDhAWtv8a+SRHcGkFc+hXgcLx1oY3HdMGwGeIkjxi0H0MJO5Wlsg/EYkeWweVhj8WoJqXk3j7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjwQ77BEFnP2ez2zfmyi2H6RFb5yHomC/Dd9H4CMlbwTl4lcxo
	9Rq56eeF4Y2FJUUaaGepKYgJMZG44ECKyEL+rh0tnptKEjN99oq2MN0Z
X-Gm-Gg: AYBFou1wuGBJvXJ1KuMnO7QoBe8phXafFtfddH5zWnwYgoKWkkasElrFvqmwppOYETA
	pNxpOBnIJfMooVy31L4QTD7zook/uSDUlFNnCq53qNm9sSHv66aPLCFgNBJ5pwqLG9I20s8np+2
	5s+1Wh+4tkQEKKvFYFMsSnUGiNFzAnOqTsg2QEULzyRdzc8sjYkdfkofCQXWGK9Mtexeju7oCCQ
	buZ5c8bhvfXsq4+kALPehhpIfhF6WVTsWQwmghbDtL5AZBz4kOJZS6lSpjt9TA/V11bXchUwJIm
	D8oSS1SO4Y9k8qtqXGlR79ghtnErE8Gg2XDwXFhFlI5RvzARHXHmxGXanoeeONCc5YmwRmg6yza
	dOV7CFLv06LPZwkX1ANrymq2UJjOHZg6RuMFTtuhN+G+DgJ7ty+FKYJ+Tsaoq/ARnnAgsyGqiAe
	f/SfsVzD7gT3lPcxWuTmgmQ8SXIpUEq/tDCzgsgPlHPaC6BPuYqd9hWAHpN/qYY1fUDcNvcK+Dl
	oHkmxNeFv4=
X-Received: by 2002:a05:693c:409c:b0:358:ae07:138e with SMTP id 5a478bee46e88-361a0e85fb6mr17668280eec.8.1792506186522;
        Tue, 20 Oct 2026 07:23:06 -0700 (PDT)
Received: from redducc.localdomain ([183.83.156.125])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081ab80f9sm66917444eec.12.2026.10.20.07.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:23:03 -0700 (PDT)
From: Sushmit Singh Rathore <sushmit718@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sushmit Singh Rathore <sushmit718@gmail.com>
Subject: [PATCH v2 2/3] clk: qcom: camcc-sm8450: Retain flops across camera GDSC collapse
Date: Tue, 20 Oct 2026 14:21:30 +0000
Message-ID: <20261020142157.1749-3-sushmit718@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020142157.1749-1-sushmit718@gmail.com>
References: <20261020142157.1749-1-sushmit718@gmail.com>
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
Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>
---
Changes in v2:
- Use full name in From and Signed-off-by.

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

