Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA482DA749
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789845794; cv=none; b=TIQj5zokOqnZ++UhBLRzidT+nTHY6ANci/tzhe9EBrSqsbm3ULdDGZ2XERZ37JrOAA8x3NBByrOWRG/SyIANSOoG+olYIeeBzKeGpm3An/6vo6zHNxEEwfbQ48GESqiUXWuy+SBmy+x8qQCEPmyu4eQ7lR2GZ/t7p2OUWapTWPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789845794; c=relaxed/simple;
	bh=HkwdYYavoCzUVmVDYA0u9dAUtzhuUn5NkLCIprEbhSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CC1CAJIfz9borVff2Vq5P/Z4kEP4G/SpwE1Y4G/dlhpzvFCaspT53ofkAvQWJ/1S4w67noewoQSxldf7rQfWNwQtMOOBZM8pCitV2gSjEjYpWw6k3foM7CXRp0yMHAbL6qe+/U5JiGFPsa2Ri5Ak+LbiziDG8e31UqrF0f9U63I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4KlA0Zv; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4KlA0Zv"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so5529895e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789845792; x=1790450592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hZ7hjSvC4JR794fg8Wgo8xaMKU0Sd4wen0Z8CCJoqUI=;
        b=D4KlA0ZvCt63M1vppDzspYjOMTFAwxLRbGEXyQU4hmPD6jV5YT1wDG3a927YTZxcFW
         wdzyForZc1vsWf5Ry86+gi+k7H90L/fpgDL6s6RppX3jio3H20fNJAbPSrZqeE0ct75Z
         mKo+LTqiPViOCalr6axEPj5x/gnb2CrNmiFF9j4W84+ltm4MnBiEPVSDC/X5wfFKnafc
         rX4+VIm6JRIWwdlB11nHnEW6LftyjBQeNlTDHeRjGB4hqxohYIYHORf61Vnu1bMe/7ou
         a6xwLVimCKCutqNITyVC4usZSmBLQHihuifYRUSv60VQ4of2k0BBfyQYGXc9pTtClraT
         EaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789845792; x=1790450592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hZ7hjSvC4JR794fg8Wgo8xaMKU0Sd4wen0Z8CCJoqUI=;
        b=UV0NFCHJ4ecHiHAVfYeuCW2In2tAM8wQFx99kTZexcGSK7jB+E6F1BdrbBKVSgYne9
         r9nDdnlNxtj8ylXA/Wa+/aZzdkdaGZhwlWsA3zhahFdmfy/BoxP+gtwU36+7S/BfPFEG
         7l9DHXk0W+UOwYDeqzybY4tGMybYE99WNXRiOLTYoYMKVm+tR4PF6Dh1WSfBcePjcjBn
         IkoWzqWasdWeT93sWIqs3yYvQBuT1POBRIJiTyB9odA2Q408nZwJgyAFGqVxF5S9+iYW
         +eva6ThHhIk/K1+L+LZfW15S/WsRUZ7GqxzJUTkkqcr1Fq7ngUwkPA6LQjcwE69P8fnw
         kA9A==
X-Forwarded-Encrypted: i=1; AKwUvBx0CqidRRjYPo1H1BEVQ2hPeEM/trD87vSY0lsP4ZSg8tMroUOUY7PGSZoKG4RfrDpMd9xIwwL7tE4abYI=@vger.kernel.org
X-Gm-Message-State: AFuF++nHWh/NNyl9x9QwkfEvpKblcWG5Kr0SvF0rXC2mS0Cf9I5W4lNg
	dizFXW+C22BdRKMzkeF5SX6oH084twDFyB7tCz9AyNPVEu3LgIPVg4kB
X-Gm-Gg: AYBFou14EJDz+phMPMVcFSZjaI1oEAiKGLBnBWCET44faCGo73q4EJjK6Nl/Q+E775d
	hB50kDC9mY9/pnOkzzkYpIP2eMOj7D7aNRdPrpSCX5yTVy4E+zguz2N16G732/MetDhPhmYDZ+n
	fr8s+HptMQ8SKIUWtLJ+aL61EdJItyEQXZTYtGHsO+E1L3i8IbBEP6zBTyoQvYSstx3jxAU8908
	dKLag4FtEUpj0CCvIryd3bLuWqh00Htapa/3i1IfcNuvXUjwOsDjSRpLCVsloz3kE6VacdNdHnb
	DvIBjOKgcHcwHzJjkJU7wk9Gac4c23vseXzoTxbROwkdGd0GzA+5XnJgadugLaZnnx56tGPTfFb
	Yhg4L6Km/PFIWoL83+FUzd/V080aqYqIt995rIjHAe/KiPE7UjSp4hxDDq+/DBaoo1Xy0BmEVrC
	kUje9/w9XGGjaxZsdfq3UG7DB3gaRO9QvBjGva+mr5opfUiPh/ub5crUzfxrXvzbByauMITTnAC
	fMderm9800OBFJCO40xSMh79v4qlPHhgDtUwQi3UZnDr7Y7hwo=
