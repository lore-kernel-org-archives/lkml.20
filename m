Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718626;
	b=S9R+2y5foNKUNXG9b7FSR5H8BraOWX0usjLgONmTWZoOvcnfwQzCxoafyIT1euarUA2e
	 oFOjnz47r5gBCnQLwdYMwGVScviq8wumUfmpXH9BMdE7cy2Ig+7A1VVcnldTzdfSOajvr
	 QUsfFkQLRRRKssKF42hJvUJY4Z/DJ5Hbr36hcl8f/f8CjeX0mC59dFGqvP1IHqr3kjRfd
	 cIJPTmVZbqnvK4RrgXbTkvQshiAcX5CL5S5gbeZFn0MD219xHS0Bx/gIz34uuC2l8rTsv
	 hA2Hg0avYafLIntiwhqrbStVp6Kq8Pt/8uFU50v237K4GNDXZVmvX1NLeoB/vSoChsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Vt7h2p23Imler/JHYQ9qmz6AHyS0w7TaI6hUPIpmc2U=;
	b=TqTQlg55kRBccUKI7tD7ezXWJLTZrPyhTLap4oPuVlBHXFEBF28HOrhJRG9msDrhXn/V
	 7j+atJkCR8h59qTJKg4PS/mkGtWMVaXiJn2GZgGifUMIla2htqlzCbkR6cXDzDMzWhNy3
	 TEiaov6cKZYBJjWTTiQeLqZ2pJ3sZF+FnajDR/p8nU2k2V8sadpszgBs+zLmI5gcLeV9N
	 gJ5wT5S1wuQtiKnJEQLncgPpMnwbeTj9tq7etBhtMSVeUv9V/mPB+gpn52Rk3ziwIw3cV
	 hma+LvzSsAFc4eUSfWTJ2EjJN8J9ChKEPeAakFlgRQHT05BCmmFQNwSNTvmD7OCWIaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=M+V3Eapy;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F29A606BA27
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F29A606BA27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=M+V3Eapy
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53c4b82919fso66374721cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793718624; x=1794323424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vt7h2p23Imler/JHYQ9qmz6AHyS0w7TaI6hUPIpmc2U=;
        b=M+V3EapyX+HqP1fKSJAlOXOQNSBl88VyBTDoawq7gz03CsUQazeiC6Mc+WP+qPtVQn
         UsqVNPLGFj0ef4KFNPZ/tU+07pPNs80lTiQ6+n9y3KoIryIZUUn0L7chcMupFsfI6odL
         CzzKK98n1/SjNmyjDs3IfYnctsWfNLJnpnGOHZmE9A8SI8N0VwUOPtMf+WIbTPBmV1bH
         6KQ91X8H80VPkn5TzAK7Oig6tCiR4ItroxMh5i3IT0X0RKXWkI+3rGyo3oFxpQO/Qb9y
         wZtp81G5ndgrxz6ERStz97IUJBMou2SyFiM2zcPBgA1C8yID7aBtgzm3Eez0211myTs0
         WVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718624; x=1794323424;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vt7h2p23Imler/JHYQ9qmz6AHyS0w7TaI6hUPIpmc2U=;
        b=KhRi0r1ndZpQA0OHHlEfJeJrWYLPisQgMomKXyuv1qym8tDYNXnHloBw8d5ooh6qW2
         bLfLEVQtt1Dvc3FMag80eFHrf14XfUaqUjc8vhjqhe8so0kSa3VvQsfq2LddAO0hn0pz
         kPjllgVIVQ1N2tu57SSInwXW9/v+ItQswOrKCQcjagTAtjjr1xvnTR8HdprRFteP+rzu
         Mt1UBcYzWiufn+786uNxuwr2LmNVHFspM+Wyd2fFm762bTmGhexxYr+r4ILKS32qJHTZ
         rrN/NmYHv8eg/Z4h0+a6sG+hIAy372h54otcIQvJdCfEN505kRmdgjui9CAedrk4YMF6
         awlg==
