Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698782;
	b=U8uR/no4UeKYPORbBb/qmj2b9FruMEeAyV6xTpOb7txsa84cchyJjG6KShbmPqD+kjji
	 2tpDm2fsal9IzKLBs0xn1TnjPCCOdFEYKc8uRUqwMJuZsG47gE5QaP5Np+zK9h9F+erot
	 Eg6CNRpTjYyShrxeyVsxaxe5K9RHW6ubYiUML3R7APWMTFpY/5XG60farq9zI0vr94FpU
	 itLjRLT/Zrct6i8rV0oizVF9Vl6LhuapwiqlpM+SD9PqW8oE8WfmXuXGinBeZgs/JJslb
	 OcMGbL4VdmfDEfeWf7lPJduGloiBxtUieujyRVcyh0G3SoHaHw4iI3JI7zYBKRu0bWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698782;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yWLJ8orxFraHmiLygxrECrAy0DeQv5sxiwR28si0eUs=;
	b=Qczx+HZLo4ZOO9zF+scnHBnPxC3AjhwlXoPAGuK1CT8s3To566oceBDaiq9o5zZ5ELtZ
	 b9+5X+zSN0ckBvZ0/OSVYlZrC1Mmz6vN/Ski/bg1pwbVjq/C+5BqX/TCTSZt8UaKLYM91
	 nniwUFwIRxdNYul9d0067fCTrx2T1OaAHtasYxTP7RsM7w7I8KeMaY91TGYrNIerFQFnI
	 teVjOiPzusET9q/Gx4L9CkfVXjya99D2aVcTmXEtmMO71HUPkFd94NjyTYq0JPS4v5eLy
	 afLc+/1XMb5T6UArenk54q1XEpAIGfh6psi8x4Mx4ENdPWoxWYJheJMZn5909IxP+Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GCSn7L3H;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gBiGVjF2;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28E1606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D28E1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GCSn7L3H;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gBiGVjF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793698780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yWLJ8orxFraHmiLygxrECrAy0DeQv5sxiwR28si0eUs=;
	b=GCSn7L3HQMnR3VbQsvN8PtZAzNf9SenMWmQPQlYfjRildQjy1jCVN/5mlAEu0ZSKss/OPE
	By1L9Y92VGn8ManQVqYG4t+aYAHFKdxr7PbPvKScn+VvHh1cTbkx3ObgItRzLHrnMT/LMA
	waLfewiWk3GmM63qB/8/VY9iLYag23Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82--AIJEannOliiIKJACw8FYA-1; Tue, 03 Nov 2026 04:39:39 -0500
X-MC-Unique: -AIJEannOliiIKJACw8FYA-1
X-Mimecast-MFC-AGG-ID: -AIJEannOliiIKJACw8FYA_1793698778
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a214a5f8a1so39529745e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793698778; x=1794303578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yWLJ8orxFraHmiLygxrECrAy0DeQv5sxiwR28si0eUs=;
        b=gBiGVjF2aiIWe9f5oupJu7HR2NwbumoKMBRc9+DzB+kWP8DVG7Zoq9Wi+IRxAblHQX
         99YmWCtfZ32gC+uHhQ/+EzIzMA5ZZe5IHoTBbxt0LE9P9hAVtD5F3K1zmYXNElv+Wtx5
         nTuXogfUoA1lrIF4eQns4lt+rF8UvnLTyD35y4+amaKrO43IkJW+U8RUaKsvRll2ad0p
         0C3LI1RkOixH+XlU2hUqk+cMBv5v9eD4DPbuuXkTiGr3PF5CKsEOs/QkDdsUIVdv2Ddm
         D9Qcbfk9z0OXSmElAwRq57jxZrcBUbrVS5VkgqxDc2yExDI8K+TaUOsa3KAaq+X4DKjk
         a42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698778; x=1794303578;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yWLJ8orxFraHmiLygxrECrAy0DeQv5sxiwR28si0eUs=;
        b=HeHAFFhSlO7YTtu1WmIpSMZ86IZsowNzUVfedRJgl8QvwxjmljLcn89hbYQajGCa/T
         Uv5tKazDgmwxgi2zZ39/d6QQ58AZtB8NRPT3mNb6p9qv8muuH2bkeuT/sQ/eJixdHLpt
         qFM7puQwlkDKlAX+yDmob0mbaJlY4V1wbhtX7QSu5I+ssN6sfnXn3Z+4fWXdH25L+JuQ
         vWS/OzCSDeE0efFBhhEumnqjtjIoSX9Z7+u+baPKrhcmIPr3iPYU8TnW4lAAcS8o4VvG
         DXXBf9EBJLFS/Cs5yLNE7K8oK/2CWo6W4O4gqXXMpNW3Z/EJIyLUjSRdtHP/a8a7+Wuw
         /fBw==
