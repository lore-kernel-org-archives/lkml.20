Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AEA2F60CC
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 22:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791413188; cv=pass; b=aduhtnOEsLIfcpY0qdCIDz7HzLBzmrTB5jjlRH5+F0cKimpRbagVafCdYWBffcykAnwuCgAKwB0yuN1ZhycFwG4UjzwScGne7xDvy6JoYmfJFk5QZxL18GBeY/eEubQDSQFSEEvyrFot4nCMqnoTE65aIoErJ812F8YtBQVJ95M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791413188; c=relaxed/simple;
	bh=bB4dnxpnMeVzUDLA9nUrJaWQKL4gFOLEEBvhFlUWXIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lYj8+9IqCx7El+ERxRRH13QMfyw1nfS+bF37d30L160TjTdG7KV/2ENIU7Loh2b4jG5z1wRWOLK3Obba+aB9OEU+5Ba+ZVP9iRd09wT8hvg+A/TxZyID+d9H6eXtcUk4wJTTNtNAyp6hRUMAu4emNoeoaXRIBEYtmgVipui4Jxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jX800J8R; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jX800J8R"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8565d77c277so27126897b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 15:46:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791413185; cv=none;
        d=google.com; s=arc-20260327;
        b=khrLvDaD3uENcyQpM++vYfB0kkLcZOiGz4IwHFfc3ExqBDgMa6+MDvix2vWzhMXmCj
         j8KCo9uLexzpHzxZFzvOPmSYFzgEK/MI72TJ14GngPFMbs/LVE9OGjtlm7yxR+TmKfZW
         jmV4GOT20Pd5JSMU4p/HFWZoOYxujdia+WGaHCUq2EXdNLu4U5nS9iOUT0cAilphHNQy
         IDPOVeG4aR7wmVpmyeP9MaEepc6J5yGwuwGXg1EYW064hFv1XPUYEV2EAYJOVS77ljHB
         mNVn8r60edHd7ToegzRwndQWTA7mTRTCHuZ5YaRYn/KlLGhDMuojjxRNdBGnPZe1Bl/e
         tqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yz22l6+7GmF/BYpQ70lHqScFsr3i0zQEuhiHfwUKd5s=;
        fh=hXdVRJq/s7M14CeLqpjzA5IsI1TqwcprvQE68JgnAyY=;
        b=PWrWMpW/KsPAYPgc67WGfrEzcQZRLHGsZPx31k0zxixiFkztQl2N4/vOTFyBec0OQH
         UXeN0D8e5DnhYkienPRAJnc5hyJzs0JCwvLd0HQza4o2KAQAAExKCaXRZN9qAHJBUAcj
         NLKmEsvxlDndecnsScOIe8hanrixmhj/c0lYKnC0Mc5u3mbley0ddTzLSL5cDr+mwfqM
         W4zApviA4W9Yj7Vmw0PHxFLpS2bFKfW23cY9pJQQ6ZHKCxeK9ktuaRd2Vsjk9v6yXFP1
         cx9sS4qhZP5Sf0Vfnd3eBuXzjdQIFfpB6qIkX79t5ooVTPttrQAA3qpsa8tT+aTS7RA4
         cZtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791413185; x=1792017985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yz22l6+7GmF/BYpQ70lHqScFsr3i0zQEuhiHfwUKd5s=;
        b=jX800J8RKDkaBXFrFgcCyN+PytsImIcc4YRHjjuD5NPxmIm9fqIk4M2Ml1LQPkRvkU
         jXxRsYF25b3XK+lF5/K5l7w9kzGFh0yb8pLcZ+H3wCmGLpVcpuQXfRTe/rtlLtOFWgHr
         WBS/Tv+CYfcm7Y2dOPDGPjxwQ07vx0yBC4Yubuq6cigcN1KXgg4V8LgVOAjSSF9mBPxF
         S9+UFQdjrKiaQYqI51ie8S3t8wB5IgdAXguPeuI8Z4CMCshqVea/Ce+UTTyHkSVuMvoo
         Hhkbg9uKKagKsj4TvKVH1w+KOOOV4l8IPOP/uNfJo0f6L8OkaHv6UO0TG8gOTjy4uyzp
         gZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791413185; x=1792017985;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yz22l6+7GmF/BYpQ70lHqScFsr3i0zQEuhiHfwUKd5s=;
        b=qXckAsDxVWAzNdwboHqcszEue5hPxVVBL0+UWRo6RX26YTTWu8NeHrWVTmVAsiiLv0
         TYggprMTsDwTnoWTJeDrNie2GkPJiQksgmkuNufAS9mmtGSUdeuFkMLwBoFXBHcmM6dP
         JrQ49v9WzoXzwytf8AMQ3XenS05p9JVQSZGiziatkaJPaU850910lrwpnphmxspTR/e3
         gPm/6rvK2YaEBZNwwuYCzO/dCsqessMjPr/l5hPTQvTglUFenI5heS3bBCjQMtfUcccZ
         b1bMxsM1utXrR2uRsy0sEkdi78NdYR/Y0qHeNwI1yLBfYWMMymvoIzO92/um/sfQ3FGK
         yi4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxpkUuXjnFsyzGqdKWk42YhwU4Ffq8jFBhINisl0pWC2dxWJ28CXRF373ESs9OiIo3I4OCtNSb56zkttt0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEDxQlqdwp61dea6MHhQuOygYOtddY+Alcuoi545ivOCu9XctK
	Qk/DIvY/qpv+NPE2k7vXvIh1cFo8J/0P+8BSoI3+ipwpL/rK+GG4DYyKkGjfO186a0yxcmLw5lm
	Aj63LDlvWliOS0hTI8Bo2qN1LxWUvB4Q=
