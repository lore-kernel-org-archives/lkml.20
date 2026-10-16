Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6BC4E8E18
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168456; cv=none; b=Fogcmf7b2YmrozWn3VEgPRGp4ZzZ2g/VDw2jDsUZYvRTpvA2esYF/kXAVGybrlU6UnqAqGR8C8fOIg8CSWOBlu2kajetoDh9mnBCeesiKESf36YfDCVYtylALTZlIn5qHb4YBba72F0Oj4fOr6PwbgZ2j55/3aQL104+S9DsOSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168456; c=relaxed/simple;
	bh=lPuuDP0zYYTDKWcNDKXhkBEWu3DNnh72x0VZcZKW/bw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LOFz3Ued0MEEiWV8KLga4EtrZrLqSnlXa78ioHYwSYtLJgP9GL6BFYHgUdLcynR3nmhUP1J8K1zLaN9bmBYkyJk4cwLH2bU1E3m/EWQkLUpu0TfDJu17SpxaghE4TNvLC2dLhlw4US4sa0148XF0hnfQ4Okua5uem6UyHGMAkWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oq0Lugek; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oq0Lugek"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91b52ba422cso1708996d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168453; x=1792773253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/zpqW04D+ZINAIIOtwG+xWeA61dEkSOenbRUatwkrI=;
        b=Oq0LugekXX8DrseYWIWr/rWxqX0KtAv20B0cjxMLZjHYvgHtMo+hB1hcfqI/WGhl4O
         jV0rCg127Rvxv9Br3Vb0imnMCRPWNgNlhLtfTRsZls8nwOcYtCWB0B1pPJS58mwjEJoH
         E9Yw3XB3GIW2UYqycqxOeVF4S/ksJqkU1TFSK6g2CrKrk2xPpF13wCXQkWR+jvxv2A4+
         Ujm6nJLugQB+TUO8oyYua4R7Pt6PZWBosTdAAvlcKdH2orkBpRFF3azF7j9KXpa/M420
         qYW3qA2QEOqFg7A0yyXvTlj+9OqGuQoJh/T+3imKL45IPbXo7Mdn+yryVwgrJEYK9OJJ
         Dh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168453; x=1792773253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/zpqW04D+ZINAIIOtwG+xWeA61dEkSOenbRUatwkrI=;
        b=eoKFp0m1UR7Mg0obsxjDJhdrh8rY3W+UdJvQl+S7+F7euWDqRfFA59BD1zvygFamrH
         PW5LmJ7e2i2Z++ze0aU8WB9E6z5bDqh/38YIm2Jd2QjUMajmItiAIS8zu7lyfL59Ws2S
         oezVDLQwfVEjRNT0tL/w/jxeSWtV4MGc6dX37H0NTXuTnPWz29LMFKt4PKsVPi0cQk8h
         /OxK1K3+OSRkEtF+B8eeSH2lXtx53JOLOUg0ne6nwIp2hHHqhuyJKb48h8mM5bWAyFVx
         JDGFBNlmTbOTQs+irV5DjsP/1DlmDPDJmnMc5Epi81Mg4TXwNcFzYtyNajSQb0EsrG2n
         cKFA==
X-Forwarded-Encrypted: i=1; AKwUvBxmO7he8T/TWZD8KIAC/jMFVW4gDFhQ679RLM7DIU2LuFNhjuq9h9+EYByCQsebfPeVssbup7e0KXdksp0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ04iK3c4dD3ygdxs0x7AjHPr/1R/uHCMjCIsRDZ6BKh0Dod8zz
	6RhFlgjdtxrfSEYozOTMdfM9Ua4H/TAoYl1eYdaqLRvsYcb8wLu53c89
X-Gm-Gg: AYBFou1z7Rk75qPbIzbZ4/qk0Yc4EKk8TmHdViD/mfiLSw+2ecZQR+5cFqtNxRo905+
	7UwmGuUUmqD4nAEFdk734LzXXL3k3IWdVHXU0dpgmdsKGQNN/mVT+WKkU4yCqBmspBM7jxSmv+U
	xeIOKayJzMAtnomTxRn8b4K/VGgtUmvMDha+hD66tIvuZ/yd3idQ/ygWDiPi+45hpjCjBVqVl33
	BWKpW+59WxMcMsTFkK3xfEIn0eVef2OD15gErKm8LEhrb8mqCmqjjsSH3oxZ2icJjfpZRdu4++i
	h424ruVNXUtZ6TSiDcdb6g9g4jixzXQ0Oo8ybUIkVD3owYuqrXWd6FnBC3wr5AbizZ2+XnHVj+J
	PEWJY7Rc7LNi3foba8zq0Z5Iyc7BrMUiCu1TyHywhMehliktgh5GkmgJQkvDiCjauwsAAUNMGJy
	fqfxGCDfcPjTPAPUNfpNfBvP5wLu/tZC7ApvBlULNJEPnGt2Q10Sa4+5CjuQz/G9Q=
X-Received: by 2002:a05:6214:5188:b0:91b:8d9b:74f6 with SMTP id 6a1803df08f44-91bdf2af67dmr8675556d6.33.1792168452540;
        Fri, 16 Oct 2026 09:34:12 -0700 (PDT)
Received: from beelink ([187.15.139.183])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcc47bccasm25272806d6.20.2026.10.16.09.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:34:12 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v7 2/2] HID: multitouch: fix use-after-free of haptic data on delayed input release
Date: Fri, 16 Oct 2026 13:33:49 -0300
Message-ID: <20261016163349.3293666-3-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016163349.3293666-1-qwe.aldo@gmail.com>
References: <20261016151343.3120300-1-qwe.aldo@gmail.com>
 <20261016163349.3293666-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mt_probe() allocates td->haptic with devm_kzalloc() and hid_haptic_init()
