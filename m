Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0152C2D5432
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 17:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789839475; cv=none; b=LYQhsmOfTsTyzm8omM5UPxrK7+Mb9aZ5F1Y13p0vK2ULIh5amJYN5RDCUpp2yyJiPIxFQJnV8IimGH0JeVHBL+LtbP+x/DwP6TBuYgxf+PtZs/H4i0452mldnLyxn4Xdfw6YsH6KyFX2b+RTWiPAlmkuvlCCQ493MrQUT5x/S9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789839475; c=relaxed/simple;
	bh=A+LU2lOUO2STiPMwRjdZHK8qHreRR1b/wRLSvRu1GUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kVEImVRHRg4KpHkN4Jb3AMm9npbE1hN5ctpdG8V8yCuYVd0KDl+hvX+kuCI/cZBDY39Ui1Mq493m/5sMcc6Iyne/I2fXxRgmaEdbP81nOp05x2nLO7NZ2qFwqet3cflxIBVITCf3wjnSLg9TFQ0shE8JjtxMxXC3hFU8Vif8xxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXm18EzX; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXm18EzX"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccda24afso1328470a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789839473; x=1790444273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/+svSdwCuLzAYpRiv4o3QatmA9OQccLmNnyQlBGEnHs=;
        b=lXm18EzXukKphl5k9+Dn+6udG91k5TXMhIR4pJsUQ5/k2xnN4UHaCvuMAjuV9CEMaM
         HwPR0auwyovE4C532CA9+ShiKUolXzNdJehuMnl4p5vZqWpQPqbNTwzLD0c4Bi8SB4qV
         4rJTM5tm7y6hTJJk+Zpf3W8KWys0bHEzYAF+vEUeU9UR5NfcbG3vfDNI2lwz93W7b91g
         RmQ+6RPUnjTODCAvP9mCf7j7VXUdlgbSi8QLmHNCf5eB8hVfiGwo+jgr47K8kVABWUHW
         mBDua7HgN2pTe/TSQvfdFm+xmy5NiXmUQPW7PAWOTH9bEuyvpOI/thhD9bzWkNLUL5EU
         CGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789839473; x=1790444273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+svSdwCuLzAYpRiv4o3QatmA9OQccLmNnyQlBGEnHs=;
        b=geGu912UhuKuRl8GN/mJvunMYe4t/VYdCeJ/QhOR1skTMJwJcAGofhp0/386/9O9WJ
         7IaxuB6UWfTPZL/YQJcFWB9AkIXxdcpwWowJ7+Hma+LOWHnVYZljxD9Bez6o2jic8uQp
         n/uP9+S7+WBFdiiYCFOdxYO0HLYpCoGDQvgjyG4tpNQz08hMyr2P2Qezk3Mq5Vd6qxgF
         ZDPAGKya+cmYn4qighX+hxwS4koEF10CMmfOqPQhtPQTDa2nkITrFM2vyRbHbtZBdxeW
         c7r6MFyZw3HHf9jsfhRpXs79ifOOsLbtbjbMdkwMfQAz2lRCay9j9ViucnS7m2D7bSdw
         JrpA==
X-Forwarded-Encrypted: i=1; AKwUvBz7UIccsDXrZuV9bbp4WBT4mysbsxsY8Y8Oa8og+YXK0gfw3tF0lp/CBpGj+pqKyiVirJ7LlE0nULe+Q3k=@vger.kernel.org
X-Gm-Message-State: AFuF++mstA0xPdmr3BBCPoTjOEucWv5whVn9XormtGwSQORsl6sEatE/
	h5MeCf8tGxq/VsUWrw1TaWY+2bv2clwVmciyIOZ3iskWCWy92W8xOKQz
X-Gm-Gg: AYBFou2ZgkYn5YNmv3vheI3p1RUFUDNNv6DZqAEkXgJjFm2V2oafuwTo9uZWx/6acOi
	drh1eQ0szItbcWvptuPiIrdt+wP0jGVd3fk0xgSohQlLrCJPvZ1GDJvzbe3ERrSonSrLdOLR6hy
	snkQfxracyKJxCQQ1DbxFQL3qZRNZg4ytjC8r1Sfg98ItlMoLKOGKCs03G1a0OXqiqhknsf1KH3
	wpSFgooNoscdqnnzZIA2eZoq3IDXhKY5fuInmBxFhtukAB31ZiOMhMKwWp0fC56jeskIqXDCOje
	UNDHJBiyTsNCPAYNWNVg30a6H8euRdwP4vINvVQcIJ+RWqnHNDZlklGEQJn6yfYvyX6sx5RQQep
	BJqbhUaK0mAuOl5WdKhClamG2mSM83UgQB+tPg6IL7KhQ0wAQQaljc5KC0947un1vXMlsb18d84
	43jOtruqgow9+jR1ucgW4l7opkOQlo9yfNhQ/NPe3uhJR1tE1TnAcjFuEK2CpktQi8VkKlwORdd
	e/2o0Fg7FGaAwVM
