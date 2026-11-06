Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793989074;
	b=GZe3abMEE6ip7Y9v6MZzIlMODlWt/28QHVaKXPQnwhn76omoY39T/oyw9PPQp91tyycV
	 yXR2zZ3+oSxQTlnwvipLOwy3e6oelORouwEpoz3XsqnQRmk5uYkp4CR+yL8bbTakVt5QG
	 0SayxjrSB5ZixPKr5/K6Ed4nJ4ur+FavSfMTlXD28n68L1qbeb0MzRagFlC7SmVCWEImM
	 YTmFpFniAKg+KmSpV8G1BNQH0uRyGC5SLuCF7psDWLt6ViHT3umUTv+RHmltIdqel3Nos
	 3G2kM9OTWi7v+HH8qmA0KvOfrqrYEGw+M5ZEkV25oNvzcPHbGyry/R0yC1JE+dXyIvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793989074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BvW3kJ042sHlnHfK0H238m7dXO47goeCrBgoSLkn/eI=;
	b=stnsIdo8V2izCWqD421QA9NjTSdENae/k7r7bJZYYxZQNGlp3mt1AWvRcTv6KZbfshpz
	 s8J8Tht0L3sqJmq49CDTo4l9xvh960iwtUKV2JUURReDsj9pi3LWkgkew7rrhWtPZYCoO
	 SZ1e/a3wt4RP3IP9M6YJc3bbAxFy6CcXFF0T3EkiHHA9Jsa9hQzOdRdb1GieQjFgmiqOX
	 QfpdAtiwo51HNwYLX15rR7zrpyagIL0BpmxPk2xedN13/I1Ravn4lzs6MX3xu1oVTLqiY
	 QmmubcBsHjgypdYZPwWPag1+3D+BywCkQMHBEWH069GEhJK5TccNgjNWKgQ4rH13pHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d9MH+D5n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB0F606A33C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EB0F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d9MH+D5n
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b6266b5bc4so4205e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:17:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793989072; cv=none;
        d=google.com; s=arc-20260327;
        b=js8KTZ7gCttvYUIKm9CXt117DOudz+03Hh2sRXeJ+PWdGO33aKw5yPfW/vdpMjUou6
         8JOvysZ0fmUmsqHL9gpr1kc1bMaRlpOy76v7ySf3jcZF8QaakqszNvHg9YW9z5rUJm9u
         +1gnvbZevClk0Ema7v4ruO/ByyzVDeDrUpRfsj3Hx9Q+JkFEgC03fDEEvwDcybzn3DXm
         HqiISgGuOwqvKq0GtB79kxzVo6HhfwGVQjm/9we6LT1jwpe4+r2zLaPrRB8q3TA4NHsB
         nK6TLUBb72vRmB/OTgzjyrDTTj7jmNzdFV2PY3FJpNsqSCYY8Zi3gVOYm5yDxN4+AjN3
         K/hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BvW3kJ042sHlnHfK0H238m7dXO47goeCrBgoSLkn/eI=;
        fh=uGAQcq9UKGih8LAj5RZ5FPGwktdd0G2UtL5vV9RerYU=;
        b=PIfjyl72U1RC2WZYpJ7jYIDVyCu+IOUbyBR6cQM0sqA24thnqCk8S2lMbu5KUT0/Bm
         FkXVi+MPEXFvwrjO9z++jMy77Frgw5e2Blth/Ff/NokN4UGH2prjLGfiQFt3+Vsxat7N
         ukrI+wu5aV2vkfss4FOwkgBDZMYeSTcCSj6nCB/ZPeEAuemX89toqxdSe5p2jL6J/r6g
         81bivAIO/K56VjNjZPsMDT7wg97XdDkYw23jORbdRVRDEp7TU7jGX9GvmpzPKHLl4Wca
         OadqLQ/eUoSCWTSRjDSbc/hju19x9fNMk5ylA/nVyHiJZneJhXEyAZgFpDQaRBJTCCXy
         uTPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793989072; x=1794593872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BvW3kJ042sHlnHfK0H238m7dXO47goeCrBgoSLkn/eI=;
        b=d9MH+D5nZDkkiyCBzZzBx2foYpYJwwmMY5qrYGec0Mx05ts1t8mj5HIZRVV1P3OfUl
         3ZR/GgMz6+7QaBC7goZtDvlsqEcLWgnZr7F2aN6ndUtt8k6ynWLMYCQfjNTYSMchQYWD
         rva24rhSDlMJ3IbwJA4HMX328yWPkco2ESyjfQTgFWSWw/Aivk606yHi1lvoCEC65j5n
         FHSP2Dj3L+UpRkq9asbf+YBHHKsZUVNTnJeNeRfbKGVBZD88jsMPHNZG3oJ+/kfKlhHO
         bRQn6G5Hn9Y9ktTxu4quX8bTVOs9pyyXmSPHrlYrXWv53j5pst5Y8OLoZPp3ycpZfjQE
         KlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793989072; x=1794593872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BvW3kJ042sHlnHfK0H238m7dXO47goeCrBgoSLkn/eI=;
        b=YSgfux0c0eMNFcHMO+O1lLl9BAdqGwIKMMM8MVhLzZHNmYY1cZ0zOCI2iekjeUQWrs
         m4kPcnQkOttCpTwjI6EdG5FlyAaVdCg/HGzMvrDQIKSFR14eB/peBYlQSL/QY35rIlOk
         F9nZ3j0omd67bD0ecFvwNE8uwB/All0MXQQJCrkRbBhD07bDK3dNg/KyR9oU+ZSUnyP2
         pWN8R7dP94S5WWBTo/iODRN9Q9M3IhZg+pffAfD2095UKcYETwxwI21BJA8201fpGDBe
         F5k38/FEN0ghBoLkldrD4Nca9+5k+MlxzmvOcAlNZtBLS9Jl8+Tb3NjtnhX6jhDAabZD
         k/4g==