X-Forwarded-Encrypted: i=1; AKwUvBzIH0iluJTQqk/UA7eUL2F4v4I/I4pUzzKcvaHJ67EoP7GvBB7KXfXNuTC/eYGfB3u3b8k5kCA1sP5cMnk=@vger.kernel.org
X-Gm-Message-State: APuU4Z84nIEUZXt3FC3JZ84QanpCkHGIIBhZus/O21Uyb4kQ+nDRXCKd
	uiayb4M8cXPfI5AXYkiFxqNZtKjBz1QkM+65hX24kffuwfxVV34DZaxyLbxQzAL0NRFLntE0Ca/
	ctarKcq3q20/1ThJGmhVikRMpfxbj7uH5yip1p8j4E9udZvc4higih4DEoMy/EkyGvQ==
X-Gm-Gg: AYBFou2IvBB+qNSPsziI1bkWHpZW6049sx+m/fm2A0+Kj1buozOPsG+pnbfQ5dclMq5
	9voFa8FafIt3m37NLQFzfghLY3vkl/MfmMmSa+rVDC26Nb+zL7spuhVUX3u4zQ8dbZk1898cnuR
	ZRwEgHGaZcWBIfTHW+SKk7jkj1UrnTV5vSrhmQp+uH0rq0lzyEWGlTQDt9bLlxMi2RAHRG2InlB
	SlboCWtm2m11ed3MTa8+wPC/tuIpixvT5h9+Wt8pG66bOA3FTGUhv5R9VlS+09XPvSO/y0xR48M
	JLkZqNfB0lNZ4oEN7R0gDHM/QRdGshlbqLOScnBQPqjm13ciCf9+lOKfxoT2OFoH969G6+JVBj1
	vgbzzZlRafsVjORXA8jnAErdaofVwc1d3pQXyHZ9NCA==
X-Received: by 2002:a05:600d:6508:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4b0bc65ba2bmr112608965e9.35.1793698778179;
        Tue, 03 Nov 2026 01:39:38 -0800 (PST)
X-Received: by 2002:a05:600d:6508:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4b0bc65ba2bmr112608485e9.35.1793698777670;
        Tue, 03 Nov 2026 01:39:37 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1506:fd00:9e19:9994:44b1:e6f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0b4df257sm190245005e9.4.2026.11.03.01.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:39:34 -0800 (PST)
Date: Tue, 3 Nov 2026 04:39:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Guanglei Zhu <zhugl3@xiaopeng.com>
Cc: amit@kernel.org, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org, liuc63@xiaopeng.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] virtio: console: check the control packet size before
 parsing it
Message-ID: <20261103043238-mutt-send-email-mst@kernel.org>
References: <20261103084156.426810-1-zhugl3@xiaopeng.com>
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
In-Reply-To: <20261103084156.426810-1-zhugl3@xiaopeng.com>

On Tue, Nov 03, 2026 at 04:41:56PM +0800, Guanglei Zhu wrote:
> The control queue handler hands whatever the host wrote to the
> control queue straight to the parser:
> 
> 	buf->len = min_t(size_t, len, buf->size);
> 	buf->offset = 0;
> 
> 	handle_control_message(vq->vdev, portdev, buf);
> 
> handle_control_message() casts the start of the buffer to struct
> virtio_console_control and reads the id, event and value fields
> without ever looking at buf->len. A control packet shorter than the
> structure

That's a broken device.

> makes the driver parse whatever bytes were left in the
> reused buffer as a control header, and the uninitialized event then
> drives the port state machine.

So what?

> Drop control packets that are too short to hold the header.

And then what?

> Fixes: 17634ba25544 ("virtio: console: Add a new MULTIPORT feature, support for generic ports")
> Cc: stable@vger.kernel.org

Not clear why this is needed on stable.


> Signed-off-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> ---
>  drivers/char/virtio_console.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
> index 019bcae81af5..5e2a4403dbf8 100644
> --- a/drivers/char/virtio_console.c
> +++ b/drivers/char/virtio_console.c
> @@ -1597,6 +1597,12 @@ static void handle_control_message(struct virtio_device *vdev,
>  	size_t name_size;
>  	int err;
>  
> +	if (buf->len < sizeof(struct virtio_console_control)) {
> +		dev_dbg(&portdev->vdev->dev,
> +			"Invalid control packet size %zu\n", buf->len);
> +		return;
> +	}
> +
>  	cpkt = (struct virtio_console_control *)(buf->buf + buf->offset);
>  
>  	port = find_port_by_id(portdev, virtio32_to_cpu(vdev, cpkt->id));
> -- 
> 2.50.1
> 

