Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776723D8912
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790794246; cv=none; b=awf5N6fxSDynrskMovQ+/8DVEK6G3lakjY/u07sTnQjVm6NoAcdwv08sUS+9v5Z3pWffFeUrJpdUE6T0OvBSm0LIZetjIQL9DT/2JxakgfhrLpNbhF2uOnjHOTZwQTqHlSSvpQOnxVt2EtNWRp550d6itgf0076YUK09o0rOea0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790794246; c=relaxed/simple;
	bh=yO2FXLNSAKLZLbKK4DBCKqAe6GllfIPBhVj0RDbnLQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a2uNC26pC+2enNkMxaMbpvF8wM38AbdwZPhyCzP3aVlX50ikcjtnETnFfzrm5BCL12FkNTW/rJPuxcYU6noE1EXCWb8xlDW3nE19AjSD5hry8uAbqjqcBrk5knyjt0BJ2DpKT0wnoZoxcM44oIk+sq3TqzUS6nIjGu874TBZ/1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noroxi.com; spf=pass smtp.mailfrom=noroxi.com; dkim=pass (2048-bit key) header.d=noroxi.com header.i=@noroxi.com header.b=H/nqfeMb; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noroxi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noroxi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noroxi.com header.i=@noroxi.com header.b="H/nqfeMb"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba37427a3aso1807811e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=noroxi.com; s=google; t=1790794242; x=1791399042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5b4LTz7m0DFLrfxivAZmdGHfGQ+Px1ZEYD2UiqRZ9Bo=;
        b=H/nqfeMbIJQ8q2TGUtSCU98GgCZ7T5nzKFBa+RYDQWWG0/Rh3ILm6w2dTXbmNLXT3c
         3lG6oW1OSSCPuX6OLzeASxesf3a21jlnaoTW9y7CBjvaoZj0PlX+X/s3QkcUpA/i6UfW
         aI1g+DRG4FZlDq8wnJ0DglYNdFm9nwNsy/SzKrj79WpiSYe2oFrA0FB8vCPzO53uKG62
         XIBf9L3cz29+uoaEHFVEtXr1FLfy7MbZS//CY39E5PDQdOO9BWQ/kLk6EgkdXcamg3eE
         qjmIaalTfGVjNZtlmfIlnD1ctQXnWqA03qpyoumUoSSgfRxQXC2QbxluNcAu1oimfa3S
         TA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790794242; x=1791399042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5b4LTz7m0DFLrfxivAZmdGHfGQ+Px1ZEYD2UiqRZ9Bo=;
        b=bODBDiKy+a7pkZnWkQQnRHhFQ0ctWln56SAvr2mxEU4MlAsdruxzUBUxUccmEg+1e6
         JXF7TbfMsc9Z77vnDi8Lxtp3aT+QuUkeEulLyAhYf8/BT5jaDJveD8qoNCJDGo/pLIIM
         p3Db9i7+cegf79/TOlcYirLxJ+tJLO09+MbKX5P0ppL1+vhfiXBmvZuzJx60LTYdQXtb
         j/okmbtrZPaXCts/yXMZUuJI+TW3oxdWl8XaK3jxFp5XsZJ6XKpkOUCbnzndYJfCdEeQ
         6ggFYkQ6XUYDVsMVHcpQ0NEWV/rAS8tcOIFvZY//UGn9Hgc6phbS+hqBoHMbbMLdUFUC
         bb5w==
X-Forwarded-Encrypted: i=1; AKwUvBx99lmb4sDiaVBq5HtrjBSo4FWgYdcBa/hWC0+MA5KuC97KaK2q2QXRgf/d7hlTg3A61DTcw/FO/EiIDdY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2Yc0Fwh+C6O2pzZTpjzyUI0KAdBpp9VRiZnBG4yaWEO3300qH
	XpEAjYBU4xNCImJmwqDUbyI4ytDBbIk+rlVHrFKD3zawVAOUbWXR5Ol8lwZC+y+DSTD5OoyRJwO
	oa+5KxgWlTACF4w==
