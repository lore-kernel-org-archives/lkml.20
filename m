Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2069F45D901
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790755331; cv=none; b=BDcJgk4S3RAw6ymrBJMZfkC+p8dwW9SP766pH4Xmu3bgkwFjwETssA2CBa7jUVvVppVRl9lk8Uv9Y/Yj8l9VGguxkWKM2+TeiKqOIEaMTfMAnO6n9QLTEQFvTX/knaFWCsmLFL6Ye1nGUFfusk+eJusbzddPnGEDy6nuxuDyEw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790755331; c=relaxed/simple;
	bh=NE0MKVJbTNiJHKiRqesLMOWsJ1/se121BdPUb2kg61I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JMB9DUrWiZ8sFuqTi+b2EALXjRiACn2+1l3m7JocL9ub3lzit7dNWzArkhEFQUsMYjQ7OYH2A/1k716DeyVApQ696SW20UYHOw62QcW7/WUz+i1ZNvezb0GwdQ66VCbyzrcarp8Ua+jS9XVArAD+OeNIvIGj7Jb0uD73dJpVa+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nC5Bj5aA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nC5Bj5aA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35BE71F000FF;
	Wed, 30 Sep 2026 08:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790755330;
	bh=xwx6m2ZQp1le7cNOkqQqNCbD12qIRwdpYKQvV6oZXDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nC5Bj5aA31/9/ysocwO/rUmDrrKRqi23kp87LQiXzOH0odQmkGCyE/9/QRFHM/K1n
	 KGM1COe7P7iJQ3DgoD5YixNY1MK9eYOedHhA8/Nkop1ayExffo7BVwcjuhXtgedTVm
	 4lIRa1EFEg4VBshglItYIDt6NUDg4BJPS6DdiJuBanNEYw6VxVhZgybXg/yzbKr4D+
	 SlZH17jVuktoua0mlulBOIWWkaBSvD3MZgrdRH90CLTZ8rBFTYqL2kh3tYzO0AJu3n
	 xoDF9yz4bKyk/R18j27r+N0kAP0SgDft/LuG4CuPzxg6ktxte7NHlTRSf9dk/lv4eM
	 pSpxjWXXZYzDA==
Date: Wed, 30 Sep 2026 09:02:04 +0100
From: Will Deacon <will@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>, Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: scrub vector and pointer auth state on task death
Message-ID: <arzB_AJIohqhvoiu@willie-the-truck>
References: <20260930063647.1356613-1-brads@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930063647.1356613-1-brads@mainlining.org>

On Wed, Sep 30, 2026 at 06:36:47AM +0000, Bradley Morgan wrote:
> When a task dies its SVE, SME and FPSIMD register state, and its
> pointer auth keys, stay in freed slab pages until the allocator hands
> them out again. init_on_free=1 users get this wiped for the whole heap
> but the option is expensive, so it is off in most builds.
> 
> The vector registers are not idle memory: userspace crypto runs
> AES-GCM and Argon2 through SVE, so key material ends up in
> sve_state, sme_state and thread_struct. On task exit and on the
> exec and vector length reallocation paths those buffers are
> dropped with a plain kfree(), and on task death the register file
> copy embedded in thread_struct is not wiped at all. Anything that
> reads the freed slab back (slab bugs, cold boot, a leaked page)
> gets the dead task's keys.
> 
> Scrub it. kfree_sensitive() already exists for this exact job,
> so the freeing sites just switch to it. The register file copy
> and the pointer auth keys embedded in thread_struct cannot go
> through kfree_sensitive(), so arch_release_task_struct() zeroes
> them directly with memzero_explicit().

I don't really find this very compelling, tbh. Presumably this data can
end up all over the place: on the stack, in a vCPU structure, in a GPR
so it really just feels like doing something for the sake of feeling like
we're making the kernel more secure rather than actually adding any
tangible benefits. There are also lots of things you're not covering,
so it's not clear why this is either necessary or sufficient.

What prompted you to do this?

Will

P.S. This ended up in my spam for some reason.
