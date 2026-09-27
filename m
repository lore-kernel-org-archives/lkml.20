Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B231C2E736A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790485733; cv=none; b=FdHEg01aVzrNN5msaOaKNxaJNLTnVF16PqnJjiSMzwr1igJf9nO8z7dE9Gmr7/d/cPWUHGGa3NauzQZHg1Mszn2576/2Qn/mFnXmtqkgOZ9haWVQHy2qXzuIhvq/LTfaFYpZ1kNUjPFcKA4SGKtUN0NpxIz0A5lqXZtseWQo6Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790485733; c=relaxed/simple;
	bh=REDfLQtZzmmDwuBX160AEjAwtc+N7agMbuNUHFz+Kow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l7rEsxGddCOiZ1PK0z0FarXI+sCXOrHDFOh6lXys0dDbmwUfg47ZIBNft0LiAvgPEh1DjsbGcjgbVWrmhbDpkimT+puPsBtsqRd3lZJXcVz4nnB2IfM/ymV4Eaw+nvTrQKHCTeLjYMa8U5yooPJwkivMYTm4O2adfX/3zd/5bQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tKOLOBV4; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tKOLOBV4"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f05ffdso8070475ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790485722; x=1791090522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yTByub4JfOdnK292ZVlOp8TwRfOmHJ36Ys8FX7Mo1vY=;
        b=tKOLOBV4k3C8Xc8IAo2OyOA+8E7TS711k5PE1Vs9D6H7REUK1RLVY44FRVo8X4GMO2
         8Siy6foFB+389OulSJ1Y064b2A6ekGPXIOB2qrkeEsKRk6Qc+d83gorPHgsIVORJceRU
         T/OVzv6eZ3sU6E9Cad8JbCTbbZn5B7jRPY8pAyEpzUOUT4sAr8vXOABp+BJT+WIBdABK
         jQfMIqKvAIWALYu1FeMNfRyf7QWz1ORR9e5BlCjMx6HmsohW3le1R5Fevd1ALsVmklkG
         O/cBCvGRqUuae4xQKqmxsbhvFyRvAYY8jX6pXuZ3RQ2yl068Ro9sxs2VabWDuS/ld3Fy
         g2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790485722; x=1791090522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yTByub4JfOdnK292ZVlOp8TwRfOmHJ36Ys8FX7Mo1vY=;
        b=IXIGO08LAl63TEsH/EBB/+TkvUOAV1qYx1lfUH8b3sl9YEjSfrjcPQlBtJjCoKKmEc
         dkwu5M6IRZ3pq37k4ShuKxZQ2SCywlo+RYeY4TdSP6OO9z/NrwZjcFAf3ah66fOp9lqz
         KXjO0pcxGzk24L88nugEQQ8GTd3RRFueTFWfn5YI+j4FcGT6cYjAPabkzXuQdnlIsyvn
         F+ODSzLR69bz8WyALd40dKXepjdLbmCLnDQSYfyufjL1CxloiFBCIGr1FONCQUK1b2nB
         lbK4kUTSF6fbZsNFGLfbzBr6+T1LqSj1/5ZxOZtUUSklrQ/+zrXwc+DvDLOGzC6lMFoF
         RgTA==
X-Forwarded-Encrypted: i=1; AKwUvBxk/T7dlNvdXae84lAOHOkHKJGvlCqUr6TMtUxXEB6/ZvreDaatLRW7muXFlGxqFLo/HgtRonRWa7Tud3s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgHXJTS1ZJ/AzdbKwa3LxUwWREE1Os5HtP+PiRsyGahmdvnf5q
	QOs9vzdGJm+9mehgyMtce+pVzdgWNoH5fh0Knob2rXNYErZyUhlIjuX+
