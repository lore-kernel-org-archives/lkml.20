Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5828D2E7379
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790123170; cv=none; b=ntxxxnRrfa9/kqK6TpLnYsKEcFAOSAm9l/JTuL6lJU7vupGveKZiPd12Xun4mwmeqT569iVrDBjdl83tE4L1QzAu3XYcW41fsyiqg8MBncMq8mEI1aZHg1THJ77KB4MulZNeeYNkR0L3tt/Qv0qRI5zK5LaUt1dsysyJ+eKiUv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790123170; c=relaxed/simple;
	bh=VmXTMa/Bup21S8yFkEfL/80LZh3xNrLztMxxvOe2+R8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J3pJ67hCkbe7cK1OGWLbq7XNeBTdeVpfb9KxEbbVfLetVT4JGjTUpZYPPL4Il25ihIpesEc1FUqUbrL7Q3v1LIajQ40nT9VFBkKfBQJo7nwiieYxcSpv4Oq4G1j88UJluDexVnD0OrZiA3UqnMOZBcAKS6KiiTyiVCOpS+5Bh44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8u35ch2; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8u35ch2"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db18fe433fso1862655ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790123168; x=1790727968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EuB5HZ83DEiTy12L1l/fqfuPkHFmU6lDMt8lQEtLu4c=;
        b=Y8u35ch2se5OWcIVWju5xiBVVmEAujR3KsdSWkcw3VEHDoBO/cZqbiBWFkFkGcOhl/
         RgtrnDObeuQDYsjzQkRHur7Q/eSa8qjM2Nu5mBpTf+R1SCzhNgv7qeRR8+dPDpeMmbjW
         P0hSUKAZcMsTWST5qHTfIdV/oIhcLNhC8depf5b47aemhSYS/FGKYHnEiZbylzHWvNry
         zzWU5Jnia6tRC84kdhBUDZUNg1ocqRRq26eZnXgF5W3pCHThyG8n0GOKY0aEIWX8JhQT
         7no3/uDQ9SzvdWqct8DhY+TH7Ll7tMgXTxR3cHxlMHpFBeDGZe5Kw11SxCPEVIIvN7HW
         Q+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790123168; x=1790727968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EuB5HZ83DEiTy12L1l/fqfuPkHFmU6lDMt8lQEtLu4c=;
        b=NE5NDid2KDihOcML2NPux26CTn6ZcGNvopMCtB88uNy5gjC2B92f7RCBPHW4J1hAlP
         JPYEsm4ddQTdeaPLvTGwi1xbyQP4kbkFO3Iu3svT41vGVOdU1/HmxDu2O+eKYwBhl6p4
         WFfa7DnSwriApmthAaSVWA5oQ6q2vFC1Sv+B8gFH1qQF1yfJ9Ql6P7YishaENoFT5g//
         i6cewYBaROb/X32C5nuj+fUqPkvKzFx7k7M/usiqw1kyd30kw4//7dBsAQ5Cs82cmBXJ
         vlf4oUzgSwuolcitoy6thbaYtmhrucNRHbBEqK9/Bc/IEnyPsnH7jzt7/yh4GZEZ2ElM
         59AA==
X-Forwarded-Encrypted: i=1; AKwUvBwQpNveZF+gMtl9ILOTGyEiDDhXE1YhYdehObquq0A2zppmpY7kfz98QPWDsizUE1QE3tRczdUh+88ugy4=@vger.kernel.org
X-Gm-Message-State: AFuF++lzFCBukWTerUTmoH4HsKZ37E5S6S9Dtb0505qLdif+ZZ3AIsa8
	tlBn4wHdZ/PIXMUJ9J9is6U6AMGe9dSK86IdL1K/OQLR6DImWHMa4m8=
