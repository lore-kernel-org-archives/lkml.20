Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369147;
	b=q5adhWsv5HJaSIZhASDKfeSYCQMA9dn8RSWSbJ1IToGphCFeVwlGYQ33FAGUo+eAZJLG
	 cMZrhYLA5WQPAej42LhSGyQGId4v90RwdvQyi/LggF91zt/XnOfK/OCgRdnOGKp2gnrMD
	 RpymUY6i+5loCY2OOVRzqW5Yndy7rJi2GJmZkNZ25FhXBCO5L2wJQMmJxKqxPFzqLgIZR
	 AEi5YxjMK2mp+Hglywa+s40DtikpBkdcPps+vFj06sWhePHP9VQyTzIwcX1q4FcO7Jz91
	 yC4D2sBV1KEsqzVWyLuK83Jij8IkOzMdbqtHbJC+AVIrGRUCmMdWCLy38nDkxG8bD6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BBWbC38nJ592mzswsCx2O3bqWttVdUVt6GoFwnbLooM=;
	b=r0nir3sPUp4LWNxYIPra5SBSy75+OpDPTjXzzWlA3U593vzB4+7RRjWTETm/9MkZluVY
	 LVNhTFS1oA8AHVqO236+6oICGX1hxOOWRHgcQEJssp+QECu7pLAnuZ2G4iSgZ40VGWWG6
	 F89djpW9v/DJi+HEhabQqRil3Ar88/XMmQDOD3PlshEhACXB5Ti4JX/jy5cIyNdsmSDCv
	 ylcdRCZqqaz7jPrOw20kseHtKgqcEDCDRgYUcBXA5+rXvMvfyMFbciyzKni0bIw9pKh7f
	 qCs1BOjqXs2ugrTzMpYnSHMLYK1Q5YsthxmV1xbOnwPqP/LcHLiqZPg+PXhyDGaL93A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N2Jp9UEp;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D9F606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05D9F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N2Jp9UEp
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so425280b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793369146; x=1793973946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBWbC38nJ592mzswsCx2O3bqWttVdUVt6GoFwnbLooM=;
        b=N2Jp9UEpBwwlv3lpwyY9iGG7lXqsjgtwWqs/4Oad1AlynOvk65H3Oa5FmGXMoZoaCb
         ocyFI1pMOW/7XLI7aPtElQZXKKD+Co/5GbKeTCXtiAUFvzrFFwVLEaqcPMK8bx8E9LW+
         7HA89ZqYyrM1tLvKAF/sL9ygQTVlhIyiAtjcnJyx9OadHuZy0nMEZNSlSouZxCme6mUQ
         7HuOUiRNTLqmhGcpqqtIm0xRh2hjkfyRR8EQuPRxwlFRPPGzeX7+xSQdTm4HPDLXp3GJ
         57xrRzoE8HuZxVGMd794c/8CAVL8rICjCj+2LPrsmm1Jfvuj5ZOwCSXx4RmAi7FVezq4
         6L9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369146; x=1793973946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BBWbC38nJ592mzswsCx2O3bqWttVdUVt6GoFwnbLooM=;
        b=u2ZhDnj5wKzDcq0L7J+OfqfvwIuOjhnYwY4FwzePzIg17lJ/7f1M55Nr+6ye+3Lk1D
         /3jlNCXsn0UaE3NVF9M394zpozkc7VloQ5dZlUyzZM+luumYruXjsUhqbKR17ZvZc9RQ
         XYmEIBsjHt7MgG8Qxf3cmzl/NdnuCO883W0NRsIiENDWFB6s0ztAQB8Vs8R/QMZBfx01
         gmqZxubTpIVeFmJTH4YmEzFZPYdpv6IJsMtzvxrwXKbbfCJmBuk7hNpHtntk03MZ+btU
         10Ai950PES3pqOuunhbEdS/ZzhT/2i2EGVpa+6xiMF+vS+DZ3ieaVJ5pawhhe9ULQZjb
         bbzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFEM11OuGL3WbdrB8ozhHMX0AO0kSTTxbOAzzQjD1oAjNbYxzzNK0rqNTXuKnTFWrNeAqk12x1FTVKJXk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfffJjiF9a6j4DoV9JprZICPlUoqeYXFB0T2v6uJ29rHkK6Z3A
	9Jg+kSFh47zutxh40800o3oByrdm4EsXq74KJFOqHCXRZgq6myV867Ox