X-Gm-Gg: AYBFou1lgecxhXOdzlwWKBCDT9xhdosZaWy3/i892cTrLabKdkKjLB0TVOY3ZMCvuUd
	6nCtn3aOKcuwdt5Tc/BAa7nS/m/8IoyJIOdOumQHE5ccHi6+YXSSsJe3+iT5dRggws6fCA0ZAe3
	yStjuc2XO62ZxbBQNMcdwDnMjz6ckOMXEJTIcgsWkGki6yR3YjYRngVozasscUSlwg4lB7gsPy4
	LFpqPwy4c8hSRyL3AA0tYtNIdWnWdozSCqptBrSj3NRGr6x0oM6bNhOS8tSRLE2oNtHBOLmwcid
	Zyt4P82aLT1f0KpXbSwF9cFP/MykyY8dKtUfVQqG1Q8tWq2wyJQmrEj14Z/1VCo4Hbnr3T4D2hp
	N37j5U+QDq4KIa4Ob8w4xJyvbFH8MW4cz7G77VA70eLRUo8TAUkFj7Zs7c6EgC4Fu8hQIdhgKMO
	1LSpDVrX1pzaRJry4PPUOCRqa4oqDV+WMkrM/aDMjRzy5vbqqkG/4S5Zg9IGqVqGOWe9YIrVTAN
	chC/OvYw2XHHuwkhg2+yd0i0jYNmAZx1HZNQLQFPieucuJUbKZ17Ou2vpZj8XZoim2D7nKZhNE3
	se+59qwaMpVH+4PH3ukTuy/oWkth/mmy8UvEqGss74PWdZZIMWij4yK8TFV3RXqbNDE6OA==
X-Received: by 2002:a17:903:90f:b0:2dd:ad74:ac28 with SMTP id d9443c01a7336-2df7e39b86cmr85106485ad.26.1790485722012;
        Sat, 26 Sep 2026 22:08:42 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm26615495ad.45.2026.09.26.22.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 22:08:41 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] ntfs: reject non-resident attributes whose sizes exceed their allocation
Date: Sun, 27 Sep 2026 13:08:25 +0800
Message-ID: <20260927050831.2739166-6-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790417653.git.matthias.goergens@gmail.com>
References: <arMoap0ZgeORuktT@hyunchul-PC02> <cover.1790417653.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_read_locked_inode(), ntfs_read_locked_attr_inode() and
ntfs_read_locked_index_inode() take a non-resident attribute's data_size
and initialized_size from disk without checking them against its
allocated_size.  The runlist ends at allocated_size and the read path
maps what lies beyond it as a hole, so a data_size larger than the
allocation makes reads return zeros that are not on disk, with no error.

On a crafted volume with 4 KiB clusters where a 6144000-byte file claims
a data_size and initialized_size 64 KiB beyond its allocation, reading
the file returns 16 clusters of such zeros.  A sparse file behaves the
same.  A compressed file instead fails with -EIO after a burst of "Still
have pages left!" errors from ntfs_read_compressed_block().

Require 0 <= initialized_size <= data_size <= allocated_size, with
allocated_size a multiple of the cluster size, when the inode is read,
as fs/ntfs3 does in mi_enum_attr(), and fail with -EIO otherwise, which
marks the inode bad and the volume as having errors.  initialized_size
above data_size is rejected too because an extending write zeroes the
gap it opens only from initialized_size onwards.  An unaligned
allocated_size ends inside a cluster that the read path treats as past
the end: a crafted 66440-byte file with 4 KiB clusters reads its last
904 bytes as zeros.

Sparse and compressed attributes need no exception.  Every non-resident
attribute has a cluster-aligned allocated_size >= data_size, holes
included, on eight public test volumes (seven written by Windows, with
LZNT1-compressed files, a sparse $UsnJrnl:$J and a OneDrive placeholder
whose unnamed $DATA is one hole, and one by mkntfs), on a volume written
by ntfs-3g and on one written by this driver, and the patched driver
reads every file on them as before.  fs/ntfs3 has enforced the same
checks since v6.6, also without exceptions.  The layout.h comment saying
that data_size can exceed allocated_size for compressed and sparse
attributes is corrected.

This also covers a non-resident attribute list, which
load_attribute_list() reads through ntfs_attr_iget(), and $MFT, whose
inode goes through ntfs_read_locked_inode() after the previous patch's
check.  The check was already missing in the classic driver; the Fixes
tag names the commit that brought that code back.

Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/inode.c  | 38 ++++++++++++++++++++++++++++++++++++++
 fs/ntfs/layout.h | 13 ++++++++-----
 2 files changed, 46 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 9c97fc3f9e5ff..126c50b5a349e 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -651,6 +651,38 @@ void ntfs_set_vfs_operations(struct inode *inode, mode_t mode, dev_t dev)
 	}
 }
 
