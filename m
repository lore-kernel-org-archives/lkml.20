Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD673672AE
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 02:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790390118; cv=none; b=jzAisAm0EVd12sEE/IcfLkqIfW8ki7bwvnTZd1hqELTzHcno8adXFi0UqoLFMvLpl5geRdZ/0ksCSQiTWvnU3IIAhLPmVsI+RwCoM5HMevWWMRWS91v1jXEoLoKNA9ZBtXmBKu0GxfAQLfpGU9nJ1i0kbuH/nmuk7Q8frxf6wgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790390118; c=relaxed/simple;
	bh=vZJPbgJPdsXpKopo28Dsi+J0Feh0C3IQQRqQQTBqjPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fpkRCRpl7lMkV+YsxuJYtXMSPFLQkdKyhJDz8czAs12CPyGlx76P1xSq5NRDBf0srVwoFPKWM6zL7a3/1GDsX50I1KxABlnSrKn89hwGtUnoY8eOPzpyi1LtdYWtLAwlBysv4egRktuSVo0tSoScR62TV6jZMJXGqZ2PCAE2DZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qvalIY2W; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qvalIY2W"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2dd77300825so8539905ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790390116; x=1790994916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zTNC5edU10uB/RUSjLI3cwaqFAWGhgn7z7X8/RqAWVs=;
        b=qvalIY2W3ZjhAQWwygxxlcpEjwKS3Qa3BhJtooenciJQxNCGGckqd8CkoTLMb/g42F
         TFdN3mm9PneLXmvz36y1S30KDVw4xD5X8F1KJnRyvpN8af4hYRCiS6eGKy6D5m310OMg
         521Ys0rrBp2Pf9X12mZtLCKf+8jmkRPmEd/nu+UlPIkNlUjiGy4J/n65gO6MbMG2VtRn
         o2ZDtgYbq2C4ypr1hnXEEVcSEj5PqVO+WXpikAMtHMFS/SqqBFa4kBg3ke8i0R3kNZao
         LFBMNA5woJDCSfz/uhrFAPuDmNAQrwj+c47ow8Ms0/mKKfm1SncUOIk5g8aFIlKmKlvy
         5Ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790390116; x=1790994916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zTNC5edU10uB/RUSjLI3cwaqFAWGhgn7z7X8/RqAWVs=;
        b=Xdf4YZoY70eRZteY+M0H0xMhZc0J8yqsWaoKLP93XCiLPdaSUFmAFQ46sj6ldS6/tc
         WVGHELIoWfoZ7XshF1zELUNUnpMIatXz6/ZIiweMGApvQHDSMpi7nU/mNs0hQtBez7qB
         44ZautHTVGiIBTxO0sYfLZoWuoSKTDiGyKq1hufBcSxritXg1I1VD7LoxUJxgvDXxkTu
         Z+Vf08w+EIsK3a5w8cAD57/f/Fy05UsECoRWO2mOro9IwIT24RgRskMWYDA+AV22NdY3
         OAZpclbQsNqJvEiixh/8JzlewiC4Rk09JMOriC42pEHCnnWVaCHiJCaqqqBUWkaXiPQs
         epkg==
X-Forwarded-Encrypted: i=1; AKwUvBzLjYKcwiijbm6147ji2DlhKne4f8pSIFuI9o8Uy3no9jbQgxSCko8tCNT9C47x2ZsYTXA2ir1EFUCtU1c=@vger.kernel.org
X-Gm-Message-State: AFuF++nudB8JNBvsqowjo5PduA+ccqEmWt1bv8fmjlW0i1bjDcl9o1SF
	vx8pR3xvieh8Q4MPuURiOhsKz9nrrV+3AvsTeSDErzDR80goq7Gcz9h6s3oCzHYKTkR4nlgo
X-Gm-Gg: AYBFou1WWZPPSguh9NeRYv9MQn5sOFgJGoDq+AhUm3XPw1K1YgsPigpB2bh/pUZ6StS
	NTBshBjEVu5ykUwb5hMAYTWd8prB1iNTKLi9htnLTVO9pvCxuY927Arc9aL7maDKiNA/uTb6X9/
	OPZy4PL6N4VWwz2nuN1VF2TUFuDsAwGmnwGRc65lXiFMW99klA9wvVys13vJ3CeiubpBZKNwGyP
	5sYvD79RyZliU6nkKbV/JJTTWKGpl79wkWUgf38gq1gGDpFPUFYgwSTRFYA0pPxP/FRGE/M/4MZ
	y2pdKen/HvQ5/CwIwdTbya4gC/n9eOOaI6OwdGlKnLid8xS7tdGq1XMaqdgFFZ7ZEGFvHfyyBSb
	WuWUpDurjrUo9EonOi6L7HPJ2SJ6Nroqjfu+pOwH5ufxx7l5t+jJbLO5qD+1MAQMwfmgTfBQ0ak
	2YjiHhHaOpADx0RJo1t8V2iaYdCOTYwPFGCY8Kh30zXi9KptMv2JhMqe4n6JSOiPdD+vrfWFvOe
	T7UBBboVB59VgpcbiDTjByIA/Nqcoah+6Cq0EJ0MIQI2Jilnq8s+TSq/5tnvWPEKkIaneICd4rj
	5ELp4X5uDlZd4ntWqhrIljoWAN5UqaMDVgZwset0q3MosKJikOBIgTv1J3o=
