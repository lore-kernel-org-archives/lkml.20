Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793423684;
	b=opVNt0zFJpsALOxAEtFwa3k4n3UGaZv9aHndXybo4soSodqAe3QSX7YHOJh0qgsyGljj
	 TOiDXgOtXbWwthw497VF21iMtl1nVXtUquEXBR6YFGWDh+uO/gOny1F6WCCgP/H81Tdvr
	 /bnqsJvPEhXIcIUdv0vmbmsJ9jRXO6Rn1+4EnAzuw0r01+n5k78oOriQXIV6I2TgyoEGv
	 xfnsJd8PxI7WUyBtmK0nDqE7Jknisr8IqdlD9vC1bQhQP9SNpS7DZDl8QZftbDlO6CWxV
	 KtNRDcSS4U8d0BzDoaJmpjK9X9CPPC4dSfy9H0Ly14NobFUnKcTNKm7ImkCtDFioo7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793423684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=30pXtA53sZGVQJXhOX5wcd/+heNkrnwBbzqhvNbEVSk=;
	b=4lxxJ93VJ5D0RFNKV6QDmvZu9WKwKbIHYcdxTBc11YAuygnMt6JNG6JcvWAv6lkscz3C
	 yOuvcaPyZxDkmVbEDae7M4NgiQAlank1iH+UptGt4KVXbWlyDJamWrOw9x4wW1rwuPE+D
	 7NBQ9/MeJJ6Q4BZdhC7dWjPVJsveka9FZinpzc4vPSuOTHVNAXxfqeVOG2cP6BDn5sKok
	 iOx7dRWfNtPI1HE6Cx4luOyu287kX1Pf8uwlT3eiAH5/uvjutwVfDVEr8mDECqSLX6ecM
	 07hgjf/oxFPZ+yQEhI0Nb12fvAsghB0VorWBzDpaT5jx92aEFBQeta+fITQ7KDk99sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Qebz+Iv;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05313606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05313606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Qebz+Iv
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ae486f8a27so891213a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793423683; x=1794028483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=30pXtA53sZGVQJXhOX5wcd/+heNkrnwBbzqhvNbEVSk=;
        b=0Qebz+IvHEj8y0YEmn1Iqe4g3pNuphv6f/Ho6U88xAI5VD4fETOi8Rtc2TpTvmDYKE
         WoF8fgj83fGlZnR3gsVPOLm8vzj4dVrgU+9GSMVTLWyBmdbsVuvDR02XkQHPHmhm1mKw
         9agGnPJY2v0C9O/ZWV4KweZTb2oQbiotWogQd4RvfokQrnD3D5rwnMqibYY6wJlNOuvB
         nd8tfvZYZRisWGvtCMSYuLfCbOXkgXQO422a4nY1LtFJrWl4e2G5S4X0MKdUXI5xabUJ
         5qMqIT/Wt4jKvLrzd4/9PeBwL1xvFQlGwmtTRF4DpQPQxOPNPFB2gKX87iuXpFCsElMO
         tFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793423683; x=1794028483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=30pXtA53sZGVQJXhOX5wcd/+heNkrnwBbzqhvNbEVSk=;
        b=LLi95tZEJcIBkiZTpawhCbaraQ4xiRtXH22gRPK7yOqxzmP4596fOFwnHTeiK+9zHT
         p0UR48cuO7XjNDkzGJ6cCmHqOXxOuHWrWCif6iihkOlnqWXbwZrCyXZeFxmqZcM201HJ
         SMtOhaqg4LsR9h2hz5kFwcbXTZ68TYgtcdBk1txeaYlbQ/P9Mxt+1aLH+pbSPep8slQB
         6GJftRRuKiyeg31FEcRAoZFBYq3CU6IGtNY3jEkiqnR6fuzCNPHb+/QMKqp2NLAYfVXM
         1pIFy4W+tKZl4SilxI8rRxPEZCpPDdt6w8IvVOU+2D0dDXxyc7QJDMUhUfG6nBPi8cF+
         pc1g==
X-Forwarded-Encrypted: i=1; AKwUvBwzyW1cfZ9NnTAp8KSG7BirktkLyUAYGb7Odplfq3vWwLlX6Mqw0qHdqXo1xASHRJLUJmSsrzyfWrIYnes=@vger.kernel.org
X-Gm-Message-State: AFq9FYIua8mZUr7GiEx832723mB5TAXJdrYPEJNmK90RtOaFrRVMFn3m
	LzRa6JNkUZpKCeHrQRefRCSzLzFiolJAlclUKk4+00Jc4n6+trf3erkH
