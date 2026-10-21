Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792545574;
	b=Gr+szWDqRi/XQji6ScT8G5Y9P+1tw4/RKjKUu5Xvqmvg73HMM3D3te6sZ7kWt24l0294
	 f3MgFR/PDSgbvstDYF6bE83xD+860dt8Kqk3DEmXC4cQZCOe0KXfg5yDsrZo+SAn71M0i
	 TlXGtW61hWm4D7qLdjeXdpiCMpmoFeJSSL+c0FD7eT9GpT67w7NL8OF6RE+3fXVDz2GxV
	 3Fsn/dcnlTiqX+wCCZ5QN7jHFkHy5mTNqLqEOGSObXuXDhGVlDQQYkaS9+GrfZdNrRwqe
	 OfVs6eRjIllpPIa5mcJl2vVf8S2Fc03zR1zUfStsmDTkFdRRZ2Zs6pMPqfxpftQK/bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792545574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yGhEhiwx/DAjk4ecDWk0fGMz5/0MGUCdDypcHzAbbM4=;
	b=sINynn/F60crypUBUcm/cVspmX1Bv5WVhkr8LL1DNRiZ9Ib2Q1OPq+/5eAUcF1DosiD8
	 hfMRxzV6S0gWnWo39DRAJPm3nuCw8BmyvGRXzXKpJ0p11L72JtNDGa1q4hq0NxDhWOSaG
	 kCu46nWsUTklVcCI1sg4lozfzldOyLJsu39IFJ3g+gz5N+9lEAYDe2GVaeXYsMnw+K8he
	 wYpm0GFK4Ck3KESq/3sv4ABs8fXbmujx0xrt9AkMHdcnwEjZLemFRFuA4a5BA+zxsfNZ4
	 zdJnf0SvsWM6QsfWTdP91Ni24OVfUL7v7vtTZc4KbYMqf0kWn0dge85A4qBfFwnPH6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xlqq5oMp;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEE6606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFEE6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xlqq5oMp
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-53dda625f63so151738b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792545573; x=1793150373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yGhEhiwx/DAjk4ecDWk0fGMz5/0MGUCdDypcHzAbbM4=;
        b=Xlqq5oMpf943Xvhb8O1NkUrqlJd5lq0Lj6dM6tztMTEG7kJNzXT09ydQysJVVR6VPj
         n3q05dIcDoD8LbhPLi9TrwC16oir32LJRYhm6V5/HD90tQSVDrPtv4cw9YLWs3vGhoDn
         apt40jNR0n3sTZwjlN/s2FOe4SVsU6T68STpvy4VZXnWfSE7lQJx4bLS3VkOK7Dguo5b
         lP2IAEAhOLKm1sBNQg+/j5qZ0Lj0eURG/6o4Wtu9Dc/dDrPXS39BAPA6zjVCbLEzKQX1
         dZi33cLXtogq9iItqyNmAxHD3WL0LjbkoU8faiWczhQ+xmM73fLm1CXCD41LYV6jgX74
         ss5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792545573; x=1793150373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGhEhiwx/DAjk4ecDWk0fGMz5/0MGUCdDypcHzAbbM4=;
        b=Pzmeep8MggA+LSqCMZBgMIm6sfCiR2uZQohy/sN1Lx3F7FJ5mjdYqovwkErTzjeOAH
         Bk7op+jb5CRoQTMG2tlrZHanrsEiURWgPt+D0SbX6zRdn6oFIPngwwb9Ua7NHQQ3s9vm
         Br1jI461xcSYEe8fusIWgQeBqFof2BTK/RBAhggKGu5gHyof70UUaDD+TsMAX45rvf/9
         5qSrLF/+/lcDkqM/LbdYgObJ5qVmzeWXbLeo6958YbXvz6v7psjDbvaAvkwxxqHloSJU
         5wW0zUScA0nAusU0YBHG8MNHk/EMawqSlciRE4EcEAjUP2gfKLcOD8OG8DzfTXwQFdSq
         QruA==
X-Forwarded-Encrypted: i=1; AKwUvByYwlW8G8eyMO2m0p8sShkCr31cxV4J+KZjxzKtRJqe/Pa7327czf70ohBDUk/gZG5D02eyjMLsY/wKs5s=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1Jkt1HKsLx/ikiK7sZkWC1ydEoCeEdwvjrOQvmVkNjcxmI7kr
	oeDTYVe6PFaEU1MM0J+x8F0ORZFirDNvzr+qfGLg41hfE5ecS4d5ghBY
