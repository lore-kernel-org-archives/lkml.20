Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372724;
	b=isl2J1n9s9MUYhNlEnTQh8TPmBGKahKH1RI69oq8tUH+yblifhgsS3SyLIgxqT6ZXEwA
	 llMne4cg/IN1bBZMuZgjXBnRwWCsqXC+agjPStnZha7az7ySnjDss8tf7EIR+W2KgmuxB
	 eSYWOEaUw27xcOAf+XxNPeafewif7hCHT3lcbEWNlzfdL2aEmzf3SKThkDkij0uJTi3et
	 UpjAQfpG54/+3VXh4/K1ISwMF1a2ZbBs9Ioi8RsBcR7+7yjq+b+hfuzbUL/6Nzqhruj0I
	 dlE7Z+A8zK5Zl+JFpyvtmTmWFMdUcX/PaSsjrM+2632vbA65BKZV4bGzLBnJpdJVwIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8skhpE8x/+Won6i3+XD12raNMCS4xOoCCKoDLeKTESk=;
	b=YUr2I03h76WAggSQJw8O1AchYAiz4yxjhC4bYm35pCDEraVuZCI8cwnyzAthDyY2Tf4A
	 smcNDyG2EIqkJh0iEuCr2tndJnf0zefq+E7XN7N1ygMt0U1pYxznG/MUDzv+NRPIMKVuS
	 I/OD6VT7ajuNwRtb1WH4MESej1TGc0n6wMuwYsqrjNW3T72vA/njk1KsUDjZrFkX12v8d
	 dafrjg69j7V3gdjJCo9YwWarWYGHbLLz1Hdj/TeT9qZtDZAyvU/XJAHfhPq9Qc/GN3jV2
	 hXLF3lWyk40/sDrVxcrYWwBx3ReE3/7Nd9fpmlPNeO800H8bkyo58ySI4UjBureH0ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=czkACChM;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDC7606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDDC7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=czkACChM
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e10a70540so525318f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793372717; x=1793977517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8skhpE8x/+Won6i3+XD12raNMCS4xOoCCKoDLeKTESk=;
        b=czkACChM1Vp//qoKfk5C/DvEMQvaO2yxTtnTnNrUz1iZrGkpmjYA7sRpCOkiK85OR5
         DKyVNu3yHScYnpTV8mEyNjy0GM6AiGkEY+yqMV2kwhj4nogM5hBtnMNrDyDvhJfUP91Y
         2qLHj18b3y+ItwylHnK3AxAJpQcnWODG8q5TOy1izMOxysmu/gE3PBKDvsyiMMeYHPdN
         L37BWcbW4GBGw63knHhhcjI2CyLf8W45aZwoP+DUdcfn7pfklTtyoTc13Ps5EzD68ze2
         PhwKJwRPpHLlcw1quPe3gfGrKyhVNOtKuxcCOGPE+MqRlL4wQREaJw+p9SN5GR4rJNeH
         4qQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372717; x=1793977517;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8skhpE8x/+Won6i3+XD12raNMCS4xOoCCKoDLeKTESk=;
        b=2OyY4Axt1JfLA+nFu/9oZEjCSA5dPaBvexU4zSVEGBtAGe55KXSSSoB7a3R/BrTnmr
         CA9MODzdd12rBfK3hVWFOeWR5RUQJNelio6iGSHf5a2Z7lhkSSobs8DV5j0dzwgs9fWE
         pTyF1YEh+99bguUFqBI6QEbF0zOPcjzs0i40nTPDyRn99TofmH/QMJWHuDy2w6NWXerz
         eKMhYp7o0nNTkSc1iG1oj+dzdgjnm4bplsjLD9FgmVQEUT/quwOmmHiwWP0TQ0g4+L8t
         ioNmrfe13XcFS5+4pqAED4VoNSJmsHNxtC19AJjYdd+7WQbJPoCJsXZHCRIBcUOlwUF0
         h1aQ==
X-Forwarded-Encrypted: i=1; AKwUvByE/yI2sPHfXrgtCWh3niUEjvAoEyYVy7n0T49krFver/BDGH4B7My4ncHLINfsHGS1yGR5K3i5IOrfkQA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKD/xAoJi4aXJnUILGCy+Mui4OhIlYRm7gh3KpckJ64GzEA6ztI
	zNRE4rRBB4GbhZkjPzqgwtGgh3rp5tt2d2nLbUKxqemJkblCngyVcGnZCjqhUihwTD0=
