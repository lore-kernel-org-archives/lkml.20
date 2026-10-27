Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793128771;
	b=wPx/vcBjsJo/gZ0osstbebO+2b7YzIixLEFmvVX7uDnqGsV66FViw4zMOLCVNTav9fGa
	 ajCNf1gURfJXV3cHQrJDL3sICKJu0gd6XOQgqoArGaygo3/8vrY8CPTQVgkyBCUDx2qtJ
	 ZOgpr0Ml7yh9rlW627c1dncXmJvpt0IrD657KCo6MpTubjilpdYR/n2HntQjGIRGJPr21
	 AmE65YftJKw6lEVabFJ+mg9xPmEz42po4Y97wzOLVZFCs1/6TU8nPg4QEo4ehHQD4J2WM
	 4aF4GvtsvNnNcngzC6gVVqlYeESf9a5kkAEDWVQgyuN3cm4rqaW+qUWYxtaAFNOnkbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793128771;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NDq5khxQ+WqrT0Z/KGYDQfM27UlUOaUjQhhNJn0MrTg=;
	b=0LPB9v3m0tfppz83zykDV5xWV7CO18GXIeNxeTk54Mvyr6ewRNLNHBnyhgIxQzj6tOK8
	 lfP1wDd18pOK1UAQClQ2HuOj8AcXqlpSX7rFKgklFgU3nZIFteyMMgbuJ2jS0jG4/e7yN
	 wrYqegYE9xE/wSJuDfPzQYvLX8GqNDyc80RrMdybTywWmf+qZ00ha7tZBzvpFSdgBiiEs
	 gymo5VQgRSk+ArHDtOi3EtSeoi5F0HBGOHbmDqtBCKrrYG6vNUWKMwzSTsRe2zzRN2kHx
	 d7QGGOwJAUC3zMAS4qOS4QGS+0zJoAKrgVBHZqfIEFA25jo/b09TRu6oCHMJS4tlpFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="P/FltBI7";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pq89LmmQ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A50606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30A50606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P/FltBI7;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pq89LmmQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793128770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NDq5khxQ+WqrT0Z/KGYDQfM27UlUOaUjQhhNJn0MrTg=;
	b=P/FltBI7f8gBoojc3PbAMem8+hKiY06yC+iBfvL0TyQ29n7vPixDd2rE8tLtu+AhLXIR9e
	zDpT6Dxk2AZ76fGGzJlNvay9iVKhJI2B3yg72NFI36b2IXHBgJkwNGnKzpKqZVVkUbT1rW
	ZmxZ22uDFWGJnry1tOJbVENoQpHX0JU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-aU56AShqOWSXr7EFUAHtEw-1; Tue, 27 Oct 2026 15:19:28 -0400
X-MC-Unique: aU56AShqOWSXr7EFUAHtEw-1
X-Mimecast-MFC-AGG-ID: aU56AShqOWSXr7EFUAHtEw_1793128768
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e0fc747a7so123241f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793128767; x=1793733567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NDq5khxQ+WqrT0Z/KGYDQfM27UlUOaUjQhhNJn0MrTg=;
        b=pq89LmmQfTm76birDQGsUnlKrrrSm440ZfSV5tzfzPWom8IMOdy+1K8zA8TPRNeJd8
         txUfDwhBTCh6p7CooGKyEzdzQ3HDfr4CjGK7sWz5nnEgHX5u7NNryn2n4cSOUFwajVrA
         LpF6nNt/SgcubSbNPkPFB1ytQvpho9XoUe0G4j1vUbrfsQvkUTO7Z+lRN8FxaS4UZEF5
         hNmX2Hk0ksE1t/AZSpVdD4ADHwSDzTOCGjKPvuLgEJx1s2bkY54g1J20rrRZTSu+QCDr
         hiKmN69t8ZP/SIdxVLPdfYNXLn30zT8PK+6URY5kzkrcZQg7iZWioYZRtHp0tWZANmoR
         +lqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793128767; x=1793733567;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDq5khxQ+WqrT0Z/KGYDQfM27UlUOaUjQhhNJn0MrTg=;
        b=mYCAim4jEFmUwBMfEEXk49VsGXw1Sn43CNh5HTLxGrtZFx2XnQ5++d1Gspuc5+FME9
         6F3HkYDYeKUdWpzbLNxF+STEfje1nyeIqPFXQEQKNcuc+GFHp0ca2sEqshuZBkX4c/Ar
         Wf6Zjbbe+2fhoB7Wgyx6kTyKK4EkyXcFJv1ZkeVgZmBHKRHJAK+ll7UDkn9xHrtg93O/
         RTW2SrUxqDWeLsLIc6Ba3jFiagyCJBJwMZnvLUk2iS4vFvROhvWxIi6EGVj0wYR0YD3t
         j+o9hAmZzuXX99+auHBAFvD/UGs+l6w5cSlKx54t8XXJ0Di+RFWVF6afa4GdHUp/tQFe
         cF6w==
