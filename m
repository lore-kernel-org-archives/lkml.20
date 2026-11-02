Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641880;
	b=2DiMajiBoRk+HEqkKWyo810M27Ooo5FXroaSyNJq1C60178TyIuxUMwdTQdcJY2XfFjb
	 ray58h3n0Ggrzn0vmPSyRljxUeLkpVJ7F0uQzH1dOd4/mhCc/E2+hj8uSPakrg1GlvKzr
	 3skWGyV21SNFLrM9tLO5FuRusiqV5wI7h81O7Byg9ztFcxQEyLHwexJpqmXEoR188kIHH
	 mGfRegoglhO32GDE9Mbplw2Iw6IfLEC07D/xWhTb/vPdxqjOCK1B6CvxFgrBKBC35dZzx
	 33OjvX/GwsjgZvozxiOexZ7MBXc8PE/sGUa8p3ZhNmszX1mIizijAyJerMq9n4iPxFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641880;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=choUeHLrZ0l70fGRma7inaLcbb9ci6361nxZE/8bH7k=;
	b=ygpgYm/meErvpFEd1GerpN2bPDxo/XkQUK+8c4wqyIqM9HpCxQBTqhxB2DiPlnlXi7X3
	 mBLWVJOQcbq59jm7HiaEEh537OWy3yfBNr1nk7slTOuFNRjoLQ3mjONzX7i/vmUybJQno
	 i65m4r1xtH9hiC7Ud9IYK6Lsmy7c8THX1h2yzG3DXSQonBJZSaVXOzT/poKMkX6dxoC/z
	 b/CGujj4ZVYh6AbQoWJY29oFryArniayvFML/lExmgifoJEzZ/eEkNKLqiupAIg7AadHo
	 boejZhBZY8+y9QDfj0KRkMLYgTuZJ7/yU7ELIrfWhy2Vv7vVd9+PAB9jQxoLIIP347Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FSrcA6BS;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="HdZ0g5/K";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB59606AE9F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBB59606AE9F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FSrcA6BS;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=HdZ0g5/K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793641878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=choUeHLrZ0l70fGRma7inaLcbb9ci6361nxZE/8bH7k=;
	b=FSrcA6BSJBBMFZarTIuACtm1o1C5BxNbndvbbPJ0/LK08KOgtmMA6JvIdX7I4qgufMn5xZ
	NyFTEmrwGOs6KYgQTBaBIlQZzatqMOCSayMeI3R0fdrrZm1zJ79ZBAEmWKT7j28h2RFBrY
	eQDarwBv39rviHPGvBEkTyejJoWAAME=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-BsNoOCl7MO6GBH4hPvDd4g-1; Mon, 02 Nov 2026 12:51:17 -0500
X-MC-Unique: BsNoOCl7MO6GBH4hPvDd4g-1
X-Mimecast-MFC-AGG-ID: BsNoOCl7MO6GBH4hPvDd4g_1793641876
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48c430f0f01so2903090f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793641876; x=1794246676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=choUeHLrZ0l70fGRma7inaLcbb9ci6361nxZE/8bH7k=;
        b=HdZ0g5/KCUHzPwXu67P9GZCo+tctmaEcvlIMv1uDHhgDzYtmt4MS/CJEwmnaiesbgy
         xAO7mxIBj9u8j6ZnSn/WbyjAYlmMlbxe6Qh7G5TWt22K8pSv6C7VEchWWp31Dq+ItQtq
         CKDwNhh0Y+ygFQAa7JMaRSgEfum6lNrhGTAhgU0X+fAPJBLSiJGhYfhLhmPLnx6cChw9
         6xXXIKzbYor3gcPWTenNyiJv2zdXTiThUWaFtnH0Hsn/D1hjlfOZH2oDVmESHEIFSbNS
         3whqRMSeyr6soWXPCQ+3TPxnM2GvjhgUVMCgpb8Dg7/ojUhLCbgUbxhIEE6AjDLSRaH6
         3lFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641876; x=1794246676;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=choUeHLrZ0l70fGRma7inaLcbb9ci6361nxZE/8bH7k=;
        b=pqabRTrI/deuntdt1cQcksdRQTD0NJ3PoZN3cc1IM6dbmd/ZyHPzJBcbqtawYDbD6Y
         7wmoOVRIaJnkK7ZVuWdlqWFsaHBVCU9Kps1Uy326bomaR0Sl+hBZdtdqrkRF6+moNATs
         Od2XtZQgQPzF5c5vumWE7reKUEgDhJt2NEqQ5fheL4KvdcTYpxCyU5roAWknZ5PY4MV4
         0fIQuyxgnmRmcivq5KEbf2chcLGcZqsBuqNUN9gEITqEKZJ22Mefrc5pbNAHcAYLgPFM
         Mvg7p+vOhwG09Yuuj2Uis/FF4RS5yFBTJrUjqTLK4Mqqr2gmhX6KhOmo0ntyvOembIsx
         Rcqg==
