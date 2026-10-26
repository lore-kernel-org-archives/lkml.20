Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028243;
	b=V53BcZ1NiDYHxx4TOI9OwGE/OvfVO8zIcCq7r+K44S35wFjKNNv9glsbD3a0eSnvLzts
	 np87BN7dzTKuxwnKkvqsEVo1HepqD099oYXy7a+fVWaD00nqjkoRcpU/yn7EXVLKpIWSk
	 InZbtLv3Db6NzraR3nFoiZSyaDOtS2pldmQlxu476mZLHW4tBYX0C4gFp1V6MPMaR2ynD
	 +jV/3yREGMbsInuS7Yjh2p8uZ+UD57a2olcgKTNRl9Z310ztdkzrCU+nJ/qkE15S6Nj09
	 moCB2Be6SbuSutlSj8w1piibI48ETl0AeGAuEn9TVXNLxxO+S0ELDpn86TE1Mx+q8aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lypC8MurV7HRH3c/w8NFFi643nEkO5cK6HfBNA//Ydg=;
	b=GPrvMA5sIzQBbJnoLwwtDuooKVVCpt09ZJHmtYjnNHipCNrsUX9g7pJ/G2cKgOp5/rmv
	 TybGxcNfbbj7JhZsgUhGaQK5vOpzm1zDotXR6xdbCC1ThEZd9ig2KRCruI8cdoBj+XGG4
	 d3GQaJewCH4TsnKeCMRZm68P6AjYMumFWJENmQ93YDlVzaOUszC2cuNBvsIYT50/Zo5/O
	 gILaP8GIuYapXFMOsaisEhVnERCcfJhT9P21mTiiz950s+GBwmBAIHrYH46dVh66jv9zZ
	 PoCeC/AYtowffqVQvtazroKbF8E2DsVoC6zA/NbZb1caRdq0fQcd0o3UFlqnYp0R05A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rW2lIEEv;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B09E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B09E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rW2lIEEv
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a2af4c8d00so550891c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793028243; x=1793633043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lypC8MurV7HRH3c/w8NFFi643nEkO5cK6HfBNA//Ydg=;
        b=rW2lIEEvuwSAkL2jbAgcmTJAk2n+zIa5LQNm9NMbYf+KxdQHyfVjH63yHrBxgk7Jth
         FofeGnaiNRBRGDM1ZEjLi7ukfmQQ442OVNEpqB9tVqeu//e6dO93DCUsjbzMCzQCsj8V
         NeziUvl9f8EBqzO+lImbGAtNtiez6xRwXrLN/8R45WGAwU6Mn4601xigCsdb2NKIlwTA
         C718GoOJRycgYQtA2xh876S9UpIr09e9BOdmBZBBCxxcIqPWHmKGmyi6Zo3NkgSn9rzR
         9Txx281PM+KH7G43s89AAaazOXsyGwFvmhAxfYkxhtI+TcWpjXRkaIPeJQvFLZ3XqqRe
         /4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028243; x=1793633043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lypC8MurV7HRH3c/w8NFFi643nEkO5cK6HfBNA//Ydg=;
        b=cPdHXdlbNoka0loEM6Jc/uzH/MhCrA7h6/UBrK4nfxZ0Pxjig1uRT1IJT36ZDLiaJC
         Ve3/XnwXYzx1PJRoIYOvFDhp8pBwbbfhvvCoJgnXPsnBV8+BMxcS5l5zXPJjhYXY7ad3
         /ig2B3f7z6E8wvzOpWt+pF4c99oQWO33JZBE7ODn6ytr+Yr9AA5XF2q9DqxXLFcY8vkh
         uqjqrUaW2k0STp4p/1ElKH8n+Xp3YJRUhVp86lG5YrpSKEsVl16ht+m24Hs4cIyM0mcx
         QQpCVpRZJe9JMkrviacj9YqhdBQaYcnH0nsoARBf8qF9Y1/DRQ9kKMQDO3q/vK5LEHkk
         MaeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwm+EILtHu4GNrs+AfpsB1/MVENhaf3uysgZSacw7PLsblePcbrmWIO19ey4DVH/CBAlAs5y63sxGLyCW0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJccrM3LG46AYCsDKDxbt4COHFHNfNY/HnZUcYWmeA/AU7oqXvQ
	7C2W3K8/RlLNNZh3ws7MIJSBIyQB8ER6rnhjEJzOcSjJpKiG7Fh6+ACbfzk3ZPe5
X-Gm-Gg: AYBFou0d0aYB0orq9zz5RnlNXbY+BPFKXW0RfTnqslw54PERYYOzc8n5mmTYu8d6ith
	7IiJmbxbJsY03bJ5l61PeWoKx/LVQGn9wdlehyj3TRMZiP+jIYXdeLBXypPWOU4bKd2uWA21iBo
	CUOh517r+qhWYFe8sjzUeZlIs/Gg/35kfXkx0V0ZTN2Hq/jObVp3RkD8Z7IBjHpLRJulJX02JDr
	HauhsDqX9LOQ45LKEB8yW0QPS314F764A4NVM7RAdFmKsl8kTHDWirwMMQAASZu3ahcM1qPMJIZ
	PtW8nXQZvQcU+DteBF/+emSKRKVVqkj26KRxY+9kHS61T1a/4Z2LacCQXBZgIQPxjtz6oq7rbBZ
	oFlenfQ3dbFpaq/9qhFdfN1Xo2JiAu6tqstL+bJ+5eXFQ2HEKRpS3V4gcc144fSDwCqA7CrpeNn
	LjdHlrkuzCwwdeiykfwHDWQpl+21SdS9Ot0iFRfs0K7Kon/i5shlvw1eGZP2DuDQ4MjRLuzYz4y
	PUcR4quIa4tGPi7PvRVVzCBsb4BEhXosFegLptcrv6njQ/hXeJl1UFaZntvJUxDKq/kz64=
