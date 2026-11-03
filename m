Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793677813;
	b=XqEy+I2KFPbGWrEs4J1FwmjYRYYEBuoxgOy6K1+lhP7ce3yKtBa+1UMkREwZ+m5tujim
	 q3Xs7Py8MPuObe1+a2TmdiJg9bDUpYIg4ddWgsMPVqtMLQ+4Zt3K0pvH76JRfsMwXJ5Kf
	 z4dWVP8cFQ22LayNbl5OY9LY7uHuB37cynySuYVxAErY7MtkNfdSr+6Jjx865DBNNXo4A
	 bHvTeKBmCmYhyn0fZHVfQ9mXwTTSr9nzD1o29NQcsq/Jtgp4WyWOtDXCN/Sb7fnE6pl4S
	 4IZFnHTWke/hYmjtaV542qQZxo16dAhyUujMlLH98OJDOmziGqJtnUwes1iLzcOsJ/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793677813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g4Vcjicoj9llbQa1EnB8KvUOzkwI4u/CoPXzHBvmXFM=;
	b=YCxu0v2sFtgwFrtamEIXm0LtTh4wV86amaWcfEqxfTFADinhCXLEGGJAkIu6vEYerqWf
	 LgDW1vfqGHPtIe9IVitMEJGLv/86nQ4lwJOHPXxmW3/3pz2pp6lmmx4MddxmEWKz8R0vX
	 tIXhzEo6mCLfuLFTRxwAUa9hmNtM9PrzUo7KHnNVNKzzd9sw3Q6yDJ4R06pBH/lKy+3dT
	 BmXgSVfI3d31sRchBqAXaVAQZuMolfdpBYYQLQ2TndHFeeBbegio/MHUGJDhuvU95RHzT
	 lBcJ4PWwQwoRnNwGdLY0+9c0ttHyvmXjwkD9YJ4OPvuF6xrqs0di3yYLp0z8xJUdL/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b="E6dh/zim";
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F376606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F376606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=E6dh/zim
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-917aca1aee5so49085006d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1793677811; x=1794282611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g4Vcjicoj9llbQa1EnB8KvUOzkwI4u/CoPXzHBvmXFM=;
        b=E6dh/zimTsDId4M73mi/nlO6QNw3MEx+3Sc2p7asSf0BN1ilyr4WCVgZ4+7jZzFoBn
         np34MLcEGW1Fd7uWIKUD9jdzaGyWY1m4VYix3NJ+jzZu9s6CIma30mha583ul9tMn/ap
         5Hu8IFe8eOBpNeljGSFJuRadmlGg3HarPMdsRQDGHXpYby+XtwhdOtfWLx5HEchjIWGO
         rVjPOGccIn1Ug0UeMsAAtApcqurGxyovHbelJT/FZlQc3DyKqy/5jgB/A4DRt54naOh8
         Wae0AjN6DbSkkL5NLazZAxd1V0oZjgh9jfUd6u2ze2NBlPbk5tFMIABoP6K2OshNOG6N
         B2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793677811; x=1794282611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g4Vcjicoj9llbQa1EnB8KvUOzkwI4u/CoPXzHBvmXFM=;
        b=0AbksAF8AfnOn/8AXR2SG/eVaDbRcX2ilHhkD0cKretHLqdVG7VDsUN/Wh3H13sioT
         Y8bavbygdfz5i15SOZBAvOK/xXca1sxEKv92CIpDdsveE5FzHLjd554REDPbSRMxzCLC
         4wH6wZG7JbJaplPuuTkodpfTsadmszAFjtLbqsqEfNowfDxmzHyJP0Bmk6AnFbfm+9LY
         mRLDzPRfjKDtqNAnz17Yz0L7YZtdcxU9Z1ZORmFXA72FtGTwAj2gLOYTARuEz82618D4
         H04NNAHtQYkluV40EHlYCs5FaiDOYnpcjFJsxko2gBiuAWT3qMEgyG8Mq0ZKUW0Nw52w
         6FoA==
X-Forwarded-Encrypted: i=1; AKwUvBzaT+XZiVXSBXckbjWm0fsmoYw9WKT5JQI1praY7oG6hP5Qf9OFuhYRou4RmQ+UB2tmUHPsWm9C2g6wDPQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRPsbTFdoRZ3rg3Q7fn58nqjhmZDMWb4t4q6OV9TIj7qbVTpeM
	xTMB7FYc7YjHZVUXZh4q6qzyjNua9H4lZWw/uBxHNtnOGeHdbrER7MMkuvngRo3UbQ==
