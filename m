Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591781;
	b=CKAeGcQqgDWS8OfakTXp9c3CQIazVSvxDym5pRhKBZTignE3OcBsbbUPGGfFm2PDv3XP
	 lbEPjbo9iUVYuVo41Gk7liyPmvOblbgF171jLesyld/id6LP18ph9B+k2pO0X+9Au7xXh
	 5L9sYxMVBxlEbUXwxZ/PrcFMJeCiJakesZ2TWPmJkx9eBuC04PygDooHGNv8yTOCpsByM
	 yHOWY2QEv6GbErF54H2XT2GIFegJhuV/bdKV9m71JCadRwDYi4RSZgG56mFvS1W98RQ9X
	 6FL17WvpLWa/y8khm/XXYJUMC9PcWjPFPUA0/Q6oOM+c5QJj+rFBAIFoGuOpt92G9Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591781;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5CvprOY8GdDKnUT4fQztxlFl9qvx9dxL64cl7Huoi7o=;
	b=ObxjeRqfhl4gDUvZJLyMp7wi5HkBh5USb1gKxM/KjvLaKWbd0JR4Wb3I7nLpPcEQRwHo
	 ymTNMpCkDzaLz+hqIhEmrreNNWmJsuARWPSm1zTs2hh6kKwFlMgst3kJslRN/YjT6Onnh
	 tUrLtdNRZkjjLaqkGJbxeVN+4MHodXA5XdwXTrlMVRpWmIS9QN/fdgx25x7Im6A7E2aOt
	 v1Z9mtiGOSrRp9MoKQlolTE6HS3nLHTfhQemI2AfNaaUXzoApV+EPxPDREnA7oYKjBsCe
	 mak4YM/CwcSnjRrY2+9qx6+CoIv53qn708/oY/hcMEtihHPZnXQ2EpGDacwz56SJ6og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iEvmYCkW;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UtnLIxdQ;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97375606A329
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97375606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iEvmYCkW;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UtnLIxdQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792591779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5CvprOY8GdDKnUT4fQztxlFl9qvx9dxL64cl7Huoi7o=;
	b=iEvmYCkWdtYR1kSfrHnmBQhwY7/572rneZWMVVgeT+3yIoI/2kt6Sf5BQ8EStHjVFVCHma
	Klg/ys6q49lrd5hBcCXD9fWdwfhOdP0+hqQyCzNiMC96CDka07L5BuT2rCodjbFt0m0Mb/
	/8fK7CoBNdC2A2oajpWHsYQDhlIkUtk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-2uuhJks5PmaV_5FCHjR4Og-1; Wed, 21 Oct 2026 14:09:32 +0000
X-MC-Unique: 2uuhJks5PmaV_5FCHjR4Og-1
X-Mimecast-MFC-AGG-ID: 2uuhJks5PmaV_5FCHjR4Og_1792591771
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a01ba12198so13368865e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792591771; x=1793196571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5CvprOY8GdDKnUT4fQztxlFl9qvx9dxL64cl7Huoi7o=;
        b=UtnLIxdQA2lTnSByHVImMXFviGILVn1KcFFs5kIC0Y5ti1ySrF4CephjMcpeA3fuX7
         hMVH0jsoanXPUlpkhnVbBNFjXcMNkEkWA3I732ix3cBTjrKMGY8ZC/M+SjBoxMiwWEHa
         dUjTq2sTjleNE7/uf4JhI4aOgK9EVUrA7f1GWVCjXqP0knzRNgK4dGvdvzfEMzJovzUB
         m/zChMe7l5vb73XzIPOT1wl2sVLChFmCy7itKHP7jrlo3tnH5Apr6gKbggqhKxsd/Rtm
         JdaxDxLi2sBi+D8CNP3cuswX/hfg55AOjSV2lqeFi+1lkc3Rs7IHzooPzHwsKxnbhflg
         te1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591771; x=1793196571;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CvprOY8GdDKnUT4fQztxlFl9qvx9dxL64cl7Huoi7o=;
        b=yfHrsrt6XqvOd2zbYXCN9mDMpfCy6a8yNJaodKOHSJvNu0YCq0nTmfqOD3bL85/sYR
         qVz8y6fkmqz0+MTYBJVEv34+B0DsC9a+3LihzbbE2Bz+NljFrBqtlqp0XjpXtmz6xG2Y
         I4A+vxlkyx9Oxla6jzJKgVtgWWrS4UdSVzo1RG3Zu7EzV2yfOGxVDx7VnE25yxAxyOVZ
         M5iP1Lr129OAl7BGnioI8zgl6D3yH9zQv5bSZo8aYza8pT5hxIngl4QEIyix9KIFuvWt
         +RPzBK3uN6mFOi95u0jSFc5ec3hRin7TJar9oErHD4oWPjZXrB9Y4nZey4p4BYvcMrVd
         uzCg==
