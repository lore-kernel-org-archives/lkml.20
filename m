Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ADB369985
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790310563; cv=none; b=io7KgM0JcWHmfmnpUJvxT8NaZb/PvijrNI88smrbIR1DkacJPxe8Ix0c8tWEKFQCLjW+jnc/U3z1TfKtyd8ZYrywPZ32ubQWf2Pv6mJuQnDPmnA7vp0/UMn7JgvZ5b/MMuGTqQ/c+OtXANmcrOnFKRxRC+qsXzbf//ICt19xR/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790310563; c=relaxed/simple;
	bh=+ShsSBBguCalQ+r4sdLogwoiUCqrnqvc0M8suyuVZP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A03DMOw+lkAMUtcpOiMUWzwAVF77IIdJDZBGUOiXKyQ7mXrWiLF9tGRLoAzvKiiK2+YnrJh1M3RWMj73Sx8dKvTrUpJo8jV61IEnsRL21I7didAU6DF1GU2hECe4mXj0m+KSlY/puMJGh/Puh7cMNur/Ouk9pAj/IX4ObQkIeV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ku+cXvxE; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ku+cXvxE"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2df8de41d6eso2307885ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790310561; x=1790915361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LU0Go2cyRn/9B1ML6xI9lk2v8ECZiOmXK9suX3taLfI=;
        b=ku+cXvxEMRvksm8Mnig0zfnAlxvXjpoxExoYEegVUIrpE41SJP3BXCtYo2X0GOsfZU
         PjBZ1aVPE/mipo0q4v1FUAifZ/mrIigdr4SiV//jSoTL8wvRUDC0wg9n73mffryFuFCh
         u0EEspRRNd9R3yZLxWzfOIi5bNKUCLV+f9S/NeTM9FGJDn64ybYCHC58xnnuLkIrT2k/
         Qrv6MxUc+myiokIg1je172JgZjPdYV2uqxvwoB6BCToiZASyg9oNLPhGvsESv7wnc7Kc
         7++WfQltrBp6VF+iyAkaJ0o5y4FfZCJdiUzHYq5ExMDf02B8ouc1wbsVSJ2F/re87tE1
         X75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790310561; x=1790915361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LU0Go2cyRn/9B1ML6xI9lk2v8ECZiOmXK9suX3taLfI=;
        b=JPk56McllLIS1kp/ROT92FtGXOqZHDZSRg3CFlbWLMYhzp0j/9XHGRn7ESKyL8ejlq
         yjV81wgmwmNy3gyfuDNZHsmoBw0N/go8gvWejtu3yM2VpGyxXER2VGiNNcxx6Aif/zqu
         Cy2i0HYHe3B/sK+0yeIX5aYUkQy5qM0dyyw9f9OtfE8aCyq1Oe3SOwzlwe+KeAUxX/Jw
         klQx16c4U2MRcTUglC4U/hRmRc97EbvtRToypePGXFdTPksjuJrHU+XrPfF6Fjd2ry+B
         UyjErQiMH57IzgXMrOod6KltR/+nUbFXcGh4zdZK/BkLbqS/7J8AfmxrX4GgIu3kOKQv
         gqOw==
X-Forwarded-Encrypted: i=1; AKwUvBwTxDXUV8cOy2qtCquUqjIvREHd60OxeFBGnZ1hYWMAJsSic+OahnmD2wHqm8mFjt32TrstFzm1ScLPVME=@vger.kernel.org
X-Gm-Message-State: AFuF++kU+V8Y1nWSFvUijR32N7D+/JMgIVv150B8NUn4LooqPRqRM5ze
	ElH1rzVoYiSqxAlBudLRXhbAJa4zGvRIIzIlpyp2LbUgFmCHxcaJnQg=
