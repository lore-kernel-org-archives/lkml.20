Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289512;
	b=LI2L6LzVqYjdMdvdvsB6/kDKoCKWBBDKKykifE5c7xBDZE3LLx8nN9p9qxctbUvKUCTF
	 iAHY82czYZJl61LNiuVmlFkmU5LHAfLmI8S2bQNPRJzEW5NTmoWytp692Wnr6PwBeGWZw
	 36y9MFnsfIri86E+KTJ7tAO0sk0rUL/oXqX0cS5miALx09FUQEgBbYpoK7uWXCE1s0Yvb
	 sM1IycnGrZ4ByCmObbk1FgQ44ABOposPk1cFuPsaHp1UDDt1wckN3IqKF4PukAZJug5ts
	 nuWUn7+8bxfrWgEW18Kh5bSvjoCfR7GUTNhaanIZcE1oBQP63VJjplMr6OLOl4I9WlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Et+Zb5EdR7iyJthKkThJ4eFs29yWr3uUx0op6Z4LpU4=;
	b=cUHB4OZdi8oc/LEjSjIObwX7Sd8QkPmShHsxJX+2+b8/ior0GuaUC8F2L3swfQ2uqdcX
	 9L8dJ3oMeU3y//hYsRW35Vpd3ghK9jJlEoIPvScm2yJz4yRYZAmp8pES7FPrjhYEbys8Y
	 eq8/AQn7GZr2qnYVHEPYdfMxCe0NqNkUdJS3TMT0PBOED7obTIPHS53lb2djCGiMCr3vH
	 RNB4SObVmF1UUHw9XTjXmMqU3Ij1WVjMMqbI0NZ54ui6o9MAA0N4Y0ZQ9+AhwcD2fvnd/
	 PZBO93gUiOfrDUEeqE9iKu6aZNXuV54+VmosPvbkrBXo1FwzzkN4ecX9wjIz3vSU++w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wjxUazJX;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665C2606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 665C2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wjxUazJX
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3339034eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794289511; x=1794894311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Et+Zb5EdR7iyJthKkThJ4eFs29yWr3uUx0op6Z4LpU4=;
        b=wjxUazJX3FsrAGCWTXLFOUZlYc92KL2tlO9GPsGNDKzm21dwnGGJFJTPdTkzrhE1Da
         O7yVhekIWNpO5UxKE4+PYt1sEetjA0Wbrl3Bkn69NBMIwjUCyi3SFnmZksThjK/imLqG
         L6kVu87FDOmftCamupWn0CnIAa4EhaSsQoOg5oEKHXbV626ag/XrZE+qiO5ANBEdzMYM
         Yz69Zsrcsk1kyL4hkgKvMMGMbxhswuNwgVxmfUyMoiZw0Io1erp0suJVBoO0QnsTiRmU
         o5Z5yjfjLkq+ZfMNxgJEarEQ2F6LamJjqCQsGwEvmArjyvaYcwLUb7qrA08ZJQtRdrKl
         svYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289511; x=1794894311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Et+Zb5EdR7iyJthKkThJ4eFs29yWr3uUx0op6Z4LpU4=;
        b=nFUPGM5RExeJD0Uac/4dI90vMi0r+7bO/sJLeY639mIx6VuCbiNdFBEs62WJGl8M6/
         uh1DbepJew+T2cC+0SWnTs7LFz5mwQorX9NW6rFc7fObUP1UADDIwa9K7+3nrlWZuw3k
         Ui5SDCtZU/wKStkaswNjW9O24K6huDA1VGiOXZ/z+XKqUK4iFUHJmuq8n9OHVg5Gd6dQ
         jKEXA0sxlfhBIdviu9UgK8rzOIQdbZlqt0ypziVyI2j/KCYswYOEVESBksuR1VRO4Cyx
         /nzQfVZt+u1592enkUj41c+4ikqMxCEI1UFI2gHypdCV24K36u0GZherofi+oKnQWdRt
         l1xA==
