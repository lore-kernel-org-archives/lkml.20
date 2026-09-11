Received: from smtp153-141.sina.com.cn (smtp153-141.sina.com.cn [61.135.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E608F3C4174
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113408; cv=none; b=FgbQc0mPNuODtNCkjV4mEFXJRWxyX7Qn/EuStEqJBaAk4FQoWcpHvA5eX85otXGQb3SIhgjjmaPKoTDE/2p43pB655Toxr2YFrbSKM0j05k23WFCIz40EGre/RlD/4KdEJLDPOtdwFVS4iGeNzdNsVqxY+2Un3AUHKRX50qo6yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113408; c=relaxed/simple;
	bh=1kO5v6pum/Xofy7nh/yA+kWIHZRi/oyS7Lo8Xpua68w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FK1uZJgQWximLFZh0gOxxi9JqmfmhANSb/ibB+JkUxHYD96hxlNrdq/c8PRYnl8/avITLY5yujFavFl2YCBIreBsUMjaHiyMnbSe20mjjMiexBVH/IJJwlCUvzx8yflcFB8ziqB+NXV81BQ2/9pISZBr0QrkzLhtstLZBRZY3DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=0O4o0Mbc; arc=none smtp.client-ip=61.135.153.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="0O4o0Mbc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789113401;
	bh=pXNzrZ6nVZI8zG++63+WyCyZ8muprY/4JU64d3K8qRg=;
	h=From:Subject:Date:Message-ID;
	b=0O4o0MbcWsrrcvdxuZmQHTZYq34Md+wdqj0l97QTSLsrxx296CszDhZOBZNrl4tF5
	 AlUHvdfgbGGNMVMcU5dsG+Y56heprnJemZkA38jQUV44MmB8ETk4tDd8+36RIAA3md
	 mh+VpE7oSV2yDz3FiLMnFT06HG8HfbS/SFBxbUVs=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.31) with ESMTP
	id 6AA3B40E00001264; Fri, 11 Sep 2026 15:56:01 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 719346815919
X-SMAIL-UIID: 82D125B4C73E4C4C8B8B56185D201A21-20260911-155601-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+743079a09058321247d8@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [jffs2?] possible deadlock in jffs2_do_clear_inode (2)
Date: Fri, 11 Sep 2026 15:55:58 +0800
Message-ID: <20260911075558.849153-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6aa351f4.6e6c5f9e.28f11f.003b.GAE@google.com>
References: <6aa351f4.6e6c5f9e.28f11f.003b.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: upstream 50d05c7c76c9

diff --git a/fs/jffs2/malloc.c b/fs/jffs2/malloc.c
index 411de8b361b2..1ce17e265159 100644
--- a/fs/jffs2/malloc.c
+++ b/fs/jffs2/malloc.c
@@ -246,7 +246,11 @@ void jffs2_free_node_frag(struct jffs2_node_frag *x)
 struct jffs2_inode_cache *jffs2_alloc_inode_cache(void)
 {
 	struct jffs2_inode_cache *ret;
+	unsigned int nofs_flag;
+
+	nofs_flag = memalloc_nofs_save();
 	ret = kmem_cache_alloc(inode_cache_slab, GFP_KERNEL);
+	memalloc_nofs_restore(nofs_flag);
 	dbg_memalloc("%p\n", ret);
 	return ret;
 }
