Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912261;
	b=EBPsQXZbaAw2e4D1rUbi9wsme2i/3hrkr8+V1aA7kSRsBSWxYbV9SOsbk7YTlzfe7Qv6
	 rqMJayDvZkaDiTKH1L0ILgAJeU3c5+gLq+mn0Rg82gsYkHbEqtJ1LeO9kK2C/A0r45Ojr
	 +E6/X/rRz9V5g9PYUWHp/Dqv6C/MEetHSOSB/UDQGc8mkh65b40v9ukVDDRXQjawKe7Nw
	 2AkM74t6BodnVoIh/n8IFelOTpkcifVSd/HzuxQhLFAtLWrfY4SWf5fyIE1pGZU+iYkVC
	 KZKGljqxyO2x8VDokHEKdopvZ2lPxs/myjnZThTmzyG5gMIyWSQlNPWTwWDkdu/MMBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912261;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=4tsSLRB5gzfbm60hazvMjfmtsNOihBj3aVcJyFcSU5I=;
	b=yAo4KHvLKr17qOa25inkj5BzQ96I0JICuIdXtvXlF1a/HPzZN5CRkxRVGyYPEuV0nYrk
	 Z99xfrtyxMDZrZ545Ki/dSSeCAcuEIoTJtAKVmMgeM6148OZR/qrTk1SzqGSE8S9LJyIi
	 K+afJJSKEkRy6TT9ohwipqH5b3jKvobbyZaD3xVZ0xixD9WVok0x7o7X/VBlpB+dPhiFk
	 no7FqMCGnGSV9wSbKK/S8WsdPksqeaP8+liD6PSe8kcA3Ty1J4cCQkNokDrc3bo3+Eby1
	 bPsG3pfA8806yMO1guoCfaIJlgFSmnVmeubbXoXpKMTZjSDiXW4v2GQkmiRByjaVSqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z0DIaiXs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED3D606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z0DIaiXs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D80FB1F0089F;
	Thu,  5 Nov 2026 20:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793912260;
	bh=4tsSLRB5gzfbm60hazvMjfmtsNOihBj3aVcJyFcSU5I=;
	h=From:Subject:Date:To:Cc;
	b=Z0DIaiXsUmWzQfQ9HDnbc+qP2Qnd5GefCCcd5FFyl5iVMrBdP0Eg8Z/iefj7EhGpn
	 A8SnCabIIagHrfVz7DzHZ/cJvzP1LBVknLshV9aRPelX410Hu5gG+xsn7Jo0naJfgg
	 SmG9hAZ9V5YFaExqPOALfmks693VH29I2oAJamTqI3+bV7z+GvnsUOs4sgC7EGvvzF
	 MWBahPlXSzabs1l39Ir/uDgcAPcRWsJ9RK+twF9F9Zc+JURU+Rhwz+68syzXnAjM/G
	 A1ecqN31Bm+2RmCocOPD2gkYHMmAZbxdpKy/VxY1BIg/hPzurPfs9SRQcOXpOO5coA
	 HfptOwX7QG6pQ==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: [PATCH v2 0/3] mm/khugepaged: bound mmap_lock hold time when
 walking an mm's VMAs
Date: Thu, 05 Nov 2026 20:57:21 +0000
Message-Id: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0Jm7ZhphSquvIdhMcJYGkghLRIJ4
 e5WXLt8L/nvrxAlOIlwzVYIMrvoBp9AHzKoW/ZW0DWJQZM2inSJXfuyMrKVBnuexNcLPt0bc8r
 LojFGuCBI4zFI0nv4XiVuXZyGsOw/s/raX1LR6V9yVkjIdOaHMlxfDN06CV764xAsVNu2fQAz9
 69uvQAAAA==
X-Change-ID: 20261029-khugepaged-latency-fix-40495d66ea50
To: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3240; i=ljs@kernel.org;
 h=from:subject:message-id; bh=kHSJ0UoFhXYW+BFBk23Iz4n2tUrJtVkgq2eIr5BK5Hw=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLLevD3wMO6HrvNO3yn5WXbuM978jpkRma2gE2PzuXfOD
 B63w5IuHaUsDGJcDLJiiizPv4jvDxIJm9d5wd8NZg4rE8gQBi5OAZhIVSzDP3PO45qnNWd5HBLi
 XcW0ut7InXdNmdf8B8xCNu/Mfuqs+8jwT/GO9sL07Lntz/UYLblXzzHW/XBv/3W+ilnMP1N2Hdh
 8kBUA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

This series introduces a couple small changes to khugepaged to improve its
behaviour both in the face of mm->mmap_lock contention and to reduce that
lock contention when possible.

Looking at the first change - if the mmap lock is contended, an attempted
mmap trylock in collapse_scan_mm_slot() will result in the scan being
aborted wherever it happens to be, and when next the mm is processed it
starts from the beginning again.

If an mm has a lot of ineligible VMAs and is undergoing significant
mmap_lock contention, collapsing the eligible VMAs there can take a very
long time.

Patch 2 of the series fixes this (patch 1 is a prerequisite) by keeping
track of where khugepaged was in the mm before aborting the scan.

This issue was noticed during some work in which an mm was instantiated
with a large number of small VMAs under significant mmap_lock contention,
during which collapse was observed to take 10.8s. With this patch applied
it took 3.6s to collapse the same mm.

Finally, patch 3 uses this to have khugepaged release + reacquire the mmap
read lock if it is contended after walking a large number of VMAs.

This was also observed as part of the previously mentioned work in the form
of mmap lock stalls, which patch 3 resolves. The reader stealing the lock
back from a queued writer on re-acquisition is addressed separately by the
rwsem change at [0].

Importantly, none of the changes introduces any regressions for khugepaged
anywhere. It is all upside, and implemented conservatively.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
v2:
* Removed mmap_lock_nosteal patch (was 3/5) and sent a general rwsem patch
  separately, as per Peter.
* Removed what was previously 4/5 as with 3/5 gone it was no longer
  necessary.
* Put 2/3 commit message on a diet, as per David.
* Updated 3/3 to count every VMA rather than only skipped ones as per David.
* Updated 3/3 to use a sensibly calculated maximum VMA scan count renamed to
  KHUGEPAGED_MAX_VMA_SCAN_BATCH as per David.
* Updated 3/3 to only release the mmap lock if it is contended.
* Updated 3/3 to resume from the per-mm cursor after re-acquiring the lock
  rather than the now stale VMA.
* Updated 3/3 to treat a VMA whose aligned end wraps the address space as
  the last in the mm, as per Lance.
* Fixed 3/3 KHUGEPAGED_MAX_VMA_SCAN_BATCH to derive from the pages_to_scan
  budget passed to collapse_scan_mm_slot().

v1:
https://lore.kernel.org/r/20261103-khugepaged-latency-fix-v1-0-a07ab16ac860@kernel.org

[0]: https://lore.kernel.org/all/20261105-rwsem-dont-steal-from-queued-writer-v1-1-275e070f426f@kernel.org/

---
Lorenzo Stoakes (ARM) (3):
      Revert "mm/khugepaged: remove definition of struct khugepaged_mm_slot"
      mm/khugepaged: scan mm's more efficiently under mmap_lock contention
      mm/khugepaged: release contended mmap read lock after scanning enough VMAs

 mm/khugepaged.c | 120 +++++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 84 insertions(+), 36 deletions(-)
---
base-commit: 34f88a114888c9dba49e45f2b0c2a3e83c4c871c
change-id: 20261029-khugepaged-latency-fix-40495d66ea50

Cheers,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>

