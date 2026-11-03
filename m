Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712173;
	b=KQB5pqRj4LmmAJABsnwP9npmNZzYdMDXdS6f4cROFbQxm+9dtAMFMxW+y6YQ8gqCDJ73
	 aqkZI+Q/P6NvjQxThYX9sQiSfUzHmSnIqHEpFLtjN+jLjB7qdHwLOe6996q64K4lKzLNV
	 EyhzGH899yRPoGKmljWSyK27HT1b7k43g+iL0y0Z+l0FLg7udubB0w5kpX+2Fdb4zhT9l
	 UXpxGwyez1W1iw1PJZ/COOAAyriQVwextMUW4NSDGq+jv66esL9MyQGoec4vpMdMx82Yn
	 ERDCL8sSMP6iXJkHDhD9ZG4i/PhIJPXA5he+Fw3ZKkoXeUrPXCPhqvE2Jum3lPt6JMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712173;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=fuQ3178AL1UXwToo1XcknyLf6+Rxx1bT4a3ss6S3V80=;
	b=1w8wa3pKculNvY2zaApwW3CotWyHMAyp/IYF64CrL3svHqch7b8o/QCMen+FSA9IB1hm
	 BTXXkD0Ws0WJuffpNU+yYPSNL5G2cGGKdj1OrsWNH2Gm3d6N3CXChC737OtrLIUq0aHPY
	 jlsA9Zi5nYHaqP4QgBvvtCsLFd2C7scbqxRuBBrzvCFTgRfsSeUsWBFoUTaQjrMsMdOvO
	 /eMC3EKQ1Xi4Bbr5I46SI8c0S8ErmH6wmsVm7Z4QLgY6PNjQdGRIXEFn3nzFZdlHPDvkl
	 eY9ySQr07CkTduUX+MycMTkRugBjBalKyhZD/9L1IqLi/D/JuDC0Duzg76JWSNVOT6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X6xbhRQf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3380A606A33F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X6xbhRQf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276C61F000C1;
	Tue,  3 Nov 2026 13:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793712172;
	bh=fuQ3178AL1UXwToo1XcknyLf6+Rxx1bT4a3ss6S3V80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X6xbhRQfoLbXk658NKrEHYDA1wPHQ2VyqBTjnFqMKKtjcWlrMTT5ave5ZO1bEjp7w
	 yJpQTwXZyOSIrGIv1CEGsqL1vhTDr3wiOqXaBcclHZjKWoVzhgQWfhn2hMJofKCDUA
	 pGv6BgxC8atCsUE1rqfA7bZjnEkGuAcxW0whXUYFzh2i2UtTnwL7hDyPOPBMCFAdnW
	 R8j+Sp/t86eUWWvrXYacUWlebCXn8lPIUh8YOeyz9aDYt2D7SKMu1Hk3MX/YE4Axjx
	 q0PCNLaxJkNha69YEmKDtULwy/D6Wvymt9UznOX8BALJsFOfxbpyzISzA0kb9YfOVM
	 47S7y9owLpu0A==
Date: Tue, 3 Nov 2026 13:22:47 +0000
From: Will Deacon <will@kernel.org>
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	leitao@debian.org, mhiramat@kernel.org
Subject: Re: [PATCH] arm64: Kconfig: add CONFIG_CMDLINE_EXTEND
Message-ID: <aungJ2BsmbHDNPLg@willie-the-truck>
References: <20261103084140.7689-1-paul.cercueil@bootlin.com>
 <aunCuysle9uzTRI1@willie-the-truck>
 <902f7e15f881583e9069ae1376952964f7bdf96e.camel@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <902f7e15f881583e9069ae1376952964f7bdf96e.camel@bootlin.com>

[+Breno & Masami]

On Tue, Nov 03, 2026 at 12:49:21PM +0100, Paul Cercueil wrote:
> Le mardi 03 novembre 2026 à 11:17 +0000, Will Deacon a écrit :
> > On Tue, Nov 03, 2026 at 09:41:40AM +0100, Paul Cercueil wrote:
> > > Other archs have it, and it is supported in arch-independent code, so I
> > > see no reason why it is not provided on Aarch64. Add it there.
> > > 
> > > Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
> > > ---
> > >  arch/arm64/Kconfig | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > index 1075bc661833..f8542e532b50 100644
> > > --- a/arch/arm64/Kconfig
> > > +++ b/arch/arm64/Kconfig
> > > @@ -2551,6 +2551,12 @@ config CMDLINE_FROM_BOOTLOADER
> > >  	  the boot loader doesn't provide any, the default kernel command
> > >  	  string provided in CMDLINE will be used.
> > >  
> > > +config CMDLINE_EXTEND
> > > +	bool "Extend bootloader kernel arguments"
> > > +	help
> > > +	  The command-line arguments provided by the boot loader will be
> > > +	  appended to the default kernel command string.
> > 
> > We previously reverted this in cae118b6acc3 ("arm64: Drop support for
> > CMDLINE_EXTEND") and I think that reasoning still applies. The thing
> > that _has_ changed since then, is that I think bootconfig now has some
> > support for early params, so that's really what people should be using
> > here.
> 
> I didn't know about bootconfig, that looks like exactly what I need, thanks!

Great! Just watch out for the early_param support. Historically,
bootconfig silently dropped early parameters, so it was quite limited in
what you could use it for. However, I think Breno and Masami have recently
fixed that but I'm not entirely sure. I wanted to attend the recent LPC
session about it, but I had a conflict and haven't had chance to dig up
the recording.

Will
