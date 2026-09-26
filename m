Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E32B43E068
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426525; cv=none; b=b+AtqS4Tk0xQniRUNc/H5UWkfCEQRjJ7fze3MAp4JH9CBD4+sXt3Ud+LdsyzwCD1w+qTWZ4abm15/bW0Ai8Mwh4o4ikrxzcsrC9sn/qXCfDfzC/qcBQy/Z/jUk6MD7v8/LckESfK3d6yhGbRPqbYCZSyv1XeZSKQ08WuDDhPiz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426525; c=relaxed/simple;
	bh=UbB5IgdtGCndW6UG3N7bTvImpV7aVcAWAKDDVClg/oQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=THG0YSMqZMlRN+5G0g8YuiR0fxRyaVXNUrKDZEL7wMNNsZ+xl9hgObJsh5tsZ8aBTsDbPgURB4o+JKjgKN2+9Jw5/gr65LmodQCew1xeB8M6thCI6/z148Q9rDBjV7qYaL0GrlcVVqgGix8NDH4z6XFjg1ddx0y+MoFmfixpRvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rSfJ8Fuf; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rSfJ8Fuf"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso885441a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790426522; x=1791031322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UuPio8yVnMFS6iISF91e2TRt3XkbnhyD4KTt+debFho=;
        b=rSfJ8Fuft0MPx8LymPU0nIrdUIr3AvbjxXo5E6RwvYaoN+6QXU65kItJUL4Mup86RL
         m+9Rg1qu37QubB7f2jFzuH4fAbR9ablKrXqRKgnFtsm7wph1dpgazJv3r9A32gFr9AX1
         /3Z0RdYNRKJVh2vV6tde+YbScxno4iRgn7qpROeK7HBqmgM2x9g+rZSeipsQAHrDBQ/v
         U9kIR4D1/PXYybndFfYItoBuhYXqf4jM0KF4LRzBVWlld5ki3OSMhrQ5h7FI5dh9BjSI
         gDtVO05nfD7PhUE74fbN+K9g5eBsB5POfVCe7clM3kGQUariRv4gMklvRch6wBZWIVhW
         AuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790426522; x=1791031322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UuPio8yVnMFS6iISF91e2TRt3XkbnhyD4KTt+debFho=;
        b=EbDyWcB9D9i6CbzxfNHkkFT3IMa9q4sXdUnFeVctz9sw4EMcFXEYDplAVF5VZJzFvG
         rdnRDemCrgEBIAxqgUI44rOzSSXZ40Tk9eMwPXXhMy/9z+hHcj2Nxrb8HspSS2Y2+ugh
         5yYqC1UmYmN1hBa2M8M7G//OHc5JiKzmlrNQdvLlZzOZHSvtQ9HoobOOZoLLQ5W0Vdtu
         Mewb96/4H895oPPdRAnkMXgHVkuy0zio5nkAG0RpJtBT0WcFADvPJldTnn1YovFs/ykA
         NJCjqKe8INxifxrGmKYH0N922mD8cFNIcw46lmRaCnWYuiXCgbcYUIvK0jvx201NjICz
         apYA==
X-Forwarded-Encrypted: i=1; AKwUvBz4e+wgmFG+EMVcRdE90hnUUsnGOAkTCGLdCNxYb7U8RjvoLbhdOKZG48bQwBOES6AN1o1BzwJPDcrRlBs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOvr0Ce6ywzScrBm9GFebtzuNyE/Sjo59zadfPcV5TLDgNKVDn
	614DAOTsx7LF+2DExL1byPcCmW4fQ75LANdrvBC231rNAk3as3Wg0Vs=
X-Gm-Gg: AYBFou3guzXHmFIYa9zFCob+MH9fQRBCI00VEohSjzgAyP7bnLwWA3LsE+sMmFNtLtC
	gPEXWdG53Qn5TgCnJtoi+a3X1HDb8Nwnlu/QnhI24LQjTibo8VD+fRoAvaiO47Q30PNroBqArSo
	6SORGQRJB1Elsg5DAgt1UdK4EbctdDQlqVcMJ0XFGqu3uCrVjtnBgGBYKhRxZ1ksfoKhUv+bbMO
	rIE4FJK1kbRM8pebF3hYmiv0bNfdTDnfQT372nM5UI7BH5xCo6190yqvVdKc+eD/c1ltN88ohkb
	p7FsfIngPsify+vzKQaik0zEKAXvUU6Y4O/7hO3X2ZhTxuIYRNadSdbuMQao3mfqgD/0bC4iBfj
	abI0p0igVBy+ok8PXaIVI52NwOzdMjIX0mYbOsVtxvpvk2HZ4fO95fy5V44YEbfEtzoa/tl9xQ+
	lUmJErKHftiIyyjkgKxHvC4tXsCOCIWPUOlb919bS7xvVoo/kpGgAJNQhvopDJHqMsBppEgASl0
	QesLp2XRl79D4vCzUNmXxxH
X-Received: by 2002:a17:90a:38e4:b0:3a0:b223:6830 with SMTP id 98e67ed59e1d1-3a0b2236c1dmr2901997a91.7.1790426522302;
        Sat, 26 Sep 2026 05:42:02 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0cd1c4ec9sm5965212a91.16.2026.09.26.05.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 05:42:01 -0700 (PDT)
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
	kirill@shutemov.name,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH v3 2/2] selftests/mm: add tests for UFFDIO_MOVE of a uffd-protected swap entry
Date: Sat, 26 Sep 2026 21:41:45 +0900
Message-ID: <20260926124145.2878520-3-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260926124145.2878520-1-donggeunyoo.kernel@gmail.com>
References: <20260926124145.2878520-1-donggeunyoo.kernel@gmail.com>
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
index ef9b3956bdcfd..580178630eded 100644
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
+	struct uffdio_move move = { };
+	int pagemap_fd;
+
+	if (rwp) {
+		if (uffd_register_rwp(gopts->uffd, gopts->area_src, page_size))
+			err("register src failure");
+	} else if (uffd_register(gopts->uffd, gopts->area_src, page_size,
+				 false, true, false)) {
+		err("register src failure");
+	}
+	if (uffd_register(gopts->uffd, gopts->area_dst, page_size,
+			  true, false, false))
+		err("register dst failure");
+
+	if (rwp)
+		rwprotect_range(gopts->uffd, (unsigned long)gopts->area_src,
+				page_size, true);
+	else
+		wp_range(gopts->uffd, (unsigned long)gopts->area_src,
+			 page_size, true);
+
+	pagemap_fd = pagemap_open();
+	if (madvise(gopts->area_src, page_size, MADV_PAGEOUT))
+		err("MADV_PAGEOUT");
+	if (!pagemap_is_swapped(pagemap_fd, gopts->area_src)) {
+		uffd_test_skip("MADV_PAGEOUT did not swap the page; is swap enabled?");
+		goto out;
+	}
+
+	move.dst = (unsigned long)gopts->area_dst;
+	move.src = (unsigned long)gopts->area_src;
+	move.len = page_size;
+	if (ioctl(gopts->uffd, UFFDIO_MOVE, &move))
+		err("UFFDIO_MOVE");
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

