Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794224887;
	b=lZD3g9UU2i8VWm3xEyowomsqN+gcUOElEaC2ZT4Abi6546+peILpYlLjvuNuE+uWNf/P
	 +ZWdyLlmzasA5HTe+ZYscD7wGSLnKpe8OQ51uPfX21pjESwMz9XFnJC5e4fASCZFkQcWn
	 IG9g07b9mvP69I/VdTbC59NEbYtfdeALJKzsPT+CwXmlOyjBpfAqnsLpSdCE1ZfUVpJvd
	 Pc0qm8qEFqxM/UuYXqPL23gm4OnpLqPHXhvaGwlO7NjUYMeN0NZ8SPha/xw4XU/NCTM7o
	 zs6WygPdyQRJNjfgoIDEx+G2m1mBDr4exlh4Yq3QxWrj1dcky+5ALAr8768ebLHzt4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NTI6bfaVgGVs6WfACz4lcJC4XYY+Jhtgi4CMSA27Peo=;
	b=z1siAhz0zCCjTt9+Vk5bochwKkf+zZaIiFEW3RgxW9Ci/ruwVXBFBLFY96gsEb7wPjDZ
	 e0BMevZM6yaXbRBPcNNWg717O8B2N0N1dfOy1+Xd768ydo2YQLtmIsO8CQS0rDH9Pk4lo
	 UIUVChNrDvJxeX8x5MQNoSggMcjmuiL9NHKJI4Z+XozLcX5Mnai/z2ehpwv1gJyPkAnSc
	 J8qDG9wfIzBx6lhDyjDSbupqQHjbcEwhl9GaA+Ebiu0wube6Y+c+2lCbcKYVJG2Wkaoae
	 dnmCacl57InCvnoFb8yCcgj2uDD3aDRbDXhyrC4zfI6BmjOhBNKiiJVIZF4pmdcxjHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TbDK1ELs;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFD8606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FFD8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TbDK1ELs
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b6266b5bc4so24365e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794224886; x=1794829686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NTI6bfaVgGVs6WfACz4lcJC4XYY+Jhtgi4CMSA27Peo=;
        b=TbDK1ELsNwgjSyqsB9s5n5O12uleUWaZwPIM9TJTbWX5ohw/jgd01+Dez64k9qHLGt
         JbM1ySYfSd6mIqV0wqMiPR30uy+dUPMCHS3VrS9q05zqwY2G47klcDzj4XO4m5t4yUi7
         lhlf9GdJv3RQ7AvZ0nibfs2wJRC/DZ7IIA3ytarUfcrWF+EN/8o6snfksYFlOZBV6vRw
         CaIllEdXDc50htiBhysG2dO7aT4aBEnRgyq3GE59Tcij99i8f3WZVaElfgirJdU/7nZF
         u89owEYLDNb0Br9Av3Stbi8MI3hxSxzdHKas6dZtYKUhP5YXIqRGCn+Ju9Itpf2yE4Tu
         vp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794224886; x=1794829686;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NTI6bfaVgGVs6WfACz4lcJC4XYY+Jhtgi4CMSA27Peo=;
        b=q5hfv8qrzl0WcKfLyUMD81N4Zt/ZlMHgpXNF/zbYRv+IN3lGiBakgEAvMoEqxQE+4C
         MQzNGfifRRuagX3zgks9HflwOCWFw4gU71ex87ZICm+rUnlyg93nmsz4WqWKfIMM1jwE
         8q+kEgMsiOx5THo1FxHi8uYVtdj6e5cgfyErNYxx0W1qncYD6Ju/+3NEx/kGLQd0ayVd
         Ht7SUqzMJwyL/GQ7Z6sjnTGUttyh42FAeoXMsTb7+SYEvSCjwY7cMr607XofI0puTiuB
         MUVgLyUBJGVNpoH2lEVCzwUQ22inSnQGNakoi/4MIJuNyc+a0biiDXzz951IIPIL7KIs
         JcSA==
X-Forwarded-Encrypted: i=1; AL+hErF4CTN5fYxdQmxwKfPBq+BuP/LJZGCADoLYZ9c5k9t/+3/zmfKOhekW3hqujyzNPOMcOEpfTcmkzeLOdds=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9KE+lq34sfwvVFhzlOBf+EFUdeE2Gv1kZ+88ECu4qd+uJhqeK
	AvqA+RLJtSdgWnO1qAh10Q6ryp5myoCOQkTEs/5InAaWkhgNRvaYUMmzq2f4TzlbBA==
