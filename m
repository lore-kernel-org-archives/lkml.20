Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0035F598C0B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171917; cv=none; b=cjjnu+a6WjfwDbw++UUkFWEIAcno9628mxfcwtHIBDKNa+kAquHe2g4mGvkhZ84RppICxewWlEj+LJCky0AzSuJ8m+HKTvuo6KQn2TUN52dGzrLYAoK3rNHVt2T1E5icvsCm3/oVZCAYL62HeA+jZTh+TRMDUweYpzYELxZ5HOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171917; c=relaxed/simple;
	bh=RsVlH+APnIxb/YW5DKjHZSFF1ttkYz7gihzSpOO4FPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g9eYD3dsIPZ/Gn8BvQyRRBYHeMTZ2WLlVZKZwj5QddzA5rnesw1/V7Afu91tPfsFD11XdJ39+6Pg0QI+3DEEjYtzPAPjXh4ua7jh1/3wo94nad2HCwJCrrudnb04KgYh5Oc3s+SEnbDJn5HoQ0PbFJFgm1jrez92RgeY4kIR0FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhyLQ4wR; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhyLQ4wR"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-9179bfa9e9cso3590566d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171915; x=1792776715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hf4LaRDBNm1FH/XNRRtnuj8oud85TuTPQVIbPrpZ7E=;
        b=WhyLQ4wRM4w2la5ZBjkKAOlotFxvoiORYwU0tWkiodaKXwnQ8pDLEG/lut12W6L+m2
         ciWjb/LYnGTIQ7BCTJZTD15n6IxsuUEZEDJ0lOaC3Ur71qSOtJnYnkjB+GAOOrsoz3Bs
         fQSRVGtyKr7LhP8f3SmdT4UDqcsLmi9JJjLZ8HTXRXBTv4W8hrUW9ZepQcC241XmCKmT
         BOfPC1hlJFEBu3ngA9PdXehkjkWT/QaE0P7K7AAohg+AAvT/idRiZ7SeZjIkE+Hij5F/
         94SWUsQpDjt+wiXepnLAADSFlexPAx6z/g1TXVRQHGUqH7kw2gz+IDpjZSfIVZzh2Swz
         AD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171915; x=1792776715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8hf4LaRDBNm1FH/XNRRtnuj8oud85TuTPQVIbPrpZ7E=;
        b=TemkBCNRWGMxneO5+kbIxp2vz9RW+l2ZrQsgmN4965IOTAb9PKAxMA+I/m7U7oteos
         FqJem6Q3nj+Hz5zPbH/JEsYC+T1vjokgiKUr4gVAz4b1vZluxfXXoJWISfg5Y2YcW7Us
         S9mf25flFbDYefM5DpAa8dSsJITvVLYbmRFXZaMp/nReTUk/mHOiVWWTB897Y41Rij7j
         B8uGwOxPgUwSrzMajH7/65Dy+BObER+/twiQpKsg9MV1s8ufggi/HFfqy/m20rniCuIj
         JtW4D5rlV9XgeXVCc6jV1VX6H/DBDatcj9y57mZeGixN4gtVpE+Swvn9moqXVrOIwJv2
         1wwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlWLtyW3v3IOdjeLaBxpz4RXS6pr+r40HY+E15c2KnZUY+l76T1PH83XKBLvCdqxVFJFR2QxT1NGB5mSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSxQ+aifeV1fiCidqtpB9deTO7orfbB0XdD/IgeryKFIg9MFz/
	XYNuq0GlAeGpGhj9IPuiaPf8rKVEGcg2Ll3XQUkqFkjhFpAmN4l+AcoLr2v5vxlamjc=
X-Gm-Gg: AYBFou3XPTqujdg2IDMAEdjd1QxJSRR9oDVgIIvdOy/hAlN56valPyH6ua/6hap9SEJ
	AAmXGliSes/F71tImusN8JiizbqBYjB8Vg+xD/QA8tB+hod54liARsiAhpHQ/w8TmU4GME8SXIE
	vOYV9VTRRlOTP6UfU7l43ZI85dm2YU23oG/IMNodEvvw1v71eqyfydg3qSCpQIg5QB3u09gi+D6
	awa0v0B/FMESeKUBmQbpr1bCZhcSFuWAOAh17jD3NmJUaQEeEEMaL2BiLqmJpRZ1OTOL9GhayFc
	zYZMrFhEp6y8xwldRmF7s3xxF+wZ84Jd20aRT7YdV3mSiCZcm31XaKFc3nT6b9ZFDL8kV8Tr3sa
	VAmgeHRPvj0XYn81lzmFsUdVYJp9eAayjODwxxrLZwu6Xj2Xng+ax3F+BZ6gFPLcVDnYPI7DAQx
	gqp6lU0kIAEfjBBcr2iC7SXC7rjWye9vToYvA7XanVMJ4Wggzm71m44adve94cfis=
