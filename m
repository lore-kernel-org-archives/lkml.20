Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686232;
	b=frZczcU8hLg94BylAtEXErflGx2EYJRLdUCU5RT+Yhbt//Z5Fm/4ItAIMlBGqvoh2cgi
	 4jihJeVqkK3hefC0JbeWARfnuiwz/fjvlec4uKbOa5QlETQ5ukjXvmtncZPCbyILvfKEQ
	 9KIF7JcsLFTrByJUsaVGvBTXw7i0MLlo7q6BFTVAWLkQvArjZipfWz4riuM9VKGJ3iB1T
	 D5dGIgpPd6IzM1VbuUCMWlvtVzM7EwkDnSVglo1olPiAQpWQyeii3sDi8kl0jmKUkCWQ7
	 EknVUaBaGOu6jq/HoBHmfe9bi3iXIwz0Iv86md3AGdtLRYl2zML0XGt13KHeAQK21EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EROaWjdO6oYboqJP5qDVlNq8HvD3vjgSVaQkzFo8u90=;
	b=FSIwtp1gWxzOYDaGjfjisJahAn3OQT4UGzVZJ93oEKo1rjsEC2qSuSA/lfgoYGWqRlmA
	 wuBKLldrh3MJgY6QdMjEYBoM3w1CJD1BX8CvwkoimQsPzvjRsv7v1zsXkz9hmbaqTvRco
	 dMK37hkEMBlmVn5TV8iEo9yRc/x09CEQlM6dlVoE1D+5e2U3ILt10NQD8b3SaJrAvR8T3
	 P4kRQsKtFTerxKvGqjv8EueuexX9iVTb8HaQn16wDE/OHTQIb2zyAcs+jfNh5Pg/hPSHG
	 z9UE3pVtdtEdRRCquA0Fj12DVtw5bGTPAY8UyMXKedmPkpVZuA/Ua4GfTpnG2y2kZIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=LzSRVlfL;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C690606A333
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C690606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=LzSRVlfL
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-53381e53b80so42666341cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1793686231; x=1794291031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EROaWjdO6oYboqJP5qDVlNq8HvD3vjgSVaQkzFo8u90=;
        b=LzSRVlfLP02uU5/OGyMmh7EMgSSCvlUlAHpyAIrdp6PgekhyJ4SLqtwBm+Tu7XWkXq
         Wn/9PEqz1enAH5uBbk+LjvkM9YMRSgdOkh7N1G+ktJIYVP3bC6yG65ntwZe9R7SPCN2V
         8phR+NPCSn5LVpqxONSOL19z4PUzXeRcvj4CgJ56gE/f6cpELDOaX3ehKBw3IYRzLyZz
         Xl9CF1Gj1vF49f0kEadKzr93Rv7KMGqbZy1ZrnAeuPk5ieXkdIVcYV9h/03zJnrz1K8D
         RxUorEqH/VjbK7TA23miHWIeN9ZEvZCtgWuU59J3HeE4httG8GAZ9INTfyxOAxZKH96m
         nn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686231; x=1794291031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EROaWjdO6oYboqJP5qDVlNq8HvD3vjgSVaQkzFo8u90=;
        b=yVoxBqe3km33PgMaJpMwjZPsUXnTH7nkRK5ilAVhFpNY62wtgZK3LnaEY4dEKQ1hIH
         cQWs+c5GNN8mqC1tG+rlZ+0w5mIZMSJqpMNBYmo+zl10dPtPpaoDA6nI9WjrJS9g9hzw
         M5H+xIKJlqiIaVMiRjyfDtNDzEARpa9wzLDuIC42QXgJS+LCaeS0sOQxGccyxvqh2FF+
         nU5nsWwKpiC2g6VmL42V23S3McUlOG12Bwz/cxhcs7GlZchZmtxeTexBcvqUW9Ayklj+
         e89AgFdc5A8fVT87DuUQxU3HfSWQ6arOUXu2OVevywOmGOn84dEAHodtifTf4eVgGh58
         yR9g==
