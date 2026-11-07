Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794037212;
	b=fmsMYx7fAgD2UHr6vdrgsvLSqvfcRsl7t8YxmLYkf1HbHqDmd7+6I0ADLLggnBRR5MUw
	 HhgSBfyV/iPjfRyVBk/vgd0bUv9GsudEIWzrGOIei7u4JsQVOLu2Apo8KViqRmvXytrYO
	 BECkLrAUL2DOxGGXzQeYbPhBRfzktpwmwPBUzYcV5EcwUA23qpbxl2bIa5IIOCZNGwI0A
	 uIq+lOtJNrILy1WoHwUyMdfaBsnIkhQietDrmf1CVECAXdHF2Fg6pq2DhBzNY0vep1Azi
	 kpvlXpGFYSITBFQ71Z57rAWOtin6UXgovMIea1yAYOC5LL9hQdBJJSJBionrfCCwkIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794037212;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=8vTtHhOU7KFGccpDaVfJbGmgTDtSx5A2CfyTXw9K8qU=;
	b=PMDPgUFZmjyPO7sEM7xzkWIEBqKI6NHXuYctQuqGv2i3D7sbXrq2ppEAcoie5dllsxY5
	 6s34LPKiKMhpzs5PMIGQ3R3dAhDA79utHmfBkHJYmck7UdFLKareoszucmUOPob7k5JYb
	 PGNutmmS8YTyXfnWxBAJvmXLaVIm72AKGvm9D+KxBgSOZdKJukhLtcSgsA3/boAzw+3b0
	 bxfbyBdJmWe9yPfInaysjPYLjZvtbke6pgBaob7jStZIUY4AyAeYZoD0oALpw2R6Rweqf
	 wTFk28ZDQAqd5iomxaqbQRweWCuzR3xFid9Ogv19y44gSTsbPGAQHzWYGVlMbFscxUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qkxhKiuC;
	arc=none smtp.remote-ip=91.218.175.55
Received: from mta0.migadu.com (out-55.mta0.migadu.com [91.218.175.55])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7937606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 07:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7937606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qkxhKiuC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ba5vOU7cFBOUOtdQvyDB/MD00fPiK2yMPUvY9IZ/14M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794037208; v=1; x=1794642008;
 b=qkxhKiuCf51nEKbt8/RKaTf4dA8yfgY1A+zviok65ANjerB4R7Y9GAqkaj++W+d13UrOBQF/
 ns2+GE/FynhDeIs1BsLoh/FMfbtVcFVuyS3nQYBZ3LGjxgdDULcN/oYGxAtf5kHNERZnywDMRHy
 R358mxNUXLuIWh2qp+k5DW54=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 447480f83695572a;
	Sat, 07 Nov 2026 07:40:06 +0000
X-Mizu-Trace-ID: 447480f83695572a
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2 09/20] hugetlb_vmemmap: Allow architectures to make HVO
 enablement boot-time only
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261003002123.505555-10-jthoughton@google.com>
Date: Sat, 7 Nov 2026 15:39:46 +0800
Cc: Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9448E513-B372-46BB-929B-E0D7D6A6834E@linux.dev>
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-10-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> =
wrote:
>=20
> arm64 needs all CPUs to support hardware updates of the access flag to
> safely update the vmemmap in place, and it will need to refuse to =
online
> CPUs that lack it, but only if HVO may be used. This only works if HVO
> cannot be dynamically enabled, otherwise incompatible CPUs may have
> already been onlined at enable time.
>=20
> Add CONFIG_ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT for architectures =
to
> select. When selected, vmemmap_optimize_enabled is __ro_after_init, so
> it can only be set with the hugetlb_free_vmemmap=3D kernel command =
line
> parameter, and the sysctl is made read-only.
>=20
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> Documentation/admin-guide/sysctl/vm.rst |  3 +++
> fs/Kconfig                              |  3 ++-
> mm/Kconfig                              |  9 +++++++++
> mm/hugetlb_vmemmap.c                    | 17 +++++++++++++++--
> 4 files changed, 29 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/sysctl/vm.rst =
b/Documentation/admin-guide/sysctl/vm.rst
> index 5b318d17aa4b..d962d563cfd4 100644
> --- a/Documentation/admin-guide/sysctl/vm.rst
> +++ b/Documentation/admin-guide/sysctl/vm.rst
> @@ -692,6 +692,9 @@ pages.  So, those surplus pages are still =
optimized until they are no longer
> in use.  You would need to wait for those surplus pages to be released =
before
> there are no optimized pages in the system.
>=20
> +On some architectures, this knob is read-only, and HVO can only be =
enabled or
> +disabled with the hugetlb_free_vmemmap=3D kernel command line =
parameter.
> +
>=20
> nr_hugepages_mempolicy
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/fs/Kconfig b/fs/Kconfig
> index 1454b7fe9641..4222db17ba02 100644
> --- a/fs/Kconfig
> +++ b/fs/Kconfig
> @@ -267,7 +267,8 @@ config HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON
> 	help
> 	  The HugeTLB Vmemmap Optimization (HVO) defaults to off. Say Y =
here to
> 	  enable HVO by default. It can be disabled via =
hugetlb_free_vmemmap=3Doff
> -	  (boot command line) or hugetlb_optimize_vmemmap (sysctl).
> +	  (boot command line) or hugetlb_optimize_vmemmap (sysctl, if =
the
> +	  architecture allows changing it at runtime).
> endif # HUGETLBFS
>=20
> config HUGETLB_PAGE
> diff --git a/mm/Kconfig b/mm/Kconfig
> index acefc994d9a8..ad313fddc9da 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -475,6 +475,15 @@ config ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
> config ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
> 	bool
>=20
> +#
> +# Select this config option from the architecture Kconfig if HugeTLB =
vmemmap
> +# optimization may only be enabled or disabled on the kernel command =
line, e.g.

