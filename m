Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6CF3C09F5;
	Sat, 19 Sep 2026 10:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789813718; cv=none; b=VTzD2BVUdY/LEQm5VjIS+V/wV5R1PXdDC0hBIx9/0tz9isYZOCabp4uU5aLrbCa0ZFv53Ikg4tmH4q5Zj8o/ejGE54emob5F+vKCxZ/QUb8vGYsldduWcK8MSGTqo6DHL0nREm1tRD8Wmv4nEFiXKL2ykvZwOZTrGNqZ8fBUxqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789813718; c=relaxed/simple;
	bh=0HUYIsNCzNi749T9ihKTi0vEKHzX3ftVKm+K5IW40Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3QtYBXYoIuZKjDfClyTcZq2807VHpVz+rU5nnHu3LaxJ0FiUnpC6IpU2lCUn/+5JSXNI6H7xs199hksuCjh5yiES667s9aPeUJAgF1fA+ai0pF/NyG2dOKCAKEa6X+atdGABbY9ifyOw38cxolhny1cWBz9TNuZo8beS+P7RgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SyWK7RrP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SyWK7RrP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932BE1F00899;
	Sat, 19 Sep 2026 10:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789813716;
	bh=ex51qjJIUiy+LT/b89tW+TB4nvEJbnYeZ+ussqasqO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SyWK7RrP/cV4a8W1T9L3LMiJ7Q8ai0M2AQqnD19khzEaHpEK7GTJL1Yc5po7bAhCE
	 1CS4TGRNo743kYsCQAF9ErWD+nqRtgqx9/DK9EJZgAmEDUn+XstJ/pkb+CfVM22GND
	 tkYWvbmnqnmc1MJoRJqCtpCxAQJQOB7VunpLonzw=
Date: Sat, 19 Sep 2026 11:26:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: User <julianpoulainpro@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: validate tx_fifo_depth in
 axis_fifo_parse_dt()
Message-ID: <2026091948-stack-dupe-e9aa@gregkh>
References: <20260919100511.16032-1-julianpoulainpro@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919100511.16032-1-julianpoulainpro@gmail.com>

On Sat, Sep 19, 2026 at 12:05:11PM +0200, User wrote:
> tx_fifo_depth is read from the device tree as an unsigned int and
> later used in axis_fifo_write() as:
> 
>     words_to_write > (fifo->tx_fifo_depth - 4)
> 
> If tx_fifo_depth is <= 4, the unsigned subtraction wraps around to
> a very large value, making the bounds check ineffective. This can
> cause the calling process to block indefinitely waiting for a FIFO
> vacancy that will never be reached.
> 
> Add a validation check in axis_fifo_parse_dt() to reject invalid
> values at probe time with a clear error message.

Please tell your LLM script that device tree values are "trusted".

> 
> Compile-tested with:
>   make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
>        drivers/staging/axis-fifo/axis-fifo.o
> 
> Signed-off-by: User <julianpoulainpro@gmail.com>

Not a valid name, sorry.

And again, don't use LLMs on drivers/staging/ without reading the email
archives first.

thanks,

greg k-h
