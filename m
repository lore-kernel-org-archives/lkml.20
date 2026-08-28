Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7623546D6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787904534; cv=none; b=FvgRpoYWj1xT26Jp4GLy4WlcKqaINTXihFeHCB8QYpG5wzPHJmvdf2rZWUlciINrEHfZ/Wpz4f6TnX30T5YV03oafm3lC2OFIUTuy8Af+1q5JPzEiodfrGc0jMxBGtvxjcfsTQd7/5UJzecRK90Z1mJt5jbzzsY32TCgA0qd478=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787904534; c=relaxed/simple;
	bh=91vSMxIcxrt/sn6Z5+g0ObIeuw2alq/Ik7/ec2oxwys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BMkJPUh52UI7vtrDFwPWvt1Ye3ynNNfVK9AinA9w0ooT5Ti0WuvPVcGgjp4/F05PJMz3zyEP0M0yMc83ZzMIe5+M2S8gM6gclR/tfjaUOwRCMmeh3onsaYFmPN5JPuVv+okaFjnAINvqJagXiTCQSINMeu1vu4MqffTPiJBOl60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljkW3RAP; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljkW3RAP"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d7200b2e15so8287725ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787904532; x=1788509332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fPgMCSl2sKRMIjnl120zjXDtspUsaBpky4/u0rMEfqI=;
        b=ljkW3RAPopV8QHqdEfXSTdIvtM9fHi3jmH4ED8sxlv037tyRlWeDkUQb74ROpcOsGp
         9PxJI92Z82JndZVcv54P2cdGLotdU7Hrhpf2Aea7PBgEn2lIcUCsx7n0Qe8V4b5yccX9
         G9dJUbmo8N1y5dfWnGLqzvW3l1BXKJqBcYgqMktnaFXQQDoFk0AvSpPZPHyEkH+3WIrr
         4hBNLK+mvw+kZzimqebEyh4vuKcbGLrBtPXtgPRRolGnHuwdLPi3Vys2/Abxc5fAdau4
         bn/PX7QGdnqVxZz0fkBq1sqlyEp7h1Ht0X0aBr29VM5akPlfn8Qk1e7oMSy4Z31ITtxw
         I44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787904532; x=1788509332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPgMCSl2sKRMIjnl120zjXDtspUsaBpky4/u0rMEfqI=;
        b=jRHYHQUF65boUV9W31L4uP1c3tik/uA53QzpXxypI36nDosz4ZXHFygspTgDXWeyKf
         auR+FG1mDt5zHefQCBPthf5t6THWEghQsFg2eBuTE8lSsQVpEWxA8B9xUIbcSJ+EVaGe
         b/0/mt9lc/+Z40FcPhyZ4Oy3ZY0+zICweupUApMMetsqHu+IENFPwiEvTJqL8ONEuU//
         O776LGzIZe2DWJVtDlr7c//FUqD/2d+jIK5OsYVjtgb736GHiVIZlTVrijtw1Oxwil0r
         TqhYFcfRfzFbwgyu3yBdO/M2Alwkobbke+9syRK7cM/+gygXGsRGvjO1AVitGSTC9oir
         BPtQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8WL5MdxW+/Cc7obEDVlmENLPYQP0fGVShd2+shX/EBrQnPRQW1+kRFdeRjuhn4/vbVQ6nfxoIGCX0nfk=@vger.kernel.org
X-Gm-Message-State: AFuF++mz6OSNcy0GAvUFSty8EpSDtVoH1N9BmgXNtnsY/BPn2XY95eGD
	M+95gS9ylTMuMEX8c9wRNOeE2UYCWCE5c/rLDqlsDMnaISTJpABuRxLJ
X-Gm-Gg: AR+sD10NUn74M6l0n80qc71Dak4tQYbkSbZjOrfQlQYOrPsOfEjTPMUav1Yzyr4EVPt
	jiiKyj9uZ66P8n7gite68EUNT37cmFTQ6qCklylwpZoOIJL8DC8UnExcwfV0/G7QI/QpDqpNLZj
	Szo3thKrQBd8tDKmGA9veV+pck18CKgFwDcol5pfA4Eq0GoGaxNDVmN4MaGGXlmO6w5l78eR4tO
	bqQYdOtwAWIF+NaGEpslp9rrjCqdzjZAwvfYu8ZVehUw7d+w8L2my8a68tVb3quSmjoMuf10Oua
	5eOQ6gKkio9t+zButfSnkd6ONeYfJlPOwKiK+bcSpcCyiulPRntmUlUl2gPms2vqpMDd2xmIAYi
	nQwJ3836RRh/5KqQR4PMQv8Og9+S8OXKHQ9cR20Jvje9d4b7udmjfHI0XCrB+W9Q/zv9KWeomPG
	XJlAi2o7yQwH6zR6QI7O4yUNLSgZfwHDSaf8b8P9drkev4rZRhbrymDvP/zdBw2M3EOw==
X-Received: by 2002:a17:903:3a8b:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2d74dee96b5mr97935495ad.9.1787904532289;
        Fri, 28 Aug 2026 01:08:52 -0700 (PDT)
Received: from Default ([2409:40f4:1018:6686:df4d:699c:e13c:43d2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9595bbsm3525959eec.14.2026.08.28.01.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:08:51 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeffin Philip <jeffinphilip14@gmail.com>,
	syzbot+1e2ef9bcb29af666b2e6@syzkaller.appspotmail.com
Subject: [PATCH] Input: atkbd - fix UAF in atkbd_set_repeat_rate() on disconnect
Date: Fri, 28 Aug 2026 13:38:39 +0530
Message-ID: <20260828080839.116065-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 0ef7a26af127 ("Input: atkbd - fix canceling event_work in disconnect")
moved cancel_delayed_work_sync() after input_unregister_device() on
the premise that events may arrive until input_unregister_device returns.

However, this created a UAF as work that may have passed the
atkbd->enabled check in atkbd_event_work() may attempt to dereference dev
which is freed in input_unregister_device(). Reverting the commit also
does not solve the issue as events may still come through and pass the
atkbd->enabled check as atkbd_disable() and atkbd_event_work() guard with different
locks. Fix this by closing the hardware first using serio_close()
and then unregistering to prevent work from executing after
input_unregister_device(). serio_close() closes the device preventing
work from arriving.

Reported-by: syzbot+1e2ef9bcb29af666b2e6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1e2ef9bcb29af666b2e6
Fixes: 0ef7a26af127 ("Input: atkbd - fix canceling event_work in disconnect")
Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
 drivers/input/keyboard/atkbd.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 5736f4bc5a50..8874d9007a67 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -963,17 +963,18 @@ static void atkbd_disconnect(struct serio *serio)
 
 	atkbd_disable(atkbd);
 
-	input_unregister_device(atkbd->dev);
-
 	/*
-	 * Make sure we don't have a command in flight.
-	 * Note that since atkbd->enabled is false event work will keep
-	 * rescheduling itself until it gets canceled and will not try
-	 * accessing freed input device or serio port.
+	 * close serio first so device will not get any data, which prevents
+	 * atkbd_event_work from being rescheduled after cancel_delayed_work_sync
+	 * returns. This ensures no work can dereference atkbd->dev after it has
+	 * been freed.
 	 */
-	cancel_delayed_work_sync(&atkbd->event_work);
 
 	serio_close(serio);
+	cancel_delayed_work_sync(&atkbd->event_work);
+
+	input_unregister_device(atkbd->dev);
+
 	serio_set_drvdata(serio, NULL);
 	kfree(atkbd);
 }
-- 
2.55.0

