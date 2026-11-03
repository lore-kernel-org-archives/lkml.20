Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686555;
	b=nDbcg93BQo3lP/AZsG6IJLRRlWJu3ylrqVAr9bUK9ExzcmCO2t+3PJhmQCA0M1/sDCA+
	 TZBwUVpJZvcQdNx5H+0/Po/BaWPHaSSYv/SZBvUtLQUwZSS2vkPe0yZPI5in5wVhAP+V8
	 Gv+8pQXQ5r1sh9do9sEJwiRcf2m0ADma6jlrwOuokmX1FDIRdJOrFjW0Q3fi1IDt1TYsC
	 tHMJUC7pyYmjY4i2E9nJdmb9B8dnsfCIUCozUNpaMhJLDWVzDQ9Uwm5WvVr9IoorjoZf8
	 ubXgEC0IStl1YjQ2wYvOaEk+oCsTpyY/vVt8+mXrHpQlE9u5enFVWsEBVCV+zB7KsiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D7f/7cfhMuxRUvMF2+7Ngeja0NaB7eB5cH8ZEWQf8hE=;
	b=VjYWlcIQ2GCscdlceNP/2rJ19ZkZUKc620Rl1PgxDKJJnD0TSxJmSKHi8hp9INPU3fu4
	 aBN7psTGRwRmcW6fx/O/GPbdGJ82V9ZA3CNStON9JNFueUPUZmYvXi2U/z3edtXux69wR
	 t0R9qeRTIfr7RCy87tCYdnDQp26mG4BwIGHrftuo/Xbw2zcmvMKv+7Zn/6XfHm+lyh1zW
	 s13w8sUVqr2BjhbTUantawNu/p2o9rkwhYvXZfnKnSco1L0qCVok1HvShrEAhFFDtDwMF
	 037hX3dqsToxsDX8qoebeFW/rW/v0a39Lh72s/bR5jC8B9KC1EYGGoBuIbBCH9QeK6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=MV3oFS6a;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2737606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2737606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=MV3oFS6a
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-70bf1671c21so2201912eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1793686554; x=1794291354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D7f/7cfhMuxRUvMF2+7Ngeja0NaB7eB5cH8ZEWQf8hE=;
        b=MV3oFS6aclww/vOUGkSg75ZDogvO0rW1ltFf+4scDJXC6mjqXc8vhFKIDv69KZ2b0Z
         761VX9fhsM7iyQu2x/7V1Y6wZa1sXvqyQXeQWEAEzw0yDdm7a39tdDi3T9T9PDx8ypQY
         9d75N0erAEtUBqVvm46uW0rWbTymVB81QdU1Z69wtnav+UPLGMeAyn4FiNrw9qT+H3SF
         YI+0tNS7i/XCvF2gxK3hgufkGCRSUDOLoDxcakpHnD8MxHO5QpRfhjDvUox+Bw9URJsR
         By4KzqhroIS4TEojYAFZVo0TxC1RiXwYbJMw6xws14d/zumiQFVscsdFqdFdh6iUsB/P
         SPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686554; x=1794291354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D7f/7cfhMuxRUvMF2+7Ngeja0NaB7eB5cH8ZEWQf8hE=;
        b=fho82m381dhvK/bagBFkhj6XzKh8RC1MW3PGwa5SJNkpHhqjzDO8huZSM41qb6YBd9
         8LX9B35Utc5qTD3mJBIBTWMeNQ9z1w09jtDUUABjRpnJrkbajeQFV/EU0ofwmrUOI8Jr
         vY9XqPiyq+P4CKBVgH9hRystqeHd7YwOEeMGnwMerk+oa3+xX+IApsiPl9PuCDnyjDde
         5c9GLSwykMjM45uVFjf+3rb4P9If2Kx//t7Rf/5dukxbwSeN+7UpO3GF4L2mAnmU4jbZ
         gWyWXEWKruwwut4dGkN/NAJG0hmjmdW5R1Xl/tQKbk6NkkDu5LCXwlN4AMpW1e+PHPox
         MWng==
X-Forwarded-Encrypted: i=1; AKwUvBxxRPjwtucBsHC1uOmnaXJnr0pVApHnc9jEbXAKqtA0iAAe9NSHuA5rMoHGPn8W7G5sxB5e94Q+mo5UK/o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJyFD3TYqaD+lVe3aE2Nr0ZW5mfgnKHAFzfAyHEJ2my/bY9Zbe
	3QI7Ezh0etPlvsNp7c+GySyW9a15gBikSZ15uq/E25dqaOwYqUxXizc/uMd7ZArm94CnIySHJKs
	CDZiBBAZ1
X-Gm-Gg: AYBFou3Vsu2+1IoDJzXsNIAWQ/FqXPkSWx1zrquXrrXZIPnTjSV+QB2/S9llaJPi9SE
	nz6s5r26d9/Qn/R0k4YaKEVjSfIEqYeoagccMV6o7xdmtde/DSYEz0zCmSnMQtqrDnW5RJxIo3v
	POmbV3CfmwXBgjmp0uWuDAms7g4jeHLf256XphN29EDBe3Bajcvy6CrO7TRy8q6IfB4W9aU3gFh
	ISe1F8k3frBeCShbDsiDRwxqXrMn9yPBpO1stqmPq/OzsrLXW5qM5UDaz9LB0I1uxIAxQ9+r5B1
	kZdCaHiY3hrFTktMzoTmg7XTCwvYia1oTOme3PvQEMAYPGKCSjpRDJbrUOCGrCsNbjk0n/zlOlu
	6QUK5Wjp28k1I+JH+OzqathbPJUPWWKW97dacG3TYlyw3LSKc+jOYOQrhO6wk1iFRaR2X6FCWCU
	o4LF0wo9Oxl84i+15vuGjoHhSWleyjhvgpN5IJtCE0tmbnFAEqoDKq9AKFeuHuFVGTEKLMonHT3
	YnoXDdW7JhNhOX84gzJRTOACZ4fLRFiGoc20eg9U/Lttbx3Zj/uWFOrUzpanoZrheS8UVmqcdTb
	lH1dcUrhoQCEokE7grh5kVq5WCvQDAYpwo9PT7qajw==
