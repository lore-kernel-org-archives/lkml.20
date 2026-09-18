Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38223A6417
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736973; cv=none; b=fsevzsDO5XtZCfg4JwASEoA9S5GDPDPLpRqn8PyGNs5e/8be48e48Vhn/FD6v4GV/tqzgZxntfiDJsYpQpl1PwHGu39XzzzPYbSDVXOBOsmiAU//C6Ev30KcxMg5HcHlraFjrY4rxDsx9CnvOa/3Nd4b5axxq+WWuAvEprUsde0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736973; c=relaxed/simple;
	bh=y6DmwY2NNPgvI5dt5D40qWsbuLNJ4qNAgz6w9YhiC+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AN41R3cXVgAA+5HfytOtb7At2sg2lyTAiwqNUeSBPzjU9a1WrcG8wAIN+skQqU0gbARvZyRxmxVP3+X4cZQ29k0YuIvBA85wE9lgi2Oq3AArBQLlalJI0luyBYCDJlA4s3WkTBhHteN9CmiB1HqXYya44vvknaJHbhzb5zvs294=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=azWJSIph; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="azWJSIph"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48434392b02so526294f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1789736962; x=1790341762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ALGqgWpfi/Okg/wnkXal9Ie5Tl89DL6PBwvjP4sq+Ek=;
        b=azWJSIphmak9h/D1OAMcEOLZ17NoRoUnPB9wbYNMs3uy4PQiCEBwlNRm2rsoVsyfRS
         peRXbdKqfyvpjiJG1H14TF6xJZQ5qqm46ioqBRmJJEKe8GMDPfNQVqy9G9LQjEu3mds0
         /XdjWnjUSdYoJJS61IPjFQHGa5jseeNI5QOdPLyH+BXKHAHDSplNMZK2owkU1lsKWWU4
         eTwy7iLZSEsJfjd4RNKGluV7viNXOsB6mFGQ6jYGJ9MaAUG4OpVRrpUjH96TArdbhyFQ
         cYpxIA6RqK1CV5Ruz1SsmOOeQ9+eoNzxZ8uyWrPM+juBZSEAt41wxFy3tsGStPz6VX3e
         NgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789736962; x=1790341762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALGqgWpfi/Okg/wnkXal9Ie5Tl89DL6PBwvjP4sq+Ek=;
        b=ujsBE7vYrXDljH17hU8hkV9xpMgmrISJxlClLejyvOctvVcZAdvNOFudKKzd+0fDW2
         hCSBgl+RiXTYHARnVoHZj19cPBSuPY29SUgyE1qK1lQA6j4VoWY4RKGx8Qy4/F2oCpAC
         8/faehrJOk5UZps68cvS3wMgtt9AljlXfDWeHzAKMyQ9hxLEGHYtuP87F0x+az2JbniD
         QIJ8H7vJGIgNPs/ZmMofDbGfgyZAExCmh9TnbWRcFdR6bQrXs8G/A3V82nT5iZg/h7K/
         3IsLkmJj31JkUwAto9OlvFIZIBP4uy0KSc3XL0Alg7Dpef6VC2TU4t5ijo8f+CdX9yBe
         rWJg==
X-Forwarded-Encrypted: i=1; AKwUvBwEsaXN9dRwKjF4m0vjfDpZ2CKNjNv4bLKLGd3K9PAiSxyCgSITi8WWD8HjNjYNv3Rb842ZXLWRKzG3FlM=@vger.kernel.org
X-Gm-Message-State: AFuF++mrx6wPtHj/FHo/d/6CZECgARESVEMv8yseT/U9/5ZKkdiw5Lg/
	SsaBpKLrNW875MD2xfXyJB03z36uOIthePefctP5CAa1Chzw2Bz/yYSqz9XVUhgHn1jdcO81iH4
	DoMWT6R0=
X-Gm-Gg: AYBFou3Xr+MD9o9vYFASvXdQ02UsMB821UoRw9tnpAiMZEz7wIyJLy1MW5pk7BYWDBl
	FZVOfGXUiv7cFXbh3VytJHu9wpsKdVcFqN0EWG/7uOvRPGqgiTAiYcOWKX/48UkoHWgiJVXOEy3
	C9VwOVYmhvW0rF8tN0TDQa3AvxzI6MCs6MHFFOJEOVAnnYjS3enTqoC26hsBAXBN49pvKVvFCom
	duFVm8xWD/2aAA38ZYuCKmTOlWAbecekkRpWoR2QyKZ58S+z3H2JrVD3NOkfNwlzDuAja6uU0AZ
	t4KHp/i7F+pVjMPZTWNIim4rc3vwF9IWQPXsKir/oEbUFtOb3hj+lJp7ne+sGUTYyjgDEq5NVgb
	NM/khzCl6YLH54H/Oz5kUtTYdPUzIz7iYo4okj04sEz7aIIoZ3dY+dtCSeYGZpOJeH8QkhtOHWS
	fkecdIhqRShgvGmD5sOlaYpnBvaxFRyXzYaNUlPIVZVb7pAJw6z8ltsN9uhw+NQ0wVbG1iJUw/w
	ThtEw==
