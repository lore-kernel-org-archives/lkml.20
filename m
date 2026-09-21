Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E018048F820
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991505; cv=none; b=X1lzw+lQlycrT+tP9RNOFERzDExWO2ykXBVUd/W7tfyJqFQ5m88AIH8iuZXBFBL7/VAiqVS8/+cbjAa3pUYwYx1yQgBY9hhWk4QGfYU96Hp1gaeVfbeSalOiuTCpwK4IAarRBKI5oX1/sTSksXrS+7BygqeX+1x7e42cnax6tZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991505; c=relaxed/simple;
	bh=lCdYI1OE94lBSqy9wuRBi4LlczC1SIPVqcP7imtw+EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MsgNsE0yF4XyYLxD4LqScSUBcp4wkdK3lDxhzrgILTqN8aGwDGOovLApMy6m6MuQVwKr12eXdg8oqp6AfivGMSKp4aVhTFmABwtwuYzqxtBXVZMAY9E8Aw83pneEpTuLdV0HDY5Hu2A5ZFAeJKrfqNYDuanr3DrPp+Fh/gr7SpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=A8vIl/25; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="A8vIl/25"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939695b5741so270726485a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789991503; x=1790596303; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bnn6zn+vbwMdJcdlyBW4k06r7mJ5WHfKBmVX1PCngjU=;
        b=A8vIl/25cUYdEkxgOWd7NR2D0yTbF0g7oe8tnNXwrDX7qo5995B9+ItsIAhbGu29KF
         Cd8q7oqfllTBTZcrJLNu8WLqe0TvlCeGCleCt6Nlmks+4sMNA/VSCxgQjDslMwa7x96j
         63j48cXcUd1rck9TuLXp9Ocsxayxgs/5vvZKrRLphhHo8YHJ3QKvgYVoHoRtxK8XJ1zt
         c4fI5imGNnqpzmE8Z5zEWj7CH2qeSLcyRB0zDdvKxo1Ivb4SepS7FLMARZ50oYQTzCgi
         5/w5leJ0VGjKy2QacFNaiPjWQsodSV5xg9MP6bugpn6urQXBusKOkR0oxuPXxiH7bxSw
         OXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789991503; x=1790596303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bnn6zn+vbwMdJcdlyBW4k06r7mJ5WHfKBmVX1PCngjU=;
        b=tP1WVaEcoTPedDz+9Y4EyrNSVh/1oiMrHV+MTKw2aCFgii7FCvYnqW8qk32afoG3SQ
         R9XpTb5VyHSEniEPkBMAnsKkaY722iRRP/ofm8OKOZUrKkV/dBgSyLVmd9GjZI1k5irl
         VFckD/+GnUH++pAzHp6tNGgpZHprDNP1w9/bQRRc3JKf4sA9XFKYXY54ouoO3jTgey4d
         wR8PMDC9SCCtJV7v57a7lgEVlD4FjazmcykZaTr520NKLrSCBDaKFTZxqIucBOj0Yfcb
         HaZwCEfpyiP0zrW7DAF39JPOWwzltFv/w0K/oMx7DE10/w4WSikTZ+oIif51MMnnWOQy
         UZOw==
X-Forwarded-Encrypted: i=1; AKwUvByDXMYqpikGMXjwNkRauc8/ZYZT4WZL9Vj+rVCzgtp5vE/BjsajB9EiMXNQxfdmHpTGorh8xrv/0F1W/4Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nEUmKkkSuNGSAmh+H6PH0GOIyXUpxDOa7D1k5qZMbSXkEUHw+u
	7aJnYGo5Gd4OQpawtMD45hWZSuimPNlGro/3y/kiA0suCcCTceDK6807nXidxK/jZHQ=
