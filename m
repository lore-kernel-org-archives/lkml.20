Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E9633D4E4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787874432; cv=none; b=lVXJ4VnUnYCsNNJK50bYL8XB/UczRPWxEIe94uXRiM2fsjt/qEX/NLACRCCDnVrVMnYeyGQ4QatOJx5uyO7mI5XIeUVx7s2hVwFqu45WFh2epuZD4Tje7ezBxx39W6MKvqBXJ0DcXk9q7KSK62CaWvj3xH/0BtK+bDqKY3f8nxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787874432; c=relaxed/simple;
	bh=MTfl5Roj3nHDq6Fo6p993VtWG3sGOyvvww1EGpJTwts=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=MLHrw1yHbw6QirsGuVMnWoZJkomAMlB+ij/ylavAb8dete/F33dZzBR067MLRD21HpgdpijSJHjpl4d/v8y3iRiqY2ASZiZyarUYZr/4ZJl08UaQ9AULoHKccYEbeDymARrQ42KUyxWAw9ZLlv2Eii/5AOS8fLYW7EERRpjLYPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpg8qKJI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpg8qKJI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 928A81F000E9;
	Thu, 27 Aug 2026 23:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787874431;
	bh=jwqj3UUlL63ppxWOJ9ELWriy7estMngu/j/CKSXTY/0=;
	h=From:To:Cc:Subject:Date;
	b=mpg8qKJISgIJh9ZXhfamcY0wiNT3vF+JPbP+6cP4gQa+NI2+V7OJQBCm3FuCufveZ
	 CGRaSW2fKUFDOUIthAZDSPwjU+ydyvjYdabRXSVAaG+x0wsaDn/UvDccW5mJ6uDgD1
	 FXcAIP0hkiuoKFowgjJ7fECteCDnKoONEWjxYSs6QqHqMdfWcIFkpHJNMV8PnIr85I
	 IsuKKpkyL9FTl7qH/pXTxHMPWHrtqS81xXB5h9mOXStH7xP3RWfP5PTeFuRh8ywqo0
	 FsOh9eQY5WQioqL3TUxGFaPCeIttuKVrdnlO6tvWOD1Jhk97QL0iJEYNDbeqM59YHR
	 4zxpHfsaO+QJg==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	lianux.mm@gmail.com
Cc: axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	stevensd@chromium.org,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>
Subject: [PATCH v2 0/7] mm/mglru: speed up inc_min_seq() and fix cold/hot inversions
Date: Fri, 28 Aug 2026 07:46:57 +0800
Message-Id: <20260827234704.63163-1-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is an aging speedup series split out from the MGLRU swappiness
series [1], with the inc_min_seq changes separated to make them
easier to review.

Currently, inc_min_seq performance is crucial to both the swappiness
fix and proactive aging. There are two problems with it:

1. It processes each folio one by one, while many operations can be
batched or skipped. For example, a batch of folios can be moved together
from the oldest generation to the second-oldest generation, and the
associated counting can also be done in batches.

2. It may cause potential cold/hot inversion by placing promoted folios
(which have been scanned and found to have young PTEs) behind
non-promoted folios. A similar inversion can also occur among
non-promoted folios, as tail folios from the oldest generation are
placed before head folios when moving them to the second-oldest
generation.

This series tries to batch operations as much as possible and fix the
potential cold/hot inversion by keeping promoted folios ahead of
non-promoted folios, while also preserving the order of non-promoted
folios when moving them from the oldest generation to the second-oldest
generation.

Minor issue: inc_min_seq() also counts protected folios
improperly, as promoted folios should be skipped, as in
sort_folio().

