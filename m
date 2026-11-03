Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698199;
	b=JOuHfAm1n6MYBd5q7F39PJhs8uIimZ/vkVb8C65POozL2FE+EfaxSSPndMrfMUbtrvmB
	 1FaZU/XwdimIDlx5GTmKPuin93PhPBpdIYcQnlbOc6nxG7ULdTpvP3pPQmqN8M0EgI/LH
	 PTOVhaW/xAd9maDbjRgR+UTvrgWg8VqULh2l92NrEm2dU1UZBCwDf2rkGPk3ryJsXFj+3
	 KZrDsWXzSDmz0ZvyiuF037+cWzVXbVWjaJqemEXVD99Wg5y7pWwTEhNTVQ+rnOp3OyjOX
	 uU0SoguhY5Rpovp2bJc7KlRxj8Q/rVNhYhEVkOMEKY1A/YtxbnO7TfOB1NxTa1CRt5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CkFM9E5nfWdnLbDGQzZA+rThnrcRob04z1+EqW99MTE=;
	b=UtW6++jW8oQEn8syk7AHeGwRujYybXgi7toR+l5jyDxrTa7kBp7YeelegtnqpNofWXLS
	 xiKqPvbHq5Z2+7yOpz3izy7w7maU5TNogdd3kRhJ+erPgNO+mP+QNF78qTTQOd2jnuhIR
	 fdi6n9dZGcL2Yeq7piqdtSUc/XnyepWPSAGQuR6eMJWmw7qrOSSgPDyE5lElHomINSD08
	 ouSHTt6PfTW4O8VXoG93nlUIr2sAkvv0Mudv7YGXSITyLprnXwxHM9ECJdSak0uGOqs2O
	 Gh+OMgZsI0gEgYP+fpUWWvgp/fvT/zKis+KUUH5KMwBy0DbzByMnkNGa4+idzt/0qAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D757606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D757606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so4040792f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793698191; x=1794302991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CkFM9E5nfWdnLbDGQzZA+rThnrcRob04z1+EqW99MTE=;
        b=nD17MX4VzW88+nrnz9SgdcaYPQcOIkfh/S0yrXnMfUgiGGl0fkKSlltWyjDbQPyYMJ
         eyJkJVCpvVbC4gP0OT8sEk1TVUj+BlCLU49pQgURFggfuzWLnbpspFwvtmXmiSM7p97k
         Avk1+QdCZOKyymL8Xg/4fiDOAl4JzMdXU+h4yuR2KLxssHGZ1M6W1XKjWStlpIxt+gQG
         EFvhWnv2HNS5oUqS9tj0RFT7ennBps/r5yNAsEvJLGB++paTLGgKMOvxgHjaZHrL2mF/
         ShzDEeNLBnaPa9J3paZGOvdsYyNmHo4uMXZnKOLeuiZJYrrkShVMAtnqhblAA5vTMEZM
         xpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698191; x=1794302991;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CkFM9E5nfWdnLbDGQzZA+rThnrcRob04z1+EqW99MTE=;
        b=MttxrZa5I0uYD99VPjIpEu1i4HPRSLtwsWrbE/2HiEkDDikoLsCYBasY+39DfIGxF7
         vHQ0zmtpcID4dy31aQyfzsX8E6daekry1rPaBzHG1bqRUNy39Iy0DgWkfcfyBF8AHdPX
         7IfLetFHAHH5GUWZgGJQIJ7pVFY9GOm2FXr+L8HHLSKuXF60Q54nPLOky1IO2KAxAYmk
         ftf4HMsnnzI3e8wtBk+ycP6/yg36DU/eyitOpNWOcpdHPFi8VlnkrFGfIXHbi001Ls7k
         b0v5M1WqjhqqISiTfVdfKHDFbBbHzgA9xEa1TvDp+r2F2g50OHzR3F0Qf4tZ2wB/xzq6
         9h5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwpiJ14nUYWMlI4ko+NRBc9ZuP51sOHescyn4syPChbr0r3i0Jn2uKD4Rt1vT59B/q0l5il/lC/+YMQHDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bbGMgqnVQxJbCti7CFJjwCrWYiqtOoAf/rlYAPFGjiM5VJans
	ca89DCHzwA57yBR/ti1PJn3pyJfmg0C3MuKbE1yCG8uXc3Kaxoiq/tXHKoBW2uV2BeU=
