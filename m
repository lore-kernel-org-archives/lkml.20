Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB522390224
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787803126; cv=none; b=AvzwKqxbCzokS0TeLHdT+TmvOMG0ydA9usH3v8ouzpFHl5+WwFlLeAIC4aHeUvvSV7tSlmLaBIKN4xKJZP1OuFp4wgz/5f4vMzSM/CQDwUbbD2iNQhm84CZ2acS4uoqiuHQY1yBfsWzT5W8bz+G3p7zHqsI7rYt7pWnrW9CLJjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787803126; c=relaxed/simple;
	bh=LV7C+hevD5jo0Qd1ODKuYm9AUbl3ktdplJF7EunsPCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Edu5oBcwROskNFG3U10PFZobrK3bKNHuZCgXwvuMIgtHxe98YzPehihG0wbejKwRqKOwyho6Fm3Fdahu9wmqhCh3Bt9ZCSaOIXg7R6lc8UZsihw8/XR+xhgoqb0R4LMBVoMrx4E2JGoQD6anY1Nls98tglONBiDSu56Ney+c64k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1quY3s+; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1quY3s+"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7eb6573bd52so224156a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787803123; x=1788407923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4Y2U8xWTC4FJYDwWkNZ0ZGiY0VW6Zu3Z+04xUlwhys=;
        b=m1quY3s+n/no3UyhIDquBgGuNM8GDdNjW5+yPTYff/QZOc7fx5A8yrh4bMjJIuSp2A
         29EP6egEFWSjvSEkdiIMdGBm3DZusRf3aHKriD5reI7mWzLCNDxz7KNtUAh8/C9FLz8w
         xHcBMTd8i/Hvoztda4ycsJfwrfDElNhy2dYO4L0j1ubcQnl6RRlAzEBGw3PoyvM0r4EA
         1F3Y+6R39LcJtmaWlRpuaywT05NfGeWDQQ72rczLXE9R3JMbBCar9TRX4iQU826Qb5sz
         zC8eFQiNvyO03sbPeW0DhW0Q7ysD+wXhrTUMvcw9gOtS9I8QN638Pz3tbnH2NgmF/V7V
         X3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787803123; x=1788407923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k4Y2U8xWTC4FJYDwWkNZ0ZGiY0VW6Zu3Z+04xUlwhys=;
        b=T/QbUlIknApE49/zONk/vH58vQiO5FezDzKU7OPqYWDerGA6MziIsyj6CZTyslFVll
         zGXn6RA2Rq9/l6XRZAXfjPyBDVSxOLD797FjhrIHOygFZJLAP/TLxKn1pGZwbNf5t8ny
         tZlB6TDcKpoqEoDJbJw+ouTSiDL1wZ7P06FLrcgsXXOjbtsUBpKiLjfXPipoGIdy0G4P
         d5PE2aZaAyIl4ZU3d4nM1hUZLARGrbDg6iSOGwPqyLaL1eEFO1t1sUcymRfAfaMRe592
         qy3/DF3DBz/KrHgIEcTpTA5GJRgqtqGBiukUZzk4KM+Fc/ZS6GXrApurYD5ufCbQ1jG5
         pEnw==
X-Gm-Message-State: AFuF++nMdD9pgxLyEz2SW29AnfQQitHb7CmOP3hu0mupxrVACdMK6zZi
	nJgy48xIxLhZilK+9d1WGAJhWXY9wDXj6EEvcqwikfHMxnos0VMfXQd1
X-Gm-Gg: AR+sD13VuFPIaxhbkE1V3nHu3d5ZvNp/uhHhWAb9aJxgdeI1FC6ezs3j7Zzb7Bk4bC9
	opxbOIxFczXIdlxWkYqgMRItfaO7PwsaPzLHnzmqWxsg9nWiXo3eHQOBMSa0vltP/mc+r1K7FZd
	I19ZrtQAeE3OnhwKeuJKzAicJUvA4vU0dcDzf7RkOO0lITexSPXbr/Pb3AbOcY2YLmaC+a89wny
	A7DhATHGsRvAZA7mUtZ4zWzH/neiKUDE8p6Ygp9Rl2aMXmnlR4VkHmEFX4QqXP1Y5Dfyo70P8cS
	4e6FGFQvVzyctHOWdZmbxU8PB5By3EandIcY2pn91St5yIMrRCnfmQvHfUsofzsEjMhkGDZLyT4
	lvMAoUbFbRFEFhDaL3p8nJCtCeyk1lh9AwkKG5rB1aLPrJ2gsQKCYv8EzMg9TciVGZdnttTOCpQ
	JAoVkVKUIi/XmDvabj2JpC277YanFMkNkSzhZu7prSAaQFkC/RiFBJJbWFhB3EHSO0sIvJIwlLY
	ZoqtZUxNGYisbQSAXlnZD61sV/GQryzEjGcnlUq/yyqXERsynWK+vvpCCaYRdMXHffsm/5RKvHS
	AdCvf+sSLUggY+0b6Zwa
X-Received: by 2002:a05:6820:55c4:10b0:6b1:4357:9fe9 with SMTP id 006d021491bc7-6b1a03675c0mr9390227eaf.6.1787803123629;
        Wed, 26 Aug 2026 20:58:43 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-467367af2bfsm900825fac.6.2026.08.26.20.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 20:58:42 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Wed, 26 Aug 2026 21:58:34 -0600
Subject: [PATCH 2/8] lockdep: Add chunked array infrastructure and embedded
 indices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-lockdep-memblock-v1-v1-2-e2db855391ec@gmail.com>
