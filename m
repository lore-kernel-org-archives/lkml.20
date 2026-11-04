Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821585;
	b=uLTWTM+ceAtikoF5J9xQ/dYeaC8Z0un6y/uPYeUa4AvhXsaMHTFDletu1W5m0DtLo2NC
	 kLZxzYDKoaN3tvZBT7UGbA2naqzuG7XvY5tZZRkmfoVGZBEF+zjbjO8Luz21+rjk8klaJ
	 sBgEr7nUHl9QiOSHpN7a7tuPy/9lVUtQHmUlMA3a7o4Sk/s7bOidC06fRCE9SQpbMK18v
	 DW/7aANKzBlODUfYjYDqo+oL0d/HCkzHeiqUx5BMNaapDtyxjbr+wjgrJ6Sqmd77+eoSv
	 xAAN2DejJ7Xke8K6NqlARmf+fc29xWjgrGXJNshkLZ709m3wfle06IU56kpJIO4f31Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/iOiQOUFj+ZNXsxkV0W7K4UHGpRKtOzL2hr1OPDdR9w=;
	b=b9IsQMIyt3qAv0J6TzifXvusEJoGSJavMtU4kBpWOrA7paTka3FE9+eYn+TdXt8rh0FA
	 k3GzR0aM9XjV28tT8PukoGw9m3gNgv4VIREYf1WUfMrMmrbHMAopvinNRCrCRaca/uXrg
	 7b0tKT0/68Hf8VVQQTtlpGjm1UrLVMMNRtW8S8vZwTVnEUccuneVwZ+LsmwVeHLDmhKcD
	 7koePHk0tgSP/liD+5Pg+8V0TDiRjmO7R9+GdY+Qotumh3vN+IvN1gbp9QMrkI074OOTQ
	 YKNJyYTfMm5E4a/UjiXmZQXMbl8lzmmA7AePAhazC92I//ERb+btFT2naAaX44mmzdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47326608CABD
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47326608CABD
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5365b48238dso8613581cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793821584; x=1794426384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/iOiQOUFj+ZNXsxkV0W7K4UHGpRKtOzL2hr1OPDdR9w=;
        b=WRBm+GQFrwS5Zas3ZL99mrACnUfCSQ6IoeXlzzeD5KKnBqHHgtxYl2c9wviBwKfOJD
         qtN+ZFY9uOU0mlzNZCuwr0exw/fYbp1g7ho5/pM/xUO2KAdWMlMV2RV+eo8CzwSP0PK1
         MgVCvd6blq74OYN7OPzEIJ01+NGUqyNVGsk9oJ9gJnGaU9hlo5GRil1NKdsf3xy0EYAo
         KWR5bpoPTgSvX2xINyPwl/GgNSWpYL76GMZPxcwzp8e6CZ+A0tOfzm6uN9XILruejEOn
         jmRIHZ7FemA5lobw30d7bQdTmz2Zgu/15vEm4Imf92NuvMQXWpZlg1Y/yMPrwX5t4FVQ
         NW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821584; x=1794426384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/iOiQOUFj+ZNXsxkV0W7K4UHGpRKtOzL2hr1OPDdR9w=;
        b=OoUrUEWrInfbHWHeEkEDn9k+pRyhKZLCmUDC/je9CNJH2fErGlDPguNTD+lu2UxJPB
         oDjiPoFP5gs7qwuE+vuEFiW301oatzNGWfM9BX6cAFcncrzpWsTkUygQfDu838CFeSbZ
         ertEavabvvy7KFs+tFbKglxh4U+xfTUuGbV9QFFCcS9jGFTqdp7Gem5oTrPUaafg3VOy
         CoZ2UggTYjlCSKBVGc30tzqRKihfrgpZnsC7LbwU7UHhE9pPeS0eshg+YnEhvMPfHH4j
         oyJAsCi99WiZMjrDnFc+UbZ8Wws0NFVlxfg1sMQ8mCu/pyJFHus4LYJB2Jp+wsMH5FC5
         xyww==
X-Forwarded-Encrypted: i=1; AKwUvBwmz4ojCZ9xu3ksNZkd1Y/5Z9bzvBjAREHYURsa0UWlAyCXgEbr+O49zSjAoUXpvl4KvNl9Fhu2T4lTaYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3Rzzfn005X8PAf5YWb5hsNruuXCeb1SZJbBKjxvzPQy1gViX8
	VXAxI1vWKT/SnSYraZvw9SkOL08N1z76L/zm98DTnhTsalngpSyNknAQJR1R9vzRKN8=
