Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4998348F838
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453825; cv=none; b=s3mqq86I6/9rFN8FubxaR2v5GiFWac4fYFtvSunABOM07nMKXatCPo77fXLUZCNQBcP5edgOM9ia3zGJB1tfdxzVl5tR19nWLV7R+I/vj1FU3DLLwVFXsq/hc1HuQjyb8NSZgdzb5voHUKE4lfCwQV4eYvGepVPB7xPNvGUGMyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453825; c=relaxed/simple;
	bh=M/Ued0Ru8TDDLqW2AqKRyIpSE9vcc90fyzI1h1uvSeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hiqjORTsjvh8lb0LqRpA25OIxh12TyVWTIpwLLSf4PW4v5EY4jfKVRd8D/pUgvxPEb+iuI+hQhasfpdsZu2WmCfcW2T+DaSafJZPfeeiv4qwMSQn/IZiKkIF1eFqWhXz1GbAeKFYSgc0ng933WUwxXS93u+4pJSlW0XQ6cum93M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hpqj7e9p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hpqj7e9p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9888C1F00893;
	Thu,  8 Oct 2026 10:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791453823;
	bh=hpUiMVYggDHC60dcd+5OU1osGuMwZpbWqR6frOfrR9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hpqj7e9paR3mLUgx+I9fl3recU/uXrRAyWLlziTybAbQAZv3w4wLaBb349DuynC9F
	 gpU0/ybWFt+MegvClIbMPIlw+5jwM835m4w4fgQLQo9mCFIWLglqVGCAKfkWNs4tT4
	 BgdItEHFcwTpVS6UDVKECTXb3fzziR2cBA2x3BAkCipd5RIfqfIHQZ0ev1deRk1NS5
	 aL4aIq4+KdrP5LitbApMC6W75iQC/uHL1CsV5g07gKFQVd6EBMnCgOGxPhJ3lMvBV1
	 uq4rLCfDywOjVRNNzN1t7ij7pcko4oyb08JxMc8sd3gLXcgeh0BiwQDl3UoB85Yf27
	 mEYh1YaM0IdWg==
Date: Thu, 8 Oct 2026 12:03:38 +0200
From: Mike Rapoport <rppt@kernel.org>
To: tarunsahu@google.com
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, dmatlack@google.com,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	dev.jain@arm.com, Pratyush Yadav <pratyush@kernel.org>,
	linux-mm@kvack.org
Subject: Re: [PATCH v3 2/2] memblock: use binary search to locate candidate
 regions
Message-ID: <asdqetdGMXGhtiBh@kernel.org>
References: <20260926092448.4090401-1-tarunsahu@google.com>
 <20260926092448.4090401-2-tarunsahu@google.com>
 <asC1FwHVHOhBHDGK@kernel.org>
 <9huzy0c9siyn.fsf@tarunix.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9huzy0c9siyn.fsf@tarunix.c.googlers.com>

On Wed, Oct 07, 2026 at 02:06:56PM +0000, tarunsahu@google.com wrote:
> Mike Rapoport <rppt@kernel.org> writes:
>
> >> +{
> >> +	int mid, low = 0;
> >> +	int high = type->cnt;
> >> +
> >> +	if (type->cnt && base >= type->regions[type->cnt - 1].base +
> >> +				 type->regions[type->cnt - 1].size)
> >> +		return type->cnt;
> >
> > Using local variables would make it more readable IMHO.
> 
> removing this as per next comment. Let me know what you think? Should we
> keep this optimization or not.

Yeah, that's fine :)
 
> ~Tarun

-- 
Sincerely yours,
Mike.