X-Forwarded-Encrypted: i=1; AL+hErFoec0dImbMq70cBDqwLqRGnwtV3rcGeJ+5+10sri0CdyclnNhxIXmJE5ipgXz6AlxLGLX0E9o2f/C9wKo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WwrXvPIwdGZqv65cZSarlcSMbefkKCoqPagAzR2RM5EVvKxy0
	FtaBo733MKRd1Gp/L+kH/rQLQNxasO49q9lR/9pXKFaDSGPSUHPGBj6l
X-Gm-Gg: AYBFou1oE3tv9evTpDH50tfJKYU04s/7TdbvTbzh+xyiwj5OpWVTpOB0cL+LRSSmVbf
	ShYoUQJpd5yK/n+OwKJO8kYMDa0ppZbhK7in7OMI8tlJg9IVvxog4MNeNcLSQezYGzzhGQuBSaM
	p+B5Wdekm4kpY7uWA7yXS2WNpDmHCsegAgfC6H73x15woJgLAmbrjd3/K3Ji/283h3nzNKYSFxm
	4QLqs28vvfXvz+AJM3FYxSLqsgLiofmajScSUJpbLiNbQ/9SFQs5pPAO2EVvBKq51s85D+OMr0+
	rrZ7oxSopiqG4o83YjAa+3Q22mBLt4F1TfZYEcEoGn8pJuJ9qGx4jijevNdRNsUguJ+6hV/agkS
	fLyyOPHM2OfTJUgqpvQMd49NlqFbhImdKf3nMO8Ab6b18BnuANpE41uIj+tu9e6XHgtXeqP/fZD
	usgjY86wLfz92Pi7h0P490JehdxCKTNfI+GOOcfUC9niTCAyZfmkoVAyLiO1YjTyMscU0fn4YJ6
	DCNFZQzZsqt82P5PFrZVTuRTWUeI6DQ1bdTvJDzcxTDj6WC9XQv/CQjkPU1ZXbdOnfC0hOH/KbH
	VpTj0FBWdINOgBVQObzax8mrij1hIkoAUqs9Y/NNw7evltmq
X-Received: by 2002:a05:7022:1701:b0:1a8:9857:2102 with SMTP id a92af1059eb24-1b3b6185abamr1807080c88.30.1794289511064;
        Mon, 09 Nov 2026 21:45:11 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ad6f11csm3466120eec.0.2026.11.09.21.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:45:10 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] ASoC: ak4613: cancel dummy write work on component removal
Date: Tue, 10 Nov 2026 14:44:53 +0900
Message-ID: <20261110054453.2286414-1-hj351016@gmail.com>
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

ak4613_dai_trigger() schedules priv->dummy_write_work on playback start
to issue the PW_MGMT1/PW_MGMT3 dummy writes from a non-atomic context.
The worker dereferences ak4613_priv and accesses the component over I2C.

priv is allocated with devm_kzalloc() and the component driver has no
remove callback, so nothing cancels the work on unbind. If the device is
unbound while the work is still pending, the worker runs after priv has
been freed by devres, resulting in a use-after-free.

Cancel the work from a component remove callback, which runs while priv
and the component are still valid.

Fixes: 03bbf9f5e4eb ("ASoC: ak4613: call dummy write for PW_MGMT1/3 when Playback")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 sound/soc/codecs/ak4613.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index 0000000..0000000 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -807,7 +807,15 @@ static int ak4613_resume(struct snd_soc_component *component)
 	return regcache_sync(regmap);
 }

+static void ak4613_remove(struct snd_soc_component *component)
+{
+	struct ak4613_priv *priv = snd_soc_component_get_drvdata(component);
+
+	cancel_work_sync(&priv->dummy_write_work);
+}
+
 static const struct snd_soc_component_driver soc_component_dev_ak4613 = {
+	.remove			= ak4613_remove,
 	.suspend		= ak4613_suspend,
 	.resume			= ak4613_resume,
 	.set_bias_level		= ak4613_set_bias_level,
--
2.43.0
