Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699952;
	b=zaKT5DuvG+NgFqA4HrHRaIZGhSfgr7dh0XT24TR7HfvDCweoFefCJ4aOHP9ZWB9DIRog
	 AKHx76pe4WI19ftveMJG1yMXnroacSklfLVIl6GWGX/7IOn2dxlsPamBCBmWiI6FVP1PI
	 GklKb3GS9lK0o/Bl6fQIlA2oEx6+na7brD8YtxrrZWhJGfEihocU/mlfCBafi+jmnGpDx
	 tOcxVwf2CziSxgfF6wofrItFj/m2SOGCnOS8G8OkbCKgu1MWMktpqb7QV6Er349L/Hrn+
	 AVILD8Q2zk2i4Ao1F4GCLpVdWBImphdOonvRQ17D1X6Qu/u1vofzoXDqkp/2OVDov8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=I8JrjL/Toni0rgHeKLxMi210agLPfR373jhOEmm9NDM=;
	b=1Vq/+slFRvysVCWHM3czMqmrqRpvzLIpkGNUscIbF7cDVcB+YO/8tqnwAeJSha0204Uk
	 3354G6UBH2S7iRa8q0eGDJsx3HA5Dcs+fuGrpG2yfmGYyOPNCXVAINnR7SkVcyPrTFzDy
	 EkF5TzHQErTV6VfA9Iv03Ermfjc+XYmN9ypk1NQxNKVxLz8uLzujhnpv8mZS8I3kjwaC8
	 RublIPFUH3lgcd3np1NiIb+7rCA6C2ZSc0VLUPO1m5N4gW4BvrjR3jIm5jyu7HsGoFS5m
	 SAc/SXz5YBtdMkKwmLV9H+DY6SRgJHfDwCAmc0+qrHxPDKTJlgYLDLYYY2yZVjMHKXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bEf24BE7;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BD3606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86BD3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bEf24BE7
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5364c951da4so1325781cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792699950; x=1793304750; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I8JrjL/Toni0rgHeKLxMi210agLPfR373jhOEmm9NDM=;
        b=bEf24BE77jeSVrye/0K8bqAhBtq3l4ipVokvy1WTo9I171dh1cPnLebWZP98ZbHc1p
         AY82b/V/Z8Ber8ZWp8VUWvVQdVKVcws1+qTT8I1nIkiiUcBGdUJt2If+NgtXZWXT8aBs
         uKfYqDijGgrn/rN6GkRbg/nS7tyReOXZC1wz27PGG3UX69KRZ1voQbKcO/EJ7VCH+ev3
         9w3+gkzOCiUWskxpeRuVsDRp3YDSWCkTFq4QinNxLt/YPbd0DW10RzKL39WEfK6b51Xg
         gE0pjKAlKmDwW9sqvGKBvCi87C9mbwgaQyyqQUYs4WaTKD+zF6NXq0IhdXGPVmv9ZqYX
         i7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699950; x=1793304750;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8JrjL/Toni0rgHeKLxMi210agLPfR373jhOEmm9NDM=;
        b=oFd/dt2rF0JJjuNeaV22PzlrEpXOclpFbWTuz2b/RqnaQtGXeC3eZmOGZ9TwOx0VqH
         4gArlPWD3vhFoiNVKLlIAFliJlG1DzLz28nfjV09zOtll9Jrv/Iq4nKdPIssdXIHta4W
         93cKVB1TDC6zNMCqG80T4UOl5OA2ykbaeId+Gb8kEbrDPIhpmEhke1YKVs5I6sygIDmg
         wckM+moiDwUdrGLedjMcyHDAe+LKSnKA8/uNEKR0We+n2hrCH3yJ4RZ1TxxELKlkdSqt
         BZr3VGYBk9dTws6TPSSvguZGraPNDeeOFeg58CkxzPUp1jMxiinY+GioRQQYklIGQD2z
         xqpA==
