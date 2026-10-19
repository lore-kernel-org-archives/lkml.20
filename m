Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429942;
	b=DfEPSbp/pqmQEY+iUs+Tg/5ukOA6LfU8hFHRbLW4In1CUiMuWTR6LCVWbS6hFkFR4TXj
	 VAYb73fl0NMRr1JjJd3Ms7MkIbvutO4+Lx8t8A8Kcfzw7ZfECMpAIoEFV7tuQLlUfnvfB
	 ADKUQp+/xh6YYqlMfwdS6sOXXX9EZU1dl56nNLwOk2MjjZd/5fPxPqkjxUcHEq8Ts51aB
	 vPX0SHQqc8EEH/Tk5hMR9gaR3J2/dnZ3x8+Blrr9Gri5yezIZc0NcZJVu/ZKeG5/9iNEY
	 KyokwEdz3/Xdpq27hYcStCxBehZ+Lgu1yScCUsxWB4AaL/igX1pTX3sXbot6t1Gg8Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CHAyG17ULwqYW3XMyT+/P6CxC7w9alZQfDxEUV7e7EU=;
	b=XmNwznelPafd9xHkn16wX2SeaMR18jk5LK6Tq1nYYPIf5ZlGUbBzzGn/T+zB8jaV3Qup
	 DNaLgr1FRh2lqcluu8Y+FxGOdRJ1aWRn9Bu1pCWktk/AkD9QNFEgKT+TDJzNOAS2bcnov
	 wvHOlpeiCePh8zEhhXMKXn4kgdSjx74DY8PeE5ddy/xWif0e9N0XFs1TEtt4N22yuSd+W
	 iXrb64f7WLW/CBTEbjSVZbAnypaYHCEPBODt7iD2FNSXBQpK17ZYnN0pNINZG0QTGWQgU
	 ScEbYPANMQlklB1w7I0p3WwGPCRLJPjrG7UOBgHK14a0A8OXkhH+O/lJjCgf0po1nHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=crDgUAL9;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4926360A3809
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4926360A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=crDgUAL9
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91986c5cb75so25208096d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792429940; x=1793034740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CHAyG17ULwqYW3XMyT+/P6CxC7w9alZQfDxEUV7e7EU=;
        b=crDgUAL9qkEv7ws9tA4vseh/nxiljRLnLZSFJeOO60Wm/+5yy9LRGbzLzcYzCJtEgi
         009UkpNOgzaGAWQfxhma5ADU70StE7QrRGm3QUjMsVB0/f54J6gmcngrbmrKgh3Z2WNl
         BJrQlfDNZVSPjTDkCTk3BTGfMuPMMS2ao7hbWqRq20O0Q+w5G/MxnhRcUXeOtI0zK5tq
         lKSUZgSDbJnpV1yLJAsCnWHxsdUv9UJBGI7fG11hut1l3uNkdhKwyESXhZzOf08IzP1E
         2wcoNbbumI6g6NLWZMqoTZVeMbzgTW7DkJbyZmNX3jVvD4te7Tbfl82cmIwIZ9ZRKWkC
         zd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429940; x=1793034740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CHAyG17ULwqYW3XMyT+/P6CxC7w9alZQfDxEUV7e7EU=;
        b=ld329X0EoN5G5cJp46vwK+masfytDVoSmoYtUKe3nLHV5xC2UyvnnutTUJkhK1DXxg
         h2xvhqPOXhF14bNSeuP3mvs04Lk6RcgQ7rsKQpnkUcYs+uBv1onQ65Rnk/I+79I4O0Ax
         SIdc4FqOX92V7qC1VvwQSG6zXgraDntVp2er3T/mjj+XK7U/FZfQerqe6MHgt5bKLCgu
         GZEfNIiJYPd3X6W+i1ffqiTUdElj7OVjky2kpV8XakdbSHiNNebQ3emKe8RPUCktY/9j
         hFG0h/Wu2T/AEu3EhPgPNUoBoDALAapzBQFbJXgtUw4Eo8r17EcvGOFu8lO9TTbJIkbt
         rkZg==
X-Forwarded-Encrypted: i=1; AKwUvBwKPVLdBCYlqDd44oXkEpaOJ42hRPIy70q4eKBJ7Rtx87/HTaNI1YiprJTF5ZAU8YVsID55gazYtKHQBt0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoQXOrgCpULQwrHk5MsuTTQle5Owbz4MuNW7OsbY+FAvhLanc8
	5NZdbQf+NB41boCvzNvgY9b0NvOYIjRfPUJanIWMwaOC7tZGvGBV0Jl44UwQz7mxPmo=
