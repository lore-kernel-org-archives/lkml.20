Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815035;
	b=bEL0Ylxsz1A2a+uXrwPpNmtCL6QoeVB3YPh7vAFjFo+b3BQ2iIC1tO+4hlEBLpnAQ52p
	 B9akx508Ofh7ufRo17kW4BmAiMEmwb5DkVCP4QKlooRAkz1kmxDk3HQ9nuv3bsnupkW+d
	 hd3KrKVfGvnXliEYRjKbTVBxjS4fKp/p+Hw/OhOJ8JCuiHmWsB/qQQ2fFoOpcQtzlnW1j
	 zeM10FaV+K9i8xpIhZRNH01J9ZSfsCz7Y481iByH22j/bu2MU6Jl+Q9MzGXPnETr+0HzY
	 5VDrvLaLyEqhBQgpLptXmvrx+p2hn45MB8Hb2ZJ2qhfuaof5yGUhJWzPGKSeEECd28A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=u6+Lf/8gHZf1IKHjq4H+ss02XIxxzMA/c7y+z6oAgJc=;
	b=GiINncF0pzL4C+krHbTcbLPwIpHNdYK95Dw6fY7JLBtngaNSUKAm0rJIG9OnH76Jno6i
	 DFr0AWehxZJF3vWyrlB8DyI0l9GHppCk49zH078NGS6Piv+nP3wldh5YwNvZIBpSfp8TM
	 OLzkUtlJS/OMFLfR9UMHp2Mb4+qPZvOjjz0OBV7O4NGtdRhMOxwfzmH2tMRLvaavxuoAD
	 5Ml4GIpORZDqBu2jr3RXoFTj6wiZslk+2WfCmgdU5vX86BsmH3H3npMVwi49pk/hgKRGM
	 j2oPgWIQe3vdInc9JEcTjbCB5sg2YRrKv8f6Kt+1aITl8XTqvfgGxLVJOdr+wmIGxKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=jSpTFwGr;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166C1607168C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 166C1607168C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=jSpTFwGr
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-536c8f958d7so7584281cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793815029; x=1794419829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u6+Lf/8gHZf1IKHjq4H+ss02XIxxzMA/c7y+z6oAgJc=;
        b=jSpTFwGrGxYp4V4QZz2ba5dYIoDJJuxWjxKzx8KifYjFiBa0ODGbZD1ZEEW7S/WD0T
         Uh/eSnAdhC0igsZSTinaNwZ4d/bVNxNVLR0SLBhFpcfR//v8TwO6mWhjarmiAGHvyd/R
         eexkK+c4Gy+NJuptHuPNZ54oZFyCFRniuibxorEQrulnSaF5/g4Ne6nK4G/A+pa2SYyO
         6VfYSM9ZMa476+obumWFBoY+RomdwnrNryQ/m7ngxfEuyZ57ZyO3Quffa1K8yWwxMq9m
         PI1/0vFyzZ7alsgF2rxdyGUkXrbSK26XBu/pXg8rzUuwGjiFyUH5CdTcpJmTHMDmmIvS
         oFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815029; x=1794419829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6+Lf/8gHZf1IKHjq4H+ss02XIxxzMA/c7y+z6oAgJc=;
        b=Telyqi5wfeFHDLK2uEy7DKciW5qrCS27ZukmRH8oixzCZ3CgviBX4SdGegtaUx4c/2
         pkBUPtizGnogdMOX0kNGhBOMDCscqT4G2oAo6/CtIVpr0JB91FPYZr7f0adeBer6ZP66
         DwycxxbgZLe8hchQvR3gjhlaIGKFMgn2ZaGxSacsWu7Fue736ivgGM4mWmUCEETDR1Ka
         frwyG5jTY30LCXVtFdz1bzQNyUBgOKeOCoYJeMbwTrVe9q6+vL3rh9HQQDRAxCA4jNc+
         9jzQLV2AVN6RE1+nDEv7FgH6DfIxuDFEiDNfffAM9wTVL4WH7GqabsgbSrTtLVAje5+V
         8HXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPcXK3M7Ko/vbqcD53kJxp+JSghv3794MngBrtXkDz5HrfGWSGw4mRcOwIgEyuwJZ/FMkWORC3pPGYhqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z88JERuwuDl9tl+JEbwRVHD1+e2hC45efcKGbD0S6xi2xv9iBRX
	mEJtUF/0h0AV7O2Mze5aIPk5zHlyCaukMUAtLynFbl+7H3JcteMps+xhvSLQoh/hC4M=
