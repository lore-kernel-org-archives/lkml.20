Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793213672;
	b=1Fw0GtlBNxcokV8ojxMpYHFVGjNHEZHM6yPvodJIhvtCfgWkijPhrNkRKWlCj7wK5J3N
	 TVn7FwqgaumcN3yYAP6439Rq3tMmijv5IeTyRPre8rbrnYgHKQSOCL8kAcAjFlh9jnlY0
	 H7BknncLu3TxdH5fgIc35wehN0/lREo+zGUsbC3qwRW1IoX26WMhh4goGumYferZKghhS
	 mRNS5gxkkbThfYMM5AKMMl/BU5h9SiABdd1WN9D17gVhBYW05JmeGiNSId7TIU4GOALOW
	 U778ITrJy3pGCdFbvINOJqzLqsDR3uq4xiJf3HAA0TL6KOHOdiAl35SUwV6nTTpwYyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793213672;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=0vc/BwRMumh6GCDfZk9HEhgcPOmsWkZc9E+U0h5Wqek=;
	b=OD673Mi3FrrVdITcSZBxyNfbZlWVDyntqLfE5oIT/6SHsFOBMdQvAmdDVGFm3V42Prxu
	 Ke1xVDHOYKcPo/CKnx4uWWfIn/GUG7hAR4PdFNs8HX6lD+d2P3lBNmIc1UqtyIMQSYzlQ
	 P5Bl+yGsUvGhifeuBIR4YMWMOZxe1yF7TPgVN3VFtxWHwD897mGFY4OJY/09IFAAolHeY
	 7tK8eeKrsZwtbISRSUpH097qdO4+gRDzi/FszRgfmJ0jCsBmWN495KpeXob+fMqfFN11X
	 MWyHiVIeaHMCa5E9OtGKPMhMrEF2bmtJ2twF5ghRF5RvKaFTcMAEpMkIxdMlACVj56g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SeS1RkuR;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=c9fjvsd9;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54235606A327
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54235606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SeS1RkuR;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=c9fjvsd9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793213671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0vc/BwRMumh6GCDfZk9HEhgcPOmsWkZc9E+U0h5Wqek=;
	b=SeS1RkuRvO9X9jHXvlUujgjM0G48XQHydqW/fIEn79gpYu7DZ9Z/Zux5VdKM14REfgvDMC
	mr47DhQCsP/qIR/vmZ279r4Tm7b2kC95TsUcveCObtfJEkmbS6N0hlRhweZB7+9y0xQGDe
	zV8pqky/OP5/yD4gRICv1geKAnGXKi0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-1obYaJjuNG6KOVW_Tz7XRA-1; Wed, 28 Oct 2026 14:54:28 -0400
X-MC-Unique: 1obYaJjuNG6KOVW_Tz7XRA-1
X-Mimecast-MFC-AGG-ID: 1obYaJjuNG6KOVW_Tz7XRA_1793213668
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1fa972b4fso6611065e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793213667; x=1793818467; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0vc/BwRMumh6GCDfZk9HEhgcPOmsWkZc9E+U0h5Wqek=;
        b=c9fjvsd9b+OBbDCvEHn6EYsSMMeKxHxDwrYIf8VIBw++7QDXBC1I/5UeXjwqYjmWqp
         +tIJsFOLMSXqbxLSZQiE/9Se8/X6KEhsqNgtE3NwQUTnrs2SVKMqIuO6tLAzH2T2zvoU
         Wkbt1QT1vlPGs31QUbtwTmU+f5caR80TrmYU2WaREVPB9wgSGcUf/O94a8hQyalXAUIv
         krPZGY2l8la2hueLlutRt6EO+FQRDjkKrKMv+UnJgagwUM4x0/iDeCA+hsAfuji0r7Yg
         SY7ACyleHpO36jEYkUqAi3H/oIcpvMJ7P4R4gwgu4jwZhFGTW/FZhTSqHE0fHb1gIMFY
         fghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793213667; x=1793818467;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0vc/BwRMumh6GCDfZk9HEhgcPOmsWkZc9E+U0h5Wqek=;
        b=iStC5KBPfc9+QxNjKOIyvqXx2T6Vz1oib9p4bktBzzqs4o9BidkQSPXk/wUyiP/4fD
         FBCnuUoJcN88WgeWVxtgurd1uW0vGrewBN+k7AMJRZgmi2f4VEtWoTlZ3QPhcCA0Ao0F
         7ivbMcczEaniQqoXBuuQ0K8rC1J8tBN4i0tqdsEJ4psndIVfq1qoDo7jgy4tYKDF2kce
         EHM/1OglmjP4bAxYh0Imru63TdO0HV4q6SirC/GpDgezEgnoJAfVz73uxbgARcrtQWWS
         xzBJmq9iSRfhAMeubq1w6Orla5+SP2zLG7tYeEDTK32K7qquuwEovyvnekG83NY9CgCT
         zzxg==
