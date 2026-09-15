Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6546B3D8104
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464337; cv=none; b=PkwitjRwTrxi4WJAl8esjbH76HrmPzn/+ugI+cmCFK7DYl1pxwfvMSVfVlDVVdcfXY/cJAlYR1u2c5vNUjdQ4DsY9tPIYyorHmTKd92pbAr1k8HUw8D6PhqX+d1ztnVccighflrqfBQ40buNaYw+tZCxZYYdAYHqEuBplPaUKUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464337; c=relaxed/simple;
	bh=lXe6aSYFPWJ7c/AmG9xUu7LcDVy6kBr+8frdycfYPTc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SDA/5BVRKzXX3xOxVn77GgySnd8E3Lm0mHOx75kPqpapb4onAcYUKtbsS55WdZHBSOikzhbgt0aCHrIpfecjUZ6xyOJSt975wvHpGpoYzZzHT4Owy47apK8Ro8UgfHxsrnjeaXQYcpVfBIzrA1QDkdHWtgRo/T21j5koL5DyPiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDQSHAt1; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDQSHAt1"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ec6188so369225ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789464336; x=1790069136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3AeTuTtLFD6wST7Qvf0FgJNMqRZl8DBcYMCo5RZWoxc=;
        b=gDQSHAt1THzTAMx9jCiyrVan1OKnQccbJig0dRPSnKqBKnQSJ1pyrJRLjkiT5y+757
         Xq8rH32wQs/sC176XSKBiEJKJo6Rh5djuw2rQb9/BHFv1Frip9V4hTO3e0zVZC5tdiM7
         BgV7RvcP4IyAPDHOCAqySJRL4I9npIiMUIopsSpPy+gAF7ialT6+xO0ZBYV/iiLt3Wjl
         +lZHb0onrT/XTD+U90ZEO2OUIkWn3RWw2l8wmmOa40L5Jsk2mGYxj+iYQCWnqnURcH8p
         hUEtleOlv9A4txHlM6razBoOm/JujUbEgIF6YchSD4pubZvAbVLZZRunX/nhXYVF4Vm7
         qB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464336; x=1790069136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3AeTuTtLFD6wST7Qvf0FgJNMqRZl8DBcYMCo5RZWoxc=;
        b=J1L/54lLd0w+CpIchdRBg9kb4l9zTvzzx88BMnw9/ekalBQ63RUlamdNso3pVxoUwJ
         EKfwFUsiyK2ilMlalQJ7jVuGeZg5WYej9zSeijvYe8OJZomXNur3nn0jr5EDZpB8xo20
         cZEfCWyEu9/t3V3h8wUUem4M7MBijVxgiO9aCwYAFfRkEHutaVUtUrUmzFYmP9zl08uB
         Cu5cOGA53bB+H7Jyg5draWt7mlyHf/nvacDVNqRVqbz5Usr5EFN8vRBZgyWeTWScJ0Ia
         ISeAUjTrHcJAPJ9XRJYEbh1Zl/OpQ2JPu/3cTYKRn+Rnzoa5LwD/zfAb6EVgxAO+xhGF
         liAA==
X-Forwarded-Encrypted: i=1; AKwUvBwDzCQHfV51fIUxQvhdLIzhzj5VsRkOhN4kTx68a55Z7fwUxvpUy8r9cVS3SIYKpL99H2GVUhgYR8m4eo8=@vger.kernel.org
X-Gm-Message-State: AFuF++k0JTna8jLMmjh56oTj2TrFbEqQnL9bDj+fi7dgF9d57960FVoR
	BRTX48TBDgwLha0ZEPvTVC7c3Swi5BhROzh84SMxstHk8g0NlGtp7DlB
X-Gm-Gg: AYBFou2KB2/fw0J7chTV/w0Hd3ByKtrWNFIarLR2RV9+vLyndcE9V/c0jT9OGEigjvS
	RksO1O44lyyv40mNWxwOUG6z2BkTB5ICL953vbIfO3sni1dtZCwPvnR8rvwCMQA6m4S106rPIdz
	NtWTEzM8nsTh6Z3kSwW/0sKNJvu8aEYEXfZOwKR+Ie7jaRYnG1ds1VoQyuvFaR23mahqXCIASOd
	KukaJRk/Z2hGiDRNKrdkBW/A+ZEZnCr3vbgQgNL1ysTaYFwyAmisn29S01u+wxY2K794ZVQOcsY
	EEcT0CzaoFfn3Q0fGSa4B8OBoTYkTcRf1jai86+QYECVjr2O8vgDW+SPwldRLu/pPQOpRoaIBww
	b+y4P93SEaoUE8hP3ddDjhQjQLAWhxOUj0slZK8hgc0dqOrQY69BqFVnGQGHJc6OCHfiK6Weq6C
	Per02ecLQjZ9K04tK7Usb7NeIyiEej2qJWYNsElf3sy7FhsiTFfOxG1BhX6kezcqIhrfPK6kX7F
	TmHcXOQ7/dOr2uZles86xew/bAyyNitfeKswPl4HBVpMWL2WEz3VUWsfe3VMKyp1PPVQxPdVVCB
	HnIB/f1jrlw=
X-Received: by 2002:a17:90b:560e:b0:39d:fcbe:fe04 with SMTP id 98e67ed59e1d1-39e10c45eedmr148835a91.2.1789464335615;
        Tue, 15 Sep 2026 02:25:35 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd58af8sm4123719a91.12.2026.09.15.02.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:25:35 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	mripard@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ASoC: hdmi-codec: Report a change when the channel status moves
Date: Tue, 15 Sep 2026 18:25:15 +0900
Message-ID: <20260915092515.2638542-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The put() callback of "IEC958 Playback Default" stores all 24 channel
status bytes and then returns 0. The core notifies userspace only on a
positive return, so a write that changes what the get() callback hands
back is never announced, and a mixer holding the control open keeps
showing the old value.

Compare the stored bytes and return 1 when they move, the way
snd_hda_spdif_default_put() does.

The same shape is in img-spdif-out and uniperif_player.

No board with this codec was to hand. The change is a comparison of
driver state with no hardware behaviour in it, and mixer-test counts the
missing notification as event_missing.

Fixes: 7a8e1d44211e ("ASoC: hdmi-codec: Add iec958 controls")
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
Assisted-by: Claude:claude-opus-5
---
 sound/soc/codecs/hdmi-codec.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index bc2c22436ba6..7aa50c5bd3df 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -426,10 +426,14 @@ static int hdmi_codec_iec958_default_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
 
+	if (!memcmp(hcp->iec_status, ucontrol->value.iec958.status,
+		    sizeof(hcp->iec_status)))
+		return 0;
+
 	memcpy(hcp->iec_status, ucontrol->value.iec958.status,
 	       sizeof(hcp->iec_status));
 
-	return 0;
+	return 1;
 }
 
 static int hdmi_codec_iec958_mask_get(struct snd_kcontrol *kcontrol,
-- 
2.43.0

