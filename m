Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006DC17A314
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790225498; cv=none; b=DSE/qcyMkuIIOG1cvd/wGkTHP5LHMo3hh8i58YQANeSvmkBpMD2dTP3GLWGSTofi2VgwfcpHRMoxU4oKEtRDsXdMABXghGtV9kPmbLFas76Lb7WyO7ksAx6Znn965KOIU/WZKCh9DBpmbn3M8PpsFfCjvG1nXNaUcnNY9WX7KOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790225498; c=relaxed/simple;
	bh=hBy4mFy6k94F6725hsTsmvN8LRi11I8RsVVW+BGuYxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G0seXhuEmA4KrjEhg2S0VWaKm5U2zpWVJikP4PEWm+/+lz/96ztdTMZo6RTZTu7ioy3wJy11iwGe5HWY70+RtHxLaCtlHbgcc4QInJCRPWfIFjLVt0r5kn8tm/9BfRdaLaFtXNk2fWMzV1GkBh2W/JIBPwS3lwwBosWvyJ7cCwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUUwy1u5; arc=none smtp.client-ip=74.125.229.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUUwy1u5"
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-3356aa152e9so657266eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790225496; x=1790830296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zlTGb7w+u/86oe5eEKdc1vQyBJBZbH/S6WcVuLcu9YQ=;
        b=BUUwy1u57y/jC9OoZg8WOV8mLN2mamg4vTDaGjmjKaRFHvMOX5vJ/38ejFQOGFkuCP
         u6KPnLs+GioGYvu9QIaTwbaKBzjcZdVhYUgm3OHT91+F1FYRS9P/sHk5E8Hu9QOtuAAx
         PqWiix0VinVRkCZsr2qZsOnS2GSAQAuzopcv++Mw0FrS042gb++TkUgdVdd54xTnEJxz
         0Z76mVmuavH582CkZJAQqr8h8QMapHbKIHfjJc4j2xkwLCig9MaHlN03cYI5F7ZR9omz
         aiNt7jAa9/jlR9JOYMc2N8cliMsjGTQaDaMvNiyk9VUC6hPUqwmoVu37VWJ5qrfIN7sP
         g4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790225496; x=1790830296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zlTGb7w+u/86oe5eEKdc1vQyBJBZbH/S6WcVuLcu9YQ=;
        b=xGBQ0ItWca2521kaUGElAw5M/pAjaQsMBrXvqCv36OrApZZhK2noEUC5nYxqlg+c27
         iwbDHiK70ggib7zaNBTSvgpMabRMwSMM9j+4b2rWXzzMOgTvtuNEN25XX6Ow5K9exUPN
         VP+J7+1EGReEP5qi24cjQsd3lf1T0OVKfhxjtFSq09+9V1CS7jJfwqIv4htsgtKclweT
         JFab858ehxS5ICQgLjQ5ApIwxK19MKYayYmjf42kG/txxROlNFSQM3fhcQDTpqltOBFo
         68iuytqNdET1o1vnnNCjCT1jxXRWbKhkLhXP2cJ+62wwRaWjL1uyU5wK66yi1I6AloF1
         qIBg==
X-Forwarded-Encrypted: i=1; AKwUvBwed+YZJqyqvtZ1Qgks9e2H3pVj/lMHMHbJWXcVYcEILzh1fcUqeg4tr6a76XpDnGSh9xdAA27Tcsyhhe0=@vger.kernel.org
X-Gm-Message-State: AFuF++kvguu4WuafYVgn9dG3eWHrIeBJTlsVwjFzyCzBEq6RS87m+ln7
	JwKCm9ZfU2pe0EMObt8JXaUWqg1m9ZAVLdAlEgd2deJ0YqF9vtVk1QsydSbpFb1FYub4Ug==
X-Gm-Gg: AYBFou2+s1cw29YfbVpFvvs7KprYjmBkahyK9zx1VNr68XTFhhTODvTp5Cs48DX0MO2
	mZkOZrQNQ2O+fSq5RA9Xr6cu2ZRbPMLdtCrw5VnXuyGFANJfiYd8qjALujn1Ab81VxvyhcDI/bh
	z26rIHASuuBTNNokWlyno4heBnOlZ9YE/Tv2Zxkbwg3E2NfMNcWdB0Yubys5pu2rhTx4g98Rszf
	XGCieoQBH/abWCI3TM2IU3MC2YV+B7LvBRT81WkpdHCSBi0Sa2HN0qG0Mu6c3BPNErDXLqGhdo4
	zKBUFzPBumYWY3955F1g6VnM6kT33BHTzX6IGI8XP/YRBlfFxoR7vPoZKSBg/z3Ph5b7g5nqyiC
	9pPwUHwohkJQYBjCtn5g9tLxtLnGceGdgHbFQ32e9+epJ5MXrd/PpN+BGozSxU671y1Enu/3T7a
	oZl01bvyxHrfo9Qm107gh87Ea7BZ5YZHSNGCoA3GTeFSGab6NUI6mnEGAoxWuZBxpxuJm+pqLFe
	uAZlIohsH2xeqlGMB73YqR0oBTdDjG8IZEWVIggI73nVlZZBy4z
