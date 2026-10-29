Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793248056;
	b=q1ufuIq9fU0yV4oAQFmhLV6IetCmC88rwk4ubcX/7nQBcp49G71kCL4muMlccyuEFEMq
	 UmB1PzkN0Bs4wSvO5MIR0auZ11tTJNZ2G8YyrA7W5mbmADwORpf9YJ6vTbP6yQCz//VVc
	 vZPTE+Sep5cEgY0d2ILUGfjI1TJGyiwsYjkr16M5T6HDe+urYrR1YOn/CG+PCSnoF5Ow7
	 UjYDlem6OIT7RxuRw+mcs9r3il9eNHT277evCbX6fn6a0S6CCDgM7iYtNWkZ6//Xc4Joi
	 hHS4LkkTIv3puWzKgnc9VSZGMm79hTrkJFBSlAfOeHAvVecuIN0ZUXff9TjFOI2PhLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793248056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bx+vuMUqU0o0uCOdBUYrDw9h8WBls/PvV0DAFCe7yLY=;
	b=eXNABW8gZK1tPVOfkYvsz8gjhy5qFshOsmxzyxTP092yONH8Q9ZyphgY61QNo5RrYULt
	 dEchNst70b801LBa7e1LR1ZF7zIcIqsq2OJI3QqZHWVxK7SxErbSEH32ddfJo3VHbxV0H
	 IMjTO9jciOKPfvH5nqQBTt90hd3x0j0WXLXLijnO0ZdlT5otkNyEIxkxj1E1HhNfqz/wX
	 66BF2cd1tr4hAkxHc2bk9lgXCB8yLSlsJ94rcev1plhOP8kWOhN4FO+4bIqzLe+o3/ltj
	 myIN734F0zCPCivxWY8/FohYa1+NQ6mrNK8v12b5WXF0kr10x9ySy7mrXkLlokUAbpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AbnxPPsg;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E73D606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E73D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AbnxPPsg
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so1058263a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793248056; x=1793852856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bx+vuMUqU0o0uCOdBUYrDw9h8WBls/PvV0DAFCe7yLY=;
        b=AbnxPPsgwVQ+uL3rCi0nnQlDD9t8RlMD8CFAlJDiNlJdGkXK+0UORsyD+/OtEs1Bb7
         HG5D0JhlmmAty0xPXywaCk/Y2qG78fcXm++zCubmtCAVBk+CWlSI8rbzEX6Jj3ZAcsUD
         U4CQirSoiw8NzZjCA1+lM2ZE2Luqc/Ao8twD8gIEgVbGVb6z5vs5jDapijI1JVRqYR4z
         rW1GQv+t/NLm9G/GZYYqlrNUSoiCIf7P+KOZSU6WvrjCSuEEvGVzftJxIs73YYzcUQUJ
         OboX73tCaWoxSu6Is+Vr78CTO/7uYgTRoSyekOjSPnN6FogGaAggylYrY6R7GvnB6D1y
         i8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793248056; x=1793852856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bx+vuMUqU0o0uCOdBUYrDw9h8WBls/PvV0DAFCe7yLY=;
        b=c9mFjDqXIae9mj+/zWcfCQcRuU1eUSkpPskXxZdM1tFRg9SyYB95mWqhyyYFBKhqZY
         DkWOG7c3ppv6ufsXrMNQToYrDsL0Ha32fiCSnr1WhvT8laHnWQGqXHDGEx49tk5u7e2+
         bQm7P5ng8jMxQSdEzv+Pp3dbHqmgQQzM4RKYy53Q6I+EBupJJzdDq5fzqJ+4PNhJUV2Q
         xwQ5iD9vhakseCBNz6ic+TopAj9ulSKkb6dRsr8tQuRKhnHi+QjErGvlRi3/3lSDM816
         asE7kr+I0BNd1ok7alwweipLGcC264rC1RfMNg3Um59L+fekM1NS/Zuirh3HnxUSfWaR
         xCaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlWwlBLDWvA5I11bm1oKWsk03WftWvQlZQ/HzndtiQdVOqTNoGdyRimXK8llLfmWpSP98dYWtpsyhFy+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXTVhDYT0bVmDRrHuHAxlNoGr+VcuWKhgVOgucu5Q2Kd9+Pmvp
	1aQ2HbgTc9f+acptPrtwvGifR4DKmVAgXGDY8BZAfhkV+4TxMYMqcvQR
