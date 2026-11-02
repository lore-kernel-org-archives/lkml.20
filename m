Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640613;
	b=raYOrtk1TkvoRBWtLtVjnIc9XPF7Gk1+FX2mwGoZX8VboKZkMFWK5HV66Y7kWQQxrJ+/
	 46TYc8Pnn2+UAQM5c/xHAgwlRwXTVwR+LHKpDtrLxvwsPfHKxl9eJwqevEYsuQgNdSZpr
	 rsIDaXiAyJq0lFMKBpCmZOvNkj12cq/DWX6/KekvWgC5V3nZcGkg4XsbVLkzMwLJlZ7CP
	 KWLnOLJr8T6fKBdnGznn/deE9zqo1zf6buRBhYl4fD+Fck6aB3gqxc7L9AIqaI+CRLLuY
	 OqDi13ZVSVrfBXJrskxPuXWgtnSXCT9Te6QqA4VuFn9+ViQKatOiFYXDvsKYBF6kopw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640613;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6iS3CAxGQE93xDrvwr4yw98qv93SkzvwRHW7OrIP7aI=;
	b=qodMhQzf7wxrDi4av1dLqZZVC9AFZt4Mt5u7LbQ57cSXO5PfGSA7eY1m9ZoOOlrbPydv
	 5XyfB8G2CbKsh0uWmiZmPQ4XUyciD4bORjkII0H5Erz7nCJ0/U7yuEsr6V3i8O8jlPpdQ
	 CVoFITKiCmbtHjesFJQ7vEXNe2Qt2OEBJCmn1Mtz/zdcsu+oHGExwTQeDKO26cSLF8dfi
	 y7kgbaPrbcwkztGV1g90q4HzmomnUW5SUWLKOxvNH5y8C3+sTh0Cu8VHtKcIpsfZYpFwF
	 1w1lViDpGMtvbgXcaZsv8o0vzhW/78221w5vTngQVqMPAUjdBHE/0C4wb9SHLTUt1tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cVHqKo+c;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=O4pI9YlU;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7261B606A5B6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7261B606A5B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cVHqKo+c;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=O4pI9YlU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793640611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6iS3CAxGQE93xDrvwr4yw98qv93SkzvwRHW7OrIP7aI=;
	b=cVHqKo+cR9hVdRp1gzTzOB/gO+4Bn1DxpQ+r2nfHdNNUg5zRVkKpD20/bc3WGMp0fvGXlG
	knCu3vQkM2t5YKrQ+cYMcP9d5UYUz02NU4LTexEoVGZ8B4et0ohJ3ujfCrnc1iSS8jCBHK
	UJilzCTU6vlv7xjzgyVpBGjgif7jB/s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-RzF6mrHDM7-ery7_Q5kRXw-1; Mon, 02 Nov 2026 12:30:10 -0500
X-MC-Unique: RzF6mrHDM7-ery7_Q5kRXw-1
X-Mimecast-MFC-AGG-ID: RzF6mrHDM7-ery7_Q5kRXw_1793640609
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a20e41008cso23299685e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793640609; x=1794245409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6iS3CAxGQE93xDrvwr4yw98qv93SkzvwRHW7OrIP7aI=;
        b=O4pI9YlU92DDxrrSy6abElpco/qX3degbuogWx2SVyZyGnQ8Ljm8FwI4vtxoPyfDyC
         rhCe1JAnalublysmvZ6emIRr4ywccBIFc/TvwrdeH/FMuISwOSIg5cHb6MSYJ7MzZu0y
         yFsgAi16SjhXDtpLRy7vETL/sUyNwc/N2NMNodNJ1l9y/dGEvLTF4VA2p5XJdmE7+kzQ
         kEebFLK9C9ODAhgFXrTA1Gqx4IU7k9Bj9P3/jQPyW7Kmze2YxH2EFHVfP2KGGOCElP4M
         G9zeKnZ7EUvP59V4zJiHeV/v/BkOMR99FE1/Bjog31DElcdlOg1M5UQSgwPTzPtD52Vm
         ZixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640609; x=1794245409;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6iS3CAxGQE93xDrvwr4yw98qv93SkzvwRHW7OrIP7aI=;
        b=dOGOsce3euoymD4vn3KMqwOX4XtxrbZW+YfVXIwszl8NkatoX9IbEzJqrcHOYDN9ju
         IaK8VuMAbcujeFddfnLcOdletfFQsCmyHQn6DHlS7duifyuvObnSK0VNrJ8LktiZeXYZ
         uJx6pgrly0PBE1sa2DXl3+dNf5Bo55GC5xEswbUtxnif1WYWo4xY+cJTECwnClca3wgd
         eYrlxHaW6XRzwaAwbiScINHWeNKdjyrZ5Yqqq2PJ8ILVHev9vEKpHKqaB46LMh4/EjrK
         xvQ4m0q8xwKWQ9+IVfz+DOxgA4+49R36wJktIXPhV7YsucuFXzJshDgPBs/F7I8Sa1vx
         oLNg==
