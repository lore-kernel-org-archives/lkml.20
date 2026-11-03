Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793678512;
	b=j5HQPuTDM1SKAQir5mXjrWNau1QomDphwe/XEJ8bn2Z6d8l6xCjvQQItNQ28UKq79ZwY
	 a110+I/q8vkczh9VCfZhfhilu8+/+//6TeWGUgEBwVtwxYxpDycNkr9mnbNn6trywTR3H
	 lBy/Z925YqI4JSj/DmMHlxpgY3YkauGh2E9wvn1ElqiuQxX5rLs6xcTFMrdyuiDxXDRMj
	 sWRzAQs+QPnyLkEkHm0mZHb/IqfbKyhpVtjOhfLGGkWqosjj3iKZ+4gmJKfFfDYqEp1b+
	 OYSxpLmdI4Ih6OARXPbGWA2IPTHi0wm18a0+ei+6/sI2ODwVNXk3wET6PsiVa3l36rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793678512;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=lDb7VF7t9vCGYbcoBtIdF6dRw3MWvJEbXZ5PMZISlw8=;
	b=NHUiuIlQ7ockjPipfZH2fzHyc3hzLKLOjtmPMikFh5F0y1/gXX3TMmla9ZtKUzQstRih
	 gaRHFv1a6JHITJc4h/akyMhLfh0ZZY9NXYGCaFfaTUjB5Rb0EICU85XqtBhYKQt2+NKNy
	 4Yuj2BePwsHTwPyqK4sznTt3x1WHIboriqf/B0vRjNUqrqRgpcZ87mahgoTxQ6OIYrDns
	 zyDBPNaxlmk44O5eTgiivJwGqBcniWRKfW/WLddNsYE3WgfNWLF2YmGFhEyV8S2TGORq9
	 GxNkPhAVg0EfznE7k5lJGDaqV4OCTSppsYhG3/WvFQY7pWAKLiA2SMxsrLKDCIfBUrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mkciFVIq;
	arc=none smtp.remote-ip=91.218.175.216
Received: from mta0.migadu.com (out-216.mta0.migadu.com [91.218.175.216])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF47606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEF47606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mkciFVIq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CKEHs2xNjn3vFUKXk/OC1dgxFsocWFipvyVq/CmrhPw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793678508; v=1; x=1794283308;
 b=mkciFVIqfGgD8r4GUzUx/IMdlICBgx1UnRaGabM3UodtroGDLhWeiFlH/0shEeRCZGP5IB92
 06thgCYP1xhGDvEoArNEuo+ZSvUlgpHl6Lnk9yZfhdVp/+l5+caYDg1VrFQ9lN820ojB4KYhvkg
 gcPXLyqFh4T7yntjinwdzxZY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 54dd4c98615b8fc8;
	Tue, 03 Nov 2026 04:01:48 +0000
X-Mizu-Trace-ID: 54dd4c98615b8fc8
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH] riscv: mm: Add KASAN shadow mapping to flush_cache_vmap()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261102134422.610837-1-alitariq45892@gmail.com>
Date: Tue, 3 Nov 2026 12:01:27 +0800
Cc: Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org,
 Alexandre Ghiti <alex@ghiti.fr>,
 Vivian Wang <wangruikang@iscas.ac.cn>,
 Yunhui Cui <cuiyunhui@bytedance.com>,
 Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 kasan-dev@googlegroups.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <63411FA9-C16A-4E40-8C3C-13C58FB844A0@linux.dev>
References: <20261102134422.610837-1-alitariq45892@gmail.com>
To: Ali Tariq <alitariq45892@gmail.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 2, 2026, at 21:44, Ali Tariq <alitariq45892@gmail.com> wrote:
>=20
> flush_cache_vmap() sets a per-CPU flag, and a kernel page fault
> that finds the flag set gets an sfence.vma and a retry.
> flush_cache_vmap() only sets the flag for vmalloc, module and vmemmap
> ranges. kasan_populate_vmalloc() maps new shadow pages and calls
> flush_cache_vmap() on the shadow range, so no flag gets set.
> For vmap()-style areas, kasan_unpoison_vmalloc() writes
> the new shadow right away. If the CPU hasn=E2=80=99t seen the new =
entry yet,
> the store faults, and since there is no flag set, the kernel crashes.
>=20
> [    0.675216] Unable to handle kernel paging request at virtual =
address fffffff7c009a000
> Current swapper/0 pgtable: 4K pagesize, 39-bit VAs, =
pgdp=3D0x0000000004504000
> [fffffff7c009a000] pgd=3D000000009ff6e001, p4d=3D000000009ff6e001, =
pud=3D000000009ff6e001, pmd=3D00000000400e7401, pte=3D00000000403cb0e7
> status: 0000000200000120 badaddr: fffffff7c009a000 cause: =
000000000000000f
> __memset+0x60/0xfe
> kasan_unpoison+0x26/0x4e
> __kasan_unpoison_vmalloc+0x20/0x2e
> __get_vm_area_node+0x1c6/0x276
> get_vm_area_caller+0x52/0x84
> vmap+0xf0/0x264
> dma_common_contiguous_remap+0xa0/0xd0
> atomic_pool_expand+0xb6/0x310
> __dma_atomic_pool_init.isra.0+0xf6/0x1c0
> dma_atomic_pool_init+0xf6/0x1aa
> do_one_initcall+0x134/0x928
> kernel_init_freeable+0x532/0x60a
> kernel_init+0x28/0x162
> ret_from_fork_kernel+0x82/0x94c
> ret_from_fork_kernel_asm+0x16/0x18
>=20
> The PTE is valid, so the mapping was in place when the CPU faulted.
>=20
> Tested on Orange Pi RV2: without this patch 2 of 30 boots crashed,
> with it 50 of 50 booted.
>=20
> Add the KASAN shadow region to the ranges for which flush_cache_vmap()
> calls mark_new_valid_map(), as commit 4edd70ee6a7d =
("mm/sparse-vmemmap:
> flush_cache_vmap() after hotplugging vmemmap") did for vmemmap.
>=20
> Fixes: 503638e0babf ("riscv: Stop emitting preventive sfence.vma for =
new vmalloc mappings")
> Signed-off-by: Ali Tariq <alitariq45892@gmail.com>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

