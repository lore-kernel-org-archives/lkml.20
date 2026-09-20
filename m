Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895CE28C2A1
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789871491; cv=none; b=u0ITIbgyy/QqV2f5Hj0g1v1HXhUo5+5z/C5S+N1+9XwEebdvSjXKhoY86+M4znMvEHDd0Zk39+KGj95H9uM4oDlGs+Vl9a+X6+7mXYVMTvykmjApDTXBtQNcaiV20aKsAl3mpb4jR5F98aWgQVLl9x1QZelx3dA8di1x5p6h52E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789871491; c=relaxed/simple;
	bh=Os70wroAkyQSDifQeYgJAUQ+cY5T25vbjX1a1oNeruY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HeVyWViptgbEcNOefHMiUaR1N45OCh6JBEF/0lEPlBSdLkQVXYWNxP2s1FbhXYG6PUJtcMTdemXSTYIF+cKvMwxnEc8nCokyS1h6TMGii4LxyVgPjEGqpG62m2pQXydXuzeyLMNgjUU9qP6YTmicqSACuaNKBQ2WnNz3siT8tBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWijB5LZ; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWijB5LZ"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cc50d1b048eso1644565a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789871477; x=1790476277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVeyuR2cIR+fQnzLXyObLYbioaeM21VgFPAK73XbXwk=;
        b=PWijB5LZ6lzUSVUnt1Jf2zYABy+ugwIqRIEXGT1GjJRB/7sWDy8oo/FKXt5PKcmeIR
         CiF8kMTjLb/s5A2/gnFi//UfsbOKnjbb1yS5dN+NHu9tldaKoDVMd1Izx55hu4IKV32E
         hNE++nWtlOGomGAii5XOlE+d843bt72cELHP7+Fof8c/J/Kv+XbRXh7mdMUqWGrXvwEA
         V4/HKnvriCdmKY7f9GmxMdEKR/I0codINpYQHgRu2DeE6DgvtAySZAxn3EFTwJsy4xUD
         VKtqDarYl30bU+U71xpgx8VaLekfP6XQxv052YDzu1Tv0Uo2OwVY3pModpXDLBzlEMEe
         bKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789871477; x=1790476277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVeyuR2cIR+fQnzLXyObLYbioaeM21VgFPAK73XbXwk=;
        b=Qjxp+2P9Lea3/2+dfqwS9J10ncxIi2llffA5wLOJclHedETKn5f9nBk4Gg7XaLXoK3
         yF1SlBGALoLLrest2aLbTsvk3rN6IqFfnFStThtqwVMgrjF2Z4/RXAmDuAipJIfoqGvh
         LIjUcKu2QSnTBPR9aSlIfbDOF5+MDqPCqhNpABnsV7ZU8LOCV51aMPaIXV9+NCjCV8wl
         evbqVRHSriAqczxpDq1JOtUtAt/bPZR24H55J8VLLR6s8emOA1mlGCmKB8jPebD7FsNv
         7CySdC4Mca+hWwmqXjaEr+uEQxKKSgOE52S6WpWldRPkiMbCwKow0YiiZQ+mhhfMzJPj
         l2wQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoLnnvTliJWrzypWLXGwyotgknRBEkg4BlSOpI2EEXjisPhIKG5r1Ih8jipXKR5I4E8DMD9d7nz5Q6E/E=@vger.kernel.org
X-Gm-Message-State: AFuF++kM7e7JTn4P+X1BnHNHpDGcufITof4XoIBx1BRb1JXfrp8GfkpI
	lqcjsWAVXJilpuY6P4nVBGq5t0ro3oq9OdwaTVij1Ay0Zkd3C7risog=
