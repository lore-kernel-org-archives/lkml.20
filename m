Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466882;
	b=bybTovhsnsZlPx+l/5yLPTJktdAxFhOzEEDVUyWfwFaX5Kyui36jkLOVnfwzAuMaK+JM
	 jFG0ZsKFvug6AtHtIFXtyp+1bc/rOMUSezfcXdqJLvJ1/s1Ge9R3HcHxOxqm6XT5tv9RT
	 5y35XVSCY4HwjROJskvS/olVzxRZraSKZ7hVr+eAGMnAFFFay+mbrSWa8rsT6qIM3wmgP
	 ybF+fy3jGWdx6utK6AKlTVTJ1VGFZoog3gqytBSDP+bwkSFzvN10Wmn095mhDIYJfB48/
	 m4qeLTVIWdAVZpntBLRLy5VeqM8KchVM+ug2d2hZRQMmXylNt0uMDXA9dacFjWRSpOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466882;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MWJBAoI6Q3L0rHwEVEAsPxA9+MzfVuCyWdcvDOlOHcQ=;
	b=aha43hAsNhg3rEJjE57f+9xGe1aV7u2J/fF89yuYRIHpNChotPDeIcCJGkitNRKWxMpw
	 1Dl6j462zSjvolqmp2WFybCFlDDy7Qs8ltGByn0Ce3mKbGQaMI5K8/LacNR5skDWNRCCT
	 1ldkHeAdos+9HXADvYBDFx/Y2Exx3xxG8wS858aqhqTDIEgBlgAjwZeaR9PkDkNa5CFta
	 flVdFmqLZHS86WiJPOGQDdvnFhx8hz+XTGHT7xcSwMOe3/m6+wserliPLxBqXJ3Ux4wAh
	 HdyOR+B8T0AsfOH0NPZWL7OcgXI8G8OX7lzymbR5CTUUK3CSeYyIwqV4Uh6e7NkRZdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kNKiT5ls;
	arc=none smtp.remote-ip=95.215.58.64
Received: from mta1.migadu.com (out-64.mta1.migadu.com [95.215.58.64])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D293606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D293606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kNKiT5ls
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4j+AMbRycxeWs+fHLwXrjL4tOlZ+wuEL4eMEvsEOGF8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794466880; v=1; x=1795071680;
 b=kNKiT5lszobFGxQKLtegnsQ91t+v/tt57xGgcikSZTidFLzbh5ZlbALcHG4RXbWRDxaTqHcF
 pyRmEnKCCaHpaYWzZ6aysa9YoN8HPV86TSeEL7iY3szprO6MTXY+wgwBoACwvWrxOzBcgFvTGcc
 jbN7c+m75IqUqjbl5B/F1+gg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id b2b9d25aaa0ba4d9;
	Thu, 12 Nov 2026 07:01:20 +0000
X-Mizu-Trace-ID: b2b9d25aaa0ba4d9
X-Migadu-Flow: FLOW_OUT
Date: Thu, 12 Nov 2026 15:01:07 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Mahesh Bandewar <maheshb@google.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, 1342116488@qq.com
Subject: Re: [PATCH net] ipvlan: update port flags only after
 ipvlan_set_port_mode() succeeds
Message-ID: <avVkM5XY1kNswdcY@fedora>
References: <20261111064655.233265-1-sunwenbo@cmss.chinamobile.com>
 <avRnWUbGFbdfirZB@fedora>
 <20261112035152.43363-1-sunwenbo@cmss.chinamobile.com>
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
In-Reply-To: <20261112035152.43363-1-sunwenbo@cmss.chinamobile.com>

On Thu, Nov 12, 2026 at 11:51:52AM +0800, Wenbo Sun wrote:
> Hi Hangbin,
> 
> On Wed, Nov 11, 2026 at 09:02:17PM +0800, Hangbin Liu wrote:
> > If ipvlan_set_port_mode() failed, the unregister_netdevice(dev) will be
> > called. Does port->flags still need to restore?
> 
> Thank you very much for taking the time to review this patch and for
> pointing out the question about the commit description.
> 
> You are completely right that when creating the first ipvlan device on a
> lower device, unregister_netdevice(dev) drops the last reference to the
> port in ipvlan_uninit() -> ipvlan_port_put(), destroying the port so no
> flag restoration is needed.
> 
> The issue happens when one or more ipvlan interfaces already exist on the
> same lower device:
> 
> 1. Because struct ipvl_port is shared across all ipvlan interfaces on a
>    lower device, ipvlan_init() takes an additional reference via
>    refcount_inc(&port->count) when creating a new ipvlan interface.
> 2. If ipvlan_link_new() writes port->flags before calling
>    ipvlan_set_port_mode(), and ipvlan_set_port_mode() fails (for
>    instance, requesting L3S mode when CONFIG_IPVLAN_L3S is disabled),
>    unregister_netdevice(dev) only decrements port->count back down to at
>    least 1. Since ipvlan_port_destroy() is not called, the shared port
>    remains active for the existing ipvlan interfaces while still carrying
>    the newly written port->flags.
> 
> Rather than saving and restoring port->flags on the error path, moving
> the port->flags assignment after ipvlan_set_port_mode() succeeds avoids
> modifying it on failure altogether, as there are no remaining failure
> paths afterward in ipvlan_link_new() (matching ipvlan_nl_changelink()).

Thanks for the explanation. The change makes sense to me now.

Regards
Hangbin
