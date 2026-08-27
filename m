Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB75385D7B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787803127; cv=none; b=X+foScIVE2+APie3xMUymk+D6X3NKeg1MkKrR1SkDj2yqSz82CRY8J5EBPM6p8Rlxoks7NDTeE/ddR8jHs2xcrVeqCql6fclzL7ZUGcszJCo4cMGDuK3tCr3HnaqL7xkvw8ar6ysLVyEU4vPSQrnR9lT6BHF1K5TVmAi7e5+rSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787803127; c=relaxed/simple;
	bh=7xH2J5Hr5hCWfWqBYkebvmkGGwU+I/aNQBP7/OLO9LU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WKFW2bsWg/RmJrJz8QQnxVQhHCLBa6DUUgq5W34JSnifUAlenbvpoqGiApdxCUA8M8xNNu3muN6Me8PaHquGYll6Kj8D/sfsAE/kDEZl7gFpIucGpxxbBIjn4Tj7JOrlO109tHyhhoL1aIr7ylV6JgJRJKoR9oFqiRyJxyBNc0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9umTilU; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9umTilU"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7ee4399c423so1528258a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787803124; x=1788407924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VLB/ujA8yYDNmLHTN9IIlJkJcIVKxZQzZL5WlW6fCXc=;
        b=W9umTilUfZ+a6nbwoWlgcOGg1SSXKN5nElRXrxbhGecgXGa9CNpjHaiQ35cBzijFrV
         TACzN4YJkV/DZc6ff11UJDiLxKHt0eQjtlU+G56YKGpWrG8QmgeJVPLoEy1hQwFhrPs3
         2CpyyVaorqqxDbb/s8ga8QETC8HlP6hUsxBmZ8FHaTskQFXxKHf0m906qNK2GI04AJtx
         b7g8sKbJf/OeNqVmJTFkaqvMxKWNDEqsfAcafGISlWaptLi03yZWGe7j8OAaPUnL7VgE
         E+2lTCrg7xGiKZ6YzK+4z7QDMnYcVP4mzREVei/3VTUcJ93x/AF4kBHY16ZSWkAZ7bUG
         vN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787803124; x=1788407924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VLB/ujA8yYDNmLHTN9IIlJkJcIVKxZQzZL5WlW6fCXc=;
        b=JRUUOV0hoShPXS7cX1CPt4giiFDACK/6FPYIQVD9rDkQbN7621d0FUT/Vdf/9IKf51
         kPkq/zZeqzvdpsHxKLCGn1QjlDPPaVpsNJcbXy8sgh3dLt7wScnPVxkzqTsKB4F80Mhq
         /g+tt78zK5bKiaFnCjHlTYPQXcUJJsUY1fWhzmWp1LitsYHGz2hsXVdK9Vb7NFziLYHE
         fLzOiBrfQxZoCCDY+Oj52c1PGw1SqwAQ1KlG4qeyIlWALCchbYLNBQRMk3+EH+OPySma
         EgPH1Xp7FJSXYZ5y6QVt/Au9kfqLOJ0p3ysdMQpqKrS4pD3V9GFAYlmsafArUcUdoL1j
         QkmQ==
X-Gm-Message-State: AFuF++m4wDU42t6YjgnAz3Teyuypx9Q9sdAvsfpO/PYwV44pZs/5owlR
	7zcVQm/iqKgsrx3cRcm1VSo1ckQfE39g9gQzrY0OS+wVhvcEfuz8Hnzx
X-Gm-Gg: AR+sD12WnA1tq2lfI5jOSF8R5I1tijNogEwnfI7ly2kE632U2/GWQUwvYnnoqsqt8pn
	XMrpE1R6mnMtX5RnXj4yG1Nk7FnT++avk5Lwh8meZ9fyi0ieEMMEWpPMPXutrhuuv08V4cBjX6L
	8wDcCSxmpReeY6X3Q5iDbmzE00BU8e5qlh5s0wbETZeoWiLe5YzGHaK3h39h0fjp0mX568kATNM
	zwcX3E7hAehCyziv15OryIFQtm+Jf6B4ZLqGEMu5yLlbYvDm5IxgqKf2AK/aiIPIyRSW3QJ67Vb
	cSsQ1M+9dwqyY59b/2GD9s2UJYmLJW8yKMoJC0pwqJ9TrvtVCSv7wCMuR9KDxJCvJoEye/U7PBS
	0AgnIo8AI+D3fiVyR9yAazUrRBw/ba3/lU9CVzRjplqtR2hGVjSsB92vD4RFKjxtLIcmnwPOMML
	eaPbG9fXMvTzLhx3gQuKYS41bMpwcpH45KabbzCdrXaGEjeZwHr6xgmuMLMonzl7UkRaP9c9C1b
	gxmWezbyjgEsp/SI27/By3j6FifEQKdvgGuAGftGfskux4+sYsT41MYs/jzHNDzLGzUlka0hrbn
	drD4J3zk
