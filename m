Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E86146E00B;
	Thu, 27 Aug 2026 16:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846495; cv=none; b=OSjl+mekfU05W2V0PWq/aDVKNoWfY12rr0Ajtkab+fVYdAPA675BCw6zAJl5XAMB+jgDfHHODRuCqwBN15GIBrPSoVONOjaMmsNtJS0detWkq6vV/8pasMJ/Q+n58/HafBN49k9iEB+wls3M5T84V77fmhMOzxjnghguyGP9ho0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846495; c=relaxed/simple;
	bh=psvcIENqM3ib+o9exTVqDBxYfUhIqT3+CN4Bgi8xBwI=;
	h=Message-ID:From:To:Cc:Subject; b=MJlmtgN5FVfPBzq6MPAiaf7NUgLKLNvLm9lPdgbbH6YNb/t5Z+96bMPh0ApxaaDTdxAbxvNG9brC0//Zla4bYzmDR1S3QeYbw8suf3KBx0x2nreT8ApNDGzgxTX4RxyCa+CFXRX79/gYxenBkdX//JoiTMEj7iTVQX9tjq3mLBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ZG4LIFcb; arc=none smtp.client-ip=43.163.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ZG4LIFcb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787846481; bh=iSbbXSsZIEmVykoYpmduKfIhXEaTKa33hYcHeHMV02U=;
	h=From:To:Cc:Subject;
	b=ZG4LIFcbrElozzORC/y/zC60y3pGqa5Vk2yhgsQLN+ZVPH3bGK0fNh27PFtKda7iu
	 lgCHxhTg5FFiEPdTqce6RGLgaCQrQnqgpPqJ2+z0NmIQ6I/eOSdicgKg2tzZvqqwa/
	 y+s+E9wqLoSZBScGhWcYs66Ig6A52RFdVl3/w900=
Received: from localhost ([59.67.37.28])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 5192C71; Fri, 28 Aug 2026 00:01:17 +0800
X-QQ-mid: xmsmtpt1787846477tfv1z6p55
Message-ID: <tencent_72A978D4934F50D46D2ACFF7D70896938806@qq.com>
X-QQ-XMAILINFO: NmRjDopJZVxOX2ndgblU9/Z/Q9ob2FaUDyunUQPbYNYzdcpDVGtq/hc4aXPamk
	 EFMMz2aF0s2geYGzP6MuJqCNAJtRZ2Q235ZLNB/UY9h7SgLs5FABEkaVRQtDeaJ1krU1+MrJlTVG
	 s26QtvxMQzm7DXM86xMynSgA0/6HDXbXZADkQHqqg467q69suICaY+gafdmlGbMqxwjJposTOGZ9
	 Uij4Qi3wodf3Nr8xeB2Cyt0c8dDBluYX92NYLoTeDJV+kqErHyTUC5gSL+MbJiGpteGNbWCgUHpY
	 QjA22m5AS46TOIj7IBGSKYbDfBVf5IEz/7Gvqlvw0lb7gEq8S27GbuA9Wjg+q/ln4gh/txFJl8Bf
	 OCyurEiDlP9C1HXVXhYEloFr1ndf/nvLSDxiLi1Qx0Txb7YHWOYmt+qEVOqXK02u9vDCqk+Bqzir
	 MwTPUeS3OXWeoL8NgmGBQCcGpy1fmPBvWGNzNOERkkHutFIRy7lG85s+80msbYat4/wv4PX+OtJM
	 vlvcrO0aZs8sMtkU8xkOM5XLgHY8EOhsDvoz660YJi9v/Ir418JB3EBsqDae9scwzHFcXoCRX6IT
	 TnaMNyN06XBeqi740Q5tlEF0BDYsS8vMu+QrG18hY5fShCfnKxIHEhtG4xxQ6XwGrZ9OJHvzrWhN
	 TjgMoTKl86w/RDYmfz5ftF/6G7etThJRHkQfpbB1EO8+cmx3+07sC3tPa7cs+qewGGUCwhJPNqyR
	 CB2IaVdPss23/Dyo7o2jQC2Fe/bTM4+KR2sOUDhe8FbE7ZNdOgNbG+M8HbFq6UgYnCgcyHRX7jcY
	 uH3Yh/C6QsvXKrBJr595t/5d3X0XeZDgeLEWlrBFVv6S3Y0BO94c0Ekb8I+gUxfRrbZWIfm0Kjj7
	 L+08SMr47z316W8q0nGGUKO0rYE8QvZsgtVMaAR/dAYSMLFXr2177oXJM/G+zNPaVeSm9IYD1Mg3
	 H3VaZYy1assdRkXxqaRletcDlZgXaU+tuANjdu8+2mfpnmgkFsKEHEdWDYjvsvQAs9dcrw8dOBv6
	 4EX7s3We9+peTdnAV/PTo2dhEJlEA=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Guikun Yang <2855020996@qq.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
    Hans Verkuil <hverkuil+cisco@kernel.org>,
    linux-media@vger.kernel.org
