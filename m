Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090090;
	b=kiliDaHELqHl0kYECsG+IsIiI0mIM5ofU0GU79vQ1P96QGGXLp+Ge97ko5ni2AJAMRfW
	 tCWaSnIqheX4EoeIYsh54CoAbW4VAMeRu7Hk8ijdjz6Dx/wQGexLHLZGGTFpgV0WGzhAQ
	 9uTjxlfjwrqoSf8JHPuU6VknfhQgf2DEdHVz9dfT1M1aPsNYw7D8nZm7Br4ZQjkZlgu8Y
	 MDZRQbPyZW0MWyjwagufcPsCJQyGj8U/oVRLksD/p884+wSy/m/vBcTcfdNdt/xOSHd7b
	 yct1KcEdGwV6cAthnvEaj7zBUYBMYOEIlFL/WGrtccrYWkVEGO79sg5+nW09lg9ZCiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JBm8ffaCoPQH1JzTyc8e2It/Betu/HEG2/vRVRWiTUw=;
	b=g1K2EkmF3zAoBFmDo5uOqQcqitiwyu55MQyRNA9PGnGGuwJWi2LlsZUeeNZWgw3ILV6q
	 JtkIoh+SwBuKWNBAioid1BmiNHE8OK9cgSsll97oCd6orq/z9uSwrZzFyKyxENESVbMhu
	 BMiOHu6OE+f5tdrSm+kfzV7z507E/fxvbl9ZzbOf9Ogrvtnir+va+whcO1ZLLb6VVe3hH
	 hVUEAwpdQfAGZR35czEdLOL5IvVK3cQmuB5oljhFuGMNB4X5X5ApLEzYsL1sAZajaMgPc
	 J4AYabj+DFjT1U5vD/fSkVh9enAAYQKSxNS9tXNvchPfBAhgc9EjoP9jlp6egf35cBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A60F606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A60F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so26082195e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793090082; x=1793694882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JBm8ffaCoPQH1JzTyc8e2It/Betu/HEG2/vRVRWiTUw=;
        b=o3vw+R6WJM/xY5JqumC6/LUb4K4obMv0LWE2BkRABhu2x+bsyUqCR820A7ZCHwkfnC
         Sn/+pQ3m+CYjUbeS9jCMjyJImOaj+z8d/dCOu4EFG3Y1ZhqfTxLIi/tMTL2aAS0KAZjH
         peSCp75+tsY1riFXx52/4tof5ojkSxcnPvRzAH7xQ0h3ImgmU9w0joDiMP/Pi1uMSjFx
         bljGGs0wwgGfu9RqNIdZk/gyQ20assvRY1Gzxql5mzVbAXwP0jDEfcY68G9+Uy9858pf
         CbKr3I6NEEEgEcALs+KrHMjLGmUbg8SPUS8dRewMi3C/7X8PLL31gMcyyHhQAVMuvFwa
         KxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090082; x=1793694882;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JBm8ffaCoPQH1JzTyc8e2It/Betu/HEG2/vRVRWiTUw=;
        b=mztCOrOt/HpTjLR01iAPKfnCstURoHyctKPwj9Au3MuDrZs0W+tb4EKdHm8FawvM40
         tx0w1xfH36a+sw4JxEjINDyWCMtF8pMRBAMBjLM4mdzKb62fEki/CEsPuN4q5omzQ1WY
         DhaQ6i5a0nNN7aquxLiyTUY6nP05rRS0FsbsCk/YJQcp8pERMUz5Im6x2e+5I27VCUgV
         EzD/SuoXvWIiWPAuIAYQoDUcdoBqvbh1SS1NXLg9aI1MsJ6FAbkZnp2Z9nTE0DWVhLEF
         81H9ToXJ8st3gsV77TSfFAxsWSKHEf1bPGJqvuiHuyn+NxzGwyK3dnVfz0PAm8rDqcg2
         95YQ==
