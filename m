Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794502640;
	b=t/ysonpf9fEMHudwzSk1bomszSFUT5Vaqa/zVfIeeLUtgvQimYRKoyqcIwFU+DaX46Go
	 nAvFDmAA7o2ORSrqdmsrQU/RYWPoUVgd11Bjp+YxNnygNZsLZfV9l07Qcz2xgCJCHV/2E
	 sJGjDfABgmiN6SX3sLoBhEngMUpYE/wjp0ECrNarSz4XZEAXXxPYSx5Ectsw+vhIgMNpb
	 J5QxF7KTBvnwSnQrdlDDMU6tYlDahV2eea1oI1IwmFv69wDcER47XM11q5gAvHussahk+
	 fg7xzjyWEqnFWiLXP8XP4n/D7kP/6fAjtQoEF8sS2+MPuJDzTV06/Y7gjll+XfFnC+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502640;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:In-Reply-To:References:MIME-Version:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=darN4TpL7cuu3l7AdV450Bjk03MaXBNxXOy+eZ4zU7o=;
	b=Y/Q2msjA6HG80S1oMquDkKt5r3Q5y082JfPs8mC9l86udKpRWI109rzsn4YmXPHcE8DZ
	 QOPR60JcQyR9XnsOGrX/0xZvs2lDyDtglisdwulV1qR8LjiV0f4nPxdX9K6bmnQWV6rqn
	 o+OBWueciL56j0J9lJCipxm1eyox7RLm/LN3JaFhU+x1uDJ6VyDzmfmNCI0xJhEG8J/UI
	 JZYKs9ciVbC6bdq6b70o+QaJDGG/YKaHRmepHednAFbNcJGjmELC04Cr0bCnLO1vOhkzO
	 M9f16PCcxf0XinC/umlEDmsXEHyMvEXcann8RN7C9IWi7eqn+3tuvs+BjEVxUoS188g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UqjQna8L;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mfphcUTJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF701606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF701606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UqjQna8L;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mfphcUTJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794502639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=darN4TpL7cuu3l7AdV450Bjk03MaXBNxXOy+eZ4zU7o=;
	b=UqjQna8Lwhv/lQ+GEO0EG7uMSdw6y6djA8XejANFEhLekduExE3eiK1pcyNiW8cztlqd4B
	NO6D3D7CSHmIoq9kwAcTt1fcMrG3ews08K/XAJWqd23DhrdwvPSNZTijeYAycSPNhSSfi+
	wvXtGORpGBDySjvW/hX8K6GD4dZiIWw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-CIW_eVXgOMuS3FyduIIeqw-1; Thu, 12 Nov 2026 11:57:18 -0500
X-MC-Unique: CIW_eVXgOMuS3FyduIIeqw-1
X-Mimecast-MFC-AGG-ID: CIW_eVXgOMuS3FyduIIeqw_1794502636
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91f1b3070f2so45236d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:57:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794502636; cv=none;
        d=google.com; s=arc-20260327;
        b=TRDPhZHl+yZXR/cFMOJROr99PsljPGFFI5fhrHfLsjiVCH+DhnUj+jtrn/F+OghTVi
         y6WsjC2JYqYECAMKy9KBL897ybAJOPq59S+udOwd36mKtYniX7NZbcYNxUijnKalaMDA
         +we8pbL2dKrGMnNOz4tOW6f6wENwHCEw32A5/lOl+KNHbmwn+sG2l94rrfwOohof0Gqw
         YBV/dBi+f1wTqGF2+o020ZiK2XtPsmKXYb8mxIdZzL7VeG/JxLpJJBepDAX2RewUulWk
         BFxg83VI/9O0HRu8dtfIUM6JeaP/CNNo8NrNmxP+0gpraQmujGsZ7DS1UO3nd7NkBMv4
         aSUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=darN4TpL7cuu3l7AdV450Bjk03MaXBNxXOy+eZ4zU7o=;
        fh=PCEsOBVaHz1kb9XMvak/35Qo+EQPYjiL8T7eDm+IvNU=;
        b=XN3nSZ94iAQi+trOv/Al8AWUDoGRErD4tlfQbfwqzbBdUZQ2eUXTyylTeVqXDtFAaV
         mUu+ezh4q1wJdtLaVwTYGw+dVsdG1O+lphOcQstpYXdpbmYxpuX84pLQPdj01RLqS7mZ
         Wp5omjFyM4aGNNH9qGRvkwFxJ3cBwxZDmHjs44snfAN73DjWudgQfKFpYK34FIPENYre
         wXe998RufRxJCBMCSQ83aNVA8uwWuXoxe5GkZTbRhSuOjqg92SHI/j2+rJOggts2/qkY
         MqQ1oU00wP+zgo9NXkqfs1xji4tg0lNPbhlyqEhZoN8xbyuYYuLADdoADMtS2Y4Bzd9l
         A6qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794502636; x=1795107436; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=darN4TpL7cuu3l7AdV450Bjk03MaXBNxXOy+eZ4zU7o=;
        b=mfphcUTJmKpNNjKE/vba8sbrm2GA7Y+gcHku8cTk1a+y2dk3EloihtRyKAQeirIvDp
         wvg8gkhJ5lC1AkaK6heaVC6iCZhP3qCeGnLlBSZBpeyaU5rKFLySsduaBj+RJQrdj/E/
         IvWZE44ZUGb6gMSkTITxuIkeJPwmU9i14CTY5gqBw8ihusdtAVkW8q/898LYixqHhZYX
         YqpsLL6HWprFGBwF9Jr3IbUomVpiAGiwrOGlg3zjzrZwjD5T5QVv8bgZRv4HjYSAOgZf
         YjJaZhabEjQq3VWp4hxuQIFQlsqsnhAkHF8n3rCUYqLL+Up6ZKGZVhESekpKQ0IoL+2B
         u0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502636; x=1795107436;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=darN4TpL7cuu3l7AdV450Bjk03MaXBNxXOy+eZ4zU7o=;
        b=nR/P+AUpj9yJ/LMf2soutUJTRHmtjeJELKUc6XgjqnwIUMC+LZ6HNEjAyQ1iWT5Ukt
         pohBou1JX3cFk1sbKQI1jo0342KXeOzXxarTQY1gPavj7YFdR5X+YKT341vL3MYcsdNz
         VJ81+skSCQGjusxnC/XArDII5SrUzK2ClkwgkeG0ELgkmu1mKY1+Uv/VkDrJfrfDAkRU
         3ZqoOFYR74ndpeICpnSlISspVGivTrxZYW6q9aOfiO2Xx/BoIRF4QNmaTz5lu2aW8sPR
         OEwR0u9bmN0rcWJVU9Zz5xFHT20zKmg9mNDRd30QjKzzbLq7FP8Dxava6GTqfthNsu4j
         bn1A==
