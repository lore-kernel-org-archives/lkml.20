Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C31F3B47CA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762443; cv=none; b=FDLMghSRISp4zOrsnZZXLXnBChLfXcncnr76hStWbRarSyVZIjpszzmVpLCMWPZobuvYVzYefEaGhgLmug98JnE20DVcFlg1lawU//BEcXZHzzVJpl5kXkAPoTU7rR1XTF9L55aWDCLmFKVGJ7r3qp64bkciSzKJ68KgKaOxe6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762443; c=relaxed/simple;
	bh=pm+UitRBOGfKG54X+0W3itQFEz1WkU9YjmSk9yn03+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=upcR1L9oN9eIWOjruP5MmmQJ/5qj/EyY/pbWhCon2JEvyUDdO1HJiItOMcqxbXxiUWyf6LgqklLxBj7kcbpWJcctyvVsN8ELgqhBDs49Ca3CKHaJ+U85MuWGwzznsduPMRQfxe8DmvL+Jf1VjxNZR8Cyf8RMACJob0ya0Js/ZoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfKFpiIS; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfKFpiIS"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e17e5de00so113285666b.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790762439; x=1791367239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QgnMCUr5ATcF80ey7meAMPkqM75woYMa14Sfi0A0LQE=;
        b=OfKFpiISZR+C2wDF6Cc0ZG6KzmpJiw49ZtgL+YywGEg+2J6SND9BXE5srsPLvYUfyh
         jd8gvbV/b0IOnTsfDzd4epB7qaNJSlT/CVVtFphXWKvqQ0fAxotRdkTlmmKqPNbAMeXR
         2GtqVSRS6CD3DiDDsu5gGl0etwS14P4Ld6yFGqcLk//hHZB00PCp3gKF2+/ogZ5QzeHQ
         B/hVcW7qhUmn6ZfCx8H+4Sg8UWC0zpvSB9fi9wvPEV8CDwLbAa5JrbicWj0PAjfNibqg
         re5bhKKOGfwIKLr9c72FtZIn7jMsIwQE2aQCCQAWGtwTai3MVgXDgO0la0Pifc01jVWy
         8KOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790762439; x=1791367239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgnMCUr5ATcF80ey7meAMPkqM75woYMa14Sfi0A0LQE=;
        b=A0/XgPPqeqgaqtuEQgetx7/wHpjzpgkieOsC0ajoS0/5QH/Iu1iBjm3aqFD1z1LDh7
         uOkjZNeXbPnLBUQqqMror1IrNja+TNzrqc/a1PX7YlmQCyWd9se2bTCME3IEH58RwxdK
         a/XyXccO931aCf/4kE7VKGXqDA5hPWDxrO2yQ1i1dm3h5BF01jIACkIzeDQEO7d5Wo6w
         l1W8O6URIKEvw1VIp1jl+YnWR9U3oOtJfcrvwlxV8vS4Lj+QIOJlsKH1Wj/9BdI7YNG3
         d8KYdpvmJb/3Qkjq/tIBEtM5qBY+rKJPD0LMBBB8L4iQFxpD4q1Aasvyk6Yjjv6l8L4h
         uzYg==
X-Forwarded-Encrypted: i=1; AKwUvBw+y7XJcS/l0Sth7GJWkqmfGFY+XRd2ZZvHX5lPtZBrlhkhzJ+hoR4SW3svqNNJK9FzIjCu0S6M8ygUd58=@vger.kernel.org
X-Gm-Message-State: AFuF++nNxNn1AyBjGbi4887Pl2QvPxFVMr7MXoxG8WBF8/8zZNkB3ssp
	GIObH8SuKBnLTbGjYzhSS9aIyJ/BfjEr6hm+Sdp5eFAm5/MlO3ucQig5
X-Gm-Gg: AYBFou0VuhGyWf9Z0oRwIrT1SQFpS4mjsmvrIlFhJrM6gQ0BNI/ZzlT3QQ9hHAE3sqn
	PG164zK+3EcwmHeQErsEfzjLhAMMRDkEY/FWEhuIupHtAaypphvkNVpy6gmtMxNZqcuHKHkhJGV
	sraP0/Oaf8xaCSAMfILx6ORMS0JhWngpvaPTdNgeMmgXX2Xsq8vl4qRvALHnKj9sQhHtDQvsMwU
	R7kdfTGaq1DhHRa75jK9+LZTGFLgSNUdStFjV3/eIbZ3UTAgL8POungdJrBd0jXJsyyp8oDTqyJ
	4FWw3wV85jG0QO8FH1d2v31s5oSqFQr0BNFNBSV5BAMJyL6cg9It+eDriWAVeTJDj2ZkDxsdI6E
	3NvZFDDhhwgY9Wz260/enWmxuy6CQlzr00kFQQl/KX74wnNqcnONLzZZfvdhbwJB2LeEHyKSSdT
	A9XcmJmZaX+mERtskFlcv5BVkyePEAvKTkB4DlUJExNinFG1mYRAn0lGcBO2Bn7qbqxledNPPp/
	NNhRfCxArwWBNeJ
