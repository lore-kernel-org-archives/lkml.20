Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EBA3E3141
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792246541; cv=none; b=nzSKKJsBmMxZ3einPiV/1NnwaK92pX9EnPL3XkLyinGmX3I04DM5NdTQCiljReYHomhdexUXXVxLX3l2w6+HloRkm9loVXPd0zmZzX1TyojmHSzEnICDSddGJIbhJCrzOgh9uhjfSfygGLYnCqYzsU8tHblw+xGp2ziXg3kTarg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792246541; c=relaxed/simple;
	bh=uIwc3JfVPiUNtfTlvP2owlQjEF1XVRi8hcV46UVHY1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M44ET2ZioklyeqDvdNzhtg9xkU7e2Wlp4INmf58mlXssyn6/nqbfSuInaNfrTYXPcA43I+ENxQMeRUPoZpmW4GPFoWLrQ/DruN/EqmuZAvKoAptJcokfibdRMwA3MjmxQY3FfdASA02ZsmTJmOWaM+fLdqOpNh7Z7nGe9xK09VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pxYvmNwt; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pxYvmNwt"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab41538192so691909a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792246539; x=1792851339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XnA3VMBB1IhUUOmUvzPAdGg7gVxpW4JiO55uuDXxAdc=;
        b=pxYvmNwtsQgupEwCnuhVrpsqmUvFQyV/JZyJqLiazGf6l0WL3ssdIBFoZv+FQpZdDT
         kjHUknJJTMzMPR3D1Ox6t8uoc/pNLI/ldsFE+QYJFjQilSYds5PRzpRTmxX/RSfLFi+n
         SX9yKOe7N4m0+MgIsKfbQzUz2kBQJCSnMeYUbp9VF56MM/6PAggKAa55jh69VYSo5q4O
         hDMZLmRXIjzfTuDbVjdqYchK6ZDEAVLfYeBRzqjUiwrcARtP8xVvYhxnIOaONFzDI9WD
         xnSRNozzSo8Xk7XjJbxMaeWS1Ueil9F6g8+o/ZQqPHKNMdxfajq2Fj8PueGNay/lgHT0
         xVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792246539; x=1792851339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XnA3VMBB1IhUUOmUvzPAdGg7gVxpW4JiO55uuDXxAdc=;
        b=X1BkSp2RTvl38n0UG5yicWDdomVC0sKLoASBli6cKdkrwglIo/RWG6R7Iq2grF2wYj
         dd6pcE8Q7DZkgFw4DH3tu+B+iial+e9KUUnNNBx9Ue89YhsnwtecuZGcRu3xwaD/z/DI
         7t+lp0841p5upXK6LRFgWwbAaSw5QQ30KBTUxT6mSw+IBpCUeSi5f6jfddG3HE/uSGR5
         /rC5DOcXTUCXyWcYCe89A+7zYG8z+xgGgc8u9Le0k0CaiNjL6xLgIsUG5PwACcWaymzM
         fScQ8ew9hPTMTjOtP7Q6WDKG+TC+mHdCwrEbmmMGPB8/CN6b1kT4kVg9OjuHj5buYIqr
         rmCw==
X-Forwarded-Encrypted: i=1; AKwUvBw73byhTGZtz62tkPHtqkpAnaLWGPel07xjymw6avmncyA08LotEXdEkWv8Jg/lxnoOqst2Hst0m3p6f4E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMQSDD9LsasNjw5AEh1etyZggz48qnsb/KY1FOiMYvIWYfUF/0
	158WZrJiJR1msMYwEIKiUCueD2EheRmtZ7RJ1Zx0Wc/zf8f/Xcdvi3Gay1ULx5Eu
X-Gm-Gg: AYBFou2s6L5ccH4qWqulgcUNhGvwipRalH2Cun+lC6bLecjR65WOoCdsn8jKiCeu55W
	Wzw1mkkekESGP4lD2xUBsXkVwdPg6rMhpsrBSFHdA/jg+gbPl1qijWprctwl9OKUddh1KmRTgKz
	624GNnF/0VKSIZslleOm5NZmhkpU2PyC2iss6CZtMaT/G7fLcdReHTfRCHuPclW3Lfo59F/1D1i
	Fma/GGTnFbDrO8QlbxjzL/eJBk9D114clSUC7qn4H1nWyYYenwv+EU9PBv7PEVjYh4j08aFZnER
	GaZ61nci+tNZGVBZF8aW997S8RPzFR/uhClceEGF3j6253MjPo5blld7XH1EILSun5WhRmEuyWI
	kKADcAiAWmaETWcUqo1ZADV2mwTuOKG6BUCEwEUo7S9fYE28w0ebmEla2Orxi1yHXiTLRt8QkYX
	NvhTKkMtjIJCTLBUcpQSA4gN9SNK59mSH7cJ/kzDg6kcG6dsffvv6Y2YgmfOTD2hcBq9EqQ7SNS
	xeHyr8GPNk=