X-Forwarded-Encrypted: i=1; AL+hErFFdeZ3zgDgBJzc64R5OlWOHMnJcRTXh9vu4sjZqMVXlLKyIZk8Icrqmd1x00Wa0PXDTQgiU6lWeBNJJyA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y6Y0rt5IMbp1wnGy3vkdf9GBfdeXMpvcV+tUTk79ScX8p5LIB
	oVTUf59z+5GxG/SeMjnrCfWuIDGrHLlt6oXvRN+IfHnE2P/LgfD3Vkcz4s3wESCmMv1odlRKft0
	eIOZBGIndjkx+cQjKDHnj4SolVQ+Q52qxVauEimThJHTT2FqTQSQn2YNEYaxXD887rDo8Xip7Kd
	573DItXvhBXBlfXq3tDA9U1bTShLKZbk3Tmrl3MYK6
X-Gm-Gg: AYBFou25ZwiDJcde9QOaiD8TMDp8ifk8ZucS2M0z7CDViJxwmn46GUbzUV6Pa/Fo34c
	txAGiHFK5kBjyKIThPVxBSEDyRbfYSMgiOYnLidwDSGlkfkOzOpiDt01z5gTO5Kb5mFU6NZbFm8
	IQbGDl/g5r9mDy63cNbh8CvyoXdBU2ENdU7s/r1lqZFqqOau0JmNJwr34=
X-Received: by 2002:a05:6214:4907:b0:917:af36:df30 with SMTP id 6a1803df08f44-91f04024a36mr108416496d6.16.1794502636092;
        Thu, 12 Nov 2026 08:57:16 -0800 (PST)
X-Received: by 2002:a05:6214:4907:b0:917:af36:df30 with SMTP id
 6a1803df08f44-91f04024a36mr108415966d6.16.1794502635425; Thu, 12 Nov 2026
 08:57:15 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Nov 2026 10:57:14 -0600
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <aukO0YEZmiMIISaP@devvm29614.prn0.facebook.com>
References: <20261028-vsock-dgram-support-v1-0-e457cf7cee78@sinrega.org>
 <20261028-vsock-dgram-support-v1-7-e457cf7cee78@sinrega.org> <aukO0YEZmiMIISaP@devvm29614.prn0.facebook.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 10:57:14 -0600
X-Gm-Features: AclHuK97Vbt87h1PiWp1yuLFdgsXXBfxSod9rL7qWx7O4MzdkcMf0Vg2mTyClE4
Message-ID: <CAAiTLFV5g4XV7ZU+TYFboAi3n535murgSjh4SBw_PMnp=oQyww@mail.gmail.com>
Subject: Re: [PATCH RFC 7/8] vsock: preserve host-to-guest datagram boundaries
To: Bobby Eshleman <bobbyeshleman@meta.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Bryan Tan <bryan-bt.tan@broadcom.com>, 
	Vishnu Dasa <vishnu.dasa@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	bpf@vger.kernel.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Bobby Eshleman <bobbyeshleman@meta.com> writes:

> On Wed, Oct 28, 2026 at 05:04:36PM +0100, Sergio Lopez wrote:
>> Vhost splits large datagrams across guest RX buffers, delivering each
>> fragment as a separate message. Allocate full-size RX buffers with
>> page fragments when datagrams are negotiated, and drop whole datagrams
>> if a guest buffer is too small. Refill empty RX queues even when only
>> one full-size buffer fits in the ring.
>
> I wonder if it might be better to do what seqpacket does, and just split
> the datagram across the buffers (for seqpacket, until the EOM flag is
> seen)? I'd expect that we will get better utilization of our vq buffers
> this way?
>

Yeah, I do like that approach better. I'm going to implement it for v2.

Thanks!
Sergio.

