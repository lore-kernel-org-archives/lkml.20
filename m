Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D34A3E5597
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790806969; cv=none; b=NGTdB6Ij4Y4Vazgz3kDwk2F6N+t0W2lgejoEUNu6YaBiXJp2Jq0gcnitFSAhTGIuwYQJbsk6k8KnlsjEfsQYfvRlwP3mw5p4za7gvPqi9jcobUe4Od1Do5pFnN+t6CkFiG03oBK/o88aOseH5QtbV9iB3d/GdHzPTEB88K5GNxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790806969; c=relaxed/simple;
	bh=QiyCOGVk9NFuf5TTipAKukE/ZuC+v6EkWxAF9sFyh0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lF4ZF9CpazXz6fg6Trm6ea7Kfucv3XyeA3DrWCzMaltjKAWSSETCNZPijluxoQKhJPpy6TMGsiRdUeye2BT2oFXoWnifAB0RkY5QVNLS2Hor80herFdxUf3NBUUuvim82P2LInD3SV813euo9BMmJO+tYz4AC3UalcENq/FSHWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=PfTRnNRw; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="PfTRnNRw"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3428f70d7e7so3475668eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790806965; x=1791411765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dMg/2qAnKkcsx9Xk/70p49vFtevOX5lNII6aXG4vSbg=;
        b=PfTRnNRwA9ZEKFtLRbMIfuu0Cmf1PWWP6NDz+W3FUt3nD2kZFoskYmlI1jYYtkJGsB
         mXe/N3npkWvORc7mIwy8FhUvacpp5ZOYiFcNVyc/ubT9GwwGp9uEmu3yTNGOxCjvv5ba
         cOlf7ctzmzOcV/3IBl2jJZ4H2wgs659CbAxUFHQMSiV8h+AafBRV9pItxmN3V8yTW3F6
         gE9E+UJEkQ+cRdakwGmVANpPLMAjFrEJr7+8bolWjhRJrPKazj+vF2/aaBJIkNtyFXGg
         e/YpIiUt20ObckXdO0QJFYumJRDR1HK8viwMimqGtKji5Q4qstR0CKe9MTHQCF+SOs7z
         T2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790806965; x=1791411765;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dMg/2qAnKkcsx9Xk/70p49vFtevOX5lNII6aXG4vSbg=;
        b=kPBMT1E/aWrAZoCP0ul1y91XL37LVe07TefimT1CfZTzIpWTOPG7MAdO1CRk14X6rX
         Dq+6DnmrQ2yjRqUAdBvgoRLi1ajs9pHpk7CLg7EFDSXM05sTIA+xSOqn01AiacYTuOam
         VkqHyh/p8O3Ote11z/YTpUJrLAsyuK9oSkcrHByq35UZS7wFFK3MsrCskfa4mzFu1KvJ
         ItNyz2c4Bnmm3LJGZ8E9OEwtL0ThiGT+hmudU3UCpLJa1+Uqs0DcOwJzhEOq/q3269Yx
         Hjqk/D4f1Mxpaub87sh0P8ix33Hlittj5uOVqbdUHVHbeo24Zcwahuahmzf0VyHqiVt1
         ccoQ==
X-Forwarded-Encrypted: i=1; AKwUvByxol7LfIm8/i/uNLn219F7ZJje/bp+qqnQpkGkdkFvqxj/y/PPscLxPr2p3/33TuAzr9iU0rfpYZOr66c=@vger.kernel.org
X-Gm-Message-State: AFuF++nr5HsFim6SHYh0adh2zXAe46vGbfmy4SEl5Bmo+7w2f/ridUbW
	Foo3BTf8gzu7vM1C9AmjeB5OPlo0XW2MJAas473voDajVRjqVknVwF+nd1b5DArAL+Q=
X-Gm-Gg: AYBFou3ALb4S7InmhmSw79lSbinV9kYNx6N9N0VtwLqDRs4YlSiTx8LMjY7cHQii9F7
	nVqaBbRXL4/THcnAWFRQTylxBKRJ5Yuklg5lNZ02oCCXV1IJB5CJ2ZzsxzrehSOVhXV8x6DWyQv
	nm21GthC++ujKGAbBdVNV2bSinVgUPyPpSY0hZel6x4dFj5xsy/CHCR1hZHrwDrfOkqYPXtrX3z
	/GGoDa2VzuzmvxEniyvzaF8zS8VzJeeHCvjeZpPZyujNyZ2Pkcy9MaZOPNmqmfQijfHNl+0jX2z
	xWeqUaF8rLo56Z9bcvfq/KlE4ayKHW8Wnv57T3d0/4I6oymh3q9lQ8mdXRlmsNWksl5/NUS0XXV
	z+JUels/HJwtZXJnfKw/igHwmDLsizbCcdq69kMWNk7Fd6jy6PIYu1EjVNiz8rmrHMKl1PlObcg
	Joe42ddp+AWfcfHxBF6orNfEot3K5YktwE1F/VhNmYLbAB
X-Received: by 2002:a05:693c:895b:20b0:34c:803c:84d9 with SMTP id 5a478bee46e88-34cdb8e4c56mr2632442eec.13.1790806965368;
        Wed, 30 Sep 2026 15:22:45 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db0c89a80sm1640377eec.2.2026.09.30.15.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 15:22:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xC2hH-0000000Cgf4-1b8m;
	Wed, 30 Sep 2026 19:22:43 -0300
Date: Wed, 30 Sep 2026 19:22:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, will@kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu: Make iommu-dma helpers private
Message-ID: <20260930222243.GA3019323@ziepe.ca>
References: <ddcc6f8487366211af0d81ad9af2376ec29d8460.1790596307.git.robin.murphy@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddcc6f8487366211af0d81ad9af2376ec29d8460.1790596307.git.robin.murphy@arm.com>

On Mon, Sep 28, 2026 at 12:51:47PM +0100, Robin Murphy wrote:
> Most of iommu-dma's own internals were privatised a while ago, but
> there are still a couple of DMA-domain-specific helpers provided
> by the core code. These now definitely have no reason to be exposed
> publicly, so move their declarations into the private header.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/dma-iommu.c  | 1 +
>  drivers/iommu/iommu-priv.h | 4 ++++
>  include/linux/iommu.h      | 2 --
>  3 files changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
