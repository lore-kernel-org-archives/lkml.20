Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013738;
	b=M7I3HcRLb8NOwyAc6voWrCCPHgb/hqBB1xKiQt8whJ4yMaPJeo7VcJtkQL2cjuKnFKkq
	 SShiSTwT4xZ0QFRVGbgo0hzEaQ8/GeDTfpmMurQzWUligV4IGFg0RnfCJK4dKVNQpfPcT
	 1CjvQbOfeSczWMlm9hkJesBrdlHY3BuMLGU9YxFpjUzpHr1Hm0yKTaLTD69bgE3WVM2hw
	 MCgu8iLXOk2innfAgpiFV2OYcsyDtLCt/u9ETvGlZyhMEwwE+7AcpGufXmlHgV3bTCpx1
	 j5fOb5Px4M1aAyXnz44cG4/FI81S5VBEy+dB10ARV4YTjRDaRJ3X5xD/aPowxhG7wWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Zze3WV/bZ/nENgJuAp4NPKKGDAirXyPeBw8bCP7Z3UE=;
	b=kzf3372E7/PGABFUAIsKPizKgYdlCA83Mue3GBLIUiPWv9Ng5jVsPirwWAcbrgPR7RNF
	 mSzLQSoujAEQASmrlcZlOeeSmjA4SnZTVEBh58bfjZmGfkXRbQ7ZCMBUHDzf/TdJp4xyj
	 XhmJD92pATz/BrKx1QB6nD/0/tFraZoUkTRAIJXPhUJXUCisqgbf6tnYt4P71xcIU0qWz
	 1jMId4pGNrIFbk3B6AG4swBVAonI28POQG6k+6gIX4l0jTJbNZDczJnf7x6UaGIH5r+5T
	 wEDU+uw6TNl18Oz0SWRqXr5zwYQ8FL8S9tOuCue5ubwYQEiHtztUrcm6H0dBseWDpZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dYWGpYgZ;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FEA60A263A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48FEA60A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dYWGpYgZ
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so17307025e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013737; x=1793618537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zze3WV/bZ/nENgJuAp4NPKKGDAirXyPeBw8bCP7Z3UE=;
        b=dYWGpYgZ7PegEG+nlFt7hw0dkDWlcodfSSqXH4LU5zKZ1ZPaVnrEaGx1XTK0S2nRlU
         99LvYfPrZeTUclCYRWA8QSojLv7qK8CQoXoA5Y+WDAopm483+E3CSLWgqpix25cd5ShH
         oQ86PHdh2JQB1arIeR1qTCcPteE2gJhi9UF4dirQIsfp9RlmoHGy0bVHG2EfPtTzKm5L
         p9Sbn6uLdTIZduVVcLeRJyl4q51Dd0iAW+XhesBMsXIIVIhG8sC08U6wIAW+NSQNrI2F
         FsfccwDmkleNwrYDihiP6jyqrwXHsG1QeW4qAZLn1E7YLrLE6EGb3isRVcGq6afZWUj6
         YBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013737; x=1793618537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zze3WV/bZ/nENgJuAp4NPKKGDAirXyPeBw8bCP7Z3UE=;
        b=tppzK9HnKpQPU83licx/L1+ZYNsnB/Exm8p+u0+ixNM6aJipZcSrQMpzJJZty6Mrpj
         dA30OLaJXEtHwY5mTDhd9x5WIouIpdk8F6xwZVRtt4YFuFXox8zFL0U/XXRyyedxyTmd
         3SP3bED6t/wTSa8oKoEdZDkTaxZcFu0MjELD6WP0P4ix2sd+hOc+71t3PVD5l8V46Wix
         H6H1VOjhwq7HFsEmi28qTHN0zNWVStL+bg/H2pjMmXMHqHcblPRvhbypNhxrnDfaesbV
         7kW8qPqhZfL4PKROQ+gCB/ITTLqtwyT2fiJvmO7bpcXp4LBLg/BG6BqRNtbQat7Avg49
         4VKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfNRApFVJeQ6reH/Cpyio6HS/RWvM+xwD3+OSo4EjBLhVT6UKhpYVXO3D771t0EZ0oeoeLTNgig45O5hY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmuelqvHH5BMT5IGtoSsrG6nVgbDc36OacKIRYvHM4+Ga2+bJH
	ksTHT2GPqYJBWAQgmIGyicRAvYF9WnNmu7u3D1S/OENdZl0gOW4I7j8=