X-Gm-Gg: AYBFou0QOGeorzREclmfqcdKoATXR5sO8K8NNbEYzivxPTaFptr+O1IaccRNU3prsa2
	/vyOHnkeXuu3x0tnxYyWbm8m5ej2Zn/Xbp3coq10BCIZJdt+C+mEWsMn6Ay1ARluI6JK7FvkATe
	UPU7Islr0ONcidWXR6IqaDTAcshkR1rFLbgbnjCPWDGUG1eFfBHNjS2KXN+gWc0umhJKPdFCmSL
	5JiOCHbtuNHro6MKk7Lz8lzmCXQysYesEq4P8BU4XFiGuBjSSG3/61F3h/UtXZK1FV6b3Kwrbpd
	Yh4iJSOw37vViJQmlhs/8vdb/qEIx7H4ZqQ6L2ZmaOF1zbEZXfpXjxaB1tan2IZHK3UpSbwwlxf
	MuRm40gzc5E1Cnf4MHdeERxdeU7bX9MhA23gRTpqeBQ==
X-Received: by 2002:a05:690e:16a0:b0:676:8665:d26f with SMTP id
 956f58d0204a3-6790a4e72afmr1974142d50.129.1791413185103; Wed, 07 Oct 2026
 15:46:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com>
In-Reply-To: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 8 Oct 2026 00:46:11 +0200
X-Gm-Features: AclHuK9KYZUiJmmm2EQmaVn9h8dFFdx_V-4eFazKEEm8BWdo0Odf5JkJDem3PCU
Message-ID: <CA+=Fv5SZ+NLSCU_7kNSZYtu0_h_OUuDYnHW54D2eb=X-ysw9dw@mail.gmail.com>
Subject: Re: [PATCH 0/6] alpha: hugetlb support using granularity hints
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

First, thanks alot for taking the time to do this.

