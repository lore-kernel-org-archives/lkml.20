Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826975;
	b=NyzrZYRMBIwHC7cXklr0l8EM3+NKs+Ure4Z+ohiwgMrW+3CrmEuUofQWPV+nUpJ9mEj9
	 Q8UlSd0gvYz9yBVSqTlNx7mUbZHFsNCiw/TXOlSHmM6KcUTmUSawc9sVdeEHgOSf2CBjY
	 SxJdJvV9BzVvuZnEtQlQ7fGlliVaev0wzaimMzKlHXGoiwKnTOhPwl/bufShthVRseI5V
	 FuvxR8/1d4c9tWjsE2dT1qdUNGEieNutzOz2Dr7jEcEMrn/vuSzv68VVIqVVBBBe/1hsM
	 oyvEuwyiiXglDXchSZOANqI5prY+hocKMw/vQfrPjqvIcQN1a+qhOV/TNddwd2JSO0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bNV2fv5l405CqkXTgWu59K3HR6/f7q0GR5+FH0usqwo=;
	b=P5PcPjyzIc0ssUf4L2WIfooPjDEclF/NzIA6HKqd+LljsNQ4Ivh3OHH+g+cYxilN792V
	 Btk9CsNLrb5Tynzh97Ked6syXnPQlfWcMY5GH6tqNzfu8kv1bdLJUwPEqLVZOfqwwt7YX
	 5FLAVtjxIKc0NJoLk0EZNVL20D0R8zK4rXtFk4ITFOmDorMZ75XQw20+ijclAxDa7XXoL
	 lw5/i6EKSA1euYldefCnQkN5zhSkphzrMbGb5vCZtFfwMP/1kUQNKFys6tyGef4F82sFv
	 sbpx1TmgtgdeoEa1mqCpKN7CyIiZyxMPVEPqEfZUz3dEwWGcjyVBIghhMg3+Chrkkfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LMZ6RrSI;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB89D606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB89D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LMZ6RrSI
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-380b40312e2so47357eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826974; x=1795431774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bNV2fv5l405CqkXTgWu59K3HR6/f7q0GR5+FH0usqwo=;
        b=LMZ6RrSImd48pHOJIHhBHVrBcPACVhRDjWCcCZfFuoZSScBeEnhHRVlK/IUeg98XyT
         RZdiiAT621b2taev2kFq5QdbyLw1uk1mQEYaAmEEJ3icRUESsp0tMk4yb8/dvT6dCq0h
         You04Ua+2g1vrOknhObEc4EPKrVR8qrqYNO8k1lAmfA2m4dg8RpqhIxpEHEaSpEBwwtG
         YnqYV319L0y+2WsPWUFYPhzEDzF4bQNpy+3BiHOo19mmvTbwTm0NKfuYBvZvJhcTjmfv
         D6dHV4jLSwHzUb7s4CbLIkmfA/Y17OZdIcR7bf6GJnctSW9IHLn/onUni5aIBS31n//K
         b/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826974; x=1795431774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bNV2fv5l405CqkXTgWu59K3HR6/f7q0GR5+FH0usqwo=;
        b=tAoryNY5jXTdGhQR98KZma5zo67HDNM0DtRizVjcDUW5OoOjiJ2vi7P664sbOMbcuV
         n8pDlBW3B9mX8uIk+7hI9uvGmtJ93TsAaz5yaxzJnAAbvJoFlK2lxrW8QRGLXUytcpIK
         OPAB/D1n6+Hsp/9DWYFWt3vsPWa6jTFAK9oL5uFqFe4s1xV2nptS4a4fqi2iDS5mX8w4
         KhdgJIuopPG9pWlox6JIwZ15Da5WQzXpnt86cYymCOeP6rs0p3ry7TMWLiWLtzKu0rRX
         LPbb+HYtEn6WU01gIYvzFFG0LuqFW/XTtFEAq6eHlqv+kENbi1ao5gHM8ZyuBgaye6CR
         tSNQ==
X-Forwarded-Encrypted: i=1; AL+hErGSGUsBc/x0iSSHyU8DNLWkU19bvqCBqpJfiqCBXDeefjt0Im6R9K9dHrfkdoPK2EdCpSw0GlWVlWgPSH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oSnuXQPZr1QcXxAgIHpndPBDtXkfMUeJj3BrvM+U42EYzpq5s
	p5W31MIil3PADnphqWEcKQAG5ir7JuyS2JnDy4T/Cxb8kU8WlvDdWQDq
