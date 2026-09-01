Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470E24334C4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246538; cv=none; b=oVkHKJ29G9zZH7+5mpX+94dHxoFjAYfF4Xrbn+I+krg2zsvw+v6ToAM8pspr9L6chcbkMmQsnQ9PPqnVMITu1HyOxnUKR8lI5y3Gw5t65+gwsqGLTUDAWBtSJweYnzhJrOMdDT5bbj2MmgbjMY4YFINJhoFDmaoT4RfHKeB/lBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246538; c=relaxed/simple;
	bh=+m7WxzhF7QuTKjSt0vk6t6LsZP/6AIR8o4P2rlZl1RE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b91n4xs1mUmlzzNscezYIwQwrDRe6e64cf9NrImSe1pf54mG3tAkT9B/YLIT5DMfKbu03P1x9Eh0npAMa4vBOiZOg92rv9nYe5eU1HzomqoxAcP6Ua/I1nKVsV3nljTqyGa6C2rf4E14M0Bdfxy0mPa5kcbo+5jpmWuZEbB+sBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVHqhbcm; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVHqhbcm"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso5852025ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246533; x=1788851333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khMXXSisMw9dgBq90MQcu6P4BUMmcXEpcjfAoZEh/Pw=;
        b=LVHqhbcmWVZdx5M5W+g6FxkD58zvXa67C2Bg0/vszbKkr8MJ7Hh8N30wcMmCxdf3/7
         3H47G1g8536VzCKqEELGEHSSL371jAXg1kaA8zFw83eKFBCiIV88UffFuAXLNTFHG0OR
         YrGY3rxvXFRsBiZHWizifmw5rbEOPV5Htit9xmyzp5sinsMPW+PFwY8aKY0X0ags9HNc
         UGQOQnojq9xPoZYY2dcigE4IPUdu6Wnba9pDSJCI8nHKNeN9OX1TFJ9qgnEtg6887Toa
         GW4BAUQoExSum+50g4N6LiM3W36euAQo1YYiY/XF5CR6eYs5gNRq3CHeogmucIeJp8Q7
         BcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246533; x=1788851333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khMXXSisMw9dgBq90MQcu6P4BUMmcXEpcjfAoZEh/Pw=;
        b=aw2n0hMyhMKrWvPn2Z0SFYa5rdekAml2rMyfNEFYYpyvlYZRI06HnryaDbS31cz9O1
         ci+lOtipynqoIs/P9c9oQQErUPT4Y4loOriuDBxAV3pnqBRj1g3Tt0AJSv8mYTlyygDp
         vsyyRQGiEn/GQJeeE5TpL+jTvzcLeHxE1HW/T93G0NXmhDVS+p872L2BNS/URLjQizLD
         9qjst+QFtSYHfa+OR9+gtEjZ5UFNNhzbKR6sYdTeupzb7QJWAZen4xU1jWqHjBtLPpBz
         dLNsjx4K7qbMmAqh8/J8VHUbtv+lUzH3i4xMrE6HZdE0G5QJvgr1btnUchcIn8V/B7g9
         Sffg==
X-Forwarded-Encrypted: i=1; AKwUvByMhaknSRssqssan/Cyc4VLDuroqjOGLV69X25/Q+aYaQGkvUxOfuD/eSHrKhqTOpC+RNBcvTGrm0Qg1ms=@vger.kernel.org
X-Gm-Message-State: AFuF++kxskPQS6jVB1JETTGhJmwRJeY7o8n4xNpcyJs8wsvOlMexshXp
	BOj00o3mfSR6ZRuSpLqcTblnUzmpW7ZWRgMcmjMUylfoWLiQm9DM8erH
X-Gm-Gg: AYBFou2isL0WIv1ZvrHL3hLjlTSxxlTjm5EnDIzcyiveKwWVFIHgQWokxnZJNXHg/vj
	/Z/duZWgsxIvzdUaD3XjubmKFAc6Z1QEnRMg3TdnXsZ+moDcHhltOyTsWWpPY7vN8wrW+wWikJc
	Is9Hql2w2ZOjEE1+sFLcFAEzJu7OWIwLiMMQmFRFhPw0jOq0bSbXtZQvPxOKA1qVtXqGjLr4X08
	pBpzq6xCfsbzU5e82C1WF3t2Qs/xOxTJZBk8m11ws4Eckz3YEZ9wGD0WusUrSXU1Fi+x5Vwjjcs
	3gxRnCjOK1hTutatSzxih+l6s1FCeFVwo+adMVkkTn2BNTmN9t6MnPqZxtAqybAYTjor2Khf0Bn
	73SfWD3dgFS19JxXMbATOVqnHVCDVy2acZ9qMumrckcAQEB1gATTaAJVFCTaF7enxx3lRbYBNQm
	/wtWJOmR9MJOWb1tczezGqv/BTBoWX4JpyHRWXLjaJ30c7TQS8hLwYIq0RAbIG9aMo5RaLA+jvc
	5UcBlaGWHLK
X-Received: by 2002:a17:90b:588f:b0:398:bf7e:b267 with SMTP id 98e67ed59e1d1-398bf7eb378mr26750541a91.2.1788246532645;
        Tue, 01 Sep 2026 00:08:52 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:08:51 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v8 08/12] pmdomain: qcom: rpmhpd: Add RPMh power domains for SM7250
Date: Tue,  1 Sep 2026 07:07:13 +0000
Message-ID: <20260901070717.20513-9-sreeshankar0910@gmail.com>
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

Add RPMh power domains for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 96e4bd2f5..70d0ff5cc 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -490,6 +490,24 @@ static const struct rpmhpd_desc sm7150_desc = {
 	.num_pds = ARRAY_SIZE(sm7150_rpmhpds),
 };
 
+/* SM7250 RPMH powerdomains */
+static struct rpmhpd *sm7250_rpmhpds[] = {
+	[RPMHPD_CX] = &cx_w_mx_parent,
+	[RPMHPD_CX_AO] = &cx_ao_w_mx_parent,
+	[RPMHPD_EBI] = &ebi,
+	[RPMHPD_GFX] = &gfx,
+	[RPMHPD_LCX] = &lcx,
+	[RPMHPD_LMX] = &lmx,
+	[RPMHPD_MSS] = &mss,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+};
+
+static const struct rpmhpd_desc sm7250_desc = {
+	.rpmhpds = sm7250_rpmhpds,
+	.num_pds = ARRAY_SIZE(sm7250_rpmhpds),
+};
+
 /* SM8150 RPMH powerdomains */
 static struct rpmhpd *sm8150_rpmhpds[] = {
 	[SM8150_CX] = &cx_w_mx_parent,
@@ -910,6 +928,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,sm4450-rpmhpd", .data = &sm4450_desc },
 	{ .compatible = "qcom,sm6350-rpmhpd", .data = &sm6350_desc },
 	{ .compatible = "qcom,sm7150-rpmhpd", .data = &sm7150_desc },
+	{ .compatible = "qcom,sm7250-rpmhpd", .data = &sm7250_desc },
 	{ .compatible = "qcom,sm8150-rpmhpd", .data = &sm8150_desc },
 	{ .compatible = "qcom,sm8250-rpmhpd", .data = &sm8250_desc },
 	{ .compatible = "qcom,sm8350-rpmhpd", .data = &sm8350_desc },
-- 
2.43.0

