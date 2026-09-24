Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D0244E04A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790291517; cv=none; b=VwYWKaEs+jKnoCe5h6mbLbHAebFJV3guESTwcfLk2p1e45HpACWgYKKaRPh7DVw+PwasPdQb3vOPtypXSR8AuWnafp9I/GgueDnL5qbLda6BaMk5X0Jw6JWeVgcFl67eXkCoBb//11HGlM4SF/GpsMizVc0ucoWXOx49lN367Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790291517; c=relaxed/simple;
	bh=jDSKrZuCbAKoy79hwfCAy5MJfDj4eTDrw34UgUf4VAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TBqC2tGDndVMhNWlWdv4KnNKqKD+kPeaNZnWOA3Gjow7eKJofUb9L4VeByuljbd8eh3EG0Movzj6tUpLXdTQmUMMqQMbSNo7awC1vY9AvV1v/fdTzBWNKm1FmjVhssHjAuZQQafgb+FLHHt7l8GO/GbJJ/mq5oKTtVme/RSLN1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbG9XHsH; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbG9XHsH"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e96a8ba8cso272162241.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790291511; x=1790896311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R0MMZG5XwLo1Keu2pftSxzHNiWbVpJUyFjkoJiOXdxo=;
        b=cbG9XHsHmO4ZFHJUCPCMAdwstNMsYCfCIB9ZgBNlw2Cce0JqIL06xpJxA13MkFW4sM
         /b3+XwMwrPlSf0YsbL0DUI3ew6Y7jB1O1TxW9Oi5GVpY96eMcbe1Xgos73dBWRUY+ORX
         dsQaBchxoIiZg3PJnhfG+Jqd/yDegs4kMYNtJSy2SQGxsOWC8W8KkJFRGNKGLeeZ8JuP
         IjvcbJsujgbrpuONypoEmn4ozIyztHS3qG97I5p/uQUd/NQE8bw+EGxpr6PoWcBUOm09
         Q+KPxkSdw1/V6LWKeMgpVat9Xj0AWaY9/rNC0ZPO3o0c4wRygJpgn+GOoS4+J+X72IhK
         ONmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790291511; x=1790896311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R0MMZG5XwLo1Keu2pftSxzHNiWbVpJUyFjkoJiOXdxo=;
        b=nECA6gIXBlJGMg7lyEzBcCCy0jZLDihPSBMfx5b9oeHQISZuw8Et6KQIvJ1byuAFg8
         HlGS0USwX8vxOckK4QtuyDa6xwtfqj5E2QZCaiTk9Jy9lMPKIcQQGyBGz6FyHhPyI2nc
         S1SuCVhMVlVsVeYU59gsUxNn3KSDeq3p7sOakLeO+xgQANJp3Z0xgO0NBYfAyCTKBH1N
         Lpyy0LN/peOdAbnTQAzS0H2sbAW4rWTwFpBAj6I8u6+X6hxt1r8otjzNpnFRmwum58pU
         qMSESb+8VEwXXr8UWZK+BYmgJm4Ktg4ZtiNeWlJrphesk02o5NPoUM0lyhOyvJzIr9li
         +40g==
X-Forwarded-Encrypted: i=1; AKwUvByVg15vkatAtZZhezvWWfW/CGq81LIVnNqWDNxqKkJo4p0I+nABIsMFkAeN99IUMJJJtkxYcB0kSVoGYUY=@vger.kernel.org
X-Gm-Message-State: AFuF++lfUgrLzNZ+XS1MW9xoNKZRtig4s08wy56/eLXdxfxxi7s1HA80
	+URzIo6DH6ktg9BQ964cS9Q1y8ZtFSuMAkf1CT9sG8E3leQO1jLfMWBH
X-Gm-Gg: AYBFou1L7WACMU+AWerAG3pOj9cCm44z3XxX7tcx9h+KdCTERWJFOo/5Lw/ZBznOJeg
	tZdi0zX9hPNu/BMr/+OknKFJ3UKOP8dVA8UTUcObhI6W58QDlU1AmovnhAMhKEHV661NsjHL4JN
	CzR+KUbYn3T10tSXuDd8mAzw0VWCBQe89BVKCwSA7N+Kg5KlgLLcYXjuJCB5+r2Kz/k4axKvE/j
	0Q0j6O5o8cYdUdIq0tFpoauII7S8Dy2POosPTBU2f7NM78BP9ZGXX3hCmpN6XhxBQGA4/7LYGnV
	xBwRF8JFrxPmU3qx9x341FkWTW2FjHlUZxhxnvIyL8Gk4J7RHMn3kEXq7HCKel6nsfxoii2m3UO
	Txyes7MgJllgiAIm7+syHS0VlhNXSOoemhnaioEO782FwomeD2dbxz9U45h6YDCwd1nEgZe5N1Y
	pQ6Nw8QJ9+TELmC36H9KQWH/MyvLa4tN7NAhAmzQRA5dCRuyKDb9miO+OkxsGPc7b87zkVmK+FT
	mxYfWsG5YB8nAp45CDpN8fzNr6FAFH5OLWVQg9cbaiBv4S3Y0SiapL4P6W9HtVR6QE9
