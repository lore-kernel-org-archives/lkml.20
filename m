Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA514CCDE5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359982; cv=none; b=BzUHOcFDn2E0SwgqNFAyZbkRR8IjMWDUtnAm/2vmjDEVZ/7cwY5YKvNsgalRes9jZetgjwbAnondSpQbuUvYR7hRUONaQ8AI9uD11YifeNUJbp2p1cLas0HCUIJEOmnfLcMtQOWQcOIE2qB5iNKtj0eFUzX/bkT7pNt2ipS9CKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359982; c=relaxed/simple;
	bh=jBq5Px3lxWVUuz3qdC9+mTZLglquEoJ9xadtr2+LjZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iYU9+7dY4CYGOxOfmhRCXf3aCeak/ePehakH2fwXXO5I463qU84sBcXOyAr1zKp19dQ/TxWjgoFUyVI3yYy5EK486fdHr8GRHz/99MXV0Xwy7EOKha9rC256Mo1J3a3UPvzSv+5PfpC6fC3PVD5cx5DXSGVfVQUYRR2WQpAftlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=CCAvDTkR; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="CCAvDTkR"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-52d8748cde5so10360021cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1788359979; x=1788964779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0fr38LIz2S8Bi8HtZCPkWVnH8lehFnm0tX13ZRKuvVM=;
        b=CCAvDTkR48raJzgevBU93aWHtOLk7r/TFX6HjjLPYH8ek9hyKtimLsDfwmKMn3/2Yg
         1MFecsSLlOdUrT2aNHBng67+k1jCeK32aib5MNk1eD47/i8U6w5m8+Z/XMgW4E/NBTDc
         U3relaU8e2d9wOehn3X71IG2tgL7N869937Qa7kToqVkT0D3YnFhM0A+ey7gw65O3wjc
         fFW5QyRO1C9xgvfOlAGK7Xj4xNo0b5vLxZOecdaMOVVsc7xsOVoKiqHyWAjp5/qiwIRL
         L6Ict55ZoczBTHe6bMP1Jx9klQYsY2bshzi+iRVepD8i2pZKtTId45MITXwYKUYwrnyd
         5boA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359979; x=1788964779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0fr38LIz2S8Bi8HtZCPkWVnH8lehFnm0tX13ZRKuvVM=;
        b=qLjyKbTWdMRVr3JfDDkcWEcxsBrQdEQNT4jCDUQzdJSstVbpRwpsJrnRWJqGLyM2JP
         dkbFrNhIwWQzl+CZq1xTTaGlDNolOrs+N3YLVhsCF09yBLCDTh3XcKdh4HLcu4Fh+Sxu
         JxbYC5+cFzOiavP9rANutYJtVBLUUFO7/guw3SM8o1P/CcMkfgqggrBcPddYBcsNem94
         se1jgpFgYn6GR/f9nKvFRmkdWCosNJtWjpRRIaf7ImiWYF78wVhUyspOd1VGzygukq/T
         Es5hr4HTEOBmLh4bsaFe2lXgS9r6YsM/tJ0CDGburVgV99sAYzIKSrr9BHUZ8r4fyP4x
         Og1Q==
X-Gm-Message-State: AFuF++nCn9EZ7VfXkwuowp5nJsqJSkEp/1ffsbnRnq2rStPczFY/WmwZ
	MjdRasBPnbeUb2yqw6cOo9bPHPG2nWJsdqGuRD5T2JywGkY2xEQggaZkxognP0SkR3vR/1M0B37
	FVMnfbg==
X-Gm-Gg: AR+sD12KvJCWne70g5qmtTt1tw24SgxC/efY3SVOGHm4qHU4LBPoNEr40+Nht38m5QR
	a9rf14G/Ccd/OnZh+yk+M+TfFRG3yBFUOkkYiMCcYcHQsjZz8YjRBTHH/wRT8E3P7aSmkJj2ZYL
	fhNhuC8iqxgiTtI0d9601P89B0i93oeQBfHzKRea6MR0Q29SG+DOdbqDh6/MRnIiQCUrqGwoVPP
	dfSgvTnD5TXuM5O5BW3hLC/4ZdQbtCnthZgv0RkLpw0QILV+KdpmaI145xG8iIzkg5SoDH5DH1j
	4eF71P5FJKwHp9UCLi2yXO3JVffeGpsFL/59YSiSOQM7/cBCTxoyDyD54EVKflWKe4A+aCwKOb6
	ZeeT0l/C9fk3Urq21S9rzPa6mzEZSzrX41GzXCD4uF2bdxHinlDM0zzoIFq1E3xtv1ce6+d/1vk
	CYuycSNQyGLBOZaUCLHtbJprBBgjL2H7B+IJMxCCKVnstYiX7tsvLQHIP2q//68XqzDK3Ur3fyP
	5HTxHhj/iA8uJVelPjtwg==
