Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A3C44684F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789470554; cv=none; b=u8RTCT2tvHSJCmhNyMwlbUVeq5CsWS4z68k42+CeNz6QFZTmE2K5U8TnfXjIKuujXfEsrScW4NUi7If0kGM4Et73a5nAU4wNkvlcv04fNiK+rzplI2x2NhlEKURJ3cohwCXH6DOgWQJM0iVo6YrNHf8MvFwcP6jIqObjCWCSuN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789470554; c=relaxed/simple;
	bh=f7bXHlhXsnOZ/6ZvQ+o+waq2nBAiEKG6Kg1glvRzHJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g/UlyuRmY4pu9dlXe7AUS9J90ykkFTvGg/rn1UTt9qQ+S1AMcRJ9vz6f1Z+SQGrwsWG8E7+IMitWqfATy6mNXv0qPz6VLLxWtjz3n5KpcmdIZuIfabfN41L9GsVR2pjj406yb2eRKis4C2yaijcrAOJBl1LyaaPr/ikIi4CcViY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OrkxJ37w; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OrkxJ37w"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398a147688bso120439a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789470552; x=1790075352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lh7rYkhxlrvXjsZrQxcY6UVDt2QLiuI71BjvESmUG5o=;
        b=OrkxJ37wMz9fIg1tz/0DBTIANhZHPZLHXpyST2kvx9sdNMfTOOAfFhp8+3OH+XIkvM
         FBnY0oh9l43RNSs9c/UGqgNHZQeE4uYh74yd5E04JeI7J/pq7jEqPtzf2dNSFUCzTu5Z
         ITOaaRcEJD9q4WILe/m881OGOv3McvUCV9wJM8LK7ikd0Pvr0dihvi8HOMlBI+YHYrSO
         2qkLGK8EJNDyygBYwqje8G6I2qaV8+fg9ifQ2k92Yai6I4II1Wf7hmP97wukDDJV+Hrk
         0qhlS3967PbQikLtidKtpDHhwXrlGZD5dJO+CqjIjagH/8f31R3rVmq2dGL9Z61+OWNi
         H1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789470552; x=1790075352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lh7rYkhxlrvXjsZrQxcY6UVDt2QLiuI71BjvESmUG5o=;
        b=Jve6sIJBijiQ1IxTfSc4DOqpRVaOGG2BG3l4kL9F3BxxK5J+W9Osl/ZPZR9CgUEzt3
         YN5y9YFsk+F9wpxymUag95B9l+XmooWAHTlEAYV+i4agMNycq5XbMYZ3O8jkKgMMJw1D
         QEtwYpzWu/ZNKHLbPeQuDzgyAIwJnlZaZ/OygugmNkjjC1XDlD4mfJ3uA0o49uyWx6Ho
         wrKZfc6x1H3XN62rcpShW9iDzR/BOQl/0I53c9wi5uWAULvcJuIKJVmRbY8EPtP5vkF3
         8CQQhCynXAZUTFHlmpllnItjQUAlouNWisU8ysz0vfcYkUuIvG+MgQRl81qlUEkSLGqF
         /jqQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6XsnIqKHTphsgdA+6VlH8yoQ8P3D3gS23/aAKkFQhmpPZUvlqqUvRhepozdKqYWUqacH7j2N5AQP/Fac=@vger.kernel.org
X-Gm-Message-State: AFuF++nLD3ZLTC9NIKzzQhYGNU3cDg1+7wYbIizx7taCjxpOQ+xUBwnL
	7W6Q7MQwciIrCLg7kdU5bwVQaSA2IrC10FPznv8GhZFnawEKhNpestBK
X-Gm-Gg: AYBFou0iHC5oby9dYsb9iLU99pFIaRqtew5VsK78WYdzxoazLyDWrNzhWI89ha/1yK6
	VQYRkoe8QRwjE9e6w6cFGG0ugMplBY1X8SylkbuskjIVJgz5juEHmZYEucxSCrybVD8vagnk9JU
	QTqEk/NqJicsJmrbZcE3x2ksCO21asSm0dQSJpr8sh+mH/sDwo9cVozGVzW8VxktHs9c4ZM47u+
	XrdERJrJfwst2+iZ3Xu68PrZh8OrIea6DsO2X9nbb4BWwFPeYrAfSo/14oKPsWJOAApG19jfoBv
	lvmqTT0wIGxsa0VsUSbL5Sm4KqKepL/S9tlbvlXsRW/OYr3+vvKP7FL1FYXZJUbaV0skrKmbopF
	hAKyOOHj5+wUE5ve8SnENQoGI9KshoHnfEm+SeNgDdXE8/MEK9VOOQPjog+M+UTX17THxD1SiwB
	RbFKbPwor/MHNQHZem1P03RcY6uTdzEGTPIjjAR3LZ3XaV/tCoCb6QBQ==
X-Received: by 2002:a17:90b:4b05:b0:39d:f5b1:e365 with SMTP id 98e67ed59e1d1-39e110f66f8mr651424a91.25.1789470551569;
        Tue, 15 Sep 2026 04:09:11 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfda8bdf4sm4828687a91.12.2026.09.15.04.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:09:11 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: tw686x: fix V4L2 device lifetime on probe failure
Date: Tue, 15 Sep 2026 19:08:58 +0800
Message-ID: <20260915110858.2381610-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tw686x_video_init() registers the V4L2 device, which initializes its
reference count. Successfully registered video devices take additional
references to the V4L2 device as well.

The probe failure paths currently tear down the PCI resources and then
free the channel arrays and the tw686x device directly. This bypasses
the V4L2 device reference count and the tw686x_dev_release() callback.

If a video device still holds a reference, its eventual release will
drop a reference to the already freed V4L2 device. Even when no extra
references remain, directly freeing the device bypasses the lifetime
management established by v4l2_device_register().

After cleaning up the PCI resources, check whether the V4L2 device was
registered. If so, mark the hardware unavailable and drop the driver's
V4L2 device reference, letting tw686x_dev_release() free the backing
objects when the final reference is released. Keep the existing direct
free path for failures that occur before V4L2 device registration.

This issue was found by manual code inspection.

Fixes: 704a84ccdbf1 ("[media] media: Support Intersil/Techwell TW686x-based video capture cards")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/pci/tw686x/tw686x-core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/pci/tw686x/tw686x-core.c b/drivers/media/pci/tw686x/tw686x-core.c
index 5a4ab329c06e..1e3079bb8bb4 100644
--- a/drivers/media/pci/tw686x/tw686x-core.c
+++ b/drivers/media/pci/tw686x/tw686x-core.c
@@ -241,6 +241,7 @@ static int tw686x_probe(struct pci_dev *pci_dev,
 			const struct pci_device_id *pci_id)
 {
 	struct tw686x_dev *dev;
+	unsigned long flags;
 	int err;
 
 	dev = kzalloc_obj(*dev);
@@ -352,6 +353,15 @@ static int tw686x_probe(struct pci_dev *pci_dev,
 	pci_release_regions(pci_dev);
 disable_pci:
 	pci_disable_device(pci_dev);
+	if (dev->v4l2_dev.dev) {
+		spin_lock_irqsave(&dev->lock, flags);
+		dev->pci_dev = NULL;
+		spin_unlock_irqrestore(&dev->lock, flags);
+
+		v4l2_device_put(&dev->v4l2_dev);
+		return err;
+	}
+
 free_audio:
 	kfree(dev->audio_channels);
 free_video:
-- 
2.43.0

