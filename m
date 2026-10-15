Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F96F248893
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792106007; cv=none; b=Ofsg2JVTtpoxO/nNkjlWGmUPfUOs6jH/eaXO8e2lFFvFv6d3o8PUMX3NGqIymPv5vU3JZjnvzHj2/oJ+CIduToU+F+1N0PlmTFEj+kqf6F92AazwistsPf4bCBjoiLmGsWl5MDu54amT5S4q/sUbdoGUUDZUQTe9BtdrAPA1q8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792106007; c=relaxed/simple;
	bh=EHh7ETy8gyyonMAMcnl2i36wHVorZukBAZCEEq1Ga7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=umJEV4E429VspNp/HMHXG/8lplPuPKpA6EECDFbHRLcJtuvHXur+ONDCaC9nxAn+QuHgGd3e10kQg3Nm/mztdXB4VQQ9ZA6tO9xwEuangttu9wE6xp0HMOhXZXxeu4kMadKNaKfr3OryOUKvc7w9xdnjLhtZVRhiYVg//qDt7E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=KA/pP5RF; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="KA/pP5RF"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53582498790so24447981cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792106005; x=1792710805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dAaIZ7hoQbW4Z60fNlL2ubqoX4QsjqbaZoJuPxq8vJY=;
        b=KA/pP5RFsfT7PbFSfN8i4zMRjKJmDwUS2zSlJoexp2G3wCPi1r+02+vzmb1xdcQJ8e
         Runj3erbRu8+SldXXndPWFAXEGZltxYD/WdhXtG/rQ564Uqg0J64Nn6C3VWBlbkE9MaD
         ytyU/R19Gkx1ka72htAl0Itkbce/Aqs8WN+MDjJD8Sn5E4rlRC2v6kuWsKvd2BUdwPh+
         Cka+zmb9eVjEXfrYV6LC949wp5nY/AC42Y6uHpOi1bcFMaHHFZ+2vqhxG5Dy+25sK1BV
         vOitnuHMoDN+Qw0r9XjJu15Sb9j5hhQx0wP9edMRihJ6tQOEhX4Zucj3i/cZbuWQFp59
         c4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792106005; x=1792710805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dAaIZ7hoQbW4Z60fNlL2ubqoX4QsjqbaZoJuPxq8vJY=;
        b=i6Hk8Yhgf9T+V9hVyCX1kyNYUhsoTFNBrwVFbtO/rT7Rjt0+9ruXUuy49iyu/TpgZm
         tcADywxF1bwwVK6LDnmIIf7n14UMXhqeq1oyEc1PL1pr2N5LsnH4cRL4ZUsv4f7FlLqq
         IWXc6RRP2hgAaO1PsBcVQa7gt+ec9jIsgex2zPS/oLCvsIPgnpBovNcMIkzazRQiRn6D
         9fjQE0VA4gYIdxUORAS+XAAea4ZKmlPdyP28KFTGVQ6c6GKujSeZfMylTOAbI+p/Fbyy
         hYPwOwAVgcNIyIVlyDJS8QJymNf6xfx/VS7i76t/CpLqtkx3o9CfT7vxRIOdnnhawW9x
         yE7Q==
X-Gm-Message-State: AFq9FYKK+zNhYfAsOf3eD36aA0IJaOEVoBd3WZA7D5w8qLR4JziRy/kq
	WevCjis5MlzUYlGyc/yyvG1PFgs90trglwk1jMkgA2IzEzoII7aWyz9Vh/BnCKVKc4I=
X-Gm-Gg: AYBFou2G8Jb++V6x0yrSgZ+h/tNaSjAPody4vpWta2PthTcZ05tCRpynTWXJf8j+ozo
	fOBnMg2lFCNuFEXL+n3wMua3P2Uh40Z5ywgd44dQLpIK1kjMyRroj2PZBBJulPWy7qIImR1vP1w
	KdH6craFnRjWEBy2d4aSKzMGGHxh3GVGbfAgygJUK/4xctLBYBPCRZHg5dOV9pETJuxFYQur0K6
	NFAFArcffYNoINQEPaBZWrRMVfNKBwicgf6quwMF3GsK0X8hz2DqPy6tOPtHt2YsakhWP5DDJ8M
	BfU1PPBI4yKkD2UliJny1HNlexb3C1zqkVWhJDCs7yCONgMxjl3i/JuL3HJVrcoJypfzZ0f8D6N
	+FySLfWliGzyAbBN/A1+5gXmnGj1XXd5cp17nKb8FtNPMTrtdqFlS8ez2uDJdjaBwYf9AyCN597
	7YRwy8jXZOqJ5Q8IhetQRUGVD43WfzcQDsCu7iSUFmd7CoAsPsIyt1xN9TeNymhaR1LaIBDB5dV
	0Ywu2lMvkTCOZI8AIdRW3oTKHzLVyTO23h8g7+gkfBzOwJut+VZLCQu55UR
X-Received: by 2002:a05:622a:a0c:b0:516:ed02:c85d with SMTP id d75a77b69052e-5359f46e1e4mr316611731cf.3.1792106004967;
        Thu, 15 Oct 2026 16:13:24 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a9637a7sm6256501cf.14.2026.10.15.16.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 16:13:24 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] mm/mempolicy: convert mempolicy refcnt to refcount_t
