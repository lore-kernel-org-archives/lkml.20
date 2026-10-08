Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CA63BED56
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440399; cv=none; b=YwJsdfQ8aeHeC+HD4kGB4tBvMbyjuvvlzpCjWBM4jKyj0+aB8DCoXbOHQ2ruMde+lTPyfwvGqdGUsqWUkl+c5wc2h/O48lIwoBv2JEWAwGFFKmKGGQ3W3SXltIZgpzToIsmgcZLKg09/YJigrFCQSfPFVLZD2/MiheDeqzmmMNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440399; c=relaxed/simple;
	bh=qKch0A7LR2mW5ZDryjBYCTZAVH9u7xn3vXfwOUlcVCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYakEurSp/QZb8HHK/dVXl+XWhJgD5Vrt0qekPSnLkaeI4gFXiUnKFelUYF8nbeFivP1mXgPH7QcEsPKBG2ijfJu/kfTF5kt7ZPe8YSTKNHSGrx77MLO96s8Ni3ARWGrIZg+XptHivCCPw8VbBqjowDRkKEMiUECEP403DCP69E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F+iLEAEl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=s2BKS2ct; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F+iLEAEl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="s2BKS2ct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791440396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lBkvNqNk+kq9xlFcI/2YnHiKYK3/wLihDPOcRkcC1+Q=;
	b=F+iLEAElTWsYYbY+MGRcwi/Zdm88EH6xoOsetBDdP9UTNmCXLWLOJA4s9F6/B+Cacteajl
	K4q3wqtCnqCqReF4YioxIlWUzFm9nypNuxBLjHVHuglHyly25+VCALjHsnAlmMiPGtmKkM
	4ZSDk0wyEBUM24F7zawHbfshF7pCawg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-xgSohcqfMsCW2Xn8SPqIng-1; Thu, 08 Oct 2026 02:19:54 -0400
X-MC-Unique: xgSohcqfMsCW2Xn8SPqIng-1
X-Mimecast-MFC-AGG-ID: xgSohcqfMsCW2Xn8SPqIng_1791440393
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49cdc4080ddso2222735e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791440393; x=1792045193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lBkvNqNk+kq9xlFcI/2YnHiKYK3/wLihDPOcRkcC1+Q=;
        b=s2BKS2ctU0b3qjcnTzgwyJBnpjz4VNtMdAz44wgPUacWN0j3j4OUR7R1j4JIc06UH+
         ONwjpwtqYkwsP+mfmJWXDVc/534vIoHRzLPZbRPpMMM4HjHVJtzn5oaYCHRgS18WlKnU
         bo2Kb2vIw0FUUnVuPu12N9j2AxNKYuBZt4jIaeArPer5JA4GAU03YLTyz/fOP452BM0D
         1PXWDl4ImQyZ5cS5mgs4quPjBFBcLQaWPgitUNZZeP4T2aqCncH9vT7MTazKzElZvs/k
         vjkoMtJf19F8Asc4qzeXmWA4Xes/1Xx+f7omH/7XoRKqGv402+bBttW2oVFUG8kwX0la
         1WTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440393; x=1792045193;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lBkvNqNk+kq9xlFcI/2YnHiKYK3/wLihDPOcRkcC1+Q=;
        b=2gG4/F7F5HRJQaFs0I8DpkgV6rGQq5TKWIay5euZX76j7eGCLYb80WNaAAV/hi4wEf
         9Kktvlxzj92Prs1uJ29AMRy99S8RqMU5xPxmRljuX2224AO+4nD3qEYsAqjM4OzlmbBr
         CJAd5s+WCGlEDV6l/S7GsHOSQFUOJ5PM/hSJh2xGg3PNwYjppQ46ZXxdHfFXzkE7Q8CZ
         X7EmL4g3sqZhHXVy86/CNYnSNRnG5eaFzGL/WOSRsAeBQjSX1tk/EZDa1R/t6GJ7zVkB
         KVoVg1XfzQJ5Jb1i51mUtuOIVwytMS5WimHAnBp6VbA9igBgYeGopvwdMTtFScTafXs1
         VMDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMGomgUNSXyU8Ulb71pRxLYmSQ9Tx1Sxuea+j2PxPpTHGeP+xbRYfDNhlY2ja824nWKLdz/bdAdKiWe8Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lgQXs1n1GyZA7BM3Ovnk/NOTbICDXAw7K8ZmS/sZxJjCg7jzFV
	lnxUhjo3WeVtiLc3FQNZCO/RjRAnKkCr4X2S5NEkKL24DTNdx+VVG9jJVxiRpR31TiEqXVQiq3x
	glq+t9aTVFjycFsr/ORXkupIO9Aj62/Yd5vjLPr+PpkRRq6mruI3IrBUdOAnv+cnQdw==
