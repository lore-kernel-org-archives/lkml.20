Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481295;
	b=DI36B+cBLha9jhXvwsdJoFyHDCILLibNpVhZdlec7N/Gr64/SM507w8Gz4pnVASzpJFU
	 gMbjtEOYrJyFUr2IMT7xSYCe8rpgshy17yDQkUKUatRLBk6Pq9DnAsViVI6tfu8HVBzK7
	 N4VnmHhkmKyjgfAEXK7+yiWY7C6u1tz90ckMMQDNfRL3B6Kb6Az1Zj6Lu/DOKaWaoZpmM
	 1WPiOQXRct7CADmcthXUTL+w8ygcrOvRjuZL5Rv222X7gKtMLJ/htEAp/9m5fbwraKbWI
	 BlKQyySufvVz/83HNNa/twbJQBG8WjeFaQ6rMmyeAAcIk7qw4Ocrm1Yj5FIAvfi2qaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4QtU2D3t8aWMM13jDUXqs9aRRvbXvgwoFl5ieOtnMZM=;
	b=wtP5MDFzA/SETgiaKvxPFwwoCYp+bfQyE1FsNPUzKfPYpbhsP+AOCz2sKuQSnzH6dQIU
	 52vxsWtwhIpbCOmI4LlVVJClEoBAwATPA05GxSyRdK5+n9fZVCvxvppxvYhpCWMc9I2Bb
	 q/Eq9oOhrxkOSvWQid3Go8XT2RaJNC+UBfvWsBZ/pq9pdVjB81CqIIP4xtAB9g+Q5Rzo6
	 XAn0J8g7/ZumbOe8ELf6GPt3T0Pyc+QAeAZsOL3o0Cy9hDItiaoPO2joQBVwQ4WOvy1+O
	 wEh4YP0HPyMU3LNLylDFYY6v+oy0QGdjkJRU53vWVg+S8n4oCgAoCq2o0CliLSLpkhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=nAE0xixJ;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0F6606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B0F6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=nAE0xixJ
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5ec3561b07dso504550e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1794481293; x=1795086093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4QtU2D3t8aWMM13jDUXqs9aRRvbXvgwoFl5ieOtnMZM=;
        b=nAE0xixJG6JEoP3n+NFXIgKJ02qs6r5IzuoQyfb/0k5RO4gVrATlNN2V3FX5EHbUnm
         uqy2XhWel3K4APu5z3VKq52O15JZunyHv2YbZLQZ/+QNYXbz9tvhjRKfy1ZKkuUk8SPD
         Vk4iFzX1CVRZkHDsj9axKQ20sWA9ysBhq6bAWYYE7UvAOJp8MrgAGILRRXdswHJqW129
         SQWGe5cL9/uyRl1Dv/UKy4tHbHj5Y65oxYY67ZtqvoL6lMGdtSIfAAaeDn2hCiybc454
         uk7CjBX6m296u2t/mBOz6QHXX/q/5XA4AaSVB9PesglNvmo675ndXnstpRHc/l1HmEg1
         UGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481293; x=1795086093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4QtU2D3t8aWMM13jDUXqs9aRRvbXvgwoFl5ieOtnMZM=;
        b=EfqZI9H0f9DTYJqnHxUwZTymbDgKBJnticGVvJb8C/r4At/vtdA5RwoKuPH+WyTAKz
         20Pw4JI4idsxz6dXZ1vyxldvVCBIlSodQQv5ePCPRJvJBPPMefZBVAkR5FKuoEkLTq5M
         rlbzxiPcpIEdxIHAC/wrKvClRmHFM+jIp6XlgJFbeKA3h9B4NbTcdJ2dixOfzc6Og7Dl
         Ta2/RG10nU5f5wT98p/yCviBvLWb3yCG+HgRPxJUOFimt+7sctZg1L2FaEVpEmYcaHHS
         ct8sUjeMVwxqmvBtqB21zK6cq61svAeA/NA/exMdRxsowX+q6ymxIvF/ugErqjCZ/BG2
         jA7w==
X-Forwarded-Encrypted: i=1; AL+hErHbekuswYFnfX/j+rUN5Y9h88HFRzXUjK8cWZdocTQI8dYRqyED9+iPmvwvYYIjSnncnRcfkxlv6GA0Two=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gyGsx+IBugzyGiJkYyHOtC2ddSipluzUBxbng00+tSl2XBsaT
	wg4ihnBEKhkvIbmWOv+J4dykAZW7Jfk3REhE13+fG54soRaNZgTI9Bh0pQc1EwYz6w==
