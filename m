Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793849035;
	b=gAtMb1GPLbfs5RX340gFGqzodWpHkHQzv97ixvPnoYiKloSquV0cezs8+VeuYnM97SaL
	 psrRMwxkTDhPIzOEyN00HhfLnLigC5lvgDtSxWCk5Tx3ONXkPGRsgsCOIFb30GoFKUh/2
	 JiLKOZ1PL1l4t7dZD6P0TWSGLTTHMRLwnJ1p0gokO8vzQZxmvnraZ5z+0tQOTHyBzwvEK
	 zk6J5rWl6+Eq6LVsdP6Mf6ES3kIpt6t1abRPeO+Gw8G0vbdy4fg35sQmcScbDlzCNbN30
	 /QK0OUcZBzvUqKb0NrQzRSP3Ryc7ZS/Qt3hwmtZgzgzRgqW+8aVW9JRkPriPoz8ssrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793849035;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RMhQUIdBSBohHBv0s+jn+92qXMfv8S1VzeMvLzZBnBQ=;
	b=qKHhWmJo2KyLdi06Vtpm8fge1/d2mN2Hw6Q5jL0oFvhK+i3HzMYdI9LRsCBjhWhA4OK/
	 NP24svdT6HvJjonfhJLpEisftQPhbjHOU3jqRIsyBphBaaikIFJ5l3HolFyUhN1Q/B6NN
	 77FCjchM5uUrz9y1rEEVTiT+/w6n9xTfiYZUw3RPeX7sbicdf9TwjRBWO6flYxUCvrPRR
	 Jy349TAEn7q/wLz9KeeYccEmwSf/4qK5hINTJvE1HKrNvmqobbjUMAWfJKrtVZ5uqxCsT
	 LoZZaSvhwqLd0rdymNvsL8sQ/4hrK2xxz6HxuWAh/I1KTnyL2ppVP6ErL7QySATHnvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OawRORAq;
	arc=none smtp.remote-ip=95.215.58.38
Received: from mta1.migadu.com (out-38.mta1.migadu.com [95.215.58.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7400B606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7400B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OawRORAq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9TwfhhyQYL6sezbrnoxAIpd4i92BRlemNb9m/b/o/JM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793849032; v=1; x=1794453832;
 b=OawRORAqIlGTqBo4KxA1Lm4jZSUfwHAKiWD8M//FYWY455xbcu2ExiDH2R9qu/gNYkTydUOy
 FKpSYpD/B8wuVw7h0v8MdES5u2d7Uw78QEQrlgUrDabfYDyis0MqYWNVVxgEXU86B8ZIJDvUO9q
 7h+GpM8hJkvG3TJqJD617K10=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 195ef7053fc6f30c;
	Thu, 05 Nov 2026 03:23:52 +0000
X-Mizu-Trace-ID: 195ef7053fc6f30c
X-Migadu-Flow: FLOW_OUT
Date: Thu, 5 Nov 2026 11:23:43 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
	David Lebrun <david.lebrun@uclouvain.be>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Mathieu Xhonneux <m.xhonneux@gmail.com>,
	David Lebrun <dlebrun@google.com>,
	Stefano Salsano <stefano.salsano@uniroma2.it>,
	Andrea Mayer <andrea@common-net.org>
Subject: Re: [PATCH net 5/6] seg6: account for the MAC header in skb checksum
 on L2 encapsulation
Message-ID: <auv2v3HH4xX5nyNP@fedora>
References: <20261031225033.64-1-andrea.mayer@uniroma2.it>
 <20261031225033.64-6-andrea.mayer@uniroma2.it>
 <aulI7pl1oWRKzXgt@fedora>
 <20261104212546.1222c4cfcccaecf68f326cdf@uniroma2.it>
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
In-Reply-To: <20261104212546.1222c4cfcccaecf68f326cdf@uniroma2.it>

On Wed, Nov 04, 2026 at 09:25:46PM +0100, Andrea Mayer wrote:
> On Tue, 3 Nov 2026 10:37:34 +0800
> Hangbin Liu <hangbin.liu@linux.dev> wrote:
> 
> > [snip]
> > >  		skb_mac_header_rebuild(skb);
> > > -		skb_push(skb, skb->mac_len);
> > > +		skb_push_rcsum(skb, skb->mac_len);
> > >  
> > >  		if (tinfo->mode == SEG6_IPTUN_MODE_L2ENCAP)
> > >  			err = __seg6_do_srh_encap(skb, tinfo->srh,
> > > -- 
> > > 2.43.0
> > > 
> > 
> > Should we put the skb_push_rcsum() inside of __seg6_do_srh_encap() and
> > seg6_do_srh_encap_red()? They all do skb_mac_header_rebuild() again.
> > [snip]
> 
> Hi Hangbin,
> 
> I am not sure where exactly you would like to put skb_push_rcsum() in
> these two functions. I can read it in two ways.
> 
> 1) Right after skb_mac_header_rebuild(), for example in
>    __seg6_do_srh_encap():
> 
>  	skb_push(skb, tot_len);
>  	skb_reset_network_header(skb);
>  	skb_mac_header_rebuild(skb);
> +	if (proto == IPPROTO_ETHERNET)
> +		skb_push_rcsum(skb, skb->mac_len);
>  	hdr = ipv6_hdr(skb);
> 
>    Here the outer headers are already pushed, and skb_mac_header_rebuild()
>    moves the MAC header in front of them, outside skb->data. The push then
>    makes the packet start with that MAC header, instead of the outer
>    IPv6 header.
> 
> 2) Before the outer headers are pushed, for example in
>    __seg6_do_srh_encap():
> 
> +	if (proto == IPPROTO_ETHERNET)
> +		skb_push_rcsum(skb, skb->mac_len);
> +
>  	inner_hdr = ipv6_hdr(skb);
>  	flowlabel = seg6_make_flowlabel(net, skb, inner_hdr);
> 
>    This can work, with the push removed from seg6_do_srh(), but the L2
>    case in seg6_do_srh() would still keep the skb_mac_header_was_set()
>    check and the headroom for the MAC header, and part of the L2 handling
>    would move into __seg6_do_srh_encap() and seg6_do_srh_encap_red().
>    __seg6_do_srh_encap() is also used by the ENCAP mode, End.B6.Encaps
>    and bpf_push_seg6_encap(), and seg6_do_srh_encap_red() by the
>    ENCAP_RED mode.
> 
> So the first way does not work. In the second one I do not see a real
> advantage, and it would split the L2 handling between three functions.
> For this reason I would like to keep the change as it is in the patch.
> 
> What do you think? If you meant something else, please let me know.
> 

Oh, I miss-read the change. This is rcsum is only for inner header. The
outer header will be updated via later skb_postpush_rcsum().

Thanks
Hangbin
