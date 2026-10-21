Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575788;
	b=PoGgGPqtq7o5EFQzWZvA10lrXxfwzcz+1IF6yrLnZSiuhfr5hOhBw20zTQvpRoLjzfWM
	 klTW4pgHJfV9r9vzAimeIfKHKqrq1o0X7ilsacnCVdQDIAikgXcUu55aJzPbA7pQNtEHi
	 r+89rCOGYnJmlIMD5YCrRRKxHgDzqD6+orpdQ+JorqzMNiAH/y8+y55h3Golr+ahE+1hS
	 dmp8Ce4aBi/uShARnr6tN3E0ujNm+c+UZgElmzEeTgitQuG9UcYggq/FTxgZQ9H5j/R2B
	 FtAGZOaZPLj4aJqcB/OSjz9LEImXizRU2GXVxmv2fh9Mf/EYtLYeheEIcxtnRXP0WpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575788;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/6wg+cGh6J9MYyjTA2bTtWBGWLVofTB+kJ98QIYQnjQ=;
	b=QC2pYHoKmRyUXBjEmIWeHsYLQRFGDqmTi9ppV5EMu+ZrdpcYOqczj0yZ9x7Mzld7cwLo
	 tO+Tm3qAxYemsDaQ42n4thKCwGL5fshJGrjgK6hy4GxaYos+od3DqLhL9fkW4FMvflmJo
	 kXgE/smhOwe4cGraFBecYaVuUvojupdbc6H+HcdcEtzcCZThumabIxiBeyrdI0CYCmYOO
	 WEFO3wQ3cmTgR5pnm0x+G+F4geAoiSAA6gejpRrF55sgbWKvFKJRElZ1+DZruuyWscPqK
	 0KEt1viriKtCLm7f8dyyZADVhdBWSnspO+pxDNaOFBenKCCL8NlNBrTD/J6ct047p8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=temperror header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="B3ZX+/X7";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VD5K38gX;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833DE606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 833DE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B3ZX+/X7;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VD5K38gX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792575786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/6wg+cGh6J9MYyjTA2bTtWBGWLVofTB+kJ98QIYQnjQ=;
	b=B3ZX+/X7j8MjrDLCA/QlSGkWKA7Mrsg449QIrswWZ3JtjKChCSSUrvxsTTIAGhf1Tefxog
	n9jwRonwQwhOz/ARUZrlfZ9pMykU6wAdZ3KVBHPlXwS2w3IJFOVC1uY5WAHN9lobGLfSxr
	i8vivZKfTXmeHRr9tOJY7c3SPkrJZ5A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-uI3EC1HhPtWEDL2MX4IwTw-1; Wed, 21 Oct 2026 09:43:05 +0000
X-MC-Unique: uI3EC1HhPtWEDL2MX4IwTw-1
X-Mimecast-MFC-AGG-ID: uI3EC1HhPtWEDL2MX4IwTw_1792575784
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a027f2e364so3896545e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792575784; x=1793180584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/6wg+cGh6J9MYyjTA2bTtWBGWLVofTB+kJ98QIYQnjQ=;
        b=VD5K38gX2X20mAX57PkwBTncTsCRQPDTfzq9+SQsYTV1Vh5ExF9th49dCiF8VybNiF
         YKRlZk5MlQMskdJ8XWu/h+GB0bJhXzq/pG4ghXPOdN0oaWbJxfDPPTnOiuMiJXeUGqUH
         ghDgryKXtYJi+Wq+dQprjIva/kwVRDcNDnZBi3+44ucOdXqAHu4sipZsKRklNHfNF4/u
         MdulsVClu5upRigOYbmPMTXDG71e9N6ecNQNCh1hP4Zxso5FCEp8Tvx+JVUueTrjD5zT
         +mHUgr+OmP7e+Ji+Rio43WHt7y8kIPOh8jqT8F1sKnwckBtU7/mRHlfKqprjw5fp3vMe
         VooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575784; x=1793180584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6wg+cGh6J9MYyjTA2bTtWBGWLVofTB+kJ98QIYQnjQ=;
        b=t0lnSkj98ctQVFYM4C2kGNQYmlWfWLqh6Jz1bGLqM4ni0uPsPuKXJfHc292AhLueQF
         sLiNegAnT+8xBqL5XU4T1LbYHjY0e6cH9x7QIpcAv/smVyxT0SD2x4BsKo+CsSJ2/iQC
         3mnpinSMKM/teFSozjf+J7A0qCbhWWf5YfFNyYuTNTvDac+DESKlA4svmAZCf4W2Y24O
         5+8MwFem+xRL1yRc+NOkIeUhJX28zObJU9mZ8wPj5jsbQix9QZ8J9B/3pMQjwU3oCxzM
         hbsS46gH4rVV/L0Qrma+SOOjJyrpcdT37yhB3QkP7hv0BqdU2h2fi9UrBgTdMuSRKgG9
         t6rA==
