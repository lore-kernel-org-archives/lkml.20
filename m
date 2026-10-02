Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF004443E36
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952683; cv=none; b=On47bO3t6haX4VlaYj+PQYcipkbD5q2icfq06RBlGA1DhMKuZglWIaPr++etwfLOfBOyw0m9n5RVM1nBluNLmUk2+sTnl3cxIL/rHkqF+StChFL8BupjI6qyGxnqp/Pl6aFmOYrAgaroi0gLNpwEailYGkHQjBOePLpmkvPlXEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952683; c=relaxed/simple;
	bh=kKDcaBFOI0ps7qhL8AjeG9mxP4MHTajTSk/ANpKPOIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ch48Ow5AMsa3I9iM36gDMLZeNjALIx1k2X5Yk5SFkcDuTCXtxEbXeiFn+xauL5+QSLNc9k3K1KGMg/2bVpe6UUu6J5FGaYM4D/Kkfyep/+hfyZF2l7jnCf3fymmYkVhXMegXJ529Hd2fQ8bifR6PvWIHaRuk9zDTrp9q24qpG1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rEXHYs1r; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rEXHYs1r"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA56D497;
	Fri,  2 Oct 2026 07:51:16 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0930F3F86F;
	Fri,  2 Oct 2026 07:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790952680; bh=kKDcaBFOI0ps7qhL8AjeG9mxP4MHTajTSk/ANpKPOIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rEXHYs1rFHGFpp+zEAWKtWRV6Fm1ec6oxZj3tIRFwIVWez6ZbMp0WRYDWGnNyXB0O
	 s17B7C9WbonpVlkUtGk1SDJyLGctAw46E6MMb7+906QYuO+mwfRtEI5X2lDJrTyHhw
	 eopLqbNJ648HBOpUjIXBTh82SqsR1HMYCjpOIftA=
Date: Fri, 2 Oct 2026 15:51:16 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
Message-ID: <ar_E5HUSTxMSRZhL@arm.com>
References: <20260930121212.3101361-1-fuad.tabba@linux.dev>
 <ar-xtsSOqwWK9jWQ@willie-the-truck>
 <CA+EHjTzT+2M40GfyxHp6p6OugjoA2BRSkbFK-PMeLGz+qCUM9w@mail.gmail.com>
 <ar-5CnttybD-1ojM@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar-5CnttybD-1ojM@willie-the-truck>

On Fri, Oct 02, 2026 at 03:00:42PM +0100, Will Deacon wrote:
> On Fri, Oct 02, 2026 at 02:54:47PM +0100, Fuad Tabba wrote:
> > On Fri, Oct 02, 2026 at 02:29:26PM +0100, Will Deacon wrote:
> > > Are you sure #8 is the correct immediate for the ccmp? My reading of the
> > > pseudocode is that it should be #9, but this instruction has always confused
> > > me and I hate the fact that it doesn't take another condition code mnemonic
> > > instead of a raw immediate value.
> > 
> > My read is that #8 is right. From the CCMP (immediate) pseudocode in the
> > Arm ARM (DDI 0487 M.d, C6.2.81), flags start out as the nzcv immediate
> > and are only overwritten by the compare when the condition holds:
> > 
> >       var flags : bits(4) = nzcv;
> >       ...
> >       if ConditionHolds(condition) then
> >           ...
> >           (-, flags) = AddWithCarry{datasize}(operand1, NOT operand2, '1');
> >       end;
> >       PSTATE.[N,Z,C,V] = flags;
> > 
> > So when PMUVer == IMP_DEF the ne fails and NZCV = 0b1000, i.e. N=1, V=0.
> > LT is N != V (Table C1-1), so b.lt is taken and we skip. #9 would give
> > N=1, V=1, so we'd fall through and set the bits on an IMP_DEF PMU.
> 
> Aha, that table is pretty helpful, thanks.
> 
> I think you're right -- I missed the inversion at the end of
> ConditionHolds().
> 
> I'll pick this up next week.

I couldn't figure out the #8 either. I wonder whether it's more readable
as (untested):

	sub	x1, x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
	cmp	x1, #(ID_AA64DFR0_EL1_PMUVer_IMP_DEF - ID_AA64DFR0_EL1_PMUVer_V3P9)
	b.hs	.Lskip_pmuv3p9_\@	// Skip unless V3P9 <= PMUVer < IMP_DEF

The first sub either gives us a large number (negative but we do the
unsigned comparison with b.hs) or something between 0 and (15-9). The
cmp and the 'same' part of b.hs skip the (15-9) case.

-- 
Catalin