X-Gm-Gg: AYBFou3X7q8R26eIzrzsVyMyiom75+vWcwOUZVCw5i4sJrOI3Zzrm3Rkf2mY5gTr8x3
	riNVaKQhj4f3V16YhMiGEH0uquBET9Kt8dGHMZ17a3g64fEyCLVq6dl3MBcfWg6Nm2ec3j3BxAd
	knZH7dr7VWlRaSTfLOYvgBT8dcC8aLeZKqb3BqZ6DC4oAoyS+QzRbGCuIglbCIGJrCizsPxkqMo
	ZzH/kpk09mazZjpZtqN9LLxKqdi1L0zw3FKbNzkghbeMHNTcG9ptr9PN0gxuMmQURt8UoQUJ+s/
	UtnHfw56RcJBlIClWraLO7I7fLPoL3CIwFiTvtiAkBy3TlFW/3Up5iIPBFgz6YoZ265/8AZWeCu
	A7K6dZLsX1vppbEIa3aOZJ5Tyx9bWyXZvYWTTRg3ctRwkPy9XdAZjIsgRG+wiy2boc/H/DL/Z2p
	OzckkaPxqsoobdsJkleQ9MXW0R5aJe6HVZU5IrXEFbwps20NIr27LogZpYoCJmkzPu3xG2TfgqL
	gJ/pXukCIrTJcgcRY3ScUbvX78HlYTSdYfTtr7B4XRe0HIigmPn7tLKiNS4Isfsu2v9bMxEmC2l
	jlVG38CFpO/caLWqtNDt/7yl
X-Received: by 2002:a17:90b:518b:b0:39e:59a0:46b5 with SMTP id 98e67ed59e1d1-3ae89734b72mr3900993a91.24.1793423683335;
        Fri, 30 Oct 2026 22:14:43 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm6216305a91.14.2026.10.30.22.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 22:14:42 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4 1/5] ALSA: hda: Serialize codec probe and remove on the same bus
Date: Sat, 31 Oct 2026 13:14:26 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-0@gmail.com>
References: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-0@gmail.com>
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

The probe and remove of different codecs on one HD-audio bus can run at
the same time, for example when two codecs are bound and unbound through
sysfs. A codec probe on a registered card calls snd_card_register(),
which walks card->devices in snd_device_register_all(), while the remove
of another codec frees its PCMs and deletes them from the same list.
The list has no lock of its own. The controller probe and the reconfig
sysfs knob also call snd_card_register() after the codecs are bound, so
a codec bound or unbound through sysfs at that time changes the list as
well.

Add a mutex to struct hdac_bus and hold it in hda_codec_driver_probe()
and hda_codec_driver_remove(). Add snd_hda_card_register(), which
registers the card of a bus under the same mutex, and use it in the
controller drivers and in reconfig_codec(). The ASoC ext_ops paths are
unchanged.

Fixes: bcd96557bd0a ("ALSA: hda - Build PCMs and controls at codec driver probe")
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 include/sound/hda_codec.h          |  1 +
 include/sound/hdaudio.h            |  1 +
 sound/hda/common/bind.c            | 26 ++++++++++++++++++++++++++
 sound/hda/common/sysfs.c           |  2 +-
 sound/hda/controllers/acpi.c       |  2 +-
 sound/hda/controllers/cix-ipbloq.c |  2 +-
 sound/hda/controllers/intel.c      |  2 +-
 sound/hda/controllers/tegra.c      |  2 +-
 sound/hda/core/bus.c               |  1 +
 9 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index c7f29ad64e02..084f06488a95 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -318,6 +318,7 @@ int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
 int snd_hda_codec_configure(struct hda_codec *codec);
 int snd_hda_codec_update_widgets(struct hda_codec *codec);
 void snd_hda_codec_register(struct hda_codec *codec);
+int snd_hda_card_register(struct hda_bus *bus);
 void snd_hda_codec_unregister(struct hda_codec *codec);
 void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec);
 
diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 04fd4794bcee..682e10a0f6db 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -367,6 +367,7 @@ struct hdac_bus {
 	spinlock_t reg_lock;
 	struct mutex cmd_mutex;
 	struct mutex lock;
+	struct mutex codec_bind_lock;	/* codec driver bind, card register */
 
 	/* DRM component interface */
 	struct drm_audio_component *audio_component;
diff --git a/sound/hda/common/bind.c b/sound/hda/common/bind.c
index 957feace0f58..de867f34f290 100644
--- a/sound/hda/common/bind.c
+++ b/sound/hda/common/bind.c
@@ -104,6 +104,12 @@ static int hda_codec_driver_probe(struct device *dev)
 	if (WARN_ON(!codec->preset))
 		return -EINVAL;
 
+	/*
+	 * snd_card_register() below walks the device list of the card, which
+	 * the removal of another codec changes when it frees its PCMs.
+	 */
+	mutex_lock(&codec->bus->core.codec_bind_lock);
+
 	err = snd_hda_codec_set_name(codec, codec->preset->name);
 	if (err < 0)
 		goto error;
@@ -140,6 +146,7 @@ static int hda_codec_driver_probe(struct device *dev)
 	}
 
 	codec->core.lazy_cache = true;
+	mutex_unlock(&codec->bus->core.codec_bind_lock);
 	return 0;
 
  error_module:
