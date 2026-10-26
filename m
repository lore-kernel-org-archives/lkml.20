Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025930;
	b=rHor2RMxEamK0Yl2YZjreij4LT6wlNGdyhmfI5nncmN6qIpbDbYiVT+NYxtIuE1I6VKy
	 BaKJqa6Kzy6hj9yPEmz+nSw5TAEDQ7g2j2xsAm3xC2xtOnj9kRLR9Q42zDGx6oaScH0LR
	 wWchr66fDNgkxtlmzyymrkZn29F4NGTpWG1NM0ZiBnybUnwttlijD5Z10rOPPkvLrxoXx
	 KgDpjeEUcfRSY8yMKmF78YYQ7L4pGhZCbQDHXUkmndCnmxKCP8pHE4YLOduhcDr5PApnY
	 jj8c3Lxvi6vni1P/vrilEO5x7CXRN1R38P4u4mzFKCMBfbXa/nnjo0Hh6Ntzw9mRfkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BTyJwIZ3wmc9oIYfv63SnUqHORvshzUvmQqM3M2r5gM=;
	b=cIhEmikbFIW5wws9fTCm1NpsJxhjAVXXb2gywtBByqBWhs+fT1BwZA438BmgGuXJ8Z+3
	 0Ldojqzk3zTN4RVwEYl59/WRqf3soPuYgrHxwnNv9tltQX/5SUDhio2+kONLQo0q/e7Ez
	 L1pzh0At+cjfUIuX1EJInsOFYkZN8n80YJQaxJvpGRRrK72kfZIBf2f6swl1OLKT86rTY
	 I4uI2mZHwCdW2hNUiQ/R++IO2kZuryxxE5kp7yl66HmQ0B4e/LxkJTSLx/sVySclWFTIg
	 XWLSwPFMD6L+rNIZHAeCZ4bw0QD/dfY7QqerxyPmqQOobd7VNGWtE9IZb99Tnh4okBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAC8606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCAC8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c43373ae89aso462967166b.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793025927; x=1793630727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BTyJwIZ3wmc9oIYfv63SnUqHORvshzUvmQqM3M2r5gM=;
        b=NaHhzKNABkMC6wPd56SklKTLcrQYlfIh5spEFmqO7cf478BMxIsRJr4GJdsQzMnSsI
         rdTHhnF71aRCmn/ZbWzRcAHNKccrrw4wdLKTXgtF7lVYmL/I0tNSmfXZGnPPcKVl+2Yl
         x/dU7kIekZQCU2z+mtWPUnGySnvBvr6joKf+sfeGKvdFtmYt9dSLMTJesO7CKx2gOyWj
         F7XkhsdJkfue1Pp3MdFYVpe8zPO/ElN6+Hl27s2XKWj4Ttuwb4puQdX4nJm5KZchfBO/
         R8eFcLnpn2qGsfM3RVIy2yrHCfMIG6pg+Q6Fi66PGXs+F6CEx+JXB0tkqciFCTf+D4JX
         SK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025927; x=1793630727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTyJwIZ3wmc9oIYfv63SnUqHORvshzUvmQqM3M2r5gM=;
        b=vBv5Agj6K9i5Yji7KiUS9M/SLOBpZyzlF7cQFbkvcZUzJ+HmsFtbHNGBI8E6/ctXgQ
         bD/8fxFdRSoo8inNk8eHs2UOmjCeckf9B1zZ0Smw14PCB4ek9bULST+7ic7r1t1WEt+v
         MvVt3mNS2dxJrHkbdye5DP1e3xEI1z6JTvdKp8rDzIHEaCJUE7LWqo2HowP2nmREF9fg
         w636VoW/UMeeUaLUC7FSSCbNUe/oK4/n/kHDFfKUEGWPal81LYbjA/YXPyX74bC4bC2L
         K6yA5HmmFlK7woKEcCWho68ZjODXqZoGsE4oBL05XHn6rTZ1GfQ/M3GNePBR/qwb52uv
         cb7w==