X-Forwarded-Encrypted: i=1; AKwUvBx5I9qjvsjTIKLCIDYi58fK1ceYIdWlxRshVLSlfrvp3XjgEmD4MA3AHFor8KytlEeAwse5FlW4g1OBjb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SojKFDN8pRNMRAO76uTr4jhfdcptlDEcqFIse9y8gh5HVkwJu
	VsZgPyZN6GKvrLUSo3ypqR6g6Udak688nn05QoWOtMzDL9/JMaZfKrSBHpYDIYcasR0RMbhWort
	AMgdODIh+6Wi4QAVQIXP6EwC5oS8AaaXTrsYkEMNHdNKlwdAr6lzwLGvBjD42Unvj/Q==
X-Gm-Gg: AYBFou1bCpWjgaW/oCoHyf9YrCxHcRCx/rlpNjzR8CcKgz1UDrUnHHSuduGI9wE2Rqb
	S/8OzBcE2F+AhFp0+LDT2C7QcWTaepOkdCklu0Litqm/Zth84gtkNA5kWHN/G9a41EZlO50qsBD
	9QpQVtVVEGKIikfnDw/OCNFCQvEHpR9QfSkw+l2Qv7yh2yin3cZgFWLGSEWSGLIhLlWXv3WMmlq
	HIIHTTgrqmMXMcgXz51HySw1kH7OyltO6G5zeVs77dKBe6DUP7iFuQevm6qr2pzX/HA27IdNigI
	HDQeMFJGXVktBdCxmL/dnW8/OTA7kUV8qcJaWC3sVR6tvn986pSgXyTEJ/AvLg0SCWQkueGlUpx
	mr67XW+ZPccSlSvUARJdbicFvfjvq0Q3UoQfa3RHfdQ==
X-Received: by 2002:a05:6000:47ca:b0:48c:8126:a260 with SMTP id ffacd0b85a97d-48e6e2bcd18mr15610205f8f.6.1793641876103;
        Mon, 02 Nov 2026 09:51:16 -0800 (PST)
X-Received: by 2002:a05:6000:47ca:b0:48c:8126:a260 with SMTP id ffacd0b85a97d-48e6e2bcd18mr15610171f8f.6.1793641875584;
        Mon, 02 Nov 2026 09:51:15 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1506:fd00:9e19:9994:44b1:e6f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e86a06078sm4860064f8f.54.2026.11.02.09.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:51:14 -0800 (PST)
Date: Mon, 2 Nov 2026 12:51:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: eperezma@redhat.com, jasowangio@gmail.com, xuanzhuo@linux.alibaba.com,
	graf@amazon.com, linux-kernel@vger.kernel.org, trivial@kernel.org
Subject: Re: [PATCH] virtio_ring: Initialize id field in packed indirect
 descriptors
Message-ID: <20261102124927-mutt-send-email-mst@kernel.org>
References: <20261029072511.851-1-zhangjiao2@cmss.chinamobile.com>
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
In-Reply-To: <20261029072511.851-1-zhangjiao2@cmss.chinamobile.com>

On Thu, Oct 29, 2026 at 03:25:10PM +0800, zhangjiao2 wrote:
> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> 
> The virtqueue_add_indirect_packed() function fills an indirect
> descriptor table with addr, len, and flags for each entry, but does
> not initialize the id field of struct vring_packed_desc. The table is
> allocated via kmalloc() (not kzalloc) and then DMA-mapped with
> DMA_TO_DEVICE, making the uninitialized 2-byte id field of each
> descriptor readable by the device.
> 
> This leaks kernel heap memory to the device for every packed indirect
> descriptor entry. A malicious or compromised device could extract heap
> contents by reading the id fields from the DMA-mapped indirect
> descriptor tables. This affects all virtio devices that use packed
> virtqueues with indirect descriptors, which is the common configuration
> for modern virtio devices.
> 
> Fix this by explicitly initializing desc[i].id to zero in the
> descriptor filling loop. The id field is unused in indirect descriptor
> table entries per the virtio specification (only the head descriptor in
> the main ring uses id for buffer identification), so setting it to zero
> is semantically correct.
> 
> This matches the split ring path where all four fields of struct
> vring_desc (addr, len, flags, next) are explicitly written in
> virtqueue_add_desc_split().
> 
> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>

This is defnitely not trivial material.
Pls report to the proper list in the future.

> ---
>  drivers/virtio/virtio_ring.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 5c169fbb418a..42883b01fab0 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -1571,6 +1571,11 @@ static int virtqueue_add_indirect_packed(struct vring_virtqueue *vq,
>  						0 : VRING_DESC_F_WRITE);
>  			desc[i].addr = cpu_to_le64(addr);
>  			desc[i].len = cpu_to_le32(len);
> +			/* The id field is unused in indirect descriptors but
> +			 * must be initialized to prevent leaking kernel heap
> +			 * memory to the device through the DMA-mapped table.
> +			 */



> +			desc[i].id = 0;
>  
>  			if (unlikely(vq->use_map_api)) {
>  				extra[i].addr = premapped ? DMA_MAPPING_ERROR : addr;
> -- 
> 2.33.0
> 
> 

