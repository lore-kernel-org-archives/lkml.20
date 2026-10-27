Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096980;
	b=LqGpk5J9DTI2DBqdz+B97+SfYIW1qxFsoG/VPhz7jLG85kdc4zZk9xmnZDt1VupKKqaT
	 K5SVcqd0W2f9V3Ug5oLWntydmwkHHxvvWgGFA7rNvlOpAoskkz4vMd27sVfOFf0+7ZRq4
	 0DAVYFIXFKLDDHOifEbv0+P/QvE9UiM56F0yizmAnrY84eQpiWsteipu2cNCyRyi92HSS
	 /JHDv1OpshP5nn+qPvaTSWO3MZ9aBuydaLRP3GkAnzl+17HdJxB4g1ucWTvhhX9fvBHcw
	 +u8OQj76zNawQNV/670ADn+vajK0hqfvYBmzvAj8EG5mamhqidrQpNmVb0zKO/E/aHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096980;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=h84z7fd1Ik8wN7YTsUmwTZKDWUsWH0q82RExH9eag3k=;
	b=UAEDPtutnY66XO5kVqlZUjYk1+TwVy643eAA1fxxdAoT75Mwm6pIXh8vGyhTQAeKG87f
	 DeigNJ8yiIpaOPS+oYonlr4OUSgdswtxrD2m+ubJe/VU5UIEL8b5ZjmdAy6z5yQJulvMn
	 NFAcLhm3X++yUzu1vPCmh1DgqfNfWKjXJdymg3G00YxwqZPHfpJ3JwP82hmEYGokqZ1v0
	 pCtzr5hAVpWxwRPj25wgDTbpE9iJKAi0xZ2PrJ2KxvRG879VLvG1HgltQsRDANHCWDbyp
	 JyIA0uANgU54aM+Wxequ+s2dRnpy30ShtZTnCIQG9A6nD6U3VpviR0NUcK8kVy8nFFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gLb9YpG7;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dxwtWssD;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0A6606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC0A6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gLb9YpG7;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dxwtWssD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793096978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h84z7fd1Ik8wN7YTsUmwTZKDWUsWH0q82RExH9eag3k=;
	b=gLb9YpG7t7aAG5zdrtnhvrwl+EWJbl8BAas3vnSQvE7RZFC1to4hrFJ2HzYEXlEd7BUFNl
	AQp/dEfFDJW0EhBTKWGntzjWOoRNCmTG3CAPNCoGP2WFDppFPrRHTHwVg7Povykn7MS4Hz
	YOoQJy/9sO9n4UL2QB3b4MknMrzEpLQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-3urKpKitMmaWjorWge8UmQ-1; Tue, 27 Oct 2026 06:29:37 -0400
X-MC-Unique: 3urKpKitMmaWjorWge8UmQ-1
X-Mimecast-MFC-AGG-ID: 3urKpKitMmaWjorWge8UmQ_1793096976
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48b02d63407so2796476f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793096976; x=1793701776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h84z7fd1Ik8wN7YTsUmwTZKDWUsWH0q82RExH9eag3k=;
        b=dxwtWssDZKqDcfUvjOBCsmn0PcucQRYRIbAt8Wh1fV0QMQTdpZuGgq4/Tf/GVO68QO
         +nb/aEHWy2Jv9Cq+BAQgGSjMbTy9MJ1BrZi9pJc3ned/kdRxSOKYCBQgsRjLeSCS3pRI
         XH9AJ+MhN7jtNLIFE3M+3qVXbtEe7pA4Y6h1NrZw+N5jb4dA0U90FDMPwdLB7ZhM5Mpe
         hWiYyXArw2EnYHSKTAF8uHBuON9H7RuUkia7CHHLiT2Yqiut9Czp1De8zlWXqxt6JESf
         ybrDwW9lNmLFKD7OlH/MdIGTbJnBEzRS1EwaeCdRl8m2ifxUoLbRC9IENL0jPkq+/aBC
         Q6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096976; x=1793701776;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h84z7fd1Ik8wN7YTsUmwTZKDWUsWH0q82RExH9eag3k=;
        b=wulcDkmpkWQAYjKwuJ0+iZB9yot7wgfi2h0wDJF+SwNf8u4TrXRrr1LIwFKiWcHdgN
         nmUpMKARyzGVpri0GkOqSHWMlYbZPFVmfKzXmfuc5C0CElt9q36MmdsjWPGZRyzcQLNJ
         e9DUl99DH3DagEV0vOsyXze75NodNjbzcw0aRPFFRbK9NIhLBpGyO4AcxEZ4t/Zg2SaG
         sRTWD6KhzaxJZSMW9fFQee9h4hEeMiFsrfMpScKM0XaXuZua7RDDo9M98kJECdirT54p
         Jr9VN/AeIqSo34BXJ5dfipwo0Xv3iPCXEktE6M3xahG+DUFlhqBlf62HkGBH8ovcqCW1
         qU/g==