We need a stable workload with a stable number of folios to measure
aging and evaluate the speedup in inc_min_seq(). So I asked ChatGPT
to generate the microbenchmark below. It ages an LRU vec containing
512 MB of memory 100 times:

 #define _GNU_SOURCE
 
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
 #include <stdint.h>
 #include <unistd.h>
 #include <fcntl.h>
 #include <errno.h>
 #include <time.h>
 #include <sys/mman.h>
 
 #define SIZE		(512UL * 1024 * 1024)
 #define LRU_GEN		"/sys/kernel/debug/lru_gen"
 #define TARGET_CGROUP	"/system.slice/agetest.scope"
 #define START_GEN	3
 #define END_GEN	103
 
 static long long nsec_diff(const struct timespec *start,
 			   const struct timespec *end)
 {
 	return (end->tv_sec - start->tv_sec) * 1000000000LL +
 	       (end->tv_nsec - start->tv_nsec);
 }
 
 static int find_memcg_id(void)
 {
 	FILE *fp;
 	char line[4096];
 	int memcg_id;
 
 	fp = fopen(LRU_GEN, "r");
 	if (!fp) {
 		perror("fopen lru_gen");
 		return -1;
 	}
 
 	while (fgets(line, sizeof(line), fp)) {
 		char *p;
 
 		if (strncmp(line, "memcg ", 6))
 			continue;
 
 		p = line + 6;
 
 		if (sscanf(p, "%d", &memcg_id) != 1)
 			continue;
 
 		/*
 		 * The memcg path follows the numeric ID.
 		 */
 		p = strchr(p, ' ');
 		if (!p)
 			continue;
 
 		if (strstr(p, TARGET_CGROUP)) {
 			fclose(fp);
 			return memcg_id;
 		}
 	}
 
 	fclose(fp);
 
 	fprintf(stderr, "Cannot find %s\n", TARGET_CGROUP);
 	return -1;
 }
 
 int main(void)
 {
 	void *addr;
 	int memcg_id;
 	int fd;
 	long long total_ns = 0;
 
 	/*
 	 * mmap 512 MB and touch every page.
 	 */
 	addr = mmap(NULL, SIZE, PROT_READ | PROT_WRITE,
 		    MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
 	if (addr == MAP_FAILED) {
 		perror("mmap");
 		return 1;
 	}
 
 	memset(addr, 0x55, SIZE);
 
 	printf("mmap: %p, size: %lu MB\n",
 	       addr, SIZE / 1024 / 1024);
 
 	/*
 	 * Find the memcg ID automatically.
 	 */
 	memcg_id = find_memcg_id();
 	if (memcg_id < 0)
 		return 1;
 
 	printf("memcg: %d (%s)\n", memcg_id, TARGET_CGROUP);
 	printf("aging generation %d -> %d\n",
 	       START_GEN, END_GEN);
 
 	fd = open(LRU_GEN, O_WRONLY);
 	if (fd < 0) {
 		perror("open lru_gen");
 		return 1;
 	}
 
 	for (int gen = START_GEN; gen <= END_GEN; gen++) {
 		char buf[128];
 		int len;
 		struct timespec start, end;
 		long long ns;
 
 		len = snprintf(buf, sizeof(buf),
 			       "+ %d 0 %d\n", memcg_id, gen);
 
 		clock_gettime(CLOCK_MONOTONIC, &start);
 
 		if (write(fd, buf, len) != len) {
 			perror("write lru_gen");
 			close(fd);
 			return 1;
 		}
 
 		clock_gettime(CLOCK_MONOTONIC, &end);
 
 		ns = nsec_diff(&start, &end);
 		total_ns += ns;
 
 		printf("gen %3d: %8.3f ms\n",
 		       gen, ns / 1000000.0);
 		fflush(stdout);
 	}
 
 	close(fd);
 
 	printf("\nTotal:   %.3f ms\n",
 	       total_ns / 1000000.0);
 	printf("Average: %.3f ms\n",
 	       total_ns / (double)(END_GEN - START_GEN + 1) /
 	       1000000.0);
 
 	while (1)
 		sleep(1);
 
 	return 0;
 }

Run the above microbenchmark with:
systemd-run --scope --unit=agetest -p MemoryMax=1024M ./agetest

I’m seeing a significant speedup in inc_min_seq() on my x86 PC:

W/o patch:

Running scope as unit: agetest.scope
mmap: 0x72c1b5a00000, size: 512 MB
memcg: 12673 (/system.slice/agetest.scope)
aging generation 3 -> 103
gen   3:    7.433 ms
gen   4:    0.949 ms
gen   5:    2.535 ms
gen   6:    5.043 ms
gen   7:    5.041 ms
gen   8:    5.027 ms
...
gen 100:    5.035 ms
gen 101:    5.011 ms
gen 102:    5.029 ms
gen 103:    5.056 ms

Total:   503.946 ms
Average: 4.990 ms

W/ patch:

Running scope as unit: agetest.scope
mmap: 0x775ec5200000, size: 512 MB
memcg: 12717 (/system.slice/agetest.scope)
aging generation 3 -> 103
gen   3:    7.558 ms
gen   4:    0.916 ms
gen   5:    2.277 ms
gen   6:    2.328 ms
…
gen 100:    2.303 ms
gen 101:    2.297 ms
gen 102:    2.305 ms
gen 103:    2.312 ms

Total:   236.635 ms
Average: 2.343 ms

The average aging time drops from 4.990 ms to 2.343 ms!

Thanks, Xueyuan, for testing this on ARM[2]. It actually shows an even
larger improvement.
Xueyuan tested this series on his arm64 machine (24 cores, 4K base pages)
and reproduced the improvement:

THP=never (PTE):
  baseline: 7.644 ms
  patched:  2.964 ms (-61.2%)

THP=always (PMD):
  baseline: 0.0373 ms
  patched:  0.0292 ms (-21.8%)

[1] https://lore.kernel.org/linux-mm/20260812121658.69965-1-baohua@kernel.org/
[2] https://lore.kernel.org/linux-mm/20260827035416.3012015-1-xueyuan.chen21@gmail.com/

-v2:
  * Collect tags from Kairui, Baoquan, and Xueyuan, thanks!
  * Split `__folio_inc_gen()` into a separate patch and add
    `VM_WARN_ON` checks for the generation and active state, per
    Baoquan and Kairui, thanks!
  * Make `delta` a `long` instead of `unsigned long`, per Lian Wang,
    thanks!
  * Fix checkpatch issues by converting macros to `static inline`
    functions, per Kairui, thanks!
  * Drop the batched protected update since it doesn't show a
    significant performance improvement, following Baoquan's comments.

-v1:
  https://lore.kernel.org/linux-mm/20260821102538.22642-1-baohua@kernel.org/

Barry Song (Xiaomi) (7):
  mm/mglru: separate folio generation update from LRU accounting
  mm/mglru: batch update lrugen->nr_pages in inc_min_seq()
  mm/mglru: enhance cold/hot inversion handling in inc_min_seq()
  mm/mglru: exclude folios promoted by aging from protected in
    inc_min_seq()
  mm/mglru: make LRU folio prefetch helper an inline function
  mm/mglru: move folios from oldest gen to second-oldest gen from head
    to tail
  mm/mglru: batch move folios to the second-oldest gen's LRU

 mm/vmscan.c | 129 ++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 100 insertions(+), 29 deletions(-)

-- 
2.34.1

