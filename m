Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709817;
	b=bhSGsFb078wrO8S67TQ5ad1zzqHq+wWU9rFQyWm6wHAbY5xShirMSRTvmsfhSP0RAhFm
	 gRlua0HchiJqP6BqMwM5kJJItWpoY/By/XXAWMyMyH5guJrahpuIpd511yUJ1laSTMwno
	 yvN2mGIdvrF/JXksu1LneT6As5v8/UEvq4bBa2BO6UyQDTeKXcLx4q7fTVzIKFjr4U4sj
	 a8NoFcQtNYdCqV9zWfCHWyZoqRrtUWCyX/zDDyzvXwmPb3JnaYmnYdfj2EHwI13ZMxg7j
	 IRsTd6UZbhk6AOov9fBefvMpWyG5lneSam7MKLYywoAhAoItpU++2wVAw4zGlmCMBzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b/+luqkMAEnlkgfPQRPwQL87VckoHmCLbb+li852IoU=;
	b=UTzVtZH/54938eZSBQ5ZnkhyXa8s4/4p2bjUOzbV+9Ws5UgO4bvLXaSLs9rO7ry9pwa9
	 6IOBM/SO5y/XB2pMApxphBJbOWqsHtuA+UDjz1bSzzgJlkURxc4jC/Mz2O7FGd0jYde0h
	 9T0oNxhyghmK5VmtYoUkga0x/FlI80Q0Rb9ftQVRff3JNFa+LcMGx5vEEw4eW8sxj7GOt
	 1NKmFV4nxijBlk1ABgjHHsdg1HfTQboPYsr6zeYXT8mGltfrb5TqHY/dFyRX+byCpJaTH
	 iSEq0XcTHlGmAh4+MIihGGnx17VQkk6v1xqlRUjPE+DZ3kaB5AD3KsK+TGI6lPsWe/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UYVuIN8g;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70708606D80E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70708606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UYVuIN8g
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a7a3b29c11so6473685e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793709816; x=1794314616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b/+luqkMAEnlkgfPQRPwQL87VckoHmCLbb+li852IoU=;
        b=UYVuIN8gzCOepZcZxpsTH+1ZvKX3vpGebv12RIQBVV3bXJNt4oEU6iGr5kgf/tPIF+
         PNTuujcVeyRKAEo1tldryBo61CDS6haKoJEzalqST78xDGOUehLwWHz0vbY57ESMNhnR
         kaLC7Sit3h8Otceb4bkquoqYes+N1QbFQBjHGeRfun5fy83W/fyp3/QVLr9XotnXv4Ro
         bxwN4fbAnzGeVMRFqeTHU1HSXNn1SU1rYABFFyJJpNUihUKfFp6XY32hVIG6N1nocmpu
         ywhUfLC5rFqYrMBjIIYwE90Qfra+OyYmAdLwBGWrYkCiC6jE8hUOYsdjcaj7C6k02BvL
         /DHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793709816; x=1794314616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b/+luqkMAEnlkgfPQRPwQL87VckoHmCLbb+li852IoU=;
        b=VKchsF8FxpTKWY63lwASIylr034nesU1SDVc7q8rBMWWVGciP0/TMFjOEuPUfLpgb6
         8CR3H97nl2YUXoARX3f+NXqS6vdQLHfIj7kc7oLCDipY6QZ9EcDLi8+oxn/hQcrfpxay
         FLIQLgCA0x9SQJQM/T+fsgo7DOvOopAFFcEwIoeipQEms2+ZO2o2FE6BA9oE8sog4zD+
         2aQqK5sxWLfJq2Az6iM3DrfdYKzD8nEOkwnZjvOcE/4MTQopN4AZDbAWIn2jpEpTgCU0
         2qcJqvpPeoLmE5peXhpUK/u6+R7bnwjrLC6qYAOS5RROQI8MqiURL8iYPE5noHxkHaB0
         0lcg==
