Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D444A5EC0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013529; cv=none; b=aiGzdsbmED0uIN5Xe9cJx6VJxxOJoJZpeFqb3yJ+QF7qKvxhRye7hEoWbg2QBZgMloO+B6Ex1MB/ruewuYurxslqoWyhVHmu8GEorxFCaeRyev61fbO27r+x9i0GktAKAeLu/P25RN/eD3R+EwPYBqfZ6UiNfulSCdup8JFStkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013529; c=relaxed/simple;
	bh=4LhbwUjpGwhLyjmGqUObBMOdqsFY1ooWA8v6G8YONdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUF+wptdXK4hFzbEXph3retG7CxnarM3PZ9HRSEb8W1zYFpPZliaf6ot66uHmC/vGPCyMkRs64c1nS7lQvDE+u1KzedujFIpsVScmPtdIzdJl40R8eFPwdWrQO1SgH73GcYZD3CYdNBqzxTJTS2sxSIdr3EabaPZ5q2d0DMEtjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=hPzr/cqQ; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="hPzr/cqQ"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5351e6a2230so42196421cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792013526; x=1792618326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tO5UQmTvouQg/ctKnDF1pYsfXafOcfme5DKNKK31tzc=;
        b=hPzr/cqQ39oGc45hSPSmaZVhKg7xyV1PdCDdg0hj2hReshkNED71OzJ5/Iu3Hu6gxz
         p7J2tkYiRJLmV+UHIejaqxCPOTczHx95aOqW0t0+HkZqsr3TOyWNSo/OCBdZZGZAJF6d
         DecG6coEqkCDnRvdOA3s0r4bTGy036IU5VtQK7pFGMPrQQM/xq1AE75ttkoJO8ahtt02
         kPI/WMN8m2JtMfUyfdO8eLiFI6i8JYEPp/Sp6F8Lan7KYFlFKvnngyMDenH6ZsPidIXV
         GfbdK/RVlZmAi87WjfDhiSIOie0NH7haY/FkMBjOxUKYP5YvY1UDdTZrTk/qFG/d0sx6
         2Zww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792013526; x=1792618326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tO5UQmTvouQg/ctKnDF1pYsfXafOcfme5DKNKK31tzc=;
        b=zuNm7JbzSiV/63z4zSLFA8AC1F6rHjHaTQ/YJbHVmVOBfMZIScnlW5Pzkq1IsUPTDQ
         MdjEhtJMaxmsq1aokO57A3f/anYe9KkzbqV0LhHp0VtN/zEP243lYWhLMPX5U5HpkhUY
         rGOfVqRWmwAUhAkcAeh5WPlq+F3RKLCN2fpJj5/e07kgXLpbMd8HJf8oWibTIXlrKKiY
         RXcOlbKR1o43TCtZYu4rLaGOR6d3CX8RHhOUU1VW1wQzYpTrc1qMqTuhZ44J9Ck8iLeG
         Q4fNiNugeYGYnlRxnKlp8cYZXsTqvG/jvBImPRlbEk93jObSWWccTi1fyLju2txChY76
         Qd6w==
X-Gm-Message-State: AFq9FYIrOCiD7/5BmGJgkf5dWhKtogpa10wnYnk94HFE40RLXLcpl3US
	NR8egdNfMmZhc2Akw4cRTVXB9ZKI6y3Q+KuQUPe0XihH2JS1PyP0W7P2xRLB6IwMvIQ=
X-Gm-Gg: AYBFou3TmVhiPhwuDlHZSEv+s0ynbm07I8UMqckWVK0EJ2MJPeXFo7Mpfsy/PHwZ6Wx
	x63ogy1mCmSMVbrX5wMv7gsVh7MBuzSCWTSUBRLHdBxek728z9QMarprkWuZZry4uI8rEjjQt72
	XP1Mx0O68Q8/H/9qVbuIgTYQz2yXvs1MtWZibvtSj3uFWClxS7ZE63XQPzXO1hkiUNvZJ3jflYt
	YdFiW6wD5se2BjPGJkMThMvPwuAjLL09UhxQu8uk2TX2umZhQSZvlpUNgNV0h89Em3VmlqvlMBM
	Mb0WKKO3cNY1dGqJ/TRWAJqb7kNJUoDebTx8BbIo8EtgmM7ZRR7rqtlS0cJNQtvkku2E9yPEQJZ
	tr57mLB4I/OC6uNttnd0NUmZ8SL5oeydAFO4vbrbrhT2RktxCjxqeaO+ohaiXK9Xdbw5xg6efJv
	Vjl3EWZ+Y+1GpSOOgLqJZlCj3Bs/EF0o+aW15jYSygUcFEvjQVHGxhGpOoWGY1S3z0/5CxLkHiI
	uHoztvfCb5ApvqlNraue9syGF9Tk4+nRWYt+BJD3TgxUoIUZElO3M5NTkCZ
X-Received: by 2002:a05:620a:1789:b0:937:5ab5:53f7 with SMTP id af79cd13be357-93ebd233be3mr2873421685a.43.1792013525863;
        Wed, 14 Oct 2026 14:32:05 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b383dasm63183306d6.8.2026.10.14.14.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 14:32:03 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Subject: [PATCH] fixup! selftests/mm: check MADV_COLD and MADV_PAGEOUT range handling
Date: Wed, 14 Oct 2026 17:31:42 -0400
Message-ID: <20261014213142.2269787-1-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014175756.2035176-4-gourry@gourry.net>
References: <20261014175756.2035176-1-gourry@gourry.net> <20261014175756.2035176-4-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko fixup for patch 3/8

This is largely an overly aggressive fix for systems with >1024 cpus,
but it's simple enough and can just be squashed.

sched_getcpu() can return a CPU number at or above CPU_SETSIZE on large
systems. CPU_SET() ignores such a number, so the fixed-size mask stays
empty, sched_setaffinity() fails with EINVAL, and every test that pins
itself fails. Size the mask to the CPU number with CPU_ALLOC() instead.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 tools/testing/selftests/mm/madvise.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/madvise.c b/tools/testing/selftests/mm/madvise.c
index d59c03ec8191..3f361bcf1039 100644
--- a/tools/testing/selftests/mm/madvise.c
+++ b/tools/testing/selftests/mm/madvise.c
@@ -224,12 +224,18 @@ static bool pageout_until_evicted(struct __test_metadata *_metadata,
 static void pin_to_current_cpu(struct __test_metadata *_metadata)
 {
 	int cpu = sched_getcpu();
-	cpu_set_t mask;
+	cpu_set_t *mask;
+	size_t size;
 
 	ASSERT_GE(cpu, 0);
-	CPU_ZERO(&mask);
-	CPU_SET(cpu, &mask);
-	ASSERT_EQ(sched_setaffinity(0, sizeof(mask), &mask), 0);
+	/* CPU numbers can exceed CPU_SETSIZE, so size the mask to fit. */
+	mask = CPU_ALLOC(cpu + 1);
+	ASSERT_NE(mask, NULL);
+	size = CPU_ALLOC_SIZE(cpu + 1);
+	CPU_ZERO_S(size, mask);
+	CPU_SET_S(cpu, size, mask);
+	ASSERT_EQ(sched_setaffinity(0, size, mask), 0);
+	CPU_FREE(mask);
 }
 
 static bool page_is_present(int pagemap_fd, char *addr)
-- 
2.56.0

