Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7092F3C0A0B;
	Fri, 28 Aug 2026 05:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895445; cv=none; b=S+dGQIh6Ou0e3e3GoAkFawai35EMsKrAGIm+JqivJpOfbPkKQc+xuV/bjW3IPR88D05tFjPZY1EeJ5iYGl71QXMzBOOcix5ZC/VWWus+sZQK5jRxR/MDsCU38jnfCjrYY3iyJfq598MBl27puBRRxzLU+qxCfD5F8kWVuFctrUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895445; c=relaxed/simple;
	bh=uH1zSCxNGu0NxXZQHLywIzkj3nzfJp1ITQ3RPhu4wtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8WZif06Mex47SAqvBIfatTKyRf0pLmKqLi/fN3Jr0rUCVJFE6HiNehMCJELuj9iwN2ByiF+MRBHsbphgR37M0+fAHIz6UqJIk7yhMUxQanLW5OgHFbTcqOOr4XDeUXPWFxZkmnUeVbBMX4PaJS9MJRluc79ADAfCwxnjF3hhzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UpHybDtl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UpHybDtl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E5F1F000E9;
	Fri, 28 Aug 2026 05:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787895443;
	bh=x+vi06FLB0tMj344jy5DVO+QmkjEfydXs4zfRXatoT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UpHybDtldsUSd+cI2eag0xXaLr7svVllu6aV3BB3tGjlHQFkb0Lh7iI+nsKwhscOi
	 ciVsf+ZN5yythZb0jQld5/iz08q8bzK7BWuwrv/6heHSijY5rORIreKQsPgoX/kKwD
	 4BS+LDM3BSvCfNnaPPYrPLPcL5av55Wcysl4/K5I=
Date: Fri, 28 Aug 2026 07:37:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Romeu G <asm.artisan256@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses in
 ioctl_cfg80211.c
Message-ID: <2026082812-award-service-889d@gregkh>
References: <20260827222752.122457-1-asm.artisan256@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827222752.122457-1-asm.artisan256@gmail.com>

On Thu, Aug 27, 2026 at 11:27:52PM +0100, Romeu G wrote:
> Remove unnecessary parentheses around the right-hand side of
> assignments and around function arguments. This clears up all
> "Unnecessary parentheses" warnings reported by checkpatch.pl.
> 
> Signed-off-by: Romeu G <asm.artisan256@gmail.com>

Full name please.

thanks,

greg k-h
