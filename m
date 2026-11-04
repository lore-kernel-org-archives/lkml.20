Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787817;
	b=LqRmrR9h2jnM5s2Jyw+2rHIDMHKsWCIohIzeSwl0ZMdRehY6HkWgBOY9oiyBjTlL5Dx3
	 QosWZkeadVuYkPQphcyl1ilWb+sBvj2C9r7AdBXR7Y38lg4PEXGJqgG2LI3vC4YE01QOB
	 Wqvdutgs4bkxXgeAV2uyZyd4Dc6rKbLpQRKTFtU42p9fa4ARtSMItSxhW8B29Sagcp29S
	 g5TvaaVJFeQ4bDKV9x00N5ifVhhE8i83vxvZuYuD2IBsewKp/0VfuRpWMb/FaxWKjIR6v
	 rdLkghRmjLCGD3RFcq3+yliKcW+9iaidMRYjphc5cky+kxlkdzPHOkOl+23C41osdTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KGOUq/ZqyVEMWkCsVi5v1gsLOVeCrKZIZ7AvOAwel7E=;
	b=yBQL3T12eCxmrUck2WMBIDhFCch4O7HBM1g2y6SAgQSsYyIAGY5igVx9nMspIsk0unl0
	 1Lvtf+iHwRh/ApNAoeMXzxEJZka4PqfHRRYo32EeEj+p9VrVZ6AFYYCShowG/5q/NPNLo
	 5vmmyoSg3OWiQwrDOfAxRNt4q8UYV6V5hlw6BrrI1T1wlsZuu35m4TDYEAQwC40/pXcZW
	 INS3Yy8DHMOniY+L5mCf9NVwqbtOrSHcCF/y/iOK+9iQ+qXs9zyODFe69Xtd46DcJ5D3O
	 qpaYAUwXAnNOHlPxTsRkmECwHCrWbabsZZwPnJi4xDyOPzqfcmQ/0OfY5s8puL5QXSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=m5AXFCk3;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BCE606A337
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1BCE606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=m5AXFCk3
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a1947498bso1241110eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1793787816; x=1794392616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KGOUq/ZqyVEMWkCsVi5v1gsLOVeCrKZIZ7AvOAwel7E=;
        b=m5AXFCk3PG/vbkuVuK7RU9XAygzIE9Aw/PfApniXxGhtnU7KcC2yjHpB4s6zWt3/vN
         02JdqtUvgyc59eeGA47UYMtHVaNn5WDcbPsB4VH6O39mFdE+NuNbeXYtkX5cHvJBniOQ
         vAzcyK7UtOnYU1Pcy7NazkbOc2n1wFiK7XKQUQwtN7IRRTAuePM12VllVNe7tG/H/rK3
         rItt2feSyFdfDAwaDN5Kqd6F/j3XejIAxSS0cs/yA0iFkN6OJkR96tYMVufiljPu7rFJ
         d/41txPOGV51+CfTjwnLO7mizRdtUAYX4WNr4NoOrVmtmVK/VPithjnSL5Anus7aMxZa
         r4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787816; x=1794392616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KGOUq/ZqyVEMWkCsVi5v1gsLOVeCrKZIZ7AvOAwel7E=;
        b=ZrEe5CAjAvKDOzyJsaU6Yf4QHOrSQZXy3461U8ncJaviIUN7clQ1DyPkDpBMQ9leCY
         dI1SaxhQL5H6N90N8pbArtU0CPTFrey9xVw6VQtGCp8luQAP2O+gVqYL5pF6jNcR19lf
         8iuL4UaZs0gryeniIaLeb+5jaNM7bgwtdYyC01mLCrG7adwGQpK1pdHpxJMNKxbm8sYW
         iacqIpgzrH8+CVeO+LxQBU9mfV9/qZYQIOsRSbAN+RLia9eudb9GbvsU3f6xdiM+z/ti
         2Ju6uSUi5V7OB6gC4fVBwzjxssh6uUDBGsf43ZVIBV9wxql88ijDSzbZXAVbukKRlzzk
         JTlQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8bZNOAlEvaU64z429ABj0UzznOmN0g720Cmwd0ksEM8XckohRXnfP0uZiczeG+HZ8emo9pBDFJBF3Acw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UBKOv08GPuuEyiQnnQTkEuacV7L2OGhQVwJs87zRkVcxtd1Al
	QvsY6x7lO3TsxREfNKkjpPVE1OIMOF9kcAeOg3Sq7ke8jjIV1VkxA9xygNT1lMl34g==
