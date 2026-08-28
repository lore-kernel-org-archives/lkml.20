Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34CB3F1078
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906977; cv=none; b=YQBTgIH6RZphMZuev36lQSKfLDxZnVRlCPL5fe04UnIx5o2ARy8uQakTswI/f8rEc8d0k5eCK/JhtIMAsRPTKX+4tQ33U/UjaSYM/s5k5nkyH87SDCLkfboTsU6CqAvUSpNdc8DitefaoLZ+7sMXrXY/Da2UZLJODYvNC7CyWOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906977; c=relaxed/simple;
	bh=0EpETBmRMTegSB2DwB/3BrNMgFfRz9e+NoMGrl22bR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dqBkaUdEEv3NFyM3a61ESUhrPLz6sSje6C7p+PyKAd1PabHXN4VKFGckrxX1cx0uNWVb8CJ/jAS5XJRc4xnMtieWhcBC+dYxNvrZvZ2Y5kqhcZ7KKifY1DQgfVRcBpYh4RXacW8XB9k530FDM1aZdoUZjdoEWCMUmDcu3inQcg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBN0ywQ9; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBN0ywQ9"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d712281f8bso8909395ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787906970; x=1788511770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lBCqnFd2ROR09ubLzgkPheF5ruoB300JChyTgSHw5pM=;
        b=MBN0ywQ9/jg5Sea8xqGYapMmkG/TbpJCVdB8N5WQCaxICE2lvclg/q2DxnP80XZ1dQ
         iDOqQZh8K4BasEu6CHgW0VOzQByjEKVY6PFAd4vOKjVPC8kxMk4w33b7zvvAp09J0dHT
         q5Fb3f8jW3xWF5m342RZgYQhTaBUDHaUfo3QMXEMWVzSrj7xLOEBOPVkBDiii69qFf4h
         Xv/B0uLYMZ9iTXS+0YGlskDCojSbBQlyx36HPhRsxSUnfDmfZgRgWQl2PILblV90BmYe
         FjtsbhGC1usPGirNXBHtFlla00hdhHyt3Of8Cn5YV2tg7eHL+BNOxgZqRHKk+0xqvVuB
         8psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906970; x=1788511770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lBCqnFd2ROR09ubLzgkPheF5ruoB300JChyTgSHw5pM=;
        b=rgHB9tJae691caoa2WJCIei2hBbHh2XWhX5rF4DGHWSkntmgp5z/DF9SUv37o6YjfJ
         a8nUaD7hI5TvzMGSU5l/jQXUf5xmzFwvfHQtakhC+NDI2aFL+n0KnD56nLSAFyuecmaT
         czRx+blawkPq2EmClC1u51ewb2iypXrtb7EUxuu2SD+CgRYSWxt0Fh7P6HhILk9Mt3oc
         nuLj2ydfoltwp870ooOSzddk+MdUNEoz9cZ56cXYShW+q2x2it9YjnEX0nNrkmrDp21d
         /nPZ00+VnMrhKXsCsxuhBsfaBVOjwPbaLv32ZCUPc692edslURL8Z0iINn1dUEEGO12n
         Mx6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq9bA9+5nj2llz+J/NZpz2fhwm2uoGmrJ1P8E6P9ZExqAUeQ2xzKpZlYEI3oDsOO5iVG37tnKKz8Y+iEZE=@vger.kernel.org
X-Gm-Message-State: AFuF++k13Y5FO+rWvD+Bkv18uMe6xkp8t1DktjHvhL88OSEjU8gWdv5W
	7bj4MMYIS9YZJLs3QX1RdS821EiEvOfSmPn353kaT2ktIFUwuevx4Khj