X-Gm-Gg: AYBFou2PrAhYMBq4NmSZnLHoYbPdCARgrnhv4Wj11prEP01euoKMrt6ZSRBGeNY9w+P
	3AhUbeuHaHILyDhpMOvs2hb8JaxLKSM8qwHTVtOtDUv5gd0JnIDxqyCnfzzsERZjyR7Pb7JIPmb
	gVDTepvSj6AAwd3fW/H2AqiJGDj7mF/hUPsbJ6JKO0xUHd16ikZOTzUaZYPeRx1ouDn5B1wSKbH
	vttUzndJ9x1+TaZzb4QflPBtT6ln+iqJ5ytKZ/G47PfS6Z3R/yHHoVTH1o+Hdg/qmbx79VRpFHr
	ZhI0xMLFjH09RL+Y/LOuDwMXNHvxNGjjerSU52/COzXfuKsLfduzUV21k/OZFxwN94EIv+mub90
	Q0bW9xWrlYhmRB2hWuD/Lzl/VvYWxrrpI9gSGw8yP/fxI3yLJ+cNmeoKMnHtnSLuTcsCcWhewf/
	7rW6HL5ZX4zr7qK3xf+4qqX8sU3vnX2c0g+avxee+PubabQFCp8baZgR+YvGnu7Vpm0SDb/NEnA
	X5ReZRPEYVwVKO/OyTKajNb/bvqZpDINFs0WVvzsYdvSRvmpABy0lEITkdvtAQ8x92Wu7IvEbic
	PJOviHC4YORqsUuesY3ASetg2/okWRAms46cBA==
X-Received: by 2002:a05:620a:2a03:b0:93f:16d4:3bf0 with SMTP id af79cd13be357-94421744f20mr1931854685a.42.1793677811514;
        Mon, 02 Nov 2026 19:50:11 -0800 (PST)
Received: from localhost.localdomain ([206.206.222.26])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7e2342asm105461276d6.5.2026.11.02.19.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:50:11 -0800 (PST)
From: Siddharth Mishra <smish149@asu.edu>
To: David Sterba <dsterba@suse.com>
Cc: Qu Wenruo <wqu@suse.com>,
	Boris Burkov <boris@bur.io>,
	Chris Mason <mason@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Mishra <smish149@asu.edu>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] btrfs: tree-checker: validate qgroup status item
Date: Mon,  2 Nov 2026 20:49:31 -0700
Message-ID: <20261103034932.1790235-2-smish149@asu.edu>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103034932.1790235-1-smish149@asu.edu>
References: <20261103034932.1790235-1-smish149@asu.edu>
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

Fuzzing found this bug. An AI tool helped to analyse the cause and to
write the fix. I tested on btrfs for-next (d6f76ca0a70d), with and
without KASAN and CONFIG_BTRFS_ASSERT=y. Without the patch, the kernel
gives the BUG above, or the WARN_ON() at the first write. With the
patch, the tree-checker rejects the leaf ("qgroup status item has
SIMPLE_MODE but SIMPLE_QUOTA incompat bit unset"). The mount is
successful without quotas. There is no BUG and no WARN_ON(). A clean
simple quota filesystem still mounts, writes data, frees extents and
mounts again. Its status item passes the check at each commit. The
fstests group qgroup has no new failure (34 passed, 3 not run here). A
crafted image and a C reproducer are available on request.

Fixes: 182940f4f4db ("btrfs: qgroup: add new quota mode for simple quotas")
Cc: stable@vger.kernel.org # 6.7+
Signed-off-by: Siddharth Mishra <smish149@asu.edu>
---
 fs/btrfs/tree-checker.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/fs/btrfs/tree-checker.c b/fs/btrfs/tree-checker.c
index 61ea8f42c..0d75cb537 100644
--- a/fs/btrfs/tree-checker.c
+++ b/fs/btrfs/tree-checker.c
@@ -2083,6 +2083,38 @@ static int check_raid_stripe_extent(const struct extent_buffer *leaf,
 	return 0;
 }
 
+static int check_qgroup_status_item(const struct extent_buffer *leaf, int slot)
+{
+	const u32 item_size = btrfs_item_size(leaf, slot);
+	const u32 min_size = offsetof(struct btrfs_qgroup_status_item, enable_gen);
+	struct btrfs_qgroup_status_item *ptr;
+
+	/* version, generation, flags and rescan are always present. */
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
+	/* Simple quotas need the incompat bit and the enable_gen member. */
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
@@ -2475,6 +2507,9 @@ static enum btrfs_tree_block_status check_leaf_item(struct extent_buffer *leaf,
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

