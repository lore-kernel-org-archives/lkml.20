Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793985686;
	b=R/h3ikqAv6zgLw8xBZkkKQ8zr1ZveKVSGRqhDtY7IdlaILi8IebN51Jk1KFBpKyPWVHE
	 dJt5tEeMgzrRzD1c52/vCnJF5xh5+okPwYLs37vhe/whGhF4ZSa4Hgvb58p6NhpMwMb6n
	 9eJJUHWBvQp0XpoYeeSp436HQ/W6nNWJvJRmbswXYwB7ICtL0xJbJJYd1s2yiy/RmOdDU
	 zRL1SOT1EspyIUYC1tAAWD9emnl3mR9MJci54H7mNs5dapIpzx4Ln2TaqCOhZp97MDwvR
	 1hg9ZQok25ztxVMXcAzXlmmZcbgA0JPOBlMiENtwNOCHEo+HXycLwvI1gt8VAWQH6ww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3RKt6UkQZGhVMeIsFX1m9xEh639vUr0Dxv9GzpFuH2Y=;
	b=KJV85DYSaOj54DUotAhbsIJN2A+DZgzLSoKYaqnBDGodVG+/qa5V1Y1kPr/GOjOt/QZV
	 1MpSzXZFsjAFD4+fB2YYJgxiDGvnIzEubmP/EHLYGMoC+8eYESU80wgwa6z+qk/pv0S/R
	 qFKdWfdxCoDUBBr2OOuSS/Dk0gVaeUfIZeufaXZKJm/VvoNYCy7IgOU8qRDzEq7Pi3tNn
	 T0ocbZl2VwOeTJRwLMB9sdWd4qQ95LDRo1Cnde/sN5vbrcLeuoLiJ+pdYwSVkEXzImnk6
	 eP3Pyi34BmP9p5PL82XFuqCmQTgwFzg1WKT7Cs7yG1/gInFDUDkhhu0vL6kM2vnnuMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=brHuzBNo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B35606D802
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3B35606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=brHuzBNo
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b76c15ae36so965e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:21:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793985684; cv=none;
        d=google.com; s=arc-20260327;
        b=LTQ3skzfs0pW+NtyieX2IFIWNxSTLD76GS0RZG6MvoxYPk/cQskmxeCGUZSQx1HwI3
         GiN0Z3j1RxkUvm5b0s8yiUuhFq8S2AdN6RnCCMONrkHzT0EqfIB/ElmxoEsDH2NyvbTF
         hAMZgUSpM+F7Y6sBdo0rWpEcv1x45S3NahPIwnud16yoD4qALNQyTwLB5+5gpMnRezrm
         KSt/RJ+kOtZh372mp6JYp8AgMx2AINtmck50vAHkZdd/bpDE4GAzgnPVPpwGUq2SzH6d
         2N7b3yu2vFm2WCrWw2MXCQYP9rdWDRtcFiyt4rulo0DmZxZffI//od6Uf4e79NJHY7oC
         6dJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3RKt6UkQZGhVMeIsFX1m9xEh639vUr0Dxv9GzpFuH2Y=;
        fh=0E5EQnk6w3dpYxgAx1bIx2N46BjYt0Mk2IR4mVILDHg=;
        b=go+fndYxiEtVafZNRxaJmeU3RCpxYRp9+2nBfb7t6ngWgJMXGDZ1rBfmP+D+NYzJ8o
         cFeQoOWufMHGGMEfIPol1ihDq/c/E3at871sQPSbyl0+6NFV6aU4opAcn8DY3GBIPG2C
         gBF+3WGe3VuIo6EJxqxQLgzvOhTBCfPmAhVosK1fMcSkDdXpMSh9izFtps+5x7bGXP43
         9UpTUwhoufOQkNrxycMeggEvMGUSgGjwlxVp3WUOBkeZazHS4rnISg5Pf3V750jCeJfO
         VR1p5I7gudQRAHrtFWc54me/rPK6ttu9o4m5A1NbtVe8SalH3CqZP3TAnvnmZDElYjUa
         cuEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793985684; x=1794590484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3RKt6UkQZGhVMeIsFX1m9xEh639vUr0Dxv9GzpFuH2Y=;
        b=brHuzBNooCSZjsSyXSFWMHBwfNjYNTG9a5Q3GfKsZ70yJN94/1w8oJ0YhXFD0HweTI
         c6IcxLxcr92YlN/aRCSw1AAeONF2b2T3QTgT71unjiSJd5fE9tDAasfUf0PvDE/Z6Ilw
         X/g6Cnh0qRbf0n2W6uL7JRiT4hiIN4Ik1e8K6GdO+BwIhEGoPL1NAnA4d+9ktJXdAlh8
         xxgcRU7Ghap1GLjOorZx0V6eGPaWP/d6RiEHe8vigfy9F0RG1ujzhJTCLnKuHDDyRKrf
         tz4kI9F4z4z8kTBYDRkYSH30f819pXVPbKnkddtLpC/W9IwCzgHGM+pPzaIVpPR7zN9m
         wfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985684; x=1794590484;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3RKt6UkQZGhVMeIsFX1m9xEh639vUr0Dxv9GzpFuH2Y=;
        b=ghKYJVZF+5UvMOPT04x3Ru7HqxNelyOP+0f6Jbgbm8+bpC3bR8fpIFNuUf6MiAMMUo
         OouHDJ6pCdEVOwpUDrFltxGTrTp40jkiC7IGii8ylihPkXp+0Q99rArPAhCqp1NQj+vu
         yzmTJKwQ0xkyZ6g07uqL1PV2ticvf/QIG9tkfE1W33nVWoGq52KXEYTA+h2rvGnGbpM6
         3LMmATdtuzEPAcLKp41jESY35KuUhBn4pWEHluPw/4oPkd2YxacYawW7JTxAhwz2EbhM
         opP5BC9XbXq60MucuZh9GViQW3eH9xcIcWsOG4K5CQgKcSjdutz81JwynR9hzd7b/Y8E
         4UWw==
