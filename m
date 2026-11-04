Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827851;
	b=UXEaNNeat5d1bUPSHPHa4zsf1r5QhBgwmcLFRoGAMOSB+ZfcoKZaSgERWgDEYdCFGO3D
	 ijk85d51W3E7co3RoEcBXqCPeJfH/CMDpK0nh6VPbmC0SPMQPXnuEC5xmLWZsjsMiI65Y
	 d3IhkGZEcZLHnWGHUdWuqcrhtz+XXf3293ucJp5x9i/9fyIisRpy8NAEQdo5k2nMZ/Wpv
	 Gr2XGW9/54StstMhPjvckQjMP+55ATPMytSowDo3rxx7xFM9bHbEYT1gJaqX9tfYAxFOu
	 CTVS4Js+yD8phqolH92qRFH8mLU6JeXQVGf5SeezhyvkXJ29llOdo2hplsZqXO+y9bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j9Yof6nkgFBRxhqhAp0VzcnxL9pNNJ7vrgx++gGklkc=;
	b=xFyzU9xR8e1LaBcux/GCkj8+pbXGapK7vUgLiPnNfVyWx02LUOSD9IZyHp+s2BFere45
	 l1hEmNOX8SK/7zHCnYcBPN8chkfAxHttceeU9iNcdssrUCldtLh18+hx/9cE42gcASzR1
	 ZxQBf1JTf3iH56OxELjXqTxY++g8ASbhoybEcwx5UC3vapY39FDBaBOKQ7sCrkrn1sx8c
	 k3m8rI9p3rX2zSHCr1mqYCJqkPX5DHFoHNwe8bGctneJylxGAYKInrnTRYHzN7Uw7QsGA
	 hfvcT7uNytPqXTKHSNFtCPdXb1wlMJ+7KsOQ4zElpHyB/LkKsl7flLSOpzbnM60mBKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=GzFtzCms;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF369607815F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF369607815F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=GzFtzCms
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2af4c8d00so2616586c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1793827850; x=1794432650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j9Yof6nkgFBRxhqhAp0VzcnxL9pNNJ7vrgx++gGklkc=;
        b=GzFtzCmscan+ber6mv0J+anTBdsdZJwC0XWVOpTLENIjTaOLTNoFkcH3DpkPunN7RP
         OZVRy9G2FfMLWfbEmC3eKXt7QVf2/21WWy/LWgcHvtqdSZJbdE258Mxc832F/AGXScHn
         m2srwHt5EztHIi59wA91Pxucs14VxXieDs/EXuVaJmediHh4kTY/9rdrPWbDxQoTdZCv
         nbAtuR1US30gyDjMkMAg1xW4ba/cGhxPUR7X+xNEAlXdFVcxekl60Vlac/YIL/6+3ChM
         muFqiiOzSLWvMO4pZuKR9lsDH0LpV34qzM+9CVN3vkPltXPZqFuusxIKhYMipQioH5tW
         QjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827850; x=1794432650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j9Yof6nkgFBRxhqhAp0VzcnxL9pNNJ7vrgx++gGklkc=;
        b=eFMpw5lizhGVrNZ4GpahSI1R+eOUUDVUR6t3HZJN8UYHZ7dGDmEzpeDxgLpDBGh3T+
         gcNGg8YFwOqqYzDbCQNr/boEI07Cpv8Li3i5eY/MJWLzM/wN9H6Hye3Am7mrmrFla2n0
         1RigUXlLHe0jH6koXSz56TxQUI2jNa1fyqqaE87C/hQEOMqnuZbuFnJzv+LwEHkM6MpV
         V0b5dzyNzSYJwahCvwTV91XCvD1+aWxIEE4fcTRI2K6lowdNBo1Pvb9ubQSqnDH6uIHB
         JGRSuVqZB5AXinhCR8ky2kh5lQbTTfE/x3n1NnZc4rIeaQ/wpD99sQjaajezFGkM60So
         m0rQ==
X-Forwarded-Encrypted: i=1; AKwUvBwh/157GwDlUJVRNndnYc/WjOpMwQMngGVjyACZs70fi2CHuFiiVHGwSfp9X/3yczB8WRO16VB9sbD+uAg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8D0WYcSIT13QBGv6n96V0PcuVQ7H2nyUK+BiilqPNrDTeg4ssD
	wNjgh/ys/i+3rRH/+A5Y55GRZLT/mBs1EqKQdEWF6YXUzQwYrOTYLO66aB3ylo1jLQ==
X-Gm-Gg: AYBFou3OEuvGmHU0L9REaWYdFiut1wLPwp5zCQPdzq3B20HYnxTYskzPPOSTSSZg/CZ
	z9iISmAhBifzAt9QFI1rxMK/lBgEijqGKPpy24hDOyb5/T23pOp58utz2Acjexlesn5XmMzUm6J
	oFGsq0b4Kz76pq7Tsxf2lAGgj7t8MDFx+ClHRK23q/ORLDv7dDa9RrrmXKUlJTLclrsF85XwuWw
	Pj4J9Db7jRQT03XdsDpIsZyCIADZv23VipUD5Sh8bfsw408BRtWvPQwarzW2GpWPxnOAuBmpfXk
	5XQhboVHOfeggGkXtvK9z1EREveg1yfiLVqkuyqonXFyqOi3Lj+JSIiqsCZgucCYBSDQU/gqD90
	OLRN4gDw9nPQTaiBPT8LU64f3qQ6Wg3QUPC4ld9egWg0p07/14j+1I9MAFkBBZr/baiOQ/T0NS7
	I4c6P8FiyccXoX+nreduZCgjKRgWjBoYCj8kAfi379SHDhJFszqcvq9pGyxoe80KNjbBvQeiYr9
	AsoKNwnw+jEHtGbqxJ0RBE7wxrsFhkole0CppdHfE3h4DJzGvg2FyWKuL6+cZYDNfWCvVrv8IyP
	+bZurUGnHA0+9qCyoD+hG6bOhm+k480xcIcWUaBOsFqxxLZXXvciYyLuZrE=