X-Gm-Gg: AYBFou30xfGQhUll/n69KciP8IXySSiXQPZTjb+oy/ogr1iKjBA2U24TssslyPPCSoW
	QfIlNXzqc1Yacoa6H9b5tNYxnmDGp9blHl2SyUWBdij7B1CXK9oHZamMNvEYw3TSkLLKSaCwpbX
	Q5B7qA+cuheIYoSLPvzh+V00imyht8AXlJPEjPgAI95tYLVG/dgokOcoFOPrKPAfpbVtE+54VA3
	EWADyQu6oXhkXW4arHDUhca6Xli2D3z7XXTiHZhv/IIdsA8Hyy1Fa54PRBH4emFf9IaEOvTwHVC
	EXqriK4t/OyKQ+L6DBVloyKfQA/O/pE3Bj8Z94qrqZfp5yRJDS6vOnQmesmJoWIK2beoSJ9rYGu
	jE5mY6+b+tSAUahIwsGkmjBFjrzWInFPYu02FUvcB/uH8Z+rggnlwPfoAnNmUKjwh+LLLWPQkEy
	BenAwX+gJJPGHilEVBATMLyl0fgcdYLQcyL2Os8pMpDtxK1bfQRqiPWVabxTzhcxRLWGGetBZN8
	nX/RaljPdgjtmP+Cq4QJtMD
X-Received: by 2002:a17:902:d484:b0:2dd:c100:b2d0 with SMTP id d9443c01a7336-2df7dd77d96mr38107475ad.59.1790310560808;
        Thu, 24 Sep 2026 21:29:20 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9525cd53sm2499125ad.38.2026.09.24.21.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:29:20 -0700 (PDT)
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
Subject: [PATCH v2 2/2] selftests/mm: add a test for UFFDIO_MOVE of a write-protected swap entry
Date: Fri, 25 Sep 2026 13:29:07 +0900
Message-ID: <20260925042907.2330519-3-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925042907.2330519-1-donggeunyoo.kernel@gmail.com>
References: <20260925042907.2330519-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move a swapped-out page out of a write-protected area into a destination
registered for missing faults only, and read pagemap bit 57 at the
destination.  The destination was never write-protected, so the bit must
be clear.

Assisted-by: LLM
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 61 ++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index ef9b3956bdcfd..ae8b718f0a278 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -2037,6 +2037,59 @@ static void uffd_move_pmd_split_test(uffd_global_test_opts_t *gopts, uffd_test_a
 			      uffd_move_pmd_handle_fault);
 }
 
+/*
+ * Moving a swapped-out page out of a write-protected area must not carry the
+ * uffd-wp bit into a destination that is not write-protect registered: such a
+ * bit is never cleared afterwards, so pagemap keeps reporting the page as
+ * uffd-tracked.
+ *
+ * Needs a swap device; skipped if MADV_PAGEOUT cannot evict the page.
+ */
+static void uffd_move_swap_wp_test(uffd_global_test_opts_t *gopts,
+				   uffd_test_args_t *targs)
+{
+	unsigned long page_size = gopts->page_size;
+	struct uffdio_move move = { };
+	int pagemap_fd, i;
+
+	if (uffd_register(gopts->uffd, gopts->area_src, page_size,
+			  false, true, false))
+		err("register src failure");
+	if (uffd_register(gopts->uffd, gopts->area_dst, page_size,
+			  true, false, false))
+		err("register dst failure");
+
+	wp_range(gopts->uffd, (unsigned long)gopts->area_src, page_size, true);
+
+	pagemap_fd = pagemap_open();
+	for (i = 0; i < 100; i++) {
+		if (madvise(gopts->area_src, page_size, MADV_PAGEOUT))
+			err("MADV_PAGEOUT");
+		if (pagemap_is_swapped(pagemap_fd, gopts->area_src))
+			break;
+		usleep(10000);
+	}
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
+		uffd_test_fail("uffd-wp bit moved into an area that is not write-protected");
+	else
+		uffd_test_pass();
+out:
+	close(pagemap_fd);
+	uffd_unregister(gopts->uffd, gopts->area_src, page_size);
+	uffd_unregister(gopts->uffd, gopts->area_dst, page_size);
+}
+
 static bool
 uffdio_verify_results(const char *name, int ret, int error, long result)
 {
@@ -2359,6 +2412,14 @@ uffd_test_case_t uffd_tests[] = {
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
 	{
 		.name = "wp-fork",
 		.uffd_fn = uffd_wp_fork_test,
-- 
2.53.0

