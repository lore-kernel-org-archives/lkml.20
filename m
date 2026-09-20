Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3543EC819
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789897314; cv=none; b=eSpRYZSWfTByr1KLLr6OGh6F6F8I6xGQ4DAH86xYSip2WCCtSlw4I5V2g8Ld8l9lKdbQP1ocQ1THHUPKHXCc8iYVPfvtXNfIiZ+tCn9/jL5pB2YxCpXDOFFaoVW0+fF1bGyJAKkOZ5K1Pu5p9eyf2Tpr+G2L0V4ZBon4vR3Xf24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789897314; c=relaxed/simple;
	bh=4o4CU41WKjYvgi0neRFpo2N/YX2Tw5EMPGC7jH/nmmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RP6zF/1lDIFZcrKGaxQ9mTk0BqTFI/xBPVCo/cf+iwwpnKakvoBA2xCi7au7i6viviePTOeFtOf0krZABi/oY27q4NKhddZbYHolzYsWe+Rh01hjZ9yYKInpvTYIQ7/gV4m6bPUfU6QMK9vbCtiiubzx5Td8Vk0DWWb4/0ccTv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3YXN5YL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3YXN5YL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49e73611928so14828925e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789897308; x=1790502108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cFxBbhej0KlMApBCuDSAHJDNPVUA7koNspHuIptiz00=;
        b=T3YXN5YLpqRy672qoDmzOvibtS/BZZmvOGZWLTbFl20G0kZTNH3e+5/r4Yom6djcok
         ulWAI+VsrvwCp58pEl7IB86EisDGd864M67zDcXWEsqDne+ZjKQJXqIy2QnfJinvlPBw
         K6o7nNInAiupaGLoD5Ga8AzYKkjvzoC6o6Yqp6O9h2w4/VHV+9Ff/DohmFRwuXz9F+Jh
         gyDOT9DzhzQl1E1Np8MsCxM/+fKf8Mzi0cBXzxzAZPBgWNv1RYFSqX+fO0/GH4uwPCmA
         hsF8DH1SqCz9kzeKd3hxR3ceIHNcCzYr4ovib2cAXjiNHH2jwSEwFTuyuKtes/Lq891j
         Jf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789897308; x=1790502108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cFxBbhej0KlMApBCuDSAHJDNPVUA7koNspHuIptiz00=;
        b=e7wxkqqjY7K88avgIMSTGAkPXFIwfZ64wYBsrR5n/vv55mY9LER8tdh9XgZoLG8NKY
         +BAiHl6+LyBS4mcAd8bKottYr/jw3iFH3SIagmFPSvmbf8HEw1jwG/Qrmm7rfUhD0lWZ
         N8lk7aIgShogXuucJp/Cb6bx1JyBmVwQJXEGe7sMTASyg2eeH/x7uZMZrfgaCnNkU4AU
         hwOgglbBM3DS5Rw6M9WsNJ19wq5gIN7aaTdnls1LT79zzlmCeuwH+V9vtdgxuYQZSr8w
         9lX/uNftOVPX5La3GeieS9GFOwf62+Oj28FyvHYMbiOdnv8x6tIfWMsWkWFLZm+IZhno
         ccXA==
X-Forwarded-Encrypted: i=1; AKwUvBxZ6JpoCQppyZ4+StmLJeH1i6oBhDC278Cxo09bvk9Dx6lP+VNaudht5fVHT+UgyIbT7DP8ueXoqRy+nRI=@vger.kernel.org
X-Gm-Message-State: AFuF++lMO4bN+gljTbiCgQ7lO3p9gjjt3HhBD0WRMAkEN/OhbrJWSIRa
	cWduHCNvuGJ+2kDC9WbflngDM5ekiRhMO+ZYMqzWW+ugSgDJJ//vOMkS
X-Gm-Gg: AYBFou3e5j95t0HYRKjK56rPveM/hOL9F0hmuw6Qmuswt7EjWdgtX7pcUlmQk/rbFQJ
	Dfmch19KCHIZAiyPUvydxDnqhCtvKiVFXUpZ/Rr+eiiLgmGc2TXFpPbn5ThvBZ37BlurbAhMxiY
	nJ9lpPa1tsyYqc1epFRJLaUA2m6bNbjId8d6ChfvkZo/2sIulkRrA30A90Vq7BPUr4i6ipO7rdp
	zp5N2wy1fjq22ImwuunGeE9DwFIcbRVqlhIejNDKXph0BHl4tb5wH4wC5y8rCxspr8Z0FFe25w4
	usESzLH0ZDIeMemiuo62qzIGzvl2gxewCjxGO/aeM35OJUNDyLX7oR8+Sw+GB/Yw+3k0LYfNP+K
	ZenjFSgrHHxGgLZSuilsFa5hGB8pDRddp2yl2Ngs5/4M+0ntIMSTqdWXpzDmtB3XDEtYs0lWNnf
	jzlJn6O5L0vCVINWThVZ7urnwIUZFFN9NS1GA/QsCE1v2nrGoodUkvcg3lLrkckV2HwAhcwvbqs
	dkmqwr/iqAJ19C2cfFx9VCqUqoTMRfI37NYYAH2LY+BpmA=
X-Received: by 2002:a05:600c:c043:b0:49d:265e:eda6 with SMTP id 5b1f17b1804b1-49fbd1b1490mr146559765e9.2.1789897307351;
        Sun, 20 Sep 2026 02:41:47 -0700 (PDT)
