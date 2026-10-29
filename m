Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311903;
	b=IeLtfjr4MxD5g15W+4sjtmKFJEppkGoQG6qgjFFJYNVJyD+zSBQ4x5U5bzwfaTlDHRF5
	 P4WWtqTW6mi3uPOQjeCWn9JzOIODUboLI9E7dpQiuc6Jc/3PyWLqDbsisOLBUwJ5riyir
	 kQx3CbVBVexPURy8v05H3khEUAL7+Aug1JcYPWPB6SiBT6bd7evAvlpwMz5CfgGUDrT8n
	 5l4iMhSV3tYrKw2ry38ZMQYs2ynHtIROmFAYiPV5yCKLzFI0MErN9+LQgJRf7aFxnDzfw
	 VfwaiWjIdsE4hd/59nJ5r/K58Ynmn4xQAECYDtV0GUwdvOrWSt9QtC2mrAwtdaSqxug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ItLu3zI4jj0VkRO3F8vNU1JfE+9qdeT+xzrqd6vWApU=;
	b=BOtdKyDnx8K1VZZ0s/TYzBigV9osDVUKPmb1fFNEMfcnyHGcidr42GfetrmkFZQZJZtq
	 j1o2d2lFcY8HG+LsdM3Xz9vz1fMZXMcG38GWCbmJYcnhy+h1b4an4FPdyqair58A4U4ml
	 FnGH+1ZctovdMDeAlQ5og7vFi2JyEw9NXCBgHeigLCYQKgzRqxlmBDvl/GShb0n4KrPgD
	 kPbbYBHMSfvFYPeVW2plSYHf9Sq39Sds+MFMlPZSKQT5OMQkijknhYQBrGJFm6RtSPGgY
	 1YDJn+F8lFjazhYPpaynu6O9VoFxVDGKKYK1yiBYkvKEZyA58ujxmCSGCWeOwjoGZNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Po27IPM8;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED92606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ED92606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Po27IPM8
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so217535e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793311901; x=1793916701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ItLu3zI4jj0VkRO3F8vNU1JfE+9qdeT+xzrqd6vWApU=;
        b=Po27IPM8ae5DI9c2BMy860P6VUqQXfN7mzaM4V18jJfF7UgZosgdaJOsGP68429PZM
         ja/PD64vFtplj6hRsecSFWucascqMcpNkVK3XNZtqDJGNmUX85zFkWz3Cdh7CYi2r2rK
         mhDM83LR71kOP+NMJaDzO2Cm8OLEfmrEvUry8KG8H/+9tnpUyCx0FA8UaT5Iz9VEJwko
         u+MhB24FYHMO5pFpgLtVVm+9Up2/M43a9h/geTBUOdhnGYlBXCM1XP2XYrgNpUUhTnP1
         9NGd+6EKGq5cE6wlsvkmiqbJlzBNQWBllyailUP/1bg0XUp0hVkAvw787nIUCrwG4Kvs
         cQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311901; x=1793916701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ItLu3zI4jj0VkRO3F8vNU1JfE+9qdeT+xzrqd6vWApU=;
        b=aQreb2DTkJu5A7atpjrII67rBm+N6t0RbXcGv6//JbdtHb/ncihowFrTMbQRC5lfpA
         VoqT2k/NJLYrleHMTkYnFkQ2hQMgC967CpmOLI9IsSvvSLl8N2EKsm8i838Wnsza8vp1
         ydD2uFf4PlpN/v7m139LHtAUlPotrW+hpaHy6bDuBL2gx0bKXdsJFrD3Vp9ulNxcw5nY
         xcrdn3klZGEn6E5siBZ8N5pQW5O8VZptZN6ebyMRS8gKGgGRXmYMjC/GCj77auMK+Deu
         0+5fbYR+c3KG7umKbh8ee6rjOXr5CqweTDP7rpe+EnYxQoglHua92wcy2Wna2yZ2eMF+
         Mu3w==
