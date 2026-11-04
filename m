Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793330;
	b=V47uixj1WRSy1gPt+rFXtXoA2WzI9r3ccFX7PsRNOVO6zlsCWIeNblpZ2PEkUEIbp5ur
	 SJoUHtIZne+M0lRn/ZNpuG9vzpifzPwPtdq78WRh5v7zijZ51SguCWCeknVGyCy1s+184
	 stXGPqXQ6Vgxmu8x6blA1qTbZBXKx7JP30fB6zKiQ2GJn4p4arZkOTCwnJVmcg55Iphft
	 Gd1shX8XflFs8wGFZlJGpav3TR7yayfrno9gvVdgIJUjwstDC41L2MYns96K6ElRRZizq
	 9T4qjcILVuPnUjUCT6TcUl9dKlN8Hu8eUoantgOFDMuaCGSx05etfmBqTd/evO4JpMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793330;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gOOrV9m6B3oUuMrsbApNieFqj9oSqnExm9VloXX8/Mw=;
	b=lQclretKWN96kj4U2SxEMSU/fHroOdsAcohQPdRPmaZHR3DSl4z+NsjvAVThf6WxhoPM
	 O0N8Qri8xXj6OM0NG+6D9zl+iycUaFz5MLWi3dKibRvyGnEGioYLFfTSDnXHCFkv1EaGl
	 rZZ8T5wrmfmVGydopZMxzgv5QcUVuTO78lhSAtfTP5vGGoZM9jDs/ez+JcYv+RU3CSWod
	 MedpJQkbNsonMcsvT0+ztrPwTuvN5SuT16qf16UYx2FJrvBGVebVr+dtOz/dhjuPN4HbN
	 Y5UiArFMdNLV/qEm0KQAbKb66pt0Q+Qij7J51OhFfFkfr+awyqtr0BeMwuMxOA32fOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TVaEdkDf;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OB90n+T6;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BF4606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9BF4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TVaEdkDf;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OB90n+T6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793793328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gOOrV9m6B3oUuMrsbApNieFqj9oSqnExm9VloXX8/Mw=;
	b=TVaEdkDfxu+ttcd49UN3hpPiddciRLBGKnCDr4WmMnvOSugZToqS2KUzwAa04Bg4Y4QyiH
	0lOlD0LTy0F+jnjte0DVJSTswhGbPlLIMIGcGRwHFKzzjTYWTBZlTGQObCUt6KmXfluLON
	NSE4d45xge7HYiNrXWRjVOz2gzypc1M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-kW8G4ARBM0ez1VpIq5eojw-1; Wed, 04 Nov 2026 06:55:27 -0500
X-MC-Unique: kW8G4ARBM0ez1VpIq5eojw-1
X-Mimecast-MFC-AGG-ID: kW8G4ARBM0ez1VpIq5eojw_1793793326
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so4786625e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793793326; x=1794398126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gOOrV9m6B3oUuMrsbApNieFqj9oSqnExm9VloXX8/Mw=;
        b=OB90n+T6u+KhZNTtac+ncEBveC4daHUIoBoha2vSI4QkWS+WGVy9IMvcMaJ4JMHjI+
         YqAKfwIMs0Vg+0WR2zTiS/vl73B0hZ/Yh3JuJxBwwJWerUE9RQfYQUj+h+VSdyQw9lMJ
         Q6ObvVZjyp2vU6UX7emvwNjEPiIh2UKVL0OPLQPZLOqSKi5dgO9b24ZYT1Q49yx+SNIH
         VaUOaxqz8Och2oLTf3UIJE4x9rmje3Qxtu12sRPesPjJjLMd5/0rMVmTM3kSZtYV1Xpc
         xLdAJqtsqvMUd5SXKDQGD1II6/vZprJjGateT3zlX+pLHIl8pqEQh5pKie60eB/FAJ5r
         c6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793793326; x=1794398126;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gOOrV9m6B3oUuMrsbApNieFqj9oSqnExm9VloXX8/Mw=;
        b=Vq4ml78UCeDjBNmHbD18ASTsuBMBplw9dXd9HR983pPXZq4U5RiT00Waatb6AumwJg
         F6huMoZbsuQHytvNM/n65FUyTcw3wk05SS92GCM6ROL4XUbIBpfKg0JByC/grEUU0Mil
         q4cirI9ULXrmbhlFhH4FrAdThH9rX/MrZa0f1ye0nIPIGgEBTqGuV1U7D3eh8QNG7xN9
         9+nvj3uq1vnNFkTqMrEJXcJ3kRh6MB6qPyPkLTG8eyHCXLHDVqKpQpdzqfSJrXKEfRKI
         zL5lSpFqxfoSFOtoppPtnS4ZMyUo8mR7KTu9ZiRN+mM62s5TsnLMtqKC8VqLTHWRt9wl
         +5Hg==