Date: Thu, 15 Oct 2026 19:13:22 -0400
Message-ID: <20261015231322.3392551-1-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct mempolicy uses an atomic_t as a pure reference counter.

Convert it to refcount_t so that overflow and underflow are caught
by the refcount saturation checks.

This silences the atomic_as_refcounter.cocci warning, which started
matching __mpol_put() when it switched kmem_cache_free() to kfree_rcu().

No functional change for correct callers.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610061946.Bx22ZFrw-lkp@intel.com/
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 include/linux/mempolicy.h |  5 +++--
 mm/mempolicy.c            | 14 +++++++-------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/include/linux/mempolicy.h b/include/linux/mempolicy.h
index 65c732d440d2..8b7570a90e54 100644
--- a/include/linux/mempolicy.h
+++ b/include/linux/mempolicy.h
@@ -10,6 +10,7 @@
 #include <linux/mmzone.h>
 #include <linux/slab.h>
 #include <linux/rbtree.h>
+#include <linux/refcount.h>
 #include <linux/spinlock.h>
 #include <linux/node.h>
 #include <linux/nodemask.h>
@@ -45,7 +46,7 @@ struct mm_struct;
  * to 1, representing the caller of mpol_dup().
  */
 struct mempolicy {
-	atomic_t refcnt;
+	refcount_t refcnt;
 	unsigned short mode; 	/* See MPOL_* above */
 	unsigned short flags;	/* See set_mempolicy() MPOL_F_* above */
 	nodemask_t nodes;	/* interleave/bind/preferred/etc */
@@ -96,7 +97,7 @@ static inline struct mempolicy *mpol_dup(struct mempolicy *pol)
 static inline void mpol_get(struct mempolicy *pol)
 {
 	if (pol)
-		atomic_inc(&pol->refcnt);
+		refcount_inc(&pol->refcnt);
 }
 
 extern bool __mpol_equal(struct mempolicy *a, struct mempolicy *b);
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 70298fded1b4..7c78c66f7f21 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -138,7 +138,7 @@ enum zone_type policy_zone = 0;
  * run-time system-wide default policy => local allocation
  */
 static struct mempolicy default_policy = {
-	.refcnt = ATOMIC_INIT(1), /* never free it */
+	.refcnt = REFCOUNT_INIT(1), /* never free it */
 	.mode = MPOL_LOCAL,
 };
 
@@ -492,7 +492,7 @@ static struct mempolicy *mpol_new(unsigned short mode, unsigned short flags,
 	policy = kmem_cache_alloc(policy_cache, GFP_KERNEL);
 	if (!policy)
 		return ERR_PTR(-ENOMEM);
-	atomic_set(&policy->refcnt, 1);
+	refcount_set(&policy->refcnt, 1);
 	policy->mode = mode;
 	policy->flags = flags;
 	policy->home_node = NUMA_NO_NODE;
@@ -503,7 +503,7 @@ static struct mempolicy *mpol_new(unsigned short mode, unsigned short flags,
 /* Slow path of a mpol destructor. */
 void __mpol_put(struct mempolicy *pol)
 {
-	if (!atomic_dec_and_test(&pol->refcnt))
+	if (!refcount_dec_and_test(&pol->refcnt))
 		return;
 	/*
 	 * Required to allow mmap_lock_speculative*() access, see for example
@@ -2871,7 +2871,7 @@ struct mempolicy *__mpol_dup(struct mempolicy *old)
 		nodemask_t mems = cpuset_mems_allowed(current);
 		mpol_rebind_policy(new, &mems);
 	}
-	atomic_set(&new->refcnt, 1);
+	refcount_set(&new->refcnt, 1);
 	return new;
 }
 
@@ -3188,7 +3188,7 @@ static int shared_policy_replace(struct shared_policy *sp, pgoff_t start,
 					goto alloc_new;
 
 				*mpol_new = *n->policy;
-				atomic_set(&mpol_new->refcnt, 1);
+				refcount_set(&mpol_new->refcnt, 1);
 				sp_node_init(n_new, end, n->end, mpol_new);
 				n->end = start;
 				sp_insert(sp, n_new);
@@ -3224,7 +3224,7 @@ static int shared_policy_replace(struct shared_policy *sp, pgoff_t start,
 	mpol_new = kmem_cache_alloc(policy_cache, GFP_KERNEL);
 	if (!mpol_new)
 		goto err_out;
-	atomic_set(&mpol_new->refcnt, 1);
+	refcount_set(&mpol_new->refcnt, 1);
 	goto restart;
 }
 
@@ -3380,7 +3380,7 @@ void __init numa_policy_init(void)
 
 	for_each_node(nid) {
 		preferred_node_policy[nid] = (struct mempolicy) {
-			.refcnt = ATOMIC_INIT(1),
+			.refcnt = REFCOUNT_INIT(1),
 			.mode = MPOL_PREFERRED,
 			.flags = MPOL_F_MOF | MPOL_F_MORON,
 			.nodes = nodemask_of_node(nid),
-- 
2.56.0

