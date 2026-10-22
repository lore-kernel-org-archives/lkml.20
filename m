Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664863;
	b=Jg+xbHYxLiOlOSEr6r2eB/3Phoooi348hI1muT7sfeOSUym5g9l6vNvuDKPtgDcpoQAf
	 izUOZxHQCXlJ3CPDmcCRSHRHrCbl/aLLM515ERV7cLbZkk2TVXvYm8wpUNP6cB+8gkb72
	 cBJb9YcQ3AzPlfEMcqWYWQQVVWKr65ouJkPQCJM1CYJT7tOs2CM2/a8S/HaraDiJdBQOy
	 EfgiMP1KdzcSSPcRanIy3PJZEZ6bOTBTHxuaQybZ3dVB4OJ0e4oxOR7FtIicT7QU07lWg
	 4B1egdRc05+HXrgq+9af+UlneENCev1yJt9tzwp8273F7/vW8YFbuChfewo+Ylm3umw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W/St7nz9trNJLzodDEvl9jP1VNCe7LII2kl/X5vpWFI=;
	b=sp44Y/PjLKWg7p9KRDMPPNVxnS2hTdgma6UNz92/9LhkKCeqcu9bSws5vLKAzOOqIacX
	 GT6BDtkPjfDJ6ZlWmbyFqZ96O3s17J0SIQl9sww0RhKkLFMo0qTKPF0i+7ZuKrARfWccw
	 jxobPy0pTEh4ujc1ex+VKyYfbNcGBxAhU60fSYmZ321hv/Hn+qS69r3sQ39kSKj2TOBS+
	 Mk58JjF6dJ27dAOjd7ASpEv1OzLCG2Ol7sL+HDkntonONvwO7D8p7/J0ywVY1LTqi2q2l
	 cjs9dAIbc3gK93XJ/CaQxAOtpzuYCCtadGXr4t9o/WYXyVtkm0knn5DDvx5K8jR2tWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="P/FmqH7d";
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CB3606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2CB3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P/FmqH7d
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so966084a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792664862; x=1793269662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/St7nz9trNJLzodDEvl9jP1VNCe7LII2kl/X5vpWFI=;
        b=P/FmqH7dflDIVdHdK3bz8NzpvG7c0lGqndu/uBhyb0zlWiPZK+whRtLLFG/MHojFiA
         YMGpEZsJRsJymmftWFBc7xCcziIKb3z0k1l4VOJWaVVHcmvaw+icYbwK5HFk5miBQG0H
         G9nu8I7OQBFqhw7ZN4WbHfd4FTDQCMKbv+Agje73ddezTiQiGGG1DvFRU8pgR89UmSN6
         +w1SwM22qqnsopnkayudZNdDF935w25Knrn6xK7Dsg62v+IE/iEnHieFBSS03uXfUb7a
         vbTD4CA620QeivRHj5KXMChNM4oNysD73b8jewnZe/6c1ec9V3x3RRbU50M188gJ+1kP
         hJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664862; x=1793269662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/St7nz9trNJLzodDEvl9jP1VNCe7LII2kl/X5vpWFI=;
        b=b1xQh4ebjizUFiyg4oJ9t365WfNQrS9y8KRUPm1g7ZguRyBtZzIqDSq2cUE11jUZA9
         cUdeN8IUWIiKDiMgcr30MTK1VATgwp1El8UQktsmBwwtZ3FNUmqcRC53emduuJ3/x3V8
         fzkGPfThAh4aW3LkZ/JLCKFqRM5bFyVpAx4jgCeSq0fdrCCpRkoKGkmpcDCP4C0GESky
         2A40debzAfpVNFh5lvIB0nPxjYNkQgn/d5xCmFOg3l3Kl2jrBK2zh6HmuuvLIIeKYapj
         tAci/9r1FMm2t1zLyzde58JxQGbEZGn31NiyPra3+fEe9yIB5UE3KNYJlNEfxjM/fHt3
         EzWA==
X-Forwarded-Encrypted: i=1; AKwUvByx0ER+YoVDS4AhFWHm8UTtwHChczvyrADbOVTBWT2PumVgGxxkvSVOJKweYUTaUAdZu/zhN8gnBoOGkhE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOMIlhTetQ++tgFMoqcgFQd0c2ljTFnGVXIhTYXmkQdE/vqI26
	NZwZAZBWfesZIEyJ6C8uj/qYPeC76W2988YjvD3FbHvRBchbbsWXaaSc
