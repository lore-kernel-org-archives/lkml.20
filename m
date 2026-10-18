Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ADD278161;
	Sun, 18 Oct 2026 13:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792330212; cv=none; b=CnElkNzP4oC2D16IVWdqVTl8b8HMb611ZOWqKCEKp9n/7wm7RL7mNAlNdjl03/3pvkmCRHiOBVYu5SVbBQ7sQ3WO/pnQ3RrL2WKmI3EJ4w6xX+flGaD7YzLk0qHBKwW3zlRvKVcT96h3YZL8p6kATP1IFD8a1TOLHGUT0/7Fecc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792330212; c=relaxed/simple;
	bh=shgfU6MmEoPqis1WxgudZrbJZWVDYVbSIa1D/j6ofaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSqTpBm/u9t0fYIxCYwXTaYtbhxFzq20l3g68DxfTp5vIFhynKdq+zbxOXKKyyCpC/cCWT3HYz18Czo8SgDdCfdZ02Ewi5dMDKPUlWAUEwTIJfZyXlI3N4894Z7YXyjiKbHltMniWKZsOwuaqWcKQVJMqwOtMmEwv99UMTXGAi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2igrpQpl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2igrpQpl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2711F000C6;
	Sun, 18 Oct 2026 13:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792330210;
	bh=VIifoa5BdaGMkUNTltL+SjzS5pl/kR7k+gC9PKwypDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=2igrpQplTcguIGL2CrhLtBgwptDM+Zz7kg25SHx1rMgpXqpzQ617LdCUTcyMC6xbP
	 X3lSL2Iv9KW7OUbkUgz1UQptuGFDtK3uVnZAkxH9QNEtb6XBWeN8bSx4q5E/6bj0ei
	 GB/EQZv/Nhizu2vRzsYNu3HaJ3AvdoVrwuZItc5k=
Date: Sun, 18 Oct 2026 15:30:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Comfort Oyewole <coyewole7@gmail.com>
Cc: abbotti@mev.co.uk, hsweeten@visionengravers.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: comedi: comedi_fops: fix alignment to match
 open parenthesis
Message-ID: <2026101838-factoid-filling-ce0d@gregkh>
References: <atTIKehBxn93Lcix@ubuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atTIKehBxn93Lcix@ubuntu>

On Sun, Oct 18, 2026 at 02:22:49PM +0100, Comfort Oyewole wrote:
> Fix the alignment issue in order to adhere to kernel coding style
> 
> Signed-off-by: Comfort Oyewole <coyewole7@gmail.com>
> ---
>  drivers/comedi/comedi_fops.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

This is not a staging driver, why is staging in the subject line and the
cc list?

thanks,

greg k-h
