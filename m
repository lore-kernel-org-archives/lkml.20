Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA8F568FB1
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000693; cv=none; b=F1YNV+KLjw8AUAyOM9/OssVYsffLqG4N0Zo1dgvWArafLo3ra7Szx4UJetqcLrwljQ4bji2z9NBVnWu4KFOr+Aq+DbuvcBMNGyk4G8rFBrUuL/9nd7p8jzOyKASahUyMLf1BjBv8NJgYYa50D0P0X8Mt5PhO1PXI5L5Ud1uBGE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000693; c=relaxed/simple;
	bh=lEJMXUtCVhoeWq4U2V/23VXfvisqCuhdbkr6UhYUggA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tLbKi2oRXogP2Fo4+IX/HNaNY/FdDoh95nGRSUdyj8zFlazZvwwpbi7dN1Bg7WAKELSlFqv4YeShmKPOKMb28Ig7bNydMM/LHDP7YzNDE+uDu8MKJ7NEK8o9k/2kZ81RznJdJvKaDVIDX0HD6WmeYt3aoX6nGE99RXtlTGkooSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=fhdxLlXY; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="fhdxLlXY"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93ead211f14so118517585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792000689; x=1792605489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mj29K3kJ1Vz8u8FKLKjpbxQZ7NU1kf2WCV2QOxB9gM8=;
        b=fhdxLlXYA4YiDAFxJSgdmt0lk/EIlRFJNaYNr/Q7G1N6zm/UnhKW2Z+daMVlkjb4AO
         aI4J49HD/jY8L4A1PSAWn+frjiNkqP/1X0KNmzT0TViRK30AzxMfe+zcO/dAdJ9EdWQg
         kcL/pKt8bPvZgDkEqItDsti3RvG11jV+kHU4csrZoVkQoZWk5LRJl6Vd3iifXdQBpT4D
         OBoX4aYsnSWL3KVhMLo97c8p6n3EhbkF8KhpQzZ0WQ/aAXwMBqpvBd7jvfjLguUBtEKN
         NKpIIDHKAiVP9Tu6hfFRijsVyOwRQVAgEZBV8TE6tLU4Z5XhHkd9jSTT/QOXuNFmiyGK
         XlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000689; x=1792605489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mj29K3kJ1Vz8u8FKLKjpbxQZ7NU1kf2WCV2QOxB9gM8=;
        b=Wkr3ODV16Y6i3ArEyKx+Q5w7n6uANj7sv+IuMlhRLRJIJsrOwPflPGscv7xlgjlNrB
         OSvQG8i63CFN/60SYgzbKe63jfdIhDFwLDWMLhMbAYhGwImOg6GqMBoL5IuVaQ2iaotZ
         dDkDRAWUZ8newPCbBGSAcTY+ag2i7rm+bypS0SmnL8Ocf52uSWTkFaAyM6kLDcRNDRYR
         V7+hlYzpdvECQk6r8nwcHvwdFDRqnVmGnbaY0TytFF7uOWWotuiAOz2f/FCQXaOL8/WT
         cDk3UA0BpGGh4m+1m5ree5vUXLC0/9Vn0dlwx/wPRp/kWX+X7fFnB9syihlIaMzo+RS+
         eKJg==
X-Gm-Message-State: AFq9FYL9FJazI4LdNJUWDNhFx4T++FF0DSIDwrs36PGgk0HPg/lOh2sC
	leQqq5IAVVH9qlCJrKoP+BOpWufzin07KCPpiF7iyczvvY1aAkbS5IMyYD1u7jktjI0=
X-Gm-Gg: AYBFou025NpSkG9IbdWSVp60rxK4AB8l+SEHIH/kY9LCpjl4YUCOP5llSTUESwqwcID
	fv64m1GsUp1pHFeeTYP6kDHk+eyAmaOz43AWv2DZtNgDa7q281f4XTR7pwychz+XqmOtFsLKFHI
	A4Y/BAJqySqEFanPcuvT8oPFqk8FDm1An1ZsG5TpUhcLxwEYbquf/MfRhkQSd89eehP80myZBqv
	jQ1/W3b1yFl6mGBSxLpz5+HnLCMDBd13zcvTQOB6iO0/0dy8oEnVZXFkBDgX1E3NukxsdSLwK5N
	17AV5xYPy8JOhoz42TC9zLjz7AVsUsQCOEUuFoyjMs6R4H7EkgiUhY2l1fPPe2J/XQUQ1/f56Pf
	RNn1zHj71S4/sYs3arc3n22gWR/1rFke9Ewc8Fg7lrZveNmJs7RZXj+GtVoOrI7SPYiB8m70IAH
	OQBfdCH6vZz3zsL9Epey5afoaHouDFpl91yjBWi0KHBDTJWdc9cyaQ73D8jEN6LAxPLXMN2Ul3Y
	LDJ/2yLfEYdt4fYw7hTQFnmh6uTh/A8VC91PeUUEST8KkUsntFSBzfTU3wk
X-Received: by 2002:a05:620a:444d:b0:93f:231:9ff with SMTP id af79cd13be357-93f02310e8bmr565290285a.27.1792000689161;
        Wed, 14 Oct 2026 10:58:09 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b95847sm58498006d6.32.2026.10.14.10.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:58:08 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
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
Subject: [PATCH 3/8] selftests/mm: check MADV_COLD and MADV_PAGEOUT range handling
Date: Wed, 14 Oct 2026 13:57:51 -0400
Message-ID: <20261014175756.2035176-4-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014175756.2035176-1-gourry@gourry.net>
References: <20261014175756.2035176-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