X-Received: by 2002:a05:6820:1a05:b0:6ae:ab01:91a8 with SMTP id 006d021491bc7-6b1a053ad8amr10898047eaf.34.1787803124589;
        Wed, 26 Aug 2026 20:58:44 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-467367af2bfsm900825fac.6.2026.08.26.20.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 20:58:44 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Wed, 26 Aug 2026 21:58:35 -0600
Subject: [PATCH 3/8] lockdep: Pre-reserve early memblock slab pool for
 dynamic tables
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-lockdep-memblock-v1-v1-3-e2db855391ec@gmail.com>
References: <20260826-lockdep-memblock-v1-v1-0-e2db855391ec@gmail.com>
In-Reply-To: <20260826-lockdep-memblock-v1-v1-0-e2db855391ec@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787803120; l=6278;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=7xH2J5Hr5hCWfWqBYkebvmkGGwU+I/aNQBP7/OLO9LU=;
 b=cHlISIFFiAHVupKSDAtbApaG2C3y9p8jbxVPYHVvqMhd1OUwvzq0fuVqhrcBwgtMCXIub7seS
 WlMK8zK9JpuDrJyn7Fc2f8YsBc3aGHK0fCaq6oQ9TMFToZMywBArwll
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

Lockdep cannot allocate memory dynamically during normal runtime because
it cannot recurse into allocator locks. However, before mm_core_init()
brings up the buddy allocator, lockdep can claim a contiguous pool of
64 KB slabs directly from early memblock.

Add lockdep_early_init() to start_kernel() right before mm_core_init()
to reserve a private pool of 64 KB slabs. Auto-tune the pool based on
physical RAM (2 MB on <512 MB systems, 4 MB default, 8 MB on >64 GB
servers) and accept overrides via lockdep_slabs=N and
lockdep_headroom=M%.

Provide lockdep_claim_slab() and lockdep_release_slab() to dole out and
recycle slabs under graph_lock without invoking external locks.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 init/main.c                        |   1 +
 kernel/locking/lockdep.c           | 131 +++++++++++++++++++++++++++++++++++++
 kernel/locking/lockdep_internals.h |   3 +-
 3 files changed, 134 insertions(+), 1 deletion(-)

diff --git a/init/main.c b/init/main.c
index e363232b428b..12280dfe1d11 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1031,6 +1031,7 @@ void start_kernel(void)
 	vfs_caches_init_early();
 	sort_main_extable();
 	trap_init();
+	lockdep_early_init();
 	mm_core_init();
 	maple_tree_init();
 	poking_init();
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 6a4f21f3e9c8..68d82e46cbf6 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -58,12 +58,96 @@
 #include <linux/context_tracking.h>
 #include <linux/console.h>
 #include <linux/kasan.h>
+#include <linux/memblock.h>
 
 #include <asm/sections.h>
 
 #include "lockdep_internals.h"
 #include "lock_events.h"
 
+static void *lockdep_slabs[LOCKDEP_MAX_SLABS];
+static unsigned int lockdep_nr_slabs;
+static unsigned int lockdep_slabs_used;
+static struct lockdep_slab_usage ld_slabs;
+
+static unsigned int requested_lockdep_slabs;
+static unsigned int requested_lockdep_headroom_pct = 100; /* default 100% headroom */
+static bool lockdep_headroom_specified;
+static bool lockdep_disabled_early;
+
+static int __init setup_lockdep_slabs(char *str)
+{
+	unsigned long val;
+
+	if (!str)
+		return -EINVAL;
+
+	if (!strcmp(str, "off") || !strcmp(str, "0")) {
+		lockdep_disabled_early = true;
+		return 0;
+	}
+
+	if (kstrtoul(str, 0, &val))
+		return -EINVAL;
+
+	if (val > 10000) {
+		pr_warn("lockdep: ignoring unrealistic lockdep_slabs=%lu\n",
+			val);
+		return -EINVAL;
+	}
+
+	requested_lockdep_slabs = clamp_t(unsigned int, val, 2, LOCKDEP_MAX_SLABS);
+	return 0;
+}
+early_param("lockdep_slabs", setup_lockdep_slabs);
+
+static int __init setup_lockdep_headroom(char *str)
+{
+	unsigned long val;
+
+	if (!str || kstrtoul(str, 0, &val))
+		return -EINVAL;
+
+	requested_lockdep_headroom_pct = clamp_t(unsigned int, val, 10, 900);
+	lockdep_headroom_specified = true;
+	return 0;
+}
+early_param("lockdep_headroom", setup_lockdep_headroom);
+
+static void *lockdep_free_slabs[LOCKDEP_MAX_SLABS];
+static unsigned int lockdep_nr_free_slabs;
+
+/*
+ * Claim a 64KB slab from the pre-allocated memblock reservoir.
+ * Must be called with graph_lock held. Completely lockless and deadlock-free.
+ */
+static void *lockdep_claim_slab(unsigned int *table_counter)
+{
+	void *slab;
+
+	if (lockdep_nr_free_slabs > 0)
+		slab = lockdep_free_slabs[--lockdep_nr_free_slabs];
+	else if (lockdep_slabs_used < lockdep_nr_slabs)
+		slab = lockdep_slabs[lockdep_slabs_used++];
+	else
+		return NULL;
+
+	if (table_counter)
+		(*table_counter)++;
+
+	return slab;
+}
+
+static void lockdep_release_slab(void *slab, unsigned int *table_counter)
+{
+	if (!slab || lockdep_nr_free_slabs >= LOCKDEP_MAX_SLABS)
+		return;
+
+	lockdep_free_slabs[lockdep_nr_free_slabs++] = slab;
+	if (table_counter && *table_counter > 0)
+		(*table_counter)--;
+}
+
 #include <trace/events/lock.h>
 
 #ifdef CONFIG_PROVE_LOCKING