Cc: Yun Zhou <yun.zhou@windriver.com>,
    Yousef Alhouseen <alhouseenyousef@gmail.com>,
    Edward Adam Davis <eadavis@qq.com>,
    Dan Carpenter <error27@gmail.com>,
    Kees Cook <kees@kernel.org>,
    Ricardo Ribalda <ribalda@chromium.org>,
    linux-kernel@vger.kernel.org,
    syzbot+1eb177ecc3943b883f0a@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] media: dvb-core: fix use-after-free in dvb_frontend_open
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

In-Reply-To: <1c0aa133-b44b-4cca-91cd-82a80769b494@windriver.com>
References: <1c0aa133-b44b-4cca-91cd-82a80769b494@windriver.com>

Hi Yun, all,

Continuing this thread: the v3 series (and the related "avoid dropping
device ref" / "pin frontend device" attempts from June) has not been
merged as of v7.3-rc1 -- I confirmed dvb_frontend_open() still calls
dvb_generic_release() on its err2 path in mainline today, and the
underlying bug is still live (syzbot hit it again on 2026/08).

I'd like to propose an alternative fix that I believe is more robust,
with fault-injection reproduction on 7.2-rc7 / 7.3-rc1.

Root cause
----------
dvb_device_open() takes one device reference for the file and drops it
itself when ->open() fails (a2dd235df435).  dvb_frontend_open() undoes
the users/readers/writers accounting of dvb_generic_open() on its error
paths by calling dvb_generic_release().  But dvb_generic_release() also
drops the file's device reference, so on a frontend open failure the
same reference is dropped twice:

  dvb_device_open()                dvb_frontend_open()
  ------------------------------   ---------------------------------
  dvb_device_get()          ref+1
  file->f_op->open()
                                   dvb_generic_open()
                                   err3: dvb_frontend_start() fails
                                         (e.g. -ENOMEM)
                                   err2: dvb_generic_release()  ref-1
  err != 0
  dvb_device_put()          ref-1

The extra put can drop the last reference and free the device while it
is still registered in dvb_minors[], so a subsequent open() dereferences
freed memory (KASAN: slab-use-after-free in dvb_device_open, syzbot
extid 1eb177ecc3943b883f0a, first reported 2024/12).

Why a different approach
------------------------
Previous proposals (v1-v3 in this thread, plus the June patches)
balance the counters around dvb_generic_release() -- e.g. incrementing
the refcount before the call so the put inside it nets out, or restoring
users/writers/readers by hand.  That works, but it keeps the subtle
coupling: dvb_generic_release() still has the side effect of dropping
the device reference, which is only correct on a successful open.

This patch instead splits that single responsibility out: the counter
restore becomes dvb_generic_open_undo(), which does NOT touch the
device reference, and dvb_frontend_open() uses it on its error paths.
The reference remains owned and released by dvb_device_open().  This
makes the ownership explicit and removes the class of double-put bugs
for every future ->open implementation, not just the frontend.

Verification
------------
syzbot reproducer (open of /dev/dvb/adapter0/frontend0 with fail_nth: 8,
failing the kthread allocation in dvb_frontend_start()):
  * unpatched 7.2-rc7: reproduces the KASAN UAF within seconds
  * patched: survives 90s of continuous fault-injected opens, zero
    KASAN / refcount warnings; FAULT_INJECTION traces confirm the error
    path is exercised each time

Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
Cc: stable@vger.kernel.org
Reported-by: syzbot+1eb177ecc3943b883f0a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1eb177ecc3943b883f0a
Tested-by: Guikun Yang <2855020996@qq.com>
Signed-off-by: Guikun Yang <2855020996@qq.com>
---
 drivers/media/dvb-core/dvb_frontend.c |  6 +++++-
 drivers/media/dvb-core/dvbdev.c       | 29 +++++++++++++++++++++++++++++
 include/media/dvbdev.h                | 11 +++++++++++
 3 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index d082b6c57c76..5ef7756c3413 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -2887,7 +2887,11 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 	mutex_unlock(&fe->dvb->mdev_lock);
 err2:
 #endif
-	dvb_generic_release(inode, file);
+	/*
+	 * Undo dvb_generic_open() only: the file's device reference is
+	 * dropped by dvb_device_open() when this open fails.
+	 */
+	dvb_generic_open_undo(file);
 err1:
 	if (dvbdev->users == -1 && fe->ops.ts_bus_ctrl)
 		fe->ops.ts_bus_ctrl(fe, 0);
diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index d753d329502a..8623df718ea0 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -172,6 +172,35 @@ int dvb_generic_release(struct inode *inode, struct file *file)
 }
 EXPORT_SYMBOL(dvb_generic_release);
 
