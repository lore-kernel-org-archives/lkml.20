Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24AE41BA9B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791023453; cv=none; b=Zu0bRvgD5g89Z8aVvcFWAl6XDM6wz2W9CpZ6kTGjm+vyQ2KMAeUqkpIr0MJrhx6et/ftq4yqm4CFFmU9KxpVL60MQFqRJL0909XEapjQW8a33pCnF9DqOznRXxqI2Iqc6Pw0+Ppdrc2XTpkDvO88ZjUsabHfeeVoPCBqYrcIGIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791023453; c=relaxed/simple;
	bh=XefGRV1Ivy9Vn3v4XVAWXgp92Aj87qW/BcgvaHZIrAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lpU7mp49ERh7eOiVAQduazATETfwzhAUKoIiYsf6M8Pl6D7jHxFPqMa5na3Nu3gKsTrKjZKxZSYcFSuboS1d5Q9Y8EKoWoqD4YBfUYCZ1j3nlXZMy2Jg6tW48yMHzb333vHuZ92rCx2pFzLLi7HURC7OC+nZK2E6M+P5Z1ebMlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkEWykT3; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkEWykT3"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a49623b865so138672a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791023443; x=1791628243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vrMFpIv7WRJdTe5fhZ+AXxpLaL+kTtS4G30LmhtwQyM=;
        b=lkEWykT3NqfI87OaxFYRE5lmqShmyAXYkju8M95ii/Dq9X6bEuqh8nS1tfRklWbqqh
         +smQxXhxJmp2EMDeDVOXEq0XuuuBX04BgFl35e7fF1E0+n21BrEwyO06XSglnzKHsngd
         DY+YFB96UKsrPXgC1ejOzfTqNATJzWTTcDJQ0kWsOvccMLjAe7L5DQdIixuqu0nS2/+B
         nOK9RNe2BPB8V5MBFGWrLqEFRxiZ3ZGnE4c3NsaA7HAxYUu1xxsTaHitk4usd2/eKkAy
         vFyTCVGGWaexOvq5qdb8+mG4TZLphSIsskyzRRn5p0faBj2CjeQwkXx6Xf1amlwydPHP
         TtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791023443; x=1791628243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vrMFpIv7WRJdTe5fhZ+AXxpLaL+kTtS4G30LmhtwQyM=;
        b=IxBw94cDlkfEjmqwtjRtcmnaS/2FPIrN2m6/PjBa6yvmQlMkD72bgf2efgOcodhLEN
         798RBwlaWedMB1ZwTKXhliGsq3UZ8dvbAja6Dj0aiJDL5r4nDrs70d4c7L6hWWAhW7y8
         yNiIDc3ikCRJzohIr3e5EpHnPkRJ72VopZ4vAQljyGCz32woJC5WI+uZqbZaMlHxxHnC
         nycPgeoegr0V9F+NIwWuvxMt18xzFiFgOe3To6sy6V5gpuR9RBtjUWUIz/phO2l2YUGZ
         lmJt3LuZ/ITGHD27TaKh9cL5bVoUA4BW3Zxup2PZCllN5q6PHdXK9PQLSgLlKeYpeX1G
         FXZA==
X-Forwarded-Encrypted: i=1; AKwUvBxifBFuUn3Py8tTQO53mtUKCqtZOrBdPlJTKhGcoYGx0t0gGSWdAHkaMVzmLWw0dav5xVRaN9ZIw9JWlFc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaLQq2RAHONyuJDs4MA00z5/579+H7XnAfd1ekQaFRtkx/BIIL
	simxVc/tZhdOnN9YkrDgT+K5sAidRYBthteW6KNTl88fG0f+jF3s4HE=
X-Gm-Gg: AYBFou0uzODwhiTg4xi7GvNlsKLwKs97/oCyiqPuuhd5xOhYCs/97gllILrMqravim2
	DrttY/hK2sQZGoWOApdH+QDI18wIbEGNueebA63uyp4H0menjtMPd1hbHY31IuEHMOET5HhlqZi
	AGlpqmLJ/2/MPjpvFvJH0hQRAj4Rls1fPteyPLGlXEkJ9ypIl9a0TQsN1/ZnRezgKoTl85ePER6
	cwFlpkinAwP8t/sb0wPeDTNMMmGmcX0nFjcD+RB+MUtZbA2rWDdIKpUpTKyN5gNEvxEWGLy03Ig
	mHEy7kbmqXwRtJfeqS2Tn8T6GzAfr1Cg7CcF7uLwXexpXJRkDMemd+sqxhABHch/SDfgcE6rbVN
	mJtvsbe8Fny6h3wE5b3N4MGl52fqz4pMfwdaa1lWuhUxaVchjZaTtIM+1J6apiRFTh4T8wgNkN6
	o4LDUw08tPXJprEV/sY7D2dJoByHNV+MilLiW/W78jpGIhMy3VyAGX4o/JDKOArPFLDq1H/HFoj
	Ie76FxwgS4SHLpLYQD8I8+j
