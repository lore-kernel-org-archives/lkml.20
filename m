Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541634AA1CA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378439; cv=none; b=ZWoT0aYAvHPVH2Z4nqKYQ8bPpY3NrWaVzu7PPScVpg1cn2+tt3od843SEYKrkoej7d6Riu9rDvgicO3btF+ZW64pAaQJPITBgKr6o2kotzSCPumZJSnL8bfyIX6BrDhPiBUEStmelo9LoN4lkgQzAgPMExGKX1btwNsUVdgbsyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378439; c=relaxed/simple;
	bh=wOiGSHTvuaGU2hGJD2n9TN+YSN62eWKKXnnL46WXyRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZAn10nWrHG7OqAzpyDz+i1ZlLsgrgrl9uHJKCysmTUloVhCbOEvQnGruUne4UzxpeLexoQwjTY2KmGCHlPEdwCn5EOYLnYntCT76sun56HUChzNnw/Yo+FHToOh3GFDGSjC5cgdfvpfESoVEYfc4xkexTseS9csaTplC2TAciSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=TqzEg1GQ; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="TqzEg1GQ"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9390dd46b45so109420485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788378423; x=1788983223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VW5hThLcNiS9B9Y8k40LTfPGZJYf7iWoviGkGwyNijs=;
        b=TqzEg1GQ0mynWcwNXcKYtfBFIQpz9l41oqKUyll6YjdI/vbPvKurVd3ahcqF5Z+9vC
         diu/Sc4/gcVQqbwhZKKA/r4yMh+2LIKGsuHPLT0kudAppx86QSYaPVUdEDZV7CimPozC
         uW0/aBAgRla3TRFKjL13fdzbjOYMSub4btlS7O83eMysyi1D4kPcfCSL9S2qQi6sCZgL
         57JHb85z4KSV4+Pkg8cKbZ59Of6yO84dqwC5vZw6CG5C2STQ+51C1jBqYLKq7algduMm
         gNFo8AkMfCOTy0o5iht6PGXA3YaL9R1B4KFl+Ytl2BlSfzAU2mHJ65Q9S/z6tJIOmncc
         fpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378423; x=1788983223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VW5hThLcNiS9B9Y8k40LTfPGZJYf7iWoviGkGwyNijs=;
        b=W7Or9Kn80kkCxMAPCyaI3le+uWfTqiPsM0WojLTiflneDWrM8wpJLoGCGHa6FtZQQm
         Tp2c134IokenTkAX0GuiyUdKBnq08WOK4ywl5koVsy7FPZhHaO/o1xEXcfAbY9qalYNy
         ch7sEmK8fOnNJe5bNlQuk1P0zv++vH412EHtB9yuh1p1PaDJWg8NAtDcCwI+2uTtxVXU
         Vhw50PZhiBNuxta/ZjC//weMcFatv8dO5tso5HeV0UMsucyucVxq1Op6uW8ZPW5kWsye
         mQ0JWqs1BbtfkM8wBTSOUKXcXqX5j1oR3ri3Oncy6g6PMyz7znPGRsAGE/vsP5a0KEuB
         CL7w==
X-Forwarded-Encrypted: i=1; AKwUvBz4EB3gOkLNvYeeE65lWtL1RZArq6uQp+zJJ3dZBhEwhKqvlo4skWu2o5jYAZlJtt5xpLQ3zjRL09kXHxg=@vger.kernel.org
X-Gm-Message-State: AFuF++l9u32ZhPaORVgGQjcTVzjsGBvLDaohkO4zfJi0+7hKl0TXwSpH
	+rfM7ivEtdj9TRW0gnm9vZAvNFhokt/06OBDPr6gK+tVfM8Xu1nS4CjLw9nDc2tdmRo=
X-Gm-Gg: AYBFou3dJL2aipSxSPMT4i+JYc1GukP3E3LkopF8aGB2fc0EVGQ5YoJ+ZM/t9h6AwhC
	HPu3Kc2Pdssq3PzZvc0seDTM67rYw+1gVR7fV/Ea4MuE13WMNtL/xH+S68zKcjpxe5ZiNCKQzKh
	FNhJvIDBOF4QZMVQ6fgKcC6ohg/0BKBWt+0m5s3tUFOF8a94Qi38TvqoftmnkPXTBSEQw3nv0xl
	tEqEGH1FxfaLIO77zkiX32VGccvOYIoYiw02g87tlaK+wjRgdU1pkM5HmD0+la7EdHkbNUwa7wF
	cHsyz6seTjiwVcmbK//UgNK9yfxP34bVKxavbO2nVfnBZn/Emz6TBh2MHNmyvIIA4My7n9hridh
	jAxOmw2seBfzzVNqbYyXpwmnA1f7AUrnHWaj0w1t/Vw2S8+bPBAjFUfUeooU7a//0J4MORfiWcF
	Bs/9781TwYMDDN0RZ9uux43hupjEXCt01r7WpznNnef2fXF/OpJlhFQCtasB8kQmggH9dGUc5Ww
	zqz3YlVtbwCKSKiXloRuiHvcar0QIjr1+c8LRNg7zlx4nky9g==
X-Received: by 2002:a05:620a:a40f:20b0:939:191c:cac7 with SMTP id af79cd13be357-93960e19503mr738239685a.13.1788378423217;
        Wed, 02 Sep 2026 12:47:03 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f18801asm299300585a.16.2026.09.02.12.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:47:02 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	pbonzini@redhat.com,
	seanjc@google.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	shuah@kernel.org,
	Dave Jiang <dave.jiang@intel.com>
