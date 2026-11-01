Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793549075;
	b=jCKXGX2p02q5rUfqY5qD4IUH7ia7tLYJLYo5G6iqRXwRW+NgFxM3I4kyydVyx0BLqBzS
	 EBHaS4NkPiVAywQ/jraynB8LjngrbYOXooFPz0PDHRhGl+2+6m2H1G/j2WexLEZqP5Hgb
	 IPal8hsFFgCwynpvNUWWvwFLjHBk59BD5I8iWWX7lumW5Nr9nQPOTyaNzEEiqTfqdugTU
	 TH8LvJD7H9PNWB8EwpH/Z431BTcs2o33Qb/KQ9tD0KYemB61chZClNtQ6kkSc2U9gpkX9
	 nM5zUB6X0HKAQlIAjZGZzC1uaa6Hp7MD9tuysYYmcaGxUahWGfvmdHKNyo5K/pg026Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793549075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VpiNcJITzAimIo2l/+wZFEDSgKEuus8b7eMSXpkoRXc=;
	b=1Gg+h0XD50Ot4V+nrSTwc7ZdOVBeAli0crZYiZ9lx4XBC+YIPgrzMN4/6Xs6MJYCc+qO
	 yCCiq7qW+D7bJRKn1T0eNzPjKVS/xuLQ5yRy5CdtVuaP0eRZ5+oUOSwkskcsshNEyaxzl
	 2Pfeya4XkbZVk2/nbIdHV6WGA2qqt72+dYmAjacWoD4Nuf5rXR82K/Mi3RVErWAZhuS5v
	 HKnawGg93aJgEovEs+0BE0oJPpma2DFpRHwd8v8kQcbALIu2TNj2C0tDHyMrELuNJOlYp
	 d6fm2xChAhg2F5eXRgOvQ8LL94szjFPvZdbqecZPuItYEM6nVgJkWCjIrUtzdxcJC0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VC0viFXL;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0104E606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0104E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VC0viFXL
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c40f29667e6so336327266b.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793549073; x=1794153873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VpiNcJITzAimIo2l/+wZFEDSgKEuus8b7eMSXpkoRXc=;
        b=VC0viFXLFmPDshxR/N5FxKPy4HMB1OO9XhcRtrnsEmyh7E3VA6KtpB/lZ4as7AmAuF
         Ynfltmmtv7k4kWSdti7LwztLH6D9gmO9ekNx+qK3VhPEAz9tNBxV3WUopwYFWdngwJ4Z
         2rHcq4pAV+WKauUlWCTiVlmQbIycLictWM+HdV3uxEWTQR5D6o/Ki7hcn1GWFQeVKZTb
         OBvDkluNnTSzb67P+yCKjIIAtNzx++7qpoJFrZYFao+xBfqXRi77l4Z+Xc+SdWU6u6iM
         leqT1pi2GUmBW1gi9Ms7OA6QNyyGwPFNbkiDkMyVyOrNN6Kfa7khw+Kn3KPI6VtY38QM
         fcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793549073; x=1794153873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpiNcJITzAimIo2l/+wZFEDSgKEuus8b7eMSXpkoRXc=;
        b=dFcvOEo5RKx+1rhKM3ke/cf2shYFt1Lbe/QNNXzGEr9C8rf0pdZoSl4Kv7bTdCCxhM
         j6qjuPaiCnoLxgWwPx9sRsKAF6enCDaxkEnxxGeUnOofiDBjc9gBAAc0hEY6eiuUyRrZ
         TPy0N0gNOvF3VtGzWD9NYjFli6bJNKJPTRZzdMzfjAwSlxugQCuzR4hdPmrt+BzewAYH
         C/1OdCfQ0XLKVnjVZlgD7ItuHJj+LprpNbUuP620DirnN/SfaDHfShCMg3024ojlLmUV
         vA/xg/m9KciDThdG3pu2Kuyt4JvtVarpmwh4a+8TB2jcEuT7WtoIZryz2zdzkvFNmgv6
         mMcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLEERtKCCm8FZTAeqU3AmE5uTLmtHKHwi5m1O/p5JlLMTtV6kNqvFy4n5qQibEn14oozmGAwELbwlTR4I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ1dHJyFgemehLZRvkqlAjnseREGeB8uq2Btkc41kILi1HqHd8
	W4E4Z6xWxgF40g1LjU7uDjZfxUntv8IAN1Q5hMFhN/IGMxOnwMDaPYFh
