Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A2D47ACD3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254796; cv=none; b=ObpAuR0CoS8uDTNDKXBja1P6Epog3MvgyYv8cE4cVzkRlquFn67gpU5pjLtmXNJTW0+NSm66NZI5RQ/xAyw83ytG3DRt9DJkiNoKgGiMk8E07/NL4l6U1EVn3tpcgBKmf0noSku6RK2ikboEeshrM9JN3AD6s+WxA8Gok1kC3dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254796; c=relaxed/simple;
	bh=+m7WxzhF7QuTKjSt0vk6t6LsZP/6AIR8o4P2rlZl1RE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dIy6s371MmK3b+KRMBLf6KfUCKrnxGkV/eYh7u45qUt+Nh63arTcyDSfcLYqtnobPG3k5Vgn85sXXl3Pbqj/6xR591V9mCDMYa0xPLCR2V7XxKKWufoXCv9k5F+QaBbSkhKpE7FfRzRxra8W7iWiZ5Y4oF2tzaX5JIX8rsZzHYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eT0fKfCO; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eT0fKfCO"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so6247169a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254793; x=1788859593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khMXXSisMw9dgBq90MQcu6P4BUMmcXEpcjfAoZEh/Pw=;
        b=eT0fKfCOXSn9IEcANvNS9ndZyCyuxaAS1IFXOLtORxQGtjmonf841KWUpIIpdDEKV/
         u0Lj4UC880YnlIBe1oFxjhjMjpP0YbQTvhboZnY6TYziQa2lBcuICvVdTqDWH6jUTVVJ
         qbrFHcMnHwKbGIAKt7PgzBNMdup6UrfD8gtX0R6wMKdC+ShNRa2lgEoZwGD8DKPfhwf7
         hBhxqR/PKvAWWPo3//cNkFu544p8m3s7CdAnQnRZusRFmxAV7DIZaqaZsAzXLJTiWf/L
         KU6c5EryAmwsiKRIAlFVJnwJkbAIUtatysj/rNri7bMgoki8na0yNvYvOQ/cNsu4ZMIr
         G1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254793; x=1788859593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khMXXSisMw9dgBq90MQcu6P4BUMmcXEpcjfAoZEh/Pw=;
        b=s/uivAIszRKFehEaXBC2353qNMOp05H5LG0ZjlKVkuk65/WekK2dq/2tYOlaL2+JRM
         lTqbxso2jR+4XnnnZdmXexacHqeNNzX2HTfflCW3aD35OQWuMETD+zLyAhruE7efS1FG
         VbnMVspsqBHtASEkTcB7NHVSJaYJ3ogte19CgtbNVEnYvTDqSl9+8hb8IuLUw89if1za
         oWsN/Op5Ew36M60I5rekELiOv0uXoYtr8iULmkSie0ostL7flE2AKlxWOF21Qp8jGW0m
         4+bYp5HjG472ApCX1KKopUrhhRvN32mr3dvPqeaDwv8B+ze1eb34a9tm6ar+SF/4e4wg
         PQZA==
X-Forwarded-Encrypted: i=1; AKwUvBwlD2wNkZDRUSHlK/jqpER6Rw7uhLCxzVf5y7uzPT1dfjl6E3EZroKToGEmV8l+K7l0xxUE4NGUz0G+SR0=@vger.kernel.org
X-Gm-Message-State: AFuF++mg3SdPRqqH161kdMlbwyHdXkMkLRMQGh5fAWNIyaNIjvrgv/ex
	CvU5Neif0QC20z3jftIFAxS00BXS6oJmJr8pdBBlWpdGfs4jDoOdcMd1
X-Gm-Gg: AYBFou2ZtBrHbSatJ9SHV2AJGXwgIKwvuhYIpcBDV8ROlrb17KZfktuDBHaQytMBPAV
	ZfqhKO4DQCgD/ZcdfytBcO07/Ire8YYtW8bdM08N4ltKbOU1vIMRhGs8krItS7CGagJ8WtOrPZz
	NI+kuItgW796B8gETDZ24/vPFmp/ZAh7B8qnJ1v3s0uDr1nV9UicAUBrbUef9I98iSxyvLHIEzO
	A5i1jQO6JbnmILNfbI10sef2MG1eRfyusxKlO9vDWS3h16jdB46Vu1m34aS3V7vJhOb/MqL0sBa
	BBB0lwm5Pa4MpbvMnEXfXM9hcsT9cuLIXEaKJgT5IbUeSX7XmMHlMwZi/RlIrzcMEPgS7rWTBTh
	8aNxYRe3aaLWDTkM5JJU7IrroZvjOdTUzhJ8LJAgXp9WSeYPTi96v5XmfD///GFgLzK2TBJscug
	KgELCnYNgrXk/42yELrjiHkxBJx8fq8wfDPHNr5ycdCJLkHLBeNGFcuxc5DExYG68MbYdHAOFEl
	x1ZVXfN1c8/
X-Received: by 2002:a17:90b:3904:b0:398:bc52:825b with SMTP id 98e67ed59e1d1-39907e82897mr9143773a91.21.1788254792747;
        Tue, 01 Sep 2026 02:26:32 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:26:32 -0700 (PDT)
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
Subject: [PATCH v9 08/12] pmdomain: qcom: rpmhpd: Add RPMh power domains for SM7250
Date: Tue,  1 Sep 2026 09:24:43 +0000
Message-ID: <20260901092447.3028-9-sreeshankar0910@gmail.com>
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

