Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760168;
	b=Ny71IJTAEX0bJoDt5jm1PiVpmhl2hPE9KJNMZ5W5t7FVhGU+oiLwBGuQyVguZ/CtFd0T
	 hNKfoGQjPxxRB50vaiaZI10fOu0PTbUg+pkNEdaV0aAsuLyKPg7GIsE5fPY91fclaz+Bo
	 i4jkwRAdRRbDE4yKTIJqA7T+qIF2r/rAXRZ3yh86lPCK7WYQ36MfvAlDkWv7hucY2ZZFp
	 Lk1OqnknKWboABcbppfd2+Cz1SV8CqmS8DTlUWkopk+VnhcMSLpAUwNLN1cClp+M+UqDj
	 Vdwk+MiVm7V07l+wK6nAcwKBjQi9VpHNtV5DhMLM8XqKAIkTCoTDR66LbOGmLmnElDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4u5HTj0vYNkfyVy/ejdHIe5/AhW56e/aHgAn7wANgbM=;
	b=ZpDZIzk9qvEVVIw46nWKrddJo/4jNBrcy66Fwuv60qrI2TrTP4gv6JlaA0vyV5EQJTSc
	 I7JWHscKAJVIo6Z+MfdjZmTvyuoV/up2mALOs8o6L18ugGaUkxIJwW0YZAlzljEJUrZMA
	 l1loQybP2gXaFnad1xdilRbhzcaxCfdrFWTnuq3YnoYh5YKrtL73qQQbN7Kj2sOueKD6S
	 p+gBzm/pdFXlL2tJqHDJAR8FczvQlUqtH6LJwUll4dREGtxDI/lCwtlu/8Jyi3mLpPgL+
	 6sXveplZA9bSsj23QF3cV++jvl2WA2al5p9CEMM4cNTltrzinjGqkisfAN91v9E55sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=m68+nKSR;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5826606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5826606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=m68+nKSR
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso6784655e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792760161; x=1793364961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4u5HTj0vYNkfyVy/ejdHIe5/AhW56e/aHgAn7wANgbM=;
        b=m68+nKSR5BhjusJh/Qoc0nFyichGbcMpyaSKaNJGTP3rKdZ4Rjh5t6O40bNzgjsQJ7
         3ehrVsQhBMk8TpcHGvYxIVuxL6Ze31YASaTg7nasj/RW94kOhYVH3HMatmav1PWnD6ro
         hrnxuD+1NWOJaivSj8CsP4FSc6Yqtc3QVKWRjK8boPOVkf0vQXAjVum2TMSwmA0EI2YK
         Bn0wEYZ+diJ8DmIbUBKI+rmeQ5CMY/a+JhcwneYZfX1B0op3gTVSsQCCMm2tBMykQ56d
         x/TFWrZUzyXQegTGLG/MoakhVwcu3bSwlv/on6PDudlwXA/4Au3qwbz6mtfx38vXN42l
         OLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760161; x=1793364961;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4u5HTj0vYNkfyVy/ejdHIe5/AhW56e/aHgAn7wANgbM=;
        b=kFmvad7+gzuQrsWMUPeMTRP2ZDiUnf3PaPOS8EcL2ccHIcgJ/q2FLPPzZ2kT8VRN4a
         xHvhIbeQ0bui58ICJOf3/yH/bc+nAbCHhYJ/GNycLbQuz5FUzYJpHNLeRmU0Bz3k8NqQ
         hbT2hLuw/H+j2kcQIQi+2+5lHgAQl9X7ipHhVYtyKgHth+Zy+YhXP77BAhyng7SrPq+k
         QAd6YIYhOIjD4YKUci2ppRyLaOcAype9AfI6O4m52Wmwji7SgR660Z5LJU+NR66VdtAs
         GaTzWfZctxcf4/iL0vOC/yCTrOpb9y7zGxUT4IUrFHD8Qc5yMFmqnGG721TYlBe8CjmY
         HMrA==
