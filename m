Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871391;
	b=1avTobBWSpwDiAaVFB378kTMB0nevJdJscfe6OuJ6TqfYrVWwaUqRUn0H7vB7kvApN7H
	 g9o2NYIKKSkPfOlHTkZxEB0JVGY/ysBXXo4TlsCrqxoQ38Lu6LzSEwaCa9hqoBfI8eZ9j
	 jTdnlyVuFaeo5jz++N1L5nM5YcqBmLBc8OWGueFKF3VN4lruSjVL98ZCy78crhmco8N+b
	 IPErWxFhaT6rW8sY+FAcE+3MR2IjuTDnaBzDPoa4EdXa3nhyMSTscIDocYJwEMlzJtTSC
	 PLms5wk83zH77H7j3k3Vlp7tiJtTkGkj+FrcG70QbE7digR2tVimE37qGfhedqbzWEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=t7tMtv9nbHUIAtxv3eTEVgmJcIdaFB9h8nrHOfA0Uqg=;
	b=44FGIuu9uaWwpAVS1dLNyyyreRfO2Sl6SoFZqIn3RYFk2Ylu0p2Val2hhtWM9tXcioxf
	 6zg3P00GhwOxIfYHTS4uC0x/kF3wcIqXz1yv05+pU/ragYUbC3RIwlBLAlWLeGiujn9sa
	 mqvGEJxtV8ee4mfMRQ2bs1WpaMSRSshygZ9uUDT9AYppoQ5vHkalLJeNP2YWo7CRtF3CT
	 43mHjf4N7eW5bZeufnhJti5eIpOxuywR9siSSIc7VLt0wckIcPZj/xOWoMsW1thDjIozl
	 3U0zs+dFSZGyE6fe3U6JBcdJwUdq4Me/izxYnPoHwnk9Ubhpgy087vhb9aIBmeg//fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Nv/Hec1t";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A09606A339
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00A09606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nv/Hec1t
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-353804b591eso3192820eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793871390; x=1794476190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t7tMtv9nbHUIAtxv3eTEVgmJcIdaFB9h8nrHOfA0Uqg=;
        b=Nv/Hec1tBbrs+gQGPwId1zOfhmpR73x9S1gapAOwp3H4td0/knMPSD1yx/Hbo9+n2Q
         R44ItVEPb0CCQO75+YzxIKTAoBMsSQQmDtlcqHYxgnOitP+Z0yu35jUFfYG99E8mJfaI
         w5FVh7e7tyILA4pu+Pve5OIWV+X7iV/mznao+HwyQN0m+VsmtmL4phU9Es82zLm2vcyT
         0s302RvFPaa79xOpW5+KyhCSmBPmZffS9sSdGknkA5hO4X18o5yuaLmQPEXvbadO75Pl
         chD+vfDJjLRHopkfxCYP3wcVuW2IWEwJMB+YJGEWt+CDYtzlvl36qqh5KWqk+hGULFHH
         1TSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871390; x=1794476190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7tMtv9nbHUIAtxv3eTEVgmJcIdaFB9h8nrHOfA0Uqg=;
        b=ato/G81KqbksiJCRyvFKwA+vpNf1Fiv5k1KugxbtjN9+YQoSX88raN1kqyWGEjEXi1
         aYhsK4xU4JYQH/U/erZTPxgbRFYWX06nSz0XvKWKXUyNEbL/SIpogHXW0A4iZKqR53DC
         hnV5ZsrfDBxHXpNnLTRB6sW5cPc8rAVDVX4V3gQ9nK6qTLvxF9jSJ3EE/2C01SXDXb71
         I9PX3JC53vLU1AjlztXg/UgKyGlxsZpg6lGwqf8x8AQ02vy/MRXhnUFgRiKixp+WekVk
         9v6TEhnthQSfRUwZfLuT0qyQ72eKCu59uWdnnqHJh2QLtq9SXPNWDTyEF1ijC9SeFfL2
         ybLg==