X-Forwarded-Encrypted: i=1; AKwUvBzWW0d1ikwlv5yxbX7HH3QoYKcf+m05g2s3B0zeC5DKWlWPsDn9szYr0ChfIE78zHiNV5rJUVQSFwqyEYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xRPVcZ8eimasnYdT51cvEj+LAfDkq3l9KeSmLpZdsAWDVn/h9
	k6fy3hGJLwHx3mflgMaVK01b/0fFQoQ3VI3MZ31rCyFcr19yzjQn0QR0wONRANB5Dz9vk93j9uX
	hIA93nNU8AYcXl3rOjRkrxESFOI/K29iLitQmsGd6
X-Gm-Gg: AYBFou1gk/eRjHMPaNKRjNyGyAWqF55Te2NoXwsl5QmIvYoymlKCXDc7EDpkUswmw3m
	QNKO/xKrAx80Icv6B6FYKtaR/VIW9bk6dGJ7vAlBY4S7fXc2T+ZKIkytNAfcQWzfvxmH3NPIghp
	i4kUqtPXqp/eIYgxz2dA6mFPFJqwlzX62fIdrTQoYG2husGgNoyh0pTl7so2DKXUzXhqchmCFUw
	iy90ipLPOQjDJ3P8Qmt563RGJ+JArz0YGLgdDeaDCb3qqHPzc/MNv+lfh2YXaQC+Y1oOpSJtRJh
	HIP6ICFGt67n30VT70fhpXLccP3v/lkiVhW06OJNjuiO/ZdXGiVnQDlUcZuNoFypirHdsmlSwS/
	KEM6OD9UnJrwSy/gaGLv0Pz7eIQkVxCX9CV/I1piqH4r+RPjeBuZE6E01qZ0KkivgxOli9w==
X-Received: by 2002:a05:600c:8b12:b0:4b6:24ca:8848 with SMTP id
 5b1f17b1804b1-4b78a30d377mr98115e9.11.1793989071681; Fri, 06 Nov 2026
 10:17:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022201229.GH3381610@ziepe.ca> <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca> <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca> <20261103080933.GA4213@lst.de>
 <20261103151021.GK3889730@ziepe.ca> <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>
 <20261106173054.GH663069@ziepe.ca> <CAMP57yU-VhZWXijvwAXcN9=zZ+eWXZ6J1bkHuCJw3ocRaFaV=Q@mail.gmail.com>
 <20261106180714.GI663069@ziepe.ca>