X-Forwarded-Encrypted: i=1; AKwUvBxwDpsL46+4MNIJfRbCPSspZN7LCHCXZL8et7j+fKIBebmO1oZyCcICL1+WPtsVsPHwSk4gGBLSie//r10=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtuirgnNxR7I4JK4JWt8zferwtCdJWCDgWjTo4WV0D77KD41LP
	E7ll0sGFGISlKn0lj17XiOrJi+U77nWuL8oD5dcvRgtzcnjluTjCIr9O
X-Gm-Gg: AYBFou2cihw2YpealopNAxTVpfkq9FR6pgLvBEmwH+7gCxh0ZGJRp8OCQxG32GoBaLu
	0hWpb7Lcm83YGwhsS3mIXY23bBmZqZI7u7W0u06Bj1ATtdNA6BjwPlYYSbzGqIP2ptz6hfb2AM1
	HMIu+5T/cqtt9CBplpHVTeBscX133otjCAlhrXWcNcJy1qy8ZenNNKV7lKrsdf31FtLx7TcN2Mg
	7eT23eCBxeec6sZD4/a3xPcHzVEO1qrw0r9ihumJS6g3za7CFVwS0lwmcKvTRLCJp+7FzrHdzd4
	1wVxPZuD6dItfi53K1e1tchYgvqo3CcbAOe1UrrUlogwNdBDkPrlk5T+hs0u8EoykEfHjgsN/gY
	rbAaJElZkncZ0m5R6crwsPUJXW56r2cez78cVqNpAHaZAXKiWFAfkzOh6WnW69QhoJrKsbxzeam
	Ni17Y63FoXcFLhbZOoIKequ/7utMENTS9OJSyz7xtPtd0D09gcrpVN+DtpOnqkV+/s74oLgalan
	ohMcCg+IEAygQlzN2Rxxggbui/RWSVSrCQNfzBBqfnpRkjvulwv6p0x2/QF8gv5GgFChCEuijzA
	tsRSiivZ8tm3lA==
X-Received: by 2002:a05:600c:468c:b0:4a3:59c9:a750 with SMTP id 5b1f17b1804b1-4ac17d168bcmr7131775e9.9.1793311901449;
        Thu, 29 Oct 2026 15:11:41 -0700 (PDT)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm104011305e9.10.2026.10.29.15.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:11:41 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Peter Xu <peterx@redhat.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH 2/2] selftests/mm: add a uffd test for re-registering during UFFDIO_COPY
Date: Thu, 29 Oct 2026 23:11:02 +0100
Message-ID: <20261029221129.89068-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029221129.89068-1-azpijr@gmail.com>
References: <20261029221129.89068-1-azpijr@gmail.com>
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

Re-register the destination without WP while a UFFDIO_COPY_MODE_WP copy
waits for its source page, then check that the copy fails with -EINVAL
and leaves no uffd-wp bit behind. This covers both the hugetlb and the
non-hugetlb UFFDIO_COPY retry.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 105 +++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index 2a97ba1d6feb..8a7efaa7b3ac 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -375,6 +375,104 @@ static void uffd_wp_unpopulated_test(uffd_global_test_opts_t *gopts, uffd_test_a
 	uffd_test_pass();
 }
 
