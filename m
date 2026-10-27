Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086575;
	b=Vrt+s9RBm38+eLxUcQL70CFlsHen/FiKziaF+vwFk6FZAt+rK9LCnzXyLbKiqkouFi6i
	 I9AiZHy3npzUgXW7Lkrxe8yBHANf/GhsEXFdnaN+00N3M4mCbsyTYBcdhRhhj/4a+WGvH
	 osEtL52Adg1xIaqIG1bjo6xslikGzy69Zq6G702hddc+J94yO1OIZP1kY5VWiLTMUUWDY
	 U8yaiX4+3+By+l/5b64kov9+rl2uDgnqfvpSqHpzwsHSbWrMVaftsvlj4nlRc3gcxbn/t
	 p5vZHxaGxdYNP+N41D/XCogyaoNBkeS46FXZnAeWywWmsFE4zoABoqUbYhEGwoEVIMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=NjMmv6pm0tIRvcDaHQJ8L51He0Pq3qbg9jRbmDfBhFY=;
	b=lkF53LoS3NhkdQquf+9G+0D/y2r9alxR8NsM5zWTTxZTHHoA3ql2DIXHjeMLERofXCmp
	 04lQXhGL9iFLQa3YO0mxDhB5gl7KZhgpMqOI3dCpxy5KvB+Fw5iDHCpZ4k8ARsdINBxaq
	 mN6GXIgvxS9Q8YlWGkf90RwXPMhdKEb3b2k0R6r6LpmYOIUtk2nu2OQo8m+B+wxj9pNVT
	 8e28l/nhmpckAN7PKMuBE6xEhxPEFrBdYih2lJblldsyNuAik3+iXUOU2O+lY8Y+BjqkD
	 YKobmyDw8WdisIIyRvd+RGyfRPj3HYk6NgWTTWG4hW5xSa+fmtv+c7Y2Zi1YrfQnZwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Ll2KcXUf;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A1F60A2606
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89A1F60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Ll2KcXUf
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3adf5f6833cso1657011a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793086575; x=1793691375; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NjMmv6pm0tIRvcDaHQJ8L51He0Pq3qbg9jRbmDfBhFY=;
        b=Ll2KcXUf0HNjZNspw8mgf7QjFO0rnWy7AkmagNFxZH1MqDX+Ikhv4qtw0Sn/y2Y9V3
         5vWY9uG+etoBOY2hjFd7dF2bpEzMVbcD2KLEBxuOsHbGLzmJ80bLI8RgRMbcAsH7ByAJ
         lCnej9KnMy53Wv6N3kuOvAtsjiJgdWqLAkXjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086575; x=1793691375;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NjMmv6pm0tIRvcDaHQJ8L51He0Pq3qbg9jRbmDfBhFY=;
        b=OoLi9Zk9PepMJWSRYyaZpzvquRmmX7iBqF8VDA60QVGJclx54VsFKDLyhdCuVDQoJC
         FlZi+V+aHGH/AmoC4y//ApF5iUxRYsj/aHbpeSxC5VS3zlI6YPNgn67vCRyrv9v6K3Ny
         XId2d6qVFGGwv50PX+CdZmSt4kBwRhavrk+ObwpZN7otIBTOpaEPdrjGA5mjJ4sFBpdE
         HIj2p7FR6qgbJ2SeJYSvJ4lj4LnwGo54tYrvtrUGksd1SNhjrWB5ywTrEoONmEg7pv+v
         tk59Vt74P0ZEc8r/97yvg8rsIV1cUcNo+UtB4Frt8WzK+DPyxJMr122XPFhZwju2dmbF
         FK6Q==
X-Forwarded-Encrypted: i=1; AKwUvBx+2imCZzfgwY6cxWNWde5/1VmTZ7N4aQnKTsCSl3v95CQxSSIGYoZYtJhenvaruUk9+BfYO+feP487pFI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJU6sDS0gUMqHUwbjpwhg4YsANupvYUAL0X9GqoY73rgaKgay79
	C8AkAMBzp0qhPfeJynoQ1PoWaWd3DEcnG4en9Nxs3AK9V68Xejabl4aVBwitCqwsy/4=
X-Gm-Gg: AYBFou12u+MeN6EKNZZpszGaFFCdPjPkf7dKpjoaXwfbnweFoIxW5mEBOOME9+coGg6
	RuA1xg+NfGEPzybiRIIwtlcTrnZu1nn/6PALMYPemCNNqwSEM2hiMH5KCH4KfQVHc1sA15ICbnq
	xef5linu0nYox4EvWVuc6a8cq4II9dkIK1DN0Kdzn0jPtFxB+3XEa/UVHTnfovCRvKDlhN4xbb6
	N732qJJsTK6C6mXols3xPnqC+1EnrygqNeZCjSHEMUBQbetdfE3p+b37YnpnZoE2wvDerMhgU/7
	OoAWsaVFzqsFo5KV+dH3P/w8aYk/hgSoVkUidgLdAJ/kpMsF5tucNXZf3V9xpJ/y/2+cpM7nY+q
	jo+DIRm2/f232FsAKtNmXD8sX8RquL4kY28F4eBnnR6T8nrJXwnsRLUItOEilMMWo/31TusSWby
	XzWQFa9ExE9JQfieEt5FReZGM/UPP0lO8w6abhFX302i1mC/13FwyiDOpZ729nI61RhsWM123tO
	+Amn+odz5yJw4R7auc34lVCI9+3zuyYkBk/KBBvsd0PfYriqE56yNhfSvIis07V1tvbPrf1fGLO
	TJUQAcshQ7kr+Sxlx4NkStUGW13TI/LwvZS0vjh73cMXKNy6ACjtct3FF6sAZHCmJYJEHny8e9Z
	qzHW2tVaxmypNjmyIVU4ASUY=