X-Received: by 2002:a17:90a:ec86:b0:3a0:d75c:239f with SMTP id 98e67ed59e1d1-3a78717d98dmr1420413a91.11.1791023442881;
        Sat, 03 Oct 2026 03:30:42 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a709a4e80bsm2121961a91.4.2026.10.03.03.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 03:30:42 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: akpm@linux-foundation.org,
	rppt@kernel.org
Cc: peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	kas@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH v4 2/2] selftests/mm: add tests for UFFDIO_MOVE of a uffd-protected swap entry
Date: Sat,  3 Oct 2026 19:30:30 +0900
Message-ID: <20261003103030.63380-3-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003103030.63380-1-donggeunyoo.kernel@gmail.com>
References: <20261003103030.63380-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move a swapped-out page out of a write-protected or RWP-protected area into
a destination registered for missing faults only, and read pagemap bit 57
at the destination.  The destination was never protected, so the bit must
be clear.

Assisted-by: LLM
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 84 ++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index ef9b3956bdcfd..97484c82f24e1 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -2037,6 +2037,75 @@ static void uffd_move_pmd_split_test(uffd_global_test_opts_t *gopts, uffd_test_a
 			      uffd_move_pmd_handle_fault);
 }
 
+/*
+ * Moving a swapped-out page out of a write-protected or RWP-protected area
+ * must not carry the uffd bit into a destination registered for missing
+ * faults only: such a bit is never cleared afterwards, so pagemap keeps
+ * reporting the page as uffd-tracked.
+ *
+ * Needs a swap device; skipped if MADV_PAGEOUT cannot evict the page.
+ */
+static void uffd_move_swap_test_common(uffd_global_test_opts_t *gopts,
+				       bool rwp)
+{
+	unsigned long page_size = gopts->page_size;
+	struct uffdio_move move = {
+		.dst = (unsigned long)gopts->area_dst,
+		.src = (unsigned long)gopts->area_src,
+		.len = page_size,
+	};
+	int pagemap_fd = pagemap_open();
+
+	if (rwp) {
+		if (uffd_register_rwp(gopts->uffd, gopts->area_src, page_size))
+			err("register src failure");
+		rwprotect_range(gopts->uffd, (unsigned long)gopts->area_src,
+				page_size, true);
+	} else {
+		if (uffd_register(gopts->uffd, gopts->area_src, page_size,
+				  false, true, false))
+			err("register src failure");
+		wp_range(gopts->uffd, (unsigned long)gopts->area_src,
+			 page_size, true);
+	}
+	if (uffd_register(gopts->uffd, gopts->area_dst, page_size,
+			  true, false, false))
+		err("register dst failure");
+
+	if (madvise(gopts->area_src, page_size, MADV_PAGEOUT))
+		err("MADV_PAGEOUT");
+	if (!pagemap_is_swapped(pagemap_fd, gopts->area_src)) {
+		uffd_test_skip("MADV_PAGEOUT did not swap the page; is swap enabled?");
+		goto out;
+	}
+
+	if (ioctl(gopts->uffd, UFFDIO_MOVE, &move)) {
+		uffd_test_fail("UFFDIO_MOVE failed: %s", strerror(errno));
+		goto out;
+	}
+
+	if (pagemap_get_entry(pagemap_fd, gopts->area_dst) & PM_UFFD_WP)
+		uffd_test_fail("uffd bit moved into an area registered for missing faults only");
+	else
+		uffd_test_pass();
+out:
+	close(pagemap_fd);
+	uffd_unregister(gopts->uffd, gopts->area_src, page_size);
+	uffd_unregister(gopts->uffd, gopts->area_dst, page_size);
+}
+
+static void uffd_move_swap_wp_test(uffd_global_test_opts_t *gopts,
+				   uffd_test_args_t *targs)
+{
+	uffd_move_swap_test_common(gopts, false);
+}
+
+static void uffd_move_swap_rwp_test(uffd_global_test_opts_t *gopts,
+				    uffd_test_args_t *targs)
+{
+	uffd_move_swap_test_common(gopts, true);
+}
+
 static bool
 uffdio_verify_results(const char *name, int ret, int error, long result)
 {
@@ -2359,6 +2428,21 @@ uffd_test_case_t uffd_tests[] = {
 		.uffd_feature_required = UFFD_FEATURE_MOVE,
 		.test_case_ops = &uffd_move_test_pmd_case_ops,
 	},
+	{
+		.name = "move-swap-wp",
+		.uffd_fn = uffd_move_swap_wp_test,
+		.mem_targets = MEM_ANON,
+		.uffd_feature_required = UFFD_FEATURE_MOVE |
+		UFFD_FEATURE_PAGEFAULT_FLAG_WP,
+		.test_case_ops = &uffd_move_test_case_ops,
+	},
+	{
+		.name = "move-swap-rwp",
+		.uffd_fn = uffd_move_swap_rwp_test,
+		.mem_targets = MEM_ANON,
+		.uffd_feature_required = UFFD_FEATURE_MOVE | UFFD_FEATURE_RWP,
+		.test_case_ops = &uffd_move_test_case_ops,
+	},
 	{
 		.name = "wp-fork",
 		.uffd_fn = uffd_wp_fork_test,
-- 
2.53.0

