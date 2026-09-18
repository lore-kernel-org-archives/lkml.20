Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938E73D300E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748590; cv=none; b=OSkBKQNLbNcheE523wxI/T/ttO7fty7YNuEgBp/Z0MELeVEIpH1va86QYKxD0AgzYHvV/1mW1vycUpsKCKSFmobtYSiIXkFalkai/kOk51IPP9mnKBDs9er3+lWkiLZ19OSZREuUHFnZYrqGt13JZQfCKBqbatZCdSvJcIarG/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748590; c=relaxed/simple;
	bh=Mh4gt7RAn+qHAj4101OdvRQ24SvZO0G58CPOuegPX0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U69GHTQ8ian6ZWLOymHDaVaVZnTve+A4xF+Inxc0gCZxkh9EDYIkxWsgLG2dJw+fBGZVNBbynR2sxHfIRhGTihkxQk3zamEztnk4tnUzILKQHO9q0MG/ZFPQmwGqOusYrFfIgVN6I/0N6+WBpnBvi2fRmbSXP5KpmLL7xeSacJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iq34HdVh; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iq34HdVh"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D026B168F;
	Fri, 18 Sep 2026 09:22:58 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E8AB3F86C;
	Fri, 18 Sep 2026 09:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789748582; bh=Mh4gt7RAn+qHAj4101OdvRQ24SvZO0G58CPOuegPX0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iq34HdVh6YlEI/sWdUCCv2ENtlQe/91AhJi92p/1myQB9Nd5xNP9T+mKEH/g+UsZy
	 yqeXSG6xdyXbpmrZE2mnOZc+R0TN7ZV/E0pPFzW5hTCyTV0kkETgJT9DTyObzhyAkL
	 Lrb3nMn1qzimqUevi3R9kaUjuATIVfUfMWy/CJiM=
Date: Fri, 18 Sep 2026 17:22:58 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v3 00/14] arm64: Remove unused big-endian support
Message-ID: <aq1lYhkoMNBW2l-x@J2N7QTR9R3>
References: <20260918145217.1669-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918145217.1669-1-will@kernel.org>

On Fri, Sep 18, 2026 at 03:52:02PM +0100, Will Deacon wrote:
> Hi all,
> 
> This is version three of the big-endian removal series previously posted
> here:
> 
> v1: https://lore.kernel.org/r/20260811140132.22778-1-will@kernel.org/
> v2: https://lore.kernel.org/r/20260907163726.17104-1-will@kernel.org
> 
> Changes since v2 include:
>   * Retain support for emitting absolute symbol references with PIE
>   * Retain endianness handling on EFI MMU-enabled boot path
>   * Invert compile-time endianness check in Hisilicon sec2 driver
>   * Added some tags

> Will Deacon (13):
>   selftests/arm64: Remove big-endian support
>   arm64: bpf: Remove big-endian support from the JIT compiler
>   arm64: crypto: Assume a little-endian kernel
>   arm64: lib: Assume a little-endian kernel in custom library routines
>   arm64: lib: Assume a little-endian kernel in optimised string routines
>   arm64: assembler: Remove endianness helper macros
>   arm64: vdso32: Always build compat vDSO object as little-endian
>   KVM: arm64: Remove support for a big-endian hypervisor object
>   arm64: Remove all usage of CONFIG_CPU_BIG_ENDIAN
>   arm64: Remove all usage of __AARCH64EB__
>   crypto: hisilicon/sec2: Remove check of CONFIG_CPU_LITTLE_ENDIAN
>   arm64: Kbuild: Remove vestigial big-endian support
>   drivers: Kconfig: Simplify dependencies on ARM64 && !CPU_BIG_ENDIAN

FWIW, for the series:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.