madvise(2) accepts a zero-length range, rejects an unaligned start, and
reports an unmapped gap in the range with ENOMEM while still applying the
advice to the mapped pages on either side.

Check each of these for both hints. Around the gap, only MADV_PAGEOUT has
an effect the test can observe, so only MADV_PAGEOUT is checked for
paging out both neighbours, after a control page shows that swap works.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 tools/testing/selftests/mm/madvise.c | 103 +++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/tools/testing/selftests/mm/madvise.c b/tools/testing/selftests/mm/madvise.c
index 42cc08fe45ae..f122154fac05 100644
--- a/tools/testing/selftests/mm/madvise.c
+++ b/tools/testing/selftests/mm/madvise.c
@@ -5,6 +5,7 @@
 #define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
+#include <sched.h>
 #include <stdbool.h>
 #include <sys/mman.h>
 #include <unistd.h>
@@ -51,6 +52,21 @@ static bool pageout_until_swapped(struct __test_metadata *_metadata,
 	return false;
 }
 
+/*
+ * Keep this task on one CPU, so that draining that CPU's LRU batches drains
+ * the folios this task faulted in.
+ */
+static void pin_to_current_cpu(struct __test_metadata *_metadata)
+{
+	int cpu = sched_getcpu();
+	cpu_set_t mask;
+
+	ASSERT_GE(cpu, 0);
+	CPU_ZERO(&mask);
+	CPU_SET(cpu, &mask);
+	ASSERT_EQ(sched_setaffinity(0, sizeof(mask), &mask), 0);
+}
+
 /*
  * Both hints are best effort, so these tests check what userspace can rely
  * on: which mappings are accepted, which pages must never be reclaimed, and
@@ -111,6 +127,93 @@ TEST_F(madvise, locked_vma_is_rejected)
 	ASSERT_EQ(munmap(mapping, page_size), 0);
 }
 
+/* A zero-length range is accepted. */
+TEST_F(madvise, zero_length_is_accepted)
+{
+	char *mapping;
+
+	mapping = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+
+	ASSERT_EQ(madvise(mapping, 0, MADV_COLD), 0);
+	ASSERT_EQ(madvise(mapping, 0, MADV_PAGEOUT), 0);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+}
+
+/* The start of the range must be page-aligned. */
+TEST_F(madvise, unaligned_start_is_rejected)
+{
+	char *mapping;
+
+	mapping = mmap(NULL, 2 * page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	mapping[0] = 1;
+
+	ASSERT_EQ(madvise(mapping + 1, page_size, MADV_COLD), -1);
+	ASSERT_EQ(errno, EINVAL);
+	ASSERT_EQ(madvise(mapping + 1, page_size, MADV_PAGEOUT), -1);
+	ASSERT_EQ(errno, EINVAL);
+	ASSERT_EQ(mapping[0], 1);
+
+	ASSERT_EQ(munmap(mapping, 2 * page_size), 0);
+}
+
+/*
+ * An unmapped gap in the range makes either hint fail with ENOMEM, after
+ * advising the mapped pages on both sides of the gap. Only MADV_PAGEOUT has
+ * an effect on those pages that the test can observe.
+ */
+TEST_F(madvise, unmapped_gap_fails_after_advising)
+{
+	char *mapping, *control;
+	bool swapped = false;
+	int retry;
+
+	pin_to_current_cpu(_metadata);
+
+	/* Make sure MADV_PAGEOUT can swap at all before relying on it. */
+	control = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(control, MAP_FAILED);
+	control[0] = 1;
+	if (!pageout_until_swapped(_metadata, control, page_size,
+				   self->pagemap_fd))
+		SKIP(return, "MADV_PAGEOUT did not swap the page");
+
+	mapping = mmap(NULL, 3 * page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	mapping[0] = 1;
+	mapping[2 * page_size] = 1;
+	ASSERT_EQ(munmap(mapping + page_size, page_size), 0);
+
+	ASSERT_EQ(madvise(mapping, 3 * page_size, MADV_COLD), -1);
+	ASSERT_EQ(errno, ENOMEM);
+	ASSERT_EQ(mapping[0], 1);
+	ASSERT_EQ(mapping[2 * page_size], 1);
+
+	for (retry = 0; retry < PAGEOUT_RETRIES && !swapped; retry++) {
+		ASSERT_EQ(madvise(mapping, 3 * page_size, MADV_PAGEOUT), -1);
+		ASSERT_EQ(errno, ENOMEM);
+		swapped = pagemap_is_swapped(self->pagemap_fd, mapping) &&
+			  pagemap_is_swapped(self->pagemap_fd,
+					     mapping + 2 * page_size);
+		if (!swapped)
+			usleep(10000);
+	}
+	ASSERT_TRUE(swapped)
+		TH_LOG("MADV_PAGEOUT did not page out both sides of the gap");
+	ASSERT_EQ(mapping[0], 1);
+	ASSERT_EQ(mapping[2 * page_size], 1);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+	ASSERT_EQ(munmap(mapping + 2 * page_size, page_size), 0);
+	ASSERT_EQ(munmap(control, page_size), 0);
+}
+
 /* Neither hint may fault a swapped page back in. */
 static void check_skips_swapped_pte(struct __test_metadata *_metadata,
 				    int pagemap_fd, int advice)
-- 
2.56.0

