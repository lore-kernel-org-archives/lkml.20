Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769579;
	b=wzhX1HNnrqmwwva4L2dH3ruoKzqImEoW8kuAvNhaQPRnxEAK4SHB0MqOzUN9VpGTZ94R
	 6FkPRs9Wr2NEI8Z3/P9PrjQr75kYqUpFdVTl5x+SX3BNQK4XwKULCdCJPWZ34yLKTSCyN
	 L7NLZxzIPuD7R3c5s4jIgUu8L+fbKCvWWTRBe6ZJgEK3dyGIm0OravPoudtUH00yKlLZ1
	 lxdgeAkrxYfuP9wjgVysAfRKMsbZRsKq0uOEW22Az8UV/LrUcpKSKHWI5BLpPMTHCmdOB
	 aMNlG/Zf61J2b7oQ60247hyTMEaALKY0CyHjzRddbQINcaymTKIEevJyizG7hWFt4mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769579;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mJUxqxtO/dpkX0Pdqn6J/myXpc0oXdF5qJgym0bckD4=;
	b=Sy8ea3Z5ZEyfUOvo3Jq4MexKY0iLn8iPsILeoV/m5u4AfiYzZYq9+Fq7hTzCm9G247ms
	 Xnh5yjQyGyWHcRUtM0KKUt0Hufiw8q38zvQBQakKM6ZNmyE/iKEYjw6zouQmjIsKj/wlb
	 Rt/dAShDI6CiwGTz64Hju3pyXWlWbuQ0S0Crx5Yf/Ybfx3l8s+/jylB2Em5Cm0YAyCGzn
	 I0SGDqnyebEq2CbJp3kFITHKTEyHlzzBWk5AjlCi4PWH0EfhWt6VbC3soiKp8W0oyw3fz
	 yG8xcZvKHvKaYuH3W0O5FvdWAaEBlPvt+wsdoIj58KBZt0m2YBUnjAbIAsWcF752N2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=L+04AfOh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B8B606A321;
	Fri, 23 Oct 2026 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=L+04AfOh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797F11F01825;
	Fri, 23 Oct 2026 15:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792769579;
	bh=mJUxqxtO/dpkX0Pdqn6J/myXpc0oXdF5qJgym0bckD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L+04AfOhFGLnqJsmLTt34ms0F+3XZKIP1auyEUzrEsmUmbGgm1JvsaN8Ytzde5Y4B
	 nakuogZy2z6TqwfsmixKwTDUi6ouWmnYSH/BF+yLNJJnBbSvsJWJAr6PdkJ73Xt1lA
	 3Nq2q4nC7+XNcLGNtBr+R+hvUPfweqUvGhGm0tP4=
Date: Fri, 23 Oct 2026 15:36:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: LiuJunyuan <2058432396@qq.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: use scnprintf in tsi148_alloc_resource
Message-ID: <2026102335-speckled-riveter-2b66@gregkh>
References: <tencent_F5EEA06B3CD49F9EFF5C185259BF4134DA0A@qq.com>
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
In-Reply-To: <tencent_F5EEA06B3CD49F9EFF5C185259BF4134DA0A@qq.com>

On Wed, Oct 21, 2026 at 11:13:49AM +0800, LiuJunyuan wrote:
> Replace sprintf() with scnprintf() when formatting the resource name.

Why?
