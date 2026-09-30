Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6263CAA55
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749614; cv=none; b=ZaDDxfWPs7sPqUPeeVpD6zHwprfkXg4kzfM/Q4P7jCKS9hfPIoZY9rqQykQo8GqFxm7hWcolGUo1KbDkQ8ApETXB8TgRcUz6KWdeUrWZPxVaZ3xPxlMOAEC9qj92roINZU5CbQFrGoDfiE6k6c5zisGFYkHfcmxUCKZpZvI6nfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749614; c=relaxed/simple;
	bh=F22y+hLCAnYJAYt6Xv8/W8DAmL+JuAlNySq4CKo7i/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=shOB0hbwUbC/0sWbriBMhbDI6nzgZkq5TCS8RJBnLYp2tMPbwNF0aUGyG1Pp/Zbw+QF8RPf9TTIh+xE+CTiLO/f1/Cne5kj6sqdQcaMg1Q/MiWR8Zk5ldJC1fTAvhChtr0fbkLXot6DektrY61DnELLkid+egA4tvh929RmYvAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YkLGIZDr; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YkLGIZDr"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso37454935e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790749611; x=1791354411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=StVMALYl7NrhXL0BqWH9nKh8uCpTcpQuXS9uSRoi8JE=;
        b=YkLGIZDrHGXYNGWyoRV5NLLwyx47FkL6Uly2LmQ6OnxGdx4Egecv5xlQvSINLYBqIP
         rQrIfnm9RmgHMeW2ZAo/b3I8C3+AuWfe8Te4Y8EjbSfmrxjIQoOHIYhnPH/Dv8bMhRMH
         pG6e7BUFqbNlfxxqx6f0t950V/CCALIWpJtE6AM+eLRtJgHIT/Mwmc/Pa3bfZ2ocqDiE
         0U082Lhe4DZ5Xwfi7qJkWLctqSGW4daXbacIg/QaNPq6nuKnh/aB/vdah3s3JZeExFJU
         VNVMWUzsDzvJgKb7Qs6eOuXl13qSfg0hjZeXFEHRCjCAI0C61mwz37Be3XBKxbsm50b5
         03QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790749611; x=1791354411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=StVMALYl7NrhXL0BqWH9nKh8uCpTcpQuXS9uSRoi8JE=;
        b=SuHNLYYARQSMnclcidqmugmV+XwaoDpfhhSYa8J82oKaPOIjvGY6UtqTeCNDJIQax4
         eVYeOu1sy8nUEF64qCLTVcU4Cmq5MDmza3fzNsvCJXEmOuO/GlS70utOU5TRikrGqIGs
         EnHmvMALN2wuirF3wBVQvqONtoe0nxI2fEkE4FmptGkfL4XVkiBmQhmwfCU2G6wv02jQ
         3urDwHOejtPeCS97nccMJC6TYB36pjSfHR4WN6C6P6u0c7ud3TITIeZJVu0rYTIrbjMC
         hOt1DlRwuRKNlMKi/Bu0OoHpWQfW+IEHwWXKb7FdfIlNlgMsJZYe0I6Rz4P8SMqfJ6Oc
         +u6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzvVS2NLnBRon664k4wykyp57jmybcggJyTFSMeDfquHrIzoJY8dDf4VmdRn/i1ZaMtjx7arF3W9tq1KAs=@vger.kernel.org
X-Gm-Message-State: AFuF++n2PW3Wx3IoinK1mR2+rr0NnOgxF+hHNXIcCOsHPIRyPYzwyNWG
	O87xfhaXNXMCrWaFIYQEma+++9KOHrSKd5SJJzFsFjzajhrJ/T/wF9vV
X-Gm-Gg: AYBFou3q7QJJdrW21HcxIEHhlAU0Riq0viHc7XdlmSQAZZaEkZYp8rdzBXp5TxpnUtw
	+G6UOF0CVpxpzTnu7QaM7/phdt4W2k/7QbgM5tRHPn8PQZPbgo/eM2wXjYYlhWFNogQpBKdtwMX
	hyOVSyz748uRQ7T0RsngWLMD50vpMIHsNIJ1/LkRoUPleU1obLqOjNxMVyJWLoP8etKb2SFLFcs
	12IuzZY3bTVg0yoij8XQlKVacAtOWW9pmSEy+AT3lDqvlCnW+/dq6JQ/2+VWQCulXmdBu6PL7XC
	YUxOs93oIvu6Gh5trDLRjFeykdpY26VIknZ59IomyFbPZOdugk3R8cz1+P5U/bfIkB21iG4oEte
	hOi1TNrfkGqcxYPyHcQVDJgINhykDpm2O0/r7ykKMHm2T/oGcRDAwhw1pxOdJPOKnjfAoyJY1TN
	pQEvBdHA05n3AGvhEe9zcbmeS2K4J7v7j4INxrIL1FapwSuCbf+DFfp69EDTOYnYsL1cNXaBpW9
	0BrquQBtaxdPSSoATAPZIHT0VR2VMNHgweE5u7W+HB1G2gtseuXtB2X5Y+6ZcNajpU=