X-Received: by 2002:a05:7022:1114:b0:18d:ac5a:89ef with SMTP id a92af1059eb24-1993639e52cmr10117949c88.31.1793028242124;
        Mon, 26 Oct 2026 08:24:02 -0700 (PDT)
Received: from localhost.localdomain ([61.255.248.240])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f83cedsm31749966c88.13.2026.10.26.08.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:24:01 -0700 (PDT)
From: Song jeonghak <thdwjdgkr123@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shardul Bankar <shardul.b@mpiricsoftware.com>,
	Edward Adam Davis <eadavis@qq.com>,
	Song jeonghak <thdwjdgkr123@gmail.com>,
	syzbot+98547b0428b6a6a3467c@syzkaller.appspotmail.com
Subject: [PATCH] hfsplus: free failed b-tree nodes in hfs_bnode_put()
Date: Tue, 27 Oct 2026 00:21:39 +0900
Message-ID: <20261026152139.458677-1-thdwjdgkr123@gmail.com>
X-Mailer: git-send-email 2.43.0
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

hfs_bnode_find() flags a node it fails to load with HFS_BNODE_ERROR and
then drops its reference with hfs_bnode_put(). When the last reference
goes away, hfs_bnode_put() only releases nodes flagged HFS_BNODE_DELETED.
Every other node stays hashed in tree->node_hash as a cache entry and is
freed later by hfs_btree_close().

That is fine while the tree is open, but hfs_btree_open() looks up the
header node itself. If that lookup fails, hfs_btree_open() unwinds with
iput() and kfree(tree) and never calls hfs_btree_close(). The failed node
is still hashed, nothing references it anymore, and it is leaked. syzbot
triggers this by mounting a corrupted image:

  hfsplus: failed to load extents file
  BUG: memory leak
  unreferenced object 0xffff8881040930c0 (size 96):
    __hfs_bnode_create+0x57/0x310 fs/hfsplus/bnode.c:476
    hfsplus_bnode_find+0x138/0x660 fs/hfsplus/bnode.c:554
    hfsplus_btree_open+0x30b/0x5d0 fs/hfsplus/btree.c:384
    hfsplus_fill_super+0x272/0x880 fs/hfsplus/super.c:546

Free a node that is flagged HFS_BNODE_ERROR when its last reference is
dropped instead of leaving it hashed. This follows the existing
HFS_BNODE_DELETED handling: unhash the node under hash_lock, drop the
lock, then free it. A failed node was never handed out for use, so unlike
a deleted node it has no b-tree map bit to release and no contents to
zero out. A later hfs_bnode_find() of the same node number now reads the
node from disk again instead of getting the cached failure.

Tested with the syzbot C reproducer in QEMU (x86_64, kmemleak) on
next-20261023: the leak was reported in 3 of 3 runs before the change and
in 0 of 3 runs after it, two of which ran with slub_debug=FZPU. On a
valid image, creating 3000 files, deleting half of them, and remounting
gives identical results before and after, and fsck.hfsplus reports the
volume as OK. checkpatch.pl --strict and sparse report nothing for
bnode.c. This was not tested with KASAN or with concurrent access to the
same node.

Claude (Anthropic) was used to help with the root cause analysis, the
reproduction setup and drafting this changelog. The code change itself
was written by the submitter.

Fixes: 8ad2c6a36ac4 ("hfsplus: validate b-tree node 0 bitmap at mount time")
Reported-by: syzbot+98547b0428b6a6a3467c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=98547b0428b6a6a3467c
Signed-off-by: Song jeonghak <thdwjdgkr123@gmail.com>
---
This takes the direction Viacheslav suggested while reviewing Edward
Adam Davis's earlier attempt, "[PATCH] hfsplus: Supports freeing newly
created tree head" (April 2026): look at HFS_BNODE_ERROR in
hfs_bnode_put() rather than special-casing the header node. That thread
did not get a follow-up version.
Link: https://lore.kernel.org/all/tencent_C4F16CD096B0EAEAEE5ACDB07A266E382C0A@qq.com/

fs/hfs has the same structure: hfs_bnode_put() has no HFS_BNODE_ERROR
handling, and hfs_btree_open() looks up the header node and then frees
the tree without hfs_btree_close() on failure. I have not reproduced a
leak there, so this patch leaves fs/hfs alone.

sparse reports a few warnings elsewhere in fs/hfsplus (ioctl.c and
attributes.c) that are not touched by this patch.

 fs/hfsplus/bnode.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/hfsplus/bnode.c b/fs/hfsplus/bnode.c
index 3a1a1fa6f2e2..3d159db229e5 100644
--- a/fs/hfsplus/bnode.c
+++ b/fs/hfsplus/bnode.c
@@ -702,6 +702,14 @@ void hfs_bnode_put(struct hfs_bnode *node)
 			hfs_bnode_free(node);
 			return;
 		}
+
+		if (test_bit(HFS_BNODE_ERROR, &node->flags)) {
+			hfs_bnode_unhash(node);
+			spin_unlock(&tree->hash_lock);
+			hfs_bnode_free(node);
+			return;
+		}
+
 		spin_unlock(&tree->hash_lock);
 	}
 }
-- 
2.43.0

