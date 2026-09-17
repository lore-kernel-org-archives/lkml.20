Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCDA3B14C2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789687710; cv=none; b=aimMnMJCowShqyT44DpkL1PXJyU6bC2shX/8muGV2CN+9NRBiQLRj4Xj1z8WJLXq7RwjZ1P/20AyaqlmAZqngLEH8jYYqyZv+Z3runP90shpeiIokOvnAjzEYax+uh+w88ZUFSAYgaYRRGarMkvHz5V6DICbvDlIcvwqeBx2zrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789687710; c=relaxed/simple;
	bh=IWJGRC9xwxNiRy963FgpQnyOwKOSfdYPf5s+6GKenIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O3AJ2xHzWvR2QY3qnhzrZfr0ovXKa3CbYfvcHmUl3CYmNRJdAspVRGHpqYcH7KY2YQ9cOj7yGIQUCMfhlOV6C42Y7+Gu7Mq6EuK0Nf42+4RwhWEMsrG5miFbMnR2UfAdd5OSUqPWQZE4mq0xnFBR2e0YcCUWbVfc5tU8emE2CSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jMRG6GJ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMRG6GJ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200C51F000FF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789687709;
	bh=IWJGRC9xwxNiRy963FgpQnyOwKOSfdYPf5s+6GKenIQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jMRG6GJ+jPVZWQcib59ikf8sCh9LM7ZZPeIKXq2t1Qa616NOpa2A9yZE8zyfkQsNp
	 XDywILAj2dBZCJHat9rjUD9SXiyT+FIR/P9rULMIOVe6G7mThYpyxf/+gwakDJDQ0p
	 JX+pek5ZzlealjcCSM5DFo3m1D7sEjNa0T+wq8ngURIp9C5stDPdLxz2oxFn+dftXx
	 wj0/JQU+Tdox291aHVZBLSA+nZPmtbE9wAtJqIrz+LX0DcIZUZqN7dHtBM74cZwTAl
	 YOE6AvLK3Mngyu68jQSlXiPocReBiKW2XwB/no1ZLubp2CR+4ZLiALYzxrr1ZKXypZ
	 +lcif3Qk/CfWA==
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb76ef19aso1363811cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:28:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzJfe7c1Q8rstSd832Rjky7Uqzv0AB+0Xf/TtwAb5ClbpTr9aHQYmx3FZT/C1+yeMJ/MFFSEIcRK1Wj6OI=@vger.kernel.org
X-Gm-Message-State: AFuF++miGJm3Xj0+AtPBAX87JQjE8i8dR+02cYXqEHqaETCaVplwp5qC
	EkQmqUhHUaA4ZFErqjPtpjFmc+jd3B9qDP7b4fI0WytF3lFdcij1pu8dNSWVf9j55jbPj0USBeH
	PK3Zdof/mlfFbuHx/0wt1EjQZdwKTEdw=
X-Received: by 2002:a05:620a:280b:b0:93b:d79e:1907 with SMTP id
 af79cd13be357-93bdc9fdcc8mr86080885a.74.1789687708536; Thu, 17 Sep 2026
 16:28:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com> <20260917052933.188679-3-jiangwenxiaomi@gmail.com>
In-Reply-To: <20260917052933.188679-3-jiangwenxiaomi@gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 18 Sep 2026 07:28:17 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wDbDLv5mxfNiyraOS6tKCSV+g8xL5+SsRCyqLnN2ON7A@mail.gmail.com>
X-Gm-Features: AcwNN1W3AgFfdfDDbqU2CtZG2lqgv5Z_JbQps_-ItFYT5oYqTIYjvyQ2wpW_oIg
Message-ID: <CAGsJ_4wDbDLv5mxfNiyraOS6tKCSV+g8xL5+SsRCyqLnN2ON7A@mail.gmail.com>
Subject: Re: [PATCH v8 02/10] powerpc/8xx: add pte_set_huge()
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

On Thu, Sep 17, 2026 at 1:30=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gmail.com=
> wrote:
>
> From: Wen Jiang <jiangwen6@xiaomi.com>
>
> vmap installs PTE-level block mappings (SZ_16K/SZ_512K on powerpc/8xx)
> by reusing set_huge_pte_at(), a HugeTLB helper gated by
> CONFIG_HUGETLB_PAGE. This makes the feature silently unavailable on
> CONFIG_HUGETLB_PAGE=3Dn kernels and couples mm/vmalloc.c to HugeTLB
> internals it does not otherwise need.
>
> Add pte_set_huge() to powerpc/8xx, next to the existing
> pmd_clear_huge()/pud_clear_huge() in mm/nohash/8xx.c. It builds the huge
> PTE and writes it into the backing cells directly, without going through
> set_huge_pte_at(), so it does not depend on CONFIG_HUGETLB_PAGE.
>
> No pte_clear_huge() is needed: 8xx does not implement
> arch_vmap_pte_range_unmap_size(), so the vmap unmap path never takes the
> block-mapping branch.

I assume you mean the block-unmapping (or PTE-clearing) branch.
Please make this clear in the changelog.

>
> In practice PPC_8xx selects HUGETLBFS unconditionally, so
> CONFIG_HUGETLB_PAGE=3Dn does not occur there today; this is a decoupling
> cleanup rather than a new configuration.
>
> There is no caller yet: mm/vmalloc.c is converted later in this series,
> once the generic fallbacks are in place.
>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> ---

BTW, this patch applies cleanly to the mm-new branch.

Best Regards
Barry
