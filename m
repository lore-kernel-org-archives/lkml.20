Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793097304;
	b=lERFG1/tZKCEW2FF2IZ8zV5sBavZNcqrSxL2QYtOcz0+z7MiUM3JXFnN0qeD29hQxQos
	 z3dYib+AWqc5vwM1ApVuMrjfF2CXxdngoNhZYSapGnRke1TGxYW8FyyocurcLbAOAkV8x
	 26cK0lJ+7KxpjUhibY39EM1vqjG67N/hQ9vVtFCCZRJ3mzcWxm4IfhY3csxbS1f8rODeu
	 mVYb8m9uF2KEcMecnLMcaE1t9szDIGJwpJBDmtsujCBsA3SEoe5ImunhZMLHkicqDXYJ9
	 ZTq5+o3utmrbvxrJmeX5Rv1U8vnqrEyLJB+oxob21/5J78x12UWZaKI2Q39+kwmDREQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097304;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wP5SnFym7LuxSO8fJHfvurJtMfYN7gDtkIUiKX0oP0c=;
	b=rMfiSiMplOuRd/DiAQtnJpcYX1lm+81QhWPhux8CPB5Kj9xijnpvRtaCU0yDyF9GPo1k
	 21WE/bhLRaDJtGoYwP7cwholSEGmKuK8iQkW+yXLT5GHD3OseMCsNQBaDnz3+K4X7lT2H
	 4mj9Qa5UYsIeJ2A8vklKSCV41e6HA1MmSiItHCYKJ+cMcFXw1KPOVeLazqSeMVEXleEP3
	 tDPg5gx8AzHbkyztmCO2tibBQM7nuNi15Sp8pG8gLYMKGaIxBskVUfa7kLyF6t1CEYX9Q
	 vMosw1QeuJ1283t99nOe19bLKwdJDBnm7Eaug8kQreEpHIUjs0avyEUjAtq8sIbRHpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e0+iIVWI;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UeqEJ16r;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90487606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90487606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e0+iIVWI;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UeqEJ16r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793097302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wP5SnFym7LuxSO8fJHfvurJtMfYN7gDtkIUiKX0oP0c=;
	b=e0+iIVWIDmiQAf9RKS3ZUMZYh1HbqQJY0jyjwBgM0ILrN00ms0HNcrNdUS5giHTRvH3qkS
	fmDHLwMs4rQqvaDlCPw4iTsc1u+KxhiO1hg3HiwgkNcO6payKZnzXdnsKjRJhUnWZ6A834
	YMcr4+WI48Ht5oGz0QK4wIgNntOVXE4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-qhcEpzFyP4CgmBTXlGnxqw-1; Tue, 27 Oct 2026 06:34:59 -0400
X-MC-Unique: qhcEpzFyP4CgmBTXlGnxqw-1
X-Mimecast-MFC-AGG-ID: qhcEpzFyP4CgmBTXlGnxqw_1793097299
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e1291432aso2747765f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793097299; x=1793702099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wP5SnFym7LuxSO8fJHfvurJtMfYN7gDtkIUiKX0oP0c=;
        b=UeqEJ16rFs6zDP4ELiZI/LAV89govzmYctrpvlSPx+IK+iMDcvKUArMbs7OACmoehH
         cM2UKkgBiQ58pHzBGnyYOBcKC3v9geflcUwFjzjTFutzdCJxQr3qmx4rTv22zAS63Zzw
         iXN70ZQW1zFg9KUmsMfnfkivG1D/Txf86PDhAeyR2+IfgnrfzO7feQsvtJF0GF97WZTd
         gtpglUHQq+fWi0BGaQbcjBB0UedYoMOdYXJLGeJ7mSsHxVRuHzSWSxvXd5VUS2iVFAQS
         IIVjFq0B9IhH+FsKITlIfgg7WqpXwbtlq4aeXMokgA7P4o9cqQ+rvX4mTw90rfpr0qmt
         RHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793097299; x=1793702099;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wP5SnFym7LuxSO8fJHfvurJtMfYN7gDtkIUiKX0oP0c=;
        b=u0BLhv9mk9NA/aIoBl1vbF06f6T/EltckPqs4iuBN6Qc0fKdcAVM5f9v5xnLDBST5E
         I6xxRb9LMuwterTZ7g+L7l3+pRfiBWmysKykoM4J2uuHFEQkl+KwfG1LigJI4mPs1FZN
         bkOcveUnXzHVBd47sIeK4YSEOjuyQ4vaD5xjferyqyfV2KOigr4JF+bQ7Lr8eumvB1tU
         rVkgWAAbiHMGYbCI1wfsk+gphZ8e0XVfvWHW28TGCnE/xEKjp9bvac06R5qclnEkVdm4
         3KNI22pInSmb2L93M3fyaWYwOr+FECYeMK27my3lAKSg2FtdEQtYnRrtWC3GaQdK7AdI
         HkWg==
