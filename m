Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792765601;
	b=QWft+R/gSPytJ6Mz2N085KYAjNPAjGzGBRJesgB6pi+yzY7FQMyBSOPuCySVESW34/YB
	 mxYKX5vblJNvZivmrgMgTwry1fBYZOMfmBhy45p4jtjRHc05CQm2KeHRg6SaImt1iv01c
	 gAB2OvaXiA2LDcS+8jD5tRKgBCvekwAzBWwD6hPOHWHjBlB20+V55bDf7PlaDOfUiVPu7
	 jB+cicFQNiHGRkE4RdwAZtVLTItTxzV/HcDJZqDpQc0wepdETBi+I2P94cu5kVev98yeT
	 vIAN26JzTHy1y19YkGMS4cYBEHrLvxiQ37ghqAounFpYPsGvXRJfjD9XuVp1T2yOuJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0RgIg1l+3ifUtXqxbecqEIvcyWwa/dmFWxjX5pMBv2k=;
	b=PFYwhlIBkpaQV0O0LpSWum6OWdTCyJ+yHlxhSlSou0KmKhi6xE4nj9Tx8JWV7D2b/wAd
	 jxdYJIwD2y4itdNJMo7/ZmJeDrGhVvqdGi4xLq2dqHnx4XMS0aPJNIL/Xrt5cGjT0uysz
	 NqIg8kPofAfNWTPwajvSyqdWErWA9WiV1BC6CXTa8YeWX5J2/iTru7MneHbbnACCAWHIA
	 Yzz0Q3wvImlK3IiiX8BXuTlyrWnGj35v5G/pWK9Yxl/VUoBzZRZB4PlzPGPkaiW2Fzu1D
	 0DCxq6tvLarCkNAGxB2CGrmeAhW1U/OnGbUqNEwHhl3IyYStPaMf4fPeM/wDO9DVZOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=DuYf6d6E;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EC2606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34EC2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=DuYf6d6E
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-535f9de49fcso5429341cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792765595; x=1793370395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0RgIg1l+3ifUtXqxbecqEIvcyWwa/dmFWxjX5pMBv2k=;
        b=DuYf6d6Eamd3Mim9JzP6lyLqHMZQ7cyKJdqyD3vzB6Sr2u0uVSkWpIdZeTI1JCnN61
         NIFACP66viSHxdE7SDl5Z0vkYsbly/8y1CfaZRItrer83OcRPXUOgkf7EFlW4VGlKxdh
         Ibu8s0eq8atFnKpxTif1E8wcf/K+m39TnPCWSxdLLek+ly/BYkiswbugga0oEPTHxpsq
         0aLlYBRgbYl8s/ZSMNb9ZITEEZ494ZrhiPsfXxG6KKufF1DcVU0B+j0htKw9QXGscyHG
         1HHHpGtDXP5Ie9+0fnY1zPNtuSAYT2zAG1Js2cHKYqmmzY+Pz52DZZlyK/Tuivj1tXdV
         b3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765595; x=1793370395;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RgIg1l+3ifUtXqxbecqEIvcyWwa/dmFWxjX5pMBv2k=;
        b=hTEmUGi+dVAvs+Od6AzjbhO7/7bPNp3q7d0TZX/Wv0GDjQvZSP1rEFHqfIDRYmZgfE
         Re1hEHGVomEJ3DScBXhDfOzUT9bCIVlxGLd3QB7JQI5EgXh2DmGhizI5BnSuo9KK3bMy
         HW7A7jfe7rltwGmKu1a7iOuoXyvNc1m4I++AGUn9S0drESyYr7lopSeAyIVmm/vLTCjL
         Lt2X0AhUQ4kiqM5gmkXfiXKnwuMt5VYv/bxNoffrj0y66eYgxkBtGrPMEWrNxGewHQjV
         Z5zH+bXo5W2XDYgVHcN6BWxjPdBHJPBNDhQMnjPApaH+F/Q2hWrUSg3MyjuCuP7MctRI
         KUsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpvb+0ClIfRptgLikTZQOOREfIng5O8wiEs+AHifkAhHZR/fn4vkCkLSdvOoEI2G/Ces9kIgnnyWbCn4w=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8ZARZB2/Df/lhlr4FxIH0LzKIkloYJxql4b3Jzqwuw6x+b4no
	HeZfGL1aCTjHXKLnvMAXpA7rW48Cyn2+SBev0lSZfCtz5lWnsO4rQ+mP20UO5uBDyHE=
