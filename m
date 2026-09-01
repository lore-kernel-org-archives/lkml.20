Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28C436197E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245149; cv=none; b=rpfK2a+lD/Wohgx8DjBh0fo5brPMKZBFZmlcE2kxVJxrTSlCHNfptFm904Ud41lZcomhysw3zk2RlEX3HA7WG4ERxIVzkInkwY5q/vv0gzy3aRqqMg8jUNYlvauCm/TzoQ1j3Y0mVLuMh/lgNbVEPzzK7MrEiw9gkbJ4aLAjd54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245149; c=relaxed/simple;
	bh=+m7WxzhF7QuTKjSt0vk6t6LsZP/6AIR8o4P2rlZl1RE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=auKdHEmvXQ8w9iWmxCHjmJRKmQj9oerlLnyzaXVc0I2P6sF5VinKkFc9jJVWBOe1ZDghsn0UGXw1WK+x2JqE9d6YyzAjHaMzORyZb6jU1Og0VjYXmA54afzmt7IDPGoTUni2HFAyUkY7WJWFEWNHgP+g/b4OdoUbWL7aXn6vQO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YW7XGdJr; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YW7XGdJr"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ceab75934dso51952325ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788245146; x=1788849946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khMXXSisMw9dgBq90MQcu6P4BUMmcXEpcjfAoZEh/Pw=;
        b=YW7XGdJrWue0aP7YPlU3mC7+P0irtXgIMx8V5fuX+2/BFN+R3q84SZtD5xOF39xeYO
         2S/7SyhkJFwxTFiiax694wF8kfVtezk/ZpdMA9iAYzuAdW1J98vFpQ4/Nl8mDKf56WGS
         UV1y9/dsKGdReVNcoZUrPvhLdAxwN55/fvulQgOMNXzJH2wlLI2pg3hWsnwV0bqn4k1K
         wWsPzp5VW3NKdT+bqbD8KKnJCPQ4JC8rDQDsO8s3nK/od+Km5aqRptJVnTE/pJB1IaCc
         0B0yB8ZPPky1mVJkPhZFgxuty9FCGpEP5zAVd0FQi9uVoGTXZnY+dgR9JXlV46Esv2V6
         8sLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245146; x=1788849946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khMXXSisMw9dgBq90MQcu6P4BUMmcXEpcjfAoZEh/Pw=;
        b=hM5jOox+PlbYAwcoKw/C8ibzqZleGfcLM8k92+d+HuMSw0eLv0uOkCBit3OMWx8VL9
         3i36Z5/DI2ABn/5NUNtm2zaguRqWY+/jUC1x5qYh33s/5prpUWP6UjmXslihrYk3bW48
         ZRjbXYCTIQMu6ijrXe0/m0zuG9V1x91RgQYgKoTWl7DnKGrLMUqJ4l5m5Sv8cSz+8Z2a
         JlLiVGnkJBAaxt+y2YqIyxtIe35HgGDDn8oiXSuslHJC3iZv1rT/95Tso3UbeMNcJGR/
         gDQSI0OZ9Ec+NKx7/v/4l5d0VlICTrOF3tJ1PRVSdDA8qOLHpDGEmPA6i7Hn0Zi2moaG
         Adtw==
X-Forwarded-Encrypted: i=1; AHgh+RogaLWqUpGcLPwr5e0dHCivuwiHiz/rI2Yaem0sdbrML2AzZfj0mDvecRtPnqfuGDEaWNrhERW/eH3HPXY=@vger.kernel.org
X-Gm-Message-State: AFuF++n+VZi2Ykbz3akVEXcj2b+uJuJOqhk8xV+f0fL7NrycrZn71sNI
	bNKcxmals57ngyiH8krcrA8Ly8uZ9+CU/BaHLkom2MXSWeBPvSuqD5Kq
X-Gm-Gg: AR+sD10A2JVVaWEDIP+fJUhq5ddRnKZ6+f2gsncA0ze1lmTIJZAtOHHrOsEbEGNhq/j
	U2EIPgXfaTjJdOHQnKqxbA8h9J3p29BT+72s3kd2rt3v3iJsuL1B03c6tFq0aVMRkgGTU84yMR7
	a3NAoe12RUfxSmWcqTYBlq3ckNoOdTnLIg4HJ0mq73q0hMxSMa1dtO6w2cbcpR6zLgy9Ycv6erF
	WEukRU8dB/oFuJvu7kZ3CByCdUhzejtL2WZnF/cAEN14CalTlUIM0qv4DMUt39cuaL06KqhvSgW
	VvhQmJM/0CgKlIu1eRO3N4oG69QEMf1XgO3kbdOaioyuHlE6wHex6saCB02sfaFlLgQB+/gbeDp
	wMbk1OGx0u8YloV4qcA32nmR1oBsBS9OeE8meYGLxJSCUarFKBBl9YjwqR1yaDArHSpu8copC0S
	430b1sWRByt+SAwLuSlOBTi2oyoaqPRltp7/XzO6AOYyBrzU9k73GiY8uZZK6lbl2NwOnEEfuP4
	47BphUGJYoP
X-Received: by 2002:a17:902:d545:b0:2d9:68b7:c324 with SMTP id d9443c01a7336-2d968b7c512mr7589595ad.3.1788245145721;
        Mon, 31 Aug 2026 23:45:45 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b944bsm37019784eec.27.2026.08.31.23.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:45:44 -0700 (PDT)
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
Subject: [PATCH v7 08/12] pmdomain: qcom: rpmhpd: Add RPMh power domains for SM7250
Date: Tue,  1 Sep 2026 06:43:53 +0000
Message-ID: <20260901064357.20055-9-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901064357.20055-1-sreeshankar0910@gmail.com>
References: <20260901064357.20055-1-sreeshankar0910@gmail.com>
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