X-Received: by 2002:a17:90b:4c92:b0:3a6:fc30:ce16 with SMTP id 98e67ed59e1d1-3adeafc7dd4mr7341488a91.51.1793086570089;
        Tue, 27 Oct 2026 00:36:10 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adf8f3f22csm6639832a91.3.2026.10.27.00.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:36:09 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:36:05 +0800
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
Subject: [PATCH 6/8] slub_kunit: Add a test for the slab_buckets boot
 parameter
Message-ID: <92d3b7ad95c9b7cdc76eb8f361cc2b374c018edb.1793086056.git.chris@chrisdown.name>
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
 lib/tests/slub_kunit.c | 37 +++++++++++++++++++++++++++++++++++++
 mm/slab.h              |  4 ++++
 mm/slab_common.c       |  4 +++-
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index 49b9942bc564..646596663b33 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -11,6 +11,8 @@
 #include <linux/kprobes.h>
 #include <linux/string_choices.h>
 #include <linux/swab.h>
+#include <linux/mman.h>
+#include <linux/string.h>
 #include "../mm/slab.h"
 
 static struct kunit_resource resource;
@@ -396,6 +398,38 @@ static void test_krealloc_redzone_zeroing(struct kunit *test)
 	kmem_cache_destroy(s);
 }
 
+#ifdef CONFIG_SLAB_BUCKETS
+static void test_slab_buckets(struct kunit *test)
+{
+	unsigned long user_addr;
+	const char *name;
+	void *p;
+
+	if (!slab_buckets_enabled)
+		KUNIT_EXPECT_NULL(test, kmem_buckets_create("TestSlub_buckets",
+							    0, 0, INT_MAX, NULL));
+
+	user_addr = kunit_vm_mmap(test, NULL, 0, PAGE_SIZE,
+				  PROT_READ | PROT_WRITE,
+				  MAP_ANONYMOUS | MAP_PRIVATE, 0);
+	KUNIT_ASSERT_NE_MSG(test, user_addr, 0, "Could not create userspace mm");
+	KUNIT_ASSERT_LT_MSG(test, user_addr, (unsigned long)TASK_SIZE,
+			    "Failed to allocate user memory");
+
+	p = memdup_user((void __user *)user_addr, 64);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, p);
+
+	name = virt_to_slab(p)->slab_cache->name;
+	if (slab_buckets_enabled)
+		KUNIT_EXPECT_TRUE_MSG(test, strstarts(name, "memdup_user-"),
+				      "allocated from %s", name);
+	else
+		KUNIT_EXPECT_TRUE_MSG(test, strstarts(name, "kmalloc-"),
+				      "allocated from %s", name);
+	kfree(p);
+}
+#endif
+
 #if defined(CONFIG_PERF_EVENTS) || (defined(CONFIG_KPROBES) && defined(CONFIG_SMP))
 #define NR_ITERATIONS 1000
 #define NR_OBJECTS 1000
@@ -591,6 +625,9 @@ static struct kunit_case test_cases[] = {
 	KUNIT_CASE(test_kfree_rcu_wq_destroy),
 	KUNIT_CASE(test_leak_destroy),
 	KUNIT_CASE(test_krealloc_redzone_zeroing),
+#ifdef CONFIG_SLAB_BUCKETS
+	KUNIT_CASE(test_slab_buckets),
+#endif
 #ifdef CONFIG_PERF_EVENTS
 	KUNIT_CASE_SLOW(test_kmalloc_nolock_and_friends_perf),
 #endif
diff --git a/mm/slab.h b/mm/slab.h
index b648b33f25c3..185df5e68419 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -390,6 +390,10 @@ extern struct list_head slab_caches;
 /* The slab cache that manages slab cache information */
 extern struct kmem_cache *kmem_cache;
 
+#if IS_ENABLED(CONFIG_KUNIT)
+extern bool slab_buckets_enabled;
+#endif
+
 /* A table of kmalloc cache names and sizes */
 extern const struct kmalloc_info_struct {
 	const char *name[NR_KMALLOC_TYPES];
diff --git a/mm/slab_common.c b/mm/slab_common.c
index b7a46c368ab1..9fe48da12010 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -29,6 +29,7 @@
 #include <linux/memcontrol.h>
 #include <linux/stackdepot.h>
 #include <trace/events/rcu.h>
+#include <kunit/visibility.h>
 
 #include "../kernel/rcu/rcu.h"
 #include "internal.h"
@@ -410,7 +411,8 @@ EXPORT_SYMBOL(__kmem_cache_create_args);
 
 static struct kmem_cache *kmem_buckets_cache __ro_after_init;
 
-static bool slab_buckets_enabled __ro_after_init = IS_ENABLED(CONFIG_SLAB_BUCKETS);
+VISIBLE_IF_KUNIT bool slab_buckets_enabled __ro_after_init = IS_ENABLED(CONFIG_SLAB_BUCKETS);
+EXPORT_SYMBOL_IF_KUNIT(slab_buckets_enabled);
 
 #ifdef CONFIG_SLAB_BUCKETS
 static int __init setup_slab_buckets(char *str)
-- 
2.54.0

