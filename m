Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ABCA360EF4
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955591; cv=none; b=U0Xs5QXX1w/lxTal/0CL58NQ2MK3agNinZlKnc5GcaiggHMgYhLXg7si8q3I9sQQsWfs1WnUz/BV6IspprO1t0TO0soZnrSE0Ssm/JzPjgDms9bRwTLxoWu4XE1E80FwWhm32b0MEtVmndTt24SbCByKe5gv0fqrsUB3JZ+sSUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955591; c=relaxed/simple;
	bh=bCHHV+bKapdhem/5Gw07QRVQmx273u4r4ya6MRuIaLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aW104XcBf4u9zKPJNnNi+cx3/FFxSa7aFZcUGk5s0ujwicl3rXkfQwUZLCCXqdxqi2ngeAAiTvccTzWulk5m94I8fcZ1+wUd+mIxv07DpAEHDDn+0KtmbGd42OwG0p6Yt4bCql0Bg+kI6UuINycT4zAUx2GhrLv0bLhZ7ulSm6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=eQlucJF3; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="eQlucJF3"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FD68143D;
	Fri,  2 Oct 2026 08:39:38 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 778773F85F;
	Fri,  2 Oct 2026 08:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790955581; bh=bCHHV+bKapdhem/5Gw07QRVQmx273u4r4ya6MRuIaLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQlucJF3nCd3Q+W9IKGllP6HZAeJS5hlx2iPXCTShV428J1pInz1TXhm/pJoTDqi0
	 yBqYvk2QgrNN8eLXJiWtS9pz/SpG69nGwUlsEwE6e84+WyUEviA7S6xj7CW6FlMGgO
	 n94Erbaa8gMK8hyWkFn5am6J4ee8Et+NtIir9IVQ=
Date: Fri, 2 Oct 2026 16:39:37 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
Message-ID: <ar_QOXqCYTGargBe@arm.com>
References: <20260930121212.3101361-1-fuad.tabba@linux.dev>
 <ar-xtsSOqwWK9jWQ@willie-the-truck>
 <CA+EHjTzT+2M40GfyxHp6p6OugjoA2BRSkbFK-PMeLGz+qCUM9w@mail.gmail.com>
 <ar-5CnttybD-1ojM@willie-the-truck>
 <ar_E5HUSTxMSRZhL@arm.com>
 <CA+EHjTzemfoX9e8Ppw+AcuUpNND_CipLCUM9xgid1eYXmV=jzg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzemfoX9e8Ppw+AcuUpNND_CipLCUM9xgid1eYXmV=jzg@mail.gmail.com>

On Fri, Oct 02, 2026 at 04:24:06PM +0100, Fuad Tabba wrote:
> On Fri, Oct 02, 2026 at 03:51:16PM +0100, Catalin Marinas wrote:
> > I couldn't figure out the #8 either. I wonder whether it's more readable
> > as (untested):
> >
> >     sub    x1, x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
> >     cmp    x1, #(ID_AA64DFR0_EL1_PMUVer_IMP_DEF - ID_AA64DFR0_EL1_PMUVer_V3P9)
> >     b.hs    .Lskip_pmuv3p9_\@    // Skip unless V3P9 <= PMUVer < IMP_DEF
> 
> This looks correct to me.
> 
> That said, if readability is the goal, I think the plainest is two
> compares and two branches. It's one more instruction, but this runs
> once at boot:
> 
>       cmp     x1, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF
>       b.eq    .Lskip_pmuv3p9_\@
>       cmp     x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
>       b.lt    .Lskip_pmuv3p9_\@
> 
> I used ccmp to match __init_el2_debug in the same file, which does the
> same NI/IMP_DEF check with a raw #4, as does reset_pmuserenr_el0 in
> assembler.h (and hyp-entry.S uses the same pattern for HVC64/HVC32).

I'll leave it to Will. My preference is whatever is more readable, no
need to optimise another cycle or two here.

-- 
Catalin
