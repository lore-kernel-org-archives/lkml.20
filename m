Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702599;
	b=4fVrRdbE7x32jvXBdL85zHTFif+dpoxY+sb93hZSDol6tlXlJIugLjOU8pG8bQF/cqx7
	 0200iskgpBl6RHPTcFXnJKWqOp3gEQDMScIW9ltmkOl6VwBMyNI/dgU9Qh/xc6VB/OgrO
	 qFLb2VJXruXwv7RVqOnwq5u5NYK+Q2PKKXCT8CjnumNlWZCSeaHNrkH88uATqSDKmkVq3
	 wOLxAH8m8BUMoRIjwx5/tVXmx7F6OReT/tjJcDZOxT9AX6LHa+JCUSHtu2Sb1e7TZoHIH
	 /ybrW1qlM7zOI/zED0hSu7EL3ix/qe8sjJ6kdFFBiAvIEVQPgiId+0fbWzjXn2v4qzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lU5a37ANqsH+/etFPtYMjt6cdViAcWdqe3yklDUWWHc=;
	b=5ImQLhzlZTrBPFvsRjS5jgEWGeKHPjJQqFJD/yjcQY36nw5sxFS5GyVNXfaJllgTs/y+
	 IbnAsDreCBiCMbWAibpwv6lHNuboQi8mrQPlwz4IZgvHdFc9bNG7KLZL+AvW46wuFJXpe
	 Qd7PU8HIqCMBjPc1s7NFzs6WtO+HP+FasnqRH/6ALugpJU8qrrLVOdEC4yF2cFkh/f7OG
	 utMZS+kt99sOcUAK1fTuXC5YpVvbVqkRmq0REeWJNjNo7kI5o9NB2nOh9lJHyLcs/26p3
	 EpOZNOySO5HSOC98CHlCOEz9sIzVyUfr54kHeCgYyhAuxA9g7yj8nWRMPRgQVC+zagA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A1cVgB2W;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20BC606A329
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E20BC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A1cVgB2W
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4956869750eso1383745e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792702597; x=1793307397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lU5a37ANqsH+/etFPtYMjt6cdViAcWdqe3yklDUWWHc=;
        b=A1cVgB2Wlfn2qPRMDZla52t/KylTxUPQYJ7E1/Y9+l1yeSh9i9pM2U+JYUIIwC86Cu
         vNzfoXFn5Uxb49DmtB4xjTV3KuhPu5tvy7Tp4eFh+AMBOT7KSjV+oJn7Sxvre5jeSxTr
         /Vlk9p2AKgPO0fMYyizBN+aP5Pdh1hLQq2cq2a7xYcZ0wRmGX6FuobL0nelqWvr8M2eV
         o24ffelyp9QxyvGy7XnbBSjR0VOz0OooQSf7PXNwd5hJcvLvXcIeMpyHUIbiiNWjlCve
         qu2ucLLUY2DFs1/ljRV7flpq/3mGb4d5aFOLmumpqnYlzpMMDbavFaS4fWvIE+FuSyr2
         8ToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702597; x=1793307397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lU5a37ANqsH+/etFPtYMjt6cdViAcWdqe3yklDUWWHc=;
        b=FM5H3ITT8vr26Ao1RqYm9b5vo38G9NtPPlmRJVOVsmABu32ABs3K57ILjrwDspws+L
         BoMSlPnb2E+WnjpZW3hxf9xamCrkMxewhrs6OAW29XmBD4w0YxImN/mFQ7nt/OvjIJfc
         7I0p+bHSWCexmCZxbk+5XtXCBS8TcvyNCqe2yVm7sLUxi4fZTBC2p7A0oNhtmMBF6RmH
         DnWbjEWc+SKUWqovmn8xVNwDmR0zx4J8K2i9AV3gActuYwiZwAp9ZDXXlhmBqmITuUUd
         qQ3lmpipmLImk77VcclQIcTzt9GthpfQ1gtRy3fXO7ZBjY1upTzDr1ewrBT2j3eSicdC
         Ws4A==
