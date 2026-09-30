Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395902F7EFE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790740134; cv=none; b=oIAQYu9RKAQpTMhTcsLYwQWJ5dXVJAi4XlGRoHrmHOF5D/ZUeJBLbzKJgqO76qeLrMwMyAIGYA/5J2J5KUaf0BpdE7EfuvO2aYTBs/SL5/Wp0vq3PoLuglU90LEzcG3CrSGREChtMOID8DR+heuTeyYcvZdmGb0MDqcfIoNd1Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790740134; c=relaxed/simple;
	bh=WYmTryAaQ/trZZhmLAWBl5OpMn+WWDyNXRxH9foDQnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pz9qtJQ4Bckm/EcrbcwgRRwrehD4xEAUU/dxU6tS5r0jAmO4IFvPTR8+GHXlh5wCiZDD8v6gjRlMB8gSBcHaA9+6vMUY7cwoSJlP4MbPE8fTGSnjOQNr8vRRpEHnG91w+WBzO7f3XVWILlRC+Cg/Y9L6ZAu+CuVwEnJLQ297COo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oNEtfSGy; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNEtfSGy"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2db1ca069c8so22708615ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790740131; x=1791344931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hRt/tj2cSACQMtmTLMhEnniCAGYtbcz7VW2FXaU1+ms=;
        b=oNEtfSGyJZ0uiOHL3JMj3YxCCPnGVbiHVb8sG/uRJjD4JoSGJhwZIVj9V3SKylpang
         HZ9rfmbQowQjICYW497GJkBSRZXYieWLNZWRDdSfd22YJ34xPJH6L2DldQWqwPlAe3TU
         ccLeK6wCxPAsDqBXLOsaid2eBYjN3RwQYo99nqejDEiXNeLr54vDgzZf7J9EvkO2jiF+
         aj2WN6D/Fp8lfniaCIAnLLySd7SJYUCQEFMHsim4m4HpXXZfv9Tl09oS/Hexx5dDM5hb
         44nTkrb8ai7RX799a0VcZ68893Z0APubuGoVVrn5okxuCaW+hOo4MSyDeCRapLDxFx6N
         VY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790740131; x=1791344931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hRt/tj2cSACQMtmTLMhEnniCAGYtbcz7VW2FXaU1+ms=;
        b=Ul/mlsqFd4/MObCgUH9PC+KdExGuuO0FiayXgWdXDTJJDxrlCw9Rc01l3wHpVciB9k
         cjOZLrVj5A8RtBi1dWC2dZLunBdkpEewn9srGz0U3OOG7YOGBPj9pHQ8WOzjlYINbCfl
         xawrt6C8mFcd+ChSa4/DXgokV1g3JuE0Rk1DrKgc7nyOLhTic+v0HcHcTXAgfVeqa8BV
         k6fo9TaKwp7XJanNxB6595xWmjTUzKPXubPwRTLczh3CVPUgqHjMsvvSipzWv6H7giuQ
         0EQOLUDWxMNFMNompbNixPHIsoYZ1tMvkd87nzcPwoIcI07pR+zvQyFNXIKzFxslq1dh
         OZiA==
X-Forwarded-Encrypted: i=1; AKwUvBzCMPOv38cXHlmOGOvPUoaazmSgAiWigLgQ66dQRE3agbV5QmZ9Ulmn+8sA9NWwPRMPUvwH+b/4JAEBi+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpI/V6sFBRRzb36EbtMLmOrj9yWVzdRLmHo6JmivdBYK4lCphb
	v7aicacDQkzT+a+52vynCBXG+dTVnbwo9TqjYqGcNj1MAmHJGKmIZ7bs