X-Forwarded-Encrypted: i=1; AKwUvBw7pdILtZS1AOnYzwkYHKNW5DryFIkGXv7NklBxGRJe3FDja0s4PDCeyUkliBE1Ne4LrdME1U/QlJD3k/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BTW7GHz5uEqz1MmVsqb0tJ3JC1h53t47Ax8lwMZXEkPYSpXL4
	LONxpV1AEIZbZmT8m9i6QuutEV8k+VGS8lIVqRhx3w38yTf91SIml/YGGewUWaUDqEw=
X-Gm-Gg: AYBFou1c9uufLFNqCTsMg4WX1ZvAbpTnE+xtB8/V49uG4lu/GwRsw6Htjd95Xlvxs1R
	XTq4SXD9Sp7A00ewTFakPMuWGukIa+lPpaAU/ZM8Nq63/nT8gnMuOL+VRufGZzpwrgiXYXQshqp
	ZfJf9s70MFQDYQwlsP4KRLn9Ny2FyuQSRKE8Sdm9Ba0SWQppb+x8GN/Rg76DFtH/q4U4NoOS5zI
	0tVQM5b5Bvk8YVgWjzIwcDDd5Od4Ws+3iG/Rcs8XosT7WZ0HkLj+1LST9TqGsA+CAr8mL3aSqdz
	sdsn0C2sWxaxdnyk8T9jw1xkwFAOIA3Y4BIX0Et4XG0ip2g8mDcFBcyqVVlKu54Fa//xk9irE8Z
	USorMZI+XpI6IU5/U0YGPcVUB0VV0rOApC7TV6+M1+HJHQqRYbSkN4sUvL6TNBMKGJl3mrd83Nf
	w1y6ZV2nT4zPefE/iEO9pzhneaOpw2XKrbuDkHBHn0ly2gcEZtDPri45eI5KqKXaciPLff/yg03
	5iFmu7fdQH1fpdgi0yR5ubQZK8dg+18omHExU/9RgQNtvev0oWARLyCuRLKm2Zi5pyDjK+Qh+1I
	H18tgmd66suylpqasQeHYFtwJdVP3xWxjV6gkyYaa7aN/dIlqWp4oc6cl6zGRQsJ
X-Received: by 2002:a05:600c:2604:b0:4a1:b027:99ef with SMTP id 5b1f17b1804b1-4ac16acfa8emr221721405e9.2.1793709815868;
        Tue, 03 Nov 2026 04:43:35 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8460acsm4365014a91.7.2026.11.03.04.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:43:34 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 2/4] ocfs2: switch DIO read path from buffer_head to iomap
Date: Tue,  3 Nov 2026 20:43:06 +0800
Message-ID: <20261103124310.21143-3-heming.zhao@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103124310.21143-1-heming.zhao@suse.com>
References: <20261103124310.21143-1-heming.zhao@suse.com>
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

Migrates the DIO read path from the legacy buffer_head infrastructure
to the modern and more efficient iomap framework.

Under the current code, ocfs2 holds a cluster lock during DIO via
ocfs2_iocb_set_rw_locked(), and releases the cluster lock in
ocfs2_dio_end_io() via ocfs2_iocb_clear_rw_locked(). The lock level is
stashed in iocb->private.

However, iomap DIO owns that field (it stores a bio there for polled I/O
and unconditionally clears it before calling ->end_io). Any side-channel
state packed into iocb->private is corrupted, which trips the end_io
lock-state check.

Instead, encode the unlock level by passing distinct iomap_dio_ops methods
(ocfs2_iomap_dio_ops_pr for PRMODE or ocfs2_iomap_dio_ops_ex for EXMODE).
Additionally, the *_iter() functions use the split __iomap_dio_rw() +
iomap_dio_complete() API so they can determine unambiguously, from the
return value, whether the completion handler already dropped the lock
(real I/O, sync or -EIOCBQUEUED) or whether the caller must drop it
(no I/O issued, or buffered fallback).

