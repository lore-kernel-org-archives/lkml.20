Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE6054DAE0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956907; cv=none; b=jmLdOp2os5JdgHzRrOR5AkpdXeA8/kkQhlS5jffnkOXxLLtzrM29Y0cvlH2xv1fcgJ0rV+YlfuzJ2Dsf71W0/CrR7FQ74RC7xdqOmI2MlogKl4gBpzgBYZkMxvUrvmagm6DIoX1RLTKCpokuqK3RFsqXLPl05+r9Z0LhlTmAsmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956907; c=relaxed/simple;
	bh=Dxo4dgcGKjFuO+BsUoXdCDgwy30tIroweSzR5hSGjgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjq/zDOFOpsiaLQxOswaI2ewZhr9AyOUb8bdkBhJYXztLW1eH7YEuFirCgSudjQD88TnYftQNCvbDJhRrMALsE8qfso2WdfqUKoZuFiPu2yzwR7Mnfs3JXGDcCaJsaHcKKQVHkOQWATh5Bl2ymrqXuqOWloFKwBcJ2ZIp9b999s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=juoso7fu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="juoso7fu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 318B61F00A3D;
	Wed,  9 Sep 2026 12:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788956906;
	bh=icRL48a7sVyjHVFwn1f2bfTzasP2dnwXxav7dJKrdGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=juoso7fuBHmCJy6DvLNE6IH8N7Q9D4BB3u2CM86KtVBxuzM2aNxgvcD6f0NmqNKaW
	 FjlT8FOCUkCSJhjlqY/FGe69xRnKULAgm9PofCauvMHEDVXxpr8DcqouA9foO4Qc3Y
	 DINuMqgFlz+rFbtCKXe97fkRJRBhWdqxjP9W/hwxlxcx7IeACTMKQ2KCidoTFWB9fU
	 WcXwSSTvbW1YX3YPAYAsU4PnkWVs0mgaYhx43Uvg4urNYsooOOFe1sQaN1GJ5JgTRt
	 sfGnYKyZeeP1zjMNrGXvYyliWHvojnh1Bn3gXB97u2KjLLOxgP8P0nNdJ+8gwY53Bu
	 ZVXEbzMT9c9yA==
Date: Wed, 9 Sep 2026 13:28:20 +0100
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 12/14] arm64: image: Remove endianness handling for
 generating image header
Message-ID: <aqFQ5PacgD8RaryX@willie-the-truck>
References: <20260907163726.17104-1-will@kernel.org>
 <20260907163726.17104-13-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907163726.17104-13-will@kernel.org>

On Mon, Sep 07, 2026 at 05:37:23PM +0100, Will Deacon wrote:
> Since big-endian support for arm64 depends on BROKEN, we don't need to
> bother jumping through hoops to generate a little-endian kernel image
> header for a big-endian target. We can just ignore the possibility
> instead.
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Marc Zyngier <maz@kernel.org>
> Acked-by: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/assembler.h | 11 -----------
>  arch/arm64/kernel/head.S           |  4 ++--
>  arch/arm64/kernel/image.h          | 24 ++----------------------
>  3 files changed, 4 insertions(+), 35 deletions(-)

I think this is another patch I should drop from the series.

I was under the wrong impression that we were using two 32-bit words for
symbol addresses because of endianness quirks in the linker, but digging
into the original rationale from Ard [1], this is more fundamental to
the way in which the PIE toolchain handles ABS64 symbol relocations.

Will

[1] https://lore.kernel.org/all/CAKv+Gu8vdk-9N_VVG6XWYLp1SM9ynfcsbxwk2xx1mXYq7qN0Cg@mail.gmail.com/
