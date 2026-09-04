Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F68353A6E;
	Fri,  4 Sep 2026 04:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788496391; cv=none; b=lTcblqIxMjYeDfJCmFv44RE2xazJr40Pnvi2ZtxN9LQkRNZd+ms7U+FSonxrTvtTGcXi/XQzgSGwsWsBMLmgJCaWWqrsU2bMp4bTMMgY7cDPOO/2xmDPLY/KScwVg8ZQF6FEuym7MgGjEnj9BuxwEjMRj0D7p5KGqsvk+qUbEHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788496391; c=relaxed/simple;
	bh=UMP/twqaCXFM64n+ESAE+ILhs0pm1KRpvyHjEdiE/PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjhaK9Ngjh1PlWnLiAJFYPkrSLZeMn3YznAPGV8zgseJsNFtlsk0oRbNjNczrOPIu9cDi9NFh8YB2ixtAfeCaw81sPGzkQvLQrLZCPjuJdIh2h4mRHlt5bds/KiPnhbDQTMGxRSy7/COU/WDqeIRHswqzSrqv0cRzPpvqgw41zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EcnfXOy2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EcnfXOy2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98AF91F00A3E;
	Fri,  4 Sep 2026 04:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788496389;
	bh=unrXlDYh5Tf6V727Jf3BC3eLYeDGPgAwGcSXHLdS1IU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EcnfXOy2AWtSlBKNbx/Bzv033lm5teHmMvxgs7aZOUN37kXi2zSv94hOFJG8dU24+
	 jARB/ByUxdAyLVa09l9ZirpTiGZfZE7NwUwme0H6MVYu5guNt3abw4xf4SIhYCv6iV
	 WgwtBxszyQee3NOTWslXVbV3sOqtIPZGw/bOtcwY=
Date: Fri, 4 Sep 2026 06:19:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Suraj Theekshana <surajtheekshana1111@gmail.com>
Cc: vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] greybus: cap: bound IMS/auth memcpy to ioctl size
Message-ID: <2026090416-humbly-remix-5d86@gregkh>
References: <20260904034628.12376-1-surajtheekshana1111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904034628.12376-1-surajtheekshana1111@gmail.com>

On Fri, Sep 04, 2026 at 03:46:28AM +0000, Suraj Theekshana wrote:
> cap_get_ims_certificate() and cap_authenticate() derive copy
> lengths from response payload sizes without checking the response
> header size or destination capacity.

How was this found and tested?

And doesn't this info come from the hardware itself?  Is it not trusted
here?

> Reject responses smaller than their headers with -EMSGSIZE. Reject
> certificate and signature data larger than their fixed ioctl buffers
> with -E2BIG.
> 
> Signed-off-by: Suraj Theekshana <surajtheekshana1111@gmail.com>

Did you forget an Assisted-by: tag?

thanks,

greg k-h