Subject: [PATCH 2/5] mm/mempolicy: add mpol_set_shared_policy_range()
Date: Wed,  2 Sep 2026 15:46:54 -0400
Message-ID: <20260902194657.79075-3-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194657.79075-1-gourry@gourry.net>
References: <20260902194657.79075-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mpol_set_shared_policy() installs a policy over a VMA's page-offset
range, which is the only programmatic way to populate an inode's
shared policy after init.

Two limitations make it unusable for binding an entire backing inode
from in-kernel code:

- It requires a VMA, so it cannot cover unmapped offsets.
  (e.g. unmapped file folios faulted by pagecache)

- mpol_shared_policy_init(), the only no-VMA installer, reconstructs
  the policy from mpol->w.user_nodemask.  That field is only populated
  for static/relative or mount-string policies.

  a policy built programmatically (e.g. by mempolicy_create()) leaves it
  empty and stores w.cpuset_mems_allowed instead and _init mangles it.

Both matter to a caller that wants a whole inode bound at creation.
guest_memfd is one: it has no VMA at that point and may never gain one
for a given offset, and it builds its policy in-kernel rather than from
a mount string, so neither existing installer can express it.

Add mpol_set_shared_policy_range(), which installs an already-built,
fully contextualised policy verbatim over an arbitrary [start, end)
page range with no VMA.

Reimplement mpol_set_shared_policy() as a thin wrapper that derives
the range from the VMA, so both share a single underlying path.

Suggested-by: Dave Jiang <dave.jiang@intel.com>
Co-developed-by: Dave Jiang <dave.jiang@intel.com>
Signed-off-by: Dave Jiang <dave.jiang@intel.com>
Signed-off-by: Gregory Price <gourry@gourry.net>
Assisted-by: Claude:claude-opus-4-8
---
 include/linux/mempolicy.h |  2 ++
 mm/mempolicy.c            | 35 +++++++++++++++++++++++++++++------
 2 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/include/linux/mempolicy.h b/include/linux/mempolicy.h
index aef018ad92317..398318175cec7 100644
--- a/include/linux/mempolicy.h
+++ b/include/linux/mempolicy.h
@@ -124,6 +124,8 @@ int vma_dup_policy(struct vm_area_struct *src, struct vm_area_struct *dst);
 void mpol_shared_policy_init(struct shared_policy *sp, struct mempolicy *mpol);
 int mpol_set_shared_policy(struct shared_policy *sp,
 			   struct vm_area_struct *vma, struct mempolicy *mpol);
+int mpol_set_shared_policy_range(struct shared_policy *sp, pgoff_t start,
+				 pgoff_t end, struct mempolicy *mpol);
 void mpol_free_shared_policy(struct shared_policy *sp);
 struct mempolicy *mpol_shared_policy_lookup(struct shared_policy *sp,
 					    pgoff_t idx);
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index da133ffe0b1c8..ce10ce4374643 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -3312,24 +3312,47 @@ void mpol_shared_policy_init(struct shared_policy *sp, struct mempolicy *mpol)
 }
 EXPORT_SYMBOL_FOR_MODULES(mpol_shared_policy_init, "kvm");
 
-int mpol_set_shared_policy(struct shared_policy *sp,
-			struct vm_area_struct *vma, struct mempolicy *pol)
+/**
+ * mpol_set_shared_policy_range - install @pol over [@start, @end) of @sp
+ * @sp:    the shared policy tree
+ * @start: first page offset (inclusive)
+ * @end:   last page offset (exclusive)
+ * @pol:   a fully-built, validated policy, or NULL to clear the range
+ *
+ * Installs @pol over the given range, replacing any overlapping policy.
+ * @sp takes its own reference, the caller retains its reference on @pol.
+ *
+ * The policy is not reconstructed, so the policy is preserved exactly.
+ *
+ * Unlike mpol_set_shared_policy(), no VMA is required, so a range that
+ * is never mapped into a VMA can be covered, including the whole file.
+ *
+ * Return: 0 on success, -ENOMEM on allocation failure.
+ */
+int mpol_set_shared_policy_range(struct shared_policy *sp, pgoff_t start,
+				 pgoff_t end, struct mempolicy *pol)
 {
-	const pgoff_t pgoff = vma_start_pgoff(vma);
-	const pgoff_t pgoff_end = vma_end_pgoff(vma);
 	struct sp_node *new = NULL;
 	int err;
 
 	if (pol) {
-		new = sp_alloc(pgoff, pgoff_end, pol);
+		new = sp_alloc(start, end, pol);
 		if (!new)
 			return -ENOMEM;
 	}
-	err = shared_policy_replace(sp, pgoff, pgoff_end, new);
+	err = shared_policy_replace(sp, start, end, new);
 	if (err && new)
 		sp_free(new);
 	return err;
 }
+EXPORT_SYMBOL_FOR_MODULES(mpol_set_shared_policy_range, "kvm");
+
+int mpol_set_shared_policy(struct shared_policy *sp,
+			struct vm_area_struct *vma, struct mempolicy *pol)
+{
+	return mpol_set_shared_policy_range(sp, vma->vm_pgoff,
+					   vma->vm_pgoff + vma_pages(vma), pol);
+}
 EXPORT_SYMBOL_FOR_MODULES(mpol_set_shared_policy, "kvm");
 
 /* Free a backing policy store on inode delete. */
-- 
2.53.0-Meta