@@ -153,6 +160,7 @@ static int hda_codec_driver_probe(struct device *dev)
  error:
 	snd_hda_codec_cleanup_for_unbind(codec);
 	codec->preset = NULL;
+	mutex_unlock(&codec->bus->core.codec_bind_lock);
 	return err;
 }
 
@@ -171,6 +179,7 @@ static int hda_codec_driver_remove(struct device *dev)
 		return codec->bus->core.ext_ops->hdev_detach(&codec->core);
 	}
 
+	guard(mutex)(&codec->bus->core.codec_bind_lock);
 	snd_hda_codec_disconnect_pcms(codec);
 	snd_hda_jack_tbl_disconnect(codec);
 	snd_refcount_sync(&codec->pcm_ref);
@@ -184,6 +193,23 @@ static int hda_codec_driver_remove(struct device *dev)
 	return 0;
 }
 
+/**
+ * snd_hda_card_register - register the card of an HD-audio bus
+ * @bus: HD-audio bus
+ *
+ * snd_card_register() walks the device list of the card, which codec driver
+ * probe and remove on the same bus change.  Register the card with them
+ * excluded.
+ *
+ * Return: zero or a negative error code.
+ */
+int snd_hda_card_register(struct hda_bus *bus)
+{
+	guard(mutex)(&bus->core.codec_bind_lock);
+	return snd_card_register(bus->card);
+}
+EXPORT_SYMBOL_GPL(snd_hda_card_register);
+
 static void hda_codec_driver_shutdown(struct device *dev)
 {
 	snd_hda_codec_shutdown(dev_to_hda_codec(dev));
diff --git a/sound/hda/common/sysfs.c b/sound/hda/common/sysfs.c
index bf65223fde10..ac08ee6f9c10 100644
--- a/sound/hda/common/sysfs.c
+++ b/sound/hda/common/sysfs.c
@@ -144,7 +144,7 @@ static int reconfig_codec(struct hda_codec *codec)
 	err = device_reprobe(hda_codec_dev(codec));
 	if (err < 0)
 		return err;
-	return snd_card_register(codec->card);
+	return snd_hda_card_register(codec->bus);
 }
 
 /*
diff --git a/sound/hda/controllers/acpi.c b/sound/hda/controllers/acpi.c
index 04b261dde22e..87e5f3f14a2b 100644
--- a/sound/hda/controllers/acpi.c
+++ b/sound/hda/controllers/acpi.c
@@ -166,7 +166,7 @@ static void hda_acpi_probe_work(struct work_struct *work)
 	if (err < 0)
 		return;
 
-	err = snd_card_register(chip->card);
+	err = snd_hda_card_register(&chip->bus);
 	if (err < 0)
 		return;
 
diff --git a/sound/hda/controllers/cix-ipbloq.c b/sound/hda/controllers/cix-ipbloq.c
index c1084a915c13..c193dc1428c2 100644
--- a/sound/hda/controllers/cix-ipbloq.c
+++ b/sound/hda/controllers/cix-ipbloq.c
@@ -80,7 +80,7 @@ static int cix_ipbloq_hda_probe_codec(struct cix_ipbloq_hda *hda)
 		return err;
 	}
 
-	err = snd_card_register(chip->card);
+	err = snd_hda_card_register(&chip->bus);
 	if (err < 0) {
 		dev_err(hda->dev, "card register failed: %d\n", err);
 		return err;
diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 29679fe7f401..0a62723b3454 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -2434,7 +2434,7 @@ static int azx_probe_continue(struct azx *chip, bool free_on_error)
 		}
 	}
 
-	err = snd_card_register(chip->card);
+	err = snd_hda_card_register(&chip->bus);
 	if (err < 0)
 		goto out_free;
 
diff --git a/sound/hda/controllers/tegra.c b/sound/hda/controllers/tegra.c
index 674cc0f79c3c..d601aa3db8b4 100644
--- a/sound/hda/controllers/tegra.c
+++ b/sound/hda/controllers/tegra.c
@@ -607,7 +607,7 @@ static void hda_tegra_probe_work(struct work_struct *work)
 	if (err < 0)
 		return;
 
-	err = snd_card_register(chip->card);
+	err = snd_hda_card_register(&chip->bus);
 	if (err < 0)
 		return;
 
diff --git a/sound/hda/core/bus.c b/sound/hda/core/bus.c
index 02462bd035e7..304110c9a6a7 100644
--- a/sound/hda/core/bus.c
+++ b/sound/hda/core/bus.c
@@ -44,6 +44,7 @@ int snd_hdac_bus_init(struct hdac_bus *bus, struct device *dev,
 	spin_lock_init(&bus->reg_lock);
 	mutex_init(&bus->cmd_mutex);
 	mutex_init(&bus->lock);
+	mutex_init(&bus->codec_bind_lock);
 	INIT_LIST_HEAD(&bus->hlink_list);
 	init_waitqueue_head(&bus->rirb_wq);
 	bus->irq = -1;