X-Forwarded-Encrypted: i=1; AKwUvBxi6Ok4LEpqh1Xw5IIyuZLfKxWBsHY4UZYoaBcSNgB4S2BtKhU5vu8fwesTqtaCI4wdJLLRtUeEstdjzFg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBeZALhHCvV4K1mRMVFGOZ1dQ9T35sdAhdpT/ifjRhjXG/YC8q
	qx1SXNM9PeaF5X3EWq0b9N9Jjco5qJhxnQlKsVZMs9qR81J+v5k6F/gqwZUytHz8dsSySECXcZP
	BGZwh/SvG3QNbcFeYbP219BQAUswEixmY+J4wj72acHpM8j28RIRvJJsD6cBSq9BrOg==
X-Gm-Gg: AYBFou0zST/lqiKcbWi2zpwG27EbdfvMu+e1mDcbyINx7Msm2fjpr3fGuliaEbSN0eN
	600kvxEIPxVpxyRSB24dK+63n2f1+xexkkGI3Sh0cuPmJHUBSQlgFy6YPuBtJpQOoFVcUrAikG7
	mpo8K2VfmYaPalXB71u0inqavNVxElISwMcDx3pnPk1Ax4jLLVd2m/lRG8tfZuY35rZd1n1GyNI
	wkRgemzVFIUgVpaATEm/G+Y21sf+EK9LQR8Kdvpwwb9Cr0cg1nTP9MFtg3glMWocJ2ZFjvaDjy/
	6sRbicGF+kmWszYplnq6ybdis+0DhAy1vl2QWkEmg6bT+ob3rzaGWzvR2NU9Ys3PRIf//gLMNiu
	LHAtyqis0xH+oBqpG+OQU8aN9H8xTX10gcnV1z4wfRA==
X-Received: by 2002:a05:600c:c088:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4acda922e24mr165297215e9.1.1793640608967;
        Mon, 02 Nov 2026 09:30:08 -0800 (PST)
X-Received: by 2002:a05:600c:c088:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4acda922e24mr165296615e9.1.1793640608457;
        Mon, 02 Nov 2026 09:30:08 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1506:fd00:9e19:9994:44b1:e6f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a8d60ca0sm1461205e9.7.2026.11.02.09.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:30:07 -0800 (PST)
Date: Mon, 2 Nov 2026 12:30:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Fang Xieyan <fangxy@xiaopeng.com>
Cc: Jason Wang <jasowang@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	virtualization@lists.linux.dev, kvm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Guanglei Zhu <zhugl3@xiaopeng.com>
Subject: Re: [PATCH] vhost/vringh: reject zero-length indirect descriptor
 tables
Message-ID: <20261102122942-mutt-send-email-mst@kernel.org>
References: <20261021070242.75009-1-fangxy@xiaopeng.com>
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
In-Reply-To: <20261021070242.75009-1-fangxy@xiaopeng.com>

On Wed, Oct 21, 2026 at 03:02:42PM +0800, Fang Xieyan wrote:
> move_to_indirect() accepts an indirect descriptor with a zero length,
> setting desc_max to 0. __vringh_iov() then reads descs[0] before
> checking the descriptor bounds, resulting in an out-of-bounds read.
> 
> Reject a zero-length indirect table in move_to_indirect() so the
> caller returns -EINVAL before dereferencing the table. Also use the
> converted length in the warning to report invalid lengths correctly
> when the vring byte order differs from the CPU byte order.
> 
> Fixes: f87d0fbb5798 ("vringh: host-side implementation of virtio rings.")
> Cc: stable@vger.kernel.org
> Reviewed-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> Signed-off-by: Fang Xieyan <fangxy@xiaopeng.com>


Isn't this already addressed by
Subject: [PATCH v2] vringh: reject empty / undersized indirect descriptor tables
that you posted previously?

> ---
>  drivers/vhost/vringh.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
> index 9066f9f12ba1..ce4f5a02c8d2 100644
> --- a/drivers/vhost/vringh.c
> +++ b/drivers/vhost/vringh.c
> @@ -197,8 +197,8 @@ static int move_to_indirect(const struct vringh *vrh,
>  	}
>  
>  	len = vringh32_to_cpu(vrh, desc->len);
> -	if (unlikely(len % sizeof(struct vring_desc))) {
> -		vringh_bad("Strange indirect len %u", desc->len);
> +	if (unlikely(!len || len % sizeof(struct vring_desc))) {
> +		vringh_bad("Strange indirect len %u", len);
>  		return -EINVAL;
>  	}
>  
> -- 
> 2.50.1

