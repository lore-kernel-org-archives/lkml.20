Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331162;
	b=HB+n+ZEhxR1eEkfK85JQpCQBmGOU5SE4X/7FhuWKnsQe4nVJypuZQeG79ilP5k4+QpD/
	 Z6ntA9rVM0vLkDva77SAW2br7fqW9zon57arPJ9ksBpltZ8vKDtseMPOFyd4zqzlXqz7U
	 rBSX1CoPtIcdDhShvk43J+SGpvrKynfw9pLxEikbaLhgAAVOtF9SbD4ANzZ95iQ0EmjcO
	 2Lf1mhXVvgYRbBzbSaT1Ozj7OCjBjbCKTOpVs9vPIgMmM1qR6YwGvJ6Szo7IyFBixgWUD
	 wkw1eiuI0GEXpI+tOYDo47GbO5Pm3TnTTXSUdAqytPeVAq9q61/iRUVc6AO6jJiny1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331162;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=zbj2//T84I89RHJJWMcBH8ord+kaFBlmckmGd9rh3BE=;
	b=QJSbnVQxh/7vA97sNZMbGDoM3ntsVmEeTvpq8Iqb1U+6tlMKgZtlxPEu/9jvSdlRAeC/
	 9MskUoK3e4BcQLG3++8yVmGPUnEsc49pv+qeDzY31+UljHEWvw5gLXVOlsGM6De5zpRjS
	 OQkF75fqjzrFXU17HCEq1ticpQ2xfpGOgNGCxDuK8BSyaPmj4ccWBx/XIZUgU81EfrhXz
	 Tt1vX8Kng31SyRjuoWVO08lONzZ9pVOBUHDNVWbPvefrlrXg6kdqX5vEsxgrycvUE42g+
	 oiohlqoqQfR1gAP32Arx2Wn7+knKnfoyYprP6KZwaO7ZGoFyN6gBscJcFn4FwOyBunw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U4WktlZd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13C4606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U4WktlZd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8ED51F008A5;
	Tue, 10 Nov 2026 17:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794331161;
	bh=zbj2//T84I89RHJJWMcBH8ord+kaFBlmckmGd9rh3BE=;
	h=From:Subject:Date:To:Cc;
	b=U4WktlZdYCYdRsuEkyoJvtLa+HHPN/UpP5smyZy5n8ffm0cLHbR4uWHPH51o9JKtR
	 mtT+wQHrPPOdJPPWwRpxXS+43t+hx8TZJtIF8JVrQdSI6gJJ+vd5y9LJ5xrv1MLYck
	 24RFrVIgPhDinv3GEHan2JfzxfD5jPqflf4JHWqdth/sFHLYg3opwxo3Jxr4Q0mHy+
	 TZHl6SdiZRhGJ6AaiJ3jRhF8VkrMznyuxldIDGgnqSpCX5f6TBlhs/kHDJf06I1FWj
	 rqeQfdRteqqhAvpIqlnrBfo49KG1MDg4L1kBenp6kzRNqf3zjMFmpSpvMK8ZS3mm2Q
	 xBzIN2sbGhOjw==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: [PATCH v3 0/3] mm/khugepaged: bound mmap_lock hold time when
 walking an mm's VMAs
Date: Tue, 10 Nov 2026 17:19:10 +0000
Message-Id: <20261110-khugepaged-latency-fix-v3-0-6eea743cf9a3@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNQQ6DIBCF4asY1qUZEKm66j2aLlBHJBo0YEmN8
 e5Fu2kXLv+XzDcr8egMelImK3EYjDejjZFeElJ3ymqkpolNOHDJgBe0714aJ6WxoYOa0dYLbc2
 bChBF1kiJKgMSjyeHcT7gxzN2Z/w8uuX4E9i+fkkG6RkZGAWq4KYqJlWdS7j36CwO19FpspuB/
 zrZqcOjI9JcVFWLQoL8c7Zt+wBn4xH3BQEAAA==
X-Change-ID: 20261029-khugepaged-latency-fix-40495d66ea50
To: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
 "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3543; i=ljs@kernel.org;
 h=from:subject:message-id; bh=frmUoMWw/pesiZEDvVRHRiCCGgqcEy/Ev4fY2Sa4j3w=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLI+Bwl9cG78PWfppZNfGibtOJbe1y/gvrYx1yBGyClN4
 P6eS9ZPOkpZGMS4GGTFFFmefxHfHyQSNq/zgr8bzBxWJpAhDFycAjARs8UM/2y9aqa/KXJ93mLY
 zb7k6gvJuyfsDOv6Nl+qOioeX6orms3IsH9pmrl7ZWSXzT7PlAn3X69ZsOWhid6yjGfHgpk+2we
 qMQIA
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
v3:
* Moved hunk from 3/3 to 2/3 as per Baolin.
* Switched to using a declared KHUGEPAGED_MAX_VMA_SCAN_BATCH constant, as
  per David.
* Updated commit message to reflect this, and added link to rwsem patch.

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
https://lore.kernel.org/r/20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org

v1:
https://lore.kernel.org/r/20261103-khugepaged-latency-fix-v1-0-a07ab16ac860@kernel.org

[0]: https://lore.kernel.org/all/20261105-rwsem-dont-steal-from-queued-writer-v1-1-275e070f426f@kernel.org/

---
Lorenzo Stoakes (ARM) (3):
      Revert "mm/khugepaged: remove definition of struct khugepaged_mm_slot"
      mm/khugepaged: scan mm's more efficiently under mmap_lock contention
      mm/khugepaged: release contended mmap read lock after scanning enough VMAs

 mm/khugepaged.c | 121 +++++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 85 insertions(+), 36 deletions(-)
---
base-commit: 34f88a114888c9dba49e45f2b0c2a3e83c4c871c
change-id: 20261029-khugepaged-latency-fix-40495d66ea50

Cheers,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>

