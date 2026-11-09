Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244925;
	b=s0CtjPZkMCVRik0Wxmia1xVeEbHoB0tj3Zv7QH+OoJvDkEpny1AAheEtwgo6q2Aebvk9
	 ISi1meaa26ckb53sDmhxcSavkC74ic0wlk+55VPZuumUonPCtY8q99B45vgeCGdLxObej
	 OgCY/H43JhRY4SLUxY/rzlWTlvKM3WBJSZR5DsKl7jt70gMN+aVAocO7ssMVguvYbucj2
	 Lc2eqXT+dcmXqTiOEZZV2/QvpCd3r0gNnoeSHfJg7MxFA8cPsxDrwbI4TqQzKtcapdDQV
	 0rX6pu75HtYIUDwx7+7VK+B3JoFk22KNNFg4S8Yo02RLpzLk7Hvm6BjJh29J9BPdLcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5LpgpL2Vm/swkS7qZWB8wOpeYfhvv54g4ZTTBda+f2A=;
	b=DA7HfwawYvnpOMpriidlyLBZRDbPUDWWMcdRDTwFFfaQcEiEdL3Ku8es7Qe9rc3xSx7R
	 awsx+4aa4ER+qFo2pYfp/G5a9Z3anVNybfQ6Ghj6+CjZDgZMXW9mUTMlTGEPcizvu+zmV
	 RMSrRYNk6+LdcSyQ/BGJn8BYFM+ENmV8Bz4QoJWcAeu9NYBPqXVdX1OxqU0x3x1fngCl5
	 iOQDbOgZyGgrWAgWae7OjenZq0gKZjYzg80G/ZES/yCHfP7JlZe2pXnUZM/OAlgKACxbl
	 Ag9lJIb6RbeZxPSqFGsvyYzBXfJo5EVCJvCNonyCHIfiVWsFlH+8qnU3449BtKkplbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qnCtOysC;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540F3606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 540F3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qnCtOysC
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b244fb7fffso1391141c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794244924; x=1794849724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5LpgpL2Vm/swkS7qZWB8wOpeYfhvv54g4ZTTBda+f2A=;
        b=qnCtOysCu33I0l52a/q/vUnN8e5/1zgL//hKB8axZuVQzgUN6DsejxbLfEXNQAOcRf
         fFp77Lrtvx75fLUGAYXKOnOd8/5FUoavr3Gb+V/c1B+kAjIwfDYrtB2uZVX6fbW4+2+A
         4ObxNM3cl9ALgwQBTkKPvu9gbWiLjPzt7hvi6aO3/ePOgLQZaSu7ZxII4TLTiPY5OtCf
         nhnGmWGJf3a9twzDffAFrnxwwi5/e0k8VltJ0PqVL7+jNRirikmb7XInS2G+s0R1j145
         Ny65dFX0Qrzr0LKmKlKoOAAok5m5GXnQjPJ09GgHMQjKDMZDAVntkZWM4DkLVZ4ciWZZ
         X55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794244924; x=1794849724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5LpgpL2Vm/swkS7qZWB8wOpeYfhvv54g4ZTTBda+f2A=;
        b=03MITi10uok+jNMLoifhn3YF7WMaSSJkAQEFGPyZmmlEtpigJktTfr2XYKPIduPbpB
         a6RGwYWGL8uGYL1raHJKAT2JFkncwcYIcHPuBQTuAAnw9L1vCjQm2efgfvDiXrxUqU/c
         byLAyGu/Z7NMWyztbl4HAlaUd+Xl7tiWFvFi5KFDBAwkngVYVeqZwW8Md9Lm7G9J57ix
         +8WJi391ZAPX/aDQJq+j7dfcq5F2hC56wtMsW3oDJje24filfB4lZ6B+z7/yg1lmrOBn
         N0drZ8N3sXQPAOcDA/r4jbHV8esNP4QChPyLKcdR4KkO1hGUWlcmjejP485QqmaXTCBP
         Brtg==
X-Forwarded-Encrypted: i=1; AL+hErHp5dHeZkdq5K3a1tIIjIzCd9FP/+QBE//EYpvHvSc+OlcXpySJQZ9afdYeBujn2FhDM84dM1c0gD0A790=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AXWeHrW3GDcaeQlCa86eucGnopYw/eTVuTiSsIwyNh2eHtNUc
	ZYdqSFNlLl4CS9t14NMZKufDFecZoP9SrlghmqcAPji5QP5MVpoMMa6v
