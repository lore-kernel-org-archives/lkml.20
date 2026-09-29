Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com [74.125.227.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D954331EB2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790647720; cv=none; b=l+TyCjCD9gxd96lFtX4kTpwomg76GfLqgQTZoivXTOnkq5Mjb+yiWFiI2k1GDqsHEVUzNjb0Ki2b30A98FzWm23th6x/icAG2X6vdOxbZBWrpiZuY2OUn0g02DpMnHPuMmLPMyz5TpQrRjvnxJhW6uga+PoJnE6PlaGH9Q50pxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790647720; c=relaxed/simple;
	bh=8HZQIfdkPFT/KAepzonaOWUZog4wsVJFZMYSKO8Uqdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oatncUazideDxh7JJLeUmDIkW9R4xQEAyrqveJ8JoCqkWhGE1qb6WCmw1rBhUbEAa4fALqfxssIGoj2i1wA3h833PQQ6Dois9I3HiRBSSgnFUdkUyh3j8iaCdJHjB5sIhxcRfULtKcyUQ97YRDbxUzA5oxT/uuMdt/EhcMTEVsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PyAIltqn; arc=none smtp.client-ip=74.125.227.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyAIltqn"
Received: by mail-vs2-f37.google.com with SMTP id 71dfb90a1353d-5cfd29f1208so644357e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790647718; x=1791252518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IezbauBQo0SYD5vT1v9mpnB2FDN7oYHxuNkWtEmhqDg=;
        b=PyAIltqnhZOrcx929FLI7VmKu4FNqd1cLGONqxs1TVMcFPDhT7mhZq5bDC7+ytgAjS
         gQGl9wiEDzwyL1q5BvusBPjPyQc0JaN96Q3nri5axm7+/XoKr3Qj55Ja8RT/a261Ih6J
         ILdHGbuthuHCamawcMfTowewof3dwesFeIakf7wz3I3UbZ0TxrCQIynAlWFkpOInrUK0
         8tpfhABh4mtG+Nk5a2KXRo6seZUyDUVrqaCtz0ovFSEbPbhPK7qx3OIg+hkcLnfcw1NK
         WmaVniEa2Xdap3Jy3NAcWlBgDGWpQ8EEg9k91avJb48pDGP9su4HSYZ880zNvYfhWnIt
         FasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790647718; x=1791252518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IezbauBQo0SYD5vT1v9mpnB2FDN7oYHxuNkWtEmhqDg=;
        b=2ZbRP4hOUHwAjuKigjd1tye9q8H5Ti5ZH465+8ESloxIZojvslBQQlX+Nxlb4ZQTnT
         XBYYvzybl4Cd+AS+/qcj3lgfCodYmVFIbheiWuimlLE7E1+Y2GAISwVe1ZMJIO2zshvM
         aq5YqFCzS8T3an9vTZ5CTQJ7K4ftn3SMBtmgNEKQ0yMdWx2KbJ0OQ+1pUiiuEkJSav71
         4Ri/G4SVM7bB4HFBmjvWZZuTBKpX0oONxx3wlWx4KDRMWwPqi3Qe+CLkFn2/quzRipxx
         iiCd22onxxVWXuqq/ROBaY5SC8yJ5og3V+pF9yUXOqnZKbT3rIMFvEjwUCyoTVoz7IAz
         76eg==
X-Forwarded-Encrypted: i=1; AKwUvBxjsl2tFERJvqFvIbZ+qDFvqXfwW7tRbKMDwPdP95CErcmYaE27N+xi0/SwxZaPKoiQ2ZvEh+CbeJM6uWo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLE8wQDDZzDUbBeDX7Wf6MV5AEjVgWU1EG3O3MKNtg69+c8LSND
	cxwk8R2g8SOfwtMO8QQiEloojGljKzlQQ76+k4xZe79fEK7e3HVQeI6U
X-Gm-Gg: AYBFou28kd3fjxBpVjW1HuHf+fkhe5y6vhZ96B3Afokf7E5zNPfbJggjZQw8A2FI6rn
	rEKPItZ9trWNy4gvhQSBVWiVK1dtZA4mX9xEr2d76NKdQG/Ta31B2In8aiLePcrP7kirsR42ezj
	gnSyPUYeRUEZVOcbBfbAFrprYKu8eXAMCMpWaAgFw5SRlQFMVd9Jr9eD3FHz4L7+7S+6TK80fJO
	1SH7sVUAA2RfDGExfvHbnGI5U4quAXl/+432950l+bzD+2fy/QNYr0X+VoZkGRt2zDl1Bv22Th1
	1Q4NJEQ2GcBJMTvLRvvKzl0wdlrytPFJwkVHjWmR9y6+VEmhgzGpBGZLljiMRPuhapzMsqHhEgB
	pmIfCIDSgYVkb3AY5XD/IZE7IjjfKjzejBd+x7epHm7VquvUdYqjVeKgfxXq2SGZtmh8Xu10Nw8
	QUvJVKMPdgVOzgTKiI42nfLr5FhDxGTAwWorsBZaiPwov62lS7MqZlB//QmOKRavfPSCV4P7bK7
	UJhwYaE+aCMW/QyBKFz16B/k0e2nzzFRdRW9JHiL29xPdrhKEeLwQPaTQKxU1sXdZMlMA==
X-Received: by 2002:a05:6122:1791:b0:5cf:1e68:6015 with SMTP id 71dfb90a1353d-5cf1e6867acmr2230397e0c.15.1790647717795;
        Mon, 28 Sep 2026 19:08:37 -0700 (PDT)
Received: from bazzite ([138.122.221.74])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde587a790sm11159030e0c.9.2026.09.28.19.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:08:37 -0700 (PDT)
From: Davy Felipe <davyfelipe34@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Davy Felipe <davyfelipe34@gmail.com>
Subject: [PATCH v6] hfs: handle extent B-tree write errors
Date: Mon, 28 Sep 2026 23:03:29 -0300
Message-ID: <20260929020329.32911-1-davyfelipe34@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924231054.2175660-1-davyfelipe34@gmail.com>
References: <20260924231054.2175660-1-davyfelipe34@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hfs_brec_insert() may fail while inserting a new extent record, but
__hfs_ext_write_extent() currently ignores its return value and clears
HFS_FLG_EXT_DIRTY and HFS_FLG_EXT_NEW as if the insertion had
succeeded.

Propagate errors returned by hfs_brec_insert() and only clear the
extent flags after a successful insertion.

When updating an existing extent record, hfs_bnode_write() returns
void. Validate the extent write parameters before calling it so an
invalid update is reported as -ERANGE instead of being treated as
successful.

Use a reusable B-tree node range helper that takes the find data and
the expected record size. The helper validates the bnode and tree
pointers, entry offset and entry length, and ensures that the write
range fits within the node.

Negative-path testing in QEMU confirmed that an insertion error is
propagated to the caller. Testing the existing-record path also
confirmed that invalid write parameters are rejected before
HFS_FLG_EXT_DIRTY is cleared.

Signed-off-by: Davy Felipe <davyfelipe34@gmail.com>
Changes in v6:
- Rename hfs_bnode_is_valid_range() to is_hfs_bnode_range_valid().
- Use size_t for the expected record size.
- Drop the redundant expected_len validity check.
- Return -ERANGE for invalid find-data/range parameters.
- Incorporate the final review feedback from Viacheslav Dubeyko.

---
 fs/hfs/btree.h  | 19 +++++++++++++++++++
 fs/hfs/extent.c | 10 ++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/fs/hfs/btree.h b/fs/hfs/btree.h
index b4c3f2a31471..1f703f2c53d8 100644
--- a/fs/hfs/btree.h
+++ b/fs/hfs/btree.h
@@ -84,6 +84,25 @@ struct hfs_find_data {
 	int entryoffset, entrylength;
 };
 
+static inline bool is_hfs_bnode_range_valid(struct hfs_find_data *fd,
+					    size_t expected_len)
+{
+	struct hfs_bnode *node;
+
+	if (!fd)
+		return false;
+
+	node = fd->bnode;
+	if (!node || !node->tree)
+		return false;
+
+	if (fd->entryoffset < 0 || fd->entrylength != expected_len)
+		return false;
+
+	return (u64)fd->entryoffset + fd->entrylength <=
+	       node->tree->node_size;
+}
+
 
 /* btree.c */
 extern struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id,
diff --git a/fs/hfs/extent.c b/fs/hfs/extent.c
index f066a99a863b..26357086517f 100644
--- a/fs/hfs/extent.c
+++ b/fs/hfs/extent.c
@@ -121,12 +121,18 @@ static int __hfs_ext_write_extent(struct inode *inode, struct hfs_find_data *fd)
 		res = hfs_bmap_reserve(fd->tree, fd->tree->depth + 1);
 		if (res)
 			return res;
-		hfs_brec_insert(fd, HFS_I(inode)->cached_extents, sizeof(hfs_extent_rec));
+		res = hfs_brec_insert(fd, HFS_I(inode)->cached_extents,
+				      sizeof(hfs_extent_rec));
+		if (res)
+			return res;
 		HFS_I(inode)->flags &= ~(HFS_FLG_EXT_DIRTY|HFS_FLG_EXT_NEW);
 	} else {
 		if (res)
 			return res;
-		hfs_bnode_write(fd->bnode, HFS_I(inode)->cached_extents, fd->entryoffset, fd->entrylength);
+		if (!is_hfs_bnode_range_valid(fd, sizeof(hfs_extent_rec)))
+			return -ERANGE;
+		hfs_bnode_write(fd->bnode, HFS_I(inode)->cached_extents,
+				fd->entryoffset, fd->entrylength);
 		HFS_I(inode)->flags &= ~HFS_FLG_EXT_DIRTY;
 	}
 	return 0;
-- 
2.55.0

