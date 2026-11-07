Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794047343;
	b=MIQwf4AP0xjbx4s22/7lp0frSrYhSQOE84bCLYKmtbfVP5cNLN18YgWGC7y8gbYO2ygc
	 rex0G2rbmUQa8ag6uuJ3n+QA5MvjrjZWY38Ip9kZlpWv4qtQ4B/pJEJrO6jOxOP0wmh2+
	 m1OqezCXylPSMVxYp8Of6VkauvWmae7L0Efa+V8J+pe2/1wdQb/ZsMzBF0YSWoBxeeq/j
	 Vt6tkJWamiFcsFYYFdTynOjivW9SzuuFT1rIkB4uZ8nFg4fZtOhMZZvn4Fs1b3ER3PTZu
	 1QcBgB7PddNFdEXkYoNKe/SIjdUxe3aBa05aXA0SrqIfddZk4RiVb1qXWO7FLfbgQaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794047343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=kPfxxEoDedkpzijCZq5OLG208Bd3QgI6noPt3uH0hgY=;
	b=p+YTLVYt9IyJVjLTFoQ0aK+sK3CZxgFlL7DojgMtpKTAfBe3I2IXLlutf0/JKMZEiXR7
	 J/Rqurfvy+Wo0evIk4oqMDI+csK8Nf7AYMgs9C1PqFTgPZjiM205+qh3Hqbu6SlbYeTI6
	 AUVeuuqLf28y0rpGihtnaghVi++C+BHNwqLUWxDPMx2YDL6fI4hoTGd/gdWBJ/0PzSylw
	 2srlOsZf7l1uLtxu1KwJmhvhbXxdv6O2nSqsBUe/HTsOHedX2C79H/b/BPPGQbq/J9lFp
	 a3/4iAnpnZrmjHKixFMNH9nJ2K8OAqBVKWnO65s6QCKRiGgG547UJj4ZqYGaqiboT1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=gU8fV7MN;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D999606A32F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D999606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=gU8fV7MN
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5361e313e63so13937421cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1794047342; x=1794652142; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kPfxxEoDedkpzijCZq5OLG208Bd3QgI6noPt3uH0hgY=;
        b=gU8fV7MN8HJRfR0yKPGughXHLXj/wm9K6t0J7Vdu8qZjnVIQY+xLkiocbpG0MrNr5c
         UJ/rhNua6yMK7CDQPNtNFEeztgoR6MjAAH8ImfZ2SueDr+PyiWGwpEjLxCZfuMOvmU6L
         8i/27wDm8zx09wa5f2dtbZpPBiE2L9eSQ/XpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794047342; x=1794652142;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kPfxxEoDedkpzijCZq5OLG208Bd3QgI6noPt3uH0hgY=;
        b=tMj1Wn+4Lts+zhp4jdZS/9QhkYJptcyfW5l8LW8mwQigSHjIu9pFzifo4EMa/b2Xms
         dDsQbWpkrG5B3Y2KSHrCyTOgbyjKP5TegdgVoh/2+BjJOhVKQmBsFPHieNfSBWCkyUqo
         MgegDFpEMYRnNqR9gKiWFqsSLNQfg0Ozm+XmfnhTjSxVOuYkVVB8R44YhN4WfSXZRJK7
         lbUyvBOf3Ba7z0tZ94rHElXU/zjAEfX0+ToFU8k8c/8dna3PL8UMtJyP5jo+WhJH1SXE
         DKw/M+GtjpJpBtNx8k2uv2+1MZYeHp8uGubKfWkOYqmpp/bErGOhPKYH+skDAUlgXBAX
         +rAw==
X-Forwarded-Encrypted: i=1; AKwUvBxKZm3lbyY7pdgIWPUF9axukf6DEqVJ5ZP+vp2100t5pJ32TQpbtm/gOPHN+JWlxiQtnKHrhO2DPuSXnXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z++D41iTtpYf+GnY5KVbWTiEyYpuqko9d3YM2pQQWOVhyy+aof/
	ZpJS/OLG+NaEwuIl0BNYutk1mKYx5GWksb1mkStXYCsuUlBJzkUGwR1KSTFxs9BGjBE=
X-Gm-Gg: AYBFou2twNYBE8X6x1/Y+kd7fi0EuPgujloCncgPtiA1RgtpcpceSsR8RbdRWkb/VtB
	gfkMtj0k9B+adej6YyCxvtqeyY5HLwVbrthIWMoLblbcVEKAht6iVdwEdQ0mGqSCRjKj/vGPrDe
	Hv9tRfXL5khsADPr62OSbZ0+TBogf3MCuf+64pj2sTfQeVLiejRP7JT6I633T1OW9s58TyHXf8p
	rrFCjTYxplQNVBif8oK3gHl33kKwYOQzeMH9Nq08BZVjBBG9oB1JGTHn/cFCWGUIo60BETPgT97
	R82fkquEJZsZjcQ9J1O/iBj7dmVLZBAYlH2bbvr3V+CL4LscyIUANt+ObmoxOzR3XNzUBJwlikV
	sGDgziFuWapmpUcQ7KuixDoa8tY9CaHLyBCOzQYQ0hoEA7Sj+e+7qN3RuQi0EuauEBl77pbergX
	zeACUQkj4kAkktxt+cY1Cz/bHo29XnKcgGxuPGptSHensOTY7hkjrbSXsX57wWRncgNXKvURnSi
	IhslyMCpCwAaXWXI214v+VlUPGMGzbh4jXG6dU4MzCOBvoQbTibtrEyM+qPacKyNNpT9Oix6YGH
	Erbc66SRbsZjjmmsmgHNeFAeHJfyXFqNyR3dC+o3Y9I7xL8Vwp/qqxW3Sc1h5q9568KXpqliM3W
	SInGSTv0=
