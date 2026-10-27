Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114288;
	b=xCkg6Ag+W1kzI6R9+4DmmRNDdNtIkIjxxlWOmwMMRgbbLeg4urnanwCBBEbAjOxdX40P
	 JmZDT5pAfzRt8I3v93W2v8NgIq9r9MAYX03Zf99BCGo8XtBXNyYIWDoxihZCfaA39cxBw
	 dKhfXM70UslJk4+2Zw8dnJ5JhUGa6JO/Rwfzy7ubkKlG127bee+px2yJlbAH2sH9iZ9yR
	 xL73PJ9+S4PjNF6YxaozVhMq46OLvF8goKvCmUc4D9v8ygyEPuTTl+7J8bbSsfacUhlWU
	 G5WwrFe8uwYPHF0GYcirKfRGkHjySSwqRK0kXv+ZEX5r/YII6ejjZlK88KBVQzeu40g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j3Qa+V3IuRI+P0CHYRVzERRph/QnLAAsDUYydB4MNhM=;
	b=FcZqU6J1tLgpWobN/0OS7Cp4G60Qc+2/DMc98EjxtOMLea+rZlmn3btvXnGLYW9KJaBL
	 lIeP04tINu53NLMidyOtIhMzpnJWZRr9cc1OnWx/ItEMxwXnjFUZrhJ/XcrrztmsfZ9Rj
	 MH4oe3g5G2csoGzkZoj1pZMk4hYZQbYdv/oF/T5ZbsXilui1F91GDo7IFtB9C3u/379Tr
	 AjYmAAJ1xIFHfJYSjpvaZjy9CScm8yCHvNaVegqCLxj1TcxwaduOQpCsLpskr/ZGLpJZd
	 1uH3wz02g70hqHqmyquEHfu+8dPRTXlxjaybjqZ/uwOthLnsfnb+L1APRJbdfL9onPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WLkRowIQ;
	arc=none smtp.remote-ip=74.125.231.132
Received: from mail-oo2-f4.google.com (mail-oo2-f4.google.com [74.125.231.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82535606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82535606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WLkRowIQ
Received: by mail-oo2-f4.google.com with SMTP id 006d021491bc7-70073621339so25570eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793114286; x=1793719086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j3Qa+V3IuRI+P0CHYRVzERRph/QnLAAsDUYydB4MNhM=;
        b=WLkRowIQXIhcPuk+Jxnyn81h2nuzryWq6PMTu+RVzNQM/XPlRZQlUuG++FIpXZw5Pk
         L1g3NAW/uBM/eUK/pgryfRBsgFyOT8aKwnY3xUHRr+cH3zysJe6Ntw5vD7qgQ1ImfJLB
         n11iJpyW0L1/pjzWnRVpHhfzj0+UvdweqZ1Mf3BFd2CneEKT9TyYvxTg5G0fJ1WbC8jS
         MT5GoU5vUOp/JeuOngShJ02939g4gGnG2dC6HLLkDG503hvKmubrg1kmnZ1kF1A9a44X
         SEm+8dSHbIakR44suIjh4+/HzV3uczmMxaWgg3f3cKlgPfSANCKHeK0SB0uTkLfhLGyO
         a/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114286; x=1793719086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j3Qa+V3IuRI+P0CHYRVzERRph/QnLAAsDUYydB4MNhM=;
        b=GEkXGETFJov6kDNXd8C87vlE+bcXPv5XD81rjsYAf0NsIAcOLC0RHdJHAH1tNF6Omb
         50LOPYN4kuz9k8PBFMtQ4VArcBvJ7uRBmShv+AUmzelQtlQZlgCsILXZCVQ4CDPH5kCC
         3DDXPLc/exrdgnF+LiKPXCfokT8Zt4UOeXLYD5ckpsPhuiqKuQ+J469zKU/XA05qG0ub
         IotxdjCO+LZ4GUAu8QMO5uexq79eZfXW3XgkyIY6RAkKbbEkUEnT5u09Y1dd7BT2TAhj
         u86c5fN+U1kFG+K1lNOiiebcO2Gn2zCL7xreZ3Oa6t+f5/LzDeS6xtTjOsP/JUmnhMG9
         wdTw==
X-Forwarded-Encrypted: i=1; AKwUvBz1ZaYXvnp5a/T829/uKHgkh9Ugclux0B5K8SwrsY6SBfsmZQd2WgiqjeWLb48Shxodpz19h10l2h7CLL4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLD9xovDwZ8aHgypsEpO95jhJsbkFUIE49GI7MeewgMZS55buCC
	0p+8DMrrWIjw8uL9ORfKVGjYV1Y4aDjPA0j9IPMGYRWoc9nKZ60FOXF/
X-Gm-Gg: AYBFou1MHOkQg71Juo+XOnqfQP3WS7nXDszYRVCgHIXnbtHfEHUflsOWyruYc2/fIjl
	B0sZv0CrXOHaatUiTFxbLVi6pKgzwOtj9OZEGj1+kxuIoyrXQN1RPj97Bmv/xPDl7zcYhYs7eUw
	+WG75Z9chPL4826ohElki+E1aH0BHr4GGw9iMQrgPE+fhPNycuaABCT5hWoBOXXpKoXi0bXRtop
	FVYBCWsZ1mofQGIsxV+ns+ZidaDgt50cuQTP7oRt2sEe4ZTTlVrDTAopO7Mlv4+ToS05YfxSnrC
	djqf1IvTf5dEfGmzYids53ht3J/zhWt26RW93WObHWyS3ZAeAyP7nQmymxqM8/b+Oj3NxUumS3b
	3hwFzlSM4ZD+H5dsjPNwOHrsObVcbFgm36ZgiV1U0jof/tnc4LUxRvbBro1TYhxdGn8P0qZbM2b
	+JkJi+N9KtTKsMl7uVRawdzI6CjA8HJNcTe6teYMeeRJ1uiC++0pbucUOpaylRp8tTtycyFNHbf
	PvFT+tzHZYQ6qe/JjfaoEiBJFY+w5eBK3d/M2YBuh4k3QnYuBh9gadOu38ByIsEa7TjgJGTCJNR
	jLzL9qyjtYYMw4Zx3S0=
X-Received: by 2002:a05:6808:244d:b0:4f8:4ec9:b170 with SMTP id 5614622812f47-55bfff9736fmr6281431b6e.2.1793114286462;
        Tue, 27 Oct 2026 08:18:06 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.39])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c04311a8asm8009673b6e.16.2026.10.27.08.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:18:05 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Carlos Maiolino <cem@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Hildenbrand <david@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	James Clark <james.clark@linaro.org>,
	Long Li <leo.lilong@huawei.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Javier Tia <javier@peridio.com>,
	SJ Park <sj@kernel.org>,
	Rafal Ostrowski <rafal.ostrowski@amd.com>,
	Myeonghun Pak <mhun512@gmail.com>,
	Likun Gao <Likun.Gao@amd.com>,
	hongao <hongao@uniontech.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Cihan Karadag <cihan.cihan@gmail.com>
