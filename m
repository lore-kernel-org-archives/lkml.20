Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1635F471269
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346684; cv=none; b=Gj/g2KlKsTdsTJbMNvthuaulc/AdTQEmG+LWhdoc/vJNZMO/BGk9n6ebFGaJIQjfUDZQ7hYbo0yB5U4dfMMctT88jyWa+t8DuNJrMvYvCPqTq3IwXSPVqdK8C9yNna5yk/Rroman+3/Ia69qhh+Dn2RmuZlZQU/YhwIXNl/UpmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346684; c=relaxed/simple;
	bh=prBIn1Zi26UBYqISNr+MVBWvz3Hb+qJJqMn9iobb4Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OQqdWRKJUpx5ZJSDiI5EMI3aA02sk4xeJnXGTquhcN9jQURrw1BIKT6L0Oh3ZZ3VEQG0QZMUc+COU/yq0ZcWXuiQ3JmbTLITGMyyHKNRpPDsCv22ae4KHvym0dwkp3zghC2pmW3Te/VFJ4nGwCfOUg9Ycr4DtkdA2HZEzGJk+yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=Aij9Y9XW; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="Aij9Y9XW"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-52d8679c149so8227911cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1788346680; x=1788951480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqzIA+CU3COvPsJdqe8AGN0DPM1FFqYKmN1H42pjbPc=;
        b=Aij9Y9XWoXNx97CO2JxSrSpSTF54J5bbs0J7acVYeH77URr1PfQY3rjqj7EIweaJfs
         9TwJz7l1H/YKcz9rPeFJPbu8mZXCwn63mHWtl5TrSK6Hj+1V9zdZNF9KJ4owXhVmFzmu
         OIUyXmNTbNZunPqtISwuoYhK3QCZhFKbCrI381VNu4AMG111ZswA29heKXXvbr/xitFk
         bP3S4BuT6s+TTZPVgT5nluQINgZftKZu0Q66W0PaTtMgsgBXxFPfI7Lwlf0N8ZOhyKvG
         6wR3XyZj+OvmXXtPDF62kapYrpI9b2qA2OakJpkUEroYKO3F09oociidbswPQQsjqQpD
         eNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346680; x=1788951480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqzIA+CU3COvPsJdqe8AGN0DPM1FFqYKmN1H42pjbPc=;
        b=EVejlZudt8iZuYQdu6Jxxb+M01u7nVKrhuibM7nMIavuhdIr5OoTKm4hcMXjaBD6g+
         sbaRxwKqjVTx26fPiSzE1Lpm2D+xXwrL60Yr1borsKWHQMnjfoOzFfZWINhnXu111AiI
         wu0646mqmY8Rkel+8zL1iU5uDm+BHk2+UKAqkbSKlF0siRawMvhtjolDZntqXnSyx7Bs
         /zAwtODA9LwRnXlCwZG2DnmEExNUUc4K3ZhiqGllms1g5S//cWxE845xW5QSC5i9qsee
         xjChHxZdtnx8aKULL0kjRKeapVgUezbZZNn531I3zEQ3u00svVEoa06s9815xSO7fYNy
         7FgQ==
X-Gm-Message-State: AFuF++ny4r71zvYB2UZlnr866J4DSVGoRDmYBtIeXC0bhbdw/+fSlgDM
	+s25ocnd4vQ257ytn8RdF2Xb1I/Fi9hOkGeh53Ax5irNJSW/ab8XQ9iNcGHr1fMx+gtKvCe8nl8
	f93K43g==
X-Gm-Gg: AR+sD10mkjA3ImopvZUsinjfbZMn8cwKvX6lPBd8u7UMwY7N8svkTOMyCtFeC1oTw+n
	YXswDY1GNZeAXW3iGeM0HWMvQUvhNurk5UXh8nlABSfDq6lj3hxAYbEWkZ8Wvoujcj/VivODdQJ
	ytbClXHuLYOVO5wFUuUIZQyteFfwr6nGINto6lTak/DZzuZrmJxJKUAEicKgdakqxrkl0uEgflS
	mj58k2qV7s5Uyj11TXXRkZhsKRTBW+W1VeekUWubKc2yUOA7slhmy6cJuIvr8UjSAKryG+CutrF
	woCthpohtXWyagWJYmeWgo44GytsUUOLxZdKrQacRaD4AxRmXFakgh0uOY5kDPqSlAS7L2/fN0r
	Z1dvNSEt3POeS743EBPCYDhTq6zl6ii+2llDMeiyLgX+FbYQChMNN8+apx2tfTdgK7NCiDRYBdh
	CcxjeOqJA8A5yEKonGUo14EZNuJfh9xpXI4LgYtVq46C562f1LNN3NVgLDukK4vaYpU6pIRcXrE
	G6uQpw2yuU=
X-Received: by 2002:a05:622a:309:b0:530:849:4696 with SMTP id d75a77b69052e-53036cefd25mr41504141cf.31.1788346680608;
        Wed, 02 Sep 2026 03:58:00 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec8482sm15344676d6.31.2026.09.02.03.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:58:00 -0700 (PDT)
From: hengyul@cs.unc.edu
To: hirofumi@mail.parknet.co.jp
Cc: linux-kernel@vger.kernel.org,
	Hengyu Liang <hengyul@cs.unc.edu>
Subject: [PATCH] fat: calculate data area start without overflow
Date: Wed,  2 Sep 2026 06:57:16 -0400
Message-ID: <20260902105716.3972118-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hengyu Liang <hengyul@cs.unc.edu>

On 32-bit architectures, sbi->fat_length, sbi->dir_start and
sbi->data_start are unsigned long. The number of FATs is an 8-bit BPB
field, while the FAT32 length is a 32-bit BPB field. Therefore, the
calculation

    sbi->fat_start + sbi->fats * sbi->fat_length