X-Gm-Gg: AYBFou3lEljJ1jghTBLBV2lc5qivpSCGyqkK0Qnhtw9ULaWW7AnNDHZwdi03m6cF9J9
	+Nz7JZD+QB5Swex6m9K6l4iCqSoxbnwgQ+i27yNy8g1qT65xsNcGgUvFB7lZGQAvexXR49Ithmn
	KE2vT8wx5XGougZ1YYJEBwKKcw8ftYnDArTZ4Qs0xqdjENH67m3aijnGgU4h97UpauuC/wHKLGN
	nYwo58tipMCIPGFAbFlVKXo3bhe/pmQjDN2FxDx2Dzq4/ADXlfkmCYDNKtNSHxOv9KeQp/Vmope
	c79fwK4j3LGerg35VH3Bb8xGSbm5nGGSIpNrt1E+YPJhlSt96uy2NTY4COeJ8kRQVj679TxV1Xc
	7XpsWT+H1IW3MU1Ro0xHK79t4iKJN1OBI+PXyq8Gfu7F78geDkL1LZAZFTsCoXlYSn1Lzcv9n6V
	fJslnim1Y2ls7jvAMhZH1OOqXuwzbrTln5lQwcKEnz80Eubm7NwR3S1ZR5/ULfwFXm3cfUmIY+h
	V0j28b6phfVgOOQEwToLPgJr58LA5VFMqCGl0h/VWpnC+aW2pPEpny8Cw6oSBgLWPNKBU1sMKod
	zRzXvcyFKj435P3z8j1qY2xY4LAc71TWiu1qvOOcR2skhgnTru40md9Dc7s6EywRtS5jMPpiyMQ
	fofLdu4Z3HWLfVmcJyKi3qsidrzxoGFDrtcfGliFTNr0ZFN9K8ZwsqvkFijKvYPnLNgQDVCWvJB
	7SBWpa64QaUD6NxQ==
X-Received: by 2002:a05:6a00:2d85:b0:89e:848a:fc97 with SMTP id d2e1a72fcca58-8a9beb693fbmr2032651b3a.35.1793369146163;
        Fri, 30 Oct 2026 07:05:46 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad77fd956sm26043b3a.3.2026.10.30.07.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:05:45 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jan Kara <jack@suse.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+799a0e744ac47f928024@syzkaller.appspotmail.com,
	syzbot+43fc5ba6dcb33e3261ca@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH v2 2/4] udf: check the unallocated space table when it is loaded
Date: Fri, 30 Oct 2026 22:05:35 +0800
Message-ID: <81233decd91f4a48bf4d74e3d15b547c7711e39f.1793349907.git.matthias.goergens@gmail.com>
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

Refusing read-write access to an empty extent is deliberate.  It shows
that an old kernel took the last block but left the entry behind.  If
consumed again, the entry returns an in-use block and turns into a huge
bogus extent.  Refusing the table before that
happens avoids this second allocation; the filesystem can still be
mounted read-only.  The check cannot detect every overlap that may
already exist in a damaged table.

This patch should be backported together with the previous one: that
patch stops creating new empty extents, and this one rejects existing
ones before they are consumed again.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/udf/super.c | 80 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/fs/udf/super.c b/fs/udf/super.c
index 2335c31..a81a850 100644
--- a/fs/udf/super.c
+++ b/fs/udf/super.c
@@ -1106,6 +1106,73 @@ force_ro:
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
+		 * position at doubling intervals; a walk that comes back to it
+		 * is in a loop.
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
@@ -2243,8 +2320,9 @@ static int udf_fill_super(struct super_block *sb, struct fs_context *fc)
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
2.56.0

