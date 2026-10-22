Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664858;
	b=HQLHq6zYvaN3cxVWPZhUEZS4RznegplcnRHxSh+K2OIsdBLag67iUOLmRstHLpuSlpQA
	 9fNcwtBmsrzyow1xevjcp5tM51cDDHvWcX3gMjoqUCqv0P1i37bkwSfoJZAYrnOdF/92r
	 qbeoK0pWOSdXfEjzhNdTMKlU2B45c9wmKjAu1LDQXX8f2wyVdLKH+1wHAYgYEMqUN4x7D
	 5yIaVWpHekjeC0cVcHAgsZZSl3WMO9Ib8BpnoI5a+qpArXAiIki6oaRIDrruOzG2YnQvs
	 ZoGg4Wxw5PAUgbOhtJ6xWJvTUBG+7NibbCqcV51W1AkrBCjtGBJFE66rok6gTKq77zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IzAaW5HTBn7UZ4VY2eLl2rr4tjq37RvvwdDzMoAn5+M=;
	b=m/QXLxS5j8p54diQL290N4QNTGq/33CEUtmZSvyW8SLfhl81CMjpvofg40/xkpLQgy27
	 5w/W3kHB07BkEWqLTEIs5QGSn+0klepl7rf26IJZuJsoTdDNKR5MBtzQAYDJ+pnrY3hRO
	 vb+2GGcW+XtYPr6aOwm/5KhP78m9GLTsFuWOqpfU4MHxZpPDnPXV6kKgr7IXi6fjR89Qj
	 nUC1zvED2XR2OPAuzILw1+eE300G9ZX1X8M0bJtbeuLJ0N1hvYcWIc1Q9SfvznLqwqvqG
	 YBxKYhLwo02KdUXhB/Z+hhgztMJj0EasHfz/zLK2rVd4hDh5uNFd0O9FHo5A7EWKSqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WDW6pcJD;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F036606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F036606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WDW6pcJD
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso280803a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792664857; x=1793269657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IzAaW5HTBn7UZ4VY2eLl2rr4tjq37RvvwdDzMoAn5+M=;
        b=WDW6pcJDDHpd1Ud5g2jY19tH+L2agMvBcqN/bsO3W4WNT3gkvy4SW6F/70MpMSpta+
         4LrnPEarR7pS92CmyLL6UKhWisBpd5ARCYGqATB34qLuQ08FnRT0mlXOuhiJmZJvMTE1
         GD3+RtXdi4LSk+OMbbCdVG6AFPdcD78wAgClzDgNaATzSJ+wj6lhxYqG9bZfrgWMo0ny
         e9FC0ZXOyeADHQjjugzwj4nj00qJ4W8XneBFBzkiYYiC8pruZgPfz97hOJkcHEALFtAK
         b3vvDBIsznqihGslDVymJaGvrCrUd9p74NFM/WTxMVAwjbsLfWW5hhmoCPZetSAnmojx
         6t/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664857; x=1793269657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IzAaW5HTBn7UZ4VY2eLl2rr4tjq37RvvwdDzMoAn5+M=;
        b=D8HSsfkon6XsWybNM/iAk7t1t+zY3ZA5Vld8dcPZLEqZQT+c/CYLsJOc5N4FGumuaD
         7jYuGKO6080yyXUacKSVbepGicbMlBR6LLciwrvtZCIi2O20xekjCeLoEYUnzfzbN9GZ
         4JP+XDBVKPlL2MOn1UOftpLoydmnWFtTvgf3pyhOmHpddsLvOJhxrtbEHmn8TSy85oXE
         bYngQj+q5yFpiw3WQilGXaLyX0FgR7wjdiIP6szaRTu4z+JEV50QhvDys6Jl1lK857Vw
         2IkXF2Gd9sbpTcnnVSquQqkh5L8UoEAR22qCqCd+pJNOMbVBAvWKwqnnY6R9Jihe8RBU
         SInA==
X-Forwarded-Encrypted: i=1; AKwUvByx6W+T2hchc8vDXl31fecvqm97y9QRCC95XB4t68GfD8hDTGT77/i4z0B5gcs4qSRVND1+4bUGzMImimg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRb8rwe4yrKzY94L1HHDqjIV6ZsqJlexh7VM6IHClAM9Hkh6EM
	59y10X1/AV0JVunPBJ0GEm6KU7ySO7JoPJAXSMtFPu5tPeu0fOxgpfXM