X-Forwarded-Encrypted: i=1; AKwUvBwQlwxWgYX2+tcUgFpZYqC46XxzLT0lplAh7gRCbggMLLW74/HEV3thw5SmLoxGl3Slj5lhxUXxdwlvACM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcICLNouXcQpTJ1Te7fFQvkya+5iGkXTMpJal7mnHKQcUszxit
	f16C5EbIwVTH0oBBcUrkW48xFekWWMJQZlulT0Fm5TLaqJTouVZtCyMHsgyfwhgp7yxH/RcSfQ0
	EsEIFp/XR1k3RiSo6RHzrIB4rHwPDh/i5EGmciTQAq5btDxdodMSwQPLcRmlchMvztw==
X-Gm-Gg: AYBFou0lw798K27X6keawKzAqT7tCiyoRXxSNNBNQLAcYv9vX6PaiDCXiCSd75WuU+N
	IQGKx9IfBzeKefTtQebsZ2UzH8/QyoQO7kuXIj7gZj/DRhN/BY6OMZ+v8w0AfRTx0jWocqGhZ/Q
	mBvR45esUmIOlEOrLvDskYgVlDpUkJEqomC/W1w3mRLepK97PDk3H1MRigYyI9fvvLnE2uyt+Ge
	e2jhKUzehVPfjCaBsbHV1EgvcROxEElfPLtQff1Y9jVuPiz/7Y4xyZKnwOqMhzWOc+AERuG3oaZ
	Pv2YGYGj/lniBrnRfgazCXPQdwS2j8GKjP8ZKLfBZbbsBsNlAM9sVRS26LHIlZCvHwA=
X-Received: by 2002:a05:600c:3acb:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a35aca4fe1mr175944945e9.16.1793097298514;
        Tue, 27 Oct 2026 03:34:58 -0700 (PDT)
X-Received: by 2002:a05:600c:3acb:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a35aca4fe1mr175944285e9.16.1793097297968;
        Tue, 27 Oct 2026 03:34:57 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a08643dsm204197985e9.4.2026.10.27.03.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:34:57 -0700 (PDT)
Date: Tue, 27 Oct 2026 06:34:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ruben Hakobyan <hruben@meta.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/2] virtio_balloon: submit reported pages as
 individual buffers
Message-ID: <20261027063247-mutt-send-email-mst@kernel.org>
References: <02257263433b001cd0a55a52486857df81dd4246.1793057483.git.mst@redhat.com>
 <20261027092633.3831267-1-hruben@meta.com>
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
In-Reply-To: <20261027092633.3831267-1-hruben@meta.com>

On Tue, Oct 27, 2026 at 02:26:33AM -0700, Ruben Hakobyan wrote:
> On Mon, Oct 26, 2026 at 11:53 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > The virtio_balloon driver reports a scatter-gather list of free pages
> > to the VMM so it may discard unused pages.
> >
> > For an arm64 kernel with 64 KiB pages, the default reporting and
> > allocation orders allow entries ranging from 2 MiB to 512 MiB. If the
> > report contains a sufficient number of large entries, we will end up
> > with a descriptor chain that represents over 4 GiB of memory. This
> > violates virtio spec, which says:
> >         Drivers MUST NOT add a descriptor chain longer than $2^{32}$ bytes in total;
> >
> > Specifically, submitting $2^{32}$ or more breaks Rust-VMM.
> >
> > Submit each reported page as a separate virtqueue buffer instead of one
> > buffer with an sg list of all pages.  This also avoids indirect
> > descriptor allocation (kmalloc in the reporting path).
> >
> > To avoid multiple buffers causing interrupt storms, keep callbacks
> > disabled while we wait for an event.
> >
> > TODO: as an alternative, keep using virtqueue_enable_cb_delayed
> > but add buffers after there's space in the ring.
> >
> > Note: if the virtqueue is broken, wait_event on
> > virtqueue_get_buf hangs.  This is a pre-existing issue:
> > the old single-buffer code had the same hang.
> >
> > Reported-by: Ruben Hakobyan <hruben@meta.com>
> > Cc: Ruben Hakobyan <hruben@meta.com>
> > Fixes: b0c504f15471 ("virtio-balloon: add support for providing free page reports to host")
> > Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >
> > Notes (changelog):
> >     changes since v1:
> >         keep callbacks disabled while draining: get_buf re-arms the used
> >         event for the next buffer, reintroducing an interrupt per page.
> >         Disable the reporting vq callbacks at probe, and only arm the
> >         delayed callback to wait.
> >
> 
> Thanks for the patches! I think sashiko-bot found some issues on broken
> queues in the first patch that are worth looking into for correctness.

Surprise removal of the balloon? Nope, it's a pre-existing issue that
it's broken.  Besides it's not really practical, no one removes
the balloon - no need.

> Other than that, I tested the "normal path" on QEMU and Cloud Hypervisor,
> both on 4 KiB and 64 KiB guests, and this works correctly.

Thanks a lot! Can you pls confirm whether the performance is about the
same/better/worse?

-- 
MST