stores it in ff->private.  When the HID device is removed while an evdev
fd is still held, devres frees td->haptic at unbind but
hid_haptic_destroy() runs later from input_dev_release() and dereferences
the freed pointer.  input_ff_destroy() then double-frees it via
kfree(ff->private).

Move all resource cleanup into a devm_add_action() callback so it runs
at unbind before devres frees the struct.  hid_haptic_destroy() becomes
ff->private = NULL plus module_put() -- keeping the module loaded until
the FF subsystem is done with the callback.  A second __module_get()
covers hid_haptic_devm_release() itself, dropped after input_put_device().
The input device is pinned with input_get_device() to prevent concurrent
release during the devres action; the workqueue is drained first while
all buffers are still live.

Guard against double-init when multiple touchpad collections trigger
hid_haptic_init() for the same haptic struct.

Fixes: 8d0bf7908b5a ("HID: multitouch: add haptic multitouch support")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 drivers/hid/hid-haptic.c | 74 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 66 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index 9753bbf..c7fafb3 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -379,32 +379,61 @@ static int hid_haptic_erase(struct input_dev *dev, int effect_id)
 
 static void hid_haptic_destroy(struct ff_device *ff)
 {
-	struct hid_haptic_device *haptic = ff->private;
-	struct hid_device *hdev = haptic->hdev;
+	/*
+	 * Resource cleanup is handled by hid_haptic_devm_release() at
+	 * driver unbind.  Disconnect the FF pointer so input_ff_destroy()'s
+	 * kfree(ff->private) becomes kfree(NULL).  Drop the module
+	 * reference last -- it must outlive this callback.
+	 */
+	ff->private = NULL;
+	module_put(THIS_MODULE);
+}
+
+static void hid_haptic_devm_release(void *data)
+{
+	struct hid_haptic_device *haptic = data;
+	struct input_dev *dev = haptic->input_dev;
 	int r;
 
-	if (hdev)
-		put_device(&hdev->dev);
+	/*
+	 * Drain pending work first -- handlers dereference ff->private
+	 * through the input_dev, so the workqueue must be idle before
+	 * we NULL that pointer or free any buffers.
+	 */
+	if (haptic->wq) {
+		destroy_workqueue(haptic->wq);
+		haptic->wq = NULL;
+	}
+
+	if (dev && dev->ff && dev->ff->private == haptic)
+		dev->ff->private = NULL;
+
+	if (haptic->hdev) {
+		put_device(&haptic->hdev->dev);
+		haptic->hdev = NULL;
+	}
 
 	kfree(haptic->stop_effect.report_buf);
 	haptic->stop_effect.report_buf = NULL;
 
 	if (haptic->effect) {
-		for (r = 0; r < ff->max_effects; r++)
+		for (r = 0; r < FF_MAX_EFFECTS; r++)
 			kfree(haptic->effect[r].report_buf);
 		kfree(haptic->effect);
 	}
 	haptic->effect = NULL;
 
-	destroy_workqueue(haptic->wq);
-	haptic->wq = NULL;
-
 	kfree(haptic->duration_map);
 	haptic->duration_map = NULL;
 
 	kfree(haptic->hid_usage_map);
 	haptic->hid_usage_map = NULL;
 
+	if (dev) {
+		input_put_device(dev);
+		haptic->input_dev = NULL;
+	}
+
 	module_put(THIS_MODULE);
 }
 
@@ -419,6 +448,11 @@ int hid_haptic_init(struct hid_device *hdev,
 	};
 	const char *prefix = "hid-haptic";
 	char *name;
+	int (*saved_flush)(struct input_dev *, struct file *);
+	int (*saved_event)(struct input_dev *, unsigned int, unsigned int, int);
+
+	if (haptic->wq)
+		return 0;
 
 	haptic->hdev = hdev;
 	haptic->max_waveform_id = max(2u, haptic->max_waveform_id);
@@ -509,6 +543,8 @@ int hid_haptic_init(struct hid_device *hdev,
 		goto stop_buffer_free;
 	}
 
+	saved_flush = dev->flush;
+	saved_event = dev->event;
 	ret = input_ff_create(dev, FF_MAX_EFFECTS);
 	if (ret) {
 		dev_err(&hdev->dev, "Failed to create ff device.\n");
@@ -525,6 +561,28 @@ int hid_haptic_init(struct hid_device *hdev,
 	ff->playback = hid_haptic_playback;
 	ff->erase = hid_haptic_erase;
 	ff->destroy = hid_haptic_destroy;
+
+	/*
+	 * Pin the input device so it cannot be released concurrently
+	 * with our devres cleanup, and take a second module reference
+	 * so the module stays loaded while hid_haptic_devm_release()
+	 * executes (the first ref is dropped by hid_haptic_destroy()
+	 * which may run inside input_put_device() below).
+	 */
+	input_get_device(dev);
+	__module_get(THIS_MODULE);
+
+	ret = devm_add_action(&hdev->dev, hid_haptic_devm_release, haptic);
+	if (ret) {
+		module_put(THIS_MODULE);
+		input_ff_destroy(dev);
+		dev->flush = saved_flush;
+		dev->event = saved_event;
+		input_put_device(dev);
+		put_device(&hdev->dev);
+		goto stop_buffer_free;
+	}
+
 	return 0;
 
 stop_buffer_free:
-- 
2.53.0

