Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373852;
	b=xquVuIsf1f6EE6OhPAwEdGMJI3U9GdGvPbBSTOvwmRyZGx08ACUs7ntX7EfX+iT/40ef
	 cXYZq7rOfkzyjMhdLVtgJZt2uakblhp/UTTb5NLupxvB20xIEPUCd3kzG9qASMrIz/pDX
	 F9lk+DA9Bx3CLw/iLeUTfvJB7cYnptAvEf7eK5G4jnNeDm+wA6iZZXV6OnLruMejYpvPt
	 tdXzNdjJhxapcb4IjliowguLC03WUpIQFX3knDwAR6ZP+hMp0OVMloIOlhAjjL4KtfVsd
	 dHdz4cp1UbJUWBGreXXjKhrMTxZXm5hTLqQM4IswXb7Wh673f6c+pMx8G8ReqkuJrZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sOjJ/ipkNri/OvRTz9tJlBAB6d04Pi9M3rBYJKk4hmk=;
	b=vUrRSaLaz7cUcvktTNqswjroex7wLlT/6WX4RXFti1TSvoIF+SWgskIiiLSlrenjQGat
	 Q1k18EzGcGjkHELL78PdkdKPdZTrotHC+JQfQ7u8QAQkvKyn/DAWu5lXf+k/jSZSNHL+E
	 mjke/RzDubZbBePPuSX1WP1VRYpLd+KsTc7eCnuJlVFBSzQmMZyTzqoEvmzBhAAi2HYxe
	 ZNWsTm/XWd3X73W8Z+xQ3r9fzk65zuOqwnBblriK+MEosJxQoiTtVhLo10yRYLAmul+dB
	 z2EETK+qntGzHeDZuVbEe8Py1Z8KFq5jYD7Bz9ncg22AlnCCBDMTiE4+dhOGZ+EwYCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xigA3N4s;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C52C606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C52C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xigA3N4s
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so493638a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793373851; x=1793978651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sOjJ/ipkNri/OvRTz9tJlBAB6d04Pi9M3rBYJKk4hmk=;
        b=xigA3N4skr0rp+LHEQ2oA7RVDphdokxSBi22Y4rJGndk0VEoJmUtbTX/mD7Yz63qrb
         bWxVSzDqyXtOT6kyQ8/2bJIkfbADOq822A0bAOGVCV+j4644n9QYCQVtNdwuduPkv+JP
         zG3Y0gLGnG9jD0rSSw3RKaIHmoAHmusc/iu61r/xuwcDYOKcheN+pbMiBKXlqnEBsdwl
         acOzKyz8DFd/RVqRIuhmkBKCFIAOxpEAZSt2Xa77e/yt9staYM82zyDV0fj9NThvPu05
         2uTpWd0ges5BqDZL+wquwhSAlYy0OtEWP2cRREPQzPQhs8hV7LBM6vtmXH+z3awRo6Ez
         NQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373851; x=1793978651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOjJ/ipkNri/OvRTz9tJlBAB6d04Pi9M3rBYJKk4hmk=;
        b=qdRAqJqd272ywJeY0UbzFQqWgINIGfBD8fizJ+wr7JBkp7de0JUyOJ5pe1fOvrbhde
         g2yxXL2rI9pkp31uLlBip0X0XEfK3G9icM6pasOF829+SJ3JCnbAxhvc/UtL4yet2eKZ
         SL+NM25wMmRhAsQPxaC8YAP+1iz/Mnz3Ywp8zN1vzQ3QiqBb0r5ic8A25Yxjd5GWIq/U
         Ok/bIMwd9kiyFekcj8DcSsJJYpPBq2JN4KXJVmhvc7AW45cjyNvL9T5pzFGl2ls+V98t
         8+LhSMmTlQlLm59GRcFtqxkDnQh6kxitZEVJaMIYgtzynF+BS7PeJABlsxMnV8KJvDGm
         lUiA==
X-Forwarded-Encrypted: i=1; AKwUvBxPt3NB9p2REAdo2iSaL5wdE/qFy7ymjIHWDsN17k95/kqR/ViLb39g2suYbxJ5fzmZlMbFobh4RcGQRLY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIierJuURhttxNB5qVz8c+yYz5Yn5LuvrOiHZTc0cSUBhAc6ylW
	MwZ30oofs3ak9nN3LxiNlv0MxOIoQX2RMt1vMTfwSoPO9WqGl9lbZXfP
X-Gm-Gg: AYBFou2MmOZkaxfpPd7dMcw0undE40FWr5Y9eS28qIxbVngiwUugLepNwkFld0OdHr8
	UJ5+VFc2wpDw0Mk2aCNSBVQxBb5giupyS2G49KmbVAlOiEz2LZcVeZx0msLJp3x2qPXxlMtbxFU
	S0ZL8rYkzfFeh1GeKu4sb/Q5Tz6ieAjM+tMDgF5vWizOeKYL6jpCBDy2bDnroMINdjEpRR8hvgO
	zxW3snWPl62JTHBahDOgiLTkLoAKq/WbkvcwElh4xNOI6MV3JyHEiFwmMwqvKjn2sHycg5rBvD6
	LxkNS1cSgg2gbQZ7x71VbUICb2go6bihECf12A95iT3y2CGy8QYG2LIoYgNhnJ5TgJdKOV1DgDZ
	yMLypmQn5VKw3s8Iu0BYtpc6qZx5zP4snuRyrdYEmUAOrpye9i4i0kTgl4da5gRCSxmg/ph5bCw
	UHkO3aLm46iax2hMEuqmWdJrTo+qTlgVa0QlmU94yiusHu7drYCKHm+yP5SpqgeygRADQOfbfOA
	U2vcPW6zoVn2XOWW3pRcDS7QgwaNdPT0ksBnlxKDD1vmJCsIBm2BhdeQjuyQ7c3aVFnev9iElYv
	6tnsi3/I/6tI1WlKk1okaWJoXqsg7QBX7OkqL3enGpRbYe4=