Received: from localhost.localdomain ([176.220.200.33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460753sm14022265f8f.10.2026.09.20.02.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:41:46 -0700 (PDT)
From: Omer PALA <palaomer100@gmail.com>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	"Bryan O'Donoghue" <pure.logic@nexus-software.ie>,
	David Lin <dtwlin@gmail.com>,
	greybus-dev@lists.linaro.org (moderated list:GREYBUS SUBSYSTEM),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: greybus-dev@lists.linaro.org (moderated list:GREYBUS SUBSYSTEM),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] staging: greybus: change mutexes to guard macros
Date: Sun, 20 Sep 2026 12:40:54 +0300
Message-ID: <20260920094058.9664-1-palaomer100@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert mutex_lock()/mutex_unlock() pairs to the guard() and
scoped_guard() cleanup helpers where possible. This removes
error-prone goto-based unlock paths and makes it harder to
forget to release a mutex on an early return.

Signed-off-by: Omer PALA <palaomer100@gmail.com>
---
 drivers/staging/greybus/arche-platform.c | 29 +++----
 drivers/staging/greybus/audio_codec.c    | 97 ++++++++++--------------
 drivers/staging/greybus/audio_helper.c   |  3 +-
 drivers/staging/greybus/audio_topology.c | 10 +--
 drivers/staging/greybus/authentication.c | 34 ++++-----
 drivers/staging/greybus/bootrom.c        | 11 ++-
 drivers/staging/greybus/camera.c         | 60 +++++++--------
 drivers/staging/greybus/fw-download.c    | 31 ++++----
 drivers/staging/greybus/fw-management.c  | 38 ++++------
 drivers/staging/greybus/light.c          | 44 +++++------
 drivers/staging/greybus/loopback.c       | 39 +++++-----
 drivers/staging/greybus/power_supply.c   | 42 ++++------
 drivers/staging/greybus/raw.c            | 25 +++---
 drivers/staging/greybus/sdio.c           | 25 +++---
 drivers/staging/greybus/uart.c           | 30 +++-----
 15 files changed, 216 insertions(+), 302 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index de5de59ea..02322fce0 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -310,20 +310,19 @@ static ssize_t state_store(struct device *dev,
 	struct arche_platform_drvdata *arche_pdata = dev_get_drvdata(dev);
 	int ret = 0;
 
-	mutex_lock(&arche_pdata->platform_state_mutex);
+	guard(mutex)(&arche_pdata->platform_state_mutex);
 
 	if (sysfs_streq(buf, "off")) {
 		if (arche_pdata->state == ARCHE_PLATFORM_STATE_OFF)
-			goto exit;
+			return count;
 
 		/*  If SVC goes down, bring down APB's as well */
 		device_for_each_child(arche_pdata->dev, NULL, apb_poweroff);
 
 		arche_platform_poweroff_seq(arche_pdata);
-
 	} else if (sysfs_streq(buf, "active")) {
 		if (arche_pdata->state == ARCHE_PLATFORM_STATE_ACTIVE)
-			goto exit;
+			return count;
 
 		/* First we want to make sure we power off everything
 		 * and then activate back again
@@ -334,16 +333,15 @@ static ssize_t state_store(struct device *dev,
 		arche_platform_wd_irq_en(arche_pdata);
 		ret = arche_platform_coldboot_seq(arche_pdata);
 		if (ret)
-			goto exit;
-
+			return ret;
 	} else if (sysfs_streq(buf, "standby")) {
 		if (arche_pdata->state == ARCHE_PLATFORM_STATE_STANDBY)
-			goto exit;
+			return count;
 
 		dev_warn(arche_pdata->dev, "standby state not supported\n");
 	} else if (sysfs_streq(buf, "fw_flashing")) {
 		if (arche_pdata->state == ARCHE_PLATFORM_STATE_FW_FLASHING)
-			goto exit;
+			return count;
 
 		/*
 		 * Here we only control SVC.
@@ -356,15 +354,11 @@ static ssize_t state_store(struct device *dev,
 
 		ret = arche_platform_fw_flashing_seq(arche_pdata);
 		if (ret)
-			goto exit;
+			return ret ? ret : count;
 	} else {
 		dev_err(arche_pdata->dev, "unknown state\n");
-		ret = -EINVAL;
+		return -EINVAL;
 	}
-
-exit:
-	mutex_unlock(&arche_pdata->platform_state_mutex);
-	return ret ? ret : count;
 }
 
 static ssize_t state_show(struct device *dev,
@@ -396,7 +390,7 @@ static int arche_platform_pm_notifier(struct notifier_block *notifier,
 			     pm_notifier);
 	int ret = NOTIFY_DONE;
 
-	mutex_lock(&arche_pdata->platform_state_mutex);
+	guard(mutex)(&arche_pdata->platform_state_mutex);
 	switch (pm_event) {
 	case PM_SUSPEND_PREPARE:
 		if (arche_pdata->state != ARCHE_PLATFORM_STATE_ACTIVE) {
@@ -416,7 +410,6 @@ static int arche_platform_pm_notifier(struct notifier_block *notifier,
 	default:
 		break;
 	}
-	mutex_unlock(&arche_pdata->platform_state_mutex);
 
 	return ret;
 }
@@ -530,15 +523,13 @@ static int arche_platform_probe(struct platform_device *pdev)
 
 	/* Explicitly power off if requested */
 	if (!of_property_read_bool(pdev->dev.of_node, "arche,init-off")) {
-		mutex_lock(&arche_pdata->platform_state_mutex);
+		guard(mutex)(&arche_pdata->platform_state_mutex);
 		ret = arche_platform_coldboot_seq(arche_pdata);
 		if (ret) {
-			mutex_unlock(&arche_pdata->platform_state_mutex);
 			dev_err(dev, "Failed to cold boot svc %d\n", ret);
 			goto err_unregister_pm_notifier;
 		}
 		arche_platform_wd_irq_en(arche_pdata);
-		mutex_unlock(&arche_pdata->platform_state_mutex);
 	}
 
 	dev_info(dev, "Device registered successfully\n");
diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 6daa4e706..92d3cd4ae 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -316,7 +316,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
 		return -EINVAL;
 	}
 
-	mutex_lock(&codec->lock);
+	guard(mutex)(&codec->lock);
 	if (w->id == snd_soc_dapm_aif_in) {
 		if (enable)
 			ret = gbaudio_module_enable_tx(codec, module, dai_id);
@@ -329,8 +329,6 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
 			ret = gbaudio_module_disable_rx(module, dai_id);
 	}
 
-	mutex_unlock(&codec->lock);
-
 	return ret;
 }
 EXPORT_SYMBOL(gbaudio_module_update);
@@ -344,22 +342,19 @@ static int gbcodec_startup(struct snd_pcm_substream *substream,
 	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
 	struct gbaudio_stream_params *params;
 
-	mutex_lock(&codec->lock);
-
-	if (list_empty(&codec->module_list)) {
-		dev_err(codec->dev, "No codec module available\n");
-		mutex_unlock(&codec->lock);
-		return -ENODEV;
-	}
+	scoped_guard(mutex, &codec->lock) {
+		if (list_empty(&codec->module_list)) {
+			dev_err(codec->dev, "No codec module available\n");
+			return -ENODEV;
+		}
 
-	params = find_dai_stream_params(codec, dai->id, substream->stream);
-	if (!params) {
-		dev_err(codec->dev, "Failed to fetch dai_stream pointer\n");
-		mutex_unlock(&codec->lock);
-		return -EINVAL;
+		params = find_dai_stream_params(codec, dai->id, substream->stream);
+		if (!params) {
+			dev_err(codec->dev, "Failed to fetch dai_stream pointer\n");
+			return -EINVAL;
+		}
+		params->state = GBAUDIO_CODEC_STARTUP;
 	}
-	params->state = GBAUDIO_CODEC_STARTUP;
-	mutex_unlock(&codec->lock);
 	/* to prevent suspend in case of active audio */
 	pm_stay_awake(dai->dev);
 
@@ -372,19 +367,19 @@ static void gbcodec_shutdown(struct snd_pcm_substream *substream,
 	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
 	struct gbaudio_stream_params *params;
 
-	mutex_lock(&codec->lock);
 
-	if (list_empty(&codec->module_list))
-		dev_info(codec->dev, "No codec module available during shutdown\n");
+	scoped_guard(mutex, &codec->lock) {
+		if (list_empty(&codec->module_list))
+			dev_info(codec->dev, "No codec module available during shutdown\n");
 
-	params = find_dai_stream_params(codec, dai->id, substream->stream);
-	if (!params) {
-		dev_err(codec->dev, "Failed to fetch dai_stream pointer\n");
-		mutex_unlock(&codec->lock);
-		return;
+		params = find_dai_stream_params(codec, dai->id, substream->stream);
+		if (!params) {
+			dev_err(codec->dev, "Failed to fetch dai_stream pointer\n");
+			return;
+		}
+		params->state = GBAUDIO_CODEC_SHUTDOWN;
 	}
-	params->state = GBAUDIO_CODEC_SHUTDOWN;
-	mutex_unlock(&codec->lock);
+
 	pm_relax(dai->dev);
 }
 
@@ -401,11 +396,10 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
 	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
 	struct gbaudio_stream_params *params;
 
-	mutex_lock(&codec->lock);
+	guard(mutex)(&codec->lock);
 
 	if (list_empty(&codec->module_list)) {
 		dev_err(codec->dev, "No codec module available\n");
-		mutex_unlock(&codec->lock);
 		return -ENODEV;
 	}
 
@@ -416,7 +410,6 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
 	if (params_channels(hwparams) != 2) {
 		dev_err(dai->dev, "Invalid channel count:%d\n",
 			params_channels(hwparams));
-		mutex_unlock(&codec->lock);
 		return -EINVAL;
 	}
 	channels = params_channels(hwparams);
@@ -424,14 +417,12 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
 	if (params_rate(hwparams) != 48000) {
 		dev_err(dai->dev, "Invalid sampling rate:%d\n",
 			params_rate(hwparams));
-		mutex_unlock(&codec->lock);
 		return -EINVAL;
 	}
 	rate = GB_AUDIO_PCM_RATE_48000;
 
 	if (params_format(hwparams) != SNDRV_PCM_FORMAT_S16_LE) {
 		dev_err(dai->dev, "Invalid format:%d\n", params_format(hwparams));
-		mutex_unlock(&codec->lock);
 		return -EINVAL;
 	}
 	format = GB_AUDIO_PCM_FMT_S16_LE;
@@ -445,21 +436,18 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
 
 	if (!data) {
 		dev_err(dai->dev, "DATA connection missing\n");
-		mutex_unlock(&codec->lock);
 		return -EINVAL;
 	}
 
 	params = find_dai_stream_params(codec, dai->id, substream->stream);
 	if (!params) {
 		dev_err(codec->dev, "Failed to fetch dai_stream pointer\n");
-		mutex_unlock(&codec->lock);
 		return -EINVAL;
 	}
 
 	bundle = to_gb_bundle(module->dev);
 	ret = gb_pm_runtime_get_sync(bundle);
 	if (ret) {
-		mutex_unlock(&codec->lock);
 		return ret;
 	}
 
@@ -471,7 +459,6 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
 		dev_err_ratelimited(dai->dev, "%d: Error during set_config\n",
 				    ret);
 		gb_pm_runtime_put_noidle(bundle);
-		mutex_unlock(&codec->lock);
 		return ret;
 	}
 
@@ -488,13 +475,17 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
 	params->channels = channels;
 	params->sig_bits = sig_bits;
 
-	mutex_unlock(&codec->lock);
 	return 0;
 }
 
 static int gbcodec_prepare(struct snd_pcm_substream *substream,
 			   struct snd_soc_dai *dai)
 {
+	/*
+	 * Keep explicit mutex_lock/unlock here instead of guard(mutex)
+	 * to release the lock before calling dev_err_ratelimited() and PM calls.
+	 */
+
 	int ret;
 	struct gbaudio_module_info *module = NULL, *iter;
 	struct gbaudio_data_connection *data;
@@ -572,12 +563,11 @@ static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	dev_dbg(dai->dev, "Mute:%d, Direction:%s\n", mute,
 		stream ? "CAPTURE" : "PLAYBACK");
 
-	mutex_lock(&codec->lock);
+	guard(mutex)(&codec->lock);
 
 	params = find_dai_stream_params(codec, dai->id, stream);
 	if (!params) {
 		dev_err(codec->dev, "Failed to fetch dai_stream pointer\n");
-		mutex_unlock(&codec->lock);
 		return -EINVAL;
 	}
 
@@ -589,7 +579,6 @@ static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 		} else {
 			ret = -ENODEV;
 		}
-		mutex_unlock(&codec->lock);
 		return ret;
 	}
 
@@ -604,14 +593,12 @@ static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	if (!data) {
 		dev_err(dai->dev, "%s DATA connection missing\n",
 			dai->name);
-		mutex_unlock(&codec->lock);
 		return -ENODEV;
 	}
 
 	bundle = to_gb_bundle(module->dev);
 	ret = gb_pm_runtime_get_sync(bundle);
 	if (ret) {
-		mutex_unlock(&codec->lock);
 		return ret;
 	}
 
@@ -646,7 +633,6 @@ static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 				    stream ? "Capture" : "Playback", ret);
 
 	gb_pm_runtime_put_noidle(bundle);
