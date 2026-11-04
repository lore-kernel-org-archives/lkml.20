Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787815;
	b=iU+wz3Kn+3Kwn+jjmyewFqI9C0KOhxj9szO14yxrIQlFz/RILseDNAE2X1YbiicfP0Ns
	 vFCY+UCS9Z3C2kJYFk1f4NpkStd9ViaIRwo8U0EGnLYNqX5/eI8A2/vM/6H4RxovCE6aY
	 KSjY3C5hel0mb0FijBbs0wlXCxbSTKy97nW8R6o8o+WT3j2SCD3VL0yccwU+HNpESudYx
	 LVAv9JNe/QPhL83y3OujVz8kLsMdVSSPp/MNgE4ZuWa7u4VUO0YLD7Z9kmTzOnYBQhGld
	 8BxQw8r01nAcrCIp9+2XYia7BJE9+g6HKIxCBohnrJh+LhsAfm12rvkOeJYChJi91JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Q8KxU0uuRXEMj10OvowCsJ3G/7CIJN/JiInD+fnU/PE=;
	b=bu74pqT7BzwctIwZ8/9CQs1gtcunBAtOD8WkBbT0o39UqAOlXs440vLFWLgFqpPHBKl6
	 czzQVel+ltXp2N4iP67VqzJIXIdzuRlAEd1KJIOeXOtb7yWZrbnT+6+wQVla+Cd2k4xtm
	 PlPz4Ev4MwXMYVx78Gpo2mnD9B9pSo+gkRXfapUwK010SNgcgDoKGrCEcGaeZIRMO1wvu
	 aPGhviiCUZFwBxRrfI/MC/bluiTe+G10ppNHMrrS0+FeaSh0Hvl+2UKaoTAseudMnbnEH
	 FtdHFqqLeWyfW+TZKytFuaDIUQJVuXPRSVDR2b0vdcKJ3Wzda26RcbDaKH657hry3cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b="aKBOaK/s";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF01606A332
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FF01606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=aKBOaK/s
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso785605eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1793787814; x=1794392614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q8KxU0uuRXEMj10OvowCsJ3G/7CIJN/JiInD+fnU/PE=;
        b=aKBOaK/skv4djSks3YDf30eyBp7oaEcOqCB2jyH8DeG+mSJNNtsddO6QgCh3qU8Lcc
         pc/3FnZRUvPwjflI6EXYjIJtVhMwGJ9yrZBALLrIzrKZCfWmTTX6A9Kx5D0LiSag/1Sr
         iymVFIxL4WNKN5NaiPyWQ7bllBdjDNpiPJ5C0E8LRvq3xHr6GuqeGb0VzIHzmOz/d5M2
         2vd+USiwGdato4GlAyMp/VOK7y4R+1rEVpWR/vK6LzW2D+oHSfnI6hU+2puxVN2oWK5A
         qK4UgVl0VFa5DDXyw9w898DcPIfcIs1R+ADxXNGZcIaiK0CPZYW4XL7y78Kjem1PwKYv
         EsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787814; x=1794392614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q8KxU0uuRXEMj10OvowCsJ3G/7CIJN/JiInD+fnU/PE=;
        b=IIzUik0/A/4rhxNWxq5vdb6CnBwd2ulf99EFYB7huettTdMolMcTSLK3wm6kQWCdlj
         kj+5EBsW0sHIHdMjKfM1bmzije4tF1XfpKIfg+TvOQiTeE0ycq40qIIWyY71D7xkl7gL
         xedTEruc7TdCUum3ecxaBXczW56J0Ud1kjrkGWzRfiENjb8ZUQWadRWPHdXBDd7i0ThV
         7s83TPcTxws6HJJZXTAGKhX+D+ExJRySFwoHdeO6pGxVNUyZ/ZAsLBuUzM3/mV3rRePY
         LZIjP+8fjK6GuJI/EdrmMgGuHN6HBDQUy4YHW6MLUgeQq1e5b/bkNQjrbA848Bjau9Wx
         j5QQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlaZ1mCOB1WxvDLMlp9L7oSZuytJcANxHjfOah9yXEBmiLh/JFNa/etZbT3yOH+oWlaG3OXWX9ey5vFsk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8S0EEoZlwx7g5rKSR2McyDbVT4G6PVIO1uh41Vn0zEXm8WBVKC
	UBC0wIDuKsjxzQ0Y2Tl2MsDdDgY0rRKjqAKJSdGa706nazUIBlVETbNFtAABaICoLg==
