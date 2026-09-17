Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6A44C10FD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789674486; cv=none; b=E4t9ZJBThG6Ttvci7pTs+BEqnd8mgmhGnOYByboTACMpmuvqDqqN+u7UCR7trQDaBI6MgdXJLbuKrjkWuS+mST+s97jpbOLPnS9ZZldcp5uIJ4bQLU012GkgpWh5sksYPrmJ2VNWIeFE6H8eBK/mS2fk3yEfBcs2tzirVNikO3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789674486; c=relaxed/simple;
	bh=rE+GgG5lo7kLvRik8sUqKlJkAvF+DMB1bmJcti/7mbM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MtTzyW3FzUTQZrQ/6y1xvNMC7UEzDYg9LPt4krh1rrBGPWauq48X1R51Kdw2QVzvoRaF3YG9e0kZEIEs/oofKXz1uMDgyMN5m9o6QXjSm8tfkyLUxx+p5kimtJSBqqlF+s24pfS+oGr8vRCnm6mL31QV2e5Cwg465DByyQk2tCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nzZ94X10; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nzZ94X10"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D0FB1F000FF;
	Thu, 17 Sep 2026 19:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789674484;
	bh=SKCZtymFejY399Tv50swKvjYDiRpa1vybAFKL886URM=;
	h=From:Subject:Date:To:Cc;
	b=nzZ94X10WN1rmG1Ujm9ASeObZPM1xl2YtZNwu4dtqxYpjEyV1huRr4rAzA3gdDaUQ
	 cTYUQMFCnKCL62poZqeTo3t5fQLOhl/ROHFE15LyMwsdMk8uzkgR6SFQz4CJNiVyXV
	 SMm9DOQxCzo0MOpvkR9rYCKDdlSuzQ/V1tjS0kytUmUmiNTVGhAS7Ruy7lb9Ism3VU
	 2YpX4iwlYAvx9761wKq7oFiItuIo/c55SpXjiJV8QzjdCgu5z/5mN+3woIvh2Pmnqn
	 ZTWHyDQe5DSb3gxNPK60vl0VJpAdz/6v6cC6CS5rd5yPZ7nMkwv8LFbqJrQyupz3lD
	 piIM6f6Q8FR1A==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: [PATCH v3 0/3] mm: implement and use vma_has_anon_rmap(), silence
 KCSAN
Date: Thu, 17 Sep 2026 20:47:40 +0100
Message-Id: <20260917-vma-is-faulted-v3-0-5c22314a72e7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMSw6CMBSF4a2Qjq25ffCoI/dhHBR6gRsVTIuNh
 rB3CyONcXhO8v0zC+gJAztkM/MYKdA4pKF2GWt6O3TIyaXNJMgCDBgeb5ZT4K19XCd0XKED0Ln
 KTQksobvHlp5b8HROu6cwjf619aNY37+pKLjgypYgWl2ZStvjBf2A1/3oO7a2ovzwAn68TB4rg
 XVTOqGL+ssvy/IGiNh6Ee0AAAA=
X-Change-ID: 20260909-vma-is-faulted-3ed004535970
To: Andrew Morton <akpm@linux-foundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Kiryl Shutsemau <kas@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Xu Xin <xu.xin16@zte.com.cn>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, Rik van Riel <riel@surriel.com>, 
 Harry Yoo <harry@kernel.org>, Chris Li <chrisl@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
 Youngjun Park <youngjun.park@lge.com>, Peter Xu <peterx@redhat.com>, 
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
 Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2919; i=ljs@kernel.org;
 h=from:subject:message-id; bh=rE+GgG5lo7kLvRik8sUqKlJkAvF+DMB1bmJcti/7mbM=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLLWOL+UybscKnJzyYpEK6bdF7pSdSr3NgvM+b01aduhj
 daLdtkEdZSyMIhxMciKKbI8/yK+P0gkbF7nBX83mDmsTCBDGLg4BWAifvMZGTo3rndbt2lu3xGV
 f7OEHoizi15a4pny3ZNZQ/B7Sn3tvL8M/wzkkyUmGIVHzzc/eHxGj7iBi12NwUx7tnSB6Af3Z85
 MZgYA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

Provide a function to abstract the common task of checking whether
a VMA has an anonymous reverse mapping associated with it.

In the first patch, const-ify vma_assert_stabilised() and related
functions so that vma_has_anon_rmap() can reference a const vma pointer.

In the second patch, introduce vma_has_anon_rmap().

Finally in the third patch, update comments referencing anon_vma to instead
reference the anon rmap to abstract this conceptually to avoid confusion.

There are still other functions which reference anon_vma directly, those
can be addressed in a follow up.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
v3:
- Updated tags (thanks everybody!)
- Separated out const-ification changes as per Kiryl and Pedro.
- Renamed vma_anon_tracked() to vma_has_anon_rmap() as per Kiryl and Pedro.
- Converted the missed hugepage_vma_revalidate() and vma_needs_copy() callers
  as per Kiryl.
- Update the kdoc comment for vma_has_anon_rmap() to highlight that it implies
  anon folios may be associated with the VMA, as per David.
- Updated anon_vma comments as per David.
- Updated the vma_has_anon_rmap() patch commit message to avoid saying
fault as per David.
- Various prose improvements.

v2:
- Renamed vma_is_faulted() to vma_anon_tracked() as per David.
https://lore.kernel.org/r/20260910-vma-is-faulted-v2-1-e81ebc7d146b@kernel.org

v1:
https://lore.kernel.org/r/20260909-vma-is-faulted-v1-1-3a701f48984a@kernel.org

---
Lorenzo Stoakes (ARM) (3):
      mm/vma: const-ify vma_assert_stabilised() and associated functions
      mm: implement and use vma_has_anon_rmap(), silence KCSAN
      mm: update comments to refer to anon rmap rather than anon_vma

 include/linux/mmap_lock.h         |  12 ++--
 mm/huge_memory.c                  |  21 +++----
 mm/hugetlb.c                      |   2 +-
 mm/internal.h                     |   2 +-
 mm/khugepaged.c                   |  17 ++---
 mm/ksm.c                          |  16 ++---
 mm/madvise.c                      |  10 +--
 mm/memory.c                       |  16 ++---
 mm/migrate.c                      |  12 ++--
 mm/mmap.c                         |   6 +-
 mm/mprotect.c                     |   6 +-
 mm/mremap.c                       |  10 +--
 mm/pgtable-generic.c              |   2 +-
 mm/rmap.c                         |  22 +++----
 mm/swapfile.c                     |   2 +-
 mm/userfaultfd.c                  |  12 ++--
 mm/vma.c                          | 127 +++++++++++++++++++-------------------
 mm/vma.h                          |  29 ++++++++-
 tools/testing/vma/include/dup.h   |   2 +-
 tools/testing/vma/include/stubs.h |   4 ++
 20 files changed, 182 insertions(+), 148 deletions(-)
---
base-commit: b02c77c78ff74d3d88ea614335ae833e01ed5d30
change-id: 20260909-vma-is-faulted-3ed004535970

Best regards,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>

