Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793992308;
	b=mLpqFAvQ/cp0FfvnKQeMWcnMiSq9H+xYYElOZOMIfoztbQmmtav0hTR3EboTjteGF7LK
	 +WqTIpMuxL9T7vYP4pZQgOO1WwnGHNSsvMxzRcqGV3tYEUHnffqsXCBXqJ/CCmosMenJJ
	 jAn5B8eRDIPiAS6OXNSvjraYB+v5/sG/XzdZWmzSaZ+R2DcMiQQ7WQxkXoVa6+zt6Lm0r
	 B/NBcTS4ZXQNCwsbw8Q3sDKRIyy0SyYKJmy+TNhwqB9Q+QjXqTN7Soaj5sAq3osw+AzRi
	 wt9AiTo5JvVWeWhshPhnyKNgGrYKAAs5xcw1wXmFIQ0tw37VQ1j8vGvcSiS4dBM1weQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793992308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=h2A6aCl8kyfujglJb3VkwVgvWA7M4CaDd0+96AnNPHA=;
	b=5RkFsK5wwVMSL2IkkOgCOvEYtAmsqIv3aXtM4fk+QWFuFmIy097tR4FRPzn5DL13z1Mb
	 8qkAliiemtpJ2K1dgeHV625Fi0TIRnAvy13/4fBh+R3tI+BY2LAOo7Var6fwxQAG6uTbb
	 7M3jmedi5Q+uHwR3dQISE/ewqo7Wf4bO78e/yAK/WuBCcX26EgBCMP7kOBavRJJGbSpaq
	 Xv9S9A1cuKr3fZjcxJb/rnDGpr+tjXWgTfVnau2OACAdysH8ZO4gr43jUeYXrb/yCbi+3
	 BlKUZxGibshbUQVHNE6rLxbPAPL76mHeO97Hod655mHDdNZDCl4BisJoT/81NYYUxVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cW3STcxX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA21E606A335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA21E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cW3STcxX
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-54492d8a988so951cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:11:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793992307; cv=none;
        d=google.com; s=arc-20260327;
        b=FEx/mDehPdpkiSLfDFG1aQcDiL/Jij9vYUarfAgdV+SPEuW9CfY6eqZqVN7TkZtSWS
         OszgqpfKV9DmBurc3B7KxK5zInJckem0XTwIM3Lzp0MS+8L/Q5T1/QEsXTJjPQm73eQk
         v5VDt3EzhcgogDjRO/wJxFGxIRRADsZlLjCYp3px49QCrErlwTPF1rClR671BE3cHGOk
         Nz4+EzP4ouZ9TE+Z1XqDnatnDcsfO8NEENVIRXL7J+xsYXXDou0Gwkzxboo1m14uPaMp
         hHU6DfxeO94DcajONMFQZl6l7lBvzdLbzOHLof371nkpVV73vjdDE7TDHymmTkysfOIK
         Z/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h2A6aCl8kyfujglJb3VkwVgvWA7M4CaDd0+96AnNPHA=;
        fh=Jy+AFN68C3GZi/c9ZTRKa432XD9ouKXo8W7wukxAWRc=;
        b=ahfXMQT3gzfFdxeW2Q9kfyAhVmUdhVphmSqzeFUCok9Va5s3LtCzEDeXOMy7WPPZEX
         ITLKGViI3sgvvQE4zXhuKtc6jLl7mIcooI+sJiPaDSxmWSH1BzxSqgatIaty4vEM6/ez
         ySJOHrwYfEpYdbjB9Amu3CquLOxvrjq70EfHqZC4LFJnC0DNbXaoye/HR/cQBEDI2UQL
         Xjm0HFMFtQ789xj0qKU2I7PEzOJGfwkX3cJ78IF9AWb83NhIMipfdmkcwXSKJ/qlccV0
         ntpKAu717UWrQii32H3DbZXpnow03Bd1Xww1AxX8Rk0hBVud88tfTmkk300DbBnRZHen
         e7Vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793992307; x=1794597107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h2A6aCl8kyfujglJb3VkwVgvWA7M4CaDd0+96AnNPHA=;
        b=cW3STcxXnYNSuqGRn+QlFzxd7OWsmJ4iP0YchaBVX+Fn90tmwSR9Ig+htbKTNPlwbe
         zDR4nv0Zln0XJD2lbe77KotnoteJPOBQ1XVLQAl4512CVsnszBKeqCPb/Gp9EeA2omuI
         H4o1VOfWNsQh1UweHWUVw35Wz6UWQRrylIEQNIkd+oPedbQCacpfWc1Khb2NcioZz3Ta
         ftwLwOl2M8sCGrs9ydOPBv/Fa5aDq8gbbm5/OMkB8z1ctC0bNmB/Z3wDbTJ2NsAB0iAT
         XlmaA+0wbc6gtMIvNJs8VwHmiMuBZhJb31taEkBA+5N7r42oF0ehn5aNyfneUn9ttDb/
         +JQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793992307; x=1794597107;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h2A6aCl8kyfujglJb3VkwVgvWA7M4CaDd0+96AnNPHA=;
        b=Fpmm7X1viaimnMNbhZfq4ps+PC8HB5Cd71LlKylLu3fBTjg9ibYG4WdC18auAlHirX
         kqPX/3v/Nmzie330C9hA2MMmhS5u1mXhwatJLFFOgiBCwLcthOhZOElNRrsCtHRfoztj
         XtbwiOnWE+7EZ5zGkNJ9LHSoMbKMQOX5+jUgHIPXRxZ9ybkdum/BDXV9028QQ9XNlfAF
         cTWbCJNnDPo2fWfZwUYOlzdceIdy7iM5S16sv9e8aVovb+C/0kFpB2Xe5jgcVWih/lHE
         KtQb4hQ3fC9pV3HVhpPyu94uJSpNyQHHgQ//vq6SE9orDDWURfecN6Cir19tZ50AeDxw
         bUbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwj4aih9D3kg/hnwfy+mFRMa5UuxKFtMc1/FUDwO9Te8jywKvYEADRUiaakKeswoMfY1DhWWeTe2vs6SZ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VlQ86O8uXjcIWKfQQRrWD9kwy0whPPzY107OjD86krihuQQvA
	1prJNqPkSVTCmbPicIGo/SDBBgcw2xY6ZY5QixCc36GPuIfdCXX4q1L2+M8D9L+7YCTpZ6K6nFe
	aRdAH10/BNEp19nHkrtEvM+aXNzf3rxQ7qUQYVfaZ