X-Forwarded-Encrypted: i=1; AKwUvBxnDaCULyCffEfXTjUu7EdOM1FGJIn9y/ViQhHnBRiotnYIE+VGgZ93KfVRTyhyM34rDJHpO4m4p2CQwtk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoKQVb0NAeGIXJL0wyNHpqB8C+IS1xoBPrMl0L7pYvH+9uAdXO
	z5ebBKAj9InXbsaHPiHmCxmEDaYu+fWBoFxl7zZrBdhtF+4krtqbfOKvieT9TA==
X-Gm-Gg: AYBFou1KDQJOMOEfsg6A6kGzuHvdEhKi3Hy2AJawXMejlaLayc59SwTQc21NyUf4fg8
	xt1qt34OTR8xN+0D2gLELy+RatgIsmH5EtZppsvMlPfw03JmjOcBB0PcHbdKPMtvD0hGQTcTpKz
	D20ihz09LG913IylzYQeNzErHDxiFwh2JCQ99NuOUZV7JzmpIAgkoEuyuAkEiFaBEs0T5yIEReB
	LiGU37EJe7lDUWXuHSihS3OWVXjlT4vQUNSnt4tRKF2WZj5pgkgjrt3u4JlAsMSe4ekqwLC40Ew
	1uzyUQEzMRd4UfvIVvYP1nv9GYD7lieS7T6nh20iK8g8Jtw81k5/mRPZCMmtxSszmgUa40M/sGr
	q+F6sqAzN/ibigamv24/kSh8x6cGkExAAix3Zd1x/RlblV9lbO12VQ4zqjxjdYLSYVNIubMrQ56
	GfzPGJpIN61jNRHyJHSgPowbn4StQEI/5BJKOTpeqLm4DwCnkfQRRX1OigOzIZOd0XRMq1VK0sw
	wO55VU0VjHihVBel95ZWIQ55DRyOgKVKyyih71xpLaNrILq4JApg4jzOvdqX6v7We1AFeLDIqQ4
	k4i8vhuMhnbAuQVcQLZyFGdP7zeaO9vzlrMFuXd1upxWPR6j//QWFZkyuV4DsQ==
X-Received: by 2002:a05:600c:8b32:b0:4a2:397:73e9 with SMTP id 5b1f17b1804b1-4a211ed726emr2669065e9.18.1792702596607;
        Thu, 22 Oct 2026 13:56:36 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e38025c67sm394006f8f.20.2026.10.22.13.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:56:36 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 2/2] clk: en7523: add support for .set_rate for en7581
Date: Thu, 22 Oct 2026 22:55:34 +0200
Message-ID: <20261022205535.688352-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022205535.688352-1-ansuelsmth@gmail.com>
References: <20261022205535.688352-1-ansuelsmth@gmail.com>
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

Add support for EN7523 driver to configure rate for Airoha EN7581 SoC.
The SoC expose both base clock selector and clock divisor hence it's
possible to change the rate.

This will be especially needed for new SoC AN7583 that require changes
for the MDIO and the eMMC.

The clock were assumed correctly configured by the bootloader but this
goes against the rule of "kernel should not depend on external
configuration".

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 136 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 2f203c94f87e..832c43ae265f 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -777,8 +777,144 @@ static unsigned long en7581_recalc_rate(struct clk_hw *hw,
 	return rate / en7523_get_div(desc, val);
 }
 
