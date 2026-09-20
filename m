Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9613CEB8B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880194; cv=none; b=qkvhGju4XArJ65S+tLhzn/6Ty/ooIcmT/DGq9nwDJQT82TG6oRizyKCoM7tXRqWqfe7ttfsMwQ4xiTizYJemULqTz4UQetW53IU9baBm6jhifan71UGBb2ZZIMImdcULBTYIa0SRyY+H/78OtdW05wWGbAIoNqei2xsr787b7C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880194; c=relaxed/simple;
	bh=nXncydCs7zpGdBoUqUrhDp6s0gVfraf7oN9G3oqVXyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q7/Z63trxZa7twHW+GGvNT0l++Y6pG9TCbbfIsh+h6aYlrIxhdcqS/SqwLyZ7bqJumvqkwHN01ZzHN9WLTcuJ5nkyeZ3MSAqrI8ssXFHO/wwoW1f1/GeLOMuuo5I2kEhtUmSF8c3VIK3T/thpsQUHToF8lxcV6iAocsyP2cOWwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LyCVsPnM; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LyCVsPnM"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2dd88a115ebso16262705ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880191; x=1790484991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vhyKqtsY06vLNdvd6vYAC+C0aLujryTRqdrSJjEz6bY=;
        b=LyCVsPnM1mpjyQMi2i0MjCvb0MFeyBQ3P/uerKAPh1wBuyW+4H91NLUjHalBBJ5lfq
         gJIPFBSyjZDAS17L/NZpmN7J8Klsi1JA3Tnncl+HfyYoGoCnIjotAPqZp6v3iL678uI/
         +TgKR7hpZi6EWIimn439d1b/u91U3bDHBTrhLZ0PiMZGuZDlRiV/P4w+ijI8n2O192Mf
         w5qHxt326F23EddL3Yi/V89/zuPVW68K9t+WjZDV+Ih64hrENxOlZ3OZyaS+q9e9rt2R
         1TChNep6ne14gHfT7zfjdcuMREbFY5QMCgKTiBWITIlQJytE+Zr6k2qPiqGwN6CDLDuD
         vztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880191; x=1790484991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhyKqtsY06vLNdvd6vYAC+C0aLujryTRqdrSJjEz6bY=;
        b=suMStKWme6NA5+znZP0IoymelcTbZMhRNXN+7MSzilE9i1Xd1xmbT1VfH3siFRk6J0
         pnH2lM8eJn2Nx0OhSiDOsoTrL/XN3otI2BMwpRiynXcHAAniTuEtaPPDju9GmTZ4F5zE
         4HKJpuH/HarO283n23QBMs8ksrI4YCLXerLHv0JfOwmD+wIkwJppox3KX9O8aTTwvD3s
         JDNOaehIBk2x6KthFpfVEONw151satAPMCzchTUqmAAMaY/N22/xP/WIJpaI7oxnIGu2
         0pbd9H3cgHIPLapcPmifWyqra2iPqKcGWm+bfxzbQoothlJnCCmWeKqLn9VDaaPWH7AJ
         lqSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyBwzTkDNC6h2pZ9N0F8wBYacyhMdXydvIOOtyPyBlkwVzCGHH/xB/48iFTEwQ/y3z+4ZHUJtyxQmI2u8=@vger.kernel.org
X-Gm-Message-State: AFuF++me//ZarTedfiSdCzdlso479v8XCEQJ+LJqET4hqdX42pzjhdgl
	iZM7ivT4gPsC2gENybj4w7IXR6KWXutbkZEcgzAoukGzGE489dd6n1iF
