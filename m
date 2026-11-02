Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616116;
	b=s62of+WbRI+toBMuqwiaWypq+CeuU4OLubx+w+Ep/YJ0v5jcZG/rkpyNa/QSc8cggfas
	 +NJrp0YWC6A9829wIKp5j5DWFWUxYkwmZ3QJNliCu3L2+0F8PNO4lsAGczsl9s/VTfVlo
	 PYxcZ4uO5JxVUU1HkUdQ2G138Lw9yFIBwRyROde8nsvqXo8fWgA+Rp1iZ8Zr2d2VoGm0u
	 hh9J6QSNC7zuXaZSNb2yUHsroZQAuOXP+ml2srvSWCXP9H3XSAySChWNSYpKGRRNE4hk9
	 3w75tCIhdGAUGFu0xx0AWQ1Hv8eX64um2oX0pmgQjyIsk+S2yX4fOuBElzOp1x3ajLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OJg1Na+PMAE5RwVgjsfjwULctd8zKBeuPkayvvN7fUg=;
	b=NE4sKW3XawExsLlavXHj734HUxyRgU7vOvn/kI/2kEZfViO9ZnP/zud/Yah0SRfsR6wT
	 2AxnzG+04nE3+sZ9ntz2/CYrXH1kroBjAyPQYfcjveYc5UYIh1YMUmGNtJYCQvaWkwHCw
	 DQews0kgpK5cmcZHmYEOvXy5efePtLrKyL8KvRXhoKAmrEU34zrUu1nGqQWwhVwj9uh/b
	 ir1rG03kzn20Hwh7qgcya4Fvup6YAf54Ai/gpDYf19gpGpHj0d8O83LKDy6EgKaCiTfJd
	 8R67UevR73yL726WC8Hy+nZEaz3CCzVaVl00zCaeESz1V3P3R15MeeqY6jz4+PLm/ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xXxlfkdP;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0E5606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B0E5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xXxlfkdP
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e831e86ebfso16567465ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793616116; x=1794220916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJg1Na+PMAE5RwVgjsfjwULctd8zKBeuPkayvvN7fUg=;
        b=xXxlfkdPW21250q7PUPfcil8BeNIbEIshPoxXLywEd8TRjzx1liJ7/Hz9KCGpAulKp
         Dyk0yEGAHFjU3byqDEtn+VPd/OIRaeF3IOwmpSqWjFPuaOCjeOlwwdQXD6ptVoc9q6yw
         KTCE7U0PdC+Ng87qYy6SXn9sgJlF39YnJ2Cra8SWyf2awCjZUEk/7wAuOLxsbF973QVW
         jCBY7wSdvIa4/IViLo5T+6LDm9Ekl89YUdl+iUpB9iqNt/Mbh58EBQgHVcuzYtjkIWlm
         B75GsR+BwNFMvc6qU1tSEt42oFlj1ZdcWmhlhXQxbdF3MDQpjAzt5A7CM/wZnFus0NI9
         21bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616116; x=1794220916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJg1Na+PMAE5RwVgjsfjwULctd8zKBeuPkayvvN7fUg=;
        b=Ru5M5S3hf0jgw7/IjSdSRzIZj/+eGYo+sQd6Y74DYyxbJG/oukB3A0MJ+cjgSmrTqE
         YqBB0ikxEmFl6+Ba4hCtaupCyvlQ9SkRoXzqpKSPF0d2mc+a1jS20G3f2FIm4xZqbwUa
         uAhEW3wXKc2MheDrihwnuXFTqiri3PAR2xjJI+2Sj6a4Nmz99KnDHaMD21QQNhU3jfsP
         IZjLJPOmYdLCpi1C7hcZ8cdY4slg+nQVerbB0bNgNRITo1m8pgLm3cB07L6xNh7q0TtW
         G3t2lqVQR6A4mIiAsDOoyzq2d1SBAstyyrdDj2NMmPcVg9oyz7khO1YiQOKULk4WaKln
         TUTA==
X-Forwarded-Encrypted: i=1; AKwUvBwD6bpKKSZd/uSOBvGhXKglnZcGl+oIqFYX3yXoI5Cegj6p+N79GSwqUDZ/EDD3zE0LsHeCTOOVCz5df+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6+b2THRhCM76AYf+inU5/EZSGjVOU7UVb/rnnKGV37DfbJX/q
	zkLiu/10digm73FEHsNPUXGFHpKDwIAEfflO3+vI5T4PtQzzSsW2lHhg