X-Forwarded-Encrypted: i=1; AKwUvBxF50rOhpEe3p3Pp0YtAy3ZE0PvdlhmBIGT6WXzF4sdnMBTxke+7qQOD/SXLDD4tLPRBSXaPif1n+tnDj0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTUiux0E8ZAT7rhcRmpGSg9Z6/l9TDchTfyzQVhcTgoIS53jEg
	POH8eQg5j3nSVzqhVJUoYeRkrw9jMqrPyJAbnCjk4w8/VNmjahAYCOCC5MYItRaTwECE5GPCbww
	FrzFbXbhiUMDj/13H5f+oxlwuUSrIk2fW8tMgrJvZY3daXviArGYiMhRSLPTd4Guciw==
X-Gm-Gg: AYBFou2MXfXOzkLiQbWn14YHAL92HIUE3V0RpHA0HIMZSB8/5DgZJ667DJcbObdDn/F
	jxTdEDSTmsULlIAhdxLWkHtAQ1wd3bBx/+U2saXZ829DaHV9kGkCTCDtpd2Oqxha49cIdtOQ4DN
	3oZ+Ur+DzjLK2biXxl6w4e+c3juGGh3bdEZ0HbddDKwrUuVKcIHDAGIpqkTI+c2uuVIUI06u5/t
	iZQGFTlYuYKPChVPq/U+qsR3V/CW1zX1AZBLZxJLz5V/F5WG9/E1edMvNhd8ugZvlf/VgjP2JRa
	9+ISzhORrYBOtdXlBILetUVBEBs0bSGjvZ24Ujr9Ht28ISdC3anYS7GSCFAY4iop6JHqWHUGzyG
	g3rADH/kCUoEKwptQoKUcJWeqvDXEQkBl0Sz1wz2O
X-Received: by 2002:a05:600c:524a:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4a9674e6bf7mr73578655e9.35.1793213667427;
        Wed, 28 Oct 2026 11:54:27 -0700 (PDT)
X-Received: by 2002:a05:600c:524a:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4a9674e6bf7mr73577935e9.35.1793213666877;
        Wed, 28 Oct 2026 11:54:26 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm10398775e9.4.2026.10.28.11.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:54:26 -0700 (PDT)
Date: Wed, 28 Oct 2026 14:54:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Kevin Loughlin <kevinloughlin@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Jason Wang <jasowangio@gmail.com>,
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
Message-ID: <20261028145316-mutt-send-email-mst@kernel.org>
References: <20261027025616.1632690-1-kevinloughlin@google.com>
 <279a92da-772c-422b-8047-ad37dbae211f@kernel.org>
 <CAGdbjmJ8qk7FCbGU85u9+db5_RtcrK2y_7TfNH+iuz+OJxebow@mail.gmail.com>
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
In-Reply-To: <CAGdbjmJ8qk7FCbGU85u9+db5_RtcrK2y_7TfNH+iuz+OJxebow@mail.gmail.com>

On Wed, Oct 28, 2026 at 11:12:47AM -0700, Kevin Loughlin wrote:
> On Wed, Oct 28, 2026 at 2:01 AM David Hildenbrand (Arm)
> <david@kernel.org> wrote:
> >
> > On 10/27/26 03:56, Kevin Loughlin wrote:
> > >
> > [...]
> >
> > >  mm/page_alloc.c                               | 248 ++++++++++++-----
> >
> > This diff stat should give you a good indication why this series is not acceptable.
> 
> Got it. I will keep that in mind going forward, especially if I end up
> attempting a v2 that simplifies things.
> 
> On that note, I believe the majority of the bloat in mm/page_alloc.c
> comes from...
> 1. supporting the legacy inflate/deflate option
> 2. introducing support for various page sizes to be unaccepted
> 
> (1) I can get rid of by dropping the inflate/deflate option, which I
> think makes sense given free page reporting should be sufficient to
> enable dynamic guest downsizing in cooperative scenarios.
> 
> (2) becomes simpler in part just by doing (1). For further
> simplification, we could potentially restrict free page reporting for
> CoCo guests to the current 4 MB MAX_PAGE_ORDER instead of supporting
> any order 2 MB and up. There's a trade-off here for reporting
> effectiveness under fragmentation, but perhaps support for 4 MB only
> (and its relative simplicity) could be acceptable? Especially since we
> would then maintain the invariant that all pages on the unaccepted
> list are MAX_PAGE_ORDER?

I'm not sure what is meant here.
But if a lot of memory is free and it gets merged beyond MAX_PAGE_ORDER
and then it's not reported, that's counterintuitive.

> If I can sufficiently simplify the changes (especially in mm/), do you
> potentially see a path forward purely for the free page reporting
> aspect of this (dropping inflate/deflate)?
> 
> Thank you for taking the time to review, David!

