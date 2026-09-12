Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F6942A144
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 17:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789233668; cv=none; b=VGE18ho5iGWmZX/effrIfsufMI3Y3HCWjXS0KRqXLCGBP5SGip8+e08orRLIg4Sk1/pqH8uXRb2okVemjyb//wJaxz+cNKGZIIb92qcu8nbcUvjcNIwHxQ1wxxaZq/+jGdNyk9oxPCm11TUqfBzhWiXl7aUrA4HCb0cePQIR9MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789233668; c=relaxed/simple;
	bh=vXXGCo/Cvd8orX5ZHIf26NBPMR725nb7AVPQUDI/1eM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t4upBe3MViDRH7iiZ5Yy8uSDjdet5QARstZZhgHQQVduEue5FKZULErRMFXD1As5Ud582o9/QlosLOlUjhgs4mdMisr5BTqJDKEktbXtRiP9jcGBDtsrxZB0/Fyp8dIftOcNhLmgKxZ6YtCVLZZNj7NqQPSFmnnlfp25AUeDUlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FA3OWHNt; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FA3OWHNt"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d7eso7651201fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789233663; x=1789838463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mebu2RW2U3weGUDhTYy7W+gVJ+9xcUZXKXTexRRpr2s=;
        b=FA3OWHNtuOkj5X5mTwULnmQsqRmI+Gl3u5x93b+Y1+w8mrz79wGwz9KP9AyNvhPV0X
         8AVUlsEIFngLKxvrRwWvqjS5FNGq+w0U+Xhld0d+ER7TfRJ79NsgVzccM2DRfyAeSh52
         5aVzSd2jXjtyRLWMMwcXQm7kvUUKc6x7jMMUljSHWQz0Pjh7leRqU40ZSHX8XkXDGATS
         WWzqMrCilwJ8zkTxwfIHzOSjRzpaFF5KT7F5JUg1zqC22aO/ZSK+LXvb1PeS02TJ8VXj
         GFwfbDRhYQMo2yh4A8zpC4ZYx5VAj0f2M5nL+52b6fIVy8VI8+xmw8YTqI2KjvAlaiez
         Ta4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789233663; x=1789838463;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mebu2RW2U3weGUDhTYy7W+gVJ+9xcUZXKXTexRRpr2s=;
        b=idmhVisVKOziwDrHTzgVcFy1UAQZr+t57c3ureAm+q2sBh4y3ck6Jtm1r4ccKrGCVE
         0ieKu6nOiPdpKKDRiHHdeAe0DVT5nUcJX5vDfnwgtywmRfZFJME6tVJvQtn4235a70sm
         rqRoMsShpsH/ExsQGV2qDRm2zJWSToOS5/+MSKJeK0Elt5n/QE3lFOet9Q/k/RmlJTW4
         KvFV3B6HangF452i/La84SZomQxKGv1bZACu2BZd577GkQylLWbQtYqyhusBRI4Ff7tK
         8OnyuQZLw5P+aQPCamUX8YEVvokN8tRNHmBZNOdJ9I5ApD1ophRciLzxsv60Qi8cfTsI
         J9OQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrMRmFqZlMQbzuitsjv2N2TxQE5HHtJ2xkxbNzOvt3p6KHibGGVv4/8hd44+QpdariyekTQpfIXsZFsiE=@vger.kernel.org
X-Gm-Message-State: AFuF++nz6p5GJQLPAuQmrfD1y9uKrddK7rIhugd2odUlKtddFMzMeeHS
	J62vUaXNKzduWfO0TqvYFBDZRhsF0QatoNH/K2r/DMgwKfrh/mgtWtS0
X-Gm-Gg: AYBFou03J/MjvVJct39YurJkr+DaUlIAa9cYADu385P6CpFxiHtHABf2CR9lvNfjg4V
	kWPe2oeplvQfyVQeW/IzqFkIsmK/JF3Cjz0UwjGRemwYojn6bMX6VpGhmWOAlsmQEhYOhSJy0wi
	FStnIDqjFGqNO7YxGMtl1xLzfzwFi2bE4t0oQSvFMDOC5T7xirpN4z6KPRzmoaYYOZ1J8de9xUZ
	pJEJxrpXjC+IQZcND+edhqEw2Y3Qge4EKlDUtBpQZzkC72j3jDziLmqTGuKSIQxkFBwzBj0utvi
	36ra6z4rtldJt8C5MkyNtZxDEGoVoOcTY8ioYTZf2qQkQS+Eal9E8eOvqJ6ANl9J8+tQNgeA9eE
	mGsOo9rmrXGvMpBeemw6rHph9TlaysV5noowjIrPffflKT5NXKFy/Lk3YREPVDTwEUTfJd/Mv0E
	L54vMy/XdCpbeVnhiIYbeWADMUESuM7NKA27zXQ2L+gVwMam26BLozso1PQFCmfBvohJxQh1xk4
	VuKDOUDNnFaALxgEGfYf9YRJgg2GuJ8D/4MTeIoNox5