X-Received: by 2002:a05:6102:290b:b0:7a1:f7d2:e82b with SMTP id ada2fe7eead31-7af1f3f4285mr2112000137.36.1790291511565;
        Thu, 24 Sep 2026 16:11:51 -0700 (PDT)
Received: from bazzite ([138.122.221.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b1b4d9517bsm541638137.1.2026.09.24.16.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:11:51 -0700 (PDT)
From: Davy Felipe <davyfelipe34@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Davy Felipe <davyfelipe34@gmail.com>
Subject: [PATCH v5] hfs: handle extent B-tree write errors
Date: Thu, 24 Sep 2026 20:10:54 -0300
Message-ID: <20260924231054.2175660-1-davyfelipe34@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9c9fe0c7660ff1cf4fe81bb3b2c907555d8add4e.camel@dubeyko.com>
References: <9c9fe0c7660ff1cf4fe81bb3b2c907555d8add4e.camel@dubeyko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hfs_brec_insert() may fail while inserting a new extent record, but
__hfs_ext_write_extent() currently ignores its return value and clears
HFS_FLG_EXT_DIRTY and HFS_FLG_EXT_NEW as if the insertion had
succeeded.

Propagate errors returned by hfs_brec_insert() and only clear the
extent flags after a successful insertion.

When updating an existing extent record, hfs_bnode_write() returns
void. Validate the extent write parameters before calling it so an
invalid update is reported as -EIO instead of being treated as
successful.

Use a reusable B-tree node range helper that takes the find data and
the expected record size. The helper validates the bnode and tree
pointers, entry offset and entry length, and ensures that the write
range fits within the node.

Negative-path testing in QEMU confirmed that an insertion error is
propagated to the caller. Testing the existing-record path also
confirmed that invalid write parameters are rejected before
HFS_FLG_EXT_DIRTY is cleared.

Signed-off-by: Davy Felipe <davyfelipe34@gmail.com>
Thanks for the feedback. I updated the helper to take struct
hfs_find_data and the expected entry size so the bnode/tree,
entry offset and entry length validation stay in one place.

Changes in v5:
- Pass struct hfs_find_data to hfs_bnode_is_valid_range().
- Validate the bnode and tree pointers in the helper.
- Pass the expected entry size and validate fd->entrylength there.
- Simplify the extent write path to a single validation helper call.

---
 fs/hfs/btree.h  | 19 +++++++++++++++++++
 fs/hfs/extent.c | 10 ++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/fs/hfs/btree.h b/fs/hfs/btree.h
index b4c3f2a31471..ab7a7c65a126 100644
--- a/fs/hfs/btree.h
+++ b/fs/hfs/btree.h
@@ -84,6 +84,25 @@ struct hfs_find_data {
 	int entryoffset, entrylength;
 };
 
+static inline bool hfs_bnode_is_valid_range(struct hfs_find_data *fd, int expected_len)
+{
+	struct hfs_bnode *node;
+
+	if (!fd)
+		return false;
+
+	node = fd->bnode;
+	if (!node || !node->tree)
+		return false;
+
+	if (expected_len <= 0 || fd->entryoffset < 0 ||
+	    fd->entrylength != expected_len)
+		return false;
+
+	return (u64)fd->entryoffset + fd->entrylength <=
+	       node->tree->node_size;
+}
+
 
 /* btree.c */
 extern struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id,
diff --git a/fs/hfs/extent.c b/fs/hfs/extent.c
index f066a99a863b..4d65943d1117 100644
--- a/fs/hfs/extent.c
+++ b/fs/hfs/extent.c
@@ -121,12 +121,18 @@ static int __hfs_ext_write_extent(struct inode *inode, struct hfs_find_data *fd)
 		res = hfs_bmap_reserve(fd->tree, fd->tree->depth + 1);
 		if (res)
 			return res;
-		hfs_brec_insert(fd, HFS_I(inode)->cached_extents, sizeof(hfs_extent_rec));
+		res = hfs_brec_insert(fd, HFS_I(inode)->cached_extents,
+				      sizeof(hfs_extent_rec));
+		if (res)
+			return res;
 		HFS_I(inode)->flags &= ~(HFS_FLG_EXT_DIRTY|HFS_FLG_EXT_NEW);
 	} else {
 		if (res)
 			return res;
-		hfs_bnode_write(fd->bnode, HFS_I(inode)->cached_extents, fd->entryoffset, fd->entrylength);
+		if (!hfs_bnode_is_valid_range(fd, sizeof(hfs_extent_rec)))
+			return -EIO;
+		hfs_bnode_write(fd->bnode, HFS_I(inode)->cached_extents,
+				fd->entryoffset, fd->entrylength);
 		HFS_I(inode)->flags &= ~HFS_FLG_EXT_DIRTY;
 	}
 	return 0;
-- 
2.55.0

