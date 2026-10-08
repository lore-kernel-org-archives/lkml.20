Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC7E38B124
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791475985; cv=none; b=M5jmZxrSEpVLO3DhxJuoORndZbjDtBjhJffScIEZIUT8rdjk5Qs8GRN8gDWcZJEyBRDYmEJqYYKV9oNgi6QMVrcbGG7UA5Do5eJnDjmTC/sSyayuGYenxQMu4FblJxXvAM3OgLi/OW868lC1aH4fDJfa2WewBVubMLKzqkHjudc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791475985; c=relaxed/simple;
	bh=BmN0rljmONbdz/PXm/OprH8FzTn9S1DwuWMcx7k7+c4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cNwLesxroelYraKOPQV/eUvwzzOGZjQa6vp3GERgTRHVO9Gp//rNCql5jitNpuFHu+albaNJxu6NV1yv9y0Y5UuOdqhNGwawUFZN6UelueH+gZmsMkwPsRffRp8h37q2J3nRdcqd10pR9ft/7YZ4Xfr2/f8ZvrGOp6k8T25U/uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQSHo7+q; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQSHo7+q"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so2335343a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791475983; x=1792080783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDdHvibVLCCzB2QsTRiQrrzTd39n/2ojg5xJ6kjQ3YM=;
        b=jQSHo7+q6BRzVltQoErJ5TjOkU5QHN5cjeoNu7MaKoqUV3TuEz5EgnzM1zKDd+NiYR
         xYAQU+k/R2ARxUz0cg9Bq3AS8U10R1q2WqKtmFqY/XJCCNj67qrk5HEvJ+qyOWp6xZrn
         mAODEAfDPZStJIWX0LkDgwjXZs11g+w3DY+Wll/SLlfziWd3yo8xn/UJB2EWbAm2d+So
         d7h8AKdOwbRIeJmv/6D0cKV3xca6uFb4HYBG9cnD4hTrPwRigkHRIOX590CMq+uwiqJ+
         eTe5q+j4sq5Hr7Doxcg9B6zzJoD4q+zVpuT4G4T1hVxUV7lNeKlx1UDoA9h5GW6Iihwr
         1p9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791475983; x=1792080783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hDdHvibVLCCzB2QsTRiQrrzTd39n/2ojg5xJ6kjQ3YM=;
        b=2DgI5hy5c7xNtAVjU6e4bDi751QSnCfzqOenV7bXJUMbgYzidQD1tmuvKSLPNjsZYV
         vhcZGGanttjKjhSTWZU1Qg8s/6os9oQ+HwJNWnnTCNNaIjbo582TSIghv7vElszkO/4B
         qUhgWnaa/9PZmeNyifYj3DbfJkcoZi15oViGaT4zu9uVBMCYhEhSYU6tlPN8i59h1C+v
         AcADeBIHDC6Kh/KXXHK/Ok1mL/4XjrTbVoaa5cDVrsbnK/vtZVtswjwYSgZLthc0Nv7a
         CQ0Gi5HnxIH1/dZeo3qqYSwE9AQO5HRWnTMDsKRQTU0A/GktYf4vzg6PtguT4w5nSJ3N
         JF2A==
X-Forwarded-Encrypted: i=1; AKwUvBxw6RkTwrmQ0LuHZJJAr5FwVlEHMKXv3hhr6qQyi4N/DDT4O2U+RtgyOJpY/vMo1GgAjW3JPFvjMsPVaMg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPlp2duzM/z7fF9E6FLZIcZ4Z187AKdv1am6fFDRWdAATMXR3y
	6JKCUGNpOTZScvb7kb8BcAWbF/h6yxS9rdStXteuB55MjNnbuO/u/exW