X-Gm-Gg: AYBFou2P5iVYsOAuKl6qPVNDSXLArSUBWRt5JIgihx/CCT1Lf6E+ewdQIUCPmt1mLPU
	e1du6HOCQMa5ojLSCuOk4FHl3pNmvNsNs/DKR3v+Ls+Yv5Ot8wZ+CyZ2QpSjBhCWnfRCegj7Ry3
	fmWkfA7LeDcKp4A+TWER4Wf3bFzCEvziQpzZODSYkFLg9jkF6zMFyQGDeMGtnVzwVMrQWUFeRUN
	VOFvycvSaa3mvuKUvrXdkHFS/F6EqgGTANxekhgdvhDDQUaGEgV2uKDXttWeG+XgPRI7Q0tlAPC
	erQd4NUo4Wug92lqivoKYk0ADIdCQs1n1o3+mle5tF2zkdb5SgDVRr0QaR3pKqIXjK/u3vVPA8/
	KYtba9pLp+ZrOX32AIfsTPa8Sgr4VWVmoBtYMw/4vqxdpHgl3qp/40zabIeq5y1b7QQtP2/YFbj
	M//4AxA1MynBQ6md/YYWLP8t5lSmfKf1Jdo/Txs0wWC3Gi0XgAApq3QdWyXdcqf1QniZiyVPC0m
	GGu+cki+oSzJwJyiD/w2noBJs0z4ZpvZ7qTKBroFMfzzfUaxuZTK/YvjLlV8fCXwpcE44rDBCQn
	l+N9K+SK1oJkfPBzFzAmJJ71QkEDACb7ACg+36SRU/ByoLCUFFpbMO8dJNY6THUby23wSvvpv+S
	Q715aABBW2vG0Lx3jSeLKdV+qzDysOC3AAmiXeHw=
X-Received: by 2002:a17:907:84c:b0:c46:ba0d:3728 with SMTP id a640c23a62f3a-c4ca7a408c7mr613297866b.18.1793549072714;
        Sun, 01 Nov 2026 08:04:32 -0800 (PST)
Received: from localhost.localdomain (dynamic-077-188-130-121.77.188.pool.telefonica.de. [77.188.130.121])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc174c0sm287957166b.8.2026.11.01.08.04.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 08:04:32 -0800 (PST)
From: Maxim Muzafarov <maxmuzaf@gmail.com>
To: linux-mm@kvack.org
Cc: Maxim Muzafarov <maxmuzaf@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Yu Zhao <yuzhao@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/1] mm/mglru: MADV_RANDOM page cache never ages and thrashes the oldest generation
Date: Sun,  1 Nov 2026 17:04:26 +0100
Message-ID: <20261101160427.85701-1-maxmuzaf@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Hi,

It looks like I've stumbled upon an awkward behaviour. When MGLRU is
enabled, page cache faulted in through an MADV_RANDOM mapping goes into
the oldest generation, and the refaults land there at the same rate as
well. In my tests bpftrace shows the generations stay at seq 0-3, with
no aging attempts and no new generations during the workload run, and
/sys/kernel/debug/lru_gen_full shows for generation seq 0 15758245
pages evicted and 15580028 pages refaulted, which is 98.87%.

At the same time, a file read through a normal mmap lands one
generation higher and none of its pages are evicted. It stays cached
until the end of the workload, and the randomly read working set
shrinks. With lru_gen disabled, the CLRU evicts the file
instead, and throughput recovers 20-30 seconds after the file was read.
I would expect the same behaviour for MGLRU.

I first saw this slowdown on a single-node OpenSearch 3.6 (Lucene 10.4)
HNSW vector search workload [1]. The node had about 2.8 GiB of page
cache for a 2.9 GiB index, and Lucene maps the .vec and .vex files with
MADV_RANDOM. Kernel 7.2.10-200.fc44.aarch64.

