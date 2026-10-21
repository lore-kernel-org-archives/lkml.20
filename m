Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569129;
	b=E4wFHfR/MJlLmhHt6VqyElVlSg0AtikErXLdYmwGAFvoHM+rK3fp5/wgRjBd0aXOBB11
	 hU2XBVhTpG+73uHqx8DYBa5jpElqw4S85umWesXDzVloJlGLJd4n3jteYP2WL+s84uq6S
	 gmLrQccl7W2DxB5MKAxxdUfc+qSW5z+JxWaEsblEYucSLyXPZ/Q8gc6bOxlrZWGbN1dI5
	 MTYfkcENDLNRtlWehAAALOWYutJxXBFA7sIjkGX+10RXwLAq5uULc0VSM2GZ+GXDlYfEH
	 gw5bsOZzYcZZcJ1cMmWlcEPJY5otz03BgCUDvqrwOJvx1uw6MhO1zCw2mA3dUrNV+7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569129;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=QITuyYs5+tqSrKrfIpvUKD41r2Vyp9d2xbchRm7msa8=;
	b=IlVBBXVFDpuZg118mj1d/j2/Rxq97WZaVcOLsPFQqWtL1re9iKm1EMGIsuhCqaP3CASv
	 ZQ/Z57sB5eaXpRBWYbm1PDgw2+25jtK7Qx5sqWLAtbGZ4TG7BsTNQZ13SyfUGUAkdaL4S
	 4kOmd0dY9oc4dDv9VbOuMByC6GjrwwhEMqxWl6TEV7DBGA/XAdzFudR1243bW76chWwxU
	 VYQu65w6q9OWai60g23VFqoXq0VssHf5fHKnQuGEKNOkAfdvGOCF4B5Kaw+H39eRaJfJ+
	 tIEoL/cbBN2VXuXPva+FSxPNzPronxqoPeFQ3gKOxHyBbzZhphLQQkYEwswoeNCsRVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZyaCfOMZ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=J4BWEF5P;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FD3606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9FD3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZyaCfOMZ;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=J4BWEF5P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792569128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QITuyYs5+tqSrKrfIpvUKD41r2Vyp9d2xbchRm7msa8=;
	b=ZyaCfOMZaLkfkP5CIbv/1k8OFGPI/rFHCd+WinSm2OaUZ+PlPMpdVEhD1lGH48qxwGoxSI
	hSZ6reKymyIhMi3j3r3N93eNEbIy0IEv5b95MVvEUVZcl6jVtKadplSALa6X3QOGPVoKmW
	npPsF3ueHC72nh73zQz8LCW2p0+M2vA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-_1MIqlXLMPiM48AY2EQM-Q-1; Wed, 21 Oct 2026 07:52:06 +0000
X-MC-Unique: _1MIqlXLMPiM48AY2EQM-Q-1
X-Mimecast-MFC-AGG-ID: _1MIqlXLMPiM48AY2EQM-Q_1792569125
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e0c896d05so362170f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792569125; x=1793173925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QITuyYs5+tqSrKrfIpvUKD41r2Vyp9d2xbchRm7msa8=;
        b=J4BWEF5PNGoV82MCnAZffDR3ZZvNJwcMin/NFwAjKIm7DdUufKnGGJbpVy4LN8JXXD
         xpEDoIJqPhZD1fXC+KTbyXSaLflsyjfNfQ+aiFi5iDySJ/eS5BhYml2czPeoB/2kHRVQ
         HLRhyEqOpA6FWmarX65ITFblyghzCToej9kOZgVG75vRlJFRSMcq72LyDBcGgZml5EXa
         IKVl0DPLISk9BBKkAXW9S+KlcgmYIsUi+4uj+/5DEMkB3kS20Rk3qtEZBmPrVz28DoBb
         uSL8anh7hbU5qXnptZc0/+rzfpnR1gPCGNQsDS8zvCOFc2NHOdOe5uACtSDbLfja10Yi
         KfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569125; x=1793173925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QITuyYs5+tqSrKrfIpvUKD41r2Vyp9d2xbchRm7msa8=;
        b=25VDQFeFfjTL54fGd98BzMSPMUlVjKTOXAQRTcJ+eWMdBoXKQ3gMLg/Is3ZIxpBdsj
         MO7DNsIVWAh0BYOp79tTBPP3offOZCA9TH2soGEh+8BavMbuCkCoyFe4oWdGL/6y+LyV
         JxWnOAQpy6gXyo4JJemBa7v25EYqLhSwqMdW8BEPZqk/ykqtvLLE+uRoUXdybtjgOSFt
         Fs5b8N++DiDg1iCejIz3tqHYXcHdJmZQn50GZNT08c93coKWf3bE0slES7dz1lMk3osh
         5ACD0m8YQN3zLFmEHxPvk3t+fmCMX5c6qj5yhpjqYdKf9yFvpdc14XEUFAB8RUfLRd+4
         meVg==
X-Gm-Message-State: AFq9FYITev7XogNFdjY6q+ycXW9bLV1gwJOh1LFG9ETnJTKBO9Ui18AN
	ITpcaGsqBTg5d7eqwt6O48L0we3RvzIHv1ZtVipb6kXguCpbvkT7VC03yEYSslYUyhT3aX2RkSl
	aAZ8stBA8/fdQnQM0LFEMmucx//IiertK2Bl+8rWWoUe3bImRxI/oLO6KtJ+pnV4p1A==
