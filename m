Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793527445;
	b=mFmU0z8EPSz/qs/cMmPheOHfqafKKMnLdqFLFKwIQPTNQgt4aSvUPoEWhGryX8L+lRW5
	 1drL8Fddrd7R829TJEUHF3hnPzmJOx+0OBjdr8vAGuhU8tdAU7c7qzjDdGadHigEvmJNJ
	 +WWsi+8LOMRFDl+CVPZaPUzZ60P0G2fHdZBm5bFgIDXgSEcU1JrFCVWEz81HakmBruEOP
	 cEbXGEMiygIDJcXCY48q1w8NA1w39WvtJ4qU9WqMSKNMFNNPYKXtJ7xn7n853p4GHY7z2
	 oxg15TrbrIx1L11mquwjVHqDLZBrKo7zR3oDt+OWvRt11xCfaTEm+F5BxjxQb+yiZcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793527445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lZQ8rHpkkfpRhUYETvPsbxBlPx9cvrEfEZIYciSVKHU=;
	b=LE3CXRLxHeIO5zORm8TM6Xo/PNtscmjiSPwCUqZ68kJbXatMULAdnqeiayEhPVXpZlK+
	 Ii9LHvIyzdEkPBrbRQ0G8Y3mzFamB/VLwL2GhoaaliNRmkSw4Ok2AOxYMTZyY7LMo39CK
	 6k9kG5xQJ6Bm8WVOonanseBn9EMToH3AEd3u+Gv56RXlca/Y3oNJMRtCfAR6hDEDXXFT2
	 z9GLFYSPPJ0OkA7GgTt8fn4kcwZHlAmRjGu+nDZDPC6gYobW24T1JUO1dE1QK22kfJQgm
	 8JQxz1QaApAksTmjAahXyjfTMZq1rXABDgdk60l1OoTldo+NNmKMu4X31Yp49yW2QWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TLOkA644;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47563606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47563606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TLOkA644
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-369f33df08eso4194936eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 02:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793527444; x=1794132244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lZQ8rHpkkfpRhUYETvPsbxBlPx9cvrEfEZIYciSVKHU=;
        b=TLOkA644h9HfpGw/SGS0NewdQGdEbuAjgwC6StfxYuB2bPe3WZ+EYXFOt4aEtJaIrh
         BBq3fFtIm8e++mbwBzQ+fZSH22eTonM421VOxPrOpBbgCOOHE107pqLSy+czZBRMeUq4
         TpaS5zs/fUFbM0nBc97gfHaxmVgwOLcU1oz5xqT38TmNJYGyOsXSVJ5cXNjXi3V6YOXx
         DYuOuWLmVqnDSDy3mmMs+r3Jb6DZf43fcoaGuMWC1kO6OMB9xrJSZzUqjr899avlFJ5u
         hJD0aVMe6ZKzT5fBN8mQVWpvK0b7/89Bv3F3T9pNqcD5e5KjqHhwt4I4ukZINp2YetK4
         bbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793527444; x=1794132244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZQ8rHpkkfpRhUYETvPsbxBlPx9cvrEfEZIYciSVKHU=;
        b=WHdlahmnDGLu43y1A39DtdofPCXytA73WyKsOpiAzAwWZ81v6LgjsJCWNbhT//LolN
         7gh4rqJ7X/MAfH2r608KZS2bvaplH/mWDJV9Gbtg6U2CZcItgmrpaySSFh0Nj/SzdaiI
         OcT8tD1soJIGtjjgClJCRY4/tfVVxWofEhF9msJg0fymxuO4YVdKn/6YwmrizffZkU1d
         oA25+byeTaoPicE/WGMBUmSbLAm88S7d0xNyGI0DoBJrPhhxEMrI7OkMpij9rUUYumC6
         0Podo0iqhIT6aqqMAzMpgxYPLbx+HpMnxxl/Q1hxhFKdAt67i8C9gmKk45/xc5LDjvyY
         40Ew==
X-Forwarded-Encrypted: i=1; AKwUvBw20R3B0vZusMs3VFTr+gTTsZEeK2cC76JEdF9M2qLXATBPxdjWpBuYAilO6W5FXzpxVt8dC0/fl+U3NCU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/7SdTYPZrk1eb7HvgcLNh1pQyLMHJ/0azwYcokBWh3vCu+Xug
	ZlROXZXli9NENKYZRmmlbMrgENWrLFG5jlNUt5u3UYvYi3i+nsNxvtgL
