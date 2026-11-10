Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794288818;
	b=QnXiPzvdvDScIlpFZhqk2O1l4TVXSI70EwHGabl9aXNfD/sHzITC7iemtBoRi8jV3XWt
	 kaPsbiqcY6rLYatYeiqme3iRKzih+ASIwt31nnLQmGZneD9I2sFJiRY17Lz9M8FoetNB7
	 4AgixWf3PYdS3GqC3tOgPQhlnRYLIdsiG8VRdjIV7nWRnf1vJcCyfMa47PdlQiFoCZUpC
	 yz701wW0TJRz7CQBpRFjjzrkdvmu6NmeA25R6aUV5aclzjMUOuMgIzKNgXaUoxHo4erTK
	 B+ro4wfPqCmTrlSQYyw8l76adYSMhKGokweoycJcNu/cVH6ZeF+hzNeKyIP7xD06wNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pAYYED9s6VIKDZjcRjIjaZCDlTGf5Clzal9D/XmtANw=;
	b=FETGEhcR7XkXIr0uHWhWs6nosTVQmPUQ0l2ElNWQXt7DACfClGWPMHmY3vykTn79xYjS
	 pUdIAnnmaPuGL1diEMQ0eRhYVw6GoXV2F/e0V4Wh7wlG3FoZiqI3PYIe3LoATWVRtro6j
	 8rH0x0pZ7R1VquBi+VkRtC3h7ysNqUUnKhprUB8aNypLTBRFwf6okrfMw4BrhJpn3XCGq
	 P6LH3wbFgi7PnogyZwB2IC0Jv/fE4xjEnyedxcUnlr8q4OzSDQRtUHjN6+EjFUw/i6jY1
	 yWFQ3xDWB6K+b7J9lPiJ1nJSUbVuTzQg/opgb19Ay7slxUJGSyDdxaHRN5NpBfjgCEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="TGc/Pb7V";
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1150660A3806
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1150660A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TGc/Pb7V
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdba239d0easo1733363a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794288817; x=1794893617; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pAYYED9s6VIKDZjcRjIjaZCDlTGf5Clzal9D/XmtANw=;
        b=TGc/Pb7VaNBJ6DUMSe0w5EQvWU37wQWOAFL+XulYM5rzzDkr8iaFrZizdADi7iLE+9
         lQg3UTdS3wTgqXe92p+IaW/QGj3H/uv6SbHz+fX1bTKKAZzLJcXOTT2WZ4edWHINLN0l
         vBcg1jfVD5vbsRjsoGsGzOkRoamtBwREww3gUHTjbx8LvupsxLLoeSSyW/EGMESsylog
         UHfxcK6DI5vhZFvc1+LbBdPblqAjteSO+kUvRB+ina0r1kO+JVwn2R8wwOpuod0SClCy
         AXSQ/C6bsoQKkxu9LItVHYaQGPqVgUM7mzlw8Ze/t7RITSlmHgDnxJop/S5gLWk5RNoy
         x5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794288817; x=1794893617;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAYYED9s6VIKDZjcRjIjaZCDlTGf5Clzal9D/XmtANw=;
        b=fk4r8X6OzYA5/6QgFzjk2o5vQEHLKs5po0JVBAab0/RvEc7RV3zNVG1B9etkswHJWo
         wf8O+voRP/xwdyTh9/hkIeSgvC3ekhZsKTKdlJXd0tYbMTIB0Pue4r3kbrMyhmIc37TK
         8gAYZNyyCbzepjL5K0a6/ipuT5zFr2mTfV2L/nk5LQYSFzGL0q1CI4M5f66zUMIu/VzI
         IwNJ8G1y1IDDeMwMwIKQP0zs9R16eC0uE6ls+eXWiBkldu/FjHYb73XHV10wTvCPRghI
         sMqxlxjZ20NPa9Rl+PKAVUeDgPoHbg/Y1fM5C6FigJlYQhHTWc/17yaiMm4/9v6x55n5
         rH8g==