X-Forwarded-Encrypted: i=1; AKwUvByvaEHIq6+NOPA4eOkM8r3p+6ThGCFmkIAWtmU4zjpYaysuPGZiL3zh6F52I75jaUEb79hJvrXtmpdSQ8E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KGUQh5h+lckpJTp/9N2svmOIYWJ3y1gim3OkTWVJqsVmN1e9a
	SS0gCd2WdzlT/mUhJUKuf+7A+eMOzA+y/pTGn46VwZeJ6WTwTaKSuR+qNo4dVilT8I9xBGYLbvl
	SlBhJ0MOi4AiBP8ENAU+4kyfKP+IlYIRsrX+qjjoPWX1/cf3bkUG+9+QI8k5S3g5RnaE6NCzNDQ
	==
X-Gm-Gg: AYBFou1JbPOn8pS3mzIkimW1XYalfODeK6/bRlF/1EdFru3LD/BMXi8t7WaWngtgHp4
	yNKWjfiZ5tdu6J6WVMGL+GW6mvOjKqhuu1QCIqEnKxGVU0uVwV84TS3zNYqwhHoZf+ULu7crTZV
	ps0hs8PcivakDal5zOws1ecna+F/+uNP6cJbgUUA2K8+H6rKtL+0fr8z2XscgrfFXChCoWc9vhR
	KvlHF4EDKUbbTGXtGgbMnW/NQX0As2ckEzo2PbCRvsv2fUYcxeSiaeFlPMJ1awh1BtSHouGi6aR
	Xriuesyfv1j+9us5TixhtSGO7X+xWPOkDPn2CyMm9f1LH3IS+2uJf+8zC1K+xTbMBx0e0ccd5MW
	a4TZaTkMkOf7ddjq162zPAsrHCA7NePRIM79ERi9fzg==
X-Received: by 2002:a05:600c:1d28:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4ac1793fb6bmr421627835e9.16.1793793326177;
        Wed, 04 Nov 2026 03:55:26 -0800 (PST)
X-Received: by 2002:a05:600c:1d28:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4ac1793fb6bmr421627415e9.16.1793793325683;
        Wed, 04 Nov 2026 03:55:25 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1506:fd00:9e19:9994:44b1:e6f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4533873f0sm45067805e9.4.2026.11.04.03.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:55:24 -0800 (PST)
Date: Wed, 4 Nov 2026 06:55:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Bobby Eshleman <bobby.eshleman@bytedance.com>,
	"David S . Miller" <davem@davemloft.net>,
	Will Deacon <will@kernel.org>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3] vhost/vsock: size receive SKBs from declared
 payload
Message-ID: <20261104065405-mutt-send-email-mst@kernel.org>
References: <20261004235101.1464007-1-4ncienth@gmail.com>
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
In-Reply-To: <20261004235101.1464007-1-4ncienth@gmail.com>

On Mon, Oct 05, 2026 at 08:51:01AM +0900, Daehyeon Ko wrote:
> vhost_vsock_alloc_skb() sizes the skb from iov_length(), the total guest
> descriptor length.  virtio_transport_inc_rx_pkt() instead adds hdr->len to
> rx_bytes and buf_used, and budgets each queued skb as SKB_TRUESIZE(0).  The
> guest controls the descriptor length and hdr->len independently.
> 
> A guest can therefore provide a 64 KiB descriptor while declaring a zero
> payload.  The descriptor-sized skb remains queued, rx_bytes and buf_used
> remain unchanged, and only the fixed queue-entry budget limits retention.
> This is not a lifetime leak: the skb is freed when dequeued or at socket
> teardown.  Repeating this across connections can nevertheless exhaust host
> memory.  On Linux v7.2, 455 such descriptors retained 30,255,680 bytes for
> a 262,144-byte receive buffer; a full-payload control retained 265,984
> bytes.
> 
> Vhost previously read hdr->len and allocated pkt->buf from that value.  The
> conversion from virtio_vsock_pkt to sk_buff instead allocated receive skbs
> from the descriptor length, introducing the allocation-accounting mismatch.
> 
> Copy the header into a stack object and validate hdr->len before allocating
> the skb.  Size the allocation as sizeof(hdr) + payload_len so descriptor
> capacity no longer determines queued memory.  Check payload_len against
> len - sizeof(hdr) to avoid addition overflow on 32-bit hosts.
> 
> Fixes: 71dc9ec9ac7d ("virtio/vsock: replace virtio_vsock_pkt with sk_buff")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>