X-Gm-Gg: AYBFou2v/RADagXi6oXsaAO5KdyCcQVeBY/jKCelpsc9qIH6WS7okzpEHq80cR7uk8N
	y8k/KlEhBxR+i5bDNjCMDdPbNdSGffg8G2KX/KkeuKCRcVg9YvvpVz2JuHjM53gTIg7MT3QWLnT
	4QHCmqFZm0y/OLmzOkCFjMatTXyDnOwvXwQYCa6RopdWoKqmNxX54NJIdck+moMWNRSI9u8AoHi
	eeLRdNlLu1M4Y+/+AGJGLbt7sRTnbM/T56iNbwAGpni7Nko9ncSpip4rCCekiy5fmt0xBM7L1Q1
	PQiD8KS8Z2isWSWdKvwwwvaYIfeVCLwBIOO5kvb6PWUwr3hs04jgrdlqcg7XyVo9TpVLDjyxULi
	kyB0cyTqajJ/yhm+nauz5O8BV/8c+yLV/BIjYyJROlP3zydvxlTlYS6SYd7IW8zoZZLDmZJu33S
	P1rne0kwVgA4QnEb8TB/5B+88yVFQ63ECZ+g3BGnsYOrzjrjvgcbFlWtUGlsxyKvQHFv7pTuvW8
	ITcKJ/b33rn3Ui7dpK/CtXJ6heOIxNgwQRMI2hPcZRunxKL4lPNa1a0NdhV26kXuhIWvr8gB8EJ
	Z6kHDmx/3Mn/R1c+1S/X8cs3y/FKJjRX7XwmkyYybfhWVU3086gW4SvvRb8WV9XBW4R7XetUua8
	/YjoQLtiyaA==
X-Received: by 2002:ac8:5f08:0:b0:535:baa:a78d with SMTP id d75a77b69052e-542b3a728c4mr272645741cf.10.1793815029017;
        Wed, 04 Nov 2026 09:57:09 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10a6ca24sm30262291cf.14.2026.11.04.09.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:57:08 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOfER-0000000H210-48gw;
	Wed, 04 Nov 2026 13:57:07 -0400
Date: Wed, 4 Nov 2026 13:57:07 -0400
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
Message-ID: <20261104175707.GA3889730@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-12-jiri@resnulli.us>
 <179302367452.58760.11808905856343064399.b4-review@b4>
 <auRmMPfaFINUIchi@FV6GYCPJ69>
 <20261103010537.GI3889730@ziepe.ca>
 <aumogVKtYnY0QJ2r@FV6GYCPJ69>
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
In-Reply-To: <aumogVKtYnY0QJ2r@FV6GYCPJ69>

On Tue, Nov 03, 2026 at 10:29:45AM +0100, Jiri Pirko wrote:
> Tue, Nov 03, 2026 at 02:05:37AM +0100, jgg@ziepe.ca wrote:
> >On Fri, Oct 30, 2026 at 10:53:11AM +0100, Jiri Pirko wrote:
> >> >So.. how about could we drop the sets, use a direct description of the
> >> >layout and do something else for the ID numbering? Maybe the numbering
> >> >can be solved directly by only listing the names in:
> >> >
> >> >numbering:
> >> >  - device-get.reply
> >> >  - device-get.reply.caps
> >> >  - device-get.caps.evidence
> >> >  -[..]
> >> >
> >> >?
> >> 
> >> I'm still committed to implicit numbering. For "inline records" I
> >> resolved it by having it encoded as a tree with 4 levels:
> >> 
> >>  63         48 47 46 45        32 31  28 27  24 23  20 19  16 15               0
> >> +-------------+-----+------------+------+------+------+------+------------------+
> >> |   family    |kind |   index    |  L1  |  L2  |  L3  |  L4  |      field       |
> >> +-------------+-----+------------+------+------+------+------+------------------+
> >>               |<------------------ record ------------------>|
> >
> >Fascinating idea. Sort of like an oid
> >
> >I guarentee we will run out of bits someday :) I saw recently we ran
> >out of bits in RDMA :\ 3 bits seems like quite a small number..
> 
> Well, this is just for inlines. I think if user comes to the point this
> will not be enough, he can use named record, as he probably should with
> more than 8 inline records anyway :) Also, we can introduce "mapping"
> mechanism to allow inline conversion to named record without breaking
> userspace. I just didn't bother to implement now as it is a theoretical
> problem now as I see it.

Oh OK, thats interesting.

Jason
