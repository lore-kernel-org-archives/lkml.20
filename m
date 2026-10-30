Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362128;
	b=0NoON3VoSV1B0JZjrronSiiS9YewmJ9bIqJmckMfOySFuD65FsQlm0XFIOHejJ3A50u1
	 IT8g4k8IL4hNKk36GLGujx2es0V5iICS6M/5tk2XNlp+OzVD+UTMZLPaxCj1X6ktmo0pR
	 08ZiD7OmZJjB+Xc+LVD/bow+1iTMVXBkoIGYtMH851ivmyG245/0uox1Uc9j6Enim5sDw
	 AuMmVYXAGrYBhl1423DKezOopmXfJHu8LI4AJNbrBeYEx0MH2GznY+aoXp/SWeOgCBmrd
	 goort2eG2GAaVorqKuJzBjcHuYrTr1GphDbqr2NDK1nE01BlTqcHy2nz6huA8AFH0VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RRyBEpiuIAokrfRrdR0N3udD7wd3mhkcqcx+n5TQKaw=;
	b=glvI+fGwVFqgfNv3sitJOavZ74HwikFIUv8ez2juqTRH/e7ql2gMMZpAKxpwEsfkP4K9
	 +cZbUh9NLaXSnDkGEQOXaEy7hw56+VE8O1hRuWN+m/Os3ZoaNd6IwqwyitBC1JsBLhVFv
	 e1opnDHijGJbVuLeMI/0bzWjgy+gnw05F0Yvd5gXOpum9Q80KHJs5fIyp67xTXQ+R5bmN
	 CAh682q5ls9B8aRjkfG312uTArCWlxG0yo6wpmY6W5QCeEExH0u5h8YVEM0le0KmGwpZT
	 d8MM6Q0r2kPELcB5+HO6ruH+U+t5EZTwVWqbX0Cm47vzHngjRkYy+hKDMOL76FW5uXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Sjahry4j;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F028606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F028606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Sjahry4j
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93e7ad9f78dso76742085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793362127; x=1793966927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RRyBEpiuIAokrfRrdR0N3udD7wd3mhkcqcx+n5TQKaw=;
        b=Sjahry4j5hNvYXyyV9qPQjG+UYTw3sJmUpvD6NXBj5Q2pfi8PCZG5jAT3oXfz7CQcX
         VQ4EbgS2hGbywIKqxj4Y+sc9Q9FpNn0nHghi1bq465MeKV2x9LxLhFpFpbU3XngksUBi
         eXjERaxLG+oyyVUQxJXhM5td+DjF9kQaL2ET30LgfcXk8Ib4rhS/5dRyZ5wRE9yCHLi/
         cwawSD5447d0ZeB5ki0C4MHs/TJGxIoQv3YeZCOo6bzobamCtTivpb5XIlUSXmFuGp+b
         SpoVCyaItiwns3IFSeuq4Iw0VA2/Gfevu6cUFxE/dwNmpAeUPl6t/TCBKLFigrJMWFe2
         Q7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793362127; x=1793966927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RRyBEpiuIAokrfRrdR0N3udD7wd3mhkcqcx+n5TQKaw=;
        b=1Gv7tcFaroOZIlKRUPQOuihrsICFnX+X91Lq9Fg+T+ujiGLexi+lV/gwpL5/VZkVva
         ApY8FhCd8iOCG35tEwfXRjKiU+u+dAzzxousRhFCZDatsGRKvDPzMmrGTCDUb99EyC9f
         /8cG39ZsbuTXfvgMM4T6pyDCKTxIMkopwse5rfL011mvX/zFXGHwO4efuEbCcAUwBich
         tUQwNCTcGSTVERn5TIEd7/mpa09HyHy17LEHHRxDsA+K9ginRUWnbhP74soXVVLrNkIr
         9dEdGzmz5o4w0ywC9mXgpmLN9PSjAQLIOljA5d1jpZKtNqeLFsyv6RIMvGwNjqh+wovV
         VlTg==
