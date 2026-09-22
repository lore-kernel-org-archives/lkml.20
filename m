Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E1055820C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790090265; cv=none; b=QcttnnPjRD3mKgfS3/P6jm2JWLzqmx1mbm0ymq4x6PB90TVi7JNpiiO+HZ4wEX0eJXWhQ4JRQ+b2X2gPHndRYuJq4oayGY0mixwVnFLbEYQ9uJGWQLwJpsnovAVvnrpewhtHizku1O1ES/DDjV4K8h9RrM/Jm85slyTZoFYoadA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790090265; c=relaxed/simple;
	bh=qcQAZi3C9KEKVCBrKlQm5wPF/QzOabtzbyH89pFNqKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2Tkwf/FCo3jyAXdKpFgl8gW4DpbGmdtdwwjTfbQZ1Y/lS9/vZLODrQGNnwXEgcHUNsmXj127t9oVE7kRvdwmgNwmi1iKMAiKjcEQ3CuByLYtahzcoCrEO5N6rfoNBuWGVy5RdoMM1nB+e4FjFa1zIkAyWuCdA2KNI1DklkhEgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=c7KOIxYw; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="c7KOIxYw"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D7771576;
	Tue, 22 Sep 2026 08:17:39 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F0863FA32;
	Tue, 22 Sep 2026 08:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790090262; bh=qcQAZi3C9KEKVCBrKlQm5wPF/QzOabtzbyH89pFNqKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7KOIxYw+wpS/RrOBtHZPEoa57VsVibuLFGNxbuxwd5gOZ0PyKUaEoISzKjUkGm+O
	 cRnFupxuwJe0JyM2CbdZiq/dPP8ao0o7SFv2+hYk1oun7k8V+WaxzzZjfFLG9EUXEY
	 OuYRrdnKbDr0QYRRHufbQIooq5EOPRgeXMonIamE=
Date: Tue, 22 Sep 2026 16:17:35 +0100
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
Message-ID: <arKcDyE6pkBI9YVt@arm.com>
References: <20260918145217.1669-1-will@kernel.org>
 <20260918145217.1669-13-will@kernel.org>
 <arEF5IOJSlQyYwX5@arm.com>
 <arKaWVwH5RXKpDTf@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arKaWVwH5RXKpDTf@willie-the-truck>

On Tue, Sep 22, 2026 at 04:10:17PM +0100, Will Deacon wrote:
> On Mon, Sep 21, 2026 at 11:24:36AM +0100, Catalin Marinas wrote:
> > On Fri, Sep 18, 2026 at 03:52:14PM +0100, Will Deacon wrote:
> > > -choice
> > > -	prompt "Endianness"
> > > -	default CPU_LITTLE_ENDIAN
> > > -	help
> > > -	  Select the endianness of data accesses performed by the CPU. Userspace
> > > -	  applications will need to be compiled and linked for the endianness
> > > -	  that is selected here.
> > > -
> > > -config CPU_BIG_ENDIAN
> > > -	bool "Build big-endian kernel"
> > > -	depends on BROKEN
> > > -	help
> > > -	  Say Y if you plan on running a kernel with a big-endian userspace.
> > > -
> > > -config CPU_LITTLE_ENDIAN
> > > -	bool "Build little-endian kernel"
> > > -	help
> > > -	  Say Y if you plan on running a kernel with a little-endian userspace.
> > > -	  This is usually the case for distributions targeting arm64.
> > 
> > Running the checks through an LLM found that CONFIG_GVE depends on
> > X86 || CPU_LITTLE_ENDIAN, so it won't be enabled anymore.
> > 
> > I think that's the only positive test of CPU_LITTLE_ENDIAN.
> 
> Would you like me to add a '|| arm64' in there? I was a bit wary of doing
> so, given that I don't have a way to test it. Removing CPU_LITTLE_ENDIAN
> forces the issue, somewhat.

Or turn the dependency into X86 || !CPU_BIG_ENDIAN.

Was arm64 the only one to define CPU_LITTLE_ENDIAN before?

-- 
Catalin
