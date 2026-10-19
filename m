Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429940;
	b=d54wEWA5y0VY65BYuRiMWyyu4HcQnWwbIpw/yKiUUvQvgaVVqhSooZsGRWqDmrsDbyFU
	 Tt0PvY8yXjvmGgdDWpoP4JFVa3vNfCpEGD8d6j16vbhNZVdpTHJIUKJEGhkIozPuFKsQ1
	 hGvaIWJ2N/iw7byffWVg7KOipoKGOiTLMpifr1iOrFWT6Hhpf+dJYnXyCCnRlKFEh+LKK
	 Ph8Wf+WxxDIDfybO1t2tkchRaqZkINNgfayWLdn2Mru8o+HdkzYYs0/tqeSDKvoecu+21
	 +/KhoBqzJ7/1mupue85IPcfEkCldkve/UQ9JUilJamR8M5Bl66Bb9gCVPOjUxb0j3Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u0HBvVezVTtBJY8hj2GhlVDWYrJlySjFH5I8pUaDGQ8=;
	b=K4hr+dghHly0Zz4iw24H1S9w2XtuS/OcSNFnVYZxavsoMttdk9Q3MXM8b4biwbFEI6Z6
	 n2wlqKAc10fQVbPFWs0U2mtdUvbyWvjB2KusGOE3zx/G5+Sl87ctKDsKJY8xkGlvH8PT3
	 2qVlfYIZWWvkPgkRn1BKKbqY3InXrOl80dqcgThjwK4xiPEXzQCmBCou23U6emSVZ5scp
	 lmvks2gsqIkM/9RgDFzrxIOb4+zIwIrC+Nt5dxCfwPOchzLAk59ZqCtnVlE4VQZa2gEwB
	 UhC5lOEwHKC5Ncql4epHMWYbJ1XA8B3H3htvjZbqCSFt227hZB3iiV262+G3SCpk7Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=FxIyPJA0;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C5760A2633
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88C5760A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=FxIyPJA0
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-9196d8543cbso22649326d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792429938; x=1793034738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0HBvVezVTtBJY8hj2GhlVDWYrJlySjFH5I8pUaDGQ8=;
        b=FxIyPJA0078FuGlP/gl6CyTd+Jnq2uzEL3hK2Zqln36aBIHSfwtiQ03nB415emON/J
         e58NnJUSDVcprjOAnKSIw3/UQEhFyksBAz0piIpR6SFmq/G7QcltpPhOgEfE5F87ldsp
         +yAHe/NkrhcdrTdaB6mGfYlSLQqovLBAF8IUFadhKnWryTSWGkyr0Y2TMrOPKzmXgDnG
         /ypBmWuVp5dWUg5sn4cYdKy+hDyiHHKMxt7P1PCZsi1Kjnz0R+Vpxk5AdMOG2/wlL2Tg
         unVz90/hEYcEFUliGhHaX5c7BWe0e4pCyOBkw6IiggZv+mCjPgMeEM3U4HPD60tbkul0
         5ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429938; x=1793034738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u0HBvVezVTtBJY8hj2GhlVDWYrJlySjFH5I8pUaDGQ8=;
        b=pD3vkIRsNGjxOS+8G/QBAJcL3mV6Bk3K4XXaua2Qnp0qgzPP4R5lCCK7Dc4IAJZ0SR
         jZmvNGbK07AXUcQW9ncgvqYHy6qDuHqeavw0cI2OotSMSnvmi8BUTYHaPuDs4RlHVSGU
         zcQIJZ7jjQpNnf7+D6Bu5Zm+iLBPejeXFh4XgMnX60EtnSISVQ3nZbzwP9No0ayVOH35
         3sfm31zBMMU0v/FV/cbl4PTfqx38eZFlIcJzdx1+iyN6MA+9+S0Sd97YNiObVwK6GkHm
         Fpy/K37Cm21lGUEgod5FSklAsAS3rtTz3zCuUKAsFpaxhozivNc6gTT8q8YKVe3dlR3/
         Jnhw==
X-Forwarded-Encrypted: i=1; AKwUvBwo9+KiMvjkltXaDrgGj2bvXCEi4J4lDqkhIEXgXI0Z9QtC7DHiNyR2fQXwFPfXZokqBrEpxeQ0k8imGj4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhcIf/OEcD3rA9wtY4edBue+LsDqnaF5U8621QecD+sPCkvSLC
	0AwcXsT42SkXDZFDcj/z9H0s68E48HQyYbkE9fmgGosWlFlKFvo/t7ashqmoiNvrbb+Di9wTzKz
	lYRx+ooM=
