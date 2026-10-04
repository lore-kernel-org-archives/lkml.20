Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5793E35A933
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 05:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093451; cv=none; b=kXC2LwnD0YCfkJqA00JvSL0YUhj3uXaH03m2P9//HztN0s23qBihot9UfFH2GHl9fLtwcK9yG13aF+llXLK+MnaIjBzXjUMkkHuhG7Ra8h6FggagGHJYEar7aDtI0Olr7E9Uq2apOPa4tmusmO9kwMvffPnqTKdSyDhNTP0H1OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093451; c=relaxed/simple;
	bh=nsjlZHqNgA3qVPWv0QbhOCTWAKaUPTF7KW8tGj7QnEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DeehNsZPPf4tyZCg/QIWS8cmhZlVm5qAiDW7PtWMNl6w0XsTRWAitZ6joZPalkXLDYbvZUtxDbp8z4LYDAFSoSDHRup1xcrvefh3GMUB6cK3/iSF6m45dk02b7/x1oJYkJXeq8UiaTJ1DURwLFQytg7WGArBCmNJUsXPzjd9618=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPk+RTfm; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPk+RTfm"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33bfb26865fso458660eec.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 22:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093449; x=1791698249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7DDS1Y4W2OZ7ywZrWFoVomdpg44Qk/IzddvKZYbeg2M=;
        b=RPk+RTfmG/EAE5q8xnidnCmW7wtGz1hgCrZofDm+wFAXOCQKSGM0YFzPNDQdyyfHgI
         t+LQxq6YZqZY5XsHN9tFyfWbS7PSjRy6opW8g7kPKrri6U10XMijscXuQOLMNyoGSapD
         kTImyFLZun66SjWTiL/+b54wnimTqzvkzbgqoUjoQ9zbA5ZuCKD78vi8HZadHFCj+LMm
         k5NKZaJ4Zjey/ici44ljB9bopnwLIWVPH4HCeJx34SxLlSM+NpQZQ1ku5LmZh1WruYJT
         dkD02C5HY4fX3sK0c2oPwn9t2zTzf6+hLFB3ivV5u4bfApJvwy5KDPuV6+hRvMs1+F9M
         bEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093449; x=1791698249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7DDS1Y4W2OZ7ywZrWFoVomdpg44Qk/IzddvKZYbeg2M=;
        b=oYX2DIuYDrzgzr8zYokPZc4W4T0s/s1y6FibPaWN4YIEoJTQKnUydNog7c0k46Or+t
         0BfWO+LDebxMyJ7ZpbVPzi94mWXZs/dP/YGpcbJf1F15EnowwecatuPqhsvKpEQK/rmq
         PpU9n94cymfNajHmswlLrx7EFPkC0tapd32gBvpH4BR9WZlzH4x/nHwKdmHl4unm0DWU
         6dMEEV9GjGJu5v8f/mddqrKkzvseq5dqyeG8chQUAINYey+hPV09cmhlgkSEQIWoNPhn
         MNLsPSNQJ6pm+1K7Jh5arIrj58Wivl+Q4iSOaHxEHaPcB/+DSdqTbRzdy8TmNncM2slF
         Ll7g==
X-Forwarded-Encrypted: i=1; AKwUvBzoOXedW/NZuq40F7OG4jhOq1HYYDfXfZo4Q/SbHmAeO/H+1Mk42uuabC3k1ZeGwxtZDjn1dqhiCfEi7Xg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJInfbVxKbFiFN2iE5LmDrp47sFu+Uk+zTQmrrHafODMKJYAv+X
	+kQBY2Y11DFM4Mg7doOGEMnXUHE7M/jkEhuq8Qv2EEzDDE6SYWIZuVJV
X-Gm-Gg: AYBFou1Ce6birKp/+t+GfLLKCWoPegmuj+gavrHfDCDfMwP2JcbUouwvP37DOla+MKS
	0GxlCf2fLOyHsTkeS2/KHF1B5TZTZqsuW27h8dD5+WO+ciHSFLBuamwEhMO30P0QwhpTgsOm9Oc
	RgIBnfpat/OQrnrO55TORWsgjcMwAt2qU8eQ4KxRrMrOtrxCA8mXR4kEIkwxxkq0YD3iriEqTA8
	1dbD4JMRU9DvgTXQqzv1wGGaPibgyGxBS2TiMnRF0+U6Hyuu6uBqhV80j/qpWFoJ1puhmaZ8lFW
	yu1U8ld485gJOCpF0Gc2v3z5SPc44yH4icxLxnege4kJdvgESCwRio4gHTkIamgVR0zE9xuHBXX
	8ZwL/+t+9aRPWdpKuLxze2wI4/5UVDW7wJiwaiOB6h+DxGI0drotpc0KH/EhsPEzayRu2OqD3gX
	9nvJ0z4YRFXgUyf5V9k8xHEzEv9F+UjpRYiApUQfrLg39xsk8tv1czpp3QONJ7LGTsqz3zbrtqb
	MfVDmlboFzZ3tFNKb5jeko=
