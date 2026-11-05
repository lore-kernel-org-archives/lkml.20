Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882155;
	b=G7c5sfE3C93Bj7D38RGUoLgSigqknSbhm1QskoROMibFJGVbKeXrQPvuUdYJltkpHRPD
	 fyFgpFtiBvwFQ5EJ4xfQ4GrJUhZsihwvsI/SFs1Fy3VAe684a4WV3OUuDUZ0hokkF8xhX
	 x8NzLFuf6xqAZs1oFyYHZNRnHeI1uJC+ZcrdOAI25GGQ7mRWXZGPpv/hlCjL0ciIQgFQs
	 0+sY3NqE+8pJ8zNwpa0Lrm4Nos/cya9H6tkbmgDA3C8mHxK2uLJRFfNyJhskxIXL5I+ft
	 UQy6aUNi1U8jp+IylxFwWymBQVcqBeEYgMLmLZ2+Ry0xJm1hwPOka+DEi/BxBlCnvqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=viyDdmvwD4U6PS8lafjWT8pU3blZXU6a4uhU+bJMb8s=;
	b=eDuSQsxFh/LDQ43P7UJkdxXLrLgwg8G3h4hEJcLBQhb3hjuIKta+/5q27D9YEk2tp0bk
	 Fz+2qOVUSjfXB2r33VzlMXQSkUE3nL0P0tbWQ4y1lARvrjmKx/jklxrksR1U+dd7VbaRt
	 4D/o08eZIOHdDp4QuBntNEWEYCSH1cdSfPOGulMw04G2tDOtMiGzh3OFlG0QZ+Qh//Zvr
	 sXbyVz8/0zbx9oWN/NxvHYLVXQ2uHfQEf8YmQHEiaNx9oYomk+9nCWYNR84I6dqs7xGvx
	 V8Hm+AZLV9MIDhDpySlRzU0I0GcDqy11Or9MUkVCotNySK2CmmI4BVzh66pAEJw1rSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=khwmS6IO;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8C8606D803
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C8C8606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=khwmS6IO
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be4fea434bso574099e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793882152; x=1794486952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=viyDdmvwD4U6PS8lafjWT8pU3blZXU6a4uhU+bJMb8s=;
        b=khwmS6IOV7BeOJk5vVOoYILP+8pKH+tWxdl1OMSJ1HVjmXymvCR1SMmwyMCayrilGQ
         IkaDwmalX3igSVne7d0QxuHYEmsMWB9o58OQuOIW8Lle7U+0s7hL2mD97+iQyAkH9BYp
         tN0eybs7YdFMJn8p9exyLKqur9hS/ju8pGGG1eatouTCJQDvUc4Q/VH0vvROLQUdD9Hg
         Oe4z503BqA7YRx3a+Z25EfVok0cDuqAC6EFoA6Ye5xzHvUGaWr2t1fs6uWtO7uYHAb6T
         WA5OTuxtVTyYZtf/7Ecvzco9bmsdxZowRUk88/RyY48V+FNfbBM7tq/8E/TH2g2jROpE
         RgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882152; x=1794486952;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=viyDdmvwD4U6PS8lafjWT8pU3blZXU6a4uhU+bJMb8s=;
        b=aoudvVAHwiC1BujL86DQMMe1VLUPjwdigXBy0hzTyhMA1YIv8scnkG1vk92qlm3B4Q
         tB9sEJp7E/R5j/DJKR8JHj4WYfBDKqiChmosUksGESYU9v2lVm5FZR7TN6kxTovIoaHz
         EEKcIPfTO9I3FCXoOuqGJp1M8pDdf3Q1f8po6fr+djjuX/83+UZsBNrPBkM25MPK9880
         exhC2sS8XtYXmBs8yl/d+iAqLHrYVRwZxMyz4NJTpTOrbGalciNbxr3FialjLphdpIz3
         0ifwTREBPZQC5Qm0IBg9wxDtOgP40skFJYOy2NQEoTP1WpSzpoQK3t9OojQjRQyljx8x
         bMhw==
X-Forwarded-Encrypted: i=1; AKwUvBxZvCrvk4MthLKtWJ7zAWZmdIUDEZVcEr19KIcB5psAPwYVMwcgvl07YBKcAyz2VvGy48tuAaMJMHrN0rU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QbJ1SdBzpfZtlsoAyO+dboxJgOqsWQiTOQj/t9iYi+Ixw2Cb/
	m/m6LPMEgPOGg7F4JwuNYSta9TcMh2qZeeozcdZ7apqbbI9G4hjfCnKYjIovlHjULbE=
