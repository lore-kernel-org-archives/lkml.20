Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793381029;
	b=yLxWHLrz506gh8uJiB2y1w0ZVZ7dyqQ1kbx+6jFVwObDzOYXZZwFWcdKQb/N8GZQt0eK
	 5zR6WxKIsHTZVQnnlPCTBrgnVBApB4KXxjeE4lQ2ma6M0F5+jgj4MUodGlJZVxI6LKHif
	 VJft8t01Y8ZsMIlQGa1aZYiM/Lc2F2BnIEWHT4OHSRyGe/1lU50ii8PqNfhym3boEdFDL
	 H64/q3cXLkx4bIFwSc+S20pqI57ox+udyRiBYDhPoI0SXG9npWBN2siqOcereZBnUvI3F
	 Ym2mlEV+/PW9m1DpZNxG4E7yoHZJecUfOUphFdCxDiBRfDIBal7nIRZd1hA8cOKI8tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=p5fsbr8zakmt2LaD3B1QD/vUAK+i4p9LYfhfMfto9I4=;
	b=3T/qS10P87LkJxzRRftGky5YhJq3qX7cqYPvXsKlxAInFrpoYAxaa9ZVy/1aBvYByy+h
	 dV4JCdgv4lFtL/f/Q3Y3ldUVB34SHaubkAAoNjsSjELg1a7lE7SbHQOW6EW7jlXigq6px
	 Jz8PQALjKUTFvNJJ+dPGCRe9Nr5oMM85LG5a6Tgez/NAXMETQm4tAzLLzurgqNGc0Bp/D
	 OjgX5wGCWfiXFsrZfsQG/egQrphTaF8blQQhF/IklBGXuP2drCf3nwyFZA0wM9uy3XNJA
	 LthtaNXi+T4KQ4WiXlX+6kmot+XGwTioju+9plNVPyyMMDBFCz5xniQSIyG1gN6nQsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bhHgymO6;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68DD606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A68DD606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bhHgymO6
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so8694895e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793381027; x=1793985827; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p5fsbr8zakmt2LaD3B1QD/vUAK+i4p9LYfhfMfto9I4=;
        b=bhHgymO6MMnENdZkiHokMrGtGv7MvIJlxfivTq3iklWJlq6HyUCvrja7khiF4zaJzf
         4uvWy1T6z/2Y2vB7GYwxWnv8BDZitp9b5FkRruHRp5oDJ0H5boaR06krsojdYJ8svCPD
         QBgGIgKbMW9fZcNt6qVTWpYT3hUJyKbIxCGTb0xe0w+InGb20t0p3WlKQyhx634dhXJg
         KZ5YJ7OW25pH7oXD0iH2XXIinX8kV2Un26xPFdHiryW8LUqFYnx6tgEs9Q4Lw3D3Brjw
         HPqPAai3pwlPgjDc1JKT/A1RkaWQhjh/MAparoObdUzcd80WojCpChxUdM9eQSJCJo9t
         LYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381027; x=1793985827;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p5fsbr8zakmt2LaD3B1QD/vUAK+i4p9LYfhfMfto9I4=;
        b=XDhSYnWLsihOvmZ5+QlAJFaJdGEN88GmiWJ1WADwOg0nYXf8pfWbAYhJ5+8pgJrmcE
         /bXdAwP+JAgt8yT1OeLlRowpRBsbZiHTjwj5HgGIAu0DDWXt0ZU1TrrPANglO74HAAiP
         TfORRtU9RAIqPTMzotSygCHyShE7w7HX9fvv365gKDA8ueY4IE+1p0YMsZxuQi96eEui
         f1ArNO/eej2nkd/LAQg3376XfmV+Jg99TUQLIGpXDyz+0MNXonGRnztN/h/7UqgIWn2A
         mK7xuLBqr5uncpP/eOvtF8dslU8b0tofJHRsyc6gpMOnmrf87e57VKYuqqVOpVVqqQSc
         jipg==
X-Forwarded-Encrypted: i=1; AKwUvBwir8hSIR3ykFILtqUHPM5PO2F1l+TlUst1c6phOnR29Ks5gIsHwezgXwF2s8ulnFLMaGBWNOw437zHkP8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXmAmL5yDuv7JWRXXJ8VaMM4ufXhTFZo0y+vWB05Z1vGIGY8Eq
	jQS85ZpeXGDJ+r2N0CiYiR/7bIZifjaVs0y59xkAQN8kMPTSY+j+9gj1SAFPKW0sPGY=
