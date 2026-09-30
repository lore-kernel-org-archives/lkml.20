Received: from mta1.migadu.com (out-103.mta1.migadu.com [95.215.58.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1FE327204
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790729090; cv=none; b=M5EFt6PvDXR2aJEPKDlZGtCmCP3LnY3s8Aq3PqedFC/SJbhhdybgU0fOZzik/zrtB/z4ISdZu7w4ZJXoRInjBsMVBAh4ISLVwXvj7KyCxYaZSCf/yCOZRN2p2iSm8UGQz4OJOMuVTnnJmtqbCHUbPZKs8Mnef84QerP8xXNr158=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790729090; c=relaxed/simple;
	bh=W91u3TgYrbEqLP/J9ErVZDmABK2bkne8JKBKTA9CbAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRcz2pzrOVpklTB0TSR8tf/VsVoCKAE4Efmy8PJTYB4YAVMUpjSSPJFk/GEaptF0I/xw38KcqWu96rCPppjaceF2sUkJ/2JdoUuViOLBnaPh9Ju0txSa034oK3tj54fAgf2RRArxExHsGJKpijpy3+3/dzAAiDzU20l1f5Hx3S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qjSQtjEI; arc=none smtp.client-ip=95.215.58.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qjSQtjEI"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=W91u3TgYrbEqLP/J9ErVZDmABK2bkne8JKBKTA9CbAk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790729084; v=1; x=1791333884;
 b=qjSQtjEI62u6Vqqr3p1hpcxO/A2KH/jmiu2J8ka6i6EvbTWpzA9FxQI+4V791Zm70uEErycp
 4mBNVq6lpnWJYxLxLHc7Shfr3nyaKDHf+ip6b5/eb8d+fTK/VG0ojvmOl6abx0uwd2GuMPLPvKy
 B38srb/MPjC8MzHOGBmbeIHY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 4d3262d6c007ba2e;
	Wed, 30 Sep 2026 00:44:44 +0000
X-Mizu-Trace-ID: 4d3262d6c007ba2e
X-Migadu-Flow: FLOW_OUT
Date: Wed, 30 Sep 2026 08:44:34 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>, Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Lebrun <david.lebrun@uclouvain.be>,
	Stefano Salsano <stefano.salsano@uniroma2.it>
Subject: Re: [PATCH net] seg6: ensure packet data is writable before
 modifying SRH and IPv6 DA
Message-ID: <arxbcsPKJhDJV1vl@fedora>
References: <20260925133807.32-1-andrea.mayer@uniroma2.it>
 <arsqomcYCLJqtWSC@fedora>
 <20260930013910.ef20606a1141e83edeee0771@uniroma2.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930013910.ef20606a1141e83edeee0771@uniroma2.it>

On Wed, Sep 30, 2026 at 01:39:10AM +0200, Andrea Mayer wrote:
> On Tue, 29 Sep 2026 11:05:02 +0800
> Hangbin Liu <hangbin.liu@linux.dev> wrote:
> 
> > [snip]
> >
> > >  static int input_action_end_core(struct sk_buff *skb,
> > >  				 struct seg6_local_lwt *slwt)
> > >  {
> > > +	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
> > >  	struct ipv6_sr_hdr *srh;
> > > +	int err = -EINVAL;
> > >  
> > >  	srh = get_and_validate_srh(skb);
> > >  	if (!srh)
> > >  		goto drop;
> > >  
> > > -	advance_nextseg(srh, &ipv6_hdr(skb)->daddr);
> > > +	srh = advance_nextseg(skb, srh, &reason);
> > > +	if (!srh) {
> > > +		err = -ENOMEM;
> > > +		goto drop;
> > > +	}
> >
> > The srh is not used in the later function, maybe just
> >
> > 	if (!advance_nextseg(skb, srh, &reason)) {
> > 		err = -ENOMEM;
> > 		goto drop;
> > 	}
> >
> > [snip]
> 
> Hi Hangbin,
> 
> Right. Since the patch changed advance_nextseg() to return the SRH,
> I updated srh at every call site. Your form works as well where srh
> is not used afterwards.

Never mind. I replied to your patch too late. It has been merged into net.

Thanks
Hangin