X-Received: by 2002:a05:600d:4448:10b0:49f:fd4c:cccd with SMTP id 5b1f17b1804b1-4a01b11e83bmr2983255e9.28.1790749610287;
        Tue, 29 Sep 2026 23:26:50 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e79e4sm6866825e9.2.2026.09.29.23.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:26:49 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Damien Le Moal <dlemoal@kernel.org>,
	Yao Sang <sangyao@kylinos.cn>
Cc: Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	linux-kernel@vger.kernel.org,
	syzbot+b0910be96b7c31314822@syzkaller.appspotmail.com,
	syzbot+2e02ccadb3c5522a5c59@syzkaller.appspotmail.com,
	linux-nvme@lists.infradead.org
Subject: [PATCH] nvme-multipath: revalidate head zones after unfreezing the head queue
Date: Wed, 30 Sep 2026 07:26:47 +0100
Message-Id: <20260930062648.73871-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a namespace on a multipath controller is updated,
nvme_update_ns_info() freezes the head disk queue, commits the new
limits, and then calls nvme_mpath_revalidate_zones() before it
unfreezes the queue again.

That is the wrong way round for blk_revalidate_disk_zones(). It starts
a limits update, which takes q->limits_lock, and it freezes the queue
itself while updating the zone resources. The block layer takes
limits_lock before freezing the queue, never the other way around, so
calling it with the head queue already frozen reverses that order.

syzbot has hit this twice. One report goes through q->limits_lock. The
other one is on linux-next, where blk_revalidate_disk_zones() also
takes disk->zone_revalidate_mutex and holds it across alloc_workqueue()
the first time a disk's zone resources are set up. Lockdep then sees:

  q_usage_counter(io) (frozen head queue, nvme_update_ns_info())
  --> &disk->zone_revalidate_mutex
  --> wq_pool_mutex --> fs_reclaim --> q_usage_counter(io)

  WARNING: possible circular locking dependency detected
  kworker/u8:10/3352 is trying to acquire lock:
  (&disk->zone_revalidate_mutex){+.+.}-{4:4}, at: blk_revalidate_disk_zones+0x1c5/0x1650
  but task is already holding lock:
  (&q->q_usage_counter(io)#75){++++}-{0:0}, at: nvme_update_ns_info+0x3ac/0x1200
  ...
   blk_revalidate_disk_zones+0x1c5/0x1650 block/blk-zoned.c:2560
   nvme_mpath_revalidate_zones+0x106/0x1c0 drivers/nvme/host/multipath.c:301
   nvme_update_ns_info+0x984/0x1200 drivers/nvme/host/core.c:2620

The rest of the driver already does this correctly:
nvme_update_ns_info_block() unfreezes ns->disk->queue before calling
blk_revalidate_disk_zones(), and nvme_mpath_set_live() revalidates the
head zones without freezing the queue. Do the same here, and only
revalidate the head zones once the queue is unfrozen and the limits
update has succeeded.

Fixes: 224041412693 ("nvme-multipath: revalidate zones for namespace heads")
Reported-by: syzbot+b0910be96b7c31314822@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b0910be96b7c31314822
Reported-by: syzbot+2e02ccadb3c5522a5c59@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2e02ccadb3c5522a5c59
Link: https://lore.kernel.org/all/2bfc96f2-7d0d-47e0-936e-8810abb31a9f@acm.org/
Cc: Shuah Khan <shuah@kernel.org>
Cc: Brigham Campbell <me@brighamcampbell.com>
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
 drivers/nvme/host/core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index ee7d09030c18..5d7dfd7a63d4 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -2617,10 +2617,19 @@ static int nvme_update_ns_info(struct nvme_ns *ns, struct nvme_ns_info *info)
 		set_capacity_and_notify(ns->head->disk, get_capacity(ns->disk));
 		set_disk_ro(ns->head->disk, nvme_ns_is_readonly(ns, info));
 		nvme_mpath_revalidate_paths(ns->head);
-		ret = nvme_mpath_revalidate_zones(ns->head);
 
 unfreeze_head_queue:
 		blk_mq_unfreeze_queue(ns->head->disk->queue, memflags);
+
+		/*
+		 * Wait until the head queue is unfrozen before revalidating
+		 * its zones. blk_revalidate_disk_zones() takes the queue limits
+		 * lock and then freezes the queue on its own, so it must not be
+		 * called with the queue already frozen. This is also what
+		 * nvme_update_ns_info_block() does for ns->disk.
+		 */
+		if (!ret)
+			ret = nvme_mpath_revalidate_zones(ns->head);
 	}
 
 	return ret;

base-commit: 4a5e49ba0abb8b4328d6318c9aef0c0121f95507
-- 
2.34.1

