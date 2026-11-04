Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785368;
	b=3DavsEViFDo3yMD0XZrx3CBkMF/RvAL+fSvyIsgVyLn8hB5Ffx8fqFX7Bjv8CWE4H8WQ
	 mAUVQQa6if9E0wtLBcGsAKV7+ZYI/LWA3eIlUX/XWxQd08vByrUYLwUshNvLDrLeESNCn
	 KHA6cMP7SRUl7NXhOORLV4GlrY8oHfSkPdbquUUkNzQSyBYrjmDj598Iosi8yjzQRWZBD
	 1A4E3syAEaVjLdupCKCJobkcnXLlMWd5Yb9KSOUEwnkpfprzEDszjRwm/mWs3stVAE7vy
	 cOoMmQYV1YhpPubHxUm/UYj4X/RbT+TD6AF4QbYuEvX3XZZHYNfAvfZGbB2L20wOiBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785368;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MZsEByVFetaWVfcIa8bmUSPeNNMI6WT6JYcjMZoscw0=;
	b=JLR8lwatyaLciFILqzD8DUg8Q+i4PfYhcA7EGpiZGw80bxAdoI1jMj3ZxqBLm1sJC8qq
	 Q1L4xIdk1VEFYtXwg5PIAm9KhsynYaLE5KBkzOkwMkX29HRB++C5tLXDX3hafeORGyAIc
	 Ecq+zfCmeSivF7WOqwIuHgk38+so3phsX5D1PUYxZPBNsQWw8IRMFslqXNEleaogtk6aX
	 9TKzqUXN4Bz30cJdg6p8W+YtaOz0WCGSpqNNJLAetTggAoZ/M5l083y+vn6hbChuSpoUn
	 AH5mAcuv4pcfLvsVe1rfuB+CiVjT1dxFjYk6xSQnw2nMvU2+mgekoVHp4r8RsYmSu5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aXJafjbT;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VLcMq8w7;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35036606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35036606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aXJafjbT;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VLcMq8w7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793785367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MZsEByVFetaWVfcIa8bmUSPeNNMI6WT6JYcjMZoscw0=;
	b=aXJafjbT7H4OqzEMgsF1+yzcsgWy5doA494RWx0/MZN6rVyZ627kSbteQzoUbj1LGKZ1ZB
	GyMK1Yyc3d3QNeqs77H49a6hGNntABHrQgH0SIPrcbz4rc2R14r9Un/NhOuTm5cyKMos3I
	84AWRdkaSXPh0VwF0daByu3xyY8UjXw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-P72op14hPCiEmrL8F02vWA-1; Wed, 04 Nov 2026 04:42:45 -0500
X-MC-Unique: P72op14hPCiEmrL8F02vWA-1
X-Mimecast-MFC-AGG-ID: P72op14hPCiEmrL8F02vWA_1793785365
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a9d51dc486so10312185e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793785365; x=1794390165; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MZsEByVFetaWVfcIa8bmUSPeNNMI6WT6JYcjMZoscw0=;
        b=VLcMq8w7NjA2seEl+JweYwYbf3dFqMh5ATN+rXrN1ocdvXoR+o9tOUiTCIf1sDgJbe
         0ZLgwNVv+cM4P7T8o/rWL90k7KUO96QvBSkJMsHsSzy+s/QKEx5p05PXiR9E7Hzb02j8
         0cZA7Fx4oe8weJJy6MLMtw46lzRnGNYN8rv86oQZnVVCe1FN/V6Dv6Bdm/W+SLwOfyHs
         6dwvyDNHpBSyPgZM1yyKhaxbzOsMJ34b/A4gqpBqDFYeffHXvEgxLH4IjGeNqHHs6R7/
         JdzxUOJ7bQaIxaRllZtcdFynh/cugCIMqnXB/ZUyCmDN4ujkN+EULfjHwJfardfLm9wp
         QzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785365; x=1794390165;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MZsEByVFetaWVfcIa8bmUSPeNNMI6WT6JYcjMZoscw0=;
        b=FkN/MoEO0Is4NxLisHUdozVn7/N+AYeh2P3s/DGcbYZv0jml+/D942kiuAWhSc0P3D
         /LvTtTBz3Bbp+UbEA0c3aYOABCz2yMvsNDllJ1q6g3oT+HmKWxY9JhFpa1CNv5/XzEV9
         f/3QeoIDHMnfe80Lnbh6PvrT3Zr7HsMZlTJEJMCT5qjq9TKVS7HMqgj1znlM7s2sTWeF
         wW/qkTaIBW4hwe1I+T4p6EXeluAyw4JZFh5D+Dd329E7ricWWWM4vM4J73U/5aaWuvVf
         XMfjtsZR2CV7qv0XXw2+doSLQo4YvcZSYvfgRY0AwMpISnFyGWu6LvqOrnKG6ae4Fr8g
         pPcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsySm+/j5/cmiPISvE1x4bKX8f2eSbsx1awt6NX51rEiCHgZrjNbb5aYdqyTe9O+JG2pQIB+anfxp1paw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pCfKM0DOwo+XDSRRzr6QBIke4LENappLNXegTzaVHpwCF/DkW
	Vd12DOMpKe2y4TJfwq9YWsxhvgBqklAZ5tpWI39Z6tVe/2ewReVnQffijbCZdqWAdYM9kDI8isa
	o8JjsGv4mrYrNnL2J/Wxs9XB7PWQVHpUFOvm47Tcd28HVPUrKiMi9eLlTG7+rE2QV3g==
