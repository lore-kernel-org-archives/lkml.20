Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864276;
	b=liezXbcJX2lx0Uiahwe1yH1rFlnNsWNzUYdgQn6nEOiypOR5oPJMd3kQr8uMFGzSKzkZ
	 53N4CANFfuBdBp7mVlFlvL2eMXD8BEkgqOMS4Xc/WjDsvgJXopNvmIHOWLITYFmmIuONa
	 Ct/VC729/vqBYeWB6SeHcYK9ah/4EJxVCzV5mv82i1QNwXeYz1RFuiN6KElauwNmehr9d
	 BrGb5rBQAfS5Z21jNoMpKpGZEDT+QpCfZ+LKGipAWO7TCpEzjrTRgITqds87D++tGe/jW
	 qYcrL5MpMKiAWH9woFvkESQxN9Y5B8B3zhtCWITd8uvetcCUsC6DE681biwlP2eUj+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=epa5IEYHWsJY0JP+N5Pv5GwJ4u2FQrHZJPZPWohLYF0=;
	b=oZD7Wyk0CL2hYww2K6r7YOo4Y76eT1LooSnip9MkyLvWF0hOqeC/5UKB1rDYKSUbWXs7
	 84D/1ag4nqJFC7+gn8zjtw/Di3dUPstmxDFzlu+hRcASACWF3fh2YK5SBBpFWxZ/tR5/I
	 9iFsVFkMCxk1qLMpquMD1R4BHV2fV917tZG8DLUNEiXuCh5KXUrZ14l+cwBE/CTVexxNf
	 6ZuLTaf0KU4D+n7eL67wkgHsXOjfsNc0gbn0zL0YLd7rAa69fkIgZ7snyNhuhM9YTTvGF
	 fxcHO16Ili3JH9+O4KqCwyFPUP4ncO9BkCKZUQB6+7VwLy/iAAUK9JM2NyJDQ8E1Vjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Od1ucjYW;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F6D606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86F6D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Od1ucjYW
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b467581b98so35081495e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864275; x=1795469075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epa5IEYHWsJY0JP+N5Pv5GwJ4u2FQrHZJPZPWohLYF0=;
        b=Od1ucjYW5+qo18N3MM7tj2tZJWbDbHoeDSC6n7RJJfhjGadMeF8CK/OtTTRTbmdOzg
         czkjQ0DDeF5ejXEOM6wavWUGEHsj3WGnuGzGZaQHHuXuPE5vs8JlRKJV9pMQdA/LfsTO
         MzolRipICdeDX5L5gI1XQYDuUmExZPRd7PhJQ2B4wDaF1bQd38X2RzSSjAcIRCUE9nC6
         tbonHuu5CHVGNPnGgV07WEjRxQHMzSj89oWEKwuU5IMUQJOLwDHZrykEBOZEyonz+XWA
         YPC3a1WFA0T4uVPn2YvhhovLYqGBXQQO55mKDincZxpwOAesppKhPEtZZC//T+Z/Qex4
         zVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864275; x=1795469075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epa5IEYHWsJY0JP+N5Pv5GwJ4u2FQrHZJPZPWohLYF0=;
        b=cdWeaTmR6QZD06QmWQFYykAZQVjeLeV48zZl0BjsKzIcXDaRoXjHeAxyXQ8VK84BUo
         GuSno15R3NRbC3XirMxztkYNW5tSdINAZWAmubtREbCct0xSg2LutkT+MxuG8ZktXt2o
         3fuGmuPGVcWVuhkY3Umk/aI7F2JR5Vplw/sjMxzdqyosF4bNeuAE5JSP9BaFUbjBpCyv
         69A+/cnAyS070BJUTy2ebyIFKVUZUH5IVbrVlBWNWGfH72zQC6BOzqYmkf+wRP4hwHCK
         yUEjnqzUno0LpkwsGumPVJRhxrIJAVp5faZtH8nUwhQwhwMyYsjyUSm3smSMSCvdA7Og
         W9lg==
X-Forwarded-Encrypted: i=1; AL+hErFsEEh3r2izaq6j5fcENoNViZOm+eQ2zL/s63KiRwdY+qumiZYGxp+77wVdjFabhe1Se8llzGj5GO3zkDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OLVPHnbK1rhq+uQO9bJeKCIU1MASZhtKdPfV1M/FUCJX6i9N1
	03WcDMQ7gkVyD0R43Ia3A4jFMYsX+GMwsUYHA+RvYJr4PxvK4hdOZBfL
X-Gm-Gg: AYBFou0PzuYK+kc60bkPCSNfQAkCLpNJJol+sThD2+mWFF9ee37ffFX/h9LxkHHnEcE
	DRlMMPW2jnm5SnoBSTfHutmnMJtqvnayP3F2XuZt4/1Gjjn7ThKEJ36lDhI/0AaArLSFm9TC9VE
	P0E3lwwdFY53HtIc0FPJPCQHHOqVpt4T2/7swMjJ6fnXO0ao+jnmfaBrUnRPvKeG64o0lJgsmpt
	xYpmHpSVz7YTHSW24KENS8R2IMgKrOMmsH65/dfnS22p1avr72tgIlWcFS3bn3iYrICsi6R+7B0
	CPtFKKie0hgvtgv2Gb0w/0S2AfjnDpuIoJbRUMJ1ioCaFehlN/F+PZhdJsPN+swMD4jFfSvTuvE
	U0u8CvBPJE9mNZL8pYuHe1i0O6XCGgL/+b47vk9M4VbGCQp/m7zXD11/3TAvctXF46BMloVo141
	tb/ArngcZRCkl8H4JmgLukuZoy3BA4EWh23DlNLUMR1MVvW2sh8PcOuOcOupBQRzswkT/xxXil0
	qPqNrVHapYWJt+irifN9jW1ddAF9P5YiLLhTRVWqvwT32YLLPjb6lKirdQ8oxh81ltk3Qb9zVtd
	kbe0dMPmxX2dbq89E+HjEU6K0vDoFCy9fceLSSI0
X-Received: by 2002:a05:600c:a00d:b0:4bb:6842:66ef with SMTP id 5b1f17b1804b1-4bb6842670dmr161939845e9.30.1794864275018;
        Mon, 16 Nov 2026 13:24:35 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a2f61c0989sm2414728f8f.48.2026.11.16.13.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:24:34 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:24:20 +0000
Subject: [PATCH v2 2/5] clk: qcom: rpmh: Add support for RPMh clocks on
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
Message-Id: <20261116-halliday-clk-v2-2-28208928da36@gmail.com>
References: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
In-Reply-To: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
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
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864262; l=2699;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=CYr23Vm5en0po39j5T9TwtOypnqgRXjF+/zxbnKqVkQ=;
 b=jU+Icb+XKUsl1PdEnDqpsU516pvV/uHmpga47T91CddUo+hWwy0HlEfA26EvDbT8sy281LIhR
 N3gBzhJTooQCxaVpb46KL9nlPB/CIWU0ZDsQkXyWty7fJhtvXb6Vpus
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the RPMh clocks on the Qualcomm Halliday SoC as Qualcomm's
downstream clk-rpmh driver describes them: XO (divided by 4), RF_CLK1,
IPA, and the clka7, clka8 and clka9 resources (downstream LN_BB_CLK7-9).
As on the other SoCs with clkaN resources, clkaN is LN_BB_CLK(N - 5),
so these are LN_BB_CLK2-4.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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

