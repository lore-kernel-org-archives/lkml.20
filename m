Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C82E299922
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790648551; cv=none; b=ntSu+H4YYf47gN04FQBCuOZCbWfa7FDBqfJoD7DeEa71m1kaomcO29SeBI0QHPFnoe/kAX3pZw+fDR6S4hsY5t+SMnAhy9cUppWIkF8YrXNkMRlSBrdXASfgmnQ61k8CJ+XVKJ/0fH5si2pvvzq/D1RHxzIRaYUbM63EbmYX0yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790648551; c=relaxed/simple;
	bh=OZK2EBvCadBSzaFNkc39QqbFt8cnzS1lZ4EvwlWh0Rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=itUGVniujOMaX0XacZlN8KarVvBa09oFExSvpCwAgjVYIQ5MO55xpCJv4Uz00qS9P80qcCHCq6JVRu3kUYy0BPU3L76CVaC5o8nwY4ITpQQDnMNrSkWj1wUMFM8TUQVTsXA5hV5At49pc0vkygqAkKvYVLDD45DOoHrinuq9Dj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8pUSqAQ; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8pUSqAQ"
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6d797cfdd1fso712169eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790648548; x=1791253348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfm68eCGiOBdIIwi0K4+F8jgrgA0hYS6eGRHLZQOjpA=;
        b=V8pUSqAQ8DxH1qBGIYz8UwjdJGhatZE3HKh8zmmUbrP7ZgZ5ALQ1n4ZnXe1I/y5C4B
         wHzeZBSvui35jiHnU5oBdO07svthw7/kNzRwXFjptKtsix2a0cCaeyUZm2mXmgJ6plBE
         jRxmCMosqBOzytWtZZQkXlSwj+UZ/xrMMctkw5fyu/pucmMb2AVNcDiL/Y3/Jua308C0
         ZloytYek3ICqSa+oELoZTNjaMjcS97lkYdnDqP3SsU4l7/vC/G4uMR9r9JtpRAYeDX7t
         fxsFopTjjZmsldPeiDeqVjZeXXnKjMzrOiFrJAMllLFSCp47SRr+pB68E47nRQTGAYxZ
         HZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790648548; x=1791253348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfm68eCGiOBdIIwi0K4+F8jgrgA0hYS6eGRHLZQOjpA=;
        b=aYKrtGk0Hsa4Nba+uw6/coPDwNVi+/E9Aqco0H7UZqEqYMTBYIpPVdTlVX+IBpeMOl
         ZDUTXyIqEB+ZHJXbVNYFWyLCXi/jdHIYDFlSCmvqPqDnEPPLVXE4esD6sFA2N+iPIg/C
         KTfjXfn4phzLMBjccbKP+arLHuYYUZ8K4XmWIqm5+oOqOYNiAqApuTQZC1YdAtovmJQd
         yuKe7xpsk+UZHARm1fBRllNp2mxPq8Qlx/Lft6swe0+JhQQmDq14VcAWTGeY/ltr1ZsB
         bAzX5LiL3B7NnlAyDxXJJp1TY77GLzkxVS5IxITC5oXx3lcwbPuzBV8RmBJQnuu8Gtkn
         BcYw==
X-Forwarded-Encrypted: i=1; AKwUvBySKJFr8AwzxqJSXmYBgxSzVtVE5wtYh4Ko+zM9oLZ4VTZLDxryQkcQiCM3riHU2wmLQm8M/Ix/I9/2GU4=@vger.kernel.org
X-Gm-Message-State: AFuF++nry73jg6PmDoTzhM0GL4IWWo0/Vcqio0hYaJ43YVo62MljU8S1
	sU7nFMcIX8Qm4zsW2F921DNYFqaBh7/qpBu6CpBac56HXC0qzQy1pJgf
X-Gm-Gg: AYBFou390231qbkYvpYZwSkPWEoW5HR34VJ32LRZNDBg/22NUO1/uhYSuJi7MqqxGSY
	186s+C/yHVJqyDNECWqeeXX3mNPuiA1lsB395UdEZz70CoMusFHEyTbTCgfczDtL4WDrISvlb94
	yJ0s7yjkt1JOZWFKlgIgvU9lYX0xIXWKzV92NdycfLG4LLfPTeCPfOpnRP4vHm5wuf8ZRlBZ757
	n7RJwwDD5vfJiUWfu8hNWEBulhMc/8ewBsa5srgl+GHRBCBmoKQKvXK2v7sWWjssqNhvYdf1Wxd
	WtwvZcT41gJrAVWdXC7WdBg8dQR1s7nr0YudO+tapBzM55r9sMcixAnBd7DNANrsLj5oqvSIx1t
	hFkSmS/YYy6OEAo9H2HWIiAxy+PZGuWFalDNm3DrM+L+3jHP1swUrD7J2g1XtlGex8uvmeJS0AT
	FbZotfyJbvv0V7ViqHQ+l/ktBXD0cBi1i5tSAfvgcyiwg03j7tS3fpg2TrR6YT9qjL68lE2TdT5
	h8QVACLVnPrz/Uh5dsKuzM+qsJK+6XR8CWsscD6m75Fno3XTVw=
X-Received: by 2002:a05:6820:81ce:b0:6d8:eb59:42b5 with SMTP id 006d021491bc7-6d8eb5953e0mr4692318eaf.18.1790648548336;
        Mon, 28 Sep 2026 19:22:28 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d883395632sm6753798eaf.12.2026.09.28.19.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:22:27 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Calvin Owens <calvin@wbinvd.org>,
	Yibo Tan <lhfff@tju.edu.cn>,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] pps: generators: don't use the driver's info after unregister
