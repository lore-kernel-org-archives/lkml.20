Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794811645;
	b=erOkURB2L64sxw8OC9kvGsy4pfCHSHO7mHbJcTSC+Hy1TFM1Rr3JvNdMUgTvGvRH79cD
	 yea8sGMGwdKo6StbHFO4fOf0/JnykQP//6WzjoghQqVxTkG6ZHXSzDNaG5HkI+iJmX6V4
	 Gm5WJf0zm+nNeXe8TEnFAp7o60EsXcUA3o2oh+Xo0ktcl+kTXp66Gnwok6+9dxKBvF39J
	 MsLd81aQVv1EF1i8mb3kHn819nQM/0HnopuFKeMOlPDn+mSIcFTBGAUZPFSBcu/uf4P7l
	 eNAeg9VoKRw1+7whkv6xGvtzy/4YrFQYgYglY2tq/cuiCYGswmO3UPCeCPEh2ihtdog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811645;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=qnAd8kdJJsCCZ9ku2gzzQPm1FL2bWZEjkOx7cLArqZE=;
	b=mWXCF+p/uLwUuIvwJ/h9wLZb42MBRtVLovwDQztofQc5tZ03arLM0IzMllNk7Gi1rY8c
	 IqwSo9zaBVb5Pm1g1hgntRQYN9nEP6ieIN2U70SAsxRCAT7+Lvl5/HgUnoXvKJzxx4uXT
	 T806PUe7i0icx4Tji7ktqf4vrczaKBe1QnBUPXcR8YzqG+lcjPTT3wUrNgZToCv1lxpet
	 9tjmIlqhmAHuAcmIN9n8ptt5ucsTR3aByvYba2f7cJEwyiuHcTt+atBpotLUrc8hoZawe
	 wb0NCEUC1OibuOVSF8WU+XwoavCwrXM0G3l2qaOD+bsqmt1FrKa8m/aqZ2Lm6qva8HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HbU+7DQA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF781606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HbU+7DQA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738F71F000C5;
	Mon, 16 Nov 2026 06:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794811645;
	bh=qnAd8kdJJsCCZ9ku2gzzQPm1FL2bWZEjkOx7cLArqZE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HbU+7DQAaJDNRjsKZtMjIolMTDwZVhEoaALimOLHB6t4dRaEII9oFMDxHbYA7OnT/
	 YmXU/WFq2zfCUnwfaC5yukA2XQznxMUkKbdDV6x0IKgOvclGKNmppIYr2yFSurb3kn
	 SX4S2czRGqy5NwuGB6ZvCGuvvyc/KMozI5cOogZ8+PogD4PmiuKq9bvy5Fa8dG4aNf
	 EcdCP00K95HeR2Xkh6Q1kSamO+Y6BrLMvySV6eIBdbp/ATG3QR0/UHKMxcaPsPxCv4
	 Kb4qdx4BGhJaiz0ezO27NZbi+FxZJBsEHrogqyrXMmt/NznPTXhTuN9dYVfy3YhBlh
	 F7XW1ri5LlMLw==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Mon, 16 Nov 2026 07:47:10 +0100
Subject: [PATCH v4 02/10] kasan, kunit: pin test slabs by an extra
 allocation
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-slub_tiny_rework-v4-2-227a4b3636a5@kernel.org>
References: <20261116-slub_tiny_rework-v4-0-227a4b3636a5@kernel.org>
In-Reply-To: <20261116-slub_tiny_rework-v4-0-227a4b3636a5@kernel.org>
To: Harry Yoo <harry@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>, 
 Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com, 
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
X-Mailer: b4 0.16.0

The tests kmem_cache_double_free() and kmem_cache_rcu_reuse() create a
scenario where a slab becomes empty, but rely on the implementation not
immediately freeing it.

This subtly relies on non-zero s->min_partial. It currently compile-time
defaults to a non-zero value, but in theory a sysfs write racing with
the kunit test could change it. More importantly, the upcoming
CONFIG_SLUB_TINY changes will make it possible to run the kunit tests
with s->min_partial being a compile-time zero, which means the tests can
cause a NULL pointer dereference, or fail, respectively, as flagged by
sashiko [1].

To prevent this in a robust way, add an extra object allocation to the
tests, that will prevent the slab being freed. Use migrate_disable() to
prevent migration to a different NUMA node, which would place the
allocation to a different slab. kmem_cache_rcu_reuse() already uses
that.

[1] https://sashiko.dev/#/patchset/20261024-slub_tiny_rework-v2-0-bf1419ab5ffd@kernel.org?part=8

Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
As per sashiko, this scenario needs CONFIG_KASAN_SW_TAGS or
CONFIG_KASAN_HW_TAGS to occur, otherwise kasan quarantine will keep the
objects and thus slabs alive.

To avoid the need for arm64 system, I have reproduced the issue and
verified the fix instead with slab_free_hook() modified to skip kasan
quarantine.
---
 mm/kasan/kasan_test_c.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
index b9e167ed5be3..01cf001bf0ef 100644
--- a/mm/kasan/kasan_test_c.c
+++ b/mm/kasan/kasan_test_c.c
@@ -1051,22 +1051,30 @@ static void kmem_cache_oob(struct kunit *test)
 
 static void kmem_cache_double_free(struct kunit *test)
 {
-	char *p;
+	char *p, *pin;
 	size_t size = 200;
 	struct kmem_cache *cache;
 
 	cache = kmem_cache_create("test_cache", size, 0, 0, NULL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cache);
 
+	migrate_disable();
+	pin = kmem_cache_alloc(cache, GFP_KERNEL);
 	p = kmem_cache_alloc(cache, GFP_KERNEL);
-	if (!p) {
+	migrate_enable();
+
+	if (!p || !pin) {
 		kunit_err(test, "Allocation failed: %s\n", __func__);
+		kfree(p);
+		kfree(pin);
 		kmem_cache_destroy(cache);
 		return;
 	}
 
 	kmem_cache_free(cache, p);
 	KUNIT_EXPECT_KASAN_FAIL(test, kmem_cache_free(cache, p));
+
+	kmem_cache_free(cache, pin);
 	kmem_cache_destroy(cache);
 }
 
@@ -1152,7 +1160,7 @@ static void kmem_cache_rcu_uaf(struct kunit *test)
  */
 static void kmem_cache_rcu_reuse(struct kunit *test)
 {
-	char *p, *p2;
+	char *p, *p2, *pin;
 	struct kmem_cache *cache;
 
 	KASAN_TEST_NEEDS_CONFIG_OFF(test, CONFIG_SLUB_RCU_DEBUG);
@@ -1162,6 +1170,13 @@ static void kmem_cache_rcu_reuse(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cache);
 
 	migrate_disable();
+	pin = kmem_cache_alloc(cache, GFP_KERNEL);
+	if (!pin) {
+		kunit_err(test, "Allocation failed: %s\n", __func__);
+		migrate_enable();
+		goto destroy;
+	}
+
 	p = kmem_cache_alloc(cache, GFP_KERNEL);
 	if (!p) {
 		kunit_err(test, "Allocation failed: %s\n", __func__);
@@ -1178,8 +1193,12 @@ static void kmem_cache_rcu_reuse(struct kunit *test)
 
 	kmem_cache_free(cache, p2);
 
+
 out:
 	migrate_enable();
+	kmem_cache_free(cache, pin);
+
+destroy:
 	kmem_cache_destroy(cache);
 }
 

-- 
2.56.0

