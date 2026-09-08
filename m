Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1166549393
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873248; cv=none; b=H+TNRqg6i2qLxdXl9kwDDgTsXOk1X6r4NoQq/e7BaTWyiA845fowt4i3GzkvAR5sMkxWq1rA15JK7B/3rAzlvrRJDLQM2ktjj5558veT24Q3R2F6K+YL2C6RMOueq/AI8mKQQgu8GFhLq6JxjmqaEEhMNbJdCIlsorbY2jIgc4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873248; c=relaxed/simple;
	bh=xYmnteVtSbEvwPmbuzw2S9jQ0YjnKg/22WBt3FP6+Xw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OLqpioxXrP+gBluc3RAebJJKL5e/Now4a78korcREPlfRFhN8EHfNxEKuaQY5xrfMA4f/tNq2Naz0bJyJeFk4+7fcro8LYzjSKOm0xFvDAWC45z3C/aRJ5HLcKGE42SrX3kajPM0Z4xCsawVsfTFLsF2vHQJfhxfBVkuR8rv+Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXvPaTBC; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXvPaTBC"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c250c6a6a9aso762651266b.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788873239; x=1789478039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feAXqKN1iMgDWT0yxjPZBEzrVPGz+wLdhMnnl2MxBJE=;
        b=CXvPaTBC5lgfuAWAh9DSp6XesBiJNbyYspr1va1cPkgCEQ43E6MPr9XrdLLnJ3HIQM
         +jFIGiDVoaPiXZrjBpd6jn1pXsUNGtTlhPTuQMc8CD4U4SjvLoyqPCfSOMEIG9lkv57z
         yb+CDOdDwbn1RVwqAm0pPqYaKGH5az8xClgMZiB4wilVS4T+ZIxo1oNOuMeM9Gy0kDGn
         DZqJQ658yQYoMckA7KXJ4kBD1+OYW2Uhor8vWYmqiOjRQpfMQX6w7ecYAvfsVB54qh3a
         DpwRgky+KxZjhWNDDw61u5psiCbSQziHVNeWd9ekWcSkg30iDjAO97p0tceU6ujJ19+M
         XKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873239; x=1789478039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=feAXqKN1iMgDWT0yxjPZBEzrVPGz+wLdhMnnl2MxBJE=;
        b=emouNLMSx6XYe1TzvYh2dOi73/xnM7ZzeBs7a6qdAMmCmW4c4x+kYGijTbREAtN9K0
         LTAhrJiLCVJLotmsCgfjdOHboFwiu95v7eoAoIhquGroGqd7XUpst+t09w1SizoCDhUI
         /6Z7eRpbQ3NcXOrffz8nfclF8kE+iuIpO5jsoSmOVbV7XH1+eln0f5LiVXS5U3LgCLEp
         61InCFMA9jKkciSyXNUUYr+AiFlgetia6XHWHueBsY8Y+bF4U7gkZgX8pzmHBsjzDqsV
         4ZVY8iBywOEcqgRkbe9bQfJ4zTJg83/lOCs7yJID7Pqz98S9HYsEPoBZY5Ip8BitH90I
         glrg==
X-Forwarded-Encrypted: i=1; AKwUvByyDO7he9wB8VvehNCJTKNm1igh+oV0MyU+qiWChr/2QBdkOoucYfVDYv8XqqxfbwKkNvwUrlWRwM+dp8s=@vger.kernel.org
X-Gm-Message-State: AFuF++kULi6F1g7dPrSFGsNycmKtQGHh3hpfTjlSaepMdZK3NGyYx/ms
	9cp3mSNSwHDDE1q0BIAwoljZ1MX94Jgzr28/pkp6UBF6LkJ6wCA5AUE6
X-Gm-Gg: AYBFou17KRE80yqLq5urvsrSxor9BobleSWZY7LjvBNM1BkU2Z1ypsIs1z6KUbsuDOK
	y+6KaDX5cpb7M7QxKz0coXBkdGaZorKmQibl7fqFPpSA6WkFXPXSKZYIQ0JxigM8Stczg1SyeCl
	CRzf9s0cAX/gFSWpapuEYJn1Uf0Su4Ewr7ogR4w2kvPh2me4iZntdz70P56X2zWyALN7biY9Bjf
	sSYIBAmge6PU92vepl/3r2GbyKmhpqS1aifjmqAcXVVra1Xbz4MeuR6s/pXTG1ok4RIPtoNaciL
	hLlkBiXatgfCZHhiNoy995QjxnQAc1K2r75RWtNc1ISSs0XoeexECgByMK3eqe8BEP3AnC/ctUM
	hz50mWch6HjlM5LQVoskELviSTxMlKJk8gsndWI2oCm5f/9ra6jhHjAmwfCyLDVfEt5n89Q50cw
	yCIpVUPAxlw4UGKRld9pStpE5wF+WwCJ8fEHPWRguml41Um0cxFw==
