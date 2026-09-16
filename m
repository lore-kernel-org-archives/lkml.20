Received: from mail-qv2-f40.google.com (mail-qv2-f40.google.com [74.125.230.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00B952B1E1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575685; cv=none; b=UkyICZNITQ/+fTEPKRaVde7GCzQ80Dq2XMqrxYsBF0PWT0M8mzI+FT5EXJQbXLWXXnRryANQX7f5L9U0p/7L9IrHC3+hCfDjOE5UhknTIbmA6MYJCbPTsbLzSg170NusjLkcTTmWl8glKxGBnNuCuyK774RtsKaQaUJ+4dxUOgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575685; c=relaxed/simple;
	bh=8aZkNP08PVvZg7BWbE33AZXpZ6tdXswnwBF9qWrlNhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddN1xRQjhH35pMJRBQPzAjGPj7iCFt8FrYV3kw8hBm2D60MMqP8WbDFbGw7c2mIgGFGCJxvtMD5zkx/eQBEqo3EKQfzERvDrkL+Js9/RMkREaYr5P37OfVNRvbTxLEDEiYHn5HDlxeQ6vsgNHRHIFNV0p+rJu5HUgy6HEVPuTC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=jOVowhAj; arc=none smtp.client-ip=74.125.230.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="jOVowhAj"
Received: by mail-qv2-f40.google.com with SMTP id 6a1803df08f44-90cdfe57a3bso8830966d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789575682; x=1790180482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/muLCENQ3ztU+dyE1LuzDRQMa5pSiiT+WmL99wCRWBs=;
        b=jOVowhAjMSUqLSMGs3Ddi94lMt4+OrizP4ZcNnmXKfuDh7uHyPMgfYwAQHtFfka6mr
         zaOrljo4n818ISYogU4qf/8wUvUjQEVI6JQeDol275PqeS4id6Ii5vE1ZTY9CeFDFcwP
         bLT39it4x2o6XfyOh96LknrvO97XRCsIBZZOY7caW1U14/1if56SKNpxWMNVv41Xup0q
         y7NUYOvKxtgWf/eXf2j7A2j3ZuMFjl6bgKoAUZvbDodNl5oJmibA40hng/cYJX054nEn
         RAde+Drj4rKkAf5FKGjFQpHUwceS0F2BJOSI4WH4a7fGr6fGc2l0NVlNvqt67OYsIniX
         2Iug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575682; x=1790180482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/muLCENQ3ztU+dyE1LuzDRQMa5pSiiT+WmL99wCRWBs=;
        b=y7OAcPaD0G+29uWPItG+qGTLM8OzRjalfyZRTCggXmX06NenchCF2bt74mxnxnEZBv
         ds31lo+J6p9okNkpT/YVpouWIfEj4l/Jz2AiupEKUaJTMApThf4TpGfO8Tt8R7N+PYk7
         CpNv+YDb5o+uw4iwzawUhEgZngHkEGtl9oWtAJV7X5TvBnQsuDhRxznPRDQZDp9U8Q11
         lsQF0MtltUmqSQ3JKWM72rBmt2BZi+XRztrvcUS6GL1A41ysG6SQ3ohbRworLk20WmRa
         wbq1EOKhTZ/0hiYvx0BmG6bKL9TKVijBXmE+UkIOVq0w+13ssP9Qob8NJWtmUzKpD6/+
         J1Ag==
X-Forwarded-Encrypted: i=1; AKwUvBwvRsWS9TenBtYHfpZeAq2ADIyyMBI9Y14++sFUCnjiZlGvCTA4QvRyo3sHltMv1g37JXj1U5suhcI1cyY=@vger.kernel.org
X-Gm-Message-State: AFuF++nfI21s7paKrwRGUJ3pj6LE8CXrzLAIMjrSxL7kYRqRMlIxja+0
	FSoRe7YJLRbBOfVDHE/3qWqJHwdHZX46k5ofATpbutpE00HSsNvDSRvWzlztEWRSnZg=
X-Gm-Gg: AYBFou02U8Lsh4V/YMBnYudkeAvev7fGmhY5Ct4uu/wsbiTiJxFbagiCkabbRXKxP/7
	D4sX0DNxMu4Ui53/+Q9+0atKOvCcrSzJPU2IkI6ri2Y61TeWhHTma2EPmyybIeI54iwH9FvVjTU
	WcKP/gDLq6cXXwNqM1J7Y9LmPnB1i9mZmExcZKNMNFuNht8BHjf8TT7rJ6kF3wfhabFJwJNM8FT
	Zf5wK1fLAx17ohQdQhC3f3VJFLBlbXmVuoum0ica0JbAn9A/BPy1rdp7z7f2srxP6mrWGsMsEqs
	so9lv2pjC/b//okZ9DUK7b7JbfxbXHBRGHvJ1FlqRDkZsQoMw5rn1W78Z6ae2cFMk1LS3aCFAqa
	yFTO3IWtkJs0FTtsjO3GHiwAu++MUGUOdRcqPSGC3F9GoWCE1Qhjfuf6wqBHA7uUuFPs0KCdu3h
	JRhTRfpHqMJX1c2o3FZmLPAQ8N8rK+s8KB52oY5IvxhcnYGuDQajAFbBWJ4a1O9XHga8kpqUlh1
	3ZJrCKO6QK0BDPrS+h2w0Lc1iDMbr4hNMoFH0WD5DP2vPWhBC/vmhA9d5sKPnsS0js=
X-Received: by 2002:a05:6214:20a4:b0:90e:98c9:548 with SMTP id 6a1803df08f44-9123d722130mr58507346d6.1.1789575682451;
        Wed, 16 Sep 2026 09:21:22 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123bddd42fsm28905456d6.7.2026.09.16.09.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:21:21 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x6sNt-00000009d5Z-0kli;
	Wed, 16 Sep 2026 13:21:21 -0300
Date: Wed, 16 Sep 2026 13:21:21 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Honggang LI <honggangli@163.com>
Cc: Leon Romanovsky <leon@kernel.org>, zyjzyj2000@gmail.com,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RDMA/rxe: Fix out-of-range unsigned-to-signed conversion
 for RDMA message in 2GiB size
Message-ID: <20260916162121.GF3196566@ziepe.ca>
References: <20260915064532.194540-1-honggangli@163.com>
 <20260915114914.GL13683@unreal>
 <aqoLuVxDIOHMuePi@fedora>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqoLuVxDIOHMuePi@fedora>

On Wed, Sep 16, 2026 at 11:23:37AM +0800, Honggang LI wrote:
> On Tue, Sep 15, 2026 at 02:49:14PM +0300, Leon Romanovsky wrote:
> > > After fixed it, the active side of RDMA READ failed with error code
> > > "IB_WC_LOC_PROT_ERR". When RDMA_READ_RESPONSE_FIRST packet recived by
> > > the active side, `do_read` call `copy_data`. dma->resid is u32 0x80000000.
> > > 
> > >    int resid	= dma->resid;
> > > 
> > > This conversion set resid to -2147483648. `copy_data` abort as length
> > > greater than resid. Change resid to int64_t fixes this issue.
> > 
> > Why not size_t?
> 
> First, size_t is u64. dma->resid is u32. If use unsigned type, u32 is enough.
> 
> Second, I'm not sure it is right to use unsigned type. In `copy_data`,
> the loop terminate on negative value of `length`.

Please do not use signed values to store must-be-unsized quantities in
rdma land..

> > > -	payload = min_t(int, res->read.resid, mtu);
> > > +	payload = min_t(u32, res->read.resid, mtu);
> > 
> > Why don't we use the proper types from the start to avoid the need for
> > u32 casts?
> 
> Again, minimal the changes with u32 casts. We need something like this
> to use u32.

This seems better to me

Jason
