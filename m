Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA9E33BBC0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788172444; cv=none; b=bUrUyeGr+0qDuG31EbkF45kH8p0rZL3dApvKlp1PZU9U8M8aI/tevt5VZ87p5lz9R2KtxsooxvffTNx9Cu8j0LA6F++gaoZKyqukUot0Tx0YiwLId32P60Wi2NFB/2lsDu/Z6JE/fHxNoHBs4J7QcO+N1LQJsWZCg9lvzWR5aKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788172444; c=relaxed/simple;
	bh=EX0YETTdFugbFzcLbfaQoqmRAze/QrxuCiP5oYer/s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTbjH8N2KQzJeteeFASFw0xK9XciXo9sJJLb6oEKJ1yA0UsjtAt+7aSVmlzNPqL5dLHW5L4x0LPLL87ScJ+ym7K15JZmZ62BmsIbMLA1cLVBGdQWJofEJGr5QQdQsiw21q6WWU6vnoh+EbvUgrO0K0d7BB6ZVkPG4eWEFbEGy1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qg7yRPif; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HptC9aSR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qg7yRPif";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HptC9aSR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788172433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YBfPage1ADEAqab+x6qmBvM3J+29ZPsFF3WCYCZQTV8=;
	b=Qg7yRPif04lTaSBRFPs0lTsTLZXUoFJBDhhbyTpwbUx9M4tMtReaHYkViaTp/8XPXxn8wR
	A7cRETfXCJr1nxdv8/0fJqGH6poqW2xWk8QTq/xSpNQyDzcfvg/3hjtTcJVFRgBn8QxbY5
	CyIEHHkDAAHZTp78cGQedtDtJYHhVRE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-mZ1y2Sb0PcSkXAR33pP6GQ-1; Mon, 31 Aug 2026 06:33:51 -0400
X-MC-Unique: mZ1y2Sb0PcSkXAR33pP6GQ-1
X-Mimecast-MFC-AGG-ID: mZ1y2Sb0PcSkXAR33pP6GQ_1788172430
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49a1b4ea633so30200115e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788172430; x=1788777230; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YBfPage1ADEAqab+x6qmBvM3J+29ZPsFF3WCYCZQTV8=;
        b=HptC9aSRL2iUpc/UjbRRey02rnmO/uV5weV9KgvbKc4bIwHiAy+84wdHcq6CNQIVAz
         /8sOMzc3/AecQvdi11g6H+dms7l2IHLfamlORIgQTZtnr+ixkXvKPq5r/XafK14zlREG
         YC3toP4EL1RMGB+brU7iuc9EVbWod+LnUP5Jf8oh8LYBF0gSBwSUmFDQRXUw8zDwgaQc
         77mRkaXVZSEPJ7+uU+QejlbSn/ntCsPzSiBYmxOp9kHRdBVpVOcx4HcDXfl8YdRU8+9Z
         qWw26p+cuERDn2a48qApvWy3BWfvKm3qj/ypvgF5FajvHMLUDaOCU3T5UnTUI7bDw16v
         Lyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788172430; x=1788777230;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YBfPage1ADEAqab+x6qmBvM3J+29ZPsFF3WCYCZQTV8=;
        b=ZOC8JONZ9AgP8Qs7nmUx6+4gKpy012upjdd7v0CfPYpyxFZlxv7bHahnZQyDY0N9gL
         yoEGq/31CNSiwEQqyrx+w1+/L5jnMacXnNbhHxQfAbgTP97VUsmA+h/wc9QDLescv2vT
         HWvSLOAkwQFwl3hwYc+QfrRaKclt/FobXwGUJSDYm4IePOaHvhsrkMh0eJCg+vko5QaF
         db760vP9dVu+EFCf07HnYYjKyPbsYxPFdIWxmhnrtv5GKErtDf37dJfYZx5M9tw8maGU
         Vmc1aYnLdNvXSgsAJ1LjqkgPRhBGKOLoQpPVL7/VM2gyRK2SNS+CcVbh97g7e+0vSUDA
         UQTw==
X-Forwarded-Encrypted: i=1; AHgh+RrjtAJUK/v1h51l75G7+I9UiJ8u/Ba3nsMcKupzVloTHnoubJJCvyJDeqC4o2ihXUzFGb8Xpq36UlPIrG0=@vger.kernel.org
X-Gm-Message-State: AFuF++lMuDC9U2xgjkOI1e2PSXjGIYV8XdbDJSXI2M1XRY9GH7WyMEkQ
	+t9MufNFnC35cmZ/ONwInUmJ3e0aW6tjQhG0nWewLqynBZv3KdgXBLS64GJoDvqkMAIpC4l6nom
	bZDzqzxNCniukH4subU36cxDmeii3RrFSYqqy7FYA/9LbqXHj2GuJOixZLmDka2AmYyBkyFjxGw
	==
X-Gm-Gg: AR+sD12nhEHYecuEY7gvEuM53PRaq6ZlavwqXnZs0HLFGER/e8XiN5NfykbNOjXSDLK
	eDwLFAbTGaoCeneBE/+P6yTLkNS1UW1aI3ilFmhMyxBtK5KAdQ/rmQAVyLWHAcMwF8Llbexi66x
	KXoH6Uws34t054WC72sIOL/kA7WGsDuvBX9KfwhM0SY6jQr5Q3pmdiBWThJmGonxEUok5tpbwn5
	sVCsSujlJgZoFIYEnH7wWfMzMcZp5frCcJv8ilxSTRvE+1N7J+M5gbVV2D2u3+zc7GpeGXjoio1
	PY0cNiZEygjGurGLe+OY2rO+XArchFVlHLG1cMLqNx1WLug6Cswz4ObTZostLbPdFHYcW20DFhA
	HWsN0sPiTg/hNkLoDYJwozKM=
