Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD8E475337
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790199501; cv=none; b=gZWr6CXrtCPPHBOuYBWUdbp3Dz1P9V+RpVE99xHnXBx69BCStmtwFHaNyF2hJfz4C5q1buCPPt9xBk5nBr5PdnZaHvF5i5Nzab89hJoKi8LjDm3ma8p9lg5YEgN7xwV00RcckDPcp1nBrLeYpumSnoVBAmIPD0ia+Pmd7oF8C6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790199501; c=relaxed/simple;
	bh=YJsOwx/QHJRKZ+n0C8ukvZV0N0chl7bP1M9sQ8QHM+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8Vtm0LBoQy0S6JnYk/IzsOLY2EPZ1+VA+fdhMUI/0qTaSYPpjL8wnjReHreDu5SqCXypxduAJcET1HQaMeqHADZtztwS2dQqDSvOCbQQj6LaZ0hbYs81U+rD0k8T7aRm72hqfJ7ykAlBwtkBN91m4b0FcPb0Fs+XNPkpQDBPk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxo6gZMN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxo6gZMN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1BE21F000FF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790199499;
	bh=YJsOwx/QHJRKZ+n0C8ukvZV0N0chl7bP1M9sQ8QHM+0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dxo6gZMNT18URkGZhYXcRMlxr2sCiuieBP1kADBFjFrV7hwOqC6KI+cYMVN0+459x
	 7bn80QRNap9jNWfvtKyMpgpbo9dLFi6KDfP2icWTd2ZXz+yFAtVNl4+QreAQpCSN8N
	 pC4LbSpIqLDDzmSsZkRoXkFZ3iOH9lCUYcDsoRc4hRQC8K44gptrtwf20PCytUIj26
	 IePdBbiMQvRknVtoEJFcE09lTXXYBC9s5W2TkhZZjI55udEfooLXi7Jr2biYFbVExJ
	 97k0rjqJWdHJzNynvyNVR0yXYZJ/UHOyaBuKV2u/YIrSlq0Onv6ewm8Kr3NILwH2L2
	 6uCeRWG1jXQsw==
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb766bfd3so10147141cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:38:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwL/cDC+5kAu4ZfUyPMelv1KeNriBhKFiCoyPb/x9dvH3kOxzFLI453FVcFyxNik6gpczeCTxxLrB0f4l8=@vger.kernel.org
X-Gm-Message-State: AFuF++mFeugaBA6B6T9IRGcQa+ykMDkISkmkjypoU0QUQlDpO5v2h2yz
	MuQpbG9HQYb6nn8WPlZhaFglsfyPOBpQQdzhYFv3e21vzfhkAM4CrW43Zoq9NxYxaS1cKdxipjv
	/n3XGvxes0/33MD+87ZoIzOSdoGdwREs=
X-Received: by 2002:a05:620a:2556:b0:939:7c8:78a9 with SMTP id
 af79cd13be357-93c346c0eaemr75510685a.3.1790199499119; Wed, 23 Sep 2026
 14:38:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923062832.479455-1-jiangwen6@xiaomi.com> <20260923062832.479455-4-jiangwen6@xiaomi.com>
In-Reply-To: <20260923062832.479455-4-jiangwen6@xiaomi.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 24 Sep 2026 05:38:07 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4z-oqoxKynRr6mz0-5zZU_2NBnPkwz05CEEHHnwTyqa-Q@mail.gmail.com>
X-Gm-Features: AclHuK9KKxh7jAVCjl18JX2rsGxXVsV-K4ZOPHC6NmnXnXWa0kkH7W0rz6HMa0w
Message-ID: <CAGsJ_4z-oqoxKynRr6mz0-5zZU_2NBnPkwz05CEEHHnwTyqa-Q@mail.gmail.com>
Subject: Re: [PATCH v9 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge()
 for PTE-level block mappings
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, chleroy@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 2:28=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gmail.com=
> wrote:
>
> vmap installs PTE-level block mappings by reusing set_huge_pte_at() and
> huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This makes
> the feature silently unavailable on CONFIG_HUGETLB_PAGE=3Dn kernels and
> couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.
>
> Now that arm64 and powerpc/8xx provide pte_set_huge() and
> pte_clear_huge(), add the generic fallbacks next to the existing
> pmd/pud_set_huge() family and convert vmap_pte_range() and
> vunmap_pte_range() to the new helpers. The CONFIG_HUGETLB_PAGE guards
> around the block-mapping paths are dropped, so PTE-level block mappings
> now also work on CONFIG_HUGETLB_PAGE=3Dn kernels, and mm/vmalloc.c no
> longer includes <linux/hugetlb.h>.
>
> The fallbacks exist only to keep the build working on architectures
> without PTE-level block mapping support. They are unreachable there:

Since this is a `BUILD_BUG`, can the compiler simply eliminate the call?
I guess the build would still pass even without the fallbacks, so this is
more of a build-time check than something needed to keep the build passing?

Am I missing something?

> the callers only run when arch_vmap_pte_range_map_size() or
> arch_vmap_pte_range_unmap_size() return a size other than PAGE_SIZE,
> which requires an arch implementation. BUILD_BUG() makes that
> explicit rather than silently doing nothing.
>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>

Nice to see that `#ifdef CONFIG_HUGETLB_PAGE` and
`#include <linux/hugetlb.h>` are no longer needed in `vmalloc`.

Nothing concerns me except for the changelog issue mentioned above.
Please double-check whether the changelog needs to be corrected.

Reviewed-by: Barry Song <baohua@kernel.org>
