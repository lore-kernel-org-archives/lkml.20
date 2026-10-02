Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC90235A38C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915199; cv=none; b=prJ/9oEukEotJxoPlskQeipam1jezXXzsvbSVxpJ6cK1JdwokKcmHfmrVL56oDAJhQICZBcZiYMWaMPpPgZtIZH+UY3W2071UcXgclNQzNdiCcWrm8HnORrEPX4/z8SLax8E2uTe+uFLW2wkgCPSgjCjo13MnSEpn0/IF+LnIxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915199; c=relaxed/simple;
	bh=zrZwbjnwFa2fvtKd1riZTpYubuiOygKlk11p9wvAiaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JNFP7kRZj3At2u9E7tkcGe+EEqb7Jn/AYU+b+qruwcBBEx7Fi397rvjEijl3lpBDJPEY7dlSg6zuyiejJ0i47pGS15aHrYtyi3VIOvXuW3FhEvn+Lg1sTbLPS2N0ffxDN91Ko7tdHyob+tK8ATsZCwvapk3xOHmtqMrnoZ3ByJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ila25MHI; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ila25MHI"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0f64df6a6so3294321a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915197; x=1791519997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoKxOTjOYPY0jJKf2vvmoT8EEKuylC7jQJjw/PcHr2A=;
        b=ila25MHIe3o/eK1FW9hSzDNB4AmMJ1mRmhb7pMrUxFM0v2RS8u4p9kspsuu4Uwe6U7
         G3EPkAMpo2IuGVJ+1VLRLJ0gcex39wYTzWz7k6uFYWM7t288GOVEXJlNxkCx8bTHHfQj
         zsv3gH6Z6KIIcRLC2NrowGTAeGGAnGjTIKRCm4zlLslthUG6OUP12PlvZ8MvpuwzkkO3
         kI7PuxnZpQn5DgMbKcbkKGy7ymOXvlcKpKqB2q6FQYrmBdBwUonjIEA7U/RVO/nKhd/o
         DdYTfUk2y3oz0oULpLudCpAQhOKwKdA9Rxt5pTxYyGbrwi7xi1fy+5v/1eBSFRhPEpYd
         EtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915197; x=1791519997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoKxOTjOYPY0jJKf2vvmoT8EEKuylC7jQJjw/PcHr2A=;
        b=JQqTOg5+TMynFeHGwE6/aP/HLhzkPze4c1WpdOJY0iGnSJYK4TOGzcM0xpH5SPBuy2
         zF61ASTZIBeMJ7Zt4on77CMnhGW3drlK5CxAIzk4TKK4sua/VRo6+KCr1XUrFyALCXaf
         zgpH7QUymJEZA39eb+7ZiD7PFYbTWQ4XcRZ9Of/Z00385r36/uYQl0jqEJcfHN2xTPcx
         9QmgkBWkYqSC8AnNhKJ1KKcHDWRTHwJrsK8q+bzDu7HhNuM9jPkNQnsazPUX1e3c3VeI
         ow5jAY/pupl4MBkqzMFQ/VViqQoy7JhQyuJhJ/y9VebmFGzzWV6wPnCfWWtrurC1GAR4
         ZyRg==
X-Forwarded-Encrypted: i=1; AKwUvByooYou+rIf7dMpdZQ3sZUobkV9RTYtjwpQKhtXXISj39S8HYYUEeKoa3ZzHnQUfqFG/no/M3si5n/IqKU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpzDnmK9v6V6QM1OmtleiZw0R2H36fKsVqMIFxlJgboadlDcyu
	xEyXoTh5dVRoT3Nnoti7FQz+cAqythz4R+KcPrxPT4hX6/GqYNNIvLl/KgTPb+xIRS0a0g==
X-Gm-Gg: AYBFou15JEggomaLQwW6ZniHBUs1X+bMB6OJ5QuzsxqN/TUxPZg5reZ7w0aeP3zMDgd
	B1SMCOwBj3dGBcNgblORyb3BJC0tIsP46EJExEAVRtOhkWWt6FYIpJ9y53liIm1pm9QrVUYEdsp
	CS62uJkFqnes8wn1gKOOJA42TKrFmgrSg5r9OhwgAHwsB7Hg5ZopUrRgeLeYHYNMsBmFkugfugr
	voVZWWhMGqVYD9HpghzrOcIJVpu6Wde4mJqcW/cMJPHhwVo5Tki/WtKPFNKAl2I6e2pKd4PAZmB
	Ywxk4bznO03tpJ0CTJ85EOvVCTpFqqm5+vKq5BHBA0vnZDvtGiSK7mPso8nkG0kWc+uhTpll8j7
	AgDphsBgoKCPnl3JsUE7CIM/or/5RYK6TR5MJy/idkoGH7hgDD+daly9/uw03jk8pB6IXvrZLn4
	rPLop324Pus6K6jZVP2knOmoaOMKYwukbkvlCtocBBho1Um2FvCEulMNR6RnHimMFcLS/Nz0OhT
	NOrmLa3UFaYpaA5PydSBVetbLsQ3KSrMOQE/CKRdi5ruju1nyX1TYEg4GP4Y3yMcD9ELf5/lkZ0
	xTn/hkcStLnAYKTcXISTdQ4d2d4kd0SrIE3P1X4y0ZPnm5YbcxwvdTmlmVw=
X-Received: by 2002:a17:90a:dfd0:b0:3a4:f75d:d194 with SMTP id 98e67ed59e1d1-3a6cec99dacmr1321004a91.36.1790915197005;
        Thu, 01 Oct 2026 21:26:37 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd5ddb51sm2205054a91.14.2026.10.01.21.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:26:36 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jan Kara <jack@suse.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+799a0e744ac47f928024@syzkaller.appspotmail.com,
	syzbot+43fc5ba6dcb33e3261ca@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH RESEND 2/3] udf: check the unallocated space table when it is loaded
