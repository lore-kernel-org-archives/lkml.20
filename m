Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712104B4024;
	Thu, 17 Sep 2026 09:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638359; cv=none; b=ZEgUJoNGMNcRcdg3HrxTuUqA6WarNrwh1Ca6hNft2nFx5UPhcP98RTJ9EYn6mbzFnAw7jnfO4qJ6/I439H88DL3+NsrMtge/T8uHIuccOXhZrUVGJWgxtt6nuJ4gIzAktxnziWaCY7tbZ56grGnZDevlgNrmTsb9eO7R9OiSvCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638359; c=relaxed/simple;
	bh=oo/ZtTfqJsw0A6rb3Kjh9GnmSkWT4lqAA2ftTafPO1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ya/NGaMutdP0PuVDbYoKjQw8yVyLyyszFUF4I5olwl93Qghvfa5aXL2rwdIIv2FJMErNUFpqDS0uKau8es+fNxOIqK0xQZ4gjZwSCPtH6LetTFkdSZvfwkG2ymjdBuYrXFsBr3x5hxw0YvZsAcB92/u/2vDnl+BtMPo9uRXeclY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2OGlLyn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2OGlLyn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC841F0089F;
	Thu, 17 Sep 2026 09:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789638342;
	bh=FDNuj8kuRT3U5fhsiJ+tvKS8uIKKCbPWByXgFVMYkX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P2OGlLynDadxkQjpPnk4D4NVYaPuiEWaEXJ1oPsc8R5f0E8yiwkI9gaNA4EK6Ynt6
	 1+XhDmDx+FGo+i/qY/8dUOgUGMVAL99r2jrKSqsKJxoIUNfgZF9fWHDFRXdfAA+3e8
	 gWOCWYRa1hXwwWPLgyIoOEZfwB85zZtkoHxgkZv0lu7JGPKYtF95fBVNNSrV6fwfBs
	 W+gOx6O/JXW6YiEuecXglDEgHbtmAvqSnE76wVNg69p4LcWDPYjaUTXvygqTuWFtYH
	 NyTBtsvc8T3lW0xPW5MfqedKxWB27iolgn3Z4cg5SCB+HR51MYZu9prBFO6R9Xa7Jx
	 JiQwQy1uzzXxQ==
Date: Thu, 17 Sep 2026 12:45:36 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "zhenghui.hao" <zhenghui.hao@qq.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm <linux-mm@kvack.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] init, hugetlb: fix early parameter ordering
Message-ID: <aqu2wGY9on8eBmlk@kernel.org>
References: <20260917062837.558251-1-zhenghui.hao@qq.com>
 <tencent_0490E1CAA4336214AB70F813325F3020A608@qq.com>
 <178963086483.2200502.14463144472620315064.b4-reply@b4>
 <tencent_770E6207ABD8F875322130E7A6D5E1CDA408@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_770E6207ABD8F875322130E7A6D5E1CDA408@qq.com>

On Thu, Sep 17, 2026 at 05:19:46PM +0800, zhenghui.hao wrote:
> Hi,
> 
> &gt; Since parisc is one of very few architectures that does not call
> &gt; parse_early_param() from setup_arch(), I think an easier fix would be
> &gt; local to parisc.
 

you should really fix your email setup :/

> Agreed, that is simpler.
> 
> Whether a fix is needed at all depends on the answer to your second
> question.  If hugetlb is not needed on parisc anymore, there is nothing
> left to fix and I will drop this series.  If it stays, I will send v2
> with the change inside parisc's setup_arch(), keeping 2/2 so that the
> same kind of ordering problem would at least show up in the log.
> 
> So I will wait for the parisc maintainers on that one.
> 
> Thanks,
> Zhenghui

-- 
Sincerely yours,
Mike.
