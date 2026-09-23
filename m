Received: from mail-dl2-f10.google.com (mail-dl2-f10.google.com [74.125.229.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EA6396D1C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148059; cv=none; b=ej6unZXktSDoW3wWPdRapktaJQCpeosSatcS1uowdDi54kiwVfFiUfXtBR5KByJ5uFuEOose/f/XvtIwie30HpmHT7+WvHnnOSR+IaX4EUv6H6QHWMKaUo7O5Q/UvIiXk0lpYu/wRcjHCV3Enk1ety+gFvd94Emq0OEvigt4bS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148059; c=relaxed/simple;
	bh=0hxanbK4yIWzoGvQWd6GLvT1DhcDi5OPHr4is5h1MOU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=L1NEc8sCjDYHpy/VIhxgNPi4UrKMP0V4gPcuITVCw027A1wPMM9oIfyp5tBV51rq7u3SiR9orre3oHGk8ADqpOb6hTnUnvWAy1YIctXlKMT/2+CDjzj8JwYXcfouuFmcAg2ZliQatd+pP4R/kB/NozD00O1WYqBv6GOZl/xhMvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eq/v6biv; arc=none smtp.client-ip=74.125.229.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eq/v6biv"
Received: by mail-dl2-f10.google.com with SMTP id a92af1059eb24-143601f9f98so40933c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790148057; x=1790752857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=geEmw+R/kfrbLwVLDAsBiL4pN21rLxye59h2geFDiOU=;
        b=eq/v6bivGRdeAlSE+Vu7p+q5LH3tSYjUQMFy+5DLCaylTB5aYT8jesIX3Pgft8KQt3
         Ck14kB2q8rXXeY19cxoaGSofhDdU2Tw3Riwo9hZTIRWEwFW0mVsEUzbZFYFMOUDrdlJN
         N6YmxBKdPJCihc2sHDTn2RRWJ/ul7rwSNolhwRyHvvR2R+q0t3O7RQmU97DDkECdGax3
         eu8LEZI0YFlQXZQqGO3d7RiijyIwAnjsXjITDf7YXBxuKE675/XVRYOVnusEiDvgsAh9
         OPWRGz3/+riou49PIPW9WupVOW5rB5lNvCOkbSXRzkRZv2XYhSiJ+9Y5vHG6SCFwfiFU
         LzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148057; x=1790752857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geEmw+R/kfrbLwVLDAsBiL4pN21rLxye59h2geFDiOU=;
        b=Ufb1eEx1VirJWo8cGinh+tO3RoaHCDneUf+vJzeCc5B2juFCPQK5u88jzwFK5xhSA0
         l+iqO7Qc/H9/+kFGI6gdfIkk9zkTVsZeDtvxq2bsL0neHMNBNCjZouB5obZMMJJiDMKx
         W/6Ru3pVw+y7IX4svZuN2YacopQalR6zxMPCQOjassiNeT1Ygn3wrn8p4jQ3hjrGaONH
         wkzSKIiEt5MlvRJR3fuqgys3ldA6x4GR5j79GVZhX/F2NGyDXeU4EgFimgFbjp+nYV+D
         q6L8/8+uD8HHSEHreKH3lxQfsam/5dlnuwa4d93oDrZiAxCBgnKcl3jDC8KX8JSuj1Gp
         RRNQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2S9+sxVKRBK4xy15jRngNAEpqM6pBxN6cWlqkROxP7z1m+iXUekQjRO45KA5uv3CDiVRAZodbuG7MWu8=@vger.kernel.org
X-Gm-Message-State: AFuF++lCtpSF4hKS/fbFYDRYXymjXuARQ2O8jhdFukL65SSnjJc26DIQ
	qGOQWd5Fz1MvLqBJYWUXld05q+NkBp1OY7JftnwU7/mXx/T8LB1p/o0R
X-Gm-Gg: AYBFou2rHLbrKVWwDgwMZrlrbdNeBTZVlIne6fZ0w3km+rwbZEAV9lcKmH4fZCuxLhX
	lFuDYIZq3zwvNTy1yODPrxtI0g6pb0Pb0eWIvs9jxbxtpOI301gKC7EAXo2ooPcwdj0/Cldh3HS
	srRgPGaiHX/dZ9jVcMnmnYDXftw6C6mymmthSxX4/iwg/MyTLylDCrpakoQgrD2kqQCVJHvAOpa
	zNMZxWc03q+cBqoAZuD3wjQqSKZsDImBsOkmQEpAwCV9ApQPU7cZq9QPIeX7p9YSjAJL25mKkE3
	0jPJApTTy5+EPAAqtljS6npW4vMaEBsGppgMrC0L6/eaJdx2I1fCGA/WB8iXZcxCtcjEqb9z2NU
	orlNYQMVWcqyZXj/QXdH+ZaR+lvAy/j7LI2SocyGYwyF2F9W5553QyuUcG9IadT1DuxE0nLtkwI
	Cs9Q1BnEM0JOGfApYmi8hfAlhMSTwwybyq3rJMa8a52dkaiogXnj1zUfLIRMwvHy0N4LMjJfcu4
	vnjDcCzn2FaC147/LqM8dCn/hKcEy3eoXRd2e0sDnT7l3NDRFNH
X-Received: by 2002:a05:7022:7e81:b0:144:ddf7:256e with SMTP id a92af1059eb24-144f9179543mr2414871c88.29.1790148056999;
        Wed, 23 Sep 2026 00:20:56 -0700 (PDT)
Received: from Raccoon ([113.30.177.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f949e51asm4162367c88.1.2026.09.23.00.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:20:56 -0700 (PDT)
From: Rohinthan P <rokinthanp03@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+f26bc23e42eeb548dee1@syzkaller.appspotmail.com
Subject: [PATCH] media: em28xx: use video_unregister_device for radio_dev
Date: Wed, 23 Sep 2026 12:50:50 +0530
Message-ID: <20260923072050.24427-1-rokinthanp03@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 7c8bf63b7937 ("media: em28xx: use vb2_video_unregister_device")
converted device unregistrations in em28xx to use
vb2_video_unregister_device() instead of video_unregister_device().

However, radio devices do not have an associated videobuf2 queue
(v4l2->radio_dev.queue is NULL). Calling vb2_video_unregister_device()
on a radio device triggers a WARNING in vb2_video_unregister_device():

    !vdev->queue
    WARNING: drivers/media/common/videobuf2/videobuf2-v4l2.c:1264 at vb2_video_unregister_device+0x1f8/0x200
    Call Trace:
     em28xx_v4l2_init+0x1c39/0x3150 drivers/media/usb/em28xx/em28xx-video.c:3085

As documented in vb2_video_unregister_device(), video_unregister_device()
should be used instead when vdev->queue is NULL.

Revert to calling video_unregister_device() for v4l2->radio_dev in both
em28xx_v4l2_fini() and the em28xx_v4l2_init() error unwind path.

Fixes: 7c8bf63b7937 ("media: em28xx: use vb2_video_unregister_device")
Reported-by: syzbot+f26bc23e42eeb548dee1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f26bc23e42eeb548dee1
Signed-off-by: Rohinthan P <rokinthanp03@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index c418add..79af154 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2416,7 +2416,7 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
 	if (video_is_registered(&v4l2->radio_dev)) {
 		dev_info(&dev->intf->dev, "V4L2 device %s deregistered\n",
 			 video_device_node_name(&v4l2->radio_dev));
-		vb2_video_unregister_device(&v4l2->radio_dev);
+		video_unregister_device(&v4l2->radio_dev);
 	}
 	if (video_is_registered(&v4l2->vbi_dev)) {
 		dev_info(&dev->intf->dev, "V4L2 device %s deregistered\n",
@@ -3082,7 +3082,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		dev_info(&dev->intf->dev,
 			 "V4L2 device %s deregistered\n",
 			 video_device_node_name(&v4l2->radio_dev));
-		vb2_video_unregister_device(&v4l2->radio_dev);
+		video_unregister_device(&v4l2->radio_dev);
 	}
 	if (video_is_registered(&v4l2->vbi_dev)) {
 		dev_info(&dev->intf->dev,
-- 
2.53.0