X-Forwarded-Encrypted: i=1; AL+hErGdDeoBw5NX6whBlbgCrtwE3AcYjzuwEer9U2oDe0JrnkaSq71T8LuNaEHE78G7LWGXdzdPQocl066HSrM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fn2nJtUCiW7KYVoQTJWjYUs6/JMTmOSCV/hnVINuF8XBzsDOZ
	PIyYvwgkGOd7eXaBupLElSVRVoVWq62gspe8oERKqcEhh8kqfuBJfZSE217uhZu3IFGHZ//ueL9
	Yn89k7ktaX1OP1g==
X-Received: from pgfd22-n2.prod.google.com ([2002:a05:6a02:6556:20b0:cc9:f7f0:57fc])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7907:b0:3e1:bcb:1d19 with SMTP id adf61e73a8af0-3f1901885e4mr1393542637.67.1794288817251;
 Mon, 09 Nov 2026 21:33:37 -0800 (PST)
Date: Tue, 10 Nov 2026 05:33:31 +0000
In-Reply-To: <20261110053331.2708996-1-jiaqiyan@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110053331.2708996-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261110053331.2708996-4-jiaqiyan@google.com>
Subject: [PATCH v7 3/3] selftests/mm: add hard memory failure anonymous
 HugeTLB test
From: Jiaqi Yan <jiaqiyan@google.com>
To: linmiaohe@huawei.com, vbabka@kernel.org
Cc: osalvador@kernel.org, ljs@kernel.org, ziy@nvidia.com, harry.yoo@oracle.com, 
	willy@infradead.org, osalvador@suse.de, jackmanb@google.com, 
	hannes@cmpxchg.org, nao.horiguchi@gmail.com, david@kernel.org, 
	william.roche@oracle.com, tony.luck@intel.com, wangkefeng.wang@huawei.com, 
	jane.chu@oracle.com, akpm@linux-foundation.org, muchun.song@linux.dev, 
	liam@infradead.org, rientjes@google.com, duenwen@google.com, 
	jthoughton@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	vbabka@suse.cz, rppt@kernel.org, shuah@kernel.org, surenb@google.com, 
	mhocko@suse.com, boudewijn@delta-utec.com, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a new testcase to validate memory failure recovery for HWPoison
anonymous HugeTLB page, including proper SIGBUS delivery, releasing
a HugeTLB page containing one HWPoison page to buddy allocator, and
isolation of the raw HWPoison page.

The test uses HugeTLB's default hugesize.

Although can be added in future, this patch does not support testing
the MADV_SOFT variant.