In-Reply-To: <20261106180714.GI663069@ziepe.ca>
From: Naman Gulati <namangulati@google.com>
Date: Fri, 6 Nov 2026 10:17:38 -0800
X-Gm-Features: AclHuK-83DU2Twv76ErkJhEGQxs5tivwJ4EGd2AJl7A0D8r5G3Ha6ydUc43L3ns
Message-ID: <CAMP57yW6Y4g-xM9YTB+MpgxPN7RFeEWhAPWvqrfOoMDEuL8HZA@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Christoph Hellwig <hch@lst.de>, Luigi Rizzo <lrizzo@google.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Willem de Bruijn <willemb@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	linux-mm@kvack.org, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 10:07=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Fri, Nov 06, 2026 at 10:00:35AM -0800, Naman Gulati wrote:
> > On Fri, Nov 6, 2026 at 9:31=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> w=
rote:
> > >
> > > On Fri, Nov 06, 2026 at 09:21:08AM -0800, Naman Gulati wrote:
> > > > I drafted an implementation [1] for premapped TX and RX buffers on =
top
> > > > of the existing networking page_pool. It is implemented entirely in
> > > > the networking layer and extends page_pool as the default RX
> > > > allocator, to the TX path. There are no hooks in the IOMMU, DMA or
> > > > page allocator code. I wanted to understand if this implementation
> > > > correctly captured the feedback on this thread. Key components of t=
his
> > > > design:
> > > >
> > > > - Chunks: as in Luigi's series, memory comes in 2 MiB chunks, but e=
ach
> > > > chunk is mapped once per opted-in device through the DMA API and
> > > > records its IOVA for each device, rather than using a shared IOVA
> > > > window.
> > > >
> > > > - TX: page_pool accepts a memory provider for pools that are not bo=
und
> > > > to an RX queue. Per-CPU page_pools take 32 KiB pages from the chunk=
s
> > > > of their NUMA node; TCP copies sendmsg() data into them through the
> > > > task page_frag and allocates its skb heads from them.
> > > >
> > > > - RX: an instance of the same memory provider, sharing the chunk co=
de,
> > > > backs RX queue page_pools. RX chunks of order-0 pages belong to one
> > > > device and NUMA node, and are shared by that device's queues on the
> > > > node.
> > > >
> > > > [1] https://github.com/torvalds/linux/compare/master...NamanGulati:=
linux:netdev_dma_pool
> > >
> > > IMHO the netstack should never read from shared/decrypted memory. If
> > > you put it in a SKB you have to be sure the only touch after that
> > > point will be a DMA read from an untrusted device on the TX side
> > > (sending it to a trusted device would be a fail) and the final copy t=
o
> > > userspace on the RX side.
> >
> > That's likely a fair callout. TBH I'm not very familiar with CoCo and
> > will spend some time understanding the constraints. I kept CoCo out of
> > my implementation as I approached this solution from the overcommitted
> > VM problem where we are trying to overcommit memory in VMs and use
> > these pre-mapped pages to avoid using bounce buffers.
>
> Why does overcomitted VM use bounce buffers? Do you mean this is
> about getting better memory clustering in page pool since the VM
> paging granule is 2M?

Not exactly, we are trying to use VFIO passthrough NICs in
overcommitted VMs. Since the guest memory is overcommitted we can't
dma-map the entire guest address space (as non-overcommitted VMs do).
So overcommitted VMs can use bounce buffers to have a set of
pre-mapped buffers to bounce traffic in and out. We're trying to use
this solution to map pages dynamically with virtio-iommu and recycle
them via page-pool to avoid traps on each TX/RX and avoid the copy
cost of bounce buffers.

This problem extends to generally reducing IOMMU overhead in
networking - taking the dma map/unmap cost out of the hot-path and
avoiding IOTLB thrashing.

>
> Jason
