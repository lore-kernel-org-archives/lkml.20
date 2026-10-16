Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639CD4DA9A6
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158951; cv=none; b=SD0f5gUBE0oyARyn01mmD/AMeK6L2uE6q+ss+UxplJTP9DzysmJC9G59ihhJ+19Rbg0ccsTG5FGfy5lD1VsvpVo9IuaDdZo3IFhHVae7H0J5zptF3Wi6L5vcltgQ9bhITBfNn4k24jt25qCtWd3ajG9dJnez+l9XOERe+Lh1Nms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158951; c=relaxed/simple;
	bh=d5FVs0cU6YT9A5FAP0zN6t5JoMPck6gxpWuDMrf+JtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FWxMOPu8SRhi4sJNMMprUW2gIwJk/RgvulsXbH3LnPW8IEuvnSMhMF6TK7PeoLkIKgasp5FUyVj+aFVrJdD//257LzOP2tIDPeRY6aZusK5hJofcHFeorsurlfVnuNrme6LFeZzcQbf5VI0dARb+ymHz1fu+KSu8D/QIZARLqBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ND7Ya3oE; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ND7Ya3oE"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c418e215671so3958866b.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792158948; x=1792763748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J7fWtLho0S4gbcF+2uj+Telg0L6TRvj3s8UotmzSZL0=;
        b=ND7Ya3oEIC7B9sy4e5ISWyw0MWqUI8g9hfJqe2epANzUBY0JgVmlNzmgLdS0uTYla4
         JEykeg9t8YehHshOOPUVsF+VgeXBCqwmavF5WZAhkbrOkCKne621blfsmDKzkGUF71xr
         E2swO1sJwj2aU6FT/vH3s8KTspMkvRtGAgBQtwBTUgMQeUk21B7ugNlgaX+6xjZIWubN
         fqkyQHbEZI/PMoTTqPf56qmLYQEgd0l3A8/0sXdccP1niAeyAnRQD2D+C0KEiRhoXOZb
         BwmhizpsDcv12n0IujcIczDo/TENukpaS/L71hzewFhp3ShvbfsgFcZgYof1nKLPUwU6
         ebaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158948; x=1792763748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J7fWtLho0S4gbcF+2uj+Telg0L6TRvj3s8UotmzSZL0=;
        b=dTcWqN2zlpOa35wxYJPJuh41HE7UGtD+N+NG5qwnIXYeYOkiOqBoUphqLp7q/GjONd
         mdi69WQ/meAVMdelMArFCbxtUNcHu8+rs7ogBazrb4G3MbWyGRWxdb22+Q38ezhgXEOL
         ppXQA+J0ikZmim90FcRjvqdPzMT80WRGFwPag/oHVDokC+tvfjUh/+61uZAOTOrSDKkb
         tLfaCowilLAwQawC+jilXqBL2pbhoHKfvXiLYIOR1kz1gMlkZlCsP9tUIjRygIQQNHd/
         AJvTJbHQXL7OGH+dlDG2kW+b4VN9eJh1Ns9p+Fuyhgjy0WV5isY2GQpvak/ESPx+7kgY
         8BwA==
X-Forwarded-Encrypted: i=1; AKwUvBy0KCNqdxU/gg2CsUtzLuKdVKiPTqIzoezeeJvopPDwUsrzDIidrBGnJBkCjCafuxB5zfpteHCxpSYxC08=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwHfJ+QKJV/XcKKVNlcyOhP1LMqHTtT0Ej3KifPO2Je4FVaw0m
	yIxhnCY4YlUee8aVgdUDBI8soz7x/KXpWapeumtJZrvinxC/nLkhUVwS
X-Gm-Gg: AYBFou3Taor0H6Bzh+SX4GdXOAdbVOSLAJY/pbIesTrtrA64+pIKrfmaUBEs73l4D06
	seIVDx6j4M14DnFA3BmQ5tXEI5IzioCp85fc/g2JykCauULAz6E9FpnWnIGTW+KANF/k/RmSeLC
	cP8z48Q+f+BKr/4DXnG+CXrOD1HITqUi1UnODK3H3O8PwSc9i1cjMEix/AAYVxWBs2mM0Yn2tSC
	nqRXSC+6Cs12OptWtCtDxH7lBc1pe9gLi8RFLtuUAImoGzWIeQ1/+xmieydpqge2Lk2g7E4dTTt
	OurYP/o4HYKG/roW8yisN2yHDHSMZs55t6EXJho0Jf6XM8Db/LFcSnliPf7aPeLBKCoQsUUMnxT
	AaVWRw9lhH0qljKt7WLHT0RCv8XXysLFSNEDQjqYdlDBJKVtgnZD6P/zf1dShnhYsmVeZAyuEy/
	AJ1x/YGMiBreiOAhhnrdOZCZ2ZjKDklGvq8aLYaTHn/p3DIgGILMkhgWM8FOlv3+TCfjtfiz+XT
	A==