X-Gm-Gg: AYBFou13Q4EW8ONMdjCM1UX/OeAXJQi98EHq+HCheCcpUU0ptuanigR7/0mvBC9ysVV
	KKj1psClNhX1x1j24G0nJt9Dm3kav7DRznlGxsTsCN74Xc5/ZfLoma4taWPccKJDbDYcv+a9suC
	LZr9TWlDEv1/b3k5gzKr9AAszxVfFYt4XJZ/hnqSDjOcdELlCLcZnaoIYFNK9unwVDeXGSY4Ayq
	nAj9nYArOOd/lTzjrLpzJfz3Vu2VrCJw3OdSgj0WdRTwddzrt/uoO3RZwy9HKFrMpFNLQVIH89x
	jnqZX2uLp5vBfrPSk9O8fhUaHLewDwf444PBCJSLzVyhyijownysZ7g0DElaoTk6vkqMvIjUu4A
	8DGdJGd+esyd7/m+m57h3sTtknGb3B22ABh5oxVYbiauP0NKjqavUuBbDK81kjtAcXApX0TbfJu
	d8bs8Iekd39bGxjwlufgIr2Czy1e+KcHu7oyogA0IzivM+FvRUjSJ/ao/kazBOEuhK+eaimkj9
X-Received: by 2002:a05:6512:b0f:b0:5b8:b419:b90 with SMTP id 2adb3069b0e04-5ba4061a36bmr927262e87.67.1790794241866;
        Wed, 30 Sep 2026 11:50:41 -0700 (PDT)
Received: from lab01.. ([2a01:4f9:1a:a462::2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42f7c767sm166456e87.9.2026.09.30.11.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:50:41 -0700 (PDT)
From: Mahmut Emin Kurhan <guvenlik@noroxi.com>
To: linux-fsdevel@vger.kernel.org
Cc: slava@dubeyko.com,
	glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-kernel@vger.kernel.org,
	Mahmut Emin Kurhan <guvenlik@noroxi.com>
Subject: [PATCH] hfsplus: free cached B-tree nodes on hfs_btree_open() error path
Date: Wed, 30 Sep 2026 20:50:33 +0200
Message-ID: <20260930185033.1335238-1-guvenlik@noroxi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hfs_btree_open() can fail after hfs_bnode_find(tree, HFSPLUS_TREE_HEAD)
has already inserted the head node into tree->node_hash.

__hfs_bnode_create() inserts the new bnode into tree->node_hash before
it reads the node's pages; if a page read fails it sets HFS_BNODE_ERROR
and returns the node still hashed. hfs_bnode_find() then takes its
node_error path, which calls hfs_bnode_put(). hfs_bnode_put() only frees
a node once its refcount reaches zero *and* HFS_BNODE_DELETED is set; for
the errored head node that flag is not set, so the node stays in
tree->node_hash with a zero refcount.

hfs_btree_open() then sees IS_ERR(node) and jumps to free_tree:, which
does a bare kfree(tree). Only hfs_btree_close() walks tree->node_hash[]
and frees the cached nodes, so the head node is leaked. Mounting a
crafted HFS+ image whose head B-tree node fails to read therefore leaks
kernel memory on every attempt.

Reported by kmemleak while fuzzing HFS+ image mounts:

  BUG: memory leak
  unreferenced object (size 192):
    __hfs_bnode_create+0x105/0x8d0 fs/hfsplus/bnode.c
    hfsplus_bnode_find             fs/hfsplus/bnode.c
    hfsplus_btree_open             fs/hfsplus/btree.c
    hfsplus_fill_super             fs/hfsplus/super.c

Free any nodes still present in tree->node_hash on the error path before
freeing the tree. The paths that reach free_tree before hfs_bnode_find()
have an empty hash, so the loop is a no-op there.

Found via coverage-guided fuzzing (syzkaller + kmemleak) by Noroxi.

Signed-off-by: Mahmut Emin Kurhan <guvenlik@noroxi.com>
---
 fs/hfsplus/btree.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/hfsplus/btree.c b/fs/hfsplus/btree.c
index 2ea8cd565..3de32f221 100644
--- a/fs/hfsplus/btree.c
+++ b/fs/hfsplus/btree.c
@@ -403,6 +403,24 @@ struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id)
 	tree->inode->i_mapping->a_ops = &hfsplus_aops;
 	iput(tree->inode);
  free_tree:
+	/*
+	 * A B*tree node may already have been inserted into tree->node_hash
+	 * (e.g. an errored head node from hfs_bnode_find()).  Only
+	 * hfs_btree_close() frees hashed nodes, so a bare kfree(tree) here
+	 * leaks them.  Release them before freeing the tree.
+	 */
+	{
+		int i;
+		struct hfs_bnode *node;
+
+		for (i = 0; i < NODE_HASH_SIZE; i++) {
+			while ((node = tree->node_hash[i])) {
+				tree->node_hash[i] = node->next_hash;
+				hfs_bnode_free(node);
+				tree->node_hash_cnt--;
+			}
+		}
+	}
 	kfree(tree);
 	return NULL;
 }
--
2.43.0