X-Gm-Gg: AYBFou2nVtnoCFi68sq0rR06QIisPwaB9Q1BltNBEjDouHn8l48IS4iXSveyl3uYzYe
	NgqbdE92lP7CNuWyW5GI07xiR1BSdOr6ldLpjvxHY5TnQGZmdiJYQujWYvrSWqyyOD/DcJjEwMC
	CqmdaxEWVOlDLTTi2FzlZcCAcnBpNX0nwAfTfWbYtQpGOg3WXluDmH/YZO1O1BS7y4eU/ctml5A
	5ZHIePOlEf8mTMxqPEbgsJ3kn52VAbntEBduPUGbQzRMmP+jQkWO8T4zEC+G0727a6m2ChVkwkT
	z3oRZDe9sKLK4eWvVA1+I82b01bW4Q2atHbJnf+AzS6j60bhhF3haf1IaeqRsbBwr+6YkD71aaJ
	EFWFOGLEKakfk/o7ctfpLAbrEumHBhCaOdeSt0S8AVhCSy8cVIx2Jjitaakgk29PREj90gOCnyk
	S4ZLWPfvL2oBm6maWD26rWc7TQAYQ1NOKYeebP/DMR6SfAtqgAQqwtJbgOBTGa1xb97DZcPzgL2
	rIrwAFl5U8ea3EWLuNR/iqiXGE=
X-Received: by 2002:a17:903:950:b0:2dd:c053:c20d with SMTP id d9443c01a7336-2df69e00ec3mr7931245ad.41.1790123168457;
        Tue, 22 Sep 2026 17:26:08 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:2466:805a:e198:cde8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a7b76sm2176595ad.20.2026.09.22.17.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:26:08 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v4 1/2] mm/damon/core: prevent size quota overflow in the temporal goal tuner
Date: Wed, 23 Sep 2026 09:25:58 +0900
Message-ID: <20260923002600.1825448-2-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923002600.1825448-1-donggeunyoo.kernel@gmail.com>
References: <20260923002600.1825448-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damos_goal_tune_esz_bp_temporal() converts the scheme's size quota
into basis points with "quota->esz_bp = quota->sz * 10000", both
unsigned long, and damos_set_effective_quota() divides the result
back by 10000.  quotas/bytes is unbounded; bytes_store() hands it to
kstrtoul() as is.

On 32-bit the product wraps for any size quota above ULONG_MAX /
10000, that is 429496 bytes.  A wrapped product below 10000 divides
to a zero effective quota: 429497 gives 0.  damos_quota_is_full() is
then true on the first test of every charge window.  Other wrapped
values are wrong without being zero: 500000 gives 70503.

Triggering this needs a scheme with a quota goal, the temporal goal
tuner, and a size quota above ULONG_MAX / 10000 -- 429496 bytes on
32-bit, 1844674407370955 on 64-bit.  The scheme then makes no
progress for as long as the goal is unachieved, which is easy to
notice, and writing a smaller size quota restores it.  Nothing is
corrupted and nothing leaks.  This is unlikely to be hit on a tested
setup.

addr_unit does not cover this.  It only scales the numbers a paddr
context writes to quotas/bytes, so a large enough scaled value wraps
just the same, and vaddr and fvaddr contexts take raw byte values.

Bound the multiply.

Fixes: af738a6a00c1 ("mm/damon/core: introduce DAMOS_QUOTA_GOAL_TUNER_TEMPORAL")
Cc: <stable@vger.kernel.org> # 7.1.x
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Measured on i386 under QEMU: one paddr context with a stat scheme, the
temporal goal tuner, and one unachieved user_input goal.  Each size is
written to quotas/bytes and quotas/effective_bytes is read back after
update_schemes_effective_quotas.

  quotas/bytes    effective_bytes    effective_bytes
                  before             after
  4096            4096               4096
  429496          429496             429496
  429497          0                  429496
  268435456       0                  429496
  1073741824      0                  429496
  500000          70503              429496
  4294967295      429495             429496
  0               429496             429496

 mm/damon/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 4687b909d42c9..4716693ec0dc5 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -3275,7 +3275,7 @@ static void damos_goal_tune_esz_bp_temporal(struct damon_ctx *c,
 
 	if (score >= 10000)
 		quota->esz_bp = 0;
-	else if (quota->sz)
+	else if (quota->sz && quota->sz <= ULONG_MAX / 10000)
 		quota->esz_bp = quota->sz * 10000;
 	else
 		quota->esz_bp = ULONG_MAX;
-- 
2.53.0

