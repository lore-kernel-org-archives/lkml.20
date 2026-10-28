Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793179308;
	b=grDbSpMTWUqLrFmCiAgmXh1hdUJjk9KpiwhWmll0/hiegZVG/+3xevTt8VNOJ/4aOV14
	 B9Oh8fd7Ikc4CU+rvDd0sc0Ih4nH/FTHKBv9v1OBzAAFkIwK5FosajOlE4DOxGgH+rQ2T
	 aXygzyTV+c+zal9HBhd93yhN8Z/BQCfdNJ4lyd9wT0HnBTExD1gTW/IlRRYp7T/s+63yw
	 8I4DP5sMBmeDs2jEO101HNyhLqdSxA3dsabQ04fRj2jcv4hJMPLlpBMWDAicaXULiuv73
	 BKmHnEJyu8COZfl1SgKMncA9sYYIzgg3TmvPqT4B9/7I7KFQb1tDw+zl3hn5pLw0I/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0pQyQ0CR8Ho1izzTFJRZdAq2GCxbm4EhPXXwabrY3Jw=;
	b=BB9PvRDFZaDqHjgpmonGlqPs7zAGgkbjoljUYqyUDsr9f0NQwMJy0r23xjYMQ+oKqzwI
	 8p9YRNJyS/Mu7hLz+GXB4l3fKdWWDQvHb4WDAzO+KkBL9AMtkAPTB6nDTmJKw+h6mNnRV
	 SCV5zILIUrweXP+Pi9keWHNTSfurF6TmtCDQmVWTBvUvtJtVwglp6nuC0ngfvsFKcZpFw
	 J+UKs7qLAQ6uA7hsw2xbohGAX+9ITQN6CvLeEuvGCnXbAo7a6w8kNKC8L8DJNLEs8u9cd
	 gd20rv2fguUPWtv7IbM1n+JJJ4m9007Fp6vq3SVIL9ObshbLNTUUZ0etEhThpSVm5+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z0WytBc1;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8A8606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D8A8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z0WytBc1
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso330989a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793179307; x=1793784107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0pQyQ0CR8Ho1izzTFJRZdAq2GCxbm4EhPXXwabrY3Jw=;
        b=Z0WytBc1AflicF4aFIJ20pXVYFFCEFIZk4P5rWrhd1kFjroffpXHmb/lQXia8oyxPJ
         28AaH0r9V7PRm5sGwihh+ZMV1vfyFDPWU3q5WAo+PuXryEE0V4TUQ2ZunQn9ab1gNQGP
         NvKMzapD62OoZkc8AKzMJ5NUqD0JIrMwAIde6GgQhnpr9ef3PqinaLT5ZuQJlM6OX7y3
         nVQmSEIT/spK3PPonGNqYFNh47KrJIppVxiYFBupeQuXFIVja1Or+cGfrnjPKyEyjQyu
         4xPfqPV2oLid8E5NMVZbwGrjUywI2iIQlU2/MXRIa9U50d0sgnzQ/9IgcaBmjfHHKtIM
         6Ajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793179307; x=1793784107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0pQyQ0CR8Ho1izzTFJRZdAq2GCxbm4EhPXXwabrY3Jw=;
        b=jI3wJD6W6w5BHtFTqO+ibUbOzs+5AtKhGcfMBd/T2Qo97ZDls/whf/vgN2iW66xw1Z
         EHjfTY3m+UhBm4jCcd7LW0m1i5Yn23E2/ghwsLBnQx2vDDZSkB6zA571j6ek7Qpt+Iua
         smifsnWpmpXSVq5rWm+xLnWY1z9qowCxDtCwQKNsDqe5ZunIcW3oj93SvZaAVSOiDUNh
         IrXVWMnqcmVZZAdRSMsn8li7ZS2r3dn1vbOkfXQ6skgl53MvDh3JqHVquYwRY2zqJcq8
         TTYUcX1dgaRRxnvhaGV43GoXm+YodMnha/YSkajccfkSSEuJiq1FxQGPfw1FJc71VFb4
         f9XQ==
X-Gm-Message-State: AFq9FYJHmy/Q18nylWcKnbgwVLvhfIBP+S5qq5y8g7PotTNPeZler0Qy
	kubrU5dph/TwuHXoj6cWMp96glNtioQpuSkn6IY0KuTH8cdb/AVp9kLv
