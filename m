Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87213C09F1
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986283; cv=none; b=uPxKpVIu+4vOFYb6tj7NlPimVCp9L27PaWXf7086Lec0egpr3+RbEsYlQIfYpMrFOMKPUPvwmhoMKZFHh60xLFJ0DwRV5djxpwURpT8YqBYZF/Auz9XHFve12kztL9vQYWvb4YQjzpeGiPAmRNLU1qFwlM48Jqs4yXFN71rEZkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986283; c=relaxed/simple;
	bh=FhXjGblU154b3/iGKZgOvko5HqBskKdnpkd2ss6SKBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nONR4aVGiOliEfB/eIGVG4bNT7LIlTlmdQDnovyntWuYodVu3TSfzCvjUMfxcjZ9+9OphIeV74SCfBCg+QT/VFoj1Wamqi+r8nxjlR5aRZdH9t5paDvPNVnkE2yztmiapeJz0Bhu46hHvVOTE+RQW8MjTR15s/0lZPvFEnc075o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PP+b/+Bl; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PP+b/+Bl"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87C3219F0;
	Mon, 21 Sep 2026 03:24:37 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9DBA3F86C;
	Mon, 21 Sep 2026 03:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789986281; bh=FhXjGblU154b3/iGKZgOvko5HqBskKdnpkd2ss6SKBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PP+b/+BlFbviOChQuugyXCOT9qITsdQW628WzZJIkn8J7eQr7Z+d1r95L0xVfD1Bw
	 LcS4DgVewJ0NUeNGAUniVn8IKG3xT5vqPtwMy+NzOibblC1J6uR0epCNTp6uIzItWt
	 r7SQsbQCnIGDsMgAECycXtGKxHqhnlHZ7LsRHu2s=
Date: Mon, 21 Sep 2026 11:24:36 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
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
Message-ID: <arEF5IOJSlQyYwX5@arm.com>
References: <20260918145217.1669-1-will@kernel.org>
 <20260918145217.1669-13-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918145217.1669-13-will@kernel.org>

On Fri, Sep 18, 2026 at 03:52:14PM +0100, Will Deacon wrote:
> -choice
> -	prompt "Endianness"
> -	default CPU_LITTLE_ENDIAN
> -	help
> -	  Select the endianness of data accesses performed by the CPU. Userspace
> -	  applications will need to be compiled and linked for the endianness
> -	  that is selected here.
> -
> -config CPU_BIG_ENDIAN
> -	bool "Build big-endian kernel"
> -	depends on BROKEN
> -	help
> -	  Say Y if you plan on running a kernel with a big-endian userspace.
> -
> -config CPU_LITTLE_ENDIAN
> -	bool "Build little-endian kernel"
> -	help
> -	  Say Y if you plan on running a kernel with a little-endian userspace.
> -	  This is usually the case for distributions targeting arm64.

Running the checks through an LLM found that CONFIG_GVE depends on
X86 || CPU_LITTLE_ENDIAN, so it won't be enabled anymore.

I think that's the only positive test of CPU_LITTLE_ENDIAN.

-- 
Catalin
