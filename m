Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D9F49D5B8
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791638863; cv=none; b=lBIj+8yFUAspZksXe6FCodFcJQ/4ByAqAQGWkm0+5G4GFmm01SxD6XnY1CsyA/krjiGwsmYKFbE5pdhoFl7dWdfo3uX5FB2AuR0ZTCF99enW0RDfCkrsDX5TGrgGGw2d/qUJZ1dQ4sq7P2OocfQ7JBJRbM60Zctu8G/9DnMXoP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791638863; c=relaxed/simple;
	bh=mtxITmcWvc3yGWXuvwVSycVUTwppjDUjTMGMhK5QZoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KMd4kvZg6NxoGoqHDEV/y312uXT3/amigc8MZAeqc5zBVnH6k/nnIKhTWlxLHBTelj8oJ2OOd5B/KglVpMMo2LNsdMu20gVB/bUuR2MWfL4gT5xchu4XnfmGaDD5oQrWPnoxdgGUxJFjQKEyC/qsinv+vKnC+XW9YCR/u/3LZ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso6401745e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791638860; x=1792243660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BP0D00lIkZpItx8yyC8l4SZFagNyd56ZgQAemQMRUvc=;
        b=yvLNKl5JcxGmpwyGqJ5n56va0eiK9HmfgZ1ldpgBiBgMyYNTDGeMamDsJYOKNhL//m
         qzSLPLUWCu//qiDr0urcO3b0DWHsMgmBRGMyjU7pT3Wxax0/pz6NJvW3iZOZfK7OgZnV
         h6nuxVPpXP8lqfaYyIEMlLXdjBDdPwIQkd2gDdsvIpmOB40sx+bP+9UgxOnt+u8MB1am
         I0d9ZFrh1xDQKH21lvGSlILblq2TrcorTxwQSDQZ2grW1VpsYdU4KBjlR5wdDxMg1ZWT
         0ocVLq1uzVh0CFLXatmF2h3zNjDdfocS4bkDPZB0AWZqfbW13ZJSRCqqS9PZKfOe8mEr
         /XNw==
X-Gm-Message-State: AFq9FYIEXv2OjHq90aQlYpdHtPMaofnMGUPmnovSLNLSJ8ZOSHRB8WHO
	j1gDy0tNmfUlYMgk5zZY+FJb+Kgt/jia6uFXBj4EaxuZ9x5jWTNOn+pj
X-Gm-Gg: AYBFou0c/+YPbblpbnH9O2xyG+DhZu5+CRpIQYTjMjh0FyYMDY1brnc4km4B1KwvNf1
	C16YCL2H6l+86ne3HBVfkDJEQvwlNNR1jV82yr3At0fZrwGafdZDEiDwTlMv+CdzNHJaUaHYhvq
	YXxD1wgx3QI6Xhu5lLaD+u/iCOQYJdYvOP4JXa8Xw5k/wYuqIN2mxU38u/Uc3QEVzCQNRX2kq+X
	AvltHRPMYUj59jk58iL1fQ+x0Zx6sIqmt01KtuZI95gQYUslYnvPret65EM9I6c2MOrixrLE4aX
	I6rfD5Po8SKIsORihgQ5FoBd4vmWWmpbY+F1p1XLCkZzKPl2KqC2gk7u8MUUzUfDpCZs/94Er+5
	2Aq31nz034/Kx1u3/Mj702UGuOjo5r5UrPfCgdlc1CytB3H7OdT6Rhnu9nz+ELs1nOMayTjEf6p
	k80Njish9+GmKZ9ZhCkEDlPq9wWCDp1e+ZJNYjnmvxmo2VSc+LxaDNztc/v8Mkk3veMDOYmg96R
	roTLn1SeStO3XC/Wdw1O+kQu1g=
X-Received: by 2002:a05:600d:6413:10b0:4a1:88d7:4e6a with SMTP id 5b1f17b1804b1-4a19470eccamr21770965e9.27.1791638859558;
        Sat, 10 Oct 2026 06:27:39 -0700 (PDT)
Received: from white (bba-217-165-185-173.alshamil.net.ae. [217.165.185.173])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e33c7sm9648731f8f.10.2026.10.10.06.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:27:39 -0700 (PDT)
From: "Denis Efremov (Oracle)" <efremov@linux.com>
To: linux-block@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Denis Efremov (Oracle)" <efremov@linux.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] floppy: register the block major after the disks are added
Date: Sat, 10 Oct 2026 17:27:05 +0400
Message-ID: <20261010132705.1693690-1-efremov@linux.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_floppy_init() registers the block major, and with it floppy_probe(),
before it has detected the controllers and added disks[drive][0]. Once
a controller is found, opening a device node for another media format
makes floppy_probe() add disks[drive][type]. If init then fails, the
error path removes only disks[drive][0] and frees the tag sets, leaving
the probed disks registered on top of freed memory.

add_disk() does not need the major, so register it last. floppy_probe()
can then only run once init has succeeded.

Fixes: 302cfee15029 ("floppy: use a separate gendisk for each media format")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260708105703.747262-1-lgs201920130244%40gmail.com
Signed-off-by: Denis Efremov (Oracle) <efremov@linux.com>
---
 drivers/block/floppy.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index f04397b8e381..23a7a0fa76f6 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -4602,13 +4602,9 @@ static int __init do_floppy_init(void)
 		timer_setup(&motor_off_timer[drive], motor_off_callback, 0);
 	}
 
-	err = __register_blkdev(FLOPPY_MAJOR, "fd", floppy_probe);
-	if (err)
-		goto out_put_disk;
-
 	err = platform_driver_register(&floppy_driver);
 	if (err)
-		goto out_unreg_blkdev;
+		goto out_put_disk;
 
 	for (i = 0; i < 256; i++)
 		if (ITYPE(i))
@@ -4733,6 +4729,14 @@ static int __init do_floppy_init(void)
 			goto out_remove_drives;
 	}
 
+	/*
+	 * Register last: floppy_probe() adds disks for the other formats,
+	 * which the error path below does not remove.
+	 */
+	err = __register_blkdev(FLOPPY_MAJOR, "fd", floppy_probe);
+	if (err)
+		goto out_remove_drives;
+
 	return 0;
 
 out_remove_drives:
@@ -4748,8 +4752,6 @@ static int __init do_floppy_init(void)
 		floppy_release_irq_and_dma();
 out_unreg_driver:
 	platform_driver_unregister(&floppy_driver);
-out_unreg_blkdev:
-	unregister_blkdev(FLOPPY_MAJOR, "fd");
 out_put_disk:
 	destroy_workqueue(floppy_wq);
 	for (drive = 0; drive < N_DRIVE; drive++) {

base-commit: 3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0
-- 
2.56.0