X-Gm-Gg: AYBFou3BG+5KWrHknimWFLFhcFc1H0E1cwwSTzBUEx/lsKg5wQUhXM3eqq7n3VWeAEU
	tR0KaGF5l9LJGtDabtuL3sKOozwdVsnzm7TE3bKoPPoFOAkwvd2uRkylKQpydFIk5rLO5XJ27Qh
	4vllo8JnwAyIieCoitMnIFhVv5yvq/WB/6gsE1ZYFhEzAzrrn4WrEq/9slxo6Po7C/auTXcyPqW
	JnlkHZRuPYCZ/a5l66Qaz6WA8hbfihVfmJJQCDzjVA1/7DVVbgwJgEqnEdkLbF0a9uolQAt1iCq
	s7540DSSlUel/YxL2qlyL/4MIMf+xM7J65JtYX3sgrakTFYnSjLaeJ177KjWTwuThSkHl/Gwr7d
	vMbRcikA0Gd4j4/KPSF5l5lpUQWi4UlsLXo6ryTv9LPIOcIwAEDYAqA8PdDZRwgOtCaadiqr/rl
	ow4eiSKI9zbMtgkwZVzDJ4IXKW1PPxLXQzXtwFFDAizpxcyFe2gdUvtd+Sl4KuDs03CtLMLYoLo
	swfQfuS92+DOQ4BHTt03ps35K2CraC9Mg6ICtrAWNG4jNCmpmD4U8w0WZo868C/l3LqdZ1K0cX1
	lUPNejJpZnbmbJpPKMY049U41J23BpBOcYrBRqWHSyb0h8Gr
X-Received: by 2002:a05:600c:348f:b0:4a2:be6:60aa with SMTP id 5b1f17b1804b1-4ac17d16b14mr69175235e9.10.1793381027072;
        Fri, 30 Oct 2026 10:23:47 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0a66caefsm56949685e9.5.2026.10.30.10.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:23:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 30 Oct 2026 18:14:56 +0100
Subject: [PATCH] ASoC: meson: axg-fifo: request the irq with the clock
 enabled
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
Message-Id: <20261030-asoc-axg-fifo-irq-clock-v1-1-f8c170ac8b0d@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBCF4auQWTtJS2MlXIW4qOMUBw2FjhoSw
 t2tsPyS9/4VlLOwQlutkPkrKmkssKcK6BHGnlHuxVCb2lvjDAZNhGHpMUpMKHlGeiV6oi2LS3N
 23jsD5T1ljrLs5e56WD+3gen9z8G2/QAPnbFrewAAAA==
X-Change-ID: 20261030-asoc-axg-fifo-irq-clock-120278536630
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2821; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=oVESQqWI9ddX5fwFsFHblshua3jUvLRhTVEHMsN3Hq8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPLs0rq1z+7l7V64M1PfXPE/revDg4b9F/g8NHP62zy
 jn3KePV6o5SFgYxLgZZMUWWGu5q8XeSWl9mTde5DTOHlQlkCAMXpwBMJNSLkeGoU2L32W9tq7bH
 Txd/uUK8zPlqU9Z9J8OVa27YP/vQJfSLkWHGX29VWemkFcHHeO6Evzt8ZuvSQt8lSlPN/x+xWLt
 amp0PAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The fifo irq handler accesses registers which need pclk, but the irq is
requested before pclk is enabled on open and freed after it is disabled
on close.

Request the irq after enabling pclk and masking the fifo irqs.
Free it before disabling pclk.

Fixes: 6dc4fa179fb8 ("ASoC: meson: add axg fifo base driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-30e88a8a-f33a-40f0-92aa-9ea62c5b7299
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 75909196b769..edf43b7fb5cf 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -244,17 +244,10 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
 	if (ret)
 		return ret;
 
-	/* Use the threaded irq handler only with non-atomic links */
-	ret = request_threaded_irq(fifo->irq, NULL,
-				   axg_fifo_pcm_irq_block,
-				   IRQF_ONESHOT, dev_name(dev), ss);
-	if (ret)
-		return ret;
-
 	/* Enable pclk to access registers and clock the fifo ip */
 	ret = clk_prepare_enable(fifo->pclk);
 	if (ret)
-		goto free_irq;
+		return ret;
 
 	/* Setup status2 so it reports the memory pointer */
 	regmap_update_bits(fifo->map, FIFO_CTRL1,
@@ -271,17 +264,24 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
 	/* Clear any pending interrupt */
 	axg_fifo_ack_irq(fifo, FIFO_INT_MASK);
 
+	/* Use the threaded irq handler only with non-atomic links */
+	ret = request_threaded_irq(fifo->irq, NULL,
+				   axg_fifo_pcm_irq_block,
+				   IRQF_ONESHOT, dev_name(dev), ss);
+	if (ret)
+		goto free_clk;
+
 	/* Take memory arbitror out of reset */
 	ret = reset_control_deassert(fifo->arb);
 	if (ret)
-		goto free_clk;
+		goto free_irq;
 
 	return 0;
 
-free_clk:
-	clk_disable_unprepare(fifo->pclk);
 free_irq:
 	free_irq(fifo->irq, ss);
+free_clk:
+	clk_disable_unprepare(fifo->pclk);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(axg_fifo_pcm_open);
@@ -295,12 +295,12 @@ int axg_fifo_pcm_close(struct snd_soc_component *component,
 	/* Put the memory arbitror back in reset */
 	ret = reset_control_assert(fifo->arb);
 
-	/* Disable fifo ip and register access */
-	clk_disable_unprepare(fifo->pclk);
-
 	/* remove IRQ */
 	free_irq(fifo->irq, ss);
 
+	/* Disable fifo ip and register access */
+	clk_disable_unprepare(fifo->pclk);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(axg_fifo_pcm_close);

---
base-commit: 11ae63bd9030349a0136fb2edd1622a4a029edc8
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
change-id: 20261030-asoc-axg-fifo-irq-clock-120278536630

Best regards,
--  
Jerome

