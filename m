Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882139;
	b=jCDSQUKnOX3GXpIKMbiP72IY1P8G2GfD1YEE1gZR+UTPFoFnvSNsF2Wbmw23O6CF/IH3
	 +V4ifGNesE7qY+6gh4cZDFqFVfs1CTOtsWaYsnzEL6yQGh5vlJQLJrjoTiZA9EAWROKeo
	 1o/QCS7SqFrz/TVYdVat1VCf4zQxjhdAyVcLe154ju9ufQoAkHq81gpPj9QuEKNTcl95n
	 VFruYjNjzK7TuaLut9XGfyG0RPS/IVdPoYKmidGbezzbYuAIL1LNUIXogO+QTxYsWE2KM
	 crj7BBgGxDFpO7b0hBnbnUHT63JSC5u65FT0KYvhik4zPtgpeEMysWpnNyYDTirz+9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=syMOQJNZT949tPtaFso8iwjMJ2GFKalrcIxBNtIXXhk=;
	b=ZxEL95/CBmrahgZsAYRgM1GmndmyksQ/C2d1xWdU+BjPulDU6QVLlN4l1g6TNJwDR5JM
	 t9l5QN5+YnEDK8nmjLGgKhxEpZwj8I/zMTO7+/wM4mb5/l/U0bBwTCzY+ERbSblpNlq5t
	 jBLoeoW6aezL+++QOmtPkc7vJ+h1VHOd1nBe7yh4j02JbeTQQX434uZw6uV4IqzUsLGpC
	 Y2k+1Rs4saeo9vLbou23kq2Yx++IHMqVQvQTC0CoQZs9JrDqe0RAfT8h/Wpk4fi5LZRsb
	 s6KpjuZSEJCoBuXhjfpqKcBsT1YPgj7MYtUSAwVUxeoOegxhZkAq+QE6OASVDFEQJzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QX4gYcuV;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC26606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EC26606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QX4gYcuV
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso4910745eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793882138; x=1794486938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=syMOQJNZT949tPtaFso8iwjMJ2GFKalrcIxBNtIXXhk=;
        b=QX4gYcuVHgwKJCQ9cSDV4cN3M57epP733qL1J/0vOQ5KzMRAKinQQ7bmC/DJmPjdbc
         HNvqdzdagU9G/zWUbofNenZERu6ryiSdNI5Jru6DgJQ9AL+Jrmv8iXbIM3DjZHjGzO0t
         EfutDO+67FHU5UtvJSwPa/HMRlsSu7b2V9Y4JPQW9ESILRyw1+u71Ea5yN10RQJcQ87R
         JDOK9vkCsWS/uFx9qJtH6+S7psryitbPzkrBakk0rB2r6ay0IGFLtQwtgaJR5MYzNpuz
         2oRGW3bSJcZTrZM9OmKxc2ZeENLJHWilUQEjoM5JDFuJcMqSZL1+Ta4scMqEBSIgW7kx
         fJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882139; x=1794486939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=syMOQJNZT949tPtaFso8iwjMJ2GFKalrcIxBNtIXXhk=;
        b=0xV1VVIX/KVKECmiTK6VwnGJ1COiDAO8glCBUHFPO9wI8eBLMYeC6j8ochMUWcSOF+
         9HbYQ/374Ua5MLHoGrOsSGG7TZjFT2Js/zcFmfruaAb14xid3DqkpwUHDoG9Qx6dnezp
         Ny+kO6FGO+qcMbGKttua28dqz0sV/8YOZ24WuMRE9sadItGUwR4UHiCDQckgqtwvUNVv
         oa+2Czfn/xkPpo5KnIHFKzTc3sVpZNy2SJf0LW4P3S491jHFZ7WQDWA0S+gUFVeyWQUy
         H/T1+VdGvt3omHl2auDWwizIhhwl5zEDWVoAsHUxgt6W1y3iUQ7nxfKEo0zPXOYOkNRd
         h1Xw==
X-Forwarded-Encrypted: i=1; AKwUvByg9x2PU0bpnq+KiIq8bkyItI42MEhDyYTod2NKkAV50lYFV6Pmm06gHguqS23u3kmC7i6iYGSbGB5RPrY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mMCn8f/GE2e/ayUm7FIt+go4TnVIbTbYfVLANU7KCqsCmmHU2
	O3/Q7qEHWTNqHphxBmXgOfg3s24i2Ezn6BH29MPqDR5Ct4Z4/zR6kb0+s/OBZAs=
