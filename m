Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988438;
	b=NRo2x9isZ1cZeNW5lyAJIZTZanJPk7eesJw58d7HLSX8GhJ6P80tZteSjdkwjJxg8Meq
	 b6ZB1WrTW1hptZvbs7E36J18bW/TXt1bOydsvd9wXQMVWv/ilioYiUmbBaRF0nGSEUVO8
	 9jA/fDSUsREpTaqemgle6HVewiVFiR5LNP2ic3LV3A+EjVuE9P8EVu7WkMkDOPCXBezlB
	 k6sFuGPPMuaQFi3XCfIi4dPQ+Cduh43PDIm5RTF48t1eDuhqEEpc9EwgaBp97KPpwe3LA
	 4yoLgFaJamrwTrWKcIwv+I8xKzcYdgGgWzmiWSbCplmT9PvHNysIkSzdqoB/un3CpdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=xsa9e6MH9/SVm3In7oNjUcANbgdM5Ae2hGRi/O5LwW0=;
	b=ejJ8YByCmhEFAEJdR7GCaLfSsWaNn8iSBQTzzIDCeoEO5utkDbWoECv1ym23Vhqw8NmK
	 l+nlBQPYU/oY1HpaJ+Az+V44lMwzzEXRvp2ZJOjQvYQ+a1eCSFFyfjZY5rFzPqnRE9YDX
	 79lcPSFPxqT7bjPPNlLRnqchnLZqkeBclrHDOsWF0ZX914sc8gcbeQ2FaKeGvo55A51M3
	 BivelDa6QvzjB4HGHzMokNPDY/Xgi7LXmGDCzmHl8MoogZM7HvuWyv2bTN309Jbznt3Dw
	 BZcNPL7sK91xOvXZ8eVmvMu/3Y8r8JePkrIFu/rtxOtUr1ejG3eAnmhZiUZRZ9gT8Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=BYMekOj0;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0716606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0716606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=BYMekOj0
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53cd0c8614eso6715481cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793988436; x=1794593236; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xsa9e6MH9/SVm3In7oNjUcANbgdM5Ae2hGRi/O5LwW0=;
        b=BYMekOj0YLKZhnr+iVGVAmGRIyI1upa42CJ2T3XGuUPONpzfjEizxnMAOBorEIuOvt
         V1tD4WtF3cdKq7HNBr+RNQzsb/8dpXv7Slwh9yjySJem6KxDRha+0toC3mRIxyf/ljjW
         KZVIvbK6BTagUCEHSISTBvF6BQZ1G4UOX7ZODh58bbOrYjUZMTNeHuP01AJnpvZgj4nC
         0Z3i98k+Z9rwCS13pUoGAc4M0umoAHIDKl1uiYTToR1e5fna9zpBJhou0SOh7EuCwmDM
         RqgKGYL21aCr4GwV4a0eIUgUtZLCX9ixOJnCJIOFwdUIPE9ou9ndCwK0k8YaQCIV4E+d
         +zTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988436; x=1794593236;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xsa9e6MH9/SVm3In7oNjUcANbgdM5Ae2hGRi/O5LwW0=;
        b=UNEDFQR54487ZL/+rSefLL5uFcUIHpf2T+FAJteU6jNQUN4ODNCHxQtxYN+MmRVz7Y
         CuvWuWY2Cii/nqOQOvU9lhPUb3CxQ/a2zbWXySSyQD2P3BUMzmRDreqgzLS91NS4zHj3
         nrm4R934QPsthkIaxQvFun3ZSAnB6n1Llzjfdsn5D3UKNeySDMq26Z36rQ4VrdQ9fsSb
         XwBzVoakESpp70Mh0kz5XXdrB8cEnFuPFsYSTM/1uGC9Uwz7jxHGq01SiMUQJpw/dqxq
         A0d0R3fUe8sIIP2DJLlY+IJ1y9P6OwKoFjHiaNtB8xzl6vfTwlR9KTduNET5pgeaHHIq
         6MXw==
X-Forwarded-Encrypted: i=1; AKwUvByTSNIx7VUzQKJ4mLmLHt7/hLe4KAtvrIuZRbP4PAF/RdzI84V93W2yF3kN4lBcQ/4Zf7iuF/DICu7K6DE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4SjXiFabQYwZgYOJkw5McTRz0LX6xDJ7XFZn8H/z+vrby4gmp
	o/2pKGpMWnR+z3kBWe0clr67XsbKd68F0WBzft6QM29oZTL0rJwr5D5dTPxIBbUI3tg=
