Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8075D3590C3
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440320; cv=none; b=hKsp4E3UW4gZy5UQJNhKtY7ziL2/vJ7j6D9UnZS9NoiYDYTQCuVcm7lH4QYLiCDbtlx04LIUFLJA1kl5AzpnQ26hgjxG58hTjhuryfs+hb+fL9nKVdSV/H3bYqsjF8jdEVUlHL7QMUsLh92KwP4P8Hb79HG88NOPksqcpytlEFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440320; c=relaxed/simple;
	bh=WFfQV2nx8dXE7bNI3OJYcwiwD+Zg9ALgEFg6qbUBlH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdctjWzmcBfcQborFi9XBLVgyFrtNKvwBuK2CRs/2IwfUJfDtQe/Q0zwa+WCZ6wdqBMtaxcDPM8pqQqfmWt4E2yhq41B+FXPrqMr10fv7/eSyjIZkpkpKzvnXE/V+zf1U5Js2P41kXnT69mYfewQ88TbRBVG3xulkOj8CIAI+3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnxrPQfC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnxrPQfC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so22508435e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791440318; x=1792045118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j0aYWP1M8Odxq1oNSexxsa21jO6jl297TmiFo20Nq/g=;
        b=AnxrPQfC2+y7QX7rScjPXkMG8K2lboV57Z0ntgYWxT3/fVx07Xj1ve/fPKEXYdFNrw
         ZT6SoCqW9XwVQ+PMxtJr3GDhOH5sCluFG3uuisNJrzVhwFjt4V9a5RG+f/uVcnQSZkp1
         EO+5g0nyHrBS+4S0vvWQAfaQbDWuFZQeFApjVhlgqDactEchzJtYR2n4BBYHB+s5lEMD
         CyVJzSKwuA3fa2kJS/bebEbK/7bN+cBz8ixorO/HOt8xKW+2EPZPkYYjCUYrcjsalUtq
         8w0BHZpl2Zo10mC6lxkmS7o1mdf5pVm/+yGwdUP/jWBo5JmrH5zfO92nb+PGjOts7M+S
         asTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440318; x=1792045118;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j0aYWP1M8Odxq1oNSexxsa21jO6jl297TmiFo20Nq/g=;
        b=p3EtgtBZOHyqWJjkfRCeYBfaTtm9kR2ZhFINi40pR8a3OP2NHgQAk1ms/pT5pnQ6M/
         tnYZRhLRSPAbTydPcqhwBk7Pkhy/43oKqBcYHDo5sY/pPSvQYTzj0RQTA298ffHGUCYZ
         uzuEGmPi3vDZuR0UyAThye7dq2XIFCdYQ4GWf7IOL1Fh6+rlWF+jmkq48BsrybKv/KBP
         KV0/MemLFQVZk6Xbg31+NbyvFP6FnnWPasg/pvV+sjNPd2RQvK+fCXm60sks/27dWofV
         gTnzfqufZNxba5RVwUPr0aczmfNuGPJhGeueU8BVX4/c4e2tG2hTURwvScsBlec6N/RK
         cytg==
X-Forwarded-Encrypted: i=1; AKwUvBxZ7iEVdjsEQF/Y7Nqr/lQQn52BbGA8MA1OF2dnuLetFqCNXyPupyyuLNNLEAw1mXDY1cSw3eannqoL99E=@vger.kernel.org
X-Gm-Message-State: AFuF++l5NnFdgY2KRd66pw5HwexaCnIxnf00dC2ibAItWetZxOD2SMbq
	RMx8naqbrCkk24AKxGsu287QqwYjSOsz9vZPd7hGw6Ul2Xj7wxkhVbf1
X-Gm-Gg: AYBFou0ehTcyDogzKn7flK8IYKTP4bLsJRwNDv2WJsRqrNZXILcHPESBgdnCDDlRUd+
	pXkYFm/XFwhNvSbcsA2N3s8/i8HWr/emcWNIyKsq71wL6n93Mg0K/6l3mIcplZrBZ7m0jaBlFvA
	oi9L9oLOIdYf+63aB9qOknhRIE7cRcGtouJVeQuh5QhzCTMhzJ07dAo40a4Iyl+HrGgHoXDeAcm
	/QxUlddOObkYbx42kjSzNMhE9KGa1KVt0qnwDws/AL3rXLBBcLofU1wR3DWnVnhUu9vgs6nUJ52
	iLERGqff6KDEiPyq29G8qJMKLCn/2ofQ7iYC0Vj3NsMFlnUZ60bepWtBgaSx4xdRZEVIzfk8AhY
	d2hZB6O/zLmpi0EeP3SQrydNFTykp1HW0SQEOatXpJkgiMfkD5BJ6BD+2N8uuJGtEfo6UffyU93
	0Tgym5RjBy5q3f/N1J6lb60dh9slwH3AgZjeSuhO6mBm83gHH79n0ldDivVb8nugfgvPjUSrETr
	k5QRDWQAO/i6Q2H5i6lo+dM6HV7wEaPsB4PRPzC242vOzHUeam8r2MN+oVEIOQdAAhbrZ7RUnmA
	NippjqdE208FR7iygLOVhuNfYsW8L0Bx2OTF/IldTouMB1JHjNPaaO4xdSmA8sryN5FPgtmssqf
	PwKkf+72Ce/5DCNg=
X-Received: by 2002:a05:600c:6095:b0:4a0:2835:6fd3 with SMTP id 5b1f17b1804b1-4a18041c519mr79148635e9.17.1791440317478;
        Wed, 07 Oct 2026 23:18:37 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843dbc6bsm50087615e9.11.2026.10.07.23.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:18:37 -0700 (PDT)
Date: Thu, 8 Oct 2026 08:18:36 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-usb@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: r8a66597-hcd: fix buffer overflow on odd-length
 FIFO reads
Message-ID: <asczg8KoUgHPxh5n@gmail.com>
References: <20261005212823.55737-1-kmehltretter@gmail.com>
 <2b0a2d9afa8e2dbd1d6e8ea8f88a4627816ae2d6.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b0a2d9afa8e2dbd1d6e8ea8f88a4627816ae2d6.camel@physik.fu-berlin.de>

On Wed, Oct 07, 2026 at 11:12:46AM +0100, John Paul Adrian Glaubitz wrote:
> > Fixes: 5d3043586db4 ("USB: r8a66597-hcd: host controller driver for R8A66597")
> > Cc: stable@vger.kernel.org
> > Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> > Closes: https://lore.kernel.org/linux-sh/3bd32eaf159db61ed1d423e1d52a869b3689c682.camel@physik.fu-berlin.de/
> > Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> > Assisted-by: LLM
> 
> I was wondering: Would it maybe be better if you disclosed what LLM you used?
> I have seen that many others have done so and I'm not sure if it's actually
> prepared to have the model disclosed.
> 

The generic Assisted-by: LLM format is fairly new. Christian Brauner
proposed simplifying the attribution in July [1], and it is now the
documented format [2]. I expect we may see more patches using it as
people adopt the change.

I prefer the generic Assisted-by: LLM tag. It acknowledges the
assistance without advertising a particular vendor. 

A model name alone also leaves out the harness and settings, and I
sometimes use different models for implementation and review. Tracking
and listing all of that would make the attribution rather cumbersome.

[1] https://lore.kernel.org/r/20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org/
[2] https://docs.kernel.org/process/coding-assistants.html#attribution

Thanks,
Karl
