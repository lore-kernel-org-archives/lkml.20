Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0823AFCFA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790745056; cv=none; b=tPFzq9dExpHyRDCgAYL0SQqrkdxogo/yNcOYxwGlUlWim9x/852cE51CE4YsaYs5GbDTlu/UFkzMV4JgxSaEOKqdu4U3OUSiJO+ACw3bayM/NmORnjDjd75/KKZMsIewRpspmpfKPoAeqEGtaUxrmBRecStn8i5YMafG4G8QglA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790745056; c=relaxed/simple;
	bh=XNgz6d/OZjziPvSkUOUSXbumTXkkojRGtXQXxfoLR5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PtCD535/yOlct6gjZJGAEKqYYO4Xdzn+MiGerhjMI4K2CTzzBW8BQOTlR9QhcnPTJMNuObkghKhZHWP+PMtM/kb+Kf+RfyUuTr0/3UFgUPl/k72E7UU2JpeWaq+X/Es7aZwGzwDT+32Dj0TkOtbqwDbonmXgp7QWQhAK86DGKa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Qj3iOJpB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Qj3iOJpB"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 963E71477;
	Tue, 29 Sep 2026 22:10:46 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98D6F3F763;
	Tue, 29 Sep 2026 22:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790745050; bh=XNgz6d/OZjziPvSkUOUSXbumTXkkojRGtXQXxfoLR5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qj3iOJpBJSgE1UgTtkfspHIrPqJXBq3eMgxYVBo8phSDlGxBx08q9zHfcQem6c5o/
	 CymR7GfymTQKKLxSO7tbMnMliPVLUpoTN6HoOSdA0DkzggSf3AuxzXu80fr9ERid8e
	 dHyKwn9FOUbhHKUQrFpIlscNlyN828VqueuMANWI=
Date: Wed, 30 Sep 2026 06:10:46 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com
Subject: Re: [PATCH v2 2/3] arm64: rsi: Add realm hash algorithm defines
Message-ID: <aryZ1lODdPGgKT2w@e129823.arm.com>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929-arm_cca_mr-v2-2-1d98bba187fd@arm.com>
 <arxxqJnhY83Q4g2z@FCCLS0092175.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arxxqJnhY83Q4g2z@FCCLS0092175.localdomain>

On Wed, Sep 30, 2026 at 11:39:36AM +0900, Kohei Enju wrote:
> On 09/29 17:57, Yeoreum Yun wrote:
> > From: Sami Mujawar <sami.mujawar@arm.com>
> > 
> > Add macro definitions for the hash algorithm identifiers, as
> > specified in the Realm Management Monitor (RMM) specification.
> > 
> > Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
> > ---
> >  include/linux/arm-smccc-rsi.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
> > index fddb77986f70..a83df2655808 100644
> > --- a/include/linux/arm-smccc-rsi.h
> > +++ b/include/linux/arm-smccc-rsi.h
> > @@ -144,6 +144,13 @@ struct realm_config {
> >  
> >  #endif /* __ASSEMBLER__ */
> >  
> > +/*
> > + * The RSI definition of the Hash Algorithm (as specified by the Secure
> > + * Hash Standard) returned in the realm_config data structure.
> > + */
> > +#define RSI_HASH_SHA_256	0
> > +#define RSI_HASH_SHA_512	1
> 
> Is it intentional to omit RSI_HASH_SHA_384 here? I realize it might not
> be implemented in RMM yet, but would it be worth adding the constant now
> for future support?

Acked. Thanks!

[...]
-- 
Sincerely,
Yeoreum Yun