X-Gm-Gg: AYBFou28TcNzm1InQgT3qaMCVA/2h6BFTpsIZa+lb/Q8fAIX/eU+wV0wz55mhs5MZYN
	yJzHFCf8K9HJenmmaWxUUxFFlZWyhMAuoIwDAfYE9M/2Yk6Ijn5pY9CFedGkdlA90O7Co4pZpvo
	GCFdE9lVuu//KgZWyK86z45H8PNn6JCdRUuNxLqrxlYA84TjXiowJi9XW+3oSR8njB++miZSHpo
	Wf2D6DTMb075s8K0ExN1EzlgqCH+8EnFsPResAE9zOc/F4S5FMBXsD6cHvOLRyr02hMWfMSctG5
	8XnOMwgQz2orf/AaQ+C9IeCDcl+LEw1Nf50sDye9exPp+6GwGHcnfJU0oUfxtaYFtpzeylppTdX
	AwLph2ZQ1+8la7iO5tM2JR+AEcnhqcaPCQ+/QyFC+QXl6S7STs1P7GNqld1wwJqGR9boQkQ==
X-Received: by 2002:a05:622a:2297:b0:532:eff9:ca08 with SMTP id
 d75a77b69052e-54f82d870e1mr1932401cf.12.1793992305834; Fri, 06 Nov 2026
 11:11:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023140107.GC3977851@ziepe.ca> <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca> <20261103080933.GA4213@lst.de>
 <20261103151021.GK3889730@ziepe.ca> <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>
 <20261106173054.GH663069@ziepe.ca> <CAMP57yU-VhZWXijvwAXcN9=zZ+eWXZ6J1bkHuCJw3ocRaFaV=Q@mail.gmail.com>
 <20261106180714.GI663069@ziepe.ca> <CAMP57yW6Y4g-xM9YTB+MpgxPN7RFeEWhAPWvqrfOoMDEuL8HZA@mail.gmail.com>
 <20261106184346.GJ663069@ziepe.ca>
In-Reply-To: <20261106184346.GJ663069@ziepe.ca>
From: Naman Gulati <namangulati@google.com>
Date: Fri, 6 Nov 2026 11:11:28 -0800
X-Gm-Features: AclHuK9JPUckmOeUyc8sSIbL-A7oi1CB3RcBM1vHWdycPuPf0ms-UPAYg2zqwxM
Message-ID: <CAMP57yU7RoWXkvOfx3ksX8kaO+0h8WPefpjnY2DH9WR_TYGJog@mail.gmail.com>
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