On Tue, Oct 6, 2026 at 4:04=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Alpha has no leaf entry above the last page table level, so the usual
> PMD sized huge page is not available to it. What it does have is the
> granularity hint, bits <6:5> of the PTE, described in Table 17-3 of the
> Alpha Architecture Reference Manual: a hint of order N marks a PTE as
> one of 8^N physically contiguous, naturally aligned pages that the
> translation buffer is permitted to map with a single entry. With 8KB
> pages that gives 64KB, 512KB and 4MB blocks, and this series registers
> all three as hstates.
>
> This works like arm64's contiguous PTE support rather than RISC-V's
> NAPOT: every PTE of a block keeps the frame number of its own page, so a
> block is written with set_ptes() and the frame number advances across
> it. There is no PMD sized huge page, and hence no transparent huge
> pages, no PMD page table sharing and no gigantic pages.
>
> The architecture requires all PTEs of a block to agree in bits <15:0>,
> and both __ACCESS_BITS and __DIRTY_BITS reach into that range, so every
> update rewrites the whole block and huge_ptep_get() merges the young and
> dirty state back together. Changes to a valid block go through break
> before make, as section 11.6.1 requires; the invalidate there has to
> assume the hint is zero and so must cover every page of the block, which
> flush_tlb_range() on alpha already exceeds, since it rolls the address
> space number.
>
> The hint is advisory. An implementation that ignores it still translates
> correctly through the individual PTEs, so this is safe on every Alpha,
> and gup_fast needs no changes. The console block that would report which
> hint sizes the translation buffer implements was never filled in by any
> console through EV7, so which sizes an implementation honors can only be
> established by measuring, as the last section does for EV7.
>
> Patches 1 and 2 are independent fixes. Patch 1 adds a
> page_table_check_pte_clear() call missing from alpha's
> ptep_get_and_clear(). Patch 2 fixes a BUG() that testing this series
> turned up: do_page_fault() fell through to BUG() on VM_FAULT_HWPOISON,
> reachable through UFFDIO_POISON without any memory failure support.
> Patch 3 documents that the bits Linux calls _PAGE_URE and _PAGE_UWE are
> the architecture's ERE and EWE, which matters when reading PTE layout
> tables alongside this code. Patches 4 and 5 are groundwork and patch 6
> is the implementation.
>
> Testing
> =3D=3D=3D=3D=3D=3D=3D
>
> Tested on megalith (EV7 Marvel, 8GB), with two CPUs and again with one,
> cross-built with alpha-unknown-linux-gnu-gcc, with CONFIG_DEBUG_VM=3Dy,
> CONFIG_DEBUG_VM_PGTABLE=3Dy, CONFIG_PAGE_TABLE_CHECK_ENFORCED=3Dy and
> CONFIG_CGROUP_HUGETLB=3Dy. All three hint sizes register as hstates.
>
> mm selftests, the same in both configurations: hugetlb 10/10,
> userfaultfd and cow 7 pass 1 skip (uffd-wp-mremap), 0 fail, including
> uffd-stress hugetlb and hugetlb-private at 128MB/32 threads.
> debug_vm_pgtable validates clean at boot. No page_table_check reports
> and no DEBUG_VM splats in any run.
>
> Ad hoc tests written for this series also pass at all three sizes: dense
> per-base-page write and read back across a block, which catches a wrong
> frame number inside a block that a strided pattern would alias over;
> mprotect down to PROT_READ and back, including a middle-block-only case,
> exercising break before make; fork COW; hugetlbfs shared mappings
> checked through pread and through a second independent mapping; hole
> punch of a middle block with both neighbors and the refaulted hole
> checked; ftruncate down and back up; and the 4MB -> 512KB -> 64KB demote
> chain with exact count checks. All of it again with four concurrent
> copies, and the whole suite ten times in a row.
>
> An earlier revision of the series was also tested on up1500 (EV68AL
> Nautilus, UP, 4GB) with CONFIG_DEBUG_VM=3Dy and
> CONFIG_PAGE_TABLE_CHECK_ENFORCED=3Dy. That machine has not been retested
> with this revision.
>
> Magnus Lindholm also tested the series on SMP, on a UP2000+ (2x EV68AL
> 833 MHz), including a multithreaded stress test. It found that
> huge_ptep_set_access_flags() broke and rewrote a block on every fault,
> so two threads on different CPUs could keep each other faulting: 17,316
> faults in 6 seconds after one permission change on a 4MB page. With the
> check now in patch 6 the same change causes one fault. No writes were
> lost with or without it.
>