Weird that this wasn't applied in net yet.

Acked-by: Michael S. Tsirkin <mst@redhat.com>

let me know if you want me to apply this.

> ---
> Changes in v3:
> - clarify that queued skb memory is under-accounted rather than leaked, and
>   explain why a zero payload is the strongest case;
> - remove v1-to-v2 implementation rationale from the permanent changelog;
> - correct the Fixes tag from ab9aa2f3afc2 to 71dc9ec9ac7d; and
> - make no code changes.
> 
> v2: https://lore.kernel.org/netdev/20261004073419.4039011-1-4ncienth@gmail.com/
> 
> The issue was identified during an LLM-assisted source audit and confirmed
> with a focused in-kernel probe on Linux v7.2.  The code diff is
> byte-identical to v2, so its existing build and runtime results remain
> applicable.
> 
>  drivers/vhost/vsock.c | 34 ++++++++++++++++------------------
>  1 file changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> index abed1fbcf66cc5..35f75e23c7497e 100644
> --- a/drivers/vhost/vsock.c
> +++ b/drivers/vhost/vsock.c
> @@ -364,7 +364,7 @@ static struct sk_buff *
>  vhost_vsock_alloc_skb(struct vhost_virtqueue *vq,
>  		      unsigned int out, unsigned int in)
>  {
> -	struct virtio_vsock_hdr *hdr;
> +	struct virtio_vsock_hdr hdr;
>  	struct iov_iter iov_iter;
>  	struct sk_buff *skb;
>  	size_t payload_len;
> @@ -382,34 +382,32 @@ vhost_vsock_alloc_skb(struct vhost_virtqueue *vq,
>  	    len > VIRTIO_VSOCK_MAX_PKT_BUF_SIZE + VIRTIO_VSOCK_SKB_HEADROOM)
>  		return NULL;
>  
> -	/* len contains both payload and hdr */
> -	skb = virtio_vsock_alloc_skb(len, GFP_KERNEL);
> -	if (!skb)
> -		return NULL;
> -
>  	iov_iter_init(&iov_iter, ITER_SOURCE, vq->iov, out, len);
>  
> -	hdr = virtio_vsock_hdr(skb);
> -	nbytes = copy_from_iter(hdr, sizeof(*hdr), &iov_iter);
> -	if (nbytes != sizeof(*hdr)) {
> +	nbytes = copy_from_iter(&hdr, sizeof(hdr), &iov_iter);
> +	if (nbytes != sizeof(hdr)) {
>  		vq_err(vq, "Expected %zu bytes for pkt->hdr, got %zu bytes\n",
> -		       sizeof(*hdr), nbytes);
> -		kfree_skb(skb);
> +		       sizeof(hdr), nbytes);
>  		return NULL;
>  	}
>  
> -	payload_len = le32_to_cpu(hdr->len);
> +	payload_len = le32_to_cpu(hdr.len);
> +
> +	/* The pkt is too big or the length in the header is invalid */
> +	if (payload_len > len - sizeof(hdr))
> +		return NULL;
> +
> +	/* Allocate only for the payload declared in the header. */
> +	skb = virtio_vsock_alloc_skb(payload_len + sizeof(hdr), GFP_KERNEL);
> +	if (!skb)
> +		return NULL;
> +
> +	memcpy(virtio_vsock_hdr(skb), &hdr, sizeof(hdr));
>  
>  	/* No payload */
>  	if (!payload_len)
>  		return skb;
>  
> -	/* The pkt is too big or the length in the header is invalid */
> -	if (payload_len + sizeof(*hdr) > len) {
> -		kfree_skb(skb);
> -		return NULL;
> -	}
> -
>  	virtio_vsock_skb_put(skb, payload_len);
>  
>  	if (skb_copy_datagram_from_iter(skb, 0, &iov_iter, payload_len)) {
> 
> base-commit: 6dc989ea46b96ce170840174b4a38c4a387fb005
> -- 
> 2.55.0

