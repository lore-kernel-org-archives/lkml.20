Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577685;
	b=N+bY/KS+bcmz/9u37zGkdi9X+K9KAeyxn2oV8o3Qp6717lfvksWxe3ZdnSygCbQx2Qs7
	 ZtvODo+TqA4OH/1bijJLVj6ABvBRr21pwc9GEODmqYQQRtNdyWeHTxR3s744QcbktaG5k
	 Dr1GVwDaHWIEoFSXWBGGSMoH8mHpRfNO7Iz+d/d69JjZod42ZGjlsHCqHVZN4hyXjYHTC
	 wSTTTziqGm/enuvHAWOJoxHRTen5zgmlyL8CjEP4ZrI0bsMVjI5T4RgKgUdMii0ElfB1+
	 dBD0brs1yPB7gg5NsgCwxwLlmo+wAfct0No5AbAfFKlH0Pj/+g1FtQh/qNasuOkaylw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577685;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LaMrw0UGiuCnM59eNBEdevbmBZ2o/qyOQGg9zp+WMrM=;
	b=jGShmI6uwtYsEvHzA1RXn2MzZCE70fGIUxjxgTpuLOEWkKAKU7pA45IiR1qi1Jg1cwMI
	 KHabsdfM6wonQpI7zmusSXM5QDlwZ4+inJYq2nupmIecOzTLXRhpdWohT87juuGnp+i7q
	 nVJmKeI2Rydbd13g5JyXkGlLhCKyylLXkvhRT9S2alxVN1r0R7UJQymQ0rLlIzMVyuezi
	 1u6oMdwT/c583N510MpmKtHgII0RcUhRb4CBwB77Ekpn4YrLf6iLI2J2DyBQU/JRKdNIF
	 wxkqM5/pO2EEPwHS7SuVQIEEWO+VxJhV1IrkdGmvRtk/a1r2FpQl803jmggFnUKRPRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TpixcOcI;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ejAaswOC;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10AF606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F10AF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TpixcOcI;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ejAaswOC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792577684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LaMrw0UGiuCnM59eNBEdevbmBZ2o/qyOQGg9zp+WMrM=;
	b=TpixcOcIc+qEmEDiQ0FLw+S+qtpggT3NqH0RIXuzC8XKV/f9YbgNr3ahFBE7fZ+GDb2aiM
	MJ8Tu/HXmRNLwBcF7ACuwPEadiowaMAmgZJ/st10hS9I3uA3Zr1aRYCnlG+rN/XIpsvwi5
	q+58VurQ3uB5vhiS4wynDKnC3HLs7QE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155--WVlLRf-OC20rZX_2xETAg-1; Wed, 21 Oct 2026 06:14:36 -0400
X-MC-Unique: -WVlLRf-OC20rZX_2xETAg-1
X-Mimecast-MFC-AGG-ID: -WVlLRf-OC20rZX_2xETAg_1792577675
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e1ad3cb66so282113f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792577675; x=1793182475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LaMrw0UGiuCnM59eNBEdevbmBZ2o/qyOQGg9zp+WMrM=;
        b=ejAaswOCkEY3H7XHMvAZgqt+YFWmaA2GRwEj+PstMfsG6vKej3aW9Mc3rh9fAEWYEb
         pg2JMCkAPE82ExN+TJKKaHRxxf+3uJRlOUFuBXopOsn1ymGHjdcQSgg7go7o2YFOI6B4
         5Be9HrAfZ3MzPuPr3CKBSUBj4Qny302DJ5AAyOadKTYOToXS4tMVBUuwRD052omVT7J0
         MD1H88CSDfGxOULqFgCsw8YcCa6ZqWGbgLZXdbr5TZ9li9gphxupZM28UZ3UNFe32CXU
         Z6TO6k+AYwCq6yZ5V00AlM8z7dgnk6dWXWcf/KseDK8hkirdiHm+lEyFTAzhw2dNekkJ
         r8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577675; x=1793182475;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LaMrw0UGiuCnM59eNBEdevbmBZ2o/qyOQGg9zp+WMrM=;
        b=eW6116P/y3I9U1o8AzJ1jKxuAukVWVx5m0Dhm1JjtNZQ6Y2j5KONtWJ2QyntYuYNBQ
         vAQCCMDGHZSKHDQTC/XudsrwqXHqFzJG7s3v/7q96bHL+jFkcl+d8tt5RWC2soxmfEqG
         A+HbSXfcKzZNRVnAc226bImqEaQIEvZr+1PvlAQWI2k5efZf/EPzVWW5UjjuiI4WBXWC
         y/68MRaJWe8v7DQPz3yD9XyQqXMaMsWqSJ64gqWJhoBUJqvHkXDFrpkgMc0qxKhL9tUI
         37v6f3rg2VSGI0DQuy37vyY32k5ceQ28HZDBBaBzOqj0GHqhNWPLLsBkhIi1hJPODIAX
         zqmA==