X-Gm-Gg: AYBFou26mYA079zCgJnYGbekhfVnE8e5vlWGD5+qEYaww/rKBuCEGZ2ybAb+2SrV+tQ
	p7cE0d3KhUoYgnPP8LWNk851IQrWE5s2lrJwO5QbDhXglnR/3eSp5tbSUA0aby6yoFpYIwW2IO/
	lGefnBHxyqiAVMKPbl2UDENy3AGtfsbWDdGbJe+G+7W2PA12PgNk2fvEqm3LvcXTQLecYwggTd7
	ZHZ946tejlkYfX8gSGRvG4zBiDnC+BM2D6DXmrHfy9o4DdHw8Bxywk35F58o5Vpo6IDfJSoJMm7
	5GcCrq9Q8ZowEnDK+2hld0HHV/y4H9dA//hshwSOI6vygGCsi+SRNOIdDx9oC5RQBoFgXq8B9/7
	ShXSK7VZIK1GvqSL72PDc8VSbzMb4omXP90hdqU7ywd1cPhyiSJVizGWP05QovtOzYCbvI+FK9O
	qC7QaqdY6vUK9x+73dQNbCz2V8vU3QFyQ41VndP/43eY7MpLRVQaxIymilAWa78fYzJdC2cuiyc
	e1UHddh1mmF9Z2QMOy9oeeE2sNjsCDUBJs8/z7p0ZdxNmNI+AdeHSs3d5IJ8MmKVbVY3JwBC+id
	msS7wYJn9eAcrld8i1vKf3zUweyVfpBfdipa
X-Received: by 2002:a05:6000:26c1:b0:48e:870:7791 with SMTP id ffacd0b85a97d-48e6e30b824mr25816174f8f.26.1793698190820;
        Tue, 03 Nov 2026 01:29:50 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm25441683f8f.34.2026.11.03.01.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:29:50 -0800 (PST)
Date: Tue, 3 Nov 2026 10:29:45 +0100
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
Subject: Re: [PATCH RFC 11/20] ctlv: Prepare runtime introspection
Message-ID: <aumogVKtYnY0QJ2r@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-12-jiri@resnulli.us>
 <179302367452.58760.11808905856343064399.b4-review@b4>
 <auRmMPfaFINUIchi@FV6GYCPJ69>
 <20261103010537.GI3889730@ziepe.ca>
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
In-Reply-To: <20261103010537.GI3889730@ziepe.ca>

Tue, Nov 03, 2026 at 02:05:37AM +0100, jgg@ziepe.ca wrote:
>On Fri, Oct 30, 2026 at 10:53:11AM +0100, Jiri Pirko wrote:
>> >So.. how about could we drop the sets, use a direct description of the
>> >layout and do something else for the ID numbering? Maybe the numbering
>> >can be solved directly by only listing the names in:
>> >
>> >numbering:
>> >  - device-get.reply
>> >  - device-get.reply.caps
>> >  - device-get.caps.evidence
>> >  -[..]
>> >
>> >?
>> 
>> I'm still committed to implicit numbering. For "inline records" I
>> resolved it by having it encoded as a tree with 4 levels:
>> 
>>  63         48 47 46 45        32 31  28 27  24 23  20 19  16 15               0
>> +-------------+-----+------------+------+------+------+------+------------------+
>> |   family    |kind |   index    |  L1  |  L2  |  L3  |  L4  |      field       |
>> +-------------+-----+------------+------+------+------+------+------------------+
>>               |<------------------ record ------------------>|
>
>Fascinating idea. Sort of like an oid
>
>I guarentee we will run out of bits someday :) I saw recently we ran
>out of bits in RDMA :\ 3 bits seems like quite a small number..

Well, this is just for inlines. I think if user comes to the point this
will not be enough, he can use named record, as he probably should with
more than 8 inline records anyway :) Also, we can introduce "mapping"
mechanism to allow inline conversion to named record without breaking
userspace. I just didn't bother to implement now as it is a theoretical
problem now as I see it.


>
>Maybe increasing op to 128 bits?
>
>Maybe family/kind/index/field spread over the first 64 and then the
>Lx's over the second?
>
>At the very least there should be an escape hatch so that if this
>becomes too small there is a way to opt into some new layout and fix
>it without breaking everything.
>
>Jason
