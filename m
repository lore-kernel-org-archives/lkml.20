Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1394C46C85E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436395; cv=none; b=FzA2sMwzbZIChPQS7VaGlIeoHRGVveqSyWp2NPpvJBtHoJMfXZc0/QBquMkIYLrdatsoLdeMgqPIGwbR3iKTEJkvS6purO9iTG7gKsaakA1pyt8Zn29XuwxdQlVTR/BBh5UxoAfLATIzCL1HrPsZXLzFEyWEOxAonAeUWWvfouM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436395; c=relaxed/simple;
	bh=NXdwaN0ZLM9X4EiI3vGfuaCSH/ohhs7TAIZQWzgxxSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1ei7K448hMdIqJzFyX7U0LPHQsNQt4rMlu6uUIA/cCBSL6huE8tOi5xN32TZMOIrc0wmpbGx+rQur2STexhkTgE4uRdpCAq//2hXvb2KQwnnzZKa2yBg1MpBct4tBngA8xI+5Va+yfHN46Woq0FwkzXLr5QvKJC5+AEYD2t8O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JTqGY2fR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HSJWg+Uw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JTqGY2fR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HSJWg+Uw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788436388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zt5TFwXrVFNhjDyjDPH7hfKRxLknQjHaFWOGKgUQ+7s=;
	b=JTqGY2fRMNPXsUrhYqtgi5lmOx4faRPVd0RhOkWIXCVLOmaUi3mzrJUpSWXvBdARSPukf2
	S0H9Ckk0BJfvTbPk61NLUHXfFMlEXVVkrC/B/7qfx17QwWdOreIf/gd+nq5YriAM3C9iW5
	Hk8kLq32ujBCvn5737Mxc8TahrbP2wo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-0d0WJ_qqMH-c-1yXNGP3yg-1; Thu, 03 Sep 2026 07:53:07 -0400
X-MC-Unique: 0d0WJ_qqMH-c-1yXNGP3yg-1
X-Mimecast-MFC-AGG-ID: 0d0WJ_qqMH-c-1yXNGP3yg_1788436386
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49b8c651ac0so26574055e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788436386; x=1789041186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zt5TFwXrVFNhjDyjDPH7hfKRxLknQjHaFWOGKgUQ+7s=;
        b=HSJWg+UwLdFx70G6p8NRWYydcRL/sLRBWegSeaivfBIOX8AIia7fF8uzo/uziuIrUF
         8kHDPU89ehrspTBN2VSbwGrXlpK8Czw/UvHz/lkdRNAV+Z2uQ43KGR87yswdzP4TUhk+
         u8WsZjB84XTW6flkqRXew7dGmHkXacR+6PkYPH/vXYQ9MEP/Odpuq2DTnhhLIvQSTJut
         XwOUL2qL3dRKtKoWmOpCFA+sQguzWbTDSbikWxUmnJLM4LIhYcoWHx7cmznXrUpf/zUt
         OdGrEGaF9QFuNBRm/MQ3WlooT0GrZwobRnh93CLlJD4eeiY8EJ3VKfs9R39Kgzihojz0
         VSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436386; x=1789041186;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zt5TFwXrVFNhjDyjDPH7hfKRxLknQjHaFWOGKgUQ+7s=;
        b=CdQKPIzZr/ihUZolI8OiCA6vDUrdf/qGv9riTwF97Nq+pmMGgd9gwbgNY3eRyWKq3a
         vy41MqsRbJBwbFUgxLHFpm61y77DD/+mi2yLoi/825yK9NK7zHR51FzHReM6yDpuMWlO
         lL8xBr/4qkPz8JqJLhmAnqfusYrKo4gaXsPP3C7iZCUe60UomdD+BJZPxtiZhwCRU8e3
         XrU+nhk/7y55rEw+buLSv2M2Gc6/ede/nNIFJdYuWFgEkPpYrWtnUKf3qtHIn+3VeeQk
         67u4vaXFbC3iWr7VtGQFnfSm5UXGu2fpgXvk//g2w7b6hd37xeLN29tBOdRm7MmjUzqT
         eRqA==
