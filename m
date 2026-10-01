Received: from mail-lr2-f33.google.com (mail-lr2-f33.google.com [74.125.230.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB8649EC73
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790890701; cv=none; b=j2w76x7csblJmAd4XgdkfAWZcVN7XwNFY8xDQpsDjMzJSAiOY/XO5pDo/ZEKMEaQCXu9KkiAxsF7KYBTakpQ3TiEc5+11GBev60D9JW8BsrRbgHjjyltpoc2PZX6uYcSrckZ53YBow+bpRyCfugtOI8QKNRXioE24FDFD533PFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790890701; c=relaxed/simple;
	bh=QagNpwbrV/3lHIegZKKXXtRTLe/P3B4EikHeCrz8ZMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lY246ejNIcrnSX7entqrbaiZxCWdlk4YWEcSvtJJg7Oo8hgV5dWQzlexmGFhODB/JCmhj+7cIofzCboyM2jZGWA6IJw8hyeTUsYdL0SM8yThxssU/SvhtLPHIuABt5J7bgfM8SUxPgSsiPSS5dvFAFxjzbWaCPLzpZ6oCuw2OAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=noroxi.com; spf=pass smtp.mailfrom=noroxi.com; dkim=pass (2048-bit key) header.d=noroxi.com header.i=@noroxi.com header.b=ovyqk8p3; arc=none smtp.client-ip=74.125.230.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=noroxi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noroxi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noroxi.com header.i=@noroxi.com header.b="ovyqk8p3"
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a7847d8aadso10898881fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=noroxi.com; s=google; t=1790890697; x=1791495497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yd7GoPFhxxD93O/gNmHRUAtlN2EGPVHbasX2vnCwhDk=;
        b=ovyqk8p3GMcJc4u6g7thrPhBQuJJfXXR1/3yi1spQGftKhh7NvpYMoMDVxLTzHjH/S
         2EnUWQ99iMG9l3S5slkQyXJg6bINZKLncISvr/69MuOKR9s9RpSSM0zaUaVnR6XKwiNd
         GxbDvcIzaY5XDjvNzfQStqP6VndmUR4jLpnP/JUW/+em07QnimgedtV8P9W0iqwO8qa+
         rCw/2ugCS7NHHQrvq7jN3Jm7Muepdlpkp9QYkGBISbueAvgPFwOBJAhXeIOPw+NehRhj
         BxCdUPs6+2+2Q5gNm0ehX9nfL58HLK+8CvMoljcvIeUFanffW2P/ZpZ6mIe7u1AuGeHx
         vmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790890697; x=1791495497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yd7GoPFhxxD93O/gNmHRUAtlN2EGPVHbasX2vnCwhDk=;
        b=DpBwAyHHjreeTdh6DaJ2Ik2mEvgwoo2nhDe1zycxECFogiJYn+wy+02zNbZJvVIoeK
         qs0L8H+feClGIZH2mjMiu0wf8GQVkfh3mSLgX31TBH/Lh33TW1JQjbAe3Ks3/hS2aa+O
         RcPeGTVVVhGQ4aju6g5N+F9k6mAyoGnROWoz969O4p9+qePZ67gsAHYyWauwO9970XEc
         achiTypJACDYXDquAgpqTIybgtDei7CUIHImrtS3Of/AhreHOl7xvjSzYeKn5pKgaejL
         6E4uohPudpOF88+NfL8TdaFOUsWZWNnNP1B2SEL+NyCc+UMrWrrSkv9sxfXrWxoiPxcC
         +Qyw==
X-Forwarded-Encrypted: i=1; AKwUvBzAtiXSSZvqMv+BcwWSntS4dg/HkAHYkMdP+8f7neXpqIinRDrg+tQt4tHtw7v4empvLsv2JZg1iId3bDE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJK2znWotsNbVEa7ZDEXFU2Gd+WrTXXtFQdwuSuM+MzC1mjn3Ej
	K6YAVt9MjRUWUyG242Aidqw6qHIskEFWwNucRCCum19ihj1GfNikroNresx/7o2JHY/N
X-Gm-Gg: AYBFou2Q5r/dkoNkJLoEVW9YG2PlrxDwPRgDOVZiOn4iqmyIHcVTbhm3VSUebWNoMyx
	hGAjUVNh6U0Um2KTbjY6sjsJmJi7nwZO4JVYJ4L/qYvE6swkoFS6UkqTI8jg8BNqpKhfoUG7sFS
	GmPKIEc0MDNMq6iBL5M80qNOMchVO42HVa3naZ+uj6Gm+tysYRfc4p3TdVgaSvMCklOjS+jHkJ7
	YgijTZmf4eu1DjGAvJoOupPQXBJCi4ThbR7i+W+8FbRejs5QVJ0NVO+zEGa+oUbYnbDhZkjCkO8
	MI48r4GxxbTUCHamgh7ACn/2HbDAEGuHrM8d7R4OezFxMjo4tWBKXa0V5DWbzq3+vkmNuUQ5Xq2
	4XDVNB8PoqBG2M2UarxrRXbwaAfJL8Eg2RT708jp5b2GKN+3hOESf+JopXlV9AsuJ+DnRLnNEON
	1Mu6Gs6+lbE5egFUw2z0VtThsPXl0duQpJ+LmR0nDIf+anwZuxXveVXnsh+HPUP0dFPFAeVDpcP
	wYseorxhnY=
X-Received: by 2002:a2e:a98e:0:b0:3a7:5f55:5e00 with SMTP id 38308e7fff4ca-3a88767e0eamr1633771fa.9.1790890696379;
        Thu, 01 Oct 2026 14:38:16 -0700 (PDT)
Received: from lab01.. ([2a01:4f9:1a:a462::2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e333cf3sm2294361fa.39.2026.10.01.14.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 14:38:16 -0700 (PDT)
From: Mahmut Emin Kurhan <guvenlik@noroxi.com>
To: linux-fsdevel@vger.kernel.org
Cc: slava@dubeyko.com,
	glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-kernel@vger.kernel.org,
	Mahmut Emin Kurhan <guvenlik@noroxi.com>
Subject: [PATCH v3 1/2] hfsplus: free cached B-tree nodes on hfs_btree_open() error path
Date: Thu,  1 Oct 2026 23:38:06 +0200
Message-ID: <20261001213807.1519745-2-guvenlik@noroxi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001213807.1519745-1-guvenlik@noroxi.com>
References: <0de056179e3e0a7c4ef525cdb143647b7493dc71.camel@dubeyko.com>
 <20261001213807.1519745-1-guvenlik@noroxi.com>
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
hfs_btree_open() error path. The helper keeps the hash_lock serialization
added in commit dce0e0248205 ("hfs/hfsplus: serialize B-tree close against
folio release"); on the open error path the tree has not been published yet,
so the lock is uncontended but harmless.

Found via coverage-guided fuzzing (syzkaller + kmemleak) by Noroxi.

Signed-off-by: Mahmut Emin Kurhan <guvenlik@noroxi.com>
---
 fs/hfsplus/btree.c | 41 +++++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/fs/hfsplus/btree.c b/fs/hfsplus/btree.c
index bd4dbdbc8f..2183828d5d 100644
--- a/fs/hfsplus/btree.c
+++ b/fs/hfsplus/btree.c
@@ -265,6 +265,27 @@ static const char *hfs_btree_name(u32 cnid)
 }
 
 /* Get a reference to a B*Tree and do some initial checks */
+static void hfs_bnode_hash_free(struct hfs_btree *tree)
+{
+	struct hfs_bnode *node;
+	int i;
+
+	for (i = 0; i < NODE_HASH_SIZE; i++) {
+		spin_lock(&tree->hash_lock);
+		while ((node = tree->node_hash[i])) {
+			hfs_bnode_unhash(node);
+			spin_unlock(&tree->hash_lock);
+			if (atomic_read(&node->refcnt))
+				pr_crit("node %d:%d still has %d user(s)!\n",
+					node->tree->cnid, node->this,
+					atomic_read(&node->refcnt));
+			hfs_bnode_free(node);
+			spin_lock(&tree->hash_lock);
+		}
+		spin_unlock(&tree->hash_lock);
+	}
+}
+
 struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id)
 {
 	struct hfs_btree *tree;
@@ -403,6 +424,7 @@ struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id)
 	tree->inode->i_mapping->a_ops = &hfsplus_aops;
 	iput(tree->inode);
  free_tree:
+	hfs_bnode_hash_free(tree);
 	kfree(tree);
 	return NULL;
 }
@@ -410,27 +432,10 @@ struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id)
 /* Release resources used by a btree */
 void hfs_btree_close(struct hfs_btree *tree)
 {
-	struct hfs_bnode *node;
-	int i;
-
 	if (!tree)
 		return;
 
-	for (i = 0; i < NODE_HASH_SIZE; i++) {
-		spin_lock(&tree->hash_lock);
-		while ((node = tree->node_hash[i])) {
-			hfs_bnode_unhash(node);
-			spin_unlock(&tree->hash_lock);
-			if (atomic_read(&node->refcnt))
-				pr_crit("node %d:%d "
-						"still has %d user(s)!\n",
-					node->tree->cnid, node->this,
-					atomic_read(&node->refcnt));
-			hfs_bnode_free(node);
-			spin_lock(&tree->hash_lock);
-		}
-		spin_unlock(&tree->hash_lock);
-	}
+	hfs_bnode_hash_free(tree);
 	iput(tree->inode);
 	kfree(tree);
 }
-- 
2.43.0