X-Received: by 2002:a05:622a:2508:b0:537:dea7:adb1 with SMTP id d75a77b69052e-54e115b4283mr77969511cf.4.1794047342290;
        Sat, 07 Nov 2026 02:29:02 -0800 (PST)
Received: from com-75606 ([199.47.143.1])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e2625abafsm43098871cf.16.2026.11.07.02.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:29:02 -0800 (PST)
Date: Sat, 7 Nov 2026 02:28:58 -0800
From: Kyle Zeng <kylebot@openai.com>
To: Florian Westphal <fw@strlen.de>
Cc: netfilter-devel@vger.kernel.org,
	Pablo Neira Ayuso <pablo@netfilter.org>, coreteam@netfilter.org,
	bridge@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, outbounddisclosures@openai.com
Subject: Re: [PATCH] netfilter: br_netfilter: reject unsafe neighbour devices
 for DNAT
Message-ID: <au79avuyDAz__s4t@com-75606>
References: <20261030042155.73844-1-kylebot@openai.com>
 <au7SdYQrIqAQOU24@strlen.de>
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
In-Reply-To: <au7SdYQrIqAQOU24@strlen.de>

On Sat, Nov 07, 2026 at 08:25:41AM +0100, Florian Westphal wrote:
> Kyle Zeng <kylebot@openai.com> wrote:
> > The IPv4 and IPv6 bridge prerouting callbacks classify DNAT traffic using
> > the logical input device saved in skb->dev. The physical input port can
> > have a different bridge master when prerouting resumes, for example after
> > an NFQUEUE verdict. Netfilter reassembly can also combine the first
> > fragment's bridge information with a different fragment's input device.
> > 
> > br_nf_pre_routing_finish_bridge() replaces skb->dev with the port's
> > current bridge master, but looks up the neighbour using the existing
> > route. This can put an skb with skb->dev pointing to bridge B on an
> > unresolved neighbour of bridge A. Deleting B and resolving the neighbour
> > on A then causes a use-after-free in __dev_queue_xmit().
> > 
> > Before calling the neighbour output method, check that the neighbour
> > keeps skb->dev alive. A neighbour holds its device, and a VLAN device
> > also holds its real device, so allow a VLAN whose real device is the
> > bridge. Release the neighbour and drop the skb on a mismatch.
> > 
> > Doing this in the shared continuation covers both protocol families,
> > including a queue in the remaining bridge prerouting hooks. Leave the
> > cached-header path unchanged since it does not enqueue the skb.
> > 
> > Signed-off-by: Kyle Zeng <kylebot@openai.com>
> > ---
> > I have a reproducer for this issue and can share via DM
> > 
> >  net/bridge/br_netfilter_hooks.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/net/bridge/br_netfilter_hooks.c b/net/bridge/br_netfilter_hooks.c
> > index e15355ff215a..726a2d17ed3a 100644
> > --- a/net/bridge/br_netfilter_hooks.c
> > +++ b/net/bridge/br_netfilter_hooks.c
> > @@ -307,6 +307,18 @@ int br_nf_pre_routing_finish_bridge(struct net *net, struct sock *sk, struct sk_
> >  
> >  			ret = br_handle_frame_finish(net, sk, skb);
> >  		} else {
> > +			struct net_device *dev = neigh->dev;
> > +
> > +			/* The neighbour queue must keep skb->dev alive. A VLAN
> > +			 * device also holds a reference to its real device.
> > +			 */
> > +			if (is_vlan_dev(dev))
> > +				dev = vlan_dev_real_dev(dev);
> > +			if (dev != skb->dev) {
> > +				neigh_release(neigh);
> > +				goto free_skb;
> > +			}
> > +
> 
> I don't understand the vlan check. Why is that needed?
> The call to br_nf_pre_routing_finish_bridge is gated via:
> 
>  405                         if (skb_dst(skb)->dev == dev) {
>  406                                 skb->dev = br_indev;
>  407                                 nf_bridge_update_protocol(skb);
>  408                                 nf_bridge_push_encap_header(skb);
>  409                                 br_nf_hook_thresh(NF_BR_PRE_ROUTING,
>  410                                                   net, sk, skb, skb->dev,
>  411                                                   NULL,
>  412                                                   br_nf_pre_routing_finish_bridge);
> 
> 
> ... so this patch ought to be sufficient?
> 
> --- a/net/bridge/br_netfilter_hooks.c
> +++ b/net/bridge/br_netfilter_hooks.c
> @@ -283,6 +283,10 @@ int br_nf_pre_routing_finish_bridge(struct net *net, struct sock *sk, struct sk_
>         if (!skb->dev)
>                 goto free_skb;
>         dst = skb_dst(skb);
> +
> +       if (dst->dev != skb->dev)
> +               goto free_skb;
> +
>         neigh = dst_neigh_lookup_skb(dst, skb);
> 
> (I can't see how neigh->dev != skb->dev after the extra test).


The VLAN check is intended to preserve existing VLAN DNAT behavior.

bridge-nf-filter-vlan-tagged=1, bridge-nf-pass-vlan-input-dev=1, and br0.100, the earlier test can pass with
dst->dev == dev == br0.100. The continuation then changes skb->dev to br0, so the strict comparison would
drop that valid packet.

A neighbour on br0.100 is safe here because it holds the VLAN device, which holds its underlying bridge. That is why the slow-path check compares the neighbour´s underlying device with skb->dev.
