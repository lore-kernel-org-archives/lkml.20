Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467BD3033EC
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789778809; cv=none; b=K1HVk31AFG6rli0GpGGeD/PjXCGa7mFFVyPS3w/G7519iNf9qz/onUGbuiKRahgs/IGWS2f5uCKksa202gXymJ5SVxbTHWOPO7vV4B+ea+usTnGlOfqWHxEiAHCMjLpo6fpOa9u6CW3CHF1K80Pkm5lqqByAo4r67X3pEdjPy2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789778809; c=relaxed/simple;
	bh=HeQwU2YYW2ammaacyTh52hjG4IGzTEGbQ0IVGSCt54A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M1sWQJ2v/wwwj+fvqSBE1BQ/CxH7hk9wmDr27awfvQGciQnmTLRm6O0U6d7CNtbTcUjHa62InvsWu3iV1M/T+T3kuMuQaoelsxqNr3umT0rn3XP/sDhIuI2l6FeWecVsa6sxbbzC/fVs+vHiDuGx18gysGpy7iS0HOX1shbsBmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSzNLoS2; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSzNLoS2"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b5b07ec78so966963a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789778803; x=1790383603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uyjZLL0sA6T5K+I6SLCzFZO+c82gRPna/G98UbpeCXU=;
        b=LSzNLoS2eCNxSfyyJZ56Eq+Zfi/AYKURigBiNiLp+GWv7PFSBkqXWLgi1dNwBgpUQi
         8mRjqef1zXCDmxUnWfY+c45LyFpZU/JmR2TCvQtIhiJSY+0cq9jzmatY/bhKkyvuifL3
         MExSzcvLoPAX1+uWxDtjWvD1SbB4AHEWZcUHAJQK9eM+1R8WYcHLhVbf1Z6LOucZn7LW
         ZU9oR9gqCSYVstCLGyBiom1cGmC4iGdxaN2pyh3G7j2bPfeg3d/oyBOi69TnKJ2UH/QH
         tLheUA7uk/vF4eeJr+JjR88sy5Oessa6jc/IfbSWS1laBb3yK3+HKIfFys44eLD2gDhW
         RvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789778803; x=1790383603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uyjZLL0sA6T5K+I6SLCzFZO+c82gRPna/G98UbpeCXU=;
        b=P6HLm3mW/TPVWk70LxSjtvxSVnnYpY2cOoIl3ZRA0me7vhqtnfQndJzxLKp56nNHyz
         ZKiVx+3M5M6muQUD658udnhLu9yxnkBXFImUGdzTAfpSajDarNXaC+sdPlT1gfq2xZ/t
         5bjYIMqzKlyY2TVLmgBCXnAsUDOANdxXH0nRyFVox6Zzc8a2z2sqvFWOU4qZQXDQF4I8
         RbuliwWrdmozbtk3Srcx36Q9XtG0toIn0akL+xMZR8St1Gen5/qfoNShXalL5voarJ38
         EAc7TROMdLmeo5t4J2ESFQiH81O3JO0kQyDHc3zrhRnkxXe+8ad1Ep4Xfqa8IEobhrL3
         nEUg==
X-Forwarded-Encrypted: i=1; AKwUvBz80+HX7fzwdtYiEbwqLiqAK0hqeAje1eyOIZguiRAimmWkIijgwzGLdwGXwqzln5Z8on55TdANGXOuzac=@vger.kernel.org
X-Gm-Message-State: AFuF++mJXcwDB1zZHE5Orwxqtc8xXRoi6tgdhadhq/M7rXux4ezmto3Z
	3aeKEcQp2zOplED+J8scXb/P0DRjLgMS+KmgtvyrdDfHDK/mbg0MFTw=
X-Gm-Gg: AYBFou2IK+unKrL375JcTY0m1TI+h5LRFg9k47v9HQgGevoanQ76hHHwYIX/QwCEhKO
	KZfdZl4FB1gY0y8lfccL3vKuQOjyYHbIaayafcUVAiQrQdix33k0yAmdb/KpeQKtUSpOr2sSD/0
	YfY+1xPsR2LBdaO7UP7PazpAI6JXOauK4q0/66fq4BvmthPqwaA2sj4naQWESAfbQN1anNoa73d
	+mc2xNmct/OcPVUkEIygJVIUR5U37yBbuKymP9BJNIGYR9uB2XsIbChiGYKX+gYmDKzim3Fj/J2
	WRzs+o9zrJFoT9NxwGB4SPihlLqP2yvcT9jT/k4thW8KdMsb3Dx9Pm1bti1Rsjw8Rj4l0Sc+npb
	dOY1RBaviTS/ViB5zW63MbfLX92CNBSpFCrniAK/KL1vZllUNAHvypJJJ3PEfYWBw0wuaxgGhSF
	8iKmRbjWW7NXtgt2QKsFzDpw74W/aunqnAxAD22slvq05KNH+wqYC/3YLcnVJIMiAI/8c3NXsM7
	4FtlnS9b1ucLCwrsL7/n/KPahYpCeKPyvrJ1Q==
X-Received: by 2002:a17:90b:37cb:b0:39e:6c6a:2090 with SMTP id 98e67ed59e1d1-39e6c6a229fmr1913904a91.49.1789778803484;
        Fri, 18 Sep 2026 17:46:43 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:45e5:9e39:6356:6164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c169dcdsm1927166a91.2.2026.09.18.17.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 17:46:43 -0700 (PDT)
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
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH v1 2/2] selftests/mm: add a test for UFFDIO_MOVE of a write-protected swap entry
Date: Sat, 19 Sep 2026 09:46:30 +0900
Message-ID: <20260919004630.1159895-3-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260919004630.1159895-1-donggeunyoo.kernel@gmail.com>
References: <20260919004630.1159895-1-donggeunyoo.kernel@gmail.com>
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

Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 61 ++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index ef9b3956bdcf..ae8b718f0a27 100644
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

