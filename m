Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AD54CE688
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792340502; cv=none; b=gDQ4vMAbEkCxVOBkwmcgRu4ZQZ6QcI/FlUk/nN88TkfNGRZ/iKL+Tcn5iLJghgK+X4TH6g3nPsAhrNkPx9ih9LAADSKp84MwJm3bXDEmP+qcB+stZLh7ireILj81xubAoxV0Je2RRJnQ5BWd0tkf3c0xzTBYdjICrQg4KvF+8fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792340502; c=relaxed/simple;
	bh=st0vO++5Er4odpCXX/Ftnk6EBLXfCc0bNWpChEwT1q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TeIXjyV6VrjLnsK3GZ5obAJ9Rkb9l0zy/3BaQ5FYoKxbySAHa4A/dvouqIwHldmpfLwMRM5/L/+MzHvUlejJIQHUlTHPSLkWvvtIofdl4WhBsivAoVMV3La52QHOu+T9mren4bQ9r2JvnbeFzMppPnOloHJ9mtxzHddWnG5FBq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SXjOt69s; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bpwlTjwq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SXjOt69s";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bpwlTjwq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792340497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MYWhgKkOyBGQpTdOqbbR6FCgBN0C/ix0eXA3fu8Y1OY=;
	b=SXjOt69sH0Q++i+QkDRfoKLSvg+t+kL+ib/6p3+Vgg4D+ldzafuL1OYm1DzmLDeHo4T7Eo
	OKGN8/QeI0F/DlXS/4F3A3iIM+Xgw/PW8Lkq3r+XEx1tM8+/pA4Ym9EaA8ZqcME4LdFg2m
	lR+JAhaNx8ftyzEcfbD/kmfcME1wibU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-fEbpDEf4O_WJSyEYZ6uWTg-1; Sun, 18 Oct 2026 16:21:36 +0000
X-MC-Unique: fEbpDEf4O_WJSyEYZ6uWTg-1
X-Mimecast-MFC-AGG-ID: fEbpDEf4O_WJSyEYZ6uWTg_1792340495
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0af48c18so891487f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792340495; x=1792945295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MYWhgKkOyBGQpTdOqbbR6FCgBN0C/ix0eXA3fu8Y1OY=;
        b=bpwlTjwq5tKKLpeEaqm6DX01ePY9lvRbFSGdGX8zBXgmiokGfNbGpt3WbBt3DMZBro
         5bpqBPbYUbMC1Qp0PbAngtViuKlK7j2guCKqS8ASKLTYaa9/q5JMB8pJrNTdbqkhDbXx
         CW30MJjQuzxUJJmcKdLABUCos+uqw3wg1/J/qRxkCrfk77LCPKLX+kZ7j+c3atlg9apb
         SIed/OoDspaUuQwIgCQlCyzD+Roz2LN3ROJP+L6eFTxwhw2W9jrizNZuU+U5UWMfVjD3
         iMCQW9ZAuedlzBYZYqbq7Mln1bLzrYaQkuYzGv8uzDC+0U26NOBnz/fWopXyS4S38YRf
         qMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792340495; x=1792945295;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MYWhgKkOyBGQpTdOqbbR6FCgBN0C/ix0eXA3fu8Y1OY=;
        b=ux5GBtYBsBUU/6dGxW9sxZSSgyGuP4JWFbbCcuAS+CZ30nlDN1ANc21+towi10g5Nl
         Q/Zmo93bAqTXes3N8W/E4EPj+vCqXQpqRNnnjM4eKnRA2gCd938rRouT59NiaWuspfy9
         jE5r2KDS1viRUEsIEbjLDy9201HOyCQhBI91gx0VrVV0D4CD48e+iL1op5KFUAyY/SQP
         46Gb02N3OfuP0WnTcNB5Y/Kr0TXwmOi8JqRyvhbAEbEHIGR/9sIUH/RjqpkieEMrVypY
         8mh0hKTJVjE2JqW2YsEVxE2d4bWv5x+bATsgO0YEDVfHLCB7MH14SoOHr6NEOxfcfEyh
         pEOw==
