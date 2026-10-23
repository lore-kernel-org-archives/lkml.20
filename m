Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760784;
	b=vvYwxnIv9ZgORulUmYfBblcI3ZwyEqxAHCh79casm9RXA8WaLnMDdB9BqFrQW1nTCq2E
	 Q+LRuk1/tYxcYI3AlPFr87drmC20Fb0keIx4zz2nZ5Z8NfMl87oh+UtM/eKieecrNx/n4
	 fDpRXOrYxch8QBhMZ6yrzB6FEPJ/N/9FXlvrtOllpo/gtqPH7/1jhdWVfn9B5kOV/n/HS
	 /5sx9EVgJGEpLqjERYVy/SrzqiuiRZqDYOcSC543vf4yBXW8ym58vg91ciDaGAdIT9xaY
	 Gcfx8IhIpZjDGV4KWx8/9682H10MuwfjYoP59iig4Zajnx3wAlYE/sHnd3ilDQkoshQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760784;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=G3vFPv31y4WPD4engLG8is4bifG4YFLgsMOfrfKDVR0=;
	b=5J19xPh20Niu41tKs2zI1sIwWpKFPP6l5F+6urepQQ97E89Ay5d584u2U4Wfcfx1A5R/
	 7NoTVXAAfwglIDWpACAT8G4o/Hp757kck7hD5PZChCOXMC/U/Kworaba9CJ6WCqoGVYvw
	 yVeGooFf/yvysLB6fCgG4ijVNFn6b9KnQSJ+r4thVsocMLJAddRVSqarDsmRT0bB8B6/w
	 bUQwGrV/TDCTzHrPCN5FBSlXMkB1fpdG+N74rOxzGLnO8S3ChJiV0SiQVmLpbgHxAuSoC
	 7sig0TDJA4cpEwf6M3u+p5g+2MjSgx/zjKElLxPoin+CkAQRjjdufK8sEcBBuKQfXhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ZeCtn7hV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C562606A31B;
	Fri, 23 Oct 2026 13:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ZeCtn7hV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283201F01828;
	Fri, 23 Oct 2026 13:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792760784;
	bh=G3vFPv31y4WPD4engLG8is4bifG4YFLgsMOfrfKDVR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZeCtn7hV8NvfERK9FuVlopf2BhqVEiQJ8FA9z0HvXAHJJxtpsDjos71jK9kjsSbnI
	 dWiC2o7OTzOJ9hu6nLcOVl8qW5wV6tcP+Jcojeh849EQ2UznbmaMAuj/ZD5SWXUEeW
	 0GsoqDoNscv38eB0leip2rhaDENyNfCDJ7Ka3LMs=
Date: Fri, 23 Oct 2026 15:04:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alex Elder <elder@riscstar.com>
Cc: pavankumaryalagada@gmail.com, greybus-dev@lists.linaro.org,
	outreachy@lists.linux.dev, pure.logic@nexus-software.ie,
	johan@kernel.org, elder@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: loopback: Use fsleep() for delay
Message-ID: <2026102338-rack-garland-2a29@gregkh>
References: <20261022202455.104142-1-pavankumaryalagada@gmail.com>
 <a411ee0e-22c4-4797-9fdc-3ac11fa20d60@riscstar.com>
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
In-Reply-To: <a411ee0e-22c4-4797-9fdc-3ac11fa20d60@riscstar.com>

On Fri, Oct 23, 2026 at 07:48:54AM -0500, Alex Elder wrote:
> On 10/22/26 3:24 PM, pavankumaryalagada@gmail.com wrote:
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > 
> > In the loopback function, usleep_range() is used for short delays
> > and msleep() for longer delays. This requires choosing the delay
> > function based on the requested time and converting microseconds
> > to milliseconds when using msleep().
> > 
> > Replace both functions with fsleep(), which chooses a delay
> > delay method based on the requested time. For short delays,
> 
> s/delay delay/delay/
> 
> I think "checkpatch.pl" would have caught this.
> 
> Maybe Greg can fix this up.

Nope, not for staging patches, this is for "learning" :)

thanks.

greg k-h
