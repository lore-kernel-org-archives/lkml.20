Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927670;
	b=1ruWZn28anJwbPhNQpmTah7uo/n41Wjbo6LFhXot/D20owVsrumi1PHOqRcK57IRxqQf
	 PuU97OrA30aE7gGC+4DK+vgL8mumGttm0Tt5okCW/nXGa4grfYmjUY+9gcKhKX+T8pLXf
	 xUGaE7VLsSopK/GJquGeAn8hPVshgSHtTm+Fm/ZeLRxLYv5nsh65HrWlrtwgw4JLQZnCJ
	 xbrURt7jqzp9vhoAhBvcN1KQb5DkcppB2g+4jNG8Kcm89RxQZb42otsBy40EUc86V02c3
	 G7+MOUNJdT8nYopOiEFxRbX8B751lUUIgwd8ad4buBJN8xIjwtVWZbg62/fL/AoHekA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HslZ026Sqb2wA5Yz5eYmxBepFwcsw9Bo6wmDwgf0aso=;
	b=KIs+6njrmo/cEG0UpOuRKo5LSVYPprnQen/qLf4ymwAnXsPSF65Cu62DEqClZDEKcEel
	 Pt9Y4ruKtU3QzxF+KV2ZtnaZYptZxWnSg4HRgQwV5PG0RxhxHpoNvek17OycIJ+P1kVoB
	 8C46D0Vx49UymdgRqlAwkH7XeduVANfpdA5KXhZF9KOYw9KbgVWImBy963o7uUmdvohbY
	 q0NTvtEPgsUtGfOAzCFYVAUOhcyNBiXtmeBVRPW+VrfHcmII45tmlUkXoXwdRE24Dt5Ky
	 eHvcAmcgLLGkgEBFaJjBo0H1uDxo22GokqNNrUtlUyu7mYHETdV5o9o5jFO4ia4LAPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="JIR/ELxJ";
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD26606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBD26606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JIR/ELxJ
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ae10409ceaso4970751fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794927668; x=1795532468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HslZ026Sqb2wA5Yz5eYmxBepFwcsw9Bo6wmDwgf0aso=;
        b=JIR/ELxJHcMwPFQZ62PhUzQvOPxSugB65iKybzWy2CKKVIKPO08mjEoDw/jjCAB8Hn
         tAyRGOQfEBcyVnrHdyFt6fC3rq0yfrwJzlwGc7LlNdolNXGv9HdjUs0pQyQ7JepXZw6b
         RfL2p+2e72Nu1eIdoySVFDyE+SJF0+2xUg8yMJVZdbc6GaIAHh3tXIFK2PVRr8jgdxPG
         U4mKkPpxjxjffTgqBKuYkyq3UE+eFR9kLA7Tb3sPnbCQeMk+Bm0vy+7x0pwlooftVkfE
         D83Wi6pB64wDTDuiBKR1CocII6iactFgpZ1xzlldrGI5vkbImhWSep9RVcXfckngk1Tz
         59yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927668; x=1795532468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HslZ026Sqb2wA5Yz5eYmxBepFwcsw9Bo6wmDwgf0aso=;
        b=C4e8wI3XVZg6V2NlFj8wa5O64OQ9K7YqAuz0l4UWxF/54GJuBg6QSzDtWgPQflWhHl
         IpD2LT4/60h+UVIohZ7BrjNxjtdwo0iUU2dh9s5qOV4gExtvPfy4frmR2CpG5Uvp2TbJ
         isLf2ajo8KGm8uCY1hu0BUanWsVMw+buwh9NyQGMSqaxdP+vK6lVV4Vd43wYUfV5K/zF
         yNWU6gZyP01IC9UMfl8qx7ffJaMy11RcyPMymg/K/eqKPoAxer4XokjliN123byvssCB
         MGE3vSw4k0k9M2znCgW/qCqB8wmX4fzQxkO5GzCpULwGk+6H2GYBkva6ZwK+ENsNyAE0
         CQiA==
X-Forwarded-Encrypted: i=1; AL+hErG+ho196aBBX7eSkQHXja1D5X5mdyfqJ3tqQKhrJb7KGcEvHEQODzj6k/dZ35Z7RpvMTFoFoEUA1SzRJoE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/R5WF0fIvl2upHs0l4yhjYQ9VEoOe+jXrEv63aW2cvHXVlshaz
	RPqAHQ6RL3a6cLo+dEo+ddvrzER1o376GIOPMhvMQEa7o3QjMPuq6feYEOdxc9OD79c=