I suggest using the following phrasing to specify precisely what becomes =
RO.
Something like:

# Select this from the architecture Kconfig if the =
hugetlb_optimize_vmemmap
# sysctl must be read-only.

> +# because the architecture configures the system at boot based on =
whether it
> +# is enabled. This makes the hugetlb_optimize_vmemmap sysctl =
read-only.

I don't think it's necessary to include the last two sentences. This is =
a public
file, and we only need to describe its purpose. What specifically caused =
it is
architectural choice, so we don't need to explain it here.

> +#
> +config ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT

How about ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO? I'll explain the =
reason below.

> +	bool
> +
> config HAVE_MEMBLOCK_PHYS_MAP
> 	bool
>=20
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 817ce39d4cf3..de4148a8aabf 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -428,7 +428,20 @@ static int vmemmap_remap_alloc(const struct =
hstate *h, struct folio *folio,
> 	return ret;
> }
>=20
> -static bool vmemmap_optimize_enabled =3D =
IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
> +/*
> + * Architectures selecting =
CONFIG_ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT rely on
> + * HVO only being enabled or disabled on the kernel command line.
> + */
> +#ifdef CONFIG_ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT
> +#define __vmemmap_optimize_enabled_attr	__ro_after_init

If we do not set vmemmap_optimize_enabled to RO, the implementation =
becomes
much simpler. sysctl is read-only, so it was already impossible to =
modify
vmemmap_optimize_enabled in the first place. Therefore, even without =
this
layer of protection, we lose nothing; on the contrary, we gain a simple =
code
implementation.

> +#define HUGETLB_VMEMMAP_SYSCTL_MODE	0444
> +#else
> +#define __vmemmap_optimize_enabled_attr
> +#define HUGETLB_VMEMMAP_SYSCTL_MODE	0644
> +#endif
> +
> +static bool vmemmap_optimize_enabled __vmemmap_optimize_enabled_attr =
=3D
> +	IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
> static int __init hugetlb_vmemmap_optimize_param(char *buf)
> {
> 	return kstrtobool(buf, &vmemmap_optimize_enabled);
> @@ -751,7 +764,7 @@ static const struct ctl_table =
hugetlb_vmemmap_sysctls[] =3D {
> 		.procname	=3D "hugetlb_optimize_vmemmap",
> 		.data		=3D &vmemmap_optimize_enabled,
> 		.maxlen		=3D sizeof(vmemmap_optimize_enabled),
> -		.mode		=3D 0644,
> +		.mode		=3D HUGETLB_VMEMMAP_SYSCTL_MODE,

So, I think

  .mode =3D IS_ENABLED(ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO) ? =
0444 : 0666,

is simple and enough.

Thanks,
Muchun

> 		.proc_handler	=3D proc_dobool,
> 	},
> };
> --=20
> 2.56.0.rc1.315.gc6ed9934b7-goog
>=20