X-Forwarded-Encrypted: i=1; AKwUvBwKjgSQlcjuP7YD/JNXHk+ctnCuSVnmliTctASNB2EccNrybSDKk60BCf32tfm6aXu9rnEigKfK81MTKEs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lvbXJgdk0e+Ui8Gt8M6UjGM3j47S4u1DSATw1wInzTpjQEeru
	lcSrP6fesjDXXitbTSh1ixIucOOW5pS1pZXNMVLtVNqrnbTLUESxQMVq
X-Gm-Gg: AYBFou2WPm7iCWTZc4hWmAtEBOCMxKxSasr6pVmu1nI20+rN5SN381jmPPtrv+GNovW
	auRJduTjPy9L1Oui3yEdxrqVSwIV6jo5b7cHmb9X/8q01JrX7p9Bx66a0VSfacKOGPR2FY/gPbY
	7oBaQ1O3Qfa0uTB91kzSCeAyQwZ+1/HSEMp8NNykYT87If/Jp9XoAVWy6PLKba8dCPWNGIaro85
	ECypjCFiJo9V1EmX9yrgE4CP9zh2LrDBu+5r7QlVfqIBxGINYu5ekKPZJ2z1I/HIliMO626lRfq
	TqKnJXYduVmSWO9SWPlJx5UZxLhmzam0gEanfBo7khV+rmi7XheE9p5BfYwDiIanlKsWIxH6net
	tzBa8eZ9e+AMv3pyJ7cFXrJy4IGoEuI6UF95RgkUW6N3sQA2PaDGz69qd+wtL3E5cowIXg6bKyX
	pLMfPO4Sy8KqI1LWtAyVDYDGQk78t759b8F+gAT+iJUfYFkb3xGlOgGCGywG9SnPj9tgQWmN3Em
	/sHnLfYJBZv3hBkP7R4FDhiQvND7eEqfy5uAbJGb23Fpvc6fGfycYzC5qP/70luMRbeCAcdVPGQ
	1TT142p2189D2r2fLyHI3Xie
X-Received: by 2002:a05:693c:8817:10b0:36a:1788:3d1c with SMTP id 5a478bee46e88-36a423fd04dmr28133229eec.34.1793871389924;
        Thu, 05 Nov 2026 01:36:29 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fa273sm17363207eec.16.2026.11.05.01.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:36:29 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 05 Nov 2026 04:36:15 -0500
Subject: [PATCH v2 2/2] selftests/mm: cover merging KSM pages aged by smart
 scan
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-bug-mm-ksm-smart-scan-align-skips-v2-2-8a9780b6844e@gmail.com>
References: <20261105-bug-mm-ksm-smart-scan-align-skips-v2-0-8a9780b6844e@gmail.com>
In-Reply-To: <20261105-bug-mm-ksm-smart-scan-align-skips-v2-0-8a9780b6844e@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

ksm_functional_tests checks merging and unmerging with ksmd's default
settings, but nothing there exercises smart scan, which skips pages KSM
has failed to merge for a while.

Smart scan used to time those skips per page, so two identical pages
that became mergeable some scans apart could end up never being looked
at in the same scan, and were never merged. "mm/ksm: align smart scan
skips with the scan number" fixed that.

Add a case that lets sixteen unique pages age for a dozen scans, then
makes a duplicate of each mergeable one scan apart, and expects every
pair to be merged 32 scans later:

  kernel               failures, two boots
  before the fix       20/20, 20/20
  with the fix          0/20,  0/20

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/mm/ksm_functional_tests.c | 108 +++++++++++++++++++++-
 1 file changed, 107 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c b/tools/testing/selftests/mm/ksm_functional_tests.c
index 31c06c72203fd..71d9b3cbdb8c1 100644
--- a/tools/testing/selftests/mm/ksm_functional_tests.c
+++ b/tools/testing/selftests/mm/ksm_functional_tests.c
@@ -695,6 +695,111 @@ static void test_fork_ksm_merging_page_count(void)
 	munmap(map, size);
 }
 