X-Gm-Gg: AYBFou0UwyJUFqxpV61lE5Cpgas0XJAORhet/Fca4k+wW1osoom4UYcbtjQ+A2roE5o
	YWbkMpV8F3uVE3L7okAvRywHYXX90qReIpkRjY6zr1w6DURwxpEvDrlkxMb4YNNGDz3CN0y76ao
	DgwHC0VAmgieL+HBgfdo5vsLfnl69EgzqI9zHKdCnncZ77uuCFfnEkhSf+73y1QHZJjEjakMpHN
	wvBMKDNvO8trmsjbSevaQJc69ZK01rza4BhfH8H40eJSOSS8p5VAy5fHoeMN6/u2Lg60Yz+1JUX
	qkvov4axaahbEY/ACU+YAJGk8IOqJo3bWmiWAq/yqwXq+dK4pEhI69UgK6ZJfvmLkhKM+uaua7/
	CyNjVw4yshgI+kV+xVIC5uLBa9RQoma391xMwcG76MA3yW6EouqtxxdYJ+3sut6EtB3p4qOUTn6
	bGccg89tHXCRjJRJE2K/4NwkIeM7F8dbJeycEiCi/W2ha1tTiZX/F0cnujBsW2Wu7LgRmGi2k68
	2+hboTh+ZHjbsXU4k6LrB5bbrn3L+QC7cJIiNBg7GHrqVy96SluuSjUe0D796YKspI=
X-Received: by 2002:a05:620a:2556:b0:93b:d79e:18f7 with SMTP id af79cd13be357-93c15e7ffcfmr18078085a.58.1789991502666;
        Mon, 21 Sep 2026 04:51:42 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260aa0f99sm65421876d6.38.2026.09.21.04.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:51:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x8cYf-00000006E0j-0Dl6;
	Mon, 21 Sep 2026 08:51:41 -0300
Date: Mon, 21 Sep 2026 08:51:41 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	"T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH v6 7/9] dma-buf: system_heap: Enforce shared-granule
 alignment for cc-shared buffers
Message-ID: <20260921115141.GJ11599@ziepe.ca>
References: <aq1V3oeDdvXobt8J@arm.com>
 <97c30fce-9bda-4c61-b1b9-10297b89c8d9@amd.com>
 <20260918153642.GD11599@ziepe.ca>
 <d8123f21-d5ce-415b-a05a-392d97b8b57d@amd.com>
 <20260918165315.GF11599@ziepe.ca>
 <6115eaf7-21bc-49ce-8a74-08fd37a1e2c9@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6115eaf7-21bc-49ce-8a74-08fd37a1e2c9@amd.com>

On Mon, Sep 21, 2026 at 11:07:17AM +0200, Christian König wrote:
> On 9/18/26 18:53, Jason Gunthorpe wrote:
> > On Fri, Sep 18, 2026 at 05:39:55PM +0200, Christian König wrote:
> > 
> >>> Arch code can figure out how to do it. If some ARM configs only give
> >>> order 4 folios or whatever then dmabuf heap doesn't care.
> >>
> >> The fundamental problem is that DMA allocations are highly
> >> architecture and device specific while Linux memory allocation APIs
> >> are generic.
> > 
> > This isn't a dma allocation, this is a memory allocation.
> 
> No, I mean this is a DMA-buf heaps allocation. It is a DMA
> allocation, we just don't know for which device.

So? How is it any different from the existing alloc pages?
 
> So ideally we should use resources which work for most devices in
> the system.

Which this does.

> If a device has special allocation requirements (CMA,
> restricted addressing etc...) we need a specialized DMA-buf heaps
> for it.

Those things don't really intersect with CC, but if they did their are
already heap names to request those, someone can add some shared
restricted CMA option if they need someday ?

> That userspace provides this cc_shared flag is a NO-GO to begin
> with.

What do you mean? We discussed this with the heap maintainers and we
all agreed this was a kind of heap just like any of the other kinds of
heaps that userspace can request.

It is *exactly* the "special allocation requirements" you are talking
about above.

Jason
