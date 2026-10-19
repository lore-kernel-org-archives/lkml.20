Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2758149364C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413748; cv=none; b=HXVMpNFuho1DXCGnoNSgMuWwwKPdn8f11xdrxUuVu3WzTHoMA4ZzcG018TPRI0BDEN0bt4wEcCL65OW6gvWerKVHLthoz1Pgv980c9rKcu83/jEY6V46ZvI5D2IcPwpJhCm/s1ZcFKP6rjDayyzWKvZm+J8cFaAzZvr6TnLkvVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413748; c=relaxed/simple;
	bh=7iJWaNZjgRSi040bMTpFn/A5Npb6/NW/Z7ByvR+hrS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdbXv1EAV71j1n5ttNsoYSRFj19U5ZBFsA8+6JukfkuNC57Kr0pp157v789BxNFpawgBC0dP08lNv6RJ8G2WpwaOKpCipySBjXzjgaxjwbmnR58yh+lEvkNuDOYwEpLNlMC0ob/h36tLCJpicSgFal/8mEqXCrFGWhjXVGwmBf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wkz+rQCe; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wkz+rQCe"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1099188f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792413742; x=1793018542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y7EoCo9+cczE65jwKsEPVDD2E1w/i2GesRReq0VwToI=;
        b=Wkz+rQCeHFgxlm4t08sNEW1k3tSHmpapg/qctvoMT3js2aKN6f53mdWbar7fBL+/tg
         fvDTFGHy8YROADXyJi0yo+4Q7ySw1okqNh0blxRwPFd8ogChwtBtsQdyObhTY9SRkncJ
         fHD3ekIooxi7HTn3K8wvC7OG8MoNRs4Yl4VgpPnKl0UTTvtDa8HaJyxhn4shO32BZAd4
         fl3fxZkUO++UARZc0/XYJSRPsAi9zxK1ZdYHL1U7Mq0zMuDsUhTKnt+IhnPOVbrJoHKH
         J4HhjCRrwDkQ1STW/GaNCu0f+jJzw/H74103JN4ig2sndaoXBPivqxcrSbeQl9cjmNTw
         RXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413742; x=1793018542;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7EoCo9+cczE65jwKsEPVDD2E1w/i2GesRReq0VwToI=;
        b=hRSy6k3qhkSq0swd4PMPv/ZmAvYthgpL7I8WrdlA2QPHa5vrbT8Kk5ayMdyhFROf/I
         Tnqlvio2RY9iCOoDAC6/cEe3UX4jVW40T3/SvuxuqDrdvVAivoqSfX3CcGjCw2Zr9JoC
         rp8u44v/ZsFOb2k1OxMP8vWlhdX/AH1NfKTdOytS3PawGNPI73bRHSGriaaW4ATnV+/l
         Q8EZZCR06U3mFhRTlmgpHtw1raaugz6GLOu90NNxoSY8cFQuPnIlY0BF/6/5ZmXNea5W
         i7zzo9rixPxOSAH0/cuI8rsmpuxKb45EZ+w6YFgTosVv0glIf1AabagufvChLlimRaAr
         c/Cg==
X-Forwarded-Encrypted: i=1; AKwUvByjIJMS0HhK19L9zw8lzJNh3T8i+IATrwvlD67o5xk2CNYsSDlQXh7fVDacFZm1p8nZIrlNQYnk5LQV1ik=@vger.kernel.org
X-Gm-Message-State: AFq9FYLF1tQ4+5WsrEF05sn7pCuGo7bTNxDZXje8nVcJASIGu86lkBzn
	zQuJx0nH8s59Ev8znwl06R9ee+OZBV8BwFX/JvMNblOG5igu7ZZ+bcMjUydLOCWqUQ==
X-Gm-Gg: AYBFou2jHgM2+2LZZYWGH1PubU55k4Q6ib/drDB5X89f0KZUqKyseBI2k9ViPLk1rC4
	r1VtbUeT67ZC9GpyjMkFROMDF+YhSy/OmDzCW9hpe/RazRU7kU7391KhgJdIRTyrnqnt4kkCktL
	W+Gfr5yTE6oLK1OwXSkvSOsUK1zHenXjzS8chXWTSdPN2LHaIuUJw8TAWm/MWi4Mzke/GAogKk3
	qo2NUG6+8FcDe2f/q6yVsexNq584xPb5CKvGpjF/iSFtTvfeM3/0zFxhzLH55xyAuo2WZTrviS8
	6mMSSySi5L9SY6yjRWeIa3ueu7uYkprtJil/16pCljD84UVSrLfEMHsrG0lYzexUFfq84FHdspg
	5UcRkHP+EiHFy6TkElHbfmTUAN8A9vqmk3g9PA2ueavSdcvFQWOA+LbE2YlRMmfvIqhAfxOQ4yo
	RWJwZLaioGSNw43Fewm7//XfZLbYaBWwSp/Pg/XkYwgmd9wgUrbxImrv2wSxXSu6NAZXCsBRjaJ
	bGTCjWoFAH9U794eEGTs5jDxK6fhj+QkJG0BxX5JD0=
X-Received: by 2002:a5d:4904:0:b0:488:7787:469d with SMTP id ffacd0b85a97d-48e07fbbf4emr11756626f8f.25.1792413741500;
        Mon, 19 Oct 2026 05:42:21 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a0dsm23717496f8f.47.2026.10.19.05.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:42:20 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:42:17 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: Ensure TLBs and I-cache are private to
 each vCPU in pKVM
Message-ID: <atYQKaLo4VJDoNJn@google.com>
References: <20261014125510.2928306-1-fuad.tabba@linux.dev>
 <20261014125510.2928306-3-fuad.tabba@linux.dev>
 <atXqLxU5bBtJ8U9W@google.com>
 <20261019114357.3528498-1-fuad.tabba@linux.dev>
 <atYPZeJuw2grFDlz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atYPZeJuw2grFDlz@google.com>

On Mon, Oct 19, 2026 at 01:39:01PM +0100, Vincent Donnefort wrote:
> On Mon, Oct 19, 2026 at 12:43:57PM +0100, Fuad Tabba wrote:
> > Hi Vincent,
> > 
> > On Mon, 19 Oct 2026 11:00:15 +0100, Vincent Donnefort <vdonnefort@google.com> wrote:
> > [...]
> > > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > [...]
> > > > @@ -54,6 +54,9 @@ struct pkvm_hyp_vm {
> > > >          unsigned short refcount;
> > > >          hyp_spinlock_t lock;
> > > >  
> > > > +        /* Per physical CPU, the vcpu_idx of the last vCPU of this VM loaded there. */
> > > > +        int *last_vcpu_ran;
> > > 
> > > Unlikely to be a problem in pratice, but vcpu_idx is "unsigned int". I wonder if
> > > this shouldn't be unsigned int here too and initialised to UINT_MAX?
> > 
> > I'd copied int and -1 from the host's mmu->last_vcpu_ran, but the
> > vcpu_idx it's comparing against here is unsigned int, so I'll switch to
> > unsigned int and UINT_MAX in v2.
> > 
> > Thanks,
> > /fuad
> 
> Also,
> 
> as it is always allocated when pkvm_hyp_vm is, Would it make sense to add this
> to pkvm_get_hyp_vm_size() instead of allocating separately?
> 
> -- 
> Vincent

Ha, I just saw your answer to Marc and you will switch to a per-cpu approach
anyway it seems?

-- 
Vincent