X-Forwarded-Encrypted: i=1; AKwUvBwj3fTgiqaCO7Dr/o8bb6KevyJ1Y1rr9DiPgG4dG9vL3FYkm7D8ezOpyJEB0+odIN5OnYi4NDYJWH3G7+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7+SOvTAX9+xLX1mIhrM4a1WruYBoWw3s89ZplSz+li0Bu35xs
	fuZfopH9u7aboc9TtKAQypxW+HSRMqlgn2+c40j3dYIFuEK4Ie7LMTkb0TTbBwoo1sM=
X-Gm-Gg: AYBFou0hSy+acr1fFsYBE/jAOIzrPHxoUX5JZNAzOBeq0C1bw2jxsphm9Wf0e8jmyvJ
	rKucTHckcZb/0CBw4wxdLmL4AT3StdR832dgMPsqBU8hO446R0J6VcWi8uUEybATa8UnaBgXdQJ
	QMTjUYC0snNuIxHmKCJ5xOSu6G3LX/apAjuvKmLHaYKAB0rIml4/2d+mH7pNyIVVBq/YVJ/k7Aj
	8JCRjalhepBiUiyATjlHGhgFbcDcjaoURUhmOT4nmLjTl4bzA1bWS9LwciG11MeuPPYz0tVqkQL
	UFPJG2dJUmDFBnfWJ9+ZZZjoY2NkRt1euwDLorq+8IEOqffPKehJ8IOfILArXbE4HVax0inDio8
	1E7U0xYpxevRBX4Wcr2F3iOep9Cdkj1Y1PdFaW1HggZfrlkTESP6+rTAcSerlvfJYoWPmwycXF7
	O3KIMNQ1lEAlDzG3kaI8zX9FekGWD7YZCT+gYhsthUF1ylSwDd5NzwVUg448fbngZIdUWfMdBFW
	eqweV6dvhWIBDOPqNan5/ij59NMbq76Of93yC41C7rg644gLe11X2yjzv0h50rqk7SMfDeM2GDl
	eA2DpRT2f8EkB1Dlf5hvV0e952HxeXwKybeNBw+/fVsWV65Nz/dMZrgivjdplKMdpGoI3DomJvV
	GN3VNVxYjyg==
X-Received: by 2002:ac8:5a06:0:b0:536:26db:d4e2 with SMTP id d75a77b69052e-542b639bb42mr236124421cf.15.1793718623983;
        Tue, 03 Nov 2026 07:10:23 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5498b49dcbasm27980831cf.6.2026.11.03.07.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:10:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOG9V-0000000DAq9-0szH;
	Tue, 03 Nov 2026 11:10:21 -0400
Date: Tue, 3 Nov 2026 11:10:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Cc: Luigi Rizzo <lrizzo@google.com>,
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
Message-ID: <20261103151021.GK3889730@ziepe.ca>
References: <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
 <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org>
 <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
 <20261022201229.GH3381610@ziepe.ca>
 <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca>
 <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca>
 <20261103080933.GA4213@lst.de>
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
In-Reply-To: <20261103080933.GA4213@lst.de>

On Tue, Nov 03, 2026 at 09:09:33AM +0100, Christoph Hellwig wrote:
> On Fri, Oct 23, 2026 at 11:50:23AM -0300, Jason Gunthorpe wrote:
> > > Disk I/O is still potentially affected by the same problems
> > > (cost if io mapping/unmapping, iotlb thrashing, bounce buffers
> > > in confidential computing...)
> > 
> > The disk folks already have a proposal to address all of this using
> > io_uring and preallocated buffers. I really doubt yet another version
> > is going to be interesting there.
> 
> Huh?  If you mean the dma-buf I/O it doesn't really have anything
> to do with disks, except that this is the first user.  

Yeah

> The dma-buf iovec can work for every ->read_iter/->write_iter
> consumer, and should be adopted more broadly.  Including by
> networking instead of their own totally weird different world.

I'm not holding my breath on that one..

Jason
