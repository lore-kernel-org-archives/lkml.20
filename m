Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12AC38D3E2
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856758; cv=none; b=KRvsjUQi9LyuCWfpFxNf1dV0UoroSFhyjesICXxRuhpAghV0N0qgcrDj4ZKZH8kYvFeg03dbzoFT1aXlNTrnzuZdBF4JOug988/FAjQmmFri+JEJXdAInovLfx1AN2722eK/5uiATb1hyPTrdsQk4zkVjKN7e3gLLPVUeHCHZFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856758; c=relaxed/simple;
	bh=3uk51tS1mYUgZHNG/UdKJaqCGmFIXOIh/0REyH694DE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SLq0smBw7PnT9IJPZ2qutpXV9SxkTuqCihjlCv8aSmoi3iZVc2yg5vEk9ToAbSH/qHOfCVWvp1LP3ZMEOtRp/HhI+ujIyHR1gmX12sWumSq9jKa71//KQVuovQdlEgYBGUZhYYe4jpQoyFSWIQBCTCJnwL5RZwIbrwAcUYfRjBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAEGlIOD; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAEGlIOD"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so1977579b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856756; x=1790461556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KOoxuMhgY6m8DdTXUHscRdC+zhj/Vf9kYVS3vMLfy/w=;
        b=fAEGlIODIBTu1WF0ZFe50otQcDoMDsZi0gnl5b9Yi+vpk+MGzbkYMzsaOezuZZQ7jt
         vDMAIbaHARjmDs0CXXqoOdL1EVIPUMZKaaYaz/4v+uxdhnlab+vdUrwNCUxtcFrZPLq8
         O+tDBNb3JcCbKPPs+a8SL/e4gmwfZUQKcFe+qqsmiQxsJOrODSbOpelnliGhN3TgCAF6
         BXm1m+671g50YemFwz2xOWe/H8Hgw1nRI17DVa4TOhHLXCOtEXVr7u98iC15O3SZfE0K
         ZfbTmWSTpwowmny/ZLJHxOOO22CcB3ysNKLuyDGKyfLXQ6e11DLo8s2Gj5BDN+99CY4k
         AogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856756; x=1790461556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KOoxuMhgY6m8DdTXUHscRdC+zhj/Vf9kYVS3vMLfy/w=;
        b=jTNytgaAHqdX06VKyn6e0doayt07n+mxmT3s07a4FJeIiH6V/4cwTTwIa6OBSYbroo
         FaJR7ZtwwfnOXbMGpGQ7NSUBSVq3BSlJcDagnDZbwj9CHnU5Ai0aHjB5yXR9I12q+cBu
         7Td18J3gKLjBehWaLwUXQVvWGUJDsPC1nHrWDxM+RqhiyWVdB10LXWxjLdsEPYtTC0aU
         7i1KFBrV4mkh7qQrAFdV8w7cTUQhhcr68JHq1jCnyY+dJaEJTBzyyAyR7FWawlHIu3Eb
         5Ng9LT2ss79N1/Cjs9GDKHN+4kaDgPrhEdBlvoE/s6BO9Usp26Xl33esNCIoHwKvKwmK
         JJPQ==
X-Forwarded-Encrypted: i=1; AKwUvByMTs60XEaUU7yojJ4QuYdImTp0bbAoJ0iwGEQYNoL4RW4PXz2V72SEBkfAEdb0PXseV6jwZPQNTGa4Hyc=@vger.kernel.org
X-Gm-Message-State: AFuF++kwT8UEGSv/MQaU0UX6cwTiEPJSFWKtiBh2jyZEz7ep9kq/4C+u
	+BSDyISwj14gs7Q87PHwnrqY19G9Ju3hucCiirXQFn1Gs6lM3GYEEWNf
X-Gm-Gg: AYBFou0TGe5XugzufZPLsj8+7ZheSHTPzh+J1XhXNhlWilfdV3zK5hmuKCmRCxP/BO/
	ptiNOUbvgoIUuFF03Cg6k4cKxXVBp93dwUJLPPe5hrVCOyhFfYtdWQGIzFx+5t/021Uc1Hj8VvY
	4JTTAdqnv8hymR30xSn03cVdjXAOa0QGilqvsnA2yMciQauFAGRQMI79EXz8D7HJ6+AAKkcGF0h
	NsQL09y+j+OK/KvpiJ5DH1l61jkxKiq7qdUQifRSI0ehzXNiiN9cJtfhDNMAR1sPd3eI6fqdE0o
	wQHFawPeO/z64PQjpucUC9aHLLiy6znuTwBo0qaR9KvOt8MRCnOphkfGpc9QEMjdhqqe3yps/Rh
	4voMYR/Y1PW6/ONjYT0gytCoPpEWyLUH9+0qanfrrVDbqtZDluHKm7hlRVnhXhW62lOMdEQz41v
	/unluYWstaUwcn2pus+P33Vmbd7zG6+WFxzVCaHLdsfr1WTRXvGBTEZKPydz6zRhcuNFg67cFdY
	iWIvCKtFiRFg3XN/Tz+Ca3fJjz8UABQqg6//xfBPGUkVmgnzMKAmYJa3QvTM7dF/PeatYN1E5Bi
	x5Ck0P5tVA==
X-Received: by 2002:a05:6300:2208:b0:3dd:a197:cf1d with SMTP id adf61e73a8af0-3dda197d752mr4625102637.65.1789856756331;
        Sat, 19 Sep 2026 15:25:56 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72aefc0a6sm1360118a12.28.2026.09.19.15.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:25:55 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: luisbg@kernel.org,
	salah.triki@gmail.com,
	brauner@kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] befs: check NULL return from befs_bt_get_key() and fix keysize in befs_btree_read()
