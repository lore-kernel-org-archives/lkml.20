Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667941;
	b=hHC4Ail+CTzMZKUcHG4YXzLsjPHYvAxFBe9u5fKiF6czt8IRCxIEXbu0ES7l/UnGRurx
	 f7FQNu3ZD1eLnoNx1sS+FBR+Ad6DCZsnHyatVI1bwyxlMn/DdXCLfldt2LsvwooWDzYRf
	 XwqZrAUJPyCQfsPvssXgt6lvlabqsX9ROeYoEuYwlmJdNdGnziaT+bi6EetUPNPtUaXnl
	 hgOYxwDmYk8exaORaW0RNB2OXT7UIKdyp1j3iRCRsgsJcv5deNLvAGcNs/JXJeXK8g24q
	 2kyGS5Wb4gs7eY64ADWHsvcODSld2yxCQtnN/EUuB4+Via5dpNicIbkq7gLtOQw0BHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Qv+EdtqMB+XL1xqO+2Rl4b1uStrdgvx9BftdNrlvlQs=;
	b=gMq+xs/8qXDQxQBF7NK6jklpJIlp6seaLhE3DymU5/R0znsQuMNmk+YBRhtIk6TQI8g8
	 hK1iwLxVj4p2uZOm/dmz3rwiHCX2fSx/dW0NNgrohQ1dcubFphiYCVzbl5nDBoEdOPK6i
	 jYo1seBxLHkIO+YaY1to4NT/0syPMq0LAksCJXdJ72keR/5gwLLXs3sE53OoV+mHDQV99
	 sHIw5RF6tA7j7w53ZxaYXz1cV1sehpSaxRteNFFtxD6K0vIznllvHKovERZS3A2fW5mjz
	 cJzCWBmH43kFWz/4zRCaAC3mUGTnk0/1RaxNSk+R+EyPJt2PKzh0ermgdzqs+Dl227Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=pUb0rNHx;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B13606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B13606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=pUb0rNHx
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53653e30353so63242321cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793667939; x=1794272739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qv+EdtqMB+XL1xqO+2Rl4b1uStrdgvx9BftdNrlvlQs=;
        b=pUb0rNHxiAU+LF8DVe0ZniHMW9XjI2QNJZUDuVtuZyauhWJ9JcYl8XRJUwP1m23NN5
         YhOjwo0TjD9eLE6c+GNdgdirH4NqQys6UuF4s1ak2aBWg+qYGy0UdkpqSeNSUH+pazVY
         djyuyvx4EOAdRDVN8Xijkdq2CFi+TXuMFmjrHrjS/MOHZgGCyI+rcXQ0JE0PS/Vit8ih
         SIRs5HGehq5NrqF2hE9UIkltDBQeI+OydffKxerZZONTbpFg4+FAFMsEp59NIGXCq3aI
         XaSYJO67edsrOWUfFASBvHIFuWYkMwgs7x8IENEGhSDJcl0V26I7CvXK7rKdPcK8adU8
         26Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667939; x=1794272739;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qv+EdtqMB+XL1xqO+2Rl4b1uStrdgvx9BftdNrlvlQs=;
        b=aguvv1DBz7B9vlCtx7A6G2k+y1m5QZY+n7Tg5eDedxOad8mZPKPYn8J/H9zp1ePVu0
         ZtlUuz7E5S/hN7GJ1HD6X9LrvVHMqcp8sj8sBbATv997YxDTSoZ0OP3bm/3OPO9lH2Ny
         tQ5m0PAWYIVUpdTG4ic2bD545X+dz8MvfgvNCjzxwhdOaCeNjjhr1PDdaH7SzKzIa7Bw
         YrF3CDff4tY8ylTDDupJUraOEvfSIjSOdwvnrE2xeT+q57numPa3WvN4xhWDVq5ElPoc
         oWhJo7WF7uPbI7utI4c254cKc3C9SIUerAXw3kUW8RnAS7BKHxiDfbIhkMoL7NNwotf1
         1Scw==
X-Forwarded-Encrypted: i=1; AKwUvBzwmhjc9IIBah0VQCZf20RSxvE1uwilx2iQMdapwBFH92nk62Qphj5bQKrtqeVJvMKcrmMlyO4OM6/8hxk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SD/EBa1vZDUd8tMHhg5zdaYaq08iLfiBowZtCphkBM6tQpnEI
	FMRkCn2fE2+t1/3eFFHq8lfLA3DLIiYk3saIqYthHh6W3MPDV5ykDF92vxwm7HvUKSI=
