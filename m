Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601294;
	b=Itn1XiRgRHplAKghJqYGlalS9RILwpfvlsd/FDKuGbtIQACa0O6NNrGZ74bqhgxhTqGc
	 0CBwQm/NfpwMiVXn5M5GCnofNbIQAE6hpiRrAG2oCf+kAuYmRx8JQuRZRbtM/8iUw7kdl
	 SOI2hI5cYsGcWM1dVSbEuqD4URt1y7P1D3yNkloJWMUfrvEguBVI3i28kC+O76hheI4G/
	 ++3gFtlxUspP8b+nUfa+sYsEh8Yxy61MCGjXa18LlAI01IH1TAOVCbXBRD8BbExqySMVc
	 2iXilzFVbRiZnHd33gRJ0rlTKerm4hCrlDj825JeMEcPeQ4xCokF0dvf9w+qAhx6Glw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dXeINQ4QIp7Up68Y8ta4qvgRYMF1gZWIV5kShFfvhqw=;
	b=SeWHFp6tB1uVx8/tVhY+YKLFxSceW95Q6vC6XK9DIKGIMWdJmTv/7RANsUVB8fX4AzUj
	 W19LDornMf8QgChxZSdWdViFnTKt3nakxv94yhsS5CwUKrKHBJFO2lStnpMzi1SGYGE8i
	 LUKQ2VUVq1/XfWa9+FU3m/8Zkh0DU1I3azIm37QUDnUu8Q5LDSyhRZGGwvoK3W+SUYlxy
	 WKrMcGl2BzXYEtIBaJC4A/3Qc55fFQUwHzYhafZHguE0Z4D3QRWYi28EGnZxkNfo99WtW
	 8s7W9K6a/DYPvUIDcprlYhj0WmOEqtxc/c/OceJRlRjOjOcpIKZRkXYqPkX0SZrXEbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wt4Yp0AB;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1396A606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1396A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wt4Yp0AB
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6fbf1ba31fbso367562eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792601293; x=1793206093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dXeINQ4QIp7Up68Y8ta4qvgRYMF1gZWIV5kShFfvhqw=;
        b=Wt4Yp0ABVW+4BLVnDmXGHgWq+ks71wPVWpo3al2hAuzXhfKXAS1ixU4sCf7NIQJiWb
         NSn79iNFs1WUjqQahECsu/wgVMunSQ/nqGuhT01p4cSt5AnHenOnEAhbEtpa9K+SQzne
         z4kA+V5RHC/rDwH5cAhqOVhTplcPLIcMxelGGhjziaLDg6LRQm0vnhRGHfz0xnktshgy
         WiScW9Xdda+JKYsejEJuNP8AIfymqqGPSwq3kcQaeEMDvLv/10ZnXljnKDuXDUAdU9Fu
         v6Efxxg8bFqBmFtXC2ajzi9PBR2bnwmbAMPNsqnVOvliIw6atESLVbASO0E0FlKx54W5
         EzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601293; x=1793206093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXeINQ4QIp7Up68Y8ta4qvgRYMF1gZWIV5kShFfvhqw=;
        b=mfMShxBhNxXGhFlf2STq73dF1J0O2NdwkAv9b4ey3Hn1aoP1yS60XRmvh6CbjkDMd0
         KzSgHCYDnYcYx2BgqL8vxL6yR6Q3NnP9OGAq4IjbxBAv0NDbAbBlu++Hzu1s58AMjtHV
         L6OZtsJy0ouVOslT9QBNlDzZQGhyxMstwVnmi2BwNNwYQSsLNKpNyUJhphJHS+wxoyX1
         jkjgdSqZW4c9pRptmKo00HCYmj5KOfZMghWns4QHdfomKrZEdxAUWFQJ7jIjB4mq9W20
         9bkFhAgV3aIXU+sk6GccUZFp+0Fq1Cvw+SCozueFecMUNdiG9EGFFPd4kzoV16aX1ScS
         928g==
X-Forwarded-Encrypted: i=1; AKwUvBym+FYRcT/haKO23YnVHdJe+JL4Kut924YqWGksWt19HA82sB4Lm1PerK7jZPtu3txURr3qxn5he40Qcgc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDw2HVB5TlkvEnjcZ8QZu4p3zuugc2JgCGOtOPNCIIBM1G+Q+E
	xAi5NLw3tL8FETJ+q9HuDp5QRivWU3+1DIJ76HRHl9t8L4VGpRPknowg
