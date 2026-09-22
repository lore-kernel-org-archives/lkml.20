Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994FB542EF6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091167; cv=none; b=T09gp+5mNSXhD27WG7NXfvjDjNr2W7kSSkBkGxjrCqeYOiUf6St+oXg8fuo+tEO8nzMYkP1b8g1/JscBh9k82CuxPsRUCgO6+ZjBg5a3Tl5ifauWWpfazyJ/8JQtT4wXoIdACXC4HfVLYyQncdpwTF7wBbCMjCHLdnLdJBNJD/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091167; c=relaxed/simple;
	bh=CgoJK5BdnsOlbIyo3+ZOBDC0uXeR3bUQgUw+HqrjSYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHKTpFTk955DFx0T6tYHnpBhdLtJXojHJ7gM/1SyvJoy2yeGaT1PnCu96zu6+Mjm2YLM+RfCXu1Z89KnsgO5QIxZRKclCJstZcw5QL15CoIXHunw/3QDJrekGUu0K4EA9tUDE9ifmMyyHKVmesdSgu4F17B/fm2D3gs9IqtkjZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNO8Fjws; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNO8Fjws"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5740C1F00893;
	Tue, 22 Sep 2026 15:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790091166;
	bh=JKP9m+BDIsOZfQbj9AWrQzrEcScLXA8SYtp1+eZNKJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LNO8FjwsfUZmD09rveJo7VFGZrFnxDeVkxjDJ4aQ5RI5h8oep9eltQpM6N4tOOSK5
	 JymgYe87F9POuzWRjo1XRI31Cv7Wvdp7KheANzBbOGsb/dmUYcE1hbx2wMUqp4lm2w
	 N7JW4MRmC5LaHxSATN6Vmkuss0twaSFvVHVrj7M9EjN74s+HTaNTxI7fHlxtiAHZQv
	 BZ2HTsuwHwXLruuXtLxCDuofurDnBtaFYtPHti6VbQgIp7kOtIxZGv1sinJ1N4M0W3
	 WIuIeKjWnJnlRpnvadegNMZV8COoCV7whAQNw55iqCRq0OkOjl40qaSnetLcCavh/i
	 KhesXx6I3zpcg==
Date: Tue, 22 Sep 2026 16:32:40 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v3 12/13] arm64: Kbuild: Remove vestigial big-endian
 support
Message-ID: <arKfmFW5lLqipdQ5@willie-the-truck>
References: <20260918145217.1669-1-will@kernel.org>
 <20260918145217.1669-13-will@kernel.org>
 <arEF5IOJSlQyYwX5@arm.com>
 <arKaWVwH5RXKpDTf@willie-the-truck>
 <arKcDyE6pkBI9YVt@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arKcDyE6pkBI9YVt@arm.com>

On Tue, Sep 22, 2026 at 04:17:35PM +0100, Catalin Marinas wrote:
> On Tue, Sep 22, 2026 at 04:10:17PM +0100, Will Deacon wrote:
> > On Mon, Sep 21, 2026 at 11:24:36AM +0100, Catalin Marinas wrote:
> > > On Fri, Sep 18, 2026 at 03:52:14PM +0100, Will Deacon wrote:
> > > > -choice
> > > > -	prompt "Endianness"
> > > > -	default CPU_LITTLE_ENDIAN
> > > > -	help
> > > > -	  Select the endianness of data accesses performed by the CPU. Userspace
> > > > -	  applications will need to be compiled and linked for the endianness
> > > > -	  that is selected here.
> > > > -
> > > > -config CPU_BIG_ENDIAN
> > > > -	bool "Build big-endian kernel"
> > > > -	depends on BROKEN
> > > > -	help
> > > > -	  Say Y if you plan on running a kernel with a big-endian userspace.
> > > > -
> > > > -config CPU_LITTLE_ENDIAN
> > > > -	bool "Build little-endian kernel"
> > > > -	help
> > > > -	  Say Y if you plan on running a kernel with a little-endian userspace.
> > > > -	  This is usually the case for distributions targeting arm64.
> > > 
> > > Running the checks through an LLM found that CONFIG_GVE depends on
> > > X86 || CPU_LITTLE_ENDIAN, so it won't be enabled anymore.
> > > 
> > > I think that's the only positive test of CPU_LITTLE_ENDIAN.
> > 
> > Would you like me to add a '|| arm64' in there? I was a bit wary of doing
> > so, given that I don't have a way to test it. Removing CPU_LITTLE_ENDIAN
> > forces the issue, somewhat.
> 
> Or turn the dependency into X86 || !CPU_BIG_ENDIAN.

At which point it might as well just be !CPU_BIG_ENDIAN.

> Was arm64 the only one to define CPU_LITTLE_ENDIAN before?

Looks like there are a few:

$ find . -name 'Kconfig*' | xargs grep 'config\s\+CPU_LITTLE_ENDIAN'
./arch/sh/Kconfig.cpu:config CPU_LITTLE_ENDIAN
./arch/mips/Kconfig:config CPU_LITTLE_ENDIAN
./arch/arm64/Kconfig:config CPU_LITTLE_ENDIAN
./arch/xtensa/Kconfig:config CPU_LITTLE_ENDIAN
./arch/arm/mm/Kconfig:config CPU_LITTLE_ENDIAN
./arch/microblaze/Kconfig:config CPU_LITTLE_ENDIAN
./arch/powerpc/platforms/Kconfig.cputype:config CPU_LITTLE_ENDIAN

I'll play it safe and add the || ARM64 as I don't particularly want to
deal with the fallout of the driver getting additional exposure on
architectures (e.g. sparc) that don't define either of the symbols.

Will
