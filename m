Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794349418;
	b=ULuTwO5Ppg6aQPTIlgY2Fg9H0sNiKMw8hLC/+6GNsmmFcYXdyopMTq/MO2aGWFzWFwB5
	 +PRnKoEx9WIkuGRIhIhNZRYtX8yNCj1md1FkfWus2tJkPM7I26Hk+UwgCcM7V+VIyOqdi
	 2ab231EDYM9qr3qFWiu59HwipqOPJzKaXFuLgjLmBXRwvhxlnS07EjoYB9D0LAL3FNcv8
	 94V7hpXH+JtUGbIVEHTgb0X462SPgx2eV/9M4P04PSsrN46w7XYcYqiqhvg/uh4GZabxw
	 oajWIbEfdr2yfeRQK2+bhtzdtUskgz+M7uQui4ty+HiT7EIGM870nBA2OQbBp8uDB3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794349418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MzZ1z0KVM3oeEIZUdt7Z+pU3mVSpY3HkCpsElCBUhqA=;
	b=swnnLcEDQRHq6+yPNs0u7hNvtdNXMfpqDxCI6QzikuUotM0VfE5Y7fajRg+hLCesDOY7
	 8zVQtYfhk3w9cakPazGiepR4bd/9BdQ7CWszLUPcCJVB24i8WbNXhGnoSCIznp6gFxP97
	 W8P5nKfgWSMG51lK+huI1KkJ3DGmT9eOBV8IfS7G1G5sgCS479vy54v9GYq8CJaCS1XgY
	 v+YerbyLnYnJ5FIO/j8YZvnM8y3rT/c0mwCS5p+yqzwuUw6DS0QbgiTaJbJMlKCkcg+S0
	 gkdnYlrxYRWokG9oEIw5r9BUYLoWsG8cp1/5NwI+vgZQOQxRUt9mE0qzDA1vcvYWNwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Pbc6lnsH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A40606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14A40606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Pbc6lnsH
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c505186727fso169299666b.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:23:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794349416; cv=none;
        d=google.com; s=arc-20260327;
        b=OYlzc59bfCG6u8b0wRawKNpk1UkwgBXw9tV5NNEuq6qT/X/ZoDpccNkpEiUDmNExOv
         Yn+WZHd9UCn19SzAlxJ/AqBNyO690qrqwoEtHJQhqPK7KgIP/YcfwqlYMXwj5P23GJZ4
         Gvrrn8IQxr80w5ACW+BSj3/34Tb83Q5uINol1zh6CjSQFJQBcX2IGtjFVBg34HEfU++d
         Mst/XfCuuPOJ2F/ccVPR5MArLgbUVIkySLccq8+maF9sJ+Bn+m4FGVK67W50HCbLJ/UN
         fuS61j1WIARZYM4+BwIDqPhsw+8hkPD3/UcaMgMr4o16Wtpgj+Ptqxw0CvPSRKX8AHky
         Cu0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MzZ1z0KVM3oeEIZUdt7Z+pU3mVSpY3HkCpsElCBUhqA=;
        fh=U1Wp+g9pWJSym3BYrl3ygNZ3BzOR4Ot3bRiMjWpocVs=;
        b=nKP0BHf24BVIengrNKaIntN5vwWF5CgTVICbZpc7McE3ugYeKv4tID0RD82/shTquk
         WyN7xgzvY+P3xsg5WdKeiguSFGBwyQ64TsbM0DFoejrKeaxatSouo1nXJa/xTyEVofVr
         24NelzbHeILfvtiYUaFOljLPlZJBCsmWD14ICcHO2sFkAA33rrrvlFMC8dEi0QsYCzpv
         KZTpuCPsUU9AvukC+u117Q83a4FlyYSNDsoxvfLX+WwBpqI6IdREFp9Agtsbot/0pWnm
         EifS+m+BXt5Hh03kunViHT+4aTYxxlPXJg0p4k/KJWpwzGO5ceqiOZ2kqlq9LTc9H+cF
         aVIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794349416; x=1794954216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MzZ1z0KVM3oeEIZUdt7Z+pU3mVSpY3HkCpsElCBUhqA=;
        b=Pbc6lnsHsAAhfFpNVW7DDcj0jqIXMtRXsUDXC8tWlUpYVhBTy7b7vjqeeHJW80b0zk
         kHu13sCWa4RwgqzxPKgeku7B9GeB0cGh657+EQqSW0zxYcJ3iG8ZMX5HfVyI9+yW20lg
         EskMi4yuZe97GH0jRSCp9DGDXu2LR6kRbZhKmJe6OESCWpjMYSq/hFBZ5JZBIgkRT7UT
         wUkQIZGFo8FeVWSb6aiCudsCTbUYCrZ2A+xQn/A7bM2UikSA73jR46w25KIi85FfJT3t
         rDh/EYWMr3OxwEeVeNBYgLePpY1RlLK4Sp2MS7RveWTk7NUiYbxFwTLi8mFVqEUuoHlS
         WmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794349416; x=1794954216;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MzZ1z0KVM3oeEIZUdt7Z+pU3mVSpY3HkCpsElCBUhqA=;
        b=AX0CsT/JwKGL7VCPwDj9lrJ0UkS9ybUeVO9TSJopiAeuLJK3ULQtqI+PTwdaXubCbM
         3i/+Tz5ULz1BUwbAmgj9ixHJAIN0ub6CSZwQ0UUWhqiI+hP88u1AcqrHp1MZcB0HoBbQ
         yTIUteZw/1wehp/7gyLPhNSteNLJtQms6UaNOG45Xlmu+LatoO/9gdjtGmvHNbLLx7DT
         2wQoHPeyRrpwn/NV1QwzXVq7gE4GympOvn5fMZ4ivIB9jZdIgeINM2IZXib6x9uYR27f
         uCawuU6VzFLtPbQkJ8K9j+Jd9EgkKl7irThD5Lc8tdaZ1bWCb0xVTXOP7ECaCNbV4eSl
         r07w==
