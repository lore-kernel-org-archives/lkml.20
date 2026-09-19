Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB8547C101
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789817125; cv=none; b=GZYnFZ8vRtBjk30RZgoY332RuwhU+ALc/5MtmlJ2Jlbzh17ASDSTadSUQCdi9JETYRVA1orxhuHWTpFEYbvnSyHzF2CFDalFmM7inX7FFEn0Fqfme4blnYm4tITnqk1+wVXYQOCOORXc5FDSeOtMrXTH8Yv49WrBkuKQ5KLMkuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789817125; c=relaxed/simple;
	bh=7j+xFxO/ic+gNRavnxLFazQZg4CcRBGnqlrw76SzB6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p7zOhSXFOsIwDFZyks49UEAdxLOGHzd9k5+/ZQndUnWavTFcxa5f5G/lhlJjvJ3V5u6Mwme5+89qXdip4tnhHo4i1vzPaq+iq6kfDYt+0x08qqLTLdNVn2syoWZTD9iE17g31tl1w9T63LK9VxMMkvOjaEeGGpnNT0hXvssq/E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYrAuqt+; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYrAuqt+"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86b90133ae8so1157705b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789817123; x=1790421923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZKZEJ7clvUEKbIiw+Va500u7wS7OlgwOooeQkScQSs=;
        b=AYrAuqt+BpmFLADrFFaDMFvODKG6uSVppWrOlQZVSo78gYVD0tTCtCeavdkAKX+rsy
         BwI9Wj/V3SRJZGPK1LvZaDgOyV83+3B9hie50YyUmAMHBx0+1R2eE68FZdBQql0C7DbI
         gbuhBKkvQ5IWyhvRrfg0K4z2EW1SSNNVaccC7bOl9Q2JyCZuinJ7u/S5uGWF6rpW0zvX
         n12VsPlU+xAigInrD+wjTNh8U6l9zEegmZFMVuHRZ5xIvivWwetD9f0nW1Nc8GRt/sVY
         XsoJJgsU0fQvoWAij09doCzVoCeuSBn2tbXifioRNMZ7XD815TS41fFpeCUC1fpQfNqv
         1evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789817123; x=1790421923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TZKZEJ7clvUEKbIiw+Va500u7wS7OlgwOooeQkScQSs=;
        b=RmV8V+UoCi1M6Jk0jrR/kfakbnk0j9/qyL+fb8ZLWh7EmXgBWZc9tL/sgINyNp/90X
         BAhBV4VpQt1JVjg68tVvf5NWr47gSVh29LURTPf88yt1A/hYeiajeOtjhqtqyYLiEq46
         O7FGWgf2mUCpODwa4u+HSSrhO1b7Rr5cYFwCxcQomypiwp6gFhWAaJgpqrfJyftektjB
         l8pIiWbXkDi639fEn/B5bEBnYHAMJSf2A7sGSR7Q4YIJ+xChexQvoenDfAcMvvYM0hpe
         7M2KuZ4KVMpqsgch9GnwqkkQ7GqJXigov3FJV3HNnnRuh7oY6akkPerdWIjpf2WflKPg
         xcRw==
X-Forwarded-Encrypted: i=1; AKwUvBzD0qYopcoDytwPysRSTHn6iEbzcSVK/diHnUgrmnKOKgIE7TiiwRaCqGmZmbeo5TVo+976yTMdeYpnjkc=@vger.kernel.org
X-Gm-Message-State: AFuF++lwXqCB+7omUO2ep86cdK5KxEpiq+lEX4EpF0gbdI/tDhURMlXC
	yZDioFjvLSorAZXliCTDm/LI9xMuykNCUo3OsVWzH0TrZUjQXD6j+X/X
X-Gm-Gg: AYBFou2dgJgAg7lrl7HqDW1oMSb8GnMGC+ZuqFXlgtp4mnKbIkwPDZNUjDSE72j5ofI
	mIAKJ2ujDct/CEvb646adhtyM6JTrO16KVtH+0iEBLEvrF/PPorU1rDl9cbPbC1YKXe5o+fh5XI
	XNQaOyIH5P6xv/hFOqItTZvjBBWr90gO+0NfUxpTFz1giCM6aqs01xaSa5VqJriawNRpeQnKJP8
	3+epPQ3OT3Jy8VcWF/CC2gIfvPgNvKWILdT1lJP2TONbJzvnbPAQXv8b3EO18pKi5QX/8wl29Ld
	mSQH/yR0NwW+V1AwJAj2OL/ZkcomncNxUQIgkjYA708zKqITmGHT6jW09UMoS5WO7EFo1AvVtBr
	ZJ3aUOBjdvmSPx/hmYSoObQ/WKK5/9CCnD5ro0sRLdQHXzStT2PH5zOuqHVRsaw73G1KipUgtmd
	ImP2zdt+JIqjeepN0wPTJqsrjtHYbivO5YWjiFyZBSgg1X/89/3ePWyd8UQE0MMQWJOHC95JDMz
	uSGmK5tLNP8B93LuqPOmP9UnJDW7Fi5YynVA4jKSjEYPn3jknsLt65tOhroLOiPKqT9IQ1cWiac
	2Aoz9XCBM/wPaVQDbxJZ
