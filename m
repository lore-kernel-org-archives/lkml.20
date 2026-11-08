Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794110558;
	b=HT+hSzY/jypTnCzmVBb63n6iOHE+/mDGdvyjo7C08JFgdJWHRD7RpgXaMp0pkXrZaGQy
	 AL57ZQndPjUbWoLnEa2vLtoE1X8pYPvQC8pdNBVbISsvJ7dT4OmidCjzHZFMnIEwT2wgJ
	 Muhd+Z8ZX+UEVbLESCm5pIKW6A9OUqpZmp7/Sjp0MhzTd7J39rAZHbE3XvH6mf3w7/XUs
	 iaOSuKpuP8bifBYiOcd6TZ7kDmQ3HkXVIL/dPEzyZSfm6ai6NTFRjJFSX3YL0FPJ3uRS1
	 cN/zgkQeS3vPznL2dgaQxMdSz0rHoVMk2bOa8Ds2bFlbc1aOMyH7B74RCNu0ncqR4ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794110558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e0N7bDNBnjqR8M4GFFj2K3/PwmzbihKT+GB9kbAlZp4=;
	b=u/opWxLJS9fv0ausbg4Z8b4F99wymn+nInWzkH8WfTnAg04AsMlxf6ECspElV0CNekwG
	 SLoLnYhwxaW+e6ImodilSnMJ+TJcTfxzBxceSMNQb4HNKFGxcDlAKY2f6Oaj5S1uUBJ6d
	 cuk50FpRfe0mvmTcGdH/UIF4/pXr+xYVxtU/8rXIF5CeZwvoZb1CGOI5o7s3vQqCj5cN6
	 Kr5fLY6slt6AYeSqz5W5ADmT5Acsh1w+DD9qW4nQHuL1UFVpYRqodRPgMsKUNDWf84tBW
	 tEKowuMWSmov8StGtemLxYaMTBbBVBtjW6gr5JG/OOuBx81gnVYjY8z/7mcK5PklF8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="R/A11VeQ";
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6A8606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 04:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F6A8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R/A11VeQ
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc758830601so88421a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 20:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794110557; x=1794715357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e0N7bDNBnjqR8M4GFFj2K3/PwmzbihKT+GB9kbAlZp4=;
        b=R/A11VeQmxpu+8xWracH1Bgz6odPsP7JVYaH2zLTe3hxDh6maT4GQr+yrEq3xHdH1g
         USPwhFyE4qUJD1/PgblFfe1ESmYqQVMyAF14nBrUPurtzhaGIsEs5YKpRqpXV/S9Ofxr
         /D8zdHmczgFDQiIZ9sK9Uft7NYG1O+K5Nl830KZavsSqtoFTk9UesADYyGexzb7Twfyl
         SsLNyVDt1DHbdrfL8zFF1QwBQWTYyvqZoQDxxWzU0mWTA7dOBPmqyJlj6/g5scSKj0Kb
         hYjl4g7Qj6SBFn6I5c/bP/WtItJRJxA7Gekfb+9B4zQLdfexUfEfA7Rc+nGSbB9R4mNd
         v5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794110557; x=1794715357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e0N7bDNBnjqR8M4GFFj2K3/PwmzbihKT+GB9kbAlZp4=;
        b=wbjaK+86JjCiWOik9rUxKfWq5EZvQsLvLCJ+121EoZXph7Pfx1+olJ2VcdyCi27sHK
         FgTYEsOfg9zb3i+qWwJWxdxEEwiR2YOYB6apJn9IUAZgnkqFYew1Z+WyJOs+M5/Rwb+x
         dw0SaPfDtFtGZ/XLKASC7D2FarTcvepa/HOm0s/GY8RJV1u3SYLj4USYfi3yLL9A65qj
         3mJkdfQLHTsYnxlh+aleyMfqKCuurPc/AjjjD6JamKJav9OhiGCowP8SL5ccy7bgoET+
         tkOTvMGS45QVHRXybBN4fSPaaWe6o4F6MrJhM9qUddTd/IgC5OZf/PYXHo07MCuJ/Ya/
         aDbA==
X-Forwarded-Encrypted: i=1; AL+hErHIZK6fEntMBq+rrVZgAMO20qL6uNp1rs1AvUfeHTi6UvnQ6JMj8hQk5kRlmF05M0ep8q/27A7wef+8dC8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bkfA8qkYnmLRXUBUhku9cttqYqzCB2flUiItqjZ/Uw/BRxVKy
	gOF66trWBCOOMw4Z9x2M6ggftW0e2zgEqitDfRpMl2nzn7FWPL8wWj9y