References: <20260826-lockdep-memblock-v1-v1-0-e2db855391ec@gmail.com>
In-Reply-To: <20260826-lockdep-memblock-v1-v1-0-e2db855391ec@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787803120; l=4352;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=LV7C+hevD5jo0Qd1ODKuYm9AUbl3ktdplJF7EunsPCM=;
 b=1SwhDkg8pHPHGRaZqLjVF8JnKhDqodfKVGuFnFmAFrcu2BklyY1qDhOcxo5iFmQD2kU82FZZb
 LsNeOc5r/l/CzhamJZfEaKUhpP8J1sWURSpw6t56eSf0jY0erjU03Qp
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

Lockdep's dependency graph has historically relied on flat static
arrays in .bss. To transition these tables to dynamically allocated
slabs without incurring division instructions, introduce the
DECLARE_CHUNKED_ARRAY() and DEFINE_CHUNKED_ARRAY() macros.

These macros construct 2-tier chunked arrays (Array-of-Arrays) indexed
via Granlund-Montgomery reciprocal divide (reciprocal_divide()),
mapping indices to (chunk, offset) tuples in constant time (~3 cycles).

Also embed class_idx into struct lock_class and chain_idx into struct
lock_chain to replace flat pointer arithmetic (ptr - base) with O(1)
index lookups across disjoint slab chunks.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/lockdep.h            |  3 ++-
 include/linux/lockdep_types.h      |  1 +
 kernel/locking/lockdep_internals.h | 48 ++++++++++++++++++++++++++++++++++++--
 3 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 621566345406..4c96959d8ad7 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -77,7 +77,7 @@ struct lock_chain {
 	unsigned int			irq_context :  2,
 					depth       :  6,
 					base	    : 24;
-	/* 4 byte hole */
+	unsigned int			chain_idx;
 	struct hlist_node		entry;
 	u64				chain_key;
 };
@@ -85,6 +85,7 @@ struct lock_chain {
 /*
  * Initialization, self-test and debugging-output methods:
  */
+extern void lockdep_early_init(void);
 extern void lockdep_init(void);
 extern void lockdep_reset(void);
 extern void lockdep_reset_lock(struct lockdep_map *lock);
diff --git a/include/linux/lockdep_types.h b/include/linux/lockdep_types.h
index eae115a26488..8acac0b59f69 100644
--- a/include/linux/lockdep_types.h
+++ b/include/linux/lockdep_types.h
@@ -121,6 +121,7 @@ struct lock_class {
 
 	unsigned int			subclass;
 	unsigned int			dep_gen_id;
+	unsigned int			class_idx;
 
 	/*
 	 * IRQ/softirq usage tracking bits:
diff --git a/kernel/locking/lockdep_internals.h b/kernel/locking/lockdep_internals.h
index 0e5e6ffe91a3..3d8bce0dc9f9 100644
--- a/kernel/locking/lockdep_internals.h
+++ b/kernel/locking/lockdep_internals.h
@@ -122,9 +122,53 @@ enum {
 #define MAX_LOCKDEP_CHAINS	(1UL << MAX_LOCKDEP_CHAINS_BITS)
 
 #define AVG_LOCKDEP_CHAIN_DEPTH		5
-#define MAX_LOCKDEP_CHAIN_HLOCKS (MAX_LOCKDEP_CHAINS * AVG_LOCKDEP_CHAIN_DEPTH)
+#include <linux/reciprocal_div.h>
 
-extern struct lock_chain lock_chains[];
+#define LOCKDEP_SLAB_SIZE	(64 * 1024)
+#define LOCKDEP_MAX_SLABS	64
+
+/*
+ * Chunked Array Tables:
+ * Replaces flat monolithic BSS arrays with 2D chunk pointer matrices.
+ * Chunk 0 is statically allocated in BSS for early boot, while subsequent
+ * chunks are claimed from the memblock reservoir via lockdep_claim_slab().
+ * Indexing uses compile-time Granlund-Montgomery reciprocal divide
+ * (~3-cycle multiply+shift, zero division instructions).
+ */
+#define DECLARE_CHUNKED_ARRAY(name, type)					\
+	enum {									\
+		name##_PER_CHUNK = (LOCKDEP_SLAB_SIZE / sizeof(type)),		\
+	};									\
+	extern type * name##_chunks[LOCKDEP_MAX_SLABS];				\
+	extern const struct reciprocal_value name##_rv;				\
+	static __always_inline type *idx_to_##name(unsigned int idx)		\
+	{									\
+		unsigned int chunk = reciprocal_divide(idx, name##_rv);		\
+		unsigned int offset = idx - (chunk * name##_PER_CHUNK);		\
+		type *chunk_ptr;						\
+		if (unlikely(chunk >= LOCKDEP_MAX_SLABS))			\
+			return NULL;						\
+		/* Pairs with smp_store_release() when new chunk slabs are published */ \
+		chunk_ptr = smp_load_acquire(&name##_chunks[chunk]);		\
+		if (unlikely(!chunk_ptr))					\
+			return NULL;						\
+		return &chunk_ptr[offset];					\
+	}
+
+#define DEFINE_CHUNKED_ARRAY(name, type)					\
+	static type name##_chunk0[name##_PER_CHUNK];				\
+	type *name##_chunks[LOCKDEP_MAX_SLABS] = { name##_chunk0 };		\
+	static unsigned int nr_##name##_chunks = 1;				\
+	const struct reciprocal_value name##_rv =				\
+		RECIPROCAL_VALUE_INIT(name##_PER_CHUNK)
+
+struct lockdep_slab_usage {
+	unsigned int lock_classes;
+	unsigned int direct_deps;
+	unsigned int lock_chains;
+	unsigned int chain_hlocks;
+	unsigned int stack_traces;
+};
 
 #define LOCK_USAGE_CHARS (2*XXX_LOCK_USAGE_STATES + 1)
 

-- 
2.55.0