X-Gm-Gg: AYBFou3ymwxE/8s5fLUMKewt8sQbAgJU0a8TFnpgxcPXeqtLfe8JhRhBnAhhe4xAvOG
	TqpljLMifusSwJUipGktaR12F97lvxYxzHvaiCe6OE/2JEO4H1s44Y7GCbYF3TuC3QWhPOZKHa3
	BDDzNWplN+T006kJrbdJbcSO0UUcaPNog6UXoef35LF0vu9rnybn4JILciNdviYBU/D+JawPMQm
	JiRapp+QtyIqXZCnvhq+Oo75890kBv7t3DGA/b5KQctWVbq9abq7LGJbZRzkIh2UAG7hQ189gwg
	K4nvZw5CD+RC3uiGCv1TlgmwB7m2VOs04tyotduc6jo2Fie/AomFN3M1LNDODD0xPwco/ErsXcB
	yszpHyshrWGXCCyP4Mrv4MXaWJ44MJMPGPOkAuh6piI+s+gbYhqLraVDblKZDZ/TG21n8azBc7L
	GzoDX1OPMYYthvgzo0PtsY9GKz8HVK/hSiKiI+JVOZftjs8VzLHkNWmlN5FUC+BD/v8EfaTEBcs
	8G+ICiwFRHo+4uXfRi72LVccGNbI2QUfgzbAO/dm3nY1EVEo/8s8Na53RNOIhjcJS/qUfoUZLqK
	ORdruG8wZqhnepBXFsuOPo9LwEeQtwP+pjP9PAjXdrU=
X-Received: by 2002:a05:6512:39d4:b0:5bf:a48b:7827 with SMTP id 2adb3069b0e04-5c1705f074amr6443827e87.2.1794927667382;
        Tue, 17 Nov 2026 07:01:07 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b2b5sm35904028c88.1.2026.11.17.07.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:01:05 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v7 1/3] ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
Date: Tue, 17 Nov 2026 23:00:50 +0800
Message-ID: <20261117150053.18417-2-heming.zhao@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117150053.18417-1-heming.zhao@suse.com>
References: <20261117150053.18417-1-heming.zhao@suse.com>
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

As part of migrating OCFS2 DIO read/write code paths towards the modern
and performant iomap framework, here introduces ocfs2_map_blocks() to
replace the legacy, high-overhead buffer_head based block mapping
routines.

In addition, OCFS2_MAP_* flags are defined to gridge OCFS2 internal block
mapping flags with the iomap API requirements.

Subsequent iomap integration patches will build on this core block mapping
routine. The implementation draws inspiration from ext4_map_blocks().

Signed-off-by: Heming Zhao <heming.zhao@suse.com>
---
 fs/ocfs2/aops.c  | 70 ++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ocfs2/aops.h  |  2 ++
 fs/ocfs2/ocfs2.h | 25 ++++++++++++++++-
 3 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
index 4acdbb70882c..64fcf6eb3d89 100644
--- a/fs/ocfs2/aops.c
+++ b/fs/ocfs2/aops.c
@@ -126,6 +126,76 @@ static int ocfs2_lock_get_block(struct inode *inode, sector_t iblock,
 	return ret;
 }
 
