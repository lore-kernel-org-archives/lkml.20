Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792694385;
	b=aTjbZHcg6JYRnyPGkDKOVt0XMBMS0ws/JVt/hCc88B/lwr7Pbam/5cRRhfeGpiNvnE64
	 Wbrmcd/u8etxZj/a0CbZULeUPqyJcKo4BQX9/yvp0ROyxqjZdmsC069DMb5+E8PcB62Iu
	 mFXqi4jfmKUeet/jXAjzn48o8jukoVfc4irbDSh9WCEEG45duAAXpXF/V4P+puLB/RYe3
	 rAq9Rk40fTjI8hENiiJBgxsUH/RES80sWahir9qq8NFFz//5hqkAGzAl4OCDCNoOQhFAA
	 7gbr+KcaMT4KnWyTVG9e7/3AsG5ICXbMhMNSI9NibmrlZUWpn226WU8PlpNvni37zRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6OyEIFFGQJwoM3H+g7NU0Vj1plI2Oe4JZLflWIJCYwE=;
	b=b7oY2uwK1XGF6oLhKAL4Ncm5dQRqUSAXxI0IYIzbfm4omozXK8nG27HOsEUef9Z0BH3Q
	 cpjDDZTL+vfEnMtUpTF21nJ4mn1tvBFQFLoguYtDAQILH5k3J5pDr2/Xi0PMxca+DviPm
	 mPGwZL/yu+2nhRxBVIDkHBHpu850ApoFFBS6wPp2M3E5Wmmh37GGRz7ouYPxgwo2M2TAs
	 hfdzQImnj2JkORNY4E59a1TLjs28vXeSmCWLkVlOe+uhjQD1zLAtn3T3q6/J+1QBr2Cxh
	 ZY7JMfGiIELHmPXrv8JPZ6O/Rb5Qvpej0/yQrsrRQEUFKiUgEH1CXDiaiKUR6tMC5lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=KHuMy0sZ;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67298606A320
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67298606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=KHuMy0sZ
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93f3c8958d5so7274085a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792694383; x=1793299183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6OyEIFFGQJwoM3H+g7NU0Vj1plI2Oe4JZLflWIJCYwE=;
        b=KHuMy0sZD7ZOI2sSxUEZc78TXFyK8CaY79wWRvg5gbf1f2MF53i7eKzHp54VCzTIp5
         xWKZP1zwsNiEWUau24i8KBu2EhZnrlozJiXL7jschM5mD9V6HP6UzOwpwUigeemLbuqG
         2uX5eesUhTVTe3yiJMtEUH2rAwxHhZQPM2Q65xGSSUhjSBNHoWcUiwXd3gQ4qt1G+nml
         zvDmKIjngDDacFbxpApugajGRtJn1poOEZl/c6h3/yA9ZyjYaLLxk7Kl8ePmLtWp7h+K
         PSV/i1A+yg2UH9c0P1A+em+71uwWcsUkBNx+QuE4xflfqek14/yZRT4/z7srKnMPim9G
         MzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792694383; x=1793299183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6OyEIFFGQJwoM3H+g7NU0Vj1plI2Oe4JZLflWIJCYwE=;
        b=gnZc8bjtRBB0aVGcgT3d1reMEN98dDg8DBFpUzHne/tk1iffqIgyEg6GRIMNrqmh1w
         VvO3tZL4Bgr0VqJvgEdOcZ5JY8mMFbypP40ScTLmdkuK5kU3rtxWVcEx5JsPPichIgOP
         g2+pSj/OqdckoY4tyx7Ds5yBiVbTPOerfjVQ2wQxiaiO2/YixwSHS21u0JfHuuB03kq+
         WvobyEmw7QKAJpbRYaWgNyLFbanzkp6NcXiVGrQMkZARbI9Mr5m9AUIgn5l20hhVL/4o
         Q2BKMWifAm40Uh7cmXjsyQV7Y04nA9AdKTPeo05+6pnC7EMkgzFnm1GrGBIt0ZFz0HxC
         IGHg==
