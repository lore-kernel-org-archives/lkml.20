Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792736024;
	b=kdnN98oPRH0lTFeXY4EmJHlS66dk7wrZ8pAtEtuN1CE8pRf/2P/ngSwC3bzNUa7wgqvJ
	 xKuUNZXqI7D3IwUR7yg1/cXkgEBfxzt/hJ9lQBVEE4mCr5Or63vO441GGk6OdyUnx7tol
	 C/GIPL9EXMfzkLiUA9mqBSxf7jlXgU73mlqwJzrWhlfkpO/oKVT5XYnYhwGlpB+OkPb6Z
	 6zG3GW/sd7kq7pMLzZPJt+uw2DZjIzPNrumjpHERm+vfhoIzLeaKvu0CTL10abQGIERmX
	 BwgEqZg32ZGOPWSaPt9SQdzownf2ZwssDKTvzlv0kMPKEGoxf6oQ0DI3+QH+7urlaAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792736024;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yXatSabA8wVyFHVQjo5zqKF3787tf/FgpyvkHyD7tpw=;
	b=f5tMcNChGoy3fhcgk8Evnv5ombbqpbWWGOL6UlmtytDmNOVXXOiiiUBkbprcX4eDk3ui
	 2moabvSgDUxATDsUwuUn9f0l2AiyYTm9F9Nlkdg/dLyawA188T70ysl2JEVam2fKoejXu
	 1Y0D+1FTrqu9cwpKNKNC0QS2lvwkEqEfYQNSQJbnM55KSTrbWOtnD50U9UYuOUUyoNm2f
	 roa3RwzCYjrJwOSyoXMuDOb7ZIxZiWcdPvG3qtz24JvM9iI2BvBidVjQIr6Kzi1fOAdzx
	 oyErJgm4r3wglU5/QXpirBjVSz8KmkC5hS1FHXKxTdF5fuBBVGeyQJ/WFdY6pNi7iGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="F/MD3oyZ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D075606A31A;
	Fri, 23 Oct 2026 06:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=F/MD3oyZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260651F01825;
	Fri, 23 Oct 2026 06:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792736023;
	bh=yXatSabA8wVyFHVQjo5zqKF3787tf/FgpyvkHyD7tpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F/MD3oyZbRK3x9fPUSgt6xfuB1jUeCdgrnSNpkeKs8nnM0odakonUpel3NqFV2N9z
	 NVwMuB+ueJ1w7oLmfZ/ZRmqe3q/p9e7NXBPOZQEe3PFbQ4WTfdYqE+9n2H1DxHuQ86
	 20dUx3IduOk1+0QJNoq1Oqj884zv2R/kVyT/ykK0=
Date: Fri, 23 Oct 2026 08:08:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Breno Rodrigues Alves <breno3011alves@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: Fix three real issues
Message-ID: <2026102337-headroom-shun-9d45@gregkh>
References: <20261022215349.87471-1-breno3011alves@gmail.com>
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
In-Reply-To: <20261022215349.87471-1-breno3011alves@gmail.com>

On Thu, Oct 22, 2026 at 06:53:49PM -0300, Breno Rodrigues Alves wrote:
> Fix three issues in the Xilinx AXI-Stream FIFO driver:
> 
>   1. axis_fifo_debugfs_init() did not check the return value of
>      debugfs_create_dir().  When CONFIG_DEBUG_FS=n, the function
>      returns ERR_PTR(-ENODEV); passing it as a parent to
>      debugfs_create_file() triggers a WARN in the kernel debugfs
>      core.  Bail out early if the directory was not created.

This is not a real issue, you should NEVER be checking the return value
of any debugfs file, and no WARN will ever fire (if so, please show me
where as that should not be happening.)

What tool told you this?  Please fix it.

thanks,

greg k-h
