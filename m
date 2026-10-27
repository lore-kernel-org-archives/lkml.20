Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086560;
	b=bzgFsVeMsrBE3Nc8SqNVFsxzOjJKvjtrMt1gsdBIXkTBWbJvi7TPz8guOnBvaSXy1NHu
	 15RaOyLipxlBz4qR0l1euP7xuMdJLVkWvaFpaxHFtrryOaJoENETZq6Pj4J0o4/3iQbTO
	 2Gsj1rwub5ce1wcvxKkXe4gX+1QBcu5A+oIFvWMwt7D/UhzZe6WY5AJdwxvJ6nZKavo7n
	 lZ0Eim2kLaURKiZddxyixqH18LJ4WHzmN886fW440sX8boUwKsGwPsBBnE/lNGiXDuV8q
	 c9Qd3yqnjRupY8tKyWb9sP/fqNoIEbxRg2peZIyQjlObfr/+cyD+aqtWaXl4mIPDThg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=hpIIV0W46trht3EV+1EEIjsc/ykz7v9qZcaLCd0bYkU=;
	b=VV27G+N6TUfhKDHN3b5xYcLFm2rQxbsDvvEY6blEY7m1v/+16Z2AuV+QE4p3gtOowqK/
	 3dDWZ3t6U8n9alR11Ej0tViobN4kKeKxqloE2RLSjdydSD/mo1dGlUkbB2xTPywnl+bSI
	 mWyeOXw1q2qWwRrhB/qCLl3BuJwmwyv5ia04wjAoT6SvAzIaLNl1pjUb/toG9N+ILn+WO
	 NJwQoKMhEnvM9atxV19203fkB+sVNtVESYgIc1fgXe9p9QV8rsmgX7dMnSeaWihGvDlPd
	 ItDPTdhpxPTuXV367MbGvJBASuhUWgGqwpbUYdtX7qwjUS9KXSt4VgJQu2jbfhsY7xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="Sya/jb27";
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C989160A261C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C989160A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Sya/jb27
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so2006234a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793086559; x=1793691359; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hpIIV0W46trht3EV+1EEIjsc/ykz7v9qZcaLCd0bYkU=;
        b=Sya/jb27lh0beXAqtnIJlVvq9EAFZBzGHClnjf9Q8/lNpvFZjHz4qKv6KgxaUI83CX
         YH0AuAup5If0GOe/Y0pNNRcTgzEvB5BIAaDI10ypdeUuhF+uXJVMgoAG3C4hoGSH+pw7
         lx0AtJLcOCdWWbJg3hx3ZankbSu70ySWHQ5Fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086559; x=1793691359;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hpIIV0W46trht3EV+1EEIjsc/ykz7v9qZcaLCd0bYkU=;
        b=d5BlkJ/AFqSakDqneGZfkLl6nzPaLw0YiQD4mN87QNxxmmbZxbOByEuEvyPCzwrF8T
         +qOr+l/J7NtSiXqXKVwUoV4gRQ3SU50xHLPxhw7LVEtPOZN6/Ptb30pDTsWY6pfKEZSS
         Dv3Srh/iKUe6cxpkihS0QenLLv1E8l32quUSQs78QGtmJrMl8GOvB8h99cVEZZRLzxlf
         BjZ2CiRWPO+3XnvL3nYd3stCtthnGcGdEZODpVItxU+MaObJ0dJ4CGoGuP6nWyGCsX7h
         JIWXVqLVNMTRuhCfJrZjB9WhSZyepgqx7bpNnnKHnRqE/vtxqp4vRmZjxT2y1ORfRr7Y
         anVw==
X-Forwarded-Encrypted: i=1; AKwUvBwX1WUUEdkLauyjdLo1qv3dpEAA7uEHVOfAtbPdowxjRaWkRCrmsUmp/PP+w1zcl5ZYKfVFIj0zQo+fj7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJePu4pL0tAzkm//mbs9eLcZrnT7X+FKIGMNmwxFW9z83H3frmG
	kU2+6HD6DneNCJTdfcbGVw+pcLd68MEqFpcTeMOgVr9AUHjord/x0+Q3x8uVtFpDPss=
X-Gm-Gg: AYBFou0l0L/K3socaatoOKBnUnlClLCvQYMtdbmT2JjWY8AaIySNwy0zNqpn41v1npJ
	YNmt3rBrh0A6DBZX0eWr+e8XQutq5Sh8w6SFe4/5yhvZT0p98dJKdtmKi1UM7kqLrPOJ59mEhJ7
	NY+D7qT0lcfDdFeycFSh1ZFWAYE1Zb8lmVyjk5XZt6TdlYUf9h85HQiSJtUsRFiXAPGDhtnLxWh
	49YZnoszJlnmV6LoFMvr6rQq/nqfkevozvrDXE9hWYZQ+johZG7sTe8LdJ+D1MwpV5H/omkRtQI
	FSmqNCR1tXaBJR5AkC6mpE4Nxq/47erBztJSOsGcTUKyayGetbz74vrANxov9kinmP7kHt4enHX
	Pl81txItawK/N+Veq2hs4jFRmWicqMGc2Puz0xbub3RqHv1iZeJxJJhSRJ9QOoi7s175uIBHVWY
	tPne5R86ScCnn+M5WXDEl8rxH88iYo1AHz+r02k0DWLtAv8nuEE5avf0eBxr4G/x61DP+FfLE8d
	2bxdCXaodOoTHvVApzyNIZOJY6+dL7X4VnlFnUFGvpfGSn0MwWvbM+KfSjZvhMs7VoemkQlVndp
	JU5CCh3XsFda04aLxATBETgSrP8xxJL7OWIhEHPkdWq3ZgeD1s/LNScNgE31XdELC6Ehx5cln5l
	Qc9mo4qiWjT9Yh07GgQK+YQO8MboGfeE4a0M6Pgm1DeS4Q60YQbpp77SVwFw8xudp8sjlJpAF