Date: Sat, 19 Sep 2026 22:25:55 +0000
Message-ID: <20260919222555.3792599-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two issues in fs/befs/:

1. In befs_btree_find() and befs_btree_read() (fs/befs/btree.c), check
   for a NULL return from befs_bt_get_key() when a corrupted B+tree node
   has out-of-bounds key offsets or lengths.
2. In befs_btree_read() and befs_readdir() (fs/befs/linuxvfs.c), set
   keysize from the actual copied string length rather than the raw
   buffer size so uninitialized stack bytes are not passed to filldir().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/fs/befs/btree.c b/fs/befs/btree.c
index aa24f1daccdd..67633e5f27fe 100644
--- a/fs/befs/btree.c
+++ b/fs/befs/btree.c
@@ -219,6 +219,19 @@ befs_bt_read_node(struct super_block *sb, const befs_data_stream *ds,
 	node->head.all_key_length =
 	    fs16_to_cpu(sb, node->od_node->all_key_length);
 
+	{
+		size_t keylen_off = round_up(sizeof(befs_btree_nodehead) +
+					     node->head.all_key_length, 8);
+		size_t total_needed = keylen_off +
+			(size_t)node->head.all_key_count * (sizeof(fs16) + sizeof(fs64));
+		if (off >= node->bh->b_size ||
+		    total_needed > node->bh->b_size - off) {
+			brelse(node->bh);
+			node->bh = NULL;
+			return BEFS_ERR;
+		}
+	}
+
 	befs_debug(sb, "<--- %s", __func__);
 	return BEFS_OK;
 }
@@ -343,6 +356,8 @@ befs_find_key(struct super_block *sb, struct befs_btree_node *node,
 	/* if node can not contain key, just skip this node */
 	last = node->head.all_key_count - 1;
 	thiskey = befs_bt_get_key(sb, node, last, &keylen);
+	if (!thiskey)
+		return BEFS_BT_NOT_FOUND;
 
 	eq = befs_compare_strings(thiskey, keylen, findkey, findkey_len);
 	if (eq < 0) {
@@ -360,6 +375,8 @@ befs_find_key(struct super_block *sb, struct befs_btree_node *node,
 		befs_debug(sb, "first: %d, last: %d, mid: %d", first, last,
 			   mid);
 		thiskey = befs_bt_get_key(sb, node, mid, &keylen);
+		if (!thiskey)
+			return BEFS_BT_NOT_FOUND;
 		eq = befs_compare_strings(thiskey, keylen, findkey,
 					  findkey_len);
 
@@ -417,6 +434,7 @@ befs_btree_read(struct super_block *sb, const befs_data_stream *ds,
 	int cur_key;
 	fs64 *valarray;
 	char *keystart;
+	ssize_t copy_len;
 	u16 keylen;
 	int res;
 
@@ -487,6 +505,10 @@ befs_btree_read(struct super_block *sb, const befs_data_stream *ds,
 	valarray = befs_bt_valarray(this_node);
 
 	keystart = befs_bt_get_key(sb, this_node, cur_key, &keylen);
+	if (!keystart) {
+		brelse(this_node->bh);
+		goto error_alloc;
+	}
 
 	befs_debug(sb, "Read [%llu,%d]: keysize %d",
 		   (long long unsigned int)node_off, (int)cur_key,
@@ -499,9 +521,9 @@ befs_btree_read(struct super_block *sb, const befs_data_stream *ds,
 		goto error_alloc;
 	}
 
-	strscpy(keybuf, keystart, keylen + 1);
+	copy_len = strscpy(keybuf, keystart, keylen + 1);
+	*keysize = (copy_len < 0) ? keylen : copy_len;
 	*value = fs64_to_cpu(sb, valarray[cur_key]);
-	*keysize = keylen;
 
 	befs_debug(sb, "Read [%llu,%d]: Key \"%.*s\", Value %llu", node_off,
 		   cur_key, keylen, keybuf, *value);
@@ -678,7 +700,7 @@ befs_bt_get_key(struct super_block *sb, struct befs_btree_node *node,
 	char *keystart;
 	fs16 *keylen_index;
 
-	if (index < 0 || index > node->head.all_key_count) {
+	if (index < 0 || index >= node->head.all_key_count) {
 		*keylen = 0;
 		return NULL;
 	}
@@ -691,6 +713,12 @@ befs_bt_get_key(struct super_block *sb, struct befs_btree_node *node,
 	else
 		prev_key_end = fs16_to_cpu(sb, keylen_index[index - 1]);
 
+	if (fs16_to_cpu(sb, keylen_index[index]) < prev_key_end ||
+	    fs16_to_cpu(sb, keylen_index[index]) > node->head.all_key_length) {
+		*keylen = 0;
+		return NULL;
+	}
+
 	*keylen = fs16_to_cpu(sb, keylen_index[index]) - prev_key_end;
 
 	return keystart + prev_key_end;
diff --git a/fs/befs/linuxvfs.c b/fs/befs/linuxvfs.c
index ee0cbae521b9..de3be4d61c80 100644
--- a/fs/befs/linuxvfs.c
+++ b/fs/befs/linuxvfs.c
@@ -222,7 +222,7 @@ befs_readdir(struct file *file, struct dir_context *ctx)
 	befs_off_t value;
 	int result;
 	size_t keysize;
-	char keybuf[BEFS_NAME_LEN + 1];
+	char keybuf[BEFS_NAME_LEN + 1] = { 0 };
 
 	befs_debug(sb, "---> %s name %pD, inode %llu, ctx->pos %lld",
 		  __func__, file, inode->i_ino, ctx->pos);
