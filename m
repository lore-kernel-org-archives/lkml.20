Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964763;
	b=j8DDVzQ4Hz9pAfxxfElCMCT1okMHK4gn/DRBVmo2dz2xzPvHYyVLbtiBjnNugI5q7Es/
	 HuX2rWPBBpcYV4Hp5ZsH8tte16Zv2m3oaeVhcduTXYaaCoHyxd/Zu9tUPwChgSf7iFhMW
	 v1UERH+6ThTRACUkTlkaLayPZxKO/Whr2Zx02co065dGoiJaJBXSvLjwWoS7dgJp3Q0vl
	 VC1DnXQnjV1OVannD5tKiaMUoNEtE9TUb4qzZ7JRbHZ3RyXGkxBSIHaa36tcUFkjwW0CF
	 KasoyUaH2PgzZj7VLx5+JrQD6qW+1WtJTYPjqsst/DykQ/GSniJQn07xImnpZOicEaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964763;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=VwYktvc9ZuSAG/AWyoWRNsgxr2Z6jBVkd5OucG0+82I=;
	b=MblEaGyLTye/pcAMT6A9y5szs8NjSRyGFeFUPVGgam9FpGGzwXFyjFgSl+vfmSQC3m30
	 BS8QTKyU+827loNgf01zdZyF03Ei3uYHxAV/gQSgHhXNbAeZgS+Ri13x9w+MiS/JhUaIx
	 eQovrUQPQsKYHArwepCrqGg/w/kcMuGh3S1QN0VT58ve/Ul2bo/wLwazVe3ATRkwVUDvb
	 zFXONwVAKYoUIPsC6A4dk/osA2TgMDnYdDopXhXoikcPZzhwwybF1xtKNXvtQ4YexW4mu
	 F++TD43IKJ5I+pPlOK3sr+rq5nXA9WrCME1CaOroj+evo8hyf7KhpBsdQvqSx0LBUxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WeqmzYVB;
	arc=none smtp.remote-ip=95.215.58.40
Received: from mta1.migadu.com (out-40.mta1.migadu.com [95.215.58.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449BC60A3802
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 449BC60A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WeqmzYVB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zs6GksGR9IOQ4D/rhKg8wscXt05dWTxmDSpfW/B3uBQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793964760; v=1; x=1794569560;
 b=WeqmzYVBURV01w5x7GcEBDYjXm9yKn0qQevURH3Nwq59SYpPGhK4Xwb0Bl0/xjBEkKks3HbY
 9FyqoQsmaghsqeYN6moedjufSp5oIWAzzLzlUJHw1W3EBHFo45Cj6Bc4Exr8Qu0VNUStdMm5G6E
 hSY1LZ9e2cFF7KFuSJ794bXU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5cbb76e1fbfc8049;
	Fri, 06 Nov 2026 11:32:40 +0000
X-Mizu-Trace-ID: 5cbb76e1fbfc8049
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bff701efa5so3201e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:32:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxWhiH2Lcv7mLBxmvBFZKK01klXscgQqc/jDyE5XrFVhTru+XPT9pjYOcR18o+texNHpC1fFMQ/nvUOZ+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jK6Kmi23oVIaNL0DkvTJLM24EYU+z3VUa3bR8C14nUZlH+mHi
	Jueafa6QqZeVeZvuuWF/J6t3hpCac5f6JI64CrOmw1ldwpj/UlNXd6NOMc4b9NgPLwR2rGm7RHI
	tnU+7SjA0mSZAjMbeDM95jVn7Dbqs0lxr02LWJCCb
X-Received: by 2002:a05:6512:3c84:b0:5c0:1b9:2de8 with SMTP id
 2adb3069b0e04-5c006378923mr59625e87.0.1793964754169; Fri, 06 Nov 2026
 03:32:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu> <20261105-hyp-pool-and-map-v2-1-44a6ca90190b@cs.columbia.edu>
In-Reply-To: <20261105-hyp-pool-and-map-v2-1-44a6ca90190b@cs.columbia.edu>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 6 Nov 2026 11:31:57 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxXpA6sCrSmwRJBA=YKGfNP4zs-THhheRHTaq2BfYY-Lw@mail.gmail.com>
X-Gm-Features: AclHuK9gc8zZSVttdzXS2GHVj1w7PkDDqC-dBzIEQ_RXvW813sjnQFEQOIIR5dE
Message-ID: <CA+EHjTxXpA6sCrSmwRJBA=YKGfNP4zs-THhheRHTaq2BfYY-Lw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] KVM: arm64: Compute hyp early-allocation and pool
 sizes in 64 bits
To: xuheng@cs.columbia.edu
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Xuheng,

On Thu, 05 Nov 2026 22:59:48 +0000, Xuheng Li <xuheng@cs.columbia.edu> wrote:
> hyp_early_alloc_contig() and hyp_pool_init() both take a page count as
> an unsigned int and compute the size in bytes as nr_pages << PAGE_SHIFT
> in 32 bits.  For 4 GiB or more (nr_pages >= 2^20 with 4 KiB pages) the
> shift overflows.

Mostafa (Cc'd) posted a fix for the same truncation in July [1],
widening the parameters to unsigned long instead. Would you be OK
picking up his patch for v3, keeping him as the author and your
description and tags?

> Two of the regions that pKVM carves out at boot are sized from the
> amount of memory: hyp_s1_pgtable_pages() for the hyp page tables (hpool)
> and host_s2_pgtable_pages() for the host stage-2 pool both provision
> page-granular tables for all of memory, about one page per 2 MiB of
> RAM, so they reach 4 GiB on a machine with about 2 TiB of RAM.  Arm
> systems of that size exist, for example AWS Graviton4 x8g.metal-48xl
> instances (3 TiB) and Ampere Altra Max servers (up to 4 TiB per
> socket).

Could you also list the hyp vmemmap here? It's sized the same way and
overflows at 2 TiB too.

> On such a machine, divide_memory_pool() gets a truncated hyp page-table
> region from hyp_early_alloc_contig(), so the host stage-2 region and the
> FF-A proxy pages that follow it start inside the range that hpool will
> own.  hyp_pool_init() then attaches all nr_pages pages of each pool to
> its free lists, so hpool and host_s2_pool share pages and the same page
> can be handed out twice, for example as a hyp stage-1 table and as a
> host stage-2 table.  hyp_pool_init() also derives range_end and
> max_order from the truncated size, so most of each pool is treated as
> external order-0 pages; on a host whose IPA size makes the host stage-2
> PGD a multi-page allocation (for example a 42-bit PARange), that
> allocation fails and host_s2_zalloc_pages_exact() uses the NULL result.

Could you describe here what actually happens? I think pKVM init fails
before any page is handed out twice. Just below 2 TiB, hyp_pool_init()
for host_s2_pool hits the BUG_ON() in hyp_set_page_refcounted() on
hpool's page-table pages, and from 2 TiB up hyp_back_vmemmap() zeroes
the new hyp page tables while they're being built.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260715150125.2798116-1-smostafa@google.com/
