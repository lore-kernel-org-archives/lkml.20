Received: from mail-yx2-f16.google.com (mail-yx2-f16.google.com [74.125.224.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB939415B7A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871705; cv=none; b=Ct+EsmjkY79++F0/sRixdiC3z/RMt8fuTDGdtuKgE/vBfzVKua+fbmRLFgbwzGMBExD7X9cXnVmZCAGMMTKPEZ083vzNCLmj4gjsEk5Izx2QyH8aKzcm9R1du+r/FTlokFFqqHGX5xeyoBwFf1HIe0+g/NpTO+3wz4cC5XnumEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871705; c=relaxed/simple;
	bh=tpVKXkX0pOD90qP8I70wcIYd7g7VZQlufI712hotLNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V71IcIBKpOWYChOX6DKGMbvxAQ81vtvU+ZeyeVQOcQcMMrGDXzzw9kfLgVD6eXWU3glM6/oWlfOdEPLHI5nDW2MYf8mmLPgnaILNpl07s/BvlU94Vm/P2qiB1Q0NprAeqp4HYEFH2H04lbAi9WH47wH7M88XgjhRCWj+yrMWCz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLD37ovr; arc=none smtp.client-ip=74.125.224.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLD37ovr"
Received: by mail-yx2-f16.google.com with SMTP id 956f58d0204a3-6756f62025aso3459166d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790871702; x=1791476502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WlC1nEzzW1HjgZGieDluCiftj/gel9FY6sGluI2bYGk=;
        b=YLD37ovrwRdHY2Q9SXZ5weELk1vHUW7ozRNTkhmGRhXACZAT+djOmj+Dju4XhRv7Ff
         /T0f8uHptjEJhGT/r/6l0kQkksW3nRBUVhgX3pM6ktiGwGZ0zjkOR2sQfIOOk1bK+HUq
         ol3Zx5CbQgOUvhaMSZs8NuIsKJstlPaW4to6w+PaxWtskQ5DufBohn0tq40VPtpdVHEv
         PKn3BoxZFp8ntVAg4J9o3i/7tjCnnd/Rk8UHfeb1Xog1ARFlCBGPXR04TKdJ8160IQFg
         U8N0WtwS+vflEAe1or5IrmF1+MYFwrauH9VXkKbMiBQHqMS+wD351JvQ8pFN6voIex/1
         MwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790871702; x=1791476502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WlC1nEzzW1HjgZGieDluCiftj/gel9FY6sGluI2bYGk=;
        b=bLXkL7soGEVEF8NH8eOBjLLSN0is2b7MnzFSgh833x4bijpx+RKd2eHb7bwj6Q6hVV
         b4mGQGGvMuRScCAPFqmfDXYu+UZq64W8ibDz2XSJPOGawfCvmDApELKetU6hg2b3XfXu
         jTtlJ1jRyEXsQvhy+GTBJU/7Hp8iYShYZaiAv1SQK+os8JUMygeUXqoLWL8TJNwMyI+v
         Qp4Y9GuIK6mo+Evc64wslFOjV8Yyj01LS/gbs97Zqcv9tZUBdqRpYsNNchLfLqTBEChn
         95tT8ugKW6rEtyFex7TntzCkW/45GOEmR7pZrNJZzJISzgi49rzFa6WSEmWJh/XZ7egh
         UD9A==
X-Forwarded-Encrypted: i=1; AKwUvBzy1NJjUlXrqb1rmLX9QPaiXkx3rIdIv6HAdNyiWFg5vUTJ8nUyI3IaKRc55nmPhgMPd7GDN2POBPopeDQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjU5TiJ3a2ux+JPIM3URcdMO8qBJdGv1dQwx5s7MZ1Aqxb05MD
	zpDSD/dx8sqXb7alzwWNtALWeQmIfnFI+MF4TSHJih+gN2nGenwL1aV8
X-Gm-Gg: AYBFou1RLyfUvc2EI81nv4sTz8b+VVavznbaHd+xHuI9pl0yCA97uqXkpudXx7CO/2y
	dhiSn0orTJmP3RlHP8FAEDVd4z/9ZNfUvpr2ASuVpIb2eYN5lYAbYjlC3CYATnwOfB/iFv15DDX
	Kc6uZ9ayhqXwwXDyJPUlGDr4eHwv+DnVIEN+WkKtfyQkI8asbWVeUMc1zt+aJln0vgNEWWGngj0
	zWg2bd2jvPu1NNgQ/jd678NDh9O0IMo38R6al0Vb09y9fvGXws2KfeuyXU/MiSdhEUYZg8oiqWN
	DZsBQ8L0rBBCkS+Mm2YV+JBmt0sDnQEXTWfu6u5ex3wXTExf92j1GfQmWMWI6ERkV9OAuXEW4XY
	SxZlxOo45ww5G9EWMBMkBC7HvnfmxaRMOJ1FkcCHG8W4Dp5zv9yVt9N+91DxQ2WcdLVFOEQ5oVK
	NlClZuBerfD7YNyM3WgWfMBRuvuAWv1ycybb5Tcb80i4Kh2Ua3VLTnfuoEjiwWn4AKauJ2wTb68
	1NO8AkxEX+vqbAKXzRIytlwFSP6+zdThQdVHC8tQ3vzUMff7Xw/aWoLMc7BH95sLgIqje8+cgb2
	hSDawbhigv7sq5WoMpZH5zi6EJabtTiKLDp0D7OeNYojRXLAWq3hV/UlXAI=
X-Received: by 2002:a05:690e:11ca:b0:675:4269:157c with SMTP id 956f58d0204a3-67683322d5dmr2071295d50.6.1790871702411;
        Thu, 01 Oct 2026 09:21:42 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-676918388b4sm1243584d50.8.2026.10.01.09.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:21:42 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] hfs: validate partition map entries in hfs_part_find()
Date: Fri,  2 Oct 2026 00:21:34 +0800
Message-ID: <995c9f50e1d6ac7f10087c67a48afd8f54cc5ffa.1790689266.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1790689266.git.matthias.goergens@gmail.com>
References: <cover.1790689266.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hfs_mdb_get() loops around hfs_part_find(), rereading the MDB wherever
the partition map points, and hfs_part_find() takes the start of a
matching entry as it is.  A new-style entry with pmPyPartStart 0 leaves
part_start where it was, so the loop reads the same blocks forever and
the mount hangs.

Check each entry before following it.  The partition must be non-empty
and start inside the device.  For a new-style map it must also start
after the map, which begins at block 1 and whose size the first entry's
pmMapBlkCnt gives (TN1189); the old-style parser keeps its rule of a
non-zero start.  An entry that fails these checks is skipped, as the
old-style parser already skipped entries with a zero start or size.  The
old-style parser now also stops at the first match, as the new-style one
and hfsplus's copy do: it used to add up the starts of all matching
entries, so the start it returned was not one that had been checked.

Every partition-table hop now moves part_start past the map entries it
has read, so the loop in hfs_mdb_get() ends and reads each block of a
map at most once.  Rejecting only a zero start would end the loop too,
but a crafted new-style map with an entry in every block could then make
each of many small hops rescan most of the device.

The end of the partition is not checked against the device.  hfs already
mounts such a volume without its alternate MDB, and the block layer
likewise keeps a partition that runs past the end of the disk, trimmed
to fit.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
v2: check the entries in hfs_part_find() instead of limiting the hops
in hfs_mdb_get(); stop at the first matching old-style entry.

A partition entry pointing at its own map hangs the mount without this
patch and fails at once with it:

  img=hfs-partmap-loop.img
  put() { printf "$2" | dd of=$img bs=1 seek=$1 conv=notrunc status=none; }
  truncate --size=64K $img
  put $((512+0x00)) '\x50\x4d'          # pmSig 'PM'
  put $((512+0x04)) '\x00\x00\x00\x01'  # pmMapBlkCnt 1
  put $((512+0x08)) '\x00\x00\x00\x00'  # pmPyPartStart 0 (self)
  put $((512+0x0c)) '\x00\x00\x00\x64'  # pmPartBlkCnt 100
  put $((512+0x30)) 'Apple_HFS'         # pmPartType
  mount -o ro,loop -t hfs $img /mnt

 fs/hfs/part_tbl.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/fs/hfs/part_tbl.c b/fs/hfs/part_tbl.c
index 36add537d153e..2c15afe098127 100644
--- a/fs/hfs/part_tbl.c
+++ b/fs/hfs/part_tbl.c
@@ -9,6 +9,8 @@
  * a patch contributed by Holger Schemel (aeglos@valinor.owl.de).
  */
 
+#include <linux/blkdev.h>
+
 #include "hfs_fs.h"
 
 /*
@@ -49,6 +51,22 @@ struct old_pmap {
 	}	pdEntry[42];
 } __packed;
 
+/*
+ * Check a partition map entry before following it.  The partition must
+ * be non-empty, start inside the device and start at or after @first:
+ * after the driver descriptor map in block 0 for an old-style map, and
+ * after the whole of a new-style map, whose size the first entry's
+ * pmMapBlkCnt gives (TN1189).  Every hop then moves forward, past the
+ * map entries just read, so hfs_mdb_get() cannot loop and reads each
+ * block of a map at most once.
+ */
+static bool hfs_part_valid(struct super_block *sb, sector_t base,
+			   u64 first, u32 start, u32 size)
+{
+	return start >= first && size &&
+	       base + start < bdev_nr_sectors(sb->s_bdev);
+}
+
 /*
  * hfs_part_find()
  *
@@ -77,12 +95,15 @@ int hfs_part_find(struct super_block *sb,
 		p = pm->pdEntry;
 		size = 42;
 		for (i = 0; i < size; p++, i++) {
-			if (p->pdStart && p->pdSize &&
+			if (hfs_part_valid(sb, *part_start, HFS_DD_BLK + 1,
+					   be32_to_cpu(p->pdStart),
+					   be32_to_cpu(p->pdSize)) &&
 			    p->pdFSID == cpu_to_be32(0x54465331)/*"TFS1"*/ &&
 			    (HFS_SB(sb)->part < 0 || HFS_SB(sb)->part == i)) {
 				*part_start += be32_to_cpu(p->pdStart);
 				*part_size = be32_to_cpu(p->pdSize);
 				res = 0;
+				break;
 			}
 		}
 		break;
@@ -95,6 +116,10 @@ int hfs_part_find(struct super_block *sb,
 		size = be32_to_cpu(pm->pmMapBlkCnt);
 		for (i = 0; i < size;) {
 			if (!memcmp(pm->pmPartType,"Apple_HFS", 9) &&
+			    hfs_part_valid(sb, *part_start,
+					   HFS_PMAP_BLK + (u64)size,
+					   be32_to_cpu(pm->pmPyPartStart),
+					   be32_to_cpu(pm->pmPartBlkCnt)) &&
 			    (HFS_SB(sb)->part < 0 || HFS_SB(sb)->part == i)) {
 				*part_start += be32_to_cpu(pm->pmPyPartStart);
 				*part_size = be32_to_cpu(pm->pmPartBlkCnt);
-- 
2.55.0

