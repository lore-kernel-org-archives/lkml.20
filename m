Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471591;
	b=YzQfkjSowN89AO8AhlJ3QfYwmj153NDzMf+0DwHJvD13I0RsoVvKmNOLtfoJWcPjaqyF
	 9qsiPaghlpTGhxuhGS9eUMK4bJS1DDaPqGzR07z6aUHEXJBq6hYwIo0zEyPmv3HxxIrkG
	 ERFMUWAgy3b2Rj4hUKtZVbYnRrZwo0yGys3ajp6e09zTCshru/5DK7FYyqNpkHfOcXLAl
	 INYqtIL7JfqDxmuGJNUPgP/DoDbHd2MofVy64BvyX/fCTumqb6X54Jg5/JOBPdzwRmT3W
	 xxOL4EbeRYqYVgbLDEp22S7hp3TWPtXl1oTQEyia2gv0f+Uy0R6uoP37UK1/PKsu9dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471591;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=F8QZgOdwJOQNroHwVPxnHhYXS0/8CxhTeQW2i2TWYhM=;
	b=FOtzuR5sEIF4s8TbukHrtIDLOcHKCfrlr4bRq5nFvRu1+RP0s/iZbhsjRI3quvc4k6Ni
	 Sv+EHGOd9jbmyhhWZWoA1Rx9I4WcOj4QJGwvfmM4tRLSnDHA57e7tN5xS0Cmx19QrSeHs
	 6D2GC7LzrsxDkhN/s6zmITwCsF664aW8OYPMNG/h8LVY0pKi1yt9zjLfV4ycATlU+rQYU
	 j5VAGW3onIjeuaz/zF6MdTKD5Frz81F0702o8TGkQfj90sTqSzIka3hUq0NgCXaMPFCwz
	 gADdJvgOmu+tZujLYvr6zo7fFIZLi+cZsgV43KrGOGeSPjkeOeLS/SnKNOZvDrov6gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SfQpNE2V;
	arc=none smtp.remote-ip=95.215.58.184
Received: from mta1.migadu.com (out-184.mta1.migadu.com [95.215.58.184])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C70B606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C70B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SfQpNE2V
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xwZLJxSxd+oyLwrA+ywp9Z3Hse+KBPkDnLf51AGaCvk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794471589; v=1; x=1795076389;
 b=SfQpNE2VNQM2NX8/USSumPib0sst4z8rfdbRzO4/Aw0fQdPngxja/ZB2KYYZzPjU60c8TH2a
 0S57oe26zbsaaHNWm2zhjXrLpXk6vtt9xTTCSC8ftBMTtiQ+5lbauutu70vAbPhBpw8zCmNttn1
 BXMSq9k02P7FdgM2i2/hz6Xg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f982562d78f503d3;
	Thu, 12 Nov 2026 08:19:48 +0000
X-Mizu-Trace-ID: f982562d78f503d3
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Yu Zhao <yuzhao@google.com>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Ridong Chen <ridong.chen@linux.dev>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [PATCH] mm/mglru: deactivate anon folios into the oldest generation
Date: Thu, 12 Nov 2026 16:19:28 +0800
Message-Id: <20261112081928.3014946-1-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
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

From: Ridong Chen <chenridong@xiaomi.com>

folio_deactivate() is used by MADV_COLD and DAMOS_LRU_DEPRIO to move a
folio towards eviction. lru_deactivate() does that by deleting the folio
from its LRU list, clearing PG_active and PG_referenced, and adding it
back with lruvec_add_folio().

With MGLRU, lru_gen_folio_seq() places a swap-backed folio that is not
in the swap cache, i.e. an anon or shmem folio, into max_seq - 1,
regardless of its refs. That generation is active per
lru_gen_is_active(), so such a folio never reaches an inactive
generation, and a folio that has aged into min_seq + 1 is moved to a
younger generation instead. PGDEACTIVATE is still counted. Other folios
are not affected: with their refs cleared they are placed into the
oldest generation.

On a 4-generation memcg, 64MB of aged anon memory in min_seq + 1 ends up
in max_seq - 1 after MADV_COLD, while 64MB of file memory in the same
generation ends up in min_seq.

As a result, MADV_COLD can make anon memory less likely to be reclaimed.
It can be reproduced with a single process in a memcg with swap enabled:

  1) map two 64MB anon regions A and B and fault them in, A first;
  2) age the memcg twice through /sys/kernel/debug/lru_gen, so that both
     regions are in the same generation, min_seq + 1;
  3) apply MADV_COLD to B only, A is the control;
  4) reclaim the size of one region from anon only:
     echo "64M swappiness=max" > memory.reclaim;
  5) count the swapped out pages of A and B from /proc/self/pagemap.

B is expected to be swapped out instead of A. Three runs on mm-new:

                     A swapped out        B (MADV_COLD) swapped out
  before             16384 pages          15 ~ 128 pages
  after              0 ~ 157 pages        16384 pages

Use lruvec_add_folio_tail() for MGLRU, which treats the folio as
reclaiming and adds it to the tail of the oldest generation, the same
place lru_deactivate_file() puts a clean file folio. The other folios,
which were added to the head of the oldest generation, are now added to
its tail as well, so they are reclaimed first as MADV_COLD intends.

Fixes: 081488051d28 ("mm/mglru: fix underprotected page cache")
Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---

This patch was developed with the help of an AI coding assistant
(Claude).

