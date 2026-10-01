Received: from mail-oo2-f36.google.com (mail-oo2-f36.google.com [74.125.231.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E44148EC8C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790872498; cv=none; b=C8PIBywtQgnPyEwI5cC7JGe7vETaBU/lmpssfnOxoCP5yqnTQEYmOWYb3TRJL88BT/Q7Rkt850jzWcg11JsXAj5/UsNc3LKS8YtZKpyAlkKN3tun58Ascbtt9qYcOirsw32Z1rM3nw7iJRbKklMXLHXc1HkiKyenhEyw2xqW0W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790872498; c=relaxed/simple;
	bh=LCR2JBPCr9b9PvvbUIwHG1o1bbom3rQF9fJDcnI02NM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NW5eOlsyXz0+XeL1ijl7cbr0BPnnZys85jxPUStzEua4WMd6Ig+BjwTunaYdjK4TZhCj6LN8omRtIDqNLOe5BrjT24vrXO8iNI1SbV6EhmkchkQYh4h83FwiSysrcPGHmO2zPQFOAX50cL5qzrJnfbFpuNlUG6qHYiRpJRmmRoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nk20xKT4; arc=none smtp.client-ip=74.125.231.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nk20xKT4"
Received: by mail-oo2-f36.google.com with SMTP id 006d021491bc7-6dd42533365so1020162eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790872495; x=1791477295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ch59/OCcOGgQy9W6cxXyKxD4pGxnDPiLx3tiRY8B8Ow=;
        b=Nk20xKT4puAnw1nU6cKNmdsF8oWp2KX8tcnMec/SewOEHXtFMqZ0uPB0VWS/+VIzOn
         k5OzqmS6PMZL/Sg9lp9gl9G33C+cx04iIFCQ+SZt/D1d2KU3SzoRDGeg9XrM9WFD/rGm
         132Baf0CLgaBpxmDFVFhDSmUwR+sWlLWK4fKhm+BI/gHNjs/muOY4TxH+eu+0PlEqXg6
         15gMsElSLnnbRPuZKanHVYNZ66GJ9jp68vn6WU2Y0qMGhWouVAxIru3dPY4mPFqaIq5+
         ovV/FJ+AE2jQP9wQb+3QeE1+DYIRrt0XAHwbPJVFDOnH9k1BfngtrxXQPaYWdEBSye4t
         dsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790872495; x=1791477295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ch59/OCcOGgQy9W6cxXyKxD4pGxnDPiLx3tiRY8B8Ow=;
        b=x3lNwRITjA+UzUphC6zwFhYGnxBTIWuDmTbOaTfOoL7xA3fOkWJI2rzcBfi9UB/VQt
         7j4wogq45ddItVKdGho46ikv0scVja2hRRUePMcPgsSWsq1AKobnZ8BM1izqc7v85VWl
         3cdpg4jAAYRLIjMiZaWKpQtxHyMzliGjziip3vAGLvRSUjH3P9KiGPKfUslhr2h0vk0u
         IO9qPtF097GAiSIHQT+1mDyhhMw1gaxdmS9fPOgcz1jWOOuDxpPONPxMQV4qCWrzxSql
         fOlcZTbpeC1pXlxseF1IfBtHsYQiEm2b/2npxySaHTvzS8n7QqZVChxVDv0S9stmE4PY
         FEgg==
X-Forwarded-Encrypted: i=1; AKwUvBxDghnSBzxe231ql/VxRdx9ZuG4FO+MVzvK4Nn9LNOwjWEEaeoshnr4dt4Jq6byvb44e9wYvjYKzd026h0=@vger.kernel.org
X-Gm-Message-State: AFuF++k16hckHy9kGOOwIJVwBZgspZyAatNKQv+BuFH7wJcptOLn1+R+
	v+JinLYHFaeqvZPTTILoIg++OeiC1CETLS0OiLVDML7U0qntuQJSSXCg
X-Gm-Gg: AYBFou2p+zRRaZSun3qopbyPY4LToWN7Lh+0NNwJIhtK7U1nWyg4MVViMlbcD1V2Z+V
	FLlYxFnKHAaaBqBE39lzL57Ao4CsB5+7a+ptF5b2aNVUkZrcWBfLE0FcMGay7DMs7+DL8OvGKLO
	I92lz77mbO6+DDaZr11+sBHIkNEMRRgII2F372wYYbzvPTnce7T5CKBdDj2rsqLK4RKbXVnqlvd
	3Vqk/wVVi2VQyQcL+2c4GvKy0W7Ovq0jeau8kw2TPqYRFxeQsb5IcEaCneMhBoDm7NHz6K+x8vC
	iBGcO0hSKcKVzNAIDzALP0//EEZbH3Q3L3KomnO6s3rSj13CPRMnZAQezR38a8bshL52Nh5sJCz
	ygl79e9H6ogaIFdHRX3ww8hyz0/wYkhXHWvsgsSVS7R2qLPswaSiWqPpO8GD7LHwu8iPBwYqSfL
	5q0/EVOAZuyF6QxyyWfDVLXSCbuybBjMtkULIUr2HbbRTtH0PO3YE3S4ar1BWDVU0+h8POHIwH6
	ClJXn0vVVwHthC2otDQyu2v1AbwXal1qOFhbRJiUL4SbwUI7SjBzQlQiG5YScoQXNhSVRMxn2cb
	ro2LuCMetuYympDuAtPQYjF6LsDDIua+N4unptX9C6TwA2yPAzLbfcaHqR4=
X-Received: by 2002:a05:6820:4c87:b0:6b7:2cab:be91 with SMTP id 006d021491bc7-6dcf1ab37c6mr5559312eaf.10.1790872495191;
        Thu, 01 Oct 2026 09:34:55 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49ded33505esm2712687fac.18.2026.10.01.09.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:34:54 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jan Kara <jack@suse.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+799a0e744ac47f928024@syzkaller.appspotmail.com,
	syzbot+43fc5ba6dcb33e3261ca@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH 1/3] udf: don't let the extent type hide an exhausted free-space table extent
Date: Fri,  2 Oct 2026 00:34:46 +0800
Message-ID: <20261001163448.753190-2-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

udf_table_new_block() takes the first block of the free-space table
extent closest to the goal.  It keeps that extent's type and length
together in goal_elen, subtracts one block, and deletes the extent only
if goal_elen then reaches zero.  UDF 2.60 section 2.3.7.1 requires the
free-space extents of an Unallocated Space Entry to be of type 1
(allocated but not recorded), and mkudffs writes them that way.  For
such an extent the type bits keep goal_elen non-zero, so taking its last
block leaves a type-1 extent of length zero behind, starting at the
block after the extent, which is in use.

The next allocation that picks this empty extent returns that in-use
block.  Subtracting a block from 0x40000000 then borrows from the type
bits, and the extent becomes type 0 with a length of 2^30 - blocksize:
about a gigabyte of "free" space overlapping live metadata, the other
table extents and whatever lies behind the partition.  From then on
blocks are handed out twice, or past the end of the partition.

Extents that udf_table_free_blocks() adds are type 0, where the check
works, so only tables written by mkudffs or by another implementation
are affected.  Nothing more than filling such a filesystem is needed:
on a fresh 1 MiB "mkudffs --space=unalloctable" image, creating empty
files until the partition is full writes file entries over the reserve
volume descriptor sequence and the backup anchor, and df then reports a
negative amount of used space.

On syzbot's images the same double allocation is what the two reports
below trip over.  In the first, ftruncate() extends a new file with
enough hole extents to need a chain of allocation extent descriptors;
one AED is placed on another inode's file entry, and a later one is
placed on the block of the AED currently being filled, which
udf_setup_indirect_aext() zeroes, so __udf_add_aext() finds
lengthAllocDescs out of step with its cursor.  In the second, an AED
is placed past the end of the device, sb_getblk() fails, and the error
path of udf_do_extend_file() calls udf_truncate_extents() on an extent
list that no longer covers i_size.

Keep the type separately from the length, as udf_table_prealloc_blocks()
already does.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reported-by: syzbot+799a0e744ac47f928024@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=799a0e744ac47f928024
Reported-by: syzbot+43fc5ba6dcb33e3261ca@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=43fc5ba6dcb33e3261ca
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
Reproducer, with mkudffs from udftools:

  truncate --size=1M udf.img
  mkudffs --blocksize=512 --space=unalloctable udf.img
  mount -t udf -o loop udf.img /mnt
  mkdir /mnt/d
  i=0; while touch /mnt/d/f$i 2> /dev/null; do i=$((i + 1)); done
  df /mnt
  umount /mnt
  dd if=udf.img bs=512 skip=2047 count=1 | od -A n -t u2 -N 2

Without this patch df shows a negative used count, and the last block,
the backup anchor (tag identifier 2), now holds an extended file entry
(266).  With it, file creation stops when the partition is full, df
shows it 100% used, and the anchor is intact.

 fs/udf/balloc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/udf/balloc.c b/fs/udf/balloc.c
index 30cec5600149..2ec577b4321c 100644
--- a/fs/udf/balloc.c
+++ b/fs/udf/balloc.c
@@ -572,7 +572,7 @@ static udf_pblk_t udf_table_new_block(struct super_block *sb,
 	uint32_t elen, goal_elen = 0;
 	struct kernel_lb_addr eloc, goal_eloc;
 	struct extent_position epos, goal_epos;
-	int8_t etype;
+	int8_t etype, goal_etype = 0;
 	struct udf_inode_info *iinfo = UDF_I(table);
 	int ret = 0;
 
@@ -623,7 +623,8 @@ static udf_pblk_t udf_table_new_block(struct super_block *sb,
 			goal_epos.block = epos.block;
 			goal_epos.offset = epos.offset - adsize;
 			goal_eloc = eloc;
-			goal_elen = (etype << 30) | elen;
+			goal_elen = elen;
+			goal_etype = etype;
 		}
 	}
 
@@ -647,7 +648,8 @@ static udf_pblk_t udf_table_new_block(struct super_block *sb,
 	goal_elen -= sb->s_blocksize;
 
 	if (goal_elen)
-		udf_write_aext(table, &goal_epos, &goal_eloc, goal_elen, 1);
+		udf_write_aext(table, &goal_epos, &goal_eloc,
+			       (goal_etype << 30) | goal_elen, 1);
 	else
 		udf_delete_aext(table, goal_epos, &freed);
 	brelse(goal_epos.bh);
-- 
2.55.0