X-Forwarded-Encrypted: i=1; AKwUvBx75uFUXUmM0TVHVrpWb+IF4dtyX7vSBD/uJdYd8c+rUt2iFjhqel6auZ/T2bBZvalcnwULClLmUt/HYiw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLr7wQbeliA3ABvxJZxPAQDhZT38/gSb91T76MdgyhlfGYGwFfO
	ER+O9xPGC/UQzhn3cawjgvG4Mk4c0KwFHd0rI28tZl72ZZZ5rOBixWTtfveR3xplWPo=
X-Gm-Gg: AYBFou1VVFt6RaWH6xGq/gun5PWVtRgerbNF5hwF3pL9JjkldjweJWwmqr5dGUxxL/D
	tFmadbGF5ACjlolEgKDYkAe984frirmpm1pN6cWgZWQpJOdWkhuP2AdC3p+VAwaQVFmH182H4l4
	P+uQismj5TV7yy+E9IEh5OEyVCT8XtNJKjmHPI8vdafSD9tqwLPwIfzoREU9Hc9JubtVz03FPjR
	gOgwcYwijpKVOGel0YBDmEasWeOKj9FDpse93Kw+E/tR6dLRw7liAFLmAQFV16lFgvDjHNnu2V2
	VdvDvUJanXaBHGCW5eSM/5TuOjtGnkBHr73ydpX8S59Q7yDQGnJ+v440I1+aN506eiiNV7L9rru
	G8DS6eDFitPRNjYPEJda7LgD8NNqx2vtxIal7Q3ZHgBBGOyuPeOBqz0GKL1cfkOV7wiG6TQFF8G
	cnLQjkaFBu1psXQpmFQRCSLLnVYEr4y+9QKv7ULwF77F+W8tDrXhgy2IuIy6uwkzN1RJg5n/lI4
	qUnLB0PsC82W6eZ7QLowCtE8J6eav7OwrbRLcT9XuUOxEod3nr2sw3swSOP2tdeNGwHqtaVzvg9
	xvJH8h3KsLxPZwe0YTezr8Raxoo9gPZr7WjoEjh7fN4DAj6oZVzYVxsEjb9XbfVxm512V660s73
	c7b52C9XpuUY=
X-Received: by 2002:a05:620a:3703:b0:93f:3120:6c84 with SMTP id af79cd13be357-9442173fc02mr343438285a.36.1793362126885;
        Fri, 30 Oct 2026 05:08:46 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425a6b9b4sm126316885a.26.2026.10.30.05.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:08:45 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xMlPZ-00000000ZCc-062F;
	Fri, 30 Oct 2026 09:08:45 -0300
Date: Fri, 30 Oct 2026 09:08:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kyle Zeng <kylebot@openai.com>
Cc: iommu@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>,
	linux-kernel@vger.kernel.org, outbounddisclosures@openai.com
Subject: Re: [PATCH] iommufd: Reject opens until module initialization
 succeeds
Message-ID: <20261030120845.GA3889730@ziepe.ca>
References: <20261030042345.74537-1-kylebot@openai.com>
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
In-Reply-To: <20261030042345.74537-1-kylebot@openai.com>

On Thu, Oct 29, 2026 at 09:23:45PM -0700, Kyle Zeng wrote:
> iommufd_init() publishes /dev/iommu before registering the optional
> /dev/vfio/vfio compatibility node and running the optional self-test
> initialization. Either later operation can fail. Since file operations
> can acquire a reference to a COMING module, an already-open file can
> survive the failed initialization and refer to freed iommufd module
> memory.

What? This seems like a core bug not iommufd.

files take refcounts on their modules when they open via this:

static const struct file_operations iommufd_fops = {
	.owner = THIS_MODULE,

If the module hasn't even loaded yet I would rather expect the core
code to not allow the module refcount to be taken, and if it somehow
succeeds then it shouldn't allow the module to get yanked out from
under it.

It is hard to guess what crashes to be more specific, but
at least misc_deregister() is safe while files are open.

Though I wonder how module auto loading works..

Jason
