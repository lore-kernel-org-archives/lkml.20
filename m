Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787825;
	b=xtzSXg9qFm99LDTxXgI/wYhZbfeQetT6qqu5fHM+qh2eib3Ji87L0Cg78rw1kE6NYrSI
	 isMwAnkUF2STNrnl/vtPq0ZniF+8j0gJiTiX9jVuNjFtAbbtAMt7Iwnqp7LQv9Tmi16uW
	 WLok6H9qJfABTCEuWaokUmgop1BtCx8Z3lM355RDu8rupxdwxWEQQu99/gRQ75eIrfDIn
	 HxpzKLKnVzksD+J5EdIsg4qU/EqaziG6rh3vdXsq7dSQqgv+OZYlcrL0EEZde6RH5vn3T
	 CEPt8bTduQym+my/ecXLSmPvNXM/RXI5PAp7q2Dxzm25Ew+y7g8yKgaCZQmqJEK9Rwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uLK6MImajGiIdooVPMrO29/klV59rlibNvUSXvCXNpU=;
	b=dCpu/+jhaWWoje5nA9CkBJ5Hj9uIrWUz2imtfJBkJiMJ1+GeS/wvQDr9E+ZSnkV9bJBX
	 ndwMHdBL/rZo1FYN50Wr5jcST/PVITwvy5mzIR0nKVLl8gOOBdwaVRKwOTAnF5xeCd/NG
	 8/KNM2KvsIPG4ngZXFe0OZTrd2yGJnxrXPShB0EyoVQuau5bqCu0PGLOyat7sRoiUoW9H
	 XdTMubqy7lVpMrHDj+ktzSfayb/zXQ9zyaw2HvRu7urXo9q3VuhGPkUxBe2AN9BMOEPs3
	 6GzXPqS64FCaz9RILRDZ5ovQ1quCmjsqRxstkhVoiFCD8Hrl2ygPbrOanvH2/CqMFCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=NrThgcDm;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2C3606A33E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A2C3606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=NrThgcDm
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-353804b591eso971406eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1793787812; x=1794392612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLK6MImajGiIdooVPMrO29/klV59rlibNvUSXvCXNpU=;
        b=NrThgcDmeQZgYynvlOumgkO72cQKo79T65Bwe/G2O+PAeyajpbMgFCcUoAphrH+21S
         MrqXliJPQU9ti92Z4XaP9aBQ1bU9wOZqyohd0vL7apIZRj3GA+Xs+tRKahKU03r/cd/N
         nEY+lzTRU4dNHp1vN6RL/iTqrfWpRVaxgFc5GMxdAgWnwS9wjujndGpOuCy+P/jz58cn
         ZT9svNzkxF4pS5okfBQ3+eU6qPsJSk3aW87UhrWpaCfuKAdoXY4k5dlgdpDSWi29MXHm
         nJrBsrEgKSog7s0trtWMeDO9e3Izv4snYoxIjTvvkwdtLsWgVSa7G12qGpAdfJn67CrC
         c07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787812; x=1794392612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uLK6MImajGiIdooVPMrO29/klV59rlibNvUSXvCXNpU=;
        b=ej6YrZEiBUVO1DAMPVXTJQxg9s614mQWCZew92i84fCiKe11FLrVmLneV/s7U+a65r
         Sfdu1DzBv9gmx7yAOcnuzuLeih4T4CJAZ81VaHQMX0+j2E2qXWJuno/Vctdaw8DYN6dA
         AGlzaPjCtZ4/39iax9AA1EEMSx1DBNoN65o4xSeRShL6TrMsq0zWXOtpaz53bhctIVrl
         mVGZP+0frCjWidZ7idG1xDTLzdCJOhYVwlzZbsY/M6/vBIxx/IbW+16f/vARsH26vf4o
         H/wsLugGSfU7R1edyCxAxaJcwy2Bt4IBB2859wmmbHheop539zlEdwIXaxxIYufoFSba
         khWw==
X-Forwarded-Encrypted: i=1; AKwUvBwHRgy2AIe2GKCzP3wlU952TUdwEJ1xTnSqCOvfBcAIsq9MSITSJYqGPKsjUPYUVgAvHC8dh2DSdMdgk7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8x872Qq+C5kvnam2ncH7SPFYajlZvTM9dj+1ufw/aMvTxO4gTj
	yfRu04RKrp6vkV81Ufy5dihzYjzVzA+pKIQ1HqAuUIgkvNQxcyzF4BVI7xOla+2lyw==
