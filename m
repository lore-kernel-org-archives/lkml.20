Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8271419A4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788157296; cv=none; b=rc6jH7USq/kn1IvNZvjVeqd3BFrCbVNuQ0NTFKnf+VVeN1DOlIfSHGDOfzeyQS2VZIbRkLWZeES3LuevmCQ7Z8DK169ciTgajYzE83cUSbAqre2zoJpfKQW0GsSH8OVUa0NwkFrJE9ShW+2C3tFGNv+iVakoaQtBk8Qx91eZJo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788157296; c=relaxed/simple;
	bh=RO8BBqJnXoP3LOp/aiEWTIMapxx/ZjyQNyG4/wIlN5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7X3pwTxFdzZSp7eFir0AxX0134sb0gSGmHJNZGHmQx7uLXq5OyXouYrDFIwGWQJbFQV/RWONfF8OME2FwkD4aHrtKj8Hglkth1UM9g86KQEPE48+yOOuF5LEYKWVxEDpUq3NX6cijDVQG+QGY+NeYWBQEKkipbsKBDK7XL+/uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AxFAen8Y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ezG74+zK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AxFAen8Y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ezG74+zK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788157293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VzgjundSHcr7LPjtj27GYXaMSFGktJ4pDKFyBrOg/JA=;
	b=AxFAen8YDOGCfrIj3p/iAHvi1CQQBXRFz7CysI23bs/K8YkPB29JMY1XcmAz/LMRDEHes/
	qwBpQubqbEs+M/vkk1VNKgsK0rHIiVqXZTpPdmAAcvoMKIRJk+B7mvWlsRL9z7yVBZr9sM
	5VHS1MGLhXiI/ksUKkUH7o7i5fnPXvs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-H8epuyG-PJCt9-l_0KSI5Q-1; Mon, 31 Aug 2026 02:21:32 -0400
X-MC-Unique: H8epuyG-PJCt9-l_0KSI5Q-1
X-Mimecast-MFC-AGG-ID: H8epuyG-PJCt9-l_0KSI5Q_1788157291
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-482f763db88so1578797f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 23:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788157291; x=1788762091; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VzgjundSHcr7LPjtj27GYXaMSFGktJ4pDKFyBrOg/JA=;
        b=ezG74+zKt0tpr14iaUBF6OoI0sQL8XeajTzMf7rXIYwyI6SAKqUKAXEC4pex7Ot9F9
         QUvpaGt0nr3YgCDujrW9zjVuYMmEcsKcFx3Hjr0JpVyUF/iIifYBRL1gRs+2unwqM5DU
         3EusccRTwLqqavcCB28GGlrbMZNfqj5i68acqg/7V7XlZ/ZU5RoJy9weP6qHucXtgSaV
         vfTE6ziOAYPI/P22EfncYBRXo/vcjocWhHDgAzw+yq1IGyV/Hdk5+FcboyREa+A8ICTo
         GsfEeAwOKHPk4bWC0aY9b4/w4j7zaaEHWeaU98mjlT6POaxqavwMUtKcYB5k1A+Cl8F2
         ZQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788157291; x=1788762091;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VzgjundSHcr7LPjtj27GYXaMSFGktJ4pDKFyBrOg/JA=;
        b=bsza00plFIhLpQq+PbY7LwHJeEbpHmv+GhwZdOHQHNNbjOoHFp2ea4Qf4J8JFWTVtg
         f5AXyvvaqTxAZLe6avl82ESIsItDEUPTIAIkjk2nl+GiXPNsUnsjqHWXbKrtN4BWZkR9
         q++xSM+jb3963NkfwYlFikgKAWrat/8Van2uk09GdE81Tgaimj1Ru0zZqs7bFU8T3tH7
         l9z//SPZ5WcfzE1D5Q0OMFXBlXkYZ0HsDCxZ8w7Lyj36eXuj94hmjyVXRRFilyTS+WO8
         DgF0q5wMfRVE182F183lQqKZPc6/GwMmM3ustZKkfDB4beLodmjfAhcGpWhui5hgYZt6
         WEdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxD/OTdBoOez0qP+5tmEjfXe9KeGKYessCCmGTh3jxMg230elxvT1YwzL4USJeKE89+WTaclY+i34T7bNE=@vger.kernel.org
X-Gm-Message-State: AFuF++k9eDQgQgBD06GTofvkWiDvCVcQu0pc6rcpqtNuUAlo6k9ZNfXy
	qyw2Di7LrCRI672V0doLc4WY86D3rFQ+Lm4T/wfJm5vzpWb85Nmyso22hIEX/QLtUbnTXpWPlif
	DRMPO3sBQ2+TVKj6J9gRo8vNxgX8CeXuGEHefJly6mPKHYSy6MiUoD6Fcl90SZ8WF/A==
