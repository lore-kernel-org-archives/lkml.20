Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792666479;
	b=XouB8WJE0ZhmJ3V6nnzM8QIiJOYfOT/tCN5hb++JZ0wYq/2M3oTq9Dc4crUIRDkuiM3Q
	 pjeLba0aPQtnE1nNAWsTkxorDgPB9Wp+6mTlaiFs4sTYQKEQbTbD7/DL9+Hh7bKWDkr97
	 pBzRcm9wRjQU1W3YZp0C/sm1zrj1cT+rPMhRzDC402plbuw1N2cZIulmPtBfaT/OH7IqQ
	 kGi6xkmx/KHE1O8blx21uWpjupvZZm8E3IQHaSQkF5BfDgqozZPAUM4Xk5m4vB3kkjxnJ
	 uJd9z3vF+uUhMNrMoK3ROu56D9Ewbwwpm8xkkUCydBXH4gpmL9zu4NbiHDZSPc5mZeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wsdeMYd/7eLXCr9Ufg4dZ6+EW6LYxWJjZpkMLdZ1OLI=;
	b=J0WUftom2LAAYgWYJr0twrrANimELt3Yn+LceKdQWOj++llv7Den6j0cHylcuxXbHghE
	 qhhc9/A1a1xRX1+7KK8cb0HrXftE/SBt2lk1yZf7/lVXU3TB24UXSEJ6B1GbGdu765CAj
	 aGYQnqg0yoomYsFTxgaWa4CSOu14iV70O7FJfSKv3OxqCYkRbkPc784cWHIfwBzQEUIcY
	 bfY28d56CUrXyLkFKw0SBH22P+romMNY5B+d4QfybnpcTvcyEddiqLV2tVt6aBHz/q7J8
	 huRvy1f4JfEyE9bksWSFz0enY1TnwJNlaB2wT/MHYwBFOF/AfBzMD/unGmTZlOCI2LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=iVzM+4Wh;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08058606A327
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08058606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=iVzM+4Wh
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e04773687so652967f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792666476; x=1793271276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wsdeMYd/7eLXCr9Ufg4dZ6+EW6LYxWJjZpkMLdZ1OLI=;
        b=iVzM+4Wh7gDZgzymw32x+37naO3wz4NgCsioUd0xXmmYJLxHde730j8vwEBFHOigDt
         spQz+0mFByaQFwaDUr0c2ae1SeHnkPpIIUiMHP/cu/tOLU497pMtVgSh3Oe97yRxau59
         1+aFiEk/doEVxAUQ4uQi5J3n037VefaeLSYfEBVYI0ezdQtHblQfteC+MpB14t0Yb02b
         crjq4VN8tYFrfN5YMd66+KGrNKNSCqW3QnCUx8AtGlqCodiHQpo5792+KihYy5FXZLYH
         ZumXm9uvYooJDFh1wBcflp8vYOWr5d2vJQZRxljy7S6k5IwMbVTRod9BghghqnSJwFlZ
         satA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792666476; x=1793271276;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wsdeMYd/7eLXCr9Ufg4dZ6+EW6LYxWJjZpkMLdZ1OLI=;
        b=aL492HVZ1OMvot56ncBvhARYui9NFmKjxf76gxF8KxaYO+S8kc5ojAVoTqzYwgvDji
         GIy+Xfqwp1AzO+an7SIXdydlvKvyT1DFTLFD4jVqDX87DjPNQh1MNDo9OPoAAsLdXYu/
         +fnmiGxzt+7MWPDWzvDYKcYe2HlZa8D5lmICY+nMUFFhCwT8f7d40pcRI1/dt7Q/TAm4
         GSRz58wTOpUauYFFk3OnKsXFZcyfWmGkudb1a+rkksSjUqUQhw1KSu5uKiOuS9gSzEIv
         vRQn3vEQstYmCTZ62nt43GHY2/oKlkF+bp01JvqBXRiFS8A2wjDRt2S62ijO9YwOGRuo
         VtLg==
X-Forwarded-Encrypted: i=1; AKwUvBz211yRG+nO1JkN9SRxTQ9OZ/5OOAFjCrq7747hKDJeYS1/ZA0HfsK2goBg0ZUVNQPkt1d9CPrrj5umajE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4DqBLHwT8iUP3HoV5LL7V5+81aapP6SG7R8pnbJAzBy9gxLjP
	df5fF1aUfYKPppT8tE7LbCyjXQx2cA5OpFLVJwv411eovGxB0NqFXVZKWpwfuJwjVNE=