X-Received: by 2002:a05:6000:4021:b0:484:3314:eff6 with SMTP id ffacd0b85a97d-4871e3941f5mr6238328f8f.28.1789736962162;
        Fri, 18 Sep 2026 06:09:22 -0700 (PDT)
Received: from localhost ([2001:1620:544:1:9163:2f88:bd77:993])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4871ff55663sm3862924f8f.17.2026.09.18.06.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 06:09:21 -0700 (PDT)
From: Bruno Produit <bruno.produit@trailofbits.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>
Cc: Kyle Zeng <kylebot@openai.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dominik Czarnota <dominik.czarnota@trailofbits.com>,
	syzbot+d729df28d933979e017a@syzkaller.appspotmail.com,
	syzbot+2eac7d175baf21e6a5d5@syzkaller.appspotmail.com,
	syzbot+7155b2fe09e033c91381@syzkaller.appspotmail.com,
	syzbot+adeb387cede15eb11607@syzkaller.appspotmail.com,
	syzbot+ae7f2423f3648100506d@syzkaller.appspotmail.com,
	Bruno Produit <bruno.produit@trailofbits.com>
Subject: [PATCH] hfs/hfsplus: serialize B-tree close against folio release
Date: Fri, 18 Sep 2026 15:08:53 +0200
Message-ID: <20260918130853.216497-1-bruno.produit@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kyle Zeng <kylebot@openai.com>

From: Kyle Zeng <kylebot@openai.com>

B-tree nodes with a zero reference count remain in the node hash until
folio reclaim or tree teardown frees them.  The folio release callbacks
remove nodes while holding hash_lock, but hfs_btree_close() walks and
frees the same hash without that lock.  Reclaim can therefore unhash and
free a node after close has loaded its pointer, causing a use-after-free
or double-free.

Detach each node with hfs_bnode_unhash() while holding hash_lock before
inspecting and freeing it.  Drop the lock before hfs_bnode_free() so a
large tree is not freed while holding a spinlock.  Apply the same fix to
the matching HFS+ implementation.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+d729df28d933979e017a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d729df28d933979e017a
Reported-by: syzbot+2eac7d175baf21e6a5d5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2eac7d175baf21e6a5d5
Reported-by: syzbot+7155b2fe09e033c91381@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7155b2fe09e033c91381
Reported-by: syzbot+adeb387cede15eb11607@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=adeb387cede15eb11607
Reported-by: syzbot+ae7f2423f3648100506d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ae7f2423f3648100506d
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Kyle Zeng <kylebot@openai.com>
Signed-off-by: Bruno Produit <bruno.produit@trailofbits.com>
---
 fs/hfs/btree.c     | 11 ++++++++---
 fs/hfsplus/btree.c | 11 ++++++++---
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/fs/hfs/btree.c b/fs/hfs/btree.c
index 41b4e8fc9..d85a1df9f 100644
--- a/fs/hfs/btree.c
+++ b/fs/hfs/btree.c
@@ -310,14 +310,19 @@ void hfs_btree_close(struct hfs_btree *tree)
 		return;
 
 	for (i = 0; i < NODE_HASH_SIZE; i++) {
-		while ((node = tree->node_hash[i])) {
-			tree->node_hash[i] = node->next_hash;
+		for (;;) {
+			spin_lock(&tree->hash_lock);
+			node = tree->node_hash[i];
+			if (node)
+				hfs_bnode_unhash(node);
+			spin_unlock(&tree->hash_lock);
+			if (!node)
+				break;
 			if (atomic_read(&node->refcnt))
 				pr_err("node %d:%d still has %d user(s)!\n",
 				       node->tree->cnid, node->this,
 				       atomic_read(&node->refcnt));
 			hfs_bnode_free(node);
-			tree->node_hash_cnt--;
 		}
 	}
 	iput(tree->inode);
diff --git a/fs/hfsplus/btree.c b/fs/hfsplus/btree.c
index 2ea8cd565..a90c9f416 100644
--- a/fs/hfsplus/btree.c
+++ b/fs/hfsplus/btree.c
@@ -417,15 +417,20 @@ void hfs_btree_close(struct hfs_btree *tree)
 		return;
 
 	for (i = 0; i < NODE_HASH_SIZE; i++) {
-		while ((node = tree->node_hash[i])) {
-			tree->node_hash[i] = node->next_hash;
+		for (;;) {
+			spin_lock(&tree->hash_lock);
+			node = tree->node_hash[i];
+			if (node)
+				hfs_bnode_unhash(node);
+			spin_unlock(&tree->hash_lock);
+			if (!node)
+				break;
 			if (atomic_read(&node->refcnt))
 				pr_crit("node %d:%d "
 						"still has %d user(s)!\n",
 					node->tree->cnid, node->this,
 					atomic_read(&node->refcnt));
 			hfs_bnode_free(node);
-			tree->node_hash_cnt--;
 		}
 	}
 	iput(tree->inode);