+static int ksm_wait_full_scans(long nr)
+{
+	long start, cur;
+
+	start = ksm_get_full_scans();
+	if (start < 0)
+		return start;
+	do {
+		cur = ksm_get_full_scans();
+		if (cur < 0)
+			return cur;
+	} while (cur < start + nr);
+
+	return 0;
+}
+
+static void test_merge_aged_pairs(void)
+{
+	const unsigned int pairs = 16;
+	const unsigned long size = 2 * pairs * pagesize;
+	char *map, old_smart_scan = '1';
+	int smart_scan_fd;
+	unsigned int i;
+
+	ksft_print_msg("[RUN] %s\n", __func__);
+
+	smart_scan_fd = open("/sys/kernel/mm/ksm/smart_scan", O_RDWR);
+	if (smart_scan_fd < 0) {
+		ksft_test_result_skip("smart_scan not supported\n");
+		return;
+	}
+	if (pread(smart_scan_fd, &old_smart_scan, 1, 0) != 1 ||
+	    pwrite(smart_scan_fd, "1", 1, 0) != 1) {
+		ksft_test_result_fail("Enabling smart_scan failed\n");
+		goto close_fd;
+	}
+
+	if (ksm_stop() < 0) {
+		ksft_test_result_fail("Disabling (unmerging) KSM failed\n");
+		goto restore;
+	}
+
+	map = mmap(NULL, size, PROT_READ | PROT_WRITE,
+		   MAP_PRIVATE | MAP_ANON, -1, 0);
+	if (map == MAP_FAILED) {
+		ksft_test_result_fail("mmap() failed\n");
+		goto restore;
+	}
+	if (madvise(map, size, MADV_NOHUGEPAGE) && errno != EINVAL) {
+		ksft_test_result_fail("MADV_NOHUGEPAGE failed\n");
+		goto unmap;
+	}
+
+	/*
+	 * Page i of the first half and page i of the second half form a
+	 * pair with content no other page shares.
+	 */
+	for (i = 0; i < pairs; i++) {
+		memset(map + i * pagesize, i + 1, pagesize);
+		memset(map + (pairs + i) * pagesize, i + 1, pagesize);
+	}
+
+	/* Let the first page of each pair age without a duplicate. */
+	if (madvise(map, size / 2, MADV_MERGEABLE)) {
+		ksft_test_result_fail("MADV_MERGEABLE failed\n");
+		goto unmap;
+	}
+	if (ksm_start() < 0 || ksm_wait_full_scans(12) < 0) {
+		ksft_test_result_fail("Running KSM failed\n");
+		goto unmap;
+	}
+
+	/*
+	 * Make the duplicates mergeable one scan apart so that each pair
+	 * starts out with a different distance in scans.
+	 */
+	for (i = 0; i < pairs; i++) {
+		if (madvise(map + (pairs + i) * pagesize, pagesize,
+			    MADV_MERGEABLE)) {
+			ksft_test_result_fail("MADV_MERGEABLE failed\n");
+			goto unmap;
+		}
+		if (ksm_wait_full_scans(1) < 0) {
+			ksft_test_result_fail("Running KSM failed\n");
+			goto unmap;
+		}
+	}
+
+	if (ksm_wait_full_scans(32) < 0) {
+		ksft_test_result_fail("Running KSM failed\n");
+		goto unmap;
+	}
+
+	ksft_test_result(ksm_get_self_merging_pages() == 2 * pairs,
+			 "Pages aged by smart scan got merged\n");
+unmap:
+	ksm_stop();
+	munmap(map, size);
+restore:
+	if (pwrite(smart_scan_fd, &old_smart_scan, 1, 0) != 1)
+		ksft_print_msg("Restoring smart_scan failed\n");
+close_fd:
+	close(smart_scan_fd);
+}
+
 static void init_global_file_handles(void)
 {
 	mem_fd = open("/proc/self/mem", O_RDWR);
@@ -720,7 +825,7 @@ static void init_global_file_handles(void)
 
 int main(int argc, char **argv)
 {
-	unsigned int tests = 9;
+	unsigned int tests = 10;
 	int err;
 
 	if (argc > 1 && !strcmp(argv[1], FORK_EXEC_CHILD_PRG_NAME)) {
@@ -753,6 +858,7 @@ int main(int argc, char **argv)
 	test_prctl_fork_exec();
 	test_prctl_unmerge();
 	test_fork_ksm_merging_page_count();
+	test_merge_aged_pairs();
 
 	err = ksft_get_fail_cnt();
 	if (err)

-- 
2.43.0