X-Gm-Gg: AYBFou24JQ9Kq6S3KfzScsO92xdgWv7qMDLelMvS198SbZz6roq83o6PmSlS82+u22l
	kPjedIz1u8nLVvg85jatABk86drrlM0DzwkK8JaKJG5Xvh+enylb3tHxoTdMkXm2VGyYeVOxxUD
	GI1cVoGK2H6G2CtSmerqoCzibC7p8Al8I0X1vZVr2Shhcfu7NsQfKL51sOLOY2Ckf4v1HbQaxyT
	4QZYhdZhzT/pYIAohhI9M6msQ7eWCAtOcBpv9QoRLlxS89CYQ0lJIB2Jfz01P6TbrAvJ4lGRsfT
	gFBUVFDI83YceZH7sNI8FBYMAX14gRAH1XpUw23XpQpyC3wlDbp7TIh9bZJjpgj4Yg59gJNunrv
	AtadTTPt9AtDGaRPlT9Gfe9mKAM7srnJSb/MPEdFbEBaihoys1cZkd37VgUZr/lVbAIcp0urxvU
	xdnsX6cm1xtMmWa5G0f6ezuhEaq/3WUDOtNQ8vKLUrNL2y20iTI+1n5wKaxI3Z1oG2Xoqgz9A7o
	rJF91zxfzR2G/vV8K86gp749SlzlmyvJEYZteJfE/ngZxBsu6jadra5vjb3
X-Received: by 2002:a05:6214:1d2a:b0:91b:7f54:8dc1 with SMTP id 6a1803df08f44-91bdf3e5077mr140461206d6.50.1792429940088;
        Mon, 19 Oct 2026 10:12:20 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c040d4cedsm723116d6.34.2026.10.19.10.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:12:19 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH v3 7/7] selftests/mm: check that unauthorized MADV_PAGEOUT skips large file folios
Date: Mon, 19 Oct 2026 13:12:06 -0400
Message-ID: <20261019171206.3331374-8-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019171206.3331374-1-gourry@gourry.net>
References: <20261019171206.3331374-1-gourry@gourry.net>
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

A caller that neither owns nor may write a file may page out the COW
pages of a private mapping of it, but not its file pages. When the
advised range only partly covers a large file folio, the folio must be
filtered out before it is split, on separate paths for PMD- and
PTE-mapped folios.

Splitting a file folio unmaps all of it, and a partly covered folio can
only be reclaimed after a split, so a split is the failure to look for.

Check that partial MADV_PAGEOUT by such a caller leaves every mapped page
of a PMD-sized shmem folio mapped, both when a PMD maps it and when a
mapping of half of it maps it with PTEs. Since this checks for a split
rather than for reclaim, it needs no swap.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 .../testing/selftests/mm/madv_cold_pageout.c  | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/tools/testing/selftests/mm/madv_cold_pageout.c b/tools/testing/selftests/mm/madv_cold_pageout.c
index f5a81d7bd08b..5a226ccbacb2 100644
--- a/tools/testing/selftests/mm/madv_cold_pageout.c
+++ b/tools/testing/selftests/mm/madv_cold_pageout.c
@@ -195,6 +195,33 @@ static void pte_map_thp(struct __test_metadata *_metadata, char *mapping,
 	ASSERT_TRUE(flags & KPF_COMPOUND_HEAD);
 }
 
+static char *map_aligned_file(struct __test_metadata *_metadata, int fd,
+			      size_t size, int flags)
+{
+	char *mapping = reserve_aligned(_metadata, size);
+
+	ASSERT_EQ(mmap(mapping, size, PROT_READ | PROT_WRITE, flags | MAP_FIXED,
+		       fd, 0), mapping);
+
+	return mapping;
+}
+
+/* Create a PMD-sized shmem file filled with 1s. */
+static int create_shmem_file(struct __test_metadata *_metadata)
+{
+	char *shared;
+	int fd;
+
+	fd = memfd_create("madv_cold_pageout", 0);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(ftruncate(fd, pmd_size), 0);
+	shared = map_aligned_file(_metadata, fd, pmd_size, MAP_SHARED);
+	memset(shared, 1, pmd_size);
+	ASSERT_EQ(munmap(shared, pmd_size), 0);
+
+	return fd;
+}
+
 static void assert_filled(struct __test_metadata *_metadata,
 			  const char *mapping, size_t size)
 {
@@ -792,6 +819,93 @@ TEST_F(madv_cold_pageout, pageout_private_file_reclaims_only_cow)
 	ASSERT_EQ(munmap(mapping, 2 * page_size), 0);
 }
 
