Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446BC3C454F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089825; cv=none; b=IaO5IEtbicDq1MAH4xoQHIEqnu9WHbDFgBkRbC3dz4sC0Xlz8UATBfKYtpMIS44g/B8Rd3VPhBbGnfJCZDgl0ixmbhWRaGcaQOd0Q/zjRWdQB7B3fmTbnEimpWS9ux6poy0PZmRa4KSJgUiI9ZlKGgoWn2QiNXT+X/2zRfCFeA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089825; c=relaxed/simple;
	bh=ZwOpwJDSEYD0bH2Ji7c7DY15TW65zJKsKElrCC7cnFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFcwO5MwnpPxncZqq/oSxxeT5E9GvJ7/jUhe62z75idhpgVyMswXOfnDGzZyR5scbDn4WOd8fXHDDWO6kacEIvAfMfmyZtWXGiJMTELlDbwun+8Xl8yqPO/Oyyf0K8bQRI4onWf6SPBeAwTblH1nIvKomh5+Lged5hyXj+xCMfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIzW9uiO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIzW9uiO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A516E1F000FF;
	Tue, 22 Sep 2026 15:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790089823;
	bh=omtP9ok1iojYdMTStCvMewR9KVHMrUfbkgUBxyeLyIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VIzW9uiOZErgGwpb2MBkx+awxmmwYA78DwwJtiqJZwY5dCV0hNlDcpSr6qG5VMpD1
	 1OxTgIp9ilrwSCytuBosjm5tBO+jnw1i4RnYv9o7EYft6FUBUAiKRfWE2UZOMJkFQr
	 2S6v3AfRRGX8eSdG48n1JLmZI+cp50+pbeol/Ioo+750ldPVBkefk4LPUSiPKn/VsG
	 5J+1/Yfu7IWS9e8LC57iV0y60ieTfPrRKDuSOs3O1qzs/uJWds/1YBdl1PI4l0FMIv
	 SyaIFUf8vq/v11n+gnUf0MTOCSOpZu9JumCDPkotgaZymL2r2orxQlCkQV8TLEbSMI
	 cS/zfPYbzB8kQ==
Date: Tue, 22 Sep 2026 16:10:17 +0100
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
Message-ID: <arKaWVwH5RXKpDTf@willie-the-truck>
References: <20260918145217.1669-1-will@kernel.org>
 <20260918145217.1669-13-will@kernel.org>
 <arEF5IOJSlQyYwX5@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arEF5IOJSlQyYwX5@arm.com>

On Mon, Sep 21, 2026 at 11:24:36AM +0100, Catalin Marinas wrote:
> On Fri, Sep 18, 2026 at 03:52:14PM +0100, Will Deacon wrote:
> > -choice
> > -	prompt "Endianness"
> > -	default CPU_LITTLE_ENDIAN
> > -	help
> > -	  Select the endianness of data accesses performed by the CPU. Userspace
> > -	  applications will need to be compiled and linked for the endianness
> > -	  that is selected here.
> > -
> > -config CPU_BIG_ENDIAN
> > -	bool "Build big-endian kernel"
> > -	depends on BROKEN
> > -	help
> > -	  Say Y if you plan on running a kernel with a big-endian userspace.
> > -
> > -config CPU_LITTLE_ENDIAN
> > -	bool "Build little-endian kernel"
> > -	help
> > -	  Say Y if you plan on running a kernel with a little-endian userspace.
> > -	  This is usually the case for distributions targeting arm64.
> 
> Running the checks through an LLM found that CONFIG_GVE depends on
> X86 || CPU_LITTLE_ENDIAN, so it won't be enabled anymore.
> 
> I think that's the only positive test of CPU_LITTLE_ENDIAN.

Would you like me to add a '|| arm64' in there? I was a bit wary of doing
so, given that I don't have a way to test it. Removing CPU_LITTLE_ENDIAN
forces the issue, somewhat.

Will