X-Gm-Gg: AYBFou32dCH+SFWymijf8mnN09XwG4JqmXfQXZ5t+GKzDm6EIQLYI+v6haWMltEW69W
	T5uiDGo+OSJVny5iX52/cRl644eJFH69xiP4u0a9oouoPpfMSdiTqN5NbiyCyMYxts6Srxd/hLE
	hzaPz1/kDBZAbHT2zkfOb5B0jaAH6l2vOXvhF0w52DbQq53tjV8EgFqaaUZxkL+hKvZEVoBtp8F
	LfhnCvbSm8O13r/yM3vhsS6kQbr0SPImmgYwXSVDBlqinfUIzmtbwZZzcBz1HDVJC/h3lGlM8eb
	KR5SNlhfPg87jFWpGltwtfX/Sm9dc6jE9WinBlJWmeDTDNeHK1+9x1HtFZaUUg2sjSthOdMYSH0
	X+y8dXT8imAx9Wadt3ZMBgvDJdatJ44JCznnHHsbOdwSCwcNopILeJRj/RbfmasvZMVB+lyPgtm
	gelQj8L1/Lm4GTTAoLiLlsvfaBN74PDl20Q77iGOlX9WfWTlO3X9EoLukAVPv4pzRO80P2YWdUv
	vRvvZ3SWtcg2jJCRlAAB/xjQeY9mCFoI9pQBhT9b312n3aLbqccvSvukM5uZhWUmLJWt+hKWkIB
	mmB36wQzxWRlTYAVWYPi0kDe7c7nPJTE6nVepQ==
X-Received: by 2002:a05:622a:5b93:b0:535:a5fa:ee02 with SMTP id d75a77b69052e-536c2700643mr30249831cf.66.1792765594917;
        Fri, 23 Oct 2026 07:26:34 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536c18afef6sm17177241cf.27.2026.10.23.07.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:26:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKGE5-0000000GjLW-1mzI;
	Fri, 23 Oct 2026 11:26:33 -0300
Date: Fri, 23 Oct 2026 11:26:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-coco@lists.linux.dev,
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
Subject: Re: [PATCH RFC 12/20] ctlv: Add device and operation dispatch
Message-ID: <20261023142633.GF3977851@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-13-jiri@resnulli.us>
 <20261021022505.6fe1b1bb@jic23-hlaptop>
 <20261022184313.GD3381610@ziepe.ca>
 <attZl_0TNMDLgi4U@FV6GYCPJ69>
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
In-Reply-To: <attZl_0TNMDLgi4U@FV6GYCPJ69>

On Fri, Oct 23, 2026 at 02:58:33PM +0200, Jiri Pirko wrote:
> >> Jason did some nice handling in the fwctl stuff for
> >> device alloc and hand over after device_initialize()
> >> (I've copied it into a few places recently :)
> >> 
> >> I'd like to see something similar here as it made
> >> it easier to follow lifetimes etc.
> >
> >This is really at the wrong layer.. Attestation subsystem is the lead
> >subsystem, it should be allocating the struct device memory and the
> >driver should see the typical
> >
> >  struct attestation_dev *adev;
> >
> >  adev = attestation_alloc()
> >  [..]
> >  attestation_register(adev)
> 
> Er, the driver would call attestation_create() which will be a wrapper
> of ctvl_create. The reason is inheritance chain and each parent being
> passed info to and doing its own init()

We really want it to look like the above so we get proper container_of
stuff.

struct driver_attestion_dev {
   struct attestaion_dev adev;
}

driver_adev = attestaion_alloc(..)

Don't want "create" to allocate the memory, it is upside down. The
fixed memory ctvl needs should be buried in the attestaion_Dev

struct attestation_dev {
   struct device dev;    // sysfs dev inside class attestation
   struct ctlv_XX ctlv;  // ctlv instance
   struct cdev cdev;

   const struct attestation_ops *ops;
}

That's the essential skeleton of what a subsystem should look like in
linux, ctvl shouldn't co-opt it, it should embed like cdev does.

Look at fwctl for reference

Jason
