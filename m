Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788590;
	b=S46yZkwS9AyP+4urqOzQPQsNopLmKVtZE1pb6bsbwZ4AFrnxP4jsmepODoceSCu/QHfl
	 V8dxH+13UpS3aBL5QQZZ1w4qcqwu8EHo0Ir/Ogz5vTRSpvng8affF3GgZt+bNAr0E4uQx
	 7MGemrUs2DuGQdxvO6WqnLaqld3KO/VScjw2IgBksncKPMLUwfyet1I/6SCfAlKjzCM3O
	 VlFZDrqMH8iqicXepLfU4IXZchGPn3bHQDr6at6JtIXrNzMENB04H8lPe8PPBhdJ23sYv
	 0LekjfeSO9BGOBM8Z8fQarRSVPkMW4Qc/8q7mZ/sUX3E44gKQq/RRZpE/IjcMOZuAIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QmhceGpLe8h0omEeb2M399Xlx6YguZcLcPtiMm/jwQM=;
	b=kN3VnGGYyVBvw5o0t/Riq/qNMRxFo3HwNeDb3dM3h8DR71Ka2fh8eUlAQg6lFR4ouXM7
	 JKZ4Ab0Tda2qYn0tIHd744B639PhdKyhUfGGQzcoT1g5ZrSzlMcawfgSTn1CiDKeiXA3f
	 2I3sN7WNfPB6wr9vasuo1tZWQMI1CTisIOV6RXptVNhzen2zQeesH3GV0hRVnTNFJj21a
	 QyYt7J08OEpxlytuUFOVsqRjPOWEMWPFB+MUx4asXsK7AOzli6L1REpwc2QAaknFiKH8W
	 7Y+PByOBysLf7xkaEumPAQHA3wHPE3fGfRXFMQ6o35TBUN7WkONA28cnku7MvSSm5TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Fb1FHWIE;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50500606A33E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50500606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Fb1FHWIE
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so4311825e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793788589; x=1794393389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmhceGpLe8h0omEeb2M399Xlx6YguZcLcPtiMm/jwQM=;
        b=Fb1FHWIEPGmdRfstsM41MRX85tJgzb272tTsRN56+pqPfcdSuAWC4SF9jh60IVy54J
         7AMapJNI68GJcNva1bmBNw0rnhlqNqG40BhqTGitFwbEnUDxZh9LIfPveJpSySgpu9ek
         McKeDg7kkJAuN2g25gtOrxHwMsiZSNzu2ah2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788589; x=1794393389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QmhceGpLe8h0omEeb2M399Xlx6YguZcLcPtiMm/jwQM=;
        b=bwh8bPd0lg3/GxWnQ6BZZom7K6ahJjTxvXhC4gxr5fDTW+AsRMUFjj0pUYEO09vnjV
         VvM7FEIRuFiSr5i6k4irgTMuufSIVqFp0naaqWBXWKYLUD2Qcfsl6GO0zsNFBdUwbGvn
         37qmLDwiY3MjR+A13d/Uuon16O5dZlvfZtH0Qo4hI2iH7L4Ko3DdJsMt3kV2mUUa4Z05
         Y8vDlPq1fK845F9L0VsWimlALrGYyrSP/sxvQEw9G7ov/aPrEXh0OfBug2a0KIJ8WFD4
         v067wvlnQ+Pa7mbREN7G5xiNHX/qe1w5lOdzit0AA4KAvm/VjYm/2H/WScPKgzf9XV6a
         YBJA==
X-Forwarded-Encrypted: i=1; AKwUvBz7O5Dgr0jLbfNqTQhNo46yZx6HKo7yAEH7k9i2D9fTcNG+iHs+eS3ZGS4symrMwzOzHC3qPt42NPcht/A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xOr1Uh7eGEwE10JQht5M5aLiXPjL4cWxf+PrznDW1IA2tlpPY
	IHU/Bz6MlKNpSMRPDmQnev5Wtw2UU7megwEQ0SYknwS+GHtHz+v8ms6NyDyK7wm3ohc=
