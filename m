Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211433DCDB0
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281436; cv=none; b=foTy1+2zOlfLYC/7VmtKsOGbYJwnanHK/qa0vUM3UGpA/PG8k6j0Pk3rJnGrakSPOwfO7mW9d0DGU25caCfSYP0vmgh0MI+OsTAtcU58EolmMJ784uDmqUebA77JYKyDRqkTsQNcUbDri/y4UZG1lJufc/kj5w8AOl29YCXp+dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281436; c=relaxed/simple;
	bh=N2sqn3Mrh9cMwgsNdDkjfWDmTzoWYIrPVQyIvXfpLM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EF/GGEsz+CYrp0d1jlnNcYBAxWs2+pQ46g8O1dBicM1lGMfCb860wrYQJjB42oxmaJdyR4EoaTpnBRx9vM7evi0B/3PjRcod0NVI9F9EIrqq8jV4rqSToW65Ws92A8CoT06a3AGMkZKdk3DKDVSYExqQRa51+wociVjNwai3j3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NdVfUjUL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bgEVPfUF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NdVfUjUL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bgEVPfUF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791281434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CuhYqf6tY7m4XrIgU7T4atxSrQDOejKxcMknnN8Lwz4=;
	b=NdVfUjULiJHoHIFoJIfWf1rR6YwK1N6EwAHoLBc0ilh44FwF80Vo2KWlATDoUEHH+cDqwZ
	226HukgvZqqoAPkPbGJimPT/xHSFOKmaaPR6ESyY0nHMlutkevM8amx0rrYGuzOdvqgeXY
	1AYrykNXemVD8xgMxqfDwmRK3g3+3XA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-nQc00cteMICDKI-atnUvBA-1; Tue, 06 Oct 2026 06:10:32 -0400
X-MC-Unique: nQc00cteMICDKI-atnUvBA-1
X-Mimecast-MFC-AGG-ID: nQc00cteMICDKI-atnUvBA_1791281431
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48c46582442so1391245f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791281431; x=1791886231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CuhYqf6tY7m4XrIgU7T4atxSrQDOejKxcMknnN8Lwz4=;
        b=bgEVPfUFohPYiyPLTU5xF4CYBqWB6NDe3dg52dt9/Qbgra9/C1eegcWYoQrRDK1wVG
         wm/xy2UaAqmUne3ntc+3WTfuVKU8jO5tGpU+MJ9GgrqfrsdA4OnBF9r//Mr4BG47HMlz
         OQ3sEAmFztolpL04Jt9H4kmIYltP7eaGnsz3/ZtgwXmuIQqlC6OSLgYMjzp9rYTs0Rad
         4L5oXCmQIGixYZeWrGhfXz9ER+5CYWHrt2p2J5mGXO/ekhoCZJNSkkamLZfVZ/qu5P68
         15meKatOPWyjY6SrbNF2GQhVbi95oISRRuUtBEFr/P0agz+aT1fxeOAnyCaIwxnn+5Dc
         rm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281431; x=1791886231;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CuhYqf6tY7m4XrIgU7T4atxSrQDOejKxcMknnN8Lwz4=;
        b=UlbVUXr1JShYyYcfu0Hh5QKHDshGp4QQ3iwg3gOOW4y9aPwy9prpwa6y8Q7bqQyjoN
         Wc1uftmSV5UWzaDPZSQBQKHrvrcZ3nH5YNk45LUsg5kquHtckwt2jEOKvDG/l97j6sDT
         PhgND98Kwm+BPeNtrHCzT61jnKoFpD1qwYSjzmhyZ0DRsRwWZ4//n1uM64g2S9KjePmc
         y6XLwL+2nHcqCdY4QVIDMATao+gz3/TW4uCwZIeALcA5boIx20D5kWiZjzN6eMwY1CmA
         fCfDSq/Pj/YNwR7Zb2v7URp56lf3zWfSzvKGriF3LcJsREpfK2GtKbVe8DoaZJuISyCi
         q3Jw==
X-Forwarded-Encrypted: i=1; AKwUvBw+O7KT4uu7dnUYmjEeJPD3b5yRp0/ojOJ1WvtxX1iZnqy7EOiYziAmCXNqRo+81oXqq/6eimoK9xQf8/Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvBYm/MstA+xUJG29r2THSlFkemWI15qYtXLcNuW24QeXISeDg
	cdMiPyqrD8Wzn9GM9btnBD6XVIoMFLSbFy0aHX8PVkxFMNbZJngiricDd2mNWGI9HwHSsm6DAr0
	EwfVVbxUZIe8X16AadRPyzp19ciQZBpvkBfiMSRgnMPNVJhgIAZNestJFwoLMx8jOtw==
