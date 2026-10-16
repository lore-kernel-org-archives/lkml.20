Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0ED4D7D51
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163640; cv=none; b=WbK5xLVBrVIIc+buZNvAjoYwFCEZw1twCboJ05iJiWWylDnHc1oEqf7E99By3gRvU1e1Z0BGO2Cg4HcAHhnOyIpXdPMsAmG7Lmy4skSwoKD3miSFcJ8mpWfXZjjqOnlV033Vy7A3XlGAFZD3HFqVMuhOW1Q0rbxTECrrnYvjrKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163640; c=relaxed/simple;
	bh=cowh3gleZDE4BVxBMT7ox7e0NYNnj2b0uPUFs482AJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=loDkP9+QjROHTQaCTiwwlr8wHa2Sa6Nx234TqJhcMfVvkX+KJhPyI2RvW2W9bQ85OnliQIaHFkvmZduS82zVM7saXGQ1ZmnHdX3OpiyKuSXOHVxWFVubZkB5TDeSDCY98YKhNWhGB6JF2R2ULIcv3l0zxtN3aKSw9R3CeCI3sag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnxtUK+R; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnxtUK+R"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-533952f3714so67063041cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792163638; x=1792768438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7SL3YGEB6rvvLMex3n4IHJKVGlbUEPnFaqehJg5hDg=;
        b=dnxtUK+RFgOEn0EtRpfAJ/KYs15B0WWwTPwjdDoSDgrPXDXY4wsmQTnXBOeL9h3ThT
         j5J7TGrIcQRLXEVjGhmFevLRl+Pjnt93JE+E3O03Lns8wwYBpk+8Ii+5BicGQtraDFx0
         fEGCi/BXFXdFXi8wHTV6c4QTimEoT4sBP9x1XI+ZyLL1k1nAs1DrmyiBVxoEn+Mj0BKh
         J2rI2IQF2W8BVliLa0cZ5gsugGCKUvi1nk1UwlivrCfX1txE8FyEO7LNFHV3EKVwqQY9
         ziikjZcV4GvGxb4Ns7nJe8yxRUv/ApX9b6tWIhBDDrqs8JQdWb3g/eAhuDFo51MCwkpf
         eQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163638; x=1792768438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r7SL3YGEB6rvvLMex3n4IHJKVGlbUEPnFaqehJg5hDg=;
        b=ghK4flzuY3tPtUoEkr0sbiEa2zdnfufHgr5wcxh+wPQdIs6MBiPCPlebCMur36LPSX
         shd6sUHESZQkhmsRPTEijJYRuo7csmMF6uMQmS/Mi9+peB/LhTlJAwTw70ZivjF0iA1f
         pQaiGT0orAgtEs7LRqt3aeTIF3PYsMetXQBdCV/GIQ1K55sTKuISX60GjXHCE9vEhxxd
         12c0W6WI2BjW1MDDE2061J0udGBV/fxiSpwh18cH5gpjBu//mT5eNKxB5JRxpR3iDlkP
         AiGdIPfPS5SODtCjNaKwXa6BAbHk0lp+ABNxSi6nMi3TdJP1vsEPOW2wFNH/POMo2nHk
         abzg==
X-Forwarded-Encrypted: i=1; AKwUvBzY7EpY6rApT59C+A+tXy2WS2NyR8/Yt1cFdCuleg5yWF7ls0tPXJrEdRLaquhugKyyGuhZmHRu5Drjc3A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJajZ/BAISRho8enMJvDhGZYkSdhYu1LyKXQppyAj/VWjgK7Nqj
	rc4c7C1q9m/63bDiENIFjv754LAQ6w7HzXWvXOX24cE85i/ueeIWVG+/jvcUVG59
X-Gm-Gg: AYBFou3rGjz1uVlmxAp+scjCaU1qD5A8syrMzazBfyR+2O16cKpxs4BxSaIq/OtxDGr
	dMV+UZ9sf1BoslgHR+T4kkw2J0tFpoOkBEAFB2Q78qErkmLquygtp7ToDmQWMceWJpeRqUDkM6g
	3fAg7W0nl7tn1zFOkzOFx2vPQ1ZmGHw/D9joYOQzwupnertYxlP2h31rOYxMjrnNTJjAnCGBpTV
	nqATYRRVlGHHQ5Bhou9XEfpurdXyvS8K5nhb0Q59iz3bacp0XDB0GND5tNLcLS2GKOgPs8spyq1
	HeD4CGHIXBmwXuYP7kuZ6fs4dpn3JUYriGIo9QCdNaV7T8p7lH5paH5Ut8V+lUQ9GS2cwWu3zqc
	vqqPnacQIUtNa+h+Kmu6TsCcc2NX8TWYGkI0VKqo36FYMA7XxdRzYkJomFvt88H8o6lG7/7g/pA
	NO+kQ35AVIUcpAFDVhsv4hlQcTbSXPyqOmI19zip7D44t6IcSE95gEaV6ZL1V7d74=
X-Received: by 2002:a05:622a:831c:b0:535:cd9e:c095 with SMTP id d75a77b69052e-535cd9fe5f5mr210979141cf.45.1792163637740;
        Fri, 16 Oct 2026 08:13:57 -0700 (PDT)
Received: from beelink ([187.15.139.183])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362aa59b03sm24674041cf.27.2026.10.16.08.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:13:57 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v6 1/2] HID: haptic: reorder try_module_get/get_device before input_ff_create
Date: Fri, 16 Oct 2026 12:13:41 -0300
Message-ID: <20261016151343.3120300-2-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016151343.3120300-1-qwe.aldo@gmail.com>
References: <20261016135516.2957381-1-qwe.aldo@gmail.com>
 <20261016151343.3120300-1-qwe.aldo@gmail.com>
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

