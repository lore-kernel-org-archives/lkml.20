Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416A04DDB2B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789397; cv=none; b=JgCjEFW9/5BlLATHgQRGksn5Cg2AXWNcZ00tBDPj51LL/JwXybjSUKuN+CpDAo7cbepGBnwUkgjgBID0uJc0aFrDnXWqzeez0Nsc/WoPh0mWIIHyZLIRhEwsbhDvcK6P1ag8xTyO12KhpbcDJG5pnMJbdy7HhzWOU1lD9oEq3zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789397; c=relaxed/simple;
	bh=9G+nYPZjxZp3+BWo+24LXSiLH/Q41rJWQIgoU1NEh0w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L0b0YDPMRBaur888P+UgudJ/g1ukEWSW/Q4outuoz4BI+LPR54p0o2ks4gNLWVdJBOKtec/TJ1JVdeGVXEAmTsnSUs35l59oOivqWW/chUJD0+MF4J4OHFDKzYJ7pPfuFGZuWYtfXTrh3/j9KPeEa9uSNbgg6MH8MkfKT25ccmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jCb0aqVf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jCb0aqVf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC32F1F00898;
	Wed, 30 Sep 2026 17:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790789395;
	bh=PvWXeraGZiHbRwjvDC9z3e0BfGI6FY/Vde4KI8u/Vmk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=jCb0aqVfcdk14HyQOfMfZKhLxziLYFZ/LlemyU3K0hGq1/UA0vDYikflrmL3hy4No
	 qcSCtfcHktL6LQn/kXKQtofDa9mOCGsNBmJIkw71Tn3wrXQPV8qDgVFIeTAT/CNDgr
	 Q79bzPcwvqL+IJcCTqmuHZVRvQin9n/HiATpvm4vKsIp4BKNY7QsPmHu13HXLA7Ou1
	 dtUjcdtPUILpFhYr8lkaAlg/4dA+IILKdsktCeJvT7AVuGorp81/66uMnloP8ukLEa
	 B/V3B3U9dSyZqMeOCWLi638qFUB4U3vtSnHw9hdP2sdfj9AkhZv5gXhAsVLCCP+Hpt
	 +A8ITlIhgBe9g==
Date: Wed, 30 Sep 2026 18:29:51 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Bence =?UTF-8?B?Q3PDs2vDoXM=?= <bence.csokas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Conor Dooley
 <conor@kernel.org>, Yicong Yang <yangyicong@hisilicon.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] cache: Make cpu_cache_invalidate_memregion() error
 out if there are no handlers
Message-ID: <20260930182951.053efb56@jic23-hlaptop>
In-Reply-To: <3ce86981-ee64-4cda-8699-3c010ff496ba@arm.com>
References: <20260922-cci_enxio-v1-0-00bade212729@arm.com>
	<20260922-cci_enxio-v1-1-00bade212729@arm.com>
	<20260922191808.b82fa138c8bc80a1285e8ba4@linux-foundation.org>
	<a5456d59-aad5-40cc-ac89-5c0c113b560a@arm.com>
	<20260923183141.5a9b9c44@jic23-hlaptop>
	<3ce86981-ee64-4cda-8699-3c010ff496ba@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> >>
> >> [1]
> >> https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/cxl/core/region.c#L242
> >> [2]
> >> https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/nvdimm/region_devs.c#L93
> >> [3]
> >> https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/nvdimm/region.c#L113
> >> [4]
> >> https://elixir.bootlin.com/linux/v7.3-rc3/source/arch/x86/mm/pat/set_memory.c#L372
> >>
> >> Bence  
> >   
> 
> So the consensus is that my hunch was correct, and this is something to 
> address? Should I resubmit this patch as non-RFC then?
> 
yes

> Bence