+/* ocfs2 never allocates in this function */
+int ocfs2_map_blocks(struct inode *inode, struct ocfs2_map_block *map,
+		    int flags)
+{
+	int err = 0;
+	unsigned int ext_flags;
+	u64 max_blocks = map->len;
+	u64 p_blkno, count, past_eof;
+	struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
+	int create = flags & OCFS2_GET_BLOCKS_CREATE;
+
+	if (OCFS2_I(inode)->ip_flags & OCFS2_INODE_SYSTEM_FILE)
+		mlog(ML_NOTICE, "map_block on system inode 0x%p (%llu)\n",
+		     inode, inode->i_ino);
+
+	err = ocfs2_extent_map_get_blocks(inode, map->lblk, &p_blkno, &count,
+					  &ext_flags);
+	if (err) {
+		mlog(ML_ERROR, "get_blocks() failed, inode: 0x%p, "
+		     "block: %llu\n", inode, map->lblk);
+		goto bail;
+	}
+
+	if (max_blocks < count)
+		count = max_blocks;
+
+	map->pblk = p_blkno;
+	map->len = count;
+
+	/*
+	 * If we see this on a sparse file system, then a truncate has
+	 * raced us and removed the cluster. We treat this as a hole
+	 * and skip setting the iomap flags. The caller will set
+	 * iomap->type to IOMAP_HOLE.
+	 */
+	if (create && map->pblk == 0 && ocfs2_sparse_alloc(osb))
+		goto bail;
+
+	if (p_blkno) {
+		if (ext_flags & OCFS2_EXT_UNWRITTEN)
+			map->flags |= OCFS2_MAP_UNWRITTEN;
+		else
+			map->flags |= OCFS2_MAP_MAPPED;
+	}
+
+	if (!ocfs2_sparse_alloc(osb)) {
+		if (map->pblk == 0) {
+			err = -EIO;
+			mlog(ML_ERROR,
+			     "iblock = %llu p_blkno = %llu blkno=(%llu)\n",
+			     (unsigned long long)map->lblk,
+			     (unsigned long long)map->pblk,
+			     (unsigned long long)OCFS2_I(inode)->ip_blkno);
+			mlog(ML_ERROR, "Size %llu, clusters %u\n",
+			     (unsigned long long)i_size_read(inode),
+			     OCFS2_I(inode)->ip_clusters);
+			dump_stack();
+			goto bail;
+		}
+	}
+
+	past_eof = ocfs2_blocks_for_bytes(inode->i_sb, i_size_read(inode));
+
+	if (create && (map->lblk >= past_eof))
+		map->flags |= OCFS2_MAP_NEW;
+
+bail:
+	return err;
+}
+
 int ocfs2_get_block(struct inode *inode, sector_t iblock,
 		    struct buffer_head *bh_result, int create)
 {
diff --git a/fs/ocfs2/aops.h b/fs/ocfs2/aops.h
index 114efc9111e4..8dd6edd7c1a1 100644
--- a/fs/ocfs2/aops.h
+++ b/fs/ocfs2/aops.h
@@ -42,6 +42,8 @@ int ocfs2_size_fits_inline_data(struct buffer_head *di_bh, u64 new_size);
 
 int ocfs2_get_block(struct inode *inode, sector_t iblock,
 		    struct buffer_head *bh_result, int create);
+int ocfs2_map_blocks(struct inode *inode, struct ocfs2_map_block *map,
+		    int flags);
 /* all ocfs2_dio_end_io()'s fault */
 #define ocfs2_iocb_is_rw_locked(iocb) \
 	test_bit(0, (unsigned long *)&iocb->private)
diff --git a/fs/ocfs2/ocfs2.h b/fs/ocfs2/ocfs2.h
index e3bb3cc0b25a..b4583b3170e2 100644
--- a/fs/ocfs2/ocfs2.h
+++ b/fs/ocfs2/ocfs2.h
@@ -514,7 +514,30 @@ struct ocfs2_super
 	struct ocfs2_filecheck_sysfs_entry osb_fc_ent;
 };
 
-#define OCFS2_SB(sb)	    ((struct ocfs2_super *)(sb)->s_fs_info)
+/*
+ * Logical to physical block mapping, used by ocfs2_map_blocks()
+ *
+ * This structure is used to pass requests into ocfs2_map_blocks()
+ * as well as to store the information returned by ocfs2_map_blocks().
+ * It takes less room on the stack than a struct buffer_head.
+ */
+#define OCFS2_MAP_NEW			BIT(BH_New)
+#define OCFS2_MAP_MAPPED		BIT(BH_Mapped)
+#define OCFS2_MAP_UNWRITTEN		BIT(BH_Unwritten)
+#define OCFS2_MAP_FLAGS		(OCFS2_MAP_NEW | OCFS2_MAP_MAPPED |\
+				 OCFS2_MAP_UNWRITTEN)
+
+struct ocfs2_map_block {
+	u64 pblk; /* physical block# */
+	u64 lblk; /* logical block# */
+	u64 len;  /* number of block */
+	unsigned int flags;
+};
+
+/* Flags used by ocfs2_map_blocks() */
+#define OCFS2_GET_BLOCKS_CREATE	(0x0001)
+
+#define OCFS2_SB(sb)	((struct ocfs2_super *)(sb)->s_fs_info)
 
 /* Useful typedef for passing around journal access functions */
 typedef int (*ocfs2_journal_access_func)(handle_t *handle,
-- 
2.55.0

