Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785549;
	b=W6CWWPKSip0msPY4uFNau/rSJv7Vw0M1Ra4svBFbpzGlcSTbEPgZ/PWM6KeFk8jN0gV9
	 r3EfILgCGtSR3g6uNpRUZFqqKuOrtBIaKK6GgvJ9xZS9EhAjH70V/DCdYmu5Z2eFyM4DU
	 uO4y7jtWZrDqkox3EwsS2h/iq134QsaCQNehYYBFAF5WzE04cgns5nIrk+HqQt2zeoFE2
	 vgAjV+CK23TS0nlVQZwMq47+WecyLAsligS7Pe5l630jaaIGtxt8JLzNTNbvH39RiC8kw
	 cLnr0lzuF0Svm2HnolAAT9Gy2+xR36ndx/DMbASkG5b3RFe2HBY94l/rOIWXodCsa0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JgDO3SFp1m6M1lz5CdRvRXPq4mg7jU8g8yshNtlwqpA=;
	b=J27g2HG2GuCosuP/IKslXnvTN2e1Wedw3ac90ST7Le8r6r/0BRx6pHIPR8+JJcABSJrE
	 P7pueQI1fw9zsDIS90H89pEdOw8vFMNoU4+1SmCXs9C2ymg/w4UwQqMMYY0gpLYhmh4sI
	 jQuoLIp8Vq7FkPQ++Kw4OVIlcrr3KFq+4tAZ0W79DQWgRU3stxr7IxTiLnRkCZxbjaMZs
	 yKWDhoNq1vXV7L0KUq9k8O49k5qxrYMXTuDSwtjDjYdMPfHIG2XRvVT2g+dJSkcXBk8iR
	 9F+p86JpptKpAMtZZGCUbgssE3zpIp3V0fxscloOpiz1uQROs+8vbdW7RS9mhRFhsdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e99B5ETi;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DD6606BEE5
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37DD6606BEE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e99B5ETi
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20b122af8so11003775e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792785546; x=1793390346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JgDO3SFp1m6M1lz5CdRvRXPq4mg7jU8g8yshNtlwqpA=;
        b=e99B5ETi4RBzE2GcWHPMXnk1i+Y/rXnacXMKRYTFPrTq1wjfb7kd7insXYo5/dJsey
         gtIsw+nWx6Oj3qXvDpEoFxMtSagGOMbOBnFrqYegfEquvHFGjNvZiyMeghOHB+TzGYl1
         WL5R17K12izNfs/nsUbAnF02sTdTbYmHcHSlTtBMusfGfiEFglfZ2Yp/U/t05do/HS9d
         HUcjb/oswYgOkagKFFZIAYubrUBtvJKX+fFpcta+eWmF49NUdE3DiY/06cao3BzcWGZa
         YGZ8dvAlnRCuP5xgGkYJtEMi2WQPJnHnEH/WRYWGWr0wzC1t9u+KiQXuzg2bKsaqS3yb
         RDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792785546; x=1793390346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JgDO3SFp1m6M1lz5CdRvRXPq4mg7jU8g8yshNtlwqpA=;
        b=KfwNJW2LMe74D5pf+Px8mB7+Mcv8fcEYpJ2nOeo848AnX+RcgCSkPe3Cd3v5AJvlrR
         Z88NeRSuN51qoSB0f6gajvsM7KHD4ChuuTimzYY/opmB+WsLG2XecfRObCjKetlWleoC
         Fr07IgsDWqytahTDlvzjPOSgvza9Wxz/1IUmjSVWzTT0W1BQhkcFNR/Ik9iyn4eHUQxt
         xt5Wm7f55zpsO7dMKmaxOq/j/YeDFOqT0ZfJwHvd3XxaP6EEVzf4rhlOAq13o3m2KC59
         Jv4f2wb+WMwa+alDVDOLbCYgnKEjxyo3IkhbGfsqFhJjP6qtnF4f1W98gstCT5208POF
         YDqw==
X-Forwarded-Encrypted: i=1; AKwUvBz2H5+LDzbuu2yiCh+49hnBoXiulLoY+o0QpnsM+tfgbj3sHLLGO7xOO/83RiniMkhfEQKjfW6rONWpkEQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjfF3x2oxSp4jFvX2ZqKPiiHW0zVzHswkf1rxXe2tGtj4zBg3w
	TQFy9I4NHM70TafG4OMc+yAuvzaJ1Zb6XSOBioR1fXhZY6nwRH7rYhA=
