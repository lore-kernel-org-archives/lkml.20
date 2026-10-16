Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC1452E058;
	Fri, 16 Oct 2026 17:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170436; cv=none; b=pqDUXnkhpIwPazxlzeOr7l+QOejlEWRlOcVTM7wgPkhJZBQJEfc58MQgic4QexJRvz2Epssit7pqpo/LFgC1lrDgQz8KqaGpyU9HnO2sHUMBN/yeOQmTAFOEpX8Cj9OIXVrF30XnTbIwVWkxAZp2/PlOgc9CW6T1GChngplTrdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170436; c=relaxed/simple;
	bh=Qy+eetU0QYnQ0vQR28SsBMcCwfKB/8bfEM3O+3r8Tv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyEIZQNEpezJRyKZ3X+lCw41Me1VPe8BmpudPRMym8rnHasVjs+JZloI/B73ficL3GsIXpNoQSgtWyD7Oj5q6MScy8Ecry6a69UqTxUa5YYSWAA01ccZqm2LgR1i5l7ixYQ/Vxpbjk2ekTYy/5SQ5vpx3LBHJMPvPleqDWl4LIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJm6LpM/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJm6LpM/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116F21F000C5;
	Fri, 16 Oct 2026 17:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792170435;
	bh=t3O1aquuhFHzCAMWHajQyJ3C8pT2mlFiI5qjzy2ekI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GJm6LpM/G5HqMuYjgCWqiARIYHVVPGmVkx2TMHuBwIJemJiYsaMPfyndWYZJ1jN2p
	 V4ccTIRFNpjK+ZlfrL/ce0LWwEvdLoZz1zrKu041kqCp+VkH7nd5a04q4ku2iT1gSH
	 GtF8/PSxKE8M2fzplzhEmI0UfSquHwtLYrlMA1j+33DS/q/HvHpj7d6R14wzgoVpzu
	 p6u6MgySAol7rSqymKO2Ap/zpCSHmFUJTQTSUUUTGekdM5LhAGHnneZzzRMSSOTsC6
	 TP79yKGPwyaoC1P0pgi4KUvs25esFCQxqKwXPBQm441nGq4rnxdBEx8XHb5GH77OjH
	 HNsrulOEKBg6g==
Date: Fri, 16 Oct 2026 10:07:13 -0700
From: Oliver Upton <oupton@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: Missing signoff in the kvm-arm-fixes tree
Message-ID: <atJZwTAuqoUqaIIn@kernel.org>
References: <atFxR8JARwEk3qfh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atFxR8JARwEk3qfh@sirena.org.uk>

On Fri, Oct 16, 2026 at 01:35:19AM +0100, Mark Brown wrote:
> Commit
> 
>   bc502b86a3cfd ("KVM: arm64: Use stage-1 leaf size for VM_PFNMAP")
> 
> is missing a Signed-off-by from its committer

This was fixed in the pull request that found its way to Linus' tree but
never updated in kvmarm/fixes. I've fixed that now.

Thanks,
Oliver