I've now run this revision on the UP2000+, both as posted and on top of
my TLB shootdown series [1]: run-ghtests.sh 200 times, the hugetlb,
userfaultfd and cow selftests (17 pass, 1 skip), and the stress test at
all three sizes, with no lost writes and at most one fault after a
permission change on either kernel.

That doesn't make [1] optional. The stress test flushes only from
threads of the process itself, and its threads keep writing, which
hides stale translations (see [1]'s cover letter); [1] fixes flushes
that miss a CPU after fork, under lazy TLB, or on the calling CPU.
Break before make on SMP needs flush_tlb_mm() to reach every CPU.

EV68AL also honors all three hint sizes: retired instructions per
access, which include the PALcode DTB fill, drop to the no-miss level
exactly where each size fits the 128-entry DTB, whose entries can each
map 1, 8, 64 or 512 pages (21264/EV67 HRM section 2.1.6.4).

[1] https://lore.kernel.org/linux-alpha/20260923074903.862898-1-linmag7@gma=
il.com/T/#t

> Hugepage migration is not enabled. It has no test coverage: the
> migration, rmap and ksm selftests do not cross-build for want of libnuma
> in the alpha sysroot, and neither machine is multi-node.
>
> Does the hint do anything?
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>
> On EV7, yes. Since the hint is advisory there is no way to ask the
> hardware whether it implements one, and the console block that would
> report it was never filled in, so the only way to find out is to
> measure.
>
> Comparing the three hint sizes against each other rather than against
> normal pages avoids the hugetlb-versus-anonymous confound. A random
> pointer chase touches one cache line per 8KB base page, with the
> permutation seeded only from the page count, so every backing walks an
> identical sequence over an identical footprint and the only variable is
> how many DTB entries the working set needs. EV6 and EV7 have a 128 entry
> fully associative DTB, so coverage is 128 times the page size: 1MB with
> base pages, 8MB at 64KB, 64MB at 512KB, 512MB at 4MB.
>
> Nanoseconds per access on megalith with one CPU, 8,000,000 accesses per
> pass. Each figure is the best of ten runs, every run on freshly
> allocated memory: single runs differ by 40% or more from one allocation
> to the next, at every page size including base pages, so the best run is
> the one to compare.
>
>      size      base(8KB)       64KB      512KB     4096KB
>       1 MB          11.24      11.11      15.02      11.72
>       4 MB         155.47     104.54     105.03     104.17
>      16 MB         156.69     127.50     109.55     105.52
>      64 MB         154.61     146.79     110.16     105.76
>     256 MB         172.56     171.34     175.74     107.47
>    1024 MB         232.40     230.08     222.15     190.03
>
> Each size keeps its advantage until the working set passes its own
> coverage and then converges on the base page column: 64KB is useful to
> about 8MB, 512KB to about 64MB, 4MB to about 512MB.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
> Matt Turner (6):
>       alpha: add missing page_table_check_pte_clear() to ptep_get_and_cle=
ar()
>       alpha: handle VM_FAULT_HWPOISON in do_page_fault()
>       alpha: clarify that _PAGE_URE and _PAGE_UWE are the Executive bits
>       alpha: define granularity hint PTE bits
>       alpha: align hugetlb mappings in arch_get_unmapped_area()
>       alpha: implement hugetlb support
>
>  arch/alpha/Kconfig               |   1 +
>  arch/alpha/include/asm/hugetlb.h |  43 ++++++
>  arch/alpha/include/asm/page.h    |  13 ++
>  arch/alpha/include/asm/pgtable.h |  69 ++++++++-
>  arch/alpha/kernel/osf_sys.c      |  14 +-
>  arch/alpha/mm/Makefile           |   2 +
>  arch/alpha/mm/fault.c            |  19 +++
>  arch/alpha/mm/hugetlbpage.c      | 306 +++++++++++++++++++++++++++++++++=
++++++
>  8 files changed, 456 insertions(+), 11 deletions(-)
> ---
> base-commit: e946efcc89066c5d80acbae42d015a4da33a11de
> change-id: 20260912-alpha-hugepages-0c6cb6c0995d
>
> Best regards,
> --
> Matt Turner <mattst88@gmail.com>
>


Magnus