X-Gm-Gg: AYBFou1qdWTCJHvS/gAFM387Qt+I6NmooKrK+pVj4JmTnFZ0Dyc9QjvHKGxPbzcJYzE
	YD8LWslfgWjc09EXZ8DEavS8gMcNOvanWPV3tbe00Rf0mdI8Mc/aXLpqPxBsdmeT96GkkYlB5rv
	lF7/ayQVZGJU5VHQ7nLXUYw8zEa56KB7pXLTQ1F2K/BtiAPSaKJLN5RnqVZYXSuZEsccPO02ma4
	PJtAiX8lnCdwG5rGazRTXys76wWqK3JqSFxhg5mP8fg/qyiDsdDWOTOIugF3jO3KxNUmekDl07W
	d3nRKTLZ71WldXaT/gy37LJ1gLk7R08/gJZRgB2xPZSFwKxloeUWjlTgHhS2+o1++mrACWKt3Re
	SWp1gwgFQaPHZ86Ns93SwIWYPCSHT7ch9uFT9mw6RkpRxgywU52VOnFw8PITzuZh1DN0QXbJcRs
	mr4Zs3J3/bsTFAVhB+TF0S3+9yfoosyP5WJpneCCWTkB79qqbVJleaBesceOMdHAwUH7jsfAS29
	4w98Wxbg40/g9hqwgwZ36Y7CdRNMg1RIT2PTw8xnCik+bMILn55Men78vt2d+OtE4QVCKFzYLOr
	79BIY2c0uYQzCBgjqJQcCQ==
X-Received: by 2002:a05:6820:821:b0:6bd:f79e:501c with SMTP id 006d021491bc7-7093f8b08f4mr1720613eaf.16.1792601292924;
        Wed, 21 Oct 2026 09:48:12 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a7d5ebc240sm2352610fac.2.2026.10.21.09.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:48:11 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Gregory Price <gourry@gourry.net>,
	"Liam R . Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH v2] selftests/mm: merge: keep the far mremap() targets in the carveout
Date: Wed, 21 Oct 2026 11:48:10 -0500
Message-ID: <20261021164810.45846-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The merge tests map their areas at fixed addresses within a 30-page
PROT_NONE carveout. Several mremap() tests move an area 1000 or 2000
pages away to separate it from the others, but those targets are outside
the carveout, and MREMAP_FIXED unmaps whatever is mapped there.

Under virtme-ng, the shared libraries are packed right above the
carveout and the dynamic linker starts about 4 MiB above it. The moves
then replace part of its text with an anonymous mapping, and the test
crashes in its next lazily bound call:

  merge[6980]: segfault at 7f7ebb3c1e60 ip 00007f7ebb3c1e60 sp 00007ffd35fbaec8 error 14

Two to four of the mremap() tests then fail with "Test terminated
unexpectedly by signal 11", depending on the exact layout. On a host
where libc is mapped at a 2 MiB aligned address, the targets happen to
land above the dynamic linker and the tests pass.

Since the areas are all within the first 30 pages, moving one by 30
pages is enough to keep it apart from the others. Add FAR_PAGES for
that distance, move areas by FAR_PAGES or 2 * FAR_PAGES pages, and make
the carveout 3 * FAR_PAGES pages so that it covers every target.

Fixes: 4e25f85b9f85 ("tools/testing/selftests: add mremap() unfaulted/faulted test cases")
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    v2:
    - Replace the 1000 and 2000 page offsets in the tests with FAR_PAGES
      and 2 * FAR_PAGES, and derive the carveout size from FAR_PAGES,
      instead of only enlarging the carveout (Gregory Price).
    v1: https://lore.kernel.org/all/20261021011929.89150-1-danishkhateeb03@gmail.com/
    
    Tested under virtme-ng (9p root, glibc 2.44) on next-20261020 with a
    KASAN/lockdep kernel, three runs of each binary:
    
      merge before:  pass:22 fail:4 skip:1 (SIGSEGV in ld-linux-x86-64.so.2)
      merge after:   pass:26 fail:0 skip:1
    
    On the host (glibc 2.44, libc mapped 2 MiB aligned) the results are the
    same with and without the patch.
    
    An LLM was used to help with this patch.

 tools/testing/selftests/mm/merge.c | 39 ++++++++++++++++++------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/mm/merge.c b/tools/testing/selftests/mm/merge.c
index 7dd2933417c1..208ad7e340fa 100644
--- a/tools/testing/selftests/mm/merge.c
+++ b/tools/testing/selftests/mm/merge.c
@@ -22,9 +22,18 @@ FIXTURE(merge)
 	struct procmap_fd procmap;
 };
 
