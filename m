Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022506;
	b=Ln/5ZrIMoNAlLap7MGQsl6IbLE5xZM1WGjg8LJckesz5ee5iuuJsN2M+TvO0bFj3B8l4
	 IGBy8FuAX6bxbaFDbm4u6lEMN0CULaRpskZQu9Rfps+q6VrPdAE5MiYezzxrHBaPtblCE
	 QAvzbeHl2Jswo2z9C3oK1rHJp8pZ/tQrvWEWj8uxog4W7v0mNJxwBLexyAEDJTSvZyBtY
	 PbABLYKtUoYEVTVLiYn2ogle8xD7TITcREy2mIyCsemOnOKrmwmwyJXli2JNOTiXlmodC
	 uUBRBta68job0kUx6elkTA9A0HrMKgd63G57N7UichnJrdl806CN5THx9ZI+O+78v7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eeiDIzKBgXHTvIB/FzTge64uqO1p8vq38QKemD1zDpA=;
	b=SCNPlxTKNhe48UipP8P7SfwXdZJZWYH9f3gby7Uj+OOpvxX2KxvXijaYXGhpqTwwOXRu
	 WE4W1qzMcMVgVanjvm2hS+orn23MQ5/PPcL6mkQDPEWwZJoNzzC8ynM3NoCTMeMNT6ixu
	 gJMXQGuRT828pwiJ6+DtfpvryNsyF2sXbpNn1K7erIIRkgqmTsZxVDQ+8q0B3xqpOZdKf
	 EFbMjSuTTvhEWGxVV8XNTH2Wrz8moGPVOtHysEQAtCSQVLQEOlEoQomXjyYhPUauoCvm/
	 pD4PYp4TvyqZ58xciOozRxjopD2OA4ZBcyTU41vJovEovqIv0zbzq2oCG8qJZA7vLlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3A2606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF3A2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a215e64962so22087625e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793022494; x=1793627294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eeiDIzKBgXHTvIB/FzTge64uqO1p8vq38QKemD1zDpA=;
        b=VM8IYrnCNNqs45DDC5LE9lQowRMEKYE5Y/KZ57bV4yet/aoDBGlAsxJOmTRykOk8dn
         FshcS/W8j64dt0Mh5C8VdYgUtcsCto+ScQaOEpF+I1g+GJr3PKhwYJY8a9G++KZq2rIk
         fciASrl2LvGXd8pYXvHkATr9UTdfoqHxMbXc79S2QEtkqqFElfTeqUk4ffn+ZNgaeGe/
         nm24iy1xia1O5G3DOANrqIMherXJogHmuD48d2u+nc2vCUxcd8XNkN3ljWXSZqr8HlaX
         Y9o5gWTDf6GO67jT9mY+jbYN5IM9+ZXATUXh+KiGk5uTlXn1ZnpDB+tpDMpOFgjZMwAW
         Jg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793022494; x=1793627294;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eeiDIzKBgXHTvIB/FzTge64uqO1p8vq38QKemD1zDpA=;
        b=CMudcFAuE4i6aMWWuwHcxAoeMWMNWKY6mftUHNjoRmrbKolYSkzZBRRxFR3EoWNmtg
         6yRg0vqo5DNgVZbcPC5Gg3RhNM/uvlmHxdLWaUubQJFfb1hXRZsbltDgqAO7nCTAcX4m
         cjQf2wVFEf1QVVvE5qygKBpoxL3FTNirBH1HMhWFOQbGn+vqytf2Mc9163rn+1H0gT1J
         bpb1KLXCE25a87MJKoFo6UQCAoVwO5dL6b8fnUWVlNVe4gzFXRSZgWpj8oRdep2xHmyi
         hKQQhUO1rDGWSJGqVGt+7idzXDdJL38bJbp4k1HTBoHe3K6Pl8Wkp002pYPgpeX1hi0T
         7btg==
X-Forwarded-Encrypted: i=1; AKwUvBxUJ6/KHV3xPPNqSiEmNj2h+tmikU2smLba9wtMN7SK00So/lxXMt6kJYGuvpE2/zMmpreKucSjEb21Ag4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5sgst6JCd8Mk+ADox0D9vzbz29unB0IwcUZhT4xg1LhGej5Ic
	bpDcgH9IcPQB8NZMeHmcP/EhNl8g4GqVPQ8UNNw0CxhKKIyvS8h3CYrbfXk+G5CIReU=
