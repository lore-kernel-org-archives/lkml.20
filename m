Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792532982;
	b=dJO2Q4jQ/jHkno4QWzNsMXW9P4sZZI+wR9ki9kgG8HagNoFE5MEmRypE+NxXPChP6yPl
	 iwPIQLn3bQIndpXgFP0M7eg9UEK6qCA4f7NvoMxkVENz7Fy5HDaA1xPSHwxjWL1lpNqsA
	 ljmXCOZ21vhMw3nYuTyeA/AbZ0RONRd4n1CPiGt4wkdbb2dyvWg3vgir399PQBvrwi7rR
	 YbwsEgWjBXED1ewNppjsHXrrlF6WBHPyf5ujld2VvXy8Va4IPqPF2pFf6f1clbjrDzVce
	 MjYLCx03d6JVl2ub/OyNsfs3Ao8uLi3jgh8PVOKdyjj0PXzc3SJybNV93TmUGJhI8fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792532982;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=6a23BIgyFqsOlkHIU2aMu3SBCeDxKSj45oBJ7lnIkkY=;
	b=nYEQKRXYw3iK6WCmeMfHy5/SypjpZFs91xB7iJYtp7xAs26zOjFSGAGQXaYwNEixo7zR
	 VPylnPuisNIjOaTT/LJFEo/Y5pbH1602Zj1xpLStErXmBJ8vW7J1d/gmhT4ruqc6uGhOl
	 uloRJgQGMHqVHJCaMaktXNklE4PfBUSy6uOnoJK07o8ZymKtAAg7NJ+oFnbn+i2ipoKCY
	 mqPlmo0jQ9p9qg7EpO9V+B+yTDj+AS6swLVKMG12p8fw3FSGx9q8eUIa6M7aFQ2dVie2w
	 6WSpVwIOP9Z2MSqKjqLt7FUQflpNnDUXgVOzJ0EtRD++E81HXBjg5+B4tBJ5rPFuyOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eXxUXygj;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jgnvcfjc;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64356606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64356606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eXxUXygj;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jgnvcfjc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792532980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6a23BIgyFqsOlkHIU2aMu3SBCeDxKSj45oBJ7lnIkkY=;
	b=eXxUXygjpIdNOWXdt2do2mPWMPNSImKQTPSXrcCwWEKGg+WvQyVWcLSixU7jZwhX7Qym2A
	wYMWQvdX6+WOf87CRW+xm1Dtdi5N2uBwuGchQJ3SpP+Xh6zej8Ljm7LGkY6LiACzQ2yjRS
	P0OLdYxSmQhh8SOQjR2UZ+hAyBXAviY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-q0iQJ01BPvmjQ2jyv9ztWA-1; Tue, 20 Oct 2026 17:49:39 -0400
X-MC-Unique: q0iQJ01BPvmjQ2jyv9ztWA-1
X-Mimecast-MFC-AGG-ID: q0iQJ01BPvmjQ2jyv9ztWA_1792532978
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48dff112136so60239f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792532978; x=1793137778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6a23BIgyFqsOlkHIU2aMu3SBCeDxKSj45oBJ7lnIkkY=;
        b=jgnvcfjciRC70SNW+z/J6p1+SLeinjYoFjgJ6KaAoaQ6B5lhe5JqXtzBd8al8g1raX
         bE1boKYFMCO2NDh4Y355KudDl771dVKYqHA4i24aYf2uv9TwWS3fFWNUnWGQyuENB4+O
         MlO0PdWM0Bg4z8oVaueaa5m0GvSHQD5hUqQ0lx6NT4M/hZ5YW21aODtouS2eIu4FArN3
         gnZhn8NMinctq/TAfvBa3nvSuWtDgu+SA42SvMH2ZvSaiwF1aH6yotFJ/bXWTfaPkmmw
         N42BTSZxjpLBydzXMZJH5L29a5CxXDnrh4sKBtvU66J2t8jYIAqpIxZW16RDvK/zfu3H
         t9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792532978; x=1793137778;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6a23BIgyFqsOlkHIU2aMu3SBCeDxKSj45oBJ7lnIkkY=;
        b=ORU0E5Wy3vQlphbjJ5s99fIHEBFSylt0PsaelCKcwWsEFwNiVHnbB4vhIuwG0/NCXU
         A8CfLGcBVAKwzq/a3psI/XtD4JJdKHXGS6F4HaFXrZ6BDnWdaT+7jaKGFcacItc5/8Bn
         ZmPZWEB5Tm378URyOugun51NWpayeF6pbDEINb5+KvJ+LxZS4hjgqH4s62N0PjmL0mPc
         SN/Rs47chaQhKXeuxw6NXKZFK9Yn+Su3vZENB4p70+ioxbBI9YozxqgE900CTH+bYMRK
         9Z+TCjq17Px+ojPKAwOo7H8DngIMDRlCHKtqKq4qWRJRaeQMyxmWjeGcIfJdj3/3fjW1
         ibgQ==
