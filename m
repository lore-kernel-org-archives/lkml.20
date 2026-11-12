Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487039;
	b=IeP7XXmZWIuTklk2KPPyT0mhxShrJoK2kJXDZy2ESmpZplPQ45RCoMji29G5npcMddga
	 dG4L9s0aSWBUQbZtMzgubWB0WQCGd6IuS/ZJrQ+7MhNuYiTGfbxAtdbxVXMKnnIzA51FD
	 3EAJ+IbFU1Q4vTx2ciGSEgzWMCe+uvfutHWsbW9QloQnoSTjZsVYekKCCDupIEo8ArYJx
	 IuPOcY8G94tuFW2fi1Qd76BT7l0X0Rf8ixi9SPStvumPNxCYhmzYr5Kw9HhDtYcu/2Q0k
	 6MEWDZMvQ9qFn2zp3iZON9SQRzcMm9kIT9PGN6/dNvYcMpaCdiY1uNdp9BGSekuvkGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487039;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7Pv6uCYXxAP5PY///N6czBGJRO8cK7gBbhk8wlnanME=;
	b=n2ebtZRZ6Hwlb3L5gH9iHo+QA9lQVKYbrgSQ4AdbK72KFzBsvrcIf5iK4PdOIibKLx5V
	 SU0jSaUgzKwxfplDLt6pnxlhBod2R8x2NFM7yCnLPlrO0BSERmz75YcU08HrlTX3tvqRD
	 VmALKRkGhwFIgRnNGkSqABBvJNmxFvsvdQHNGqhtvEmufwYYVAXob5jErmaIZroCQ+ZPV
	 nXoqXHfPf+nJSDPgU0mLHv2Q9onjp1Em+bW+almEq2NbOQnNUb0m9mKR+lu6BbzJClYgN
	 pQIpM5IHsxhB3ub+hcTK0ZT99cUDmDkFPYfttXEtXNxleQ0frDwPIva1KYVGwZbmrXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=eE3FyKSx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80990606A321;
	Thu, 12 Nov 2026 12:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=eE3FyKSx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F7C1F00A05;
	Thu, 12 Nov 2026 12:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794487038;
	bh=7Pv6uCYXxAP5PY///N6czBGJRO8cK7gBbhk8wlnanME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eE3FyKSx4BO8Ey/sjAZO2+UMEoE8Bn+ghTFTcRHi6EYOfFRVot8fS1KBAf4AkWtdP
	 THLjUzvb8vuMYEibgceUBoCX6c3gpxxgp+ozEmwyvSI8NpZGj2VT3uCGCEPqxKvkmW
	 oV2h1Fftz+3iMs3GZ89BgwE/K3o1wlgUhUoxpBCs=
Date: Thu, 12 Nov 2026 07:37:14 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Aviv Levinson <levinson.aviv@gmail.com>
Cc: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: uart: replace IDR with XArray
Message-ID: <2026111219-guacamole-quality-2ecf@gregkh>
References: <20261111182330.77824-1-levinson.aviv@gmail.com>
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
In-Reply-To: <20261111182330.77824-1-levinson.aviv@gmail.com>

On Wed, Nov 11, 2026 at 08:23:30PM +0200, Aviv Levinson wrote:
> Migrate the minor number allocation from the legacy IDR API to the
> modern XArray API to take advantage of its built-in thread safety.

But why?

> As part of this migration, the global `table_lock` mutex has been
> removed. Mutating operations now rely on XArray's internal spinlocks,
> and the lookup logic in get_gb_by_minor() has been updated to use
> rcu_read_lock() combined with kref_get_unless_zero() to safely
> pin the device reference without blocking.

How was this found and generated and tested?

And kref_get_unless_zero() is almost always a call you never want to
make.

> Signed-off-by: Aviv Levinson <levinson.aviv@gmail.com>
> ---
>  drivers/staging/greybus/uart.c | 37 ++++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 17 deletions(-)

So now there is more code?  That feels like a step backwards, don't you
think?

thanks,

greg k-h