The new function ocfs2_iomap_begin() performs a similar role to
ocfs2_get_block(). While ocfs2_get_block() retrieves only one block per
call, ocfs2_iomap_begin() can handle multiple blocks at once. Limit the
map offset and length in ocfs2_iomap_begin() to OCFS2_MAX_LOGICAL_BLOCK
to avoid overflow issues.

Co-developed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
Signed-off-by: Heming Zhao <heming.zhao@suse.com>
---
 fs/ocfs2/Kconfig    |   1 +
 fs/ocfs2/aops.c     | 111 ++++++++++++++++++++++++++++++++++++++++++++
 fs/ocfs2/file.c     |  63 +++++++++++++++++++++----
 fs/ocfs2/ocfs2.h    |   3 ++
 fs/ocfs2/ocfs2_fs.h |   3 ++
 5 files changed, 171 insertions(+), 10 deletions(-)

diff --git a/fs/ocfs2/Kconfig b/fs/ocfs2/Kconfig
index 2514d36cbe01..bf1678a5eb01 100644
--- a/fs/ocfs2/Kconfig
+++ b/fs/ocfs2/Kconfig
@@ -7,6 +7,7 @@ config OCFS2_FS
 	select CRC32
 	select QUOTA
 	select QUOTA_TREE
+	select FS_IOMAP
 	select FS_POSIX_ACL
 	select LEGACY_DIRECT_IO
 	help
diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
index c612244690a1..da53abe59ea0 100644
--- a/fs/ocfs2/aops.c
+++ b/fs/ocfs2/aops.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/fs.h>
+#include <linux/iomap.h>
 #include <linux/slab.h>
 #include <linux/highmem.h>
 #include <linux/pagemap.h>
@@ -2541,6 +2542,116 @@ static ssize_t ocfs2_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
 				    ocfs2_dio_end_io, 0);
 }
 
