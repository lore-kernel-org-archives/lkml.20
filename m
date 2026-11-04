Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790471;
	b=JjQHdA4XYyQ+IWVQqXILlVa7+gfUvo/hhEzjbukmzLUIghzLQ7/sj4WdsCHbFRa8rw6F
	 tbc/0kpKKyA5IekkcrkAX/2Hyxoxe7AjDZZ4RlSTOO5Xc+T6y2M1aapDGOmr5omroPoAz
	 T27r0gi9FVK97Y+cZ8IqsnSnYY7lTaddv2/AKKZTRH5fdyiUhdTHGlXdbviPTyGVz4m7w
	 TEVCiBhjtmNRqBQLZgvKOy77Gyb3QjJxjhSefjMm6EHPXfY4qGWx4YQjuWmY6S7Gjq4WG
	 Zh+fQ/rWuIanTwNKOmmrVXrdNtITGjRVGKTh46D4Ug6pGgDnG+veI/zNB4FOr62Va1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790471;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Rlq0AlUVPysrDth/CxuMoGsaxPC731Hkjxmxyzg8dD8=;
	b=WTNybdRZyVa3BVLqHLSGRWq+cJN2TyyTbUL2tYR/wc4k6x1yG0uSl244CjULOZ2Wp7fY
	 1oKfOguxMN2PGDW8ZXhjJZNPk6FKdjUolCVpDut4gxrNuF8896JJwocS5Q9DwQGArd1A3
	 KeVkNxMSqUQxS2AIIDOGaTIIxr93XTOBvZ+ufENnWl2KjDjqSM/XpqZt2Fhw9uEZfeaP4
	 obQwWvTMyHfo+nu6d/q4oHkRkUTSiZe4E6mlEurwZCA92FaAx/e0k6Ri2L4akrdz/0JOo
	 JJPAgo1ZGDA6ezwqsfeLVxq9bgdiGkjOTyA4qCBiOiBcmAdbgUy80/p4Snw+TMkqg5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aY49vEqh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CEF606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aY49vEqh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F7C1F000C1;
	Wed,  4 Nov 2026 11:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793790470;
	bh=Rlq0AlUVPysrDth/CxuMoGsaxPC731Hkjxmxyzg8dD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aY49vEqhN62ykjnMpkAIKjZ28H6cualZd/MRlIWKbcuXlUAiePZ7oko52CH53WrCf
	 5QLRqjDPRUepLCarInRwxW6dlhNi0IIus/ayByqiRUDFHfCKOXsjeHCgeowIJzJ1cI
	 xRMQucEJ10m3Qj/A7AFs6sgZLNeJAmYQPdVllMYM8NBAUC8ir+4h7EoquEsRxeFmkT
	 Txyxm2AT3QJJu5RtITSGjtJpUdDX6HQ170BhDfXKPERGoFiISmyb8tV7czHxrstT4C
	 ocC2cwEBC52bCs/pAE9+oFZ+Z077xKs+5jgpR5JE0bH5Svk6OQhvb7WeoqTnVdG4k7
	 sfIhcA8/Y2LOg==
Date: Wed, 4 Nov 2026 12:07:46 +0100
From: Thorsten Blum <blum@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: cacheinfo: Simplify init_cache_level()
Message-ID: <ausSAhn0qRagNcrz@kernel.org>
References: <20261104083632.65715-2-blum@kernel.org>
 <0534c6f4-3bb8-4249-816c-502cf8ccb287@arm.com>
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
In-Reply-To: <0534c6f4-3bb8-4249-816c-502cf8ccb287@arm.com>

Hi Ben,

On Wed, Nov 04, 2026 at 10:32:58AM +0000, Ben Horgan wrote:
> Hi Thorsten,
> 
> On 04/11/2026 08:36, Thorsten Blum wrote:
> > acpi_get_cache_info() already sets fw_level to 0 on failure, so drop the
> > redundant check and the manual assignment.
> 
> This doesn't seem to be the case when CONFIG_ACPI_PPTT is not defined. Can the dummy implementation
> in include/linux/cacheinfo.h be called from init_cache_level()? For the implementation in

On arm64, ACPI_PPTT is selected when ACPI is enabled. When ACPI is
disabled, acpi_disabled = 1 and init_cache_level() won't call the stub.

> drivers/acpi/pptt.c levels is documented as "Number of levels if success." and so would be good to
> mention what happens in the error case if it needs to be relied on.

Below the parameter descriptions, it already says:

  "Errors caused by lack of a PPTT table, or otherwise, return 0
   indicating we didn't find any cache levels."

Thanks,
Thorsten