X-Forwarded-Encrypted: i=1; AKwUvBy53Ned6wUHDT01ZLe21UgijQ5SpwAeNuXgnsQ/15w2TcW9Y0+A2CcA/UodK/XMqmBwFRe+xrl5qoLQQtU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbjuxQJqMKlOC4YhN6tl4P1CaoBtAArUBwvrbARwfFajiwd7bv
	8218ZwSz0f3XoMPYDJwCOAoWfJvpdI8gMNn33worRvqkQnWMm7EgWCz/SGf+6A1fjhDV9opRurx
	lvQ6YgJoua/bcHTtMgca2E7L2PTlWBpQvuBhCI5pOF2ioizmNTskubLOBIifH4bn5og==
X-Gm-Gg: AYBFou2PHFk6yU2NH1cyUQd5HYc7LOcu9n64mUsP2BeKfKWwURuSpLWcd3N23TCtZiG
	4WCquhuAsy8o5vITnsq8gwwyTbx9mWOPj+maHbujmar9nZ8kLh41kZFiKvXqIZ8irhyE6hNQHYT
	4z7MWVvxQXv2dz3mFgqX1vh0O42dH0fDzq7cs3SQd5lBi3sk9sT1QtDGGpI34aHVoGz0sg3jSER
	f02T/a03AYj2/T9Q1cI3DSSNTcIKyv02ipAP6lCmqcnTXUC7v7RH1UcjM/pYMuRDx/5rhvMmOvQ
	1SQxEJGFfHXWVe93xtpqCg0kBtBNyaWfU0y+KIVynTjtxK4g0fRRwL1i2yocXcNIYTs=
X-Received: by 2002:a05:600c:8b86:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4a35acb17bfmr175618655e9.22.1793096975898;
        Tue, 27 Oct 2026 03:29:35 -0700 (PDT)
X-Received: by 2002:a05:600c:8b86:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4a35acb17bfmr175617615e9.22.1793096975354;
        Tue, 27 Oct 2026 03:29:35 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2d9280sm254068375e9.13.2026.10.27.03.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:29:34 -0700 (PDT)
Date: Tue, 27 Oct 2026 06:29:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Kevin Loughlin <kevinloughlin@google.com>
Cc: David Hildenbrand <david@kernel.org>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Ard Biesheuvel <ardb@kernel.org>, Kiryl Shutsemau <kas@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Michael Roth <michael.roth@amd.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Alexander Duyck <alexanderduyck@fb.com>,
	virtualization@lists.linux.dev, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sidharth Telang <sidtelang@google.com>,
	Punit Salian <psalian@google.com>, Peter Gonda <pgonda@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Jacky Li <jackyli@google.com>,
	Steve Rutherford <srutherford@google.com>,
	David Skidmore <davidskidmore@google.com>
Subject: Re: [PATCH 00/13] virtio_balloon, efi/unaccepted: support memory
 ballooning and free page reporting in CoCo guests
Message-ID: <20261027051245-mutt-send-email-mst@kernel.org>
References: <20261027025616.1632690-1-kevinloughlin@google.com>
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
In-Reply-To: <20261027025616.1632690-1-kevinloughlin@google.com>

On Tue, Oct 27, 2026 at 02:56:03AM +0000, Kevin Loughlin wrote:
> This series enables virtio-balloon free page reporting and memory balloon
> inflation/deflation in Confidential Computing (CoCo) guests, starting
> with architectural hooks implemented for AMD SEV variants, in order to
> support dynamic CoCo guest resizing.
> 
> Today, memory ballooning and free page reporting are essentially unusable
> in CoCo guests due to three main roadblocks:


For me, the bigger question is not whether we can, but whether we
should. Considerations I would like to see addressed:

Security, e.g.: does knowing which memory is free leak information from
the guest? If no, why not?
Consider CONFIG_SHUFFLE_PAGE_ALLOCATOR, RANDSTRUCT, etc.

correctness, e.g.:  Linux has init on free (and default on windows), if
initialized pages are dropped and host can not be trusted, they have to be
re-initialized. Is this handled? I don't see it in code.

Also, performance, e.g.: How much does this re-initialization cost?

Management: it was simple with balloon off unconditionally.
Now we are in murkier waters with various features offering
various performance/security tradeoffs.
What if some guests want the tradeoffs but others don't?

Documentation: for all of the above.

-- 
MST