X-Forwarded-Encrypted: i=1; AKwUvByl1TIefFYL+Aj61i/IHXOPqhmaRPQZD9ZlUQN4v3fZMs8kgmCWN/ASKTb1fV7LD4HX9YZxxC1NpsrxQjs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYCURB5LYgOiN9ktNiNo6veUD3cn7fkrkr2/Ag8r7IB6fuLYj2
	lonAEW9RC/xAUIVC6Ao14opXy7Zh+ZNoK+V2P07ulOBP8gB6Se9xMoPZExAfz3EvdAQ=
X-Gm-Gg: AYBFou0i2yo2+hvIKB+mWoA3rje5+M7aFRgd5xfPAmQwYQQrQn4WGrCfOTAjSbV31lX
	Z7r8E0Xmpq3I/14dK1afRJgDp8cADQk/jZ8DD7Vw5fnkc7/CNcPHm21/z66vTSH7pl5BvZ+MaGZ
	D8+SBkifKJPb9Bpm5gFR/GWBtCNNtDxnpsa6nrmPrKg4A2lph96UgTgDgK0k6HXMhglk96Xy2/e
	dPhjZXtlfnAbTNGVDXXHjKSfu0t3OVHJij4XUvWLqSF6YDDx85Z0mt39IpD6kerSNxKZrkkCtUA
	xKei+faDV73BA9iZ9ozYJUHnUpylMbRGOznbLMklV4fCiq03UyyoLsEY62skmK3MEhLUA56xBcm
	zUshra0WYGp26F0uadX8DPDzLf9aRr6WOIKPdHyZD11SnJpA8VY29/fYAmEJc+T/rGQ0brHzKxh
	mhpTXtXc7LBDb6h4t8tOtQ2VWfAwpV4kWrwE7tyUGYdp3MemSFPAfdrmAgRizh/k4FclScMUkTN
	CbpGfKbwNz3wuVVSWNnEQhsvjGSvYJbJE4P5OaNUd2Wf1bnfuqQnIC8DGp+Anzj
X-Received: by 2002:a05:600c:19d4:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4a35acbbcaamr167523235e9.25.1793090082317;
        Tue, 27 Oct 2026 01:34:42 -0700 (PDT)
Received: from localhost ([128.77.52.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a55e99fsm261457975e9.4.2026.10.27.01.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:34:41 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:34:38 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 01/20] ctlv: Add the schema language and generator
Message-ID: <auBhwll-zJAaLXRf@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-2-jiri@resnulli.us>
 <20261020233132.793b7e97@jic23-hlaptop>
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
In-Reply-To: <20261020233132.793b7e97@jic23-hlaptop>

Wed, Oct 21, 2026 at 12:31:32AM +0200, jic23@kernel.org wrote:
>On Thu, 15 Oct 2026 16:50:34 +0200
>Jiri Pirko <jiri@resnulli.us> wrote:
>

[..]

>> +      A named attr set, a whole attr group, or one exact attr as
>> +      "group.attr". There are no tuple selectors and no cross-family
>> +      qualification.
>> +    type: string
>> +    pattern: ^[a-z0-9]+(-[a-z0-9]+)*(\.[a-z0-9]+(-[a-z0-9]+)*)?$
>> +
>> +  selectors:
>> +    oneOf:
>> +      - $ref: '#/$defs/selector'
>> +      - type: array
>> +        minItems: 1
>> +        items:
>> +          $ref: '#/$defs/selector'
>
>My yaml is terrible (and all learnt form reviewing DT bindings which are
>undoubtedly perfect :) but random LLM agrees with me that you can simplify
>this as it's a local definition.  I think doing so makes life a little
>easier for reader by indicating it is thing defined a few lines up.
>
>            $ref: 'selector'
>
>I don't care that much though.

Tried it: $ref is resolved as a URI against the schema's $id, so
'selector' doesn't resolve. '#/$defs/selector' is the shortest form that
works without an extra $id line in every definition, and it is what DT
bindings use, so I'm keeping it.


[..]