X-Forwarded-Encrypted: i=1; AKwUvBw/UKkco7fUc4KOFFjOKfu0X6YZL01l6sEY56SQbgWlS5p82iemUAq95B9bGVx76J1EuRWLcCP226k/PHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NpNN6RBNUfnq2zS8dQ71AeootwrfVH8+Sa+y/0IBaB9hRmh1e
	2jegy+UaZx3zzU1dkKhhdtcDtZTI58xBLiit9w52TeU+CSWcixKcHJO0IdnMCPjyNw==
X-Gm-Gg: AYBFou0J+l3QOYfohFwXuYKfBaFzi7W+Aopc9Z6qyLoiUOhpPyb2j0DX1UcnxcvVUEd
	0EnTptgn4OxqkPXv73f9gvuKBLs8AU3m1EPZ01eBs2j69Uc7pBZq14aYFGXF7zQxt8Xw9IeeUWJ
	w0fsSVDrhK66PnBcJNM6kgB9QzVsVuRCzOGBBqPViChO0EHZGx1kHgPQ4jlA3RQ32jizSn3Eifj
	aqwe2ei3uLAGLmNooYlWDL/Z3OFGQObdMYDnen4PKxE7lvKuwN5Aylx+c4d3LGZEl0zFxXgeqvd
	/n9pg4gtRoDXOhJ6eE1KCqwCfdablLK1/jFSAWae3hWJjLpINID1LKJGPlDblrI035pNOu1rrvZ
	7QbT40c2lphJFrQFmWH+fjAlKIydtDA3ybjZDhaIH1UDe695BjAdsA1RHE4XL6tVukiISpthOCN
	a2BPzGfnXSLugAC4dFro3TNrMDLsOq3mYGrIRHe5S7ySDHaHYt0YfoFnE7uw89Yd7U5ISHc+v7y
	axzCaTmSSaFoOOO25myE47fbR+hUgLkIW4VJHSH+GArZI9m06PNvn0zcY5J/tTGx4dZYFDK0k43
	NoCXF1sJFrRGtAddPy3pKcN38ATecxCpGrORCY0nXg==
X-Received: by 2002:a05:622a:1f90:b0:536:6378:c804 with SMTP id d75a77b69052e-542b83f7efamr173986521cf.73.1793686231189;
        Mon, 02 Nov 2026 22:10:31 -0800 (PST)