X-Gm-Gg: AYBFou3zYLK4PbhyIoWGVKcd5h1TUG3DkIhN5Q4QrdaXtJwMFWRSgP6wczHMMXsclg1
	XHJg8Tz0v+qkLRgjDpdo2htaWYpS3DS2AzZLvZqvoIuqyrHrSMLQY81wc/5O25u/WkokXkBZC37
	VJe6kLoSIs64F7yHQQb7YgoQj5a1kg5AZFO5Ap3fNr4IFzBTLEZEJahHODSLh4shOeODW+8P/gQ
	B+74PGb0W+D7MWoTvppd05CBer2M4CHZQKVT6UYJO9/d+0UfSy0pUDmPt1bP1oe9v3AXGA6ono4
	98pjbLdFKUYIWtcr64TuhlcHLA4ePCWrsS5uGTpEtjnnzMi5m1z5M46nXMGCb9XbV2Dl0JwH3iX
	XCw+GaMP/dV/B6EmftYczan4OiMOvPaJ/RYw6XeZp6iQekk9SSLYWhk7iCMZgApmDvwFsFYkBn5
	4XygciRs0OfhZu1BhZJiaYecw/umjOejKtHse9vaTI0mgl+sCF7N7rdxW8UdO56KyzRyn1lfT3j
	ymNU6FlN8UolddSPOlWithIhb87Vx78GikORjDP97500g3aPZSuCEi9L6J2IYQTOBX8t4355x9R
	+XbP0ofGcxL11N6jGR/U6c3lugtJFwBzkdv3HlsqXG+HA9Y=
X-Received: by 2002:a17:903:1446:b0:2da:eb8f:b4e4 with SMTP id d9443c01a7336-2ddb1add397mr117214805ad.7.1789880191567;
        Sat, 19 Sep 2026 21:56:31 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:31 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:48 +1000
Subject: [PATCH 09/28] ASoC: ops: Move guts out of snd_soc_limit_volume
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-9-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1949;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ofWNdRfEPmyBqzJBf/dI8RMLcLf8D6L0C2OlsVRutbo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xXaG63U53++zvmJ51PEZI2s0OpTh2NTF/oY6Ww2/
 bGnqHRrx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKqfhTH8z/nL9d9t399GmTaj31sO7E/klD6itHY9U2Sj2g7BxFc/MxkZ5q2a3aJ
 r5a1bdVfwxPWl+0T3vOXK2SNh4WS2vHdeF5scHwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

In advance of other changes, move the modification of the control itself
into function of its own.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/soc-ops.c | 28 +++++++++++++------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 142f407e3939..e572b05840b4 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -434,6 +434,16 @@ static int snd_soc_clip_to_platform_max(struct snd_kcontrol *kctl)
 	return ret;
 }
 
+static int soc_limit_volume(struct snd_kcontrol *kctl, int max)
+{
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
+
+	if (max <= 0 || max > mc->max - mc->min)
+		return -EINVAL;
+	mc->platform_max = max;
+	return snd_soc_clip_to_platform_max(kctl);
+}
+
 /**
  * snd_soc_limit_volume - Set new limit to an existing volume control.
  *
@@ -446,28 +456,20 @@ static int snd_soc_clip_to_platform_max(struct snd_kcontrol *kctl)
 int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 {
 	struct snd_kcontrol *kctl;
-	int ret = -EINVAL;
 
-	/* Sanity check for name and max */
-	if (unlikely(!name || max <= 0))
+	/* Sanity check for name */
+	if (unlikely(!name))
 		return -EINVAL;
 
 	kctl = snd_soc_card_get_kcontrol(card, name);
-	if (kctl) {
-		struct soc_mixer_control *mc =
-			(struct soc_mixer_control *)kctl->private_value;
-
-		if (max <= mc->max - mc->min) {
-			mc->platform_max = max;
-			ret = snd_soc_clip_to_platform_max(kctl);
-		}
-	} else {
+	if (!kctl) {
 		/* Some cards blindly add limits for multiple variants. */
 		dev_dbg(card->dev, "Volume limit for unknown control '%s'\n",
 			name);
+		return -EINVAL;
 	}
 
-	return ret;
+	return soc_limit_volume(kctl, max);
 }
 EXPORT_SYMBOL_GPL(snd_soc_limit_volume);
 

-- 
2.55.0

