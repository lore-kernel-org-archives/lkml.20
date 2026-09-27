Received: from mail-ed2-f16.google.com (mail-ed2-f16.google.com [74.125.228.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EBD3876A4
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532506; cv=none; b=hMcBklV++lubEaWE9H73L93B0yHj/a4Y7+0vDeTFOmTRXuWn9q3qTAgw7Y8as6+UFx4xBjndv83snWCtSW7l93V56CqINk1juwl7etWIBuqeWyRpUyckR6tseKSHDsfgEbzhF34XzfuroY2Cldky+GBYS9Jxik8fxUfKkc4PzfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532506; c=relaxed/simple;
	bh=WMAskwOoSPJaG6PGflXZnl/uFZqcsTJlZwP3XmFA5D4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BPk5Zghorv7jjZ0AizxdbUJiSFu0EIMMDaHs5HOB3BaxV0D6coSmhPVtzifmdM1QnVoZkhfI8XXEJ2B3dfCDsNjuzotmASFoVA5MLEJPPMyMDQk3eSuMIXcUgwEgzw759kInR628rZ3lEgd98jiQeTkSVC+pv5LSMHijMDJ0N+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S95mVt9j; arc=none smtp.client-ip=74.125.228.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S95mVt9j"
Received: by mail-ed2-f16.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso3789317a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 11:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790532503; x=1791137303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=okA5mOg4kYRrGG25qz2brfl+VKSTjiCYOxROXsfXqhc=;
        b=S95mVt9j4fB10/oLUa3cN3JPYI8Tt19qr4dUY4aQmWv5wyabNam5xRFYAOltkwRuQc
         juIohcLeYyaFXgoIjjQQ03tkFgVibqnHw/hS7bV1doAwCR/gRRbDk0P+nx1h5GDjiq4t
         qh9e42Fzwr+Lbz59nNgGHs2iHnNHfTOa22up1cFi2/4I7XAC1Grag0mkqNUKdqml6jEo
         AXZAjnEtgzaHwzZXM8t2QqDvkhgM9lbGTfv686or9I9/v1FFan5AWT6/p5DB149C4QaF
         sChkuBZ4pXfGKyPTlWFoOqTm4Fk+dcdKkICX3KQWxEQk2AVBRDrBLXKeKUtd2dYVeMqc
         loCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790532503; x=1791137303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=okA5mOg4kYRrGG25qz2brfl+VKSTjiCYOxROXsfXqhc=;
        b=PNMFHVgJ1jDK7T3asJK1Ucp7z5+8JtM23D/SuKKI9KOyjWckX1/mqG9OkbLij8eNe/
         TWPg/Oe88+Gi8GpOywiHeFoUwXKMPVBXK5hyWF6myh0G/evzqPmaZWK/ysaYQ5fnKGzg
         n2mja5MV17CDN0kNmqI6fu3uFMg0eF4wAyNkUjyXFObnd+BjxXajojEozYXFEy9OGVe2
         Eg4vCqXIW7t1uW19AJXsc98aUif+jlFiIJyHkC/GEsYuSwVODA9dlq6WZtX8hPfi/ySI
         Npk2yDSOWJIMxAz1kK1cwyL0MKvi0UV2sK2IYlsT71MFGAAUAPnGIvPXwkuA2iPWLrLN
         g/Ng==
X-Forwarded-Encrypted: i=1; AKwUvBxgoFsTbaveBsMh4lV2k4mY1IAm0POmDI3wqghN2KEurCaVqZuh+/6lo0r0pxVXe6KhObo6xvizX1evrUY=@vger.kernel.org
X-Gm-Message-State: AFuF++mCtJDolmenHtW8Mcyj0hTP8tPKoWxwqmtNTd97OvWG9eYmGXKd
	rbplTXkehgoVwSUI6KUMzcBEFiTvPJ502VJuYPZ0fm2TIFU2A/0YhjhAk96SlO8j
X-Gm-Gg: AYBFou2gruul9MGGRwHS+jgVgxbbZQB0NLvObBjkO+ppEyNRpScR7DEHHF/geb9ApZA
	PySv1qDbJ22ld73v/YeGF3BF4AQEYyCkcfPJoTYCffglFpUX+tm/eIe/s3BIlNBaEYdMnZinKr7
	Hg5VwzdPQUoA7ZoLjMGT1ZVyWGLeF1OFYnTAcDq3VndYuzeaBOXY5bL2zM2txbtBjk15ofbo0Ui
	ofnAtcFSi5onyNDjnqsNTLhsfFZ2MXd/tNtA9b2t3th2wAenIumF4tQo8rWzawiq3vEOmdgq6O6
	9K6I575MLEWme9prKh0j5GlmvOPnDpGVXuodGAz4M6t9mRNjvHBkO5supwtMbJWRs4La/7PeMVR
	VDfXVlOL9K3DXHtAqcg0NFZ69cz5cqSDKisfLBFkKZ+CvNm/qCi1ZIrbyMjhoLwIUql+vSPc5BK
	D52mcIfxYTC1lFgIN213vhyevVzl9m9jKYkmCLG9C/Kz0thx2y6LNOXZB2tzd6AR2dX5b841y3m
	lh+gHN1zAsELnOo
X-Received: by 2002:a17:907:d08:b0:c29:d31f:7d73 with SMTP id a640c23a62f3a-c2ac238632amr981234766b.9.1790532503139;
        Sun, 27 Sep 2026 11:08:23 -0700 (PDT)
Received: from localhost.localdomain ([94.240.182.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbd3a0424sm168206666b.70.2026.09.27.11.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:08:22 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	johan@kernel.org,
	lgs201920130244@gmail.com,
	kees@kernel.org,
	fsimonce@redhat.com,
	lkundrak@v3.sk,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>,
	syzbot+ed3ed4f52d1fb6a7367d@syzkaller.appspotmail.com
Subject: [PATCH] media: usbtv: fix use-after-free and lockdep panic on unbind
Date: Sun, 27 Sep 2026 21:07:45 +0300
Message-ID: <20260927180745.2721-1-nsvatoslav515@gmail.com>
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
 drivers/media/usb/usbtv/usbtv-core.c  | 3 ---
 drivers/media/usb/usbtv/usbtv-video.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/media/usb/usbtv/usbtv-core.c b/drivers/media/usb/usbtv/usbtv-core.c
index 4f10f6613bc4..8a68bc0aa884 100644
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
index 92bc7a2509c3..9e02038c3ff7 100644
--- a/drivers/media/usb/usbtv/usbtv-video.c
+++ b/drivers/media/usb/usbtv/usbtv-video.c
@@ -964,7 +964,4 @@ int usbtv_video_init(struct usbtv *usbtv)
 void usbtv_video_free(struct usbtv *usbtv)
 {
 	vb2_video_unregister_device(&usbtv->vdev);
-	v4l2_device_disconnect(&usbtv->v4l2_dev);
-
-	v4l2_device_put(&usbtv->v4l2_dev);
 }
-- 
2.47.3

