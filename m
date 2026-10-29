Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254168;
	b=eMVmCjg8vP9PQojYv3LBJMK4T8Uo+KXhVHrOkGJ7xUFh3oREOjrwYWUmHxw0I7mREUnx
	 jgHi5VQp2SWhdfQvr5GLOft2fdqt2uFaohL052/Y4dkxfXsMgAu5vD1BfX7kx37gbGDgO
	 PLMJZ8flZI2Te7snM3dzsD9Bbgtjl+nxuMShpP9YeogvSGA5/TFafVgrmDBh0sQMZ5Q2e
	 1rg+l119h+Ji3yWHA4iundkVsfIk9ZJGFDSS+GYv5TYhEyWq00/QxQH3AdIF1xZORjuNC
	 Em54rdlZxFtZ1aKqGmTJLG3W0a8VOOB7BqHp63Z3XRp/snC+LhpaP7OZoVBq1OIn7mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=kJG/RgFaRLdMkGdKAhf/ALFLkcE1J6knB1UbEQSKpbg=;
	b=5hN+yg/VbWPUeS0YEWRG4UkKQYDHyLgnT/e0XiruALSY9/PXgZFqWMuG6h1DS6DJiTtp
	 QP0I2XywQ4xPKcBEm6Zzm/Wtnb1fTGTyvwv607PZMjGOvWuI24x7TEESAdU6HraBVDvfg
	 +dFP5UYLehHgWsCl2yT3g5D6LfKn8rRooNq63ISuX8bzO/iegQgSU+i8DmcuI1kDslGxo
	 Vu+03/brVbIOqlY1kLHJA8MoR7FYP+4KqcM4qXbVDj1LiZlEuxYSP28LweyMczVKZYsOj
	 6Z7jIL4Q2PqcKAZMWxrk6z/Jr/Q3LufoJDCF1K+7V0HUZcLG31qDGO4OiwI2RFnAzcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=pMUDAr53;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE84A606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE84A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=pMUDAr53
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ad787b79ffso1114175a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793254167; x=1793858967; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kJG/RgFaRLdMkGdKAhf/ALFLkcE1J6knB1UbEQSKpbg=;
        b=pMUDAr53zakRhaLJRVoGZnpBNpg+AvPmFK3NgAImketf4vC+bXEYoxFmM2aSzlfvqc
         WNysp2JFWyGstElcXHyq5UvOTgNKsjOswBALDB782GOi+X6llgskMhqceVSNVE/AThMc
         B5UTBEchSVKgfYwES5o33SSemWTSUzV7Nnzxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254167; x=1793858967;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJG/RgFaRLdMkGdKAhf/ALFLkcE1J6knB1UbEQSKpbg=;
        b=C/lPiiBofhaGHLTkdmNv7RZNIY11H8/inaR2b+EvLRO1g+yBqXGnjP+K+Fo2xQIlpR
         WI2Oicbq1DPewizf1PMF4anWlbmc4cCOgWhijdFVD0ip/r+JVH46hHRL7j2nExz54hIT
         i8TxmFsrWsnSZkQJHJ2k3mUj9PVnlx6OeNCiJt+MucsbXwb9UVOBb9eemgjSzWAPgGxp
         p7R/m0a63I8shc22gaRAuRK6PaPvIc/zHC3+RdI+rr0PaUzcGNjlC8Jl27Q2aNO+OWS1
         lCs6uJP0i9kYXK61JsgmZtTnbN2MYnFf8XllbfPG/mmJS/W3aBFQ/lVv+v0aUkBzdymw
         bk6w==
X-Forwarded-Encrypted: i=1; AKwUvBw8YodjuISdnU1ryvfdGW1PEGL0XZrKPfo35ZCmkgC7MfDGTv6WhkPRXiUgmskbI4fh39xls/ti6olsrX4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaoBIJyM2X5iHkZe6YUy5lWbHzHu7Dog08cfU/AwDLP5nbdym9
	tq+ldh2Uj6xLE1qkTIalJ2AeJpIEUslqCIrR58doHY2TXGUCKXnf9yrBqbykWWHooyQ=
X-Gm-Gg: AYBFou09pL7w714O1YIeaotPoPWsHBGoSnfXG4ibRcQWpzOYaBduGygQRx+wByJav6L
	nYVNkDb+I0LYzw/I1zb0AGGZDdwYWTPAk1xmBu94sTHpX9lVfyH9ff77fl1b5T/37hRm94tIxMu
	sBzfqq5jQKoEnxkgqgcF+ijmhM5RGY9P2FvnIkMsVCxxeb7R9lHowjWu/Hkyq3vwxpdAsf8yPb0
	O33JJoi1UvKGvc3rJs5X0ZMbX1ZkSzjtfkca/UAfGi+9i0GIJK6AMY8/DMn4pYVFhGvkBVLtaDa
	ct3iLRbrRsNRAq/qiba9UVBCh44ag1Jc4Ls4nv+l3lif66iKm1f7+7oItZb2h6wmDHW0Bui9/2s
	lj+8ESe90TvqqQ70rSCfEb2j5XcSjL8bnPcZrDw7BF7B8CUk1K307xSHDYrciRJZ11lOZy9L1n4
	XJ3xZGHgcAG/HMDAnAzycCXfXs2gBgmMUYt5ExLWHh6PQEN+TYS1Y/SgjxZB3g7uh/xQEzthCng
	4ekdAPlzq3kpSjHFM3kzEihrq7qajAocC+/ZzAEr15vYhlrWzCnRLyC20tIkcniwUcvFNIlw+nJ
	SOCBskij76PIlHRnlhne3lTIB0L2Gd2C8vtE9BwhSviQbq110+fLN1gIEGPquoWj96VlD/XZXuB
	BbRWS9NunSW2ciA0p9jYSX7kNGcB2gDtoncxY6399YDzBReEp0MyOyRZYEhfPlzTpsV4LEwN8f1
	oTKPuGYWPZSqDtfbT14nc=
