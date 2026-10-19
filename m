Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21134F3921
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413557; cv=none; b=Fh0cYPK509Q2pm0bj+RFvw3DSqsFRaLAI+Zuk5iZ6WiNGWgL1XvfUdiC2HlYdaW8AwA8A0JtqhCvCBLtQtyEvQ3E5X6ZtrFrdb6sxH+zAK2GkCUn/t2oj0dUXjzJ7kSNizz4E6GqPo/E36ZgfF6oLPDL36DtMNQRfVBuketLjxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413557; c=relaxed/simple;
	bh=TIpwsXEtH/kqw15lohv1lzbLaGX2CVOAovNsREW9MmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCDaral2LBw0aMDNsZ+95tTHTCpNtR1nhD9RP/8EiI+KR51a8b3PyL+gvlwhVME7tXxYlCAVOfh3cURAYwgKyR7PfnE0uNodSV6teEWFByvaphG99wFhKCg5SeTZAmIg5a76wRyd+3/ZnYN+RAOfTQ+a//ZglbxywaBEk1knOQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZOme2roE; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZOme2roE"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1e1dade31so8608485e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792413546; x=1793018346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TGmjTl0WYTodj16FKC7BqXqbPxH6xsiMEijaRRuXBds=;
        b=ZOme2roEazhFOZKl6BZ37bYCUueaJHV36njgTXgWf7iYIZOdB68926Ip84mxsjHeFm
         reLyJ9vqKbJHrXVwldH98MEW7HNkSH9USTQj9Ii42+GTGub14OzcbUHL8Ysa72/2YwjK
         TrXYYDXdufvBjMXVRP7CS/21HZ9KyLf14sv48VoAgapWKP3mWM5nrznIW+/TEdVquC6b
         bIMoTuQ6QmUfJxl+KlwGLbqr4GrX0EfUKG74WrkWateIKZJWVYN4fSX9ZipmSXmKLkwT
         sGldKOVgADR3e/+/TG0+Fb0WzxMJieqJfMI+nnTXchXyQgoJqrkc/TQGlO4AyjYykxa3
         DNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413546; x=1793018346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TGmjTl0WYTodj16FKC7BqXqbPxH6xsiMEijaRRuXBds=;
        b=nZUo+Il347yjK+Uiu1f5cwmi6fqya51KiOO8emkuLb5rxgbUUnTVhIeOIyAPrirtJC
         +405lZnx+jAPuIMoa/HpHm7x3lw/Xr/4Xjtg2jBOvxQqh/SbeCtcX8RTfY81CHnxfrcK
         JGesc24zLP6B3GCrvifai0rhWsC5H8ayEXQkvo6AFToOmhDWxTzWW1UlMLT5ee91Bqgh
         JCnfmyBkZ68YDjk5nZQ0Tyl3s3nWnlyGT0l8PxyHrd3tJ1BP8WWEZuE4vtuKOQRGyGPA
         3J8teZgxGohF9W8I2yieKX1kGfvURw+Xw4WbSSbgZahkt18QGXc5ELtZF3wYFYS3i/hn
         sR/Q==
X-Forwarded-Encrypted: i=1; AKwUvByZWGS9XmP2cRyaZ5eL11854FVw9uyxdV+mKOgti2irRR24+TTR1mGSE/t0ywTPYMLYqv5jYr37AYjBtYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlhPvh/USak6R3gr+5Y6HTdJK8AljagoL1T5bkz4hUmIHDreeI
	gjuEEjvZqJL2lBMpScBAZgvltO3oEeKYnovymTBllnMM2CdjXK55KZ99JywfbXuRRQ==
X-Gm-Gg: AYBFou1rDU3v3HgVgbuTxYpcE6uqg2wPKH90urrDdKqyfe6lHIbLKU35GRkXUEw3Guu
	W6hEccuYTaQExcTMLcdXZNe49hbeCLapk7C1N30Hm42Xi4A3r63ZUCcTT1fR8HW/W2dLFFBTeBf
	bxWCcgduVEfqOk8yhMcmL3YK+5tn9WT0e0CRpCLFLIebA7YOS7sJX7jbK5hBRzeSvi8MP7A3nsc
	et32oWG3DXKtJ5uzjMdIMoTRc1U1baT/2vNxiu9msGTd63+wLwgA29sMXhbt+K6c63VAmVNZAYI
	E1ppk9BadOJ9DZZxNOo3RHilLC5lrdQwb7c05FXlw0Hp686HIJ7SdY4rizYMYNDRMnGf+4V3PlW
	kdVLaM0vREHk6DHXoOhszWiW/hlZH6L6Z1o+fznllCV9nE9zSqr1+tyJycHajnGm5FJsCglGEmb
	bypaTQ0Ij7B9UlljUYphaAUA47iQiGjoEQ0WpVqNNz13V5JEN4i6JLmMc3BwcEi7ln+6s7pHXhS
	gqhX+pqSR7eI0KgqRo0Zbht6atZYNjOSPHSR1cGOMNcISapn0AMzg==
X-Received: by 2002:a05:600c:a417:b0:4a1:efd3:987a with SMTP id 5b1f17b1804b1-4a1efd39a78mr14321995e9.6.1792413545350;
        Mon, 19 Oct 2026 05:39:05 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d85f92d9sm199554545e9.4.2026.10.19.05.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:39:04 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:39:01 +0100
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
Message-ID: <atYPZeJuw2grFDlz@google.com>
References: <20261014125510.2928306-1-fuad.tabba@linux.dev>
 <20261014125510.2928306-3-fuad.tabba@linux.dev>
 <atXqLxU5bBtJ8U9W@google.com>
 <20261019114357.3528498-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019114357.3528498-1-fuad.tabba@linux.dev>

On Mon, Oct 19, 2026 at 12:43:57PM +0100, Fuad Tabba wrote:
> Hi Vincent,
> 
> On Mon, 19 Oct 2026 11:00:15 +0100, Vincent Donnefort <vdonnefort@google.com> wrote:
> [...]
> > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> [...]
> > > @@ -54,6 +54,9 @@ struct pkvm_hyp_vm {
> > >          unsigned short refcount;
> > >          hyp_spinlock_t lock;
> > >  
> > > +        /* Per physical CPU, the vcpu_idx of the last vCPU of this VM loaded there. */
> > > +        int *last_vcpu_ran;
> > 
> > Unlikely to be a problem in pratice, but vcpu_idx is "unsigned int". I wonder if
> > this shouldn't be unsigned int here too and initialised to UINT_MAX?
> 
> I'd copied int and -1 from the host's mmu->last_vcpu_ran, but the
> vcpu_idx it's comparing against here is unsigned int, so I'll switch to
> unsigned int and UINT_MAX in v2.
> 
> Thanks,
> /fuad

Also,

as it is always allocated when pkvm_hyp_vm is, Would it make sense to add this
to pkvm_get_hyp_vm_size() instead of allocating separately?

-- 
Vincent
