Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184163;
	b=r34jSJHVxeFvi1zUEzGYWu1WlfckxPg1VrDG+hUJnDUrfW88TmISLdGzmhU8fdUBnDx0
	 nE9xeqpJ0NeEidcKsYytuv6/LXOITuDk3MjmCmmhrjQAMNlzOcpuRdYmvGSMk0MgwtqlS
	 GnUCXoJkRh0Er9vzxhm6WWnnC/LV1oUZxqtIB3HibaLqX0V7WkR4KwUidR8H2q4z5z5wt
	 m7BrqWD+ITHHT4DO64G7vI9nKN0VU5kgZnihfXYfmbvenkcRgOrHoVgCMrwc9ATvpwEyt
	 Rz+J5oYX0JThNlbkx9AuYlFZyI1W/YoZTyualgIzREduNZ0ZwDKxiedn9mJahoHzA/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=NHrSPALMzImt+5tm2bsGsRXglZXiGAopxrT3fUx6Kz4=;
	b=cecHTyEAKBoE+YTzcXj9+7gfsAjq4NWmbIRDc44VTuONmW7owrwliRVqwzsPZCqO5ERt
	 ujgfFaebrIP7qgJRPwAIYivKfi7/MaLT0dpBB8TN0nE3gUAoBAVmAtIBJYdQrKP5KlOtg
	 E12s2rdPBnPsA71kk9hlz4KqUpcyJL6mxy64d0aunzTeiNYg56WgIk/TfoJRKGDNxIdse
	 YkqsC3Feoyah1HidEB1qSKe4HvADXitlIN2Ho493oq5gGEjdBdlhABSAH9pPn9PTXLgJW
	 SgKuRiGDsTqZ+UPkHpxiPpPwrZbegnbbx4RIzPebBSINSH6VyWA7apI5kF2z/fxXqBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4p4zi10;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00628606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00628606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4p4zi10
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso3321145e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184161; x=1794788961; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHrSPALMzImt+5tm2bsGsRXglZXiGAopxrT3fUx6Kz4=;
        b=d4p4zi10/iZIYiEcew0CxxBGjsSCXKwJz7Wss0Cfi3QIxOJNnQvuBS9HdlIksM/8TA
         0mmD/syfWs+a+UbR4zBmt/bHcu5Jq23y7xhZVY6/giLvcc9+jw1ggQRqVtlWttcH7+eY
         upInWhjp9Xav/kLh3RzPOsX6KRLFfZDtKEc9fypqKcYovOJENTuo01UZ2pqdRkzQSb8J
         ahXIJpkpsnAGD3XJ4TS2bkwaBZQbrBqoDUQhHEPI8QmIMbcS0cnDAYPI5GO4LXfjisds
         6iQbLLjn4kNBelJDM+MBhmxKZATTsynfheAsCwk0EBnK37RVCfaTG1keRkIlCn0JyIkr
         UrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184161; x=1794788961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NHrSPALMzImt+5tm2bsGsRXglZXiGAopxrT3fUx6Kz4=;
        b=XgKGmgOvsrriwaUpGKAAnW/SOLp0MOPMPglU2L2xdgPbNHUPHrUyvmDZyJXUYNLbUg
         u6R7SwCsfel1XMi0+MpkSYD2ArZ1hFt75O7yjYOT96h9w8Gf2Rewcqfujoe1MimjMmjl
         PSgR50n/CESKRn/eB5aW5k4v/NQ96q9HKVdeLGcVd3a3UY2nJrAJ3eljpyLQ+wacKJCj
         qIGxV8eQyMFv9J85GufNmiB8jH7sPqJJ3SoF6rxRi4T17Gr1aJ8r5fpJE58UvDHLvHdJ
         vQoTyHRftuYGlR//XgjWWvN/Wd+HU9QodQt18xzWW6Ji/7ZVd+CI64wu/PrryNFLYQB4
         kJCw==
X-Forwarded-Encrypted: i=1; AL+hErEqYpQuzFrlx3P3+k/ab3IopRMTKWO+bAVxh7USusHQIFb0yl7aehDRlIOCjH4WfDnF6mxTKXUhQUZN18s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/md/dBP3rebTVcXobvCL2/l5rHlS6jD8tK/audwQLxhsg1HCD2
	qzPfxCF+5LB87kPss0OXSHepyTb89e+UqzVPaSFgzTKdkJShRt6N1B4n