X-Gm-Gg: AYBFou1b6vQOZ0iJytaElw48CtPTdrVOqnVOTJNu686RKIvJt+NaWpbh2iqB4/SFIRj
	fwaaKWlQ3qKehddRAOUj+MsPwqT43b6rx10DBEo58Ni68TlkpfhLykBy0FCbLWPuF6OvBU0wEuc
	7JTEU8yoxrIQTUPAYMjtDeF2Jjt+9bF0y9bIYUqWK5Sx45pn9f1Jm0fe5aAz4PYb7kZD2XuWzkJ
	EaTSRcZ5AkkYzkf9j2oyEOWh75xrtQ7hGLVHgkeFpCjgNjEso13om6uz3ayjaQmtLS0pl7Kgao9
	4LSiDEHMrAyOTQKQ++HDx308cQtDrOawMjk2K5tjms8rWRlLYRAuh2Je9lg+6waEdiMnPQ==
X-Received: by 2002:a05:6000:478a:b0:48c:7ee3:e07d with SMTP id ffacd0b85a97d-48e264ef9cdmr1191047f8f.52.1792569125343;
        Wed, 21 Oct 2026 00:52:05 -0700 (PDT)
X-Received: by 2002:a05:6000:478a:b0:48c:7ee3:e07d with SMTP id ffacd0b85a97d-48e264ef9cdmr1191026f8f.52.1792569124881;
        Wed, 21 Oct 2026 00:52:04 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583ffa8sm3908268f8f.51.2026.10.21.00.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:52:04 -0700 (PDT)
Date: Wed, 21 Oct 2026 03:52:00 -0400
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
Message-ID: <20261021035050-mutt-send-email-mst@kernel.org>
References: <cover.1792411304.git.mst@redhat.com>
 <9c08d12b3a7819ae03ded6a154e4f908276e93d4.1792411304.git.mst@redhat.com>
 <willemdebruijn.kernel.2eb449439b094@gmail.com>
 <20261020170908-mutt-send-email-mst@kernel.org>
 <willemdebruijn.kernel.1da723f98c23a@gmail.com>
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
In-Reply-To: <willemdebruijn.kernel.1da723f98c23a@gmail.com>

On Tue, Oct 20, 2026 at 08:05:29PM -0400, Willem de Bruijn wrote:
> Michael S. Tsirkin wrote:
> > On Tue, Oct 20, 2026 at 03:44:35PM -0400, Willem de Bruijn wrote:
> > > > +/* Walk the L3 header at @nhoff: where does its transport header
> > > > + * start, and which protocol is it?  Returns false if the header
> > > > + * is truncated, malformed or fragmented.
> > > > + */
> > > > +static inline bool
> > > > +virtio_net_l4_start(struct sk_buff *skb, unsigned int nhoff, __be16 proto,
> > > > +		    unsigned int *thoff, int *ip_proto)
> > > > +{
> > > > +	if (proto == htons(ETH_P_IP)) {
> > > > +		const struct iphdr *iph = virtio_net_ip4_parse(skb, nhoff, thoff);
> > > > +
> > > > +		if (!iph || ip_is_fragment(iph))
> > > > +			return false;
> > > > +		*ip_proto = iph->protocol;
> > > > +		return true;
> > > > +	}
> > > > +
> > > > +	if (proto == htons(ETH_P_IPV6)) {
> > > > +		const struct ipv6hdr *iph;
> > > > +		int flags = 0;
> > > > +
> > > > +		if (!pskb_may_pull(skb, nhoff + sizeof(*iph)))
> > > > +			return false;
> > > > +		iph = (const void *)(skb->data + nhoff);
> > > > +		if (iph->version != 6)
> > > > +			return false;
> > > > +		*thoff = nhoff + sizeof(*iph);
> > > > +		*ip_proto = iph->nexthdr;
> > > > +		if (*ip_proto != IPPROTO_TCP && *ip_proto != IPPROTO_UDP) {
> > > > +			*thoff = nhoff;
> > > > +			*ip_proto = ipv6_find_hdr(skb, thoff, -1, NULL,
> > > > +						  &flags);
> > > > +			if (*ip_proto < 0 || flags & IP6_FH_F_FRAG)
> > > > +				return false;
> > > > +		}
> > > > +		return true;
> > > > +	}
> > > > +
> > > > +	return false;
> > > > +}
> > > 
> > > for all this parsing: could we use flow dissection, like the
> > > !VIRTIO_NET_HDR_F_NEEDS_CSUM case?
> > 
> > Hmm I don't see how.  That one trusts the caller's protocol and network
> > header. We could parse L2 ourselves and use the dissector for L3+. But
> > it stops at whatever it does not know, and every miss would turn into a
> > drop or a software checksum for a packet the stack delivers fine.  Our
> > parser deliberately covers everything the stack can deliver.
> 
> You're right, the protocol and network offset need to be parsed
> manually. After that it could be passed to the flow dissector.

I posted v4 with the custom parser, since i had it tested. Let's do
cleanups on top? I spent too much time on this, to be frank.

-- 
MST

