Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE8B477E27
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790035053; cv=none; b=JyHpvzkjXWOTfHtULJaJyZSp7TOG0IRu/pM6OWAQPjVCTPiGHVhe+J86i9zRw6GjvwrAeh7AdIgJZSeql/KrLdH4yXTo5VHPLr3GuE1n9EMNQsJARCphs7K9cghME22wz1a8wmdelI7hE73dN1VvLreCQnyR4TDpjUTXYoGTVsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790035053; c=relaxed/simple;
	bh=YDBw5U2KrTFoLtn1ePgXe55ZEirZT68PAU8v7TTN/74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fx00kJe8vSI+gDPvDiZpYQ77YW0tiLZdE46RyY3Omy7ZdzslOD5B/RGmyq8VoyHbfOayh+oD9NfNaRgZ63Mb+i0G7yq226FNC/N76LPjHhB166frpQuo3eF18gEjdf7nafX2+wlnY04Vr5HM6VJqcoQTooi6HaQ/kmq/3ENHUQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sDk6430J; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sDk6430J"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-532c7643bc4so16086561cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790035049; x=1790639849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hO6e7g4iL/yYUT0YGjmRQ7zN/k9vF/YGJ0T17OVHKgc=;
        b=sDk6430JqzkgDsIKxWBgAMMnwTR9DC7pYrMfbGoPUqNH7NgstmUKlEEuVTLcmnU3x/
         rFa287qMzd3ZzLyK2mpNtHXJmiG7CiTqs5GshWbBRJFnt43RmXo7PUrnYzCf/rJbuqRX
         9isDhzP3mh7fsfxn7k14HmGez2k+jszVH8ZegnckULPCQnUAysRvLRGbHINT1CTV3nvI
         zZ8+8U702c6napv8V4eyt+Ns8TCJQpAHz/vHbidQvRx2uzmq5oS4Z9SzhUz/elhNpl1J
         Umtsz7WcyEJCBGGE7rlNStCCH7tiiG1TUfBsJqrD/V8bvZOVwrKguy7eVs7NsePVbJzo
         xfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035049; x=1790639849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hO6e7g4iL/yYUT0YGjmRQ7zN/k9vF/YGJ0T17OVHKgc=;
        b=d2YxJkDfWTZuLGPBvf+UXdiegMnlRJ6C3yoytkIDp8VlAHs59XXtyxqmDQhDanklIi
         OOZMV0imKjSOiGslicwMFE6UlhRZOX47GdutOCMzjoJgFV19hjHPpNV3krzCgmib5ouW
         SOscjXqSXEfGVutmWpulIOSL/rRbRhzkILZ8mG+sw+OjkNqDyw/A0g/NwoiMITWUrJSj
         /CXKISCc4tzT0kBDUrdVSwxi0yYJqCABUpfAFz+vtQqXBxsjc5YffiI5rlYwE2oZKH4O
         W/3sKMWh8tlpPuHshY+MR7qujt9N6mGSc9Kh/XT5M6tocGrghwvNWmKrVayZMXB8J76V
         TDGA==
X-Forwarded-Encrypted: i=1; AKwUvBzE9iQ1U718Pk0ICGT1LL3bGQLJ9mXQmmRT+7JeehFTHokxK3JLogCUeBLx4YCe6LMyV3fm7BIBolq4BEo=@vger.kernel.org
X-Gm-Message-State: AFuF++lZ6qRJqLJouvhF4TeuABCLYsw6QgzL6KjA49i+KUtZgUzHvCCP
	kaZ8kwcCWAh6wfcY8wtSXlcVN1CrtTMOg5JE+FE0oNHIoFBxILgQW24=
X-Gm-Gg: AYBFou0e1FXvH3bCOjLHvcQNp8tJy9R7+7kS+z58tRu8K+PH8yOJsRlLyyDHuDDw/Cw
	q4bewd7JgsvWEVf5ST7EcrEF0ojVgu+cNYyLb3xi8yiazQuy/UtV9YKyM6vtKsefYivI7uo5Tsw
	D8bRh2L9RPXMz7MPROWYp+dRKj/PoDm83hqy+doA4pH4UIYkDbb/DNoXaWeB1eJPA6a9IoSQOOS
	7JP7xsGsAbxFy/GVE1lHBQJz2u1euTgQRzWkfxhEF/lyz17EfdNyO8/q+B1gSqJPnbm9XzfsR9Z
	6xgyrGfvNdVZ94lXGip9+5n4t6mz1RTieOoeJji3+9uub4/0nS3U+OjsQsewLIr5yuXamVdzs3J
	zUgD7QeWJ9tdMjqMmX0hCRMcEGWeno8rL7bt8HIZ2P6qwRfKqDPxeQiMy4UXwxiF2xRXuL5Mv/k
	H3dcFADPV7mE+BqXNW5bYeGwKl/HpWaNk7pO/fCkSpH4pu0My3yp2kqz4DE5cyTVy652eZLBIq0
	5KAL8S3pRfLoHsgEb6YtJc8kZTNL/v0OpV4Hu+5OofsNocGoGIdEoJayueq3AyFRNIaI3U7g19J
	cp/LGLuk9Px3K6PlmcvmzRoBCAipLtGxOTD+t/8=
X-Received: by 2002:ac8:7f51:0:b0:530:f214:6240 with SMTP id d75a77b69052e-532d8e9673amr31330151cf.60.1790035049081;
        Mon, 21 Sep 2026 16:57:29 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532df30470asm3009161cf.14.2026.09.21.16.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 16:57:26 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] ASoC: wm8962: Prevent mic_work rearm during removal
Date: Mon, 21 Sep 2026 19:57:24 -0400
Message-ID: <20260921235724.533472-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wm8962_remove() cancels mic_work, but on unbind that cancel runs
before the interrupt that queues it is released.

wm8962_i2c_probe() requests the interrupt with
devm_request_threaded_irq() and registers the component afterwards.
devres releases in LIFO order, so wm8962_remove() runs before
free_irq().  A MICD or MICSCD event in between makes wm8962_irq()
queue mic_work again, and the delayed work then calls
snd_soc_component_read() and snd_soc_jack_report() on the freed
component.

Commit ca50410b731c ("ASoC: wm8962: Move interrupt initalisation to
probe()") dropped the free_irq() that used to precede
cancel_delayed_work_sync() in wm8962_remove().

Disable the interrupt in wm8962_i2c_remove(), which runs before devres
release.  disable_irq() waits for the threaded handler, and the
existing cancel then drains mic_work with no producer left.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: ca50410b731c ("ASoC: wm8962: Move interrupt initalisation to probe()")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Found by inspection; I do not have the hardware, so this is not runtime
tested.

 sound/soc/codecs/wm8962.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 8a9598161b35..210ec96fab4c 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3890,6 +3890,16 @@ static int wm8962_i2c_probe(struct i2c_client *i2c)
 
 static void wm8962_i2c_remove(struct i2c_client *client)
 {
+	struct wm8962_priv *wm8962 = i2c_get_clientdata(client);
+
+	/*
+	 * The IRQ is devm-managed, so it is freed only after the component
+	 * has been unregistered and wm8962_remove() has already cancelled
+	 * mic_work.  Silence the producer here instead.
+	 */
+	if (wm8962->irq)
+		disable_irq(wm8962->irq);
+
 	pm_runtime_disable(&client->dev);
 }
 

base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.53.0

