Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9691347CA8B;
	Wed, 23 Sep 2026 09:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155944; cv=none; b=dAvhm3H7R81WWXYJAV55FE0pGBcmRqO+NHiULyTI/GtGG5hOAU+A3TPfG99oWVdaVeOSaZRcpEJOZKjkSgAxy6bUUoynZtT5iVDsjOca2rwxVYIYborG2cWuQ5CtKqVrSkh3IR3DYiy52Iw+YjQRhr7v6SJIBya/fga3Qo+SLkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155944; c=relaxed/simple;
	bh=UCEFI61Dt5EHh62yNx7VD8hIhFWfv4ZCeIucoT0+WVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDPW88Bcbvb1aDsGW7tna6IvYlqb9g33UKxRCDnVtBxcwGE98LB2iHWlueuxycXSRIzXgaa2l9GAZO6CcA4wZRmHT5acdbpYP3kArbf7f5GhsKPtzeINFSmnMk7hWKANvpmwJWOGbGtgm3z5GYwdhPmrTdSPeygoAlEt9zMwX7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aM/lu1yL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aM/lu1yL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5004C1F000FF;
	Wed, 23 Sep 2026 09:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790155943;
	bh=Ri8sOIJhOX6F2hUNmGGVfvckQB8F4Beb92eTvgEgzq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aM/lu1yL+Q1wHEvbcXHvsdjBbw94m6/aDs3HnJjXjOEPXd0SD960GpU4TGFgEg2H9
	 H7UK2fD61q3ggTY7I0KjJj+lf1gWql2k9k+lVPn5zYpBOO2AN//t9ghu+oIXlPhd4E
	 pyc4H7RXm6KmyTnQ36ynzLWFAYjrlC58FliYMbBg=
Date: Wed, 23 Sep 2026 11:28:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Murali Krishna <muralikrishna2444b@gmail.com>
Cc: srini@kernel.org, ekansh.gupta@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: misc: fastrpc: is a ctx_idr IDR -> XArray conversion wanted?
Message-ID: <2026092338-banking-tactics-2cfb@gregkh>
References: <20260923082254.15312-1-muralikrishna2444b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923082254.15312-1-muralikrishna2444b@gmail.com>

On Wed, Sep 23, 2026 at 01:52:05PM +0530, Murali Krishna wrote:
> Hi Srini, Ekansh,
> 
> I am new to kernel development and would like to start contributing. I
> do not have much experience yet, but I am willing to learn and to put in
> the work properly.
> 
> Documentation/core-api/idr.rst states that the IDR interface is
> deprecated in favour of the XArray, and fastrpc's ctx_idr is still an
> IDR. I have a conversion prepared -- XA_FLAGS_ALLOC1, xa_alloc_cyclic()
> with the cursor kept in struct fastrpc_channel_ctx, xa_load() and
> xa_erase(), and cctx->lock left as it is -- with no intended functional
> change.
> 
> Before posting it, I would rather ask than take up your review time: is
> such a conversion wanted in fastrpc, or is the IDR usage here fine as it
> is? I have seen similar conversions in other subsystems declined as
> unnecessary, so I did not want to assume.

I doubt it's really needed unless you can prove some sort of advantage
for the change?  Is it faster on a measurable path, or less memory or
something else that would justify the churn?

idr is still a fine structure/api for many things, they don't all have
to go away, otherwise we would have done so long ago.

thanks,

greg k-h
