Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599978;
	b=sfl8UZ42AKQ16YZRg1bRpPr19SI4tZVwv7f9dqKtX00nQJr4+/HyIwUzFOHMVciSpf33
	 Zo2w9Zv8NSO3xcgzJATWWaaC4BM0UN2jXbK9j93S+2uN+dzZ/epRsvW7yZL0dZX2m8csh
	 fpf/csIqe4JcRXSNYwp7pUp3EalNBn1Y+ImYpwRn/N+FSyhgf0ma+pFXEp5xVDZoigX3u
	 pL4SliWaqng6FwRa/BcGwJgP9F7LDM7XtZfPf+PzjaZ3dO7TcpE5D4l2sYu5r0Yb8XDOc
	 dZtutXVRp61MGoIQPFZCIEje6vh0friWam1b9jac9oJz11MZx7UBzZXM/XcZptONXEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZZ2nZZ3s6y7qol6GLZvqI4xyT/lOQ3RMsv1KGP5S3jA=;
	b=oRFXB8qXzRAiMmo5CgsBnIf1SPpyvmjWleRdEwv7M1xvvHlIRqHmRxipp2jIB8+sXIMe
	 cGkpFpGJqXfd0KxDqGYAokWGz1esTTCI2Y7LnaDL21Fofy1Px9q9gj5DjbEnbsO6G4UHv
	 qDqXywGekJKSHl4J7A3eoSFEk94xdi9mp7xMwnHSk7c/OXmsWByjTY+H9eZ4XexKXnqGx
	 xlttT8IykIC+KCkjyTkMO+HpLB8oXXY4FsRWaDLqnzw+v3TtKNxrS0o2YTFs3Hu1XGTZD
	 pdCIgdu3jslU/S+G+Z6S5ofuuT1t5jPLxrIV6/EsKgsYt/iik27AEy+/XEunneTC1sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Po3n9AZ5;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1483D606B561
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1483D606B561
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Po3n9AZ5
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91f30ff609eso6418726d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794599977; x=1795204777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZ2nZZ3s6y7qol6GLZvqI4xyT/lOQ3RMsv1KGP5S3jA=;
        b=Po3n9AZ5ukCVtyxupRbbfrpLGYxngRljlMmr6URQx5mXBtNOQmayJr515hpgVNj4sx
         SfBF8u0oI8BRgh0FyosgUvP4tKwELgo4ewaKIi5JN8mRtCuCRmvkGWXjuAw/02iadmRA
         uDnxdZ7AXUvdkY1hWsdsHvfshz1nH6EsEpR5OkjhwJvolkOQui9lyzTw24vhAEBxWDRt
         KI1J+fFxELXn2bRApiz8FOoEpAjp37dDgQtZRNcDqm1xmiXUP7jrvFn6TT9BHVcob1x2
         umNuZjQRMa9C79LylxXf/Ma826OY9RYwk2x+s7ONJ5FVSABT6CpUk/vzeFrO9xuYf9Ln
         k9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599977; x=1795204777;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZ2nZZ3s6y7qol6GLZvqI4xyT/lOQ3RMsv1KGP5S3jA=;
        b=aqK5pnwZ3M0K7FEUXZq5QnisnDjjRAsUGPrqAXbRqm28CFlRrKyEunirebb1DVFZAy
         /lHRgLLb4L0zE8mZfieY9VP3lQd2sb6YMC9pkPvYlwV5ELrp2ZOLhrtnZBvwG9uKUywQ
         +VsjipdZGz+QyYzzq20V0IPz7AO9XTB6m4W+5eYdLEGExVT3NfVCS1PRh59Uk9YE1p69
         yyuN7H10sA0F00aWX5Cyp580koAoBiyGeSOB4mAfZT48EHrFWpp+4tuX12HnmF4OGh31
         Y5+eTEZ40zeDwEUfnEfOiMy1S/sP9asjXN7rySwfvLhq/3CWOpb1Xbo8wQZBCxWNSfey
         8GOQ==
X-Forwarded-Encrypted: i=1; AL+hErH1YjTSCcSRL5YT16lGQ9IwysDym6GptAI08EySx7OGngyj3h9Yy08+CJFnFY6f8Do/wXkoxkM7YDDbaps=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GYJCzNKnfqBqZqEG4VGGypOfMgqeIgvFyh9kSpaEMy/qaRl/0
	p1yksrpPKs7XsotfwZlBGzL5F7/dW7lhz7WQimm98hzJjdn9AYYvdoZmA2N/lfr+SA8=
