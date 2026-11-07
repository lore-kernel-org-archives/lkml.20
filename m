Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057245;
	b=3a8AkQZPwSRhPNthI1+vyLpkbfaWPz3fSuQDQiKJfb/kTtLvGfH9qmyTmibCNRnuKhDK
	 V0KZBbcCe9wWjqPezNbFlNXCQUKb8SiqQEVxTc+q4LJpSa2VNPJnt0BZDHawFWYrnDJ2a
	 BSQL3ZpIN8ZgEtmJaw2MiZpH6bJkJron/qDJCEN/DOC40kTlHhkAvaujuXPDAr7DIDcG4
	 aAyYhsF4iV1FUIlv9JVeYsOtaOD2oh8QHcsy3v6ADg4qIeLtpkZu/vGGi+p2mlvofMUme
	 XhcM0NKTVoFIU300xi8Vnl4byJTz2DaU9v11ZkwCS/rSrGasH6XjWMsagLONmr9/p7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057245;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type;
	bh=GBkNZH//i6CeZMrvSzH07WqQhujzIjHxnO0azVdEsyM=;
	b=vQJhafgCk9mel3WHPSuy60yrpS+hcQBHW3VtFgQTkUTfo6YF6YBcpCuBLwM/Y0In2X5N
	 adMQRJCGzvoblqMpW6FS1B60AQLlDG2tTee5iDbTuPNqf5YT2ZV8Uq85Xzt3DZ8UA+DzE
	 p9proHdC34AEasCK5QTnMOrKwSHK5ZJLWN4DENivqef9M1kMAPQ0FyHWPcIoDvCe4gNrg
	 GuwrMfGZFIZ1BDwpwhegjV//6unMi9P0xtPF4d5ZPRTR6L0zTuqLQmBcvgLCMScPoeyj4
	 BFJJ9banGIRsSegkyOCB6Lc0OFmOOu9kAcfxc7EfTh49kvRddfnoxb4/daCCGcpSKmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=labc08BM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F73606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=labc08BM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0101F1F0089F;
	Sat,  7 Nov 2026 13:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794057245;
	bh=GBkNZH//i6CeZMrvSzH07WqQhujzIjHxnO0azVdEsyM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=labc08BM53tokoAGYlMVbW1U5bXWmGlLgJN87YN/JaYhxmKe9Nh3ubt94mUM+dghz
	 plfCFZ0dx2+L727ju4sxgcJHcMHhU0mXRgxPe9wekoyG2tRzWI4I4+0sjDtNeNP/B5
	 lZ8lwZkSxkN0lOPdUC+FiRXV2L+LS+Xq91xlJkXi5w8rPcoYUXzcUIApMSiXfCe+Uc
	 NB/Q509tXUHNz4AXBaK+wOiosVcC/V1WLKGr+L82gq1D2t8ZB2ZJ/ngNSOa/Vza0lS
	 VbBh2vsEeyI1HZTwa1QROtdRzrsWyhCNqMwcKT1MlJ8noeo8hvcGvBFBN1An2+dZyN
	 VS92gtAQ7bEcA==
Date: Sat, 7 Nov 2026 06:13:58 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Muchun Song <muchun.song@linux.dev>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: mm: Define PAGE_KERNEL_RO
In-Reply-To: <20261018023649.798595-1-nickolai@csail.mit.edu>
Message-ID: <0ee49e9a-4c42-6cd6-afca-838c20966248@kernel.org>
References: <20261018023649.798595-1-nickolai@csail.mit.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 17 Oct 2026, Nickolai Zeldovich wrote:

> Kernel mappings that generic code creates read-only are writable on
> riscv. With HugeTLB vmemmap optimization (selected by riscv and on by
> default with CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON), the tail
> vmemmap pages of every optimized huge page are remapped to one shared
> page with PAGE_KERNEL_RO so that a stray write to a tail struct page
> faults. On riscv that remap keeps _PAGE_WRITE, so such a write silently
> changes the struct pages of every optimized huge page instead.
> early_memremap_ro() (EFI system and configuration tables), the
> firmware loader's vmap() of the loaded image, and acpi_os_ioremap() for
> EFI runtime code and NOMAP regions, which asks for a read-only mapping
> precisely to avoid a writable mapping of executable code, are affected
> the same way.
> 
> riscv defines PAGE_KERNEL_READ but not PAGE_KERNEL_RO, so
> include/linux/pgtable.h falls back to "#define PAGE_KERNEL_RO
> PAGE_KERNEL". Define PAGE_KERNEL_RO as PAGE_KERNEL_READ. FIXMAP_PAGE_RO
> then follows from asm-generic/fixmap.h: early_memremap_ro() now passes
> 0xe3 instead of 0xe7 to __early_ioremap().
> 
> Tested on QEMU virt (riscv64, defconfig with
> CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON and CONFIG_PTDUMP_DEBUGFS,
> booted with hugepages=8): before, every vmemmap entry in
> /sys/kernel/debug/kernel_page_tables has W set; after, the 28K of tail
> vmemmap of each huge page is mapped R without W.

Thanks, queued for v7.4-rc.


- Paul