X-Gm-Gg: AYBFou14hj2ZGkYPfau7l4/7S8GR1yN8dDzABIv7Lz+COD2fXYBHhlaAZZCJddn6prb
	Q+Fn9OdKIc1Ye/Ds6P843aLK2PAIXewfHewzBY0fqCi53CnBZS+1nxogCbSBTW+kZoQBPIHKVuk
	rp/WkV34C2+1i2oUg5raibXqTVzjxkJi/D2kZbeuoHZlq/YR/sgMlODnwPAYveg83Httw8c9Bv/
	lC5MNQwT2UfdNHABLDiiZoersuR+MKzzWM8TR+x17mtbdiVGuryqFQElW+/f5KsIi5miE5mULur
	AVTbD+P6smhGPY1Za8hEFfPXieC+huHEYXMZ/WT56ulLJiWddCZQJ2hlxob5+y3NHD0CIshJxFf
	eOWuR3mtxTZiQBj8jU5Wct2l2EM1E5k7WwB/CUvT7LAv9A7IAF0X3U/idxAce1i4DgBQ63xLWwH
	aU1md0jpZk4RomNB6OPreGHUoC1dppCSw6eF3FzhetOMQcXZubwKWqDWLFZTqJ4FQ50FampTDs3
	jUC6AiL5EgdWJImLyyeJmiHL8tK7wikqiFQfJDiLpwTfPdYpmsaBXJQDpgBw3EoDmk20yc3OD5E
	AlPVLd3l6XFljNxfb9oyLc3FbjGhJpuevJU/XvvMBnNCwoRClgP/EZa3+g==
X-Received: by 2002:a05:7301:6199:10b0:36e:3a0a:2953 with SMTP id 5a478bee46e88-36e3a0a2afdmr2828151eec.41.1793882138307;
        Thu, 05 Nov 2026 04:35:38 -0800 (PST)
Received: from localhost.localdomain ([202.51.247.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm22384893eec.27.2026.11.05.04.35.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 04:35:36 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: brgl@kernel.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	linux-sound@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: cpcap: use the platform OF node setter
Date: Thu,  5 Nov 2026 20:32:28 +0800
Message-ID: <rc-review-20261105-v2-28-d7877b3f9c24@gmail.com>
X-Mailer: git-send-email 2.50.1
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

cpcap_codec_probe() gets the audio-codec child node and assigns it
only to dev.of_node. Platform device release now puts dev.fwnode,
so the acquired node reference is never returned.

Use platform_device_set_of_node() to synchronize both fields and
give the device its own reference. Use __free(device_node) to release
the local lookup reference when probe returns. The device keeps the
node until it is replaced or the platform device is released; a probe
retry also drops the old device-owned reference.

Fixes: 7b5b51b2b05c ("driver core: platform: count references to all kinds of firmware nodes")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Changes in v2:
- Use __free(device_node) for the local lookup reference instead of
  an explicit of_node_put(), as suggested by Bartosz Golaszewski.
- Remove the Assisted-by trailer and keep a plain-text AI disclosure.

v1: https://lore.kernel.org/r/rc-review-20261103-28-afc55c614a25@gmail.com

Based on linux-next next-20261102 (2637bdec0535).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
Baseline and v2 target objects built from this exact base.
No full kernel/module-link, hardware or runtime test was performed.
AI assistance was used for analysis and patch preparation.

 sound/soc/codecs/cpcap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index eaaf141dea57e3d14078c47350c1c4daaa0662b6..0e7c05f5bab607f8c4fb17d493e578b831a32f84 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -1754,14 +1754,14 @@ static const struct snd_soc_component_driver soc_codec_dev_cpcap = {
 
 static int cpcap_codec_probe(struct platform_device *pdev)
 {
-	struct device_node *codec_node =
+	struct device_node *codec_node __free(device_node) =
 		of_get_child_by_name(pdev->dev.parent->of_node, "audio-codec");
 	struct cpcap_audio *cpcap;
 
 	if (!codec_node)
 		return -ENODEV;
 
-	pdev->dev.of_node = codec_node;
+	platform_device_set_of_node(pdev, codec_node);
 
 	cpcap = devm_kzalloc(&pdev->dev, sizeof(*cpcap), GFP_KERNEL);
 	if (!cpcap)

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
