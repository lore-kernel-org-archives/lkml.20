Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764606;
	b=em/kz6m5XvBzKmb0mqRS+rGJW4BvfOg/A0+ERpX0qxju65f42wgutgrjvL68F7O2Xvs0
	 H3VnJqr5rcy8iipaQKxDbCoCEP7IP23dVLz+t8TPw+kW5Vqr8HKwgtdf5bQ1dxNEWf3bc
	 SXYAibiktvVREpUyMHf6lbZ3JSfzrktr+kXVwEUyC21S6Gstondwu225lAC5/lYYclPJ/
	 g60cUrwMzc722uG5CgCaDj0FwayA/VjfIlGZXk0dadQMiMmNVAWPM4i+yPUos7HhgTFBU
	 9teJ0Yvu7gM5lfnfk+etl1U+L2D24r4iDyB55GT8h6mgCw+W7yZI+HLu+haBdjrUy5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eB3a/6b3wofIV5PVq3fo6B4mlRfJKc3ivia26nSP8Gg=;
	b=bC75tBRSXKDqSHqaPU4hFu2j99SX/kjZ3X8wwhISIUo8jOxktwHmRyjOIEdyjnQaZmUi
	 uSbOuxCk25pbMQ4qZ2BJAayLda6ZXQj9Fc0aWnPeh5HqhlQXzAxBRCTn4NxAIQgoYEhlk
	 tF8/7YTbN+nvj7SFnv5xc9wb8hHCDY4jgZ77N648bU9mhvCBu4wHbsSTmz89uUoxYOfG0
	 eTl0q8KmfwzMWiozrT2p9Xu5sHt0M3HsJpEyvN4oC9EuvF52Omqep/Yvyl0Do93XTNmBj
	 bw0I7GUjBu3Vi6wJeriXLKC9N30qGbaes9JcQ2Z+yAYcx9K2Z2eWeMSLLDeAVeozZbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fBe7A8yb;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1D0606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE1D0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fBe7A8yb
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37071c0f42aso3963132eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794764605; x=1795369405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eB3a/6b3wofIV5PVq3fo6B4mlRfJKc3ivia26nSP8Gg=;
        b=fBe7A8ybKmjdDCAZUf1AwgF4q44d/nheQLu/32nrMbMxbngZAUVuSOqxpLKUTYn5Oh
         U4cfAd+4MTTOjCcl37kmirwnd2oZvvZSPRKpBA5l+f8LHHOAB+eT6CFzVeZBR1rwjGvQ
         SCX2ed0LFNy8/6yjRAH+yeryFFgztze2AL79p936zIEXvRT258hK1+3bOQrKxOkXVBjN
         Q7rOPdW7gjmNgYKpBFe0uVELjgllFL39L97cOrAyFKrmC5+NceUl4ZHAdw+PwsPuOLcj
         L3B+/tEUw36iVhkWHXiPfY+SQFXOTGQhc3qrp6VCg1NJzZ9Z43pxuZdahJK6z+3PLoja
         cDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794764605; x=1795369405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eB3a/6b3wofIV5PVq3fo6B4mlRfJKc3ivia26nSP8Gg=;
        b=C56c2kCL7JmzMl9O1rDt77WEYEz9cOlS01BdTniYotmkzXpEBKaKug4imN0aryAXw3
         DTI6WQu7SncKJaIbHXOzXqwal49+qFxabIJ4pIfRa9rPtIIRZY160oHQ67agI2owGKIR
         rqOuwG9IWOBAyFiik8Z5C5u2zvFKRnKXf0PFACmCzSasCMblOnfGpF0BqjJLB9OXSKjg
         an0aK/NN/OLUUMsLkZq5dq8aFglHFrsMkuwydyxyzzwMuSVM4oFiJL2t6q1JEqvfxAS8
         nCxcUhtGmlKYylAhhSGB3DPmy3HyZXMCI8zvKGIcE6LP0krreXYpXZe8fQeGTuZOAQwm
         ZIIw==
X-Forwarded-Encrypted: i=1; AL+hErHZws1OFJTRhvxkosX0m7lmkqw0kWMA7kEWkEVVIWCfc2LIy6y7kI/0uaowheNbKoCur5FRwCyfMV41jpU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PUl05ZeIGWZ61HrETlsm12dnYdIePC46CQobOfZ06Xwa2VIT2
	obPAOqLG1znHjRxoKM5L7YTDK+WkfkkGKXJEuvJ9Kk43/Q0b9+WzQjW2
X-Gm-Gg: AYBFou315lrt73T46dBE49/irw7uhjk+E9yVlcJY4PSa2gk+AqXNVW1YVCMwjTq1uCF
	pp40G0WLGbE/gMEwslFy7nquJYQdSNOntTo0dAtDCd0OleJerJODIReRe5e8/F+KbQXJIqVMvtx
	dpTsNobfiBrXxVJTHpoXd/J+mL2mCHEhhTGwtIrh+QEOzI0G5OVT09Wo5q8tCvK3+SZ1OOQFC9i
	ekNfytA4IBrwc1j+1d5DwGZKR50xSa5GDL24ZLiQzxR05Q8nX2njMsC2ZEl0KDF0umkFK+aRFgg
	ymMkUJnRlWpkJe9xmpMWuj08FLI7HbGrabGv9L5jwaNUVD4VVtl/9ZbiqUW9fLDSDauXTNhsu/v
	PitDv4amiecMi6Fodgc4tSSFToG1tBGxzb1+R4vn9+9j5W01FmgCqhwOwYlgPlJxew8INd3BiWq
	pOyQgPVRXLJ7kBbsb0fXpt11GLW2WXDGItx1Dmrdx0/0ch+85SDRb/jpkcDBzYLlV+e9atXm6Cl
	Y4Zztttq1s2TAqH2DCPhA46UR78gdFtrYIqMjeIqgTcssFY47BgnjBwTo+2xGrWKmX2RNAFnTCO
	CSwmpOT99sXUgg17hXy/xUMl9ulMRZPRwYgGaSrHDWv1tcbjujwuuaRcXRwdgyZxCe8F0jJoViP
	/Pw8WLXi1jnzF8ZwYcYvi4w6Wij7ToBv4cLRzWYgg+Xw8JQ3WX0n8m+VT5FN4bJJgdm0Erslb41
	Cl/0QIBNzaniIEWD6dwXWIneU50QQ=
X-Received: by 2002:a05:7300:e9ce:10b0:368:7c2d:a612 with SMTP id 5a478bee46e88-37966c4738fmr8600534eec.10.1794764604805;
        Sun, 15 Nov 2026 09:43:24 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:9ac3:b274:12a6:a1c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm28204663eec.28.2026.11.15.09.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:43:24 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH v2 2/2] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function
Date: Sun, 15 Nov 2026 23:12:37 +0530
Message-Id: <20261115174237.48908-3-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261115174237.48908-1-surajsonawane0215@gmail.com>
References: <20261115174237.48908-1-surajsonawane0215@gmail.com>
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
Changes in v2:
- DT binding moved to patch 1.
- No change to this driver diff.

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
-- 
2.34.1

