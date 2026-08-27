Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B151474CC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787802879; cv=none; b=SYEa7AzslKXF+xUM4oBiiT308qZYga8gH24eHgsat0lNEnLPTs3xHZ8CYMUGdSOdWegurPI2BNFw8FCGLawl8dxiy2A3EBB0MvHYGZJOHR3pQXzYw/f7HiZRBFbDilnZTbpAO84BGa1zCxCoBqQsKRvekqyfIuAQWS2lvvSn5Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787802879; c=relaxed/simple;
	bh=k5GXZQFRjtLbZquzktCRuk8x8JHHSxbqLMk07OI7Ads=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LUAfjeM+keVUQ7MPIIpq8lLVw20Ux8UPtZk7UV/pjNlse8bBtM6WtFqrKs5tYwvE4wR8LTkAB/apRBV9k302KOGay9nHgZ6xMcWih3Z1bu7rk/hrYU1UaA3CBpICFF+7zlYixdIs+PTb1MiV/gX+F47mSqwYR6l2V+jHtW6/BEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NMu4sdYW; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NMu4sdYW"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9d290216d0so174108a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787802877; x=1788407677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rtJ7o6rD0VXMWfP6Cs3HMb+Jy7E3yT0ARf18rJvEe+Q=;
        b=NMu4sdYW30rzkR0465zizOlw9jn5FGGR/8Lln58LaRDq9rt1W7EwxZJobcUNmiIKSW
         J/KMmJpLaNHiRdagmJDCzZy5GDpL0NpDqkZg3EnhXaKc6BFZ7yQgy2D/n8WkWT35p7aZ
         bQ4oG31RjkuLOiT41/6tIR1zYP/6G3yMrqHhcOqUHRu1Pimqh9BnlhQbSAKNUleWnZ+t
         F68Ni2kw2iN2JFM5GTNNPM2tCQf0BtPzFaEohEZBt7IlIuJ2nduDqd9NZOz9A0dA5650
         vrU5j+DH6EH6D8UPWmxnNXDNTa3P/UTwZzg5D/mvCeGsuUEtFva3GStQ/J/+JatEnlnT
         WZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787802877; x=1788407677;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtJ7o6rD0VXMWfP6Cs3HMb+Jy7E3yT0ARf18rJvEe+Q=;
        b=dCsecbaemVdM0Cqlr0M2mb/66enSfHp9NS4ZXdhGXQ425POhbdh5BKktR7U4KZDCM3
         oeMkgA+E1nD41QBzG0zyuh5Ytlq190WnwxxRELIAQX83sGNYKZwpJROcInEsK3SBtktY
         38Di0IX89H7e6vD8zRbwEoRTDJuhmwyhEC8hNQL+EYnIoABESwb8Qi0G6aKyBKgJBSwx
         3j+vrPDhJ5+lHM2Eza/RK2RswviX8qSMmBxmdMH5teBuBnAvc7r3pG7jLjTwWq8VZK8b
         SSToc1c9TuuO/kbHB/Hs+3pwg/DXKFma83dQI+ByBUPxr0jW6JC9PO7/IA3HHXuH9ZdB
         VPdQ==
X-Forwarded-Encrypted: i=1; AHgh+RpspCpIB++uOsRJlAEkJs0NcssZziYZXbklYNjPVBGhxNd8kBS4Fq85v80YZks3IaMWq/A8aKzmCZ7wRO4=@vger.kernel.org
X-Gm-Message-State: AFuF++kkqw88XB3gcWyvbgI9fQKJF6+ate02Ft0E1+CfVEunMu0GwDb1
	AxhFc3+AhZImUpPi6jn+mPEqwUlwVwZkydtyLdIFe/CdnuYg/0sbH0mK
X-Gm-Gg: AR+sD12Ddme78ib6gT8SyZ9+qu+ePl5cGx/AmgT+MbDJ8DZki4yIr03GN+KdPvU45GD
	o7I77VKRP9fgwntj/Oma/Buo3jsegLdy00fBcGOSvPLrqnMz5HaR4Y7uPTEVzx1WgKiJYmZXvVU
	oFmAKbDOit+zWq0V8lK3yzf2ZT9Y3tlpf+qEjh4WjtFOKipQ0P+m9XkRaCZNHzgIBUlQxwnT5TW
	quq7zf5UTw1BdfeXtrkgxpoI9QbdgJHfrLcMgOPzBRlooLEoLHlwnjaCsMhA8shCVWdFpSEuBN8
	+AzgzVoSgPNBJY2xTDU4AJS1g4bOIH7LiLX8SU2d89C2LzTOnex4HynaVjnUppDo+/GAoKR7lbx
	uPuA+voO/H5zv0wvY+Q6/ik+C82nC61LkM9y9dCE+JdxizRsIz9VbMeiwXeASNqO0k6xzDfWQk7
	UZloOOn0uEKQvb7UUAtB5cbgEo813zr4Giuu46/A1AUzhSJubt7SkCuW//izp0KLK4LuLaSFrrB
	efgMFRE3kgYY44pqsUYWhjWcNGWMCOM9Me41x8FlYkoIREU4F4UqptwzlPk//sUgUoD+bjTEaO5
	f57BuTk=
