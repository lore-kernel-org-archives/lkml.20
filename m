Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC20F47F2CD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131466; cv=none; b=OgNs7E0EJXdcPMnXGOKBbKUVgzX+Wqht62FDH3aKsmJNXGNfFWkffZJybX9hWHsrNMTY7d1GBePoaHZQWJD7CYQTh7Af6Jrdm8FnOasprM8qi1YqLHzZI853wg1K1hD02SRcBLIKBVV0leVZQRYxEagqrTl0DOVsGsQwZxWZwBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131466; c=relaxed/simple;
	bh=zOfxGfnMVAGLF2Ai5d4EjnHiGKazB0/xsLntadvkbOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=if0y+8FMSb8Noq0hzSPQXO61e1X0dW5QxN7sYnc3kg962ch/HSiT1ux+9MIoves9SIdYxlosZYozQ47Ib44vmWQxhMjJ6I8t1nIjiF78CoSEoDRTaZtShu3DFIL+uzdhFZfGzkhTjL9mXEDsMRM1P7E/un63cVCsVvufQfO+Kig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABtrpNHQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABtrpNHQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C4D1F000FF;
	Fri, 11 Sep 2026 12:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789131451;
	bh=KvPW7wKGOhZ34dEtOElqCP0STW8GW9Yph3VIV+NYOy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ABtrpNHQBjrHI8UNkItVZR13xICohMB9qqyHFacl9IWKzwCWekVxNVh66cHEYgczo
	 BtKsUAEFXVc9VuCD1LSZC+IyjyysF5WAvEqE4bUF7bhlQwY3PHp+KSoK9wJxZLL+XV
	 ws0ZabKyxvxgrtobDy9Akib81YVkhPSrAimCON33XJSgbURaNvUDJ99eZPkyXLHtPJ
	 xgP3twIB0iw11wfuZX1l83lNpTQ3baF+JMypaK70NnlX73D7cJixy9zghAaYndHYVn
	 iozTTbGVYxe2s1/qCO23ZDZIlwV2l2OX7EIZF4PKCM/M1zDAGIpNoinKMDsea59qUY
	 4O5FOyfX8o6fg==
Date: Fri, 11 Sep 2026 13:57:25 +0100
From: Will Deacon <will@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 06/21] arm64: Store 'current' in TPIDRRO_EL0 instead of
 SP_EL0
Message-ID: <aqP6tdHf-3hnTLhf@willie-the-truck>
References: <20260907164247.17223-1-will@kernel.org>
 <20260907164247.17223-7-will@kernel.org>
 <20260908141950.37e9ed3d@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908141950.37e9ed3d@pumpkin>

On Tue, Sep 08, 2026 at 02:19:50PM +0100, David Laight wrote:
> On Mon,  7 Sep 2026 17:42:31 +0100
> Will Deacon <will@kernel.org> wrote:
> 
> > To make SP_EL0 available to point at the per-cpu kernel overflow stack,
> > we must relocate 'current' elsewhere. With TPIDRRO_EL0 now restored late
> > in the return-to-user path, we can otherwise use it to hold 'current'
> > and update the various accessors accordingly.
> > 
> > Move 'current' from SP_EL0 to TPIDRRO_EL0.
> 
> Is it worth having a #define for the name of the register that stores 'current'?
> (And probably the other similar registers.)
> That would avoid the bisection problems with the following two patches
> and might make other code a bit more readable.

We don't tend to reallocate 'current' all that often, so I don't think it's
worth the indirection tbh. The following patches are to a GDB script and
a bpf selftest, so I'm not going to lose sleep about bisection.

Will