X-Received: by 2002:a17:90b:4cd2:b0:3ab:884b:659e with SMTP id 98e67ed59e1d1-3ae57f96d53mr3126592a91.9.1793254167010;
        Wed, 28 Oct 2026 23:09:27 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9bc6f7sm2447023a91.16.2026.10.28.23.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:09:26 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:09:21 +0800
From: Chris Down <chris@chrisdown.name>
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH v2 6/6] slub_kunit: Add a test for the kmalloc_partition boot
 parameter
Message-ID: <66f981ce04dfb01d02d1683bb18ba6db1c4eabd1.1793253633.git.chris@chrisdown.name>
References: <cover.1793253633.git.chris@chrisdown.name>
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
In-Reply-To: <cover.1793253633.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Check that the kmalloc partitions are separate caches by default, and
alias the normal kmalloc caches when they're turned off with
kmalloc_partition=0.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 lib/tests/slub_kunit.c | 46 ++++++++++++++++++++++++++++++++++++++++++
 mm/slab.h              |  4 ++++
 mm/slab_common.c       |  3 ++-
 3 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index 670645875b27..e3035864577d 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -333,6 +333,49 @@ static void test_slab_buckets(struct kunit *test)
 }
 #endif
 
+#ifdef CONFIG_KMALLOC_PARTITION_CACHES
+/*
+ * Each partition copy is a separate cache, unless the copies were disabled
+ * with kmalloc_partition=0: then they alias the KMALLOC_NORMAL caches.
+ */
+static void test_kmalloc_partition(struct kunit *test)
+{
+	enum kmalloc_cache_type type;
+	struct kmem_cache *s;
+	unsigned int idx;
+	bool found;
+	void *p;
+
+	for (type = KMALLOC_PARTITION_START + 1; type <= KMALLOC_PARTITION_END; type++) {
+		for (idx = 0; idx < ARRAY_SIZE(kmalloc_caches[type]); idx++) {
+			struct kmem_cache *normal = kmalloc_caches[KMALLOC_NORMAL][idx];
+			struct kmem_cache *part = kmalloc_caches[type][idx];
+
+			if (!kmalloc_partition_enabled) {
+				KUNIT_EXPECT_PTR_EQ(test, part, normal);
+			} else if (normal) {
+				KUNIT_EXPECT_NOT_NULL(test, part);
+				KUNIT_EXPECT_PTR_NE(test, part, normal);
+			}
+		}
+	}
+
+	p = kmalloc(64, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, p);
+	s = virt_to_slab(p)->slab_cache;
+	idx = kmalloc_index(64);
+	if (!kmalloc_partition_enabled) {
+		KUNIT_EXPECT_PTR_EQ(test, s, kmalloc_caches[KMALLOC_NORMAL][idx]);
+	} else {
+		found = false;
+		for (type = KMALLOC_PARTITION_START; type <= KMALLOC_PARTITION_END; type++)
+			found |= s == kmalloc_caches[type][idx];
+		KUNIT_EXPECT_TRUE_MSG(test, found, "allocated from %s", s->name);
+	}
+	kfree(p);
+}
+#endif
+
 #if defined(CONFIG_PERF_EVENTS) || (defined(CONFIG_KPROBES) && defined(CONFIG_SMP))
 #define NR_ITERATIONS 1000
 #define NR_OBJECTS 1000
@@ -529,6 +572,9 @@ static struct kunit_case test_cases[] = {
 #ifdef CONFIG_SLAB_BUCKETS
 	KUNIT_CASE(test_slab_buckets),
 #endif
+#ifdef CONFIG_KMALLOC_PARTITION_CACHES
+	KUNIT_CASE(test_kmalloc_partition),
+#endif
 #ifdef CONFIG_PERF_EVENTS
 	KUNIT_CASE_SLOW(test_kmalloc_nolock_and_friends_perf),
 #endif
diff --git a/mm/slab.h b/mm/slab.h
index b5b344d6e402..8e1e5a3f044b 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -394,6 +394,10 @@ extern struct kmem_cache *kmem_cache;
 extern bool slab_buckets_enabled;
 #endif
 
+#if IS_ENABLED(CONFIG_KUNIT) && defined(CONFIG_KMALLOC_PARTITION_CACHES)
+extern bool kmalloc_partition_enabled;
+#endif
+
 /* A table of kmalloc cache names and sizes */
 extern const struct kmalloc_info_struct {
 	const char *name[NR_KMALLOC_TYPES];
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 5391149a2eed..406e8688ee0e 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -782,7 +782,8 @@ EXPORT_SYMBOL(random_kmalloc_seed);
 #endif
 
 #ifdef CONFIG_KMALLOC_PARTITION_CACHES
-static bool kmalloc_partition_enabled __ro_after_init = true;
+VISIBLE_IF_KUNIT bool kmalloc_partition_enabled __ro_after_init = true;
+EXPORT_SYMBOL_IF_KUNIT(kmalloc_partition_enabled);
 
 static int __init setup_kmalloc_partition(char *str)
 {
-- 
2.54.0