Acked-by: Miaohe Lin <linmiaohe@huawei.com>
Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 tools/testing/selftests/mm/memory-failure.c | 67 ++++++++++++++++++++-
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/memory-failure.c b/tools/testing/selftests/mm/memory-failure.c
index 135a2e8069ba..89fe137ea0e6 100644
--- a/tools/testing/selftests/mm/memory-failure.c
+++ b/tools/testing/selftests/mm/memory-failure.c
@@ -27,6 +27,7 @@ enum inject_type {
 
 enum result_type {
 	MADV_HARD_ANON,
+	MADV_HARD_ANON_HUGETLB,
 	MADV_HARD_CLEAN_PAGECACHE,
 	MADV_HARD_DIRTY_PAGECACHE,
 	MADV_HARD_CLEAN_SHMEM,
@@ -44,6 +45,10 @@ static siginfo_t siginfo;
 const char *pagemap_proc = "/proc/self/pagemap";
 const char *kpageflags_proc = "/proc/kpageflags";
 
+/* HugeTLB settings will be automatically restored when test exits. */
+#define NR_ALLOC_HUGETLB_PAGES 4
+HUGETLB_SETUP_DEFAULT_PAGES(NR_ALLOC_HUGETLB_PAGES)
+
 FIXTURE(memory_failure)
 {
 	unsigned long page_size;
@@ -52,6 +57,8 @@ FIXTURE(memory_failure)
 	int pagemap_fd;
 	int kpageflags_fd;
 	bool injection_attempted;
+	/* Number of initial HugeTLB pages with default hugepagesize. */
+	unsigned long nr_hugetlb_pages;
 };
 
 FIXTURE_VARIANT(memory_failure)
@@ -155,6 +162,7 @@ static void check(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failure
 		  void *vaddr, enum result_type type, int setjmp)
 {
 	unsigned long size;
+	unsigned long nr_hugetlb_pages;
 	uint64_t pfn_flags;
 
 	switch (type) {
@@ -175,6 +183,7 @@ static void check(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failure
 		ASSERT_NE(pagemap_get_pfn(self->pagemap_fd, vaddr), self->pfn);
 		break;
 	case MADV_HARD_ANON:
+	case MADV_HARD_ANON_HUGETLB:
 	case MADV_HARD_DIRTY_PAGECACHE:
 	case MADV_HARD_DIRTY_SHMEM:
 	case READ_ERROR:
@@ -187,8 +196,15 @@ static void check(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failure
 		ASSERT_EQ(1UL << siginfo.si_addr_lsb, self->page_size);
 		ASSERT_EQ(siginfo.si_addr, vaddr);
 
-		/* XXX Check backing pte is hwpoison entry when supported. */
-		ASSERT_TRUE(pagemap_is_swapped(self->pagemap_fd, vaddr));
+		if (type != MADV_HARD_ANON_HUGETLB)
+			/*
+			 * Check backing pte is hwpoison entry when supported.
+			 * Although try_to_unmap_one() also installs hwpoison
+			 * entry for HugeTLB, pagemap_hugetlb_range() doesn't
+			 * parse swap entries at all.
+			 */
+			ASSERT_TRUE(pagemap_is_swapped(self->pagemap_fd, vaddr));
+
 		break;
 	default:
 		SKIP(return, "unexpected inject type %d.\n", type);
@@ -196,7 +212,19 @@ static void check(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failure
 
 	/* Check if the value of HardwareCorrupted has increased. */
 	ASSERT_EQ(get_hardware_corrupted_size(&size), 0);
-	ASSERT_EQ(size, self->corrupted_size + self->page_size / 1024);
+
+	if (type == MADV_HARD_ANON_HUGETLB) {
+		/*
+		 * Only one page is hardware corrupted; the rest should all be
+		 * released to buddy allocator.
+		 */
+		ASSERT_EQ(size, self->corrupted_size + getpagesize() / 1024);
+		/* HugeTLB should have lost the HWPoison HugeTLB page. */
+		nr_hugetlb_pages = hugetlb_nr_default_pages();
+		ASSERT_EQ(nr_hugetlb_pages + 1, self->nr_hugetlb_pages);
+	} else {
+		ASSERT_EQ(size, self->corrupted_size + self->page_size / 1024);
+	}
 
 	/* Check if HWPoison flag is set. */
 	ASSERT_EQ(pageflags_get(self->pfn, self->kpageflags_fd, &pfn_flags), 0);
@@ -261,6 +289,39 @@ TEST_F(memory_failure, anon)
 	ASSERT_EQ(munmap(addr, self->page_size), 0);
 }
 
+TEST_F(memory_failure, anon_hugetlb)
+{
+	char *addr;
+	int ret;
+	unsigned long alloc_size;
+
+	if (variant->type == MADV_SOFT)
+		SKIP(return, "Soft offline test is not implemented");
+
+	alloc_size = default_huge_page_size() * NR_ALLOC_HUGETLB_PAGES;
+	self->page_size = default_huge_page_size();
+	self->nr_hugetlb_pages = hugetlb_nr_default_pages();
+
+	addr = mmap(0, alloc_size, PROT_READ | PROT_WRITE,
+		    MAP_ANONYMOUS | MAP_PRIVATE | MAP_HUGETLB, -1, 0);
+	if (addr == MAP_FAILED)
+		SKIP(return, "mmap failed, not enough memory or hugetlb not supported.\n");
+	memset(addr, 0xce, alloc_size);
+
+	prepare(_metadata, self, addr);
+
+	ret = sigsetjmp(signal_jmp_buf, 1);
+	if (!self->injection_attempted) {
+		self->injection_attempted = true;
+		ASSERT_EQ(variant->inject(self, addr), 0);
+		FORCE_READ(*addr);
+	}
+
+	check(_metadata, self, addr, MADV_HARD_ANON_HUGETLB, ret);
+
+	ASSERT_EQ(munmap(addr, alloc_size), 0);
+}
+
 static int prepare_file(const char *fname, unsigned long size)
 {
 	int fd;
-- 
2.56.0.506.g506a7eabc5-goog

