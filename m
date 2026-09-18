Received: from mta0.migadu.com (out-145.mta0.migadu.com [91.218.175.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEDE3A5453
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718998; cv=none; b=gY1r8eM3UvGWCHhARzO2vSVQJwKao6kVIAgIP0IICRQYATwv5weo/Y1RjfUsvz6focM6d3w29TcVDNIMgn2lQ1Y760hPrmMPzUF5DpTEIA1vlrhlq6BGte/5zQLnfoxl1r7UO9T3U3d4I3b3tG9ffeJviZWeLwNiwu+waNZjVUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718998; c=relaxed/simple;
	bh=nOrA6LUUXVDyAS34aH1r5AVGEJg8nxE5D7IKoW8+wIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ey1V75k+5zOV3Ds5O0litNRgj/aLvdkSbIvEQHftcIcOISpmBwHmk4cvl25zLO5ZXVWTpI2puewgMChCIpYimf/djECUPn7IIRtHrE1gPOuAkQvfu2GBIF+VQa5984h6xwwHHjaFQddsVUOyadVWVUFI5c3g0B2EUknK6Hplma4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ADFQDA+8; arc=none smtp.client-ip=91.218.175.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ADFQDA+8"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nOrA6LUUXVDyAS34aH1r5AVGEJg8nxE5D7IKoW8+wIQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789718994; v=1; x=1790323794;
 b=ADFQDA+8TsnOkukS5fm8rZm9Oyd+Iw4z2srzzl8WrTbKLBBVgPWXUyKgqFQPgR/K+hDwYhDb
 B7cGxqBI2yqG31O7adiQ76NoqZ5urKgGQZj3OxckVHflyNIep9ss948jyETzhw6XZeHIrjthTbY
 RT0ebUOZjFCZglV1SThXrPuE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id db6dbc05fe83f0e0;
	Fri, 18 Sep 2026 08:09:53 +0000
X-Mizu-Trace-ID: db6dbc05fe83f0e0
X-Migadu-Flow: FLOW_OUT
Date: Fri, 18 Sep 2026 16:09:37 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Wandun Chen <chenwandun1@gmail.com>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, robh@kernel.org,
	saravanak@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
	pasha.tatashin@soleen.com, pratyush@kernel.org,
	m.szyprowski@samsung.com, mark.rutland@arm.com, kernel@xen0n.name,
	alex@ghiti.fr, hpa@zytor.com, ruirui.yang@linux.dev,
	robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	kexec@lists.infradead.org, linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v6 10/10] crash_core: skip MEMBLOCK_NODUMP regions when
 building vmcore ELF header
Message-ID: <aqzxwd6TXxbempxx@fedora>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-11-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902073116.802752-11-chenwandun1@gmail.com>

On 09/02/26 at 03:31pm, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
> 
> Reserve regions (for GPU, DSP, ...) carry no data useful for crash
> analysis. Exclude MEMBLOCK_NODUMP regions from the vmcore ELF header to
> reduce vmcore size and capture time. crash_should_skip_region() now also
> returns true for MEMBLOCK_NODUMP.
> 
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
> Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
> ---
>  kernel/crash_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Baoquan He <baoquan.he@linux.dev>

> 
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index bd64cf585795..b0e618e13588 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -270,10 +270,10 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>  	return 0;
>  }
>  
> -/* Exclude NOMAP regions from the vmcore. */
> +/* Exclude NOMAP and NODUMP regions from the vmcore. */
>  static bool crash_should_skip_region(struct memblock_region *reg)
>  {
> -	return memblock_is_nomap(reg);
> +	return memblock_is_nomap(reg) || memblock_is_nodump(reg);
>  }
>  
>  static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
> -- 
> 2.43.0
> 