+static int en7581_get_base_val_for_rate(const struct en_clk_desc *desc,
+					int div, unsigned long rate)
+{
+	int i;
+
+	/* Single base rate */
+	if (!desc->base_bits) {
+		if (rate != desc->base_value / div)
+			goto err;
+
+		return 0;
+	}
+
+	/* Check every base rate with provided divisor */
+	for (i = 0; i < desc->n_base_values; i++)
+		if (rate == desc->base_values[i] / div)
+			return i;
+
+err:
+	return -EINVAL;
+}
+
+static int en7581_get_vals_for_rate(const struct en_clk_desc *desc,
+				    unsigned long rate,
+				    u32 *base_val, u32 *div_val)
+{
+	int tmp_base_val = 0;
+	int tmp_div_val = 0;
+
+	if (!desc->base_bits && !desc->div_bits)
+		return -EINVAL;
+
+	/* Divisor not supported, just search in base rate */
+	if (!desc->div_bits) {
+		tmp_base_val = en7581_get_base_val_for_rate(desc, 1, rate);
+		if (tmp_base_val < 0) {
+			pr_err("Invalid rate for clock %s\n",
+			       desc->name);
+			return -EINVAL;
+		}
+
+		goto exit;
+	}
+
+	/* Check if div0 satisfy the request */
+	if (desc->div_val0) {
+		tmp_base_val = en7581_get_base_val_for_rate(desc,
+							    desc->div_val0,
+							    rate);
+		if (tmp_base_val >= 0)
+			goto exit;
+
+		/* Skip checking first divisor val */
+		tmp_div_val = 1;
+	}
+
+	/* Simulate rate with every divisor supported */
+	for (; tmp_div_val < BIT(desc->div_bits); tmp_div_val++) {
+		int div = (tmp_div_val + desc->div_offset) * desc->div_step;
+
+		tmp_base_val = en7581_get_base_val_for_rate(desc, div,
+							    rate);
+		if (tmp_base_val >= 0)
+			goto exit;
+	}
+
+	if (tmp_div_val == BIT(desc->div_bits)) {
+		pr_err("Invalid rate for clock %s\n",
+		       desc->name);
+		return -EINVAL;
+	}
+
+exit:
+	*base_val = tmp_base_val;
+	*div_val = tmp_div_val;
+
+	return 0;
+}
+
+static int en7581_determine_rate(struct clk_hw *hw,
+				 struct clk_rate_request *req)
+{
+	struct en_clk *en_clk = container_of(hw, struct en_clk, hw);
+	u32 div_val, base_val;
+
+	/* Just check if the rate is possible */
+	return en7581_get_vals_for_rate(en_clk->desc, req->rate,
+					&base_val, &div_val);
+}
+
+static int en7581_set_rate(struct clk_hw *hw, unsigned long rate,
+			   unsigned long parent_rate)
+{
+	struct en_clk *en_clk = container_of(hw, struct en_clk, hw);
+	const struct en_clk_desc *desc = en_clk->desc;
+	struct regmap *map = en_clk->map;
+	u32 base_val, div_val;
+	u32 reg, val, mask;
+	int err;
+
+	err = en7581_get_vals_for_rate(en_clk->desc, rate,
+				       &base_val, &div_val);
+	if (err)
+		return err;
+
+	if (desc->div_bits) {
+		reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+
+		mask = (BIT(desc->div_bits) - 1) << desc->div_shift;
+		val = div_val << desc->div_shift;
+
+		err = regmap_update_bits(map, reg, mask, val);
+		if (err) {
+			pr_err("Failed to update div reg for clock %s\n",
+			       desc->name);
+			return -EINVAL;
+		}
+	}
+
+	if (desc->base_bits) {
+		mask = (BIT(desc->base_bits) - 1) << desc->base_shift;
+		val = base_val << desc->base_shift;
+
+		err = regmap_update_bits(map, desc->base_reg, mask, val);
+		if (err) {
+			pr_err("Failed to update reg for clock %s\n",
+			       desc->name);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static const struct clk_ops en7581_clk_ops = {
 	.recalc_rate = en7581_recalc_rate,
+	.determine_rate = en7581_determine_rate,
+	.set_rate = en7581_set_rate,
 };
 
 static int en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
-- 
2.55.0