X-Gm-Gg: AYBFou0vbF0Wcgufk1e7Zx+/k+5k5RnzXNltQkBZeGPoQrisif5LRI1rH9m28RF//n4
	Ky05U/a0NzY80SRQUTB+u3HXHgexigZXga3st/UJ2Q20TBAdR2EkxyXi5w+Df2D+nRWE7dbVzfZ
	D868RABb/BGGuwGtAEmtpIMKJKqnNMqIJkgNf5nCPlneyr7eiPGbHQfn7jrtG/ckgSzEitaaKux
	fz30I8/XqoTV7cdZ4JlSFu37Dd+xNKgZckAmuCSEyMzte7KG2FrijLvdA9TpoelUQZPT7qEKyZt
	kz/N2vu+CfUfy5Nkjuo2nuxFUZYQPXWGWKXewSvOSfOXTOcGnsRPE51Zq0bGgS7qReoMg4calnb
	8M3LQ8Lcu8CAIc7W0CEyKb56waWlQUpMoirLU1zJxd+smbTKGVR8Ok2SAsUnPLcZu61HlK4y0rI
	j20ltBas7LyiZ6g/YlQjJJnXwUFZiCmwuRITwSytOhKU8IrW4xyzyqP94BM+03pW/8nyWq62B4U
	c0hQHz3UYuSUrd5LhF1LMQDA8IMJoD65MZg8KfqJ5w5as7eyWUQ6as/TTa5p2SkQfhxTvqy2ncJ
	5eqHyAHouGegKp4HK6uo+wq7DpO3fqANcr+c47L6yZ4Ko8CpVx0D6Pb7mi8=
X-Received: by 2002:a17:903:1211:b0:2dd:ad74:6d19 with SMTP id d9443c01a7336-2e2e4b32296mr1470375ad.31.1790740131383;
        Tue, 29 Sep 2026 20:48:51 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2dd86f3ddsm3760005ad.68.2026.09.29.20.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:48:50 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] ntfs: reject non-resident attributes whose sizes exceed their allocation
Date: Wed, 30 Sep 2026 11:48:35 +0800
Message-ID: <0d9fadd7e8146bf2ea4c78e71ed41cd01588b545.1790684177.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790684177.git.matthias.goergens@gmail.com>
References: <cover.1790684177.git.matthias.goergens@gmail.com>
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
check.  $MFT's own non-resident attribute list goes through neither:
ntfs_read_inode_mount() loads it with load_attribute_list_mount() and
ntfs_read_locked_inode() skips it for $MFT, so the check is added there
too.  The check was already missing in the classic driver; the Fixes
tag names the commit that brought that code back.

Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/inode.c  | 27 +++++++++++++++++++++++++++
 fs/ntfs/layout.h | 13 ++++++++-----
 2 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 9c97fc3f9e5ff..7e475d339e920 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -651,6 +651,25 @@ void ntfs_set_vfs_operations(struct inode *inode, mode_t mode, dev_t dev)
 	}
 }
 
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
@@ -1184,6 +1203,8 @@ static int ntfs_read_locked_inode(struct inode *vi)
 					"First extent of $DATA attribute has non zero lowest_vcn.");
 				goto unm_err_out;
 			}
+			if (ntfs_non_resident_sizes_inconsistent(vi, a))
+				goto unm_err_out;
 			vi->i_size = ni->data_size = le64_to_cpu(a->data.non_resident.data_size);
 			ni->initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
 			ni->allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
@@ -1446,6 +1467,8 @@ static int ntfs_read_locked_attr_inode(struct inode *base_vi, struct inode *vi)
 			ntfs_error(vi->i_sb, "First extent of attribute has non-zero lowest_vcn.");
 			goto unm_err_out;
 		}
+		if (ntfs_non_resident_sizes_inconsistent(vi, a))
+			goto unm_err_out;
 		vi->i_size = ni->data_size = le64_to_cpu(a->data.non_resident.data_size);
 		ni->initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
 		ni->allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
@@ -1675,6 +1698,8 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
 			"First extent of $INDEX_ALLOCATION attribute has non zero lowest_vcn.");
 		goto unm_err_out;
 	}
+	if (ntfs_non_resident_sizes_inconsistent(vi, a))
+		goto unm_err_out;
 	vi->i_size = ni->data_size = le64_to_cpu(a->data.non_resident.data_size);
 	ni->initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
 	ni->allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
@@ -2008,6 +2033,8 @@ int ntfs_read_inode_mount(struct inode *vi)
 					"Attribute list has non zero lowest_vcn. $MFT is corrupt. You should run chkdsk.");
 				goto put_err_out;
 			}
+			if (ntfs_non_resident_sizes_inconsistent(vi, a))
+				goto put_err_out;
 
 			rl = ntfs_mapping_pairs_decompress(vol, a, NULL, &new_rl_count);
 			if (IS_ERR(rl)) {
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