X-Gm-Gg: AYBFou0FyX5a4wQH8cqaMoBfeQhX5jWVg+0aQc/iNm4CXUCDaZkfTIjtlzghpLjwKIZ
	qW1H7VL6pCCvmrLxtjr1ghGFDMo0+VWDr5Fa37TrflTSMDnEGL53oMlrtCVju4CSXS1B0urwgID
	DGXgE1BSkfEVn/nnd5dqX9YmGSQUZge6hjQC9QZZhLQXE2hXUYVAZDKnMeC1aEZ/j5Jufsn8D3W
	eHvtTHIwTP4TL6B9sBMon9SgqfJFVH/Fq8Cc7vAHQsHT+zx8hIPHgIpHHyj3qTPcA7axGxTXKNB
	vewm+LH9yw8/YAPMf3QB1/O19e9HcfnzWjGDJQTKKqW3EXmFxKt1D0G44a/PrLMm/32XDoYwdZx
	cs42GFrv1BbYFwRwmob9cZpYRGJhYWnBQvdmEswMO7JsopLe7dtTsrIGLuaDN3NT24cR9ez2WFu
	scYNBeccrTiCz9JYMPLhP0WVHwa6P1o1zM/Ne15cUy7p+kUBLkKGP6rq+NS0pjaJIpgyaBt4tj4
	/46tNpxugVBQRBDPaCVtnd4x3DYr9S2mcpi2fUPD16eGNpOCLMA4WB+Rci5hS3YHH4P7FWRug8U
	MttczOCaIIsNPF3cA471Qlep8so/6QxsTACcRYAf6sXB01RdeUPcATU=
X-Received: by 2002:a17:90b:2681:b0:3ad:8963:344a with SMTP id 98e67ed59e1d1-3ae58329beamr3298598a91.66.1793248055822;
        Wed, 28 Oct 2026 21:27:35 -0700 (PDT)