X-Received: by 2002:a17:90b:2b8e:b0:39d:efa9:cd25 with SMTP id 98e67ed59e1d1-39e54c59c74mr17536897a91.2.1789839473321;
        Sat, 19 Sep 2026 10:37:53 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:814e:e9d3:767e:9a2a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145e5sm5820981a91.5.2026.09.19.10.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 10:37:52 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Alexander Aring <aahringo@redhat.com>,
	David Teigland <teigland@redhat.com>
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+b114bbe890d76037877c@syzkaller.appspotmail.com
Subject: [PATCH] dlm: make lockspace join wait killable
Date: Sun, 20 Sep 2026 00:37:47 +0700
Message-ID: <20260919173747.327963-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_uevent() sleeps uninterruptibly until dlm_controld answers the
ONLINE uevent via sysfs. If the daemon is absent or stuck, a task
creating a lockspace through /dev/dlm-control blocks forever in D
state, cannot be killed and trips the hung task detector.

Use wait_event_killable() for the join event and return the error to
new_lockspace(), which already unwinds through out_recoverd. The
leave path is left alone as it must not skip teardown.

Reported-by: syzbot+b114bbe890d76037877c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b114bbe890d76037877c
Fixes: e7fd41792fc0 ("[DLM] The core of the DLM for GFS2/CLVM")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Problem: syzbot reports "INFO: task hung in do_uevent"
(https://syzkaller.appspot.com/bug?extid=b114bbe890d76037877c).

Cause: creating a lockspace through /dev/dlm-control ends in do_uevent(),
which sends the ONLINE uevent and then sleeps in wait_event() until
dlm_controld writes the result to the sysfs "event_done" file. With no
daemon (or a stuck one) the writer sleeps in TASK_UNINTERRUPTIBLE forever:
SIGKILL has no effect and khungtaskd fires after the timeout.

Fix: use wait_event_killable() for the join event only and return the
error to new_lockspace(), which already unwinds through out_recoverd. The
leave path is unchanged, since it must complete teardown.

Testing (x86_64 QEMU/KVM, lockdep+KASAN, hung_task_timeout=20s): a static
repro configures a local comm in configfs and writes DLM_USER_CREATE_LOCKSPACE
to /dev/dlm-control with no dlm_controld.
 before: task stuck in D, hung task splat, still D after SIGKILL.
 after:  no splat, task exits on SIGKILL, no KASAN/lockdep reports.

Open question: a late "event_done" write racing with the error unwind is
safe because kobject_put() removes the sysfs entry (waiting for active
users) before the lockspace is freed; happy to add an explicit kobject_del()
if you prefer.

 fs/dlm/lockspace.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index a9c98b4f378f..5d6a752e6650 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -190,6 +190,7 @@ static int do_uevent(struct dlm_ls *ls, int in, unsigned int release_recover)
 {
 	char message[512] = {};
 	char *envp[] = { message, NULL };
+	int error;
 
 	if (in) {
 		kobject_uevent(&ls->ls_kobj, KOBJ_ONLINE);
@@ -203,8 +204,16 @@ static int do_uevent(struct dlm_ls *ls, int in, unsigned int release_recover)
 	/* dlm_controld will see the uevent, do the necessary group management
 	   and then write to sysfs to wake us */
 
-	wait_event(ls->ls_uevent_wait,
-		   test_and_clear_bit(LSFL_UEVENT_WAIT, &ls->ls_flags));
+	if (in) {
+		/* don't hang forever if dlm_controld never answers */
+		error = wait_event_killable(ls->ls_uevent_wait,
+			test_and_clear_bit(LSFL_UEVENT_WAIT, &ls->ls_flags));
+		if (error)
+			return error;
+	} else {
+		wait_event(ls->ls_uevent_wait,
+			   test_and_clear_bit(LSFL_UEVENT_WAIT, &ls->ls_flags));
+	}
 
 	log_rinfo(ls, "group event done %d", ls->ls_uevent_result);
 
-- 
2.43.0