X-Gm-Gg: AYBFou0YDanTsDB5JOTpHnky7x7KjGhWcI7kHkJN52G8lqo3d0AT91Zv3Y7PFBql1Od
	YfQqfQ6J6Ij3j9ETfTTD2ejR84foAqI13mqNRPwZXcSABzNEzmjhI3Unk93QsfKxWHjC09inESc
	5R7+g4An+xpevLGQ7xMNich5T6AQ+A89Fbo+yXdGc4dOKiJIf11cidfPbQ8JstBuWkzUUBUKmTN
	IPzMzrk6/Aa/Ko+FPkh6aP6DKHhw9+5i1gWbq5bZAMGVcZatn+PbwwBaP2AcgXZSOmixayGqZbT
	g0yS9ft10z2k0ex4rd2sCbi9NF271rdIhS96CFZsZEaSkioawwfbpMzN5U+9l92yhHdRwL7Wr1P
	wCqU0r8wvqooZ0FBnfIZxy8H32vCdsulqiocmvR10dnjs18+Fn5Pg
X-Received: by 2002:a05:600c:37c8:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4ac16acd93cmr363922285e9.6.1793785364752;
        Wed, 04 Nov 2026 01:42:44 -0800 (PST)
X-Received: by 2002:a05:600c:37c8:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4ac16acd93cmr363921935e9.6.1793785364240;
        Wed, 04 Nov 2026 01:42:44 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9faff90sm144133585e9.5.2026.11.04.01.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:42:43 -0800 (PST)
Date: Wed, 4 Nov 2026 10:42:39 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, 
	"Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Bobby Eshleman <bobby.eshleman@bytedance.com>, "David S . Miller" <davem@davemloft.net>, 
	Will Deacon <will@kernel.org>, kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3] vhost/vsock: size receive SKBs from declared
 payload
Message-ID: <aur96eHKMVO5zMml@sgarzare-redhat>
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
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261004235101.1464007-1-4ncienth@gmail.com>

On Mon, Oct 05, 2026 at 08:51:01AM +0900, Daehyeon Ko wrote:
>vhost_vsock_alloc_skb() sizes the skb from iov_length(), the total guest
>descriptor length.  virtio_transport_inc_rx_pkt() instead adds hdr->len to
>rx_bytes and buf_used, and budgets each queued skb as SKB_TRUESIZE(0).  The
>guest controls the descriptor length and hdr->len independently.
>
>A guest can therefore provide a 64 KiB descriptor while declaring a zero
>payload.  The descriptor-sized skb remains queued, rx_bytes and buf_used
>remain unchanged, and only the fixed queue-entry budget limits retention.
>This is not a lifetime leak: the skb is freed when dequeued or at socket
>teardown.  Repeating this across connections can nevertheless exhaust host
>memory.  On Linux v7.2, 455 such descriptors retained 30,255,680 bytes for
>a 262,144-byte receive buffer; a full-payload control retained 265,984
>bytes.
>
>Vhost previously read hdr->len and allocated pkt->buf from that value.  The
>conversion from virtio_vsock_pkt to sk_buff instead allocated receive skbs
>from the descriptor length, introducing the allocation-accounting mismatch.
>
>Copy the header into a stack object and validate hdr->len before allocating
>the skb.  Size the allocation as sizeof(hdr) + payload_len so descriptor
>capacity no longer determines queued memory.  Check payload_len against
>len - sizeof(hdr) to avoid addition overflow on 32-bit hosts.
>
>Fixes: 71dc9ec9ac7d ("virtio/vsock: replace virtio_vsock_pkt with sk_buff")
>Cc: stable@vger.kernel.org
>Assisted-by: LLM
>Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
>---

Oooops, I missed this, LGTM, thanks for the fix!

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

