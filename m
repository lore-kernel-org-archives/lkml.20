Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.70.183.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893848;
	b=E5mMW6IcQI/Nb+7uJeComtDQDLFUL2NG1SyW5X7rChHGgRbKBMMylPye+lxH6LyIRLo5
	 lQyvPe8e83G77ZolqX4QJvh7bEounFh2sXpkX6IeEXJGcOGtCX5abYe9R8OqYDfMdLZyr
	 nExxXf2uDjSo0IgRPsGmFD9zz3zOrlTm7aT7HAU/7tdoOO3BGVC0a5HnaX1on2AQtl8H9
	 8oqJ6FUr3sT/CP3LlcJdPBPN6a2PJzFEu35qdMnc8RBi443OGyXbPrJTsnZz1YDzyarth
	 wPjc/jLmBibY1V8ecy9IJd5Pba52NZRoAf5kizyYYjt3mcfZZl6dGs3vCK+CM37cTZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893848;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-GND-Sasl:X-GND-Score:
	 X-GND-Cause:X-GND-State;
	bh=6VvAd2C6q9L0c6ZHWIYU85EEyIr/xJdmiDJqZZrUbaA=;
	b=2X2eSIRUbPCOw4LJLJVbiMwdtxuNb59mOUg9wskYWL1yJW8Ez9pE0EDFQFONexvT9aaZ
	 H2j0/ejIqn8k74epBsiV7btt5+JOivC3mIAPYdbGRFy4w1R2/WU5R3yfgk/ZIyPZunGc1
	 obN5d86y1V/HFc9t6xhdsZf58rM20TzQ1WvX395b6e9VS3i4A5+eHcrLhepsX41T9B+AD
	 GXswtdkUxCW6rZ9VlQPxfcK4UaKmb0j49GFRqQwI7aJFuYq4ynM8EJuMm9ZOq7qtCRdOG
	 IOaI0eoPuUkhKUugEpHk6ko3VMxd2VsyzFxzUGrijeBKryHzMKmxNG3YxK+2N52XEoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ghiti.fr;
	spf=pass smtp.mailfrom=ghiti.fr;
	arc=none smtp.remote-ip=217.70.183.201
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D22606D839
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4D22606D839
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99A803ED17;
	Thu,  5 Nov 2026 15:50:34 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Chris Li <chrisl@kernel.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Youngjun Park <youngjun.park@lge.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH v2 0/1] mm, swap: only prefer nonfull clusters on synchronous devices
Date: Thu,  5 Nov 2026 16:50:16 +0100
Message-ID: <20261105155032.240457-1-alex@ghiti.fr>
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
X-GND-Sasl: alex@ghiti.fr
X-GND-Score: -100
X-GND-Cause: dmFkZTE254WFeUBZNzyFDcG8WpBR+MTxZeLStc7bGzyDg2x6s+gJUsC3gFmc98hZ2rE3AhBrTRk09vonYEfqg58KXfuKzwuM+NCKIn9qYiAFFwam9elNd2Pf4Zut0PjNkDOsho+MqFKIFhvr7tJzwtC7WawQnSvPxPQAjWNXX3gwg64huH6BhdtE8wHyzGqmGB/4LdOzKSdB4Vn08iiC6PzLm5+8CjFislUvGbRGq5dsP8ryb9VszPJAgZ40sazxbIHfeirESRma8ru0Oej8L22+FU3oGVXLev++teqrquEva6TKlEBifh0DsJUntrBSkK3vw2plrDE95L8jkw0ktfNL7rTTFxMSO0fUaxmDJn+SURROO7nsqvp9EFNJjD4+EJP7JTVvXEY3Oo7wXEFjgfPOpbz3LI7tUn06UtCEDZjkB9mOmIWZ67xRTCObhZtyKuS53HzKfyswzeWMka7PwWYz5jk+bJKpPDPsbHsc+aAP1DTAktbCfgKR50GQRt6u7uiKGKCgVAF0BR36sJODpHbBgEsUqpQHB2s8wnCc0ZhvxoOIymVZgpnermDV+ed4a6p4c6pbRWyTt8h18ihZoBcfiEXDIg2Fat/ZS7uuLRTbzq0GvHK8TydwaaacmbX/AHcf1zZKCqXGZ/p729HNE+9Od6N7vTPoz/X6rRREqD3vdYwjtA
X-GND-State: clean

7.3 regressed swap I/O: for the same swap volume, a workload that
rewrites swapped out memory sends many more requests to the device.
mysql/sysbench in a 256M memcg swapping to an NVMe partition, 7.3
compared to the previous version:

  device read requests per transaction        +59%
  device write requests per transaction       +27%
  throughput, iocost off                      no change
  throughput, iocost on                       -19%

Two commits interact:

- Commit 9a42aed48421 ("mm, swap: prefer nonfull over free clusters"),
  in 6.18, makes allocations fill the nonfull clusters of their order
  before taking a free one.

- Commit 3cedb745d354 ("mm: clarify the folio_free_swap() for
  do_swap_page()"), in 7.3, frees the swap slot on an exclusive write
  fault. 7.0 to 7.2 kept the slot, but only as a side effect of commit
  4b34f1d82c65 ("mm, swap: free the swap cache after folio is
  mapped").

The freed slots leave holes in full clusters, which then go back on
the nonfull list. Reclaim allocates slots one folio at a time and
merges the writes afterwards, so a batch of LRU-adjacent folios gets
scattered over those holes and is written with many small requests.
Readahead later finds those pages scattered as well, and needs more
read requests to bring them back.

The RFC [1] listed three fixes, which perform similarly:

A. Revert 3cedb745d354. This keeps the slot on write fault, but undoes
   the intent of that commit and keeps swap space pinned under dirty
   pages.

B. Below 50% swap usage, make order-0 allocations take a free cluster
   before a nonfull one. This is what the allocator already does, at
   any usage, on swap devices with discard enabled (swapon
   --discard=pages). The threshold is arbitrary and it stops working
   as swap fills up.

C. The RFC patch. Reclaim tells the allocator how many pages of each
   small order the batch is about to swap out, and those allocations
   then follow contiguous free slots.

In the RFC thread, Kairui suggested another option, which he prefers
[2]: keep nonfull-first only on synchronous devices like zram, which
don't merge I/O and where filling holes first keeps the free clusters
for large folios, and go back to preferring free clusters on every
other device, as discard devices already do. This is what v2 does. It
is a few lines, needs no information from reclaim, and performs as
well as C.

Same workload as above, each fix relative to its base kernel:

                                              RFC (C)      v2
  device read requests per transaction        -12%         -14%
  device write requests per transaction       -36%         -48%
  throughput, iocost off                      no change    no change
  throughput, iocost on                       +41%         +33%

Changes since RFC:
- Replace the batch-aware slot allocation with keeping nonfull-first
  for synchronous devices only, as suggested by Kairui.

[1] https://lore.kernel.org/linux-mm/20261022145615.2184343-1-alex@ghiti.fr/
[2] https://lore.kernel.org/linux-mm/CAMgjq7BFbXEKEt9faj_rg5AStfLkpJ0j57EQOOJ+L3-w2xRvtg@mail.gmail.com/

Alexandre Ghiti (1):
  mm, swap: only prefer nonfull clusters on synchronous devices

 mm/swapfile.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

base-commit: afb4eea28037fa55c4560313ecbd8a1e1da8369a
