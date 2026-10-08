Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8242490BF0
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453546; cv=none; b=MSwviVTmE5Z9kkDoDJvBqrBu8qtMuF7rI5jUQekDNlO02aND+fgfwHW6YR2E2ANPd2xJv4GuUD7R2jAoZ3ElcGB4pOY+h+nIYpZ8Ig3mgAJhHUvI26mBXmJC+aEtMWAf2ELOA0u3N+z5EJzvsI0DmMZKlosQPeNL7nPCYsCOu6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453546; c=relaxed/simple;
	bh=Z6qaIxJaGingMaN4boaRDh9T/UM3Xnfmj7Q0/xVd3ak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ra78/vAkZRUaoX6GsGiBUwq2iajnEZZMzcAgdSqfV2vjZwaG2jgslN/SSp7wzDOfRTf613UbzVg04tucBvc/MJuEorFz5tMgW4plt17RLLqT8HJ0RWgxxy6QYG8mUdI0x1vXhkFbrOZ6NxudbuepBf8aesaQaKHbP80Yz5N55TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7sLT64H; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7sLT64H"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-381b831d535so4967914a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791453538; x=1792058338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0DcNR8Cbv/4VUc/D14BhTK0gGtmFxfgJ4zGRefSiR7M=;
        b=P7sLT64HLDGLgl3w/pTIsOgwGpeY6xRkUJgeWCq4GeSbv8tANNqh7WUr2gNcQVKyxI
         lx5P9JNEveqiZbfb+l+boOJTlOcc5MCytE/n0JTnyMRsJitLKo9Ed0Y2UmV5RC3KHiNS
         2smh4ECluK62bhrNZ8VmFR6ifHloJet+Pl2nUWXWgYQVZf20/Guumrx52Y1w9Z0oiomU
         pNG9ejuUhLdZaCRgY0FdrnksHjRChR7oHPriMow05pho2HQA30+CajGLK2bV2Mo76NYG
         VJBASUJ2o2sXot9IcbAufqW2w9EwW9nN8Er233qp1C3BRk0VzFKvRyjcQs2sIe7jBUHl
         dIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453538; x=1792058338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0DcNR8Cbv/4VUc/D14BhTK0gGtmFxfgJ4zGRefSiR7M=;
        b=TN8s8C6iVI3t77dijJdHrX4SlxbcX4anzosaYm1EXSGjRBlk9brwpZHHFpgoMwRYY/
         UaspzA0hjwpiEc2HS6fsuJwfMk/KVo6rXw15h01pA6ijlhC1ygqNQnPKtZAnDMC1bQGJ
         RAxV2n9RwEuXLLiJ49/zSzhTpxIMcLLVTeG/5n0wx1MzjFTd+zAnogqZIlmB5jENx4yj
         bZ8gu+gBGHK6Q4stkQ+XqV0W7GvM4xCCa1p699JDR4XQbB/a0pXX2vpY8BwqU4IQ6QPZ
         m+kVd6WnatpL0Ue4tzMDHybaUeQMn6YRbwh31LGQqpUuVDhX/DP2yCQZ8rU0EUkI8DlG
         PFdw==
X-Forwarded-Encrypted: i=1; AKwUvBz1aeo92P0F9Zvmok88sJ/xDtBGzRIOBISCaVvgJ9xWvwuqtujDImDBU9dJqGLeuDoyJ3RVEFoId1NUXhg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNYw1id184GrRCR/VOM5n9SaoKmQaquATO68rZ2T61pArL1Lzb
	A5eAlGu52kfomKJ20ahPXvM37S0DPrj9UXIcC9kURJXm1+LlUqK24kwf