+/*
+ * An unauthorized caller must leave a large file folio of a private mapping
+ * alone, even when the advised range only partly covers it. Splitting the
+ * folio would unmap all of it, so every page must stay mapped, which needs
+ * no swap to check. See pageout_stays_within_range about other unmapping.
+ */
+TEST_F(madv_cold_pageout, pageout_private_file_skips_large_file_folio)
+{
+	char *mapping;
+	size_t offset;
+	int fd;
+
+	if (!pmd_size)
+		SKIP(return, "PMD-sized THPs are not supported");
+	if (geteuid())
+		SKIP(return, "requires root to change credentials");
+	fd = create_shmem_file(_metadata);
+	mapping = map_aligned_file(_metadata, fd, pmd_size, MAP_PRIVATE);
+	if (!collapse(mapping, pmd_size, check_huge_file))
+		SKIP(return, "could not allocate a PMD-sized shmem THP");
+	ASSERT_EQ(fchmod(fd, 0400), 0);
+	if (!drop_privileges())
+		SKIP(return, "could not drop privileges");
+
+	ASSERT_EQ(madvise(mapping, pmd_size / 2, MADV_PAGEOUT), 0);
+	for (offset = 0; offset < pmd_size; offset += page_size) {
+		ASSERT_TRUE(page_is_present(self->pagemap_fd,
+					    mapping + offset))
+			TH_LOG("page at offset %zu was unmapped", offset);
+	}
+	assert_filled(_metadata, mapping, pmd_size);
+
+	ASSERT_EQ(munmap(mapping, pmd_size), 0);
+	close(fd);
+}
+
+/*
+ * The same holds for a large file folio that a private mapping maps with
+ * PTEs: every page the mapping maps must stay mapped. See
+ * pageout_stays_within_range about other unmapping.
+ */
+TEST_F(madv_cold_pageout, pageout_private_file_skips_pte_mapped_file_folio)
+{
+	const size_t size = pmd_size / 2;
+	char *mapping, *shared;
+	unsigned long pfn;
+	uint64_t flags;
+	size_t offset;
+	int fd;
+
+	if (!pmd_size)
+		SKIP(return, "PMD-sized THPs are not supported");
+	if (geteuid())
+		SKIP(return, "requires root to change credentials");
+	if (self->kpageflags_fd < 0)
+		SKIP(return, "cannot read page flags");
+	fd = create_shmem_file(_metadata);
+	shared = map_aligned_file(_metadata, fd, pmd_size, MAP_SHARED);
+	if (!collapse(shared, pmd_size, check_huge_file))
+		SKIP(return, "could not allocate a PMD-sized shmem THP");
+	ASSERT_EQ(munmap(shared, pmd_size), 0);
+
+	/* Mapping half of the folio leaves it mapped by PTEs. */
+	mapping = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	assert_filled(_metadata, mapping, size);
+	pfn = pagemap_get_pfn(self->pagemap_fd, mapping);
+	ASSERT_NE(pfn, -1UL);
+	ASSERT_EQ(pageflags_get(pfn, self->kpageflags_fd, &flags), 0);
+	if (!(flags & KPF_COMPOUND_HEAD))
+		SKIP(return, "the shmem THP was split");
+	ASSERT_EQ(fchmod(fd, 0400), 0);
+	if (!drop_privileges())
+		SKIP(return, "could not drop privileges");
+
+	ASSERT_EQ(madvise(mapping, size / 2, MADV_PAGEOUT), 0);
+	for (offset = 0; offset < size; offset += page_size) {
+		ASSERT_TRUE(page_is_present(self->pagemap_fd,
+					    mapping + offset))
+			TH_LOG("page at offset %zu was unmapped", offset);
+	}
+	assert_filled(_metadata, mapping, size);
+
+	ASSERT_EQ(munmap(mapping, size), 0);
+	close(fd);
+}
+
 /* Swap out an anonymous page, to see whether swap works at all. */
 static bool probe_swap(int pagemap_fd)
 {
-- 
2.56.0