Search latency and throughput on a single-node OpenSearch:

                         MGLRU on   MGLRU off
  p50, ms                   286.0        73.6
  p90, ms                   512.1       135.6
  p99, ms                   687.0       191.0
  queries/s                  27.4        87.1

Disk reads, same runs:

                         MGLRU on   MGLRU off
  major faults/query         1484         325
  disk reads/query           1484         325
  read size, KiB              4.0         4.0
  disk read, GiB/run        509.6       111.5

This is clearly visible on the page cache chart [2], where "blue" are
page cache pages mapped into at least one process's address space and
"orange" the rest of the page cache.

Then I reproduced it with a synthetic HNSW-like query script in python,
and later with fio alone, on 7.2.10-200.fc44.aarch64, 7.2.14, 7.2.14
with the MGLRU-FG v4 series [3][4], and on mainline v7.3-rc7.

Kernel and setup
----------------

Arm64 Lima VM (vz) on an Apple M1 Max host, 8 vCPUs, 16 GiB RAM, virtio
disk, btrfs, 4K pages, THP madvise. Tests run in a 2 GiB memcg with
swap disabled.
CONFIG_LRU_GEN=y, CONFIG_LRU_GEN_ENABLED=y, CONFIG_LRU_GEN_WALKS_MMU=y.

Reproducer
----------

The script below reproduces the stall with fio, MGLRU on (y) or off
(n). 4 fio jobs read the vector file at random through an mmap in a
2 GiB memcg, with MADV_RANDOM or no advice (normal).

At t=90 a second fio reads a 600 MB cold file twice through a normal
mmap. With MGLRU on and MADV_RANDOM, the cold file stays cached and
IOPS doesn't recover.

./run.sh <y|n> [random|normal]

-------
#!/usr/bin/env bash
set -u

usage="usage: sudo $0 <y|n> [random|normal]"
lru=${1:?$usage}
advice=${2:-random}
case $advice in random) hint=1 ;; normal) hint=0 ;; *) echo "$usage" >&2; exit 1 ;; esac
out=$(dirname "$(readlink -f "$0")")/results/$(uname -r)/$lru-$advice.txt
[ ! -e "$out" ] || { echo "$out exists, move it aside first" >&2; exit 1; }
vec=/var/tmp/mglru/vs-vec.bin
cold=/var/tmp/mglru/cold.bin
unit=mglru-06-$$
cg=/sys/fs/cgroup/system.slice/$unit.scope
log=/tmp/mglru-06-$$.fio

workload() {
	fio --name=vec --filename=$vec --ioengine=mmap --rw=randread --bs=4k \
	    --fadvise_hint=$hint --random_distribution=zipf:0.8 --numjobs=4 \
	    --group_reporting --time_based --runtime=270 \
	    --status-interval=1 --output-format=terse --output=$log &
	sleep 90
	fio --name=cold --filename=$cold --ioengine=mmap --rw=read --bs=4k \
	    --fadvise_hint=0 --loops=2 > /dev/null
	wait
}

memstat() {
	awk -v key=$1 '$1 == key { print $2 }' $cg/memory.stat
}

cached_mb() {
	fincore -nb -o RES $1 | awk '{ print int($1 / 2^20) }'
}

render() {
	local t=$1 kb faults refaults activated
	kb=$(tail -n 1 $log | cut -d';' -f6)
	faults=$(memstat pgmajfault)
	refaults=$(memstat workingset_refault_file)
	activated=$(memstat workingset_activate_file)

	printf '%4s %9s %9s %9s %9s %7s %7s\n' $t \
		$(( (kb - prev[0]) / 4 / 5 )) \
		$(( (faults - prev[1]) / 5 )) \
		$(( (refaults - prev[2]) / 5 )) \
		$(( (activated - prev[3]) / 5 )) \
		$(cached_mb $vec) $(cached_mb $cold)

	prev=($kb $faults $refaults $activated)
}

mkdir -p /var/tmp/mglru
[ -f $vec ] || dd if=/dev/urandom of=$vec bs=1M count=1905 status=none
[ -f $cold ] || dd if=/dev/urandom of=$cold bs=1M count=600 status=none

