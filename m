Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602041;
	b=LuFOpD5t3VsI/JwGcOW2xGzfDX6lf+0nvsI/+SlxKQrFjdC1TAFcdjUhLQACks/11ny3
	 N6p2yfL2L7fp/NGzF8g0FcoQEs8tCAO3nzboxX0QKcRIPNxbTD5/V1R3ONsQi6YjutJy4
	 Qw7C6NbNIxnjC5qAFA94PwhM7g4r0AE1YvMaONySFCLjg+C8+I+LYrCHy9tmuqIBbfgjA
	 iftfIMjScMhsTRCAYMdhnDx4hxhvGgL2MxAE6u9yrFwuSFKbnhV7I+IUhpOvUnoEh+F7S
	 sB0TOSLLl7bAHhEpU20Xl1FGE1vXN+wAUvxGS5JH4Gs9YLADx/1mMLOZVY2JMQTPWng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602041;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=hg756WFowYy+h+rv8OWF8+LfypVcqHe8wBiAPczjXtc=;
	b=rs9nL6R9123h7qJr81tapDjT4qLcpuGrQejUwT3QhNli6HCcmZ0kF9oM/TY73atxozpr
	 c4ItnD76flW9r0RlSaGhw9HVNekTmN6UNKGw6nCAqlm6a74JrxHp8bS5uQd/HPkiQCkEM
	 Ooxu0y5ea/nxq3GTLLLG+HwuJBUoB3mYc3XI8bfziW8BD0Su1ms0JrdZLRuKx46pHXSh0
	 mIv6irvevp6tcpSLyuXq3TFG5BcfkmXexsjO72FjxL6F9LPoPWgyfes+Liz4PabSm0Jtt
	 QLu1gwu5sZbQCRuMfYAYFVHgZR/ArtrBQY3Ud59TkNhhG8rkC3w48UwRnC5tEP89a7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qepcwi7M;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UbimXrB5;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199C6606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 199C6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qepcwi7M;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UbimXrB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792602039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hg756WFowYy+h+rv8OWF8+LfypVcqHe8wBiAPczjXtc=;
	b=Qepcwi7Ms8POCbr9vHyi2DNXqDPB3yvY/zhjKyy8Rn1M6OME09xjLfid458GavsL29axV7
	SXHOdABni/O3AJ7z+vtqljJ9IkSpFPOA0gZRRWXEGf4xESq+G4ALNnUqq1NSxrPyY4nx8G
	Su3L2+HukYE+l3q3jJc5FjwmZhUHukw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-wswfyklvMMyW06jAd7V98w-1; Wed, 21 Oct 2026 13:00:38 -0400
X-MC-Unique: wswfyklvMMyW06jAd7V98w-1
X-Mimecast-MFC-AGG-ID: wswfyklvMMyW06jAd7V98w_1792602037
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1db220b42so8641425e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792602037; x=1793206837; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hg756WFowYy+h+rv8OWF8+LfypVcqHe8wBiAPczjXtc=;
        b=UbimXrB5dGdnO0TsxeGofcIk8ZGbuenQmt+4Krqq2N9jETg6GFKSrNicaEK8SOMOOx
         RluoUpqKAZKuoZPZ9zVK5w6urFc+EEZ5hb+k82B2vrSFzVHgu7/gXieOJSRCXrXUCY8T
         CWBz+rkJNObiVMAZ780stknk0A9ApMtdmB90IyGdeDNsCG1GOtGblwHv/0xVZ1+buReF
         9o/13GiC+N+12rejlU7VIsxpwkwSz0CvoF2npzfKLby1c8/AE+uHprSl/63+flNrHvxX
         1+7b60YK9e1RSmdPHh+y21luDknXV1MfF7sBf7Ky+XZK/IHLEFu0fLWQxMWGxDmQPvAl
         O3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602037; x=1793206837;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hg756WFowYy+h+rv8OWF8+LfypVcqHe8wBiAPczjXtc=;
        b=1tBh4U8Js2KhnANroAC8HdG4iRaqi9RAATu91M+HxcTYs9G3Bg3nC8bC7EOx7+uZXP
         24nI50LDDhsEJOrcenxHKg9rIWhfDzVS+7XxY14gqINiBpXOa0Sgy66XQfgXAK6A2knJ
         3Fqp1ru/VYc3RfWh1neWCSzroFl0IL1x5SSDGWLSX6Do2aVpizClsjSDahpZk/dkeGXU
         tsI0Tew3uWJxsf7i9fW35OmStBx7/b25IbOKKr3kFiNYPTL3lDZoON+85CcJaT27B6PW
         Kn7AjtB/YbJDxsa+B4aQotnonvXUBOplk2XyE1NXT7tjz0jHL+A43+Pb9QXnufL4KUeW
         yO0A==