X-Gm-Gg: AYBFou0s/vkSuUyPYlbsq7j1ZAcX60yw3LgG0G1fut6tSZxELc5rzRKGVGeld/cX357
	EhDTexbaw/gC91uIgUcjDq/8D94H/C8uKKF1BdZVnP02eeviyqKZYb30+TKanxvUddjKkagsDZ1
	rD1vZWgX3IY8fHX0KqFdizp7CbSlBfmCv91rd6uj7zaxJy64kQL0aYnAv9fjRAEB19naX+QJMM4
	KATMcz9a1wUXO32RIaCIA1TJgg6GY6MRm7Q5Ed4LrvyD02BXdg8cOJbKiQ+nVwukqyz7W6+6gHB
	egqcee2xt2E/ae9TRbDj2Fywrkm9YmDhhFU+0KBa+Je0mQqQ5LjeLK9saqqoZ75PG68lt10=
X-Received: by 2002:a05:600c:1553:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a1851c05admr26726455e9.14.1791440393033;
        Wed, 07 Oct 2026 23:19:53 -0700 (PDT)
X-Received: by 2002:a05:600c:1553:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a1851c05admr26725845e9.14.1791440392494;
        Wed, 07 Oct 2026 23:19:52 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71b786d8sm9384557f8f.0.2026.10.07.23.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:19:50 -0700 (PDT)
Date: Thu, 8 Oct 2026 02:19:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: sungbyeongchan <tjdqudcks0424@naver.com>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH v2] virtio_ring: use shadow flags when detaching split
 descriptors
Message-ID: <20261008021938-mutt-send-email-mst@kernel.org>
References: <20261006102112.847280-1-tjdqudcks0424@naver.com>
 <1791422498.2257345-1-xuanzhuo@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1791422498.2257345-1-xuanzhuo@linux.alibaba.com>

On Thu, Oct 08, 2026 at 09:21:38AM +0800, Xuan Zhuo wrote:
> On Tue,  6 Oct 2026 19:21:12 +0900, sungbyeongchan <tjdqudcks0424@naver.com> wrote:
> > Fixes: 72b5e8958738 ("virtio-ring: store DMA metadata in desc_extra for split virtqueue")
> > Acked-by: Michael S. Tsirkin <mst@redhat.com>
> > Assisted-by: LLM
> > Signed-off-by: sungbyeongchan <tjdqudcks0424@naver.com>
> > ---
> > Changes in v2:
> > - Drop the commit message paragraphs as requested by Michael S. Tsirkin.
> 
> You misunderstood him.
> 
> We can not accept a commit without commit message.


Indeed.
> 
> > - Add Michael's Acked-by.
> >
> >  drivers/virtio/virtio_ring.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > index db678f5a80e03..b4cb433df1dec 100644
> > --- a/drivers/virtio/virtio_ring.c
> > +++ b/drivers/virtio/virtio_ring.c
> > @@ -905,7 +905,6 @@ static unsigned detach_buf_split_in_order(struct vring_virtqueue *vq,
> >  {
> >  	struct vring_desc_extra *extra;
> >  	unsigned int i;
> > -	__virtio16 nextflag = cpu_to_virtio16(vq->vq.vdev, VRING_DESC_F_NEXT);
> >
> >  	/* Clear data ptr. */
> >  	vq->split.desc_state[head].data = NULL;
> > @@ -915,7 +914,7 @@ static unsigned detach_buf_split_in_order(struct vring_virtqueue *vq,
> >  	/* Put back on free list: unmap first-level descriptors and find end */
> >  	i = head;
> >
> > -	while (vq->split.vring.desc[i].flags & nextflag) {
> > +	while (extra[i].flags & VRING_DESC_F_NEXT) {
> >  		i = vring_unmap_one_split(vq, &extra[i]);
> >  		vq->vq.num_free++;
> >  	}
> > --
> > 2.43.0
> >

