Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.70.183.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680989;
	b=JxBfkp906ZAPdaO3BzIagCejhuVzivf3RDEF5IQ6WrQFqCMUMMnEVmAuPErVk/7aDL/J
	 VPM26w+uPJ/uL4bJaiJYCThKMls2aRe3csh+F22UJh5dtfWRsIO8jM7sAcAQPFfrHB2pp
	 oZCXVVUAYruVvAmXghj7O4ZJYBbARomvkknNQMTS6xDJu3NU5KLadLJKAJLtVcT3s9iCp
	 EaJaX/r0TRwcuwhgc2BMElOF8gGswya0DeEvbObKUaxyddU1MQp3KRxVtp4ltAvvbp+3W
	 7VcHmXLk/SCz0W8ooIm3ONtLjT9ZgQbQzprDXit3r1JxkB3ZH+ujsgdjNwYuXWfsc0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680989;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-GND-Sasl:X-GND-Score:
	 X-GND-Cause:X-GND-State;
	bh=Bo7M4JhjEAp6ZI2fBYkRnkPkrD1NgLG4BN3e/nf8n7o=;
	b=aDWKVNsmawctNRw/RIK+iV0fToJNvMohbgr4xKgToE+y/PUn0MJ0bvaJoQ3XCF/WgdL5
	 bVVzgtpkNsWb2AXHX3mcjndhCEBlW7hwjHHvzfSkQFRZqa92CG4s8eDlkoULUn93frwFS
	 prtosg6DndbCMqOGgSH2U48kbOcCTmH0MW7CSw2u4spkrLCGNbexeI6iGBFHgF9k9ChCL
	 ver9HaEdUS7rGwrWb6j1Qbn0dvJsGD+9/WOz6BvOtnKAiLkZYqqG4W1LuafUR4YHzsmjH
	 ih4tzic0YoCg74jDmoWyaAdhGDNHMn5RSG3Uir2LAkBWtE599zAwBC44gMolcOXio/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ghiti.fr;
	spf=pass smtp.mailfrom=ghiti.fr;
	arc=none smtp.remote-ip=217.70.183.195
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EBF606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55EBF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id A80611F6B5;
	Thu, 22 Oct 2026 14:56:17 +0000 (UTC)
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
Subject: [RFC PATCH 0/1] mm/swap: keep reclaim batches contiguous on swap
Date: Thu, 22 Oct 2026 16:54:45 +0200
Message-ID: <20261022145615.2184343-1-alex@ghiti.fr>
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
X-GND-Cause: dmFkZTFMd1FM7BbvTA8TCUewrtd1V/1uyK/ULWQ1OY6oegAXsYuboL5juFNAuEozbSuWxXyn3ZpEs16OR9scsQhOOe6quwa1WdK/TeAxD6GuZOyA6DNtoYHmF8D8DQxn9aIPXvLMkYPIijfcxdlh+riLJ17Z5xMNsJE8uI7naZ1//WmJe79ty0aZtgNSYkgOVgzRxsZcG8ooR1CWTdmq0tI6kLAS9IYVEwke3c/ljUJMWmA8Cb4eHcYrdXkpx2GQCMhiLkbNIrJS+QvZwx6jNUZwFAvRhEwazrbTDy8O89f62t7puuFBdjN35sp683cCxJypVYs3+s3TgIL1JAy5SfM4uXWhm09ZV6FSy864o32f8ey/ZG8SCtQ9+huwsXEMSyBZ9m4vSMkWZxph9IOZf40yMeyPT0C300GGC9BsQZrKrKXJC1KVFNZOWMf/RBPBrdrIIY3fyV2x5BJCY5TR8sevFUfnTD36G22WlmSnbUyblF276ven69i7LLHaXDNpHbScQGkvDV53qaFQqTUdFQG+OwHNbB8NAn3QbzlW47jWDJI4LCtmSCcxHw5AnxhgUZ7Fc7cExO/3Fnai9aCA1gqZBXJ0YTtugdctUpaHKlHXWRFpUtGZ7wdDsCaSfWBH+whL4Mi7m3ytR1yPyNFvZpHTWnPNroDuzmMl63Uw58ESCFcaNA
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
  in 6.18, makes order-0 allocations fill nonfull clusters before
  taking a free one.

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

I tried three fixes, which perform similarly:

A. Revert 3cedb745d354. This keeps the slot on write fault, but undoes
   the intent of that commit and keeps swap space pinned under dirty
   pages.

B. Below 50% swap usage, make order-0 allocations take a free cluster
   before a nonfull one. This is what the allocator already does, at
   any usage, on swap devices with discard enabled (swapon
   --discard=pages). It is about five lines, but the threshold is
   arbitrary, it stops working as swap fills up, and it applies to
   every order-0 allocation, using up the free clusters that
   nonfull-first keeps for mTHP.

C. This patch. Reclaim tells the allocator how many pages of each
   small order the batch is about to swap out, and those allocations
   then follow contiguous free slots, in a nonfull cluster if one has
   them and in a free cluster otherwise. Nothing is reserved, there
   is no threshold, and nonfull-first is kept.

Same workload as above, 7.3 with C relative to 7.3:

  device read requests per transaction        -12%
  device write requests per transaction       -36%
  throughput, iocost off                      no change
  throughput, iocost on                       +41%

I think C is the way to go. I just add the patch to this regression
notice so that we have an idea of what it takes to implement, the
implementation may not be perfect.

I would welcome other ideas.

Alexandre Ghiti (1):
  mm/swap: allocate contiguous swap slots for a reclaim batch

 mm/shmem.c    |   2 +
 mm/swap.h     |  10 +++
 mm/swapfile.c | 211 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 mm/vmscan.c   |  11 ++-
 4 files changed, 229 insertions(+), 5 deletions(-)

base-commit: fcec4f4bcc1101dbd7e3aff267856b3bbfe128c6
