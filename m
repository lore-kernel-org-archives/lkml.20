Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986263;
	b=G3gyF0v1V/FuYImeBRCRvuwhnPQk8ttLBfxzjd86AAMAPV952BTf/TE4NX1xWqUOlnQD
	 1mpCyPCZncDxHSgekvD3zjgMEVcgG61vVyTbw0b2JC8S3TbUEgQrdgOIu5q0DeHY8sx6r
	 /fn+kMCn2kUcVA51mfG3x/2KEjyOdGMaEj+5A0HpgBSJtr6r35GJmeyxlW8W84h94vHL/
	 2JcBZB4CEXFXqYOqSD7sp3EMxYt/RgqIN7rPWLkhBGTCCasWlLLiTuZ0QHZWIn/O1gbwd
	 C6SQYHhovrYTPBsMLVvFhLwj4SeGGrHNKQF3FxOCBIZxt7Q2CXZ9yXm/AYMbzpvx+aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XofOEQXNLqFn+X/AdUrRbjVcp2Tpjks1Mv/4b0yulcU=;
	b=XFoTzLWfOdD2pDy5yQ11rRCjrLl0Bo6y4j4m3lOAnxXD/61nHZJkk1vJN5YFLkA9e3e5
	 ZUMQduKFJpLiT6qn8SBTAaFfuTjBygquaKlWUJTQ3Enmm/a4UDfwnUWgmt+/zSVApxjnS
	 eulZaXXP78nV6Gtzq5gP3caTaXLOAKCpTiDiKTl+qdABRUA1KnbugedSKCBXRl33uxJwT
	 R04zYTMbNYTmuWPWtlNZWgS/5fqH0y7iolBzc/UB388epKxnt2RSPM6wcJMo9u9x+to/Y
	 +gWgGRrn/dZeucejl84YRU3/zAzYp/yGRcWhNV+KRusBOo1PtYcO2jwDj7aeRj6kyug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=fYsE2vYt;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00CF606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B00CF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=fYsE2vYt
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91c67992ce5so7082166d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793986256; x=1794591056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XofOEQXNLqFn+X/AdUrRbjVcp2Tpjks1Mv/4b0yulcU=;
        b=fYsE2vYtjmjwrQWdM228+vJrfQI/zfz4d8EZd9hqS+Da5DuaJIGJN82jYUkEQnAQXJ
         276pcvSkMpyOUA88uoZqfJepcWaH+fDLM3PeHPPLJDoYLRuQUX7KClXiaMPEZf13t3dS
         8XHZFyigHL7ZxZuRJehfyQvVfxcrRxiGZrEzmXaZhQ4zBnxGZXUn9LMEIWIf5ZX+0oaj
         PXesfT3jlDzAeRSoucM4rkP6lStrPSVTmMAUkaFTam6eIzVTnLRJ0Bq2t1kniLeeSNAI
         PChUbgBgn1IddS4SmfD+bsmAlxXOMcHOE2hRzkm09lHStjx7NS5P6SVi6CHEW1xsdg47
         Cdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986256; x=1794591056;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XofOEQXNLqFn+X/AdUrRbjVcp2Tpjks1Mv/4b0yulcU=;
        b=KndmX/hq0B9P/qvH9ge+LrXf9nUgdKVyeGsVGtit3OhhQ4jdp/I5I9YkAeNeElmXPs
         sNgImMmub/Z0/hG/FZPlTXCsdWQOkssfOduI8XwDDzMC8UxkMLSrqpYOIoNt1J88mB8x
         A7DfswDThgDzsLsLapqGguX+PGqXpsTFPvYHWvJN449pp+nTmFWRe/pJzYKMweo/Ly4F
         zmffG6Mv28UKMhnUMz6fB3tDMmKq5oPN+Y9mW1aREskqB/U0TSJ2YOJOwCPuROcRhggZ
         QzKSjTgkR1+Yv25UMuiSLwGVZnQSi7U8k6F9QoCmDJQWveYARm7UchZ2BmFe7ogoMyHT
         RvgA==
X-Forwarded-Encrypted: i=1; AL+hErF8NCorCk1N/tbOVyVTWOXJyIrmPFymrJxGJ6uNmvbzyZb3nrFnbID7MEgWRq1ZDwCz54Pn5IkwtEJJVT8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gunZfefvWEtyNp3kmIUM/LWqfvii8e39xtfdw1oJPwRQbd5XJ
	61Tum3i1OxXnG6Kmj4ThgNq+eYios9r/1KZCvgIyAtp0DnLebc76sy/HrlCh1eL2z/0=
