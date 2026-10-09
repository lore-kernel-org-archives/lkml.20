Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357134BFE74
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543561; cv=none; b=ZJLnC737GiGwW4e86QPE3aiFppXsRnCuPERwini6fRoiR9kw8p+bGDxTiw1ZT2wJNGcJXwK8zkDgO4B3pg+FEBtSiEihJ8S6jvxS4coYqDz5WNsYL/OuhvcJe+ctnjsLoParXzgYv1XNigAKrOSE0rgonP1CXgpWxKOIpQ3r65s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543561; c=relaxed/simple;
	bh=a0jEwFQDeKtuY0RsGtBE4XNL+Pk7zbDs/waQJ4hgjJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YQvv/K9ZNCSPFZsVZpXemzdYbSAbvxp50pf6ZDLMKPO4qh85p6Buu7zSGOULJe0+4M9yhNbToWV7wmsSwa+9zzwFwtlEGzw8vjpY12CKSuRhQKSdKI2+x79ZbvCmiWVQn/b3Nct14tKkmheCXBBPpRKbA2/V5e467PLGEGsPQnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b7Efk1gV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b7Efk1gV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C031F000FF;
	Fri,  9 Oct 2026 10:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791543552;
	bh=tfLCHx9ts12uhEo+xZi32GpJWOlrmmwc1JfHCdulA5Q=;
	h=From:To:Cc:Subject:Date;
	b=b7Efk1gVNdB9Mbiz1g42TNzSLLEpP7Hc5khsdGD/ZOIDvcotapl6vHxyzGzdqAT06
	 NavdGBI45bvfM65QiTd6LZGP65uPp2QG9SJYyiM5m3bV1uCud3t9NrcChOeL55AmeA
	 FS5MEqWlQqAyutE8LS+OcJCH41QWlFd/flL87whfdRbUVgTZuPgO4eBwgCxOC0WD4p
	 /4+DipKaRjaSOs3flQytNK3tMPqYj8wwieU67sXTe62uWOMsFiv+DqTlNqxV5QFdmn
	 bdxO2Erp0H+8AX4/GZTAKHIZx7/NIO45DJgayPWA1p4PKZxYGs8CFbIarxCRFLr8k/
	 TTZC9F/mLi3tg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org,
	Daeho Jeong <daehojeong@google.com>
Subject: [PATCH 6.12.y 1/3] f2fs: fix to reclaim space in f2fs_allocate_pinning_section()
Date: Fri,  9 Oct 2026 10:59:04 +0000
Message-ID: <20261009105906.1861478-1-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

[ Upstream commit fa487f56efba6344aef67d871688f0908fe08af3 ]

It needs to trigger checkpoint to free space reclaimed by f2fs_gc_range(),
otherwise, fallocate() on pinfile will fail easily even there is slash
space in conventional zone.

[Testcase]
nullblk_create.sh 512 2 1024 1024
mkfs.f2fs /dev/nullb0 -f -m
mount /dev/nullb0 /mnt/f2fs/
touch /mnt/f2fs/pinfile
f2fs_io pinfile set /mnt/f2fs/pinfile
mkdir /mnt/f2fs/dir/
for((i=0;i<3934;i++)) do { dd if=/dev/zero of=/mnt/f2fs/dir/$i bs=1M count=1;} done
sync
for((i=0;i<3934;i+=2)) do { rm /mnt/f2fs/dir/$i;} done
for((i=0;i<1950;i++)) do { rm /mnt/f2fs/dir/$i;} done
sync
f2fs_io fallocate 0 0 $((1024*1024*1024)) /mnt/f2fs/pinfile
sync
stat /mnt/f2fs/pinfile
f2fs_io fiemap 0 $((1024*1024*1024)) /mnt/f2fs/pinfile

[Before]
fallocate failed: Resource temporarily unavailable
  File: /mnt/f2fs/pinfile
  Size: 109051904       Blocks: 213208     IO Block: 4096   regular file
Device: 250,0   Inode: 4           Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2026-08-12 20:04:02.264000000 +0800
Modify: 2026-08-12 20:04:26.784000000 +0800
Change: 2026-08-12 20:04:26.784000000 +0800
 Birth: -
root@localhost:~#
root@localhost:~#
root@localhost:~#
root@localhost:~# f2fs_io fiemap 0 $((1024*1024*1024)) /mnt/f2fs/pinfile
Fiemap: offset = 0 len = 1073741824
        logical addr.    physical addr.   length           flags
0       0000000000000000 0000000002e00000 0000000000200000 00001000
1       0000000000200000 000000002dc00000 0000000000400000 00001000
2       0000000000600000 000000002e400000 0000000000600000 00001000
3       0000000000c00000 000000007a400000 0000000005c00000 00001001

[After]
  File: /mnt/f2fs/pinfile
  Size: 1073741824      Blocks: 2099216    IO Block: 4096   regular file
Device: 250,0   Inode: 4           Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2026-08-12 19:47:49.428000000 +0800
Modify: 2026-08-12 19:49:06.808000000 +0800
Change: 2026-08-12 19:49:06.808000000 +0800
 Birth: -
Fiemap: offset = 0 len = 1073741824
        logical addr.    physical addr.   length           flags
0       0000000000000000 0000000002e00000 0000000000200000 00001000
1       0000000000200000 000000003aa00000 0000000000400000 00001000
2       0000000000600000 000000003b400000 0000000000200000 00001000
3       0000000000800000 000000007a200000 0000000005e00000 00001000
4       0000000006600000 0000000002800000 0000000000200000 00001000
5       0000000006800000 0000000003200000 0000000000400000 00001000
6       0000000006c00000 0000000003000000 0000000000200000 00001000
7       0000000006e00000 0000000003600000 0000000037200000 00001000
8       000000003e000000 000000003b200000 0000000000200000 00001000
9       000000003e200000 000000003a800000 0000000000200000 00001000
10      000000003e400000 000000003ae00000 0000000000400000 00001000
11      000000003e800000 000000003b600000 0000000001800000 00001001

Cc: stable@kernel.org
Fixes: 9703d69d9d15 ("f2fs: support file pinning for zoned devices")
Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
[ Chao Yu: backport to 6.12.y:
  - retain existing f2fs_up_write(&sbi->gc_lock) as 6.12 lacks lock tracing ]
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 30ea0b7fb1fb..328799ec670d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3267,10 +3267,13 @@ int f2fs_allocate_pinning_section(struct f2fs_sb_info *sbi)
 		err = f2fs_gc_range(sbi, 0, sbi->first_seq_zone_segno - 1,
 				true, ZONED_PIN_SEC_REQUIRED_COUNT);
 		f2fs_up_write(&sbi->gc_lock);
-
-		gc_required = false;
-		if (!err)
+		if (err)
+			return err;
+		err = f2fs_sync_fs(sbi->sb, 1);
+		if (!err) {
+			gc_required = false;
 			goto retry;
+		}
 	}
 
 	return err;
-- 
2.49.0