X-Gm-Gg: AYBFou1yrb50Nz31qix6R8OVZdzFx2ckodUYakcjxoVM2fptYxBD9oIlddSt4Ovw0DF
	66Q5Ub6FGoc3bKRkJNNfdS3liQ2LQuE7wlj6DNmq838VfnZlMUs/deqz6NUJ8nCQiMQ5Xl7wC56
	se013NCkTxL/EDMDoN3HJIkvtswFwQOUAABU3V3n76MxPnJnjizfceR59AVShcERSSatdGpHeiK
	Rxn5zqwXof+P35MU2Yk1A3xcjYrSIu2ROHZ328UbLsZMyaUmUHi/iL2XdFic4mwL3NrZ0GfOHAv
	+m9qWDtgUBYUSfehe8Luw47Q4e285pAW5V131OZ/uZ2eg3IQwnrIqxISQJxQgClBLLVWiMgu9HJ
	1l0H1RrV/ujdBO62xRpuLiOV2Uy3hzcpnqvGu65nq3MzhlKDgNht6fdbKNeiN9Xz9RDuO9I1WWS
	jYg2gs6A7xkpDAWcUrwSJi399qc4ct/xZTZrB7w/rclEocyBr7LCNq7nhvr0phmB0z57liWdiOi
	4wmNRMwW+AwmeICb1ExiJ1QqTuzedR7N8UHuTlxRvle+34byOmJOKLDrM1z
X-Received: by 2002:a05:6214:3285:b0:91b:5d3a:f127 with SMTP id 6a1803df08f44-91bdf2dd132mr149004556d6.50.1792429938570;
        Mon, 19 Oct 2026 10:12:18 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c040d4cedsm723116d6.34.2026.10.19.10.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:12:18 -0700 (PDT)
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
	shuah@kernel.org
Subject: [PATCH v3 6/7] selftests/mm: check MADV_PAGEOUT file permissions
Date: Mon, 19 Oct 2026 13:12:05 -0400
Message-ID: <20261019171206.3331374-7-gourry@gourry.net>
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

MADV_PAGEOUT only pages out file pages for a caller that owns the file or
could open it for writing, per can_do_file_pageout(). Any other caller
gets nothing from a shared file mapping, and only the anonymous COW pages
from a private one.

main() now also checks once whether MADV_PAGEOUT can unmap a clean page
of a file in /tmp, where the tests make their files. The tests below skip
if it cannot, since none of them would show anything.

Check that the owner of a read-only file can page out a clean page of
it. When started as root, the test hands the file to nobody and drops
privileges, so that capabilities cannot stand in for ownership and
nobody need not be able to write to /tmp.

Also check that an unauthorized caller leaves a shared file page mapped,
and that it pages out the COW page of a private mapping but not the file
page next to it. These need root to change credentials, and skip if that
fails. The private mapping check also skips if MADV_PAGEOUT cannot swap.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 .../testing/selftests/mm/madv_cold_pageout.c  | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/tools/testing/selftests/mm/madv_cold_pageout.c b/tools/testing/selftests/mm/madv_cold_pageout.c
index b5eec490fb68..f5a81d7bd08b 100644
--- a/tools/testing/selftests/mm/madv_cold_pageout.c
+++ b/tools/testing/selftests/mm/madv_cold_pageout.c
@@ -5,6 +5,7 @@
 #define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
+#include <grp.h>
 #include <sched.h>
 #include <stdbool.h>
 #include <stdint.h>
@@ -29,6 +30,8 @@ static size_t page_size;
 static size_t pmd_size;
 /* Whether MADV_PAGEOUT can swap out anonymous memory, see main(). */
 static bool can_swap;