X-Gm-Gg: AYBFou2cFxzKE73VreaLCL4w77uTQPo6b3TA+uFrLX0n+ZLJNbwy2CPzeyhXA9NYTGE
	L23GhoVJvk2eF0WhBY39rdJhQcFHqUoQ4QyIupXpNJbi5KaHktVubEfg/3o5TQbg7GRUkVY+Zcx
	O393Bhjb60+Tm2P9zzD7CCCdzNVJh36M92FsPXOxG5PVIsyUi+8oXIfeCPlnriVjPmd/ZKTkjSw
	cOizCCddDhIWb3x86REHJF7CvqZoKjoGrGIV/rS+45JmATt+Wl2inK78xHZ8WQmzP2wQr8N34nU
	Ru4u6i6SJRIh8uE/vd5v5U0npaiTt4PZH8dDOmCqFliO9VGCrBWCJIa9MOaW/0YOsfYFGVov7mt
	/0cs6fxbUqitbd9H6LVF2DlvEJnAAqGoT+4zJSQdoIf30iqgjUCXc33fL7ptvFTZqhLD6nYQFeQ
	RAqMedPsEHycOq1PR6eFaS+/W8uy1FA0xxFxHGnkms1sppSqhAUY4i+qFmXWHu/OqOwb26j406b
	EOaISV9FGj/MeGsJV1TrY/iX4qEc0Hx9gSFWwElJU1+XPeyw+ZERYPKKxDEA4Rk4kTKdzYLHA4y
	3FFT12dzVa7+RnRe6lRjQ2LAFDru7qrdM9F5e7dHvcQ00rchBMo5
X-Received: by 2002:ac5:c88b:0:b0:5ea:d2d7:37e4 with SMTP id 71dfb90a1353d-5ee273f122bmr429950e0c.5.1794481293107;
        Thu, 12 Nov 2026 03:01:33 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f0199c40fsm46510476d6.41.2026.11.12.03.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:01:32 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: slava@dubeyko.com
Cc: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] hfs: avoid reusing occupied CNIDs after deletion
Date: Thu, 12 Nov 2026 06:01:28 -0500
Message-ID: <20261112110128.4082071-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
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

Commit a06ec283e125 ("hfs: add logic of correcting a next unused CNID")
made hfs_correct_next_unused_CNID() lower the next CNID after the
newest file or directory is deleted. It takes the CNID of the last
file or directory record in the catalog as the largest CNID in use.

However, catalog records are sorted by parent ID and name, not by
CNID, so the next CNID can be one that is still in use. As of now,
creating a file after deleting the newest one can fail with EEXIST.
Commit 6592287869bf ("hfs: fix incorrect inode ID assignment in
hfs_new_inode()") exposed this issue.

The issue can be reproduced on a freshly formatted HFS volume with:

    mkdir z
    touch a b
    rm b
    touch c

Without this change, the result is:

    touch: cannot touch 'c': File exists

With it, c is created.

Keep the largest CNID of the records in and below each catalog node
in memory, in leaf nodes and in index nodes, so that the root node
gives the largest CNID in use. Adding a record raises it in the nodes
above, and removing the record with the largest CNID makes them
compute it again.

Fixes: a06ec283e125 ("hfs: add logic of correcting a next unused CNID")
Cc: stable@vger.kernel.org
Suggested-by: Viacheslav Dubeyko <slava@dubeyko.com>
Assisted-by: LLM
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Changes in v2:
- Keep the largest CNID in memory in every catalog node, leaf and
  index, as Viacheslav Dubeyko suggested. v1 walked the leaf nodes.
- Rebase on hfs for-next.
- v1: https://lore.kernel.org/r/20261015110114.1649059-1-hengyul@cs.unc.edu

Tested in KVM with KASAN on 34ee5f8c2198, without and with this patch.
All fstests on HFS: 24 failures without the patch, 20 with it, no new
failures. Deleting 8000 files:

                                unpatched   patched
    newest first                11 s        0.36 s
    odd ones, then even ones
    newest first                3.8 s       0.19 s

Creating the files (0.54 s and 0.55 s) and deleting them oldest first
(0.37 s and 0.38 s) take about the same time.

 fs/hfs/brec.c    | 172 +++++++++++++++++++++++++++++++++++++++++++++++
 fs/hfs/btree.h   |   5 ++
 fs/hfs/catalog.c |  96 +++-----------------------
 3 files changed, 186 insertions(+), 87 deletions(-)

diff --git a/fs/hfs/brec.c b/fs/hfs/brec.c
index 1ca1ee9f73ef..318bbee43529 100644
--- a/fs/hfs/brec.c
+++ b/fs/hfs/brec.c
@@ -62,6 +62,174 @@ u16 hfs_brec_keylen(struct hfs_bnode *node, u16 rec)
 	return retval;
 }
 