echo $lru > /sys/kernel/mm/lru_gen/enabled
sync
echo 3 > /proc/sys/vm/drop_caches

mkdir -p "$(dirname "$out")"
exec > >(tee "$out")
echo "MGLRU $(cat /sys/kernel/mm/lru_gen/enabled), kernel $(uname -r), $advice advice, cold file read at t=90 s"
printf '%4s %9s %9s %9s %9s %7s %7s\n' t IOPS majflt/s refault/s activ/s vec_MB cold_MB

export -f workload
export vec cold hint log
systemd-run --scope --quiet --unit=$unit -p MemoryMax=2G -p MemorySwapMax=0 bash -c workload &

until [ -e $cg/memory.stat ]; do kill -0 $! 2>/dev/null || exit 1; sleep 0.1; done
prev=(0 $(memstat pgmajfault) $(memstat workingset_refault_file) $(memstat workingset_activate_file))
for t in $(seq 5 5 270); do
	sleep 5
	render $t
done
wait
-------

Results
-------

v7.3-rc7, cold file read at t=90

lru_gen on, random:
   t      IOPS  majflt/s refault/s   activ/s  vec_MB cold_MB
  85   4966675         0         0         0    1904       0
  90   4863829      1150      1158         0    1729     277
  95    174236     30664     30669         0    1408     600
 120    202080     28161     28163         0    1408     600
 180    207005     26665     26667         0    1408     600
 270    226341     22677     22669         0    1409     600

lru_gen off, random:
   t      IOPS  majflt/s refault/s   activ/s  vec_MB cold_MB
  85   5007909         0         0         0    1904       0
  90   5150972       140       228        51    1873     139
  95    188806     29509     29504      9283    1413     600
 110    342921     31803     31802     23547    1697     313
 115   2563389     15857     15849     10540    1903     107
 120   5157256        31        31        27    1904     107
 270   5179181         2        28        27    1904     107

lru_gen on, normal:
   t      IOPS  majflt/s refault/s   activ/s  vec_MB cold_MB
  85   5093044         0         0         0    1904       0
  90   4887136         0         0         0    1904      39
  95   2612769      3665     88721      6458    1904     109
 100   4997923         0         0         0    1904     106
 180   5134344         0         0         0    1904     104
 270   5025222         0         0         0    1904     104

lru_gen off, normal:
   t      IOPS  majflt/s refault/s   activ/s  vec_MB cold_MB
  85   4866859         0         0         0    1904       0
  90   4466107         0         0         0    1904     103
  95   2378250      3027     34135     33956    1885     127
 100   2734588      5431      5520      5500    1903     109
 105   4933296        62        69        67    1904     104
 270   4822353         2        17        14    1904     104

As you can see, only MGLRU with MADV_RANDOM stalls, at about 220k IOPS
until the end. It activates no refaults, and cold.bin stays at 600 MB
while the vector file stays near 1408 MB. With MGLRU off, the same
workload is back to ~5M IOPS 30 seconds after the cold read. With
normal advice, both LRUs recover within 15 seconds.

With MGLRU and MADV_RANDOM, vs-vec.bin reads in my python reproducer
drop from ~2.5M/s to ~300K/s after the cold read and never recover
(chart [5]). On the same kernel with normal advice, MGLRU recovers
normally (chart [6]).

What I traced
-------------

On 7.2.14 with bpftrace, every MADV_RANDOM fault and refault is
inserted in the old gen. lru_gen_enter_fault() sets in_lru_fault from
vma_has_recency(), which is false for VM_RAND_READ, so refaults are
never activated. The aging walk and the look-around on eviction skip
these mappings too.

On 7.2.14 with bpftrace, the oldest generation is evicted and refilled
at the same rate, and never empties. min_seq doesn't advance,
fentry:try_to_inc_max_seq is never called, and the window stays at
seq 0-3.

On 7.2.10 (fio, no tracing), one manual aging step, "+ memcg_id 0
max_seq" written to /sys/kernel/debug/lru_gen, evicts the cold file
within 10 seconds.