X-Gm-Gg: AYBFou0sNQFpBWS6WO+HBXMGKCJaGVNvk3Pp+8Ngcb3cw61NuN4HsISL3uqFCtX2OpA
	mNK0XU98uEr+jgHQwA0WRpZt+Bmgn8aYMotNKpyXlEZDSOocnY0CRrh1dq4rzNY4QoVcL2IYkQQ
	8s9790Wm/G6JQ+JYevxJxdUQJkZz3D2Jt/pEyKhVimQsMpybNJf4DO3874sr7icn/MbQaDZCctH
	WL5zzD0RhxcoVGS78kKQpBCztv68ZPKMvM3/XSk8pf1jsr8XdC1NdblUtqWsI8EylcdTIiEIZIY
	8TEGx1OYHNkIB57sLN/KtvEXkxwbv9s2LMna4vM8CD1o6fzYbnl9dvjdlo2JOn1kAsIwgb1bWKK
	S3x9wGmXp8SI7pCIQqMfM9Tnv0osszHn6SCQlMmXqVJSxOqhuRSJBMUaN6ElchGQzWLJMUHLWA9
	HBnjAzoqmVajkJCaHfhGLROcjx2oTl+VW2hvLb2TNwiaf3keVCoo96yho9w9H8UvGlX1lzqcIoZ
	ywPUrpM3q/Dwm9R7LFFzt1U2OcDrmBROKAh9sCDL48ZTizO1egyzk9Tzufs7XTz1AGNswN0jO0V
	aYS4eZZJY4Ovt1aohWCNJ0DWQuAEqxq5XvtZKIsofaCBHCHMsbrCa39iKu5PFKvstAFFXatliEq
	wcM8AeJkM8+q12XV3MW7IYA7j7Q8/jnE=
X-Received: by 2002:a05:622a:98b:b0:535:be07:f31c with SMTP id d75a77b69052e-542b83f684dmr276665021cf.74.1793821583898;
        Wed, 04 Nov 2026 11:46:23 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b100aba28sm32315511cf.9.2026.11.04.11.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:46:23 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOgwA-0000000HIFZ-2f1S;
	Wed, 04 Nov 2026 15:46:22 -0400
Date: Wed, 4 Nov 2026 15:46:22 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org,
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com,
	drdeeglaze@gmail.com, James.Bottomley@hansenpartnership.com,
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com,
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com,
	ankita@nvidia.com, suzuki.poulose@arm.com, kas@kernel.org,
	rick.p.edgecombe@intel.com, elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 17/20] attestation: Add CTLV operation handling
Message-ID: <20261104194622.GC3889730@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-18-jiri@resnulli.us>
 <auuDcABX27EeTApl@e129823.arm.com>
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
In-Reply-To: <auuDcABX27EeTApl@e129823.arm.com>

On Wed, Nov 04, 2026 at 07:11:44PM +0000, Yeoreum Yun wrote:
> [..snip..]
> 
> > +static int attestation_evidence_request_decode(struct attestation *att, struct ctlv_op_ctx *ctx,
> > +					       const struct ctlv_cursor *request,
> > +					       struct attestation_evidence_request *decoded,
> > +					       struct attestation_evidence_object_request **objects)
> > +{
> > +	const struct attestation_evidence_caps *caps = att->provider->evidence_caps;
> > +	u32 challenge_length;
> > +
> > +	decoded->challenge =
> > +		ctlv_attestation_evidence_get_evidence_challenge_get(request, &challenge_length);
> > +	decoded->challenge_length = challenge_length;
> > +	if (challenge_length < caps->min_challenge_length ||
> > +	    challenge_length > caps->max_challenge_length)
> 
> Hmm, I'm not sure whether this check is required for
> ATTESTATION_EVIDENCE_BLOB_EVENT_LOG blob type.
> 
> for example, if the provider provides two evidence:
>   - ATTESTATION_EVIDENCE_BLOB_PRIMARY (might attestation token)
>   - ATTESTATION_EVIDENCE_BLOB_EVENT_LOG
> 
> might challenge is reuiqred for generating the token
> and this would be marked at min/max_challenge_size in evidence_cap.
> 
> However, in case of eventlog, it wouldn't require challenge.
> for example, TPM event log or CCEL event log.

Right

> Do we need some field on attestation_evidence_supported_object whether
> it requires challenge or not and applies this sanity check per the object?
> 
> Otherwise, to get eventlog, it would need to send *dummy* challenge
> always.

I wonder if we should have two interfaces here for signed and unsigned
evidence? It would be clearer for userspace then when it needs to
provide a challenge or not.

Jason