+/*
+ * The clusters of a non-resident attribute end at its allocated size.  Past
+ * that there is nothing on disk to read, and past the initialized size reads
+ * return zeros and writes zero the gap they open, so the sizes must satisfy
+ * 0 <= initialized_size <= data_size <= allocated_size, with allocated_size
+ * a multiple of the cluster size.
+ *
+ * Sparse and compressed attributes get no exception.  Windows, ntfs-3g and
+ * this driver all count holes in allocated_size (the clusters actually in use
+ * are in compressed_size), including for streams that are entirely a hole,
+ * and fs/ntfs3 has applied the same check to every non-resident attribute in
+ * mi_enum_attr() since v6.6.
+ */
+static bool ntfs_non_resident_sizes_inconsistent(struct inode *vi,
+						 const struct attr_record *a)
+{
+	s64 allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
+	s64 data_size = le64_to_cpu(a->data.non_resident.data_size);
+	s64 initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
+
+	if (initialized_size >= 0 && initialized_size <= data_size &&
+	    data_size <= allocated_size &&
+	    !ntfs_bytes_to_cluster_off(NTFS_I(vi)->vol, allocated_size))
+		return false;
+
+	ntfs_error(vi->i_sb,
+		   "Attribute 0x%x of inode 0x%llx is corrupt (initialized size %lld, data size %lld, allocated size %lld).",
+		   le32_to_cpu(a->type), NTFS_I(vi)->mft_no, initialized_size,
+		   data_size, allocated_size);
+	return true;
+}
+
 /*
  * ntfs_read_locked_inode - read an inode from its device
  * @vi:		inode to read
@@ -1184,6 +1216,8 @@ static int ntfs_read_locked_inode(struct inode *vi)
 					"First extent of $DATA attribute has non zero lowest_vcn.");
 				goto unm_err_out;
 			}
+			if (ntfs_non_resident_sizes_inconsistent(vi, a))
+				goto unm_err_out;
 			vi->i_size = ni->data_size = le64_to_cpu(a->data.non_resident.data_size);
 			ni->initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
 			ni->allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
@@ -1446,6 +1480,8 @@ static int ntfs_read_locked_attr_inode(struct inode *base_vi, struct inode *vi)
 			ntfs_error(vi->i_sb, "First extent of attribute has non-zero lowest_vcn.");
 			goto unm_err_out;
 		}
+		if (ntfs_non_resident_sizes_inconsistent(vi, a))
+			goto unm_err_out;
 		vi->i_size = ni->data_size = le64_to_cpu(a->data.non_resident.data_size);
 		ni->initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
 		ni->allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
@@ -1675,6 +1711,8 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
 			"First extent of $INDEX_ALLOCATION attribute has non zero lowest_vcn.");
 		goto unm_err_out;
 	}
+	if (ntfs_non_resident_sizes_inconsistent(vi, a))
+		goto unm_err_out;
 	vi->i_size = ni->data_size = le64_to_cpu(a->data.non_resident.data_size);
 	ni->initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
 	ni->allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
diff --git a/fs/ntfs/layout.h b/fs/ntfs/layout.h
index 8f5792139d719..2de83d4ca40b9 100644
--- a/fs/ntfs/layout.h
+++ b/fs/ntfs/layout.h
@@ -811,14 +811,17 @@ enum {
  *                                  on XP SP2+.
  * @data.non_resident.reserved:     5 bytes for 8-byte alignment.
  * @data.non_resident.allocated_size:
- *                                  Allocated disk space in bytes.
- *                                  For compressed: logical allocated size.
+ *                                  Allocated size in bytes, a multiple of
+ *                                  the cluster size.  For compressed and
+ *                                  sparse attributes holes count as
+ *                                  allocated; the clusters actually in use
+ *                                  are in compressed_size.
  * @data.non_resident.data_size:    Logical attribute value size in bytes.
- *                                  Can be larger than allocated_size if
- *                                  compressed/sparse.
+ *                                  Never larger than allocated_size, also
+ *                                  when compressed/sparse.
  * @data.non_resident.initialized_size:
  *                                  Initialized portion size in bytes.
- *                                  Usually equals data_size.
+ *                                  Usually equals data_size, never larger.
  * @data.non_resident.compressed_size:
  *                                  Compressed on-disk size in bytes.
  *                                  Only present when compressed or sparse.
-- 
2.55.0

