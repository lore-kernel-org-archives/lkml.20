Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706533;
	b=h0h1/6dtyk8A1VoB5i+iCnIEGMg0/cCu0GFYW0ORjIomsiAFXYZX4H8BiOmPfS+0XjQp
	 vNyiZhPBwjH7t23qkOO5gA02SS6cqkKX5xu+/IOjkF0+a+9zMEPUbgSePgvGRSYIDWa3e
	 3B0J9pHTzu7f/yJZRHd9eQt29ofwgSMEYNpYqG+N/memV+1+QO6nAIKdAN+n/RfS5K/lk
	 alq3MbHJQQVwIl1pxCMzxzygw6faE+RqWf3C0LW006BWznf0M4SALNGdqfc7IjZ+fsEMq
	 2nni4JbKFoZuZ0/oLvbQPUNEbEZFr5fpQpLVRPO5TIq3JHoRkM2JvJxydB673uQg+vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706533;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dR5/JZntk+U4h5/aN1mZNZOoNy870AQ8Dt4+e9dHiWk=;
	b=NaegYnInmiAqQqPxfpyRbkJ2QJLuDOXp8C9/1pAmzfIU6kXhrhZLgjBIiKwofPexZ8u0
	 tKMQD3n6ZTDrd13YJbgKK5N2NZJPciZOhC4O2IvqJaE6DllZTsfl6dsWVFocFpnxwJ2cb
	 cRpfC6Ayzn7KClT2Tg4eKpP7c5gChzBLzzpAAYM0G1TjBh+4RF8c2gGjup+M0EBEPpUOh
	 niXZd7A50gLRN7vaYSA1+ahw8gSavGv2qm/YRmLiskv0yGzCMn8rkDIAXc3/zNFcwH+WH
	 zhdS3m+FWLdsM2EpSWR+p7aJR9pM+vNcX5kmASqF1mm40T+P5rHBqkwHT5I0yG2fyoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EGUHcFnr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186D1606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EGUHcFnr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5B51F01825;
	Thu, 22 Oct 2026 22:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792706532;
	bh=dR5/JZntk+U4h5/aN1mZNZOoNy870AQ8Dt4+e9dHiWk=;
	h=From:To:Cc:Subject:Date;
	b=EGUHcFnr7xc/2FhXy8vW9EKdFMBOrUFYAiSSVgRcVCJ8KCZVL7QvgGRU5AiYbBJ8w
	 vu9+nE7DIar8Rz00xAuNwdxA2y16Yk9NEdUT937aN90RGWM5HHyVlR/k+Z+/eT6sG9
	 La4ZRwRjO/UjBRh64ltXkBsWybT0wR520MkkYn9jY6YLNcZR3v96BOxDsNH2edG/NK
	 3m0Tkdlu8EbwKwhLd7RWKkUjxqgvPiAG49VUvwZ54Uny9z9BhjLb+JFZ+oizgUd08m
	 HwZ4fNIIEzZC2FP7CT0e+smhpSLKcBVhlaHm+Hnw/cQZJknqIf823NVMfNrj/G9Jqh
	 zy3XjWe6mFyTA==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: hui.zhu@linux.dev,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	linux-kernel@vger.kernel.org,
	ljs@kernel.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	ryncsn@gmail.com,
	shakeel.butt@linux.dev,
	weixugc@google.com,
	yuanchu@google.com,
	zhuhui@kylinos.cn,
	baoquan.he@linux.dev,
	liuxiang.277@bytedance.com,
	wangzicheng@honor.com,
	lianux.mm@gmail.com,
	kasong@tencent.com,
	liam@infradead.org,
	surenb@google.com,
	mhocko@suse.com,
	rppt@kernel.org,
	zhangbo56@xiaomi.com,
	lyugaofei@xiaomi.com,
	ridong.chen@linux.dev,
	kunwu.chan@gmail.com
Subject: [RFC PATCH v5 00/14] mm: mglru: fix swappiness behavior
Date: Fri, 23 Oct 2026 06:01:49 +0800
Message-Id: <20261022220203.91911-1-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Classic LRU respects swappiness, while MGLRU only partially honors it
when selecting the scan type, resulting in a much smaller overall
impact.

