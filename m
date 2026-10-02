Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA693F9F3C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790949649; cv=none; b=rVFU2PypW5mbmR38sFy0yn20bhfjAcuHMGqR9VxRF6BqsBuJBBOe35nf0GDCnN7yVSSWWh+nevUSlGGV4dpiS19ixiHZRTBvimPsbdbaCtXBWnks8NXH1WL6HQMbmvsNA0mppn3A4pv/u9QrcSM4sZZgMhgWXOJEbM/yZJhjME0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790949649; c=relaxed/simple;
	bh=j6SQHdbSgMcQ/gHg94JtmIoiBt1Sro6dTxqa7imo5iA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qop9/lULfprVSUin/nNqvtRkwZim+pPJosbjEoNBa/WDr7j7k8aS40y4Bmu21n1dIMFdfXcD8X/XxfiFFozf1S3MhA34SSQQlkPb80BvDnnJMg1nvJiG/cIQccFG93RjZ3WTSTKjQRp+RPoFNrzCzJJFPX3kBJwJl4BX0DlwWzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYzvfQ8o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYzvfQ8o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07A11F00893;
	Fri,  2 Oct 2026 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790949647;
	bh=wW+usV49Hq4KSQaZfj7w72/oaCFS8UTUq2zzksz+k+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aYzvfQ8oRLk1Q38eLu4xjkTEjKzzwx0LjWfvQzR7IhPwQ/hfr8bkZNGWiB6P5SASv
	 2LF63vEPjr7kQ783XlUeM/HSRGCoLQbYgq3PMQeW46AS6wOX+ug4xnLPTZfTjo8AtG
	 ggGFRnldVc7DNG1B6Yrm6m09bsNGumZCvJ3o4ORLYxlZgCSqFJcUH/yEjR4halyMk6
	 jTTxPgLcw6G9LlgYBO7rFpFNccQt8IAvv61gsATNq7mkw86TAywwiGDvMsTbffXpJH
	 y9OqmUoLFXRc52V/scmRU8YfgEKqJ4cQQfeGFEND1z56pERihYkTiqEdCnqEqYCog5
	 dD1eEBcf/jTWA==
Date: Fri, 2 Oct 2026 15:00:42 +0100
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
Message-ID: <ar-5CnttybD-1ojM@willie-the-truck>
References: <20260930121212.3101361-1-fuad.tabba@linux.dev>
 <ar-xtsSOqwWK9jWQ@willie-the-truck>
 <CA+EHjTzT+2M40GfyxHp6p6OugjoA2BRSkbFK-PMeLGz+qCUM9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzT+2M40GfyxHp6p6OugjoA2BRSkbFK-PMeLGz+qCUM9w@mail.gmail.com>

On Fri, Oct 02, 2026 at 02:54:47PM +0100, Fuad Tabba wrote:
> On Fri, Oct 02, 2026 at 02:29:26PM +0100, Will Deacon wrote:
> > Are you sure #8 is the correct immediate for the ccmp? My reading of the
> > pseudocode is that it should be #9, but this instruction has always confused
> > me and I hate the fact that it doesn't take another condition code mnemonic
> > instead of a raw immediate value.
> 
> My read is that #8 is right. From the CCMP (immediate) pseudocode in the
> Arm ARM (DDI 0487 M.d, C6.2.81), flags start out as the nzcv immediate
> and are only overwritten by the compare when the condition holds:
> 
>       var flags : bits(4) = nzcv;
>       ...
>       if ConditionHolds(condition) then
>           ...
>           (-, flags) = AddWithCarry{datasize}(operand1, NOT operand2, '1');
>       end;
>       PSTATE.[N,Z,C,V] = flags;
> 
> So when PMUVer == IMP_DEF the ne fails and NZCV = 0b1000, i.e. N=1, V=0.
> LT is N != V (Table C1-1), so b.lt is taken and we skip. #9 would give
> N=1, V=1, so we'd fall through and set the bits on an IMP_DEF PMU.

Aha, that table is pretty helpful, thanks.

I think you're right -- I missed the inversion at the end of
ConditionHolds().

I'll pick this up next week.

Will