X-Gm-Gg: AYBFou1Kxltkf7Z4O29Qz22y2CigviODMmw/kNuS+A89pvsmjIc9D7r/AMYNsnYYHYk
	Zc14Ltvzm9eRmZDPa6yVX3tULXMGRaAknmS1WZQTMQ05bmxS20o9PUCOefgOonYiXQ68/Owo1a4
	/qSbdEzld+KkVqJb90B0ouRudmQw/IRcC074kpx44q89yHp/fllXCn9+0/wwHDVXJrmx/d34kda
	og1abBq2rdZvOiUIeOet2pP6IvqyHXngl3IsDRB4fnx/IfaaIKElbRuOrBD/SLHmmPE3ucbeDf6
	qf1f4RyGTgaFC58FfPEKj8gPZ9sZtuYtSzEnGIZg0dhbGcFngqUIqjLMIhit44/fZRlEAzE=
X-Received: by 2002:a05:6000:2610:b0:485:8c16:a34b with SMTP id ffacd0b85a97d-48c47fedcf3mr17075700f8f.35.1791281431388;
        Tue, 06 Oct 2026 03:10:31 -0700 (PDT)
X-Received: by 2002:a05:6000:2610:b0:485:8c16:a34b with SMTP id ffacd0b85a97d-48c47fedcf3mr17075655f8f.35.1791281430798;
        Tue, 06 Oct 2026 03:10:30 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622ab326sm9129953f8f.35.2026.10.06.03.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:10:30 -0700 (PDT)
Date: Tue, 6 Oct 2026 06:10:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: sungbyeongchan <tjdqudcks0424@naver.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] virtio_ring: use shadow flags when detaching split
 descriptors
Message-ID: <20261006060900-mutt-send-email-mst@kernel.org>
References: <20261006100400.842345-1-tjdqudcks0424@naver.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006100400.842345-1-tjdqudcks0424@naver.com>

On Tue, Oct 06, 2026 at 07:04:00PM +0900, sungbyeongchan wrote:
> Split virtqueues save descriptor flags and next indexes in desc_extra
> before publishing descriptors to the device. The detach path uses the
> shadow next index, but decides whether to continue by rereading the NEXT
> flag from the shared descriptor.
> 
> A device can change the flag after publication and make
> detach_buf_split_in_order() detach an adjacent active descriptor. This
> overcounts num_free and may put a descriptor on the free list twice.

This seems neither here nor there I'd drop this paragraph.

> Use the shadow flags for the continuation decision as well. This keeps
> all detach metadata in the same driver-owned snapshot and avoids an
> unnecessary shared-ring read.
> 
> A VDUSE/virtio-vdpa test which changed NEXT after publication made six
> valid completions return seven descriptors, with one descriptor ID
> duplicated on refill. With this change, the same test returned six
> unique descriptors, while the unmodified control remained unchanged.

This too.

> Fixes: 72b5e8958738 ("virtio-ring: store DMA metadata in desc_extra for split virtqueue")
> Assisted-by: LLM
> Signed-off-by: sungbyeongchan <tjdqudcks0424@naver.com>
> ---
>  drivers/virtio/virtio_ring.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)


Patch itself is good, I always like it when the # of lines of code
drops)

Acked-by: Michael S. Tsirkin <mst@redhat.com>



> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index db678f5a80e03..b4cb433df1dec 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -905,7 +905,6 @@ static unsigned detach_buf_split_in_order(struct vring_virtqueue *vq,
>  {
>  	struct vring_desc_extra *extra;
>  	unsigned int i;
> -	__virtio16 nextflag = cpu_to_virtio16(vq->vq.vdev, VRING_DESC_F_NEXT);
>  
>  	/* Clear data ptr. */
>  	vq->split.desc_state[head].data = NULL;
> @@ -915,7 +914,7 @@ static unsigned detach_buf_split_in_order(struct vring_virtqueue *vq,
>  	/* Put back on free list: unmap first-level descriptors and find end */
>  	i = head;
>  
> -	while (vq->split.vring.desc[i].flags & nextflag) {
> +	while (extra[i].flags & VRING_DESC_F_NEXT) {
>  		i = vring_unmap_one_split(vq, &extra[i]);
>  		vq->vq.num_free++;
>  	}
> -- 
> 2.43.0