-	mutex_unlock(&codec->lock);
 	return ret;
 }
 
@@ -817,19 +803,17 @@ int gbaudio_register_module(struct gbaudio_module_info *module)
 	comp = gbcodec->component;
 	dapm = snd_soc_component_to_dapm(comp);
 
-	mutex_lock(&gbcodec->register_mutex);
+	guard(mutex)(&gbcodec->register_mutex);
 
 	if (module->num_dais) {
 		dev_err(gbcodec->dev,
 			"%d:DAIs not supported via gbcodec driver\n",
 			module->num_dais);
-		mutex_unlock(&gbcodec->register_mutex);
 		return -EINVAL;
 	}
 
 	ret = gbaudio_init_jack(module, comp->card);
 	if (ret) {
-		mutex_unlock(&gbcodec->register_mutex);
 		return ret;
 	}
 
@@ -858,15 +842,14 @@ int gbaudio_register_module(struct gbaudio_module_info *module)
 #endif
 	}
 
-	mutex_lock(&gbcodec->lock);
-	list_add(&module->list, &gbcodec->module_list);
-	mutex_unlock(&gbcodec->lock);
+	scoped_guard(mutex, &gbcodec->lock) {
+		list_add(&module->list, &gbcodec->module_list);
+	}
 
 	if (comp->card->instantiated)
 		ret = snd_soc_dapm_new_widgets(comp->card);
 	dev_dbg(comp->dev, "Registered %s module\n", module->name);
 
-	mutex_unlock(&gbcodec->register_mutex);
 	return ret;
 }
 EXPORT_SYMBOL(gbaudio_register_module);
@@ -939,12 +922,12 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module)
 
 	dev_dbg(comp->dev, "Unregister %s module\n", module->name);
 
-	mutex_lock(&gbcodec->register_mutex);
-	mutex_lock(&gbcodec->lock);
-	gbaudio_codec_cleanup(module);
-	list_del(&module->list);
-	dev_dbg(comp->dev, "Process Unregister %s module\n", module->name);
-	mutex_unlock(&gbcodec->lock);
+	guard(mutex)(&gbcodec->register_mutex);
+	scoped_guard(mutex, &gbcodec->lock) {
+		gbaudio_codec_cleanup(module);
+		list_del(&module->list);
+		dev_dbg(comp->dev, "Process Unregister %s module\n", module->name);
+	}
 
 #ifdef CONFIG_SND_JACK
 	/* free jack devices for this module jack_list */
@@ -991,8 +974,6 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module)
 	}
 
 	dev_dbg(comp->dev, "Unregistered %s module\n", module->name);
-
-	mutex_unlock(&gbcodec->register_mutex);
 }
 EXPORT_SYMBOL(gbaudio_unregister_module);
 
diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
index b4873c6d6..eeb2ca7a5 100644
--- a/drivers/staging/greybus/audio_helper.c
+++ b/drivers/staging/greybus/audio_helper.c
@@ -117,7 +117,7 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 	struct snd_soc_dapm_widget *w, *tmp_w;
 	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 
-	mutex_lock(&card->dapm_mutex);
+	guard(mutex)(&card->dapm_mutex);
 	for (i = 0; i < num; i++) {
 		/* below logic can be optimized to identify widget pointer */
 		w = NULL;
@@ -137,7 +137,6 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 		widget++;
 		gbaudio_dapm_free_widget(w);
 	}
-	mutex_unlock(&card->dapm_mutex);
 	return 0;
 }
 
diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 76146f91c..295625a48 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -33,14 +33,12 @@ static struct gbaudio_module_info *find_gb_module(struct gbaudio_codec_info *cod
 
 	dev_dbg(codec->dev, "%s:Find module#%d\n", __func__, dev_id);
 
-	mutex_lock(&codec->lock);
-	list_for_each_entry(module, &codec->module_list, list) {
-		if (module->dev_id == dev_id) {
-			mutex_unlock(&codec->lock);
-			return module;
+	scoped_guard(mutex, &codec->lock) {
+		list_for_each_entry(module, &codec->module_list, list) {
+			if (module->dev_id == dev_id)
+				return module;
 		}
 	}
-	mutex_unlock(&codec->lock);
 	dev_warn(codec->dev, "%s: module#%d missing in codec list\n", name,
 		 dev_id);
 	return NULL;
diff --git a/drivers/staging/greybus/authentication.c b/drivers/staging/greybus/authentication.c
index d8f2cd432..5c0bfc9b0 100644
--- a/drivers/staging/greybus/authentication.c
+++ b/drivers/staging/greybus/authentication.c
@@ -65,20 +65,17 @@ static struct gb_cap *get_cap(struct cdev *cdev)
 {
 	struct gb_cap *cap;
 
-	mutex_lock(&list_mutex);
+	guard(mutex)(&list_mutex);
 
 	list_for_each_entry(cap, &cap_list, node) {
 		if (&cap->cdev == cdev) {
 			kref_get(&cap->kref);
-			goto unlock;
+			return cap;
 		}
 	}
 
 	cap = NULL;
 
-unlock:
-	mutex_unlock(&list_mutex);
-
 	return cap;
 }
 
@@ -276,7 +273,7 @@ static long cap_ioctl_unlocked(struct file *file, unsigned int cmd,
 	 * the connection is getting disconnected, so that we don't start any
 	 * new operations.
 	 */
-	mutex_lock(&cap->mutex);
+	guard(mutex)(&cap->mutex);
 	if (!cap->disabled) {
 		ret = gb_pm_runtime_get_sync(bundle);
 		if (!ret) {
@@ -284,7 +281,6 @@ static long cap_ioctl_unlocked(struct file *file, unsigned int cmd,
 			gb_pm_runtime_put_autosuspend(bundle);
 		}
 	}
-	mutex_unlock(&cap->mutex);
 
 	return ret;
 }
@@ -314,9 +310,9 @@ int gb_cap_connection_init(struct gb_connection *connection)
 	gb_connection_set_data(connection, cap);
 	kref_init(&cap->kref);
 
-	mutex_lock(&list_mutex);
-	list_add(&cap->node, &cap_list);
-	mutex_unlock(&list_mutex);
+	scoped_guard(mutex, &list_mutex) {
+		list_add(&cap->node, &cap_list);
+	}
 
 	ret = gb_connection_enable(connection);
 	if (ret)
@@ -353,9 +349,9 @@ int gb_cap_connection_init(struct gb_connection *connection)
 err_connection_disable:
 	gb_connection_disable(connection);
 err_list_del:
-	mutex_lock(&list_mutex);
-	list_del(&cap->node);
-	mutex_unlock(&list_mutex);
+	scoped_guard(mutex, &list_mutex) {
+		list_del(&cap->node);
+	}
 
 	put_cap(cap);
 
@@ -379,17 +375,17 @@ void gb_cap_connection_exit(struct gb_connection *connection)
 	 * Disallow any new ioctl operations on the char device and wait for
 	 * existing ones to finish.
 	 */
-	mutex_lock(&cap->mutex);
-	cap->disabled = true;
-	mutex_unlock(&cap->mutex);
+	scoped_guard(mutex, &cap->mutex) {
+		cap->disabled = true;
+	}
 
 	/* All pending greybus operations should have finished by now */
 	gb_connection_disable(cap->connection);
 
 	/* Disallow new users to get access to the cap structure */
-	mutex_lock(&list_mutex);
-	list_del(&cap->node);
-	mutex_unlock(&list_mutex);
+	scoped_guard(mutex, &list_mutex) {
+		list_del(&cap->node);
+	}
 
 	/*
 	 * All current users of cap would have taken a reference to it by
diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 83921d90c..923456d6c 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -78,9 +78,9 @@ static void gb_bootrom_timedout(struct work_struct *work)
 
 	dev_err(dev, "Timed out waiting for %s from the Module\n", reason);
 
-	mutex_lock(&bootrom->mutex);
-	free_firmware(bootrom);
-	mutex_unlock(&bootrom->mutex);
+	scoped_guard(mutex, &bootrom->mutex) {
+		free_firmware(bootrom);
+	}
 
 	/* TODO: Power-off Module ? */
 }
@@ -240,6 +240,11 @@ static int gb_bootrom_firmware_size_request(struct gb_operation *op)
 
 static int gb_bootrom_get_firmware(struct gb_operation *op)
 {
+	/*
+	 * Keep explicit mutex_lock/unlock here instead of guard(mutex)
+	 * to release the lock before queue_work.
+	 */
+
 	struct gb_bootrom *bootrom = gb_connection_get_data(op->connection);
 	const struct firmware *fw;
 	struct gb_bootrom_get_firmware_request *firmware_request;
diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index 62b55bb28..2edb02a75 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -490,24 +490,21 @@ static int gb_camera_capabilities(struct gb_camera *gcam,
 	if (ret)
 		return ret;
 
-	mutex_lock(&gcam->mutex);
+	scoped_guard(mutex, &gcam->mutex) {
+		if (!gcam->connection) {
+			ret = -EINVAL;
+			goto done;
+		}
 
-	if (!gcam->connection) {
-		ret = -EINVAL;
-		goto done;
+		ret = gb_camera_operation_sync_flags(gcam->connection,
+						     GB_CAMERA_TYPE_CAPABILITIES,
+						     GB_OPERATION_FLAG_SHORT_RESPONSE,
+						     NULL, 0,
+						     (void *)capabilities, size);
+		if (ret)
+			dev_err(&gcam->bundle->dev, "failed to retrieve capabilities: %d\n", ret);
 	}
-
-	ret = gb_camera_operation_sync_flags(gcam->connection,
-					     GB_CAMERA_TYPE_CAPABILITIES,
-					     GB_OPERATION_FLAG_SHORT_RESPONSE,
-					     NULL, 0,
-					     (void *)capabilities, size);
-	if (ret)
-		dev_err(&gcam->bundle->dev, "failed to retrieve capabilities: %d\n", ret);
-
 done:
-	mutex_unlock(&gcam->mutex);
-
 	gb_pm_runtime_put_autosuspend(gcam->bundle);
 
 	return ret;
@@ -519,6 +516,11 @@ static int gb_camera_configure_streams(struct gb_camera *gcam,
 				       struct gb_camera_stream_config *streams,
 				       struct gb_camera_csi_params *csi_params)
 {
+	/*
+	 * Keep explicit mutex_lock/unlock here instead of guard(mutex)
+	 * to release the lock before freeing req and resp.
+	 */
+
 	struct gb_camera_configure_streams_request *req;
 	struct gb_camera_configure_streams_response *resp;
 	unsigned int nstreams = *num_streams;
@@ -668,18 +670,17 @@ static int gb_camera_capture(struct gb_camera *gcam, u32 request_id,
 	req->num_frames = cpu_to_le16(num_frames);
 	memcpy(req->settings, settings, settings_size);
 
-	mutex_lock(&gcam->mutex);
+	scoped_guard(mutex, &gcam->mutex) {
+		if (!gcam->connection) {
+			ret = -EINVAL;
+			goto done;
+		}
 
-	if (!gcam->connection) {
-		ret = -EINVAL;
-		goto done;
+		ret = gb_operation_sync(gcam->connection, GB_CAMERA_TYPE_CAPTURE,
+					req, req_size, NULL, 0);
 	}
 
-	ret = gb_operation_sync(gcam->connection, GB_CAMERA_TYPE_CAPTURE,
-				req, req_size, NULL, 0);
 done:
-	mutex_unlock(&gcam->mutex);
-
 	kfree(req);
 
 	return ret;
@@ -690,25 +691,21 @@ static int gb_camera_flush(struct gb_camera *gcam, u32 *request_id)
 	struct gb_camera_flush_response resp;
 	int ret;
 
-	mutex_lock(&gcam->mutex);
+	guard(mutex)(&gcam->mutex);
 
 	if (!gcam->connection) {
-		ret = -EINVAL;
-		goto done;
+		return -EINVAL;
 	}
 
 	ret = gb_operation_sync(gcam->connection, GB_CAMERA_TYPE_FLUSH, NULL, 0,
 				&resp, sizeof(resp));
 
 	if (ret < 0)
-		goto done;
+		return ret;
 
 	if (request_id)
 		*request_id = le32_to_cpu(resp.request_id);
 
-done:
-	mutex_unlock(&gcam->mutex);
-
 	return ret;
 }
 
@@ -1187,7 +1184,7 @@ static void gb_camera_cleanup(struct gb_camera *gcam)
 {
 	gb_camera_debugfs_cleanup(gcam);
 
-	mutex_lock(&gcam->mutex);
+	guard(mutex)(&gcam->mutex);
 	if (gcam->data_connection) {
 		gb_connection_disable(gcam->data_connection);
 		gb_connection_destroy(gcam->data_connection);
@@ -1199,7 +1196,6 @@ static void gb_camera_cleanup(struct gb_camera *gcam)
 		gb_connection_destroy(gcam->connection);
 		gcam->connection = NULL;
 	}
-	mutex_unlock(&gcam->mutex);
 }
 
 static void gb_camera_release_module(struct kref *ref)
diff --git a/drivers/staging/greybus/fw-download.c b/drivers/staging/greybus/fw-download.c
index a0a683447..a4e2e2361 100644
--- a/drivers/staging/greybus/fw-download.c
+++ b/drivers/staging/greybus/fw-download.c
@@ -93,21 +93,16 @@ static struct fw_request *get_fw_req(struct fw_download *fw_download,
 {
 	struct fw_request *fw_req;
 
-	mutex_lock(&fw_download->mutex);
+	guard(mutex)(&fw_download->mutex);
 
 	list_for_each_entry(fw_req, &fw_download->fw_requests, node) {
 		if (fw_req->firmware_id == firmware_id) {
 			kref_get(&fw_req->kref);
-			goto unlock;
+			return fw_req;
 		}
 	}
 
-	fw_req = NULL;
-
-unlock:
-	mutex_unlock(&fw_download->mutex);
-
-	return fw_req;
+	return NULL;
 }
 
 static void free_firmware(struct fw_download *fw_download,
@@ -117,9 +112,9 @@ static void free_firmware(struct fw_download *fw_download,
 	if (fw_req->disabled)
 		return;
 
-	mutex_lock(&fw_download->mutex);
-	list_del(&fw_req->node);
-	mutex_unlock(&fw_download->mutex);
+	scoped_guard(mutex, &fw_download->mutex) {
+		list_del(&fw_req->node);
+	}
 
 	fw_req->disabled = true;
 	put_fw_req(fw_req);
@@ -197,9 +192,9 @@ static struct fw_request *find_firmware(struct fw_download *fw_download,
 	fw_req->fw_download = fw_download;
 	kref_init(&fw_req->kref);
 
-	mutex_lock(&fw_download->mutex);
-	list_add(&fw_req->node, &fw_download->fw_requests);
-	mutex_unlock(&fw_download->mutex);
+	scoped_guard(mutex, &fw_download->mutex) {
+		list_add(&fw_req->node, &fw_download->fw_requests);
+	}
 
 	/* Timeout, in jiffies, within which firmware should get loaded */
 	req_count = DIV_ROUND_UP(fw_req->fw->size, MIN_FETCH_SIZE);
@@ -448,10 +443,10 @@ void gb_fw_download_connection_exit(struct gb_connection *connection)
 	 * Make sure we have a reference to the pending requests, before they
 	 * are freed from the timeout handler.
 	 */
-	mutex_lock(&fw_download->mutex);
-	list_for_each_entry(fw_req, &fw_download->fw_requests, node)
-		kref_get(&fw_req->kref);
-	mutex_unlock(&fw_download->mutex);
+	scoped_guard(mutex, &fw_download->mutex) {
+		list_for_each_entry(fw_req, &fw_download->fw_requests, node)
+			kref_get(&fw_req->kref);
+	}
 
 	/* Release pending firmware packages */
 	list_for_each_entry_safe(fw_req, tmp, &fw_download->fw_requests, node) {
diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 5d01da6b6..c48bea217 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -87,21 +87,16 @@ static struct fw_mgmt *get_fw_mgmt(struct cdev *cdev)
 {
 	struct fw_mgmt *fw_mgmt;
 
-	mutex_lock(&list_mutex);
+	guard(mutex)(&list_mutex);
 
 	list_for_each_entry(fw_mgmt, &fw_mgmt_list, node) {
 		if (&fw_mgmt->cdev == cdev) {
 			kref_get(&fw_mgmt->kref);
-			goto unlock;
+			return fw_mgmt;
 		}
 	}
 
-	fw_mgmt = NULL;
-
-unlock:
-	mutex_unlock(&list_mutex);
-
-	return fw_mgmt;
+	return NULL;
 }
 
 static int fw_mgmt_interface_fw_version_operation(struct fw_mgmt *fw_mgmt,
@@ -533,7 +528,7 @@ static long fw_mgmt_ioctl_unlocked(struct file *file, unsigned int cmd,
 	 * the connection is getting disconnected, so that we don't start any
 	 * new operations.
 	 */
-	mutex_lock(&fw_mgmt->mutex);
+	guard(mutex)(&fw_mgmt->mutex);
 	if (!fw_mgmt->disabled) {
 		ret = gb_pm_runtime_get_sync(bundle);
 		if (!ret) {
@@ -541,7 +536,6 @@ static long fw_mgmt_ioctl_unlocked(struct file *file, unsigned int cmd,
 			gb_pm_runtime_put_autosuspend(bundle);
 		}
 	}
-	mutex_unlock(&fw_mgmt->mutex);
 
 	return ret;
 }
@@ -591,9 +585,9 @@ int gb_fw_mgmt_connection_init(struct gb_connection *connection)
 	mutex_init(&fw_mgmt->mutex);
 	kref_init(&fw_mgmt->kref);
 
-	mutex_lock(&list_mutex);
-	list_add(&fw_mgmt->node, &fw_mgmt_list);
-	mutex_unlock(&list_mutex);
+	scoped_guard(mutex, &list_mutex) {
+		list_add(&fw_mgmt->node, &fw_mgmt_list);
+	}
 
 	ret = gb_connection_enable(connection);
 	if (ret)
@@ -631,9 +625,9 @@ int gb_fw_mgmt_connection_init(struct gb_connection *connection)
 err_connection_disable:
 	gb_connection_disable(connection);
 err_list_del:
-	mutex_lock(&list_mutex);
-	list_del(&fw_mgmt->node);
-	mutex_unlock(&list_mutex);
+	scoped_guard(mutex, &list_mutex) {
+		list_del(&fw_mgmt->node);
+	}
 
 	put_fw_mgmt(fw_mgmt);
 
@@ -657,17 +651,17 @@ void gb_fw_mgmt_connection_exit(struct gb_connection *connection)
 	 * Disallow any new ioctl operations on the char device and wait for
 	 * existing ones to finish.
 	 */
-	mutex_lock(&fw_mgmt->mutex);
-	fw_mgmt->disabled = true;
-	mutex_unlock(&fw_mgmt->mutex);
+	scoped_guard(mutex, &fw_mgmt->mutex) {
+		fw_mgmt->disabled = true;
+	}
 
 	/* All pending greybus operations should have finished by now */
 	gb_connection_disable(fw_mgmt->connection);
 
 	/* Disallow new users to get access to the fw_mgmt structure */
-	mutex_lock(&list_mutex);
-	list_del(&fw_mgmt->node);
-	mutex_unlock(&list_mutex);
+	scoped_guard(mutex, &list_mutex) {
+		list_del(&fw_mgmt->node);
+	}
 
 	/*
 	 * All current users of fw_mgmt would have taken a reference to it by
diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index cab02b5da..83df32aa2 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -354,10 +354,10 @@ static int __gb_lights_led_brightness_set(struct gb_channel *channel)
 	bool old_active;
 	int ret;
 
-	mutex_lock(&channel->lock);
+	guard(mutex)(&channel->lock);
 	ret = gb_pm_runtime_get_sync(bundle);
 	if (ret < 0)
-		goto out_unlock;
+		return ret;
 
 	old_active = channel->active;
 
@@ -377,7 +377,7 @@ static int __gb_lights_led_brightness_set(struct gb_channel *channel)
 
 	/* we need to keep module alive when turning to active state */
 	if (!old_active && channel->active)
-		goto out_unlock;
+		return ret;
 
 	/*
 	 * on the other hand if going to inactive we still hold a reference and
@@ -388,8 +388,6 @@ static int __gb_lights_led_brightness_set(struct gb_channel *channel)
 
 out_pm_put:
 	gb_pm_runtime_put_autosuspend(bundle);
-out_unlock:
-	mutex_unlock(&channel->lock);
 
 	return ret;
 }
@@ -443,10 +441,10 @@ static int gb_blink_set(struct led_classdev *cdev, unsigned long *delay_on,
 	if (!delay_on || !delay_off)
 		return -EINVAL;
 
-	mutex_lock(&channel->lock);
+	guard(mutex)(&channel->lock);
 	ret = gb_pm_runtime_get_sync(bundle);
 	if (ret < 0)
-		goto out_unlock;
+		return ret;
 
 	old_active = channel->active;
 
@@ -467,7 +465,7 @@ static int gb_blink_set(struct led_classdev *cdev, unsigned long *delay_on,
 
 	/* we need to keep module alive when turning to active state */
 	if (!old_active && channel->active)
-		goto out_unlock;
+		return ret;
 
 	/*
 	 * on the other hand if going to inactive we still hold a reference and
@@ -478,8 +476,6 @@ static int gb_blink_set(struct led_classdev *cdev, unsigned long *delay_on,
 
 out_pm_put:
 	gb_pm_runtime_put_autosuspend(bundle);
-out_unlock:
-	mutex_unlock(&channel->lock);
 
 	return ret;
 }
@@ -1146,15 +1142,14 @@ static int gb_lights_create_all(struct gb_lights *glights)
 	int ret;
 	int i;
 
-	mutex_lock(&glights->lights_lock);
+	guard(mutex)(&glights->lights_lock);
 	ret = gb_lights_get_count(glights);
 	if (ret < 0)
-		goto out;
+		return ret;
 
 	glights->lights = kzalloc_objs(struct gb_light, glights->lights_count);
 	if (!glights->lights) {
-		ret = -ENOMEM;
-		goto out;
+		return -ENOMEM;
 	}
 
 	for (i = 0; i < glights->lights_count; i++) {
@@ -1162,12 +1157,10 @@ static int gb_lights_create_all(struct gb_lights *glights)
 		if (ret < 0) {
 			dev_err(&connection->bundle->dev,
 				"Fail to configure lights device\n");
-			goto out;
+			return ret;
 		}
 	}
 
-out:
-	mutex_unlock(&glights->lights_lock);
 	return ret;
 }
 
@@ -1177,7 +1170,7 @@ static int gb_lights_register_all(struct gb_lights *glights)
 	int ret = 0;
 	int i;
 
-	mutex_lock(&glights->lights_lock);
+	guard(mutex)(&glights->lights_lock);
 	for (i = 0; i < glights->lights_count; i++) {
 		ret = gb_lights_light_register(&glights->lights[i]);
 		if (ret < 0) {
@@ -1187,7 +1180,6 @@ static int gb_lights_register_all(struct gb_lights *glights)
 		}
 	}
 
-	mutex_unlock(&glights->lights_lock);
 	return ret;
 }
 
@@ -1231,14 +1223,14 @@ static int gb_lights_request_handler(struct gb_operation *op)
 	if (event & GB_LIGHTS_LIGHT_CONFIG) {
 		light = &glights->lights[light_id];
 
-		mutex_lock(&glights->lights_lock);
-		gb_lights_light_release(light);
-		ret = gb_lights_light_config(glights, light_id);
-		if (!ret)
-			ret = gb_lights_light_register(light);
-		if (ret < 0)
+		scoped_guard(mutex, &glights->lights_lock) {
 			gb_lights_light_release(light);
-		mutex_unlock(&glights->lights_lock);
+			ret = gb_lights_light_config(glights, light_id);
+			if (!ret)
+				ret = gb_lights_light_register(light);
+			if (ret < 0)
+				gb_lights_light_release(light);
+		}
 	}
 
 	return ret;
diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 2a623fc2e..2ca6d5c5f 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -406,24 +406,22 @@ static void gb_loopback_async_operation_callback(struct gb_operation *operation)
 	op_async = gb_operation_get_data(operation);
 	gb = op_async->gb;
 
-	mutex_lock(&gb->mutex);
+	scoped_guard(mutex, &gb->mutex) {
+		if (!result && op_async->completion)
+			result = op_async->completion(op_async);
 
-	if (!result && op_async->completion)
-		result = op_async->completion(op_async);
+		if (!result) {
+			gb->elapsed_nsecs = gb_loopback_calc_latency(op_async->ts, te);
+		} else {
+			gb->error++;
+			if (result == -ETIMEDOUT)
+				gb->requests_timedout++;
+		}
 
-	if (!result) {
-		gb->elapsed_nsecs = gb_loopback_calc_latency(op_async->ts, te);
-	} else {
-		gb->error++;
-		if (result == -ETIMEDOUT)
-			gb->requests_timedout++;
+		gb->iteration_count++;
+		gb_loopback_calculate_stats(gb, result);
 	}
 
-	gb->iteration_count++;
-	gb_loopback_calculate_stats(gb, result);
-
-	mutex_unlock(&gb->mutex);
-
 	dev_dbg(&gb->connection->bundle->dev, "complete operation %d\n",
 		operation->id);
 
@@ -848,7 +846,7 @@ static int gb_loopback_fn(void *data)
 			gb_loopback_async_wait_all(gb);
 
 			/* Mark complete unless user-space has poked us */
-			mutex_lock(&gb->mutex);
+			guard(mutex)(&gb->mutex);
 			if (gb->iteration_count == gb->iteration_max) {
 				gb->type = 0;
 				gb->send_count = 0;
@@ -859,7 +857,6 @@ static int gb_loopback_fn(void *data)
 				dev_dbg(&bundle->dev,
 					"continuing on with new test set\n");
 			}
-			mutex_unlock(&gb->mutex);
 			continue;
 		}
 		size = gb->size;
@@ -919,18 +916,16 @@ static int gb_loopback_dbgfs_latency_show_common(struct seq_file *s,
 	int retval;
 
 	if (kfifo_len(kfifo) == 0) {
-		retval = -EAGAIN;
-		goto done;
+		return -EAGAIN;
 	}
 
-	mutex_lock(mutex);
+	guard(mutex)(mutex);
 	retval = kfifo_out(kfifo, &latency, sizeof(latency));
 	if (retval > 0) {
 		seq_printf(s, "%u", latency);
-		retval = 0;
+		return 0;
 	}
-	mutex_unlock(mutex);
-done:
+
 	return retval;
 }
 
diff --git a/drivers/staging/greybus/power_supply.c b/drivers/staging/greybus/power_supply.c
index 44bd8a72f..5df14315f 100644
--- a/drivers/staging/greybus/power_supply.c
+++ b/drivers/staging/greybus/power_supply.c
@@ -365,7 +365,7 @@ static void gb_power_supply_state_change(struct gb_power_supply *gbpsy,
 	 * Check gbpsy->pm_acquired to make sure only one pair of 'get_sync'
 	 * and 'put_autosuspend' runtime pm call for state property change.
 	 */
-	mutex_lock(&gbpsy->supply_lock);
+	guard(mutex)(&gbpsy->supply_lock);
 
 	if ((prop->val == GB_POWER_SUPPLY_STATUS_CHARGING) &&
 	    !gbpsy->pm_acquired) {
@@ -385,8 +385,6 @@ static void gb_power_supply_state_change(struct gb_power_supply *gbpsy,
 				gbpsy->pm_acquired = false;
 		}
 	}
-
-	mutex_unlock(&gbpsy->supply_lock);
 }
 
 static void check_changed(struct gb_power_supply *gbpsy,
@@ -861,11 +859,11 @@ static void _gb_power_supplies_release(struct gb_power_supplies *supplies)
 	if (!supplies->supply)
 		return;
 
-	mutex_lock(&supplies->supplies_lock);
-	for (i = 0; i < supplies->supplies_count; i++)
-		_gb_power_supply_release(&supplies->supply[i]);
-	kfree(supplies->supply);
-	mutex_unlock(&supplies->supplies_lock);
+	scoped_guard(mutex, &supplies->supplies_lock) {
+		for (i = 0; i < supplies->supplies_count; i++)
+			_gb_power_supply_release(&supplies->supply[i]);
+		kfree(supplies->supply);
+	}
 	kfree(supplies);
 }
 
@@ -935,18 +933,17 @@ static int gb_power_supplies_setup(struct gb_power_supplies *supplies)
 	int ret;
 	int i;
 
-	mutex_lock(&supplies->supplies_lock);
+	guard(mutex)(&supplies->supplies_lock);
 
 	ret = gb_power_supplies_get_count(supplies);
 	if (ret < 0)
-		goto out;
+		return ret;
 
 	supplies->supply = kzalloc_objs(struct gb_power_supply,
 					supplies->supplies_count);
 
 	if (!supplies->supply) {
-		ret = -ENOMEM;
-		goto out;
+		return -ENOMEM;
 	}
 
 	for (i = 0; i < supplies->supplies_count; i++) {
@@ -954,11 +951,10 @@ static int gb_power_supplies_setup(struct gb_power_supplies *supplies)
 		if (ret < 0) {
 			dev_err(&connection->bundle->dev,
 				"Fail to configure supplies devices\n");
-			goto out;
+			return ret;
 		}
 	}
-out:
-	mutex_unlock(&supplies->supplies_lock);
+
 	return ret;
 }
 
@@ -968,7 +964,7 @@ static int gb_power_supplies_register(struct gb_power_supplies *supplies)
 	int ret = 0;
 	int i;
 
-	mutex_lock(&supplies->supplies_lock);
+	guard(mutex)(&supplies->supplies_lock);
 
 	for (i = 0; i < supplies->supplies_count; i++) {
 		ret = gb_power_supply_enable(&supplies->supply[i]);
@@ -979,7 +975,6 @@ static int gb_power_supplies_register(struct gb_power_supplies *supplies)
 		}
 	}
 
-	mutex_unlock(&supplies->supplies_lock);
 	return ret;
 }
 
@@ -992,7 +987,6 @@ static int gb_supplies_request_handler(struct gb_operation *op)
 	struct gb_power_supply_event_request *payload;
 	u8 psy_id;
 	u8 event;
-	int ret = 0;
 
 	if (op->type != GB_POWER_SUPPLY_TYPE_EVENT) {
 		dev_err(&connection->bundle->dev,
@@ -1011,14 +1005,13 @@ static int gb_supplies_request_handler(struct gb_operation *op)
 
 	payload = request->payload;
 	psy_id = payload->psy_id;
-	mutex_lock(&supplies->supplies_lock);
+	guard(mutex)(&supplies->supplies_lock);
 	if (psy_id >= supplies->supplies_count ||
 	    !supplies->supply[psy_id].registered) {
 		dev_err(&connection->bundle->dev,
 			"Event received for unconfigured power_supply id: %d\n",
 			psy_id);
-		ret = -EINVAL;
-		goto out_unlock;
+		return -EINVAL;
 	}
 
 	event = payload->event;
@@ -1028,8 +1021,7 @@ static int gb_supplies_request_handler(struct gb_operation *op)
 	 */
 	gbpsy = &supplies->supply[psy_id];
 	if (!gbpsy->update_interval) {
-		ret = -ESHUTDOWN;
-		goto out_unlock;
+		return -ESHUTDOWN;
 	}
 
 	if (event & GB_POWER_SUPPLY_UPDATE) {
@@ -1042,9 +1034,7 @@ static int gb_supplies_request_handler(struct gb_operation *op)
 		gb_power_supply_status_update(gbpsy);
 	}
 
-out_unlock:
-	mutex_unlock(&supplies->supplies_lock);
-	return ret;
+	return 0;
 }
 
 static int gb_power_supply_probe(struct gb_bundle *bundle,
diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 4f1b3f4db..b280b5b75 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -246,12 +246,12 @@ static void gb_raw_disconnect(struct gb_bundle *bundle)
 	gb_connection_disable(connection);
 	gb_connection_destroy(connection);
 
-	mutex_lock(&raw->list_lock);
-	list_for_each_entry_safe(raw_data, temp, &raw->list, entry) {
-		list_del(&raw_data->entry);
-		kfree(raw_data);
+	scoped_guard(mutex, &raw->list_lock) {
+		list_for_each_entry_safe(raw_data, temp, &raw->list, entry) {
+			list_del(&raw_data->entry);
+			kfree(raw_data);
+		}
 	}
-	mutex_unlock(&raw->list_lock);
 	put_device(&raw->dev);
 }
 
@@ -310,19 +310,16 @@ static ssize_t raw_read(struct file *file, char __user *buf, size_t count,
 	int retval = 0;
 	struct raw_data *raw_data;
 
-	mutex_lock(&raw->list_lock);
+	guard(mutex)(&raw->list_lock);
 	if (list_empty(&raw->list))
-		goto exit;
+		return 0;
 
 	raw_data = list_first_entry(&raw->list, struct raw_data, entry);
-	if (raw_data->len > count) {
-		retval = -ENOSPC;
-		goto exit;
-	}
+	if (raw_data->len > count)
+		return -ENOSPC;
 
 	if (copy_to_user(buf, &raw_data->data[0], raw_data->len)) {
-		retval = -EFAULT;
-		goto exit;
+		return -EFAULT;
 	}
 
 	list_del(&raw_data->entry);
@@ -330,8 +327,6 @@ static ssize_t raw_read(struct file *file, char __user *buf, size_t count,
 	retval = raw_data->len;
 	kfree(raw_data);
 
-exit:
-	mutex_unlock(&raw->list_lock);
 	return retval;
 }
 
diff --git a/drivers/staging/greybus/sdio.c b/drivers/staging/greybus/sdio.c
index 3952f3d22..316aaeb15 100644
--- a/drivers/staging/greybus/sdio.c
+++ b/drivers/staging/greybus/sdio.c
@@ -597,7 +597,7 @@ static void gb_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 	u8 drv_type;
 	u32 vdd = 0;
 
-	mutex_lock(&host->lock);
+	guard(mutex)(&host->lock);
 	request.clock = cpu_to_le32(ios->clock);
 
 	if (ios->vdd)
@@ -710,24 +710,19 @@ static void gb_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 
 	ret = gb_sdio_set_ios(host, &request);
 	if (ret < 0)
-		goto out;
+		return;
 
 	memcpy(&mmc->ios, ios, sizeof(mmc->ios));
-
-out:
-	mutex_unlock(&host->lock);
 }
 
 static int gb_mmc_get_ro(struct mmc_host *mmc)
 {
 	struct gb_sdio_host *host = mmc_priv(mmc);
 
-	mutex_lock(&host->lock);
+	guard(mutex)(&host->lock);
 	if (host->removed) {
-		mutex_unlock(&host->lock);
 		return -ESHUTDOWN;
 	}
-	mutex_unlock(&host->lock);
 
 	return host->read_only;
 }
@@ -736,12 +731,10 @@ static int gb_mmc_get_cd(struct mmc_host *mmc)
 {
 	struct gb_sdio_host *host = mmc_priv(mmc);
 
-	mutex_lock(&host->lock);
+	guard(mutex)(&host->lock);
 	if (host->removed) {
-		mutex_unlock(&host->lock);
 		return -ESHUTDOWN;
 	}
-	mutex_unlock(&host->lock);
 
 	return host->card_present;
 }
@@ -852,11 +845,11 @@ static void gb_sdio_remove(struct gbphy_device *gbphy_dev)
 	if (ret)
 		gbphy_runtime_get_noresume(gbphy_dev);
 
-	mutex_lock(&host->lock);
-	host->removed = true;
-	mmc = host->mmc;
-	gb_connection_set_data(connection, NULL);
-	mutex_unlock(&host->lock);
+	scoped_guard(mutex, &host->lock) {
+		host->removed = true;
+		mmc = host->mmc;
+		gb_connection_set_data(connection, NULL);
+	}
 
 	destroy_workqueue(host->mrq_workqueue);
 	gb_connection_disable_rx(connection);
diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 24b4dab06..e1aa12966 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -341,19 +341,16 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 {
 	struct gb_tty *gb_tty;
 
-	mutex_lock(&table_lock);
+	guard(mutex)(&table_lock);
 	gb_tty = idr_find(&tty_minors, minor);
 	if (gb_tty) {
-		mutex_lock(&gb_tty->mutex);
+		guard(mutex)(&gb_tty->mutex);
 		if (gb_tty->disconnected) {
-			mutex_unlock(&gb_tty->mutex);
 			gb_tty = NULL;
 		} else {
 			tty_port_get(&gb_tty->port);
-			mutex_unlock(&gb_tty->mutex);
 		}
 	}
-	mutex_unlock(&table_lock);
 	return gb_tty;
 }
 
@@ -361,9 +358,9 @@ static int alloc_minor(struct gb_tty *gb_tty)
 {
 	int minor;
 
-	mutex_lock(&table_lock);
-	minor = idr_alloc(&tty_minors, gb_tty, 0, GB_NUM_MINORS, GFP_KERNEL);
-	mutex_unlock(&table_lock);
+	scoped_guard(mutex, &table_lock) {
+		minor = idr_alloc(&tty_minors, gb_tty, 0, GB_NUM_MINORS, GFP_KERNEL);
+	}
 	if (minor >= 0)
 		gb_tty->minor = minor;
 	return minor;
@@ -374,9 +371,8 @@ static void release_minor(struct gb_tty *gb_tty)
 	int minor = gb_tty->minor;
 
 	gb_tty->minor = 0;	/* Maybe should use an invalid value instead */
-	mutex_lock(&table_lock);
+	guard(mutex)(&table_lock);
 	idr_remove(&tty_minors, minor);
-	mutex_unlock(&table_lock);
 }
 
 static int gb_tty_install(struct tty_driver *driver, struct tty_struct *tty)
@@ -596,13 +592,12 @@ static int get_serial_info(struct tty_struct *tty,
 	struct gb_tty *gb_tty = tty->driver_data;
 
 	ss->line = gb_tty->minor;
-	mutex_lock(&gb_tty->port.mutex);
+	guard(mutex)(&gb_tty->port.mutex);
 	ss->close_delay = jiffies_to_msecs(gb_tty->port.close_delay) / 10;
 	ss->closing_wait =
 		gb_tty->port.closing_wait == ASYNC_CLOSING_WAIT_NONE ?
 		ASYNC_CLOSING_WAIT_NONE :
 		jiffies_to_msecs(gb_tty->port.closing_wait) / 10;
-	mutex_unlock(&gb_tty->port.mutex);
 
 	return 0;
 }
@@ -620,7 +615,7 @@ static int set_serial_info(struct tty_struct *tty,
 			ASYNC_CLOSING_WAIT_NONE :
 			msecs_to_jiffies(ss->closing_wait * 10);
 
-	mutex_lock(&gb_tty->port.mutex);
+	guard(mutex)(&gb_tty->port.mutex);
 	if (!capable(CAP_SYS_ADMIN)) {
 		if ((close_delay != gb_tty->port.close_delay) ||
 		    (closing_wait != gb_tty->port.closing_wait))
@@ -629,7 +624,6 @@ static int set_serial_info(struct tty_struct *tty,
 		gb_tty->port.close_delay = close_delay;
 		gb_tty->port.closing_wait = closing_wait;
 	}
-	mutex_unlock(&gb_tty->port.mutex);
 	return retval;
 }
 
@@ -926,11 +920,11 @@ static void gb_uart_remove(struct gbphy_device *gbphy_dev)
 	if (ret)
 		gbphy_runtime_get_noresume(gbphy_dev);
 
-	mutex_lock(&gb_tty->mutex);
-	gb_tty->disconnected = true;
+	scoped_guard(mutex, &gb_tty->mutex) {
+		gb_tty->disconnected = true;
 
-	wake_up_all(&gb_tty->wioctl);
-	mutex_unlock(&gb_tty->mutex);
+		wake_up_all(&gb_tty->wioctl);
+	}
 
 	tty_port_tty_vhangup(&gb_tty->port);
 
-- 
2.55.0