The reproducer, run as root in a memcg with swap enabled and debugfs
mounted, e.g. "mkdir /sys/fs/cgroup/t; ./reclaim-order /sys/fs/cgroup/t":

  // SPDX-License-Identifier: GPL-2.0
  /*
   * Two 64MB anon regions, A (hot) and B (MADV_COLD). Reclaim 64MB via
   * memory.reclaim (swappiness=max -> anon only). Report how much of each
   * region was swapped out (mincore can't see swap; use /proc/self/pagemap).
   */
  #define _GNU_SOURCE
  #include <sched.h>
  #include <stdio.h>
  #include <stdlib.h>
  #include <stdint.h>
  #include <string.h>
  #include <unistd.h>
  #include <fcntl.h>
  #include <sys/mman.h>

  static unsigned long long memcg_id;
  static const char *cg_name;

  /* force one aging step on node 0 of our memcg via debugfs */
  static void aging(void)
  {
  	FILE *f = fopen("/sys/kernel/debug/lru_gen", "r");
  	char line[512], cmd[128];
  	unsigned long max = 0, s, x1, x2, x3;
  	int in = 0, fd, len;

  	while (fgets(line, sizeof(line), f)) {
  		unsigned long long id; char path[256];
  		if (sscanf(line, "memcg %llu %255s", &id, path) == 2) {
  			in = !strcmp(path, cg_name);
  			if (in) memcg_id = id;
  			continue;
  		}
  		if (in && sscanf(line, " %lu %lu %lu %lu", &s, &x1, &x2, &x3) == 4)
  			max = s;
  	}
  	fclose(f);
  	len = snprintf(cmd, sizeof(cmd), "+ %llu 0 %lu 200 1\n", memcg_id, max);
  	fd = open("/sys/kernel/debug/lru_gen", O_WRONLY);
  	if (write(fd, cmd, len) != len) perror("aging");
  	close(fd);
  }

  static long swapped(char *p, size_t sz)
  {
  	int fd = open("/proc/self/pagemap", O_RDONLY);
  	long n = 0;
  	for (size_t off = 0; off < sz; off += 4096) {
  		uint64_t e;
  		pread(fd, &e, 8, ((uintptr_t)(p + off) / 4096) * 8);
  		if (e & (1ULL << 62))
  			n++;
  	}
  	close(fd);
  	return n;
  }

  int main(int argc, char **argv)
  {
  	const char *cg = argv[1];
  	cg_name = strrchr(cg, '/');
  	size_t sz = 64UL << 20;
  	char buf[256], *a, *b, *d;
  	cpu_set_t set;
  	int fd;

  	CPU_ZERO(&set); CPU_SET(0, &set);
  	sched_setaffinity(0, sizeof(set), &set);
  	snprintf(buf, sizeof(buf), "%s/cgroup.procs", cg);
  	fd = open(buf, O_WRONLY); dprintf(fd, "%d\n", getpid()); close(fd);

  	a = mmap(NULL, sz, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
  	b = mmap(NULL, sz, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
  	d = mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
  	madvise(a, sz, MADV_NOHUGEPAGE); madvise(b, sz, MADV_NOHUGEPAGE);
  	/* A is faulted in first, so without MADV_COLD it is the older one */
  	for (size_t i = 0; i < sz; i += 4096) a[i] = 1;
  	for (size_t i = 0; i < sz; i += 4096) b[i] = 1;
  	d[0] = 1;
  	madvise(d, 4096, MADV_COLD);	/* drain lru_add */
  	/* two agings: clear young bits of both A and B, both end at min_seq+1 */
  	aging();
  	aging();
  	madvise(b, sz, MADV_COLD);
  	madvise(d, 4096, MADV_COLD);

  	snprintf(buf, sizeof(buf), "%s/memory.reclaim", cg);
  	fd = open(buf, O_WRONLY);
  	if (dprintf(fd, "64M swappiness=max\n") < 0)
  		perror("memory.reclaim");
  	close(fd);

  	printf("hot A swapped: %5ld pages   cold B swapped: %5ld pages  (of %zu)\n",
  	       swapped(a, sz), swapped(b, sz), sz >> 12);
  	return 0;
  }

 mm/folio.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/mm/folio.c b/mm/folio.c
index ea3adb6a89d7..c412d9b398e4 100644
--- a/mm/folio.c
+++ b/mm/folio.c
@@ -583,7 +583,16 @@ static void lru_deactivate(struct lruvec *lruvec, struct folio *folio)
 	lruvec_del_folio(lruvec, folio);
 	folio_clear_active(folio);
 	folio_clear_referenced(folio);
-	lruvec_add_folio(lruvec, folio);
+	/*
+	 * For MGLRU, lruvec_add_folio() places anon folios that are not in
+	 * the swap cache into the second youngest generation, which is an
+	 * active one. Add the folio to the oldest generation instead, like
+	 * lru_deactivate_file() does for clean folios.
+	 */
+	if (lru_gen_enabled())
+		lruvec_add_folio_tail(lruvec, folio);
+	else
+		lruvec_add_folio(lruvec, folio);
 
 	__count_vm_events(PGDEACTIVATE, nr_pages);
 	count_memcg_events(lruvec_memcg(lruvec), PGDEACTIVATE, nr_pages);

base-commit: 2dc0136b1fdac153434ab02778fcdb32db5d0dae
-- 
2.34.1