X-Forwarded-Encrypted: i=1; AKwUvByeNZCaVGlbDvUWcpzy8W65iyDJXklid6/3tzSmLNqVr07JIgQx2EbZ1APwD/5Kl/gaO9+XYjZDsr1L4Bk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLS8acznYRO7jFs+c7YOjptsoWU/z2o1yEWmS70NPlHCLXTbwuN
	h38yXJySMMWiyuKfYs4rDex72xt6eMaM1iGBTSdwb29aD04joHa28dc9H3Xm90OH8aZQ2f7LiwX
	aMTmCiNgdL1Jsx2Wwsn8WwFDaFk4xq4MeiQePu5r0bzOOjYcUQQSZW49dSB8xl9+fPw==
X-Gm-Gg: AYBFou3EvqG9FxTgWAe6OM0dZk586oFlfG16dU0EgYPEXv3Ggy2zHo/CFrIXrfSHz+v
	YxANzLZrHj/Q2znNpqJBpUmblxHur6x3XuuUJd0U8pLLpNgNUDr5XhmFdvoPmJQkoVoWHN19LD5
	uoRveud7JM4nIxzOnsdspdrOGreVcTbD01zdSeZn6HST4ZUkDcvjbPoDj5jkwgsMIHTM4fUcZrk
	+t9JSbpgbAv8plMt4UQs3oIMxMe44nFymzG5NaT3GsJRRdZw5ZP80tS1+olgu3XPR+3P4F+ocKg
	cwCgd9yV9Zb2FqzhChuwwsjIjgX7RjJ/FZ9VXK4rVApoMWkdtUA3hUHpgjtbWH0HsSB+J0DfY9s
	IKa0j+5/ilIp2QHFE1hOzNNXKzvv4Y6UY2enDhQ7qQy/nhX/1HTUJyPLUDDpZvBzExBygzK/Rcw
	==
X-Received: by 2002:a7b:cd99:0:b0:4a1:877b:d4e0 with SMTP id 5b1f17b1804b1-4a1f53bf67emr80568015e9.12.1792591770951;
        Wed, 21 Oct 2026 07:09:30 -0700 (PDT)
X-Received: by 2002:a7b:cd99:0:b0:4a1:877b:d4e0 with SMTP id 5b1f17b1804b1-4a1f53bf67emr80567525e9.12.1792591770430;
        Wed, 21 Oct 2026 07:09:30 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828e3bsm5669285f8f.31.2026.10.21.07.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:09:29 -0700 (PDT)
Message-ID: <03a741b8-f330-4d2c-9254-153934ef0960@redhat.com>
Date: Wed, 21 Oct 2026 16:09:28 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v1 0/2] netmem: rename non-pp ref helpers to
 *_inc/dec_ref()
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Ralf Lici <ralf@mandelbit.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Pavel Begunkov
 <asml.silence@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>,
 Willem de Bruijn <willemb@google.com>, Daniel Borkmann <daniel@iogearbox.net>
References: <20261021015558.4124825-1-almasrymina@google.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261021015558.4124825-1-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/26 03:55, Mina Almasry wrote:
> Rename the net_iov and netmem non-page_pool reference helpers from
> get/put_net_iov(), net_devmem_get/put_net_iov(), and get/put_netmem() to
> net_iov_inc/dec_ref(), net_devmem_net_iov_inc/dec_ref(), and
> netmem_inc/dec_ref() to follow the object_action() naming convention.
> 
> Use *_inc_ref() and *_dec_ref() rather than netmem_ref() because
> netmem_ref is already the typedef for the generic network memory handle.
## Form letter - net-next-closed

The merge window for Linux v7.4 has begun, and the net-next
tree is now closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens. There is some uncertainty
about how long this merge window will last, so please check
https://netdev.bots.linux.dev/net-next.html
before reposting. net-next _may_ reopen on Nov 2nd.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle

