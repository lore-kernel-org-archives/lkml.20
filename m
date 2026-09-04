Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B9D3914EE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788562272; cv=none; b=Zp6vu87ezzQKgkR5/ezLOg4o9FwuMWpjrfD4gvPclELOKRX3ZSgcIomZlIKkJ2HcqDLKMfZLwRCQytFbe4DyE9jwr1633gmsl+mfFQD1xR6t/tpJrliXbT/ORPtCSdH1RyjOJmJ3ooXU/hqLSIl9wtpu/Ng5tXA8nlS/G74Cg/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788562272; c=relaxed/simple;
	bh=7Rr4cZf23G1AhSmC6yHNaypWuZm8NnD+lG4o7s9xYsQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Kwo7d/5ooFOWUPJWdIPlAjqjmArxIz0+qL8z8V59oKP2RR2MkvAKk/zNDv5JVLKi+Obl+BPCkLtpBRXU4h2EzxWT3Ys9RFVEgf4DKuGy64lt49MRWXDjc4pBSNebFn02dw2lNvhumIRmpuGR1eHHmGbBZAN0/XsPXG6bg8Lpmco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pMPWpmHv; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pMPWpmHv"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381250979d5so1806368a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788562270; x=1789167070; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VNAQcGgCzsGn8fB04Y1RcaGfsgoCFdcws+Wtu5yA69s=;
        b=pMPWpmHvPvN5zEtwTLfiDUwwtHC9VZdApTNgYP7e3Ok+eo1Xts9Fvyb+b8istJf6St
         4Vn5dsgfbIag6TjgVEKTt5ds6e7AB1uARD0bDhOn30lv7W92DLAiWMEd+ixT/wf95ywD
         i6VaHyXO5Ru0Mh+Hc0nk64A3sCiglprJBxBEZHv18R0mTGNteQIFVAlfDC/e2NFPDdGl
         +6oei6f+NNsnLAZ6BjU5BOW6scwTLSTTRuAQofF7T5aQGRtWFos//U/Na2v0LK2I3lR8
         MccdtCStSJXqxtu02pILHGq95bkGtgoRimyoXtpWDw9R7MT0DpvYrPAOYRQ4LBTYWZaU
         j0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788562270; x=1789167070;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VNAQcGgCzsGn8fB04Y1RcaGfsgoCFdcws+Wtu5yA69s=;
        b=e36PosFa4lRqsBDpOEs0dtxD/CEE+ua3WMlnfWBtQguqJhsTvswTZP2FNHGCX9yMZW
         LRjgTTnbzUlc8FrsmknG/gKOBi47wS8rme/nbUdSwPfEw0uU6ymdqSLKC+wAYgB/rN6S
         A+08Ik0zqsS48dAcfp4VFl2w7Z0i30qZvqWLjiTlBAdkPDwWyEEZ7SUwrauQrV3cBxZe
         E3+S5/FKKvoi7NWZ6zBJugoq0UX20Z2USn8PZDy8HDR+XdnoR7Mp4G0gQM1s9a7k6L6o
         urp9ahHRlbVJm8A533l5YsXegdGMn6+iP58llHKISBCFCVlyJqkm7qL4KukPeOyZP3y9
         C1+Q==
X-Forwarded-Encrypted: i=1; AKwUvBySWVLnJa2LTHmJFJLqDa7A3+95I/rjCIgJnhy11feYOeUMoamVO5VugdjbgWBQDzx8nBWmUTqu5mUK3R0=@vger.kernel.org
X-Gm-Message-State: AFuF++m2SEnSEq+Umz7hTiMtrY+LupSJ+OUkMki4VVXAir4xns4GBM7N
	o5S6xpmeMWbgVklImUIUZHdPPp0EhqVbq63YuwnaWkEP/JZoQtzjfnjsmZyaSJaExV7r4pqaPdf
	uGBBrDAGhKw==
X-Received: from pjbsj10.prod.google.com ([2002:a17:90b:2d8a:b0:398:ff5d:7e24])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5243:b0:38e:c232:9d3f
 with SMTP id 98e67ed59e1d1-39b2614df1emr14776303a91.5.1788562270186; Fri, 04
 Sep 2026 15:51:10 -0700 (PDT)
Date: Fri,  4 Sep 2026 22:45:15 +0000
In-Reply-To: <20260904225103.2955759-1-wfelipe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904225103.2955759-1-wfelipe@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904225103.2955759-4-wfelipe@google.com>
Subject: [PATCH v6 3/3] selftests/cgroup: test_zswap: fix implicit unsigned
 promotion bug in test_no_kmem_bypass
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Tejun Heo <tj@kernel.org>, 
	"=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wilson Felipe Pereira <wfelipe@google.com>
Content-Type: text/plain; charset="UTF-8"

In test_no_kmem_bypass(), delta (stored_pages * page_size - zswapped) is
checked against stored_pages * page_size / 4 to verify that the pages
pushed to zswap belong to the test memory cgroup.

Due to slight stat update timing differences, delta can evaluate to a small
negative number (e.g. -5MB out of 1GB). Because delta was declared as a
signed int and stored_pages is an unsigned size_t, C's usual arithmetic
conversions implicitly promote a negative delta to a large unsigned 64-bit
integer, causing `delta < stored_pages * page_size / 4` to falsely evaluate
to 0 and fail the test.

Fix this by declaring delta and max_delta as signed 64-bit values (s64),
explicitly casting stored_pages, and comparing against a signed threshold,
ensuring negative deltas correctly evaluate to true.

Fixes: a549f9f31561 ("selftests: cgroup: add test_zswap with no kmem bypass test")
Signed-off-by: Wilson Felipe Pereira <wfelipe@google.com>
---
 tools/testing/selftests/cgroup/test_zswap.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index f4ee440b3c66..6e7ee11bc97a 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -632,11 +632,12 @@ static int test_no_kmem_bypass(const char *root)
 			break;
 		/* If memory was pushed to zswap, verify it belongs to memcg */
 		if (stored_pages > stored_pages_threshold) {
-			s64 zswapped = cg_read_key_s64(test_group, "memory.stat", "zswapped ");
-			int delta = stored_pages * page_size - zswapped;
-			int result_ok = delta < stored_pages * page_size / 4;
+			s64 zswapped = cg_read_key_s64(
+				test_group, "memory.stat", "zswapped ");
+			s64 delta = (s64)stored_pages * page_size - zswapped;
+			s64 max_delta = (s64)stored_pages * page_size / 4;
 
-			ret = result_ok ? KSFT_PASS : KSFT_FAIL;
+			ret = (delta < max_delta) ? KSFT_PASS : KSFT_FAIL;
 			break;
 		}
 	}
-- 
2.55.0.979.g7e5102b832-goog