X-Gm-Gg: AYBFou2AKD8nvSytKjNN3BKv9SPZzo+9KtQQpyyDA0v+BTlePo+QnIbWrO2rGIHxpe8
	V77PG2E7Ll8GqcvMZUHGeqrRZOumk7XwQCRnxUzs08o6vNCxZg6zgUXkETMlp56g+8pbaD//pNJ
	JpRSfuWTiIo5/SgNNAPdg+aqfd6MI+Of9qaG4rppD/muHDQc6eN0h4gWE9iEpXPwS0g0Ot+qGMg
	xcnX417at0HZg3Fq8rXq9yK6R1Phwi2xBmiuK1XKiQepuLPPwKsRYMsngHDfeyRM2by7xEXtK+q
	5JBe8pocwRcEO6iN6P4rQj3eDJO15DsekIGsrVAaH2GE7lKvc53JEZOl5CpNdbU9/4XoqzTua5M
	BLDUweOoUsmGWtyWEJwD0rsbR0FaI8NHY0RedXI60UBH43xVRYF8/tGPAJe7NBlhtg9OwtZtEGd
	Yrge3XKk48BaSA/mjaPJKnFuKG2CIn9xQU2NKxgxvYa8TxDp7WjzC9DuLKO7UjELP4Ifhc93d00
	5C9J2WZzQDzKKw1PQOLSo6wXwjuVCGKcIsltCzGS4M1Mw1PTq/oPgVCg6uWur+ezEnCjxHa4/qe
	br/bAWaIvM8olwToQM3woR9deOzSpXNDP1mCH6iHR898G50UElOWgTD1MwxfOh+f41OyOycoMeS
	nYAioay1qYQ1IBmzJ
X-Received: by 2002:a17:90b:1b0e:b0:3ac:a993:5b5c with SMTP id 98e67ed59e1d1-3ad86afc038mr4253866a91.6.1792664862134;
        Thu, 22 Oct 2026 03:27:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48a55d5sm3702279a91.9.2026.10.22.03.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:27:41 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	u.kleine-koenig@baylibre.com,
	Igor Prusov <ivprusov@salutedevices.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: codecs: ntp8835: Fix hw_params return values
Date: Thu, 22 Oct 2026 17:26:38 +0700
Message-ID: <20261022102638.38606-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022102638.38606-1-phucduc.bui@gmail.com>
References: <20261022102638.38606-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

snd_soc_component_update_bits() returns 1 when the register is
updated successfully. Treating this as an error causes
ntp8835_hw_params() to return early with a positive value, skipping
the remaining configuration.

ASoC expects .hw_params() to return 0 on success to mark the
operation as completed.

Check for negative errors and return 0 on success.

Fixes: dc9004ea273a ("ASoC: codecs: Add NeoFidelity NTP8835 codec")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/ntp8835.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/ntp8835.c b/sound/soc/codecs/ntp8835.c
index 39620b84e214..2be713e99eab 100644
--- a/sound/soc/codecs/ntp8835.c
+++ b/sound/soc/codecs/ntp8835.c
@@ -321,7 +321,7 @@ static int ntp8835_hw_params(struct snd_pcm_substream *substream,
 
 	ret = snd_soc_component_update_bits(component, NTP8835_MCLK_FREQ_CTRL,
 					    NTP8835_MCLK_FREQ_MCF, mcf);
-	if (ret)
+	if (ret < 0)
 		return ret;
 
 	switch (ntp8835->format) {
@@ -341,8 +341,10 @@ static int ntp8835_hw_params(struct snd_pcm_substream *substream,
 					    NTP8835_INPUT_FMT_GSA_MODE,
 					    input_fmt);
 
-	if (!(input_fmt & NTP8835_INPUT_FMT_GSA_MODE) || ret < 0)
+	if (ret < 0)
 		return ret;
+	if (!(input_fmt & NTP8835_INPUT_FMT_GSA_MODE))
+		return 0;
 
 	switch (params_width(params)) {
 	case 24:
@@ -364,8 +366,17 @@ static int ntp8835_hw_params(struct snd_pcm_substream *substream,
 	gsa_fmt_mask = NTP8835_GSA_BS_MASK |
 		       NTP8835_GSA_RIGHT_J |
 		       NTP8835_GSA_LSB;
-	return snd_soc_component_update_bits(component, NTP8835_GSA_FMT,
-					     gsa_fmt_mask, gsa_fmt);
+	ret = snd_soc_component_update_bits(component, NTP8835_GSA_FMT,
+					    gsa_fmt_mask, gsa_fmt);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * ASoC only marks the DAI hw_params as done when .hw_params() returns 0.
+	 * Since snd_soc_component_update_bits() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked.
+	 */
+	return 0;
 }
 
 static int ntp8835_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
-- 
2.43.0

