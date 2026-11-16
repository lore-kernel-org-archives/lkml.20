Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821659;
	b=nspEjVVi6MgKiC2rqYiZLrsEvzec+Soq0ff9QzN4rvTsEHD692oWLcVbd+VIVmpFnKuT
	 ovUVZ6DCoHcJ55KJCwFZYUyqR7igSmrL7oJmDjbiPumq3aMRx2jUWgbMqnhV+mkrjag0J
	 6/CBMyYlrO0G3po2i42fJatqP6r2/FQla3lYQKj61iFpRd/DhZrfQhvvIb/IYF7gcloQO
	 IuJX5tNqd1y0GJVIj6a31++iwG6sK41QIV9xo4fHe4YpHsA+/mk+6fZV6Flaj8AejoUWC
	 ZF+Xzh2kzb2igPo03h83qVUJ5FJKuhni9qCHocIgSUx27vxxjAK4mlpBW17UCNDh5Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821659;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xEEd5wWMYLP6A9p4+PhEN7fsM8QnNTW6SX1q9pyMFcc=;
	b=HVZGg0Jm6Yl6WAoQC5jI1KiKYOCCA9hm+HcsZ9MBTEoqp7nTiw6joWHwT4aKvIA39+hi
	 BTg8dqH9dUPUH1XkzgIW3Hs+gSr1Xfl3E5D5wdAP9dnlBqrpq2oZOMwd/1yKvnnx3QobU
	 v2kitLglZl0+yJHEk/LydkTtw4EzVgUHNzSuPAkqlCzMa4BIHEJnWQO4uyNi8L2IhRWqq
	 zZIr98aDMXNGzIpYIRUfEAynGghdDxmTwMSHkhVoxMsf2B5bSxHDwAOBFb2P6bG4B9gZw
	 STPhHFZrC9jWME19bseAStVqT+n/7njxR9gz9V6q08noVMCU+FfqpEXf4jOZh5wB6/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=txokiY2X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1745606A31C;
	Mon, 16 Nov 2026 09:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=txokiY2X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98921F000C4;
	Mon, 16 Nov 2026 09:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794821658;
	bh=xEEd5wWMYLP6A9p4+PhEN7fsM8QnNTW6SX1q9pyMFcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=txokiY2X/y3yzqe3T1W6myPJynMrWfjdfwXXJylrKkijUayJkiM2yClttwMb8hTaP
	 sWH5d6swZPg0EZm14OwVCXwN1CaIvyGj0m3FwQF4ekofi5jyNosmox8dAN0SHo++Sw
	 p/UorSrg9DFTdBkxinnaSKVTZC/ayq4pkBPH93CE=
Date: Mon, 16 Nov 2026 10:34:15 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: r8a66597-hcd: Fix clock leak and unchecked
 clk_prepare_enable()
Message-ID: <2026111648-landfill-skeleton-efe7@gregkh>
References: <20261102100455.600-1-laixiangwu@cmss.chinamobile.com>
 <20261116031043.505-1-laixiangwu@cmss.chinamobile.com>
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
In-Reply-To: <20261116031043.505-1-laixiangwu@cmss.chinamobile.com>

On Mon, Nov 16, 2026 at 11:10:43AM +0800, Xiangwu Lai wrote:
> Hi,
> 
> gentle ping for:
> 
>   usb: r8a66597-hcd: Fix clock leak and unchecked clk_prepare_enable()
>   https://lore.kernel.org/all/20261102100455.600-1-laixiangwu@cmss.chinamobile.com/
> 
> On on-chip configurations r8a66597_clock_enable() ignores the return
> value of clk_prepare_enable(), and if the subsequent register access
> times out the function returns -ENXIO without disabling the clock
> again.  The patch checks the return value and disables the clock on
> the error path.

And are you hitting this in a real system, or is this just a theoretical
issue?

thanks,

greg k-h