X-Gm-Gg: AYBFou0SYN3X5nUEasPPkZ1N8uhVuTC+W/r5RB7tRPlKjCTZCP69fSQkmMrt6lcgwDt
	s5k0xxKgj1CadYNcR8fBdguW/+GImag6j3chax8QC5samhcvfoxbgavPKfOUPJ2HS5tpGADjclq
	7eI+xUVhKFGFwHtXUSRWeOEeJ61EaEeO2kdAxrLb5HTmH8YSv0ZzqP1Etrz1M/VjiVPEDd5vo0r
	4qBoJTdl8Or+BPQU7vgyQeN4Lg0jG0cx+Imm6PZR+BvSGn2T1ftUQHVJlEjHj67jL3nzLF8pGrh
	Iwq4t8MsR4cEa+YM5i1K+2XFTTI8I6RHVRCRXsoXXSTvUHvzAVgSHMNLEONZFBpt8iNOjqUkUeO
	ywQdALduk9sbwBueptNZ6XtjMMthQB5RcxLDj8wHd69V7iokWYhQq3U6SzW1nJselClBlPRBF9P
	21BhjoGxpNUZJZ4HPXIEmn/j/ima462ORnTtdbIPKMUcbo+tbGOqi457Yxyh7VaAFJPQ/A6dBE5
	Gu6QgmlePqE7Q1DQk0QZaWhArZ1rdl7Yq6NVP169UuFSgE3uXTAubR44smZGeYUwYoUXZrGblC3
	NSXy1gjZz4Fyw3+JZqyINrHMTdp0ypblLTWaF549awSTBGZPWhX4+6AKJtsjQ/BSTTr+RNOBL67
	lTKI3LIuR2A==
X-Received: by 2002:a05:622a:4017:b0:536:64f4:45e with SMTP id d75a77b69052e-542b7525e13mr187886741cf.50.1793667939125;
        Mon, 02 Nov 2026 17:05:39 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5498cb57669sm12221861cf.24.2026.11.02.17.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:05:38 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xO2y1-0000000BIml-2jCU;
	Mon, 02 Nov 2026 21:05:37 -0400
Date: Mon, 2 Nov 2026 21:05:37 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de,
	ksinyuk@kernel.org, rodrigo.vivi@intel.com, cedric.xing@intel.com,
	sameo@meta.com, drdeeglaze@gmail.com,
	James.Bottomley@hansenpartnership.com, aik@amd.com,
	jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com,
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 11/20] ctlv: Prepare runtime introspection
Message-ID: <20261103010537.GI3889730@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-12-jiri@resnulli.us>
 <179302367452.58760.11808905856343064399.b4-review@b4>
 <auRmMPfaFINUIchi@FV6GYCPJ69>
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
In-Reply-To: <auRmMPfaFINUIchi@FV6GYCPJ69>

On Fri, Oct 30, 2026 at 10:53:11AM +0100, Jiri Pirko wrote:
> >So.. how about could we drop the sets, use a direct description of the
> >layout and do something else for the ID numbering? Maybe the numbering
> >can be solved directly by only listing the names in:
> >
> >numbering:
> >  - device-get.reply
> >  - device-get.reply.caps
> >  - device-get.caps.evidence
> >  -[..]
> >
> >?
> 
> I'm still committed to implicit numbering. For "inline records" I
> resolved it by having it encoded as a tree with 4 levels:
> 
>  63         48 47 46 45        32 31  28 27  24 23  20 19  16 15               0
> +-------------+-----+------------+------+------+------+------+------------------+
> |   family    |kind |   index    |  L1  |  L2  |  L3  |  L4  |      field       |
> +-------------+-----+------------+------+------+------+------+------------------+
>               |<------------------ record ------------------>|

Fascinating idea. Sort of like an oid

I guarentee we will run out of bits someday :) I saw recently we ran
out of bits in RDMA :\ 3 bits seems like quite a small number..

Maybe increasing op to 128 bits?

Maybe family/kind/index/field spread over the first 64 and then the
Lx's over the second?

At the very least there should be an escape hatch so that if this
becomes too small there is a way to opt into some new layout and fix
it without breaking everything.

Jason