X-Received: by 2002:a05:7022:1e13:b0:149:1feb:6d9d with SMTP id a92af1059eb24-1ac5ac4df09mr21588630c88.19.1793827849878;
        Wed, 04 Nov 2026 13:30:49 -0800 (PST)
Received: from localhost.localdomain ([206.206.222.26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm15252424c88.17.2026.11.04.13.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:30:49 -0800 (PST)
From: Siddharth Mishra <smish149@asu.edu>
To: David Sterba <dsterba@suse.com>
Cc: Boris Burkov <boris@bur.io>,
	wqu@suse.com,
	josef@toxicpanda.com,
	fdmanana@suse.com,
	mason@kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] btrfs-progs: check: count non-skinny tree blocks in simple quotas
Date: Wed,  4 Nov 2026 14:30:45 -0700
Message-ID: <20261104213045.3029012-1-smish149@asu.edu>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104192151.GC3301639@zen.localdomain>
References: <20261104192151.GC3301639@zen.localdomain>
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
On a filesystem without skinny-metadata, mkfs with simple quotas writes
a qgroup that does not count the tree block of the fs tree:

  $ mkfs.btrfs -O squota,^skinny-metadata $dev
  $ btrfs inspect-internal dump-tree -t quota $dev
	item 1 key (0 QGROUP_INFO 0/5) itemoff 16203 itemsize 40
		generation 11
		referenced 0 referenced_compressed 0
		^^^^^^^^^^^^
		exclusive 0 exclusive_compressed 0

The kernel then warns about a squota underflow when the block is freed,
and "btrfs check" reports no error, because it uses the same code.

[CAUSE]
simple_quota_account_extent() treats an extent as a tree block only if
its key is METADATA_ITEM. Without skinny-metadata a tree block is an
EXTENT_ITEM with the TREE_BLOCK flag, so it is handled like data: its
first inline ref is a TREE_BLOCK_REF, not an owner ref, and the block is
not counted. mkfs fills the qgroups with the same code.

[FIX]
Pass whether the extent is a tree block, from its TREE_BLOCK flag,
instead of whether its key is METADATA_ITEM, so a tree block without
skinny-metadata also takes its owner from the tree block header.

Fixes: 5bd97022f384 ("btrfs-progs: check: add support for squota")
Reviewed-by: Boris Burkov <boris@bur.io>
Signed-off-by: Siddharth Mishra <smish149@asu.edu>
---
v2:
- Pass the TREE_BLOCK flag from add_inline_refs() instead of checking it
  in simple_quota_account_extent() (Boris)

An AI tool helped with this version.
Tested as v1 (mkfs and check on skinny and non-skinny images, a
kernel-written filesystem, the btrfs-progs test suites), with no change
in results.

 check/qgroup-verify.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/check/qgroup-verify.c b/check/qgroup-verify.c
index b58ef366..30f258a2 100644
--- a/check/qgroup-verify.c
+++ b/check/qgroup-verify.c
@@ -1033,7 +1033,7 @@ static int simple_quota_account_extent(struct btrfs_fs_info *info,
 				       struct btrfs_key *key,
 				       struct btrfs_extent_item *ei,
 				       struct btrfs_extent_inline_ref *iref,
-				       u64 bytenr, u64 num_bytes, int meta_item)
+				       u64 bytenr, u64 num_bytes, bool is_metadata)
 {
 	u64 generation;
 	int type;
@@ -1046,8 +1046,8 @@ static int simple_quota_account_extent(struct btrfs_fs_info *info,
 	if (generation < counts.enable_gen)
 		return 0;
 
-	type = btrfs_extent_inline_ref_type(leaf, iref);
-	if (!meta_item) {
+	if (!is_metadata) {
+		type = btrfs_extent_inline_ref_type(leaf, iref);
 		if (type == BTRFS_EXTENT_OWNER_REF_KEY) {
 			struct btrfs_extent_owner_ref *oref;
 
@@ -1105,7 +1105,8 @@ static int add_inline_refs(struct btrfs_fs_info *info,
 
 	if (counts.simple) {
 		int ret = simple_quota_account_extent(info, ei_leaf, &key, ei, iref,
-						      bytenr, num_bytes, meta_item);
+				bytenr, num_bytes,
+				flags & BTRFS_EXTENT_FLAG_TREE_BLOCK);
 
 		if (ret)
 			error("squota account extent error: %d", ret);

base-commit: 3737c2603af86f742986c51cf0e5c4898a126d6f
-- 
2.54.0