X-Forwarded-Encrypted: i=1; AKwUvBzWrX3z8uml9BHHxmDM273bwbMQw5shMNsTO3wyb39bq+hi/Apjn5pQDpE1oJrsppsqgd64bEfNBjp6QH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eNAzCfiVbpBXZ6x6TplYofJgAY2kL1v5kmwY3flAK6aZWczYR
	2GtUTbW+RoYF9ufil3s6LRAS7e4CjKajVWyyOeBsfCdfjQsDlbRqjmIXFKA54f4OU/vp99BmXVc
	IeCZeLSr+Zvf6zxwDW1PVuJ8MSTWlsUnE/klka8z7
X-Gm-Gg: AYBFou0JuADGnl8dC+gb5qm9OBBOe/gZNZ93E2+vjwA2pUInSnfeT8kirqvp1lJCR1x
	XacX18c1lNDWlwTyEKqZ1AKu3yIImm4WxXIlcGB5o+k7axj6Xqq6MVVv/0JYgDc/0EBZZRTJKh4
	LXjyWx20JfXc5AvzQpqoQMJZd/2frmIlL5P7U0IwbMDzRUQZdoc0wVNmVtCmmIggJy9J+eXLUkT
	ucYyOq7DF1phNWpjXkcIfun3zWyUmNaNWfQGcEUFq+6kJi/aFXIp12ATU7HK7Bj+3KxiUcTVM76
	iDurOt7WvKHQP+8U4XL4P7t9XoPmn+xSYCSGlbe84tkdexGtVubJLyJmtpeZVJ3gmbU9NBi/bOq
	1zNuK8Rhbf260mQjYnYxtDNmmXax2EUEgRa7OgSuSqUBbXdWfE/BfyJgOed6+KYtDutPEBg==
X-Received: by 2002:a7b:c8d7:0:b0:4a1:eb02:37c with SMTP id
 5b1f17b1804b1-4b76cdf14e3mr150235e9.6.1793985683858; Fri, 06 Nov 2026
 09:21:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
 <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org> <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
 <20261022201229.GH3381610@ziepe.ca> <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca> <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca> <20261103080933.GA4213@lst.de> <20261103151021.GK3889730@ziepe.ca>
In-Reply-To: <20261103151021.GK3889730@ziepe.ca>
From: Naman Gulati <namangulati@google.com>
Date: Fri, 6 Nov 2026 09:21:08 -0800
X-Gm-Features: AclHuK9QrDyTYpPe0hyDJDnSB0d1jRnWKMXKMwxckIvbaQIWb85nKJEtPirUyxs
Message-ID: <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>
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

I drafted an implementation [1] for premapped TX and RX buffers on top
of the existing networking page_pool. It is implemented entirely in
the networking layer and extends page_pool as the default RX
allocator, to the TX path. There are no hooks in the IOMMU, DMA or
page allocator code. I wanted to understand if this implementation
correctly captured the feedback on this thread. Key components of this
design:

- Chunks: as in Luigi's series, memory comes in 2 MiB chunks, but each
chunk is mapped once per opted-in device through the DMA API and
records its IOVA for each device, rather than using a shared IOVA
window.

- TX: page_pool accepts a memory provider for pools that are not bound
to an RX queue. Per-CPU page_pools take 32 KiB pages from the chunks
of their NUMA node; TCP copies sendmsg() data into them through the
task page_frag and allocates its skb heads from them.

- RX: an instance of the same memory provider, sharing the chunk code,
backs RX queue page_pools. RX chunks of order-0 pages belong to one
device and NUMA node, and are shared by that device's queues on the
node.

[1] https://github.com/torvalds/linux/compare/master...NamanGulati:linux:ne=
tdev_dma_pool



On Tue, Nov 3, 2026 at 8:24=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrote=
:
>
> On Tue, Nov 03, 2026 at 09:09:33AM +0100, Christoph Hellwig wrote:
> > On Fri, Oct 23, 2026 at 11:50:23AM -0300, Jason Gunthorpe wrote:
> > > > Disk I/O is still potentially affected by the same problems
> > > > (cost if io mapping/unmapping, iotlb thrashing, bounce buffers
> > > > in confidential computing...)
> > >
> > > The disk folks already have a proposal to address all of this using
> > > io_uring and preallocated buffers. I really doubt yet another version
> > > is going to be interesting there.
> >
> > Huh?  If you mean the dma-buf I/O it doesn't really have anything
> > to do with disks, except that this is the first user.
>
> Yeah
>
> > The dma-buf iovec can work for every ->read_iter/->write_iter
> > consumer, and should be adopted more broadly.  Including by
> > networking instead of their own totally weird different world.
>
> I'm not holding my breath on that one..
>
> Jason
>