+/**
+ * dvb_generic_open_undo - undo dvb_generic_open() on a failed ->open
+ *
+ * @file: pointer to &struct file.
+ *
+ * Restores the users/readers/writers accounting done by
+ * dvb_generic_open(), without dropping the file's device reference:
+ * that reference is taken by dvb_device_open(), which also releases
+ * it when ->open fails.  Using dvb_generic_release() on an error path
+ * of an ->open implementation would therefore drop the reference
+ * twice and could free a device that is still registered in
+ * dvb_minors[].
+ */
+void dvb_generic_open_undo(struct file *file)
+{
+	struct dvb_device *dvbdev = file->private_data;
+
+	if (!dvbdev)
+		return;
+
+	if ((file->f_flags & O_ACCMODE) == O_RDONLY)
+		dvbdev->readers++;
+	else
+		dvbdev->writers++;
+
+	dvbdev->users++;
+}
+EXPORT_SYMBOL(dvb_generic_open_undo);
+
 long dvb_generic_ioctl(struct file *file,
 		       unsigned int cmd, unsigned long arg)
 {
diff --git a/include/media/dvbdev.h b/include/media/dvbdev.h
index e5a00d126612..a32998afd804 100644
--- a/include/media/dvbdev.h
+++ b/include/media/dvbdev.h
@@ -354,6 +354,17 @@ int dvb_generic_open(struct inode *inode, struct file *file);
  */
 int dvb_generic_release(struct inode *inode, struct file *file);
 
+/**
+ * dvb_generic_open_undo - undo dvb_generic_open() on a failed ->open
+ *
+ * @file: pointer to &struct file.
+ *
+ * Restores the users/readers/writers accounting done by
+ * dvb_generic_open() without dropping the file's device reference,
+ * which dvb_device_open() releases itself when ->open fails.
+ */
+void dvb_generic_open_undo(struct file *file);
+
 /**
  * dvb_generic_ioctl - Digital TV close function, used by DVB devices
  *
-- 
2.0.0