Cc: linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] xfs: fix out-of-bounds da node read with a crafted record count
Date: Tue, 27 Oct 2026 23:17:54 +0800
Message-ID: <20261027151754.975492-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

xfs_da3_node_verify() bounds the on-disk record count with:

	/* we don't know if the node is for and attribute or directory
	 * tree, so only fail if the count is outside both bounds
	 */
	if (ichdr.count > mp->m_dir_geo->node_ents &&
	    ichdr.count > mp->m_attr_geo->node_ents)
		return __this_address;

The "fail only outside both bounds" conjunction is forced weak
because the verify pass cannot tell directory from attribute nodes.
On filesystems with a multi-fsb directory block size (mkfs.xfs -n
size=64k, sb_dirblklog > 0), m_dir_geo->node_ents is much larger than
m_attr_geo->node_ents (~8184 vs ~504 for 64k/4k), so an attribute
tree node with a count in (attr_ents, dir_ents] passes verification.
Consumers then index the in-block btree array with that count and
read out of bounds:

  xfs_da3_node_lookup_int()   btree[max - 1].hashval  (max = count)
  xfs_da3_path_shift()        btree[nodehdr.count - 1].hashval / .before

with count=8184 the read lands ~61KB past the 4K buffer, and the
out-of-bounds "before" value is then used as a child block number.
The read path is reachable by an unprivileged user via
getxattr/listxattr once the malicious image is mounted.

Tightening the verify conjunction would falsely reject legitimate
large directory nodes whose counts live in the same interval, so
enforce the per-fork bound instead where the geometry is known: at
the two consumers that index the array with the on-disk count.

This issue was discovered by Tencent CodeBuddy Security.

Fixes: f5ea110044fa ("xfs: add CRCs to dir2/da node blocks")
Cc: stable@vger.kernel.org
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 fs/xfs/libxfs/xfs_da_btree.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fs/xfs/libxfs/xfs_da_btree.c b/fs/xfs/libxfs/xfs_da_btree.c
index 3d02a0d7ba44a..ab3deff11111e 100644
--- a/fs/xfs/libxfs/xfs_da_btree.c
+++ b/fs/xfs/libxfs/xfs_da_btree.c
@@ -1787,6 +1787,18 @@ xfs_da3_node_lookup_int(
 		} else
 			expected_level--;
 
+		/* The verify pass cannot tell directory from attribute
+		 * nodes, so its count bound has to allow both geometries.
+		 * Here we know the fork; enforce its geometry so crafted
+		 * counts cannot make the array indexing run out of the
+		 * block.
+		 */
+		if (nodehdr.count > args->geo->node_ents) {
+			xfs_buf_mark_corrupt(blk->bp);
+			xfs_da_mark_sick(args);
+			return -EFSCORRUPTED;
+		}
+
 		max = nodehdr.count;
 		blk->hashval = be32_to_cpu(btree[max - 1].hashval);
 
@@ -2161,6 +2173,11 @@ xfs_da3_path_shift(
 		blk = &path->blk[level];
 		xfs_da3_node_hdr_from_disk(dp->i_mount, &nodehdr,
 					   blk->bp->b_addr);
+		if (nodehdr.count > args->geo->node_ents) {
+			xfs_buf_mark_corrupt(blk->bp);
+			xfs_da_mark_sick(args);
+			return -EFSCORRUPTED;
+		}
 
 		if (forward && (blk->index < nodehdr.count - 1)) {
 			blk->index++;
@@ -2227,6 +2244,11 @@ xfs_da3_path_shift(
 			blk->magic = XFS_DA_NODE_MAGIC;
 			xfs_da3_node_hdr_from_disk(dp->i_mount, &nodehdr,
 						   bp->b_addr);
+			if (nodehdr.count > args->geo->node_ents) {
+				xfs_buf_mark_corrupt(blk->bp);
+				xfs_da_mark_sick(args);
+				return -EFSCORRUPTED;
+			}
 			btree = nodehdr.btree;
 			blk->hashval = be32_to_cpu(btree[nodehdr.count - 1].hashval);
 			if (forward)
-- 
2.43.7