X-Gm-Gg: AR+sD10TQCaA7/Xu1wzkrRlgXKC3lisFO4+CKzMjnKrHolrcqSPW0dpgYuU1iYI7X0t
	rI/HuKQUDeR8DoXsT13NXhpukrURentCpvRHuO31mFuwLTazRrpiy6c0APuyvjUEXRgr7MF7MoO
	2WP4OsKMjv3P8eX/RVykjCX9xExf3mwfTSUv2Eko/A9oD5n8Xt3xbEJ9Q3VuDB0B6V8mHIG6Jzg
	4UsyWVDtdUkqDGXEzGiTXzZze3gvBhKjirQM5KvyXY5FXqR/bpFvtbgmPUTUIe8GoTtGO8Nx1kA
	n7ajE0EzTOMdWa7aejBL5Izo946jB/oc4RYJXejiUiVxTyFv7A6scdCZVx10GluVqsDXMr9tpqe
	VoSQDEY290aboa5wZZWGy1SW2cOFqW0g2Loi+suUfqx3BRjtx0LEFn/joAdjzNKHYqD4zeJyJ4J
	Qd7/uf8DN22cpJWuYFJjP0ty6xVCSZECBFy/+KVZpNU5oFCPdimFaeAhxltrc=
X-Received: by 2002:a17:90b:39ab:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-396d0f74e3cmr10497076a91.10.1787906970180;
        Fri, 28 Aug 2026 01:49:30 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:a97:707e:a14f:cfbf:3e23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0dc898dsm4040503c88.9.2026.08.28.01.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:49:29 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 7/9] crash_dump: Check the function return codes in restore_dm_crypt_keys_to_thread_keyring
Date: Fri, 28 Aug 2026 16:48:53 +0800
Message-ID: <20260828084900.1496839-8-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828084900.1496839-1-coiby.xu@gmail.com>
References: <20260828084900.1496839-1-coiby.xu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We should check the return codes so we can abort if keyring allocation
or reading old memory fails.

Note there is no need to refer a key add_key_to_keyring, so delete
related code.

Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 kernel/crash_dump_dm_crypt.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index e82693df73fb..b7629174e4db 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -66,7 +66,7 @@ static int add_key_to_keyring(struct dm_crypt_key *dm_key,
 			      key_ref_t keyring_ref)
 {
 	key_ref_t key_ref;
-	int r;
+	int r = 0;
 
 	/* create or update the requested key and add it to the target keyring */
 	key_ref = key_create_or_update(keyring_ref, "user", dm_key->key_desc,
@@ -74,8 +74,6 @@ static int add_key_to_keyring(struct dm_crypt_key *dm_key,
 				       KEY_USR_ALL, KEY_ALLOC_IN_QUOTA);
 
 	if (!IS_ERR(key_ref)) {
-		r = key_ref_to_ptr(key_ref)->serial;
-		key_ref_put(key_ref);
 		pr_debug("Success adding key %s\n", dm_key->key_desc);
 	} else {
 		r = PTR_ERR(key_ref);
@@ -134,9 +132,14 @@ static int restore_dm_crypt_keys_to_thread_keyring(void)
 	}
 
 	addr = dm_crypt_keys_addr;
-	dm_crypt_keys_read((char *)&key_count, sizeof(key_count), &addr);
+	ret = dm_crypt_keys_read((char *)&key_count, sizeof(key_count), &addr);
+	if (ret < 0) {
+		pr_err("Failed to read the number of dm-crypt keys\n");
+		goto out;
+	}
+
 	if (key_count > KEY_NUM_MAX) {
-		pr_warn("Failed to read the number of dm-crypt keys\n");
+		pr_warn("Read %u dm-crypt keys (max=%u)\n", key_count, KEY_NUM_MAX);
 		ret = -1;
 		goto out;
 	}
@@ -151,12 +154,18 @@ static int restore_dm_crypt_keys_to_thread_keyring(void)
 		goto out;
 	}
 
-	dm_crypt_keys_read((char *)keys_header, keys_header_size, &addr);
+	ret = dm_crypt_keys_read((char *)keys_header, keys_header_size, &addr);
+	if (ret < 0) {
+		pr_err("Failed to read dm-crypt keys\n");
+		goto out;
+	}
 
 	for (int i = 0; i < keys_header->total_keys; i++) {
 		key = &keys_header->keys[i];
 		pr_debug("Get key (size=%u)\n", key->key_size);
-		add_key_to_keyring(key, keyring_ref);
+		ret = add_key_to_keyring(key, keyring_ref);
+		if (ret)
+			break;
 	}
 
 out:
-- 
2.55.0