X-Forwarded-Encrypted: i=1; AKwUvBy/YNwUEXWOntKGFR0IKm96CmnGezgFy/nYfCwEWU1RKziRBcizHRUL9ODRU2S/FG4n3R7hW1alzU4OGP8=@vger.kernel.org
X-Gm-Message-State: AFuF++mfRXzzmQ0BGeHew2V00R772BI4rWWZdD4DI/TS7ymZqVr+fgKF
	SvVD+Yjdtbm2JMA6aJMbZY7r0UIdlgEnF8B2JTRWKEQTydvIv1HGOd/G27/HL9X0z/YrIXw6/de
	WrXCIGRhGMq8Lx+9HPjJlpFpSc5IOvQmGk/z5+6HFCbNN0C8LCz/h/TBylRn5Sn7wFg==
X-Gm-Gg: AYBFou29/OQjT/sgRgjsbIU9Soe4o4Hb1dIwfEyiHPOveSHzCAej8B7mhA0mgjCAhsh
	7Ms0YdtO3ehu+sXcGBZyrpAZ2plTf9WJoX7spsarzllbTIZldqlV8p1bmjpP25OwP/CDu/nt/or
	kq/iaAwCxMwQRFVlZ6yo2tswD4yVToPgWKrrcfmJ//kJuCJtbUdJhb0CqL+4EqQtke/wUaqp3pB
	kDBiqa63M3zE2SwGJK7WAwmWijgCYJUdOj391dOmfvWN6Avks1EpkeT1aTBz46Swal/zLoa0APX
	lv/vjVUB6xDHC+63qP5vi/oOszBlmbWUsUhEeE4CKzRBT2o5sZbLsI/CqU0qZhZA5eUqIMyH7FU
	Kz+uQqxEkw2KDy3Fu6bzL7Bc=
X-Received: by 2002:a7b:ca42:0:b0:49b:92df:87be with SMTP id 5b1f17b1804b1-49ce55fbdbemr146698915e9.4.1788436385732;
        Thu, 03 Sep 2026 04:53:05 -0700 (PDT)
X-Received: by 2002:a7b:ca42:0:b0:49b:92df:87be with SMTP id 5b1f17b1804b1-49ce55fbdbemr146698175e9.4.1788436385256;
        Thu, 03 Sep 2026 04:53:05 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm85689205e9.0.2026.09.03.04.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:53:04 -0700 (PDT)
Date: Thu, 3 Sep 2026 07:53:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Pawel Moll <pawel.moll@arm.com>, virtualization@lists.linux.dev,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] virtio: synchronize callbacks during device reset
Message-ID: <20260903075247-mutt-send-email-mst@kernel.org>
References: <20260818040433.66986-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818040433.66986-1-kmehltretter@gmail.com>

On Tue, Aug 18, 2026 at 06:04:31AM +0200, Karl Mehltretter wrote:
> virtio_reset_device() documents that vq callbacks are not in progress
> once it returns. virtio-pci delivers that by ending vp_reset() with
> vp_synchronize_vectors(), virtio-mmio does not, and a driver that frees
> state its callback uses then hits a use after free.
> 
> Patch 1 brings virtio-mmio in line with virtio-pci.
> 
> Patch 2 makes virtio_input reset before unregistering its input device
> and stop its callback once teardown has begun.
> 
> Together these patches fix the use after free on virtio-pci

pci has synchronize on reset already

> and
> virtio-mmio. Classic virtio-ccw and other transports still
> do not provide the documented guarantee.
> 
> The use-after-free was reproduced under KASAN with the race window
> artificially widened.
> 
> Callback synchronization was tested in an arm64 QEMU guest with a
> virtio-input device over virtio-mmio and four vCPUs. The event callback
> used a busy delay, not a sleep, and an in-progress counter tracked
> overlap with unbind.
> 
> The driver was unbound and rebound 120 times under continuous input.
> With patch 2 alone, virtio_reset_device() returned before the callback
> finished in all 109 races, each in under 1 ms. With both patches,
> vm_reset() waited for the callback in all 111 races, taking 24 to 86 ms.
> 
> Karl Mehltretter (2):
>   virtio-mmio: synchronize callbacks during device reset
>   virtio_input: stop callbacks before unregistering input device
> 
>  drivers/virtio/virtio_input.c | 8 ++++++--
>  drivers/virtio/virtio_mmio.c  | 6 ++++++
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> 
> base-commit: 3eb40771c00a8488fa6ed2cc1fe203477908bf38
> -- 
> 2.53.0