X-Received: by 2002:a05:6214:ace:b0:91c:7a68:2ab3 with SMTP id 6a1803df08f44-91ca4bb34camr203741326d6.37.1793686233610;
        Mon, 02 Nov 2026 22:10:33 -0800 (PST)
Received: from localhost.localdomain ([2600:1011:b1ae:f075:aa26:e161:414d:7ec7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca807d8fasm109173076d6.41.2026.11.02.22.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:10:33 -0800 (PST)
From: Siddharth Mishra <smish149@asu.edu>
To: dsterba@suse.com
Cc: wqu@suse.com,
	boris@bur.io,
	mason@kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Mishra <smish149@asu.edu>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] btrfs: tree-checker: reject extent owner ref without simple quota
Date: Mon,  2 Nov 2026 23:10:21 -0700
Message-ID: <20261103061021.2213691-3-smish149@asu.edu>
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
An extent item can contain an owner ref.  The owner ref is correct only
when the super block has the SIMPLE_QUOTA bit.  If the bit is not set,
check_extent_item() gives a WARN_ON() and then accepts the leaf :

	case BTRFS_EXTENT_OWNER_REF_KEY:
		WARN_ON(!btrfs_fs_incompat(fs_info, SIMPLE_QUOTA));
		break;

For all other incorrect inline refs, check_extent_item() returns
-EUCLEAN.  After the tree-checker accepts the leaf, a free of the extent
calls btrfs_get_extent_inline_ref_type().  This function ASSERT()s the
SIMPLE_QUOTA bit.

On a kernel with CONFIG_BTRFS_ASSERT=y, a free of such an extent gives :

  WARNING: fs/btrfs/tree-checker.c:1782 at __btrfs_check_leaf
  assertion failed: btrfs_fs_incompat(fs_info, SIMPLE_QUOTA),
  in fs/btrfs/extent-tree.c:354
  kernel BUG at fs/btrfs/extent-tree.c:354!
  Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
  RIP: 0010:btrfs_get_extent_inline_ref_type.cold
  (fs/btrfs/extent-tree.c:354)
  Call Trace:
   lookup_inline_extent_backref (fs/btrfs/extent-tree.c:919)
   lookup_extent_backref (fs/btrfs/extent-tree.c:1100)
   __btrfs_free_extent.isra.0 (fs/btrfs/extent-tree.c:3319)
   __btrfs_run_delayed_refs (fs/btrfs/extent-tree.c:2134)
   btrfs_run_delayed_refs (fs/btrfs/extent-tree.c:2246)
   btrfs_commit_transaction (fs/btrfs/transaction.c:2278)
   ksys_sync (fs/sync.c:104)

Without CONFIG_BTRFS_ASSERT, the kernel gives only the WARN_ON().  Then
btrfs continues to use the owner ref.

[CAUSE]
I made a crafted image : an owner ref, no SIMPLE_QUOTA bit, and no quota
tree.  I removed the file of the extent.  At the next commit, btrfs
frees the extent and gives the BUG above.

For an owner ref without the SIMPLE_QUOTA bit, the tree-checker gives a
WARN_ON() and keeps the leaf.  For all other inline ref types, it
rejects the leaf.  Two sources can put owner refs without the
SIMPLE_QUOTA bit on a disk : a damaged or crafted image, and a kernel
without commit f2363e6fcc79 ("btrfs: fix transaction atomicity bug when
enabling simple quotas").

[FIX]
Reject the leaf with -EUCLEAN, as for all other incorrect inline refs.
Then btrfs finds the problem when it reads the leaf, and the ASSERT() is
not reached.

Link: https://syzkaller.appspot.com/bug?extid=d7d1fc7e21835ca19219
Link: https://syzkaller.appspot.com/bug?extid=4983e68a6d77180bfe33
Cc: stable@vger.kernel.org # 6.7+
Signed-off-by: Siddharth Mishra <smish149@asu.edu>
---
 fs/btrfs/tree-checker.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/btrfs/tree-checker.c b/fs/btrfs/tree-checker.c
index bb86c30a2..f021ac14b 100644
--- a/fs/btrfs/tree-checker.c
+++ b/fs/btrfs/tree-checker.c
@@ -1779,7 +1779,11 @@ static int check_extent_item(struct extent_buffer *leaf,
 			inline_refs += btrfs_shared_data_ref_count(leaf, sref);
 			break;
 		case BTRFS_EXTENT_OWNER_REF_KEY:
-			WARN_ON(!btrfs_fs_incompat(fs_info, SIMPLE_QUOTA));
+			if (unlikely(!btrfs_fs_incompat(fs_info, SIMPLE_QUOTA))) {
+				extent_err(leaf, slot,
+					   "extent owner ref without simple quota");
+				return -EUCLEAN;
+			}
 			break;
 		default:
 			extent_err(leaf, slot, "unknown inline ref type: %u",
-- 
2.54.0