X-Forwarded-Encrypted: i=1; AKwUvBwvWa9J+cu4CftL38oXXgJ+DnAX1Q0Li3C4bZa1ISXzSCmMPVY6p/uK/8O7hgqWmMqTI6AcrXf1nwto/8Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+m2TJtN/5CRNlJD7peii+xvYox8R/LfHDGVnzZXhXF7uoGRDv
	jbE1rmWULO2Zno6C5dBXSexWRM8PXvIZ5WQPilWeAj/jihH9SqWTPcgBaVkrm/3YvMMONuHkINf
	Rm4Dsbdtu4/UokSV1PRwEoE6ZgTGB+MhrZ1P0h1ReWVcjvjY/AhZqePJJMf2HWCllCg==
X-Gm-Gg: AYBFou3QvlvCS+ELdvGnAEYvvlplku8EKyhbGepkj5tJIJXzp3pyCM2auzLykr6qHJh
	o/ridYTGcPIoMnY9wjN+Kp2Q+Al1e9wmCo3LdilEbPZhalyn6zlWrzMBUkMFslfW6QFgPWArqbB
	QT0d/mfd9LvVzwbFdFJ2GlaszkS3ksKkhm6RTllVpocT15b3t40qM47i+a1EQBDxS+7nwk/uV4Z
	PoqHEhZaIrbF1TZPo8+vEQmP9EEARbZt3VbDYwYyfmR2WCY9atzKjXEqJ0sDhMN3fnhxjcM/ovq
	frXgUUp1gZhuy1xobBRGM1opKgat0Tfq9Xg13GLeLBEymVh9Yk/HjJMh63r5agnpogc=
X-Received: by 2002:a05:6000:1a8f:b0:48d:ee35:b3fe with SMTP id ffacd0b85a97d-48e5d45a495mr870577f8f.8.1793128767403;
        Tue, 27 Oct 2026 12:19:27 -0700 (PDT)
X-Received: by 2002:a05:6000:1a8f:b0:48d:ee35:b3fe with SMTP id ffacd0b85a97d-48e5d45a495mr870532f8f.8.1793128766789;
        Tue, 27 Oct 2026 12:19:26 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm19045689f8f.40.2026.10.27.12.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 12:19:25 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:19:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: shao.mingyin@zte.com.cn
Cc: jasowangio@gmail.com, virtualization@lists.linux.dev,
	pbonzini@redhat.com, stefanha@redhat.com, eperezma@redhat.com,
	hch@lst.de, dlemoal@kernel.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] virtio-blk: Fix zone append sector reporting in batched
 completion
Message-ID: <20261027151917-mutt-send-email-mst@kernel.org>
References: <202610261955196384aSLGuy3_0MiTvlYXVdiC@zte.com.cn>
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
In-Reply-To: <202610261955196384aSLGuy3_0MiTvlYXVdiC@zte.com.cn>

On Mon, Oct 26, 2026 at 07:55:19PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> For zone append, the block layer copies req->__sector back into the
> bio in blk_zone_append_update_request_bio(), so the driver must update
> req->__sector with the sector reported by the device.
> virtblk_request_done() does that, but the batched completion path used
> by virtblk_poll() only unmaps and cleans up the requests before calling
> blk_mq_end_request_batch().
> 
> A zone append completed through polling therefore keeps the sector that
> was assigned at submission time, and the file system or application sees
> the wrong LBA for the written data.
> 
> Move the sector update into a helper and call it from both completion
> paths.
> 
> Fixes: 95bfec41bd3d ("virtio-blk: add support for zoned block devices")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index c8bfbf8435ac..cc29b8238a4d 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -331,18 +331,25 @@ static inline u8 virtblk_vbr_status(struct virtblk_req *vbr)
>  	return *((u8 *)&vbr->in_hdr + vbr->in_hdr_len - 1);
>  }
> 
> +static inline void virtblk_update_zone_append_sector(struct request *req,
> +						     struct virtblk_req *vbr)
> +{
> +	struct virtio_blk *vblk = req->mq_hctx->queue->queuedata;
> +
> +	if (req_op(req) == REQ_OP_ZONE_APPEND)
> +		req->__sector = virtio64_to_cpu(vblk->vdev,
> +						vbr->in_hdr.zone_append.sector);
> +}
> +
>  static inline void virtblk_request_done(struct request *req)
>  {
>  	struct virtblk_req *vbr = blk_mq_rq_to_pdu(req);
>  	blk_status_t status = virtblk_result(virtblk_vbr_status(vbr));
> -	struct virtio_blk *vblk = req->mq_hctx->queue->queuedata;
> 
>  	virtblk_unmap_data(req, vbr);
>  	virtblk_cleanup_cmd(req);
> 
> -	if (req_op(req) == REQ_OP_ZONE_APPEND)
> -		req->__sector = virtio64_to_cpu(vblk->vdev,
> -						vbr->in_hdr.zone_append.sector);
> +	virtblk_update_zone_append_sector(req, vbr);
> 
>  	blk_mq_end_request(req, status);
>  }
> @@ -1196,8 +1203,11 @@ static void virtblk_complete_batch(struct io_comp_batch *iob)
>  	struct request *req;
> 
>  	rq_list_for_each(&iob->req_list, req) {
> -		virtblk_unmap_data(req, blk_mq_rq_to_pdu(req));
> +		struct virtblk_req *vbr = blk_mq_rq_to_pdu(req);
> +
> +		virtblk_unmap_data(req, vbr);
>  		virtblk_cleanup_cmd(req);
> +		virtblk_update_zone_append_sector(req, vbr);
>  	}
>  	blk_mq_end_request_batch(iob);
>  }