X-Gm-Gg: AYBFou0dfN/+bW+9h0ElbVroSvEYDg4QCuuzJPN+yh5cm5ytr6+hJAbX2Euhm/trYu0
	6h31mgdl2uJ2VMTmCTZMi8MkejTcXP2T8SFXymoFHVpcPQSglYzUPJ+p/t1oOfMX25TF1GxnGgv
	fd/1qiaRT8EqbHt6hUdufvOFt1Oy7pAWqXXIPEAznLx4Q8tISXNsPzGX1IZnx+UFJZst2SK3U9O
	p+AqI80hT6THXIk7alA0nPupzsPiNcjHhJPjPo3otr562j983UFjnXcXUnZA7+Z5vxNRdZD2Uhq
	0ajEWRqEDO8C8fQWAefr1nmrF11/xpHJlBTFEYSwc7awbUnMB3TDO+6HOoOCkJpshIQU++MRvVE
	JcMKSICIhpKwdJsI80NdohP/sdSHy9S6P657vCKefpQKHfiBrHPFfCy6kidOwLFJmMbO3UJ/iY+
	gF7+hKwEQNj5qHu2swDivoNqxFjhDDb7dvfakmus/CR6/w0olZx++FCusT7VoXQbOinVGTTr01r
	56FRjcIhKLfNGSMrsKC6efK7gwLatenIwXmtPyNFXhju6plaB4uiPIl8etgdY2QVHo8T8pC6D5Q
	iTjt3BZnIH8IzWh1xGvtsk4awh7aKSjg7znvWNgL
X-Received: by 2002:a5d:4ec6:0:b0:48c:7143:610c with SMTP id ffacd0b85a97d-48e6e3091c8mr5024505f8f.36.1793372717264;
        Fri, 30 Oct 2026 08:05:17 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b77f06sm3716923f8f.21.2026.10.30.08.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:05:16 -0700 (PDT)
Date: Fri, 30 Oct 2026 16:05:13 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 14/20] attestation: Add the base family specification
 and generated files
Message-ID: <auSxxPM5z8BzgNm3@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-15-jiri@resnulli.us>
 <179302367452.58760.3782556786585774917.b4-review@b4>
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
In-Reply-To: <179302367452.58760.3782556786585774917.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:

[..]

>> +
>> +/* attrs of group cap */
>> +#define _CTLV_ATTESTATION_ATTR_CAP(_attr) \
>> +	_CTLV_ATTESTATION_ATTR(CTLV_ATTESTATION_GROUP_CAP, _CTLV_ATTESTATION_ATTR_CAP_##_attr)
>> +
>> +enum _ctlv_attestation_attr_cap {
>> +	_CTLV_ATTESTATION_ATTR_CAP_EVIDENCE = 1,
>> +	_CTLV_ATTESTATION_ATTR_CAP_MR,
>> +	_CTLV_ATTESTATION_ATTR_CAP_MIN_CHALLENGE_LENGTH,
>> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_CHALLENGE_LENGTH,
>> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_TOTAL_OUTPUT_LENGTH,
>> +	_CTLV_ATTESTATION_ATTR_CAP_MR_FLAGS,
>> +	_CTLV_ATTESTATION_ATTR_CAP_OBJECT,
>> +	_CTLV_ATTESTATION_ATTR_CAP_BLOB_CLASS,
>> +	_CTLV_ATTESTATION_ATTR_CAP_FORMAT,
>> +	_CTLV_ATTESTATION_ATTR_CAP_REPRESENTATION,
>> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_LENGTH,
>> +};
>> +
>> +#define CTLV_ATTESTATION_ATTR_CAP_EVIDENCE _CTLV_ATTESTATION_ATTR_CAP(EVIDENCE)
>
>I feel like there are too many layers here for a code generator..
>
>enum ctvl_attestation_attributes {
>   CTLV_ATTESTATION_ATTR_CAP_EVIDENCE = CTLV_ATTR(CTLV_FAMILY_ATTESTATION, 2, 1),
>}
>
>Do the intermediate constants add anything?

True. I originally had it like you suggest, I changed to enums to avoid
the explicit numbers. But you are right, does not add anything.
Changed back.