X-Received: by 2002:a17:907:d25:b0:c2d:8fb:ddd5 with SMTP id a640c23a62f3a-c2e23761f56mr74453766b.5.1790762439152;
        Wed, 30 Sep 2026 03:00:39 -0700 (PDT)
Received: from localhost.localdomain ([94.240.182.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f7fa5dsm40170366b.43.2026.09.30.03.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:00:38 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: mchehab@kernel.org,
	hverkuil+cisco@kernel.org
Cc: linux-media@vger.kernel.org,
	nogikh@google.com,
	johan@kernel.org,
	lgs201920130244@gmail.com,
	kees@kernel.org,
	lkundrak@v3.sk,
	fsimonce@redhat.com,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>,
	syzbot+ed3ed4f52d1fb6a7367d@syzkaller.appspotmail.com
Subject: [PATCH v2] media: usbtv: fix use-after-free and lockdep panic on unbind
Date: Wed, 30 Sep 2026 13:00:00 +0300
Message-ID: <20260930100000.41652-1-nsvatoslav515@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a usbtv device is unplugged or unbound, a lockdep panic and
use-after-free occurs in the driver core.

The sequence of events leading to the crash is:
1. device_release_driver_internal() acquires dev->mutex.
2. usbtv_disconnect() is called, which in turn calls usbtv_video_free().
3. usbtv_video_free() prematurely calls v4l2_device_disconnect() and
   v4l2_device_put().
4. This drops the final reference on the parent USB device (intf->dev),
   triggering synchronous device deletion while the USB core is still
   holding dev->mutex.
5. When the core attempts to unlock dev->mutex, it operates on freed
   memory, causing a lockdep panic.

Furthermore, usbtv_disconnect() continues to access usbtv->udev after
usbtv_video_free() returns, leading to a direct use-after-free.

Note that commit cb705f75d03e ("media: usbtv: fix null-pointer
dereference on disconnect") recently added a mutex to usbtv_video_free()
to resolve a separate issue, but left the premature v4l2_device calls
intact. Because the final reference is still dropped too early, the
lockdep panic still occurs.

Fix this by removing the manual v4l2_device_disconnect() and
v4l2_device_put() calls from usbtv_video_free(). This allows
usbtv_video_free() to safely unregister the video node without destroying
the underlying structures. The final v4l2_device_put() at the end of
usbtv_disconnect() will now correctly trigger usbtv_release()
asynchronously, safely dropping the parent device reference only after all
system locks are released.

As a result of this cleanup, the dummy v4l2_device_get() previously used
to prevent premature deletion in the usbtv_probe() error path is no longer
needed and has been removed.

Fixes: a3550ea665ac ("[media] usbtv: split core and video implementation")
Reported-by: syzbot+ed3ed4f52d1fb6a7367d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ed3ed4f52d1fb6a7367d
Tested-by: syzbot+ed3ed4f52d1fb6a7367d@syzkaller.appspotmail.com
Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
Changes in v2:
- Rebased onto media-committers/next.
- Updated commit message to clarify why commit cb705f75d03e does not 
  resolve this specific lockdep panic.

 drivers/media/usb/usbtv/usbtv-core.c  | 3 ---
 drivers/media/usb/usbtv/usbtv-video.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/media/usb/usbtv/usbtv-core.c b/drivers/media/usb/usbtv/usbtv-core.c
index 89c3424e7685..2cd982ca49bf 100644
--- a/drivers/media/usb/usbtv/usbtv-core.c
+++ b/drivers/media/usb/usbtv/usbtv-core.c
@@ -112,9 +112,6 @@ static int usbtv_probe(struct usb_interface *intf,
 	return 0;
 
 usbtv_audio_fail:
-	/* we must not free at this point */
-	v4l2_device_get(&usbtv->v4l2_dev);
-	/* this will undo the v4l2_device_get() */
 	usbtv_video_free(usbtv);
 
 usbtv_video_fail:
diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/usbtv/usbtv-video.c
index 2a91af8d1e30..999bce621c04 100644
--- a/drivers/media/usb/usbtv/usbtv-video.c
+++ b/drivers/media/usb/usbtv/usbtv-video.c
@@ -964,11 +964,8 @@ int usbtv_video_init(struct usbtv *usbtv)
 void usbtv_video_free(struct usbtv *usbtv)
 {
 	vb2_video_unregister_device(&usbtv->vdev);
-	v4l2_device_disconnect(&usbtv->v4l2_dev);
 
 	mutex_lock(&usbtv->v4l2_lock);
 	usbtv->udev = NULL;
 	mutex_unlock(&usbtv->v4l2_lock);
-
-	v4l2_device_put(&usbtv->v4l2_dev);
 }
-- 
2.47.3

