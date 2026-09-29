Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF20B524AE6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686188; cv=none; b=sT0zhV38SRu3tO/WA5+3zgqZ+eO1fKw85/9mdyw70/AJ0clYPUdNG2Megg7vZgDyBjyfSr34LmYfsqyck+/a/yN2WWNwMI+v+wkPFstP62l6hPuca79FLGZktPrnj/zoamnwA09TFAzDhdiUBUj5FNz7jrFAoxKCd1kMSasiixU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686188; c=relaxed/simple;
	bh=vAII6y+UyX853EB0stipK2/jzXEceoZeWIrSRQpr5Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gb0lfhICcRwnpvBIR6VF4USyy7c2RZhWPp+FnsqqUbHkBpR9Gf0TJ2PtY8ZgC5WVLF9MK7/aKLTwGvwG5/5sBp8OrZYjFceRETF+qcT0wuEdOTbniuBxKiOEQuZIBNZcWP4X3TMO/wTDdRFxMGHUl0exfwGjZhKz4VH0PzeSg94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVwCfBcj; arc=none smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVwCfBcj"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-81be5042c56so1838350a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790686186; x=1791290986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qz69nn016xYBQdwzZDhML9vSWViTQw4JE83CtlM57o=;
        b=JVwCfBcjiPcbvJaiqqFewjaFyOVQM0Uf7A/Nx7kdxYA2i33weiCKOuAxUPtfwDnUgs
         4CgzEbB5P13SodCChGT2u2cmttpDL8UAv7QrXFV/5aF4GCS1ZXyrft/82YTUrj98d22Y
         nYSIfuJie0pAkaJt2pEOeIw7KzNJJnaiSsZkSl4vqDnBGiZCUMlBE6u33bbqdTZaYyJi
         hlrRFfd6TZxh6RohchrZi1Tm9rQF+XAjGtl4tsdta9B0fHiVRqz2kNjcQq/OzMNR6+f6
         dshwCBgFlHKUTVXP+YQ1Z9MNfKiE3qkDnSn0i6ec8FVepWXXV3VjrGDeso7dbmUTikzO
         OXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686186; x=1791290986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3qz69nn016xYBQdwzZDhML9vSWViTQw4JE83CtlM57o=;
        b=a0m7+4zeGslVnQg9AbvVAbIimdxKquF4zeRy+Og/fAofERgaKAfZ5/99SnsQE3fPyj
         TWkpS5qOLyANukvcpj/mmszZaBCBbCd96/jYOiuYRvPqJbSka9XTu641Cf0tBUnZr1lW
         IeuN3rphqb4ydhVmfQ93zbb4GvdsuE8vtbHTd+dzx/Q0N9q3k8xIMDrFfZFUjWOTSrsN
         7C/OvjPMi3fqNWKnWGWleLTgjXVoUFBdqCkChDEwsmCCSuJTHE2e/wtmkQSW+MzaffJr
         xta9qywr8ON6BsQv7HBHCut17cpsJbQ6MQ4UEUzSnfpmNJ71572c1lGKapwQSJnsrruz
         hBjw==
X-Forwarded-Encrypted: i=1; AKwUvByLNpT2Mo8mvOOSO+y512hr+NiiX0Kxh6XnAGvVV7hkFcn1ULxxJsDGVN4HEwtlEa3a7nJkfjuNzzQk5jw=@vger.kernel.org
X-Gm-Message-State: AFuF++kroUJanDKxdCU/JcuojjP3m/6r+ZVBWt2weHV52WVko9LmwNjk
	WzWv3h56V/F4zU7Bgsr5PAxnnB7OvLw8+8mmnqw9IM6wt9X9jsyU3ur8
X-Gm-Gg: AYBFou1wlQ0vDVowoujbR5DQvNU5i/PsshNfgCZOXIqg7cDIWLVBzZna4xClLz8cAwM
	2YyCewPd2pRjIQx7Ce7hV700twC8b3cdEx80qoDTojcko45NlmEXe5NAfuhwzhohiX5SVkDzroe
	pGRSglx0ddXHS3l1Z3BQoetDuijuk3X7DALyu0/NFnG3KJ6IUumtVeBp8XjtUNUBGW4v7eNb/pe
	X/IogdQR/CCbuBvPQd+lscxb2eIdt0/+Y8INzTIfIQhmTV0NGTSQjjTdZcWlgTBQgnLIK/Meppe
	rNmxGgIdpeaKz4HNzF/iCTq75VrJhXEAMTnyq3iKPwfSbh2XMIZHnD8d2w0XpwsOP4B7YIauAIL
	O7vZgAXh4fh5JhwPHqBXPCB+n/PkSiXo4WcO1pzlXh21u4A1/pJQ9O0YsPyu56h+bQc6z/N7JZL
	rzHwqP9B1XLkqssX5AYgYUcQmGQDyKbEAecj4lktfa/HSkHllYwg7vytNeqH8WGDWidzPyOy9/S
	SEGL/YmZf0grkSaeAD6h28bD0068DOOvIN1yYyR
X-Received: by 2002:a05:6820:818b:b0:6c0:7620:fccf with SMTP id 006d021491bc7-6d5ba06420cmr11907539eaf.57.1790686185660;
        Tue, 29 Sep 2026 05:49:45 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d8830ab0d7sm6781572eaf.11.2026.09.29.05.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:49:44 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Calvin Owens <calvin@wbinvd.org>,
	Yibo Tan <lhfff@tju.edu.cn>,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/4] pps: generators: don't use the driver's info after unregister
Date: Tue, 29 Sep 2026 07:49:35 -0500
Message-ID: <20260929124937.51114-3-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929124937.51114-1-danishkhateeb03@gmail.com>
References: <20260929124937.51114-1-danishkhateeb03@gmail.com>
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
    Tested in the same setup, with patch 1/4 applied. After an unbind, and
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

