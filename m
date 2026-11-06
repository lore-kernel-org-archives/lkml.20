Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990629;
	b=SnJsfB+v908i3HZhOw1VmS/5QeNdCbf4Vr3Iz+up4XhB2mJorvzkBa7coZ+0ldQPzEoa
	 tnyfiZLevrHhaW5SZaISM/NOT2bqwso56eXPnbnE9lc86QTNAIIPHTTVtlZwE3Uvcuw/X
	 Za2/FliRHD2X2nGIxBh+lW8WXj9At1JIsr0tQF0a3JUhN1Oczs/inhxH8Uh2J86JLcwB8
	 QYR19XoSCInMTkG00oNBSx58Ccu+EkI/kmOWPfaw3NRyWMp0UFnhW9ino6ixkJMHEncAs
	 eHg0ZG/OTTvuARd/DI6ndH96z0CpmgA41k3UMkerGkz1I79CEjnAVuQtVKrkXLOJXwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=b7Y85ZMNTmnO5vyHoGmhNUdpyQ1xa3t2s3wZRjsJimY=;
	b=Vp5dR0v4IhcynZXi3ffKtajCXEZndl30gThKHQ/r6wEPyZgiwYQB5N0XtTfaSOFHN5UU
	 HBHXEcOVkQ5sVEKvsPPXwigR4dAq2lSrJuxNrzt+j8Eo/sNY/wryyoujOGSXeHOWfAgYu
	 APJkvMp4cqOVi9DO3qZ8QZf9nEdNPQ/+63bUM0LMP51KKAOE3WAzCuim8KOCjE4TD2Dsd
	 K7L7w/eMtw3AlKZsr/dnpBPLmeZg9W03tu84tgN7x5GP2MjJZVLEh4kGiEpflk07ts0dZ
	 jnIXeJc7L+d/468a/DgVWqS1ld/CaWdJ3got4Xdizf1XSxJr9UrO5HCtwMwdWy0b2ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=HGDygtS8;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19F5606D829
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E19F5606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=HGDygtS8
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53665358476so9171871cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793990628; x=1794595428; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b7Y85ZMNTmnO5vyHoGmhNUdpyQ1xa3t2s3wZRjsJimY=;
        b=HGDygtS8PIhtf9IE/TizOpDFPkRZ98JXWj8eT4E4Yhq2816KF4cYzaNMNDlA2GUJom
         EwHj/VjdIR7VABdV6Zp2h8871UlmV++e2EY9F4DXOFfJ8S6YfHRSeY1siEWlm6kSEjNb
         WHEVmvE5ym6L4Xbyfhx3R1pGRXcL6Aqfsxb7/Z41VHVoAGWgx2nMjVhtD/9r8VVZEHKV
         fuqENBryhstWSfUkfZL5E2WV6tyiKsE+RaCM7VtpgPf7m8u4rD/SWo3hkc3ArsoY50NQ
         hRIXBkTRQ/dwI/34PymqxrQamBJmjQo3jk08WmMbsEic9zfD+Rz8rL/et2s9wCBYJ+SE
         4TWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990628; x=1794595428;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b7Y85ZMNTmnO5vyHoGmhNUdpyQ1xa3t2s3wZRjsJimY=;
        b=vnyn7QCYtp0z8GvjYHNqfF60mZhcBfyLELK2ZMIQNkcsPL9ttk1NiGUnC8V6JUKeKA
         zPlVKqajqBBAIe35aAfFvpEKifhnqZOUeWAbXF0/z+2oHK4AWANlwhlccQtB+mwh46Zf
         87K3RYvwDZXf5XePTdpmIR/MuKPlUo3ftXtuLuy/DE/UscfWPNzeLCO7YWCUdaOJvK2H
         seOlE5675y3xTcZmIDwqov8yVNbEFbkRGiVd7QmE+ni5P06/eLYgyxt+0BxPYwPwgo5A
         lrXGzcipz6sglAjNi+qviRYiRRYvj0Ljl/FcAnTcZHP0D0VKATJPPlcsAdp1L7MGW79V
         Lt+Q==
X-Forwarded-Encrypted: i=1; AKwUvBy9qLU7NKziGGc69FxyMIqltSUz5raa1DpZlJhHUagG7eau26y2zOjml236+OOfRgsFoQOlogeRGpSc/ZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z96XvYNC4iSuLgOyzqcP9qnaTXc3D24VXRqTYiNKGUFhY6hfrBH
	vK+SUOcTYO/JgsBrmTLxGSi/y2IhDuVlnFEH67rqP71dylIYb5nmUbPcNMlQItNdnBg=
X-Gm-Gg: AYBFou2J4BA/u0HOYZAsiL8vPY9oF2PHU0gf7hfq/7cZx6XMGDfRNUCKWtW5RVbh3IP
	uD00rnYW+1D+ujfcFV7WpTondSctfYvkD3Bpxq3Vwt7R2PYLsWdaCUfVT9g4Pb0X1vGwlt/6Y6N
	udNtOw/GDUrqLpTdc2OCPHtseoYazNyXjztfRmZxtV6M0vRRYMILkukcvVfRYhSCo6zXZ1tHdo9
	I7t7VgxvSArwgnx8RpTZaq9Hpq+l4P1nUZQEyqmpZoP5UlqCsV2DF4mMriTEODygP/Z+HoexOjK
	EZMhtTB5LESvjFwdHQvE8LhYmwuf47ANBw2xff0FgDQfNF8kCF1YXXSZGmbk3BaMKAi6y6Rezb8
	Gn9u18j9OpbiPjNLAz8YvTcMCTcd1vN40sIqhfsyoZ7rtYMnbo5lYelP3ReH7imozlcWjLc5OCA
	QugmbMjHWwufaOvW7C/fNMYYK3nqhT21fWoQTxAPOeWRXN29yCio8+YKjfIo9dcZtEG4RFoQJKu
	HVIa7MgOuhjSR+uiu43mtbmrjlICIUzGVtwl6/gHYBZgzfUcbjrD0Bggo4TAJlC65f3hIiCxG1c
	0bm0uAfK/1w3sdbz0kNds1iN1W6BjOR6mw057Z0jtZmhjI2qE294mdAsQ6dt/zGPzPqbI03mKiB
	k1KDh3xATKw==