X-Gm-Message-State: AFq9FYLZ7u30vVVSdEvC8G6VZXqruAJ8v9V7rn6ep//AwsbTPGDyKUlb
	mBHqadtjfJEaZHy1js1Dy9Rcy8xsd83RO/jQS+ihsr4BJVkmAG/sQL9GvK10b85WVk5yQ6rpcHh
	hBPFO0BxS214+5WP9w7Zho5MwCI7lUWUPsaLGNBG3aEXUiQU+ocHDrg+q7YeS9zhTyQ==
X-Gm-Gg: AYBFou3YNdwm0GdDdpNH9kKZYm8v40DIdgCJYMTGlbIL3M9Z8rFok1OOIh9FijDtaLp
	8mJuifHmgFDN8B5WuU/zA2p4Adl/Pjfqkp40iLWoO5YDWL629ed4fneZgWTc9rwdIQYIG/xIVKp
	DhXq4nFFDfGjc5Ty2xLJMUZOx4AreXoL3IIx2q1EnN7ie9tqNJKdbG4JRVDUg4S5as9zQN67nqz
	wfK5A+TDq0Omb0HvNUxg0A+NlXnG4NupjJ2z/MJAJmIEOHw9uGK1GQc5axH+J7e0vuBdfHwQoDn
	9ehS4DL+Bfi7vORO40r3P7uIeYs4/7aBH8LUtNwzdS4SbXz0kSO591YRT7SMbRrdWVbVfQ==
X-Received: by 2002:a05:6000:2611:b0:48d:ef93:67a0 with SMTP id ffacd0b85a97d-48e07fa8300mr11806538f8f.50.1792340494963;
        Sun, 18 Oct 2026 09:21:34 -0700 (PDT)
X-Received: by 2002:a05:6000:2611:b0:48d:ef93:67a0 with SMTP id ffacd0b85a97d-48e07fa8300mr11806491f8f.50.1792340494328;
        Sun, 18 Oct 2026 09:21:34 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8d12sm18054366f8f.36.2026.10.18.09.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:21:33 -0700 (PDT)
Date: Sun, 18 Oct 2026 12:21:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, Willem de Bruijn <willemb@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: gso: validate transport header before
 computing segment length
Message-ID: <20261018121331-mutt-send-email-mst@kernel.org>
References: <b714fa38ab650b313ca3121cd4cb3ee847d06a0d.1792327180.git.mst@redhat.com>
 <willemdebruijn.kernel.3a3160b92eb96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <willemdebruijn.kernel.3a3160b92eb96@gmail.com>

Thanks for the quick review! I'll wait a bit for more comments
and post v2.

On Sun, Oct 18, 2026 at 10:16:23AM -0400, Willem de Bruijn wrote:
> Michael S. Tsirkin wrote:
> > If a TCP GSO packet is processed in the stack before a transport
> 
> TSO

right.