X-Gm-Gg: AYBFou3ZakmPFFpSj6Y4MU+p0jpYce8+3Dm/ESJvrB80B/WIuJBlgthfQgP5XgSKpsI
	o701JTw9ZDEcxdKWTM7SLITRcToW22DweoE5Om/7qZqywr+2xgHtpo8fJNoQpEirOI+YSa6UkRZ
	T5QOR1Tdg/44Dn8zdlNmRRmPfSldRNjmGjBg1aiWDiVakEnB5jrcpO7nNFR5aOMjB13rQqVc3w0
	pIJ/3h8tJHof2b2E3Oz51aKBTIQxXqFWzp0zSwmgNX/avV6nJUMqKEN5pzx0dDSIbyeiu8LfU/K
	a/i+csmsNvuQC6wy5Y5cYEBZ/Unqvt4UsS5N3jwMZvnN8VIqEe/VSbE/efGFOKumPuxZwu59IRb
	/mJCsDTC/USjOt1yEGk0OXGOatpeFU7EwkcC1uDsxVSmSircuzOMi1XfJbdqeQOaVcvsWuNFlp2
	DjAA4RjPLhE9udIxSnPVT6Mmyl8+KA8PZOkyK00CW2dWFgmwklWKB+JDSYhfRcekNGhd7j6CLi3
	1OdZOtkL3/j4VAEuWclyrbPfw==
X-Received: by 2002:a05:600c:3e1a:b0:4a2:526b:d3fd with SMTP id 5b1f17b1804b1-4a35aca72b1mr122086875e9.15.1793013736741;
        Mon, 26 Oct 2026 04:22:16 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f59750sm129141265e9.0.2026.10.26.04.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:22:16 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Bard Liao <bardliao@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jorge Eduardo Candelaria <jorge.candelaria@ti.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH 2/4] ASoC: rt5659: cancel jack_detect_work on component remove
Date: Mon, 26 Oct 2026 11:22:10 +0000
Message-ID: <20261026112212.2519775-3-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026112212.2519775-1-tristmd@gmail.com>
References: <20261026112212.2519775-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

rt5659_remove() resets the codec via regmap_write() but does not cancel
the pending jack_detect_work. Since the IRQ is registered with
devm_request_threaded_irq(), it remains active until after the component
remove callback returns.  The IRQ handler (rt5659_irq) schedules
jack_detect_work, so a late interrupt can queue work that runs against a
reset codec.

Track successful IRQ acquisition with a flag so that disable_irq()
only quiesces a line this driver actually owns.  On component remove,
disable the IRQ to synchronize with any running handler and prevent
new enqueues, then drain the residual jack_detect_work synchronously
before resetting the hardware.  On the next component probe (card
rebind), re-enable the IRQ to restore jack detection.

Fixes: d3cb2de2479b ("ASoC: rt5659: add rt5659 codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/soc/codecs/rt5659.c | 17 ++++++++++++++++-
 sound/soc/codecs/rt5659.h |  2 ++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index 3097ee6d4e89f..340d3e7be7a40 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -3664,6 +3664,12 @@ static int rt5659_probe(struct snd_soc_component *component)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt5659_priv *rt5659 = snd_soc_component_get_drvdata(component);
+	struct i2c_client *i2c = to_i2c_client(component->dev);
+
+	if (rt5659->irq_disabled) {
+		enable_irq(i2c->irq);
+		rt5659->irq_disabled = false;
+	}
 
 	rt5659->component = component;
 
@@ -3684,7 +3690,14 @@ static int rt5659_probe(struct snd_soc_component *component)
 static void rt5659_remove(struct snd_soc_component *component)
 {
 	struct rt5659_priv *rt5659 = snd_soc_component_get_drvdata(component);
+	struct i2c_client *i2c = to_i2c_client(component->dev);
+
+	if (rt5659->irq_acquired) {
+		disable_irq(i2c->irq);
+		rt5659->irq_disabled = true;
+	}
 
+	cancel_delayed_work_sync(&rt5659->jack_detect_work);
 	regmap_write(rt5659->regmap, RT5659_RESET, 0);
 }
 
@@ -4290,7 +4303,9 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 		ret = devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
 			rt5659_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
 			| IRQF_ONESHOT, "rt5659", rt5659);
-		if (ret)
+		if (!ret)
+			rt5659->irq_acquired = true;
+		else
 			dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);
 
 		/* Enable IRQ output for GPIO1 pin any way */
diff --git a/sound/soc/codecs/rt5659.h b/sound/soc/codecs/rt5659.h
index b49fd8baf4e7e..4df7d7dd99e16 100644
--- a/sound/soc/codecs/rt5659.h
+++ b/sound/soc/codecs/rt5659.h
@@ -1813,6 +1813,8 @@ struct rt5659_priv {
 	int jack_type;
 	bool hda_hp_plugged;
 	bool hda_mic_plugged;
+	bool irq_acquired;
+	bool irq_disabled;
 };
 
 int rt5659_set_jack_detect(struct snd_soc_component *component,
-- 
2.47.3