X-Forwarded-Encrypted: i=1; AKwUvBwjZxqj0W7BpwRZ814BV7BnYbK8mmqjvz1Tb4G2OsotAQqYA/e1cGw905N0AQVzEuPQUgr3YpAFiolwdSM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOz2eIXhwskjUBmji0IXPgUy2bNtZUAr4TZuCRk584ZOdtxSB2
	H5+nkEgXnwX0JMU0AFz+esMSsnLGaiAp0xXvkULWFzvsG7KZdgAjAoSxk9nslps9Rt8=
X-Gm-Gg: AYBFou0jCZyh/J/lWx8o6iVOEGVL1AiucXSTZXt099Qsz1BZlWyU+VTPkMQnKeEshO3
	WHvbfmFGyML5awOQ8Lz/KdHNSeqG1iFm5vT7Jl4UG4Dqcw15Ji9PukUptD7dHFkb9NXs5jW5IEU
	ve2+SOx3T0GFfs86gUm4mpBf3wNvXCBI85PcppCju0FdrJYvpqkDYUlZsuK9769MBQsWW4GQQc3
	UH1+NjwGuqOyw2QaP5WGYHUhIAHv4z75hMBLjYWUSEB3sVcVBMEJvEavEmEcD6Bo3gAAnKf2Tvj
	M3AwTuGDqG0zO7wUfbGv87zFN204gIh3WT9NGz9XolIvcmIZDrBNJ8rUrtVyRF+BpF5I4zDnZl4
	UszJrhVCaYAmwvsT/rsjsseRva73yYu2hWaqSRuh63dA6DAW+5mouhaZyK8qkwe8dZE4hw4+2AS
	nsfMqqaa0Io+8GK5ew5hV/RBrxSjn32j2zRGk4Qnh6FjWBDSjJpxsCooFiYunf7nzlyLujUdA9e
	ovlc/3RP7zQyHlSBsWmL3MvIVeY4311VWsqc//CjDPdUUQiSfW1FC6q4d+aBVBodKduYnaMBp6m
	ZTLBjzpb6OoaG4ytf8tnPW0H8Mued4OybjBS5A==
X-Received: by 2002:a05:620a:40c3:b0:937:d6e8:59b0 with SMTP id af79cd13be357-93f6f79bca2mr59757485a.10.1792694383306;
        Thu, 22 Oct 2026 11:39:43 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f6fb82a5fsm19367685a.8.2026.10.22.11.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:39:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJxhW-0000000FjFr-0C75;
	Thu, 22 Oct 2026 15:39:42 -0300
Date: Thu, 22 Oct 2026 15:39:42 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org,
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com,
	drdeeglaze@gmail.com, James.Bottomley@hansenpartnership.com,
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com,
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 05/20] ctlv: Prepare message input handling
Message-ID: <20261022183942.GC3381610@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-6-jiri@resnulli.us>
 <20261021014324.58376589@jic23-hlaptop>
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
In-Reply-To: <20261021014324.58376589@jic23-hlaptop>

On Wed, Oct 21, 2026 at 01:43:24AM +0100, Jonathan Cameron wrote:

> > +bool ctlv_message_input_rebind(struct ctlv_cursor *nest, const struct ctlv_schema_tree *tree,
> > +			       u32 node)
> > +{
> > +	const struct ctlv_message_input_scope *bound_scope;
> > +	const struct ctlv_message_input_nest *indexed;
> > +	u32 i;
> > +
> > +	if (WARN_ON_ONCE(!nest->attr || !nest->msg || !nest->msg->index))
> > +		return false;
> > +	if (!ctlv_message_nest_index_ok(nest))
> > +		return false;
> > +	bound_scope = &nest->msg->index->scopes[nest->index_nest_scope];
> > +	indexed = &nest->msg->index->nests[bound_scope->nest];
> > +	for (i = 0; i < indexed->scopes_count; i++) {
> 
> 	for (u32 i = 0; ...

Is that allowed now?

Jason