X-Received: by 2002:a17:90b:5408:b0:3ac:bfa7:b079 with SMTP id 98e67ed59e1d1-3ade9b2f216mr7575308a91.7.1793086559188;
        Tue, 27 Oct 2026 00:35:59 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb0dda7sm7230307a91.4.2026.10.27.00.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:35:58 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:35:54 +0800
From: Chris Down <chris@chrisdown.name>
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH 4/8] slub_kunit: Add a test for slab_freelist_random=
Message-ID: <0af4fc45ca8e1d7027ceaad079f8f9eaac663c76.1793086056.git.chris@chrisdown.name>
References: <cover.1793086056.git.chris@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793086056.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 lib/tests/slub_kunit.c | 51 ++++++++++++++++++++++++++++++++++++++++++
 mm/slab.h              |  3 +++
 mm/slub.c              |  3 ++-
 3 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index 5ace73368523..49b9942bc564 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -190,6 +190,56 @@ static void test_clobber_redzone_free(struct kunit *test)
 	kmem_cache_destroy(s);
 }
 
+static void test_freelist_random(struct kunit *test)
+{
+	struct kmem_cache *s = test_kmem_cache_create("TestSlub_freelist_random",
+					64, SLAB_CONSISTENCY_CHECKS);
+	bool random = false;
+	unsigned int i, nr, nr_linear = 0;
+	void **objs, *first;
+
+#ifdef CONFIG_SLAB_FREELIST_RANDOM
+	random = slab_freelist_random;
+	KUNIT_EXPECT_EQ(test, !!s->random_seq, random);
+#endif
+	kunit_info(test, "freelist randomisation is %s\n", str_on_off(random));
+
+	/*
+	 * Caches with debug flags have no sheaves, so objects come straight
+	 * off the slab freelist.
+	 */
+	first = kmem_cache_alloc(s, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, first);
+	nr = virt_to_slab(first)->objects;
+	objs = kunit_kcalloc(test, nr, sizeof(*objs), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, objs);
+	objs[0] = first;
+
+	for (i = 1; i < nr; i++) {
+		objs[i] = kmem_cache_alloc(s, GFP_KERNEL);
+		KUNIT_ASSERT_NOT_NULL(test, objs[i]);
+	}
+
+	for (i = 1; i < nr; i++) {
+		if (virt_to_slab(objs[i]) != virt_to_slab(objs[0]))
+			break;
+		if (objs[i] == objs[i - 1] + s->size)
+			nr_linear++;
+	}
+
+	if (i == nr) {
+		/* Without randomisation, objects are handed out in address order. */
+		KUNIT_EXPECT_EQ(test, nr_linear == nr - 1, !random);
+	} else {
+		kunit_info(test, "objects were allocated from different slabs\n");
+	}
+
+	for (i = 0; i < nr; i++)
+		kmem_cache_free(s, objs[i]);
+	kmem_cache_destroy(s);
+	KUNIT_EXPECT_EQ(test, 0, slab_errors);
+}
+
 static void test_kmalloc_redzone_access(struct kunit *test)
 {
 	struct kmem_cache *s = test_kmem_cache_create("TestSlub_RZ_kmalloc", 32,
@@ -535,6 +585,7 @@ static struct kunit_case test_cases[] = {
 #endif
 
 	KUNIT_CASE(test_clobber_redzone_free),
+	KUNIT_CASE(test_freelist_random),
 	KUNIT_CASE(test_kmalloc_redzone_access),
 	KUNIT_CASE(test_kfree_rcu),
 	KUNIT_CASE(test_kfree_rcu_wq_destroy),
diff --git a/mm/slab.h b/mm/slab.h
index 8187ddb2face..b648b33f25c3 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -887,6 +887,9 @@ static inline void dump_unreclaimable_slab(void)
 void ___cache_free(struct kmem_cache *cache, void *x, unsigned long addr);
 
 #ifdef CONFIG_SLAB_FREELIST_RANDOM
+#if IS_ENABLED(CONFIG_KUNIT)
+extern bool slab_freelist_random;
+#endif
 int cache_random_seq_create(struct kmem_cache *cachep, unsigned int count,
 			gfp_t gfp);
 void cache_random_seq_destroy(struct kmem_cache *cachep);
diff --git a/mm/slub.c b/mm/slub.c
index 7e9dadda3d10..8c7b46c2052f 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -3424,7 +3424,8 @@ static inline struct slab *alloc_slab_page(gfp_t flags, int node,
 }
 
 #ifdef CONFIG_SLAB_FREELIST_RANDOM
-static bool slab_freelist_random __ro_after_init = true;
+VISIBLE_IF_KUNIT bool slab_freelist_random __ro_after_init = true;
+EXPORT_SYMBOL_IF_KUNIT(slab_freelist_random);
 
 static int __init setup_slab_freelist_random(char *str)
 {
-- 
2.54.0