+/* Get the CNID of a file or directory record of the catalog tree */
+static u32 hfs_brec_cnid(struct hfs_bnode *node, u32 off)
+{
+	__be32 cnid;
+
+	switch (hfs_bnode_read_u8(node, off)) {
+	case HFS_CDR_DIR:
+		off += offsetof(struct hfs_cat_dir, DirID);
+		break;
+	case HFS_CDR_FIL:
+		off += offsetof(struct hfs_cat_file, FlNum);
+		break;
+	default:
+		return 0;
+	}
+	hfs_bnode_read(node, &cnid, off, sizeof(cnid));
+	return be32_to_cpu(cnid);
+}
+
+/* Forget max_cnid of all nodes of the tree */
+static void hfs_btree_drop_max_cnid(struct hfs_btree *tree)
+{
+	struct hfs_bnode *node;
+	int i;
+
+	spin_lock(&tree->hash_lock);
+	for (i = 0; i < NODE_HASH_SIZE; i++) {
+		for (node = tree->node_hash[i]; node; node = node->next_hash)
+			clear_bit(HFS_BNODE_MAX_CNID, &node->flags);
+	}
+	spin_unlock(&tree->hash_lock);
+}
+
+/*
+ * The record at @off has been added to the catalog leaf @node, or is about
+ * to be removed from it. Update max_cnid of the node and of its parents:
+ * a new CNID can only raise it, and after the largest CNID is gone it has
+ * to be computed again.
+ */
+static void hfs_brec_update_max_cnid(struct hfs_bnode *node, u32 off,
+				     bool insert)
+{
+	struct hfs_btree *tree = node->tree;
+	u32 nidx = node->this;
+	u32 cnid;
+	bool done;
+
+	if (tree->cnid != HFS_CAT_CNID || node->type != HFS_NODE_LEAF)
+		return;
+	cnid = hfs_brec_cnid(node, off);
+	if (!cnid)
+		return;
+
+	for (;;) {
+		node = hfs_bnode_find(tree, nidx);
+		if (IS_ERR(node))
+			break;
+
+		done = nidx == tree->root;
+		if (test_bit(HFS_BNODE_MAX_CNID, &node->flags)) {
+			if (insert && node->max_cnid < cnid)
+				node->max_cnid = cnid;
+			else if (!insert && node->max_cnid <= cnid)
+				clear_bit(HFS_BNODE_MAX_CNID, &node->flags);
+			else
+				done = true;	/* the parents do not change */
+		}
+		nidx = node->parent;
+		hfs_bnode_put(node);
+
+		if (done)
+			return;
+		if (!nidx)
+			break;
+	}
+
+	/* a parent could not be reached */
+	hfs_btree_drop_max_cnid(tree);
+}
+
+/*
+ * Compute max_cnid of a catalog node: the largest CNID of the file and
+ * directory records of a leaf node, or the largest max_cnid of the children
+ * of an index node. If a child has no max_cnid yet, return the number of
+ * that child in @child instead.
+ */
+static int hfs_brec_calc_max_cnid(struct hfs_bnode *node, u32 *child)
+{
+	struct hfs_bnode *cnode;
+	u32 max_cnid = 0;
+	u16 off, len, keylen;
+	__be32 data;
+	int i;
+
+	for (i = 0; i < node->num_recs; i++) {
+		len = hfs_brec_lenoff(node, i, &off);
+		keylen = hfs_brec_keylen(node, i);
+		if (!keylen || keylen + sizeof(data) > len)
+			return -EIO;
+		off += keylen;
+
+		if (node->type == HFS_NODE_LEAF) {
+			max_cnid = max(max_cnid, hfs_brec_cnid(node, off));
+			continue;
+		}
+
+		hfs_bnode_read(node, &data, off, sizeof(data));
+		cnode = hfs_bnode_find(node->tree, be32_to_cpu(data));
+		if (IS_ERR(cnode))
+			return PTR_ERR(cnode);
+		if (cnode->height != node->height - 1) {
+			hfs_bnode_put(cnode);
+			return -EIO;
+		}
+		if (!test_bit(HFS_BNODE_MAX_CNID, &cnode->flags)) {
+			cnode->parent = node->this;
+			*child = cnode->this;
+			hfs_bnode_put(cnode);
+			return 0;
+		}
+		max_cnid = max(max_cnid, cnode->max_cnid);
+		hfs_bnode_put(cnode);
+	}
+
+	node->max_cnid = max_cnid;
+	set_bit(HFS_BNODE_MAX_CNID, &node->flags);
+	return 0;
+}
+
+/*
+ * hfs_btree_max_cnid()
+ *
+ * Find the largest CNID of the file and directory records of the catalog
+ * tree. It is max_cnid of the root node. max_cnid is not stored on disk,
+ * so walk down to the nodes that do not have it and compute it from the
+ * bottom up.
+ */
+int hfs_btree_max_cnid(struct hfs_btree *tree, u32 *max_cnid)
+{
+	struct hfs_bnode *node;
+	u32 nidx = tree->root;
+	u32 child;
+	int res = 0;
+
+	*max_cnid = 0;
+	while (nidx && !res) {
+		node = hfs_bnode_find(tree, nidx);
+		if (IS_ERR(node))
+			return PTR_ERR(node);
+
+		child = 0;
+		if (!test_bit(HFS_BNODE_MAX_CNID, &node->flags))
+			res = hfs_brec_calc_max_cnid(node, &child);
+
+		if (res || child) {
+			nidx = child;
+		} else if (nidx == tree->root) {
+			*max_cnid = node->max_cnid;
+			nidx = 0;
+		} else {
+			/* a node that was read again has lost its parent */
+			nidx = node->parent ? node->parent : tree->root;
+		}
+		hfs_bnode_put(node);
+	}
+	return res;
+}
+
 int hfs_brec_insert(struct hfs_find_data *fd, void *entry, u32 entry_len)
 {
 	struct hfs_btree *tree;
@@ -131,6 +299,7 @@ int hfs_brec_insert(struct hfs_find_data *fd, void *entry, u32 entry_len)
 skip:
 	hfs_bnode_write(node, fd->search_key, data_off, key_len);
 	hfs_bnode_write(node, entry, data_off + key_len, entry_len);
+	hfs_brec_update_max_cnid(node, data_off + key_len, true);
 	hfs_bnode_dump(node);
 
 	/*
@@ -183,6 +352,7 @@ int hfs_brec_remove(struct hfs_find_data *fd)
 
 	tree = fd->tree;
 	node = fd->bnode;
+	hfs_brec_update_max_cnid(node, fd->entryoffset, false);
 again:
 	rec_off = tree->node_size - (fd->record + 2) * 2;
 	end_off = tree->node_size - (node->num_recs + 1) * 2;
@@ -322,6 +492,8 @@ static struct hfs_bnode *hfs_bnode_split(struct hfs_find_data *fd)
 	}
 	new_node->num_recs = node->num_recs - num_recs;
 	node->num_recs = num_recs;
+	/* the records that move to the new node may hold the largest CNID */
+	clear_bit(HFS_BNODE_MAX_CNID, &node->flags);
 
 	new_rec_off = tree->node_size - rec_size;
 	new_off = node_desc_size;
diff --git a/fs/hfs/btree.h b/fs/hfs/btree.h
index 1f703f2c53d8..21f69cddc683 100644
--- a/fs/hfs/btree.h
+++ b/fs/hfs/btree.h
@@ -62,6 +62,9 @@ struct hfs_bnode {
 	u8 type;
 	u8 height;
 
+	/* catalog tree: largest CNID in the records in and below the node */
+	u32 max_cnid;
+
 	struct hfs_bnode *next_hash;
 	unsigned long flags;
 	wait_queue_head_t lock_wq;
@@ -73,6 +76,7 @@ struct hfs_bnode {
 #define HFS_BNODE_ERROR		0
 #define HFS_BNODE_NEW		1
 #define HFS_BNODE_DELETED	2
+#define HFS_BNODE_MAX_CNID	3	/* max_cnid is valid */
 
 struct hfs_find_data {
 	btree_key *key;
@@ -140,6 +144,7 @@ extern u16 hfs_brec_lenoff(struct hfs_bnode *node, u16 rec, u16 *off);
 extern u16 hfs_brec_keylen(struct hfs_bnode *node, u16 rec);
 extern int hfs_brec_insert(struct hfs_find_data *fd, void *entry, u32 entry_len);
 extern int hfs_brec_remove(struct hfs_find_data *fd);
+extern int hfs_btree_max_cnid(struct hfs_btree *tree, u32 *max_cnid);
 
 /* bfind.c */
 extern int hfs_find_init(struct hfs_btree *tree, struct hfs_find_data *fd);
diff --git a/fs/hfs/catalog.c b/fs/hfs/catalog.c
index 490c5e130da3..ead094e44c9a 100644
--- a/fs/hfs/catalog.c
+++ b/fs/hfs/catalog.c
@@ -271,102 +271,24 @@ void hfs_set_next_unused_CNID(struct super_block *sb,
 static
 int hfs_correct_next_unused_CNID(struct super_block *sb, u32 cnid)
 {
-	struct hfs_btree *cat_tree;
-	struct hfs_bnode *node;
-	s64 leaf_head;
-	s64 leaf_tail;
-	s64 node_id;
+	u32 max_cnid;
+	int res;
 
 	hfs_dbg("cnid %u, next_id %lld\n",
 		cnid, atomic64_read(&HFS_SB(sb)->next_id));
 
-	if ((cnid + 1) < atomic64_read(&HFS_SB(sb)->next_id)) {
+	if ((cnid + 1) != atomic64_read(&HFS_SB(sb)->next_id)) {
 		/* next ID should be unchanged */
 		return 0;
 	}
 
-	cat_tree = HFS_SB(sb)->cat_tree;
-	leaf_head = cat_tree->leaf_head;
-	leaf_tail = cat_tree->leaf_tail;
-
-	if (leaf_head > leaf_tail) {
-		pr_err("node is corrupted: leaf_head %lld, leaf_tail %lld\n",
-			leaf_head, leaf_tail);
-		return -ERANGE;
-	}
-
-	node = hfs_bnode_find(cat_tree, leaf_tail);
-	if (IS_ERR(node)) {
-		pr_err("fail to find leaf node: node ID %lld\n",
-			leaf_tail);
-		return -ENOENT;
-	}
-
-	node_id = leaf_tail;
-
-	do {
-		int i;
-
-		if (node_id != leaf_tail) {
-			node = hfs_bnode_find(cat_tree, node_id);
-			if (IS_ERR(node))
-				return -ENOENT;
-		}
-
-		hfs_dbg("node %lld, leaf_tail %lld, leaf_head %lld\n",
-			node_id, leaf_tail, leaf_head);
-
-		hfs_bnode_dump(node);
-
-		for (i = node->num_recs - 1; i >= 0; i--) {
-			hfs_cat_rec rec;
-			u16 off, len, keylen;
-			int entryoffset;
-			int entrylength;
-			u32 found_cnid;
-
-			len = hfs_brec_lenoff(node, i, &off);
-			keylen = hfs_brec_keylen(node, i);
-			if (keylen == 0) {
-				pr_err("fail to get the keylen: "
-					"node_id %lld, record index %d\n",
-					node_id, i);
-				return -EINVAL;
-			}
-
-			entryoffset = off + keylen;
-			entrylength = len - keylen;
-
-			if (entrylength > sizeof(rec)) {
-				pr_err("unexpected record length: "
-					"entrylength %d\n",
-					entrylength);
-				return -EINVAL;
-			}
-
-			hfs_bnode_read(node, &rec, entryoffset, entrylength);
-
-			if (rec.type == HFS_CDR_DIR) {
-				found_cnid = be32_to_cpu(rec.dir.DirID);
-				hfs_dbg("found_cnid %u\n", found_cnid);
-				hfs_set_next_unused_CNID(sb, cnid, found_cnid);
-				hfs_bnode_put(node);
-				return 0;
-			} else if (rec.type == HFS_CDR_FIL) {
-				found_cnid = be32_to_cpu(rec.file.FlNum);
-				hfs_dbg("found_cnid %u\n", found_cnid);
-				hfs_set_next_unused_CNID(sb, cnid, found_cnid);
-				hfs_bnode_put(node);
-				return 0;
-			}
-		}
-
-		node_id = node->prev;
-		hfs_bnode_put(node);
-
-	} while (node_id >= leaf_head);
+	res = hfs_btree_max_cnid(HFS_SB(sb)->cat_tree, &max_cnid);
+	if (res)
+		return res;
 
-	return -ENOENT;
+	hfs_dbg("max_cnid %u\n", max_cnid);
+	hfs_set_next_unused_CNID(sb, cnid, max_cnid);
+	return 0;
 }
 
 /*

base-commit: 34ee5f8c2198db9585da6c181c50869d2eb43c3a
-- 
2.53.0