X-Forwarded-Encrypted: i=1; AKwUvBz7EFtmdgy5oZZgqf63d1GrisJWCRdIcdCoU3dh2PajOGn6JrjOCvTL2SPOWsaeCHQyHRRm+8ayKutdNvU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRqflL+8Knra9X0DlN4Gc36Y5xEiWbhoTs6VzFTIMbYTnT/eNc
	aEykX4TJs2vb3ZrY0i5lQYbw9P34tczStcvoXEoCWPo1DGS8tHtSA66N+Mc+u4Xsm/HqtvyUz/d
	dfFqMW6IFsN0DD76iVtIEIgmZlDXqxDyDT/X8YlVoOvtqO8obEv/s1nut9CM9kdpCwA==
X-Gm-Gg: AYBFou0Wc1rzEOyXOk3cpw0vJzCuYuLAgDZDMXsJwlimWV1e6y20L5V6gQqHCQ+eQIj
	uQuWzMGGX+bv2Hem5rN5brTnuLU65K72ViptxYQMgXY4HefzA7v6rODVUZgoDuuE1Ku0p2F0yWF
	7jIP9NHER0SBb6LtM03d58JW8nRc1L0GL7ybyiab3wZfF8jyW89+ciSqX9ceUtHnPhEeFIxdQ7t
	LQF0tyyRysmH73Jmk+du4fSu1CNRhiwVMEOVbxdWrtoGP/DrYG+f+sCKf02YAdJuAO/yVZJE0Qi
	6K8X1OpmB6h13rFO5bfj6+YMpAPPapFSFor7q4oNsOewKkWrP8j3JEyJGGgtIUY8Nsgs6N5lOgb
	XK3rQSQ==
X-Received: by 2002:a05:6000:4213:b0:488:8931:b1b2 with SMTP id ffacd0b85a97d-48e264bd584mr3754107f8f.28.1792577675515;
        Wed, 21 Oct 2026 03:14:35 -0700 (PDT)
X-Received: by 2002:a05:6000:4213:b0:488:8931:b1b2 with SMTP id ffacd0b85a97d-48e264bd584mr3754032f8f.28.1792577675060;
        Wed, 21 Oct 2026 03:14:35 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.178.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f0bc2sm4512724f8f.1.2026.10.21.03.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:14:34 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:14:30 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@meta.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@kernel.org>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, sargun@sargun.me, jlinbox@meta.com, 
	Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: Re: [PATCH net-next v4 3/7] vsock: pass the netns to
 ->has_remote_cid()
Message-ID: <atiQfOneKTIyhGHX@sgarzare-redhat>
References: <20261020-vsock-guest-ns-v4-0-047527cfccfc@meta.com>
 <20261020-vsock-guest-ns-v4-3-047527cfccfc@meta.com>
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
In-Reply-To: <20261020-vsock-guest-ns-v4-3-047527cfccfc@meta.com>

On Tue, Oct 20, 2026 at 06:15:06PM -0700, Bobby Eshleman wrote:
>The transports only use the socket to find its network namespace. Pass
>the namespace instead, so that a later patch can ask whether a CID is
>taken in a namespace without necessarily having a socket on hand. This
>will help with avoiding CID collisions when devices move between
>namespaces.
>
>No functional change.
>
>Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>---
> drivers/vhost/vsock.c            | 4 +---
> include/net/af_vsock.h           | 2 +-
> net/vmw_vsock/af_vsock.c         | 6 ++++--
> net/vmw_vsock/virtio_transport.c | 2 +-
> 4 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