X-Gm-Message-State: AFq9FYIUR8Hla9SpI1GSZNU7XIP9YgtpSqANT/Y4J2J35jUt1pamZXOm
	krzkVhM8S8vVm/ZKBuLjLOj1YAOW5Ivwm2aiJAohhTF4EMus92IuORG0IHNqO8b9rpaW9iN8KUk
	iTe/XTqLmBopyeGlm2BlGazEQTHVJFJcpUOErI5yP5+hRCmVx8cQryOFf9ucUySuqdg==
X-Gm-Gg: AYBFou23SUKi+DF7hJ3LyuN3IGUp+TEeLMtVkYN5oyc//ukAATeIO9aCcrmQXAYN1Ud
	wXNskBJTtO6fua5QBbIo4OJsN06So1OLCxrd7c0pxnNkf1VuSJXeBWda0dOv0iypc8xLqmCM19q
	Mfm9dbuKh94wTWt1Pq7ROYs4yMIPA0PaqSalyEXGwAAmMpKP4u7zpQ9Xqjq+2cvLt9/TmdYUgnX
	knXG2iuoAi19oQxfFiMUdkck9vDHGlQ/Oq5r6vnjKdfSl0Y/xaKdpfo5xpv4j4xH8InQ55DmRY6
	WfY74PDQXXeyr8dKW3MxrzJxYpqmBhIWjM89TrSUd1gnZ6bGZjMxNhD+iKy5Oe6qRX7Y7g==
X-Received: by 2002:a5d:6f17:0:b0:48e:cd3:64f8 with SMTP id ffacd0b85a97d-48e2641dda7mr47259f8f.4.1792532977761;
        Tue, 20 Oct 2026 14:49:37 -0700 (PDT)
X-Received: by 2002:a5d:6f17:0:b0:48e:cd3:64f8 with SMTP id ffacd0b85a97d-48e2641dda7mr47229f8f.4.1792532977316;
        Tue, 20 Oct 2026 14:49:37 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828c6dsm1149327f8f.24.2026.10.20.14.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 14:49:35 -0700 (PDT)
Date: Tue, 20 Oct 2026 17:49:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, Chris Arges <carges@cloudflare.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Phil Sutter <phil@nwl.cc>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Max Krasnyansky <maxk@qualcomm.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Paulos Yibelo <habte.yibelo@gmail.com>
Subject: Re: [PATCH net v3 5/8] net: resolve uncommon partial checksums at
 ingress
Message-ID: <20261020170908-mutt-send-email-mst@kernel.org>
References: <cover.1792411304.git.mst@redhat.com>
 <9c08d12b3a7819ae03ded6a154e4f908276e93d4.1792411304.git.mst@redhat.com>
 <willemdebruijn.kernel.2eb449439b094@gmail.com>
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
In-Reply-To: <willemdebruijn.kernel.2eb449439b094@gmail.com>

On Tue, Oct 20, 2026 at 03:44:35PM -0400, Willem de Bruijn wrote:
> > +/* Walk the L3 header at @nhoff: where does its transport header
> > + * start, and which protocol is it?  Returns false if the header
> > + * is truncated, malformed or fragmented.
> > + */
> > +static inline bool
> > +virtio_net_l4_start(struct sk_buff *skb, unsigned int nhoff, __be16 proto,
> > +		    unsigned int *thoff, int *ip_proto)
> > +{
> > +	if (proto == htons(ETH_P_IP)) {
> > +		const struct iphdr *iph = virtio_net_ip4_parse(skb, nhoff, thoff);
> > +
> > +		if (!iph || ip_is_fragment(iph))
> > +			return false;
> > +		*ip_proto = iph->protocol;
> > +		return true;
> > +	}
> > +
> > +	if (proto == htons(ETH_P_IPV6)) {
> > +		const struct ipv6hdr *iph;
> > +		int flags = 0;
> > +
> > +		if (!pskb_may_pull(skb, nhoff + sizeof(*iph)))
> > +			return false;
> > +		iph = (const void *)(skb->data + nhoff);
> > +		if (iph->version != 6)
> > +			return false;
> > +		*thoff = nhoff + sizeof(*iph);
> > +		*ip_proto = iph->nexthdr;
> > +		if (*ip_proto != IPPROTO_TCP && *ip_proto != IPPROTO_UDP) {
> > +			*thoff = nhoff;
> > +			*ip_proto = ipv6_find_hdr(skb, thoff, -1, NULL,
> > +						  &flags);
> > +			if (*ip_proto < 0 || flags & IP6_FH_F_FRAG)
> > +				return false;
> > +		}
> > +		return true;
> > +	}
> > +
> > +	return false;
> > +}
> 
> for all this parsing: could we use flow dissection, like the
> !VIRTIO_NET_HDR_F_NEEDS_CSUM case?

Hmm I don't see how.  That one trusts the caller's protocol and network
header. We could parse L2 ourselves and use the dissector for L3+. But
it stops at whatever it does not know, and every miss would turn into a
drop or a software checksum for a packet the stack delivers fine.  Our
parser deliberately covers everything the stack can deliver.

-- 
MST

