Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119542;
	b=afhJn6pChK5QQ4v2y0NZN2ri67Stp5soaD7iPRl26LYDECfVY+q/VApIrpgf1TtZAnSF
	 VkE5WkQ+W+h8uJSp3w2t4GfxpALcApHyh9iq0ntCkbOJw4vQNQGbb7ptaxaNxvxkgrUCr
	 66ymaOqa+14akkmZoctzdrVVG8yiA2sw406hSjWrLVjXky++zPeDVYWdX8AbbWzpnNRqp
	 P5iBmXJbvct68PhiafO0U+k2GXOz65FCwfcdy63js1AnZLWHO57L2dgm0yFygA9lXN5h7
	 PCTGVFVPFfNryXOaOa+wyx/4NDmgeiVEmZzbVaKp3hlKCeQukYSAK6axg2vZ0huR0BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119542;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=uzYeYiHrkcESUMf2Bad0aFg730ZfeR2cikrxrYtPo2s=;
	b=PSs4uu6/ThhMMmWu3t1sbXx9Iwi4uWflQuGB4PwokVrV8tThfZmlxf0yqhE4Ym+erobR
	 Be/gNV4EZ/vfLD6m/feVfSb1UYsAMVPUGBYd7vqZpNsaW+8b/yeKJbi/EAzJTC39Zhb+w
	 XJdP8Qtm7MREaoa/e8zoxDDgwKMCcaCQxKxE0+eVL0AE0lXrzuZMobVcTH/mRpMS6bJOi
	 FJDIAVAyx+26PnAKYKCc30yZuSYzoPYjQdBcePnHzR2QdcV6e1JEJlUOXtVZetPb1JX7Z
	 fBlkf3HZ1dnTI4sFSH9nUmI0eUar/FixCbLj7B0DLDrNGICxKRGvXmf8fyYK2nH17ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UGpMc23Z;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A165F606A327
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A165F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UGpMc23Z
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5161B15A1;
	Tue, 27 Oct 2026 09:45:32 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE2993F59E;
	Tue, 27 Oct 2026 09:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793119535; bh=rnhwTZUYMyNC6LhGd7EvjwdU5unqPfJSXAia5nseGlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UGpMc23ZVSkzbfErHN7Z6gjPhpk5iz/QK3wltY10jtOZwCRtPdr/HxKYmEsipfcbB
	 CNjzr+i4WdRJeAIOwgWPDEAbVJg91iMEk0swBau4nbXuczwWhyUkvFKk3uwBKwEl8m
	 kLp4KuoApUVM5xVs7KKu3F5Bf4L/7bOOfc7gQrfk=
Date: Tue, 27 Oct 2026 16:45:27 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: idreg-override: Detect trailing "--" in
 __parse_cmdline()
Message-ID: <auDVJ0tuVyvGGh95@arm.com>
References: <20261015161054.357595-3-blum@kernel.org>
 <auCVj80cR8LILhXB@arm.com>
 <auC6CbIclUCJK094@kernel.org>
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
In-Reply-To: <auC6CbIclUCJK094@kernel.org>

On Tue, Oct 27, 2026 at 03:49:45PM +0100, Thorsten Blum wrote:
> On Tue, Oct 27, 2026 at 12:14:07PM +0000, Catalin Marinas wrote:
> > On Thu, Oct 15, 2026 at 06:10:54PM +0200, Thorsten Blum wrote:
> > > __parse_cmdline() detects "--" only if it is followed by whitespace.
> > > However, at the end of the command line, it converts the dashes to
> > > underscores and tries to match "__" as an option.
> > > 
> > > Detect trailing "--" directly instead of converting it to "__".
> > > 
> > > Fixes: dc3f5aae0638 ("arm64: idreg-override: Avoid parameq() and parameqn()")
> > > Signed-off-by: Thorsten Blum <blum@kernel.org>
> > > ---
> > >  arch/arm64/kernel/pi/idreg-override.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
> > > index acaf56234973..38aa28d19650 100644
> > > --- a/arch/arm64/kernel/pi/idreg-override.c
> > > +++ b/arch/arm64/kernel/pi/idreg-override.c
> > > @@ -352,8 +352,9 @@ static __init void __parse_cmdline(const char *cmdline, bool parse_aliases)
> > >  
> > >  		cmdline = skip_spaces(cmdline);
> > >  
> > > -		/* terminate on "--" appearing on the command line by itself */
> > > -		if (cmdline[0] == '-' && cmdline[1] == '-' && isspace(cmdline[2]))
> > > +		/* Stop at "--" appearing as a separate argument. */
> > > +		if (cmdline[0] == '-' && cmdline[1] == '-' &&
> > > +		    (!cmdline[2] || isspace(cmdline[2])))
> > >  			return;
> > 
> > I guess that's more of a cleanup. Does it actually fix anything to
> > deserve a Fixes tag? We skip an unnecessary lookup for "__" but there's
> > no functional difference.
> 
> Yes, it's a cleanup.
> 
> Functionally, the behavior is equivalent because it also happened to
> work before. However, commit dc3f5aae0638 removed the explicit detection
> of a trailing "--", so I added the Fixes tag mostly for provenance.

Makes sense. We might make it a comment when applying rather than a
dedicated Fixes tag.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