X-Received: by 2002:a17:90b:4e8b:b0:390:af7c:fe5e with SMTP id 98e67ed59e1d1-3966d412b5bmr12628706a91.2.1787802876736;
        Wed, 26 Aug 2026 20:54:36 -0700 (PDT)
Received: from hz-11197422 ([132.147.97.39])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd55a4sm927412a91.7.2026.08.26.20.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 20:54:36 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: baohua@kernel.org
Cc: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	lianux.mm@gmail.com,
	linux-kernel@vger.kernel.org,
	ljs@kernel.org,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	stevensd@chromium.org,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com
Subject: Re: [PATCH 0/6] mm/mglru: speed up inc_min_seq() and fix cold/hot inversions
Date: Thu, 27 Aug 2026 11:54:04 +0800
Message-ID: <20260827035416.3012015-1-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260821102538.22642-1-baohua@kernel.org>
References: <20260821102538.22642-1-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Fri, Aug 21, 2026 at 06:25:32PM +0800, Barry Song (Xiaomi) wrote:
>This is an aging speedup series split out from the MGLRU swappiness
>series [1], with the inc_min_seq changes separated to make them
>easier to review.
>
>Currently, inc_min_seq performance is crucial to both the swappiness
>fix and proactive aging. There are two problems with it:
>
>1. It processes each folio one by one, while many operations can be
>batched or skipped. For example, a batch of folios can be moved together
>from the oldest generation to the second-oldest generation, and the
>associated counting can also be done in batches.
>
>2. It may cause potential cold/hot inversion by placing promoted folios
>(which have been scanned and found to have young PTEs) behind
>non-promoted folios. A similar inversion can also occur among
>non-promoted folios, as tail folios from the oldest generation are
>placed before head folios when moving them to the second-oldest
>generation.
>
>This series tries to batch operations as much as possible and fix the
>potential cold/hot inversion by keeping promoted folios ahead of
>non-promoted folios, while also preserving the order of non-promoted
>folios when moving them from the oldest generation to the second-oldest
>generation.
>
>Minor issue: inc_min_seq() also counts protected folios
>improperly, as promoted folios should be skipped, as in
>sort_folio().
>
>We need a stable workload with a stable number of folios to measure
>aging and evaluate the speedup in inc_min_seq(). So I asked ChatGPT
>to generate the microbenchmark below. It ages an LRU vec containing
>512 MB of memory 100 times:
>
> #define _GNU_SOURCE
> 
> #include <stdio.h>
> #include <stdlib.h>
> #include <string.h>
> #include <stdint.h>
> #include <unistd.h>
> #include <fcntl.h>
> #include <errno.h>
> #include <time.h>
> #include <sys/mman.h>
> 
> #define SIZE		(512UL * 1024 * 1024)
> #define LRU_GEN		"/sys/kernel/debug/lru_gen"
> #define TARGET_CGROUP	"/system.slice/agetest.scope"
> #define START_GEN	3
> #define END_GEN	103
> 
> static long long nsec_diff(const struct timespec *start,
> 			   const struct timespec *end)
> {
> 	return (end->tv_sec - start->tv_sec) * 1000000000LL +
> 	       (end->tv_nsec - start->tv_nsec);
> }
> 
> static int find_memcg_id(void)
> {
> 	FILE *fp;
> 	char line[4096];
> 	int memcg_id;
> 
> 	fp = fopen(LRU_GEN, "r");
> 	if (!fp) {
> 		perror("fopen lru_gen");
> 		return -1;
> 	}
> 
> 	while (fgets(line, sizeof(line), fp)) {
> 		char *p;
> 
> 		if (strncmp(line, "memcg ", 6))
> 			continue;
> 
> 		p = line + 6;
> 
> 		if (sscanf(p, "%d", &memcg_id) != 1)
> 			continue;
> 
> 		/*
> 		 * The memcg path follows the numeric ID.
> 		 */
> 		p = strchr(p, ' ');
> 		if (!p)
> 			continue;
> 
> 		if (strstr(p, TARGET_CGROUP)) {
> 			fclose(fp);
> 			return memcg_id;
> 		}
> 	}
> 
> 	fclose(fp);
> 
> 	fprintf(stderr, "Cannot find %s\n", TARGET_CGROUP);
> 	return -1;
> }
> 
> int main(void)
> {
> 	void *addr;
> 	int memcg_id;
> 	int fd;
> 	long long total_ns = 0;
> 
> 	/*
> 	 * mmap 512 MB and touch every page.
> 	 */
> 	addr = mmap(NULL, SIZE, PROT_READ | PROT_WRITE,
> 		    MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> 	if (addr == MAP_FAILED) {
> 		perror("mmap");
> 		return 1;
> 	}
> 
> 	memset(addr, 0x55, SIZE);
> 
> 	printf("mmap: %p, size: %lu MB\n",
> 	       addr, SIZE / 1024 / 1024);
> 
> 	/*
> 	 * Find the memcg ID automatically.
> 	 */
> 	memcg_id = find_memcg_id();
> 	if (memcg_id < 0)
> 		return 1;
> 
> 	printf("memcg: %d (%s)\n", memcg_id, TARGET_CGROUP);
> 	printf("aging generation %d -> %d\n",
> 	       START_GEN, END_GEN);
> 
> 	fd = open(LRU_GEN, O_WRONLY);
> 	if (fd < 0) {
> 		perror("open lru_gen");
> 		return 1;
> 	}
> 
> 	for (int gen = START_GEN; gen <= END_GEN; gen++) {
> 		char buf[128];
> 		int len;
> 		struct timespec start, end;
> 		long long ns;
> 
> 		len = snprintf(buf, sizeof(buf),
> 			       "+ %d 0 %d\n", memcg_id, gen);
> 
> 		clock_gettime(CLOCK_MONOTONIC, &start);
> 
> 		if (write(fd, buf, len) != len) {
> 			perror("write lru_gen");
> 			close(fd);
> 			return 1;
> 		}
> 
> 		clock_gettime(CLOCK_MONOTONIC, &end);
> 
> 		ns = nsec_diff(&start, &end);
> 		total_ns += ns;
> 
> 		printf("gen %3d: %8.3f ms\n",
> 		       gen, ns / 1000000.0);
> 		fflush(stdout);
> 	}
> 
> 	close(fd);
> 
> 	printf("\nTotal:   %.3f ms\n",
> 	       total_ns / 1000000.0);
> 	printf("Average: %.3f ms\n",
> 	       total_ns / (double)(END_GEN - START_GEN + 1) /
> 	       1000000.0);
> 
> 	while (1)
> 		sleep(1);
> 
> 	return 0;
> }
>
>Run the above microbenchmark with:
>systemd-run --scope --unit=agetest -p MemoryMax=1024M ./agetest
>
>I’m seeing inc_min_seq() become significantly faster:
>
>W/o patch:
>
>Running scope as unit: agetest.scope
>mmap: 0x72c1b5a00000, size: 512 MB
>memcg: 12673 (/system.slice/agetest.scope)
>aging generation 3 -> 103
>gen   3:    7.433 ms
>gen   4:    0.949 ms
>gen   5:    2.535 ms
>gen   6:    5.043 ms
>gen   7:    5.041 ms
>gen   8:    5.027 ms
>...
>gen 100:    5.035 ms
>gen 101:    5.011 ms
>gen 102:    5.029 ms
>gen 103:    5.056 ms
>
>Total:   503.946 ms
>Average: 4.990 ms
>
>W/ patch:
>
>Running scope as unit: agetest.scope
>mmap: 0x7c4b1d200000, size: 512 MB
>memcg: 12893 (/system.slice/agetest.scope)
>aging generation 3 -> 103
>gen   3:    7.538 ms
>gen   4:    0.937 ms
>gen   5:    2.348 ms
>gen   6:    2.300 ms
>gen   7:    2.302 ms
>gen   8:    2.294 ms
>gen   9:    2.296 ms
>...
>gen 100:    2.292 ms
>gen 101:    2.307 ms
>gen 102:    2.293 ms
>gen 103:    2.293 ms
>
>Total:   235.718 ms
>Average: 2.334 ms
>
>The average aging time drops from 4.990 ms to 2.334 ms!

Hi Barry,

I tested this series on my arm64 machine (24 cores, 4K base pages)
and reproduced the improvement with the microbenchmark from the
cover letter.

THP=never (PTE):
  baseline: 7.644 ms
  patched:  2.964 ms (-61.2%)

THP=always (PMD):
  baseline: 0.0373 ms
  patched:  0.0292 ms (-21.8%)

The PTE-level gain is larger than your x86 numbers (-61.2% vs
-53.2%). I suspect the per-folio cost of inc_min_seq() is higher
on my arm64 machine (or on arm64 in general).

The gain is also larger at the PTE level than at the PMD level
(-61.2% vs -21.8%), matching the much higher folio count
(131072 vs 256).

Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>

thanks,
Xueyuan

>[1] https://lore.kernel.org/linux-mm/20260812121658.69965-1-baohua@kernel.org/
>
>Barry Song (Xiaomi) (6):
>  mm/mglru: batch update lrugen->nr_pages in inc_min_seq()
>  mm/mglru: batch update lrugen->protected in inc_min_seq()
>  mm/mglru: enhance cold/hot inversion handling in inc_min_seq()
>  mm/mglru: exclude folios promoted by aging from protected in
>    inc_min_seq()
>  mm/mglru: move folios from oldest gen to second-oldest gen from head
>    to tail
>  mm/mglru: batch move folios to the second-oldest gen's LRU
>
> mm/vmscan.c | 98 +++++++++++++++++++++++++++++++++++++++++++----------
> 1 file changed, 80 insertions(+), 18 deletions(-)
>
>-- 
>2.34.1
>
>