X-Received: by 2002:a17:907:d87:b0:c25:504a:1e25 with SMTP id a640c23a62f3a-c260cbd2d02mr1995012366b.13.1788873238868;
        Tue, 08 Sep 2026 06:13:58 -0700 (PDT)
Received: from [127.0.0.1] ([2a09:bac6:37a9:1e5a::306:1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6e1c93sm625170866b.63.2026.09.08.06.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:13:56 -0700 (PDT)
From: Caleb Kan <calebkan1106@gmail.com>
Date: Tue, 08 Sep 2026 14:13:39 +0100
Subject: [PATCH RFC v2 06/11] mm/slub: materialize trie-backed stack depot
 traces
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-stackdepot-trie-v2-6-1996d5cef732@cloudflare.com>
References: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
In-Reply-To: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, Vlastimil Babka <vbabka@kernel.org>, 
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Oscar Salvador <osalvador@suse.de>, Caleb Kan <ckan@cloudflare.com>, 
 kernel-team@cloudflare.com
X-Mailer: b4 0.16.0

From: Caleb Kan <ckan@cloudflare.com>

SLUB owner tracking stores allocation and free stacks as persistent stack
depot handles. Trie-backed handles do not expose contiguous stack-record
entries, so __kmem_obj_info() and the alloc_traces and free_traces debugfs
files cannot use stack_depot_fetch().

Use stack_depot_fetch_into() with TRACK_ADDRS_COUNT-sized local arrays.
This matches the save-side limit. Keep the existing KS_ADDRS_COUNT copy
limit and debugfs formatting unchanged for hash-backed handles. Continue
to copy or print no frames when the fetch returns zero.

Signed-off-by: Caleb Kan <ckan@cloudflare.com>
---
 mm/slub.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index f9b56cb439e7..4aa1c5a45718 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -8198,12 +8198,12 @@ void __kmem_obj_info(struct kmem_obj_info *kpp, void *object, struct slab *slab)
 #ifdef CONFIG_STACKDEPOT
 	{
 		depot_stack_handle_t handle;
-		unsigned long *entries;
+		unsigned long entries[TRACK_ADDRS_COUNT];
 		unsigned int nr_entries;
 
 		handle = READ_ONCE(trackp->handle);
 		if (handle) {
-			nr_entries = stack_depot_fetch(handle, &entries);
+			nr_entries = stack_depot_fetch_into(handle, entries, ARRAY_SIZE(entries));
 			for (i = 0; i < KS_ADDRS_COUNT && i < nr_entries; i++)
 				kpp->kp_stack[i] = (void *)entries[i];
 		}
@@ -8211,7 +8211,7 @@ void __kmem_obj_info(struct kmem_obj_info *kpp, void *object, struct slab *slab)
 		trackp = get_track(s, objp, TRACK_FREE);
 		handle = READ_ONCE(trackp->handle);
 		if (handle) {
-			nr_entries = stack_depot_fetch(handle, &entries);
+			nr_entries = stack_depot_fetch_into(handle, entries, ARRAY_SIZE(entries));
 			for (i = 0; i < KS_ADDRS_COUNT && i < nr_entries; i++)
 				kpp->kp_free_stack[i] = (void *)entries[i];
 		}
@@ -9946,12 +9946,14 @@ static int slab_debugfs_show(struct seq_file *seq, void *v)
 #ifdef CONFIG_STACKDEPOT
 		{
 			depot_stack_handle_t handle;
-			unsigned long *entries;
+			unsigned long entries[TRACK_ADDRS_COUNT];
 			unsigned int nr_entries, j;
 
 			handle = READ_ONCE(l->handle);
 			if (handle) {
-				nr_entries = stack_depot_fetch(handle, &entries);
+				nr_entries =
+					stack_depot_fetch_into(handle, entries,
+							       ARRAY_SIZE(entries));
 				seq_puts(seq, "\n");
 				for (j = 0; j < nr_entries; j++)
 					seq_printf(seq, "        %pS\n", (void *)entries[j]);

-- 
Git-155)