X-Received: by 2002:a05:620a:3955:b0:937:d6e8:59b0 with SMTP id af79cd13be357-93f29ba0b06mr100125185a.10.1792171914802;
        Fri, 16 Oct 2026 10:31:54 -0700 (PDT)
Received: from beelink ([187.15.139.183])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a18510fsm262760085a.22.2026.10.16.10.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:31:54 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v8 1/2] HID: haptic: reorder try_module_get/get_device before input_ff_create
Date: Fri, 16 Oct 2026 14:30:55 -0300
Message-ID: <20261016173056.3397211-2-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016173056.3397211-1-qwe.aldo@gmail.com>
References: <20261016163349.3293666-1-qwe.aldo@gmail.com>
 <20261016173056.3397211-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move try_module_get() and get_device() before input_ff_create() in
hid_haptic_init().  The original order placed them after
input_ff_create(), and failures went to input_free which called
input_ff_destroy() without ever setting ret.  The caller saw ret == 0
on failure and kept a dangling pointer to the haptic struct.

With the references acquired first, all failure paths reach
stop_buffer_free directly.  The flush/event save/restore is no longer
needed.

Clear the EV_FF and FF_HAPTIC capability bits on failure so a masked
error from the caller does not leave the input device advertising FF
support without a dev->ff -- EVIOCGEFFECTS would NULL-deref otherwise.

Fixes: 8d0bf7908b5a ("HID: multitouch: add haptic multitouch support")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 drivers/hid/hid-haptic.c | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index 8760eeb..b8aa4bf 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -419,8 +419,6 @@ int hid_haptic_init(struct hid_device *hdev,
 	};
 	const char *prefix = "hid-haptic";
 	char *name;
-	int (*flush)(struct input_dev *dev, struct file *file);
-	int (*event)(struct input_dev *dev, unsigned int type, unsigned int code, int value);
 
 	haptic->hdev = hdev;
 	haptic->max_waveform_id = max(2u, haptic->max_waveform_id);
@@ -501,12 +499,24 @@ int hid_haptic_init(struct hid_device *hdev,
 
 	input_set_capability(dev, EV_FF, FF_HAPTIC);
 
-	flush = dev->flush;
-	event = dev->event;
+	if (!try_module_get(THIS_MODULE)) {
+		dev_err(&hdev->dev, "Failed to increase module count.\n");
+		ret = -ENODEV;
+		goto ff_cap_clear;
+	}
+	if (!get_device(&hdev->dev)) {
+		dev_err(&hdev->dev, "Failed to get hdev device.\n");
+		ret = -ENODEV;
+		module_put(THIS_MODULE);
+		goto ff_cap_clear;
+	}
+
 	ret = input_ff_create(dev, FF_MAX_EFFECTS);
 	if (ret) {
 		dev_err(&hdev->dev, "Failed to create ff device.\n");
-		goto stop_buffer_free;
+		put_device(&hdev->dev);
+		module_put(THIS_MODULE);
+		goto ff_cap_clear;
 	}
 
 	ff = dev->ff;
@@ -515,23 +525,11 @@ int hid_haptic_init(struct hid_device *hdev,
 	ff->playback = hid_haptic_playback;
 	ff->erase = hid_haptic_erase;
 	ff->destroy = hid_haptic_destroy;
-	if (!try_module_get(THIS_MODULE)) {
-		dev_err(&hdev->dev, "Failed to increase module count.\n");
-		goto input_free;
-	}
-	if (!get_device(&hdev->dev)) {
-		dev_err(&hdev->dev, "Failed to get hdev device.\n");
-		module_put(THIS_MODULE);
-		goto input_free;
-	}
 	return 0;
 
-input_free:
-	input_ff_destroy(dev);
-	/* Restore dev flush and event */
-	dev->flush = flush;
-	dev->event = event;
-	return ret;
+ff_cap_clear:
+	__clear_bit(FF_HAPTIC, dev->ffbit);
+	__clear_bit(EV_FF, dev->evbit);
 stop_buffer_free:
 	kfree(haptic->stop_effect.report_buf);
 	haptic->stop_effect.report_buf = NULL;
-- 
2.53.0

