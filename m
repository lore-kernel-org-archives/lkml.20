Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792563378;
	b=aHtAsiRM4SmtHnoW7872ybpuy1liyH9s4Pe2JZzq1IwW4onJHE+0ZDDPzngYV1DvW8z9
	 NcU8rk3mwOst65rcOTyVu3IFJGgOfWsLaFXTC+29RpLs8++32+9Z4S5jShcrrMgjEbEMA
	 MmByMnomPLXjevLlQzOPgWwnuhXXdduTQLIigBVOls/RF3lWFkvkK0zudDMXug+6ObkgJ
	 imKgvWpaSLqKesI+LF8PIePrKhdZD3Dw9K3OE/aZs5/jw3INAlQbafoIolELCcqQc5qRk
	 z8thDyMzCfIPyPKzVd/G+i6MgtK/yG9w3L4WzRyxQxLSItkjE+DjpoNw/Y9o0hqPEZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792563378;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bHQZ6Gdd9GlRNtc5Wo+sABNCVJYly8QqpFJP74IKXIs=;
	b=eGy+4d0c7PkUPzxs89zKc168nwi8/0KihDNpUtUrX9nV3vhHEjuGGlIKy8b/FkOBZr7d
	 PsqFrgG4/uQziaWC9brMCM1fGKyWL74BoyBIPLqTzWy4U/xNyAcgMaD+2bDdF77SEGG3B
	 GUks5aN53vENUvFQ13P6rftLZ62TiOPPBQFIdUt3P41kKrx+N887vQIXpb3YwT59yFXYJ
	 3zrEmVKvNPqLVG53I/l6DvpJBdf1BIwM/PxrNBXRkwqdReSmzuBS7rPZopqjcpVv2u4EP
	 pDO0NUG6z5Wc0/GcF93GP5zgMbhnhHRpxc1frBsrEul61ZifFY49Z2HG+3qw+j1VrDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=KYcWVhrl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58B6606A31B;
	Wed, 21 Oct 2026 06:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=KYcWVhrl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E390E1F000CC;
	Wed, 21 Oct 2026 06:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792563377;
	bh=bHQZ6Gdd9GlRNtc5Wo+sABNCVJYly8QqpFJP74IKXIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KYcWVhrlJ0FVUEPWqE04oBMUoV4Au5DdDD8m/GpNawdyPF3BWMXvOBJNVJgTgIkrw
	 3uSu89Hbsj2pyeR0UOJ6vg4wwHsjxqVCEw3Htgd0n61eUflbzjoYW9RKkWSkuqFY0k
	 C79JI+WYPbUyEZRE1DnliCX/p7pbKcAEjuY9qRXU=
Date: Wed, 21 Oct 2026 08:16:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Carpenter <error27@gmail.com>
Cc: LiuJunyuan <2058432396@qq.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: handle zero image size in read/write
Message-ID: <2026102154-osmosis-cubical-0695@gregkh>
References: <tencent_FE0C25ACDF20A06CBFD0651E7C4ECD7E5009@qq.com>
 <athV4vUa3aZDDlAX@stanley.mountain>
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
In-Reply-To: <athV4vUa3aZDDlAX@stanley.mountain>

On Wed, Oct 21, 2026 at 09:04:18AM +0300, Dan Carpenter wrote:
> We removed the requirement that AI patches need to a special tag.
> 
> Generally, staging is just for practice writing code so it doesn't
> make sense to use AI, but I was asking Greg to merge AI security fixes
> like this so we'll see how persuasive I was.  :)  The vme_user code is
> full of way more serious security issues and probably we should just
> delete it.

I agree, we should just delete it at this point in time.  I'll gladly
take a patch for that.

thanks,

greg k-h