X-Gm-Gg: AYBFou2rJzyHYq2UnT2oCJMX/JvKyh3t6FLmIFvjMBEwxeomcg2qGs08f0ccq0xAkk0
	foczzFTZrSLABl4fgiMCXrvToVSNfoxLz2bNsSEnB2IMvrkER4eq6ybEd06X7wpV44cdyJNtmtj
	pzl4u/Sbys+sEdPyRtO5MvMR3dWysuGhu9bSBeG0YjZfdOuV6K3sJU/R75bUlfMIfoL3rum6/se
	LNGy9K3qe7FskGLduGo6gGcDI8qiP4IMnV5m8qgBgrhGdiQ9JIhM/S6B2mBAiuC61NbUaxPEpJL
	uB5R/s2M91CCISAx1SiLCjvVE9/rMRVvVNhn7gd4Fj59WLQ3F0+w6o5m05bZRdWPfIkiWhYJych
	P38crlg3414Tt7+u1Khn0q2s/9caU2Or1vawgS2UtYFCHYqod7B3of/vjeM3jZJUwVnqdbBzTt4
	AH9aXqyf/eQ3xajJNbLFp81yk2DNXQ4muSXwlgkwm02ChkyQlbxy9nqin7vDm+qIyEd+/K2WY8z
	8fnYzWEJm/HOJ5lZ7HiXgmJbCd4DnkixO/ot8acLKK1nQUZl0QRtbv6Kb9ds8zwqxjcovlAtpqK
	WN2l4QzJH5brg0puDju10fRUP+9FDhIEkLYTaqLG7g==
X-Received: by 2002:a05:693c:6090:b0:36a:4a68:84e5 with SMTP id 5a478bee46e88-36a4a68851cmr24932443eec.8.1793787813580;
        Wed, 04 Nov 2026 02:23:33 -0800 (PST)