X-Gm-Gg: AYBFou2d42qRfwBRazuJGb5kQpVUt0v/MmeVg7HM+15ak1a1du9AMYJhDNi3DEUx66M
	VoZsUuDsUlgwJmC9/HlLcZZgMPxTPlgegyHaYszb1tsOh4uU+ea7RX0KlniGAzaRunPRG7GlKGf
	qrwlUCht/odZGZo69anvKFPhnETVmu6T1AgrmG9NtX0u36dUyMMgYzZWXthtxFGISW/uxoj5mEh
	28M9QJfY/7Ii4PkJQG74Wl682NZC3j1Brmsm994Zz9Hpr+7Pbzzg42RnAjSxjgxx64sJNNpTND3
	RtJfPIpBk+J54SKu9KS7LdBXTyk/0lJDmzfm+VebuCE+gS7vpKZbAx48feVdaz5BaX7pB490jsx
	icvlzJ+pBSWsn2abkUkHwI+/4aSZklTeGgT4Ii6Nw2Jf/PJqbmkoLUZSyDogh+CWtkKKF0aRMyT
	u1JRgawzZWhNWguS+nItijex118ENY9ilfzvrsDeuYmv8oLIXLEMqOPDlKvjFvrHmhzgUnxSVQf
	7WFhp6LpLKqkgyiKiiA1IuG
X-Received: by 2002:a05:600c:3f16:b0:4a2:526b:d417 with SMTP id 5b1f17b1804b1-4a2526bd79fmr22530685e9.7.1792785546492;
        Fri, 23 Oct 2026 12:59:06 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm5021145e9.15.2026.10.23.12.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:59:04 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Lin Ma <linma@zju.edu.cn>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] media: dvbdev: fix dangling minor pointer in dvb_register_device() error paths
Date: Fri, 23 Oct 2026 19:59:04 +0000
Message-ID: <20261023195904.3557984-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

dvb_register_device() stores the dvb_device in the global dvb_minors[]
array via dvb_device_get() and releases minor_rwsem before calling
dvb_register_media_device() and device_create(). If either of these
fails, the error paths call kfree() on dvbdev without clearing the
dvb_minors[minor] entry and without going through dvb_device_put().
This leaves a stale pointer in the array that dvb_device_open() can
dereference under minor_rwsem, and bypasses the reference count
established by dvb_device_get().

Fix both error paths by:

1. Clearing dvb_minors[minor] under minor_rwsem and calling
   dvb_device_put() to release the array reference.
2. Replacing the direct kfree() with dvb_device_put() to release
   the initial reference and allow the release callback to free
   the object when the count reaches zero.

This mirrors the cleanup sequence in dvb_unregister_device().

Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/media/dvb-core/dvbdev.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index d753d329502a6..c931c467d4c52 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -551,6 +551,10 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	if (ret) {
 		pr_err("%s: dvb_register_media_device failed to create the mediagraph\n",
 		       __func__);
+		down_write(&minor_rwsem);
+		dvb_minors[minor] = NULL;
+		dvb_device_put(dvbdev);
+		up_write(&minor_rwsem);
 		if (new_node) {
 			list_del(&new_node->list_head);
 			kfree(dvbdevfops);
@@ -558,7 +562,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 		}
 		dvb_media_device_free(dvbdev);
 		list_del(&dvbdev->list_head);
-		kfree(dvbdev);
+		dvb_device_put(dvbdev);
 		*pdvbdev = NULL;
 		mutex_unlock(&dvbdev_register_lock);
 		return ret;
@@ -570,6 +574,10 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	if (IS_ERR(clsdev)) {
 		pr_err("%s: failed to create device dvb%d.%s%d (%pe)\n",
 		       __func__, adap->num, dnames[type], id, clsdev);
+		down_write(&minor_rwsem);
+		dvb_minors[minor] = NULL;
+		dvb_device_put(dvbdev);
+		up_write(&minor_rwsem);
 		if (new_node) {
 			list_del(&new_node->list_head);
 			kfree(dvbdevfops);
@@ -577,7 +585,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 		}
 		dvb_media_device_free(dvbdev);
 		list_del(&dvbdev->list_head);
-		kfree(dvbdev);
+		dvb_device_put(dvbdev);
 		*pdvbdev = NULL;
 		mutex_unlock(&dvbdev_register_lock);
 		return PTR_ERR(clsdev);
-- 
2.47.3