X-Received: by 2002:a17:90b:384c:b0:3a0:c8e6:ab23 with SMTP id 98e67ed59e1d1-3a0c8e6b96bmr2206750a91.54.1790390116029;
        Fri, 25 Sep 2026 19:35:16 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99917besm7163204a91.14.2026.09.25.19.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 19:35:15 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: jack@suse.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] udf: don't let a stale metadata buffer overwrite expanded file data
Date: Sat, 26 Sep 2026 10:35:12 +0800
Message-ID: <20260926023512.3035718-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 62333e480d12 ("udf: Fix data loss when converting inline
inodes to out of line"), udf_expand_file_adinicb() allocates the data
block itself with udf_map_block() and then writes the folio with
filemap_fdatawrite().  Writeback maps the block through
udf_get_block_wb(), which does not allocate, so the buffer is never new
and nothing calls clean_bdev_aliases() for the block, as the generic
code does for every block get_block() reports as new.

A recently freed block can still have a dirty buffer in the block device
page cache.  The common case is the file entry of a deleted file:
udf_evict_inode() updates it with sync_inode_metadata(), which for an
inode that is not IS_SYNC only marks the buffer dirty, and then frees
the block.  If that block becomes the data block of an expanded file,
the next writeback of the block device writes the old file entry over
the file's data.

On a fresh mkudffs image, creating 20 small files, deleting them and
then creating five files with "printf hello >f; truncate -s 3000 f"
leaves all five with a deleted file's extended file entry as their first
block after sync and remount.  This happened in 400 of 400 runs, on
bitmap and table images alike.  When the file is extended by writing
instead of truncating, the write dirties the data again and the outcome
depends on writeback order: the data was corrupted in about 7% of runs.

Clean the aliases of the new block, as block_write_begin() and
mpage_writepages() would have done.

Fixes: 62333e480d12 ("udf: Fix data loss when converting inline inodes to out of line")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
This is a regression in v7.3-rc1, and 62333e480d12 is also in 7.2.6 and
6.18.52.  On 7.2.7 and 6.18.54 the truncate case corrupts the data in
400 of 400 runs, as on mainline, and the write case in 10 and 7 of 400
runs; with this patch, which applies cleanly to both, there was no
corruption in 400 runs of either case.  Before 62333e480d12, extending
the file by writing was safe (no corruption in 400 runs with it
reverted): the write allocated the block through udf_get_block(), which
marks it new, so block_write_begin() cleaned the alias.  Truncating up
lost the data before 62333e480d12 as well, which is what that commit
fixed.

To reproduce, run this as root in a VM; cmp reports every corrupted
file:

#!/bin/sh
img=/tmp/udf.img mnt=/tmp/udf.mnt
truncate -s 1M $img
mkudffs $img >/dev/null
mkdir -p $mnt
mount -t udf -o loop $img $mnt
for i in $(seq 20); do echo small >$mnt/s$i; done
rm $mnt/s*
for i in $(seq 5); do
	printf hello >$mnt/f$i
	truncate -s 3000 $mnt/f$i
done
sync
umount $mnt
mount -t udf -o loop $img $mnt
printf hello >/tmp/expect
truncate -s 3000 /tmp/expect
for i in $(seq 5); do cmp $mnt/f$i /tmp/expect && echo "f$i ok"; done
umount $mnt

 fs/udf/inode.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/udf/inode.c b/fs/udf/inode.c
index e45e546a739a..804554d26595 100644
--- a/fs/udf/inode.c
+++ b/fs/udf/inode.c
@@ -442,6 +442,13 @@ int udf_expand_file_adinicb(struct inode *inode)
 	err = udf_map_block(inode, &map);
 	if (err < 0)
 		goto restore;
+	/*
+	 * The block may have held metadata that is still dirty in the block
+	 * device page cache (e.g. the file entry of a deleted inode). Make
+	 * sure writeback of that buffer cannot overwrite our data.
+	 */
+	if (map.oflags & UDF_BLK_NEW)
+		clean_bdev_aliases(inode->i_sb->s_bdev, map.pblk, 1);
 
 	folio_mark_dirty(folio);
 	folio_unlock(folio);

base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
-- 
2.55.0