X-Forwarded-Encrypted: i=1; AKwUvByRgD9qo/f6YbmE1d9zaDCBJvZpyTV7wxfnidpU2fSpfk57F72jnDmQeVg43t79ZjeQHqKxKWF92RvwQY4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL71BXt8YPRUMDx8F3k0udkoH8JaX7VW/CQ169FhR9l8GgGkc+X
	MEkDVxlklsxVWjLha5gDiKgKLHc9+Hfob0m6SPhGRyp4NkQcGNnwmMdwt3wAOnNCZNKycKQHv4U
	Pa5cUUFc4ORKlB9zHBHFjyz70/FXVHtTXdQX4DUuTa5Autd3kHR4yUNL/urNJuO4dnA==
X-Gm-Gg: AYBFou2b4QXJ5R2Es/nRvphlFKchRa2Pztz7grqWM0cScaAvQhW7C0RXbj/AZiyItIh
	ENqExUiE/RdUMoyAQinDd4pyDMSR9BEoLYi5WQHcodo/eQBauLEgQxJRRj2PQ6MZ46lA967Emnb
	s5Ck7MNbatGxg3nG241ZxRJLAoXIyIcy0RMLb9Rtn+iWT81t5X8lyHkP/dAW8snn1MofWRbo3RN
	ph8OWApjvfXpUJ6QwMB27oOXin3H+uXl6rhEc5k/7sIRkQPwEzNIhCy2gXRBJ9MfvziDCVvtcCn
	kErtARKac9CvVce+MnYa9lDd2B0SBQhi0+tfscrXYBZcbRMzmK/eG/o9jm678/MK+deUgjn59Q6
	LwFUVew==
X-Received: by 2002:a05:600d:864d:10b0:49f:e941:d6e with SMTP id 5b1f17b1804b1-4a1fdd399dbmr19403495e9.21.1792575783749;
        Wed, 21 Oct 2026 02:43:03 -0700 (PDT)
X-Received: by 2002:a05:600d:864d:10b0:49f:e941:d6e with SMTP id 5b1f17b1804b1-4a1fdd399dbmr19402975e9.21.1792575782925;
        Wed, 21 Oct 2026 02:43:02 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.178.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258427cesm4305321f8f.52.2026.10.21.02.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:43:01 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:42:59 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: David Carlier <devnexen@gmail.com>
Cc: netdev@vger.kernel.org, bobbyeshleman@gmail.com, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 2/3] vsock: support SO_INQ on stream sockets
Message-ID: <atiJD80fftOEaKp-@sgarzare-redhat>
References: <20261016132716.272018-1-devnexen@gmail.com>
 <20261016132716.272018-3-devnexen@gmail.com>
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
In-Reply-To: <20261016132716.272018-3-devnexen@gmail.com>

On Fri, Oct 16, 2026 at 02:27:15PM +0100, David Carlier wrote:
>SO_INQ makes recvmsg() return the bytes left in the receive queue in an
>SCM_INQ cmsg, saving a SIOCINQ call per receive. AF_UNIX stream sockets
>support it, AF_VSOCK fails with ENOPROTOOPT.
>
>Add it for SOCK_STREAM, reusing the hint already computed for io_uring.
>As with TCP_INQ, 1 is reported once the stream is finished so the caller
>reads again and sees EOF, and accepted sockets inherit the setting from
>the listener. No cmsg is sent when the transport cannot report the queue
>length.
>
>SOCK_SEQPACKET is refused, as on AF_UNIX: its transport callback counts
>messages, not bytes.
>
>Signed-off-by: David Carlier <devnexen@gmail.com>
>---
> include/net/af_vsock.h   |  1 +
> net/vmw_vsock/af_vsock.c | 35 ++++++++++++++++++++++++++++++++---
> 2 files changed, 33 insertions(+), 3 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