X-Gm-Gg: AYBFou0dW3Om4HBSOfdWPWbh3aI4Ic/9JpZwoJU01C9/oGLjqJy4MB7WPviOwXO8xrg
	7wAsNWjJ/zp4Tk+O4B0A+sJeFaBnPcOhRaDh5afHwMwrzSzcpp/4ss5Vq6QUDB0w7gxd1QWqEWx
	PlSgtXUFObJ2DQaj5cSwBeDbeDAtAEWsbDXm0/Ktp6et16VOSCg8G/YmjkT55J5oA1GuDrEHZMr
	sIpIkwYCBt+uYOdLe5W3fBTI9DcdAM0ztQR0EtuaDC05Lu9MlsZlXNuPluK+EmHgMhezsyadHsF
	yfOUKLRSeUXRrsmD8U63hQ/+9Ovn/r5PjFAvVbtTO8UZ7q7gYfqmH/ad5BqDleiYhrKv3S4ox7r
	mMOj37FCLYdiZheRXD5cJP+OYFtb1WNIBvhJXCnesnlu6GWyBO/+fpaV+Wrt+5fr4Tx0ycriiUU
	pewSldNKqLIsEndTfgAXB0JMFCFigtZwbf3ZW6N2FK56n9lJ5OPL+fNPjrjMlUHkudfCMH2z4o6
	aO/Ge9jTDB8AR9r3JET3J/aXFT9m/kAJE3gaLxs97nZlRQivrkuXEaVJ6oGTdSNjPRrUNlzP1SB
	LtEbgqKirzv8kN6RD3e1tZRg/LGjIen7QqZgNBhmixC7ThdapPkxGTuFL1OYUgsCcFuJ2x/5xr/
	mFEWLzuFjeABJAyUOQf4/vpwE+eweaSZrrNqCbfI2BKsh9q1c2bkzrfc8WYv47mV7CCg+poXJdF
	IcRfwZ
X-Received: by 2002:a05:701b:4511:10b0:160:6a5b:7edf with SMTP id a92af1059eb24-1ac5fd0852amr9931498c88.44.1793527444190;
        Sun, 01 Nov 2026 02:04:04 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.. ([2402:a00:163:3509:1f2e:5705:c23f:b6fa])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac194b5437sm26302562c88.13.2026.11.01.02.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:04:03 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function
Date: Sun,  1 Nov 2026 15:30:30 +0530
Message-Id: <20261101100030.15744-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
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

LPASS LPI gpio5 can mux EXT_MCLK1_C, but that function slot is left
unnamed, so a device tree cannot select it. SC8280XP already names the
same slot ext_mclk1_c.

Name the slot on SC7280 and assign it to gpio5. The third slot stays
empty; on SC8280XP it is qua_mi2s_data.

This file also provides the SM8350 LPASS LPI driver, which uses the
same pin table, so the function becomes available on SM8350 as well.

Tested on the Vicharak Axon Mini (QCS6490): selecting this mux slot
drives the codec master clock, and ES8388 playback and headset capture
work. Not tested on SM8350.

Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index a61df10d4..278d5fac8 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -34,6 +34,7 @@ enum lpass_lpi_functions {
 	LPI_MUX_swr_tx_data,
 	LPI_MUX_wsa_swr_clk,
 	LPI_MUX_wsa_swr_data,
+	LPI_MUX_ext_mclk1_c,
 	LPI_MUX_gpio,
 	LPI_MUX__,
 };
@@ -77,6 +78,7 @@ static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
 static const char * const wsa_swr_clk_groups[] = { "gpio10" };
 static const char * const wsa_swr_data_groups[] = { "gpio11" };
 static const char * const i2s2_data_groups[] = { "gpio12", "gpio13" };
+static const char * const ext_mclk1_c_groups[] = { "gpio5" };
 
 static const struct lpi_pingroup sc7280_groups[] = {
 	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
@@ -84,7 +86,7 @@ static const struct lpi_pingroup sc7280_groups[] = {
 	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
 	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
 	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
-	LPI_PINGROUP(5, 12, swr_rx_data, _, _, _),
+	LPI_PINGROUP(5, 12, swr_rx_data, ext_mclk1_c, _, _),
 	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
 	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
 	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
@@ -118,6 +120,7 @@ static const struct lpi_function sc7280_functions[] = {
 	LPI_FUNCTION(swr_tx_data),
 	LPI_FUNCTION(wsa_swr_clk),
 	LPI_FUNCTION(wsa_swr_data),
+	LPI_FUNCTION(ext_mclk1_c),
 };
 
 static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {

base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
-- 
2.34.1

