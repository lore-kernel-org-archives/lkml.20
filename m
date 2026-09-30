Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1BE49A3C3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790810650; cv=none; b=H8UYTHeyDgRsOgtcoDHZ1M2S45Z6whIswCFiVA1Sju5+Sm1hHBW1raf7X8eIv9UGkExnndtJ4EOG0MkWXL86OO2UlUExFLZKrWhzrwDgrWrmDIj0yfOwMERVngUDf3cUTPZLXeTPXHzADPdZBsVSKQIXwsMxe3gW7AKsrGsb/Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790810650; c=relaxed/simple;
	bh=BlsXZI6hBuJoZssYWqE3/aU74sAG0IWl3+di5nW8rBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XIvTtv+jp32zZ3Aa+siX0u6OXjomYVWGGTVvLtTy7St1T4cgpZ8loT221dsfAFX15xzPymzWH8rJnyHC5LcRqp8yjL1cu3nZzGWT3Kw+gDO31gc9ZgRz6vsVNuRX0eVFaXcPTw4jkGheCVvhNoFKMVjBVTwkAUwvbGoYz7orCtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noroxi.com; spf=pass smtp.mailfrom=noroxi.com; dkim=pass (2048-bit key) header.d=noroxi.com header.i=@noroxi.com header.b=kv12k8mO; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noroxi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noroxi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noroxi.com header.i=@noroxi.com header.b="kv12k8mO"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3add810eso1486458e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=noroxi.com; s=google; t=1790810644; x=1791415444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CRhw0Id6strr6ueBVzXyHWWSKhLWhS5obNSqyYPwwPY=;
        b=kv12k8mOjYwf1jKXpz5SEfwF6Uhy6b1ijxykLpaEUjLRfSKc79CK0IMo5vBAb8APA0
         SxvS4+8b7NrQftQBZrh1cbikkWoiE2JdMiR2oma/TC8aG0X5ir9Cc58V36dqomPZRJ0a
         ugKDdJq4HWANNB3Bhqqe8pGOeuaWm0KIBSCdrFaiucknT5kYXlZQYX8YWDhYdcAYD4AI
         rsKTLEURVfzE6EGR7tJ2o+DmunoyMPZXDfGQ4HX7vU/NGqMIX+cQcx69k97NkJGKna64
         8Uahj0W7ydPiYv52IgtxM4mRTLss/ogyT4fLQY/WSxD+CDdlY/bOY7nJmAs9SnZGRCu6
         SZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790810644; x=1791415444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CRhw0Id6strr6ueBVzXyHWWSKhLWhS5obNSqyYPwwPY=;
        b=OGNApdhZM5n9P0r5mI1YYshT7J81FFZrvr/Deopy+WkwmgyOC7oCgcv5jON6XOsv7A
         u79DC0Y0HSm1ip7ViYn0jqWLr87ciDQgVHPeemuIEH4UfIP3w/hONLZcixP9pptEFm6e
         Ph95BxbeTNDpJO4JilQhgo+wumgn8yKtIdtiDROgnMfRa7C/3m8icBh01p5/VAtbOeQH
         z2J9HkrGejgszkjf91MwBgq820rGEAqRw5t4WFSCC2o7Kwcx0FYwBnes4C/cLNR8iSKu
         0L20dr50FTSFr8xIFeS2eWBKKKLeUMp2m5mU+8D2CsQh3C48XZ7iXC3HBA/4QTHogfXI
         lneg==
X-Forwarded-Encrypted: i=1; AKwUvBzokidaAq3Z1csz8+p4QJczHCC6LcJLqPhKDlGgJL3eViyR1qQSi83YX3RFSH/eDcRzDaBSfhnTFLbt1Tc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeeKFBUowaMp2kU90Ahv8F9SlLSSOu58z/IW0IuI6SvI1SYugG
	XmV2wkDXObzdYVZ9huVQwUoKFO0hyZ1rR0AxM+0oj5q6E8ePvXL2n3FuP7LPd3f7Q7YA
X-Gm-Gg: AYBFou2j+NvtS2n1cOXLr+IqIEhhz96oakCACmzjFmU2mYm4AwSaB5+7ZGAF6XSsdyS
	Q2I4y0phY1hkmMceDYiNX70SqUjjcQsOcuowJHkj/nxuMPlfBQzWP70neAsLLUgJrvljWPr/Pz9
	LJ5pLaa0M47DKxbhSagDj5NHXqryW2tX3OcKjeD2GkEkQD6m0Vy8xhqNGnak0T9hw5Qq921y2wr
	6vStJbNZ/mtdxLvc3c0N3Y7WQJ8UpCFAgkQvlTpAQLVBh8lGBmdWQxvGp38U25US6x+KMmNoima
	qt247u1/+MQxrZAG/6jwrvOVzlASK2dhwXLH8KTgp73JnEpKoGCyfnB6WRvlT1bP47dMRs2GFds
	B1TzZYUbmOSnTe2PWbLZ/yTYZSPo3D5Z/OLOn3jaLCt8oSXLPckRMadnwJNo+1Sbdr6OfIZ3eYy
	3Ns8wzLED8oOqlZSK/b5gWFNaUogxqbg3/z1b8SCs+PF3Z/peuBfjKyx4aNOM1PZle8sTNexrH