X-Received: by 2002:ac8:5fca:0:b0:530:2146:81c with SMTP id d75a77b69052e-53036c01cd3mr53539651cf.12.1788359979266;
        Wed, 02 Sep 2026 07:39:39 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53032ff0e44sm20252211cf.5.2026.09.02.07.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:39:38 -0700 (PDT)
From: hengyul@cs.unc.edu
To: hirofumi@mail.parknet.co.jp
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2] fat: calculate data area start without overflow
Date: Wed,  2 Sep 2026 10:38:58 -0400
Message-ID: <20260902143858.4092293-1-hengyul@cs.unc.edu>
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

Calculate dir_start and data_start in u32 using
check_mul_overflow() and check_add_overflow(). Since total_sectors is
also a u32 value, any result that overflows u32 cannot describe a valid
volume. Reject such layouts before storing the values in the existing
unsigned long fields. The existing total_sectors check handles values
that fit in u32 but still lie beyond the volume.

Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Changes in v2:
- Use u32 temporaries with check_*_overflow() instead of u64 arithmetic.
- Check the FAT multiplication and both additions before using the layout.

 fs/fat/inode.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/fs/fat/inode.c b/fs/fat/inode.c
index f775a004cae1..020138ce35a6 100644
--- a/fs/fat/inode.c
+++ b/fs/fat/inode.c
@@ -20,6 +20,7 @@
 #include <linux/blkdev.h>
 #include <linux/backing-dev.h>
 #include <linux/unaligned.h>
+#include <linux/overflow.h>
 #include <linux/random.h>
 #include <linux/iversion.h>
 #include <linux/fs_struct.h>
@@ -1577,6 +1578,7 @@ int fat_fill_super(struct super_block *sb, struct fs_context *fc,
 	struct msdos_sb_info *sbi;
 	u16 logical_sector_size;
 	u32 total_sectors, total_clusters, fat_clusters, rootdir_sectors;
+	u32 dir_start, data_start;
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
@@ -1763,20 +1764,27 @@ int fat_fill_super(struct super_block *sb, struct fs_context *fc,
 
 	rootdir_sectors = sbi->dir_entries
 		* sizeof(struct msdos_dir_entry) / sb->s_blocksize;
-	sbi->data_start = sbi->dir_start + rootdir_sectors;
+	if (check_mul_overflow(sbi->fats, sbi->fat_length,
+			       &dir_start) ||
+	    check_add_overflow(sbi->fat_start, dir_start, &dir_start) ||
+	    check_add_overflow(dir_start, rootdir_sectors, &data_start))
+		goto out_invalid;
+
 	total_sectors = bpb.fat_sectors;
 	if (total_sectors == 0)
 		total_sectors = bpb.fat_total_sect;
 
-	if (total_sectors < sbi->data_start) {
+	if (total_sectors < data_start) {
 		if (!silent)
 			fat_msg(sb, KERN_ERR,
-				"data area starts beyond volume (%lu > %u)",
-				sbi->data_start, total_sectors);
+				"data area starts beyond volume (%u > %u)",
+				data_start, total_sectors);
 		goto out_invalid;
 	}
 
-	total_clusters = (total_sectors - sbi->data_start) / sbi->sec_per_clus;
+	sbi->dir_start = dir_start;
+	sbi->data_start = data_start;
+	total_clusters = (total_sectors - data_start) / sbi->sec_per_clus;
 
 	if (!is_fat32(sbi))
 		sbi->fat_bits = (total_clusters > MAX_FAT12) ? 16 : 12;
