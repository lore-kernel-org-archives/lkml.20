Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD84E37A498
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244444; cv=none; b=Ua0YBcZOpXFOXXn5pAQEomuHr6064Fh5cXWKAnGqEiaz6iAASOrQl2iueoL52Upl6CDNVdGLQ2MdkiPfjpangpPtOsgNCQR0ud4x43I+A/984ne6VsHDef9QjN0N1KKZ0uUB9ii+Y3L4AFE1SXS++m4wZAvLfiVVw8cOhkpW8fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244444; c=relaxed/simple;
	bh=/9pYpwI/5Bq1wq5YcYCFdVp8axHssO4A8zu71zerNGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=opBW+0P+pSU4iYcCQrBh2PW7Nimp5gICCal438lZp2Ig4McZso8zGcz9l1Yhs7Y3CJzxlDcPt68ZhgVBnDkdiB7wMl9iDjE0JvpdZAdcm3zFKFJ2ha/e4ZKidcfKdpEfdqlvK1iT7Bzv6pPJlXfNZJCCe7VesghxJylMngqaCTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NtGiVFwC; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NtGiVFwC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Er0GRhCzdVU5yeaX5s1ElRVbYAULyDK/JtS7EUoH5DA=; b=NtGiVFwCiayfmXPuPDsb8GhQyq
	V7wW1OWlpbgqmJNsvjxJEHcHjfPfyXnJPi5RQf6RQ98iIK8oJWkEXocIxtIs6LQKiVvr5oUreeAwi
	NLZIwv1fauKhCaykoXyKYWGZAS4PsRrkmIEQ1+W9wggaeqaNWpro72e12GvoQ8tNzhGdJH7s2iv43
	IHoY3M9oUE5wKTVQWvih76QJ/lMngpF3W1TTF0P4VZVzmwDAcsCURPVCL7WyP/FnCdDc+YZyySEN9
	l4L5MH/xnrafYjs/h06CT4gUHsaSP73o6OSeNsLKPHyYVARoDJj3Y4YqwtrY3ewR2hC4kcrSbIBiT
	bk1GZaxA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1I4C-0000000B46j-0x7Q;
	Tue, 01 Sep 2026 06:33:56 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Geoff Levand <geoff@infradead.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/4] powerpc/ps3: mm.c: clean up kernel-doc issues
Date: Mon, 31 Aug 2026 23:33:53 -0700
Message-ID: <20260901063354.4012138-4-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901063354.4012138-1-rdunlap@infradead.org>
References: <20260901063354.4012138-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the correct format for struct members and function parameters.
Use the correct function names in kernel-doc comments.
Use the correct format for function descriptions.

This eliminates these kernel-doc warnings:

Warning: arch/powerpc/platforms/ps3/mm.c:102 struct member 'vas_id' not
 described in 'map'
Warning: arch/powerpc/platforms/ps3/mm.c:195 missing initial short
 description on line: * ps3_mm_vas_destroy -
Warning: arch/powerpc/platforms/ps3/mm.c:514 function parameter 'c_out'
 not described in 'dma_sb_map_pages'
Warning: arch/powerpc/platforms/ps3/mm.c:708 expecting prototype for
 dma_region_free(). Prototype was for dma_sb_region_free() instead
Warning: arch/powerpc/platforms/ps3/mm.c:1092 expecting prototype for
 dma_unmap_area_linear(). Prototype was for dma_sb_unmap_area_linear()
 instead

This leaves around 15 unrepaired kernel-doc warnings.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Geoff Levand <geoff@infradead.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org

 arch/powerpc/platforms/ps3/mm.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

--- linux-next-20260828.orig/arch/powerpc/platforms/ps3/mm.c
+++ linux-next-20260828/arch/powerpc/platforms/ps3/mm.c
@@ -79,7 +79,7 @@ struct mem_region {
 /**
  * struct map - address space state variables holder
  * @total: total memory available as reported by HV
- * @vas_id - HV virtual address space id
+ * @vas_id: HV virtual address space id
  * @htab_size: htab size in bytes
  *
  * The HV virtual address space (vas) allows for hotplug memory regions.
@@ -193,7 +193,7 @@ fail:
 }
 
 /**
- * ps3_mm_vas_destroy -
+ * ps3_mm_vas_destroy - destroy the virtual address space
  *
  * called during kexec sequence with MMU off.
  */
@@ -504,7 +504,7 @@ static int dma_ioc0_free_chunk(struct dm
  * @r: Pointer to a struct ps3_dma_region.
  * @phys_addr: Starting physical address of the area to map.
  * @len: Length in bytes of the area to map.
- * c_out: A pointer to receive an allocated struct dma_chunk for this area.
+ * @c_out: A pointer to receive an allocated struct dma_chunk for this area.
  *
  * This is the lowest level dma mapping routine, and is the one that will
  * make the HV call to add the pages into the io controller address space.
@@ -699,7 +699,7 @@ static int dma_ioc0_region_create(struct
 }
 
 /**
- * dma_region_free - Free a device dma region.
+ * dma_sb_region_free - Free a device dma region.
  * @r: Pointer to a struct ps3_dma_region.
  *
  * This is the lowest level dma region free routine, and is the one that
@@ -1081,7 +1081,7 @@ static int dma_sb_map_area_linear(struct
 }
 
 /**
- * dma_unmap_area_linear - Unmap an area of memory from a device dma region.
+ * dma_sb_unmap_area_linear - Unmap an area of memory from a device dma region.
  * @r: Pointer to a struct ps3_dma_region.
  * @bus_addr: The starting ioc bus address of the area to unmap.
  * @len: Length in bytes of the area to unmap.
