Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822215;
	b=b/1lQRBFwBzRf27NAu9V6ua1gZFT5Mb1xSMonWMsHW9zyxrHn8KHooX/ryHvgfJKvUxs
	 6oSowU73Ku7LTRZTDHU1dV1pDmTnlf8XFnohkZd7z5tDMQQpxsdgcyjLQysXpT/9rA3Qh
	 czdtIhqurXElCizbDZRIddyL8XMxgdGcyWPn59dqvfVCdXwBM0C7/cUHvmbmSIccC/OGG
	 VGv/96Lw8rPEnFpeh5hHThK1KisNB0g3l2nWD+lrkX1+L4TECjUyGmH/qTHmuA1xpE1vB
	 9pimx1RlPXjt+ZtFDS90DevnAmBQhP/KuO+Ra3jZ2vnAoSpK2M6/ie1FZW6FcfU+qRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=H4EFhcspofR4b1uKve6jkW0t06ZcJnK+4e01jxgUvKY=;
	b=kfvtHw0rjO6ADeFft/GHVr/qWICoknKHSzQAwECshnMq7JjjFJuSmJcWpuU+aaiBayml
	 1A2UV5vuMXHQQTCbmVatBvuKoQtYYxGxgDFVhE+R3aaBysPkl+/sSYj8FLPYMmOs4BjgR
	 V/6LKrCS6scjAsbvuYI7BOZJaQZ3yT6ZaKaWB1NgHAR/QEipjeRdYoN5vjP1uFcjpqUGV
	 XMrexVjEtlyMl7S9TU2IjfT89TUtVC1X1J6pfkeqhzP+QMeUI2AvsJ2y+ssA4elRZoKgm
	 YLhpAbLfj+tpWXGdswDQBe05RnxEuFPcDU3Va5G1QzsYJd++2epa4hTaMXwGmIWwE/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=NOYbjt4I;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A8460E7518
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5A8460E7518
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=NOYbjt4I
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91e8938fd01so8199096d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793822208; x=1794427008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H4EFhcspofR4b1uKve6jkW0t06ZcJnK+4e01jxgUvKY=;
        b=NOYbjt4Imc3+qorIumC+DRJZJAO0qhFz2+pHwAqi1zEfxbu5bWra1k03HlG+YF8OE0
         WKjfE/pOBFyetohPjOlWRIhA3mHsvRg3GEzx+kZNd85Tcw9pNYivl5EYC1NXy62tmniP
         gfHDnSvMNrT/1wmCWo8qKmeaA6avWngSwYmx+WOENThvjaf8vGgHAM8uDVShiGtqafNB
         dZi4T7vTdEPrAERrYO9q6y9kwI0R3aYEicWhk+Jpjlz0jrkNcq8bxHaiqcO0GVGivwc/
         nsafW92bbB7UgGLKxsQlYu14YFh/SmKKEmptiEwveqc9jy3+1WkRK+IFeCBabo6QyWsw
         eAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822208; x=1794427008;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H4EFhcspofR4b1uKve6jkW0t06ZcJnK+4e01jxgUvKY=;
        b=xLdz1q8raQ9aOhGhuXQBrnVo9H4IcrndBfuWskdNkVCHm5MTaN+8sqLThYeZ1u1uui
         zJ/R9nZqOClDO31QVfdhkNHJJRbmZtCHCQ074Dn5VsyF3RoYj4TASyCLjc9B0CF178yb
         WHrH/4jKuDIzkXaN6+GgRYyUE4SyA/XvmsZCFmnE9hnQS86DsuzuHLSoQjFyF1mu4A7M
         cd4BGAuUmK31nSSBK47E5E/QrYJ0DRxB7I/IDdC286n4GGd4urnkRmVaKapjxMYai8TB
         XMroa5YCS4hEYDM2nCCw8ELkykmSdyHLFM51ImN6LHMo5hJmWnMO+u+o9Aj7y2Lkyomv
         J07A==
X-Forwarded-Encrypted: i=1; AKwUvBzM2AwZ/fjV1mt/iQWFv/gO5+lSFAJrIuAf7e2yrkzryel3E/Zg0ju4V+WsHB/lvBcO4wBfzmbjNxGZ8RM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RtQofyxo+Ym4rG0dAwBhVWDriUxYm4aiYY8x22RrJiomJ4Ao4
	bY+MZS0+4GWfr7x649dxGI6DOnBlKfa/yznM/JqYsfa0YD/+tUGkCZmmuGajgAiEgLc=