X-Forwarded-Encrypted: i=1; AKwUvBy+NxzWlU9pES79iuw8h4coUJSBoDG8PknHP2UiDeeszv7RexI/C/vRA1ngThiqujLwiOWhH/0A0eENUvA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJa2fZEeiMT2LEfceBSoSql9jyLxc7aVQO1qHKG3s/YnN/DGklH
	gYBoC3qMpFq8O8Q05yhudXsx2uaSMiXdDONcha8GzgsBeyrVZ8w1Sh2MHem84nghLok=
X-Gm-Gg: AYBFou2xbT82XPvRohkTbYEN+VlM8iLQWj+xw/lsAtE7LL9sHMDuUybsmVmpGF4E/Xc
	xVlly85ya7fBH1O3MDHst8wmxJee1MqPVBAB6B6a84wbXD+ymXXD8zmD5O9xx898RjQyojiIdPa
	rKOr5vY4j0rVl/M9sZEs3cSy0/FACPO+hgDKYwY0R9Xgvo8lJecFgvxsCexR1RPwLLjlTSU2D6k
	7+d9oufTc3CLcVHNA6Dhtcd89AdEuIidyMKM61gvp0i8CEfC1zUxuekqtV2HIXK1rFbJ+dknppE
	4hqV/8w+8Vqs3uuEyzk2IFRfGt2dW33w9Tv+9OujqZIKV5h357h71DcW+Ul0YNq33jTXhAQu/kN
	xnWiYny3zUpYfMw+snyVX03tQZWUiR7n1jsSdlOM9IvI/Bm5HAuV9e+auKy0S7OYK8smqdspDxk
	ubtgpSczw1quRCV+6yJo9zL7SxUVp1sFHVZJq1EK0W8P8ZmAQJk41KH8n35CqZ2UtOUNH9FRYd3
	C6QuhKhiEzmJXdEl/klEuUVi8vaRf8/WsZ6YY/LMspMAiy0E4H0muuZnrp9QXdoWrWZelPmU4yU
	hPSrYHfn+ok8hJbyfRx2un1l3RBgh7s0D++vtA==
X-Received: by 2002:ac8:5a85:0:b0:536:6378:c7fe with SMTP id d75a77b69052e-5369b8204d9mr99553871cf.47.1792699950468;
        Thu, 22 Oct 2026 13:12:30 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536c14da10csm1768631cf.0.2026.10.22.13.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:12:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJz9J-0000000FoSN-1XEC;
	Thu, 22 Oct 2026 17:12:29 -0300
Date: Thu, 22 Oct 2026 17:12:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Luigi Rizzo <lrizzo@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Willem de Bruijn <willemb@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev,
	netdev@vger.kernel.org, linux-mm@kvack.org,
	driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
Message-ID: <20261022201229.GH3381610@ziepe.ca>
References: <20261003212241.3432303-1-lrizzo@google.com>
 <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
 <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org>
 <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
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
In-Reply-To: <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>

On Sat, Oct 17, 2026 at 07:11:28PM +0200, Luigi Rizzo wrote:
> > We should probably just find a way to describe that this is a POOL that focuses
> > on physical contiguity in some configured granularity.
> 
> Before embarking in a global renaming, I would like to get opinions on
> acceptable alternative names (possibly with a short prefix usable for
> identifiers in the code). I could think of the following
> 
> DMA_PMAP (for PreMapped or Persistent Mapped)
> or, ahemm...
> DMA_PISA (Pooled IOMMU Superpage Allocator)
> both using dmap_ for internal name prefixes

Can someone explain what outside netdev would use this? And why you
couldn't do this in the netdev page pool?

It is not a common workload to have the DMA allocator be the one that
allocates the memory. Usually we are DMA'ing from memory that was
allocated someplace else.

I think Robin is right, this is just a special case of the dma pool,
and it certainly shouldn't be something as grandiose as a subsystem..

Jason