X-Gm-Gg: AYBFou2jhFP39q2Q+GorNRybPnFtPOoCePBHfkYmyAZS+oofiRmCLqbYi1h5zHCD6OE
	aYOw3mPFStShYFng4k7e21La91TIwoBDEEiNoFLzeSMdMuWUmQF9h8lSA5LSMUjADK1HUlMXV7T
	9SAW6m4aEz+ZQrlTgD2+pVlgTYq1o+IUIpSQRoeaepBAmtX1ch9HaaLy+CvML2ZQAchptBoTBun
	M+iTEW8ucJZbyDgR/rRr2i2QnuiKqsMgm7VufamNFticv3wXgv2PvN9ux2wpJxxHTpGfcVS1/CS
	i4mCsJRTffqLEEFNj2UC41+dOv+m1ik7HhRXpXIEzyHLwUYAYG1XmaiDZ8pgA+BYtbJU9MmPDcz
	xp4YJhkbY0RPIiw6idtz5apvi5odOQATnk3tHsyICKF6atg41PznkusxyBqjlpb3wFPSW170ZIS
	pP8xJJ1EpSTiGH8vYiw2RRreeS7ooiOGY4PdmbiJF2ImsqpHj2kGcFnQNgYTt2pUL1OetzET6bs
	8TccTUGsWrCY9AWzVOaAcbNRUI2Gf9t35ARommTItyZ6UpDkEFkqlYyJTaVWgkKQ7g/8DUf9cuE
	3SR3A3QDeloZm5lYwctNNg==
X-Received: by 2002:a05:6808:c40a:b0:552:9d62:f1b6 with SMTP id 5614622812f47-5535a767ef3mr353032b6e.51.1792545572736;
        Tue, 20 Oct 2026 18:19:32 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b4104048sm800659b6e.5.2026.10.20.18.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:19:31 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R. Howlett" <liam@infradead.org>,
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
Subject: [PATCH] selftests/mm: merge: reserve the far mremap() targets
Date: Tue, 20 Oct 2026 20:19:29 -0500
Message-ID: <20261021011929.89150-1-danishkhateeb03@gmail.com>
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

Make the carveout large enough to contain the targets.

Fixes: 4e25f85b9f85 ("tools/testing/selftests: add mremap() unfaulted/faulted test cases")
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested under virtme-ng (9p root, glibc 2.44) on next-20261020 with a
    KASAN/lockdep kernel, three runs of each binary:
    
      merge before:  pass:22 fail:4 skip:1 (SIGSEGV in ld-linux-x86-64.so.2)
      merge after:   pass:26 fail:0 skip:1
    
    A /proc/self/maps dump at the first far move shows the target inside
    the text of ld-linux-x86-64.so.2. The same tests crash under virtme-ng
    with v7.2 and v7.3-rc7 kernels, so this is not caused by a kernel
    change. On the host (glibc 2.44, libc mapped 2 MiB aligned) the results
    are the same with and without the patch.
    
    An LLM was used to help with this patch.

 tools/testing/selftests/mm/merge.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/merge.c b/tools/testing/selftests/mm/merge.c
index 7dd2933417c1..8291c208f0ae 100644
--- a/tools/testing/selftests/mm/merge.c
+++ b/tools/testing/selftests/mm/merge.c
@@ -22,9 +22,17 @@ FIXTURE(merge)
 	struct procmap_fd procmap;
 };
 
+/*
+ * Some tests move a mapping 1000 or 2000 pages away with MREMAP_FIXED, which
+ * unmaps whatever is mapped at the target, so make the carveout cover those
+ * targets too.  Otherwise the test can unmap its own code, such as the text of
+ * the dynamic linker.
+ */
+#define CARVEOUT_PAGES	2048
+
 static char *map_carveout(unsigned int page_size)
 {
-	return mmap(NULL, 30 * page_size, PROT_NONE,
+	return mmap(NULL, CARVEOUT_PAGES * page_size, PROT_NONE,
 		    MAP_ANON | MAP_PRIVATE, -1, 0);
 }
 
@@ -73,7 +81,7 @@ FIXTURE_SETUP(merge)
 
 FIXTURE_TEARDOWN(merge)
 {
-	ASSERT_EQ(munmap(self->carveout, 30 * self->page_size), 0);
+	ASSERT_EQ(munmap(self->carveout, CARVEOUT_PAGES * self->page_size), 0);
 	/* May fail for parent of forked process. */
 	close_procmap(&self->procmap);
 	/*
@@ -115,7 +123,7 @@ FIXTURE_SETUP(merge_with_fork)
 
 FIXTURE_TEARDOWN(merge_with_fork)
 {
-	ASSERT_EQ(munmap(self->carveout, 30 * self->page_size), 0);
+	ASSERT_EQ(munmap(self->carveout, CARVEOUT_PAGES * self->page_size), 0);
 	ASSERT_EQ(close_procmap(&self->procmap), 0);
 	/* See above. */
 	prctl(PR_SET_MEMORY_MERGE, 0, 0, 0, 0);

base-commit: 59d7f9ec14ad4b6f38c04d254f8f2bfb991e888e
-- 
2.56.0