X-Gm-Gg: AYBFou00ug1gr058Dpcq/XGU1HGLgep5XPgSVBzBGupujZcmGVHZHJAAMAHx+ZGHUrn
	715LeOG2tgNs+Id575bUGkYyiKNlDQrBQErtK2cLnl4uJR9mGtWZXWgvmx0CnMoXL9w2h3yFLyz
	hlOh13lD6NK3+TemjMxyJkxxKPo/Cu49Inc60tN+oikug1FBW0nyQrVJ096UGAstX4bXL5ldx4F
	6gFFAMTMkrkU77zhLOYI1GGhEw+rWYlsWvtR7W0JskEcMGhQI8wWBJ5EviliFsGCxG4U+g+pQCD
	SlHGsgBck5sohASZXXMIOMk5jbkRk1cZKxDcVZVLEKc+x1H616nVt4de8zgRxiviWpi0C6uratS
	JTT2fXqSG9Eespblkffk1KgH9MXcfaoryXF9t7rqfKWERTcZGIek1uCoD8WgTZKV4uCRd1KvnEF
	waE6v6uzXXng5O0xOyuCGEklRGDS1jxVciDhR0UQoC87D9EFMSoNpogCdG6TfMh/JDm4Sb8sRd/
	vfC74G2mFDAOEiVpFUyqxIMBpFpK94DMmP6CXqvCSuWZ0ywyo49vuBW/5MEhjXPUGw1VhTx4+s+
	/RuGc2xHgNss1EN2BNzwco5vXLVg+h9H4vNd0GtFUv9nIN705ohlS6cX/TLU+0mv8ZCSdz1tRxR
	fJJy/5V5mdw==
X-Received: by 2002:a05:6214:2dc2:b0:917:9cd8:f26f with SMTP id 6a1803df08f44-91ca4b1b1afmr281180966d6.25.1793822208495;
        Wed, 04 Nov 2026 11:56:48 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7e7b1e92sm27199686d6.45.2026.11.04.11.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:56:47 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOh6F-0000000HJlF-1F1D;
	Wed, 04 Nov 2026 15:56:47 -0400
Date: Wed, 4 Nov 2026 15:56:47 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, iommu@lists.linux.dev,
	Tushar Dave <tdave@nvidia.com>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-rdma@vger.kernel.org, kvm@vger.kernel.org,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>, Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH v12 00/19] PCI/P2PDMA: Route peer-to-peer DMA by TLP class
Message-ID: <20261104195647.GD3889730@ziepe.ca>
References: <20261104084328.GP264423@unreal>
 <20261104171412.GA1247928@bhelgaas>
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
In-Reply-To: <20261104171412.GA1247928@bhelgaas>

On Wed, Nov 04, 2026 at 11:14:12AM -0600, Bjorn Helgaas wrote:
> On Wed, Nov 04, 2026 at 10:43:28AM +0200, Leon Romanovsky wrote:
> > On Tue, Nov 03, 2026 at 05:37:42PM -0600, Bjorn Helgaas wrote:
> > > On Tue, Nov 03, 2026 at 10:29:39AM +0200, Leon Romanovsky wrote:
> > > > PCI P2PDMA applies Request and Completion Redirect throughout
> > > > both paths.  This misclassifies asymmetric and nested switches,
> > > > and reports one answer for every kind of TLP.
> > > > 
> > > > Three ACS controls act on TLP attributes the Requester chooses
> > > > rather than on the topology: Translation Blocking and Direct
> > > > Translated P2P act on a Request's Address Type, and Completion
> > > > Redirect skips Completions carrying Relaxed Ordering.
> > > > 
> > > > Evaluate each direction at the path divergence, decide every
> > > > class from the one walk, and treat a client with ATS enabled as
> > > > translating unless its driver declares per-mapping ATS.
> > > > 
> > > > This completes the P2PDMA side; dma-buf and mlx5 follow
> > > > separately.
> > > 
> > > Is there a one- or two-sentence explainer of why we want this?
> > > I'm thinking in terms of what Linus will want in the merge
> > > request: a fix for something that's broken or some new
> > > functionality.  It sounds like this is solving a problem, but I
> > > don't know enough to translate the nitty-gritty details to the
> > > higher-level user-visible problem or feature.
> > 
> > Not AI; these are my own words with grammar fixes from AI:
> > 
> > "The existing implementation of PCI peer-to-peer assumed that all
> > PCI TLPs were the same: ordered and carrying untranslated addresses.
> > It did not account for the variety of traffic types defined by the
> > PCI specification. As a result, only simple systems supported
> > peer-to-peer transfers in the upstream kernel; real-world systems
> > required out-of-tree patches and careful platform design.
> 
> Can we be any more specific?  E.g., what makes real-world systems
> different from simple ones?  What does careful platform design mean?
> Something about ordering beyond what PCIe requires?
> 
> ACS P2P Completion Redirect affects Relaxed Ordering (RO) Completions.
> Translation Blocking and Direct Translated P2P affect Requests with
> Translated addresses.
> 
> So I assume the existing P2P implementation breaks somehow when RO or
> Translated addresses are used?  How does it break?

Let me try, something short for Linus:

"Enhance detecting if the PCI fabric can support a peer to peer path
by evaluating the full bi-directional fabric path over each of the
three traffic type ACS controls. Expand the number of fabric
configurations where the P2P algorithm makes the correct determination
of support to include non-uniform ACS and situations where translated
takes different routes from untranslated."

Jason