Received: from localhost.localdomain ([2600:8800:1e00:25f0:ff01:97fc:f9e5:d7e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm5749086eec.9.2026.11.04.02.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:23:32 -0800 (PST)
From: Siddharth Mishra <smish149@asu.edu>
To: dsterba@suse.com
Cc: wqu@suse.com,
	boris@bur.io,
	josef@toxicpanda.com,
	fdmanana@suse.com,
	mason@kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Mishra <smish149@asu.edu>
Subject: [PATCH 3/5] btrfs: tree-checker: reject keyed refs not matching the extent type
Date: Wed,  4 Nov 2026 03:23:21 -0700
Message-ID: <20261104102323.4090290-4-smish149@asu.edu>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104102323.4090290-1-smish149@asu.edu>
References: <20261104102323.4090290-1-smish149@asu.edu>
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

[BACKGROUND]
When the refs of an extent do not fit into its extent item, the others
are stored as keyed ref items with the same objectid, right after the
extent item:

  TREE_BLOCK:  TREE_BLOCK_REF and SHARED_BLOCK_REF items
  DATA:        EXTENT_DATA_REF and SHARED_DATA_REF items

[CAUSE]
check_simple_keyed_refs() and check_extent_data_ref() only verify the
keyed ref itself.  Nothing checks that its type matches the extent it
belongs to, so a tree block ref for a data extent, or a data ref for a
tree block, passes the tree-checker.  For example this data extent is
followed by a keyed tree block ref:

	item 0 key (13631488 EXTENT_ITEM 32768) itemoff 3797 itemsize 198
		refs 41 gen 9 flags DATA
		(178 0xdea30debbf5f519) extent data backref root 256
		objectid 258 offset 0 count 1
		...
	item 1 key (13631488 TREE_BLOCK_REF 5) itemoff 3797 itemsize 0
	           ^^^^^^^^^^^^^^^^^^^^^^^^^^^
		tree block backref

The leaf is accepted.  When the extent is freed later, the refs do not
add up and the transaction aborts:

  WARNING: fs/btrfs/extent-tree.c:3418 at __btrfs_free_extent
  BTRFS error (device vda state A): Transaction 35 aborted (-EUCLEAN)
  BTRFS info (device vda state EA): forced readonly

[ENHANCEMENT]
Check each keyed ref against the item right before it.  Keyed refs sort
right after their extent item, so that item is either the extent item
or another keyed ref of the same extent, and both must be of the same
kind.  Reject a mismatch with -EUCLEAN, so the leaf is refused when it
is read:

  BTRFS critical (device vda): corrupt leaf: block=31678464 slot=1
  extent bytenr=13631488 len=4096 keyed ref type 176 does not match the
  extent type

This is the keyed counterpart of the inline ref check.

If the item before a keyed ref belongs to another extent, its extent
item is in another leaf and the keyed ref cannot be checked by the
tree-checker.

Signed-off-by: Siddharth Mishra <smish149@asu.edu>
---
 fs/btrfs/tree-checker.c | 48 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/fs/btrfs/tree-checker.c b/fs/btrfs/tree-checker.c
index db446c8af..d966243c9 100644
--- a/fs/btrfs/tree-checker.c
+++ b/fs/btrfs/tree-checker.c
@@ -1854,6 +1854,50 @@ static int check_extent_item(struct extent_buffer *leaf,
 	return 0;
 }
 
+static int check_keyed_ref_extent_type(const struct extent_buffer *leaf,
+				       const struct btrfs_key *key, int slot)
+{
+	const bool is_tree_block_ref = (key->type == BTRFS_TREE_BLOCK_REF_KEY ||
+					key->type == BTRFS_SHARED_BLOCK_REF_KEY);
+	struct btrfs_key prev_key;
+	bool prev_is_tree_block;
+
+	if (slot == 0)
+		return 0;
+	btrfs_item_key_to_cpu(leaf, &prev_key, slot - 1);
+	if (prev_key.objectid != key->objectid)
+		return 0;
+
+	switch (prev_key.type) {
+	case BTRFS_EXTENT_ITEM_KEY:
+	case BTRFS_METADATA_ITEM_KEY: {
+		struct btrfs_extent_item *ei;
+
+		ei = btrfs_item_ptr(leaf, slot - 1, struct btrfs_extent_item);
+		prev_is_tree_block = (btrfs_extent_flags(leaf, ei) &
+				      BTRFS_EXTENT_FLAG_TREE_BLOCK);
+		break;
+	}
+	case BTRFS_TREE_BLOCK_REF_KEY:
+	case BTRFS_SHARED_BLOCK_REF_KEY:
+		prev_is_tree_block = true;
+		break;
+	case BTRFS_EXTENT_DATA_REF_KEY:
+	case BTRFS_SHARED_DATA_REF_KEY:
+		prev_is_tree_block = false;
+		break;
+	default:
+		return 0;
+	}
+	if (unlikely(prev_is_tree_block != is_tree_block_ref)) {
+		extent_err(leaf, slot,
+			   "keyed ref type %u does not match the extent type",
+			   key->type);
+		return -EUCLEAN;
+	}
+	return 0;
+}
+
 static int check_simple_keyed_refs(struct extent_buffer *leaf,
 				   struct btrfs_key *key, int slot)
 {
@@ -1892,7 +1936,7 @@ static int check_simple_keyed_refs(struct extent_buffer *leaf,
 			   key->offset, leaf->fs_info->sectorsize);
 		return -EUCLEAN;
 	}
-	return 0;
+	return check_keyed_ref_extent_type(leaf, key, slot);
 }
 
 static int check_extent_data_ref(struct extent_buffer *leaf,
@@ -1953,7 +1997,7 @@ static int check_extent_data_ref(struct extent_buffer *leaf,
 			return -EUCLEAN;
 		}
 	}
-	return 0;
+	return check_keyed_ref_extent_type(leaf, key, slot);
 }
 
 #define inode_ref_err(eb, slot, fmt, args...)			\
-- 
2.54.0