X-Gm-Gg: AYBFou2qHtW2++c8uL5Jmo9kmHzMtUTszRB2lBy4keKfnkiWoE5JR4FBzgosrWqQqvo
	HcQlHi7UapZIcmnybzXzJcvJN44oKm/4le/PAXsy5I2FIhzHedkSLRzIG585UCClPEm6j/Y+NPH
	2adwQWVWluPnYzVZlJlA5i9wij1HNM2O3Y58fAVSfMWaN7VjUnEZDlBdIM/KO/E4R7IYVbhU6NQ
	9vHxn/QnVWgRa1GOdMBARjCf4nvJss39AvUWqNPG6mpwUsRnCwP2+VkRlPJoryuzTHlf41CRzbR
	ScqmGRhuwKlKlzSjQBEZsBl1V0+3xzt2LwtF75uyLPOgGWTskPMh7MpizsI4TlZkTrAl49xdrzX
	1Ne2R8cjMWJ/PX2Y/7mgfHi7rH+nEPkKkY23GEt9a7sANVeSXIzMARRLyIWpcFiKx9tSiXQcPWP
	kyp4rPIGPgK7aGXJNSDYWXW2yhUzoVKNPV6eUluyroxx/9ILXl9s/33U1wvHEBSMUxntfyg8ZpQ
	hv8DXPsJ4t8QMqC24KL2dQWfZRMVmodGR5K0gwBRitg9362gwhr/wXaEgq/xmELzN8/xipBD4ZB
	7XTDRXD3jUeTOLSUmHNxE3kl3jRG0sGlmj3qgXe35X/gADFv
X-Received: by 2002:a05:7022:b047:20b0:1b2:6855:997b with SMTP id a92af1059eb24-1b3b5ff8c21mr129142c88.25.1794244924205;
        Mon, 09 Nov 2026 09:22:04 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b54431sm285869c88.17.2026.11.09.09.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:22:03 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] ASoC: rt5659: cancel jack detect work on removal to avoid use-after-free
Date: Tue, 10 Nov 2026 02:21:55 +0900
Message-ID: <20261109172155.1851386-1-hj351016@gmail.com>
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

rt5659_jack_detect_work() runs from the delayed work jack_detect_work,
which is queued from the jack IRQ handler and from the jack-detect setup,
and dereferences the driver data via container_of().

struct rt5659_priv and the jack IRQ are both allocated with devm against
the i2c device. The i2c driver has no .remove callback, and the component
.remove and the .shutdown callback only reset the chip; neither disables
the IRQ nor cancels the delayed work. On unbind devres frees the IRQ and
rt5659_priv while jack_detect_work can still be queued, so the pending
work then runs against freed memory (use-after-free).

Disable the IRQ and cancel the delayed work before the chip reset, and
wire that teardown into a new i2c .remove callback so it runs on unbind,
mirroring the sibling rt5682 driver.

Found by static analysis and code review; not runtime-reproduced (needs
RT5658/RT5659 hardware).

Fixes: d3cb2de2479b ("ASoC: rt5659: add rt5659 codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 sound/soc/codecs/rt5659.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index 0000000..0000000 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -4319,9 +4319,18 @@ static void rt5659_i2c_shutdown(struct i2c_client *client)
 {
 	struct rt5659_priv *rt5659 = i2c_get_clientdata(client);

+	if (client->irq)
+		disable_irq(client->irq);
+	cancel_delayed_work_sync(&rt5659->jack_detect_work);
+
 	regmap_write(rt5659->regmap, RT5659_RESET, 0);
 }

+static void rt5659_i2c_remove(struct i2c_client *client)
+{
+	rt5659_i2c_shutdown(client);
+}
+
 #ifdef CONFIG_OF
 static const struct of_device_id rt5659_of_match[] = {
 	{ .compatible = "realtek,rt5658", },
@@ -4347,6 +4356,7 @@ static struct i2c_driver rt5659_i2c_driver = {
 		.acpi_match_table = ACPI_PTR(rt5659_acpi_match),
 	},
 	.probe = rt5659_i2c_probe,
+	.remove = rt5659_i2c_remove,
 	.shutdown = rt5659_i2c_shutdown,
 	.id_table = rt5659_i2c_id,
 };
--
2.43.0