X-Gm-Gg: AYBFou0MQZ9rSGQxiorbT59PlQIjcmYcxPkpSz6XxDAXZovPrhkQCWSXagJrdl/ubOi
	g7htDOfoKa22Kf5V1S4D00vLjoCldz5L1KtwAQG2jhIPIDYnQe5uCDgiaeaT72nMXwyFtWM0gse
	ijxP0tl50pbJUYTiHl+VzCYnU8VfeKQ/CJQmrdRYK8vJe6dhpN9jbnvL3YWsvzP9rwF5ErPn7N3
	KY6Z6WDHTOy6aBOheuD1URear5RXA/538y1rC9fFUvz8SwMniTYsbPYXDR02dXG5hQDNl7CeRLD
	TYg0PEH1zfOoK7BA7rx7YnkA+3XOFrFIHZOIWI3b/xSqXrDT2V2EKsHpzokE+DH0h/62i0hL6rK
	vSMAPKb4pxrzQakpXORxc4mPwqruMjHxo99EkExX/nkUXecNBxfCA7Wi5Qo2A8rKieeyW8q13hL
	Z2vEXMiS3N/BY7WRnKXBBg+bKoEL8arG9vv4bfTOdT2NdjsW3ypePOqfhPMf67m41F89Bv7u3Tu
	1Jq4oyaDAhSiewodsX84uXGCxBo8ThY0WDq1Lo+8r5bxwmx7i66UPmI78hOqbkI
X-Received: by 2002:a05:600c:3d8d:b0:4a1:f377:5c75 with SMTP id 5b1f17b1804b1-4a35acc2edbmr104469535e9.33.1793022493724;
        Mon, 26 Oct 2026 06:48:13 -0700 (PDT)
Received: from localhost ([208.127.45.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a5ea0df763sm107133535e9.3.2026.10.26.06.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:48:13 -0700 (PDT)
Date: Mon, 26 Oct 2026 14:48:09 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 12/20] ctlv: Add device and operation dispatch
Message-ID: <at9ZEDZl89V0jaJB@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-13-jiri@resnulli.us>
 <20261021022505.6fe1b1bb@jic23-hlaptop>
 <20261022184313.GD3381610@ziepe.ca>
 <attZl_0TNMDLgi4U@FV6GYCPJ69>
 <20261023142633.GF3977851@ziepe.ca>
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
In-Reply-To: <20261023142633.GF3977851@ziepe.ca>

Fri, Oct 23, 2026 at 04:26:33PM +0200, jgg@ziepe.ca wrote:
>On Fri, Oct 23, 2026 at 02:58:33PM +0200, Jiri Pirko wrote:
>> >> Jason did some nice handling in the fwctl stuff for
>> >> device alloc and hand over after device_initialize()
>> >> (I've copied it into a few places recently :)
>> >> 
>> >> I'd like to see something similar here as it made
>> >> it easier to follow lifetimes etc.
>> >
>> >This is really at the wrong layer.. Attestation subsystem is the lead
>> >subsystem, it should be allocating the struct device memory and the
>> >driver should see the typical
>> >
>> >  struct attestation_dev *adev;
>> >
>> >  adev = attestation_alloc()
>> >  [..]
>> >  attestation_register(adev)
>> 
>> Er, the driver would call attestation_create() which will be a wrapper
>> of ctvl_create. The reason is inheritance chain and each parent being
>> passed info to and doing its own init()
>
>We really want it to look like the above so we get proper container_of
>stuff.
>
>struct driver_attestion_dev {
>   struct attestaion_dev adev;
>}
>
>driver_adev = attestaion_alloc(..)
>
>Don't want "create" to allocate the memory, it is upside down. The
>fixed memory ctvl needs should be buried in the attestaion_Dev
>
>struct attestation_dev {
>   struct device dev;    // sysfs dev inside class attestation
>   struct ctlv_XX ctlv;  // ctlv instance
>   struct cdev cdev;
>
>   const struct attestation_ops *ops;
>}
>
>That's the essential skeleton of what a subsystem should look like in
>linux, ctvl shouldn't co-opt it, it should embed like cdev does.
>
>Look at fwctl for reference

Yeah, I understand the typical flow. I just wanted to benefit from the
fact the ctlv has the inheritance chain to reuse it for init/fini flows
alongside the private structures allocations. It saves a lot of
boilerplate code and hides it inside CTLV. I admit, it makes things a
bit obfuscated for end user (driver/subsystem). I'm working on
conversion to what you suggest.
