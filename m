Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE7647209F
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791305191; cv=none; b=RqZ/PkW07MyCtZDEVce/br8J8GqJqUqujTNC5MYWftK13zM5NyUFCiu1UVn2xSeOG6mMj+KRC8mSYcbqty+T8hBCUU6abK6magzCPrpYtcnHiU5zb8TzP+UuKU/iUbsl/bpeZD8Oz1EcQZgKUPul2BeuTaA6lsszukuAeaDLrnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791305191; c=relaxed/simple;
	bh=PmY2/2+YeeJVj0sv07/vs1Hu1NyaLYs5j1MFToQCEf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ok3V8tFsrCt5tqxq+48GQrkZCzYtlHfFIr4aY+ApPfDcuqFRgP21lTj0oCv3pM02uZ9pvplKMLS+p2MDd6ZYEO34zyWbQKwM0jyxBf+//0x679khK9adcwhrXoc2kjtSLqvyu8TCa17WyLMXXbTv1m69ebRIoYs3yZgtCnt7USI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1srn5IR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1srn5IR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a02718da81so8745745e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791305188; x=1791909988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nYsDsdPup8U8QMnz4nrwKqf/8/44Yd6sLmVcGYR6ZYI=;
        b=V1srn5IRbjf9sTfmIZ6zvrdhHliJxZ2bl9oxVWTd39QEEc6kwI3btIbeh0X5R2KSeu
         WsRfORieSgr0um4K6SHd9+odrtI6H229qQYE1uj1DOoxD0waanuCyU/qHKFGPohCdhjF
         BhxlsmV3mAF2yPnUDu6ClkV5aFQg4kNBwimWbNa5lXkZpvZPuh3M8POzJO905sL7Dvd3
         zNQoS1nlhzPMVjS84xyqUqjS91GaQWrGQU2R5n1K9G9YXFml1CF2E3kQ8BdpZLiZMqBT
         gkxWTpB9iiq0Ows3xxrhiqSsvGJRQ0ihckicnwmjEXWRQFFqYv47T9FCSJxFD17FXw2D
         +0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791305188; x=1791909988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYsDsdPup8U8QMnz4nrwKqf/8/44Yd6sLmVcGYR6ZYI=;
        b=yReRa2es9n0Rsj7JUbNp/6ET0yqTLTRN4bee/ze3K4jXN6b8veXS3HEyVuV+sijc1B
         JeyJcuFyOa7XQCm5Y3pg29tbnTVcXq/Pmn53Ba1TltI9QHrVtOxEz3hOxkyMVS/cdC7y
         5xSOOJotGs0vo/y7PhPB0KEODrxDn5k8IqV2HgkiMfVkJoinZPr0EYIqBLJu9RFsK6jy
         TXHlRTevLzUNa3X+UkHhBjCm3g3FEhl4lBwgRmik612VEaIrzUJuTDRdrnHotTOfjh2W
         sZ2Z/taAXo22GYNXg+YgmJv6EOb0RiSgfZuHfFO7cVLSyMut0FNcCE8b3wXeI2SHJJ8m
         Z5hA==
X-Forwarded-Encrypted: i=1; AKwUvBwmPti11boVA1UczYWgvleOSZ0I83YvkYJys+wtuQ08WSw1qlyfZyQPOuilgnqEIrfCwIrjVw+i72r3eWc=@vger.kernel.org
X-Gm-Message-State: AFuF++kZZMI0aawoq048HD8i+habaslWpsfbDFfD5BYVnYm57wfqVqA8
	CHEKmex19ny7TWuu1nnlbx/hoxpNTMD8H/GX6QgdaM8uFwZ/4Aqn9XII
X-Gm-Gg: AYBFou1xX6ciTmhzKv0LoY3tsr7LEEJ4K0KGhBSYPDDycAOnY/UNwAZignaA1PzSFIw
	0bIjqrQIzksPe/dotc+ZeC2vLILPg0AEEhn/DitOnHP7eaWC0Hzm8/LVbMA/XSMr9T6epARUJGO
	p+kf/wRM9mPBL19xP0fJpv1n2yDFBsoTRIp6oihszxNNFtBltDSf0EjrHXqbIZlGFTqesuX5SDs
	Z3FlzYQCCFbLEQws0zTSKYuy7blfdKV8tytb+TbNUWeDT7waJLTXJyvgGOcNvtfhNXXhRE+Vd6N
	UvPisWrscH8hFLg/g9TCsCKvZRG4Y/2IzQqa0JNe+XMpw5zgI0rmUKefRSl2I8HP2sZGfm8Srhb
	pBuwvLhN/AbyZKrS81d+U2SgrD9P1Cz6Ltx5IQBYPepi+9bicFECMHRo3Dfjy6cQuGOyKU1nhZM
	2E+kGuLJ5T5UVqmtHPsJy9sfPUMasUTW1ZlHVgBfOblaEGQ5lJDTpfEHlvpMLOcLdx2CronHnp/
	Uakoms0
X-Received: by 2002:a05:600c:3516:b0:4a0:1efa:c74a with SMTP id 5b1f17b1804b1-4a17b53c6e9mr29983675e9.20.1791305188032;
        Tue, 06 Oct 2026 09:46:28 -0700 (PDT)