X-Received: by 2002:a05:6512:15a7:b0:5b8:edc5:c9f4 with SMTP id 2adb3069b0e04-5ba403e92b7mr1163263e87.13.1790810643443;
        Wed, 30 Sep 2026 16:24:03 -0700 (PDT)
Received: from lab01.. ([2a01:4f9:1a:a462::2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fc8023sm279117e87.81.2026.09.30.16.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:24:03 -0700 (PDT)
From: Mahmut Emin Kurhan <guvenlik@noroxi.com>
To: linux-fsdevel@vger.kernel.org
Cc: slava@dubeyko.com,
	glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-kernel@vger.kernel.org,
	Mahmut Emin Kurhan <guvenlik@noroxi.com>
Subject: [PATCH v2 1/2] hfsplus: free cached B-tree nodes on hfs_btree_open() error path
Date: Thu,  1 Oct 2026 01:23:11 +0200
Message-ID: <20260930232312.1405042-2-guvenlik@noroxi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930232312.1405042-1-guvenlik@noroxi.com>
References: <ea8cfa5978a90d27e498fae626edfdae5bf84af7.camel@dubeyko.com>
 <20260930232312.1405042-1-guvenlik@noroxi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hfs_btree_open() can fail after hfs_bnode_find(tree, HFSPLUS_TREE_HEAD) has
already inserted the head node into tree->node_hash.

__hfs_bnode_create() inserts the new bnode into tree->node_hash before it
reads the node pages; if a page read fails it sets HFS_BNODE_ERROR and
returns the node still hashed. hfs_bnode_find() then takes its node_error
path and calls hfs_bnode_put(), which only frees a node once its refcount
reaches zero *and* HFS_BNODE_DELETED is set. For the errored head node that
flag is not set, so it stays in tree->node_hash with a zero refcount.

hfs_btree_open() then sees IS_ERR(node) and jumps to free_tree:, doing a
bare kfree(tree). Only hfs_btree_close() walks tree->node_hash[] and frees
the cached nodes, so the head node is leaked. Mounting a crafted HFS+ image
whose head B-tree node fails to read leaks kernel memory on every attempt.

Factor the node-hash freeing out of hfs_btree_close() into a small helper
hfs_bnode_hash_free() and call it from both hfs_btree_close() and the
hfs_btree_open() error path. No hash_lock is taken because the tree is not
published yet, so no other thread can reach it.

Found via coverage-guided fuzzing (syzkaller + kmemleak) by Noroxi.

Signed-off-by: Mahmut Emin Kurhan <guvenlik@noroxi.com>
---
 fs/hfsplus/btree.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/fs/hfsplus/btree.c b/fs/hfsplus/btree.c
index 2ea8cd565..41e01380d 100644
--- a/fs/hfsplus/btree.c
+++ b/fs/hfsplus/btree.c
@@ -265,6 +265,24 @@ static const char *hfs_btree_name(u32 cnid)
 }
 
 /* Get a reference to a B*Tree and do some initial checks */
+static void hfs_bnode_hash_free(struct hfs_btree *tree)
+{
+	struct hfs_bnode *node;
+	int i;
+
+	for (i = 0; i < NODE_HASH_SIZE; i++) {
+		while ((node = tree->node_hash[i])) {
+			tree->node_hash[i] = node->next_hash;
+			if (atomic_read(&node->refcnt))
+				pr_crit("node %d:%d still has %d user(s)!\n",
+					node->tree->cnid, node->this,
+					atomic_read(&node->refcnt));
+			hfs_bnode_free(node);
+			tree->node_hash_cnt--;
+		}
+	}
+}
+
 struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id)
 {
 	struct hfs_btree *tree;
@@ -403,6 +421,7 @@ struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id)
 	tree->inode->i_mapping->a_ops = &hfsplus_aops;
 	iput(tree->inode);
  free_tree:
+	hfs_bnode_hash_free(tree);
 	kfree(tree);
 	return NULL;
 }
@@ -410,24 +429,10 @@ struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id)
 /* Release resources used by a btree */
 void hfs_btree_close(struct hfs_btree *tree)
 {
-	struct hfs_bnode *node;
-	int i;
-
 	if (!tree)
 		return;
 
-	for (i = 0; i < NODE_HASH_SIZE; i++) {
-		while ((node = tree->node_hash[i])) {
-			tree->node_hash[i] = node->next_hash;
-			if (atomic_read(&node->refcnt))
-				pr_crit("node %d:%d "
-						"still has %d user(s)!\n",
-					node->tree->cnid, node->this,
-					atomic_read(&node->refcnt));
-			hfs_bnode_free(node);
-			tree->node_hash_cnt--;
-		}
-	}
+	hfs_bnode_hash_free(tree);
 	iput(tree->inode);
 	kfree(tree);
 }
-- 
2.43.0

