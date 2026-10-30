Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369145;
	b=VKgWSFZRp9B7D79J7f73Pn+SFENeJIxvXcFBZp5PDRRH44/h22vKwFYVc/GVMu5Xefgp
	 o7H3pZadzp4qRCxs4nbOt2rBbsSI+dbLe589djuARxmu8fz+l4WrRLGF9soBCzJ/biKqB
	 XwFoS98bn8KyIoIoZAdvthXy17WReJ0jOP2UDE9maTdISaaW051N7tycSQEubkxidfPpP
	 aMIPGr70uQrCyydZRyVm8f5sEOKaUMLtCslqRLywXj0D2T/Gu0zGzMbyoxrfBUXoWqbQV
	 Irfr2S9JJqaI4z8h1ZezhohwD5ZuhLZ12mdH+36Fh3WFSxMeIhL0nEwaC9AthVlW8BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5nu3SzhatD4xvI8hewKAeKQkufqkhvvvAx3slr33gYc=;
	b=JeqYU0FHAiwTxkIwCVlAXLEYk7F3YmfRN60pX8B/xJbgpbx8pWoLLstUg7tIC6gL+eSH
	 WRro6qBfDKk2Fsz+tWyIG6ev5aV2kauqisuC6VUVH1HQVvraOBqlSGo9tBBc6UXh8M1dN
	 5YD4ivyDdhxeGeb6LIvkuC73Hgsru/Ty886PxvrfyNILY8+ERlDHryNTKp6r6C114KP7F
	 yN4DIYQfJP/bMv3QhqAqG41+X7wr+O/+kMsQmVzftwrH0Os97TS0q5Y+vaoHHAbSSjaO5
	 B3UNOsIFhFkgtGSpHftqP4oqZ5KBDFkdOCROAM5xgUYMyqRWjc67xZOrdgXn7Nkq/PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qfUnPceR;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94166606A327
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94166606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qfUnPceR
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so478625b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793369144; x=1793973944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5nu3SzhatD4xvI8hewKAeKQkufqkhvvvAx3slr33gYc=;
        b=qfUnPceRUbpGM6V6UDM38c5gD17XZbam5SQ3c2cdf8J5CZEx9vsBJiWze1Z927iEiJ
         UBq1hYpulhusAyH/+o1sHU/V8mSVBBeeJcHLyqPiE71B6nV0je6UVGXAFcsghVeflP2N
         vyYkvV71hO0AqP8yf7mICmkLPVk+1UE4e2WT5l8t6NQ04kz/bhVqrszUqkGzeaJ4ZoCW
         KZZhqe5IyQ2KF5MZM1HH8tv1l0TPhlPIrlD0mdG/KShT5zHmdgKxiczOsQdTjNsJGmly
         Y0YXd/YaqhZ97tabiedDJtGVkwO5ABQGs2rF1K5dSBwzDNwaPfdIGkV6oqvVl2sO3yXu
         fMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369144; x=1793973944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5nu3SzhatD4xvI8hewKAeKQkufqkhvvvAx3slr33gYc=;
        b=yGMEGaj5DJDgKS3DRqtPK4IXHu6JZ5D0DXs6BOdXZ+fA0sf3YbXIrPG3138bxtFKRd
         muSxHisq3mgsM+xWf3DVupy7jLOI8K5t3pJHJ5CndDvHDckrxK2Aou6vxLrTGnD2/NEg
         MVAIf6mFOwwY2maDaKot30UmDKRmpT7eTBKFKcD+4sx9DfMQwXn597bmPOwixf/k/sdi
         tX4Mt5oKdGDLcpj2U+AutAAYrPB3IqY3gWAUisBrf4oUAA2UdjvTq6ov5rWV6feaXK67
         zPG56oal8J4w4JbNjCXQOnHI+fGivs0g6yBnYSLEGkoKZ7ZzmiXHwNe//4wGzpUcNQ0L
         tSyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxICofSCp3UMPm0fp/FVXSsSmo2gqvF5XgvLvN+YWZe6kcCSF2mUwpao31yErXYGEcESZfFMjslHhZZTT8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYHP0ISlZhOZycuVE6HuvCoJDTy+KFRgZCrsyK4sQr6QHYpRC7
	3J9Ij27NBPygMTRoRfRzTJQrZfVJZZaBURf4amsDtEyRX6zqFDvKFe3I
X-Gm-Gg: AYBFou0sgca+4CcXx8rojwdGnQtc3Gtg2Q+vtel+YtEHuySuAtKVSQsoMHGqwLVjpdb
	qDbbKpdKLmU4QS78HQU2vt8fhm4fr/iswSw5Nc+YlxNC1qHIF8NoIei7OvOl0BWQM2CssO6cOF5
	vtTr0fxbePLIkovw2xYJYqKFpOwpL81NVnKAmI0igspC3tgoELKcRi17BdqCY2riM6y1LTH5I6Q
	8DpjG/Tm83RgRXF1SMBElibQyM10rVq6LXFj5nh08WoxdnWBPTkEPxjG+Wc/sdXHXeIk8TEd8GK
	p8zOD/KBfYF01UD44S3utXY622tQPKhGEfYNKJACuk5tFqDAsWNehjIwX+5L2WnrHYO2om+oUce
	vprkrippMb830/AT2J165Mk08mhG12iIrVP9v1JrxCQL2V2ah6agq5jCybOkOfnoyZ4HAxhzHhh
	Y2amdtqWPLcvdOeIWJnp1Y3gycQei6VP3E6Dvzvr9pHJu0MirGXpAeb9WXvt1S/swpArTQjOND6
	uy1dqMRH/nTd9hTeRwtyAS6gN0IIH8s8xxYcvEeGaQDThw7cFMW20OYahG5bGHhJoZkAaIEl3lc
	BXAxmf2LGwigK0sCT+iKiSHCgQ2mBIrmRvSMAhHxYqKq+vSHfiQwXd4F39gf48eGqzf/Rbjt4Aj
	x8GA6k1U3oaFvkyZZDYCTN2h7v2oN4ffeUFJHGQ+Uww4G0DDl+TV3fT68b9CM3OEjWlLDAfTrD2
	p4D5Cp8aIH3I8NdN2UCmJS35Fa7TrcgpUjVsE=
X-Received: by 2002:a05:6a00:21cf:b0:882:905d:aa05 with SMTP id d2e1a72fcca58-8a9bfde689amr2254464b3a.50.1793369143612;
        Fri, 30 Oct 2026 07:05:43 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad77fd956sm26043b3a.3.2026.10.30.07.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:05:43 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jan Kara <jack@suse.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+799a0e744ac47f928024@syzkaller.appspotmail.com,
	syzbot+43fc5ba6dcb33e3261ca@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH v2 1/4] udf: don't let the extent type hide an exhausted free-space table extent
Date: Fri, 30 Oct 2026 22:05:34 +0800
Message-ID: <6b51c38d2d069544053c542470950e2a448b0b8d.1793349907.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793349907.git.matthias.goergens@gmail.com>
References: <cover.1793349907.git.matthias.goergens@gmail.com>
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
index 30cec56..2ec577b 100644
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
2.56.0