X-Received: by 2002:a17:90b:17d2:b0:3a8:699f:959d with SMTP id 98e67ed59e1d1-3ae89812800mr2221914a91.31.1793373850770;
        Fri, 30 Oct 2026 08:24:10 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e973ac6sm9561166a91.11.2026.10.30.08.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:24:10 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/secretmem: Keep locked memory accounting until inode eviction
Date: Sat, 31 Oct 2026 00:24:06 +0900
Message-ID: <20261030152407.113568-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
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

A secretmem inode can outlive its original file. An O_PATH descriptor
opened through /proc/self/fd keeps the inode and its unevictable folios
alive after the mapping and original descriptor are closed. The file
release path nevertheless drops the locked-memory charge, allowing the
same user to reuse RLIMIT_MEMLOCK while those folios remain allocated.

Move private-state and locked-memory accounting cleanup to inode eviction,
after truncating the page cache. Keep secretmem_users active over the same
lifetime so that the hibernation guard covers retained secret pages. Let
iput() handle file-creation failures and tolerate an inode with no private
state.

Fixes: 97d34aa65c29 ("mm/secretmem: properly account locked pages")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
On an arm64 QEMU guest with an 8 KiB RLIMIT_MEMLOCK, an O_PATH reference
retained two secretmem pages. The baseline dropped the charge to zero and
allowed a further one-page fault; the patch kept both pages charged and
rejected that fault until the last path reference closed. The Image
was built with KASAN and lockdep. Hibernation, other architectures,
and long-running concurrency were not tested.

 mm/secretmem.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/mm/secretmem.c b/mm/secretmem.c
index 384f5cfc457f..fa8be360bd2a 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -185,18 +185,14 @@ static void secretmem_destroy_inode_priv(struct inode *inode)
 {
 	struct secretmem_inode_state *state = inode->i_private;
 
+	if (!state)
+		return;
+
 	secretmem_unaccount_all_folios(state);
 	free_uid(state->user);
 	kfree(state);
 	inode->i_private = NULL;
-}
-
-static int secretmem_release(struct inode *inode, struct file *file)
-{
 	atomic_dec(&secretmem_users);
-	secretmem_destroy_inode_priv(inode);
-
-	return 0;
 }
 
 static int secretmem_mmap_prepare(struct vm_area_desc *desc)
@@ -216,7 +212,6 @@ bool vma_is_secretmem(struct vm_area_struct *vma)
 }
 
 static const struct file_operations secretmem_fops = {
-	.release	= secretmem_release,
 	.mmap_prepare	= secretmem_mmap_prepare,
 };
 
@@ -274,6 +269,7 @@ static int secretmem_init_inode_priv(struct inode *inode)
 
 	state->user = get_uid(current_user());
 	inode->i_private = state;
+	atomic_inc(&secretmem_users);
 	return 0;
 }
 
@@ -296,7 +292,7 @@ static struct file *secretmem_file_create(unsigned long flags)
 				 O_RDWR | O_LARGEFILE, &secretmem_fops);
 	if (IS_ERR(file)) {
 		err = PTR_ERR(file);
-		goto err_free_priv;
+		goto err_free_inode;
 	}
 
 	mapping_set_gfp_mask(inode->i_mapping, GFP_USER);
@@ -309,11 +305,7 @@ static struct file *secretmem_file_create(unsigned long flags)
 	inode->i_mode |= S_IFREG;
 	inode->i_size = 0;
 
-	atomic_inc(&secretmem_users);
-
 	return file;
-err_free_priv:
-	secretmem_destroy_inode_priv(inode);
 err_free_inode:
 	iput(inode);
 	return ERR_PTR(err);
@@ -335,6 +327,18 @@ SYSCALL_DEFINE1(memfd_secret, unsigned int, flags)
 	return FD_ADD(flags & O_CLOEXEC, secretmem_file_create(flags));
 }
 
+static void secretmem_evict_inode(struct inode *inode)
+{
+	truncate_inode_pages_final(&inode->i_data);
+	clear_inode(inode);
+	secretmem_destroy_inode_priv(inode);
+}
+
+static const struct super_operations secretmem_super_ops = {
+	.statfs		= simple_statfs,
+	.evict_inode	= secretmem_evict_inode,
+};
+
 static int secretmem_init_fs_context(struct fs_context *fc)
 {
 	struct pseudo_fs_context *ctx;
@@ -342,6 +346,7 @@ static int secretmem_init_fs_context(struct fs_context *fc)
 	ctx = init_pseudo(fc, SECRETMEM_MAGIC);
 	if (!ctx)
 		return -ENOMEM;
+	ctx->ops = &secretmem_super_ops;
 
 	return 0;
 }
-- 
2.55.0