> > header was ever established, the TCP data offset is read through the
> > unset header offset, far outside the packet.
> > 
> > This was demonstrated by syzkaller, back when the input path did not
> > dissect such packets: a virtio net header supplying a malformed
> > network header was enough.  Qdisc length estimation has carried a
> > guard against exactly this since a0dce8752193 ("net: Skip GSO
> > length estimation if transport header is not set"); the GSO length
> > validators never got one.
> > 
> > We used to, but we no longer allow such packets in: since 44378d02c5aa
> > ("net: always dissect GSO packets in __virtio_net_hdr_to_skb()") the
> > virtio net input path dissects all GSO packets.
> > 
> > But as a defence in depth measure, let's also check before we read: if
> > the TCP header is unset or outside the linear data, drop it.
> > 
> > Fixes: f43798c27684 ("tun: Allow GSO using virtio_net_hdr")
> > Cc: Willem de Bruijn <willemb@google.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> > 
> > Can be net or net-next, but given we have Eric's patch in net already,
> > net-next seems more appropriate, and it's safer.
> > 
> >  include/linux/skbuff.h |  5 +++++
> >  net/core/gso.c         | 36 ++++++++++++++++++++++++++++++++++++
> >  2 files changed, 41 insertions(+)
> > 
> > diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> > index a3ff380d43f0..aa5bc608de06 100644
> > --- a/include/linux/skbuff.h
> > +++ b/include/linux/skbuff.h
> > @@ -3041,6 +3041,11 @@ static inline bool skb_inner_network_header_was_set(const struct sk_buff *skb)
> >  	return skb->inner_network_header > 0;
> >  }
> >  
> > +static inline bool skb_inner_transport_header_was_set(const struct sk_buff *skb)
> > +{
> > +	return skb->inner_transport_header > 0;
> 
> skb_transport_header_was_set has
> 
>         return skb->transport_header != (typeof(skb->transport_header))~0U;
> 
> is that initialization different for inner_transport_header?
> If so, slightly confusing. But also understandable that zero is the
> default initialization, I guess.


Indeed.


> > +}
> > +
> >  static inline unsigned char *skb_inner_mac_header(const struct sk_buff *skb)
> >  {
> >  	return skb->head + skb->inner_mac_header;
> > diff --git a/net/core/gso.c b/net/core/gso.c
> > index e96ef6350064..d98acfd68595 100644
> > --- a/net/core/gso.c
> > +++ b/net/core/gso.c
> > @@ -131,6 +131,36 @@ struct sk_buff *__skb_gso_segment(struct sk_buff *skb,
> >  }
> >  EXPORT_SYMBOL(__skb_gso_segment);
> >  
> > +/*
> > + * GSO processing (but not UDP/SCTP GSO, which uses fixed header
> 
> TSO

right.

> > + * sizes) reads the TCP header as specified by
> > + * skb->transport_header/inner_transport_header.  Make sure it is
> > + * there to read.
> > + */
> > +static bool skb_gso_transport_header_ok(const struct sk_buff *skb)
> > +{
> > +	const struct skb_shared_info *shinfo = skb_shinfo(skb);
> > +	unsigned int thoff;
> > +
> > +	if (likely(!(shinfo->gso_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6))))
> > +		return true;
> 
> The likely case for GSO is TSO.

indeed.

> > +
> > +	if (skb->encapsulation) {
> > +		if (!skb_inner_transport_header_was_set(skb))
> > +			return false;
> > +
> > +		thoff = skb_inner_transport_offset(skb);
> > +	} else {
> > +		if (!skb_transport_header_was_set(skb))
> > +			return false;
> > +
> > +		thoff = skb_transport_offset(skb);
> > +	}
> 
> This is not GSO specific. Could be a helper in skbuff.h?

will do.

> > +
> > +	/* A negative offset converts to a huge value and fails. */
> > +	return thoff + sizeof(struct tcphdr) <= skb_headlen(skb);
> > +}
> > +
> >  /**
> >   * skb_gso_transport_seglen - Return length of individual segments of a gso packet
> >   *
> > @@ -253,6 +283,9 @@ static inline bool skb_gso_size_check(const struct sk_buff *skb,
> >   */
> >  bool skb_gso_validate_network_len(const struct sk_buff *skb, unsigned int mtu)
> >  {
> > +	if (unlikely(!skb_gso_transport_header_ok(skb)))
> > +		return false;
> > +
> 
> seems weird to test a transport header feature in a network
> header test?
> 
> Should this instead where it is needed?
> >  	return skb_gso_size_check(skb, skb_gso_network_seglen(skb), mtu);
> >  }
> >  EXPORT_SYMBOL_GPL(skb_gso_validate_network_len);
> > @@ -268,6 +301,9 @@ EXPORT_SYMBOL_GPL(skb_gso_validate_network_len);
> >   */
> >  bool skb_gso_validate_mac_len(const struct sk_buff *skb, unsigned int len)
> >  {
> > +	if (unlikely(!skb_gso_transport_header_ok(skb)))
> > +		return false;
> > +
> 
> even more so in a link layer header test
> 

skb_gso_transport_seglen maybe? I'll have to make it return int
and make callers check that then.


> >  	return skb_gso_size_check(skb, skb_gso_mac_seglen(skb), len);
> >  }
> >  EXPORT_SYMBOL_GPL(skb_gso_validate_mac_len);
> > -- 
> > MST
> > 
> 