For example, when building the kernel in a memcg limited to 1024 MB
of memory, with swappiness=200, CLRU barely scans or reclaims file
pages, while MGLRU still reclaims a significant number of them.
Similarly, with swappiness=1, MGLRU does not reclaim as many file
pages as expected for such an extreme swappiness value:

pgsteal_file
swappiness   CLRU          MGLRU(no patches)
1            5,894,538     756,589
36           799,998       497,282
71           548,331       415,612
106          407,012       383,814
141          253,737       354,249
176          189,003       347,805
200          0             346,078

pgsteal_anon
swappiness   CLRU          MGLRU(no patches)
1            3,962,404     2,768,654
36           2,830,250     2,976,260
71           3,121,386     3,142,954
106          3,521,720     3,382,383
141          3,504,471     2,970,859
176          3,592,335     3,163,130
200          14,095,617    3,209,132

pgscan_file
swappiness   CLRU          MGLRU(no patches)
1            10,270,808    886,997
36           1,010,341     569,036
71           656,136       490,972
106          460,326       436,042
141          295,184       403,132
176          235,147       390,358
200          0             398,363

pgscan_anon
swappiness   CLRU          MGLRU(no patches)
1            19,341,957    5,960,884
36           17,530,774    6,394,951
71           18,624,264    6,673,569
106          20,088,558    6,976,364
141          19,686,813    6,206,580
176          20,936,177    6,344,854
200          45,313,873    6,295,581

refault_file
swappiness   CLRU          MGLRU(no patches)
1            5,795,115     678,254
36           720,877       419,659
71           469,270       338,518
106          331,584       308,983
141          174,509       277,375
176          113,352       272,390
200          0             269,349

refault_anon
swappiness   CLRU          MGLRU(no patches)
1            738,618       578,308
36           451,410       665,723
71           514,961       657,870
106          633,161       786,893
141          648,640       662,673
176          668,779       708,969
200          4,816,312     672,514

In this patchset, patches 1-8 from Kairui introduce a model that uses
refaults to determine nr_to_scan[] for both file and anon in MGLRU.
For each reclaim operation, we calculate how many file and anon
folios to scan, similar to CLRU, rather than relying on
get_type_to_scan() and fallback mechanisms to decide what to
reclaim, which have proven rather unreliable in honoring swappiness.

This model also allows scanning and reclaiming from the two youngest
generations, including the youngest generation itself. This can help
resolve OOM situations[1] and reduce the need for aging.

Patch 9 from Barry fixes a cold/hot inversion exacerbated by patches
1–8 (which also exists in mainline) and improves reclaim efficiency.

Patches 10-13 from Gaofei and Barry optimize aging based on folio
distribution imbalance and improve reclaim behavior at extreme
swappiness values such as 1 and 200.

Patch 14 from Bo Zhang addresses the GFP_NOIO issue in MGLRU.

After the patchset, the results track CLRU across the full swappiness
range (see table below), with more file scanning at low swappiness
and more anon scanning at high swappiness.

pgsteal_file
swappiness   CLRU          MGLRU         MGLRU+patches
1            5,894,538     756,589       7,394,183
36           799,998       497,282       526,176
71           548,331       415,612       433,353
106          407,012       383,814       347,647
141          253,737       354,249       314,437
176          189,003       347,805       261,677
200          0             346,078       188

pgsteal_anon
swappiness   CLRU          MGLRU         MGLRU+patches
1            3,962,404     2,768,654     5,362,153
36           2,830,250     2,976,260     2,736,749
71           3,121,386     3,142,954     3,246,589
106          3,521,720     3,382,383     3,074,851
141          3,504,471     2,970,859     3,178,409
176          3,592,335     3,163,130     3,650,544
200          14,095,617    3,209,132     14,538,399

pgscan_file
swappiness   CLRU          MGLRU         MGLRU+patches
1            10,270,808    886,997       16,246,260
36           1,010,341     569,036       614,389
71           656,136       490,972       484,769
106          460,326       436,042       367,969
141          295,184       403,132       328,943
176          235,147       390,358       268,142
200          0             398,363       188

