Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2AB3E024B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164566; cv=none; b=BSBGE3Mhck6Uq7VoGC46/M2Qq7UVBKCRgIqCBj2/5h17KzUhIvBjH1rf1VeNkdbCPABNi/xULhoTPQ6LzlFxs63IaXDoiRO2ZVPM2jfpJB3eERjLNxCAH9cpe3ZVLfcfeYtzvn+i0T7vReKneHGv1NTjCqDyaf6WT1XNbB2rgew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164566; c=relaxed/simple;
	bh=ewcFfqU8CqD6R09UPqNsBXPaWuT6EWWWC1rlaEeomq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OjtwweoErn2QShn1Y/le/MJ9DehhVG/ytmpu0U4Mds+uUoAoxThQbWXWOw6P83cdRlEqcBlcLjhHaJRUjgb4K5fb3QObXuo8whAK0roVWlHN+GENK05EiMNOu9fvqALIcVtwc4WPQWMb8VWG1xmx8Bov5oafgCZ+HmSD7yUGJVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QqDIHK2r; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IG8VXxAL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QqDIHK2r";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IG8VXxAL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788164564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VPHstyAOOWZWJ4A5+/zkt6f6u2lf2fP9VtPqxWkdkUg=;
	b=QqDIHK2rXDCyFkMmbiVq6ap2SmvTFDZcZ/fFTBTCwgaie0psL5E52s3MdeUWk7JZbptIbK
	KN7bAWlMKAinO/sFXssh8vSpx9aUTy0RGtr4/92hwda6gwULA65jPsdvVBbguKz/h3XSAv
	PcTYS7lOY8h10avDTgOKeW0PvEmvw9Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-dys_-24OPI6r3AgZ_VYYow-1; Mon, 31 Aug 2026 04:22:41 -0400
X-MC-Unique: dys_-24OPI6r3AgZ_VYYow-1
X-Mimecast-MFC-AGG-ID: dys_-24OPI6r3AgZ_VYYow_1788164560
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-482e8e1ac69so2108201f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788164560; x=1788769360; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VPHstyAOOWZWJ4A5+/zkt6f6u2lf2fP9VtPqxWkdkUg=;
        b=IG8VXxALuzTPv+GIZD82c4sXLCRsP1T7F2/LTkD0INSVBGucjIWiBcELVV0a3EajbS
         g8JSaR5hkFomS1/sdOcCDgHi6hhbxmI35zib1xUDGGGUlQeWxUNmnOs6S+I7H4d1/OPH
         M+3jn1oY43spWkZ7J69438AscLP+AoaS65kltXRUcPZ8hJkywRy/QkxeybA2rH3j6CAK
         7BfAgXmEiWmxVN6mRtlIT70dpd34ofxAOt5g7xP6KBJmtvWDKU+PKoDAFcSR+6vyzYXf
         ++kkupvi+c7fCx3WHJ85W80cpPMVVkzI1mtdHe5P9GUyLSMIYLNpry982Q/jS179vJzg
         9t7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164560; x=1788769360;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VPHstyAOOWZWJ4A5+/zkt6f6u2lf2fP9VtPqxWkdkUg=;
        b=jNuT0nlMHsAu6jMnnJ8/yFhaJo3g5lS9i5QTwH93Q47eFF82YvCiQ52ffSEGcqPbCy
         iFb6oqczZ/psuvH10v+gnnwXtqgXH1RUdtYQ4fSFLJ0G8gkqHLnpFVRH3xZoOX4eiIEZ
         MssrFbhbShnvUPimwyfCTsbdwpBmgtGOY/F+GPD0722pXr7VjjujpgMEZ8gLxOihcATp
         h9r0uIby/k/k/k0DgIN9rOq6fTA4qQrYDZ9eZcxXDsVWQaLsDF+D45tLID+8EoYwoOlM
         hGZ04WF+bGubEYhd7AuoqRp7eg7jPpkNFifqjP58et+we93h41Z0N2zQjwCVQHkGWUhl
         9Q9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxHOymWGfyOFzEFYcYFj1Gn476rSr+C5JXOvPGl4ivE3Uf0jr6aWtgb/WCGJOB103GMOCPh8tBANl9lLP8=@vger.kernel.org
X-Gm-Message-State: AFuF++mYCrB9zVNDydkrlgGo9jmL17HxP+ZNKb6P89y2G1Ca+Fqe2/AE
	3aEFsvXLaBiMbeD9K3E7/7FjXDqbMgPurEQhmU+76kbaDka1XQQBVzvSRe4rXGEubMMW2f3NUvG
	hwtTwys2lmjUoodxqyUW1UMtS+GH5xuH5GiSNOrE/q9ntKa+angLHyw+zp8/OGWOkLg==
