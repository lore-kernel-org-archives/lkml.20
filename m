Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D604A5EA7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066030; cv=none; b=CElGmXD0IuYbXbBBxOtihuSW3EXekGultulvoDrbhp2CD4uQqsEK/zNS456q7Lo17GF2qHqxvZq4KrZTMP5MYecL1qbBaTqF1ZKCbSxGTYFyZW7gRErs5WGybgqIWeu6O4ZaYvIXbIZZTksC/qCCvV8XsIp0Wurh/A1QyveQb/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066030; c=relaxed/simple;
	bh=tFirq9WK8z4MHqUYry8B+dBatiOov7iRGGmpOlMjYDY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EM1eS5TQD58qBunX/q2XCRlESpC9vwoB+LAZoHy6W+TW2ctl1JoPkDQt5gGfCva/JuYrj8NV+XJEMehlUzw0tu5+eP+ndhsPQ4KcMbOvHGoC49MfTBB8AVXTd4VvDqYThYh2R4Suhyyz2yXtrAuxWZr3DqmV25+bamkNhchjHyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=piI71mZr; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="piI71mZr"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc147d86bebso2895245a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792066028; x=1792670828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bKMqH5LXFbN7kyYU7PnKFmn1gNr+IrqxQUbfeXE0apY=;
        b=piI71mZr/EC1EnT15UjAompgtYIQHB1dUfxdcJzIPNsxLEwjptdnhbw3xdtCGTfh3p
         wgf+QZiWBYa42b2gcXDQi6M1hn/v2aBJ0fNtsuR9hgrzr4JD2IedioJHvBfrKf2lYoWy
         p6yj23BZUfc13+gwJyLlmVree5TYWFy4iZqHBuwv519Vcw5kdrsoNGZXtXj1KYIHkmEK
         xru0wyzBLqhDKM9Isp+uO/TGIJ0oaTfjs/Jjm91wgak2BuvE+eH9bHOBPHevlUL1WoaV
         Qfw5CQk3hATTnxipz7O08Ptd8OBEiLC5zwon66Y94HCQ9AW1g8UIXfQIWVOm9zOzoWMP
         mPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066028; x=1792670828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKMqH5LXFbN7kyYU7PnKFmn1gNr+IrqxQUbfeXE0apY=;
        b=bQKVds/O+gFLmwP0oeSNy1XkKF9DJkcZuyI7xwUAsU64Jqq1mGS20F7JhtypCWN+P2
         JvrNpTlaPX2C8/gL73RZarBZ0bOqpyKnkQSnic8rOEHZhp8SZ8RarQ9MGumOZlnhdKCV
         TEFiViJjACWgdxbklOUOrorcBv5qmADJCL1TlgLjgFpShCGwO6Rw8GEEQ+WMP95sbEl2
         BQJZJhY4Qn9Q5V53N9Gp4Q1dELllQ52l/NLtRjcJzMiK1X5EiMOIdyI4L8V9jzoHJwzp
         cxCykL8LwuC/GT0NChBvQuT1Ix6kZZby5PXy2G8oZqWsw2YSmHaWL1QlT2mokISVbUOI
         9T8w==
X-Forwarded-Encrypted: i=1; AKwUvBxhYAaKnTIb8YPI8AIfQKF/FJsIqdTbd6Pa87jS1//VCFDhGdbpwyX6GELQ+zPBYXa23K7Sra+i3KEv/W8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKx5YaYgV9Jc34Haaq8IKg7Rw/FeUsUQEGaj0QwLJ+KDsbfnSDF
	ck3EvbBV5/bWbIHw4LhiKeSSh9k9nEEhgF/qf3LHcEMnb4wzq5mjj02txHHNSu5b
X-Gm-Gg: AYBFou1ZctqA6pAV7YX1aPuikKPw3cE6nDMIbfa0gt6lJgxWWP+xy58ow8/zNCPrhje
	SEu4h/UsEu4P8yAV025vyt/9Dx7JuWXnvYehSs76Vqh1UkCbUPHwx6mAMyhpDsQCPrdz+bR/oz/
	oxLogJ6tQi8axpuHOkpQMLuFWHshFA0ZrtGIaFA1vpX/oY1vi8KZcXM/KvxIWZW7674s+yRu2yF
	tPGd/DseGfuxI3pTHgK7NIkt5J38cqLFFBE/zVbU4+A62AEPzi8N8E2NiRhryvh0+tVxFiyPrfv
	bvUV2FWXDxaW5gJwrQaGQ8uH0HZ0MEcORrKdj9iMW2gbu9G9bZaE1ecmT1j0hKgJkCO9qtp9waS
	Q1gbHDwee8xluuptfsaOldYt7Vd9/JgoTRWOypaMGlK7sHTtbqcJLykOXxlCLJcWC9XYU1pebeo
	+G7B+Is59JPgz/Byhxq0X6aAjrrdm0JUlQ+yCGL31X7YsLHKh8aW8pCoQoY8GdAsuM0+YiUjb9n
	N8zFqNv
X-Received: by 2002:a17:90b:1a82:b0:3a0:d82b:237b with SMTP id 98e67ed59e1d1-3ab3ab209f3mr9754562a91.25.1792066027993;
        Thu, 15 Oct 2026 05:07:07 -0700 (PDT)
Received: from localhost.localdomain ([106.101.11.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944b0bfasm4399621a91.16.2026.10.15.05.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:07:07 -0700 (PDT)
From: sonotri <sono7ri@gmail.com>
To: Ming Lei <tom.leiming@gmail.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sonotri <sono7ri@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ublk: pin module while release work is pending
Date: Thu, 15 Oct 2026 21:06:54 +0900
Message-Id: <20261015120654.241354-1-sono7ri@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ublk_ch_release() takes a device reference and queues exit_work.  The VFS
module reference held through the file operations is dropped after
->release() returns.  A queued work item does not acquire its own module
reference for the callback.

Consequently, normal module removal can start while exit_work is pending or
executing.  In addition to the worker callback itself, the final device put
can invoke ublk_cdev_rel(), which is also module code.

Take a module reference while ->release() is still covered by the file
operations reference and drop it only after the worker has completed its
final device put.  A rearming worker retains the same reference.

Merely canceling exit_work during module exit is insufficient.  The worker
is the terminal path for the device reference taken by ublk_ch_release(),
so its cancellation would strand that reference and skip the associated
cleanup.

Fixes: c5c5eb24ed61 ("ublk: avoid ublk_io_release() called after ublk char dev is closed")
Cc: stable@vger.kernel.org
Signed-off-by: sonotri <sono7ri@gmail.com>
---
 drivers/block/ublk_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 66eb55e71..71556c34a 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -2613,6 +2613,7 @@ static void ublk_ch_release_work_fn(struct work_struct *work)
 
 	/* put the reference grabbed in ublk_ch_release() */
 	ublk_put_device(ub);
+	module_put(THIS_MODULE);
 }
 
 static int ublk_ch_release(struct inode *inode, struct file *filp)
@@ -2625,6 +2626,8 @@ static int ublk_ch_release(struct inode *inode, struct file *filp)
 	 */
 	ublk_get_device(ub);
 
+	/* Keep the worker's callback and final device release code resident. */
+	__module_get(THIS_MODULE);
 	INIT_DELAYED_WORK(&ub->exit_work, ublk_ch_release_work_fn);
 	schedule_delayed_work(&ub->exit_work, 0);
 	return 0;
-- 
2.34.1