X-Gm-Gg: AYBFou0bVajcOA62Pc2eiQCVI9n++MzXbgYx6LBnWeM4rBggfs1i2ZYpTQJ/W6EMTXp
	0uUqeR2RnIynMcUdxZvWD16AeOzhzmXmCeZP2qfk8t3gOeiklOIdZY12LHzNw25ZbcH+sLl6OYT
	CsvEO0nfVoYWa5+JO+liAkzW2IyuVAsvkvtCqrSjdkOU1k/FBa7qJ7SFKxR6cd7IAbYxyEqA+uY
	UK/gZaBSnSwVnZkZB8iGMudACLgr4ckyon3G/xzKuPCmWh8y1sL4GbJJf7v9BCoOFAv+T0f1b7a
	h2vJpv4GlPTgqfNG++9tZl1TnTZHQNhxOxv4AZeVrRnENiaGcbQtoJaHlTfLfao1GWGSi6Ah+L4
	lNqplwANVglUvVsBn9q1lxs/XlbYTM3MGk1mo60wV9aEzqFZ1mMPerm+CrZXteg9HKjQGbcWxeM
	4cGVCEuoJtR7qMs2sTSJR1L6Moqf9qzZaHbv5uyeOXCXMy5IywehlnNKvY7JbuRy/P2eMMxzI3L
	Hm1I5ZjoJ0J70MFy9Uq7SwaH8pXEGGHNdN6Vx7wZxx2SRPswUHGukPaIgw7Z/uWVIKOLWk1xnlu
	2p69fxm0Kxt//r+/ImkLCGh3XuTL8WF9SrvjNr57ng==
X-Received: by 2002:a05:7301:f8b:b0:36a:2383:eb51 with SMTP id 5a478bee46e88-36a423c4070mr21425188eec.26.1793787812061;
        Wed, 04 Nov 2026 02:23:32 -0800 (PST)
Received: from localhost.localdomain ([2600:8800:1e00:25f0:ff01:97fc:f9e5:d7e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm5749086eec.9.2026.11.04.02.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:23:31 -0800 (PST)
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
Subject: [PATCH 2/5] btrfs: tree-checker: reject inline refs not matching the extent type
Date: Wed,  4 Nov 2026 03:23:20 -0700
Message-ID: <20261104102323.4090290-3-smish149@asu.edu>
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
An extent item is either for a tree block or for data, and each kind
only gets its own inline ref types:

  TREE_BLOCK: TREE_BLOCK_REF, SHARED_BLOCK_REF
  DATA:       EXTENT_OWNER_REF, EXTENT_DATA_REF, SHARED_DATA_REF

Readers rely on this.  btrfs_get_extent_owner_root() only looks for an
owner ref on data extents, and btrfs_get_extent_inline_ref_type() warns
when a caller that expects a tree block ref or a data ref gets the
other kind.

[CAUSE]
check_extent_item() verifies each inline ref on its own, but never
checks that its type matches the TREE_BLOCK or DATA flag of the extent
item.  So a data ref or an owner ref on a tree block, or a tree block
ref on a data extent, passes the tree-checker.  For example this tree
block has an owner ref instead of its tree block ref:

	item 9 key (30478336 METADATA_ITEM 0) itemoff 3636 itemsize 33
		refs 1 gen 13 flags TREE_BLOCK
		tree block skinny level 0
		(172 0x5) extent owner root 5
		^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The leaf is accepted.  When the tree block is freed later,
lookup_inline_extent_backref() skips the owner ref, finds no tree block
ref, and the transaction aborts:

  WARNING: fs/btrfs/extent-tree.c:3418 at __btrfs_free_extent
  BTRFS error (device vda state A): Transaction 14 aborted (-EUCLEAN)
  BTRFS info (device vda state EA): forced readonly

[ENHANCEMENT]
Reject an inline ref whose type does not match the extent flags with
-EUCLEAN, so the leaf is refused when it is read:

  BTRFS critical (device vda): corrupt leaf: block=30441472 slot=9
  extent bytenr=30478336 len=4096 inline ref type 172 does not match
  extent flags 0x2

Signed-off-by: Siddharth Mishra <smish149@asu.edu>
---
 fs/btrfs/tree-checker.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/btrfs/tree-checker.c b/fs/btrfs/tree-checker.c
index f021ac14b..db446c8af 100644
--- a/fs/btrfs/tree-checker.c
+++ b/fs/btrfs/tree-checker.c
@@ -1790,6 +1790,14 @@ static int check_extent_item(struct extent_buffer *leaf,
 				   inline_type);
 			return -EUCLEAN;
 		}
+		if (unlikely(is_tree_block !=
+			     (inline_type == BTRFS_TREE_BLOCK_REF_KEY ||
+			      inline_type == BTRFS_SHARED_BLOCK_REF_KEY))) {
+			extent_err(leaf, slot,
+			"inline ref type %u does not match extent flags 0x%llx",
+				   inline_type, flags);
+			return -EUCLEAN;
+		}
 		if (unlikely(inline_type < last_type)) {
 			extent_err(leaf, slot,
 				   "inline ref out-of-order: has type %u, prev type %u",
-- 
2.54.0