X-Gm-Gg: AYBFou1WAuMlyOeDaOZdJ09JSJ7jK2DL9eWPrc9OJ2zsHdUJyL53BhzQHjSNGJbFi0d
	n1B4YerpgiFxYHe00pUoeLxnZ8SrWHO/OX+YdYSQ4sIgdQN3mQLJuRNOAMXz3aXlWgOL0BRfX8+
	Xh25xEfA+2huGkHoRVu6Tn0p5jqfKX6zAYEB/BrxPeVDK9N08p7Ja1p4Dp+/oKZJdr39LXxQwHJ
	uPARI9uUEs2LEcqyRpPZXM+KnxB5P9gsK8az/wH6sST6di1tJVhbOSQ9wIx7Px547R8tckAzANL
	WgLCFF30BQ8mHljOzvKgiw6mqpb0pXRbgIcYAv3uaoTCyQ0PlNXNR7SXk+iSoaTfL1mo95OTGcH
	F9TuBzViqO7MMMbJTLeFd4NNh/nAZjzRtSCd4+xJ9xI0nUXZoiwKsuKgHUB++DFVW3bQOYA+mbu
	R1mLIMe2aKGsVOHigBBOghCPuebJ9P5Zg39QjV7PR51vrVqZkqVk1O79EgTVs8Wy2x6jR4Xv2N4
	79bIjDT5y349g8gKL/VQZYHkp9qcHz/1BBr2z4JKvLYWDkVjTiDPIsiNnL4VITm5NZG+HdPjeIZ
	wT9p+ugeb3ZX2yvn20pdUduqJhr74u5o8Oc3G+8TIblnqQru7i5DPuLHWsGxxTnWE5bxFLY=
X-Received: by 2002:a17:90b:5870:b0:3ab:5758:3766 with SMTP id 98e67ed59e1d1-3ad8707700dmr4023148a91.51.1792664856940;
        Thu, 22 Oct 2026 03:27:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48a55d5sm3702279a91.9.2026.10.22.03.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:27:36 -0700 (PDT)
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
Subject: [PATCH 1/2] ASoC: codecs: ntp8918: Fix hw_params return values
Date: Thu, 22 Oct 2026 17:26:37 +0700
Message-ID: <20261022102638.38606-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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
ntp8918_hw_params() to return early with a positive value, skipping
the remaining configuration.

ASoC expects .hw_params() to return 0 on success to mark the
operation as completed.

Check for negative errors and return 0 on success.

Fixes: 2bd61fff3e93 ("ASoC: codecs: Add NeoFidelity NTP8918 codec")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/ntp8918.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/ntp8918.c b/sound/soc/codecs/ntp8918.c
index eca34fafc4e6..e851cfcca7c0 100644
--- a/sound/soc/codecs/ntp8918.c
+++ b/sound/soc/codecs/ntp8918.c
@@ -233,7 +233,7 @@ static int ntp8918_hw_params(struct snd_pcm_substream *substream,
 
 	ret = snd_soc_component_update_bits(component, NTP8918_MCLK_FREQ_CTRL,
 					     NTP8918_MCLK_FREQ_MCF, mcf);
-	if (ret)
+	if (ret < 0)
 		return ret;
 
 	switch (ntp8918->format) {
@@ -253,8 +253,10 @@ static int ntp8918_hw_params(struct snd_pcm_substream *substream,
 					    NTP8918_INPUT_FMT_GSA_MODE,
 					    input_fmt);
 
-	if (!(input_fmt & NTP8918_INPUT_FMT_GSA_MODE) || ret < 0)
+	if (ret < 0)
 		return ret;
+	if (!(input_fmt & NTP8918_INPUT_FMT_GSA_MODE))
+		return 0;
 
 	switch (params_width(params)) {
 	case 24:
@@ -276,8 +278,17 @@ static int ntp8918_hw_params(struct snd_pcm_substream *substream,
 	gsa_fmt_mask = NTP8918_GSA_BS_MASK |
 		       NTP8918_GSA_RIGHT_J |
 		       NTP8918_GSA_LSB;
-	return snd_soc_component_update_bits(component, NTP8918_GSA_FMT,
-					     gsa_fmt_mask, gsa_fmt);
+	ret = snd_soc_component_update_bits(component, NTP8918_GSA_FMT,
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
 
 static int ntp8918_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
-- 
2.43.0