X-Gm-Gg: AYBFou0bpRpsm46xmRmihUTS0b9IX1FWz1kxL+2bAzJHkBcfPFjF0JHtgqzMHnMUBdz
	Qkwwiv58WVK9J+EMGblbaVq2MjOME8oh6Y2KMurkzdpXWGMnzJGeZ+N6bDYvhkzmNaXxIkorwgf
	0sVfo2jRJOO6eE81G17Fb+qbEgP7u3mjxU+AJakGqlxWjHK/nY5PoqD2lf4ckztXyxg30xUKtvA
	QW357DMlQSyxFRq7Joe+ptuGtP7T4+6scn7MBx2Vfy84cyaNMWE6Uuc8SlzCBq6P/C2pCo82Pko
	EXvvJb92k8apZZqIlu5SXwPY3ljmFmWGO8DDOtEaHAa2hCzEc8a4Ur9kVUOgmBNxAsWsuHy05zZ
	XbF+DqTKaiEIQs7T+dr4untlNl78F0lYzVqazctVcNk1/A815ktIuwsjvuOMUbL6+RoTAkVUOMR
	MJev5m9fCyMzgr+0efLtQRL4PoXsoKFVLTkE4n13VfVU2ja6UJWEtSt5RPbK3TlyS0+qWxLsUHf
	Pwb7SCVthe3gjqm0UFEmTJ5Ht8+oqIv4sehi0P3Lg0t1ix8c0ToNULZk7IvciUHRlpWx9N8zK/R
	QKmtBR7tg6AQ/y71oE8EfMFVFVrjRoxxFYTXy6aqOWfQrxp/vwwSJdWVIPlAg0Vlzvw3lWgh03h
	HNnqIUurUkRTSpt8GTzgqSpThLeFEocA=
X-Received: by 2002:a05:6214:c69:b0:91c:73fc:a5a8 with SMTP id 6a1803df08f44-91ea9742db4mr40471196d6.9.1793986256339;
        Fri, 06 Nov 2026 09:30:56 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acceacsm25406486d6.43.2026.11.06.09.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:30:55 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xPNmA-000000076Mk-3tnC;
	Fri, 06 Nov 2026 13:30:54 -0400
Date: Fri, 6 Nov 2026 13:30:54 -0400
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
Message-ID: <20261106173054.GH663069@ziepe.ca>
References: <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org>
 <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
 <20261022201229.GH3381610@ziepe.ca>
 <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca>
 <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca>
 <20261103080933.GA4213@lst.de>
 <20261103151021.GK3889730@ziepe.ca>
 <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>
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
In-Reply-To: <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>

On Fri, Nov 06, 2026 at 09:21:08AM -0800, Naman Gulati wrote:
> I drafted an implementation [1] for premapped TX and RX buffers on top
> of the existing networking page_pool. It is implemented entirely in
> the networking layer and extends page_pool as the default RX
> allocator, to the TX path. There are no hooks in the IOMMU, DMA or
> page allocator code. I wanted to understand if this implementation
> correctly captured the feedback on this thread. Key components of this
> design:
> 
> - Chunks: as in Luigi's series, memory comes in 2 MiB chunks, but each
> chunk is mapped once per opted-in device through the DMA API and
> records its IOVA for each device, rather than using a shared IOVA
> window.
> 
> - TX: page_pool accepts a memory provider for pools that are not bound
> to an RX queue. Per-CPU page_pools take 32 KiB pages from the chunks
> of their NUMA node; TCP copies sendmsg() data into them through the
> task page_frag and allocates its skb heads from them.
> 
> - RX: an instance of the same memory provider, sharing the chunk code,
> backs RX queue page_pools. RX chunks of order-0 pages belong to one
> device and NUMA node, and are shared by that device's queues on the
> node.
> 
> [1] https://github.com/torvalds/linux/compare/master...NamanGulati:linux:netdev_dma_pool

IMHO the netstack should never read from shared/decrypted memory. If
you put it in a SKB you have to be sure the only touch after that
point will be a DMA read from an untrusted device on the TX side
(sending it to a trusted device would be a fail) and the final copy to
userspace on the RX side.

Everything else is very security questionable.

It is unclear to me how any of these page pool proposals meet that
requirement since page pool typically provides memory that ends up
widely used in the netstack.

Jason
