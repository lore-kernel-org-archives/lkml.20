Received: from mail-pj2-f20.google.com (mail-pj2-f20.google.com [74.125.227.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B623B19B2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147435; cv=none; b=NfUV1WDUM0/6I0sum7ELuk/81qUNhdWGvaQ6d2CEywRg0aHVvpuVbfJB/hQmIhAbK/CtySViFQXikCMplvdlzPJ0GO2DpsZLvPx/IXkUwoqWQ8E3H3WnitCr3chfXOQLhbI1WPAbFKrkbIKRM7CBG/Yw5lDtsrzQyLdiMF6IbYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147435; c=relaxed/simple;
	bh=9dg2MuEApLd5vJbGRfjxXvMwVsMiU9DcZ4Ug20VxgO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UvF9lm8gyFGjg5yHOeB8VO6EKeMoHoLTDAk4wCUisZYwQZvtmIMPBxK1rtaCQF9QNGwp0I2VO6mQiBq7ucBDP9enIDjcQtQmYY8xwkx4oDu06x2jpzjp1FLVgU+b8UU2yVsdtZiNrN04o6/JZls1gnZ8fquzf6m5FwxU4fEA9eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRSyL2xK; arc=none smtp.client-ip=74.125.227.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRSyL2xK"
Received: by mail-pj2-f20.google.com with SMTP id d9443c01a7336-2d747ed9866so4270775ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790147429; x=1790752229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9uoLJc0EMzZ+qvudAuQdqIiTluJpwC41BwKPw8x2Pg=;
        b=cRSyL2xKghH2ToPmdWZcQvBifz4Sea1PqiAqCHEY51O7UTADgrRPRxeljmO53IkIsQ
         BkhwaiJRjihbA8JxWsQEJOQbQGF7tuzgKcXiLhZfOV0+XCQHiK5EYMpczMhtX1+bpUim
         q5BZcDRK8rNDYZeMGSBXmM0O6gQYq4sKLx4hpDrAaJ87SPuWzssDQp2eB4Kxso5tJNsW
         yIdt5Rbu8s9fIgp30C0ECYPeZ7z93Dg3vA1v0k6HiwWqdcksi6vhl7vPyFMjrJ7CMot0
         DQMAGmeegmxNRdRiTYaph/KkN4EKYpiiScYmw+fxPjADJMjgxlFIMjUvQUmIIx8kV8Nj
         13xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790147429; x=1790752229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9uoLJc0EMzZ+qvudAuQdqIiTluJpwC41BwKPw8x2Pg=;
        b=w2r6qLZDrZuyZLGYYF1ZfXb+bzdhSMZSBoyPOAaQoS2Kd3OJJDxp1dJKT0MAAGK/59
         9bxIFbMep2jsvuIuWJFdYBO46I9ES/m6Ixf4VpsQjpygFk5SLMrQwb7E+EGFw56OsDSy
         NeKn211RFumkeeLA0nyB6yzRWjvf2WFlyytY5zzgZ3dlWb69dFFtnRvoHhPPw+pZVAfQ
         k6t+gJFtc266BkRyjdOirr7sKhCgsGmWF/M7SkT25dEt69jLD+HGXaY+oRKWaAfEgJtW
         bzzPKv6XSyKf3bzKhERUbO1C/F79etrP1ZU9zLKFXdiJ0pCcr9Io4QJUHjjzdZOXa9jw
         /dxw==
X-Forwarded-Encrypted: i=1; AKwUvBw2M1Wpfwxx+5OSsioHLUGsYtimrfL4BFyEoAouX5tY5B4dFNPDzTVd9yD+z83cWzkJiMf9PKs54BbwC2c=@vger.kernel.org
X-Gm-Message-State: AFuF++nNKeFUDK/AFOkSbkXqqID6QGxr8Xh/iw3NX9NeWHyJ3+3IBHsQ
	GCGx0I3Sr41QZqkgfu+qjICKbY1TEYBEDFuliKSZDrp5j1mINsYdySvq
X-Gm-Gg: AYBFou3F6i7qdhCljMmfQoUVoTZp2cVssEtlQ+LuZWWms88JBRrf0tRL9CWAcQ5/tqT
	jGRDqgQK49iS6i+hZ0rzqMzpFkO6PVzKVIURkRG1eTS2fAyulHSp8M+DRQb0H4YWJQ0A4Jz/Jcd
	S3yOqFmfb3ObnnYtGkF/m4lc3E9GPtimOT/LWvrt8c4OTdBLxk1bX3JM8lD8QlgU+G2w7h+uLNH
	sDIYFEQkFp1oltxmoLIaRHViF4hS+uDx3fp9D5pmpK6BnYgkZiB2oQqAt+w/yfDaHL3aKCY7QYn
	5Q9U4ZmzL0JEZE5kJ+Xi52/PofDOo5J90FJfptfV77ldGtJ+Lbz4/kKdp+MftcC+Cwn32zYY+sc
	kpFf6ilP8bBEi6hl2sZxsUk89fVWWiCA4hxLORecpP9jwKfxnIX0eO6UXvnOM25YY9W6pA3Gyzp
	wXDbaUE1BQucDRfPQABq72cd5ZmNgnXswjBo3f+xGNSoeLvVCr6PJTM3wHb39qnhPmFQS7uyMCJ
	WnIakp2BrjFblsbwpKTTiLDMooz6RD8ZzCl
X-Received: by 2002:a17:90b:2fce:b0:3a0:42a9:9c73 with SMTP id 98e67ed59e1d1-3a07e654220mr1493254a91.38.1790147429128;
        Wed, 23 Sep 2026 00:10:29 -0700 (PDT)
Received: from flow.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3bae00sm643835a12.10.2026.09.23.00.10.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 00:10:28 -0700 (PDT)
From: By <xiaobai050@gmail.com>
To: song@kernel.org,
	yukuai@fygo.io
Cc: magiclinan@didiglobal.com,
	xiao@kernel.org,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	By <xiaobai050@gmail.com>,
	syzbot+95eeb4ada2349a2170ea@syzkaller.appspotmail.com
Subject: [PATCH] md: prevent opening an array before its sysfs kobject is ready
Date: Wed, 23 Sep 2026 15:10:17 +0800
Message-ID: <20260923071017.23563-1-xiaobai050@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

md_alloc() publishes the gendisk with add_disk() before it initializes
and registers mddev->kobj. A concurrent open can issue ADD_NEW_DISK in
this window, causing bind_rdev_to_array() to pass the uninitialized
mddev kobject as a parent to kobject_add(). This triggers a kobject
warning.

Set MD_CLOSING before publishing the disk so md_open() rejects opens
until the kobject and sysfs attributes are ready. Clear the bit under
open_mutex, which md_open() holds while checking it.

Compile-tested with ARCH=arm64 defconfig and drivers/md/md.o. The
upstream syzbot report has no reproducer, so this race was not tested
at runtime.

Fixes: 7df835a32a8b ("md: fix a lock order reversal in md_alloc")
Reported-by: syzbot+95eeb4ada2349a2170ea@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=95eeb4ada2349a2170ea
Assisted-by: LLM
Signed-off-by: By <xiaobai050@gmail.com>
---
 drivers/md/md.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 680b34a63..11b0b6b13 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -6385,6 +6385,8 @@ struct mddev *md_alloc(dev_t dev, char *name)
 
 	disk->events |= DISK_EVENT_MEDIA_CHANGE;
 	mddev->gendisk = disk;
+	/* add_disk() exposes the device before its md kobject is registered. */
+	set_bit(MD_CLOSING, &mddev->flags);
 	error = add_disk(disk);
 	if (error)
 		goto out_put_disk;
@@ -6406,6 +6408,9 @@ struct mddev *md_alloc(dev_t dev, char *name)
 	kobject_uevent(&mddev->kobj, KOBJ_ADD);
 	mddev->sysfs_state = sysfs_get_dirent_safe(mddev->kobj.sd, "array_state");
 	mddev->sysfs_level = sysfs_get_dirent_safe(mddev->kobj.sd, "level");
+	mutex_lock(&mddev->open_mutex);
+	clear_bit(MD_CLOSING, &mddev->flags);
+	mutex_unlock(&mddev->open_mutex);
 	mutex_unlock(&disks_mutex);
 	return mddev;
 
-- 
2.55.0