X-Gm-Gg: AYBFou0hGmZz/7vWswlJVHCXOwYjHyB/6pU7/8fxSpCbpqvGfg8EElK0dqf3I+nmoJg
	Q4tTQSOHSWbDd/K8XZaaQOlZGUiEYnn72rEBSdBRwOIBBdOOO9wAxmyMyBf3C3hua/StSyTWEAZ
	aWoKtRU7daoZyrkbFeRwCslailRuXAS1TxsWp/iAIbvpc27QiFGh9cA1NrQncrnqKcQyfd0kvQW
	XZN3nIwyP0nb7ny2UhD4NBG40N/40+WLb8FulFY8NUfGut+5sAGoT4WuASGfsFgwuD64fXt6J4D
	sdKPunGetAgxr33zKer12j4y2bWN0saStXHWl3vpv7QqbwROnHvMKhgZlkHlJHVwWadcvfuIg6i
	CvDzSPJB4Ok4Jfomi98qgEcE=
X-Received: by 2002:a5d:5f03:0:b0:484:3cbf:f254 with SMTP id ffacd0b85a97d-4843cbff31cmr4749476f8f.21.1788157290745;
        Sun, 30 Aug 2026 23:21:30 -0700 (PDT)
X-Received: by 2002:a5d:5f03:0:b0:484:3cbf:f254 with SMTP id ffacd0b85a97d-4843cbff31cmr4749418f8f.21.1788157290219;
        Sun, 30 Aug 2026 23:21:30 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm20363022f8f.20.2026.08.30.23.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 23:21:29 -0700 (PDT)
Date: Mon, 31 Aug 2026 02:21:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Alexander Graf <graf@amazon.com>, Jason Wang <jasowangio@gmail.com>,
	nh-open-source@amazon.com, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Halil Pasic <pasic@linux.ibm.com>, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 04/12] virtio_ring: return -ENOMEM when a packed ring
 mapping fails
Message-ID: <20260831022012-mutt-send-email-mst@kernel.org>
References: <20260818211425.91009-1-graf@amazon.com>
 <20260818211425.91009-5-graf@amazon.com>
 <CAJaqyWeGaoamHzYRd1ZVUJ+6fx_4RWDim+jLO964qKtgZ=zogQ@mail.gmail.com>
 <CAJaqyWe1fKBwBXXxHqDV676Uw03Pvr0uLizPmHKqm+sqmY_LgA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWe1fKBwBXXxHqDV676Uw03Pvr0uLizPmHKqm+sqmY_LgA@mail.gmail.com>

On Mon, Aug 31, 2026 at 08:00:00AM +0200, Eugenio Perez Martin wrote:
> On Wed, Aug 26, 2026 at 2:47 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Tue, Aug 18, 2026 at 11:15 PM Alexander Graf <graf@amazon.com> wrote:
> > >
> > > Commit f7728002c1c7 ("virtio_ring: fix return code on DMA mapping
> > > fails") moved virtqueue_add_split() and virtqueue_add_indirect_packed()
> > > to -ENOMEM, because virtio_queue_rq() maps -EIO to BLK_STS_IOERR and
> > > the request fails. We still return -EIO from virtqueue_add_packed(),
> > > and virtqueue_add_packed_in_order() copied that when it was added later.
> > >
> > > Guests that bounce their I/O through swiotlb (SEV-SNP, TDX, s390 secure
> > > execution) run the pool out with enough I/O in flight. On a split ring
> > > virtio_queue_rq() reports BLK_STS_RESOURCE and the block layer requeues
> > > the request. On a packed ring virtio_queue_rq() reports BLK_STS_IOERR
> > > instead and the error reaches the filesystem.
> > >
> > > Return -ENOMEM from the packed unmap_release paths too. Both are reached
> > > from a single goto on a failed mapping, which is where
> > > vring_map_one_sg() already produces -ENOMEM.
> > >
> > > That way every ring layout reports the same errno, and the block layer
> > > requeues the request instead of failing it.
> > >
> > > Fixes: f7728002c1c7 ("virtio_ring: fix return code on DMA mapping fails")
> > > Fixes: f6a15d854986 ("virtio_ring: add in order support")
> >
> > Acked-by: Eugenio Pérez <eperezma@redhat.com>
> >
> 
> Even if I'd like to see this merged, I'm having second thoughts
> because it introduces userland visible changes in some drivers. Are
> them acceptable?

I mean, fixing the kernel for the userspace is kinda what we do, right?

-- 
MST