X-Forwarded-Encrypted: i=1; AKwUvBw+FL3MUZ7Q6AJ2/dulmKXubPBI5aTCXW2fccmnE7nOpPlWhwT7UWaJcGJHVwJQba8300u13irmRXw3+jE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+x3zTyU8dHg3aVBObO0cqXDsmtzABNPKVnzzXL7C9Xgzpc9VN
	WsQkI9puRiMZ/3166Z/qOC+D4kGD1K7V2+DGOSdAB+ZHyfHFgzQEspTyVQFPZVfVUys=
X-Gm-Gg: AYBFou1H5Il19WAcEAhjJXaZ/OmGMyiaGP7X5DXaODiuc5eEn+eNawsOllEapfAuPtX
	Xl5Aq1RLhuhNKfmYwSASpWRYURpddxsA8fGv+Cved0ZPdOorPLL9zUbL+0+ir/7ebl0I/TQIeTG
	bR4K712Dz/sbC/7wVAJg1pyKjnOXWyMLGi55jAqskSqPUSC13msFxujAze0rroosFvohq0C6P5v
	Wf8n+NJip3prHs6Bm6nhzUHP4yiwieB038SoO4Zi8fCoAr/zluEecqrefGEMNEWjheTgTEuNwaE
	z+V9MIQkfLxzLZ+MyhJixwn1v9stOXA1PzfWiOKKf+nq9yNSVm5zt/gYYIPRy0Cg/Y9WlZyAiJ6
	yHsaXrL+lP+2ob+HguizfJHNGVCo71F83kwqZHoi4UJC2e4wN4HuLsJ15DG/r5NgFXqomJSsynh
	FVN9WMlcJepJhQe3hIEV6An4cF7mcQgRb72p6fPkv4miq2hMHjR1cSNTUoL1YO642Ok6oRGzu7O
	Vg7iySztPwtiBzKd0Cl3wcogtnDu15yblz4rCjeCVVDxNMkIJJTwykXGUu3tkIp
X-Received: by 2002:a17:906:c111:b0:c29:f5d5:5a97 with SMTP id a640c23a62f3a-c46bde8850amr767885666b.33.1793025926980;
        Mon, 26 Oct 2026 07:45:26 -0700 (PDT)
Received: from localhost ([208.127.45.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7981a7sm325130766b.72.2026.10.26.07.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:45:26 -0700 (PDT)
Date: Mon, 26 Oct 2026 15:45:22 +0100
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
Subject: Re: [PATCH RFC 10/20] ctlv: Prepare event queue support
Message-ID: <at9ncuDFz_vI-0W1@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-11-jiri@resnulli.us>
 <179302367451.58760.3073439917920385955.b4-review@b4>
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
In-Reply-To: <179302367451.58760.3073439917920385955.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
>> Add per-open subscriptions, bounded event queues and event creation for
>> CTLV families. Add the generated root family kernel bindings now that their
>> message and event helpers are available.
>> 
>> The event and generated root objects can be compile-checked here.
>> CONFIG_CTLV remains unwired until device dispatch completes the module.
>> 
>> Assisted-by: Cursor: GPT-5.6 Sol
>> Assisted-by: Cursor: Claude Opus 5.5
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>> ---
>>  drivers/ctlv/Makefile       |   2 +-
>>  drivers/ctlv/device.h       |  38 ++
>>  drivers/ctlv/event.c        | 713 ++++++++++++++++++++++++++++++++++++
>>  drivers/ctlv/event.h        |  69 ++++
>>  drivers/ctlv/internal.h     |   7 +
>>  include/linux/ctlv.h        |  27 ++
>>  include/linux/ctlv_family.h |  11 +
>>  7 files changed, 866 insertions(+), 1 deletion(-)
>
>If we are deferring the mr log, then events can be defered too? That
>would save another 1kloc to look at right now.

Okay.