X-Gm-Gg: AYBFou2ymYhtyBEr/EH91nUyvRFRc5osjce2M7boMfOLyn7lHyKg+/Sa+tcA4Cff/XD
	RUroduXKeUM3ADC9LtfjVG9jXheqBDuN6uZncG41U6DU7o/elgN3YyBzVDDQGJNj7r4gRwQdF8a
	KBTHG0KBUzNtYBRAaJtYPt9TI9vobToCCTi2ibZKILwhaQ6gS3phqDEtAOhm4l0atKHmXhwGx3M
	7g+rDOx0mPTQo9CRjFUlJFRv73FYeRC7Et7QMl0Hm6PaZm9dD4MgREPLavc++xeoeCnBNL0niTX
	CbhGiPN5y1sBsDY31IcimYKL3b0igrIJqhIGMQqYculFYEjnSRhe8db6lNJ5pfXPRT4t3PjhHje
	gJxOLx7EqOflteC4JQMwGVSwTgZh7bpff1MWyIEVMj9ssC3ispmVuUdvfLQ0TZ7ndBIHX6ma+Lb
	IkWL86aWQpdbdRPYjgWP4Yx0cmsLRKdIPeuD8PaCkocWJc6jC9v+J7xxQYVuTo9yT5m4qNr66J7
	kvTBotasqgTY430Y5kmQ2KXZtd6/W3GoN6KviJEjELSdVpjIS2LOdK3ecSeC4xCk1TPThBGfPy6
	IkD/TgQTpNAT+2GB/pLvPsFJ+pt3co4LnSE7nq4TVC168KxxAH4QKPNYFMiOTsyneYnyJTLrEVW
	M3xgV4jDVJeY=
X-Received: by 2002:a17:90b:5863:b0:3ac:b3ff:b476 with SMTP id 98e67ed59e1d1-3ae581836a6mr1316337a91.38.1793179307335;
        Wed, 28 Oct 2026 02:21:47 -0700 (PDT)
Received: from localhost.localdomain ([117.88.121.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a27d594sm2256088a91.1.2026.10.28.02.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:21:46 -0700 (PDT)
From: Jianping Liu <frankljpliu@gmail.com>
To: airlied@redhat.com,
	kraxel@redhat.com,
	maarten.lankhorst@linux.intel.com,
	jack@suse.cz,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	alevy@redhat.com,
	frankjpliu@tencent.com
Cc: linux-kernel@vger.kernel.org,
	stable@kernel.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/qxl: Fix oops caused by missing free_irq on device teardown
Date: Wed, 28 Oct 2026 17:21:37 +0800
Message-ID: <20261028092137.1372286-1-frankljpliu@gmail.com>
X-Mailer: git-send-email 2.43.7
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

From: Jianping Liu <frankjpliu@tencent.com>

After qxl.ko is unloaded, reading /proc/interrupts triggers an oops.
qxl_irq_init() requests the PCI IRQ with the DRM device as dev_id, but
qxl_device_fini() never frees it. The IRQ action therefore stays
registered, and its name still points into the unloaded module.

To fix the oops, free the IRQ in qxl_device_fini() with the same
dev_id passed to request_irq().

Cc: stable@kernel.org
Fixes: f64122c1f6ad ("drm: add new QXL driver. (v1.4)")
Signed-off-by: Jianping Liu <frankjpliu@tencent.com>
---
 drivers/gpu/drm/qxl/qxl_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index 461b7ab9ad5c..e6c3d5ebd7c4 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -284,6 +284,8 @@ int qxl_device_init(struct qxl_device *qdev,
 void qxl_device_fini(struct qxl_device *qdev)
 {
 	int cur_idx;
+	struct drm_device *ddev = &qdev->ddev;
+	struct pci_dev *pdev = to_pci_dev(ddev->dev);
 
 	/* check if qxl_device_init() was successful (gc_work is initialized last) */
 	if (!qdev->gc_work.func)
@@ -306,6 +308,7 @@ void qxl_device_fini(struct qxl_device *qdev)
 	wait_event_timeout(qdev->release_event,
 			   atomic_read(&qdev->release_count) == 0,
 			   HZ);
+	free_irq(pdev->irq, ddev);
 	flush_work(&qdev->gc_work);
 	qxl_surf_evict(qdev);
 	qxl_vram_evict(qdev);
-- 
2.43.7