+static int ocfs2_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
+		unsigned int flags, struct iomap *iomap, struct iomap *srcmap)
+{
+	int ret;
+	struct ocfs2_map_block map;
+	struct ocfs2_inode_info *oi = OCFS2_I(inode);
+	u8 blkbits = inode->i_blkbits;
+
+	if ((offset >> blkbits) > OCFS2_MAX_LOGICAL_BLOCK)
+		return -EINVAL;
+
+	/*
+	 * Calculate the first and last logical blocks respectively.
+	 */
+	map.lblk = offset >> blkbits;
+	map.len = min_t(loff_t, (offset + length - 1) >> blkbits,
+			OCFS2_MAX_LOGICAL_BLOCK) - map.lblk + 1;
+	map.flags = 0;
+
+	if (flags & IOMAP_WRITE) {
+		return -EOPNOTSUPP;
+	} else {
+		down_read(&oi->ip_alloc_sem);
+		ret = ocfs2_map_blocks(inode, &map, 0);
+		up_read(&oi->ip_alloc_sem);
+	}
+
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Before returning to iomap, let's ensure the allocated mapping
+	 * covers the entire requested length for atomic writes.
+	 */
+	if (flags & IOMAP_ATOMIC) {
+		if (map.len < (length >> blkbits)) {
+			WARN_ON_ONCE(1);
+			return -EINVAL;
+		}
+	}
+
+	iomap->bdev = inode->i_sb->s_bdev;
+	iomap->offset = (u64)map.lblk << blkbits;
+	iomap->length = (u64)map.len << blkbits;
+
+	if (map.pblk == 0) {
+		iomap->type = IOMAP_HOLE;
+		iomap->addr = IOMAP_NULL_ADDR;
+	} else {
+		if (map.flags & OCFS2_MAP_UNWRITTEN) {
+			iomap->type = IOMAP_UNWRITTEN;
+		} else if (map.flags & OCFS2_MAP_MAPPED) {
+			iomap->type = IOMAP_MAPPED;
+		} else {
+			WARN_ON_ONCE(1);
+			return -EIO;
+		}
+		iomap->addr = (sector_t)map.pblk << blkbits;
+	}
+
+	if (map.flags & OCFS2_MAP_NEW)
+		iomap->flags |= IOMAP_F_NEW;
+
+	return 0;
+}
+
+const struct iomap_ops ocfs2_iomap_ops = {
+	.iomap_begin	= ocfs2_iomap_begin,
+};
+
+/*
+ * Direct I/O completion. Like the old ocfs2_dio_end_io(), we use the rw_lock
+ * DLM lock to protect io on one node from truncation on another, and drop it
+ * here once the io has completed. iomap_dio_complete() always calls this,
+ * including on the buffered-fallback (-ENOTBLK) path, so the rw_lock taken in
+ * ocfs2_file_{read,write}_iter() is released exactly once.
+ */
+static int ocfs2_iomap_dio_end_io(struct kiocb *iocb, ssize_t size, int error,
+				  int level)
+{
+	struct inode *inode = file_inode(iocb->ki_filp);
+
+	/*
+	 * When iomap_dio_complete() calls us with size==0 and error==0, it
+	 * means the mapping bounced back to buffered I/O. In that case leave
+	 * the rw_lock ocfs2_file_{read,write}_iter() keeps it for the buffered
+	 * retry and releases it in its own cleanup path.
+	 */
+	if (size == 0 && error == 0)
+		return 0;
+
+	ocfs2_rw_unlock(inode, level);
+	return error;
+}
+
+static int ocfs2_dio_end_io_r_pr(struct kiocb *iocb, ssize_t size,
+				int error, unsigned int flags)
+{
+	if (error)
+		mlog_ratelimited(ML_ERROR, "Direct IO failed, bytes = %lld errno:%d",
+				 (long long)size, error);
+
+	error = ocfs2_iomap_dio_end_io(iocb, size, error, 0);
+
+	return error;
+}
+
+const struct iomap_dio_ops ocfs2_iomap_dio_ops_r_pr = {
+	.end_io = ocfs2_dio_end_io_r_pr,
+};
 const struct address_space_operations ocfs2_aops = {
 	.dirty_folio		= block_dirty_folio,
 	.read_folio		= ocfs2_read_folio,
diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
index d6e977ba6565..0ad4f08eb3e4 100644
--- a/fs/ocfs2/file.c
+++ b/fs/ocfs2/file.c
@@ -9,6 +9,7 @@
 
 #include <linux/capability.h>
 #include <linux/fs.h>
+#include <linux/iomap.h>
 #include <linux/types.h>
 #include <linux/slab.h>
 #include <linux/highmem.h>
@@ -2374,6 +2375,19 @@ static int ocfs2_prepare_inode_for_write(struct file *file,
 	return ret;
 }
 
+static bool ocfs2_should_use_dio(struct kiocb *iocb, struct iov_iter *iter,
+				struct inode *inode)
+{
+	/*
+	 * Fallback to buffered I/O if we see an inode without
+	 * extents.
+	 */
+	if (OCFS2_I(inode)->ip_dyn_features & OCFS2_INLINE_DATA_FL)
+		return false;
+
+	return true;
+}
+
 static ssize_t ocfs2_file_write_iter(struct kiocb *iocb,
 				    struct iov_iter *from)
 {
@@ -2548,7 +2562,6 @@ static ssize_t ocfs2_file_read_iter(struct kiocb *iocb,
 			filp->f_path.dentry->d_name.name,
 			to->nr_segs);	/* GRRRRR */
 
-
 	if (!inode) {
 		ret = -EINVAL;
 		mlog_errno(ret);
@@ -2558,7 +2571,8 @@ static ssize_t ocfs2_file_read_iter(struct kiocb *iocb,
 	if (!direct_io && nowait)
 		return -EOPNOTSUPP;
 
-	ocfs2_iocb_init_rw_locked(iocb);
+	if (!iov_iter_count(to))
+		return 0; /* skip atime */
 
 	/*
 	 * buffered reads protect themselves in ->read_folio().  O_DIRECT reads
@@ -2576,8 +2590,6 @@ static ssize_t ocfs2_file_read_iter(struct kiocb *iocb,
 			goto bail;
 		}
 		rw_level = 0;
-		/* communicate with ocfs2_dio_end_io */
-		ocfs2_iocb_set_rw_locked(iocb, rw_level);
 	}
 
 	/*
@@ -2598,17 +2610,48 @@ static ssize_t ocfs2_file_read_iter(struct kiocb *iocb,
 	}
 	ocfs2_inode_unlock(inode, lock_level);
 
-	ret = generic_file_read_iter(iocb, to);
+	if (direct_io && ocfs2_should_use_dio(iocb, to, inode)) {
+		/*
+		 * Use the split iomap DIO API so we can tell who owns the
+		 * rw_lock on return; reads always hold it at PR level, dropped
+		 * by ocfs2_iomap_dio_end_io_pr(). Call it directly rather than
+		 * through generic_file_read_iter(): iomap advances iocb->ki_pos
+		 * itself, so the generic helper would advance ki_pos twice.
+		 */
+		struct iomap_dio *dio;
+
+		dio = __iomap_dio_rw(iocb, to, &ocfs2_iomap_ops,
+				&ocfs2_iomap_dio_ops_r_pr, 0, NULL, 0);
+		if (dio == NULL) {
+			/* No I/O issued; rw_lock still held. */
+			ret = 0;
+		} else if (IS_ERR(dio)) {
+			ret = PTR_ERR(dio);
+			if (ret == -EIOCBQUEUED)
+				rw_level = -1;
+		} else {
+			ret = iomap_dio_complete(dio);
+			if (ret != 0)
+				rw_level = -1;
+		}
+		/*
+		 * A 0 result means the mapping bounced us back to buffered I/O
+		 * (e.g. inline data); the rw_lock is still held. Go to the
+		 * buffered path rather than re-entering direct I/O.
+		 */
+		if (ret == 0) {
+			iocb->ki_flags &= ~IOCB_DIRECT;
+			ret = generic_file_read_iter(iocb, to);
+		}
+	} else {
+		iocb->ki_flags &= ~IOCB_DIRECT;
+		ret = generic_file_read_iter(iocb, to);
+	}
 	trace_generic_file_read_iter_ret(ret);
 
 	/* buffered aio wouldn't have proper lock coverage today */
 	BUG_ON(ret == -EIOCBQUEUED && !direct_io);
 
-	/* see ocfs2_file_write_iter */
-	if (ret == -EIOCBQUEUED || !ocfs2_iocb_is_rw_locked(iocb)) {
-		rw_level = -1;
-	}
-
 bail:
 	if (rw_level != -1)
 		ocfs2_rw_unlock(inode, rw_level);
diff --git a/fs/ocfs2/ocfs2.h b/fs/ocfs2/ocfs2.h
index 88fe985e87c9..58ad6f570536 100644
--- a/fs/ocfs2/ocfs2.h
+++ b/fs/ocfs2/ocfs2.h
@@ -550,6 +550,9 @@ struct ocfs2_map_block {
 	unsigned int flags;
 };
 
+extern const struct iomap_ops ocfs2_iomap_ops;
+extern const struct iomap_dio_ops ocfs2_iomap_dio_ops_r_pr;
+
 /* Flags used by ocfs2_map_blocks() */
 #define OCFS2_GET_BLOCKS_CREATE	(0x0001)
 
diff --git a/fs/ocfs2/ocfs2_fs.h b/fs/ocfs2/ocfs2_fs.h
index c501eb3cdcda..fe1b80531c45 100644
--- a/fs/ocfs2/ocfs2_fs.h
+++ b/fs/ocfs2/ocfs2_fs.h
@@ -314,6 +314,9 @@
  */
 #define OCFS2_CLUSTER_O2CB_GLOBAL_HEARTBEAT	(0x01)
 
+/* Max logical block we can support */
+#define OCFS2_MAX_LOGICAL_BLOCK	(0xFFFFFFFF)
+
 struct ocfs2_system_inode_info {
 	char	*si_name;
 	int	si_iflags;
-- 
2.55.0