+struct wp_copy_args {
+	uffd_global_test_opts_t *gopts;
+	char *src;
+	__s64 copy;
+};
+
+static void *wp_copy_thread(void *data)
+{
+	struct wp_copy_args *args = data;
+	struct uffdio_copy copy = {
+		.dst = (unsigned long)args->gopts->area_dst,
+		.src = (unsigned long)args->src,
+		.len = args->gopts->page_size,
+		.mode = UFFDIO_COPY_MODE_WP,
+	};
+
+	ioctl(args->gopts->uffd, UFFDIO_COPY, &copy);
+	args->copy = copy.copy;
+
+	return NULL;
+}
+
+/*
+ * UFFDIO_COPY drops its locks to fault in the source page.  Re-register the
+ * destination without WP while it waits there: the MODE_WP copy must then
+ * fail instead of leaving a uffd-wp bit in a VMA that no longer has WP.
+ */
+static void uffd_wp_copy_reregister_test(uffd_global_test_opts_t *gopts,
+					 uffd_test_args_t *args)
+{
+	struct uffdio_api api = { .api = UFFD_API };
+	struct wp_copy_args copy_args = { .gopts = gopts };
+	unsigned long len = gopts->page_size;
+	struct uffdio_zeropage zeropage;
+	struct uffd_msg msg;
+	struct pollfd pfd;
+	pthread_t thread;
+	uint64_t value;
+	int pagemap_fd;
+	int src_uffd;
+
+	/* The source fault comes from the kernel, so no UFFD_USER_MODE_ONLY */
+	src_uffd = uffd_open(O_CLOEXEC);
+	if (src_uffd < 0) {
+		uffd_test_skip("cannot open a kernel-mode userfaultfd");
+		return;
+	}
+	if (ioctl(src_uffd, UFFDIO_API, &api))
+		err("UFFDIO_API failed");
+
+	copy_args.src = mmap(NULL, len, PROT_READ | PROT_WRITE,
+			     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (copy_args.src == MAP_FAILED)
+		err("mmap() failed");
+
+	if (uffd_register(src_uffd, copy_args.src, len, true, false, false))
+		err("register src failed");
+	if (uffd_register(gopts->uffd, gopts->area_dst, len, true, true, false))
+		err("register dst failed");
+
+	if (pthread_create(&thread, NULL, wp_copy_thread, &copy_args))
+		err("pthread_create() failed");
+
+	/* Wait until UFFDIO_COPY blocks on the source page */
+	pfd = (struct pollfd){ .fd = src_uffd, .events = POLLIN };
+	if (poll(&pfd, 1, 10000) != 1)
+		err("no fault on the source page");
+	if (read(src_uffd, &msg, sizeof(msg)) != sizeof(msg))
+		err("read() failed");
+
+	if (uffd_unregister(gopts->uffd, gopts->area_dst, len))
+		err("unregister dst failed");
+	if (uffd_register(gopts->uffd, gopts->area_dst, len, true, false, false))
+		err("re-register dst failed");
+
+	zeropage.range.start = (unsigned long)copy_args.src;
+	zeropage.range.len = len;
+	zeropage.mode = 0;
+	if (ioctl(src_uffd, UFFDIO_ZEROPAGE, &zeropage))
+		err("UFFDIO_ZEROPAGE failed");
+
+	if (pthread_join(thread, NULL))
+		err("pthread_join() failed");
+
+	if (copy_args.copy != -EINVAL)
+		err("UFFDIO_COPY returned %lld, expected %d",
+		    (long long)copy_args.copy, -EINVAL);
+
+	pagemap_fd = pagemap_open();
+	value = pagemap_get_entry(pagemap_fd, gopts->area_dst);
+	pagemap_check_wp(value, false);
+	close(pagemap_fd);
+
+	munmap(copy_args.src, len);
+	close(src_uffd);
+	uffd_test_pass();
+}
+
 static void uffd_wp_fork_test_common(uffd_global_test_opts_t *gopts, uffd_test_args_t *args,
 				     bool with_event)
 {
@@ -2403,6 +2501,13 @@ uffd_test_case_t uffd_tests[] = {
 		.uffd_feature_required =
 		UFFD_FEATURE_PAGEFAULT_FLAG_WP | UFFD_FEATURE_WP_UNPOPULATED,
 	},
+	{
+		.name = "wp-copy-reregister",
+		.uffd_fn = uffd_wp_copy_reregister_test,
+		.mem_targets = MEM_ALL,
+		.uffd_feature_required = UFFD_FEATURE_PAGEFAULT_FLAG_WP |
+		UFFD_FEATURE_WP_HUGETLBFS_SHMEM,
+	},
 	{
 		.name = "minor",
 		.uffd_fn = uffd_minor_test,
-- 
2.55.0