X-Received: by 2002:a05:600c:310d:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-49fc4f85891mr103323205e9.5.1789845791767;
        Sat, 19 Sep 2026 12:23:11 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0f7b9bsm93535485e9.5.2026.09.19.12.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 12:23:11 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	davem@davemloft.net,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH] watchdog: cpwd: serialize device access against cpwd_remove()
Date: Sun, 20 Sep 2026 00:23:01 +0500
Message-ID: <20260919192301.272194-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpwd_open(), cpwd_ioctl() and cpwd_write() all read the global
cpwd_device pointer directly, while cpwd_remove() unmaps p->regs and
then sets cpwd_device = NULL with no locking shared with those paths.
misc_deregister() does not revoke file descriptors that are already
open, so a process holding one across an unbind/remove can still
reach cpwd_ioctl()/cpwd_write() afterwards: it will either dereference
p->regs after of_iounmap() has torn it down, or run into a NULL p once
cpwd_device has been cleared.

Take the existing cpwd_mutex around the whole of cpwd_remove()'s
teardown, and have cpwd_open()/cpwd_ioctl()/cpwd_write() re-read
cpwd_device under the same mutex and bail out with -ENODEV when it is
NULL. This makes any in-flight call finish (or fail cleanly) strictly
before or after teardown, instead of racing it.

Fixes: 8ab0dc333eac ("cpwatchdog: Move to drivers/watchdog/cpwd.c")
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/watchdog/cpwd.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/cpwd.c b/drivers/watchdog/cpwd.c
index 13a4d47e68cd..48f5e92b8cbd 100644
--- a/drivers/watchdog/cpwd.c
+++ b/drivers/watchdog/cpwd.c
@@ -368,9 +368,14 @@ static irqreturn_t cpwd_interrupt(int irq, void *dev_id)
 
 static int cpwd_open(struct inode *inode, struct file *f)
 {
-	struct cpwd *p = cpwd_device;
+	struct cpwd *p;
+
+	guard(mutex)(&cpwd_mutex);
+
+	p = cpwd_device;
+	if (!p)
+		return -ENODEV;
 
-	mutex_lock(&cpwd_mutex);
 	switch (iminor(inode)) {
 	case WD0_MINOR:
 	case WD1_MINOR:
@@ -378,7 +383,6 @@ static int cpwd_open(struct inode *inode, struct file *f)
 		break;
 
 	default:
-		mutex_unlock(&cpwd_mutex);
 		return -ENODEV;
 	}
 
@@ -387,14 +391,11 @@ static int cpwd_open(struct inode *inode, struct file *f)
 		if (request_irq(p->irq, &cpwd_interrupt,
 				IRQF_SHARED, DRIVER_NAME, p)) {
 			pr_err("Cannot register IRQ %d\n", p->irq);
-			mutex_unlock(&cpwd_mutex);
 			return -EBUSY;
 		}
 		p->initialized = true;
 	}
 
-	mutex_unlock(&cpwd_mutex);
-
 	return stream_open(inode, f);
 }
 
@@ -413,9 +414,15 @@ static long cpwd_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	void __user *argp = (void __user *)arg;
 	struct inode *inode = file_inode(file);
 	int index = iminor(inode) - WD0_MINOR;
-	struct cpwd *p = cpwd_device;
+	struct cpwd *p;
 	int setopt = 0;
 
+	guard(mutex)(&cpwd_mutex);
+
+	p = cpwd_device;
+	if (!p)
+		return -ENODEV;
+
 	switch (cmd) {
 	/* Generic Linux IOCTLs */
 	case WDIOC_GETSUPPORT:
@@ -482,8 +489,14 @@ static ssize_t cpwd_write(struct file *file, const char __user *buf,
 			  size_t count, loff_t *ppos)
 {
 	struct inode *inode = file_inode(file);
-	struct cpwd *p = cpwd_device;
 	int index = iminor(inode);
+	struct cpwd *p;
+
+	guard(mutex)(&cpwd_mutex);
+
+	p = cpwd_device;
+	if (!p)
+		return -ENODEV;
 
 	if (count) {
 		cpwd_pingtimer(p, index);
@@ -618,6 +631,8 @@ static void cpwd_remove(struct platform_device *op)
 	struct cpwd *p = platform_get_drvdata(op);
 	int i;
 
+	guard(mutex)(&cpwd_mutex);
+
 	for (i = 0; i < WD_NUMDEVS; i++) {
 		misc_deregister(&p->devs[i].misc);
 
-- 
2.55.0

