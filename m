Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587896;
	b=ss3nmFgwuesT6c2w6FNOuAsYGOzc2OqFmy3CtZkHlfD+3YfceIHJkUydFbxU9kvs/RaY
	 4HQPg1gC9qud5qYEOHMh7IF0kDeR0/hV9qaHyVuu8BywlJsCo9Y3uOOyFz1baGWKGg+gP
	 8B8OSGXO5tJ0qomfqcD4oSzMEovqLJqcnS6x5BCtBolQWnTvVjJqM7anHllbDYzoWALei
	 rxFNn2HAELh41/eS23tDETzbhQQ/6kvEKVy4S6PaZbggMauUCjZ+w8+mZ2cmfLTXg/nku
	 H7dn1FyZQDjJRA74x7eV2hi8RueodUsv5VICitKHlAkaRIfk6cnwcXWYyMYg0yVWdjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XBJOZdPNJaWBnEXbMM9r6oKBxoRWtijN3lb4QnOPdPU=;
	b=dmzq3ycjp/UyyqQmeHtpzYsrUHGaE0rq1HdB/IdmpYy+GQ4dPlzvgfaf9ayeTmC1aY0A
	 Gy/HkW6+JKGsuMxWbVxRTfh05oEqrJNUnd06ZuiLXny15x7jPxLn2X8nFEZY8DGXyE1Hi
	 RflIMgkM3EEEfvjpHkLLia3g4K72baFcmJH0WLlf4I95LG/fh6gBrExYlijlJMaavvBb0
	 wp42K7W9F3EPqkSbf0pkG9KAO0rkzRGAhtYyLDHtbMEmHlBj6Fyuf3HskPXCtCRWr6Mzx
	 bbRQz9AKL3xO4YhGFLxnrqporqeEjY8zp9KRvTRkhIeACTycSVXRm/vFZHBaObQDPGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=CFLBbsMY;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AA6606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69AA6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=CFLBbsMY
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so8095875e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792587893; x=1793192693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XBJOZdPNJaWBnEXbMM9r6oKBxoRWtijN3lb4QnOPdPU=;
        b=CFLBbsMYwkrufn9yAq0dSA5Z2c8I2rI4qRFb2c71CsfhYTuPu1XRsLh69ZdtqYM98x
         9C7RY1x4yjmLKjlv5JMunmxpuiHgr10OI/zCMoNcmyFwjHLmzfgUNQ8rWUEAJRoNAgPd
         zx6f1rQ+q6QLX+7BmMwMlP6A/8+Oc5Yrau5gTZOanD+1ts5Aa7lgDfF10KVx3gHSb730
         rAnUJJ7t2T2AqgXlhscveNcqek8YMjE2eKzx6NEQ7hcihBA0/X7uvPVcD7TOMvGRg+CI
         VJqsYeSAGOgzr7gowdk3glF2ev0bFVuPoPFN+QB9wwVANRdfS5JCQbZWv6FroeDwvu9l
         NhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587893; x=1793192693;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XBJOZdPNJaWBnEXbMM9r6oKBxoRWtijN3lb4QnOPdPU=;
        b=iZWZzPwMNDUR4RyiY7ZQVX3QGsAA9+g34rgCtU0GO6I8bS+VLCkGf8GgizDHF9P6NK
         fl8nF2N3Rj04FWfU5Alv47bPZGZn9DASUYZzPJ70MleuNRhNmozxsEpYPwMpRc1/L1w+
         uHvLLSB0dgT8sSSU0Cjh7S3b2rFzWQLhaeQ1Ay3uGSPpJmuZRUPwn26oxlGuFhMn9wCS
         pBgsI2QjIGpCa/XluxaABHKuMsTC7/7UBqZB9RRascoINaBoR+GowQrrFpZVZemQvpGv
         I2beuwih6Z0G4P6O9gDvf/Yj4LpU+Lyq9d6bxO6mk4bTE7EvFoaJXMCn6+iQa2QbBu4N
         mg5g==
X-Forwarded-Encrypted: i=1; AKwUvBwMVxLxqKYqtwWafVSYUS+1NnqxJ4ObILxIbLUFfUuEp0SPiv1pLmEdTvF9x6zzl0ukExG0Fvq785dtAG8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJV3dQ/JFkwuolGqcW95RrX1UHq/XyuD/TCfGFO0VpRaBMrxd6V
	z/Al/iuORZX4bE6X4w+/8n+C4MLZnYyXcevwHYOmiH8itVou39l6V95+UFAg9MT4yHk=
X-Gm-Gg: AYBFou1Ouvxg+71rT6CUszlTQNPJxJaM3f8cfP9hz/tCkVrjrDdIyTa8bSfPKV1bMkK
	SFLjqfNeUIvD3oVJ57T8NDdHPgUbaE/Glu611hY58FkkTCxGbCwkJy2x9eSmqvV1V3XG4RXVtM3
	Ny2klyRHw0euOzR0D4HcDXe0V0/LQOQ2c/RRCO1GD8XqjlNLm3pd7QQycbWUlPITtX81xZFabTN
	8PADtQvXmFy9bR3KkM3b5GZKbEQ4PZ2hA27R1kYpsM9Dj0LtaH9NMwbY9Tge60YxzKEu36+Lkfu
	dIuC09VjljEMfAtm/Dn5RftvF3Q94yHjgjc1oYvCpi4ddtXga4MN+2MdrxndIub1xZ7LOKALH9c
	YfHYlAl5e0Q6Egxad0w31F4eAkjlXCPRyBivVJ8EJOuF/j5L/ua0CTBHNb+MYdCYIbSVU/mywm9
	ZlbMgWto5+DipMIRX+ghmM7gjbe3zseybhUk7eCxh/CAa+tqM+vXBMjj5vinoYJRF+nSrZwbs8p
	NUyKwqZreiyoHFEoD1aSkY+nbWu5CiLuw2/Ab/OGbpZJMlYGbWOT9hmQ0ZHjeUlHsDY/GWbQJQS
	I+Zv+XKRS2hx
X-Received: by 2002:a05:600c:3512:b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4a1fd8a3fd3mr39461765e9.1.1792587893167;
        Wed, 21 Oct 2026 06:04:53 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835c77sm5101952f8f.36.2026.10.21.06.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:04:52 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:04:49 +0200
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
Subject: Re: [PATCH RFC 15/20] attestation: Prepare provider and instance core
Message-ID: <ati4arl9sf1Rgnob@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-16-jiri@resnulli.us>
 <179245258506.58760.1633805100070716498.b4-review@b4>
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
In-Reply-To: <179245258506.58760.1633805100070716498.b4-review@b4>

Tue, Oct 20, 2026 at 01:29:45AM +0200, jgg@nvidia.com wrote:
>> [ ... 99 lines skipped ... ]
>> +++ b/drivers/attestation/Kconfig
>> @@ -0,0 +1,12 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +menuconfig ATTESTATION
>> +	tristate "Attestation"
>> +	depends on CTLV
>
>ld.lld-21: error: undefined symbol: hash_digest_size
>>>> referenced by ctlv.c
>>>>               drivers/attestation/core/ctlv.o:(ctlv_attestation_mr_read_query) in archive vmlinux.a
>>>> referenced by ctlv.c
>
>Needs a:
>
>+       select CRYPTO_HASH_INFO

Ack

>
>-- 
>Jason