Received: from localhost.localdomain ([155.69.168.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e898317sm2010846a91.16.2026.10.28.21.27.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 21:27:35 -0700 (PDT)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: haris.iqbal@ionos.com,
	jinpu.wang@ionos.com
Cc: jgg@ziepe.ca,
	leon@kernel.org,
	guoqing.jiang@linux.dev,
	gi-oh.kim@ionos.com,
	aleksei.marov@ionos.com,
	lgs201920130244@gmail.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/3] RDMA/rtrs-srv: Balance the session device reference in sysfs setup
Date: Thu, 29 Oct 2026 12:27:18 +0800
Message-ID: <20261029042719.75868-3-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029042719.75868-1-izaiahsun@gmail.com>
References: <20261029042719.75868-1-izaiahsun@gmail.com>
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

The session device is initialized in get_or_create_srv(), and the
reference that device_initialize() takes is meant to be dropped last, by
free_srv().  Each path takes one more reference, which
rtrs_srv_destroy_once_sysfs_root_folders() drops when the path goes
away.  On the failure paths of the path sysfs setup this does not add
up:

- rtrs_srv_create_once_sysfs_root_folders() calls put_device() when
  device_add() or the creation of the "paths" kobject fails, then
  unlocks srv->paths_mutex;
- rtrs_srv_create_path_files() calls
  rtrs_srv_destroy_once_sysfs_root_folders() when a later step fails,
  but the per-path reference is only taken by process_info_req() after
  rtrs_srv_create_path_files() succeeds.

Both drop the base reference, so rtrs_srv_dev_release() frees the
session while it is still locked, on ctx->srv_list and used by its
paths: the mutex_unlock() writes to freed memory, and the path's close
work later uses and puts the freed session again.  In addition,
srv->dev_ref stays incremented when the first helper fails, so the next
path of the session skips the setup although the device and the "paths"
kobject do not exist.

With one allocation failure injected into device_add() (failslab
restricted to rtrs_srv_create_path_files, into which the helper is
inlined), KASAN reports while a client connects:

  BUG: KASAN: slab-use-after-free in __mutex_unlock_slowpath
  Call Trace:
   mutex_unlock
   rtrs_srv_create_path_files
   rtrs_srv_info_req_done
   __ib_process_cq
  Freed by task 25:
   kfree
   device_release
   kobject_put
   rtrs_srv_create_path_files
   rtrs_srv_info_req_done

and with the failure injected into kobject_init_and_add() of the path
kobject instead, once the previous patch keeps srv_path alive:

  BUG: KASAN: slab-use-after-free in rtrs_srv_close_work
  Freed by task 88:
   kfree
   device_release
   kobject_put
   rtrs_srv_create_path_files
   rtrs_srv_info_req_done

This runs in the server's completion worker when a path sends its info
request.  Besides allocation failures in the sysfs setup, device_add()
also fails when the client sends an empty pathname, which the next
patch rejects.

Take the per-path reference in rtrs_srv_create_once_sysfs_root_folders()
on success, instead of in process_info_req(), so that the put in
rtrs_srv_destroy_once_sysfs_root_folders() is balanced on every path,
and do not put the device when the helper itself fails.  Undo the
dev_ref increment on every failure, including dev_set_name().  The
device is still released, together with its name, by the put_device()
in free_srv().

The problem was found while checking at runtime, with the fault
injection described above, a report of the kbound static analysis
prototype for the same function, on v7.2.12; it is present in the rdma
for-next branch.

Build-tested with x86_64 and arm64 allmodconfig (W=1, sparse): no new
warnings.  Run-tested under KVM (KASAN, lockdep, kmemleak) by failing,
with failslab, each allocation of dev_set_name(), device_add() and the
"paths" kobject, and the path kobject, during a client's connection:
before this series KASAN reports the use-after-free above, with this
series nothing is reported, also with CONFIG_DEBUG_KOBJECT_RELEASE.
Mapping, I/O and unmapping without fault injection still work.  Not
tested on RDMA hardware.

Fixes: baa5b28b7a47 ("RDMA/rtrs-srv: Replace device_register with device_initialize and device_add")
Fixes: e2853c49477d ("RDMA/rtrs-srv-sysfs: fix missing put_device")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5 kbound
Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
---
 drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c | 21 +++++++++++++-------
 drivers/infiniband/ulp/rtrs/rtrs-srv.c       |  1 -
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c b/drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c
index 45ee07a98ca8..8de3963ca791 100644
--- a/drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c
+++ b/drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c
@@ -162,12 +162,12 @@ static int rtrs_srv_create_once_sysfs_root_folders(struct rtrs_srv_path *srv_pat
 		/*
 		 * Device needs to be registered only on the first session
 		 */
-		goto unlock;
+		goto get;
 	}
 	srv->dev.class = &rtrs_dev_class;
 	err = dev_set_name(&srv->dev, "%s", srv_path->s.sessname);
 	if (err)
-		goto unlock;
+		goto dec_ref;
 
 	/*
 	 * Suppress user space notification until
@@ -177,20 +177,27 @@ static int rtrs_srv_create_once_sysfs_root_folders(struct rtrs_srv_path *srv_pat
 	err = device_add(&srv->dev);
 	if (err) {
 		pr_err("device_add(): %pe\n", ERR_PTR(err));
-		put_device(&srv->dev);
-		goto unlock;
+		goto dec_ref;
 	}
 	srv->kobj_paths = kobject_create_and_add("paths", &srv->dev.kobj);
 	if (!srv->kobj_paths) {
 		err = -ENOMEM;
 		pr_err("kobject_create_and_add(): %pe\n", ERR_PTR(err));
 		device_del(&srv->dev);
-		put_device(&srv->dev);
-		goto unlock;
+		goto dec_ref;
 	}
 	dev_set_uevent_suppress(&srv->dev, false);
 	kobject_uevent(&srv->dev.kobj, KOBJ_ADD);
-unlock:
+get:
+	/* Dropped in rtrs_srv_destroy_once_sysfs_root_folders() */
+	get_device(&srv->dev);
+	mutex_unlock(&srv->paths_mutex);
+
+	return 0;
+
+dec_ref:
+	/* The reference from device_initialize() is dropped by free_srv() */
+	srv->dev_ref--;
 	mutex_unlock(&srv->paths_mutex);
 
 	return err;
diff --git a/drivers/infiniband/ulp/rtrs/rtrs-srv.c b/drivers/infiniband/ulp/rtrs/rtrs-srv.c
index 641a7bf5e02c..56f0ab5a7619 100644
--- a/drivers/infiniband/ulp/rtrs/rtrs-srv.c
+++ b/drivers/infiniband/ulp/rtrs/rtrs-srv.c
@@ -879,7 +879,6 @@ static int process_info_req(struct rtrs_srv_con *con,
 	if (err)
 		goto iu_free;
 	kobject_get(&srv_path->kobj);
-	get_device(&srv_path->srv->dev);
 	err = rtrs_srv_change_state(srv_path, RTRS_SRV_CONNECTED);
 	if (!err) {
 		rtrs_err(s, "rtrs_srv_change_state() failed\n");
-- 
2.53.0

