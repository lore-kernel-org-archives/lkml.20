Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EB53EEAD0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184132; cv=none; b=jIkSDHIcBpE1P4fR8K4DI/v2sJAVLHbP9FnH1UPkut4Fczmfnk5fgIcMh52dv3MOcvIpZuMClm4JEszWcL52gDXCgzPTmhyW/9An1Hg1D954uCBlYxwM4rBcCmP4r2ol0CrDXoczZ7zbddCIcExm+Ss8uaH/AaL9Ta/3G1B9w64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184132; c=relaxed/simple;
	bh=D9Nh1qABv2EMxX6HivmQ3UiAglxR8QFUMaPCX1n/oZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ood5Bby+k68Q/qvJnsVmjN0NZaaWzqZfsUkBzIsMPV+ojWmdDagVUpJIV5XWQlI/Qo2QNANHkyyjut+AaNSUrRI5rzyGTx7PiO7keKhchYkXa886UcHrnfvD1spTl9Nh6DQIIohuXvkXDkgwrXwxB5u+K0ND3EL7lw9rNUeJmUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=nZPbl4DA; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="nZPbl4DA"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-7f4f0d298caso836660a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790184129; x=1790788929; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nZO+CuLetaTJpUNxxsNmcxZ2zY0gVwrRgHqGQbQ+ftg=;
        b=nZPbl4DATU2ElsF3nAA1E+r0NBq0D31wY8TS/gQ6LhfcZsOpQ8aBD2BSoddfxi/Xf5
         2LkJLVEvqBdoOydcfD9q4L6SVqY4xRbzEbI45KgtPEn5I1wKl6bwfSSiG3Kv5Vu0yZMC
         +Gkg7jJswRQmM6EPLVnNFBCzLv9rYzag3tPopYUaNMX5HNuM5SQeSf5DcA9NGH7OnWgs
         vZqGX5QS2n5WCVjxX0FZ85Rx9c3M1ZujRrIpEeNxyvW/Ivv11rElrjaJe9OZ4/yZLMSK
         VhAC7ptVcofT8NeZzIg83J/7xIsmeSB2YiOJFRu4vzsqwSmiKjCVp1OZD4wf4ZApKRx4
         C4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790184129; x=1790788929;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZO+CuLetaTJpUNxxsNmcxZ2zY0gVwrRgHqGQbQ+ftg=;
        b=ARLV0cW0rKBTK6qCaM9B7ULp7G2PIggCm2SbxU3/pu1Oyln+2TJ50oLmpdV9iARxBH
         WEBG2WSbkCJpqDyCE7ASnJfslOQUfhiPy9qoCczF0xLiaoi9JpTaJPS7QvFQpWB1pWBd
         Wb2U/g/vyTnPe3kel/918aBxOLI7GdPF4pk75VablzunQlA39ImUSWimf7iOLXXxS5Y3
         NieEsk/rxv7x6lGfOWSbiUaRK87/dZmUohHGiKGqqFWRuDdTbvMoRepzdKPH+sB8UuZm
         8BGvTRH9Ctv8rcfJbZrPLi4Bsw9OkohzifJLHSm6Lw3h5W6Oi6HESFbQjKl2dzGSRPWR
         Z0rg==
X-Forwarded-Encrypted: i=1; AKwUvByfSQvRuOmfORWfg10EDSULQH/j86tUakg5P0GHsMmbVWIIq084S4cQ3ca4E7twwpycWePkYPMwwDOFaEw=@vger.kernel.org
X-Gm-Message-State: AFuF++nXZTuabbRFN8KPoeiPj28AtE3h7u0k1koSmIaymj2cjRuTaoLj
	eEBi+oR8XW9P7720copWQPZBKO0GZAoAZdOfhjTgShOLxmpb+qpwrQd3gToUVGQuz4E=
X-Gm-Gg: AYBFou195gTqhezj6Ghefsm0BSY5Py66UKKLLZpKoX3kuCHEa4fcAUfrmFJpz88XguE
	ttW6KDIOkyUq60aClx517eWDGroM/qgZQ8cvZ0uc9VPmhGqxRgg6as3h0iuWVCizoR+fvs0EXzg
	IB/egVGQcHFBcH2Vt+QkMYp+9oDTvwASQOo8+UEE3cNp+aHrUDYG8omLWKdo/dsKzlrnw/kCSOq
	zHJLOCLkAnX62THCRF19gUE+n9PfEeyhQUt6cU8ONVoeZHU+G9NnLRrxbt8SqYJt7zBT7GzBm36
	tonXp6a/M9lS9gQRbVDNtxQDUArpyu4Cs+fy5zRNZ36FCAwwESPICGao1Pr7wsED2PA5skV64sb
	jJpeTbq8DAHMroksKS/WvQ4lbZS+D/O8oXyyIkwlp4LYGAm4stSArqJ5b1JfDwUTZxa9VQ4wLuJ
	CD0R7Bdq01kj2aoFh+q/huAfSrHEFmEUkFbv9sLbVuiNLbQE+trvW8uAs=
X-Received: by 2002:a4a:ee12:0:b0:6bd:c175:521d with SMTP id 006d021491bc7-6d2d023f352mr2916611eaf.11.1790184129300;
        Wed, 23 Sep 2026 10:22:09 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d2ce25c058sm2985571eaf.5.2026.09.23.10.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:22:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9QfX-0000000E9a2-3usD;
	Wed, 23 Sep 2026 14:22:07 -0300
Date: Wed, 23 Sep 2026 14:22:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com, vdonnefort@google.com,
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v8 11/25] iommu/arm-smmu-v3-kvm: Add the kernel driver
Message-ID: <20260923172207.GL1540250@ziepe.ca>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-12-smostafa@google.com>
 <arMbxX+sqTS3gByB@nvidia.com>
 <arO9hGmEx7c9mZAj@google.com>
 <20260923155507.GJ1540250@ziepe.ca>
 <arQHamIHuaUqlJyy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arQHamIHuaUqlJyy@google.com>

On Wed, Sep 23, 2026 at 05:07:54PM +0000, Mostafa Saleh wrote:
> On Wed, Sep 23, 2026 at 12:55:07PM -0300, Jason Gunthorpe wrote:
> > On Wed, Sep 23, 2026 at 11:52:36AM +0000, Mostafa Saleh wrote:
> > > I can add more info in the cover letter about the code split. Mainly:
> > > - arm-smmu-v3-kvm.c: Is the kernel driver for KVM SMMUv3 (this runs in
> > >   EL1 and can use all the kernel functions).
> > >   The main job of this driver is for discovery, it doesn't do anything
> > >   else in the runtime.
> > 
> > Maybe call this el1 stub or something like that?
> > 
> > guest_pkvm_stub.c
> > pkvm/hyp.c
> > 
> 
> It is not really a stub and I was following the convention of
> arm-smmu-v3-(iommufd/test/sva) I think for the pkvm/ one it can be:
> - pkvm/arm-smmu-v3-pkvm.c
> - pkvm/arm-smmu-v3-nested.c
> - pkvm/arm-smmu-v3-el2.c
> - pkvm/arm-smmu-v3-hyp.c

pkvm/arm-smmu-v3-hyp.c reads well to me

> All of those are fine and for the other one:
> - arm-smmu-v3-{pkvm, nested, el2, hyp}-init.c
> - arm-smmu-v3-pkvm-el1.c
> 
> Anything along this lines, otherwise it's too vague IMHO.

arm-smmu-v3-pkvm-init.c seems clear?

Linus has complained about the stuttering before, so think about it..

Jason