X-Gm-Gg: AYBFou2Y3dfwEPWJZoIJEx9cOdphHxDXQV1dUxsrRup4VxQjrSqFJUoHKxLjiJaFxlh
	efGph8KNvCtqNKBIKAu2zsw642S4QZIoNH+tudM7WdHTa7DqhKokDRikesbgrf64rBQRdzi2ITZ
	ZbIY4gUFPNOOloKmoiPThAB2QiXwHm9yPHBNh9zy/uvHjtuqm4S8Za9vPBsmgfU2uh8+108xeAn
	quuds7tD9bFeB6xT3qK5oOQHp12nDUMabY3wuHCMTJlZdX3jszBaLGV141MiPRIRwdczMAAFfoW
	3WStL5XctrqXDVcTFNliy2RH4mKzCjgwgEZ7qKhO3ZHPcupdO/x4iyuzg2xJCYihLsNJg3/SwWf
	CQluQsfSZ0uAY/7iIsAnu7DZXabkZkpUxSw5RAfotuOloBQyKG/D2woN6dhe1xpIhpp4yHhKo0k
	vN7dbbv/ci7vxkTN7jU0jK3tiS0cKdMWSrZFTS+GWvMWV9/WYr44X08DqswuuLDfng3tyEehtBd
	xfu5KIACq0NPj4XiVF4f4iZkXNhWI5H//itkM4hdF/befRxyeydDtL80WijEtfLBogusMSv+BYr
	WBmG5UL+2Y6qN1fwLUoGyCx2oFyEO+I0ZAYamu27
X-Received: by 2002:a05:600c:6087:b0:4a1:9663:7633 with SMTP id 5b1f17b1804b1-4b963c6cfc2mr45624795e9.11.1794184161384;
        Sun, 08 Nov 2026 16:29:21 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee1de2esm91295785e9.5.2026.11.08.16.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:29:19 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:29:11 +0000
Subject: [PATCH 2/5] clk: qcom: rpmh: Add support for RPMh clocks on
 Halliday
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-clk-v1-2-20c3ba8be0bd@gmail.com>
References: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
In-Reply-To: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184152; l=2646;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=aIHEkyuQRMwtS4nF1/vAJgKiqPllrSNgBuEOLsM+WjU=;
 b=4GhFqGxLWBNf/FL/i4sGiZ+95EhdglFfY+0zGtEjtd6bCBnqe5FwKRv6g1GpcjOv1EoIDLwKm
 HLuC9tzQhEzB6kg5r8jpJ4YsbKyhUroOwn4a91d9Gwh48Vq+NbHDb+P
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the RPMh clocks on the Qualcomm Halliday SoC as Qualcomm's
downstream clk-rpmh driver describes them: XO (divided by 4), RF_CLK1,
IPA, and the clka7, clka8 and clka9 resources (downstream LN_BB_CLK7-9).
As on the other SoCs with clkaN resources, clkaN is LN_BB_CLK(N - 5),
so these are LN_BB_CLK2-4.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/clk/qcom/clk-rpmh.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 68640e5904a6..fc16111c890b 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -383,8 +383,10 @@ DEFINE_CLK_RPMH_VRM(clk5, _a2, "clka5", 2);
 DEFINE_CLK_RPMH_VRM(clk6, _a2, "clka6", 2);
 DEFINE_CLK_RPMH_VRM(clk7, _a2, "clka7", 2);
 DEFINE_CLK_RPMH_VRM(clk8, _a2, "clka8", 2);
+DEFINE_CLK_RPMH_VRM(clk9, _a2, "clka9", 2);
 
 DEFINE_CLK_RPMH_VRM(clk7, _a4, "clka7", 4);
+DEFINE_CLK_RPMH_VRM(clk8, _a4, "clka8", 4);
 
 DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
 
@@ -413,6 +415,25 @@ DEFINE_CLK_RPMH_BCM(ipa, "IP0");
 DEFINE_CLK_RPMH_BCM(pka, "PKA0");
 DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
 
+static struct clk_hw *halliday_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div4_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a4.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a4_ao.hw,
+	[RPMH_LN_BB_CLK4]	= &clk_rpmh_clk9_a2.hw,
+	[RPMH_LN_BB_CLK4_A]	= &clk_rpmh_clk9_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_clk1_a1.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_clk1_a1_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_halliday = {
+	.clks = halliday_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(halliday_rpmh_clocks),
+};
+
 static struct clk_hw *sar2130p_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div1.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div1_ao.hw,
@@ -1137,6 +1158,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
+	{ .compatible = "qcom,halliday-rpmh-clk", .data = &clk_rpmh_halliday},
 	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,kuno-rpmh-clk", .data = &clk_rpmh_kuno},

-- 
2.55.0