+/* Whether MADV_PAGEOUT can unmap clean file pages in /tmp, see main(). */
+static bool can_unmap_file;
 
 /*
  * Keep this task on one CPU, so that draining that CPU's LRU batches drains
@@ -276,6 +279,15 @@ static char *map_temp_file(struct __test_metadata *_metadata, size_t size,
 	return mapping;
 }
 
+/* The uid and gid of nobody. */
+#define NOBODY 65534
+
+/* Become nobody, an unprivileged user without capabilities. */
+static bool drop_privileges(void)
+{
+	return !setgroups(0, NULL) && !setgid(NOBODY) && !setuid(NOBODY);
+}
+
 /*
  * Both hints are best effort, so these tests check what userspace can rely
  * on: which mappings are accepted, which pages must never be reclaimed, and
@@ -689,6 +701,97 @@ TEST_F(madv_cold_pageout, cold_preserves_half_of_pte_mapped_thp)
 	ASSERT_EQ(munmap(mapping, pmd_size), 0);
 }
 
+/*
+ * The owner of a file may page out its clean page-cache pages. Run as an
+ * unprivileged owner, so that capabilities cannot stand in for ownership.
+ */
+TEST_F(madv_cold_pageout, pageout_unmaps_owned_file_page)
+{
+	char *mapping;
+	int fd;
+
+	if (!can_unmap_file)
+		SKIP(return, "MADV_PAGEOUT cannot unmap file pages");
+	fd = create_temp_file(page_size);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(fchmod(fd, 0400), 0);
+	/* Hand the file over first, as nobody may not be able to write /tmp. */
+	if (!geteuid()) {
+		ASSERT_EQ(fchown(fd, NOBODY, NOBODY), 0);
+		if (!drop_privileges())
+			SKIP(return, "could not drop privileges");
+	}
+	mapping = mmap(NULL, page_size, PROT_READ | PROT_WRITE, MAP_PRIVATE,
+		       fd, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	close(fd);
+
+	ASSERT_EQ(mapping[0], 0);
+	ASSERT_TRUE(pageout_until_unmapped(mapping, page_size,
+					   self->pagemap_fd));
+	ASSERT_EQ(mapping[0], 0);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+}
+
+/*
+ * A caller that neither owns nor may write a file must not page out its
+ * shared mappings. MADV_PAGEOUT succeeds but leaves the page mapped.
+ */
+TEST_F(madv_cold_pageout, pageout_skips_unauthorized_shared_file)
+{
+	char *mapping;
+
+	/* Otherwise the page would stay mapped regardless. */
+	if (!can_unmap_file)
+		SKIP(return, "MADV_PAGEOUT cannot unmap file pages");
+	if (geteuid())
+		SKIP(return, "requires root to change credentials");
+	mapping = map_temp_file(_metadata, page_size, MAP_SHARED, 0400);
+	if (!drop_privileges())
+		SKIP(return, "could not drop privileges");
+
+	ASSERT_EQ(mapping[0], 0);
+	ASSERT_TRUE(pagemap_is_populated(self->pagemap_fd, mapping));
+	ASSERT_EQ(madvise(mapping, page_size, MADV_PAGEOUT), 0);
+	ASSERT_TRUE(pagemap_is_populated(self->pagemap_fd, mapping));
+	ASSERT_EQ(mapping[0], 0);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+}
+
+/*
+ * A caller that neither owns nor may write a file may page out the anonymous
+ * COW pages of a private mapping of it, but must leave the file pages
+ * mapped.
+ */
+TEST_F(madv_cold_pageout, pageout_private_file_reclaims_only_cow)
+{
+	char *mapping;
+
+	if (!can_swap || !can_unmap_file)
+		SKIP(return, "MADV_PAGEOUT cannot swap or unmap file pages");
+	if (geteuid())
+		SKIP(return, "requires root to change credentials");
+	mapping = map_temp_file(_metadata, 2 * page_size, MAP_PRIVATE,
+				0400);
+	if (!drop_privileges())
+		SKIP(return, "could not drop privileges");
+
+	ASSERT_EQ(mapping[0], 0);
+	ASSERT_EQ(mapping[page_size], 0);
+	mapping[0] = 1;
+
+	ASSERT_TRUE(pageout_until_swapped(mapping, 2 * page_size,
+					  self->pagemap_fd));
+	ASSERT_TRUE(pagemap_is_populated(self->pagemap_fd,
+					 mapping + page_size));
+	ASSERT_EQ(mapping[0], 1);
+	ASSERT_EQ(mapping[page_size], 0);
+
+	ASSERT_EQ(munmap(mapping, 2 * page_size), 0);
+}
+
 /* Swap out an anonymous page, to see whether swap works at all. */
 static bool probe_swap(int pagemap_fd)
 {
@@ -706,6 +809,27 @@ static bool probe_swap(int pagemap_fd)
 	return swapped;
 }
 
+/* Unmap a clean page of a file in /tmp, where the tests make their files. */
+static bool probe_file_unmap(int pagemap_fd)
+{
+	bool unmapped;
+	char *page;
+	int fd;
+
+	fd = create_temp_file(page_size);
+	if (fd < 0)
+		ksft_exit_fail_perror("create_temp_file");
+	page = mmap(NULL, page_size, PROT_READ, MAP_PRIVATE, fd, 0);
+	if (page == MAP_FAILED)
+		ksft_exit_fail_perror("mmap");
+	close(fd);
+	FORCE_READ(page[0]);
+	unmapped = pageout_until_unmapped(page, page_size, pagemap_fd);
+	munmap(page, page_size);
+
+	return unmapped;
+}
+
 int main(int argc, char **argv)
 {
 	int pagemap_fd;
@@ -724,6 +848,9 @@ int main(int argc, char **argv)
 	can_swap = probe_swap(pagemap_fd);
 	if (!can_swap)
 		ksft_print_msg("MADV_PAGEOUT cannot swap\n");
+	can_unmap_file = probe_file_unmap(pagemap_fd);
+	if (!can_unmap_file)
+		ksft_print_msg("MADV_PAGEOUT cannot unmap file pages\n");
 	close(pagemap_fd);
 
 	return test_harness_run(argc, argv);
-- 
2.56.0