X-Received: by 2002:a05:693c:8086:b0:33b:f062:a654 with SMTP id 5a478bee46e88-34004f7f8c2mr1334946eec.16.1790225495863;
        Wed, 23 Sep 2026 21:51:35 -0700 (PDT)
Received: from Raccoon ([113.30.177.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7bf6bsm9791270eec.8.2026.09.23.21.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:51:35 -0700 (PDT)
From: Rohinthan P <rokinthanp03@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+ea047a32630b1f47da67@syzkaller.appspotmail.com
Subject: [PATCH] media: as102: initialize bus_adap.lock and sem mutexes before DVB registration
Date: Thu, 24 Sep 2026 10:21:28 +0530
Message-ID: <20260924045129.12794-1-rokinthanp03@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In as102_dvb_register(), mutex_init(&as102_dev->bus_adap.lock) and
mutex_init(&as102_dev->sem) are called at the end of the function,
after dvb_register_frontend() has already registered the frontend
device node to userspace.

If userspace opens the frontend node immediately after registration,
dvb_frontend_open() invokes fe->ops.ts_bus_ctrl(fe, 1), which calls
as102_stream_ctrl(). In as102_stream_ctrl(), bus_adap->lock is acquired
via mutex_lock_interruptible(&bus_adap->lock). Because the mutex has
not yet been initialized, DEBUG_LOCKS_WARN_ON(lock->magic != lock) is
triggered:

  DEBUG_LOCKS_WARN_ON(lock->magic != lock)
  WARNING: kernel/locking/mutex.c:625 at __mutex_lock+0x12d8/0x1550
  ...
  Call Trace:
   <TASK>
   as102_stream_ctrl+0x27/0xc0 drivers/media/usb/as102/as102_drv.c:259
   dvb_frontend_open+0x7e2/0x1410 drivers/media/dvb-core/dvb_frontend.c:2825
   dvb_device_open+0x24f/0x340 drivers/media/dvb-core/dvbdev.c:109
   chrdev_open+0x4d9/0x600 fs/char_dev.c:411

Similarly, as102_dev->sem protects starting and stopping feeds via
as102_dvb_dmx_start_feed() / as102_dvb_dmx_stop_feed(), and was also
initialized after the demux device was initialized and frontend
registered.

Move mutex_init() for both bus_adap.lock and sem to the beginning of
as102_dvb_register(), ensuring that the mutexes are initialized before
the adapter, demux, or frontend are exposed to userspace.

Fixes: 47f79129ecf5 ("[media] as102: prepare as102_fe to be compiled as a module")
Reported-by: syzbot+ea047a32630b1f47da67@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ea047a32630b1f47da67
Signed-off-by: Rohinthan P <rokinthanp03@gmail.com>
---
 drivers/media/usb/as102/as102_drv.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/as102/as102_drv.c b/drivers/media/usb/as102/as102_drv.c
index 6b1d352..a6dd675 100644
--- a/drivers/media/usb/as102/as102_drv.c
+++ b/drivers/media/usb/as102/as102_drv.c
@@ -287,6 +287,12 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 	struct device *dev = &as102_dev->bus_adap.usb_dev->dev;
 	int ret;
 
+	/* init bus mutex for token locking */
+	mutex_init(&as102_dev->bus_adap.lock);
+
+	/* init start / stop stream mutex */
+	mutex_init(&as102_dev->sem);
+
 	ret = dvb_register_adapter(&as102_dev->dvb_adap,
 			   as102_dev->name, THIS_MODULE,
 			   dev, adapter_nr);
@@ -341,12 +347,6 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 		goto efereg;
 	}
 
-	/* init bus mutex for token locking */
-	mutex_init(&as102_dev->bus_adap.lock);
-
-	/* init start / stop stream mutex */
-	mutex_init(&as102_dev->sem);
-
 	/*
 	 * try to load as102 firmware. If firmware upload failed, we'll be
 	 * able to upload it later.
-- 
2.53.0