X-Gm-Message-State: AFq9FYLazWy3HgjaF1Apa3su9V7M7gCkJ6NS3L/2L7jS9/cq3Ys8F04/
	DsSsH94vNCElsZn8eEZwvw5zQMXli2EKtdVmaM4OEZPS1zlpFqxI9P8nC4usZHt94+iTThGjJ9/
	V27RZ7VB4ftMYohQgWH7IFvuiF72Wp7XkHRZQHjfptBBtDNa8Y3kisLtOsuQ3Dgw38w==
X-Gm-Gg: AYBFou3rksO3/djqdwNZk2+jdybPD3sQXd57Kz5GoZolah6sqhttkv8DHqp+rk90eOM
	/nFN8k3rm+zKhUfBxtGZi7kk18YhdhXZfd3Dw3ug9YC7UQ/TIkY0P/ZsU31E+QmGAjYJww6irpX
	UpmyCHFqqq2IUIXnaglvnrfssRLH/7oXBb5V8UqMu2AV9AS4tdgxjtHT/dlygg+lN/C7QV8xBqj
	UYtmiwhVrSFTD64TpKUnINMX4h6JT2RVIQhHgr9RiBjRcXSMq6eglxT/7mmlPXLSb45/FNm+CiQ
	g8qtXNp0V58M4Zj90tUHinYENKku/l7OFZIvSsHQGwnvg92UBSAQnm1JWpQ7SBqu9PY=
X-Received: by 2002:a05:600c:8b6a:b0:4a1:9831:a69c with SMTP id 5b1f17b1804b1-4a1fdd3bc69mr52099275e9.30.1792602036425;
        Wed, 21 Oct 2026 10:00:36 -0700 (PDT)
X-Received: by 2002:a05:600c:8b6a:b0:4a1:9831:a69c with SMTP id 5b1f17b1804b1-4a1fdd3bc69mr52098645e9.30.1792602035808;
        Wed, 21 Oct 2026 10:00:35 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd360e4sm46139995e9.4.2026.10.21.10.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:00:34 -0700 (PDT)
Date: Wed, 21 Oct 2026 13:00:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: linux-kernel@vger.kernel.org, Willem de Bruijn <willemb@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Max Krasnyansky <maxk@qualcomm.com>,
	Rusty Russell <rusty@rustcorp.com.au>, netdev@vger.kernel.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH net v3] net: gso: validate transport header before
 computing segment length
Message-ID: <20261021125549-mutt-send-email-mst@kernel.org>
References: <52b8bfe4ee848aff8ace47752352de486171d45f.1792595507.git.mst@redhat.com>
 <CAL4Wiir3NTn8VdbzS=sV3tfz4XGoBXmSfjm96k9SBMTiYBBtjw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL4Wiir3NTn8VdbzS=sV3tfz4XGoBXmSfjm96k9SBMTiYBBtjw@mail.gmail.com>

On Wed, Oct 21, 2026 at 05:49:35PM +0200, Eric Dumazet wrote:
> Le mer. 21 oct. 2026 à 17:13, Michael S. Tsirkin <mst@redhat.com> a écrit :
> >
> > If a TSO packet is processed in the stack before a transport
> > header was ever established, the TCP data offset is read through the
> > unset header offset, far outside the packet.
> >
> > This was demonstrated by syzkaller, back when the input path did not
> > dissect such packets: a virtio net header supplying a malformed
> > network header was enough.  Qdisc length estimation has carried a
> > guard against exactly this since
> >
> > commit a0dce8752193 ("net: Skip GSO length estimation if transport header is not set");
> >
> > the GSO length validators never got one.
> >
> > We used to, but we no longer allow such packets in: since
> >
> > commit 44378d02c5aa ("net: always dissect GSO packets in __virtio_net_hdr_to_skb()")
> >
> > the virtio net input path dissects all GSO packets.
> >
> > But as a defence in depth measure
> 
> I do not think we want this.
> 
> The root cause was fixed at the source by 44378d02c5aa. This patch adds
> code to skb_gso_validate_network_len(), which ip_finish_output_gso() and
> ip6_finish_output_gso() call for every GSO packet, including locally
> generated TCP, to guard against a state the stack no longer produces.

I just worry we missed some entry points. Shrug. As you wish.

-- 
MST

