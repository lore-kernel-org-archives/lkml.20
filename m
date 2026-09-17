Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9708175A9D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.138.61.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631208; cv=none; b=XOYSSAkL0f2eGHQHm8QfTfwTz4R0hhn20XYP4amVo0CCL5+Sdg/yWgtDAAPC4ji9toxuG+FFz6CzKivCZp2r2w3cyu4omwa1TPe/dX7pcgd4xXhJxbPRORgKVZLoSMO7JVeLHBnVDwt+GyYJEs+qLNk/nqMrJ6zBP1oPpH5afQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631208; c=relaxed/simple;
	bh=ffn4Z8w2vbV/yjMAVjCF39Xnvzt5sDQWpk/k1VIoL50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMKQWdu4cc/cq0vTSI7w3eP64p8TzUfG6mD6VldeSgfk07U4A1GtTwTdq9gKuo8Pt834zu6DarRsPLQRJxEU8C05Z0iHz+8GUMzNzf5hJR/nPm87Whqp61G9+qD9yXoVShcxz305lYZmPFOCWaJb8wkoGMeSqZUuVDq1zf8QtwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=kePxJCrj; arc=none smtp.client-ip=139.138.61.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="kePxJCrj"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1789631206; x=1821167206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ffn4Z8w2vbV/yjMAVjCF39Xnvzt5sDQWpk/k1VIoL50=;
  b=kePxJCrjn1LlCJZXSUW4TDz+JwgQxUNUxj7Im/es+TtY6Anz/X58p2wN
   LXkNNawSmKWeS0BZPsZ2mRfKNwVhvjRysfj8f0fc7QzgM2Up4p3E2MZeB
   y5b27oQELAj624v2+dq4+mE4nwNe2M5LeMwl/Q9mclnW0k2ocmXpUO97a
   XePG8hK1cQVDrBtfouxSFZZKiZ6cvsQBMKifEzDII4bi8lsfR6Le/pMpR
   uHWHoT4+MUsSZEo/EAFoTapbq2RnPcYCLmn8P6w9PXqZtRtdGlQ6+6Z31
   2LKjSCh+LdwZgNgDyBb/0YYmTRBdM0WwQ8OVPGSfwvRF7jCti/EnppX54
   g==;
X-CSE-ConnectionGUID: t+NTbOs7Rc+8CxArNs1iZQ==
X-CSE-MsgGUID: mUs5Tr8OQbay0fZQUjwGNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="234264834"
X-IronPort-AV: E=Sophos;i="6.27,103,1786978800"; 
   d="scan'208";a="234264834"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 16:46:39 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 699C582040B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:46:39 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 1EE8CC000B4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:46:39 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 400491800B10;
	Thu, 17 Sep 2026 07:46:32 +0000 (UTC)
Date: Thu, 17 Sep 2026 16:46:30 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v3 0/2] KVM: arm64: ptdump: Shadow ptdump fixes
Message-ID: <aqua1jotej32hxLP@sm-arm-grace07>
References: <20260916230337.4162485-1-weilin.chang@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916230337.4162485-1-weilin.chang@arm.com>

Hi Wei-Lin,

On Thu, Sep 17, 2026 at 12:03:35AM +0100, Wei-Lin Chang wrote:
> Hi,
> 
> This is v3 of fixing the sleep-in-atomic problem of the shadow ptdump.
> The approach taken this time is simply creating a file for each nested
> mmu.
> 
> The ptdump files are created alongside the nested mmus in
> kvm_vcpu_init_nested(), in a sleepable context, and removed when the VM
> is destroyed (kvm_destroy_vm_debugfs(), before the nested mmus are freed
> in kvm_destroy_nested()). This allows us to store the kvm_s2_mmu pointers
> in the ptdump code, after Marc's nested mmu lifecycle fixes [1].
> 
> For the shadow ptdump, for valid nested mmus the first line will show
> the nested context's VTTBR and VTCR values, and whether s2 is enabled or
> not. The ptdump then follows.
> 
> The first patch fixes mmu->pgt accesses after the VM MMU teardown in
> ptdump.c, the second patch switches from per nested context ptdumps to
> per nested mmu ptdumps.
> 
> Tested with CONFIG_PROVE_LOCKING, CONFIG_DEBUG_ATOMIC_SLEEP, and
> CONFIG_KASAN.
> 
> Series based on kvmarm/fixes.
> 
> * Changes from v2 [2]:
> 
>   - Changed from creating a file that contains all nested mmus to
>     creating one file for each nested mmu.

I've booted your kernel built only CONFIG_DEBUG_ATOMIC_SLEEP enabled
mentioned above kernel configs; on Grace CPUs shadow_stage2 test did 
not trigger the sleep in atomic message.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>

Thanks,
Itaru.

> 
> Thanks!
> 
> [1]: https://lore.kernel.org/kvmarm/20260911162203.1919330-1-maz@kernel.org/
> [2]: https://lore.kernel.org/kvmarm/20260630121005.1130996-1-weilin.chang@arm.com/
> 
> Wei-Lin Chang (2):
>   KVM: arm64: ptdump: Check the page tables aren't freed when accessing
>   KVM: arm64: ptdump: Fix shadow ptdump sleep-in-atomic-context problem
> 
>  arch/arm64/include/asm/kvm_host.h |  4 --
>  arch/arm64/include/asm/kvm_mmu.h  |  6 +--
>  arch/arm64/kvm/nested.c           |  9 ++--
>  arch/arm64/kvm/ptdump.c           | 75 ++++++++++++++++++++-----------
>  4 files changed, 54 insertions(+), 40 deletions(-)
> 
> -- 
> 2.43.0
> 