X-Gm-Gg: AYBFou2pfqIHT4pxDfDgA0DHF9RVzmCoJN9J7HRScstcoi4PUW7ZsYSUAeiDtCrHEDW
	7RMBF2/B4alpr/sJXUq5wlnmT5V6KBKBSY187M63yu5xBq2hLmxHsTZVWdN+lQxHhhoFd/M/6l4
	fFA3Ofjr1fYxnE59C/LQHERxVFlG7HQtsA8WZgWo+SaQrwZ4aGkQ1buWKGS1WLth/rqWXVBTvbC
	aP8tkM8ka7GwsAfldgw0/rcFmeRTnr1/TYSD9Dc+E2tBYtVo/81IaitOBsN7mQWiD+fEJB5OFTS
	3FQvx7Ou9RhrA8I/6OSzDtKxYOTs0wQNidyTxZoI6zvJkgy19WOV/ngi7BrrkV+M3qsOVhmjHtZ
	0dSthYUva2/vI46NqYkjZ8+ApcD6W0rKc2UQ7dbtG7mZysxXeaP+VdYSDhZ/gZ8RitVOwUkpJlU
	PJWccIfThXP1fVysHs26aGsBKsF/lHJ3Nz5eyPA18a2SUAZlFcZwZqlClrFJI5wR8BWDJty/ZgG
	coOSA3I1PgzB3Qll2HlE4FTYfwAATjNHYycnyoJmzO6RqOcZac9uEMw0/qGu0dznp5fP5msayWi
	ETCTckq4VM38AeLrVApFOKVWmzmcZskUHv3EEPv2AdmCAFKzsFMj
X-Received: by 2002:a17:902:f691:b0:2df:8b09:93bb with SMTP id d9443c01a7336-2eb3648b69fmr89524235ad.10.1793616115753;
        Mon, 02 Nov 2026 02:41:55 -0800 (PST)
Received: from umang-Inspiron-3501 ([2401:4900:1f3a:7c59:eeec:de7d:b077:9b9f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3925ff38sm25195465ad.36.2026.11.02.02.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:41:54 -0800 (PST)
From: Umang Pokhriyal <umangpokhriyall@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Umang Pokhriyal <umangpokhriyall@gmail.com>
Subject: [PATCH 2/2] selftests/mm: test a uffd write-protect range with an unregistered page
Date: Mon,  2 Nov 2026 16:06:21 +0530
Message-ID: <20261102103621.156928-3-umangpokhriyall@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102103621.156928-1-umangpokhriyall@gmail.com>
References: <20261102103621.156928-1-umangpokhriyall@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register only the first of two pages and check that UFFDIO_WRITEPROTECT
over both pages fails with ENOENT without changing the first page, when
protecting and when unprotecting.

Signed-off-by: Umang Pokhriyal <umangpokhriyall@gmail.com>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 56 ++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index 298609544..57e442fd2 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -375,6 +375,56 @@ static void uffd_wp_unpopulated_test(uffd_global_test_opts_t *gopts, uffd_test_a
 	uffd_test_pass();
 }
 
+/*
+ * UFFDIO_WRITEPROTECT over a range whose second page is not registered must
+ * fail without changing the first page, in both directions.
+ */
+static void uffd_wp_partial_range_test(uffd_global_test_opts_t *gopts,
+				       uffd_test_args_t *args)
+{
+	struct uffdio_writeprotect prms = {
+		.range.start = (uint64_t)gopts->area_dst,
+		.range.len = 2 * gopts->page_size,
+	};
+	uint64_t value;
+	int pagemap_fd;
+
+	/* Only the first page is registered; the second is a separate VMA */
+	if (uffd_register(gopts->uffd, gopts->area_dst, gopts->page_size,
+			  false, true, false))
+		err("register failed");
+
+	pagemap_fd = pagemap_open();
+	*gopts->area_dst = 1;
+
+	prms.mode = UFFDIO_WRITEPROTECT_MODE_WP;
+	if (!ioctl(gopts->uffd, UFFDIO_WRITEPROTECT, &prms) || errno != ENOENT) {
+		uffd_test_fail("protect over an unregistered page did not fail with ENOENT");
+		goto out;
+	}
+	value = pagemap_get_entry(pagemap_fd, gopts->area_dst);
+	if (value & PM_UFFD_WP) {
+		uffd_test_fail("failed protect changed the first page");
+		goto out;
+	}
+
+	wp_range(gopts->uffd, (uint64_t)gopts->area_dst, gopts->page_size, true);
+	prms.mode = 0;
+	if (!ioctl(gopts->uffd, UFFDIO_WRITEPROTECT, &prms) || errno != ENOENT) {
+		uffd_test_fail("unprotect over an unregistered page did not fail with ENOENT");
+		goto out;
+	}
+	value = pagemap_get_entry(pagemap_fd, gopts->area_dst);
+	if (!(value & PM_UFFD_WP)) {
+		uffd_test_fail("failed unprotect changed the first page");
+		goto out;
+	}
+
+	uffd_test_pass();
+out:
+	close(pagemap_fd);
+}
+
 static void uffd_wp_fork_test_common(uffd_global_test_opts_t *gopts, uffd_test_args_t *args,
 				     bool with_event)
 {
@@ -2403,6 +2453,12 @@ uffd_test_case_t uffd_tests[] = {
 		.uffd_feature_required =
 		UFFD_FEATURE_PAGEFAULT_FLAG_WP | UFFD_FEATURE_WP_UNPOPULATED,
 	},
+	{
+		.name = "wp-partial-range",
+		.uffd_fn = uffd_wp_partial_range_test,
+		.mem_targets = MEM_ANON,
+		.uffd_feature_required = UFFD_FEATURE_PAGEFAULT_FLAG_WP,
+	},
 	{
 		.name = "minor",
 		.uffd_fn = uffd_minor_test,
-- 
2.53.0