can wrap before data_start is checked against total_sectors.

For example, with fat_start=32, fats=2 and fat_length=0x80000001,
the unwrapped data area start is 0x100000022 (4294967330), but the
calculation wraps to 34 on i386. With total_sectors=36, the
validation then incorrectly passes.

The following script creates an image that demonstrates the problem:

    python3 - <<'PY'
    import struct

    S = 512
    b = bytearray(36 * S)

    def p(off, fmt, value):
        struct.pack_into(fmt, b, off, value)

    # FAT32 BPB
    b[0:3] = b'\xeb\x58\x90'
    b[3:11] = b'MSWIN4.1'
    p(11, '<H', 512)
    b[13] = 1
    p(14, '<H', 32)             # reserved sectors
    b[16] = 2                   # number of FATs
    p(17, '<H', 0)
    p(19, '<H', 0)
    b[21] = 0xf8
    p(22, '<H', 0)
    p(24, '<H', 1)
    p(26, '<H', 1)
    p(32, '<I', 36)             # total sectors
    p(36, '<I', 0x80000001)     # FAT32 length
    p(44, '<I', 2)              # root cluster
    p(48, '<H', 1)              # FSINFO sector
    b[64] = 0x80
    b[66] = 0x29
    p(67, '<I', 0x12345678)
    b[71:82] = b'OVERFLOW   '
    b[82:90] = b'FAT32   '
    b[510:512] = b'\x55\xaa'

    # FSINFO
    p(S, '<I', 0x41615252)
    p(S + 484, '<I', 0x61417272)
    p(S + 488, '<I', 0xffffffff)
    p(S + 492, '<I', 0xffffffff)

    # Wrapped FAT starts at sector 32
    fat = 32 * S
    p(fat + 8, '<I', 0x0fffffff)   # FAT[2]
    p(fat + 12, '<I', 0x0fffffff)  # FAT[3]

    # Wrapped data_start == 34
    root = 34 * S
    b[root:root + 11] = b'ESCAPE  TXT'
    b[root + 11] = 0x20
    p(root + 26, '<H', 3)
    p(root + 28, '<I', 4)
    b[35 * S:35 * S + 4] = b'OOB!'

    open('fat-overflow.img', 'wb').write(b)
    PY

Attach fat-overflow.img as /dev/sdb and run:

    mount -t vfat -o ro /dev/sdb /mnt
    cat /mnt/ESCAPE.TXT

On an unpatched i386 kernel, the mount succeeds and reading the file
returns:

    OOB!

On an x86-64 kernel and on a patched i386 kernel, mounting is rejected
with:

    mount: mounting /dev/sdb on /mnt failed: Invalid argument

Calculate dir_start and data_start in u64 using mul_u32_u32(), and
perform the total_sectors check before storing them in the existing
unsigned long fields. Since a successful check guarantees that
data_start, and therefore dir_start, does not exceed the u32
total_sectors value, assigning them to unsigned long is safe on both
32-bit and 64-bit architectures.

Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
 fs/fat/inode.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/fs/fat/inode.c b/fs/fat/inode.c
index f775a004cae1..b09185d204ce 100644
--- a/fs/fat/inode.c
+++ b/fs/fat/inode.c
@@ -20,6 +20,7 @@
 #include <linux/blkdev.h>
 #include <linux/backing-dev.h>
 #include <linux/unaligned.h>
+#include <linux/math64.h>
 #include <linux/random.h>
 #include <linux/iversion.h>
 #include <linux/fs_struct.h>
@@ -1577,6 +1578,7 @@ int fat_fill_super(struct super_block *sb, struct fs_context *fc,
 	struct msdos_sb_info *sbi;
 	u16 logical_sector_size;
 	u32 total_sectors, total_clusters, fat_clusters, rootdir_sectors;
+	u64 dir_start, data_start;
 	long error;
 	char buf[50];
 	struct timespec64 ts;
@@ -1752,7 +1754,6 @@ int fat_fill_super(struct super_block *sb, struct fs_context *fc,
 	sbi->dir_per_block = sb->s_blocksize / sizeof(struct msdos_dir_entry);
 	sbi->dir_per_block_bits = ffs(sbi->dir_per_block) - 1;
 
-	sbi->dir_start = sbi->fat_start + sbi->fats * sbi->fat_length;
 	sbi->dir_entries = bpb.fat_dir_entries;
 	if (sbi->dir_entries & (sbi->dir_per_block - 1)) {
 		if (!silent)
@@ -1763,19 +1764,23 @@ int fat_fill_super(struct super_block *sb, struct fs_context *fc,
 
 	rootdir_sectors = sbi->dir_entries
 		* sizeof(struct msdos_dir_entry) / sb->s_blocksize;
-	sbi->data_start = sbi->dir_start + rootdir_sectors;
+	dir_start = sbi->fat_start +
+		mul_u32_u32(sbi->fats, sbi->fat_length);
+	data_start = dir_start + rootdir_sectors;
 	total_sectors = bpb.fat_sectors;
 	if (total_sectors == 0)
 		total_sectors = bpb.fat_total_sect;
 
-	if (total_sectors < sbi->data_start) {
+	if (total_sectors < data_start) {
 		if (!silent)
 			fat_msg(sb, KERN_ERR,
-				"data area starts beyond volume (%lu > %u)",
-				sbi->data_start, total_sectors);
+				"data area starts beyond volume (%llu > %u)",
+				(llu)data_start, total_sectors);
 		goto out_invalid;
 	}
 
+	sbi->dir_start = dir_start;
+	sbi->data_start = data_start;
 	total_clusters = (total_sectors - sbi->data_start) / sbi->sec_per_clus;
 
 	if (!is_fat32(sbi))