Date: Fri,  2 Oct 2026 12:26:26 +0800
Message-ID: <20261002042627.1677228-3-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261002042627.1677228-1-matthias.goergens@gmail.com>
References: <20261002042627.1677228-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

udf_table_new_block() hands out the first block of the extent closest
to its goal and trusts that the extent covers at least one whole block
inside the partition.  Nothing checks that.  A zero-length extent makes
it return the block the extent points at, which need not be free, and
the subtraction of one block then underflows the length into the type
bits, turning the entry into a bogus continuation.  An extent running
past the end of the partition makes it return blocks behind the
partition.

Such tables are not only found on crafted images: until the previous
commit, udf_table_new_block() itself left zero-length extents behind
in tables written by mkudffs, and then converted them into extents
running past the partition.

Check every extent once when the table is loaded, and refuse
read-write access if one is empty, is not a whole number of blocks, or
does not lie inside the partition, in the same way as for other
allocation information the kernel cannot use.  Check first that the
table is an Unallocated Space Entry at all: the walk starts at the
offset of the allocation descriptors in one, and for a file entry that
offset lies before the inode's in-memory copy of the descriptors.
Treat a chain of allocation extent descriptors that leads back to
itself the same way: the walk would otherwise return the same extents
forever, and the mount would never finish.  Let a fatal signal
interrupt the walk and fail the mount.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/udf/super.c | 80 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/fs/udf/super.c b/fs/udf/super.c
index 5351755aca3e..995969e6c7c5 100644
--- a/fs/udf/super.c
+++ b/fs/udf/super.c
@@ -1106,6 +1106,73 @@ static int check_partition_desc(struct super_block *sb,
 	return 0;
 }
 
+/*
+ * Check the Unallocated Space Table once when it is loaded: the allocator
+ * hands out blocks from the start of each extent and trusts that every
+ * extent covers at least one whole block inside the partition.
+ */
+static int udf_check_unalloc_table(struct super_block *sb,
+				   struct inode *table, u32 partition_len)
+{
+	struct extent_position epos = {
+		.block = UDF_I(table)->i_location,
+		.offset = sizeof(struct unallocSpaceEntry),
+	};
+	struct kernel_lb_addr eloc;
+	uint32_t elen, blocks;
+	struct kernel_lb_addr seen_block = {};
+	uint32_t seen_offset = 0;
+	u64 steps = 0, period = 1;
+	int8_t etype;
+	int ret;
+
+	/* The walk below assumes the layout of an Unallocated Space Entry */
+	if (!UDF_I(table)->i_use) {
+		udf_err(sb, "unallocated space table is not an unallocated space entry\n");
+		return -EFSCORRUPTED;
+	}
+
+	while ((ret = udf_next_aext(table, &epos, &eloc, &elen, &etype, 1)) > 0) {
+		blocks = elen >> sb->s_blocksize_bits;
+		if (!blocks || (elen & (sb->s_blocksize - 1)) ||
+		    eloc.logicalBlockNum >= partition_len ||
+		    blocks > partition_len - eloc.logicalBlockNum) {
+			udf_err(sb, "invalid unallocated space table extent (block %u, length %u)\n",
+				eloc.logicalBlockNum, elen);
+			ret = -EFSCORRUPTED;
+			break;
+		}
+		/*
+		 * A chain of allocation extents can lead back to itself, and
+		 * then the walk returns the same extents forever.  Remember a
+		 * position at doubling intervals (Brent's cycle detection);
+		 * a walk that comes back to it is in a loop.
+		 */
+		if (epos.block.logicalBlockNum == seen_block.logicalBlockNum &&
+		    epos.block.partitionReferenceNum ==
+				seen_block.partitionReferenceNum &&
+		    epos.offset == seen_offset) {
+			udf_err(sb, "unallocated space table loops back on itself\n");
+			ret = -EFSCORRUPTED;
+			break;
+		}
+		if (++steps == period) {
+			seen_block = epos.block;
+			seen_offset = epos.offset;
+			steps = 0;
+			period <<= 1;
+		}
+		if (fatal_signal_pending(current)) {
+			udf_err(sb, "interrupted while checking the unallocated space table\n");
+			ret = -EINTR;
+			break;
+		}
+		cond_resched();
+	}
+	brelse(epos.bh);
+	return ret;
+}
+
 static int udf_fill_partdesc_info(struct super_block *sb,
 		struct partitionDesc *p, int p_index)
 {
@@ -1166,6 +1233,16 @@ static int udf_fill_partdesc_info(struct super_block *sb,
 				  p_index);
 			return PTR_ERR(inode);
 		}
+		err = udf_check_unalloc_table(sb, inode, map->s_partition_len);
+		if (err) {
+			iput(inode);
+			if (err == -EINTR)
+				return err;
+			if (!sb_rdonly(sb))
+				return -EACCES;
+			UDF_SET_FLAG(sb, UDF_FLAG_RW_INCOMPAT);
+			return 0;
+		}
 		map->s_uspace.s_table = inode;
 		map->s_partition_flags |= UDF_PART_FLAG_UNALLOC_TABLE;
 		udf_debug("unallocSpaceTable (part %d) @ %llu\n",
@@ -2233,8 +2310,9 @@ static int udf_fill_super(struct super_block *sb, struct fs_context *fc)
 				/*
 				 * EACCES is special - we want to propagate to
 				 * upper layers that we cannot handle RW mount.
+				 * EINTR means that a fatal signal is pending.
 				 */
-				if (ret == -EACCES)
+				if (ret == -EACCES || ret == -EINTR)
 					break;
 			} else
 				break;
-- 
2.55.0