X-Forwarded-Encrypted: i=1; AL+hErEgALUgsmzExbjjIIqpX1qiulEjcH88EffZAov6CT5A58RFzOFUFtKnhkmVcuYssvh5KsDn9HgbJUiWPTA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8m1ZEprPdZGxD83xAhyCQ9gFUFvkD//qouiVUNSbnISqGtolB
	WPOoxS1svuIgxHToZkkSLXn9GF05xKhdb8yuEswVi8CupYbWHYmUB+gnWy79fetZ6cNp47OapLZ
	0Lff3rQruaghhT1CPpM5HN7RJk6/I80TSDANJbUAB
X-Gm-Gg: AYBFou30/jUPg8aOhNfmTEoeI4LKyH3TCv6yBQAWO11UFL/XgBhXUGMIY78n3iORtfU
	l/LQwj6ReHIxpfDnqfFqnKWGpEbYQvqRyy6BdHCtf0J9bZRNX3ZuggZ4FWyIZRb3T7I/ltyI5h/
	TAMrd9fCvc4r8Rrw16cUleimjG6kCOXgVzfdtdfutCvmvowDp//tzRtn1yBPUKhtRH20WVrmLNQ
	5M4i5hnLZppc4aa68nQvQTnLnlvKGJhkQxOs7KqnI6ZdZ5vZA0aI9Bh3r+VwIjMZ2y8V0Kex5A3
	rccKoH11BhGwsM0SMfSajmWjUDMWyjdok3JDoav/bxtVQ6/QcEMyzgTsUL9D8k7PYxHK6YsaJwY
	fcdr/Ozi60eBr0L11kz4VrnYlzbFTHmOtQZ631OYQ8oEkhLb9aWV5QCWMNtbl6dAo8Bdm9GXgW5
	OzYvOptzmz52OZi1foRsptCD9mdpoaO+CAW9UFzGos8R+DULhuvn4dYEaOYYrY5VRDAnr2l4vaN
	hIKTK3mdA==
X-Received: by 2002:a17:907:a08a:b0:c2a:b1cc:158d with SMTP id
 a640c23a62f3a-c5066cab80amr34767966b.32.1794349415908; Tue, 10 Nov 2026
 14:23:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-14-jthoughton@google.com> <CAF9824D-CDC5-48E6-A1F6-840CB299EADB@linux.dev>
 <3a66ba8f-96dd-4215-8c4d-0cc3c286375a@huawei.com>