X-Forwarded-Encrypted: i=1; AKwUvBwdIddkLTLO83R1RttuTv26/Zl774bFk+PYKfvGdTGL+Q2kx1ZC0dM4CKxd/RUtV8WnZMMqqMifovD3o2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXmSj8IMJF2+f58C43pXMRO+fMOU5bI+f0jTcTSAMPPhCw5bAJ
	xAgX/O5rGIp8KcmukkBTOjTAI5aSeUizPUUGTQGOGpHmYFw14FrUawy41mKBXpzlqEQ=
X-Gm-Gg: AYBFou2Vtg9JfjqIH/adlqaXiR1Y9epoEW+MTUdNp93AbWHI74i7H01G4gHwKEag8Rq
	Du06UDB6XF6wKA3618ihjwq79WOrTbhCoFsEJn2uOmrwS/9H/kXt3+4ad2io4ExOfG+/uWfB1QZ
	svaEWqvvHUae09autEkF4Yps6R6X1IEYhaEt1cWc7EJweYJuKfJ1ZQBe1C54tTYcnZJIwC7ek/7
	O4bc22Q9uEYBj9lPrV1eeVjsQy8Cgg1jDDz0ZQEvo/ycB8xlL7IMfkq7WFKIjcy7R0KMhov9iU+
	E/9Hg1SbW3pmxILfFzKfdJlxqAWn8bn89STxYe2xPf78RGmBZBHBbIyzFKb4feqIqWvAN8nVJej
	TfO8S5ue1NIYLSGU0Iw6b3mOXO04BpGOhH4yZ8KWYqu/ynBUTRCLQ+eGpr8/eAX68DOAhXb1PO5
	RrZhJY+EMhY/L6yEcLW8U5tffkDIaKl4vcitcMZOCxxVnPaX6+VX0Ur6MFhq090MZ29MgFtQ++2
	Z/mUz9RPTvS/bP9cqJEH7U+MnLGxTPXXgfFBjIwe9BSve1/MgyrRRlfHAcko1rLWQ==
X-Received: by 2002:a05:600c:354b:b0:4a1:97c6:d2e8 with SMTP id 5b1f17b1804b1-4a211ef95e3mr38623785e9.32.1792760160732;
        Fri, 23 Oct 2026 05:56:00 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a29cd9d232sm3594475e9.4.2026.10.23.05.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:56:00 -0700 (PDT)
Date: Fri, 23 Oct 2026 14:55:56 +0200
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
Subject: Re: [PATCH RFC 05/20] ctlv: Prepare message input handling
Message-ID: <attZPPNPIgF-DH4r@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-6-jiri@resnulli.us>
 <20261021014324.58376589@jic23-hlaptop>
 <20261022183942.GC3381610@ziepe.ca>
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
In-Reply-To: <20261022183942.GC3381610@ziepe.ca>

Thu, Oct 22, 2026 at 08:39:42PM +0200, jgg@ziepe.ca wrote:
>On Wed, Oct 21, 2026 at 01:43:24AM +0100, Jonathan Cameron wrote:
>
>> > +bool ctlv_message_input_rebind(struct ctlv_cursor *nest, const struct ctlv_schema_tree *tree,
>> > +			       u32 node)
>> > +{
>> > +	const struct ctlv_message_input_scope *bound_scope;
>> > +	const struct ctlv_message_input_nest *indexed;
>> > +	u32 i;
>> > +
>> > +	if (WARN_ON_ONCE(!nest->attr || !nest->msg || !nest->msg->index))
>> > +		return false;
>> > +	if (!ctlv_message_nest_index_ok(nest))
>> > +		return false;
>> > +	bound_scope = &nest->msg->index->scopes[nest->index_nest_scope];
>> > +	indexed = &nest->msg->index->nests[bound_scope->nest];
>> > +	for (i = 0; i < indexed->scopes_count; i++) {
>> 
>> 	for (u32 i = 0; ...
>
>Is that allowed now?

Yeah it is! You live in the past, same as I do obviously :)