X-Received: by 2002:a05:6a00:4409:b0:872:b1f1:aa8d with SMTP id d2e1a72fcca58-874dc0f8b95mr8056020b3a.14.1789817123254;
        Sat, 19 Sep 2026 04:25:23 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa6fb40csm958312b3a.58.2026.09.19.04.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:25:22 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: song@kernel.org,
	yukuai@fygo.io,
	magiclinan@didiglobal.com,
	xiao@kernel.org
Cc: linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] md: reject raid_disks >= MD_SB_DISKS in md_set_array_info()
Date: Sat, 19 Sep 2026 11:25:22 +0000
Message-ID: <20260919112522.3872315-1-benquike@gmail.com>
In-Reply-To: <20260919091118.3272955-1-benquike@gmail.com>
References: <20260919091118.3272955-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

md_set_array_info() copies info->raid_disks straight into
mddev->raid_disks without any upper bound, while also setting
mddev->max_disks to MD_SB_DISKS for persistent arrays. The resulting
mddev is internally inconsistent: raid_disks can be far larger than the
number of devices a v0.90 superblock is able to describe.

super_90_sync() lays the device table out inside the single page that
holds the v0.90 superblock and picks slot numbers starting at
mddev->raid_disks:

	next_spare = mddev->raid_disks;
	...
	desc_nr = next_spare++;
	rdev2->desc_nr = desc_nr;
	d = &sb->disks[rdev2->desc_nr];

sb->disks[] only has MD_SB_DISKS (27) entries, so an
ioctl(SET_ARRAY_INFO) with raid_disks = 1000 followed by any operation
that writes the superblock walks tens of kilobytes past the end of the
superblock page:

 ==================================================================
 BUG: KASAN: use-after-free in super_90_sync+0x1c5e/0x20c0
 Write of size 4 at addr 0xffff888009623c00 by task init/1

 CPU: 1 UID: 0 PID: 1 Comm: init Tainted: G      D W    7.3.0-rc3-g5dd1818b15d9 #3 PREEMPT(lazy)
 Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
 Call Trace:
  <TASK>
  dump_stack_lvl+0x4d/0x70
  print_report+0x153/0x4c6
  kasan_report+0xda/0x110
  super_90_sync+0x1c5e/0x20c0
  md_update_sb+0x850/0x1e90
  new_level_store+0x11a/0x190
  md_attr_store+0x12f/0x270
  kernfs_fop_write_iter+0x323/0x4e0
  vfs_write+0x54f/0xde0
  ksys_write+0xfd/0x200
  do_syscall_64+0xda/0x4b0
  entry_SYSCALL_64_after_hwframe+0x77/0x7f
  </TASK>
 ==================================================================

Reject the request before mddev is modified. Non-persistent arrays do
not write a v0.90 superblock, so the MD_SB_DISKS limit is only applied
when info->not_persistent is clear.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
v2: Add a Fixes: tag. v1 said the check predated the history I had; I
now have the full tree, and it really does go back to the initial git
import - set_array_info() in v2.6.12-rc2 already did

	mddev->raid_disks    = info->raid_disks;
	mddev->max_disks     = MD_SB_DISKS;

with no bound, and super_90_sync() already seeded next_spare from
mddev->raid_disks and stored into sb->disks[rdev2->desc_nr]. So
1da177e4c3f4 ("Linux-2.6.12-rc2") it is. The later commits that blame
points at are not introducers: 7e0adbfc20c5 ("md: factor out
md_set_array_info") only renames set_array_info(), and 86e6ffdd243a
("md: extend md sysfs support to component devices") only restructured
how desc_nr is chosen.

The reason the MD_SB_DISKS limit is gated on !info->not_persistent is
1b3bae49fba5 ("md: don't impose the MD_SB_DISKS limit on arrays without
metadata"), which moved max_disks = MD_SB_DISKS inside
if (mddev->persistent). Arrays without metadata never write a v0.90
superblock, so the limit must not apply to them.

Reproduced on Linux 7.3.0-rc3 (5dd1818b15d9) with KASAN under QEMU:
create an md array over a loop device, issue
ioctl(fd, SET_ARRAY_INFO) with raid_disks = 1000, then write to
/sys/block/md0/md/new_level to force md_update_sb(). With this patch the
ioctl fails with -EINVAL and no splat is produced.

Note that raid_disks_store() has a related but weaker check: it bounds n
against mddev->max_disks, which is still 0 before any superblock has
been loaded. I have deliberately not touched it here, since an
unconditional MD_SB_DISKS limit there would break v1.x arrays with more
than MD_SB_DISKS members. It may deserve a separate fix - input from
the maintainers would be welcome.

 drivers/md/md.c | 4 ++++
 1 file changed, 4 insertions(+)

--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -7926,6 +7926,10 @@ int md_set_array_info(struct mddev *mdde
 		mddev->ctime         = ktime_get_real_seconds();
 		return 0;
 	}
+	if (info->raid_disks <= 0 ||
+	    (!info->not_persistent && info->raid_disks >= MD_SB_DISKS))
+		return -EINVAL;
+
 	mddev->major_version = MD_MAJOR_VERSION;
 	mddev->minor_version = MD_MINOR_VERSION;
 	mddev->patch_version = MD_PATCHLEVEL_VERSION;
-- 
2.43.0