X-Gm-Gg: AYBFou3q9883TX+3baCHB293D5HGkZ8VUGOa5kHUmZ1ZVJ4C1jI7aTiEYcmsdXCq7kt
	4UzGlortsVy0QJf5cQngXTFrwLtaKKt8kFcwrofPLpZ40PhZSMpQhhKSdpUEXjfrP6VoMx1E23a
	GIl2gPQwArtD/j/i/9t9lHdj1b0r+W4gmhOTfwp96KPmhzJv61kxVWSY2ERubG+MLl2abFjEEmY
	LEoHlbSek5kuubBLve+qe7jL8X4A87GfQT91bfswCmD8e0+nwkVNjsrx9p5D7U7j4snIgiObPIJ
	7x21ILiTWTB6pGzhkK3ZXEZ5Ta9aF0mVnKwTnG7hAPCdmzV+sD0bFWRf7ZEmWHgnFEAUKqvlV96
	e3TO612GCjdChMtbBGmvLyC4=
X-Received: by 2002:a05:6000:4b18:b0:47f:8cd3:4bed with SMTP id ffacd0b85a97d-484397969b4mr11533812f8f.5.1788164559877;
        Mon, 31 Aug 2026 01:22:39 -0700 (PDT)
X-Received: by 2002:a05:6000:4b18:b0:47f:8cd3:4bed with SMTP id ffacd0b85a97d-484397969b4mr11533708f8f.5.1788164559100;
        Mon, 31 Aug 2026 01:22:39 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f16sm23490350f8f.1.2026.08.31.01.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:22:38 -0700 (PDT)
Date: Mon, 31 Aug 2026 04:22:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Alexander Graf <graf@amazon.com>, Jason Wang <jasowangio@gmail.com>,
	nh-open-source@amazon.com, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Halil Pasic <pasic@linux.ibm.com>, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 04/12] virtio_ring: return -ENOMEM when a packed ring
 mapping fails
Message-ID: <20260831042123-mutt-send-email-mst@kernel.org>
References: <20260818211425.91009-1-graf@amazon.com>
 <20260818211425.91009-5-graf@amazon.com>
 <CAJaqyWeGaoamHzYRd1ZVUJ+6fx_4RWDim+jLO964qKtgZ=zogQ@mail.gmail.com>
 <CAJaqyWe1fKBwBXXxHqDV676Uw03Pvr0uLizPmHKqm+sqmY_LgA@mail.gmail.com>
 <20260831022012-mutt-send-email-mst@kernel.org>
 <CAJaqyWc-a5orY1Rg2S_PmdPWt6gcGFM7-FyN4Pqk5hPd8vi0PQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWc-a5orY1Rg2S_PmdPWt6gcGFM7-FyN4Pqk5hPd8vi0PQ@mail.gmail.com>

On Mon, Aug 31, 2026 at 10:17:56AM +0200, Eugenio Perez Martin wrote:
> On Mon, Aug 31, 2026 at 8:21 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Aug 31, 2026 at 08:00:00AM +0200, Eugenio Perez Martin wrote:
> > > On Wed, Aug 26, 2026 at 2:47 PM Eugenio Perez Martin
> > > <eperezma@redhat.com> wrote:
> > > >
> > > > On Tue, Aug 18, 2026 at 11:15 PM Alexander Graf <graf@amazon.com> wrote:
> > > > >
> > > > > Commit f7728002c1c7 ("virtio_ring: fix return code on DMA mapping
> > > > > fails") moved virtqueue_add_split() and virtqueue_add_indirect_packed()
> > > > > to -ENOMEM, because virtio_queue_rq() maps -EIO to BLK_STS_IOERR and
> > > > > the request fails. We still return -EIO from virtqueue_add_packed(),
> > > > > and virtqueue_add_packed_in_order() copied that when it was added later.
> > > > >
> > > > > Guests that bounce their I/O through swiotlb (SEV-SNP, TDX, s390 secure
> > > > > execution) run the pool out with enough I/O in flight. On a split ring
> > > > > virtio_queue_rq() reports BLK_STS_RESOURCE and the block layer requeues
> > > > > the request. On a packed ring virtio_queue_rq() reports BLK_STS_IOERR
> > > > > instead and the error reaches the filesystem.
> > > > >
> > > > > Return -ENOMEM from the packed unmap_release paths too. Both are reached
> > > > > from a single goto on a failed mapping, which is where
> > > > > vring_map_one_sg() already produces -ENOMEM.
> > > > >
> > > > > That way every ring layout reports the same errno, and the block layer
> > > > > requeues the request instead of failing it.
> > > > >
> > > > > Fixes: f7728002c1c7 ("virtio_ring: fix return code on DMA mapping fails")
> > > > > Fixes: f6a15d854986 ("virtio_ring: add in order support")
> > > >
> > > > Acked-by: Eugenio Pérez <eperezma@redhat.com>
> > > >
> > >
> > > Even if I'd like to see this merged, I'm having second thoughts
> > > because it introduces userland visible changes in some drivers. Are
> > > them acceptable?
> >
> > I mean, fixing the kernel for the userspace is kinda what we do, right?
> >
> 
> Yes, but changing error codes returned from the kernel to userland
> always reminds me of this old thread so I wanted to give a heads up:
> 
> https://lkml.org/lkml/2012/12/23/75
> 
> Now I don't think we're in the same situation, though; probably no
> userland app checks the actual errno in these operations. However, the
> userland apps are not limited to VMMs; they include actual subsystem
> users that do not know the backend is a virtio device, so the base is
> large. If you still think that will not be a problem, I'm totally in
> :).
> 
> Thanks!

Well actual subsystem users for sure expect EIO on actual io errors no?