X-Gm-Gg: AYBFou2gb07L2A5evtceKy2SARqqJ6oJ9GtrzAKyaBmQI30gE7CwDwmySCkzxNnoA2d
	EnehQ9Rcy6CWBh00Nx42QYIRaVa9voKsUio94a6GfjpEL91e8rM7JY/eETgDxOBJ4wtpeTlC0F8
	JyDc8agt+1wOcko1jOpJw1KBa2o+nr2CPpWXmiB+hE9vhAUsCERHSLFEvYrHNBrkMJ5SnqAt2Jy
	tPlWxgH/LBBCvQR4YfseJmu9aTGwbLZg1IjOdkeVu29xDvaSI+Qrv0ZsZ1NwV79jjDaZM3w88aS
	T11PEFBiJzhA8B+XSeCnjhIiWLQAjtrIEkdYdsWMEbr+kYWBNXMNFo62CpH9zHonaaCOXT2fpfg
	0KuSKXtP5h16N9U0W4rU0jUPJh3928+bWUq9qFCBTLPE3uVyar2R9kMzYG90N9RrcoQXRMGAlvP
	oXQK1X9EG6sDl9POTqZvJHnR46lND+/q4PVFfnwZr3fiHraZqgiFcN0bl1j0MMzhBPAHAfUk4vR
	jykwf07Fkh1OAG7+fEsdIkoA6Ioxtve4+cvDpWMBtoSnG0z+YnVOxJMlyce3MvcVZlKRI93Llxb
	2XZiN3Fb1H6O4Dy8LsH+mksc7M1Y
X-Received: by 2002:a05:6a21:498e:b0:3e2:1160:6d20 with SMTP id adf61e73a8af0-3eecf97ebf0mr699131637.3.1794110556714;
        Sat, 07 Nov 2026 20:02:36 -0800 (PST)
Received: from thangnn-ASUS.. ([2a09:bac1:7aa0:50::498:71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969314a5sm295406a12.17.2026.11.07.20.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:02:36 -0800 (PST)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fygo.io>
Cc: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	Li Nan <magiclinan@didiglobal.com>,
	Xiao Ni <xiao@kernel.org>,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+0a8119ab801b078213ea@syzkaller.appspotmail.com
Subject: [PATCH] md: don't ignore bd_link_disk_holder() failure in bind_rdev_to_array()
Date: Sun,  8 Nov 2026 11:02:32 +0700
Message-ID: <20261108040232.43694-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bind_rdev_to_array() adds the rdev to mddev->disks and then calls
bd_link_disk_holder() without checking the result. If the link fails
(e.g. an allocation failure in the holder or symlink setup), no
bd_holder_disk is recorded for the member, but the rdev stays bound.

Stopping the array later calls bd_unlink_disk_holder() for every
member, which finds no holder and warns:

  WARNING: block/holder.c:147 at bd_unlink_disk_holder+0xd8/0x2d4
  Call trace:
   bd_unlink_disk_holder+0xd8/0x2d4 block/holder.c:146
   md_kick_rdev_from_array+0x8c/0x324 drivers/md/md.c:2683
   export_array drivers/md/md.c:2714 [inline]
   do_md_stop+0x708/0xe6c drivers/md/md.c:7252
   md_ioctl+0x14ec/0x23e4 drivers/md/md.c:8462

Link the holder before registering the rdev kobject, fail the bind
if it cannot be created, and drop it again if kobject_add() fails.
All callers already export the rdev when binding fails.

Fixes: e09b457bdb7e ("block: simplify holder symlink handling")
Reported-by: syzbot+0a8119ab801b078213ea@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0a8119ab801b078213ea
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Tested in QEMU (x86_64, KASAN + lockdep + failslab) with a reproducer
that sweeps fail-nth over ADD_NEW_DISK on a RAID1 /dev/md0 backed by
/dev/ram0 and stops the array after each attempt:

  before: ADD_NEW_DISK returns 0 after the holder link fails, and the
          next STOP_ARRAY hits WARNING at block/holder.c:147
  after:  ADD_NEW_DISK fails with -ENOMEM instead, no warning, and
          no KASAN or lockdep reports

 drivers/md/md.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 5b2add94631b..0ad8f298aa78 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -2618,9 +2618,14 @@ static int bind_rdev_to_array(struct md_rdev *rdev, struct mddev *mddev)
 	if (mddev->raid_disks)
 		mddev_create_serial_pool(mddev, rdev);
 
-	if ((err = kobject_add(&rdev->kobj, &mddev->kobj, "dev-%s", b)))
+	err = bd_link_disk_holder(rdev->bdev, mddev->gendisk);
+	if (err)
 		goto fail;
 
+	err = kobject_add(&rdev->kobj, &mddev->kobj, "dev-%s", b);
+	if (err)
+		goto fail_unlink;
+
 	/* failure here is OK */
 	err = sysfs_create_link(&rdev->kobj, bdev_kobj(rdev->bdev), "block");
 	rdev->sysfs_state = sysfs_get_dirent_safe(rdev->kobj.sd, "state");
@@ -2630,10 +2635,10 @@ static int bind_rdev_to_array(struct md_rdev *rdev, struct mddev *mddev)
 		sysfs_get_dirent_safe(rdev->kobj.sd, "bad_blocks");
 
 	list_add_rcu(&rdev->same_set, &mddev->disks);
-	bd_link_disk_holder(rdev->bdev, mddev->gendisk);
-
 	return 0;
 
+ fail_unlink:
+	bd_unlink_disk_holder(rdev->bdev, mddev->gendisk);
  fail:
 	pr_warn("md: failed to register dev-%s for %s\n",
 		b, mdname(mddev));
-- 
2.43.0