X-Received: by 2002:a17:907:97cd:b0:c2e:317e:d711 with SMTP id a640c23a62f3a-c31aa03cd20mr2000032166b.27.1792158947336;
        Fri, 16 Oct 2026 06:55:47 -0700 (PDT)
Received: from beelink ([187.15.113.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e328775sm75262366b.7.2026.10.16.06.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:55:46 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v5 2/2] HID: multitouch: fix use-after-free of haptic data on delayed input release
Date: Fri, 16 Oct 2026 10:55:16 -0300
Message-ID: <20261016135516.2957381-3-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016135516.2957381-1-qwe.aldo@gmail.com>
References: <20261009103333.2476105-1-qwe.aldo@gmail.com>
 <20261016135516.2957381-1-qwe.aldo@gmail.com>
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
just ff->private = NULL, making the later kfree a no-op.  The input
device is pinned with input_get_device() to prevent concurrent release
during the devres action; the workqueue is drained first while all
buffers are still live.

Fixes: 8d0bf7908b5a ("HID: multitouch: add haptic multitouch support")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 drivers/hid/hid-haptic.c | 65 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 57 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index 592b44e..109b4df 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -379,32 +379,57 @@ static int hid_haptic_erase(struct input_dev *dev, int effect_id)
 
 static void hid_haptic_destroy(struct ff_device *ff)
 {
-	struct hid_haptic_device *haptic = ff->private;
-	struct hid_device *hdev = haptic->hdev;
+	/*
+	 * Resource cleanup is handled by hid_haptic_devm_release() which
+	 * runs at driver unbind.  This callback only disconnects the FF
+	 * subsystem's pointer so input_ff_destroy()'s kfree(ff->private)
+	 * becomes kfree(NULL), preventing a double-free of the
+	 * devres-managed haptic struct.
+	 */
+	ff->private = NULL;
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
+	if (haptic->hdev)
+		put_device(&haptic->hdev->dev);
 
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
 
+	if (dev)
+		input_put_device(dev);
+
 	module_put(THIS_MODULE);
 }
 
@@ -419,6 +444,9 @@ int hid_haptic_init(struct hid_device *hdev,
 	};
 	const char *prefix = "hid-haptic";
 	char *name;
+	int (*flush)(struct input_dev *dev, struct file *file);
+	int (*event)(struct input_dev *dev, unsigned int type,
+		     unsigned int code, int value);
 
 	haptic->hdev = hdev;
 	haptic->max_waveform_id = max(2u, haptic->max_waveform_id);
@@ -511,6 +539,8 @@ int hid_haptic_init(struct hid_device *hdev,
 		goto stop_buffer_free;
 	}
 
+	flush = dev->flush;
+	event = dev->event;
 	ret = input_ff_create(dev, FF_MAX_EFFECTS);
 	if (ret) {
 		dev_err(&hdev->dev, "Failed to create ff device.\n");
@@ -525,6 +555,25 @@ int hid_haptic_init(struct hid_device *hdev,
 	ff->playback = hid_haptic_playback;
 	ff->erase = hid_haptic_erase;
 	ff->destroy = hid_haptic_destroy;
+
+	/*
+	 * Pin the input device so it cannot be released concurrently
+	 * with our devres cleanup.  hid_haptic_devm_release() drops
+	 * this reference after cleanup is complete.
+	 */
+	input_get_device(dev);
+
+	ret = devm_add_action(&hdev->dev, hid_haptic_devm_release, haptic);
+	if (ret) {
+		input_ff_destroy(dev);
+		dev->flush = flush;
+		dev->event = event;
+		input_put_device(dev);
+		put_device(&hdev->dev);
+		module_put(THIS_MODULE);
+		goto stop_buffer_free;
+	}
+
 	return 0;
 
 stop_buffer_free:
-- 
2.53.0