X-Received: by 2002:a05:6512:33d6:b0:5b0:113d:8ae5 with SMTP id 2adb3069b0e04-5b8a02fa142mr4002643e87.10.1789233662685;
        Sat, 12 Sep 2026 10:21:02 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a03a8009sm1377546e87.7.2026.09.12.10.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 10:21:02 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
 Antoine Monnet <antoine@montane.tech>,
 Robin Everaars <robineveraars@pm.me>,
 Ville Saarinen <wiza@saarinenkoti.fi>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: tas2783-sdw: stop describing the Latency and XU ID/Version Controls
Date: Sat, 12 Sep 2026 19:29:50 +0300
Message-ID: <20260912163500.8412-1-andrey.golovko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The read-only Control list and tas2783_sdca_mbq_size() still describe the
Latency Control of every Entity - twenty-one registers in all - and the
XU ID and XU Version of the Extension Unit.  The driver never reads any
of them, and the platform firmware seen so far describes exactly one of
the Latencies (FU21, as a DisCo constant) and neither of the two XU
Controls.  XU ID answers COMMAND_IGNORED on the bus in every power
state.

Since commit f4ffa3820949 ("ASoC: tas2783-sdw: do not cache read-only
Controls") they have no defaults and are marked volatile, so every
access goes to the bus.  Remove them from both tables: the driver then
neither declares them readable nor sizes them, and the read-only list is
left with the readings the device actually reports - Clock Valid, the
actual power state, the protection status and the algorithm ready flags.

No functional change for the driver itself, which does not read any of
the removed registers.

Link: https://lore.kernel.org/all/70a91202-e801-4008-bec8-883b229f9f0f@linux.dev/
Signed-off-by: Andrey Golovko <andrey.golovko@gmail.com>
---
 sound/soc/codecs/tas2783-sdw.c | 53 +++-------------------------------
 1 file changed, 4 insertions(+), 49 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 1d31b3bfb1ad..8dafdc7af129 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -333,7 +333,6 @@ static int tas2783_sdca_mbq_size(struct device *dev, u32 reg)
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PPU26, 0x11, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_TG23, 0x10, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x01, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x08, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x0a, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x10, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x14, 0):
@@ -419,7 +418,6 @@ static int tas2783_sdca_mbq_size(struct device *dev, u32 reg)
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU127, 0x0b, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU26, 0x0b, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU26, 0x0b, 1):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x07, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x09, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MFPU21, 0x12, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MFPU26, 0x12, 0):
@@ -431,27 +429,8 @@ static int tas2783_sdca_mbq_size(struct device *dev, u32 reg)
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_IT21, 0x11, 0):
 		return 2;
 
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU23, 0x10, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_IT21, 0x08, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_IT26, 0x08, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_IT28, 0x08, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_IT29, 0x08, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT23, 0x08, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT24, 0x08, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT25, 0x08, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT28, 0x08, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT127, 0x08, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MU26, 0x06, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU127, 0x10, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU26, 0x10, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x06, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x12, 0):
 	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x13, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MFPU21, 0x08, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_MFPU26, 0x08, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_SAPU29, 0x05, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PPU21, 0x06, 0):
-	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PPU26, 0x06, 0):
 		return 4;
 
 	default:
@@ -465,47 +444,23 @@ static bool tas2783_readable_register(struct device *dev, unsigned int reg)
 }
 
 /*
- * The read-only SDCA Controls the driver describes: the Latency of every
- * Entity, the Clock Valid of every Clock Source, the actual power state of
- * the Power Domain Entity, the protection status, the algorithm ready flag
- * and the Extension Unit id, version and firmware download status.  None of
- * them is a setting; every one is a reading of device state.
+ * The read-only SDCA Controls the driver describes: the Clock Valid of every
+ * Clock Source, the actual power state of the Power Domain Entity, the
+ * protection status and the algorithm ready flags.  None of them is a
+ * setting; every one is a reading of device state.
  */
 static bool tas2783_read_only_control(unsigned int reg)
 {
 	switch (reg) {
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_FU21, 0x10, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_FU23, 0x10, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_FU26, 0x10, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_XU22, 0x06, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_XU22, 0x07, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_XU22, 0x08, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_CS24, 0x02, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_CS21, 0x02, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_CS25, 0x02, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_CS26, 0x02, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_CS28, 0x02, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_PDE23, 0x10, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_UDMPU23, 0x06, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_SAPU29, 0x05, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_SAPU29, 0x11, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_PPU21, 0x06, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_PPU26, 0x06, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_IT21, 0x08, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_IT29, 0x08, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_IT26, 0x08, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_IT28, 0x08, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_OT24, 0x08, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_OT23, 0x08, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_OT25, 0x08, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_OT28, 0x08, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_MU26, 0x06, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_OT127, 0x08, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_FU127, 0x10, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_CS127, 0x02, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_MFPU21, 0x08, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_MFPU21, 0x04, 0):
-	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_MFPU26, 0x08, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_MFPU26, 0x04, 0):
 		return true;
 

base-commit: 604ac544390f420332b10738cc10b29a2e91bac8
-- 
2.53.0

