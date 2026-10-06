Received: from mta1.migadu.com (out-56.mta1.migadu.com [95.215.58.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DF73B1B4
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 00:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791246197; cv=none; b=dEHzyAEZROL/xFEVJpoxU0JDX6Isg67SZfB4RRqZi5WXWNbNPXCof2XR6r3gxHFJjrVUqBOQhX7Otvu43MN92ktnBV2B9R9WOAAF1JQay0xJOGIemHc/OyHkK9X/7YDoe99W8ufm8zD1UpvLASDaVtzSIIUs2KDKGri3Wk8+ZFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791246197; c=relaxed/simple;
	bh=qYGtmyOzc8QJF698ZKmKjTA6i8gvqtU2gG9Cr/NqVls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y0EQRj44XsjyFyn6CRN3taVfZEqK87K9SzrgcQUjdACRHgpH3cTt0S5q7CKfz6lS5G9w6fM2Xw0QZGjRYFXBiS8ySFsknh4XQcgOqGcylswLn8ipYXeMRehaYEgYnaZbHH/pZ04sbFajYzpol43/j1eHgv6hU8nTmEsDMacxyQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VcYERI7s; arc=none smtp.client-ip=95.215.58.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VcYERI7s"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qYGtmyOzc8QJF698ZKmKjTA6i8gvqtU2gG9Cr/NqVls=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791246191; v=1; x=1791850991;
 b=VcYERI7s+zQszVu2cM1le84SH8QTg3xnoMpKvPe5SngAv6uMclMoYdPuc1U5pdzFVFOlSNWL
 OcAYjp+l12zDRut4dSWiO/g8aUn0Fk0G2j9qbGtgmxXYoDuQ/BS4Ceoxb8uC8iTWGmmIk0F/9JK
 XJ6nYsjkanAE8kPh7o/PPA2I=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 4818ba5c18e1714d;
	Tue, 06 Oct 2026 00:23:11 +0000
X-Mizu-Trace-ID: 4818ba5c18e1714d
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	chengming.zhou@linux.dev,
	dsterba@suse.com,
	hannes@cmpxchg.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	nphamcs@gmail.com,
	terrelln@fb.com,
	yosry@kernel.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	senozhatsky@chromium.org,
	kernel-team@meta.com
Cc: Usama Arif <usama.arif@linux.dev>
Subject: [PATCH 0/2] mm: zswap: reduce request contention on loads
Date: Mon,  5 Oct 2026 17:22:49 -0700
Message-ID: <20261006002307.2669023-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stores and loads share a per-CPU acomp request and mutex. A low-priority
store can be preempted right after the compressor drops its stream
lock, while it still holds the zswap mutex, and a higher-priority load
on that CPU then waits for the store to run again. This follows the work
from Sergey Senozhatsky's zram series which splits it for the same
reason [1].

Patch 1 gives compression and decompression separate requests, waits
and mutexes, so loads no longer wait for stores, though they can still
wait for each other. Patch 2 decompresses with an on-stack request when
the algorithm is synchronous and needs no request context, which covers
all in-tree software compressors, so those loads take no zswap lock.
Asynchronous algorithms keep the per-CPU request and mutex. For software
compressors the series allocates the same number of requests as before;
each per-CPU context grows by 72 bytes, and the load path is about 270
bytes deeper on x86-64.

The series does not fix two related cases:
- Stores still serialize on the compression mutex, so a high-priority
  task that reclaims (direct reclaim, MADV_PAGEOUT) can still wait for
  a preempted store.
- On PREEMPT_RT the codec stream locks are preemptible, so a load can
  still wait for a preempted store inside the codec.

The numbers below are the slowest read per run, as a median (min-max)
of 5 runs. Each run is 12 seconds in a zstd VM with lazy preemption,
vm.page-cluster=0 and swap on /dev/ram0. With 1 vCPU, four nice +10
workers page memory out and read it back while a nice 0 task spins. A
nice -19 reader pages out its own buffer and measures how long each
read of it takes. With 8 vCPUs there are 16 workers, 8 spinning tasks
and 8 readers.

              Before series (ms)      With series (ms)
  1 vCPU      22.3 (21.6-22.6)        0.97 (0.72-1.4)
  8 vCPUs     314 (97-2542)           7.0 (5.0-98)

Reads over 10 ms fell from 26-35 per run to none with 1 vCPU, and from
3-18 per run to at most one with 8 vCPUs. The benchmark and test programs
were written with the help of an LLM.

[1] https://lore.kernel.org/all/20261005122036.718976-10-senozhatsky@chromium.org/
 
Usama Arif (2):
  mm: zswap: use separate compression and decompression requests
  mm: zswap: use stack requests for synchronous decompression

 mm/zswap.c | 136 ++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 88 insertions(+), 48 deletions(-)

-- 
2.53.0-Meta

