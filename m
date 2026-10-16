Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAF84D7961
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158944; cv=none; b=b95jHjsBnZ5UwPj3SIEyUy5hP8f/SBJUm4CBXTA+pHvI35yCccepblxfeXhnS1XFWT32Nd7NP54pm3AiNIGfNIr8jgWoDKbzz9XOYYa/u64xOwpLbINq+5BM3Z6vLI56meMWpHAB7ki1kDeEMAMsvcF9J2bepDMlUnEWBcCSd/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158944; c=relaxed/simple;
	bh=cowh3gleZDE4BVxBMT7ox7e0NYNnj2b0uPUFs482AJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ccjKHUDDRQYk+JbgHSZujgQE5ctiLDHj47H81+XOYbNPduKmkjyvcAzD1cBwP5SDtedc0DlQBlJKAh2anws6kxx52jtdhciX0Hjx9BuSlbciuNCbEeuptPKRM18flAfg17ltitxOF+s7xswZUJeiSgKAClSHPO+/kWI2odjlmmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQjzfxhS; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQjzfxhS"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c31a34de844so504976766b.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792158941; x=1792763741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7SL3YGEB6rvvLMex3n4IHJKVGlbUEPnFaqehJg5hDg=;
        b=OQjzfxhSX+L3tP2AlplOjeNYs3PfhbVZK3FiNG+/5ID8JriJJjFRn/WEx2GQyRDXJe
         AM7g7o8OAmftOEvgKPzmmyFTvewwRnF8/khtVYHM43sIb141PgmMYKBnTdpa38gwXjwc
         kyV/98jHCFfW/HwLwLUbc3GSH3vhwzO3MmAFG8TFr1GZ/CmR+Jgh4I1hswaz6ukw8rrS
         T8b/ZY6mQw1/JjT38N7DX6c5kbYDak7OrqJcaQtl1Tu5nJZx4j1nS5Gj7fbixyrqhX5M
         NG2YuXzH6hZOs18OXvGjA0iIp8dhMgf1yE8naJH92Vw82YpbiSzfgh75fkPu5e7kJw/Y
         p3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158941; x=1792763741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r7SL3YGEB6rvvLMex3n4IHJKVGlbUEPnFaqehJg5hDg=;
        b=KMJU1WRTyhrcbJaz+/FEmYWISAV1VsYGq0thwz1Yejo3Y6FcINKPS7G09qeWmVeur7
         1/p+pyG/+oVbqmnevbAhDZIFiCkxQ5W2u3NcYIX8AHJ6rDzVqm1jnh6o3jwjL6sGIWLL
         1PHWnva1xGrZ/Zf4r/qgWG879q3nBd23/EWwDMsoJU+buqF6eyNtHPrf/jCX9/SYDqil
         kQbZtonV/kiARDZZOImh5n2sDU0D9w3rluMTHp3VPWNdwqrlhw8ZUGYtXbJPQMneMKSh
         kEGXw0dQt8Gx4yX4V7Cy/ZKOAjrgDQiAixJzqn4dYq1tESv5SH1+5kg3C8kzxnNqfQHK
         6DbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvXIZYCB453edmfYA67a7qX7W2Hk25XHP6vFvOsgsihYuSZS1Gap4tT2gDNchdVEk7IGsD61tf27eGIy4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbh4aGj2/1LyKVFzkb7NWcVC9VfroRXP/SYP9BrDPFjtIJSbW5
	XUNeP6GfWsmWt9FOwQ4tHJldXcde5RP/n9yE1YaYyCy6Zy2DKJYm9k0h
X-Gm-Gg: AYBFou0BqJfbPjUsQ5Zdn+X6Ls677awzoGeS5c66b5IPplYZjg1zT6RY4jmCtghuN5e
	w3gnHYOrEkOq5kV+LqEUpsgoD/VJpK2xRcXPHNUkoLPbpYf5UUDUJIuspuYiFzWe0wGLHW7Ocsr
	AochFFsX1w3B19Gjw2c7asYlp4ijnxA+tD1vkbqVDIaIf1mKP9yDIEnZcTkiugiOrhcfamCLm3N
	tCWFjOt5t/Huxf+nOixYHlzpkM9x2ncdaCJ36BwGsu5dOzpkhdCy46PtZE5HbQ52fJCCLl+6QDG
	U0/H/c2HKI9GQ2TFvJDstLhTb40Luv+e2UBZxII115dgO1W+8Y8R3At5qahUrue+o6XLJlbBq2/
	w6I9rFz9utmpahcx2XXmzaoM41RMbtseEc3tSYQaOyrQvrf7A6KkQ3EoUWfeABvAW2PUV9u2NAr
	j0Fpe7uJ2IwsVI2yFDzHIpOLInesenBM5EMlAGNNfLgL+l5MY4/jQgeNeGexEtdZfXHYoBj20Lo
	Ns=
X-Received: by 2002:a17:907:d10:b0:c2e:49b4:ab8b with SMTP id a640c23a62f3a-c31a9fcead1mr2117443266b.8.1792158940925;
        Fri, 16 Oct 2026 06:55:40 -0700 (PDT)
Received: from beelink ([187.15.113.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e328775sm75262366b.7.2026.10.16.06.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:55:40 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v5 1/2] HID: haptic: reorder try_module_get/get_device before input_ff_create
Date: Fri, 16 Oct 2026 10:55:15 -0300
Message-ID: <20261016135516.2957381-2-qwe.aldo@gmail.com>
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

Move try_module_get() and get_device() before input_ff_create() in
hid_haptic_init().  The original order placed them after
input_ff_create(), and failures went to input_free which called
input_ff_destroy() without ever setting ret.  The caller saw ret == 0
on failure and kept a dangling pointer to the haptic struct.

With the references acquired first, all failure paths reach
stop_buffer_free directly.  The flush/event save/restore is no longer
needed.

Fixes: 8d0bf7908b5a ("HID: multitouch: add haptic multitouch support")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 drivers/hid/hid-haptic.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index 8760eeb..592b44e 100644
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
@@ -501,11 +499,23 @@ int hid_haptic_init(struct hid_device *hdev,
 
 	input_set_capability(dev, EV_FF, FF_HAPTIC);
 
-	flush = dev->flush;
-	event = dev->event;
+	if (!try_module_get(THIS_MODULE)) {
+		dev_err(&hdev->dev, "Failed to increase module count.\n");
+		ret = -ENODEV;
+		goto stop_buffer_free;
+	}
+	if (!get_device(&hdev->dev)) {
+		dev_err(&hdev->dev, "Failed to get hdev device.\n");
+		ret = -ENODEV;
+		module_put(THIS_MODULE);
+		goto stop_buffer_free;
+	}
+
 	ret = input_ff_create(dev, FF_MAX_EFFECTS);
 	if (ret) {
 		dev_err(&hdev->dev, "Failed to create ff device.\n");
+		put_device(&hdev->dev);
+		module_put(THIS_MODULE);
 		goto stop_buffer_free;
 	}
 
@@ -515,23 +525,8 @@ int hid_haptic_init(struct hid_device *hdev,
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
 stop_buffer_free:
 	kfree(haptic->stop_effect.report_buf);
 	haptic->stop_effect.report_buf = NULL;
-- 
2.53.0