X-Received: by 2002:a05:600c:8b35:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49cd9485480mr35259325e9.6.1788172430042;
        Mon, 31 Aug 2026 03:33:50 -0700 (PDT)
X-Received: by 2002:a05:600c:8b35:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49cd9485480mr35258205e9.6.1788172429407;
        Mon, 31 Aug 2026 03:33:49 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cca1ed292sm217449405e9.8.2026.08.31.03.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:33:48 -0700 (PDT)
Date: Mon, 31 Aug 2026 06:33:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Alexander Graf <graf@amazon.com>, Jason Wang <jasowangio@gmail.com>,
	nh-open-source@amazon.com, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Halil Pasic <pasic@linux.ibm.com>, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 04/12] virtio_ring: return -ENOMEM when a packed ring
 mapping fails
Message-ID: <20260831063307-mutt-send-email-mst@kernel.org>
References: <20260818211425.91009-1-graf@amazon.com>
 <20260818211425.91009-5-graf@amazon.com>
 <CAJaqyWeGaoamHzYRd1ZVUJ+6fx_4RWDim+jLO964qKtgZ=zogQ@mail.gmail.com>
 <CAJaqyWe1fKBwBXXxHqDV676Uw03Pvr0uLizPmHKqm+sqmY_LgA@mail.gmail.com>
 <20260831022012-mutt-send-email-mst@kernel.org>
 <CAJaqyWc-a5orY1Rg2S_PmdPWt6gcGFM7-FyN4Pqk5hPd8vi0PQ@mail.gmail.com>
 <20260831042123-mutt-send-email-mst@kernel.org>
 <CAJaqyWcRwoAWMU9EQE-qDNmpzjc4xheU4Y+MxTx2EF8vP6wEKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWcRwoAWMU9EQE-qDNmpzjc4xheU4Y+MxTx2EF8vP6wEKg@mail.gmail.com>

On Mon, Aug 31, 2026 at 12:04:57PM +0200, Eugenio Perez Martin wrote:
> On Mon, Aug 31, 2026 at 10:22 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Aug 31, 2026 at 10:17:56AM +0200, Eugenio Perez Martin wrote:
> > > On Mon, Aug 31, 2026 at 8:21 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Mon, Aug 31, 2026 at 08:00:00AM +0200, Eugenio Perez Martin wrote:
> > > > > On Wed, Aug 26, 2026 at 2:47 PM Eugenio Perez Martin
> > > > > <eperezma@redhat.com> wrote:
> > > > > >
> > > > > > On Tue, Aug 18, 2026 at 11:15 PM Alexander Graf <graf@amazon.com> wrote:
> > > > > > >
> > > > > > > Commit f7728002c1c7 ("virtio_ring: fix return code on DMA mapping
> > > > > > > fails") moved virtqueue_add_split() and virtqueue_add_indirect_packed()
> > > > > > > to -ENOMEM, because virtio_queue_rq() maps -EIO to BLK_STS_IOERR and
> > > > > > > the request fails. We still return -EIO from virtqueue_add_packed(),
> > > > > > > and virtqueue_add_packed_in_order() copied that when it was added later.
> > > > > > >
> > > > > > > Guests that bounce their I/O through swiotlb (SEV-SNP, TDX, s390 secure
> > > > > > > execution) run the pool out with enough I/O in flight. On a split ring
> > > > > > > virtio_queue_rq() reports BLK_STS_RESOURCE and the block layer requeues
> > > > > > > the request. On a packed ring virtio_queue_rq() reports BLK_STS_IOERR
> > > > > > > instead and the error reaches the filesystem.
> > > > > > >
> > > > > > > Return -ENOMEM from the packed unmap_release paths too. Both are reached
> > > > > > > from a single goto on a failed mapping, which is where
> > > > > > > vring_map_one_sg() already produces -ENOMEM.
> > > > > > >
> > > > > > > That way every ring layout reports the same errno, and the block layer
> > > > > > > requeues the request instead of failing it.
> > > > > > >
> > > > > > > Fixes: f7728002c1c7 ("virtio_ring: fix return code on DMA mapping fails")
> > > > > > > Fixes: f6a15d854986 ("virtio_ring: add in order support")
> > > > > >
> > > > > > Acked-by: Eugenio Pérez <eperezma@redhat.com>
> > > > > >
> > > > >
> > > > > Even if I'd like to see this merged, I'm having second thoughts
> > > > > because it introduces userland visible changes in some drivers. Are
> > > > > them acceptable?
> > > >
> > > > I mean, fixing the kernel for the userspace is kinda what we do, right?
> > > >
> > >
> > > Yes, but changing error codes returned from the kernel to userland
> > > always reminds me of this old thread so I wanted to give a heads up:
> > >
> > > https://lkml.org/lkml/2012/12/23/75
> > >
> > > Now I don't think we're in the same situation, though; probably no
> > > userland app checks the actual errno in these operations. However, the
> > > userland apps are not limited to VMMs; they include actual subsystem
> > > users that do not know the backend is a virtio device, so the base is
> > > large. If you still think that will not be a problem, I'm totally in
> > > :).
> > >
> > > Thanks!
> >
> > Well actual subsystem users for sure expect EIO on actual io errors no?
> >
> 
> Yes, but code like drivers/scsi/virtio_scsi.c:virtscsi_queuecommand in
> the kernel explicitely checks for -EIO, and had a different code path
> to handle it than -ENOMEM. Even if both are valid, the visible
> behavior of the code changes.

For the better.

> My fear here is that we have similar
> code in userland that we don't handle. I admit it is not very likely,
> and I actually prefer making both split and packed to return the same
> ERRNO, so if you're ok with the change I'm ok too.