X-Gm-Gg: AYBFou3K3hV2iPX3xw/O4cXInfQ4xrIsp39U/+PW7isK2qrbJHKqo5yuYcgiLZyhkBg
	2x0nKRKlQUCi1nwE0j7BDV9tJYdscd7g5xZy3kSG4qAwyo7IzQ37+2Zz4Ukgwds5GYZXAihA8Od
	cKS/wevs2Mq5ICleqL6D/nDffz8rTvgNGvB+OT3nClJLexGupidlqDSgS3BakBUax9BaxwwG5si
	yz7zcHBGHQ3sTHsAeHYM7CR2NA/JtP4sSt7jQdNOPXE+JnZOSo3Bh4qNf4GlWusW1DJb1dbPD8m
	r2lSarnEr7wrvNi0XRYhhl/Dl4SOy5sVICZdcJOsetcABru43vU2Xxyx0JYAuVta5Cybd8WHXKi
	eSKAj6FlPei/w6+ZgKwsQ7fzINX7GjOKIykMx1NgZNRnG7GQz+zcbY/OPG8J4WVPh8TQmgJBywT
	uX6D00SBn5gPAbmpDKrLos7B3qqQgPHnrWvG88j0sA2J9qU938OY2safPMpNLZaJegvkRT7Qsk
X-Received: by 2002:a17:90b:5848:b0:39d:e54c:8658 with SMTP id 98e67ed59e1d1-3a89f687798mr4750893a91.5.1791475978758;
        Thu, 08 Oct 2026 09:12:58 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45b:16d2::246:b6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a7e9e4sm4834011a91.7.2026.10.08.09.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:12:58 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH v3] driver core: bind a device with a preset driver even without autoprobe
Date: Thu,  8 Oct 2026 23:12:53 +0700
Message-ID: <20261008161253.138698-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008144859.25548-1-ngocthang2710.1999@gmail.com>
References: <20261008144859.25548-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_driver_claim_interface() may claim an interface that is not yet
registered, in which case it only sets dev->driver and relies on the
later device_add() to bind it via __device_attach().  With the bus
drivers_autoprobe disabled, device_initial_probe() skips the attach, so
the device is registered with dev->driver set but never added to the
driver's klist.

Releasing such a device (from usb_driver_release_interface() or from
sysfs unbind) makes __device_release_driver() call klist_remove() on an
unattached node and dereference a NULL klist:

  KASAN: null-ptr-deref in range [0x58-0x5f]
  RIP: klist_put+0x4d/0x1d0
   klist_remove+0x14c/0x2e0
   device_release_driver_internal+0x4fb/0x620
   usb_driver_release_interface+0x10e/0x190
   cdc_ncm_unbind+0x2ac/0x350
   usbnet_disconnect+0x1e2/0x300
   usb_unbind_interface+0x1dd/0x9e0

Autoprobe only governs matching drivers to devices; a device that
already has a driver needs no matching, just the bind that was promised
at claim time.  Do that bind under the device lock when autoprobe is
off, so that a concurrently cleared dev->driver cannot fall through to
probing every driver on the bus.

Reported-by: syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=863936f50214e843ae0c
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
v3: Sashiko noted that the lockless dev->driver check in v2 could race
with dev->driver being cleared, letting __device_attach() probe every
driver despite autoprobe being off.  Do the preset bind in a helper that
checks dev->driver under the device lock.
v2: fix the unbound state itself rather than usb_driver_release_interface()
(a sysfs unbind would still hit it).

Tested with the syzbot C reproducer in QEMU (KASAN, dummy_hcd).  The
race that leaves the interface unbound is rare, so to make it
deterministic I temporarily made device_initial_probe() behave as if
autoprobe were off whenever dev->driver is set: the unpatched logic
oopses 3/3, with this patch 0/4 (64 USB connects each).  The plain
patched kernel shows no oops either.

 drivers/base/dd.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 137bf1dea333..bb1e76bf6122 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -1142,6 +1142,16 @@ int device_attach(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(device_attach);
 
+/* Bind a device whose driver was set before device_add(), no matching. */
+static void device_bind_preset(struct device *dev)
+{
+	device_lock(dev);
+	if (!dev->p->dead && dev->driver && !device_is_bound(dev) &&
+	    device_bind_driver(dev))
+		device_set_driver(dev, NULL);
+	device_unlock(dev);
+}
+
 void device_initial_probe(struct device *dev)
 {
 	struct subsys_private *sp = bus_to_subsys(dev->bus);
@@ -1149,9 +1159,10 @@ void device_initial_probe(struct device *dev)
 	if (!sp)
 		return;
 
-	/* a device with a preset driver must still be bound */
-	if (sp->drivers_autoprobe || dev->driver)
+	if (sp->drivers_autoprobe)
 		__device_attach(dev, true);
+	else
+		device_bind_preset(dev);
 
 	subsys_put(sp);
 }
-- 
2.43.0