Date: Mon, 28 Sep 2026 21:22:19 -0500
Message-ID: <20260929022219.212024-3-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929022219.212024-1-danishkhateeb03@gmail.com>
References: <20260929022219.212024-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A file that was opened before pps_gen_unregister_source() keeps
pps_gen, and with it the pointer to the driver's pps_gen_source_info.
PPS_GEN_SETENABLE and PPS_GEN_USESYSTEMCLOCK keep using that pointer
after the driver has gone:

 - pps_gen_tio allocates its info with devm_kzalloc(), so after an
   unbind both ioctls read freed memory, and SETENABLE calls the
   driver's enable() with its freed private data.

 - pps_gen-dummy does not set info->owner, so it can be unloaded while
   the file is open, and the ioctls then read the unloaded module's
   data and call its code.

TIO can't probe in a VM, as it needs ART. A test driver that registers
its info in devm memory like TIO does, unbound while /dev/pps-gen0 is
open, gives:

  BUG: KASAN: slab-use-after-free in pps_gen_cdev_ioctl+0x4c1/0x580
  Read of size 1 at addr ffff88800e647f38 by task ppsgen64/145
  ...
  Freed by task 146:
   kfree+0x25a/0x6d0
   release_nodes+0xd1/0x140
   devres_release_all+0x10e/0x1a0
   device_unbind_cleanup+0x71/0x250
   device_release_driver_internal+0x41b/0x570
   unbind_store+0xd9/0x100

and unloading pps_gen-dummy while its file is open oopses:

  BUG: unable to handle page fault for address: ffffffffa0203040
  Oops: Oops: 0000 [#1] SMP KASAN NOPTI
  RIP: 0010:pps_gen_cdev_ioctl+0x372/0x580

Protect info in the ioctl handler with a mutex, and clear it under the
mutex on unregister, so that unregister waits for the ioctls using it
and later ones fail with -ENODEV. PPS_KC_BIND does the same for a
removed PPS device since commit 3649f9a6b897 ("pps: don't allow
PPS_KC_BIND on removed devices"). The sysfs attributes need nothing
new: they are removed, and their callbacks drained, before info is
cleared.

Fixes: 86b525bed275 ("drivers pps: add PPS generators support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested in the same setup, with patch 1/2 applied. After an unbind, and
    after unloading pps_gen-dummy with its file open, both ioctls return
    -ENODEV with no KASAN report, and closing the file is clean. Normal use
    of pps_gen-dummy is unchanged.

 drivers/pps/generators/pps_gen.c | 31 ++++++++++++++++++++++++++-----
 include/linux/pps_gen_kernel.h   |  2 ++
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/pps/generators/pps_gen.c b/drivers/pps/generators/pps_gen.c
index 059f4fe6c9b4..d80e28dc31dc 100644
--- a/drivers/pps/generators/pps_gen.c
+++ b/drivers/pps/generators/pps_gen.c
@@ -69,17 +69,28 @@ static long pps_gen_cdev_ioctl(struct file *file,
 		if (ret)
 			return -EFAULT;
 
-		ret = pps_gen->info->enable(pps_gen, status);
-		if (ret)
-			return ret;
-		pps_gen->enabled = status;
+		scoped_guard(mutex, &pps_gen->info_lock) {
+			if (!pps_gen->info)
+				return -ENODEV;
+
+			ret = pps_gen->info->enable(pps_gen, status);
+			if (ret)
+				return ret;
+			pps_gen->enabled = status;
+		}
 
 		break;
 
 	case PPS_GEN_USESYSTEMCLOCK:
 		dev_dbg(&pps_gen->dev, "PPS_GEN_USESYSTEMCLOCK\n");
 
-		ret = put_user(pps_gen->info->use_system_clock, uiuarg);
+		scoped_guard(mutex, &pps_gen->info_lock) {
+			if (!pps_gen->info)
+				return -ENODEV;
+			status = pps_gen->info->use_system_clock;
+		}
+
+		ret = put_user(status, uiuarg);
 		if (ret)
 			return -EFAULT;
 
@@ -212,6 +223,15 @@ static void pps_gen_unregister_cdev(struct pps_gen_device *pps_gen)
 {
 	pr_debug("unregistering pps-gen%d\n", pps_gen->id);
 	cdev_device_del(&pps_gen->cdev, &pps_gen->dev);
+
+	/*
+	 * An open file keeps pps_gen around, but the driver may free info as
+	 * soon as we return. The sysfs files are gone now, so wait for the
+	 * ioctls using info and make later ones fail.
+	 */
+	scoped_guard(mutex, &pps_gen->info_lock)
+		pps_gen->info = NULL;
+
 	put_device(&pps_gen->dev);
 }
 
@@ -243,6 +263,7 @@ struct pps_gen_device *pps_gen_register_source(const struct pps_gen_source_info
 	pps_gen->info = info;
 	pps_gen->enabled = false;
 
+	mutex_init(&pps_gen->info_lock);
 	init_waitqueue_head(&pps_gen->queue);
 	spin_lock_init(&pps_gen->lock);
 
diff --git a/include/linux/pps_gen_kernel.h b/include/linux/pps_gen_kernel.h
index f26f6aac000d..c4d22b1af118 100644
--- a/include/linux/pps_gen_kernel.h
+++ b/include/linux/pps_gen_kernel.h
@@ -11,6 +11,7 @@
 #include <linux/pps_gen.h>
 #include <linux/cdev.h>
 #include <linux/device.h>
+#include <linux/mutex.h>
 
 /*
  * Global defines
@@ -44,6 +45,7 @@ struct pps_gen_source_info {
 /* The main struct */
 struct pps_gen_device {
 	const struct pps_gen_source_info *info;	/* PSS generator info */
+	struct mutex info_lock;			/* protects info */
 	bool enabled;				/* PSS generator status */
 
 	unsigned int event;
-- 
2.55.0