X-Gm-Gg: AYBFou0zEEgT37Sz/0kAcQuLtsw78kAx7udROjnp1HfYDLBCGnSoW8tmgpMwzUTPOIP
	KkwE1YiERDNAzS0iSDN/8Uj+C36i3NFFP9eEG4mwy7qvrOhLndatdE/qlgkXKfBtxLgwZFHjcwi
	VBdbFZd4nt4nLI8h/FgYgedrnzKZ5jPdx4v20BQJIFBgbhFIvuzfCNUKcCGvKD1jHZqkBxOyWOe
	nbcZFucV1DcYy75Ru+pAgVn4vHJk00L3bGDMztgWNARkyNvl8e2FNTZDL5FjkaG2Uhis01e0UlO
	Vee6GEqT2aiCVc7EBzRDwBlO3hASg3ZsECM+S2HO1t8yjJD0KTmsiQ3DbU7qrHY9gyjsFI0s4Kj
	tSFr1+eSyv18tm/YxT7Jh8R4pvbSs/pnsG1XBdC0GLPsAY3S60WNvFhrrRtzKd6yx813MSqwTQT
	45Qo7chJHk3Lt/7xPfo0xCfKkHg3j+ix1ar4+PH540eOu0CUCIR874Dv4MleQfZBoPM5s8XBH1Y
	QH0hyoPEvnKH7zCrkiW525+qpUtX51ynl81ExZliuuV24OF6Csae2rR
X-Received: by 2002:a17:90b:48c7:b0:39d:e213:9dd3 with SMTP id 98e67ed59e1d1-3a8a04bbc3cmr4012686a91.1.1791453537970;
        Thu, 08 Oct 2026 02:58:57 -0700 (PDT)
Received: from yafangs-Air ([240e:46c:2100:3ace:b801:9432:769f:ff9d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7ff13esm3422790a91.7.2026.10.08.02.58.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 02:58:57 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: jpoimboe@kernel.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org
Cc: live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v11 3/9] livepatch: Make klp_find_func() non static
Date: Thu,  8 Oct 2026 17:58:24 +0800
Message-ID: <20261008095830.26308-4-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261008095830.26308-1-laoar.shao@gmail.com>
References: <20261008095830.26308-1-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make klp_find_func() non static to allow its use in other source files
by an upcoming patch.

While at it, rename the parameter @old_func to @func to better reflect
its generic purpose.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Song Liu <song@kernel.org>
Acked-by: Miroslav Benes <mbenes@suse.cz>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>
---
 kernel/livepatch/core.c | 18 +++++++++---------
 kernel/livepatch/core.h |  1 +
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index 517fe427ff92..89251fafe86e 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -82,21 +82,21 @@ static bool klp_initialized(void)
 	return !!klp_root_kobj;
 }
 
-static struct klp_func *klp_find_func(struct klp_object *obj,
-				      struct klp_func *old_func)
+/* Check if @func is present in @obj. */
+struct klp_func *klp_find_func(struct klp_object *obj, struct klp_func *func)
 {
-	struct klp_func *func;
+	struct klp_func *obj_func;
 
-	klp_for_each_func(obj, func) {
+	klp_for_each_func(obj, obj_func) {
 		/*
 		 * Besides identical old_sympos, also consider old_sympos
 		 * of 0 and 1 are identical.
 		 */
-		if ((strcmp(old_func->old_name, func->old_name) == 0) &&
-		    ((old_func->old_sympos == func->old_sympos) ||
-		     (old_func->old_sympos == 0 && func->old_sympos == 1) ||
-		     (old_func->old_sympos == 1 && func->old_sympos == 0))) {
-			return func;
+		if ((strcmp(obj_func->old_name, func->old_name) == 0) &&
+		    ((obj_func->old_sympos == func->old_sympos) ||
+		     (obj_func->old_sympos == 0 && func->old_sympos == 1) ||
+		     (obj_func->old_sympos == 1 && func->old_sympos == 0))) {
+			return obj_func;
 		}
 	}
 
diff --git a/kernel/livepatch/core.h b/kernel/livepatch/core.h
index 38209c7361b6..361a0917a03f 100644
--- a/kernel/livepatch/core.h
+++ b/kernel/livepatch/core.h
@@ -17,6 +17,7 @@ void klp_free_patch_async(struct klp_patch *patch);
 void klp_free_replaced_patches_async(struct klp_patch *new_patch);
 void klp_unpatch_replaced_patches(struct klp_patch *new_patch);
 void klp_discard_nops(struct klp_patch *new_patch);
+struct klp_func *klp_find_func(struct klp_object *obj, struct klp_func *func);
 
 static inline bool klp_is_object_loaded(struct klp_object *obj)
 {
-- 
2.52.0

