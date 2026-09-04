Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928182BFC7B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 04:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788496309; cv=none; b=VKxRxOR3Ga8CZ6feNtFerdZ7DeO+oS4Lgztnzi3UtI0+y0x0XkDKrWDh+QygmytNVMGFEZWsEg9O9UB5Biacr3EFVJUYYphiM2fKDikOwxtrllmxVn/v7VGp+8/szsIewERcu5vIsIjPxYoKnLWrum/ZRbQmrPanVaEr/dKrhU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788496309; c=relaxed/simple;
	bh=xVLoMCUJaRzCt7em8QD1cqFIdleBs6sxXUyvllp8t+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5Nc/c7FGherPPyZ3Ri4Gn1s1vznP3PNr+LFdEtoxVk2YmapdJQzg8lhDw5H9FLOS5rQbC8AzItniZ2haxb9C5uyMYxSsI+CZ1Ruewi4IMrIrSk2Cd5UwpIU7sAVNBoE7GPPFoXqHbFH+C/0U1KJ9Tk6u2i2fxxO/snQUKfrk+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gmps14sz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gmps14sz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DAE11F00A3D;
	Fri,  4 Sep 2026 04:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788496307;
	bh=hQvF6UEvkh3ZJjuO6Tvsem2gQ206OgUaV+24klQc2YE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gmps14szafLQIoJLpJyATrT1/6ksTypaKRV0Trjbp2F2j3xJpxxSTSFUX+8nn7utI
	 1HR5QaPwIeAAuZZWPThlQ4it2OhzVlM7Eq5WktruZuxRQ4llIrggKPUbWc23Nsj9BK
	 y+XOFdKMd9O86l55Ey9X2WNqXYXXnceUNZLR5wDY=
Date: Fri, 4 Sep 2026 05:58:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Suraj Theekshana <surajtheekshana1111@gmail.com>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org,
	security@kernel.org
Subject: Re: greybus: CAP IMS/auth memcpy not capped to ioctl buffer
Message-ID: <2026090415-equate-oxymoron-1780@gregkh>
References: <CA+_JcNS4PREBDzqmnHSu6h5jqfK=NiX5J+14JY-JDaegoQ2xLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+_JcNS4PREBDzqmnHSu6h5jqfK=NiX5J+14JY-JDaegoQ2xLw@mail.gmail.com>

On Thu, Sep 03, 2026 at 11:35:13PM +0530, Suraj Theekshana wrote:
> Reproduce (no Greybus hardware)
> ===============================
> 
>   git clone --depth 1 https://github.com/torvalds/linux.git
>   # tree used: 8ab1afb
> 
>   gcc -fsanitize=address -g -O0 -fno-builtin -U_FORTIFY_SOURCE \
>     -I gb-poc \
>     -I linux/drivers/staging/greybus \
>     -I linux/include/linux/greybus \
>     gb-poc/poc_cap_headers.c -o poc_cap_headers
> 
>   ./poc_cap_headers
>   ./poc_cap_headers auth

That's not a reproducer if you don't have the hardware, right?

> Files in the attached zip
> =========================

As Willy said, please just provide a patch, like the documentation asked
for, that you have tested with your reproducer.

thanks,

greg k-h
