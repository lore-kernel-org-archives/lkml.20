Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15584377023
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750685; cv=none; b=aGhiRDE4WX090jpeDEYkkE1osumHiYY4Vv5sOW4BL2IaSxwgGnZPUngnJMvqdhSaI7jxho6phEjIzcFrYRziEm9aZy4PR9S+8kTg/9DD/O659sNCgUTZ2QwrL3+5yg8FS+kaOC2PngKRWu3qx9NAPem8YSTgDbyW5Pxf69YouUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750685; c=relaxed/simple;
	bh=6pCoeSjfIM1AWSdeWFfupOCaccy7EnX/IEuPyibjz0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0lGZvrQrl4EhXHjdatKa9r3ZBT8FfA0ADn1VLESvkcknraaMcpwC/QHAccRE68fK8uml19b4wlwWs0xvH68kfjF9SUQghtW5k36T2LSfSBlVT217mFRtj43vJl3OGuIAUZpop5E8UDYSeYXEGqb/lWoOugjHsyjWdRx3rlvCoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=XhKPbz8p; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="XhKPbz8p"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb76906adso12081591cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789750677; x=1790355477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xg8bxcCx9Xplr0VksHoJCXIx7eh2ZBKcRPIgfCbqvCk=;
        b=XhKPbz8pOVxWjIkyEqlXma6IhBaxQ6ADEnEoQx0x9dOtIDlAyCWpJLyW/TyFZwKWhq
         G1nkv8zmTeoe/cFGmucQNuvNkoNgSCV7YlYWqtPPFBkIS8FHdVSGaZR8fDojeF2b2YO3
         PYuLNUeCcOXN8EnaZmCOW1V+BWYFHtGiFy/114mmTs5Qh02jxvyhlZascfOtGr8E7JbW
         pRPgXm0G7fCH6lCzkIYLAqWHc0jGxtbh4KO1W2Z/Mp4s1XAQ6Vg5ij5TLu42HydDaw/O
         JeshHSmvU+f5lo4NManiOtEe5Lkr6sddxKT89vv7b4xoc5OQ3Wl96ofaNimezC2YQOJw
         keLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750677; x=1790355477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xg8bxcCx9Xplr0VksHoJCXIx7eh2ZBKcRPIgfCbqvCk=;
        b=K2mr3/BRo8vKaMxLaFETJnOyTB7g7CBBsP8FMRhY9U9jsHM1S5vISu35EdPQn74PHM
         lXQ1HhWvL3TxTMZljzxboVcSJeIUoe+Y0h7kaurNjgJJASyWR/HmHamQhHkUss6kl+Ep
         TPFWTyVcVJVyDVE3spz2MR8lGIW1+JY8LMuFgSJIVsofQ7O1x6Dle91ewVHM0WZby0QO
         L12OAgVotnwMh1dNVrx45rV56fQD/tcNo8RcwvLFIIOr3aD6atg+8GwTAUb2NkNYBOP9
         EAgvnSgxWuqLI8uk7+/BR+00kMOzA1/Mm2xypOg8ngKERbce8iBCr/FmzYviY6WX9giM
         THhA==
X-Forwarded-Encrypted: i=1; AKwUvBzOwZo65XybNUB+NdUIOX61DzdjHJ3blMVxZ1prbudSjPjmmaHQzscvAm/Zvh8pMYyAsS67MLHSQCNGWFA=@vger.kernel.org
X-Gm-Message-State: AFuF++mMEgMFF382g/0O1YEB/fs1mcGjK2gnB6g2I20C3c6FG98WdvoP
	n2Eq6zhPzO5JbyN78vvQnTlJ0VmZetBo1rUIJaFxsFt5sGk9BCWgJCtLL24TpFHFxt4=
X-Gm-Gg: AYBFou1OKEGvUu2oEAAqF0HafkKzG+7IaKRcf/P6BbCFIeEq96IE88g9gDznXHk3spc
	LQuneqjvepEEyyzz2pcb+wXt0iKxGMkY21iOFGjQ8ftOaeFBnVf9E7yf9mmiYNDajzbD0wYPmB3
	OTOV2l9y07q9YUlIpXeDAtWj77c9uOGI4BXW4aISacA+sv+l99twfQnOMf4yA3P4knaUBuCd1V/
	0qf342+t9jRs8otOcvF0qw1CEazRxYUpPiBKlyOGY6bOSNN9rhBIFGIO/3Lk3FqVZ64AVSMTajg
	f+fv4AJbkHOP4dQwUPLJ+wgrS/32NexjFddLnh0enRmSZJmrbPBzO8zXBnfP+w4wVlDrDimVviA
	5Uk1LOACSmJRPqFR2PPAysYNKZqcPfah3063hZQrSl1gOe1hhQaeUFygfyJaYzRpOjNNFoykoqc
	Bxvwzi+K0NCcZ9RutoOlMiaaHKMGExlAXQlD1tK1zoxgYSXKgS6UO/xw+pcwjPJbInAEth8VyeC
	acwTCeR3EVcfE7WtG4RNXvSEXsjj8V01APrK90DwvCc78eOG1ijWjpc
X-Received: by 2002:a05:622a:60d:b0:530:9bb:54ae with SMTP id d75a77b69052e-5329e259e51mr55816971cf.15.1789750676599;
        Fri, 18 Sep 2026 09:57:56 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae2c6a33sm1773871cf.0.2026.09.18.09.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:57:55 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x7buM-00000001zBN-2BHs;
	Fri, 18 Sep 2026 13:57:54 -0300
Date: Fri, 18 Sep 2026 13:57:54 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v6 0/9] coco: guest: Enforce host page-size alignment for
 shared buffers
Message-ID: <20260918165754.GG11599@ziepe.ca>
References: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
 <aq1sT2EDsGaomqST@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aq1sT2EDsGaomqST@arm.com>

On Fri, Sep 18, 2026 at 05:52:31PM +0100, Catalin Marinas wrote:

> TBH, I'm tempted not to support this configuration at all, just fail
> gracefully if the realm page size doesn't match the host's. However, if
> that's a real world configuration, 

realm != host is going to be fairly common.

host > realm is probably not that common, I would guess.

> I wonder whether could we leverage the swiotlb mechanism but with a
> separate io_tlb_mem as a shared coco allocator with the right
> alignment and use this pool when force_dma_unencrypted() instead of
> specific alloc_pages() with adjusted order.

I propose we fix the far too low level set memory decrypted apis into
proper allocators, with APIs that can handle a round up. Then see
where we end up after that.

If we can hide 90% of it in an allocator then lets see if we can open
code the rest.

Jason
