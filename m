Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868243;
	b=e+RRqK5XkUEnpoC3+Vaqn2bYib9KHg+w9IwnY3X8dYDWGYbh3EyBh8A/dxs1hH2VgpeT
	 yYLzTzigDDaGowyHZeU6v/Fl7DY07QmLqTdnfgiGZ4DQFsvee2/MUHAhJg/rclF4haDT8
	 O1Q5rikRbunKQmJANL+vkV2tLCnDD1KGuvQGQpDnT5QVWo6RRJGRZfvQ8W3BvbnRiUWPl
	 nGC2DgU8+kqIQPEpDPoUVy1/MtpjETXZMdFJDGNSgU3OoBfYHo3gzigmpVJCyu/mI6ay9
	 +0fdfpnat7ovcQVWCIQ3o0VJCwXlKmbyxHk2sQDHbMu8D/I68lwbI0F1VrfGVg8ud1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868243;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=gA4GYfT6GSCvJ1oVfp7f8fLjQLRtbP4OEVTLxVbAiqY=;
	b=UwdqqFX8E113yV4HNWLaw5vXkNmQqO42Gz++l5zY0zh4yhIIm1WqSFCPUBt0fUUnpyra
	 kusg5NzqVpt9VlFK9hVVpvRqa41Em+wGQd5RqvHryps+2LpIwy32IMdSxRe+5yU2p9Mcx
	 jRQTRucvVLECguFd9sd8qChA0qrV/DwQoa/N/eEv58A+xQhqDon5sdl323K2W4VeHDzAn
	 n6V88dgXGV7qePizQ5eEb/1+STCCMsp6263/Vd89Yk1CRd5ZWoGgCDEbuPDwg3St47VDU
	 md1EvxBVuKGI9Ol6IqfjvuOST8l/nOoE10X0Ni/DeR6PxFt/rHzBuVZqtrIKMAH82Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MPOs+TdQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFAB606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MPOs+TdQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B456A1F000C1;
	Thu,  5 Nov 2026 08:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868243;
	bh=gA4GYfT6GSCvJ1oVfp7f8fLjQLRtbP4OEVTLxVbAiqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MPOs+TdQ4Qep5WekUbHmaepO2gqQ/mRINURzsY31qWmiARLHe7YtG3sbyhUICDc8V
	 sYSaNDHqL+EbB+/GHXIa0ux59VZis4ur9fXJcfKB97t2I+Ejf02jGENjdIT3+lmh88
	 SYl2IrxAAWlv1gjjp567dC9jdVWJhPfAGpSVvFdbu6tDhGUAJU1jt4y1Pw1LW+W2LO
	 sSfcaqDX7IBSQRhhtot+Kl3WTXokChL50fOnu9V9RWBQ+99k+6hJtUoQZ3+pEEtE8k
	 PUSfi5Q2emtjI999kfJ9To3Ei/3uZU/wFibN06zSgpqLo37lBRwHBMr/b3QRfsFrO3
	 EHOLGwpcmVhKw==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Thu, 05 Nov 2026 09:43:51 +0100
Subject: [PATCH v3 02/10] kasan, kunit: pin test slabs by an extra
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
Message-Id: <20261105-slub_tiny_rework-v3-2-0484ce59eabb@kernel.org>
References: <20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org>
In-Reply-To: <20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org>
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
 mm/kasan/kasan_test_c.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
index b9e167ed5be3..580a9bf007ec 100644
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
@@ -1162,6 +1170,12 @@ static void kmem_cache_rcu_reuse(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cache);
 
 	migrate_disable();
+	pin = kmem_cache_alloc(cache, GFP_KERNEL);
+	if (!pin) {
+		kunit_err(test, "Allocation failed: %s\n", __func__);
+		goto destroy;
+	}
+
 	p = kmem_cache_alloc(cache, GFP_KERNEL);
 	if (!p) {
 		kunit_err(test, "Allocation failed: %s\n", __func__);
@@ -1178,8 +1192,12 @@ static void kmem_cache_rcu_reuse(struct kunit *test)
 
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

