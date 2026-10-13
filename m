Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35833C4563;
	Tue, 13 Oct 2026 13:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898705; cv=none; b=e8hzsCILAM1993ekTeHgHh8hvwGZpxIzwt/ZkoyahiKQ/eRmA+/AUkIgu/w1zkaYamJnp4Guk0kpmjceyEf+EfPgDnH12dZ3pZXUEQe5yFnWP5izHmvZYMmkQOVtXO2lFaHxw9bd4b4r3j0kdaKfMHiTU40RFFvQ6VA9PiPFkxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898705; c=relaxed/simple;
	bh=tUiXAHtz6kxnoBp+T9q5BVQ2EWmnzpAUt14xDbdhVto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6OAp5iaVhEwrNP4G1xkwo9SWVwl9ezQZRwsa122FsiUv65mGGhxkUWQwiIwb2cfBW7vDtvBSAZfeD9Ezkpw7fR1agpVVUyIFSZhz7a+uFCy5ED85TJ/cQopdJgLtsptUn5KWG+TmaWhMxFgW989ma8Y9Kvq/N/SJSLHjBmUx4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NsGbOTwD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NsGbOTwD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0681C1F000FF;
	Tue, 13 Oct 2026 13:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791898704;
	bh=rTKhDbGoNT1qV4eEbKkdObqZL4lLBYRPYzHeyeAJi98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NsGbOTwDOshHXHAeiSmeaMz1mrgzNgpC463vv4XNPZ3YomHyYellrQ5EqVUja8uju
	 TJD7en/EsOaamewDDq4ny5rf2ytkZoCuuI40ZSXD4TtN2JSiFu7kzIDANAgXzTMSZA
	 +nRoiJyJXttUsI9nRoo4R2OyMUBKZUWOexI0gWPI=
Date: Tue, 13 Oct 2026 15:38:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: wangyibo <szwyb123@gmail.com>
Cc: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mustafa Karamanli <mbarancemkaramanli@gmail.com>
Subject: Re: [PATCH] staging: most: fix typo in driver_usage.txt
Message-ID: <2026101317-cherisher-crushed-e142@gregkh>
References: <20261013030824.329969-1-szwyb123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013030824.329969-1-szwyb123@gmail.com>

On Tue, Oct 13, 2026 at 11:08:24AM +0800, wangyibo wrote:
> Fix a spelling mistake in the ALSA component description of the
> application layer section: 'can by used' should be 'can be used'.
> 
> The same typo was fixed for the networking and V4L2 sections by
> commit b114ef1efc49 ("staging: most: fix typos in driver_usage.txt"),
> but this third occurrence was missed.
> 
> Signed-off-by: wangyibo <szwyb123@gmail.com>
> ---
>  drivers/staging/most/Documentation/driver_usage.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/most/Documentation/driver_usage.txt b/drivers/staging/most/Documentation/driver_usage.txt
> index f1b6977f4543..32a2e5ecb48b 100644
> --- a/drivers/staging/most/Documentation/driver_usage.txt
> +++ b/drivers/staging/most/Documentation/driver_usage.txt
> @@ -109,7 +109,7 @@ following components are available
>  	   driver via the V4L subsystem.
>  
>  	4) Advanced Linux Sound Architecture (ALSA)
> -	   Standard sound applications (e.g. aplay, arecord, audacity) can by
> +	   Standard sound applications (e.g. aplay, arecord, audacity) can be
>  	   used to access the driver via the ALSA subsystem.
>  
>  
> -- 
> 2.25.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