X-Received: by 2002:a17:90a:c10e:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3acef10a76emr2602492a91.58.1792246538586;
        Sat, 17 Oct 2026 07:15:38 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947cf9a5sm13320990a91.15.2026.10.17.07.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:15:37 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com
Cc: namjain@linux.microsoft.com,
	mhklinux@outlook.com,
	ssengar@linux.microsoft.com,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mshv_vtl: detach poll waiter on POLLFREE
Date: Sat, 17 Oct 2026 23:15:27 +0900
Message-ID: <20261017141527.623376-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MSHV_SET_POLL_FILE keeps a poll wait entry after the ioctl returns. A
file reference does not always pin the registered waitqueue:
signalfd_poll() uses current->sighand->signalfd_wqh, whose lifetime is
tied to the task.

signalfd_cleanup() sends POLLFREE before the sighand is freed. The MSHV
callback currently leaves its entry linked, so __wake_up_pollfree()
warns and a later replacement calls remove_wait_queue() through a stale
wqh pointer. A source-equivalent KASAN run reproduced:

  BUG: KASAN: slab-use-after-free in _raw_spin_lock_irqsave
  _raw_spin_lock_irqsave
  remove_wait_queue
  harness_ioctl [mshv_pollfree_harness]

The object belonged to sighand_cache and had been released through
slab_free_after_rcu_debug() after __cleanup_sighand().

On POLLFREE, unlink the entry under the provider waitqueue lock. Preserve
the existing CPU cancellation before publishing a NULL wqh, since a NULL
load lets a racing replacement reuse the persistent poll state. Use a
matching acquire load under RCU when removing a normal registration.

The callback takes no mutex and does not sleep, so the existing
mutex-to-waitqueue-lock order is unchanged.

Fixes: 7bfe3b8ea6e3 ("Drivers: hv: Introduce mshv_vtl driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 drivers/hv/mshv_vtl_main.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/hv/mshv_vtl_main.c b/drivers/hv/mshv_vtl_main.c
index d8225242c73f8..c6f1e2157d258 100644
--- a/drivers/hv/mshv_vtl_main.c
+++ b/drivers/hv/mshv_vtl_main.c
@@ -17,6 +17,7 @@
 #include <linux/entry-virt.h>
 #include <linux/eventfd.h>
 #include <linux/poll.h>
+#include <linux/rcupdate.h>
 #include <linux/file.h>
 #include <linux/vmalloc.h>
 #include <asm/debugreg.h>
@@ -448,12 +449,35 @@ static void mshv_vtl_cancel(int cpu)
 static int mshv_vtl_poll_file_wake(wait_queue_entry_t *wait, unsigned int mode, int sync, void *key)
 {
 	struct mshv_vtl_poll_file *poll_file = container_of(wait, struct mshv_vtl_poll_file, wait);
+	__poll_t pollflags = key_to_poll(key);
+
+	if (pollflags & POLLFREE)
+		list_del_init(&wait->entry);
 
 	mshv_vtl_cancel(poll_file->cpu);
 
+	if (pollflags & POLLFREE) {
+		/* Publish teardown last; pair with acquire in the removal path. */
+		smp_store_release(&poll_file->wqh, NULL);
+	}
+
 	return 0;
 }
 
+static void mshv_vtl_poll_file_remove_wait_queue(struct mshv_vtl_poll_file *poll_file)
+{
+	wait_queue_head_t *wqh;
+
+	/* POLLFREE providers RCU-delay the waitqueue free. */
+	rcu_read_lock();
+	/* Pair with the release store in the POLLFREE callback. */
+	wqh = smp_load_acquire(&poll_file->wqh);
+	if (wqh)
+		remove_wait_queue(wqh, &poll_file->wait);
+	rcu_read_unlock();
+	WRITE_ONCE(poll_file->wqh, NULL);
+}
+
 static void mshv_vtl_ptable_queue_proc(struct file *file, wait_queue_head_t *wqh, poll_table *pt)
 {
 	struct mshv_vtl_poll_file *poll_file = container_of(pt, struct mshv_vtl_poll_file, pt);
@@ -490,9 +514,7 @@ static int mshv_vtl_ioctl_set_poll_file(struct mshv_vtl_set_poll_file __user *us
 
 	mutex_lock(&mshv_vtl_poll_file_lock);
 
-	if (poll_file->wqh)
-		remove_wait_queue(poll_file->wqh, &poll_file->wait);
-	poll_file->wqh = NULL;
+	mshv_vtl_poll_file_remove_wait_queue(poll_file);
 
 	old_file = poll_file->file;
 	poll_file->file = file;