X-Gm-Gg: AYBFou15SLo9h2Uu/SEnMTFvsnp06s3CDm3Cs9DaPsLrYlFornWwmC7tITevaUSl2/d
	ivOSJ9yy88FPupAUeyA+ezGMWv61FrbJKiAMYhBYAzxwhx3dWP4RHnZlJIjhdCWb8Qk1EkxStOy
	T5IVCXhw4Zn5cvmIVb860OBmUS9idyFP5Bjk5tOs8lZ+R4iUb9BNS+Wvam2FXwukDzAYi3cutGn
	vDfC6cyAvQ4XyKQ5AVQgebcUmDTRCm+/Za44rpHA9g6L3lPjNUA8G5zLUSNR3j9f4pETnpvNQ/v
	/PTWplwf3bVgPpsT3zJRoHAEd32KhGso5+DgxvtEUen9z8Kh7fpMueZQ/7tZuH84CKUlvn6sM40
	H6+EOUIyeyD4sH6DfRU2e56hC7QC+eQYuzRdkl4X2nWqyIgGnKxrCN9CQbJygJKXrq7gpA3vQ+f
	yGD/NooVj1mDFD0z0N90RAQeS4mJfwRuEUy4HGu5an64Tg2k4Ma+ChKW74/IJfxDA+fuWZTsa8U
	IOh2Hi3U6/HQWtJrRzv+i6VKD5kp5A3EbOI954tDLqkN8RxSobSOKB6T0qKXDlOFQ3g5sFgV9Ll
	JK2b3g==
X-Received: by 2002:a05:6214:451e:b0:91e:8d6d:21c8 with SMTP id 6a1803df08f44-91f2423e922mr59090456d6.54.1794599976764;
        Fri, 13 Nov 2026 11:59:36 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db49c5sm27322246d6.41.2026.11.13.11.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:59:35 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xRxQs-00000001ekG-3813;
	Fri, 13 Nov 2026 15:59:34 -0400
Date: Fri, 13 Nov 2026 15:59:34 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
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
Subject: Re: [PATCH v13 00/19] PCI/P2PDMA: Route peer-to-peer DMA by TLP class
Message-ID: <20261113195934.GD2532299@ziepe.ca>
References: <20261111121602.GQ8635@unreal>
 <20261111224136.GA754433@bhelgaas>
 <20261112092326.GU8635@unreal>
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
In-Reply-To: <20261112092326.GU8635@unreal>

On Thu, Nov 12, 2026 at 11:23:26AM +0200, Leon Romanovsky wrote:

> > I guess one benefit of this series is that a path where P2P Completion
> > Redirect is set used to mean that pci_p2pdma_map_type() would return
> > PCI_P2PDMA_MAP_NOT_SUPPORTED (unless the RC was allow-listed), and now
> > it might return PCI_P2PDMA_MAP_BUS_ADDR because if P2P Request
> > Redirect is clear, Requests can be routed directly?
> 
> I'm not sure the first part (return PCI_P2PDMA_MAP_NOT_SUPPORTED) is correct,
> since callers have so far ensured that P2P is supported before calling this
> function. The second part is correct.
> 
> > 
> > That sounds great as long as the Request uses Relaxed Ordering, so the
> > Completion won't be affected by P2P Completion Redirect.  But devices
> > aren't *required* to use RO even if enabled, and I'm doubtful that a
> > non-RO Completion redirected to the RC is going to work.  So I don't
> > understand how p2pdma.c can guarantee safety.
> > 
> > Translated Requests seems similar -- are we assuming that if ACS
> > Direct Translated P2P is set and ATS Enable is set, the device
> > *always* generates Translated Requests?
> 
> PCI spec allows "A Function is permitted to intermix translated
> and untranslated requests" and p2p doesn't decide anything except
> if routing is possible or not.

Both of these are basically the question we left open in the
discussion with Christian.

To use this new TLP specific API correctly the initiator needs to tell
the API what kinds of TLPs it intends to generate, and ask if that set
is OK.

So you need to say 'I will use translated, I will use RO, I will use
untranslated' because each of them can have different routing.

NOT_SUPPORTED has to be returned if the modes the driver asks for
don't have identical routing.

I forget how this ended up when that got deferred, but that missing
driver input is an important part of the puzzle.

eg mlx5 knows exactly which of the three TLPs it is going to generate.

Jason