X-Gm-Gg: AYBFou1qyqaw8ddoexrf01OeZJbzx3YszDOeE9C83spBljGVWWUREFqUjwJb6ep7krY
	yUiRa4QOrf93beiE/v1sLg39EnS51I3LtwyZd00lKAfN2RXHzCNuSycmyYD0L5auwYKqmRMON6F
	HXWPlCTIvcnBSorNP8srjhniHhMekC8HQqSRWHo6VyILCTKkP/9XC4itf+AHZZEnpqwomJPFYj2
	nTGOdiMvzMVTdcPHbKIEHJXAiikX+ERA/uYAs5e+OfNAE852mkgVCSKdI4plxpeo6t8Ol2pBrf7
	CbHZwgGHC76d+j68f+c5i0XxhDxkXd4gfzxa9+64d3qALPtRuy7JYQFn47ghAbTvv9ko1vAyvcY
	qkUf07kna/3i1YSXV/CzTRvWRaRIYVNTJ0g4yVwE1nWx5nB9iEIGn60Roi1z7qFe7J0yXXXUzpW
	2qyIiWZBZyszUd8RvXPc9hETztAya8lZIPCe9BAISCROe9CkJSXCmfaaPrs+NoQ0CE7r531zTmT
	W/t6AdqclrR4AD9sswwz0ob6nQsTz0wVhwFxlC0XdPucAKAqDt9QhzPPS9Mj+6Je+Q=
X-Received: by 2002:a05:6000:288e:b0:485:8cc8:1f5f with SMTP id ffacd0b85a97d-48e264a1f81mr10449260f8f.42.1792666476063;
        Thu, 22 Oct 2026 03:54:36 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583522esm11890881f8f.35.2026.10.22.03.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:54:35 -0700 (PDT)
Date: Thu, 22 Oct 2026 12:54:30 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Dionna Glaze <drdeeglaze@gmail.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, James.Bottomley@hansenpartnership.com, 
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com, 
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com, roberto.sassu@huawei.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <atnqmDhgaJycTf_Q@FV6GYCPJ69>
References: <atPgqROZZxnihYfC@kernel.org>
 <20261017231007.GP13920@nvidia.com>
 <CANwfdvVJRv6++MJ8OCUnHSR_5nVD8Yv6eTmYxxqfzxEk0sNfpA@mail.gmail.com>
 <atX9fugGUsI0hGcA@FV6GYCPJ69>
 <CANwfdvUhuQ6L+w+91iDZD=diMmaJ6_2ZsFKkcoiKWOmPMC1oKg@mail.gmail.com>
 <20261019225658.GS13920@nvidia.com>
 <ath4vwt7KGyDXKVJ@FV6GYCPJ69>
 <103486a4a29ecc7b72940dd051c00ae59266bd05.camel@linux.ibm.com>
 <20261021143529.GP3008132@nvidia.com>
 <8d8833fac61558a94af415143530884349584a2f.camel@linux.ibm.com>
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
In-Reply-To: <8d8833fac61558a94af415143530884349584a2f.camel@linux.ibm.com>

Wed, Oct 21, 2026 at 09:05:09PM +0200, zohar@linux.ibm.com wrote:
>On Wed, 2026-10-21 at 11:35 -0300, Jason Gunthorpe wrote:
>> On Wed, Oct 21, 2026 at 10:12:34AM -0400, Mimi Zohar wrote:
>> > > > I think for now we should not include a new dynamic log here, the uAPI
>> > > > around this Jiri drafted can remain a future step. I don't want to
>> > > > open complicated discussions about new functionality at this
>> > > > stage. The whole CTLV idea in general is a big enough thing to bite
>> > > > off for this series.
>> > > 
>> > > Okay, dropping the log from this set.
>> > 
>> > Thank you.  Please keep in mind going forward, that the scarce hardware register
>> > limitation (like the 4 TDX RTMRs) should be resolved (e.g. by multiplexing the
>> > extension path), not by combining distinct measurement lists.
>> 
>> I'm not sure what you mean?
>> 
>> Since the HW doesn't support sealing the only *technical* requirement
>> is the verifier can reproduce the measurement register hash. So long
>> as we can get there we can do whatever.
>> 
>> Multiplexing extension alone isn't enough. We need some scheme to
>> reconstruct interleaved logs too.
>> 
>> For example we could add an atomic sequence number for each
>> extend. Every log sharing a register can report the sequence
>> number. The verifier would have to globally sort all logs to confirm
>> the hash.
>> 
>> Hopefully we don't have to tackle this problem. I hope that 4
>> registers is enough for Linux. One for IMA, one for systemd, one for
>> user? Plus a spare!
>
>Agreed, I hope you don't have to tackle it either.
>
>> 
>> Maybe we can build a multiplexed scheme on the spare? I don't know.
>
>To avoid interleaving the logs, AI had suggested multiplexing or virtualization
>of the RTMRs.  Whether is has any merit, I'll leave to you.  Here's the very
>short AI explanation:
>
>"Instead of allowing external drivers or subsystems to execute a direct, raw
>extend command to a specific hardware register index, the new attestation
>subsystem should act as a Hypervisor for Registers."

Isn't the hypervisor what we are doing now? I mean multiple extension
originators share the same register and eventually the same log. Or do
you suggest to go even further having a "generic_registerX" exposed for
every hw implementation allowing the user to have full abstraction?
The "generic_registerX" would be always alias to something hw specific,
like RTMR2 for example of TDX.


>
>> 
>> But we almost certainly need to have logs sequentially created in time
>> occupying the same register. Ie IMA may take over the register from
>> UEFI logging. Here we'd want to report the start/end hash values of
>> the logs back to userspace so the verifier can stitch the order back
>> together.
>> 
>> It would also be nice to think about a way to restrict the registers
>> to help avoid multi-user conflicts from misconfiguration.
>
>That would definitely be a plus.
>
>Mimi
