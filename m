Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC4B3AB28C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911566; cv=none; b=r5bxGEkBZsk75egKMF+oYKrV7JHnK9WKRptoYbh+DUL+PncXTjevIa/5zFzGbyuWWmzrp2lXiosPqPQjYPiRKdLNVirmyARcDiMxIDiK4bpNfPJ+KNorctcOQM4fD73mzXh3kA5GxGe43p6lOMV5hFunAxdi0JI7Lr5TuZd0V0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911566; c=relaxed/simple;
	bh=MJA9JnatOxTDcya0/pH4eQEUS46aOIcCQNEXUYgPKjs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X7OTddSzhTsIcFY/XlcUAijKbuO5aO+lMMKS8dualMN2g+mvH2slvdVSWHQORDWX2MkV/ARSall4VGl1Mvx2yLF6qdhvT/Kwq8ufoRvRqVc7Wiulre28WATidmQjvUt/ZmggfdApN1lgx5knhNhNdXwVvqXDEJwmap1zByRQQtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KF/QCBq+; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KF/QCBq+"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7f3f52143cdso813572a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787911564; x=1788516364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tzEZPnlnA+MHUZ+FmtBKMiae7Anw81mNQrQ7J2H6x/M=;
        b=KF/QCBq+Nc13+fhWQb0LtKGAeuTrxDP8Ue3XIhfsR9u59bFKz0b8BJxTSdTOY780Mk
         8VHnQOZoagwdsKTPfEirOcjG59ywPaW/vVxI8OuFEchRlwXTsvdwunV77qx4jfU8XCNj
         5huCrrYxbA+Mn13TBS/lkk7kjVNSdElGjpM2zGjN/ChgquMG9jQ2NXLA4tioSmoK/CeZ
         8t1xSulfHQORTyExAYGkOtarfkq8WSQczU/S6RxI6nSTbbZOVfXPodGV160LtMQLUI8d
         vZxdv/Rosh7RHrVP53QMCj3HKln1CYBcjCd+RaHTmcwGqhIW3zNsiuwwwI9php715+iX
         gFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787911564; x=1788516364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tzEZPnlnA+MHUZ+FmtBKMiae7Anw81mNQrQ7J2H6x/M=;
        b=dEBLvgrLxDf416rGqU6ZegmryPcFjdvEh4Yj3oWvfuuZb/wDcmBiEwAmJJDWLk4m7L
         ps1xFWzzxX7Jd/rudOSoPDox/K+D9/WALD9T5kwStmJoYsS5o8VqgaGPo1z83mR7Hun4
         xzdH0jTGdwnCpGjGGHH6Lo55G0l6q13+VVcExv34G7yoCYeqlJftrACGxi3Yupe5BevZ
         BhM2/DIlUUuCAjbFN4VDl+sZP3xGYTeseD6PMVjZ3YX5Dn1pU6TrgY+dcZxL4pew+6W1
         ZEl2wt5aKkxlycNgp5uVq4HVvKknrkLUWhb80hVAiZEZJV6TdT4IQx9rwRG6fFLyQS3z
         i2GA==
X-Forwarded-Encrypted: i=1; AHgh+RotX6fqwGcGQNX+OTi6W0quEo4+Lv8/vH3GXUWk8Ea8L1CifyY5xANmNNehMFaAL7FXUU+1HUqCiofawE0=@vger.kernel.org
X-Gm-Message-State: AFuF++ng/1o1jRKqthN4I5KuNYPAL5rtDmsSnDBFIvdyeAXeoYJIXrwk
	1pg1dHza4g8XVECCNR3FrZFWOVW9K7JO2Ic2N7E4ZrB6ieNdYM3MIbfkmkMreA==
X-Gm-Gg: AR+sD13lDXhEgZr1qWvUnKAlfR6T5sX9zmJKWYMKawkG3TwByOrI+8XaO3hz4JWPu0N
	VDxx0gs4GzR0Rh5eGKJJTq4EB8M/U1OjOYxx0N6Pivv/FCnA2VnZMKgZhqN9WArplsAjZz/w+v5
	4wsont0gVSdWT99PH5Vm36znmjXj5vk1ygz/HswdibHO8hOoKhzQ/DVFITSdkJNwFcVUSvGUSsb
	e02nBJgb/G1nv3ELAs8l8ZEXDD7TUoUmvwDVrIAmFWvJGI4tfq9tYUI92yP3sB4dBzWct/PXuvu
	LOwanWZq9GPH7ofRXDPiQS2rz43c1Kk7Ryhr1C7XjahXnAmwa+DbC6cIQXXtjVp7KREe+iFg67J
	4jzGD3B5GOcQMF78yj4F4Ox5iER8avIk9S298EstoXaSCCUlHoUlh3S2EGouqt/z1kOdr7LGc1G
	6gvnYbcHBs93UPt4t4I3KzgW/WAxRmNUhFZOxADi2wtSxGhcb/gsKao/BYz10wpwi3iJ5a7oYEV
	5k1
X-Received: by 2002:a4a:dd1a:0:b0:6b0:5bd1:4722 with SMTP id 006d021491bc7-6b1c668e741mr4292347eaf.13.1787911563533;
        Fri, 28 Aug 2026 03:06:03 -0700 (PDT)
Received: from Default ([2409:40f4:1018:6686:df4d:699c:e13c:43d2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e41837c6sm1910157c88.11.2026.08.28.03.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:06:03 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeffin Philip <jeffinphilip14@gmail.com>,
	syzbot+1e2ef9bcb29af666b2e6@syzkaller.appspotmail.com
Subject: [PATCH v2] Input: atkbd - fix UAF in atkbd_set_repeat_rate() on disconnect
Date: Fri, 28 Aug 2026 15:35:47 +0530
Message-ID: <20260828100547.120553-1-jeffinphilip14@gmail.com>
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
enabled check as atkbd_disable() and event_work() guard with different
locks. Fix this by closing the hardware first using serio_close()
and then unregistering to prevent work from executing after
input_unregister_device(). serio_close() closes the device preventing
work from arriving. Additionally add a check for atkbd->enabled in
atkbd_event() to prevent userspace from queuing new events after
atkbd_disable() sets atkbd->enabled to false.

Reported-by: syzbot+1e2ef9bcb29af666b2e6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1e2ef9bcb29af666b2e6
Fixes: 0ef7a26af127 ("Input: atkbd - fix canceling event_work in disconnect")
Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
Changelog:
 - Changes in v2:
     Added a check for atkbd->enabled so userspace cannot queue events after
   atkbd_disable.
Link to v1: https://lore.kernel.org/all/20260828080839.116065-1-jeffinphilip14@gmail.com/T/#u
---
 drivers/input/keyboard/atkbd.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 5736f4bc5a50..79e4cd9ee1db 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -672,6 +672,9 @@ static int atkbd_event(struct input_dev *dev,
 	if (!atkbd->write)
 		return -1;
 
+	if (!atkbd->enabled)
+		return -1;
+
 	switch (type) {
 	case EV_LED:
 		atkbd_schedule_event_work(atkbd, ATKBD_LED_EVENT_BIT);
@@ -963,17 +966,18 @@ static void atkbd_disconnect(struct serio *serio)
 
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