In-Reply-To: <3a66ba8f-96dd-4215-8c4d-0cc3c286375a@huawei.com>
From: James Houghton <jthoughton@google.com>
Date: Tue, 10 Nov 2026 14:22:58 -0800
X-Gm-Features: AclHuK-LfjoZOtKEGwbFXm4SDbHWSiIOi9H9ah6KA9x7oxgjCWZK8mc2-sY7pxs
Message-ID: <CADrL8HVVLG=MPypRoqC-iGope6tFqpg1Af5hZT=zRk2FFqxYaw@mail.gmail.com>
Subject: Re: [PATCH v2 13/20] arm64: Support hugetlb vmemmap optimization
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Muchun Song <muchun.song@linux.dev>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 1:16=E2=80=AFAM Kefeng Wang <wangkefeng.wang@huawei=
.com> wrote:
>
>
>
> On 11/7/2026 2:45 PM, Muchun Song wrote:
> >
> >
> >> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> wrote=
:
> >>
> >> Support HVO if HW AF and BBML3 are supported. These are the required
> >> features for the vmemmap to be modified in place.
> >>
> >> On arm64 systems that do not have the required hardware features to
> >> support HVO, the HVO sysctl will not appear, and any attempts to enabl=
e
> >> HVO (either via the command line or via
> >> CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=3Dy) will have no effe=
ct.
> >>
> >> Signed-off-by: James Houghton <jthoughton@google.com>
> >> ---
> >> arch/arm64/Kconfig               | 2 ++
> >> arch/arm64/include/asm/hugetlb.h | 7 +++++++
> >> mm/hugetlb_vmemmap.c             | 4 ++++
> >> 3 files changed, 13 insertions(+)
> >>
> >> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> >> index b51d23a62c92..e4c87487bc7f 100644
> >> --- a/arch/arm64/Kconfig
> >> +++ b/arch/arm64/Kconfig
> >> @@ -92,7 +92,9 @@ config ARM64
> >>      select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
> >>      select ARCH_WANT_FRAME_POINTERS
> >>      select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_P=
AGES && !ARM64_VA_BITS_36)
> >> +    select ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT
> >>      select ARCH_WANT_LD_ORPHAN_WARN
> >> +    select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP if ARM64_HW_AFDBM
> >
> > Because vmemmap optimization depends on compound_info_has_mask(), befor=
e
> > enabling HVO on arm64, its vmemmap start address needs to be aligned to
> > MAX_FOLIO_VMEMMAP_ALIGN. Therefore, a prerequisite patch is required.
> >
>
> Agreed, we tried to enable ARCH_WANT_OPTIMIZE_DAX_VMEMMAP[1] on ARM64.
> If the alignment is not performed, a warning will be triggered with
> DEBUG_VM, see sparse_init(). The same issue applies to
> ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP.
>
>
> [1] enable ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 1075bc661833..649244e55c4b 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -94,6 +94,7 @@ config ARM64
>          select ARCH_WANT_FRAME_POINTERS
>          select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES ||
> (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
>          select ARCH_WANT_LD_ORPHAN_WARN
> +       select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
>          select ARCH_WANTS_EXECMEM_LATE
>          select ARCH_WANTS_NO_INSTR
>          select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 4e7682dfe366..6808529873a9 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -91,11 +91,9 @@ phys_addr_t __ro_after_init arm64_dma_phys_limit;
>    * has a direct correspondence, and needs to appear sufficiently aligne=
d
>    * in the virtual address space.
>    */
> -#if ARM64_MEMSTART_SHIFT < SECTION_SIZE_BITS
> -#define ARM64_MEMSTART_ALIGN   (1UL << SECTION_SIZE_BITS)
> -#else
> -#define ARM64_MEMSTART_ALIGN   (1UL << ARM64_MEMSTART_SHIFT)
> -#endif
> +#define ARM64_MEMSTART_ALIGN                                          \
> +       max_t(u64, 1UL << max(SECTION_SIZE_BITS, ARM64_MEMSTART_SHIFT), \
> +               PFN_PHYS(MAX_FOLIO_VMEMMAP_ALIGN / sizeof(struct page)))

Thanks, Muchun and Kefeng. I never hit this warning, I think because I
was only using 4K base pages. I'll make sure to test with 16K and 64K
base pages before sending v3. I'll make the same fix, though I think I
will write it differently.