X-Gm-Gg: AZFdTZcN+kiE0pRpHWPX52mCMMkJ8yaa6z3j/s3LGzfFryVl7A0MZkrFG9GByJNyD8I
	Ymf8euerCM2ccMApAmBkAo0uI/S8wOb3D6V8fW5gLaJzs81lxtwF6tCUkbIykBoCmKx2N5d3q6D
	XXggA8LSzOpYulZkR0kVhg2mDc+Ty9x0PTHTXorwQx9HBPn9SuVsXmc4/0tNO0s4048ykKyDH+y
	0CtWbgbMM0ODGh6KyyMUN34E75dkCYepNf3l/A3PKwAfVrajwjObk9iyM8VkU7o95zBtDEh1xK8
	IwMXE1+zqPJ0gC2XPm2cZ6STcG8kN/hSoW9Cm2EOWvRCdPeb3dNnNgoViF0RQV52K/hPUI3SbG8
	GkXBTZrkLaTMNYnv3slqH8qohHfHASAemK2929FxqW+EPDqYBy5ZcVSgZGvKE3WUjZIQCHWW4LC
	NB1kFVOQvTYeqipNSUdOqaPffDXjS3L3C49j+CCmPtsWiBmxD+00XZBGg3Nd505EUQxAGU/9vrz
	ARQoLz35BV6WmvkZB/y1O0gj8O2o5z1LrnI/CkUE1JOtCq78sg2pd3oHY6Ck2hpZdwDoxGgNmBA
	V0wscEMfCtrXi915cCHl++YZjbk8Htf8rakRcaP3ti4WTwfdM5ACOLehhnweL4pha7K8soMsere
	02PL8ubys9C0/4TLiD9/+CnpwpkAOMIB2/DkP57Da9/fC
X-Received: by 2002:a05:7300:bf9c:b0:375:370e:f1ff with SMTP id 5a478bee46e88-379671238f1mr9906182eec.35.1794826973517;
        Mon, 16 Nov 2026 03:02:53 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm51018182eec.8.2026.11.16.03.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:02:53 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: atmel: mchp-pdmc: Clear busy_stream in hw_free()
Date: Mon, 16 Nov 2026 18:02:12 +0700
Message-ID: <20261116110212.522478-1-phucduc.bui@gmail.com>
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

busy_stream is set in hw_params() but only cleared in remove(), so the
"Audio Filter" and "SINC Filter Order" controls keep returning -EBUSY
after the first hw_params().

Add a hw_free() callback that clears busy_stream, to balance hw_params(),
and drop the reset from remove().

Fixes: 2ed1a4a5c005 ("ASoC: atmel: mchp-pdmc: Retain Non-Runtime Controls")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-pdmc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index 039b2eba0d9d..8b55d864f3d5 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -614,6 +614,15 @@ static int mchp_pdmc_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int mchp_pdmc_hw_free(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	struct mchp_pdmc *dd = snd_soc_dai_get_drvdata(dai);
+
+	atomic_set(&dd->busy_stream, 0);
+	return 0;
+}
+
 static void mchp_pdmc_noise_filter_workaround(struct mchp_pdmc *dd)
 {
 	u32 tmp, steps = 16;
@@ -748,6 +757,7 @@ static const struct snd_soc_dai_ops mchp_pdmc_dai_ops = {
 	.set_fmt	= mchp_pdmc_set_fmt,
 	.startup	= mchp_pdmc_startup,
 	.hw_params	= mchp_pdmc_hw_params,
+	.hw_free	= mchp_pdmc_hw_free,
 	.trigger	= mchp_pdmc_trigger,
 	.pcm_new	= &mchp_pdmc_pcm_new,
 	.auto_selectable_formats	= &mchp_selectable_formats,
@@ -1121,8 +1131,6 @@ static void mchp_pdmc_remove(struct platform_device *pdev)
 {
 	struct mchp_pdmc *dd = platform_get_drvdata(pdev);
 
-	atomic_set(&dd->busy_stream, 0);
-
 	if (!pm_runtime_status_suspended(dd->dev))
 		mchp_pdmc_runtime_suspend(dd->dev);
 
-- 
2.43.0