Received: from localhost.localdomain ([2600:1011:b1ae:f075:aa26:e161:414d:7ec7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca807d8fasm109173076d6.41.2026.11.02.22.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:10:30 -0800 (PST)
From: Siddharth Mishra <smish149@asu.edu>
To: dsterba@suse.com
Cc: wqu@suse.com,
	boris@bur.io,
	mason@kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Mishra <smish149@asu.edu>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] btrfs: tree-checker: validate qgroup status item
Date: Mon,  2 Nov 2026 23:10:20 -0700
Message-ID: <20261103061021.2213691-2-smish149@asu.edu>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103061021.2213691-1-smish149@asu.edu>
References: <20261103061021.2213691-1-smish149@asu.edu>
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

[BUG]
An image can have a status item with SIMPLE_MODE and a super block
without the SIMPLE_QUOTA bit.  On a kernel with CONFIG_BTRFS_ASSERT=y,
the mount of this image causes a BUG :

  assertion failed: btrfs_fs_incompat(fs_info, SIMPLE_QUOTA),
  in fs/btrfs/qgroup.c:411
  kernel BUG at fs/btrfs/qgroup.c:411!
  Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
  RIP: 0010:btrfs_read_qgroup_config.cold (fs/btrfs/qgroup.c:411)
  Call Trace:
   open_ctree (fs/btrfs/disk-io.c:3789)
   btrfs_get_tree.cold (fs/btrfs/super.c:2133)
   vfs_get_tree (fs/super.c:1943)
   fc_mount (fs/namespace.c:1282)
   path_mount (fs/namespace.c:4337)
   __x64_sys_mount (fs/namespace.c:4542)

Without CONFIG_BTRFS_ASSERT, the mount is successful in simple quota
mode.  The first data write then adds an owner ref.  The write-time
tree-checker sees the owner ref without the SIMPLE_QUOTA bit and gives
a WARN_ON() (tree-checker.c:1782).

[CAUSE]
The super block does not have the SIMPLE_QUOTA bit, but the status item
has SIMPLE_MODE :

  incompat_flags  0x361
                  ( MIXED_BACKREF |
                    BIG_METADATA |
                    EXTENDED_IREF |
                    SKINNY_METADATA |
                    NO_HOLES )

  item 0 key (0 QGROUP_STATUS 0) itemoff 16243 itemsize 40
          version 1 generation 12 flags ON|SIMPLE_MODE scan 0
                                           ^^^^^^^^^^^

The tree-checker does not examine the status item.
btrfs_read_qgroup_config() reads the flags of the status item.  For
SIMPLE_MODE, it calls qgroup_read_enable_gen().  This function ASSERT()s
that the SIMPLE_QUOTA bit is set and that the item contains enable_gen.
Since commit f2363e6fcc79, the kernel does not write SIMPLE_MODE without
the SIMPLE_QUOTA bit.  Thus only a damaged or crafted image has this
state.

[FIX]
Add a tree-checker rule for the status item :
- The item must contain the four members of all versions : version,
  generation, flags and rescan.
- With SIMPLE_MODE, the super block must have the SIMPLE_QUOTA bit, and
  the item must also contain enable_gen.
If a rule fails, the tree-checker rejects the leaf with -EUCLEAN.  Then
btrfs_read_roots() cannot read the quota root.  It ignores the error, as
before, and btrfs mounts the filesystem without quotas.

Cc: stable@vger.kernel.org # 6.7+
Signed-off-by: Siddharth Mishra <smish149@asu.edu>
---
 fs/btrfs/tree-checker.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/fs/btrfs/tree-checker.c b/fs/btrfs/tree-checker.c
index 61ea8f42c..bb86c30a2 100644
--- a/fs/btrfs/tree-checker.c
+++ b/fs/btrfs/tree-checker.c
@@ -2083,6 +2083,36 @@ static int check_raid_stripe_extent(const struct extent_buffer *leaf,
 	return 0;
 }
 
+static int check_qgroup_status_item(const struct extent_buffer *leaf, int slot)
+{
+	const u32 item_size = btrfs_item_size(leaf, slot);
+	const u32 min_size = offsetof(struct btrfs_qgroup_status_item, enable_gen);
+	struct btrfs_qgroup_status_item *ptr;
+
+	if (unlikely(item_size < min_size)) {
+		generic_err(leaf, slot,
+		"invalid qgroup status item size, have %u expect at least %u",
+			    item_size, min_size);
+		return -EUCLEAN;
+	}
+	ptr = btrfs_item_ptr(leaf, slot, struct btrfs_qgroup_status_item);
+	if (!(btrfs_qgroup_status_flags(leaf, ptr) & BTRFS_QGROUP_STATUS_FLAG_SIMPLE_MODE))
+		return 0;
+
+	if (unlikely(!btrfs_fs_incompat(leaf->fs_info, SIMPLE_QUOTA))) {
+		generic_err(leaf, slot,
+	"qgroup status item has SIMPLE_MODE but SIMPLE_QUOTA incompat bit unset");
+		return -EUCLEAN;
+	}
+	if (unlikely(item_size < sizeof(*ptr))) {
+		generic_err(leaf, slot,
+	"invalid qgroup status item size for simple quota, have %u expect at least %zu",
+			    item_size, sizeof(*ptr));
+		return -EUCLEAN;
+	}
+	return 0;
+}
+
 static int check_remap_key(const struct extent_buffer *leaf,
 			   const struct btrfs_key *key, int slot)
 {
@@ -2475,6 +2505,9 @@ static enum btrfs_tree_block_status check_leaf_item(struct extent_buffer *leaf,
 	case BTRFS_FREE_SPACE_BITMAP_KEY:
 		ret = check_free_space_bitmap(leaf, key, slot, prev_key);
 		break;
+	case BTRFS_QGROUP_STATUS_KEY:
+		ret = check_qgroup_status_item(leaf, slot);
+		break;
 	case BTRFS_IDENTITY_REMAP_KEY:
 	case BTRFS_REMAP_KEY:
 	case BTRFS_REMAP_BACKREF_KEY:
-- 
2.54.0