I also tested the MGLRU-FG v4 series [3][4] on top of 7.2.14. The stall
is the same, refaults on the MADV_RANDOM mapping are still not
activated. The series cover letter [3] describes this as intended,
so I'm not sure what the right fix is here.

RFC patch
---------

Patch 1/1 is a draft against v7.3-rc7. I'm still not sure it is the
right fix and would appreciate feedback. The simplest thing I found is
one more condition in should_run_aging(), which does the same as the
manual aging step above, at the cost of a few more reads and a
comparison.

In short:

1. Run aging when eviction only recycles the oldest generation
2. Pass the evictable size that get_nr_to_scan() already computes down
   to should_run_aging(), so lruvec_evictable_size() is still called
   once per pass and not on every batch

The module parameter lru_gen_age_on_thrash and noinline was only for
A/B runs and bpftrace and comparing results.

Results with the patch
----------------------

The fio reproducer from above on v7.3-rc7 with the patch. "checks" is
the number of oldest_gen_thrashing() calls in the last 5 seconds, and
"gens" the number of generations added by aging, both from bpftrace.

lru_gen on, random, lru_gen_age_on_thrash=Y:
   t     IOPS majflt/s refault/s activ/s vec_MB cold_MB checks gens
  85  5019235        0         0       0   1904       0      0    0
  90  5073570      377       384       0   1764     254      0    0
  95   130923    20534     20527       0   1418     600   2441    0
 105   218624    23462     23456       0   1418     600   1785    0
 115   178889    26035     26043       0   1418     600   1338    0
 120   175238    26918     26910       0   1418     600   2086    1
 125   256621    27773     27780       0   1418     600   1959    0
 130   253813    24509     24501       0   1677     342   1910    0
 135  2678888    11649     11649       0   1904     116   1914    0
 140  5064423        2         2       0   1904     116    297    0
 180  4872187        0         0       0   1904     116      0    0
 265  4939524        0         0       0   1904     115      0    0

The check returned true 3 times, and aging added one generation, at
t=117 (seq 0-3 to 1-4).

lru_gen on, random, lru_gen_age_on_thrash=N:
   t     IOPS majflt/s refault/s activ/s vec_MB cold_MB checks gens
  85  5127299        0         0       0   1904       0      0    0
  90  5290342      409       417       0   1822     196      0    0
  95   151082    27372     27372       0   1418     600   2739    0
 120   251683    33784     33789       0   1418     600   2425    0
 180   252607    31539     31542       0   1418     600   2314    0
 265   223364    28211     28220       0   1418     600   2290    0

The recovery is still slower than with CLRU. With the patch IOPS
recovers at t=135-140, with CLRU at t=115-120. I think the patch adds
this delay, as the first aging step needs up to one lruvec worth of
refaults after the stall starts.

In the OpenSearch workload reclaim runs from the start, so the counter
is already close to the threshold when the cold file is read, and the
recovery is comparable to CLRU (chart [7]).

The threshold could be lowered, but it's not clear to me yet how to
pick it right. The patch is a draft to get feedback on the approach.
Any thoughts?

Thanks,
Maxim Muzafarov

Links
-----

[1] https://docs.opensearch.org/latest/benchmark/workloads/vectorsearch/
[2] https://gist.github.com/user-attachments/assets/cbfa5c17-0a89-458f-b816-4d1bb72cb97c
[3] https://lore.kernel.org/all/20261016-mglru-fg-v4-0-2106750c0bfa@tencent.com/
[4] https://github.com/zen-kernel/zen-kernel/commits/7.2/mglru-fg-v4/
[5] https://gist.github.com/user-attachments/assets/f65fbbf3-a30a-464f-8535-29d39e0dff43
[6] https://gist.github.com/user-attachments/assets/5d28512d-3a1d-4475-b20e-3690a8c9e196
[7] https://gist.github.com/user-attachments/assets/41b7aaa1-5e9c-43dc-8fc1-09d2df52f8d7

Maxim Muzafarov (1):
  mm/mglru: age when the oldest generation is thrashing

 mm/vmscan.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.56.0