X-Gm-Gg: AYBFou2KRtA/yxtKx48URtxGwqrFwTNO659e5Q/IUQAGR+e5q7liOpjR6i9IkDKGPH6
	n+ml9NCfBMMfde5qkCdWfqMfz5pVfY+CsRElxUalpHEpfTFpGLUo896BvdY9JIf9j9SKLDOThqB
	PPRxtv75Vy4CJlU118Ov/IAwp207w1YbCoQCDYFW2RgxCBdPhNPn0GQYt0BGrPc8U/N3CdxMqW9
	FlD8Gr9MMm67++BzJbydXTphAKtAplv4+0EfIRLdlMVpkAwWp/hX9H8jlv9tS/+by5VUYa+wAXd
	oJJEt7tbmLY/j9zRT/e95dy2tk6FO/lQf6ZR3t5c9SdBPqx0t2qWdILjTjZeO+O9jB+y0sd+NOL
	E9135cv2T1MohQOqGa2mCruvN6xEt3o9uJUWQ+eVQRi3HI/bOPJw87umllh83iH7R5UO+qgIO8E
	V1ySpZENDM+YtGQj2ZbX8zru9ponXLnm2ttHnG+twFDiv857IPUUvla5XAt7K9spH3rDZwzhGlv
	B+JH2TKJygmX08/B2BQKuF+nqjPTzcJjQdUByjbx+RNAPibtvVhn0bokHPS8IbuIke7xOyqv4AC
	ianRbucKbP+matt/BYT26KfvmIdtn0ZIbUImfIdKIw==
X-Received: by 2002:a05:7300:c00f:10b0:36a:5207:e58b with SMTP id 5a478bee46e88-36a5207e70fmr22554018eec.27.1793787815847;
        Wed, 04 Nov 2026 02:23:35 -0800 (PST)
Received: from localhost.localdomain ([2600:8800:1e00:25f0:ff01:97fc:f9e5:d7e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm5749086eec.9.2026.11.04.02.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:23:35 -0800 (PST)
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
Subject: [PATCH 5/5] btrfs-progs: tune: do not remove owner refs from tree blocks
Date: Wed,  4 Nov 2026 03:23:23 -0700
Message-ID: <20261104102323.4090290-6-smish149@asu.edu>
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

[BUG]
On a filesystem without skinny-metadata, "btrfstune --remove-simple-quota"
can corrupt the extent items of tree blocks:

  before:
	item 31 key (30756864 EXTENT_ITEM 4096) itemoff 2363 itemsize 51
		refs 1 gen 6 flags TREE_BLOCK
		tree block key (940 INODE_ITEM 0) level 0
		(176 0x5) tree block backref root FS_TREE
  after:
	item 31 key (30756864 EXTENT_ITEM 4096) itemoff 2372 itemsize 42
		refs 1 gen 6 flags TREE_BLOCK
		tree block key (0 UNKNOWN.0 1456) level 0
		^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

and "btrfs check" then reports "backpointer mismatch" for each of them.

[CAUSE]
remove_owner_refs() takes the first inline ref right after the
btrfs_extent_item of every EXTENT_ITEM. For a tree block without
skinny-metadata that is the btrfs_tree_block_info. If the lowest byte of
its first key objectid is BTRFS_EXTENT_OWNER_REF_KEY (172, here inode
940 = 0x3ac), the tree block info is taken as an owner ref and 9 bytes of
it are removed.

The check for an extent item without inline refs is also off by one: it
reads the type byte when ptr == item_end.

[FIX]
Owner refs are only added to data extents, so skip extent items with the
TREE_BLOCK flag, and skip the item when ptr >= item_end.

Fixes: 2336a7b921ff ("btrfs-progs: btrfstune: add ability to remove squotas")
Signed-off-by: Siddharth Mishra <smish149@asu.edu>
---
 tune/quota.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tune/quota.c b/tune/quota.c
index a5f7fb40..187ba4f6 100644
--- a/tune/quota.c
+++ b/tune/quota.c
@@ -132,10 +132,12 @@ search_slot:
 		if (found_key.type != BTRFS_EXTENT_ITEM_KEY)
 			goto next;
 		ei = btrfs_item_ptr(leaf, slot, struct btrfs_extent_item);
+		if (btrfs_extent_flags(leaf, ei) & BTRFS_EXTENT_FLAG_TREE_BLOCK)
+			goto next;
 		ptr = (unsigned long)(ei + 1);
 		item_end = (unsigned long)ei + btrfs_item_size(leaf, slot);
 		/* No inline extent references; accessing type is invalid. */
-		if (ptr > item_end)
+		if (ptr >= item_end)
 			goto next;
 		iref = (struct btrfs_extent_inline_ref *)ptr;
 		type = btrfs_extent_inline_ref_type(leaf, iref);
-- 
2.54.0