X-Gm-Gg: AYBFou2YI2yqdZks2Ij5zA2ElV1rj6G/8wGHHDa6IvCVTLn4oZT5Vqp1MolXBsEYgi7
	DHGkS34+OhyLbdkg8BKGXCoULMd49oiDoT1nTH47Zxa74aYCpi8L1GHdX4EvCrGz0Ssw19f013p
	N9vcgG4yxFDC2jJxiKygjkNQbQfY9AFRvgNbDoVgIGrIVhYdf9yMOXrqNVcjGpmnsAoyE7BgsxG
	bpHOwLf0Vb9+dm0GU8YLNLzba/he6Utadt0bhrcWu1jn9n9i10jzJAItSqJE413SXubjfqo0lUI
	OIpw9e4dIx1RHkWWW7zzwnudVXR80doPADIRg/QOl/hRs9q/TaI2LrcQycinXN9C2lUn0JDHSk1
	k9wTdkKsuXZH9UlpgNr6JazbkHySpeHkmCbtJP7xnbA+7xiAL9OHLRMOk444e3+TzC7FbHv0cES
	/kPIwu65//7dUJMRLXo7FnoxByvdlt39QVkgiwRX/pl/1i/VQWQCjkCslG+oUNKKsgnEGIwyPds
	Mc19GC+6NB/W9/OieE89hM0+Fim2bE3m0/uOhZRaKuPaYep42aojNpbk+Gj4P0FP4digAKi6rXd
	PwiChRcW5YQFvOQQj8b/cMk6zmiibgzeSjDmOXEFuqY3MkNSp7NmEPAQIyb3sxyODoQTlQ==
X-Received: by 2002:a05:600c:528f:b0:4b6:5035:d54a with SMTP id 5b1f17b1804b1-4b8aec15d44mr2258615e9.1.1794224885385;
        Mon, 09 Nov 2026 03:48:05 -0800 (PST)
Received: from google.com (160.193.189.35.bc.googleusercontent.com. [35.189.193.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596f9a9ffsm9878242f8f.30.2026.11.09.03.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:48:04 -0800 (PST)
Date: Mon, 9 Nov 2026 11:47:58 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v9 16/25] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
Message-ID: <avGy7mS5A0SGib0m@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-17-smostafa@google.com>
 <au4lp8sAnWm3/Sw5@nvidia.com>
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
In-Reply-To: <au4lp8sAnWm3/Sw5@nvidia.com>

On Fri, Nov 06, 2026 at 11:08:23AM -0800, Nicolin Chen wrote:
> On Thu, Oct 15, 2026 at 08:08:47PM +0000, Mostafa Saleh wrote:
> > @@ -385,18 +482,51 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
> >  		 */
> >  		mask = read_only & ~(IDR0_S2P | IDR0_VMID16 | IDR0_MSI | IDR0_HYP | IDR0_ATS);
> >  		break;
> > -	/* Passthrough the register access for bisectability, handled later */
> >  	case ARM_SMMU_CMDQ_BASE:
> > +		/*
> > +		 * Although allowed to use smaller size, we rely on the SMMUv3 driver
> > +		 * using 64-bit store instruction for simplicity.
> > +		 */
> > +		if (len != sizeof(u64))
> > +			break;
> >  		if (is_write) {
> >  			/* Not allowed by the architecture */
> >  			if (is_cmdq_enabled(smmu))
> 
> The spec says the register is RO when CMDQEN=0. So, maybe it should
> be allowed by just ignoring the write?
> 

Yes, that's possible, I am slightly inclined to be more strict here,
as this should never happen and if the kernel is buggy or malicous
it is better to catch the point it goes wrong rather than trying to
debug the side effects of ignoring the write as most likely it will
go wrong shortly after (timeouts or commands are ignored causing TLB
corruption...).

An alternative would be to ignore it and log something, at the moment
tracing is supported in EL2, and IIRC, logging to dmesg is also planned.

Thanks,
Mostafa

> >  	case ARM_SMMU_CMDQ_CONS:
> > +		if (len != sizeof(u32))
> > +			break;
> > +		if (is_write) {
> > +			if (WARN_ON(is_cmdq_enabled(smmu)))
> > +				break;
> 
> Ditto
> 
> Nicolin