On Fri, Nov 6, 2026 at 10:43=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Fri, Nov 06, 2026 at 10:17:38AM -0800, Naman Gulati wrote:
> > On Fri, Nov 6, 2026 at 10:07=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> =
wrote:
> > >
> > > On Fri, Nov 06, 2026 at 10:00:35AM -0800, Naman Gulati wrote:
> > > > On Fri, Nov 6, 2026 at 9:31=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.c=
a> wrote:
> > > > >
> > > > > On Fri, Nov 06, 2026 at 09:21:08AM -0800, Naman Gulati wrote:
> > > > > > I drafted an implementation [1] for premapped TX and RX buffers=
 on top
> > > > > > of the existing networking page_pool. It is implemented entirel=
y in
> > > > > > the networking layer and extends page_pool as the default RX
> > > > > > allocator, to the TX path. There are no hooks in the IOMMU, DMA=
 or
> > > > > > page allocator code. I wanted to understand if this implementat=
ion
> > > > > > correctly captured the feedback on this thread. Key components =
of this
> > > > > > design:
> > > > > >
> > > > > > - Chunks: as in Luigi's series, memory comes in 2 MiB chunks, b=
ut each
> > > > > > chunk is mapped once per opted-in device through the DMA API an=
d
> > > > > > records its IOVA for each device, rather than using a shared IO=
VA
> > > > > > window.
> > > > > >
> > > > > > - TX: page_pool accepts a memory provider for pools that are no=
t bound
> > > > > > to an RX queue. Per-CPU page_pools take 32 KiB pages from the c=
hunks
> > > > > > of their NUMA node; TCP copies sendmsg() data into them through=
 the
> > > > > > task page_frag and allocates its skb heads from them.
> > > > > >
> > > > > > - RX: an instance of the same memory provider, sharing the chun=
k code,
> > > > > > backs RX queue page_pools. RX chunks of order-0 pages belong to=
 one
> > > > > > device and NUMA node, and are shared by that device's queues on=
 the
> > > > > > node.
> > > > > >
> > > > > > [1] https://github.com/torvalds/linux/compare/master...NamanGul=
ati:linux:netdev_dma_pool
> > > > >
> > > > > IMHO the netstack should never read from shared/decrypted memory.=
 If
> > > > > you put it in a SKB you have to be sure the only touch after that
> > > > > point will be a DMA read from an untrusted device on the TX side
> > > > > (sending it to a trusted device would be a fail) and the final co=
py to
> > > > > userspace on the RX side.
> > > >
> > > > That's likely a fair callout. TBH I'm not very familiar with CoCo a=
nd
> > > > will spend some time understanding the constraints. I kept CoCo out=
 of
> > > > my implementation as I approached this solution from the overcommit=
ted
> > > > VM problem where we are trying to overcommit memory in VMs and use
> > > > these pre-mapped pages to avoid using bounce buffers.
> > >
> > > Why does overcomitted VM use bounce buffers? Do you mean this is
> > > about getting better memory clustering in page pool since the VM
> > > paging granule is 2M?
> >
> > Not exactly, we are trying to use VFIO passthrough NICs in
> > overcommitted VMs. Since the guest memory is overcommitted we can't
> > dma-map the entire guest address space (as non-overcommitted VMs do).
>
> ?? I understood you could and this was implemented under the
> virtio-iommu by pinning the memory under active DMA?
>
> Where in upstream does the DMA API force bounce buffering for this
> case?

Sorry, should have been clearer: the DMA API does not enforce this,
bounce buffering is typically implemented by the drivers in this case.
Such as QPL mode in the GVE driver.

>
> > So overcommitted VMs can use bounce buffers to have a set of
> > pre-mapped buffers to bounce traffic in and out. We're trying to use
> > this solution to map pages dynamically with virtio-iommu and recycle
> > them via page-pool to avoid traps on each TX/RX and avoid the copy
> > cost of bounce buffers.
> >
> > This problem extends to generally reducing IOMMU overhead in
> > networking - taking the dma map/unmap cost out of the hot-path and
> > avoiding IOTLB thrashing.
>
> Sure, that makes sense, but just having a pool of entirely normal
> pre-dma-mapped memory is quite a different problem from what launched
> this thread...
>
> Jason