X-Received: by 2002:a05:7301:782:b0:351:1e72:735d with SMTP id 5a478bee46e88-3511e7277b6mr2796196eec.19.1791093449042;
        Sat, 03 Oct 2026 22:57:29 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.132.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35129de5740sm757234eec.18.2026.10.03.22.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 22:57:28 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fygo.io>
Cc: linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Li Nan <magiclinan@didiglobal.com>,
	Xiao Ni <xiao@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Hannes Reinecke <hare@suse.de>,
	Logan Gunthorpe <logang@deltatee.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	syzbot+95eeb4ada2349a2170ea@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] md: don't hand out the array before md_alloc() has added mddev->kobj
Date: Sun,  4 Oct 2026 11:27:12 +0530
Message-ID: <20261004055712.1293-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

md_alloc() publishes the gendisk before it is done setting the mddev up:

	disk->private_data = mddev;
	...
	error = add_disk(disk);
	if (error)
		goto out_put_disk;

	kobject_init(&mddev->kobj, &md_ktype);
	error = kobject_add(&mddev->kobj, &disk_to_dev(disk)->kobj, "%s", "md");

add_disk() makes /dev/mdN openable, and md_open() only refuses the open
when MD_CLOSING is set.  mddev comes from mddev_alloc() and is zeroed,
so anything that gets in between add_disk() and kobject_add() sees an
mddev->kobj that has never been through kobject_init() - no ktype, no
kref, state_initialized clear.

syzbot opens the array in that window and issues ADD_NEW_DISK:

  kobject: '(null)' (ffff8880120640f0): is not initialized, yet kobject_get() is being called.
  WARNING: lib/kobject.c:642 at kobject_add_internal+0xea/0xcd0 lib/kobject.c:225
   kobject_add_varg lib/kobject.c:374 [inline]
   kobject_add+0x163/0x240 lib/kobject.c:426
   bind_rdev_to_array+0x80c/0xdd0 drivers/md/md.c:2621
   md_add_new_disk+0xe3b/0x1850 drivers/md/md.c:7684
   md_ioctl+0x200a/0x2610 drivers/md/md.c:8499

bind_rdev_to_array() is not the only way in.  md_run() calls
sysfs_create_group(&mddev->kobj, &md_redundancy_group), and
internal_create_group() has its own WARN_ON(!kobj->sd), so RUN_ARRAY in
the same window warns too.  Guarding the individual callers would mean
finding all of them; the window itself is what should not be reachable.

Refuse the open until md_alloc() has added the kobject.  mddev->kobj.sd
is NULL until kobject_add() creates the directory, and stays set for the
rest of the mddev's life: commit ca39f7502425 ("md: fix mddev->kobj
lifetime") dropped the explicit kobject_del() and lets the final put do
the removal.  md.c already tests mddev->kobj.sd for "is this array
published yet" in mddev_unlock() and md_run().

This cannot deadlock against add_disk() itself: device_add_disk() only
opens the disk to scan partitions when get_capacity(disk) is non-zero,
and md_alloc() does not set the capacity - md_run() does, long after.

Fixes: ca39f7502425 ("md: fix mddev->kobj lifetime")
Reported-by: syzbot+95eeb4ada2349a2170ea@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=95eeb4ada2349a2170ea
Cc: stable@vger.kernel.org
Assisted-by: LLM
---
 drivers/md/md.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 680b34a63cb3..e3326b78aef7 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -8610,6 +8610,15 @@ static int md_open(struct gendisk *disk, blk_mode_t mode)
 	if (test_bit(MD_CLOSING, &mddev->flags))
 		goto out_unlock;
 
+	/*
+	 * md_alloc() publishes the gendisk with add_disk() before it has
+	 * initialised and added mddev->kobj, so an array opened in that window
+	 * would let ioctls reach a kobject that is still all zeroes.  Wait for
+	 * md_alloc() to finish rather than handing out the device early.
+	 */
+	if (!mddev->kobj.sd)
+		goto out_unlock;
+
 	atomic_inc(&mddev->openers);
 	mutex_unlock(&mddev->open_mutex);
 
-- 
2.55.0.windows.5