X-Gm-Gg: AYBFou2iUBnCOWzqHmrY0y54CqK1RfrgzEVh/gXUl3gVShJlYkSz/lo45IX4+3yvxA6
	dgL9efRQcAN0kIiZ6rthqSexCWEgzt7ErVPb9p66PfAL939N5Qa7Ayi9bOQML9mky624wSZ06FB
	PHEf4op95LdMByoauiw6DtEpeQmgXElKS7yL/FwbL3kJGpeBHqOt2PH5+rtRH7yOjUlqyui5Tzs
	pcRrl8MVq04ud43b3e/DWlxs/2ant5xVnEJuCt+JTwzrxcDxPK5Zys2fNJEnojgRAlh6YSgFmMF
	UY/DgEzcm9QsFMkXeaAvRBcCp4JRUGbOI4cQzn8gHJkXn2DgYyV7891i80jKx1ZmWyUGcZEwQXc
	dfrinZntrblvcshek4jnvJmjsWMPektrtf5JYaL3W1Ukexs0nDYQuR0Gh4UvxFLQZM+zJi1G3MX
	lW+dDIYpMgyqlvKVEU/IRXHqqJVcerGtCHuRdVIEGyA/ChcrzaHCPYQvWhThWkcs74qp+99dpSz
	HMrc+VExrxSMRP9jaKxwC6cUf7kYoKVaYEpsUk9jucJkPlJzwqYeovENzNOXm2/Dvc4BqNfsWqC
	DVgzqkMnfnT+kYmnAgQZRzRBm2u3i/oyjKVC/qyl76JmdwUm31HUW2au0vh4xc7IdhtJVNRS2VI
	snwgfCZqwPg==
X-Received: by 2002:a05:622a:480c:b0:535:a5fa:edff with SMTP id d75a77b69052e-54e15b63c63mr47814391cf.63.1793988436090;
        Fri, 06 Nov 2026 10:07:16 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e231d0710sm26555871cf.2.2026.11.06.10.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:07:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xPOLK-00000007CW0-3s9S;
	Fri, 06 Nov 2026 14:07:14 -0400
Date: Fri, 6 Nov 2026 14:07:14 -0400
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
Message-ID: <20261106180714.GI663069@ziepe.ca>
References: <20261022201229.GH3381610@ziepe.ca>
 <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca>
 <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca>
 <20261103080933.GA4213@lst.de>
 <20261103151021.GK3889730@ziepe.ca>
 <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>
 <20261106173054.GH663069@ziepe.ca>
 <CAMP57yU-VhZWXijvwAXcN9=zZ+eWXZ6J1bkHuCJw3ocRaFaV=Q@mail.gmail.com>
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
In-Reply-To: <CAMP57yU-VhZWXijvwAXcN9=zZ+eWXZ6J1bkHuCJw3ocRaFaV=Q@mail.gmail.com>

On Fri, Nov 06, 2026 at 10:00:35AM -0800, Naman Gulati wrote:
> On Fri, Nov 6, 2026 at 9:31 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Fri, Nov 06, 2026 at 09:21:08AM -0800, Naman Gulati wrote:
> > > I drafted an implementation [1] for premapped TX and RX buffers on top
> > > of the existing networking page_pool. It is implemented entirely in
> > > the networking layer and extends page_pool as the default RX
> > > allocator, to the TX path. There are no hooks in the IOMMU, DMA or
> > > page allocator code. I wanted to understand if this implementation
> > > correctly captured the feedback on this thread. Key components of this
> > > design:
> > >
> > > - Chunks: as in Luigi's series, memory comes in 2 MiB chunks, but each
> > > chunk is mapped once per opted-in device through the DMA API and
> > > records its IOVA for each device, rather than using a shared IOVA
> > > window.
> > >
> > > - TX: page_pool accepts a memory provider for pools that are not bound
> > > to an RX queue. Per-CPU page_pools take 32 KiB pages from the chunks
> > > of their NUMA node; TCP copies sendmsg() data into them through the
> > > task page_frag and allocates its skb heads from them.
> > >
> > > - RX: an instance of the same memory provider, sharing the chunk code,
> > > backs RX queue page_pools. RX chunks of order-0 pages belong to one
> > > device and NUMA node, and are shared by that device's queues on the
> > > node.
> > >
> > > [1] https://github.com/torvalds/linux/compare/master...NamanGulati:linux:netdev_dma_pool
> >
> > IMHO the netstack should never read from shared/decrypted memory. If
> > you put it in a SKB you have to be sure the only touch after that
> > point will be a DMA read from an untrusted device on the TX side
> > (sending it to a trusted device would be a fail) and the final copy to
> > userspace on the RX side.
> 
> That's likely a fair callout. TBH I'm not very familiar with CoCo and
> will spend some time understanding the constraints. I kept CoCo out of
> my implementation as I approached this solution from the overcommitted
> VM problem where we are trying to overcommit memory in VMs and use
> these pre-mapped pages to avoid using bounce buffers.

Why does overcomitted VM use bounce buffers? Do you mean this is
about getting better memory clustering in page pool since the VM
paging granule is 2M?

Jason