pgscan_anon
swappiness   CLRU          MGLRU         MGLRU+patches
1            19,341,957    5,960,884     7,646,122
36           17,530,774    6,394,951     5,914,405
71           18,624,264    6,673,569     7,167,762
106          20,088,558    6,976,364     7,821,921
141          19,686,813    6,206,580     8,495,970
176          20,936,177    6,344,854     10,585,375
200          45,313,873    6,295,581     30,313,342

refault_file
swappiness   CLRU          MGLRU         MGLRU+patches
1            5,795,115     678,254       7,315,064
36           720,877       419,659       448,199
71           469,270       338,518       355,269
106          331,584       308,983       270,736
141          174,509       277,375       237,643
176          113,352       272,390       184,908
200          0             269,349       102

refault_anon
swappiness   CLRU          MGLRU         MGLRU+patches
1            738,618       578,308       1,383,725
36           451,410       665,723       543,071
71           514,961       657,870       683,874
106          633,161       786,893       669,716
141          648,640       662,673       719,231
176          668,779       708,969       901,918
200          4,816,312     672,514       5,511,787

[1] https://github.com/ryncsn/emm-test-project/tree/master/file-anon-mix-pressure

RFC v5:
* Remove the aging optimizations, which have been merged - thanks for Baolin,
  Baoqun, Lian Wang, Kairui, Kunwu, Ridong reviewing on this;
* Add Kairui's model for determining nr_to_scan[] for both types.
* Fix cold/hot inversion for rejected folios - Barry.
* Improve and clean up imbalanced aging, and optimize extreme
  swappiness values of 1 and 200 - Gaofei, Barry.
* Address the GFP_NOIO issue in MGLRU - Bo Zhang.
* RFC v4 link:
 https://lore.kernel.org/linux-mm/20260812121658.69965-1-baohua@kernel.org/ 

RFC v4:
* Clean up isolate_folios() based on Baolin's feedback. Thanks!
* Further improve isolate_folios() and scan_folios(), including
  handling of exhausted reclaim types.
* Add fixes and performance improvements to inc_min_seq(),
  and reduce lock contention.
* Improve the handling of imbalanced aging and remaining
  generation-based aging.
*  RFC v3 link:
 https://lore.kernel.org/linux-mm/20260731083843.37811-1-baohua@kernel.org/

RFC v3:
 - Added Ridong's patch of improving isolate_folios() readability;
 - for lru_gen_imbalanced(), apply some suggestions from Zicheng
   and Kairui, considering lruvec size and use macro;
 - drop "mm: mglru: only fall back when reclaim is running at high
   priority"
 - mitigate aging for balanced swappiess value(near middle 100)
   as swappiness bias is less a concern for them; but slightly
   increased aging overhead might not be good.
 *  RFC v2 link:
   https://lore.kernel.org/linux-mm/20260726122123.7614-1-baohua@kernel.org/

RFC v2:
 - Quickly address a few issues raised in the Sashiko comments so
   reviewers can ignore v1 and review a cleaner version instead.
   https://sashiko.dev/#/patchset/20260726012946.18684-1-baohua@kernel.org
   Thanks, Sashiko!

Barry Song (Xiaomi) (3):
  mm/mglru: Avoid placing rejected folios below populated gen
  mm/mglru: Reduce LRU lock contention by shrinking folio batches in
    inc_min_seq
  mm/mglru: Make swappiness=1 file reclaim more aggressive

Bo Zhang (1):
  mm/mglru: Avoid scan anon while swapcache is low for GFP_NOIO
    allocation

Kairui Song (8):
  mm/mglru: report evictable sizes per type
  mm/mglru: extract lruvec_populated_min_seq() helper
  mm/mglru: reclaim from the oldest populated gen
  mm/mglru: lift the forced protection of reclaimer
  mm/mglru: skip zones above reclaim_idx instead of rotating them
  mm/mglru: return for unavailable anon reclaim earlier
  mm/mglru: balance anon and file scan budget by refault rate
  mm/mglru: lift youngest gen protection for higher priority

lyugaofei (2):
  mm/mglru: Run aging when pages are rare outside the youngest gen
  mm/mglru: Avoid prolonged anon reclaim with swappiness=200

 include/linux/mm_inline.h |  22 +-
 mm/vmscan.c               | 482 ++++++++++++++++++++++++--------------
 2 files changed, 332 insertions(+), 172 deletions(-)

-- 
2.34.1

