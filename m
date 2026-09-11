Received: from mail3-164.sinamail.sina.com.cn (mail3-164.sinamail.sina.com.cn [202.108.3.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2AB343896
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789095860; cv=none; b=U9shZudS0SJt4ami4/ZuoQ7Yp0tH6J3PoWr5/7Xz0yzP1a5XFbq8iBKuFmNStaXq5citWbWtvQXwk8+qAfVpcaT8nloOoxYE4EiihmAtYvXkqKcn0aOmPreHNgPSD8JLjH5uqtd1DTNcTsj+5Mp/BquMZ3PhCbUE6KDJzKtEDPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789095860; c=relaxed/simple;
	bh=eCfjBVEQtPPpfw0htPVBcZCb4fdWC6TJNogSKdrtEt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TuYZJ6J5kDSr2MjmvUbzLnVw3RXc/cZq7/Z7nwzz5g2ecCCiSOKXWUxi8irU6vJiKSKc9IUn9sk/5PHEzNCT3BZ1LskTQDQcLs3Gc78Y9U48zudQCI+BO6H34+dJ3JqBF23UEuFa02dKWB2VZZBTV/mW+xxieGTTn26NYDX0wdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=EVOjX0rb; arc=none smtp.client-ip=202.108.3.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="EVOjX0rb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789095855;
	bh=/CprAlL+w4oiXHozyvccOxdLvBR0EDHKid99kNKLgXQ=;
	h=From:Subject:Date:Message-ID;
	b=EVOjX0rbD2p46/chDVcsMlHV58S/o21XnzhTgHp/fjHkZ9I91YpQO6cEmXLrBUZ9F
	 zj6FAxze3uSL+m4bPaUA8nh/WM+gwku4Hg4DYsmixVuCW9oL9FX7JFngfzCS2xlQmb
	 BrMRoXCLODpZEvtFGuhYjOnPT3Fl2A9cqvsijsZQ=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6AA36F7D0000329E; Fri, 11 Sep 2026 11:03:28 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 5322774456996
X-SMAIL-UIID: 07646EF33AEB4258A554F15A7D7363BB-20260911-110328-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+743079a09058321247d8@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [jffs2?] possible deadlock in jffs2_do_clear_inode (2)
Date: Fri, 11 Sep 2026 11:03:25 +0800
Message-ID: <20260911030325.842624-1-eadavis@sina.com>
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
index 411de8b361b2..f8c642d6c205 100644
--- a/fs/jffs2/malloc.c
+++ b/fs/jffs2/malloc.c
@@ -246,7 +246,7 @@ void jffs2_free_node_frag(struct jffs2_node_frag *x)
 struct jffs2_inode_cache *jffs2_alloc_inode_cache(void)
 {
 	struct jffs2_inode_cache *ret;
-	ret = kmem_cache_alloc(inode_cache_slab, GFP_KERNEL);
+	ret = kmem_cache_alloc(inode_cache_slab, GFP_NOFS);
 	dbg_memalloc("%p\n", ret);
 	return ret;
 }