+/*
+ * The tests map their areas within the first FAR_PAGES pages of the carveout,
+ * and some move an area FAR_PAGES or 2 * FAR_PAGES pages up to separate it
+ * from the others. MREMAP_FIXED unmaps whatever is mapped at the target, so
+ * the carveout must cover those targets too.
+ */
+#define FAR_PAGES	30
+#define CARVEOUT_PAGES	(3 * FAR_PAGES)
+
 static char *map_carveout(unsigned int page_size)
 {
-	return mmap(NULL, 30 * page_size, PROT_NONE,
+	return mmap(NULL, CARVEOUT_PAGES * page_size, PROT_NONE,
 		    MAP_ANON | MAP_PRIVATE, -1, 0);
 }
 
@@ -73,7 +82,7 @@ FIXTURE_SETUP(merge)
 
 FIXTURE_TEARDOWN(merge)
 {
-	ASSERT_EQ(munmap(self->carveout, 30 * self->page_size), 0);
+	ASSERT_EQ(munmap(self->carveout, CARVEOUT_PAGES * self->page_size), 0);
 	/* May fail for parent of forked process. */
 	close_procmap(&self->procmap);
 	/*
@@ -115,7 +124,7 @@ FIXTURE_SETUP(merge_with_fork)
 
 FIXTURE_TEARDOWN(merge_with_fork)
 {
-	ASSERT_EQ(munmap(self->carveout, 30 * self->page_size), 0);
+	ASSERT_EQ(munmap(self->carveout, CARVEOUT_PAGES * self->page_size), 0);
 	ASSERT_EQ(close_procmap(&self->procmap), 0);
 	/* See above. */
 	prctl(PR_SET_MEMORY_MERGE, 0, 0, 0, 0);
@@ -660,7 +669,7 @@ TEST_F(merge, mremap_unfaulted_to_faulted)
 
 	/* Offset ptr2 further away. */
 	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + FAR_PAGES * page_size);
 	ASSERT_NE(ptr2, MAP_FAILED);
 
 	/*
@@ -721,7 +730,7 @@ TEST_F(merge, mremap_unfaulted_behind_faulted)
 
 	/* Offset ptr2 further away. */
 	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + FAR_PAGES * page_size);
 	ASSERT_NE(ptr2, MAP_FAILED);
 
 	/*
@@ -785,12 +794,12 @@ TEST_F(merge, mremap_unfaulted_between_faulted)
 
 	/* Offset ptr3 further away. */
 	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + 2 * FAR_PAGES * page_size);
 	ASSERT_NE(ptr3, MAP_FAILED);
 
 	/* Offset ptr2 further away. */
 	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + FAR_PAGES * page_size);
 	ASSERT_NE(ptr2, MAP_FAILED);
 
 	/*
@@ -870,13 +879,13 @@ TEST_F(merge, mremap_unfaulted_between_faulted_unfaulted)
 
 	/* Offset ptr3 further away. */
 	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + 2 * FAR_PAGES * page_size);
 	ASSERT_NE(ptr3, MAP_FAILED);
 
 
 	/* Offset ptr2 further away. */
 	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + FAR_PAGES * page_size);
 	ASSERT_NE(ptr2, MAP_FAILED);
 
 	/*
@@ -1035,11 +1044,11 @@ TEST_F(merge, mremap_correct_placed_faulted)
 	 */
 	ptr3 = &ptr[10 * page_size];
 	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + 2 * FAR_PAGES * page_size);
 	ASSERT_NE(ptr3, MAP_FAILED);
 	ptr2 = &ptr[5 * page_size];
 	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + FAR_PAGES * page_size);
 	ASSERT_NE(ptr2, MAP_FAILED);
 
 	/*
@@ -1075,7 +1084,7 @@ TEST_F(merge, mremap_correct_placed_faulted)
 	 *                  ptr2      \       ptr       \       ptr3
 	 */
 	ptr = sys_mremap(ptr, 5 * page_size, 5 * page_size,
-			 MREMAP_MAYMOVE | MREMAP_FIXED, ptr + page_size * 1000);
+			 MREMAP_MAYMOVE | MREMAP_FIXED, ptr + FAR_PAGES * page_size);
 	ASSERT_NE(ptr, MAP_FAILED);
 
 	/*
@@ -1110,7 +1119,7 @@ TEST_F(merge, mremap_correct_placed_faulted)
 	 *                  ptr2      \       ptr       \       ptr3
 	 */
 	ptr = sys_mremap(ptr, 5 * page_size, 5 * page_size,
-			 MREMAP_MAYMOVE | MREMAP_FIXED, ptr + page_size * 1000);
+			 MREMAP_MAYMOVE | MREMAP_FIXED, ptr + FAR_PAGES * page_size);
 	ASSERT_NE(ptr, MAP_FAILED);
 
 	/*
@@ -1168,7 +1177,7 @@ TEST_F(merge, mremap_correct_placed_faulted)
 	 *      ptr                     ptr3      \       ptr2
 	 */
 	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + FAR_PAGES * page_size);
 	ASSERT_NE(ptr2, MAP_FAILED);
 
 	/*
@@ -1203,7 +1212,7 @@ TEST_F(merge, mremap_correct_placed_faulted)
 	 *            ptr                         \       ptr3
 	 */
 	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 1000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + FAR_PAGES * page_size);
 	ASSERT_NE(ptr3, MAP_FAILED);
 
 	/*

base-commit: fcec4f4bcc1101dbd7e3aff267856b3bbfe128c6
-- 
2.56.0