X-Gm-Gg: AYBFou2jWcIH1+RjjWw5f0zqtpD+HAFoYPYDRq3h8SzxtT/p4Njj/zIiNrQIv1WiNgb
	PVpwCQ7540+H48pnjrvHBi2PPBH9LTqjwuewDpEOx/hYBdyg9ETb9QfJfGa067IIw+ID0nDQEQb
	2AFB39Cj794AlkP0PzimviCzg/iu1pUXKOkyGvfG17jg7BvOZIzhCxpP/5xFXEAd/3JZKpkESbc
	PIE4MB5TQ8aKln0Y98BypRqF+DxpcO2P8uAGyebo0LjXvNd8pRaIn44Z2NarUEg04zTUzpDXV8Y
	GM9QWjuw1/b7KSxsGTd1radhuQf9SAoKhxdQyZNaWI2FrBg9qBkRUVDhrtH1h2Dxo/JW3v80K9U
	O3LV7X4+j0UeWgmg7oA4tlnMWAthqzI9+iH/wrw7KXWEe/mXm3AWl8LjT2e+cgxRtuhzqltU2QE
	V9JoMiRfaqJbmQofnaLiLBzVi/EzAJZ4FJwvndY2f13KI/gDWqPXmpTMNrv5iBNinU8sTBO9p9r
	TfuZwMpSD3qMKi8KJdlb1PAn91IhQ6COVCG4B8SWbcsrwzjmBTPSFXnHjm6Rt9gr3I6+aP3V0Mt
	YMlv8xK4dnzhDmkkCjr2fmZi48pY+9+FN1rczNnkDF69jPgyam5jpJni4OrgzMMqtyIoy1i2GH5
	euZWIqpWfukqa+kyZwDO/bX54tp73A7i66nSEB5H/KjTbyfJLtoc=
X-Received: by 2002:a05:600c:1387:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4ac17d16afbmr361119835e9.8.1793788588668;
        Wed, 04 Nov 2026 02:36:28 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([217.201.213.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm141685155e9.4.2026.11.04.02.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:36:28 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>,
	linux-amarula@amarulasolutions.com,
	arm-scmi@vger.kernel.org,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v15 2/2] clk: scmi: reject SSC configuration out of the OEM field range
Date: Wed,  4 Nov 2026 11:36:03 +0100
Message-ID: <20261104103620.4054694-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104103620.4054694-1-dario.binacchi@amarulasolutions.com>
References: <20261104103620.4054694-1-dario.binacchi@amarulasolutions.com>
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

The i.MX SCMI OEM extension stores the spread in an 8-bit field, in
tenths of a percent, and the modulation frequency in a 16-bit field.

FIELD_PREP() silently truncates values that do not fit in the target
field. Moreover, the conversion from permyriad to tenths of a percent
turns values below 10 permyriad into zero, which is then passed to the
firmware as no spread at all.

Reject these cases with a warning instead of silently programming a
configuration different from the requested one.

A request with no spread method disables SSC, so send a zeroed
configuration to the firmware in that case, without checking the
spread and the modulation frequency, which are meaningless then.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v14)

Changes in v14:
 - Send a zeroed configuration when no spread method is requested,
   instead of rejecting it, so that SSC can still be disabled.

Changes in v13:
 - New patch

 drivers/clk/clk-scmi-oem.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
index c1ebbdc6bbc5..29acd2923fd6 100644
--- a/drivers/clk/clk-scmi-oem.c
+++ b/drivers/clk/clk-scmi-oem.c
@@ -35,19 +35,38 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
 				 const struct clk_spread_spectrum *ss_conf)
 {
 	struct scmi_clk *clk = to_scmi_clk(hw);
+	u32 spread_pm = ss_conf->spread_bp / 10;
 	int ret;
 	u32 val;
 
+	if (ss_conf->method == CLK_SPREAD_NO) {
+		val = 0;
+		goto oem_set;
+	}
+
 	/*
 	 * extConfigValue[7:0]   - spread percentage in tenths of a percent
 	 * extConfigValue[23:8]  - Modulation Frequency
 	 * extConfigValue[24]    - Enable/Disable
 	 * extConfigValue[31:25] - Reserved
 	 */
-	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10);
+	if (!spread_pm || spread_pm > FIELD_MAX(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK)) {
+		dev_warn(clk->dev, "%s: spread (%u permyriad) out of range\n",
+			 clk_hw_get_name(hw), ss_conf->spread_bp);
+		return -EINVAL;
+	}
+
+	if (ss_conf->modfreq_hz > FIELD_MAX(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK)) {
+		dev_warn(clk->dev, "%s: modulation frequency (%u Hz) out of range\n",
+			 clk_hw_get_name(hw), ss_conf->modfreq_hz);
+		return -EINVAL;
+	}
+
+	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, spread_pm);
 	val |= FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->modfreq_hz);
-	if (ss_conf->method != CLK_SPREAD_NO)
-		val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
+	val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
+
+oem_set:
 	ret = scmi_proto_clk_ops->config_oem_set(clk->ph, clk->id,
 						 SCMI_CLOCK_CFG_IMX_SSC,
 						 val, false);
-- 
2.43.0

