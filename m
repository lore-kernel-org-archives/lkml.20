Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7AF4B9219
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409680; cv=none; b=rlF7Si6jliaM7SphA1dyc8wBBwFVq9kIjzjtWjCnYFX6baTLwQxb16vIHdnis/1cKfozoFcVhbtIUr17x828tgAuaIr+ezf7odVzT1Oa9KekWr0XTr2lKvXRtwT7L7x0k5xRX3KFeTzo/bTLopZkiDGdv1yPiBYb528koQ7qeog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409680; c=relaxed/simple;
	bh=qaGckmYzxXSa2G2Z5YBeLf9rbD8ungPtxwhNBhpQsv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qMemZvNHlwkgHYeRowlGPu+aKKMZNAMyVgpeyGIUFLjKukJrx9TUHEd8NT4F/4x65L1hWZ9IpL7lJMhqEwxawqg5PNUif6VzS6kuy/u/PdMIZQh/8aEcGVQ9DIyXsDt3nQgtI8AOUng4e6D4u8m1JB69X/Ly5kcSutAQ6FL3/XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lY7WfC2T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lY7WfC2T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89AB1F000C4;
	Mon, 19 Oct 2026 11:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792409679;
	bh=/PpZGZPJ3n/ymi2WTzoPbdnIq+2PhZxNpI8dtpF/DJA=;
	h=From:Date:Subject:To:Cc;
	b=lY7WfC2TZNf2rLbukcix8p8xAR82SZ1Ejn3IkvHu7F0iBuVb1DZSA0Pg7Ea4MZG8+
	 FEx2gudzyUhweuf+RczZLwndkLq3DXDE0aW3+2MJ5fAKWHgBQgeR3o/aMQe7ZkYLwi
	 7l70juBpTgXGqZlsRBm/6hPtjG2bpcZG69GrsP8Ra5V1Z683Jka+4AgOwWJI5HCaDY
	 3kUQpQd+1q1vjXv7DRNnTnlS74DPb+4+CuC6NVImT9O8v1/5y/QGD4N35QUuhRhxVq
	 WH8+i4CfIq5eMCIEwTrdIY2n3HkQEipDRwHH5W/2rM4QPEHJi25tMDuMAY+zqhe+zZ
	 NSYDCFwcbCC0g==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Mon, 19 Oct 2026 14:34:26 +0300
Subject: [PATCH] MAINTAINERS: add an entry for MEMORY MANAGEMENT - MEMORY
 MAP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-memmap-maint-v1-1-80850871d0cc@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ6CMBBFr0JmbSNtBKJXMSymdYAxaSEz1ZgQ7
 m6ry/fz39tBSZgUbs0OQm9WXlMBe2ogLJhmMvwoDK51vW3t1USKETcTkVM2g5sodBfqh85BUTa
 hiT+/3H38s778k0KujfrwqGS8YApLnVbhmdM5omYSOI4vOLsRVZAAAAA=
X-Change-ID: 20261019-memmap-maint-72fec54e6752
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-Mailer: b4 0.16.1-dev

Split out files related to SPARSE and SPARSE_VMEMMAP management from
MEMORY MANAGEMENT - CORE into a dedicated entry.

Also include architecture specific sparsemem.h headers, pfn_to_page() and
page_to_pfn() conversions and Documentation/mm/memory-model.rst.

Muchun, who did a lot of work cleaning up SPARSE_VMEMMAP and extending
vmemmap optimization, volunteered to help with the maintenance.

David and I will continue to look after that part of the mm subsystem.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 MAINTAINERS | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..b468ecdf8c65 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17161,9 +17161,6 @@ F:	mm/mmzone.c
 F:	mm/pagewalk.c
 F:	mm/pgtable-generic.c
 F:	mm/ptdump.c
-F:	mm/sparse-vmemmap.c
-F:	mm/sparse.c
-F:	mm/sparse.h
 F:	mm/util.c
 F:	mm/vmpressure.c
 F:	mm/vmstat.c
@@ -17210,6 +17207,21 @@ F:	include/trace/events/ksm.h
 F:	mm/ksm.c
 F:	mm/mm_slot.h
 
+MEMORY MANAGEMENT - MEMORY MAP
+M:	Muchun Song <muchun.song@linux.dev>
+M:	Mike Rapoport <rppt@kernel.org>
+M:	David Hildenbrand <david@kernel.org>
+L:	linux-mm@kvack.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git memmap
+F:	Documentation/mm/memory-model.rst
+F:	arch/*/include/asm/sparsemem.h
+F:	include/asm-generic/memory_model.h
+F:	mm/sparse-vmemmap.c
+F:	mm/sparse.c
+F:	mm/sparse.h
+K:	(?i:vmemmap)
+
 MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU)
 M:	Andrew Morton <akpm@linux-foundation.org>
 R:	Kairui Song <kasong@tencent.com>

---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20261019-memmap-maint-72fec54e6752

--
Sincerely yours,
Mike.

