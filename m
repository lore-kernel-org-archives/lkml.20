Received: from mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86CD3DE44E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239313; cv=none; b=WktAEtngZN+eG+ZYKgY7RTd+4g+n+0aQsh4Yb1SK6cOdkguSbnA8NwrNgHAei8LswFJgLMXfEzeeJEsqCCUWvaRcxZbjwXQHfrw8Xaqrwk3LSonu9o5j9CKmXeQ2LsBQpH+6ZHejYB4mQLfY6eG9JKPxml7yyL0F+9PzYG824Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239313; c=relaxed/simple;
	bh=GMW73oM32XjlK00ZreHON07LcCH+HXuZENIE7xmRCOc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=o6uxnUgLp/GaC56HNpWI46b75+f639eeq5psO0e4D+oQbmKm6PVzGAGtgow2Mf1thX28LVhkGUBuBy3ubR7NNhdO9iCaiN7C8ZOrAxEz3HX7HI7WTuyXeSbIvacRAz3oOHgnt4kpI7ecs3i/PdvnCq988AJIeMT9qYaK4PgRYlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r3JdL+JF; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r3JdL+JF"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GMW73oM32XjlK00ZreHON07LcCH+HXuZENIE7xmRCOc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790239308; v=1; x=1790844108;
 b=r3JdL+JF0N8GGqeBg1gwCBVoj2h8RnmfVlFITYSGRa49+YDocVU2Xxu7ydAlQWOtoJ3G5a2I
 PnIN5VD5cEyeYRfmqkz0XQ2LxjWpyb+8z2N5SP/YSF3+NTQUqPPJZX9/gucptL7Djv1WJ0Gm491
 HdPHiPZvTlg4Aye0jgoDPcxo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id f39e36a1a49ad3fe;
	Thu, 24 Sep 2026 08:41:48 +0000
X-Mizu-Trace-ID: f39e36a1a49ad3fe
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH] ARM: mm: align hugetlb mappings to the huge page size
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260901085740.66283-1-kmehltretter@gmail.com>
Date: Thu, 24 Sep 2026 16:41:30 +0800
Cc: Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5AB6FE85-4CB9-41EF-A700-BC5E071F29F5@linux.dev>
References: <20260901085740.66283-1-kmehltretter@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 1, 2026, at 16:57, Karl Mehltretter <kmehltretter@gmail.com> =
wrote:
>=20
> mmap(MAP_HUGETLB) on 32-bit Arm can return an address which is not
> aligned to the huge page size. In a QEMU virt guest, unmapping the VMA
> then hits the alignment check in __unmap_hugepage_range():
>=20
>  kernel BUG at mm/hugetlb.c:5213!
>  Internal error: Oops - BUG: 0 [#1] SMP ARM
>  PC is at __unmap_hugepage_range+0x540/0x584
>  LR is at __zap_vma_range+0x13a0/0x1410
>=20
> Commit 7bd3f1e1a9ae ("mm: make hugetlb mappings go through
> mm_get_unmapped_area_vmflags") made hugetlb mappings use the
> architecture's arch_get_unmapped_area(). The generic implementations
> handle hugetlb alignment, but the Arm implementations only account for
> the optional SHMLBA cache-colouring constraint. A 4 KiB-page kernel =
can
> therefore align the mapping to 4 KiB or 16 KiB instead of the required
> 2 MiB.
>=20
> Set the alignment mask from the file's hstate for hugetlb mappings in
> both Arm implementations. Huge-page alignment also satisfies the
> SHMLBA constraint.
>=20
> Fixes: 7bd3f1e1a9ae ("mm: make hugetlb mappings go through =
mm_get_unmapped_area_vmflags")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Besides 32-bit Arm, the same regression appears to affect MIPS and
SuperH: both support HugeTLB and provide custom =
arch_get_unmapped_area*()
implementations that only enforce cache-colouring alignment, not the
hstate=E2=80=99s huge-page alignment.

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