X-Gm-Gg: AYBFou3Z7LN5dNpABm5vvk4H9lIAg/g4XvY6aER3OWNqDfkUMkZaNgcqPdF9BmFtB76
	VBq9oPGWjaWGfaUymU+FVZzyIJ1U1qben/theKK16C+TzUWXVr2T2aJFem/AwD6esTuQggUMeuC
	jCkRILl+9pik7SP+uOO/gTqNgJtJ9/hpdS9W+GoDQZ40F8ATW7Vzi+Hr0dqzwGRbNFBSOelHBxh
	wgX1bGXottyxU69T5RtEmNNSBN52hFhomM4TugV/33sV/pj6aGqc89+TtatN+RNK9KCU93Q18LG
	yjBc+PrbUycljAirigO/YpyD4E9IngmhBIBR5tjt3Lh3La24CGceU0aJHJtFZ+Kr3byCye2/Ic7
	+yM0v9rV8j2AGZd6chDad8fJktNDQxGDySRaQj7X/uc4N+VEP+T2QIRU3Wpqm6FbOQwHCye0ZZY
	prhipZ1SHop/H0PKu/WTRGLuyZGMhi0J1yq1YB7yH7SpcO3PEEBv06HCx5zMHsuubyTOEN3jDcz
	Tl3OYvYfy2MZXWGJYpjey4rtQ==
X-Received: by 2002:a05:6a20:7f8a:b0:3da:b8b4:91d7 with SMTP id adf61e73a8af0-3dd8c3fdedfmr11656400637.2.1789871476608;
        Sat, 19 Sep 2026 19:31:16 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:36d8:54a:e0bc:3e5e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72aee03efsm1481341a12.24.2026.09.19.19.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 19:31:15 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH v2 0/3] mm/damon: fix the temporal goal tuner's size quota conversion
Date: Sun, 20 Sep 2026 11:31:08 +0900
Message-ID: <20260920023111.2466265-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damos_goal_tune_esz_bp_temporal() hands the size quota to
damos_set_effective_quota() through quota->esz_bp in basis points, and the
multiply that gets it there is unchecked.  On 32-bit it wraps from 429497
bytes on, and wraps to exactly zero at the 1 GiB that
Documentation/admin-guide/mm/damon/usage.rst uses as its example, since
1 GiB * 10000 is 2500 * 2^32.  A zero effective quota makes
damos_quota_is_full() true on the first test of every charge window, so the
scheme applies nothing for as long as the goal is unachieved.

Patch 1 bounds the conversion.  Patch 2 pins the boundary in the core kunit
suite, where it fails without patch 1 on any word size.  Patch 3 documents
the ceiling that remains once the conversion is bounded: the basis-point
form cannot represent a size quota above ULONG_MAX / 10000, so a larger one
is handled as if no size quota were set.

Changes since v1
(https://lore.kernel.org/damon/20260919071324.1583280-1-donggeunyoo.kernel@gmail.com/):
- patch 1: bound the existing multiply arm rather than reorder the two
  arms, per SJ Park's review.  Same behavior, one changed line.
- patch 1: address addr_unit -- it mitigates but does not solve this, and
  the 64-bit boundary is reachable without any scaling.
- patch 2: build the scheme and the goal with damon_new_scheme(),
  damos_new_quota_goal() and damos_add_quota_goal() instead of a stack
  damos and an open-coded list_add(); drop the max_sz local.
- patch 3: new, also suggested by SJ Park.

DAMON kunit: 36 tests, all passing with both code patches; 35 passing and
damos_test_esz_goal_temporal failing with patch 2 alone.  DAMON selftests:
15 of 15 pass unpatched and patched.  They do not reach the changed
function, though.  A build with a print at its entry stayed silent through
all fifteen and fired as soon as a scheme was configured with the temporal
tuner.

Donggeun Yoo (3):
  mm/damon/core: prevent size quota overflow in the temporal goal tuner
  mm/damon/tests/core-kunit: test the temporal tuner's size quota
    conversion
  Docs/admin-guide/mm/damon/usage: document the temporal tuner's quota
    limit

 Documentation/admin-guide/mm/damon/usage.rst |  7 +++
 mm/damon/core.c                              |  2 +-
 mm/damon/tests/core-kunit.h                  | 48 ++++++++++++++++++++
 3 files changed, 56 insertions(+), 1 deletion(-)


base-commit: 498ee28e5ec4727f829507c4a1bde3ab1b7704cd
-- 
2.53.0

