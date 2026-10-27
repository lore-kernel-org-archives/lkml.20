Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112591;
	b=1BLDubOApL9+GuucWNXIJXVb6LPvnr+v0xqx7R6pjoupn1y/pXvHdfiO4W4ZaZ+CMUcs
	 z8LgkowLrbMy7CBpoK+6uza4Kcv9RfOGzz437eeZj4rc6wKY3Z6pDpKMV3D8uZmmtxmS4
	 hTUr/A+WRvbzdPBrtUt79aC+RovCWLiLhC8Dvcaeqiwqc/ps9FBiE5pknOKFt/QFsHFZm
	 JwlxS7Ux6h0O+FYvFpVo0Jt4Gunwi03S7H6zPdXPLvnr58RBqlHAl/CaUguqGikKKEOnA
	 lR8H+A4b9m645Ye+xBsttBhla9RESnZsdZgLL/SyHHNRzEsWb5VXQ6EHqw8BdJqIOrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112591;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wi470fH/6NJAJZsJW9LEG6B+Nx4bCaf1TqCBljyhSYs=;
	b=ws9838EJLweIjCSZe9IVm2394fOHb0xgIAyoojtJUFbg2jg8PeU/JyRkBFp2b8WlMj0k
	 tNGFwrFMu9iJfuo6mTytnSXNfT1Fsdpz5cFpY88UqV77ooPTIuhRO5MTXvQh2oDxeE3Wc
	 oAMWhHQt6SVEgcgMOHLU5oOjRZ3m8fn/02yWuFRJ7CYlizMz5gI7CtT/nmpe+gX0E0hS7
	 vyN1GCx+ZxXYen1BfVE0iGYOWKNaVdrSi35w+MFnJkJI1GapSLMi6q5AEdo/irukDymLq
	 6/LQON3Hkq/n1iZyy+yjdbjTWfFUjQhD4G7vF2AJqeT9l0xYMTE0yyqFhg2hQ2vHL2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="eHE9aF/m";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89447606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eHE9aF/m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7BCB1F01825;
	Tue, 27 Oct 2026 14:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793112591;
	bh=wi470fH/6NJAJZsJW9LEG6B+Nx4bCaf1TqCBljyhSYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eHE9aF/m0olFM2y2NwZjjYwCRmBvH7lmBHZRFn04xch9qN2blVyR530qFx1ajlZZR
	 sHXvWn7Rfgonr2KJw13NFFIGPrPPj8CIYIMHDybhwwGbhQuj3yFtbFlEZsxpGDhtBS
	 mGy58KLHw/Ft4Ogb3TT7GDqw4VjVyjZrWhIsXBYPwj45+RkKONxw6dXhujW8Sjtzkq
	 /PcGBzowaW+LZoNukqJ3XziFwgv2bJU8DqFKwSMUOvgjv90MiDg8+MJWpSE2bfvrZD
	 TO/gjvUcv304ye7BKL+L4BhzX7+wemUrOo73UOMBLYnueQkrxm4rQUVRn9QigO0hbE
	 jy/iRbf8DnOlA==
Date: Tue, 27 Oct 2026 15:49:45 +0100
From: Thorsten Blum <blum@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: idreg-override: Detect trailing "--" in
 __parse_cmdline()
Message-ID: <auC6CbIclUCJK094@kernel.org>
References: <20261015161054.357595-3-blum@kernel.org>
 <auCVj80cR8LILhXB@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auCVj80cR8LILhXB@arm.com>

Hi Catalin,

On Tue, Oct 27, 2026 at 12:14:07PM +0000, Catalin Marinas wrote:
> On Thu, Oct 15, 2026 at 06:10:54PM +0200, Thorsten Blum wrote:
> > __parse_cmdline() detects "--" only if it is followed by whitespace.
> > However, at the end of the command line, it converts the dashes to
> > underscores and tries to match "__" as an option.
> > 
> > Detect trailing "--" directly instead of converting it to "__".
> > 
> > Fixes: dc3f5aae0638 ("arm64: idreg-override: Avoid parameq() and parameqn()")
> > Signed-off-by: Thorsten Blum <blum@kernel.org>
> > ---
> >  arch/arm64/kernel/pi/idreg-override.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
> > index acaf56234973..38aa28d19650 100644
> > --- a/arch/arm64/kernel/pi/idreg-override.c
> > +++ b/arch/arm64/kernel/pi/idreg-override.c
> > @@ -352,8 +352,9 @@ static __init void __parse_cmdline(const char *cmdline, bool parse_aliases)
> >  
> >  		cmdline = skip_spaces(cmdline);
> >  
> > -		/* terminate on "--" appearing on the command line by itself */
> > -		if (cmdline[0] == '-' && cmdline[1] == '-' && isspace(cmdline[2]))
> > +		/* Stop at "--" appearing as a separate argument. */
> > +		if (cmdline[0] == '-' && cmdline[1] == '-' &&
> > +		    (!cmdline[2] || isspace(cmdline[2])))
> >  			return;
> 
> I guess that's more of a cleanup. Does it actually fix anything to
> deserve a Fixes tag? We skip an unnecessary lookup for "__" but there's
> no functional difference.

Yes, it's a cleanup.

Functionally, the behavior is equivalent because it also happened to
work before. However, commit dc3f5aae0638 removed the explicit detection
of a trailing "--", so I added the Fixes tag mostly for provenance.

Thanks,
Thorsten