X-Received: by 2002:a05:622a:47cd:b0:536:764e:1527 with SMTP id d75a77b69052e-54e14a6c486mr53004081cf.44.1793990627606;
        Fri, 06 Nov 2026 10:43:47 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e25785f14sm26823821cf.5.2026.11.06.10.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:43:47 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xPOug-00000007JdL-0xGY;
	Fri, 06 Nov 2026 14:43:46 -0400
Date: Fri, 6 Nov 2026 14:43:46 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Naman Gulati <namangulati@google.com>
Cc: Christoph Hellwig <hch@lst.de>, Luigi Rizzo <lrizzo@google.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
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
Message-ID: <20261106184346.GJ663069@ziepe.ca>
References: <20261023140107.GC3977851@ziepe.ca>
 <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca>
 <20261103080933.GA4213@lst.de>
 <20261103151021.GK3889730@ziepe.ca>
 <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>
 <20261106173054.GH663069@ziepe.ca>
 <CAMP57yU-VhZWXijvwAXcN9=zZ+eWXZ6J1bkHuCJw3ocRaFaV=Q@mail.gmail.com>
 <20261106180714.GI663069@ziepe.ca>
 <CAMP57yW6Y4g-xM9YTB+MpgxPN7RFeEWhAPWvqrfOoMDEuL8HZA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMP57yW6Y4g-xM9YTB+MpgxPN7RFeEWhAPWvqrfOoMDEuL8HZA@mail.gmail.com>

On Fri, Nov 06, 2026 at 10:17:38AM -0800, Naman Gulati wrote:
> On Fri, Nov 6, 2026 at 10:07 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Fri, Nov 06, 2026 at 10:00:35AM -0800, Naman Gulati wrote:
> > > On Fri, Nov 6, 2026 at 9:31 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > >
> > > > On Fri, Nov 06, 2026 at 09:21:08AM -0800, Naman Gulati wrote:
> > > > > I drafted an implementation [1] for premapped TX and RX buffers on top
> > > > > of the existing networking page_pool. It is implemented entirely in
> > > > > the networking layer and extends page_pool as the default RX
> > > > > allocator, to the TX path. There are no hooks in the IOMMU, DMA or
> > > > > page allocator code. I wanted to understand if this implementation
> > > > > correctly captured the feedback on this thread. Key components of this
> > > > > design:
> > > > >
> > > > > - Chunks: as in Luigi's series, memory comes in 2 MiB chunks, but each
> > > > > chunk is mapped once per opted-in device through the DMA API and
> > > > > records its IOVA for each device, rather than using a shared IOVA
> > > > > window.
> > > > >
> > > > > - TX: page_pool accepts a memory provider for pools that are not bound
> > > > > to an RX queue. Per-CPU page_pools take 32 KiB pages from the chunks
> > > > > of their NUMA node; TCP copies sendmsg() data into them through the
> > > > > task page_frag and allocates its skb heads from them.
> > > > >
> > > > > - RX: an instance of the same memory provider, sharing the chunk code,
> > > > > backs RX queue page_pools. RX chunks of order-0 pages belong to one
> > > > > device and NUMA node, and are shared by that device's queues on the
> > > > > node.
> > > > >
> > > > > [1] https://github.com/torvalds/linux/compare/master...NamanGulati:linux:netdev_dma_pool
> > > >
> > > > IMHO the netstack should never read from shared/decrypted memory. If
> > > > you put it in a SKB you have to be sure the only touch after that
> > > > point will be a DMA read from an untrusted device on the TX side
> > > > (sending it to a trusted device would be a fail) and the final copy to
> > > > userspace on the RX side.
> > >
> > > That's likely a fair callout. TBH I'm not very familiar with CoCo and
> > > will spend some time understanding the constraints. I kept CoCo out of
> > > my implementation as I approached this solution from the overcommitted
> > > VM problem where we are trying to overcommit memory in VMs and use
> > > these pre-mapped pages to avoid using bounce buffers.
> >
> > Why does overcomitted VM use bounce buffers? Do you mean this is
> > about getting better memory clustering in page pool since the VM
> > paging granule is 2M?
> 
> Not exactly, we are trying to use VFIO passthrough NICs in
> overcommitted VMs. Since the guest memory is overcommitted we can't
> dma-map the entire guest address space (as non-overcommitted VMs do).

?? I understood you could and this was implemented under the
virtio-iommu by pinning the memory under active DMA?

Where in upstream does the DMA API force bounce buffering for this
case?

> So overcommitted VMs can use bounce buffers to have a set of
> pre-mapped buffers to bounce traffic in and out. We're trying to use
> this solution to map pages dynamically with virtio-iommu and recycle
> them via page-pool to avoid traps on each TX/RX and avoid the copy
> cost of bounce buffers.
> 
> This problem extends to generally reducing IOMMU overhead in
> networking - taking the dma map/unmap cost out of the hot-path and
> avoiding IOTLB thrashing.

Sure, that makes sense, but just having a pool of entirely normal
pre-dma-mapped memory is quite a different problem from what launched
this thread...

Jason