X-Gm-Gg: AYBFou1r6zumSKbOm/SeHpsBkTa4mHvLJpAQxQqFTWwqXUeSV6qUOgN/RFmN0CpozNS
	ZQVk7x45xLJ6weXTnM3qk5zy/dWnLBjkBQq2g3jb5ErifbvOc67ZnNfAUhWCUwuqr/bzfQ8e5es
	E/FENn174u+zK/JrQKxHxGBWHtNASI/+4wB9iUHYgnjEjABA7Mvu2HQRm0+o0bGH4ywtYowXs45
	TV+erEBXeeUAjXS0+K/7Y947MYFZVbvnL0Ptj1IIDT1PARRXz9yYEll2JbPdbI0Olrd/vL6AR/o
	8DN226RGGPo26VyepOpTs9VW9VTjrvJsJFB92aYr/uoHyyOGO4jjwmjEQM8JP0Mj8rMxkPwJFNL
	3iMGPXAAK9NmhgtY/gCr+xPb8zIY2fSRIBk8EYIF2WgKGWV172emB3iP6mcvsydVPzT6wzgYdQb
	c5Fv0x1xhcJtKYRLAXbvSvmLm8+3lyWTGynewZ71h5MuVRFJBlzB9BiQN/LX/yq2RFSFDawZ7TD
	Q2LkfyoWELsH084kVSgEYEPufvxxRMKQxG7yzpXuREXF3D+cJcvGP0TYDl0QTHfjFDnoCYhqK+g
	fWXuHwj7R2Ar58smpoDvI+aMzRjW9IiHHl7pXQ0=
X-Received: by 2002:a05:6512:2342:b0:5bf:d738:a5a9 with SMTP id 2adb3069b0e04-5bffa1653b7mr666170e87.22.1793882152273;
        Thu, 05 Nov 2026 04:35:52 -0800 (PST)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38ab878sm806136e87.21.2026.11.05.04.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:35:50 -0800 (PST)
Date: Thu, 5 Nov 2026 13:35:46 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 14/20] attestation: Add the base family specification
 and generated files
Message-ID: <aux4F5Fj1VjSwUb-@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-15-jiri@resnulli.us>
 <179302367452.58760.3782556786585774917.b4-review@b4>
 <auSxxPM5z8BzgNm3@FV6GYCPJ69>
 <20261104175436.GZ3889730@ziepe.ca>
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
In-Reply-To: <20261104175436.GZ3889730@ziepe.ca>

Wed, Nov 04, 2026 at 06:54:36PM +0100, jgg@ziepe.ca wrote:
>On Fri, Oct 30, 2026 at 04:05:13PM +0100, Jiri Pirko wrote:
>> Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
>> 
>> [..]
>> 
>> >> +
>> >> +/* attrs of group cap */
>> >> +#define _CTLV_ATTESTATION_ATTR_CAP(_attr) \
>> >> +	_CTLV_ATTESTATION_ATTR(CTLV_ATTESTATION_GROUP_CAP, _CTLV_ATTESTATION_ATTR_CAP_##_attr)
>> >> +
>> >> +enum _ctlv_attestation_attr_cap {
>> >> +	_CTLV_ATTESTATION_ATTR_CAP_EVIDENCE = 1,
>> >> +	_CTLV_ATTESTATION_ATTR_CAP_MR,
>> >> +	_CTLV_ATTESTATION_ATTR_CAP_MIN_CHALLENGE_LENGTH,
>> >> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_CHALLENGE_LENGTH,
>> >> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_TOTAL_OUTPUT_LENGTH,
>> >> +	_CTLV_ATTESTATION_ATTR_CAP_MR_FLAGS,
>> >> +	_CTLV_ATTESTATION_ATTR_CAP_OBJECT,
>> >> +	_CTLV_ATTESTATION_ATTR_CAP_BLOB_CLASS,
>> >> +	_CTLV_ATTESTATION_ATTR_CAP_FORMAT,
>> >> +	_CTLV_ATTESTATION_ATTR_CAP_REPRESENTATION,
>> >> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_LENGTH,
>> >> +};
>> >> +
>> >> +#define CTLV_ATTESTATION_ATTR_CAP_EVIDENCE _CTLV_ATTESTATION_ATTR_CAP(EVIDENCE)
>> >
>> >I feel like there are too many layers here for a code generator..
>> >
>> >enum ctvl_attestation_attributes {
>> >   CTLV_ATTESTATION_ATTR_CAP_EVIDENCE = CTLV_ATTR(CTLV_FAMILY_ATTESTATION, 2, 1),
>> >}
>> >
>> >Do the intermediate constants add anything?
>> 
>> True. I originally had it like you suggest, I changed to enums to avoid
>> the explicit numbers. But you are right, does not add anything.
>> Changed back.
>
>I was also thinking that having the explicit numbers makes it more
>robust if someone does backport. We should try to have everything
>explicitly numbered in these generated files to prevent subtle errors
>like that.

Okay.