Received: from fedora.domain.name ([217.218.153.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178db8c6dsm134197405e9.14.2026.10.06.09.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:46:27 -0700 (PDT)
From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
To: tgraf@suug.ch
Cc: herbert@gondor.apana.org.au,
	akpm@linux-foundation.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Subject: [PATCH] rhashtable: move init kernel-doc to header
Date: Tue,  6 Oct 2026 20:16:19 +0330
Message-ID: <20261006164619.342010-1-ampr.mhd@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
---
 include/linux/rhashtable-types.h | 51 ++++++++++++++++++++++++++++++++
 lib/rhashtable.c                 | 51 --------------------------------
 2 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/include/linux/rhashtable-types.h b/include/linux/rhashtable-types.h
index 57c11ec9d..b35ad6ff1 100644
--- a/include/linux/rhashtable-types.h
+++ b/include/linux/rhashtable-types.h
@@ -145,6 +145,48 @@ int __rhashtable_init_noprof(struct rhashtable *ht,
 									\
 	__rhashtable_init_noprof(ht, params, &__key);			\
 })
+/**
+ * rhashtable_init - initialize a new hash table
+ * @ht:		hash table to be initialized
+ * @params:	configuration parameters
+ *
+ * Initializes a new hash table based on the provided configuration
+ * parameters. A table can be configured either with a variable or
+ * fixed length key:
+ *
+ * Configuration Example 1: Fixed length keys
+ * struct test_obj {
+ *	int			key;
+ *	void *			my_member;
+ *	struct rhash_head	node;
+ * };
+ *
+ * struct rhashtable_params params = {
+ *	.head_offset = offsetof(struct test_obj, node),
+ *	.key_offset = offsetof(struct test_obj, key),
+ *	.key_len = sizeof(int),
+ *	.hashfn = jhash,
+ * };
+ *
+ * Configuration Example 2: Variable length keys
+ * struct test_obj {
+ *	[...]
+ *	struct rhash_head	node;
+ * };
+ *
+ * u32 my_hash_fn(const void *data, u32 len, u32 seed)
+ * {
+ *	struct test_obj *obj = data;
+ *
+ *	return [... hash ...];
+ * }
+ *
+ * struct rhashtable_params params = {
+ *	.head_offset = offsetof(struct test_obj, node),
+ *	.hashfn = jhash,
+ *	.obj_hashfn = my_hash_fn,
+ * };
+ */
 #define rhashtable_init(...)	alloc_hooks(rhashtable_init_noprof(__VA_ARGS__))
 
 int __rhltable_init_noprof(struct rhltable *hlt,
@@ -156,6 +198,15 @@ int __rhltable_init_noprof(struct rhltable *hlt,
 									\
 	__rhltable_init_noprof(hlt, params, &__key);			\
 })
+/**
+ * rhltable_init - initialize a new hash list table
+ * @hlt:	hash list table to be initialized
+ * @params:	configuration parameters
+ *
+ * Initializes a new hash list table.
+ *
+ * See documentation for rhashtable_init.
+ */
 #define rhltable_init(...)	alloc_hooks(rhltable_init_noprof(__VA_ARGS__))
 
 #endif /* _LINUX_RHASHTABLE_TYPES_H */
diff --git a/lib/rhashtable.c b/lib/rhashtable.c
index 6362896e4..5f53b4c71 100644
--- a/lib/rhashtable.c
+++ b/lib/rhashtable.c
@@ -1120,48 +1120,6 @@ static u32 rhashtable_jhash2(const void *key, u32 length, u32 seed)
 	return jhash2(key, length, seed);
 }
 
-/**
- * rhashtable_init - initialize a new hash table
- * @ht:		hash table to be initialized
- * @params:	configuration parameters
- *
- * Initializes a new hash table based on the provided configuration
- * parameters. A table can be configured either with a variable or
- * fixed length key:
- *
- * Configuration Example 1: Fixed length keys
- * struct test_obj {
- *	int			key;
- *	void *			my_member;
- *	struct rhash_head	node;
- * };
- *
- * struct rhashtable_params params = {
- *	.head_offset = offsetof(struct test_obj, node),
- *	.key_offset = offsetof(struct test_obj, key),
- *	.key_len = sizeof(int),
- *	.hashfn = jhash,
- * };
- *
- * Configuration Example 2: Variable length keys
- * struct test_obj {
- *	[...]
- *	struct rhash_head	node;
- * };
- *
- * u32 my_hash_fn(const void *data, u32 len, u32 seed)
- * {
- *	struct test_obj *obj = data;
- *
- *	return [... hash ...];
- * }
- *
- * struct rhashtable_params params = {
- *	.head_offset = offsetof(struct test_obj, node),
- *	.hashfn = jhash,
- *	.obj_hashfn = my_hash_fn,
- * };
- */
 int __rhashtable_init_noprof(struct rhashtable *ht,
 		    const struct rhashtable_params *params,
 		    struct lock_class_key *key)
@@ -1228,15 +1186,6 @@ int __rhashtable_init_noprof(struct rhashtable *ht,
 }
 EXPORT_SYMBOL_GPL(__rhashtable_init_noprof);
 
-/**
- * rhltable_init - initialize a new hash list table
- * @hlt:	hash list table to be initialized
- * @params:	configuration parameters
- *
- * Initializes a new hash list table.
- *
- * See documentation for rhashtable_init.
- */
 int __rhltable_init_noprof(struct rhltable *hlt,
 			   const struct rhashtable_params *params,
 			   struct lock_class_key *key)
-- 
2.55.0