@@ -6646,6 +6730,53 @@ void lockdep_unregister_key(struct lock_class_key *key)
 }
 EXPORT_SYMBOL_GPL(lockdep_unregister_key);
 
+void __init lockdep_early_init(void)
+{
+	unsigned int nr_slabs, i;
+	phys_addr_t phys_mem;
+	size_t slab_bytes;
+	void *pool;
+
+	if (lockdep_disabled_early) {
+		pr_info("lockdep: disabled by early boot parameter, 0 bytes reserved\n");
+		return;
+	}
+
+	phys_mem = memblock_phys_mem_size();
+
+	/* Auto-tune based on physical memory and CPU count */
+	if (phys_mem && phys_mem < (512ULL << 20))
+		nr_slabs = 32;   /* 2 MB on small systems (<512MB RAM) */
+	else if (num_possible_cpus() >= 64 || phys_mem > (64ULL << 30))
+		nr_slabs = 128;  /* 8 MB on large servers (>64GB RAM or >64 CPUs) */
+	else
+		nr_slabs = LOCKDEP_DEFAULT_SLABS; /* 64 slabs = 4 MB default */
+
+	/* Ensure initial reservation satisfies requested floor or headroom */
+	if (requested_lockdep_slabs > nr_slabs)
+		nr_slabs = requested_lockdep_slabs;
+
+	if (lockdep_headroom_specified && requested_lockdep_headroom_pct > 100)
+		nr_slabs = (nr_slabs * (100 + requested_lockdep_headroom_pct)) / 100;
+
+	nr_slabs = clamp_t(unsigned int, nr_slabs, 8, LOCKDEP_MAX_SLABS);
+
+	slab_bytes = (size_t)nr_slabs * LOCKDEP_SLAB_SIZE;
+	pool = memblock_alloc(slab_bytes, PAGE_SIZE);
+	if (!pool) {
+		pr_err("lockdep: failed to allocate %u slabs (%zu KB) from memblock\n",
+		       nr_slabs, slab_bytes / 1024);
+		return;
+	}
+
+	for (i = 0; i < nr_slabs; i++)
+		lockdep_slabs[i] = (char *)pool + (i * LOCKDEP_SLAB_SIZE);
+
+	lockdep_nr_slabs = nr_slabs;
+	pr_info("lockdep: reserved %u slabs (%zu KB) from memblock\n",
+		nr_slabs, slab_bytes / 1024);
+}
+
 void __init lockdep_init(void)
 {
 	pr_info("Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar\n");
diff --git a/kernel/locking/lockdep_internals.h b/kernel/locking/lockdep_internals.h
index 3d8bce0dc9f9..3344361a1c3b 100644
--- a/kernel/locking/lockdep_internals.h
+++ b/kernel/locking/lockdep_internals.h
@@ -125,7 +125,8 @@ enum {
 #include <linux/reciprocal_div.h>
 
 #define LOCKDEP_SLAB_SIZE	(64 * 1024)
-#define LOCKDEP_MAX_SLABS	64
+#define LOCKDEP_MAX_SLABS	512
+#define LOCKDEP_DEFAULT_SLABS	64
 
 /*
  * Chunked Array Tables:

-- 
2.55.0

